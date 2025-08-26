execute unless entity @a[scores={timecount=1..}] run tellraw @a[distance=..50] [{"text":"아무도 ","color":"red"},{"text":"타임어택","color":"aqua"},{"text":"을 플레이하지 않습니다.","color":"red"}]
execute unless entity @a[scores={timecount=1..}] run return 1


tag @s add timeattack-spectator
scoreboard players reset @s multi-shift
gamemode spectator @s

scoreboard players set @s multi-spectate-time 0

function bgm-room:manage-bgm/playbgm with entity @n[tag=trackselect-timeattack-marker] data.track

function timeattack:system/spectator/spectate-target
execute if entity @p[scores={timecount=1..},nbt={active_effects:[{id:"minecraft:night_vision"}]}] run effect give @s minecraft:night_vision infinite 1 true
