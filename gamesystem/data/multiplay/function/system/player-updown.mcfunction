
gamemode adventure @s[tag=!op]

#물이나 공허에 닿으면 r키
# execute on vehicle on vehicle at @s if block ~ ~0.25 ~ water on passengers as @s[tag=kartsaddle] on passengers run function gamemain:rkey
execute at @s at @n[tag=kartmobil,type=item_display] if block ~ ~-0.25 ~ minecraft:pointed_dripstone run function gamemain:rkey
execute on vehicle on vehicle at @s if block ~ ~-0.5 ~ structure_void on passengers as @s[tag=kartsaddle] on passengers run function gamemain:rkey

#업 다운 모드
scoreboard players set @n[tag=kartmobil] kartboostgauge 0

#체크포인트 시스템
function checkpoint:system/player-main-updown
