scoreboard players add #pre multi-main 1
execute if score #pre multi-main matches 1 run execute as @a at @s run playsound minecraft:entity.arrow.hit_player master @s ~ ~ ~ 2 0.5
execute if score #pre multi-main matches 1 run tellraw @a {color:aqua,text:"게임 로딩 중!"}
execute if score #pre multi-main matches 2 run save-all

execute if score #pre multi-main matches 5.. run function multiplay:system/gameready/gamestart