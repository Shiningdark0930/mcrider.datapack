#!/usr/bin/env python3
"""
Train a steering policy on KartEnv using a simple Evolution Strategies (ES) loop.

Policy: small MLP (tanh) mapping observations -> steering angle (deg).
Objective: maximize forward progress; bonus for finishing earlier if target reached.

Outputs:
- Saves best policy params to tools/ai_runs/best_policy.npz
- Saves episode image for the best policy each save interval.
"""
from __future__ import annotations
import os, json, math, argparse, time, random
from typing import Tuple, List, Dict

import numpy as np

from ai_env import KartEnv


def features(obs: Dict) -> np.ndarray:
    # Construct a normalized feature vector from observation dict
    x, y = obs['pos']
    h = math.radians(obs['heading_deg'])
    km = obs['kartmove']
    drift = 1.0 if obs['drifting'] else 0.0
    dtm = obs['drifttime'] / 60.0
    btime = obs['boosttime'] / 60.0
    bcnt = obs['boostcount'] / 3.0
    bgauge = obs['boostgauge'] / 2000.0
    vec = np.array([
        1.0,                   # bias
        x / 1000.0,            # pos x scaled
        y / 1000.0,            # pos y scaled
        math.cos(h),
        math.sin(h),
        km / 20000.0,          # speed-like in blocks/tick scale
        drift,
        dtm,
        btime,
        bcnt,
        bgauge,
    ], dtype=np.float32)
    return vec


class MLPPolicy:
    def __init__(self, in_dim: int, hidden: int = 32, max_angle: float = 45.0, seed: int = 0):
        self.in_dim = in_dim
        self.hidden = hidden
        self.max_angle = float(max_angle)
        rng = np.random.default_rng(seed)
        # Xavier init
        self.W1 = rng.normal(0, 1.0/np.sqrt(in_dim), size=(hidden, in_dim)).astype(np.float32)
        self.b1 = np.zeros((hidden,), dtype=np.float32)
        self.W2 = rng.normal(0, 1.0/np.sqrt(hidden), size=(1, hidden)).astype(np.float32)
        self.b2 = np.zeros((1,), dtype=np.float32)

    def forward(self, x: np.ndarray) -> float:
        z1 = np.tanh(self.W1 @ x + self.b1)
        y = self.W2 @ z1 + self.b2
        # squash to [-1,1] then scale to degrees
        ang = float(np.tanh(y)[0]) * self.max_angle
        return ang

    def get_params(self) -> np.ndarray:
        return np.concatenate([self.W1.flatten(), self.b1, self.W2.flatten(), self.b2])

    def set_params(self, p: np.ndarray) -> None:
        o = 0
        sW1 = self.hidden * self.in_dim
        self.W1 = p[o:o+sW1].reshape(self.hidden, self.in_dim).astype(np.float32); o += sW1
        self.b1 = p[o:o+self.hidden].astype(np.float32); o += self.hidden
        sW2 = self.hidden
        self.W2 = p[o:o+sW2].reshape(1, self.hidden).astype(np.float32); o += sW2
        self.b2 = p[o:o+1].astype(np.float32)


def evaluate(env: KartEnv, policy: MLPPolicy, render_path: str | None = None) -> Tuple[float, Dict]:
    obs = env.reset()
    done = False
    total = 0.0
    while not done:
        a = policy.forward(features(obs))
        obs, r, done, info = env.step(a)
        total += r
    # bonus for finishing quickly
    if info.get('reason') == 'target':
        total += 0.1 * (env.max_ticks - env.tick)
    if render_path:
        env.render(render_path)
    return float(total), {'ticks': env.tick, 'reason': info.get('reason')}


def train(args):
    os.makedirs(args.out_dir, exist_ok=True)
    # set seeds
    random.seed(args.seed)
    np.random.seed(args.seed)

    env = KartEnv(args.kart_file, dt=args.dt, max_ticks=args.max_ticks, target_blocks=args.target_blocks, init_boostcount=args.init_boostcount)
    in_dim = len(features(env.reset()))
    policy = MLPPolicy(in_dim, hidden=args.hidden, max_angle=args.max_angle, seed=args.seed)
    params = policy.get_params()
    best_score = -1e9
    best_params = params.copy()

    for it in range(1, args.iterations + 1):
        noises = np.random.randn(args.population, params.size).astype(np.float32)
        scores = np.zeros((args.population,), dtype=np.float32)
        # antithetic sampling could be added; keep simple for readability
        for i in range(args.population):
            trial = params + args.sigma * noises[i]
            policy.set_params(trial)
            score, info = evaluate(env, policy)
            scores[i] = score
        # normalize scores
        mean = float(scores.mean()); std = float(scores.std() + 1e-8)
        norm = (scores - mean) / std
        grad = (norm[:, None] * noises).mean(axis=0)
        params = params + args.lr * grad
        policy.set_params(params)

        # track best and log
        cur_score, info = evaluate(env, policy)
        if cur_score > best_score:
            best_score = cur_score
            best_params = params.copy()
        log = {
            'iter': it,
            'mean': mean,
            'std': std,
            'cur_score': cur_score,
            'best_score': best_score,
            'ticks': info.get('ticks'),
            'reason': info.get('reason'),
        }
        print(json.dumps(log, ensure_ascii=False))

        # save periodically
        if (it % args.save_interval) == 0 or it == args.iterations:
            np.savez(os.path.join(args.out_dir, 'best_policy.npz'), params=best_params)
            # render best
            policy.set_params(best_params)
            _, info_best = evaluate(env, policy, render_path=os.path.join(args.out_dir, f'best_iter_{it:04d}.png'))


def main():
    ap = argparse.ArgumentParser(description='ES trainer for KartEnv')
    ap.add_argument('--kart_file', required=True)
    ap.add_argument('--dt', type=float, default=1.0/20.0)
    ap.add_argument('--max_ticks', type=int, default=1200)
    ap.add_argument('--target_blocks', type=float, default=1000.0)
    ap.add_argument('--init_boostcount', type=int, default=None)
    ap.add_argument('--iterations', type=int, default=50)
    ap.add_argument('--population', type=int, default=32)
    ap.add_argument('--sigma', type=float, default=0.1)
    ap.add_argument('--lr', type=float, default=0.05)
    ap.add_argument('--hidden', type=int, default=32)
    ap.add_argument('--max_angle', type=float, default=45.0)
    ap.add_argument('--out_dir', default='tools/ai_runs')
    ap.add_argument('--save_interval', type=int, default=5)
    ap.add_argument('--seed', type=int, default=0)
    args = ap.parse_args()
    train(args)


if __name__ == '__main__':
    main()
