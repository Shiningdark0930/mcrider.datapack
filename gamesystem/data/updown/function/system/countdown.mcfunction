#카트 정지
scoreboard players set @n[tag=kartmobil,type=item_display] kartmove 0
scoreboard players set @n[tag=kartmobil,type=item_display] kartboostgauge 0

#카트 탑승
execute if score @s updown-count matches 8 run effect clear @s minecraft:unluck
execute if score @s updown-count matches 8 run function kartmobil:summon/swaphand

execute if score @s updown-count matches 10 run function gamemain:getmapdata/playbgm

execute if score @s updown-count matches 10 run title @s title {"text":"","color":"yellow"}
execute if score @s updown-count matches 10 run title @s subtitle {"text":"준비","color":"yellow"}
execute if score @s updown-count matches 40 run title @s title {"text":"3","color":"yellow"}
execute if score @s updown-count matches 40 run title @s subtitle {"text":"","color":"yellow"}
execute if score @s updown-count matches 60 run title @s title {"text":"2","color":"yellow"}
execute if score @s updown-count matches 80 run title @s title {"text":"1","color":"yellow"}
execute if score @s updown-count matches 100 run title @s title {"text":"시작","color":"yellow"}

execute if score @s updown-count matches 40 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 0.675
execute if score @s updown-count matches 60 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 0.675
execute if score @s updown-count matches 80 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 0.675
execute if score @s updown-count matches 100 as @a at @s run playsound minecraft:block.note_block.pling weather @s ~ ~ ~ 1 1.345

execute if score @s updown-count matches 40 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 0.675
execute if score @s updown-count matches 60 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 0.675
execute if score @s updown-count matches 80 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 0.675
execute if score @s updown-count matches 100 as @a at @s run playsound minecraft:block.note_block.chime weather @s ~ ~ ~ 1 1.345

execute if score @s updown-count matches 100 run tellraw @s {"text":"점프 키를 누르면 카트가 점프합니다."}
execute if score @s updown-count matches 100 run function timerpack:start
execute if score @s updown-count matches 100 run scoreboard players set @n[tag=kartdirection,type=minecraft:marker] startboosttime 25
execute if score @s updown-count matches 100 run tag @n[tag=kartmobil] add can-jump
#@e[tag=kartmobil,type=item_display]