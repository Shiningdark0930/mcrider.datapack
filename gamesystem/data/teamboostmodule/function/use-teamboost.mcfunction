tag @s add kart-using-teamboost

scoreboard players set @s kart-teamboost-repeat-count 0
scoreboard players add @s kartboosttime 8

execute on passengers if entity @s[tag=kartsaddle] on passengers run clear @s minecraft:soul_campfire 1
