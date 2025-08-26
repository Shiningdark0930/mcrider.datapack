summon minecraft:text_display ~ ~ ~ {Tags:["track-theme-text","track-theme-text-temp"]}
summon minecraft:item_display ~ ~0.5 ~ {Tags:["track-theme-icon","track-theme-icon-temp"]}

summon marker ~ ~ ~ {Tags:["track-theme-marker","track-theme-marker-temp"]}
summon interaction ^0.5 ^ ^ {Tags:["track-theme-interaction"],response:1b,width:1f,height:0.75f}
#테마 하나 pop
data modify entity @n[tag=track-theme-text-temp] text set from storage track-list temp[0].text

data modify entity @n[tag=track-theme-icon-temp] item.id set from storage track-list temp[0].icon
data modify entity @n[tag=track-theme-icon-temp] transformation.scale[0] set value 0.25f
data modify entity @n[tag=track-theme-icon-temp] transformation.scale[1] set value 0.25f
data modify entity @n[tag=track-theme-icon-temp] transformation.scale[2] set value 0.25f

execute if data storage track-list temp[0].mariokart run item replace entity @n[tag=track-theme-icon-temp] contents from entity @n[tag=mariokart-icon] contents
execute if data storage track-list temp[0].mariokart at @n[tag=track-theme-icon-temp] run rotate @n[tag=track-theme-icon-temp] ~180 ~
execute if data storage track-list temp[0].mariokart run data modify entity @n[tag=track-theme-icon-temp] transformation.translation[1] set value 0.125f
execute if data storage track-list temp[0].mariokart run data modify entity @n[tag=track-theme-icon-temp] transformation.scale[0] set value 0.5f
execute if data storage track-list temp[0].mariokart run data modify entity @n[tag=track-theme-icon-temp] transformation.scale[1] set value 0.5f
execute if data storage track-list temp[0].mariokart run data modify entity @n[tag=track-theme-icon-temp] transformation.scale[2] set value 0.5f

data modify entity @n[tag=track-theme-marker-temp] data.theme set from storage track-list temp[0]
data remove storage track-list temp[0]


tag @e[tag=track-theme-text-temp] remove track-theme-text-temp
tag @e[tag=track-theme-marker-temp] remove track-theme-marker-temp
tag @e[tag=track-theme-icon-temp] remove track-theme-icon-temp

execute if data storage minecraft:track-list temp[0] positioned ^ ^ ^1 if block ~ ~ ~ #kartmobil:ignoreblock run function trackselect:track-ui/show-theme-list/show-theme-loop
execute if data storage minecraft:track-list temp[0] positioned ^ ^ ^1 unless block ~ ~ ~ #kartmobil:ignoreblock as @e[tag=track-y-pos] at @s run tp @s ~ ~-1 ~
execute if data storage minecraft:track-list temp[0] positioned ^ ^ ^1 unless block ~ ~ ~ #kartmobil:ignoreblock positioned as @e[tag=track-y-pos] run function trackselect:track-ui/show-theme-list/show-theme-loop
