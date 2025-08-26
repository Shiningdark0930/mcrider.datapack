title @s title {"text":"완주 실패","color":"gray"}
title @s subtitle {"text":"완주하지 못했습니다.","color":"yellow"}

function retiresound:play

#쉐도우 죽이기
kill @e[tag=shadow-models]

scoreboard players reset @s dev-count

#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -80 4 236 180 0


tag @s remove checkpointpass

data modify entity @e[tag=dev-state-text,limit=1] text set value [{"text":"관전 불가","color":"red"}]

#타이머 스탑
function timerpack:stop

function checkpoint:system/init