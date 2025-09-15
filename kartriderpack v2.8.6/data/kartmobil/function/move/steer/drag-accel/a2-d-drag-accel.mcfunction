execute unless score #kartangle kartmain matches -600..600 run return 0

execute if score @s kartdrifttime matches 6.. run scoreboard players add @s kartmove 100

execute if score @s[tag=!drag-accel] kartdrifttime matches 8.. run function kartmobil:move/steer/drag-accel/drift-accel
execute if score @s kartdrifttime matches 9.. run scoreboard players add @s kartmove 12
execute if score @s[tag=!drag-accel] kartdrifttime matches 10.. run function kartmobil:move/steer/drag-accel/drift-accel
execute if score @s kartdrifttime matches 11.. run scoreboard players add @s kartmove 15
execute if score @s[tag=!drag-accel] kartdrifttime matches 12.. run function kartmobil:move/steer/drag-accel/drift-accel