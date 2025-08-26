tag @s add a2-using-instant-boost

scoreboard players add @s kartmove 250
scoreboard players set @s kartboosttime 10

execute if score @s kart-engine matches 6 as @e[limit=3] run playsound minecraft:entity.firework_rocket.launch neutral @a[tag=kart-listener] ~ ~ ~ 1 1.5
execute if score @s kart-engine matches 6 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 1 1
execute if score @s kart-engine matches 6 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75 1
execute if score @s kart-engine matches 6 run playsound minecraft:entity.firework_rocket.launch neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75 1

execute if score @s kart-engine matches 8 as @e[limit=2] run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 1.3 1.3 1
execute if score @s kart-engine matches 8 run playsound minecraft:entity.breeze.jump neutral @a[tag=kart-listener] ~ ~ ~ 2 0.7 1

execute rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 50 force @a[tag=kart-listener]
execute rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 0 run particle minecraft:cloud ^ ^1 ^2 .25 .25 .25 0.75 20 force @a[tag=kart-listener]
execute rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 0 run particle minecraft:cloud ^ ^1 ^2 .25 .25 .25 0.75 10 force @a[tag=!kart-listener]

execute on passengers run scoreboard players reset @s[tag=kartdirection] kartdrifttime
