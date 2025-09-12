#!/usr/bin/env python3
"""
Batch runner: read kart specs from a JSON config and run simulations.

Config JSON schema (example in karts.json):
{
  "defaults": { "target": 1000, "engine": "normal", "drift_angle_deg": 8 },
  "karts": [
    { "name": "Kart A", "speed": 120, "accel": 800, "boost": 2000,
      "corner": 220, "gauge_charge": 4, "boost_duration": 120,
      "engine": "normal" }
  ]
}
"""

import argparse
import csv
import json
import sys
from pathlib import Path


def _load_sim():
    """Import simulate_kart from local folder."""
    here = Path(__file__).parent
    if str(here) not in sys.path:
        sys.path.insert(0, str(here))
    import simulate_kart as sim
    return sim


def run_one(entry: dict, defaults: dict, sim):
    # Merge defaults
    merged = {**defaults, **entry}
    # Required fields
    try:
        speed = float(merged["speed"])     # kartspeed
        accel = float(merged["accel"])     # kartaccel
        boost = float(merged["boost"])     # kartboost
        corner = float(merged["corner"])   # kartcorner (effective)
        gauge_charge = float(merged["gauge_charge"])  # kartboostgaugecharge
        boost_duration = int(merged["boost_duration"])  # ticks
    except KeyError as e:
        raise SystemExit(f"Missing required field in kart entry: {e}")

    name = str(merged.get("name", "(unnamed)"))
    engine = str(merged.get("engine", "normal"))
    drift_escape = float(merged.get("drift_escape", 0.0))
    target = float(merged.get("target", 1000.0))
    drift_angle_deg = float(merged.get("drift_angle_deg", 8.0))
    drift_angle_min_deg = float(merged.get("drift_angle_min_deg", 4.0))
    drift_angle_max_deg = float(merged.get("drift_angle_max_deg", 15.0))
    drift_escape_ref = float(merged.get("drift_escape_ref", 460.0))
    drift_angle_from_drift_escape = bool(merged.get("drift_angle_from_drift_escape", True))
    start_speed = float(merged.get("start_speed", 0.0))
    allow_auto_drift = bool(merged.get("allow_auto_drift", True))
    maintain_boost = bool(merged.get("maintain_boost", True))

    spec = sim.KartSpec(
        speed=speed,
        accel=accel,
        boost=boost,
        corner=corner,
        drift_escape=drift_escape,
        gauge_charge=gauge_charge,
        boost_duration=boost_duration,
        engine=engine,
    )
    cfg = sim.SimConfig(
        target_distance_blocks=target,
        drift_angle_deg=drift_angle_deg,
    drift_angle_min_deg=drift_angle_min_deg,
    drift_angle_max_deg=drift_angle_max_deg,
    drift_escape_ref=drift_escape_ref,
    drift_angle_from_drift_escape=drift_angle_from_drift_escape,
        start_speed=start_speed,
        allow_auto_drift=allow_auto_drift,
        maintain_boost=maintain_boost,
    )

    st, tsec = sim.simulate(spec, cfg)
    result = {
        "name": name,
        "engine": engine,
        "time_seconds": round(tsec, 3),
        "ticks": st.tick,
        "avg_speed_block_s": round((target / tsec) if tsec > 0 else 0.0, 3),
        "final_speed_kartmove": round(st.v, 1),
        "boosts_used": st.boosts_used,
        "drift_cycles": st.drift_cycles,
        "gauge_left": round(st.gauge, 1),
        "target": target,
    }
    return result


def main():
    p = argparse.ArgumentParser(description="Run kart simulations from a JSON config.")
    p.add_argument("--config", required=True, help="Path to JSON config file (see karts.json)")
    p.add_argument("--out-json", help="Write results to JSON file")
    p.add_argument("--out-csv", help="Write results to CSV file")
    args = p.parse_args()

    sim = _load_sim()

    cfg_path = Path(args.config)
    data = json.loads(cfg_path.read_text(encoding="utf-8"))
    defaults = data.get("defaults", {})
    karts = data.get("karts", [])
    if not isinstance(karts, list) or not karts:
        raise SystemExit("No karts found in config JSON.")

    results = []
    for entry in karts:
        res = run_one(entry, defaults, sim)
        results.append(res)

    # Pretty print to stdout
    print("name,time_seconds,avg_block_s,final_kartmove,boosts,drift_cycles,target")
    for r in results:
        print(
            f"{r['name']},{r['time_seconds']},{r['avg_speed_block_s']}"
            f",{r['final_speed_kartmove']},{r['boosts_used']},{r['drift_cycles']},{r['target']}"
        )

    # Write JSON/CSV if requested
    if args.out_json:
        sorted_for_json = sorted(
            results,
            key=lambda r: (
                r.get("time_seconds", float("inf")),
                r.get("name", "")
            ),
        )
        Path(args.out_json).write_text(
            json.dumps(sorted_for_json, ensure_ascii=False, indent=2),
            encoding="utf-8",
        )
    if args.out_csv:
        with open(args.out_csv, "w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(
                f,
                fieldnames=[
                    "name","engine","time_seconds","ticks","avg_speed_block_s",
                    "final_speed_kartmove","boosts_used","drift_cycles","gauge_left","target",
                ],
            )
            w.writeheader()
            for r in results:
                w.writerow(r)


if __name__ == "__main__":
    main()
