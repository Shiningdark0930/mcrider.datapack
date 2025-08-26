title @a subtitle {"interpret":true,"nbt":"time","storage":"timermain"}

scoreboard players reset @s dev-count

#쉐도우 죽이기
kill @e[tag=shadow-models]

#기록 저장하기
tag @s add kartplayertemp

setblock -86 4 236 minecraft:gold_block


##dev-record-mode dev-count가 1이면 기록을 교체, 아니면 그냥 승리로 끝남
execute store result storage devattack:dev-attack-record tempmap int 1 run scoreboard players get @s dev-map
execute store result storage devattack:dev-attack-record tempdev int 1 run scoreboard players get #dev dev-count

# 정확한 기록 확보(서브틱 연산) - dev-record-mode dev-count가 1일 때만
execute if score #dev-record-mode dev-count matches 1 run function multiplay:system/game/complete-race/calculate-milisec

#신기록을 반영
execute if score @e[tag=trackselect-devbattle-record,limit=1] timermain > time timermain run function devbattle:system/devrecord/savecleardata with storage devattack:dev-attack-record

execute if score #dev-record-mode dev-count matches 1 if score @e[tag=trackselect-devbattle-record,limit=1] timermain > time timermain run setblock -86 4 236 gold_block
execute if score #dev-record-mode dev-count matches 1 if score @e[tag=trackselect-devbattle-record,limit=1] timermain > time timermain run data modify entity @e[tag=trackselect-devbattle-record,limit=1] text set from storage timermain time
execute if score #dev-record-mode dev-count matches 1 if score @e[tag=trackselect-devbattle-record,limit=1] timermain > time timermain run function devbattle:system/devrecord/saverecord with storage devattack:dev-attack-record
execute if score #dev-record-mode dev-count matches 1 if score @e[tag=trackselect-devbattle-record,limit=1] timermain > time timermain run scoreboard players operation @e[tag=trackselect-devbattle-record,limit=1] timermain = time timermain

    function completesound:play

    #쉐도우 저장하기(맵 + 개발자#dev dev-count)
    execute if score #dev-record-mode dev-count matches 1 run function devbattle:system/shadow/saveshadow with storage devattack:dev-attack-shadows

#메시지 띄우고 기록을 반영


# 기록이 저장된 기록보다 느릴 경우 실패 처리 (이후 로직 실행 방지)
execute if score #dev-record-mode dev-count matches 1 if score time timermain < @e[tag=trackselect-devbattle-record,limit=1] timermain run title @s title {"text":"완주 실패","color":"red"}
execute if score #dev-record-mode dev-count matches 1 if score time timermain < @e[tag=trackselect-devbattle-record,limit=1] timermain run title @s subtitle {"text":"완주하지 못했습니다.","color":"yellow"}

# 성공 시 메시지 및 기록 표시 (실패가 아닐 때만)
execute if score #dev-record-mode dev-count matches 1 unless score time timermain < @e[tag=trackselect-devbattle-record,limit=1] timermain run title @s title {"text":"개발자를 이겼습니다!","color":"yellow"}
execute if score #dev-record-mode dev-count matches 1 unless score time timermain < @e[tag=trackselect-devbattle-record,limit=1] timermain run title @s subtitle {"nbt":"time.text","storage":"timermain",color:aqua}

#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -80 4 236 180 0

tag @s remove checkpointpass

data modify entity @e[tag=dev-state-text,limit=1] text set value [{"text":"관전 불가","color":"red"}]

#마무리
tag @s remove kartplayertemp
function timerpack:stop
