#!/usr/bin/env python3
"""
Search optimal cutting (zig-zag) parameters to reach a straight-line target distance
fastest while maintaining (nearly) continuous boost, using the datapack-aligned simulator.

Cutting model:
- Repeat a cycle of N cuts: [+A, -A, +A, ...] for N entries
- Each entry holds steering at constant magnitude A degrees for D ticks
- Optional neutral (0 deg) for Z ticks between entries

Objective:
- Minimize time to reach target forward distance (blocks)
- Subject to: sustain boost after warmup (uptime >= target)

Outputs:
- Best parameters per Ncuts
- Save best angles file and path image
- Print JSON summary
"""
import argparse, json, math, os, sys
from typing import List, Tuple, Dict

# allow importing steering_sim from sibling tools directory
HERE = os.path.dirname(os.path.abspath(__file__))
if HERE not in sys.path:
    sys.path.insert(0, HERE)

from steering_sim import simulate, render_path, load_kart_stats


def gen_cutting_angles(ncuts: int, amplitude_deg: float, cut_ticks: int, neutral_ticks: int, total_ticks: int) -> List[float]:
    """Generate repeated zig-zag steering angles for total_ticks.
    Pattern per cycle: alt signs starting with +amplitude; between entries insert neutral zeros.
    """
    seq: List[float] = []
    signs = [1 if i % 2 == 0 else -1 for i in range(ncuts)]
    cycle: List[float] = []
    for sgn in signs:
        cycle.extend([sgn * amplitude_deg] * cut_ticks)
        if neutral_ticks > 0:
            cycle.extend([0.0] * neutral_ticks)
    # Repeat to fill total length
    while len(seq) < total_ticks:
        seq.extend(cycle)
    return seq[:total_ticks]


def path_length(points: List[Tuple[float, float]]) -> float:
    d = 0.0
    for i in range(1, len(points)):
        x0, y0 = points[i-1]
        x1, y1 = points[i]
        dx = x1 - x0
        dy = y1 - y0
        d += math.hypot(dx, dy)
    return d


def evaluate_to_target(kart: Dict, angles: List[float], dt: float, target_blocks: float, warmup_ticks: int) -> Dict:
    """Simulate with a long angles list; compute time to reach x >= target_blocks (heading=0).
    Returns metrics or {'status': 'no-reach'} if target not reached.
    """
    pts, states = simulate(kart, angles, dt=dt)
    # find first index where forward distance >= target
    hit_idx = None
    for i, (x, y) in enumerate(pts):
        if x >= target_blocks:
            hit_idx = i
            break
    if hit_idx is None:
        return {'status': 'no-reach', 'points': len(pts)}
    time_to_target = hit_idx * dt
    # boost uptime after warmup within [0..hit_idx)
    boost_flags = [b for (_, b) in states[:max(0, hit_idx)]]
    wf = boost_flags[warmup_ticks:] if warmup_ticks < len(boost_flags) else []
    boost_uptime = (sum(1 for b in wf if b) / len(wf)) if wf else 0.0
    off_episodes = 0
    prev = True
    for b in wf:
        if (not b) and prev:
            off_episodes += 1
        prev = b
    return {
        'status': 'ok',
        'time_to_target': time_to_target,
        'hit_idx': hit_idx,
        'boost_uptime': boost_uptime,
        'off_episodes': off_episodes,
        'points': len(pts),
        'states_len': len(states),
    }


def main():
    ap = argparse.ArgumentParser(description='Cutting optimizer to reach a straight-line target fastest (2/3/4/5 cuts)')
    ap.add_argument('--kart_file', required=True)
    ap.add_argument('--ncuts', type=int, choices=[2,3,4,5], required=True)
    ap.add_argument('--target_blocks', type=float, default=1000.0, help='Forward distance goal in blocks')
    ap.add_argument('--max_seconds', type=float, default=60.0, help='Upper bound sim horizon (seconds)')
    ap.add_argument('--dt', type=float, default=1.0/20.0)
    ap.add_argument('--warmup_seconds', type=float, default=3.0)
    ap.add_argument('--amplitude_deg', type=str, default='20:60:5', help='min:max:step degrees')
    ap.add_argument('--cut_ticks', type=str, default='4:24:2', help='min:max:step ticks each cut')
    ap.add_argument('--neutral_ticks', type=str, default='0:10:2', help='min:max:step neutral ticks between cuts')
    ap.add_argument('--out_dir', default=os.path.join(HERE, 'cutting_out'))
    ap.add_argument('--target_uptime', type=float, default=0.95, help='Required boost uptime after warmup')
    ap.add_argument('--init_boostcount', type=int, default=0, help='Optional seed slot(s) to accelerate convergence')
    args = ap.parse_args()

    os.makedirs(args.out_dir, exist_ok=True)

    kart = load_kart_stats(args.kart_file)
    if args.init_boostcount:
        kart['init_boostcount'] = int(args.init_boostcount)

    total_ticks = int(round(args.max_seconds / args.dt))
    warmup_ticks = int(round(args.warmup_seconds / args.dt))

    def parse_range(spec: str) -> List[int]:
        a, b, c = spec.split(':')
        lo, hi, st = int(float(a)), int(float(b)), int(float(c))
        return list(range(lo, hi+1, st))

    amp_vals = [float(x) for x in parse_range(args.amplitude_deg)]
    cut_vals = parse_range(args.cut_ticks)
    neu_vals = parse_range(args.neutral_ticks)

    best = None
    best_metrics = None

    for A in amp_vals:
        for D in cut_vals:
            for Z in neu_vals:
                angles = gen_cutting_angles(args.ncuts, A, D, Z, total_ticks)
                metrics = evaluate_to_target(kart, angles, dt=args.dt, target_blocks=args.target_blocks, warmup_ticks=warmup_ticks)
                if metrics.get('status') != 'ok':
                    continue
                # Enforce uptime constraint
                if metrics['boost_uptime'] < args.target_uptime:
                    continue
                if best is None or metrics['time_to_target'] < best_metrics['time_to_target']:
                    best = {'amplitude_deg': A, 'cut_ticks': D, 'neutral_ticks': Z}
                    best_metrics = metrics

    result: Dict = {
        'ncuts': args.ncuts,
        'target_blocks': args.target_blocks,
        'max_seconds': args.max_seconds,
        'dt': args.dt,
        'warmup_seconds': args.warmup_seconds,
        'target_uptime': args.target_uptime,
    }

    if best is None:
        result['status'] = 'no-solution'
        result['reason'] = 'No parameter set reached target within limits and uptime constraint'
        print(json.dumps(result, ensure_ascii=False))
        return

    # Save best angles and image
    best_angles = gen_cutting_angles(args.ncuts, best['amplitude_deg'], best['cut_ticks'], best['neutral_ticks'], total_ticks)
    angles_path = os.path.join(args.out_dir, f'angles_{args.ncuts}cut_A{int(best["amplitude_deg"])}_D{best["cut_ticks"]}_Z{best["neutral_ticks"]}.txt')
    with open(angles_path, 'w', encoding='utf-8') as f:
        for v in best_angles:
            f.write(f"{v}\n")

    pts, states = simulate(kart, best_angles, dt=args.dt)
    hit_idx = best_metrics['hit_idx']
    pts_draw = pts[:hit_idx+1]
    states_draw = states[:max(0, hit_idx)]
    img_path = os.path.join(args.out_dir, f'path_{args.ncuts}cut_A{int(best["amplitude_deg"])}_D{best["cut_ticks"]}_Z{best["neutral_ticks"]}.png')
    render_path(pts_draw, states_draw, img_path, width=1200, height=800, margin=40)

    result.update({
        'status': 'ok',
        'best': best,
        'metrics': best_metrics,
        'angles_file': angles_path,
        'image_file': img_path,
    })

    print(json.dumps(result, ensure_ascii=False))


if __name__ == '__main__':
    main()
