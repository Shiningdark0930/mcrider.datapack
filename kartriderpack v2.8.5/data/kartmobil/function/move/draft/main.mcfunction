execute on passengers run tag @s[tag=kartdirection,type=marker] add kartdirectiontemp

#태그 주기
# tag @p[distance=..0.3,predicate=kartmobil:ifride] add kartpassenger
execute on passengers if entity @s[tag=kartsaddle,predicate=kartmobil:ifpassenger,type=#kartmobil:kartsaddle] on passengers run tag @s[predicate=kartmobil:ifride,type=player] add kartpassenger

#소리 듣기
tag @a[tag=kartpassenger] add kart-listener
execute on passengers at @s[tag=kartdirection,type=marker] on vehicle positioned ~ ~0.2 ~ positioned ^ ^ ^-1.5 run tag @a[gamemode=spectator,distance=..2] add kart-listener

#드래프트
scoreboard players set @s[tag=no-draft] kartmain -1
execute if score @s kartaccel matches 0.. unless score @s kartmain matches 60.. if score #kartspeed kartmove matches ..49 run scoreboard players reset @s kartmain
execute if score @s kartaccel matches 0.. unless score @s kartmain matches 60.. if score #kartspeed kartmove matches 50.. on passengers rotated as @s[tag=kartdirectiontemp,type=marker] on vehicle if function kartmobil:move/draft/draft-condition at @s run function kartmobil:move/draft/draft-charge
execute if score @s kartaccel matches 0.. unless score @s kartmain matches 60.. if score #kartspeed kartmove matches 50.. on passengers rotated as @s[tag=kartdirectiontemp,type=marker] on vehicle unless function kartmobil:move/draft/draft-condition run scoreboard players reset @s kartmain
execute if score @s kartmain matches 60..65 on passengers rotated as @s[tag=kartdirectiontemp,type=marker] on vehicle rotated ~ 0 run particle minecraft:gust ~ ~1 ~ .75 .75 .75 10 1 normal @a[distance=..15]

#태그 제거
execute on passengers run tag @s[tag=kartdirectiontemp] remove kartdirectiontemp
tag @a[tag=kartpassenger] remove kartpassenger
tag @a[tag=kart-listener] remove kart-listener
