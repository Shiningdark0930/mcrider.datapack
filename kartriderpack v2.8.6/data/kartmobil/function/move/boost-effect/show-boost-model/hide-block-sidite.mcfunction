# execute if entity @s[tag=kartmobil] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run return run run_kart_model booster hide_block
# execute if entity @s[type=player] on vehicle on vehicle on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run return run run_kart_model booster hide_block

# execute if entity @s[tag=shadow-main] run return run run_kart_model booster hide_block

# execute if entity @s[tag=!kartmobil,type=!player] as @e[tag=kart-boost,distance=..0.3,tag=kart-boost-blocks-show,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/show-boost-model/show-by-case/hide-block

execute if entity @s[tag=kartmobil] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] on passengers if entity @s[tag=kart-boost,tag=kart-boost-blocks-show,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/show-boost-model/show-by-case/hide-block
execute if entity @s[type=player] on vehicle on vehicle on passengers if entity @s[tag=kartmodelsaddle,type=item_display] on passengers if entity @s[tag=kart-boost,tag=kart-boost-blocks-show,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/show-boost-model/show-by-case/hide-block

execute if entity @s[tag=shadow-main] on passengers if entity @s[tag=kart-boost,tag=kart-boost-blocks-show,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/show-boost-model/show-by-case/hide-block

execute if entity @s[tag=!kartmobil,type=!player] as @e[tag=kart-boost,distance=..0.3,tag=kart-boost-blocks-show,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/show-boost-model/show-by-case/hide-block