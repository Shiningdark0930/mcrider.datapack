#게이지 초기화
scoreboard players set @s kartboostgauge 0

#치이익(태우면 40% 회복)
execute unless score @s kart-engine matches 7 if score @s kartboostcount >= @s kartmaxboostcount at @a[tag=kartpassenger] run playsound minecraft:block.fire.extinguish neutral @a[tag=kart-listener] ~ ~ ~ 1 2 1
execute unless score @s kart-engine matches 7 if score @s kartboostcount >= @s kartmaxboostcount run scoreboard players add @s kartboostgauge 800

#획득
execute unless score @s kartboostcount >= @s kartmaxboostcount run scoreboard players add @s kartboostcount 1