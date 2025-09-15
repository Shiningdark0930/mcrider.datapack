# Datapack-aligned Steering Simulator

데이터팩 물리를 최대한 반영한 평지 시뮬레이터입니다. 공식 카트 능력치와 매 틱마다의 조향 각(도/틱)을 입력으로 받아, 전진+부스터 상시 입력 상태로 경로를 적분하고 이미지를 출력합니다.

## 입력
- kart_file (JSON, 공식 필드):
  - speed, accel, boost, corner, drift, gauge, boosttime, maxboostcount, engine(optional)
- angles_file: 조향 각 파일. 형식:
  - JSON 배열 [0, 0, 5, -3, ...] 또는
  - 텍스트: 줄/공백/쉼표로 구분된 숫자들

## 사용법
python tools/steering_sim.py --kart_file tools/kart.sample.json --angles_file tools/angles.sample.txt --out_image tools/steering_path.png

옵션:
- --dt: 틱 시간(기본 0.05s, 현재는 위치 적분 스케일만 영향)
- --start_heading: 시작 헤딩(도)
- --out_width/--out_height: 출력 이미지 크기(px)
- --margin: 여백(px)

## 출력
- PNG 경로 이미지 (파랑 선, 초록 시작점, 빨강 종료점)
- 표준출력 JSON: ticks, dt, time_seconds, out_image, points
