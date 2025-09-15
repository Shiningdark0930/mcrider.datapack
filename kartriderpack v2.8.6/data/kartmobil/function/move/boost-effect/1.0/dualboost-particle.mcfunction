#바람이펙트
execute if score @s kartboosttime matches 25 rotated as @n[distance=..0.00001,tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 force @a
execute if score @s kartboosttime matches 19 rotated as @n[distance=..0.00001,tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 force @a
execute if score @s kartboosttime matches 13 rotated as @n[distance=..0.00001,tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 force @a
execute if score @s kartboosttime matches 7 rotated as @n[distance=..0.00001,tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 force @a
execute if score @s kartboosttime matches 1 rotated as @n[distance=..0.00001,tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 force @a

playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 0.5 1 0.5