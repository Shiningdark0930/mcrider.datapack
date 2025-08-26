execute if score @s kart-engine matches 7 run function kartmobil:control/boost-gauge/1.0-main
execute if score @s kart-engine matches 1003 run function kartmobil:control/boost-gauge/mario-main
execute unless score @s kart-engine matches 7 unless score @s kart-engine matches 1003 run function kartmobil:control/boost-gauge/main

#페달조작
execute if entity @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] run function kartmobil:control/accel
execute if entity @p[tag=kartpassenger,predicate=kartmobil:s,distance=..0.3] run function kartmobil:control/brake

#전진 키 이벤트
tag @s remove kart-w-press
tag @s remove kart-w-release
execute if entity @s[tag=kart-w-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:w,distance=..0.3] run tag @s add kart-w-release
execute if entity @s[tag=kart-w-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:w,distance=..0.3] run tag @s remove kart-w-pressed
execute if entity @s[tag=!kart-w-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] run tag @s add kart-w-press
execute if entity @s[tag=!kart-w-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] run tag @s add kart-w-pressed

#부스터 키 이벤트
tag @s remove kart-boost-press
execute if entity @s[tag=kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:a,predicate=!kartmobil:d,distance=..0.3] run tag @s remove kart-boost-pressed
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:a,distance=..0.3] run tag @s add kart-boost-press
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:d,distance=..0.3] run tag @s add kart-boost-press
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:a,distance=..0.3] run tag @s add kart-boost-pressed
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:d,distance=..0.3] run tag @s add kart-boost-pressed

#드리프트 키 이벤트
tag @s remove kart-space-press
tag @s remove kart-space-release

execute if entity @s[tag=kart-space-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:space,distance=..0.3] run tag @s add kart-space-release
execute if entity @s[tag=kart-space-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:space,distance=..0.3] run tag @s remove kart-space-pressed
execute if entity @s[tag=!kart-space-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:space,distance=..0.3] run tag @s add kart-space-press
execute if entity @s[tag=!kart-space-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:space,distance=..0.3] run tag @s add kart-space-pressed

#키보드 엔진들
execute if score @s kart-engine matches 1002 run function kartmobil:control/wasd-control/main
execute if score @s kart-engine matches 1003 run function kartmobil:control/wasd-control/mariokart

#A2 - 앞키를 떼는 순간의 감속을 최소화
execute if score @s kart-engine matches 6 unless entity @a[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] on passengers if score @s[tag=kartdirection] kartdrifttime matches 15.. on vehicle run function kartmobil:control/accel

#EX - 부스터 바로 사용
execute if score @s kart-engine matches 1 if entity @s[tag=kart-boost-press] if score @s kartboostcount matches 1.. run scoreboard players set @s kartboosttime 0
execute if score @s kart-engine matches 1 if entity @s[tag=kart-boost-press] if score @s kartboostcount matches 1.. run function kartmobil:move/boost-effect/force-cut-boost

#부스터 사용
scoreboard players remove @p[tag=kartpassenger,distance=..0.3,scores={kartboosttime=1..}] kartboosttime 1

execute if entity @s[tag=kart-w-press] on passengers if score @s[tag=kartdirection] kartdrifttime matches 1.. run return 1
execute if score @s kartboosttime matches ..0 if score @s kartmove matches 800.. if score @s kartboostcount matches 1.. rotated as @p[tag=kartpassenger,predicate=kartmobil:w,predicate=kartmobil:a,distance=..0.3,scores={kartboosttime=..0}] run function kartmobil:control/useboost
execute if score @s kartboosttime matches ..0 if score @s kartmove matches 800.. if score @s kartboostcount matches 1.. rotated as @p[tag=kartpassenger,predicate=kartmobil:w,predicate=kartmobil:d,distance=..0.3,scores={kartboosttime=..0}] run function kartmobil:control/useboost

#부스터 자동 사용
execute if score @s kart-engine matches 1002 if score @s kartboosttime matches ..0 if score @s kartmove matches 800.. if score @s kartboostcount matches 1.. rotated as @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3,scores={kartboosttime=..0}] run function kartmobil:control/useboost
