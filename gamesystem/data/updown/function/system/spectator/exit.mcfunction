title @s title {"text":"관전 종료","color":"aqua"}
title @s subtitle {"text":"돌아왔습니다.","color":"yellow"}

title @s actionbar ["관전 종료됨"]

tp @s -73 4 205 0 0

tag @s remove updown-spectator
gamemode adventure @s

function bgm-room:manage-bgm/stopbgm

scoreboard players reset @s multi-shift