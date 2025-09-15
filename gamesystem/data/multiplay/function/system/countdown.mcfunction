
#게임 시작 안 했을 시 카트 정지
execute unless score #retire-time multi-main matches 1.. as @a[tag=kart-multi-player] at @s run tag @n[tag=kartmobil,distance=..10,type=item_display] add kart-stop
# 임시 기록모드
execute if score #time multi-main matches 9 run data modify storage adai_record kart set from entity @p SelectedItem.components.minecraft:custom_name
execute if score #time multi-main matches 10 run function multiplay:system/gameready/auto-mount/summon-and-align-marker

execute if score #time multi-main matches 15 run effect clear @a[tag=kart-multi-player] minecraft:unluck
execute if score #time multi-main matches 15 run effect clear @a[tag=kart-multi-player] minecraft:invisibility
execute if score #time multi-main matches 15 run function multiplay:system/gameready/auto-mount/tp-player-to-position
execute if score #time multi-main matches 20 as @a[tag=kart-multi-player] run function bgm-room:manage-bgm/playbgm with entity @n[tag=trackselect-multi-marker] data.track

execute if score #time multi-main matches 15 as @a[tag=multi-spectate-zone] at @s run function multiplay:system/spectator/spectate-zone
execute if score #time multi-main matches 20 as @a[tag=multi-spectator] at @s run function multiplay:system/spectator/spectate-target
execute if score #time multi-main matches 20.. as @a[tag=kart-multi-player] at @s run function multiplay:system/countdown-lockplayerhead

execute if score #time multi-main matches 16 run kill @e[tag=engine-display,type=text_display]
execute if score #time multi-main matches 16 run kill @e[tag=bumpallow-display,type=text_display]
execute if score #time multi-main matches 17 as @a[tag=kart-multi-player] at @s run function multiplay:system/enginedisplay
execute if score #time multi-main matches 17 as @a[tag=kart-multi-player,tag=kite-played] at @s run function multiplay:system/bumpallow-display

execute if score #time multi-main matches 17 run function multiplay:system/countdown-notify

execute if score #time multi-main matches 15 run title @a title {"text":"","color":"yellow"}
execute if score #time multi-main matches 15 run title @a subtitle {"text":"준비","color":"yellow"}

execute if score #time multi-main matches 40 run title @a title {"text":"3","color":"yellow"}
execute if score #time multi-main matches 40 run title @a subtitle {"text":"","color":"yellow"}
execute if score #time multi-main matches 60 run title @a title {"text":"2","color":"yellow"}
execute if score #time multi-main matches 80 run title @a title {"text":"1","color":"yellow"}
execute if score #time multi-main matches 100 run title @a title {"text":"시작","color":"yellow"}

execute if score #time multi-main matches 100 run kill @e[tag=engine-display,type=text_display]
execute if score #time multi-main matches 100 run kill @e[tag=bumpallow-display,type=text_display]

execute if score #time multi-main matches 40 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 0.675
execute if score #time multi-main matches 60 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 0.675
execute if score #time multi-main matches 80 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 0.675
execute if score #time multi-main matches 100 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 1.345

execute if score #time multi-main matches 40 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 0.675
execute if score #time multi-main matches 60 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 0.675
execute if score #time multi-main matches 80 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 0.675
execute if score #time multi-main matches 100 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 1.345

execute if score #time multi-main matches 100 run function multiplay:system/gamestart

#execute at @n[tag=kartmobil] run rotate @s ~ 35