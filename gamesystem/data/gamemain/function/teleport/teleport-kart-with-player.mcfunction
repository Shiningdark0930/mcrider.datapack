execute as @n[tag=multi-spectator,distance=..10] at @s run function multiplay:system/spectator/spectate-target
execute as @n[tag=timeattack-spectator,distance=..10] at @s run function timeattack:system/spectator/spectate-target
execute as @n[tag=dev-attack-spectator,distance=..10] at @s run function devbattle:system/spectator/spectate-target
execute as @n[tag=updown-spectator,distance=..10] at @s run function updown:system/spectator/spectate-target

execute on passengers if entity @s[tag=kartsaddle] on passengers run tag @s add kartplayertemp

$execute as @a[tag=kartplayertemp] at @s run rotate @s $(xrot) $(yrot)
$execute at @s rotated $(xrot) $(yrot) on passengers run rotate @s[tag=kartdirection] ~ ~

$tp @s $(x) $(y) $(z)

execute at @s run playsound minecraft:entity.enderman.teleport weather @a[tag=kartplayertemp] ~ ~ ~ 1 1 1

tag @a[tag=kartplayertemp] add needsync
tag @a[tag=kartplayertemp] remove kartplayertemp



scoreboard players add @s kartboostgauge 2000
scoreboard players set @s kartcollisiontime 20