execute on passengers if entity @s[tag=kartsaddle] on passengers run tag @s add kart-passenger-temp

scoreboard players operation #boostcount kart-teamboost = @s kartboostcount
execute store result score #teamboostcount kart-teamboost run clear @p[tag=kart-passenger-temp] minecraft:soul_campfire 0

scoreboard players operation #boostcount kart-teamboost -= #teamboostcount kart-teamboost

execute store result storage minecraft:kartmain teamboostcount int 1 run scoreboard players get #boostcount kart-teamboost
execute as @p[tag=kart-passenger-temp] run function teamboostmodule:team/get-teamboost-macro with storage kartmain

tag @a[tag=kart-passenger-temp] remove kart-passenger-temp