title @s title {"text":"종료","color":"red"}
title @s subtitle {"text":"대기실로 돌아왔습니다.","color":"yellow"}
kill @e[tag=engine-display,type=text_display]

scoreboard players reset @s timecount

function bgm-room:manage-bgm/stopbgm
function multiplayroom:play

tp @s -18 -1 169

tag @s remove kart-multi-player
tag @s remove checkpointpass