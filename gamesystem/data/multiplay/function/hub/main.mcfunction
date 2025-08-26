tag @a[x=-26,y=7,z=154,dx=22,dy=-8,dz=19] add multi-hub-player
tag @a[x=39,y=12,z=181,dx=10,dy=-8,dz=12] add multi-hub-player

execute as @a[tag=multi-hub-player,predicate=!kartmobil:shift] if items entity @s weapon *[minecraft:custom_data~{kartmobil:1}] run tag @s add multi-hub-ready
execute as @a[tag=multi-hub-player,predicate=!kartmobil:shift] if predicate kartmobil:ifride run tag @s add multi-hub-ready

#execute unless score #game multi-main matches 1 run team join multi-ready @a[tag=multi-hub-ready]
title @a[tag=multi-hub-player,tag=!multi-hub-ready,predicate=!kartmobil:shift] actionbar [{"text":"🚗 카트를 들지 않아 ","color":"green"},{"text":"연습카트","color":"yellow"},{"text":"를 탑승합니다 🚗","color":"green"}]
title @a[tag=multi-hub-player,tag=!multi-hub-ready,predicate=kartmobil:shift] actionbar [{"text":"! 웅크리기를 떼 주세요 !","color":"red"}]

execute as @a[tag=multi-hub-player,tag=multi-hub-ready] at @s unless items entity @s weapon *[minecraft:custom_data~{kartmobil:1}] run title @s actionbar [{"text":"선택한 카트: ","color":"yellow","bold":true},{"entity":"@n[tag=kartdatacarrier]","interpret":true,"nbt":"data.itemdata.components.minecraft:custom_name"}]
execute as @a[tag=multi-hub-player,tag=multi-hub-ready] if items entity @s weapon *[minecraft:custom_data~{kartmobil:1}] run title @s actionbar [{"text":"선택한 카트: ","color":"yellow","bold":true},{"entity":"@s","interpret":true,"nbt":"SelectedItem.components.minecraft:custom_name"}]

#팀전
execute if score team-battle multi-main matches 1 as @e[x=-26,y=-1,z=172,dx=22,dy=3,dz=-19,type=item] if entity @s[nbt={Item:{id:"minecraft:leather_helmet",count:1}}] run kill @s
execute if score team-battle multi-main matches 1 as @e[x=-26,y=-1,z=172,dx=22,dy=3,dz=-19,type=item] if entity @s[nbt={Item:{id:"minecraft:jigsaw",count:1}}] run kill @s
execute if score team-battle multi-main matches 1 as @a[tag=multi-hub-player] run function multiplay:hub/team-player

execute unless score team-battle multi-main matches 1 as @a[tag=multi-hub-player] if items entity @s armor.head leather_helmet run item replace entity @s armor.head with air

#관전룸
title @a[tag=!multi-hub-player,x=-34,y=3,z=154,dx=7,dy=4,dz=19] actionbar [{"text":"! 2층에서는 경기에 참가할 수 없습니다 !","color":"red"}]