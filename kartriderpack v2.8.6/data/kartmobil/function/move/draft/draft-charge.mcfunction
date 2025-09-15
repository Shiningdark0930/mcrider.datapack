scoreboard players add @s kartmain 1
execute if score @s kartmain matches 1.. run particle minecraft:crit ~ ~1 ~ .3 .3 .3 1 1 normal @a[distance=..15]

#충전 쿨타임 줄이기
execute if score @s kartmain matches 1 run scoreboard players set @s kartmain 9

execute if score @s kartmain matches 9 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0
execute if score @s kartmain matches 16 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0.6
execute if score @s kartmain matches 23 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0.7
execute if score @s kartmain matches 29 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0.8
execute if score @s kartmain matches 35 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0.9

execute if score @s kartmain matches 40 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1
execute if score @s kartmain matches 45 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1.1
execute if score @s kartmain matches 48 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1.2
execute if score @s kartmain matches 50 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1.3
execute if score @s kartmain matches 52 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1.4
execute if score @s kartmain matches 54 run playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.75 1.5

execute if score @s kartmain matches 59.. run function kartmobil:move/draft/draft-accel
