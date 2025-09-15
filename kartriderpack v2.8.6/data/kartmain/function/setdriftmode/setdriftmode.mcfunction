tellraw @s [{"text":"드리프트 감도 설정 메뉴","color":"aqua","bold":true}]
tellraw @s [{"text":"드리프트 감도는 내부적인 물리엔진과 이동 궤적에는 영향을 주지 않는 시각적인 요소입니다.\n","color":"green","bold":true}]

tellraw @s [{"hoverEvent":{"action":"show_text","value":[{"text":"균형 잡힌 기본 드리프트 감도입니다."}]}, "text":"[기본]","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 0"}},{"text":"으로 설정","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 0"}}]
tellraw @s [{"hoverEvent":{"action":"show_text","value":[{"text":"차체가 조금 더 과장된 각도로 회전합니다."}]}, "text":"[과장된 회전]","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 1"}},{"text":"으로 설정","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 1"}}]
tellraw @s [{"hoverEvent":{"action":"show_text","value":[{"text":"차체가 진행 방향을 따라 느리게 회전합니다."}]}, "text":"[진행방향 동기화]","color":"blue","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 2"}},{"text":"으로 설정","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 2"}}]
tellraw @s [{"hoverEvent":{"action":"show_text","value":[{"text":"차체가 플레이어의 시선을 따라 회전합니다."}]}, "text":"[플레이어 동기화]","color":"green","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 3"}},{"text":"으로 설정","color":"aqua","clickEvent":{"action":"run_command","value":"/trigger kartdriftmode set 3"}}]

