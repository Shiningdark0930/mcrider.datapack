#전처리
tag @s add carA
tag @n[tag=kartmobil,tag=!carA,distance=0.01..1.5,type=item_display] add carB

tag @s add car-collision
tag @n[tag=carB,type=item_display] add car-collision

#B가 없으면 무시
execute unless entity @n[tag=carB,type=item_display] run return run function kartmobil:move/collision/finish-collision

#보트 무시
execute at @s if score @s kart-engine matches 1004 run return run function kartmobil:move/collision/finish-collision
execute at @s if score @n[tag=carB,type=item_display] kart-engine matches 1004 run return run function kartmobil:move/collision/finish-collision

#충돌 사이즈 분리
    #작은&큰
    execute if entity @s[tag=kart-small-size] as @n[tag=carB,type=item_display] if entity @s[tag=!kart-small-size] unless entity @s[distance=..1.4] run return run function kartmobil:move/collision/finish-collision
    execute if entity @s[tag=!kart-small-size] as @n[tag=carB,type=item_display] if entity @s[tag=kart-small-size] unless entity @s[distance=..1.4] run return run function kartmobil:move/collision/finish-collision

    #작은&작은
    execute if entity @s[tag=kart-small-size] as @n[tag=carB,type=item_display] if entity @s[tag=kart-small-size] unless entity @s[distance=..1.3] run return run function kartmobil:move/collision/finish-collision

#탑승자에게 태그 주기
execute on passengers if entity @s[tag=kartsaddle,predicate=kartmobil:ifpassenger,type=#kartmobil:kartsaddle] on passengers run tag @s[predicate=kartmobil:ifride,type=player] add kartpassenger-collision
execute as @n[tag=carB,type=item_display] on passengers if entity @s[tag=kartsaddle,predicate=kartmobil:ifpassenger,type=#kartmobil:kartsaddle] on passengers run tag @s[predicate=kartmobil:ifride,type=player] add kartpassenger-collision

#소리 듣기
tag @a[tag=kartpassenger-collision] add kart-listener-collision
execute on passengers at @s[tag=kartdirection,type=item_display] on vehicle positioned ~ ~0.2 ~ positioned ^ ^ ^-1.5 run tag @a[gamemode=spectator,distance=..2] add kart-listener-collision
execute as @n[tag=carB,type=item_display] on passengers at @s[tag=kartdirection,type=item_display] on vehicle positioned ~ ~0.2 ~ positioned ^ ^ ^-1.5 run tag @a[gamemode=spectator,distance=..2] add kart-listener-collision

#방향 엔티티
tag @n[tag=kartdirection,type=item_display] add carAdirection
execute at @n[tag=carB,type=item_display] run tag @n[tag=kartdirection,tag=!carAdirection,type=item_display] add carBdirection
 
#서로 밀어내기
execute unless score @s kartcollisiontime matches 10.. unless score @n[tag=carB,type=item_display] kartcollisiontime matches 10.. run function kartmobil:move/collision/pushslowly

#충돌 연산 하기 - 쿨타임이 10 이상이면 리셋 포인트이므로 무시, 10 미만이면 하기
execute unless score @s kartcollisiontime matches 1.. unless score @n[tag=carB,type=item_display] kartcollisiontime matches 10.. run function kartmobil:move/collision/collisionmain
execute if score @s kartweirdcollisioncount matches 5.. unless score @n[tag=carB,type=item_display] kartcollisiontime matches 10.. run function kartmobil:move/collision/collisionmain
execute if score @s kartweirdcollisioncount matches 5.. run scoreboard players set @s kartweirdcollisioncount 0

#마무리
function kartmobil:move/collision/finish-collision