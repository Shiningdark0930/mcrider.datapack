execute unless entity @s[tag=kart-multi-player] run return 1

tag @s add kart-multi-complete

#동타 완주자 체크
execute as @a[tag=kart-multi-player,tag=!kart-multi-complete] if score @s multi-lap >= #max-lap multi-lap at @s if block ~ ~-1.6 ~ magma_block run tag @s add kart-multi-same-time

#동타 완주자가 없으면 그냥 완주하고 끝냄
execute unless entity @a[tag=kart-multi-same-time] run return run function multiplay:system/game/complete-race/complete
tag @s add kart-multi-same-time

#거리 판정용으로 쓸 kartdrift 초기화
scoreboard players set @a[tag=kart-multi-same-time] kartdrift 0

#결승선과의 거리 측정
execute as @a[tag=kart-multi-same-time] at @s on vehicle on vehicle on passengers rotated as @s[tag=kart-old-velocity] rotated ~ 0 on vehicle on passengers if entity @s[tag=kartsaddle] on passengers run function multiplay:system/game/complete-race/raycast

#동타 난 플레이어들을 완주 처리
function multiplay:system/game/complete-race/complete-same-time-player

tag @s remove kart-multi-complete
tag @a[tag=kart-multi-same-time] remove kart-multi-same-time