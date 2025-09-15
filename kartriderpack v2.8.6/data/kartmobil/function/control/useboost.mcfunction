playsound minecraft:entity.blaze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75 1
playsound minecraft:entity.firework_rocket.launch neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75 1

#뭐하누~ 으하하하
execute if entity @s[tag=dog,distance=..0.3] at @p[tag=kartpassenger,distance=..0.3] run playsound minecraft:entity.wolf.ambient neutral @a[tag=kart-listener] ~ ~ ~ 1 1 1
execute if entity @s[tag=cow,distance=..0.3] at @p[tag=kartpassenger,distance=..0.3] as @e[limit=3] run playsound minecraft:entity.cow.ambient neutral @a[tag=kart-listener] ~ ~ ~ 1 1.25 1

execute rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 2 10 normal @a[tag=kart-listener]
execute rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 0 run particle minecraft:cloud ^ ^1 ^2 .25 .25 .25 0.75 8 normal @a[tag=kart-listener]

#부스터 시간(카트 성능의 부스터시간 대입)
scoreboard players operation @s kartboosttime = @s kartboostduration
scoreboard players remove @s kartboostcount 1
