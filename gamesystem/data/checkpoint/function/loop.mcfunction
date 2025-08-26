scoreboard players add 10tick check-prev 1
execute if score 10tick check-prev matches 20.. run scoreboard players set 10tick check-prev 0

execute as @a[tag=check-editor] at @s run function checkpoint:tool/main
