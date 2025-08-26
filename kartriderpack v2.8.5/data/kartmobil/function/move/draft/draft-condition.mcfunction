tag @e[tag=kart-draft-target,type=item_display] remove kart-draft-target

execute rotated ~ 0 positioned ^ ^ ^15 run tag @n[tag=kartmobil,distance=..15,tag=!kartself,type=item_display] add kart-draft-target

execute rotated ~ 0 positioned ^1 ^ ^ if entity @e[tag=kart-draft-target,distance=..1,tag=!kartself,type=item_display] run return 0
execute rotated ~ 0 positioned ^-1 ^ ^ if entity @e[tag=kart-draft-target,distance=..1,tag=!kartself,type=item_display] run return 0
execute if entity @e[tag=kart-draft-target,tag=!kartself,type=item_display] run return 1
