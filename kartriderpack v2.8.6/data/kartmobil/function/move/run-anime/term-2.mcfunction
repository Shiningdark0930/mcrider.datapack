scoreboard players set #term kart-run-anime 2

##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kart-run-anime matches 2 run function kartmobil:move/run-anime/frame-first-vanilla
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kart-run-anime matches 4 run function kartmobil:move/run-anime/frame-mid-vanilla
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kart-run-anime matches 6 run function kartmobil:move/run-anime/frame-last-vanilla
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kart-run-anime matches 8.. run function kartmobil:move/run-anime/frame-mid-vanilla

execute if score #sidite-cursed-mod kartmain matches 1 if score @s kart-run-anime matches 2 run function kartmobil:move/run-anime/frame-first-sidite
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kart-run-anime matches 4 run function kartmobil:move/run-anime/frame-mid-sidite
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kart-run-anime matches 6 run function kartmobil:move/run-anime/frame-last-sidite
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kart-run-anime matches 8.. run function kartmobil:move/run-anime/frame-mid-sidite
execute if score @s kart-run-anime matches 8.. run scoreboard players set @s kart-run-anime 0
