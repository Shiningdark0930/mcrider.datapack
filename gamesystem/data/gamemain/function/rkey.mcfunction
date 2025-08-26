execute as @n[tag=multi-spectator,distance=..10] at @s run function multiplay:system/spectator/spectate-target
execute as @n[tag=timeattack-spectator,distance=..10] at @s run function timeattack:system/spectator/spectate-target
execute as @n[tag=dev-attack-spectator,distance=..10] at @s run function devbattle:system/spectator/spectate-target
execute as @n[tag=updown-spectator,distance=..10] at @s run function updown:system/spectator/spectate-target

execute on vehicle on vehicle run tag @s add mykart

tag @s add kart-return-temp

#체크포인트로 이동
execute as @e[tag=check-point,type=marker] if score @s check-num = @p[tag=kart-return-temp] check-num run tag @s add kart-return-check
execute as @e[tag=check-point,type=marker] if score @s check-num = @p[tag=kart-return-temp] check-next run tag @s add kart-return-check-next

execute positioned as @n[tag=kart-return-check] run tp @n[tag=mykart,type=item_display] ~ ~ ~
execute positioned as @n[tag=mykart,type=item_display] run rotate @n[tag=kartdirection,type=marker] facing entity @n[tag=kart-return-check-next]
execute rotated as @n[tag=kartdirection,type=marker] run rotate @p[tag=kart-return-temp] ~ 20

tag @s remove kart-return-temp
tag @e[tag=kart-return-check] remove kart-return-check
tag @e[tag=kart-return-check-next] remove kart-return-check-next

#효과
scoreboard players set @n[tag=mykart,type=item_display] kartcollisiontime 50

scoreboard players set @n[tag=mykart,type=item_display] kartmove 0
scoreboard players add @n[tag=mykart,type=item_display] kartboostgauge 1500

function rkey:play

#/summon minecraft:marker ~ ~ ~ {Tags:["kartreturnpoint"]}

execute on vehicle on vehicle run tag @s remove mykart