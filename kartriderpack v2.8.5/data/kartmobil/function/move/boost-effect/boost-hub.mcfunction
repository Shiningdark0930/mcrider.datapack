scoreboard players remove @s[tag=!shadow-main] kartboosttime 1

#황구 소리
execute if score @s kartboosttime matches 48 if entity @s[tag=dog,distance=..0.3] at @p[tag=kartpassenger,distance=..0.3] run playsound minecraft:entity.wolf.ambient neutral @a[tag=kart-listener]
execute if score @s kartboosttime matches 42 if entity @s[tag=dog,distance=..0.3] at @p[tag=kartpassenger,distance=..0.3] run playsound minecraft:entity.wolf.ambient neutral @a[tag=kart-listener]

#부스터 패드 탈 때
execute if score @s kartboostpadtime matches 1.. on passengers rotated as @s[tag=kartdirectiontemp,type=marker] rotated ~ 0 run particle minecraft:soul_fire_flame ^ ^1 ^1 .75 .75 .75 0 3 force @a[tag=kart-listener]

#엔진별 부스터 차이
execute if score @s kart-engine matches 0 run function kartmobil:move/boost-effect/x/main
execute if score @s kart-engine matches 1 run function kartmobil:move/boost-effect/ex/main
execute if score @s kart-engine matches 2 run function kartmobil:move/boost-effect/jiu/main
execute if score @s kart-engine matches 3 run function kartmobil:move/boost-effect/new/main
execute if score @s kart-engine matches 4 run function kartmobil:move/boost-effect/z7/main
execute if score @s kart-engine matches 5 run function kartmobil:move/boost-effect/v1/main
execute if score @s kart-engine matches 6 run function kartmobil:move/boost-effect/a2/main
execute if score @s kart-engine matches 7 run function kartmobil:move/boost-effect/1.0/main
execute if score @s kart-engine matches 8 run function kartmobil:move/boost-effect/pro/main

execute if score @s kart-engine matches 1000 run function kartmobil:move/boost-effect/dummy/n1/main
execute if score @s kart-engine matches 1001 run function kartmobil:move/boost-effect/x/main
execute if score @s kart-engine matches 1002 run function kartmobil:move/boost-effect/dummy/key/main
execute if score @s kart-engine matches 1003 run function kartmobil:move/boost-effect/dummy/mario/main


#부스터 끊기
execute unless score @s kart-engine matches 7 unless score @s kart-engine matches 1005 unless score @s kart-engine matches 9 if entity @p[tag=kartpassenger,predicate=!kartmobil:w,distance=..0.3] run scoreboard players set @s kartboosttime 0
execute unless score @s kart-engine matches 7 unless score @s kart-engine matches 1005 unless score @s kart-engine matches 9 if entity @p[tag=kartpassenger,predicate=!kartmobil:w,distance=..0.3] run function kartmobil:move/boost-effect/force-cut-boost
