#pos모드 감지
scoreboard players add #pos-mod-timer kartmain 1
execute if score #pos-mod-timer kartmain matches 200.. run function kartmain:pos-mod-detect/detect

#sidite-cursed모드 감지
scoreboard players add #sidite-cursed-mod-timer kartmain 1
execute if score #sidite-cursed-mod-timer kartmain matches 200.. run function kartmain:sidite-cursed-mod-detect/detect

#kfc-opti모드 감지
scoreboard players add #kfc-opti-mod-timer kartmain 1
execute if score #kfc-opti-mod-timer kartmain matches 200.. run function kartmain:kfc-opti-mod-detect/detect

#분기점
execute if score #kfc-opti-mod kartmain matches 0 run function kartmain:kfc-false
# execute if score #kfc-opti-mod kartmain matches 1 run function kartmain:kfc-true
# kfc-opti모드에 존재합니다




#rotafix
# execute as @e[tag=kartdirection,type=item_display] store success entity @s OnGround byte 1 store success score @s rotafix unless score @s rotafix matches 1