execute as @a[tag=kart-multi-player] at @s run tag @n[tag=kartmobil,tag=kart-stop,distance=..10,type=item_display] remove kart-stop

scoreboard players reset #max-rank multi-rank

function timerpack:start
data modify storage minecraft:timermain multi-record set value []
data modify storage minecraft:timermain multi-record-subtick set value []

# 게임 시작 로그 출력
function multiplay:system/game/gamestart-log-main

#출부 및 모드
execute at @a[tag=kart-multi-player] run scoreboard players set @n[tag=kartdirection,type=minecraft:marker] startboosttime 25
execute if score inf-boost multi-main matches 1 run scoreboard players set @e[tag=kartmobil] kartboostgaugecharge 9999
execute if score no-collision multi-main matches 1 run tag @e[tag=kartmobil] add no-collision
execute if score no-draft multi-main matches 1 run tag @e[tag=kartmobil] add no-draft
execute if score drag-accel multi-main matches 1 run tag @e[tag=kartmobil] add drag-accel
#execute if score #map multi-main matches 1001.. run tag @e[tag=kartmobil] add can-jump
execute if score mad-crash multi-main matches 1 run tag @e[tag=kartmobil] add mad-crash
execute if score wall-crash multi-main matches 1 run tag @e[tag=kartmobil] add wall-crash


#플레이어에게 아이디 부여하기 - 관전을 위해
scoreboard players reset max-id multi-spectator-id

execute as @a[tag=kart-multi-player] store result score @s multi-spectator-id run scoreboard players add max-id multi-spectator-id 1
execute as @a[tag=kart-multi-player] store result score @s multi-instant-rank run scoreboard players add max-id multi-spectator-id 1
execute store result score #player-count multi-spectate-time if entity @a[tag=kart-multi-player]

#모드

team leave @a[tag=kart-multi-player]

#팀전
execute if score team-battle multi-main matches 1 as @a[tag=kart-multi-player] on vehicle on vehicle run tag @s add kart-teamboost
execute if score team-battle multi-main matches 1 as @a[tag=kart-multi-player,scores={kart-team=0}] on vehicle on vehicle run scoreboard players set @s kart-team 0
execute if score team-battle multi-main matches 1 as @a[tag=kart-multi-player,scores={kart-team=1}] on vehicle on vehicle run scoreboard players set @s kart-team 1

execute if score team-battle multi-main matches 1 as @a[tag=kart-multi-player,scores={kart-team=0}] run team join redteam @s
execute if score team-battle multi-main matches 1 as @a[tag=kart-multi-player,scores={kart-team=1}] run team join blueteam @s

execute if score team-battle multi-main matches 1 run scoreboard players reset #redteam-gauge kart-teamboost-gauge
execute if score team-battle multi-main matches 1 run scoreboard players reset #blueteam-gauge kart-teamboost-gauge
execute if score team-battle multi-main matches 1 run clear @a[tag=kart-multi-player] minecraft:soul_campfire

#순위 및 닉네임 텍스트
execute unless score #map multi-main matches 1001.. as @a[tag=kart-multi-player] at @s run summon text_display ~ ~ ~ {brightness:{sky:15,block:15},billboard:"vertical",Tags:["check-rank-text","multi-text-display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.725f,0f],scale:[0.75f,0.75f,0.75f]},text:"1등"}
execute as @a[tag=kart-multi-player,tag=bump-allow,tag=kite-played] at @s run summon text_display ~ ~ ~ {brightness:{sky:15,block:15},billboard:"vertical",Tags:["multi-bump","multi-text-display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.2906f,1.725f,0f],scale:[0.75f,0.75f,0.75f]},text:{text:"🗡",color:red}}
execute as @a[tag=kart-multi-player,tag=!bump-allow,tag=kite-played] at @s run summon text_display ~ ~ ~ {brightness:{sky:15,block:15},billboard:"vertical",Tags:["multi-bump","multi-text-display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[-0.28125f,1.725f,0f],scale:[0.75f,0.75f,0.75f]},text:{text:"⛨",color:yellow}}
execute as @a[tag=kart-multi-player] at @s run summon text_display ~ ~ ~ {brightness:{sky:15,block:15},billboard:"vertical",Tags:["multi-engine","multi-text-display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0.375f,1.725f,0f],scale:[0.75f,0.75f,0.75f]},text:{text:""}}
execute as @a[tag=kart-multi-player] at @s run function multiplay:system/multi-engine-text
execute as @a[tag=kart-multi-player] at @s run summon text_display ~ ~ ~ {brightness:{sky:15,block:15},billboard:"vertical",Tags:["multi-playername","multi-text-display"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.475f,0f],scale:[0.9f,0.9f,0.9f]},text:"Player"}



execute as @a[tag=kart-multi-player] at @s as @e[tag=multi-text-display,sort=nearest,limit=4,distance=..0.00001] run ride @s mount @n[tag=kartsaddle]


execute as @a[tag=kart-multi-player] at @s on vehicle on passengers run data modify entity @s[tag=multi-playername] text set value {"selector":"@n[tag=kart-multi-player]"}

execute if score team-battle multi-main matches 0 as @a[tag=kart-multi-player] run team join multi-hidenick @s 
clear @a minecraft:jigsaw