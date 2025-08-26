execute if score #kartspeed kartmove matches ..12 run playsound minecraft:block.note_block.guitar neutral @a[tag=kart-listener] ~ ~ ~ 0.5 0.5

execute if score #kartspeed kartmove matches 13.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.guitar neutral @a[tag=kart-listener] ~ ~ ~ 0.3 0.5
execute if score #kartspeed kartmove matches 19.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.guitar neutral @a[tag=kart-listener] ~ ~ ~ 0.3 0.6
execute if score #kartspeed kartmove matches 32.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.guitar neutral @a[tag=kart-listener] ~ ~ ~ 0.3 0.7
execute if score #kartspeed kartmove matches 52.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.guitar neutral @a[tag=kart-listener] ~ ~ ~ 0.3 0.8

#fov 조절용
scoreboard players operation #kartspeedtemp kartmove = #kartspeed kartmove
execute on passengers if score @s[tag=kartdirection] kartmove matches 1.. run scoreboard players operation #kartspeedtemp kartmove += @s kartmove
execute store result storage kartmain kartspeedfov float 0.0006 run scoreboard players get #kartspeedtemp kartmove

#엔진음 조절용
execute on passengers if score @s[tag=kartdirection] kartmove matches 1.. run scoreboard players operation #kartspeedtemp kartmove -= @s kartmove
execute if score #kartspeedtemp kartmove matches 192.. run scoreboard players set #kartspeedtemp kartmove 192
execute store result storage kartmain kartsound float 0.009 run scoreboard players add #kartspeedtemp kartmove 30

execute if score #kartspeed kartmove matches 1.. run function kartmobil:soundandfov/jiu/soundmacro with storage kartmain
function kartmobil:soundandfov/speedfov with storage kartmain