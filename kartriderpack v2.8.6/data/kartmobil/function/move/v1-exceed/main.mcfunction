xp set @p[tag=kartpassenger,distance=..0.3] 40 levels

#익시드 최고 600, 부스터를 안 쓰면 충전 가속
execute if score #kartspeed kartmove matches 50.. if entity @s[tag=!kart-exceed-active] unless score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 6000.. run scoreboard players add @p[tag=kartpassenger,distance=..0.3] kartboostgauge 8
execute if score #kartspeed kartmove matches 50.. if entity @s[tag=!kart-exceed-active] unless score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 6000.. unless score @s kartboosttime matches 1.. run scoreboard players add @p[tag=kartpassenger,distance=..0.3] kartboostgauge 6

#게이지
execute store result storage minecraft:kartmain exceedgauge int 0.0333 run scoreboard players get @p[tag=kartpassenger,distance=..0.3] kartboostgauge
function kartmobil:move/v1-exceed/gauge with storage minecraft:kartmain

#발동
execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 1800..1814 if entity @s[tag=!kart-exceed-active] run function kartmobil:move/v1-exceed/can-use
execute unless score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 1800.. if entity @s[tag=!kart-exceed-active,tag=kart-space-press] run function kartmobil:move/v1-exceed/cant-use
execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 1800.. if entity @s[tag=kart-space-press] run function kartmobil:move/v1-exceed/start-use

#익시드 가속
execute if entity @s[tag=kart-exceed-active] run function kartmobil:move/v1-exceed/using