playsound minecraft:entity.puffer_fish.blow_up hostile @a
playsound minecraft:ui.button.click hostile @a ~ ~ ~ 1 2

#제작자대결 노데이터 빠꾸
execute if entity @p[scores={trackselect-game-id=2}] if score @n[tag=track-track-record] timermain matches 2147483647 unless score #dev-record-mode dev-count matches 1 run tellraw @a[distance=..50] [{"text":"제작자가 ","color":"red"},{"text":"주행 데이터","color":"aqua"},{"text":"를 기록하지 않은 트랙입니다.","color":"red"}]
execute if entity @p[scores={trackselect-game-id=2}] if score @n[tag=track-track-record] timermain matches 2147483647 if score #dev-record-mode dev-count matches 1 run tellraw @a[distance=..50] [{"text":"제작자가 ","color":"red"},{"text":"주행 데이터","color":"aqua"},{"text":"를 기록하지 않았지만, 기록 모드가 켜져 트랙이 선택되었습니다.","color":"red"}]
execute if entity @p[scores={trackselect-game-id=2}] if score @n[tag=track-track-record] timermain matches 2147483647 unless score #dev-record-mode dev-count matches 1 run return 1

#만약 멀티 플레이, 제작자 대결, 타임어택, 라이센스 중 하나라도 플레이중이라면 return
execute store result score is-copyright-content trackselect-map-id run function trackselect:track-ui/copyright-track/is-copyright-track
execute if score copyright-content trackselect-map-id matches 0 if score is-copyright-content trackselect-map-id matches 1 run return 1

execute as @p[scores={trackselect-game-id=1..}] if function gamemain:cannot-start-condition run return 1

#맵 아이디 설정(가장 가까운 기록텍스트의 아이디도 설정)
execute if entity @p[scores={trackselect-game-id=1}] run function trackselect:track-ui/select-track/timeattack
execute if entity @p[scores={trackselect-game-id=2}] run function trackselect:track-ui/select-track/devbattle
execute if entity @p[scores={trackselect-game-id=3}] run function trackselect:track-ui/select-track/multiplay

function trackselect:track-ui/remove-ui
execute as @p[scores={trackselect-game-id=1..}] run function trackselect:track-ui/return-to-room