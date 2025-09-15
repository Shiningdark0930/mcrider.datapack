#!/usr/bin/env python3
"""
Datapack-aligned flat-plane kart simulator with predefined steering input.

Assumptions:
- Always holding forward (W). Left/Right press is inferred from non-zero steering.
- Flat map (no elevation/collisions).
- Inputs: official-style kart stats JSON (speed, accel, boost, corner, drift, gauge, boosttime, maxboostcount[, engine])
    and an angles file (one steering angle per tick in degrees).

Physics per tick (mirrors datapack logic):
- kartmove += |kartaccel|
- if boosting: kartmove += kartboost
- friction: if kartmove >= 20 then kartmove -= 20
- airresist: using stat speed C (plus +84 when boosting) -> Δ = sign(kartmove) * 64 * kartmove^2 / C^3
- drift decel (when drifting and speed_ui>=25 and non-Mario):
    kartmove -= kartcorner; kartmove -= |angle|*10; kartmove += (|angle|*10)/6
- drag-accel (while drifting): +2@t>=10, +4@15, +7@20, +11@25, +16@30, +22@35 (per tick increments)
- boost gauge while drifting (on ground): if speed_ui>=25 then
    gauge += kartmove/360 (+gauge stat each tick, +15 when kartmove<21600),
    A2 requires |angle|*10>250 for the kartmove/360 part. When not drifting and
    gauge>=2000 and engine not Mario/Rally, award one boost slot (or carry 800 overflow if capped).
- pose integration: heading += radians(angle_deg)
- movement uses a velocity heading that converges toward heading each tick (slip):
    distance_blocks = kartmove / 20000; move along heading

Outputs: path image showing the driven trajectory and a JSON summary to stdout.
"""
import argparse, json, math
from typing import List, Tuple
try:
    from PIL import Image, ImageDraw
except Exception as e:
    Image = None
    ImageDraw = None


def load_kart_stats(path: str) -> dict:
    with open(path, 'r', encoding='utf-8') as f:
        data = json.load(f)
    # expected keys: accel, boost_add, drag_coeff, max_speed(optional)
    return data


def load_angles(path: str) -> List[float]:
    """Load steering angles per tick (degrees per tick). Accepts:
    - JSON array like [0, 0, 5, -3, ...]
    - Text/CSV: one number per line, or comma/space-separated.
    """
    text = open(path, 'r', encoding='utf-8').read().strip()
    # try JSON
    try:
        arr = json.loads(text)
        if isinstance(arr, list) and all(isinstance(x, (int, float)) for x in arr):
            return [float(x) for x in arr]
    except Exception:
        pass
    # split lines/commas/spaces
    tokens: List[str] = []
    for line in text.splitlines():
        line = line.strip()
        if not line:
            continue
        for part in line.replace(',', ' ').split():
            tokens.append(part)
    angles: List[float] = []
    for t in tokens:
        try:
            angles.append(float(t))
        except ValueError:
            continue
    return angles


def simulate(
    kart: dict,
    angles_deg: List[float],
    dt: float,
    start_heading_deg: float = 0.0,
    drift_start_deg: float = 25.0,
    drift_end_deg: float = 10.0,
    boost_mode: str = 'datapack',
    boost_period: int = 100,
    boost_len: int = 60,
    phase: str = 'all',
    init_move: float = 0.0,
) -> Tuple[List[Tuple[float, float]], List[Tuple[bool, bool]]]:
    """Simulate using datapack-equivalent tick math.

    Kart JSON keys expected (official-style):
      speed, accel, boost, corner, drift, gauge, boosttime, maxboostcount, engine(optional)
    """
    # Official stat names (ints in datapack)
    speed_stat = float(kart.get('speed', kart.get('kartspeed', 428)))
    accel = float(kart.get('accel', 600))
    boost = float(kart.get('boost', 200))
    corner = float(kart.get('corner', 210))
    engine = int(kart.get('engine', 0))  # 1003: Mario, 8: PRO, 1005: Gear, 9: Rally, 1002: A2
    gauge_stat = int(kart.get('gauge', kart.get('boostgaugecharge', 0)))
    boost_duration = int(kart.get('boosttime', kart.get('kartboostduration', 60)))
    max_boost_count = int(kart.get('maxboostcount', kart.get('kartmaxboostcount', 1)))

    # State in datapack units
    kartmove = float(init_move)
    drifttime = 0
    drifting = False
    # boost systems
    boosttime = 0
    boostcount = int(kart.get('init_boostcount', 0))
    boostgauge = 0

    x = 0.0; y = 0.0
    h = math.radians(start_heading_deg)
    pts: List[Tuple[float, float]] = [(x, y)]
    states: List[Tuple[bool, bool]] = []  # (drifting, boosting)

    for tick_idx, a_deg in enumerate(angles_deg):
        # 0) steering (yaw delta from input, degrees per tick)
        h += math.radians(a_deg)
        # infer left/right press from steering
        lr_pressed = abs(a_deg) > 0.1

        # 1) accelerate (|kartaccel|) if phase>=accel
        if phase in ('accel', 'all'):
            kartmove += abs(accel)

        # 2) determine drift start/stop using datapack thresholds
        angle_abs_deg = abs(a_deg)
        angle10 = angle_abs_deg * 10.0  # datapack uses degrees*10
        # start conditions
        if phase == 'all':
            if not drifting:
                if engine == 9:
                    # Rally: start if |angle| > 15 deg
                    if angle10 > 150.0:
                        drifting = True
                        drifttime = 0
                elif engine != 1003:
                    # Normal (not Mario): start if |angle| > 25 deg
                    if angle10 > 250.0:
                        drifting = True
                        drifttime = 0
            # end conditions
            if drifting:
                if engine == 1000:
                    # N1: end if |angle| <= 10 deg
                    if angle10 <= 100.0:
                        drifting = False
                        drifttime = 0
                elif engine == 1002:
                    # A2: very strict early end, then relax after 8 ticks
                    if drifttime < 8:
                        if angle10 <= 50.0:  # 5 deg
                            drifting = False
                            drifttime = 0
                    else:
                        if angle10 <= 250.0:  # 25 deg
                            drifting = False
                            drifttime = 0
                elif engine == 9:
                    # Rally: end if |angle| <= 15 deg
                    if angle10 <= 150.0:
                        drifting = False
                        drifttime = 0
                elif engine != 1003:
                    # Normal: end if |angle| <= 25 deg
                    if angle10 <= 250.0:
                        drifting = False
                        drifttime = 0

        # 3) drift effects + gauge charge
        boost_active = False
        if phase == 'all' and drifting:
            drifttime += 1
            # UI speed approximation used in datapack gates
            speed_ui = kartmove / 278.0
            # deceleration while drifting (except Mario)
            if engine != 1003 and speed_ui >= 25.0:
                kartmove -= corner
                kartmove -= angle10
                kartmove += (angle10 / 6.0)

            # drag-accel (톡톡이) increments (default profile)
            inc = 0
            if drifttime >= 10: inc += 2
            if drifttime >= 15: inc += 4
            if drifttime >= 20: inc += 7
            if drifttime >= 25: inc += 11
            if drifttime >= 30: inc += 16
            if drifttime >= 35: inc += 22
            kartmove += inc

            # gauge charge on ground: speed_ui >= 25
            if speed_ui >= 25.0 and engine != 1003:
                # base charge from speed (kartmove/360)
                if engine == 1002:
                    # A2 requires large angle to get speed-based charge
                    if angle10 > 250.0:
                        boostgauge += int(kartmove / 360.0)
                else:
                    boostgauge += int(kartmove / 360.0)
                # per-spec charge
                if gauge_stat > 0:
                    boostgauge += int(gauge_stat)
                # low-speed bonus (<21600)
                if kartmove < 21600.0:
                    boostgauge += 15
                # boostpad bonus omitted in simulator
        
        # 3.5) boost usage/continuation (datapack-driven)
        if phase == 'all':
            # trigger boost if available and conditions met (W pressed always; L/R inferred)
            if boost_mode == 'datapack':
                if boosttime <= 0 and kartmove >= 800.0 and boostcount >= 1 and lr_pressed:
                    boosttime = boost_duration
                    boostcount -= 1
            else:
                # legacy manual scheduling modes for debugging
                if boost_mode == 'always':
                    if boosttime <= 0:
                        boosttime = boost_duration
                elif boost_mode == 'periodic':
                    per = max(1, int(boost_period))
                    if (tick_idx % per) == 0:
                        boosttime = boost_len
                # 'never' leaves boosttime untouched

            if boosttime > 0:
                boost_active = True
                kartmove += boost

            # engine auto-gauge charge (jiu/pro/A2/N1 variants): if not boosting, fast, and not drifting
            if boosttime == 0 and (kartmove / 278.0) >= 50.0 and (not drifting):
                if engine in (2, 8, 1000, 1002):
                    boostgauge += 20

        # Move using current kartmove BEFORE friction and airresist (datapack order)
        dist_blocks = kartmove / 20000.0
        x += dist_blocks * math.cos(h)
        y += dist_blocks * math.sin(h)
        pts.append((x, y))
        states.append((drifting, boost_active))

        # 4) friction (after movement)
        if kartmove >= 20.0:
            kartmove -= 20.0

        # 5) air resistance (sign-preserving), base on stat speed with boost +84
        air_const = speed_stat
        if phase == 'all' and (boost_active or engine == 8):
            air_const += 84.0
        if air_const > 0:
            air = (64.0 * (kartmove * kartmove)) / (air_const ** 3)
        else:
            air = 0.0
        if kartmove > 0:
            kartmove -= air
        elif kartmove < 0:
            kartmove += air

        # 6) boost timer ticks down
        if boosttime > 0:
            boosttime -= 1

        # 7) award boost slots when not drifting and gauge full (non-Mario/Rally)
        if phase == 'all' and (not drifting) and engine not in (1003, 9):
            if boostgauge >= 2000:
                # replicate getboost: reset gauge then add slot or carry 800 overflow if capped
                boostgauge = 0
                if boostcount >= max_boost_count:
                    boostgauge += 800
                else:
                    boostcount += 1
    return pts, states


def render_path(points: List[Tuple[float, float]], states: List[Tuple[bool, bool]], out_path: str, width: int = 1200, height: int = 800, margin: int = 40):
    if Image is None:
        raise RuntimeError('Pillow (PIL) is required to render images. Install with: pip install pillow')
    if len(points) < 2:
        img = Image.new('RGB', (width, height), (255, 255, 255))
        img.save(out_path)
        return
    xs = [p[0] for p in points]
    ys = [p[1] for p in points]
    minx, maxx = min(xs), max(xs)
    miny, maxy = min(ys), max(ys)
    spanx = max(1e-6, maxx - minx)
    spany = max(1e-6, maxy - miny)
    sx = (width - 2 * margin) / spanx
    sy = (height - 2 * margin) / spany
    s = min(sx, sy)
    # map to image coords
    def map_point(p):
        x = margin + (p[0] - minx) * s
        y = margin + (p[1] - miny) * s
        # flip y for image coordinates
        return (int(round(x)), int(round(height - y)))
    img = Image.new('RGB', (width, height), (255, 255, 255))
    dr = ImageDraw.Draw(img)
    poly = [map_point(p) for p in points]
    # color mapping:
    # normal: gray, drift: orange, boost: green, both: blue
    def seg_color(drifting: bool, boosting: bool):
        if drifting and boosting:
            return (0, 128, 255)  # blue
        if drifting and not boosting:
            return (255, 140, 0)  # orange
        if (not drifting) and boosting:
            return (0, 200, 0)    # green
        return (160, 160, 160)    # gray

    for i in range(len(points) - 1):
        c = seg_color(*states[i]) if i < len(states) else (160, 160, 160)
        dr.line([poly[i], poly[i+1]], fill=c, width=3)
    # start/end dots
    r = 4
    sx, sy = poly[0]
    ex, ey = poly[-1]
    dr.ellipse((sx - r, sy - r, sx + r, sy + r), fill=(0, 200, 0))
    dr.ellipse((ex - r, ey - r, ex + r, ey + r), fill=(200, 0, 0))
    img.save(out_path)


def main():
    ap = argparse.ArgumentParser(description='Datapack-aligned steering simulator')
    ap.add_argument('--kart_file', required=True, help='Path to kart stats JSON (official fields: speed, accel, boost, corner, drift, gauge, boosttime, maxboostcount)')
    ap.add_argument('--angles_file', required=True, help='Path to steering angles file (deg per tick)')
    ap.add_argument('--dt', type=float, default=1.0/20.0, help='Tick duration (s)')
    ap.add_argument('--start_heading', type=float, default=0.0, help='Degrees')
    # rendering
    ap.add_argument('--out_image', default='tools/steering_path.png')
    ap.add_argument('--out_width', type=int, default=1200, help='Output image width in pixels')
    ap.add_argument('--out_height', type=int, default=800, help='Output image height in pixels')
    ap.add_argument('--margin', type=int, default=40, help='Margin in pixels around the path')
    # drift detection
    ap.add_argument('--drift_start_deg', type=float, default=25.0, help='[legacy] Start drifting when |angle| exceeds this (deg) - datapack rules now used by default')
    ap.add_argument('--drift_end_deg', type=float, default=10.0, help='[legacy] Stop drifting when |angle| <= this (deg) - datapack rules now used by default')
    # boost scheduling
    ap.add_argument('--boost_mode', choices=['datapack','always','never','periodic'], default='datapack', help='Boost activation mode (datapack: gauge/slot controlled)')
    ap.add_argument('--boost_period', type=int, default=100, help='Periodic mode: total period in ticks')
    ap.add_argument('--boost_len', type=int, default=None, help='Periodic mode: active length in ticks (defaults to kart boosttime)')
    # staged physics application
    ap.add_argument('--phase', choices=['speed','accel','all'], default='all', help='Apply only speed-airresist, add accel, or full physics')
    ap.add_argument('--init_move', type=float, default=0.0, help='Initial kartmove (useful for speed-only phase)')
    ap.add_argument('--init_boostcount', type=int, default=None, help='Seed initial boost slots (for quick visualization)')
    args = ap.parse_args()

    kart = load_kart_stats(args.kart_file)
    if args.init_boostcount is not None:
        kart['init_boostcount'] = int(args.init_boostcount)
    angles = load_angles(args.angles_file)
    boost_len = args.boost_len if args.boost_len is not None else int(kart.get('boosttime', 60))
    pts, states = simulate(
        kart,
        angles,
        dt=args.dt,
        start_heading_deg=args.start_heading,
        drift_start_deg=args.drift_start_deg,
        drift_end_deg=args.drift_end_deg,
        boost_mode=args.boost_mode,
        boost_period=args.boost_period,
        boost_len=boost_len,
        phase=args.phase,
    init_move=args.init_move,
    )
    render_path(pts, states, args.out_image, width=args.out_width, height=args.out_height, margin=args.margin)
    print(json.dumps({
        'ticks': len(angles),
        'dt': args.dt,
        'time_seconds': round(len(angles) * args.dt, 6),
        'out_image': args.out_image,
        'points': len(pts)
    }, ensure_ascii=False))


if __name__ == '__main__':
    main()
