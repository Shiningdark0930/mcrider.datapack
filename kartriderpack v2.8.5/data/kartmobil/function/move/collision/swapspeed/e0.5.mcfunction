scoreboard players operation #kart-speed-a kartmove = @n[tag=carA] kartmove
scoreboard players operation #kart-speed-b kartmove = @n[tag=carB] kartmove

# v1 = 0.25v1 + 0.75v2
execute store result storage minecraft:kartmain kart-collision-1 int 0.25 run scoreboard players get #kart-speed-a kartmove
execute store result storage minecraft:kartmain kart-collision-2 int 0.75 run scoreboard players get #kart-speed-b kartmove

execute store result score #kart-speed-1 kartmove run data get storage minecraft:kartmain kart-collision-1
execute store result score #kart-speed-2 kartmove run data get storage minecraft:kartmain kart-collision-2

scoreboard players operation #kart-speed-1 kartmove += #kart-speed-2 kartmove
scoreboard players operation @n[tag=carA] kartmove = #kart-speed-1 kartmove

# v2 = 0.75v1 + 0.25v2
execute store result storage minecraft:kartmain kart-collision-1 int 0.75 run scoreboard players get #kart-speed-a kartmove
execute store result storage minecraft:kartmain kart-collision-2 int 0.25 run scoreboard players get #kart-speed-b kartmove

execute store result score #kart-speed-1 kartmove run data get storage minecraft:kartmain kart-collision-1
execute store result score #kart-speed-2 kartmove run data get storage minecraft:kartmain kart-collision-2

scoreboard players operation #kart-speed-1 kartmove += #kart-speed-2 kartmove
scoreboard players operation @n[tag=carB] kartmove = #kart-speed-1 kartmove
