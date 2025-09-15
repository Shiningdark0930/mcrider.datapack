playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0
playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1
playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0
playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1
playsound minecraft:entity.firework_rocket.launch neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1
playsound minecraft:entity.firework_rocket.launch neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1

scoreboard players add @s kartmove 2550

execute if score @s kart-engine matches 2 run scoreboard players add @s kartmove 200
execute if score @s kart-engine matches 5 run scoreboard players remove @s kartmove 300
execute if score @s kart-engine matches 9 run scoreboard players add @s kartmove 200

execute if score @s kart-engine matches 1005 run scoreboard players remove @s kartmove 1550

#익시드를 먼저쓰고 드랲을 받으면
execute if score @s kart-engine matches 5 run scoreboard players remove @s[tag=kart-exceed-active] kartmove 1325

execute on passengers rotated as @s[tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:crit ~ ~1 ~ .25 .25 .25 1.25 25 normal @a[distance=..15]