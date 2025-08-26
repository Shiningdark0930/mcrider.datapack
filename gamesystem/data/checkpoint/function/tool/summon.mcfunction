summon marker ~ ~ ~ {Tags:["check-point","check-temp"]}


scoreboard players reset check-summon-max check-num

execute as @e[tag=check-point,tag=!check-temp,distance=..200] run scoreboard players operation check-summon-max check-num > @s check-num
execute as @e[tag=check-point,tag=!check-temp,distance=..200] if score check-summon-max check-num = @s check-num run scoreboard players operation @n[tag=check-temp] check-num = @s check-num

scoreboard players add @n[tag=check-temp] check-num 1

tag @e[tag=check-temp,type=marker] remove check-temp