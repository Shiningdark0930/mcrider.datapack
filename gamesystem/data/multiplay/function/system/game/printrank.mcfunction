scoreboard players add #rank-print-temp multi-rank 1
# 임시 기록모드
execute if score #record_mode multi-main matches 1 as @a if score @s multi-rank = #rank-print-temp multi-rank run logtellraw targetless [{"text":"기록 ","color":"yellow"},{"selector":"@s","color":"aqua"},{"text":" | 트랙: ","color":"yellow"},{"nbt":"text","entity":"@e[tag=trackselect-multi-text,limit=1]","interpret":true},{"text":", 엔진: ","color":"yellow"},{"score":{"name":"@s","objective":"kart-engine"}},{"text":", 카트: ","color":"yellow"},{"nbt":"kart","storage":"adai_record","interpret":true},{"text":", 기록: ","color":"yellow"},{"nbt":"multi-record[0]","storage":"timermain","interpret":true},{"nbt":"multi-record-subtick[0]","storage":"timermain","interpret":false}]

execute if score team-battle multi-main matches 0 as @a if score @s multi-rank = #rank-print-temp multi-rank run tellraw @a [{"score":{"name":"#rank-print-temp","objective":"multi-rank","color":"yellow"},"color":"yellow"},{"text":"등 ","color":"yellow"}, {"selector":"@s","color":"aqua"},{"text":" | ","color":"yellow"},{"nbt":"multi-record[0]","storage":"timermain","interpret":true},{"nbt":"multi-record-subtick[0]","color":"yellow","storage":"timermain","interpret":false}]
execute if score team-battle multi-main matches 1 as @a if score @s multi-rank = #rank-print-temp multi-rank run function multiplay:system/game/team-rank

data remove storage minecraft:timermain multi-record[0]

execute if score #rank-print-temp multi-rank < #max-rank multi-rank run function multiplay:system/game/printrank