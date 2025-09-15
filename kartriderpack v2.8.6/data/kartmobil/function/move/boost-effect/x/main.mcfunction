
#일반 부스터 파티클
execute if score @s kartboosttime matches 26.. unless score @s kartboosttime matches 32..40 on passengers rotated as @s[tag=kartdirectiontemp,type=item_display] rotated ~ 0 run particle minecraft:enchanted_hit ^ ^1 ^1 .25 .25 .25 1.25 1 normal @a[tag=kart-listener]

#듀얼부스터 이펙트
execute if score @s kartboosttime matches 37 run function kartmobil:move/boost-effect/x/dualboost-transform-particle
execute if score @s kartboosttime matches 25 run function kartmobil:move/boost-effect/x/dualboost-burst-particle
execute if score @s kartboosttime matches ..25 run function kartmobil:move/boost-effect/x/dualboost-particle

#부스터 불꽃 및 블록 보이기
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kartboosttime matches 37 run function kartmobil:move/boost-effect/show-boost-model/show-block
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kartboosttime matches 37 run function kartmobil:move/boost-effect/show-boost-model/show-block-sidite
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kartboosttime matches 2..36 run function kartmobil:move/boost-effect/show-boost-model/show-block-fast
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kartboosttime matches 2..36 run function kartmobil:move/boost-effect/show-boost-model/show-block-fast-sidite
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kartboosttime matches 2..25 run function kartmobil:move/boost-effect/show-boost-model/show-flame
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kartboosttime matches 2..25 run function kartmobil:move/boost-effect/show-boost-model/show-flame-sidite

#마무리 모션
execute if score @s kartboosttime matches 0 run function kartmobil:move/boost-effect/force-cut-boost