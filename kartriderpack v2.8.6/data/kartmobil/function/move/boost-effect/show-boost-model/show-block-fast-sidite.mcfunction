execute if entity @s[tag=kartmobil] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run return run run_kart_model booster show_block_fast
execute if entity @s[type=player] on vehicle on vehicle on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run return run run_kart_model booster show_block_fast

execute if entity @s[tag=shadow-main] run return run run_kart_model booster show_block_fast

execute if entity @s[tag=!kartmobil,type=!player] as @e[tag=kart-boost-blocks,tag=!kart-boost-blocks-show,distance=..0.3,type=#kartmobil:kartmodels] run function kartmobil:move/boost-effect/show-boost-model/show-by-case/show-block-fast
