#부스터 쿨타임(일부러 부스터 사이에 텀을 만들기)

scoreboard players set @p[tag=kartpassenger,distance=..0.3] kartboosttime 2

execute if score @n[tag=kartmobil] kartboosttime matches 2 if entity @s[tag=kart-boost-flame,type=#kartmobil:kartmodels] run data merge entity @s {start_interpolation:0,interpolation_duration:2}
execute if score @n[tag=kartmobil] kartboosttime matches 2 if entity @s[tag=kart-boost-flame,tag=kart-boost-flame-slow-fade,type=#kartmobil:kartmodels] run data modify entity @s view_range set value 0f
execute if score @n[tag=kartmobil] kartboosttime matches 0 if entity @s[tag=kart-boost-flame,type=#kartmobil:kartmodels] run data modify entity @s view_range set value 0f

#128배 줄이기
#execute if score @n[tag=kartmobil] kartboosttime matches 2 if entity @s[tag=kart-boost-flame,tag=kart-boost-flame-show,type=#kartmobil:kartmodels] store result entity @s transformation.scale[1] byte 0.00000078125 run data get entity @s transformation.scale[1] 10000

execute if score @n[tag=kartmobil] kartboosttime matches 2 if entity @s[tag=kart-boost-flame,tag=kart-boost-flame-show,type=#kartmobil:kartmodels] run data modify entity @s transformation.scale[1] set value 0

execute if score @n[tag=kartmobil] kartboosttime matches 2 run tag @s[tag=kart-boost-flame,tag=kart-boost-flame-show,type=#kartmobil:kartmodels] remove kart-boost-flame-show

#블록 숨기기
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score @n[tag=kartmobil] kartboosttime matches 0 run function kartmobil:move/boost-effect/show-boost-model/hide-block
execute if score #sidite-cursed-mod kartmain matches 1 if score @n[tag=kartmobil] kartboosttime matches 0 run function kartmobil:move/boost-effect/show-boost-model/hide-block