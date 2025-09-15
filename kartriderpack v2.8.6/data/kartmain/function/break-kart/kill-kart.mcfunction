#카트 중심엔티티에 태그 달기
tag @s add kartdie

#아이템 데이터 캐리어에 태그 달기
execute as @e[tag=kartdie,type=item_display] on passengers if entity @s[tag=kartdatacarrier,type=marker] run tag @s add kartdatacarriertemp
execute as @a[tag=kartbreakplayer] run function kartmain:break-kart/breakandgiveitem with entity @n[tag=kartdatacarriertemp,type=marker] data.itemdata

#플레이어가 바닥에 파묻히는 버그 수정용 tp
execute at @n[tag=kartsaddle,type=#kartmobil:kartsaddle] run tp @a[tag=kartbreakplayer,distance=..1] ~ ~ ~

#위에 탑승한 모델 다 죽이기
execute as @e[tag=kartdie,type=item_display] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] on passengers run kill @s[type=!player]
execute as @e[tag=kartdie,type=item_display] on passengers run kill @s[type=!player]

tag @a[tag=kartbreakplayer] remove kartbreakplayer
kill @e[tag=kartdie,type=item_display]

#멀티 순위
kill @e[tag=multi-text-display,distance=..5,sort=nearest,limit=2]

return 1