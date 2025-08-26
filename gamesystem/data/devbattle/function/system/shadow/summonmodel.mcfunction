summon marker ~ ~ ~ {Tags:["dev-model-summon-temp"]}
execute as @n[tag=dev-model-summon-temp] at @s run function kartmobil:summon/summon-model with storage devattack:dev-attack-shadows temp-shadow-play
kill @e[tag=dev-model-summon-temp]
#개발자 모델

function devbattle:system/shadow/summon-dev-model

#닉네임 소환(이펭귄은 약간 위로)
execute unless score #dev dev-count matches 6 run summon text_display ~ ~ ~ {Tags:["shadow-text"],billboard:"vertical",see_through:1b,alignment:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,1.75f,0f],scale:[1f,1f,1f]},text:{"color":"white","text":"Shadow"}}
execute if score #dev dev-count matches 6 run summon text_display ~ ~ ~ {Tags:["shadow-text"],billboard:"vertical",see_through:1b,alignment:"center",transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,2.5f,0f],scale:[1f,1f,1f]},text:{"color":"white","text":"Shadow"}}

data modify entity @e[tag=shadow-text,limit=1] text set from storage devattack:dev-attack-shadows temp-shadow-play.playername

#모델 태그 달고 값수정
summon marker ~ ~ ~ {Tags:["kartdatacarrier","shadow-models"]}

function kartmobil:summon/manage-tag

execute store result score @n[tag=kartdatacarrier,tag=shadow-models,type=marker] kart-engine run data get storage devattack:dev-attack-shadows temp-shadow-play.engine
execute as @n[tag=kartdatacarrier,tag=shadow-models,type=marker] run function kartmobil:summon/boost-effect/boost-effect

tag @e[distance=..0.01,type=#kartmobil:kartmodels] add shadow-models
tag @e[distance=..0.01,tag=shadow-models] remove kartmodel
tag @e[distance=..0.01,tag=shadow-models] remove kartentity
tag @e[distance=..0.01,tag=shadow-models] remove karttemp

kill @e[distance=..0.01,tag=shadow-models,tag=drift-effect]

#아머스탠드에 태우기
summon item_display ~ ~ ~ {teleport_duration:2,Tags:["shadow-models","shadow-main"]}

#쉐도우 게임 아이디 설정
scoreboard players operation @n[tag=shadow-models,tag=shadow-main,type=item_display] game-id = #max-id game-id

execute as @e[tag=shadow-models] run ride @s dismount
execute as @e[tag=shadow-models] run ride @s mount @n[tag=shadow-models,tag=shadow-main,type=item_display]

#섀도우 엔진 설정
execute store result score @e[tag=shadow-models,tag=shadow-main,type=item_display,limit=1] kart-engine run data get storage devattack:dev-attack-shadows temp-shadow-play.engine

#섀도우 부스터 시간 설정
execute store result score @e[tag=shadow-models,tag=shadow-main,type=item_display,limit=1] kartboostduration run data get storage devattack:dev-attack-shadows temp-shadow-play.boostduration