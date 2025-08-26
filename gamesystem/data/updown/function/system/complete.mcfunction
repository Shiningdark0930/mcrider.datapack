
scoreboard players reset @s updown-count

function completesound:play
title @s title {"text":"완주","color":"yellow"}

#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -73 4 205 0 0
#마무리
tag @s remove kartplayertemp
function timerpack:stop

