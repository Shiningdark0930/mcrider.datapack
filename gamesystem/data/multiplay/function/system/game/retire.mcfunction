title @s title {"text":"완주 실패","color":"gray"}
title @s subtitle {"text":"완주하지 못했습니다.","color":"yellow"}

scoreboard players reset * timerdisplay

#리타이어는 -1
scoreboard players set @s multi-rank -1

#function retiresound:play

#BGM 끄기
function bgm-room:manage-bgm/stopbgm
function multiplayroom:play

#차 부수고 얻기
ride @s dismount

tp @s -17.5 -1. 169.5

function checkpoint:system/init

tag @s remove kart-multi-player
tag @s remove checkpointpass

clear @s minecraft:soul_campfire
team leave @s