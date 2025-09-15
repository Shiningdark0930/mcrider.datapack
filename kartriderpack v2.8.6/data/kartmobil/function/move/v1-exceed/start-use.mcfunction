playsound minecraft:item.elytra.flying neutral @a[tag=kart-listener] ~ ~ ~ 1 1
playsound minecraft:item.elytra.flying neutral @a[tag=kart-listener] ~ ~ ~ 1 1.25
playsound minecraft:item.elytra.flying neutral @a[tag=kart-listener] ~ ~ ~ 1 1.5

execute unless score @s kartmain matches 60..80 run scoreboard players add @s kartmove 1325

tag @s add kart-exceed-active

