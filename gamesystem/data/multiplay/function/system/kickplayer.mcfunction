title @s title {"text":"강퇴","color":"red"}
title @s subtitle {"text":"레이스에서 퇴장당했습니다!","color":"yellow"}

execute if entity @s[tag=auto-mount-kick] run tellraw @a [{"selector":"@s","color":"red"},{"text":"이(가) 강퇴되었습니다. ","color":"red"},{"text":"[출발선 자리 부족]","color":"yellow"}]
execute if entity @s[tag=!auto-mount-kick] run tellraw @a [{"selector":"@s","color":"red"},{"text":"이(가) 강퇴되었습니다.","color":"red"}]

scoreboard players reset @s timecount

function bgm-room:manage-bgm/stopbgm
function retiresound:play

tp @s -29 3 163

tag @s remove kart-multi-player
tag @s remove checkpointpass