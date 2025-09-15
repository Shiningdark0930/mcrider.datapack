tag @s remove pro-transform-need

##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 run function kartmobil:move/boost-effect/show-boost-model/show-block-fast
execute if score #sidite-cursed-mod kartmain matches 1 run function kartmobil:move/boost-effect/show-boost-model/show-block-fast-sidite

tag @e[tag=kart-boost-blocks,distance=..0.3,type=#kartmobil:kartmodels] remove kart-boost-blocks
tag @e[tag=kart-boost,distance=..0.3,type=#kartmobil:kartmodels] remove kart-boost

