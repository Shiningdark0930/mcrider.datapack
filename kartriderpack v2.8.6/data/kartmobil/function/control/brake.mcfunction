#충돌 중이 아닐때 브레이크
execute unless score @s kartcollisiontime matches 5..8 run scoreboard players remove @s kartmove 1000

execute if score @s kartmove matches ..-1 run scoreboard players set @s kartmove 0

#부스탑(번아웃)
execute unless score @s kart-engine matches 7 unless score @s kart-engine matches 1003 if entity @p[tag=kartpassenger,predicate=kartmobil:w] run function kartmobil:control/burning