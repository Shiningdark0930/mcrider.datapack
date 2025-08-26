function kartmobil:move/boost-effect/boost-main

execute if score @s kartboosttime matches 0 unless score @s kart-engine matches 2 run function kartmobil:move/boost-effect/force-cut-boost
execute if score @s kartboosttime matches 0 if score @s kart-engine matches 2 run function kartmobil:move/boost-effect/jiu/boost-end