playsound block.note_block.didgeridoo neutral @a[tag=kart-listener] ~ ~ ~ 0.75 0.5

execute if score #kartspeed kartmove matches 13.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.didgeridoo neutral @a[tag=kart-listener] ~ ~ ~ 0.825 0.5 0.5
execute if score #kartspeed kartmove matches 19.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.didgeridoo neutral @a[tag=kart-listener] ~ ~ ~ 0.825 0.6 0.5
execute if score #kartspeed kartmove matches 32.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.didgeridoo neutral @a[tag=kart-listener] ~ ~ ~ 0.825 0.7 0.5
execute if score #kartspeed kartmove matches 52.. at @a[tag=kartpassenger] run playsound minecraft:block.note_block.didgeridoo neutral @a[tag=kart-listener] ~ ~ ~ 0.825 0.8 0.5

#fov 조절용
scoreboard players operation #kartspeedtemp kartmove = @s kartboostgauge

execute store result storage minecraft:kartmain gear-speed int 0.096 run scoreboard players get #kartspeedtemp kartmove
execute store result score #kartspeedtemp kartmove run data get storage minecraft:kartmain gear-speed
execute store result storage kartmain kartspeedfov float 0.0006 run scoreboard players get #kartspeedtemp kartmove

#엔진음 조절용
execute if score #kartspeedtemp kartmove matches 185.. run scoreboard players set #kartspeedtemp kartmove 185
execute store result storage kartmain kartsound float 0.00701 run scoreboard players add #kartspeedtemp kartmove 100

execute if score #kartspeed kartmove matches 1.. run function kartmobil:soundandfov/rally/soundmacro with storage kartmain
function kartmobil:soundandfov/speedfov with storage kartmain



