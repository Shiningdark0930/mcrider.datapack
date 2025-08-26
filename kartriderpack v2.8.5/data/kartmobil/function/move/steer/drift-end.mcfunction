tag @s remove kart-drifting

#A2 - 순부 쿨타임
execute if score @s kartdrifttime matches 8.. if score @s kart-engine matches 6 on passengers run scoreboard players set @s[tag=kartdirection] kartdrifttime 20
execute if score @s kartdrifttime matches 8.. if score @s kart-engine matches 8 on passengers run scoreboard players set @s[tag=kartdirection] kartdrifttime 20

scoreboard players set @s kartdrifttime 0

#팀부 게이지 채우기
scoreboard players operation #temp kart-teamboost-gauge = @s kart-teamboost-gauge
scoreboard players operation @s kart-teamboost-gauge = @s kartboostgauge
scoreboard players operation @s kart-teamboost-gauge -= #temp kart-teamboost-gauge

execute on passengers as @s[tag=kartmodelsaddle,type=item_display] on passengers as @s[tag=drift-effect] run data modify entity @s view_range set value 0f