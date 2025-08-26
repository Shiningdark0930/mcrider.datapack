title @s title {"text":"완주 실패","color":"gray"}
title @s subtitle {"text":"완주하지 못했습니다.","color":"yellow"}

function retiresound:play

bossbar set minecraft:license players

scoreboard players reset @s licensecount

#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -119 4 236 0 0


tag @s remove checkpointpass

#타이머 스탑
function timerpack:stop


function checkpoint:system/init