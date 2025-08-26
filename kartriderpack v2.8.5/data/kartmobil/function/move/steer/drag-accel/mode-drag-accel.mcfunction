#execute if score @s[tag=drag-accel] kartdrifttime matches 10.. run scoreboard players add @s kartmove 100

#execute if score @s[tag=drag-accel] kartdrifttime matches 13.. run function kartmobil:move/steer/drag-accel/drift-accel
#execute if score @s[tag=drag-accel] kartdrifttime matches 16.. run function kartmobil:move/steer/drag-accel/drift-accel
#execute if score @s[tag=drag-accel] kartdrifttime matches 19.. run function kartmobil:move/steer/drag-accel/drift-accel
#execute if score @s[tag=drag-accel] kartdrifttime matches 22.. run function kartmobil:move/steer/drag-accel/drift-accel
#execute if score @s[tag=drag-accel] kartdrifttime matches 25.. run function kartmobil:move/steer/drag-accel/drift-accel

execute if score @s kartdrifttime matches 6.. run scoreboard players add @s kartmove 100

execute if score @s kartdrifttime matches 8.. run function kartmobil:move/steer/drag-accel/drift-accel
execute if score @s kartdrifttime matches 9.. run scoreboard players add @s kartmove 20
execute if score @s kartdrifttime matches 10.. run function kartmobil:move/steer/drag-accel/drift-accel
execute if score @s kartdrifttime matches 11.. run scoreboard players add @s kartmove 20
execute if score @s kartdrifttime matches 12.. run function kartmobil:move/steer/drag-accel/drift-accel
