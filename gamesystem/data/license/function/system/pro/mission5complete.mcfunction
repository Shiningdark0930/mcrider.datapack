title @s title {"text":"완주!","color":"yellow"}
title @s subtitle {"text":"","color":"yellow"}

tellraw @a {"text":"카트라이더의 최강자를 증명하는, PRO 라이센스를 획득했습니다!","color":"yellow"}
tellraw @a [{"text":"[차고]","color":"green"},{"text":"의 어딘가 비밀 공간이 열렸습니다.","color":"aqua"}]

bossbar set minecraft:license players

scoreboard players reset @s licensecount
#BGM 끄기
function bgm-room:manage-bgm/stopbgm
time set day
weather clear
tp @s -119 4 236 0 0

execute at @s run playsound minecraft:ui.toast.challenge_complete weather @a ~ ~ ~ 1

tag @s remove checkpointpass

#타이머 스탑
function timerpack:stop

#클리어
setblock -63 5 263 gold_block
setblock -123 5 242 gold_block
setblock -88 5 223 oak_button

fill -102 4 208 -102 5 208 air

execute unless score clear-data licensestage matches 17.. run scoreboard players set clear-data licensestage 17