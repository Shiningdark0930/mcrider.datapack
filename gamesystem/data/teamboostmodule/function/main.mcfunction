#부지 -1 한 값 설정
execute unless score @s kart-teamboost = @s kart-teamboost run function teamboostmodule:set-boost-time

#팀 부스터
execute if score @s[tag=!kart-using-teamboost] kartboosttime = @s kart-teamboost on passengers if entity @s[tag=kartsaddle] on passengers if items entity @s weapon.mainhand minecraft:soul_campfire on vehicle on vehicle run function teamboostmodule:use-teamboost
execute if entity @s[tag=kart-using-teamboost] if score @s kart-teamboost-repeat-count matches ..2 run function teamboostmodule:using-teamboost
execute if score @s[tag=kart-using-teamboost] kartboosttime matches 0 run tag @s remove kart-using-teamboost

execute if entity @s[tag=kart-using-teamboost] run particle minecraft:soul_fire_flame ~ ~ ~ .75 .75 .75 0 1 normal @a[distance=..10]

#팀 부스터 게이지 채우기
execute if score @s[tag=!kart-drifting] kart-teamboost-gauge matches 1.. run function teamboostmodule:charge-teamboost-gauge
