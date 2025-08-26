title @a subtitle {"interpret":true,"nbt":"time","storage":"timermain"}

scoreboard players reset @s timecount

#쉐도우 죽이기
kill @e[tag=shadow-models]

#기록 저장하기
tag @s add kartplayertemp

#만약 기록을 못 넘었으면 완주, 넘었으면 신기록
title @s title {"text":"완주","color":"yellow"}
execute if score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run function completesound:play
execute unless score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run function complete2:play
#쉐도우 저장하기(일반/덮어쓰기모드)
execute store result storage timeattack:timeattack-shadows tempmap int 1 run scoreboard players get @s timemap

execute unless score #force-overwrite timecount matches 1 if score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run function timeattack:system/shadow/saveshadow with storage timeattack:timeattack-shadows
execute if score #force-overwrite timecount matches 1 run function timeattack:system/shadow/saveshadow with storage timeattack:timeattack-shadows

#일반 모드이면서 기록을 넘었으면 메시지 띄우고 기록을 반영
execute unless score #force-overwrite timecount matches 1 if score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run title @s title {"text":"새로운 기록","color":"yellow"}
execute unless score #force-overwrite timecount matches 1 if score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run data modify entity @e[tag=trackselect-timeattack-record,limit=1] text set from storage minecraft:timermain time
execute unless score #force-overwrite timecount matches 1 if score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run function timeattack:system/record/saverecord with storage timeattack:timeattack-shadows
execute unless score #force-overwrite timecount matches 1 if score @e[tag=trackselect-timeattack-record,limit=1] timermain > time timermain run scoreboard players operation @e[tag=trackselect-timeattack-record,limit=1] timermain = time timermain

#덮어쓰기 모드일 경우 강제로 덮어쓰기
execute if score #force-overwrite timecount matches 1 run title @s title {"text":"덮어쓰기","color":"red"}
execute if score #force-overwrite timecount matches 1 run data modify entity @e[tag=trackselect-timeattack-record,limit=1] text set from storage minecraft:timermain time
execute if score #force-overwrite timecount matches 1 run function timeattack:system/record/saverecord with storage timeattack:timeattack-shadows
execute if score #force-overwrite timecount matches 1 run scoreboard players operation @e[tag=trackselect-timeattack-record,limit=1] timermain = time timermain

#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -139 4 236 180 0


tag @s remove checkpointpass

data modify entity @e[tag=timeattack-state-text,limit=1] text set value [{"text":"관전 불가","color":"red"}]

#마무리
tag @s remove kartplayertemp
function timerpack:stop

