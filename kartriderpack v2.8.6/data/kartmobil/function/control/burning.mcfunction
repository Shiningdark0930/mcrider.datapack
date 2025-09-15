execute if entity @s[tag=!kart-stop] if score @s kartboostgaugecharge matches 1.. run scoreboard players add @s kartboostgauge 30

playsound minecraft:block.fire.extinguish neutral @a[tag=kart-listener] ~ ~ ~ 0.1 1
playsound minecraft:entity.rabbit.death neutral @a[tag=kart-listener] ~ ~ ~ 0.5 0.75 0.5
playsound minecraft:entity.axolotl.hurt neutral @a[tag=kart-listener] ~ ~ ~ 0.15 1.75 0.15

execute rotated as @n[tag=kartdirection] rotated ~ 0 positioned ^0.5 ^0.1 ^-0.5 run particle minecraft:campfire_cosy_smoke ^ ^ ^ 0 0 0 0 1
execute rotated as @n[tag=kartdirection] rotated ~ 0 positioned ^-0.5 ^0.1 ^-0.5 run particle minecraft:campfire_cosy_smoke ^ ^ ^ 0 0 0 0 1

execute if score @s kartmove matches ..1000 run scoreboard players set @s kartmove 999

