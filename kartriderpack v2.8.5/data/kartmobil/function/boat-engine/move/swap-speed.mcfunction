scoreboard players operation #temp boat-move-x = @n[tag=carA] boat-move-x
scoreboard players operation @n[tag=carA] boat-move-x = @n[tag=carB] boat-move-x
scoreboard players operation @n[tag=carB] boat-move-x = #temp boat-move-x

scoreboard players operation #temp boat-move-z = @n[tag=carA] boat-move-z
scoreboard players operation @n[tag=carA] boat-move-z = @n[tag=carB] boat-move-z
scoreboard players operation @n[tag=carB] boat-move-z = #temp boat-move-z


scoreboard players set @s kartcollisiontime 8
scoreboard players set @n[tag=carB,type=item_display] kartcollisiontime 8