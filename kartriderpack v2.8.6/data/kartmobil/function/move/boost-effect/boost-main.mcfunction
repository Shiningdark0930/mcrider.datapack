
#지우엔진 자동변신
execute if score @s kart-engine matches 2 run function kartmobil:move/boost-effect/jiu/auto-transform
execute if score @s kart-engine matches 1000 run function kartmobil:move/boost-effect/jiu/auto-transform
execute if score @s kart-engine matches 1002 run function kartmobil:move/boost-effect/jiu/auto-transform

#기어엔진 자동변신
execute if score @s kart-engine matches 1005 run function kartmobil:move/boost-effect/dummy/gear/auto-transform
execute if score @s kart-engine matches 9 run function kartmobil:move/boost-effect/rally/auto-transform

#부스터 허브
execute if score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/boost-hub