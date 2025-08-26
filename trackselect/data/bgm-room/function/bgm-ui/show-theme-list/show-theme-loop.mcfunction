summon minecraft:text_display ~ ~ ~ {Tags:["bgm-theme-text","bgm-theme-text-temp"],background:-16777216}
summon minecraft:item_display ~ ~0.5 ~ {Tags:["bgm-theme-icon","bgm-theme-icon-temp"]}

summon marker ~ ~ ~ {Tags:["bgm-theme-marker","bgm-theme-marker-temp"]}
summon interaction ^0.5 ^ ^ {Tags:["bgm-theme-interaction"],response:1b,width:1f,height:0.75f}
#테마 하나 pop
data modify entity @n[tag=bgm-theme-text-temp] text set from storage bgm-room temp[0].text

data modify entity @n[tag=bgm-theme-icon-temp] item.id set from storage bgm-room temp[0].icon
data modify entity @n[tag=bgm-theme-icon-temp] transformation.scale[0] set value 0.25f
data modify entity @n[tag=bgm-theme-icon-temp] transformation.scale[1] set value 0.25f
data modify entity @n[tag=bgm-theme-icon-temp] transformation.scale[2] set value 0.25f

execute if data storage bgm-room temp[0].mariokart run item replace entity @n[tag=bgm-theme-icon-temp] contents from entity @n[tag=mariokart-icon] contents
execute if data storage bgm-room temp[0].mariokart at @n[tag=bgm-theme-icon-temp] run rotate @n[tag=bgm-theme-icon-temp] ~180 ~
execute if data storage bgm-room temp[0].mariokart run data modify entity @n[tag=bgm-theme-icon-temp] transformation.translation[1] set value 0.125f
execute if data storage bgm-room temp[0].mariokart run data modify entity @n[tag=bgm-theme-icon-temp] transformation.scale[0] set value 0.5f
execute if data storage bgm-room temp[0].mariokart run data modify entity @n[tag=bgm-theme-icon-temp] transformation.scale[1] set value 0.5f
execute if data storage bgm-room temp[0].mariokart run data modify entity @n[tag=bgm-theme-icon-temp] transformation.scale[2] set value 0.5f

data modify entity @n[tag=bgm-theme-marker-temp] data.theme set from storage bgm-room temp[0]
data remove storage bgm-room temp[0]


tag @e[tag=bgm-theme-text-temp] remove bgm-theme-text-temp
tag @e[tag=bgm-theme-marker-temp] remove bgm-theme-marker-temp
tag @e[tag=bgm-theme-icon-temp] remove bgm-theme-icon-temp

execute if data storage minecraft:bgm-room temp[0] positioned ^ ^ ^1 if block ~ ~ ~ #kartmobil:ignoreblock run function bgm-room:bgm-ui/show-theme-list/show-theme-loop
execute if data storage minecraft:bgm-room temp[0] positioned ^ ^ ^1 unless block ~ ~ ~ #kartmobil:ignoreblock as @e[tag=bgm-y-pos] at @s run tp @s ~ ~-1 ~
execute if data storage minecraft:bgm-room temp[0] positioned ^ ^ ^1 unless block ~ ~ ~ #kartmobil:ignoreblock positioned as @e[tag=bgm-y-pos] run function bgm-room:bgm-ui/show-theme-list/show-theme-loop
