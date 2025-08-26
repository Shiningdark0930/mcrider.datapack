execute on vehicle if entity @s[scores={kart-engine=1005..1006},type=item_display] run return 1

#fov 당기기
scoreboard players add @n[tag=kartdirection] kartmove 4

#메인
execute if score @s startboosttime matches 25.. run scoreboard players set @s startboosttime 19

#고스트 출부
execute if score @s startboosttime matches 19 as @n[tag=kartmobil] unless score @s kart-engine matches 4 run scoreboard players set @s kartcollisiontime 8
execute if score @s startboosttime matches 19 as @n[tag=kartmobil] if score @s kart-engine matches 4 run scoreboard players set @s kartcollisiontime 41

execute if score @s startboosttime matches 19 rotated ~ 0 run playsound minecraft:entity.blaze.shoot neutral @a[distance=..0.3] ~ ~ ~ 1 0.75
execute if score @s startboosttime matches 19 rotated ~ 0 run playsound minecraft:entity.firework_rocket.launch neutral @a[distance=..0.3] ~ ~ ~ 1 0.75
execute if score @s startboosttime matches 19 rotated ~ 0 run playsound minecraft:entity.breeze.shoot neutral @a[distance=..0.3] ~ ~ ~ 1 0 1
execute if score @s startboosttime matches 19 rotated ~ 0 run playsound minecraft:entity.breeze.hurt neutral @a[distance=..0.3] ~ ~ ~ 1 0 1

execute if score @s startboosttime matches 19 rotated ~ 0 run particle minecraft:crit ^ ^1 ^2 .25 .25 .25 1.25 25 normal @a[distance=..5]
execute if score @s startboosttime matches 19 rotated ~ 0 run particle minecraft:cloud ^ ^1 ^2 .25 .25 .25 0.75 10 normal @a[distance=..5]

#바람이펙트
execute if score @s startboosttime matches 19 rotated ~ 0 run particle minecraft:crit ^ ^1 ^1 .25 .25 .25 2 25 normal @a[distance=..5]
execute if score @s startboosttime matches 17 rotated ~ 0 run particle minecraft:crit ^ ^1 ^1 .25 .25 .25 2 25 normal @a[distance=..5]

execute if score @s startboosttime matches 19 rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 normal @a[distance=..5]
execute if score @s startboosttime matches 13 rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 normal @a[distance=..5]
execute if score @s startboosttime matches 7 rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 normal @a[distance=..5]
execute if score @s startboosttime matches 1 rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 25 normal @a[distance=..5]

execute if score @s startboosttime matches 19 rotated ~ 0 run particle minecraft:gust ^ ^1 ^3 .75 .75 .75 10 1 normal @a[distance=..5]
execute if score @s startboosttime matches 13 rotated ~ 0 run particle minecraft:gust ^ ^1 ^3 .75 .75 .75 10 1 normal @a[distance=..5]
execute if score @s startboosttime matches 7 rotated ~ 0 run particle minecraft:gust ^ ^1 ^3 .75 .75 .75 10 1 normal @a[distance=..5]
execute if score @s startboosttime matches 1 rotated ~ 0 run particle minecraft:gust ^ ^1 ^3 .75 .75 .75 10 1 normal @a[distance=..5]

execute at @a[limit=1,sort=arbitrary,distance=..0.3] run playsound minecraft:entity.blaze.shoot neutral @a[distance=..0.3] ~ ~ ~ 0.5 1 0.5

#출부 가속(A2는 적용되지 않음)
execute as @n[tag=kartmobil] unless score @s kart-engine matches 6 unless score @s kart-engine matches 8 run scoreboard players operation @s kartmove += @s kartaccel
execute as @n[tag=kartmobil] if score @s kart-engine matches 8 if score @s startboosttime matches 13.. run scoreboard players set @s kartmove 0

execute if score @s startboosttime matches 1.. run scoreboard players remove @s startboosttime 1



