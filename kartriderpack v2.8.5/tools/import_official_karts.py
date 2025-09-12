#!/usr/bin/env python3
"""
Import all karts from getofficialkart/*.mcfunction into tools/karts.json.

Parses lines like:
  function kartmobil:makekart {name:{"text":"연습카트"}, speed:423, accel:578, ...}

Mapping to config fields:
  name.text         -> name (string)
  speed             -> speed
  accel             -> accel
  boost             -> boost
  corner            -> corner
  drift             -> drift_escape (kept for completeness)
  gauge             -> gauge_charge
  boosttime         -> boost_duration (ticks)
  maxboostcount     -> max_boost_count (optional)

Appends to existing karts in tools/karts.json (keeps defaults).
"""

from __future__ import annotations
import json
import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
GET_DIR = ROOT / "getofficialkart"
KARTS_JSON = ROOT / "tools" / "karts.json"


def find_outer_braces_segment(s: str) -> str | None:
    """Return substring of s spanning the first top-level {...} pair, including braces."""
    i0 = s.find('{')
    if i0 < 0:
        return None
    depth = 0
    for i in range(i0, len(s)):
        c = s[i]
        if c == '{':
            depth += 1
        elif c == '}':
            depth -= 1
            if depth == 0:
                return s[i0:i+1]
    return None


def split_top_level_commas(s: str) -> list[str]:
    parts = []
    cur = []
    depth = 0
    in_str = False
    esc = False
    for ch in s:
        if in_str:
            cur.append(ch)
            if esc:
                esc = False
            elif ch == '\\':
                esc = True
            elif ch == '"':
                in_str = False
            continue
        if ch == '"':
            in_str = True
            cur.append(ch)
            continue
        if ch == '{':
            depth += 1
            cur.append(ch)
            continue
        if ch == '}':
            depth -= 1
            cur.append(ch)
            continue
        if ch == ',' and depth == 0:
            parts.append(''.join(cur).strip())
            cur = []
            continue
        cur.append(ch)
    if cur:
        parts.append(''.join(cur).strip())
    return parts


def parse_make_line(line: str) -> dict | None:
    if "function kartmobil:make" not in line:
        return None
    seg = find_outer_braces_segment(line)
    if not seg:
        return None
    inner = seg[1:-1].strip()
    kvs = split_top_level_commas(inner)
    data = {}
    for kv in kvs:
        if ':' not in kv:
            continue
        k, v = kv.split(':', 1)
        key = k.strip()
        val = v.strip()
        if key == 'name':
            try:
                name_obj = json.loads(val)
                name = name_obj.get('text', str(name_obj))
            except Exception:
                # Fallback: try to extract text field via regex
                m = re.search(r'"text"\s*:\s*"(.*?)"', val)
                name = m.group(1) if m else val
            data['name'] = name
        else:
            # numeric or string
            if val.startswith('"') and val.endswith('"'):
                data[key] = val.strip('"')
            else:
                try:
                    data[key] = int(val)
                except ValueError:
                    try:
                        data[key] = float(val)
                    except ValueError:
                        data[key] = val
    # Map fields to config
    cfg = {
        'name': data.get('name', '(unnamed)'),
        'speed': data.get('speed'),
        'accel': data.get('accel'),
        'boost': data.get('boost'),
        'corner': data.get('corner'),
        'gauge_charge': data.get('gauge'),
        'boost_duration': data.get('boosttime'),
    }
    if 'drift' in data:
        cfg['drift_escape'] = data['drift']
    if 'maxboostcount' in data:
        cfg['max_boost_count'] = data['maxboostcount']
    return cfg


def collect_official_karts() -> list[dict]:
    karts: list[dict] = []
    for path in sorted(GET_DIR.glob("*.mcfunction")):
        for line in path.read_text(encoding='utf-8').splitlines():
            line = line.strip()
            if not line or line.startswith('#'):
                continue
            if 'function kartmobil:makekart' in line or 'function kartmobil:makebike' in line:
                cfg = parse_make_line(line)
                if cfg and all(k in cfg and cfg[k] is not None for k in ('speed','accel','boost','corner','gauge_charge','boost_duration')):
                    karts.append(cfg)
    return karts


def main():
    if not GET_DIR.exists():
        raise SystemExit(f"Directory not found: {GET_DIR}")
    imported = collect_official_karts()
    if not imported:
        raise SystemExit("No karts parsed from getofficialkart.")

    # Load existing karts.json
    if KARTS_JSON.exists():
        data = json.loads(KARTS_JSON.read_text(encoding='utf-8'))
    else:
        data = {"defaults": {"target": 1000}, "karts": []}

    defaults = data.get('defaults') or {"target": 1000}
    existing = data.get('karts') or []

    # Merge: append imported, avoid duplicates by name+speed
    sig = {(e.get('name'), e.get('speed')) for e in existing}
    appended = 0
    for k in imported:
        key = (k.get('name'), k.get('speed'))
        if key not in sig:
            existing.append(k)
            sig.add(key)
            appended += 1

    out = {"defaults": defaults, "karts": existing}
    KARTS_JSON.write_text(json.dumps(out, ensure_ascii=False, indent=2), encoding='utf-8')
    print(f"Imported {appended} karts. Total: {len(existing)}. -> {KARTS_JSON}")


if __name__ == '__main__':
    main()
