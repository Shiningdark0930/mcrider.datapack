
gamemode adventure @s[tag=!op]

#물이나 공허에 닿으면 r키
# execute on vehicle on vehicle at @s if block ~ ~0.25 ~ water on passengers as @s[tag=kartsaddle] on passengers run function gamemain:rkey
execute on vehicle on vehicle at @s if block ~ ~-0.5 ~ structure_void on passengers as @s[tag=kartsaddle] on passengers run function gamemain:rkey

#견인 가속
execute if entity @s[predicate=kartmobil:w] if entity @a[tag=kart-multi-player,scores={multi-instant-rank=1},distance=15..] run function multiplay:system/game/pull-accel/pull-accel

#체크포인트 시스템
function checkpoint:system/player-main