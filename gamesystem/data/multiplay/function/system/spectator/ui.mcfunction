tag @s add spectator-self
execute as @a[tag=kart-multi-player] if score @s multi-spectator-id = @n[tag=spectator-self] multi-spectator-id run tag @s add spectator-target-temp

#보스바로 대체
#execute if entity @a[tag=spectator-target-temp] run title @s actionbar [{"text":"나가기[","color":"yellow"},{"keybind":"key.sneak","color":"aqua"},{"text":"]","color":"yellow"},{"text":" | ","color":"yellow"},{"selector":"@n[tag=spectator-target-temp]","color":"aqua"},{"text":"[","color":"aqua"},{"score":{"name":"@n[tag=spectator-target-temp]","objective":"multi-instant-rank"},"color":"aqua"},{"text":"위] ","color":"aqua"},{"text":" | ","color":"yellow"},{"text":"대상 변경[","color":"yellow"},{"keybind":"key.forward","color":"aqua"},{"text":" / ","color":"aqua"},{"keybind":"key.back","color":"aqua"},{"text":"]","color":"yellow"}]

#만약 플레이어가 없다면
execute if score @s multi-spectate-time matches ..0 unless entity @a[tag=spectator-target-temp] run scoreboard players operation @s multi-spectator-id = @r[tag=kart-multi-player] multi-spectator-id
execute if score @s multi-spectate-time matches ..0 unless entity @a[tag=spectator-target-temp] run function multiplay:system/spectator/spectate-target

tag @s remove spectator-self
tag @a[tag=spectator-target-temp] remove spectator-target-temp


