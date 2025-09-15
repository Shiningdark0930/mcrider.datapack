# AI training environment for the datapack-aligned kart simulator

This provides a minimal Gym-like environment to run AI learning loops without external deps.

- Env: `tools/ai_env.py` with class `KartEnv`
- Action space: steering angle in degrees per tick (float); forward is always pressed.
- Observation: json-like dict with position, heading, kartmove, drift/boost state, gauge/slots.
- Reward: forward progress along +X (blocks) per tick.
- Termination: when x >= target_blocks or max_ticks reached.
- Rendering: `env.render(out_image)` writes a colored path image (gray=normal, orange=drift, green=boost, blue=both).

## Quick start

Run one random episode and save an image:

```bash
python3 tools/ai_env.py --kart_file tools/kart.from_cli.json --max_ticks 1200 --target_blocks 1000 --out_image tools/ai_env_episode.png
```

## Example training loop (pseudo-code)

```python
from tools.ai_env import KartEnv
import random

env = KartEnv('tools/kart.from_cli.json', dt=1/20, max_ticks=1200, target_blocks=1000)
for episode in range(100):
    obs = env.reset()
    done = False
    total = 0.0
    while not done:
        action = policy(obs)  # e.g., random.uniform(-45, 45)
        obs, r, done, info = env.step(action)
        total += r
    env.render(f'tools/runs/ep_{episode:03d}.png')
```

## Notes
- Physics order matches `tools/steering_sim.py` (datapack logic, flat plane, no collisions).
- For exact reproducibility, set your RNG seed and avoid random noise.
- If Pillow is missing, install via `pip install pillow`.
