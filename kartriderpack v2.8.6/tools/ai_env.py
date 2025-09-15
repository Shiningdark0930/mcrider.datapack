#!/usr/bin/env python3
"""
AI training-friendly environment for the datapack-aligned kart simulator.

Provides a minimal Gym-like API without external dependencies:
  - env = KartEnv(kart_file, dt=0.05, max_ticks=1200, target_blocks=1000)
  - obs = env.reset()
  - obs, reward, done, info = env.step(action)
Action: steering angle in degrees for this tick (float). Always holding forward.
Observation: dict with position, heading, speed (kartmove), drift/boost state, gauge and slots.
Reward: delta forward progress in +X (blocks) this tick.

Rendering: call env.render(out_image) to save a colored path image for the current episode.
"""
from __future__ import annotations
import json, math
from typing import Dict, Tuple, List, Optional

try:
    # reuse renderer from sibling steering_sim when executed from tools/
    from steering_sim import render_path
except Exception:
    render_path = None


def _load_kart_stats(path: str) -> dict:
    with open(path, 'r', encoding='utf-8') as f:
        return json.load(f)


class KartEnv:
    def __init__(
        self,
        kart_file: str,
        dt: float = 1.0/20.0,
        max_ticks: int = 1200,
        target_blocks: float = 1000.0,
        start_heading_deg: float = 0.0,
        init_boostcount: Optional[int] = None,
    ) -> None:
        self.kart = _load_kart_stats(kart_file)
        if init_boostcount is not None:
            self.kart['init_boostcount'] = int(init_boostcount)
        self.dt = float(dt)
        self.max_ticks = int(max_ticks)
        self.target_blocks = float(target_blocks)
        self.start_heading_deg = float(start_heading_deg)
        # cache stats
        self.speed_stat = float(self.kart.get('speed', self.kart.get('kartspeed', 428)))
        self.accel = float(self.kart.get('accel', 600))
        self.boost = float(self.kart.get('boost', 200))
        self.corner = float(self.kart.get('corner', 210))
        self.engine = int(self.kart.get('engine', 0))  # 1003: Mario, 9: Rally, 8: PRO, 1000: N1, 1002: A2
        self.gauge_stat = int(self.kart.get('gauge', self.kart.get('boostgaugecharge', 0)))
        self.boost_duration = int(self.kart.get('boosttime', self.kart.get('kartboostduration', 60)))
        self.max_boost_count = int(self.kart.get('maxboostcount', self.kart.get('kartmaxboostcount', 1)))

        self._init_state()

    def _init_state(self) -> None:
        # datapack units
        self.kartmove = 0.0
        self.drifttime = 0
        self.drifting = False
        self.boosttime = 0
        self.boostcount = int(self.kart.get('init_boostcount', 0))
        self.boostgauge = 0

        self.x = 0.0
        self.y = 0.0
        self.h = math.radians(self.start_heading_deg)
        self.tick = 0

        # for rendering
        self.points: List[Tuple[float, float]] = [(self.x, self.y)]
        self.states: List[Tuple[bool, bool]] = []  # (drifting, boosting)

    def reset(self) -> Dict:
        self._init_state()
        return self._get_obs()

    def _get_obs(self) -> Dict:
        return {
            'tick': self.tick,
            'pos': [self.x, self.y],
            'heading_deg': math.degrees(self.h),
            'kartmove': self.kartmove,
            'drifting': self.drifting,
            'drifttime': self.drifttime,
            'boosttime': self.boosttime,
            'boostcount': self.boostcount,
            'boostgauge': self.boostgauge,
        }

    def step(self, action_deg: float) -> Tuple[Dict, float, bool, Dict]:
        if self.tick >= self.max_ticks:
            # episode already over; return terminal again
            return self._get_obs(), 0.0, True, {'reason': 'max_ticks'}

        prev_x = self.x
        a_deg = float(action_deg)
        # 0) steering
        self.h += math.radians(a_deg)
        lr_pressed = abs(a_deg) > 0.1

        # 1) accelerate
        self.kartmove += abs(self.accel)

        # 2) drift start/stop
        angle10 = abs(a_deg) * 10.0
        if not self.drifting:
            if self.engine == 9:
                if angle10 > 150.0:
                    self.drifting = True
                    self.drifttime = 0
            elif self.engine != 1003:
                if angle10 > 250.0:
                    self.drifting = True
                    self.drifttime = 0
        else:
            if self.engine == 1000:
                if angle10 <= 100.0:
                    self.drifting = False
                    self.drifttime = 0
            elif self.engine == 1002:
                if self.drifttime < 8:
                    if angle10 <= 50.0:
                        self.drifting = False
                        self.drifttime = 0
                else:
                    if angle10 <= 250.0:
                        self.drifting = False
                        self.drifttime = 0
            elif self.engine == 9:
                if angle10 <= 150.0:
                    self.drifting = False
                    self.drifttime = 0
            elif self.engine != 1003:
                if angle10 <= 250.0:
                    self.drifting = False
                    self.drifttime = 0

        # 3) drift effects and gauge
        boost_active = False
        if self.drifting:
            self.drifttime += 1
            speed_ui = self.kartmove / 278.0
            if self.engine != 1003 and speed_ui >= 25.0:
                self.kartmove -= self.corner
                self.kartmove -= angle10
                self.kartmove += (angle10 / 6.0)
            inc = 0
            if self.drifttime >= 10: inc += 2
            if self.drifttime >= 15: inc += 4
            if self.drifttime >= 20: inc += 7
            if self.drifttime >= 25: inc += 11
            if self.drifttime >= 30: inc += 16
            if self.drifttime >= 35: inc += 22
            self.kartmove += inc
            if speed_ui >= 25.0 and self.engine != 1003:
                if self.engine == 1002:
                    if angle10 > 250.0:
                        self.boostgauge += int(self.kartmove / 360.0)
                else:
                    self.boostgauge += int(self.kartmove / 360.0)
                if self.gauge_stat > 0:
                    self.boostgauge += int(self.gauge_stat)
                if self.kartmove < 21600.0:
                    self.boostgauge += 15

        # 3.5) boost usage/continuation
        if self.boosttime <= 0 and self.kartmove >= 800.0 and self.boostcount >= 1 and lr_pressed:
            self.boosttime = self.boost_duration
            self.boostcount -= 1
        if self.boosttime > 0:
            boost_active = True
            self.kartmove += self.boost
        if self.boosttime == 0 and (self.kartmove / 278.0) >= 50.0 and (not self.drifting):
            if self.engine in (2, 8, 1000, 1002):
                self.boostgauge += 20

        # 4) move before friction/airresist (datapack order)
        dist_blocks = self.kartmove / 20000.0
        self.x += dist_blocks * math.cos(self.h)
        self.y += dist_blocks * math.sin(self.h)
        self.points.append((self.x, self.y))
        self.states.append((self.drifting, boost_active))

        # 5) friction
        if self.kartmove >= 20.0:
            self.kartmove -= 20.0

        # 6) air resistance using speed stat (+84 during boost/PRO)
        air_const = self.speed_stat
        if boost_active or self.engine == 8:
            air_const += 84.0
        if air_const > 0:
            air = (64.0 * (self.kartmove * self.kartmove)) / (air_const ** 3)
        else:
            air = 0.0
        if self.kartmove > 0:
            self.kartmove -= air
        elif self.kartmove < 0:
            self.kartmove += air

        # 7) timers and gauge-to-slot
        if self.boosttime > 0:
            self.boosttime -= 1
        if (not self.drifting) and self.engine not in (1003, 9):
            if self.boostgauge >= 2000:
                self.boostgauge = 0
                if self.boostcount >= self.max_boost_count:
                    self.boostgauge += 800
                else:
                    self.boostcount += 1

        self.tick += 1

        # reward and termination
        dx = self.x - prev_x
        reward = dx
        done = (self.x >= self.target_blocks) or (self.tick >= self.max_ticks)
        info = {
            'reason': 'target' if self.x >= self.target_blocks else ('max_ticks' if self.tick >= self.max_ticks else None),
            'boost_active': boost_active,
        }
        return self._get_obs(), float(reward), bool(done), info

    def render(self, out_image: str, width: int = 1200, height: int = 800, margin: int = 40) -> None:
        if render_path is None:
            raise RuntimeError('Renderer not available. Ensure tools/steering_sim.py is importable and Pillow is installed.')
        render_path(self.points, self.states, out_image, width=width, height=height, margin=margin)


if __name__ == '__main__':
    import argparse
    ap = argparse.ArgumentParser(description='Run a single random episode in KartEnv')
    ap.add_argument('--kart_file', required=True)
    ap.add_argument('--dt', type=float, default=1.0/20.0)
    ap.add_argument('--max_ticks', type=int, default=1200)
    ap.add_argument('--target_blocks', type=float, default=1000.0)
    ap.add_argument('--out_image', default='tools/ai_env_episode.png')
    args = ap.parse_args()

    import random
    env = KartEnv(args.kart_file, dt=args.dt, max_ticks=args.max_ticks, target_blocks=args.target_blocks)
    env.reset()
    done = False
    total_reward = 0.0
    while not done:
        # random small steering to simulate exploration
        action = random.uniform(-45.0, 45.0)
        obs, r, done, info = env.step(action)
        total_reward += r
    env.render(args.out_image)
    print(json.dumps({
        'ticks': env.tick,
        'time_seconds': round(env.tick * env.dt, 6),
        'total_reward': total_reward,
        'out_image': args.out_image,
        'done_reason': info.get('reason'),
    }, ensure_ascii=False))
