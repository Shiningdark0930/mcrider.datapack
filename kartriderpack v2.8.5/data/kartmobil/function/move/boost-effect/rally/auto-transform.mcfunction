#자동변신
execute if score #kartspeed kartmove matches 115.. if entity @e[distance=..0.3,tag=kart-boost-blocks,tag=!kart-boost-blocks-show,type=#kartmobil:kartmodels] as @e[limit=8] run playsound minecraft:item.armor.equip_netherite neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score #kartspeed kartmove matches 115.. run function kartmobil:move/boost-effect/show-boost-model/show-block
execute if score #sidite-cursed-mod kartmain matches 1 if score #kartspeed kartmove matches 115.. run function kartmobil:move/boost-effect/show-boost-model/show-block-sidite

execute if score #kartspeed kartmove matches ..114 unless score @s kartboosttime matches 1.. if entity @e[distance=..0.3,tag=kart-boost-blocks,tag=kart-boost-blocks-show,type=#kartmobil:kartmodels] as @e[limit=8] run playsound minecraft:item.armor.equip_diamond neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75

##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score #kartspeed kartmove matches ..114 unless score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/show-boost-model/hide-block
execute if score #sidite-cursed-mod kartmain matches 1 if score #kartspeed kartmove matches ..114 unless score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/show-boost-model/hide-block

#부스터 쓰면 변신
execute if score @s kartboosttime matches 1.. if entity @e[distance=..0.3,tag=kart-boost-blocks,tag=!kart-boost-blocks-show,type=#kartmobil:kartmodels] run playsound minecraft:item.armor.equip_netherite neutral @a[tag=kart-listener] ~ ~ ~ 1 0.75
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/show-boost-model/show-block
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/show-boost-model/show-block-sidite

#자동부스터연출
execute if score #kartspeed kartmove matches 130.. if entity @e[distance=..0.3,tag=kart-boost-flame,tag=!kart-boost-flame-show,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/jiu/boost-sound
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score #kartspeed kartmove matches 130.. run function kartmobil:move/boost-effect/show-boost-model/show-flame
execute if score #sidite-cursed-mod kartmain matches 1 if score #kartspeed kartmove matches 130.. run function kartmobil:move/boost-effect/show-boost-model/show-flame-sidite

##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score #kartspeed kartmove matches ..129 unless score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/show-boost-model/hide-flame
execute if score #sidite-cursed-mod kartmain matches 1 if score #kartspeed kartmove matches ..129 unless score @s kartboosttime matches 1.. run function kartmobil:move/boost-effect/show-boost-model/hide-flame
