$execute unless score lowdetail kartmain matches 1.. run function kartmodel:$(model)
#포테이토 모드
execute if score lowdetail kartmain matches 1.. run function kartmodel:potato-mode
$execute if score lowdetail kartmain matches 1.. run data modify entity @n[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=modeltext1] text set value "$(model)"
execute if score lowdetail kartmain matches 1.. run data modify entity @n[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=modeltext2] text set from entity @s equipment.offhand.components.minecraft:custom_name