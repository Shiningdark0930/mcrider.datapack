summon minecraft:text_display ~ ~0.1875 ~ {Tags:["track-track-text","track-track-text-temp"]}
summon marker ~ ~ ~ {Tags:["track-track-marker","track-track-marker-temp"]}

summon interaction ^1 ^ ^ {Tags:["track-track-interaction"],response:1b,width:2f,height:0.75f}

#타임어택/개발자대결 기록 + 클리어텍스트
execute if entity @p[scores={trackselect-game-id=1..2}] run summon minecraft:text_display ~ ~ ~ {Tags:["track-track-record","track-track-record-temp"]}
execute if entity @p[scores={trackselect-game-id=2}] run summon minecraft:text_display ~ ~-0.1875 ~ {Tags:["track-track-clear-text","track-track-clear-text-temp"]}

#트랙 하나 pop
data modify entity @n[tag=track-track-text-temp] text set from storage track-list temp[0].text

data modify entity @n[tag=track-track-marker-temp] data.track set from storage track-list temp[0]
execute store result score @n[tag=track-track-marker-temp] trackselect-map-id run data get entity @n[tag=track-track-marker-temp] data.track.number

#기록 텍스트
execute if entity @p[scores={trackselect-game-id=1}] as @n[tag=track-track-record-temp] run function timeattack:system/record/changerecordtext with entity @n[tag=track-track-marker-temp] data.track
execute if entity @p[scores={trackselect-game-id=2}] as @n[tag=track-track-record-temp] run function devbattle:system/devrecord/changerecordtext with entity @n[tag=track-track-marker-temp] data.track

data modify entity @n[tag=track-track-record-temp] transformation.scale[0] set value 0.75f
data modify entity @n[tag=track-track-record-temp] transformation.scale[1] set value 0.75f
data modify entity @n[tag=track-track-record-temp] transformation.scale[2] set value 0.75f

#클리어 텍스트
execute if entity @p[scores={trackselect-game-id=2}] as @n[tag=track-track-clear-text-temp] run function devbattle:system/devrecord/load-clear-data-text with entity @n[tag=track-track-marker-temp] data.track

data modify entity @n[tag=track-track-clear-text-temp] transformation.scale[0] set value 0.75f
data modify entity @n[tag=track-track-clear-text-temp] transformation.scale[1] set value 0.75f
data modify entity @n[tag=track-track-clear-text-temp] transformation.scale[2] set value 0.75f

data remove storage track-list temp[0]

tag @e[tag=track-track-text-temp] remove track-track-text-temp
tag @e[tag=track-track-marker-temp] remove track-track-marker-temp
tag @e[tag=track-track-record-temp] remove track-track-record-temp
tag @e[tag=track-track-clear-text-temp] remove track-track-clear-text-temp

execute if data storage minecraft:track-list temp[0] positioned ^ ^ ^2 if block ~ ~ ~ #kartmobil:ignoreblock run function trackselect:track-ui/show-theme-list/show-track-loop
execute if data storage minecraft:track-list temp[0] positioned ^ ^ ^2 unless block ~ ~ ~ #kartmobil:ignoreblock as @e[tag=track-y-pos] at @s run tp @s ~ ~-1 ~
execute if data storage minecraft:track-list temp[0] positioned ^ ^ ^2 unless block ~ ~ ~ #kartmobil:ignoreblock positioned as @e[tag=track-y-pos] run function trackselect:track-ui/show-theme-list/show-track-loop