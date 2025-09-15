playsound minecraft:entity.rabbit.death neutral @a[tag=kart-listener] ~ ~ ~ 0.5 0.75 0.5
playsound minecraft:entity.axolotl.hurt neutral @a[tag=kart-listener] ~ ~ ~ 0.15 1.75 0.15
execute on passengers as @s[tag=kartmodelsaddle,type=item_display] on passengers as @s[tag=drift-effect,type=#kartmobil:kartmodels] run data modify entity @s view_range set value 1f

#파티클
# scoreboard players operation #kartdriftparticle kartmain = @s kartmove

tag @a[distance=..0.3] add kartskidshow
tag @a[tag=kart-listener] add kartskidshow

execute store result storage minecraft:kartmain kartdriftparticle byte 0.00002 run scoreboard players get @s kartmove
execute unless score @s kart-engine matches 7 if score #kartspeed kartmove matches 25.. if entity @s[tag=!kartbike] run function kartmobil:move/steer/skidparticle/kart-macro with storage minecraft:kartmain
execute unless score @s kart-engine matches 7 if score #kartspeed kartmove matches 25.. if entity @s[tag=kartbike] run function kartmobil:move/steer/skidparticle/bike-macro with storage minecraft:kartmain

tag @a[tag=kartskidshow] remove kartskidshow