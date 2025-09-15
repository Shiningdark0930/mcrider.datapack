
#벽
execute unless score @s kart-engine matches 7 if function kartmobil:move/movetp/wallcollision/condition run playsound minecraft:block.grindstone.use neutral @a[tag=kart-listener] ~ ~ ~ 0.4 2
execute unless score @s kart-engine matches 7 if function kartmobil:move/movetp/wallcollision/condition run particle flame ^ ^ ^0.4 .04 .04 .04 0.1 1 normal @a[tag=kart-listener]

#기어엔진 벽감속
execute if score @s kart-engine matches 1005 if function kartmobil:move/movetp/wallcollision/condition run scoreboard players remove @s kartmove 20

execute if entity @s[tag=wall-crash] unless score @s kartcollisiontime matches 1.. if function kartmobil:move/movetp/wallcollision/condition run function kartmobil:move/movetp/wallcollision/wall-crash
execute if function kartmobil:move/movetp/wallcollision/condition positioned ^ ^ ^-0.1 run function kartmobil:move/movetp/wallcollision/loop
