title @s title {"text":"귀환","color":"red"}
title @s subtitle {"text":"허브로 돌아왔습니다.","color":"yellow"}

#쉐도우 죽이기
kill @e[tag=shadow-models]

scoreboard players reset @s dev-count
#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -80 4 236 180 0


tag @s remove checkpointpass

data modify entity @e[tag=dev-state-text,limit=1] text set value [{"text":"","color":"green"}]

#타이머 스탑
function timerpack:stop