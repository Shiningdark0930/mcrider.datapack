execute if score @s kartmove matches ..1000 run scoreboard players reset @s[tag=kartdirection,scores={kartdrifttime=1..}] kartdrifttime

execute on passengers run scoreboard players remove @s[tag=kartdirection,scores={kartdrifttime=1..}] kartdrifttime 1

#순부 사용
execute if entity @s[tag=kart-w-press] on passengers if score @s[tag=kartdirection] kartdrifttime matches 1.. if score floor-distance kartmain matches ..2 on vehicle run function kartmobil:move/instant-boost/use
execute if entity @s[tag=a2-using-instant-boost] if score @s kartboosttime matches 1.. if score @s kart-engine matches 6 run scoreboard players add @s kartmove 350
execute if entity @s[tag=a2-using-instant-boost] if score @s kartboosttime matches 1.. if score @s kart-engine matches 8 run scoreboard players add @s kartmove 65

#순부 시 FOV 과장(a2) / direction의 kartmove
execute if entity @s[tag=a2-using-instant-boost] if score @s kartboosttime matches 1.. if score @s kart-engine matches 6 on passengers unless score @s[tag=kartdirection] kartmove matches 25.. run scoreboard players add @s kartmove 1
execute if entity @s[tag=a2-using-instant-boost] if score @s kartboosttime matches 5.. if score @s kart-engine matches 6 on passengers unless score @s[tag=kartdirection] kartmove matches 25.. run scoreboard players add @s kartmove 2

#순부 쿨타임 게이지
xp set @p[tag=kartpassenger,distance=..0.3] 40 levels
execute on passengers store result storage minecraft:kartmain instantgauge int 10.5 if entity @s[tag=kartdirection] run scoreboard players get @s kartdrifttime
function kartmobil:move/instant-boost/gauge with storage minecraft:kartmain
