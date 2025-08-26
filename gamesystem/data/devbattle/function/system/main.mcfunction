#@s를 기준으로 돌아감

execute if score @s dev-count matches 1 at @s run function devbattle:system/init

scoreboard players add @s dev-count 1

#개발자 섀도우 기록 / 재생
execute if score @s dev-count matches 42 run kill @e[tag=shadow-models]
execute if score @s dev-count matches 42.. if score #shadow-length dev-map matches 1.. run function devbattle:system/shadow/play
execute if score @s dev-count matches 43.. run function devbattle:system/shadow/record

#카트에서 내리면 리타이어
execute if score @s dev-count matches 20.. if entity @s[predicate=!kartmobil:ifride] run function devbattle:system/retire

#물이나 공허에 닿으면 r키
# execute on vehicle on vehicle at @s if block ~ ~0.25 ~ water on passengers as @s[tag=kartsaddle] on passengers run function gamemain:rkey
execute on vehicle on vehicle at @s if block ~ ~-0.5 ~ structure_void on passengers as @s[tag=kartsaddle] on passengers run function gamemain:rkey

#카운트다운
execute if score @s dev-count matches ..100 run function devbattle:system/countdown

#체크포인트 시스템
execute if score @s dev-count matches 100.. run function checkpoint:system/player-main

#결승선을 지나기
execute if block ~ ~-1.6 ~ magma_block if entity @s[tag=check-pass-last] run function devbattle:system/passline
execute if score @s dev-count matches 100.. if score @s dev-lap >= #maxlap dev-lap run function devbattle:system/complete

#만약 쉐도우가 존재하는 상태에서 개발자 쉐도우가 먼저 도착하면 리타이어
execute store result score shadow-length-temp dev-map run data get storage devattack:dev-attack-shadows temp-shadow-play.pos
execute if score #shadow-length dev-map matches 1.. unless score shadow-length-temp dev-map matches 1.. at @s run function devbattle:system/retire