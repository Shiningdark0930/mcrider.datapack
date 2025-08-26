execute unless score #kartangle kartmain matches -800..800 run return 0

execute if score @s kartdrifttime matches 10.. run scoreboard players add @s kartmove 120
execute if score @s kartdrifttime matches 14.. unless score #kartangle kartmain matches -250..250 run function kartmobil:move/steer/drag-accel/drift-accel