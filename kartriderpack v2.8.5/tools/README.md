# 직선 주행 시간 시뮬레이터 (Python)

직선에서 N블럭을 주행하는 데 걸리는 시간을 근사 계산합니다. 고려 요소:
- 가속, 지면 마찰, 공기저항(속도 제곱 비례)
- 부스터 사용/지속시간
- 드리프트로 부스터 게이지 충전(간단한 자동 전략)

데이터팩 물리를 빠르게 추정하기 위한 근사 모델입니다.

## 사용법

이 폴더에서 실행(Python 3.9+):

```bash
python3 simulate_kart.py \
  --speed 120 \
  --accel 800 \
  --boost 2000 \
  --corner 220 \
  --gauge_charge 4 \
  --boost_duration 120 \
  --engine normal \
  --target 1000
```

출력(JSON): 걸린 시간(초), 틱 수, 평균속도, 최종속도, 사용 부스터 개수, 드리프트 횟수 등.

## 파라미터 설명
- `--speed`: kartspeed(아이템 custom_data.speed)
- `--accel`: 기본 가속(custom_data.accel)
- `--boost`: 부스터 가속(custom_data.boost)
- `--corner`: 코너링(값이 낮을수록 유리; 드리프트 감속에 사용)
- `--gauge_charge`: 부스터 게이지 충전량(custom_data.gauge)
- `--boost_duration`: 부스터 지속시간(틱)
- `--engine`: normal|pro|mario|gear|rally
- `--target`: 목표 거리(블럭)
- `--drift_angle_deg`: 드리프트 시 yaw 변화(기본 8도/틱)
  - 기본값은 드리프트 탈출력(drift_escape=kartdrift)에 따라 자동 보정됩니다.
  - 매핑: eff_angle = base_angle × (drift_escape_ref / drift_escape),
    이후 [drift_angle_min_deg, drift_angle_max_deg] 범위로 클램프.
  - 기본값: base=8, min=4, max=15, drift_escape_ref=460.
- `--no_auto_drift`: 자동 드리프트 비활성화
 - `--no_maintain_boost`: 부스터가 진행 중일 때도 다음 부스터를 미리 충전(드리프트)하여 ‘상시 부스터’에 가깝게 유지하는 정책을 비활성화

## 참고/주의
- 단위: kartmove 1000 = 1 블럭/초, 1틱 = 1/20초.
- 공기저항: drag = 64·v^2 / C^3, C = speed(+84: 부스터 중 또는 PRO 엔진).
- 자동 전략: 부스터가 ‘상시 유지’되도록, 부스터 중에도 저장 부스터가 없고 게이지가 부족하면 드리프트로 미리 충전합니다(게이지 2000 도달 시 1틱 해제 후 저장, 이어서 사용). `--no_maintain_boost`로 끌 수 있습니다.
- 드리프트 감속: 데이터팩 로직을 근사하여 v -= corner − (#kartdecel) − |angle| ≈ v -= corner + (5/6)·|angle|로 반영합니다.
  마리오 엔진은 드리프트 감속이 없음(데이터팩과 동일하게 예외 처리).
- 생략: 벽/패드/소울샌드/충돌/세부 엔진 차이 일부. 완전 동일 재현은 실제 입력 기반 틱 리플레이가 필요합니다.

## 고급 사용
- `--no_auto_drift`로 자동 드리프트를 끄고, 거리/파라미터를 나눠 단계별로 스크립팅할 수 있습니다.
- 여러 스펙 조합을 배치 실행해 비교할 수 있습니다.

## 설정 파일 기반 자동 실행

여러 카트 스펙을 한 번에 돌리고 싶다면, `karts.json` 형식으로 설정을 만든 뒤 실행하세요.

예시 파일: `tools/karts.json`

```json
{
  "defaults": {
    "target": 1000,
    "engine": "normal",
    "drift_angle_deg": 8,
    "drift_angle_min_deg": 4,
    "drift_angle_max_deg": 15,
    "drift_escape_ref": 460,
    "drift_angle_from_drift_escape": true
  },
  "karts": [
    { "name": "Kart A", "speed": 120, "accel": 800, "boost": 2000,
      "corner": 220, "gauge_charge": 4, "boost_duration": 120 },
    { "name": "Kart B (PRO)", "speed": 118, "accel": 820, "boost": 2100,
      "corner": 230, "gauge_charge": 3, "boost_duration": 110, "engine": "pro" }
  ]
}
```

실행:

```bash
python3 tools/run_from_config.py --config tools/karts.json \
  --out-json tools/results.json --out-csv tools/results.csv
```

표준출력과 JSON/CSV 파일로 결과를 확인할 수 있습니다.