execute if entity @s[tag=kartmobil] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run return run run_kart_model run_anime mid
execute if entity @s[type=player] on vehicle on vehicle on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run return run run_kart_model run_anime mid

execute if entity @s[tag=shadow-main] run return run run_kart_model run_anime mid

execute if entity @s[tag=!kartmobil,type=!player] as @e[tag=kart-run-anime,distance=..0.3,type=#kartmobil:kartmodels] run function kartmobil:move/run-anime/show-by-case/frame-mid