execute unless entity @p[scores={trackselect-game-id=1..}] run return 1

#텍스트에 트랙 정보 설정
data modify entity @n[tag=trackselect-updown-text] text set from entity @n[tag=updown-text] text
scoreboard players operation @n[tag=trackselect-updown-text] trackselect-map-id = @n[tag=updown-text] trackselect-map-id

tp @p[scores={trackselect-game-id=1..}] -73 4 205 0 0