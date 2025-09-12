#!/usr/bin/env python3
"""
Straight-line kart physics simulator for the KartRider: Minecraft datapack.

- Units:
  kartmove = 1000 => 1 m/s (1 block/s)
  One tick = 1/20 s

- Models:
  Acceleration, boost, ground friction, quadratic air resistance, drift gauge charging,
  boost usage, and a simple drift scheduling policy to build boosts on straights.

This is an engineer's approximation matching datapack logic:
  v_{t+1} = v_t + accel + (boost?B:0) - friction - drag(v_t)
  drag(v) = 64 * v^2 / C^3, where C = kartspeed (+84 if boost active or PRO engine)

Drift gauge during drift (on ground, at speed):
  gauge += v/360 + gauge_charge + (15 if v < 21600 else 0)
Gauge converts to a boost when gauge >= 2000 AND not drifting.

Strategy:
  - If no boost active and we don't have a stored boost, we enter drift to build gauge.
  - When gauge >= 2000, we stop drifting for one tick to convert to a boost, then use it.
  - While a boost is active, we do not drift (to avoid drift decel).

Notes:
    - Drift decel matches datapack sign: v -= corner - (#kartdecel) - (#kartangleabs),
        where #kartdecel = #kartangleabs/6 for most engines, thus net v -= corner + (5/6)*|angle|.
        Mario engine has no drift decel (v unchanged by drift).
    - We approximate |angle| using a per-tick drift yaw angle mapped from drift_escape
        (higher drift_escape -> smaller yaw). Units: drift_angle_units = 10 * degrees.
  - Soul sand, pads, collisions, and engine-specific nuances are not modeled here.
"""

from dataclasses import dataclass
from typing import Optional, Tuple


@dataclass
class KartSpec:
    # Core stats (match item custom_data names)
    speed: float            # kartspeed
    accel: float            # kartaccel
    boost: float            # kartboost
    corner: float           # kartcorner (effective; lower is better)
    drift_escape: float     # kartdrift (not directly used in speed model)
    gauge_charge: float     # kartboostgaugecharge
    boost_duration: int     # kartboostduration (ticks)

    # Optional behavior
    max_boost_count: int = 2
    engine: str = "normal"  # normal|pro|mario|gear|rally (affects C offset when boosting)


@dataclass
class SimConfig:
    target_distance_blocks: float = 1000.0
    start_speed: float = 0.0           # kartmove units
    drift_angle_deg: float = 8.0       # base yaw delta per tick during drift
    drift_angle_min_deg: float = 4.0   # clamp min when mapped from drift_escape
    drift_angle_max_deg: float = 15.0  # clamp max when mapped from drift_escape
    drift_escape_ref: float = 460.0    # reference drift_escape for base angle
    drift_angle_from_drift_escape: bool = True  # map drift angle using drift_escape
    friction_per_tick: float = 20.0    # applied when |v| >= 20
    k278: float = 278.0                # UI scaling used for #kartspeed in datapack
    dt: float = 1.0 / 20.0             # seconds per tick
    allow_auto_drift: bool = True      # auto drift to build boost
    maintain_boost: bool = True        # pre-charge during active boost to keep boost uptime


@dataclass
class SimState:
    tick: int = 0
    v: float = 0.0               # kartmove (1000 = 1 block/s)
    dist: float = 0.0            # blocks
    gauge: float = 0.0           # kartboostgauge
    boost_count: int = 0         # kartboostcount
    boost_time_left: int = 0     # kartboosttime (ticks)
    drifting: bool = False
    drift_cycles: int = 0
    boosts_used: int = 0


def air_resistance(v: float, base_speed: float, boost_active: bool, engine: str) -> float:
    """Compute drag per tick in kartmove units, following datapack math:
    drag = 64 * v^2 / C^3.
    C = kartspeed (+84 if boost active, or always for PRO engine).
    Sign of drag follows sign(C^3); this matches scoreboard math when stats can be negative.
    """
    C = base_speed
    if engine.lower() == "pro":
        C = base_speed + 84.0
    elif boost_active:
        C = base_speed + 84.0
    # Avoid division by zero: keep sign if possible
    if C == 0.0:
        C = 1.0
    drag = 64.0 * (v * v) / (C * C * C)
    return drag


def should_charge_gauge(v: float, on_ground: bool, k278: float) -> bool:
    """Datapack condition uses #kartspeed >= 25 and floor-distance <= 1.
    Here we approximate: on_ground and (v / 278) >= 25.
    """
    return on_ground and (v >= 25.0 * k278)


def tick_update(spec: KartSpec, cfg: SimConfig, st: SimState) -> SimState:
    v = st.v
    on_ground = True  # straight/flat track assumption
    # Effective drift angle mapping from drift_escape
    eff_drift_angle_deg = cfg.drift_angle_deg
    if cfg.drift_angle_from_drift_escape and spec.drift_escape and spec.drift_escape > 0:
        scale = cfg.drift_escape_ref / max(spec.drift_escape, 1.0)
        eff_drift_angle_deg = cfg.drift_angle_deg * scale
        eff_drift_angle_deg = max(cfg.drift_angle_min_deg, min(cfg.drift_angle_max_deg, eff_drift_angle_deg))

    # Decide drift/boost actions (simple policy)
    if cfg.allow_auto_drift:
        # Maintain-boost policy: pre-charge during active boost if no stored boost and gauge < 2000
        if cfg.maintain_boost and st.boost_time_left > 0 and st.boost_count == 0 and st.gauge < 2000.0:
            if not st.drifting:
                st.drifting = True
                st.drift_cycles += 1
        
        # If gauge ready and we want continuous uptime, drop drift momentarily to convert
        if cfg.maintain_boost and st.gauge >= 2000.0 and st.boost_count < spec.max_boost_count:
            st.drifting = False
        
        # Convert gauge to a stored boost only when not drifting
        if not st.drifting and st.gauge >= 2000.0 and st.boost_count < spec.max_boost_count:
            st.gauge = 0.0
            st.boost_count += 1

        # Use a boost if available and not already boosting
        if st.boost_time_left <= 0 and st.boost_count > 0 and v >= 800.0:
            st.boost_count -= 1
            st.boost_time_left = max(int(spec.boost_duration), 0)
            st.boosts_used += 1

        # If not maintaining boost or not in pre-charge, decide drift for charging when boost inactive
        if st.boost_time_left <= 0 and st.boost_count == 0 and st.gauge < 2000.0:
            if not st.drifting:
                st.drifting = True
                st.drift_cycles += 1
        elif not (cfg.maintain_boost and st.boost_time_left > 0 and st.boost_count == 0 and st.gauge < 2000.0):
            st.drifting = False

    # 1) Acceleration and boost
    accel = spec.accel  # allow negative accel per input
    # Boost application per engine
    eng = spec.engine.lower()
    if eng == "mario":
        # Mario engine adds boost every tick regardless of boost_time; no extra add during boost_time
        boost_add = spec.boost
    else:
        if st.boost_time_left > 0:
            if eng == "pro":
                boost_add = spec.boost / 2.0
            else:
                boost_add = spec.boost
        else:
            boost_add = 0.0
    v += accel + boost_add

    # 2) Drift gauge & drift decel
    if st.drifting and should_charge_gauge(v, on_ground, cfg.k278):
        st.gauge += (v / 360.0) + spec.gauge_charge
        if v < 21600.0:  # bonus charge at lower speeds
            st.gauge += 15.0
        # Drift deceleration: skip for Mario engine per datapack
        if spec.engine.lower() != "mario":
            drift_angle_units = abs(eff_drift_angle_deg) * 10.0
            v -= spec.corner
            v -= (5.0 / 6.0) * drift_angle_units

    # 3) Ground friction
    if abs(v) >= cfg.friction_per_tick:
        v -= cfg.friction_per_tick if v > 0 else -cfg.friction_per_tick

    # 4) Air resistance (quadratic)
    drag = air_resistance(v, spec.speed, st.boost_time_left > 0, spec.engine)
    if v > 0:
        v = v - drag
    elif v < 0:
        v = v + drag

    # 5) Movement and timers
    # Average per-tick distance ≈ v / 20000 blocks
    st.dist += v / 20000.0
    if st.boost_time_left > 0:
        st.boost_time_left -= 1

    st.v = v
    st.tick += 1
    return st


def simulate(spec: KartSpec, cfg: Optional[SimConfig] = None) -> Tuple[SimState, float]:
    cfg = cfg or SimConfig()
    st = SimState(v=cfg.start_speed)
    # Basic sanity on inputs
    spec = KartSpec(
        speed=spec.speed,
        accel=spec.accel,
        boost=spec.boost,
        corner=spec.corner,
        drift_escape=spec.drift_escape,
        gauge_charge=spec.gauge_charge,
        boost_duration=max(0, int(spec.boost_duration)),
        max_boost_count=max(1, int(spec.max_boost_count)),
        engine=spec.engine,
    )

    safety_ticks = int(5 * 60 * 20)  # 5 minutes cap
    while st.dist < cfg.target_distance_blocks and st.tick < safety_ticks:
        st = tick_update(spec, cfg, st)

    time_sec = st.tick * cfg.dt
    return st, time_sec


def _fmt_seconds(sec: float) -> str:
    m = int(sec // 60)
    s = sec - 60 * m
    if m > 0:
        return f"{m}m {s:05.2f}s"
    return f"{s:.3f}s"


def main():
    import argparse, json, sys
    p = argparse.ArgumentParser(description="Simulate straight-line 1000-block time with drift-based boost charging.")
    p.add_argument("--speed", type=float, required=True, help="kartspeed (from item custom_data.speed)")
    p.add_argument("--accel", type=float, required=True, help="kartaccel (custom_data.accel)")
    p.add_argument("--boost", type=float, required=True, help="kartboost (custom_data.boost)")
    p.add_argument("--corner", type=float, required=True, help="effective kartcorner (lower better)")
    p.add_argument("--drift_escape", type=float, default=0.0, help="kartdrift: 드리프트 각도 매핑 및 감속 계산에 사용")
    p.add_argument("--gauge_charge", type=float, required=True, help="kartboostgaugecharge (custom_data.gauge)")
    p.add_argument("--boost_duration", type=int, required=True, help="kartboostduration in ticks")
    p.add_argument("--engine", type=str, default="normal", choices=["normal","pro","mario","gear","rally"], help="engine type")
    p.add_argument("--target", type=float, default=1000.0, help="target distance in blocks")
    p.add_argument("--drift_angle_deg", type=float, default=8.0, help="assumed yaw delta per tick during drift")
    p.add_argument("--no_auto_drift", action="store_true", help="disable automatic drift scheduling")
    p.add_argument("--no_maintain_boost", action="store_true", help="do not pre-charge during active boost")
    p.add_argument("--start_speed", type=float, default=0.0, help="initial kartmove (1000 = 1 block/s)")
    args = p.parse_args()

    spec = KartSpec(
        speed=args.speed,
        accel=args.accel,
        boost=args.boost,
        corner=args.corner,
        drift_escape=args.drift_escape,
        gauge_charge=args.gauge_charge,
        boost_duration=args.boost_duration,
        engine=args.engine,
    )
    cfg = SimConfig(
        target_distance_blocks=args.target,
        drift_angle_deg=args.drift_angle_deg,
    allow_auto_drift=not args.no_auto_drift,
    maintain_boost=not args.no_maintain_boost,
        start_speed=args.start_speed,
    )

    st, tsec = simulate(spec, cfg)
    out = {
        "time_seconds": round(tsec, 3),
        "time_formatted": _fmt_seconds(tsec),
        "ticks": st.tick,
        "avg_speed_block_s": round((cfg.target_distance_blocks / tsec) if tsec > 0 else 0.0, 3),
        "final_speed_kartmove": round(st.v, 1),
        "boosts_used": st.boosts_used,
        "drift_cycles": st.drift_cycles,
        "gauge_left": round(st.gauge, 1),
    }
    print(json.dumps(out, ensure_ascii=False, indent=2))


if __name__ == "__main__":
    main()
