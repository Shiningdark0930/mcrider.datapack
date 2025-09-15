scoreboard players set #kartdrift kartmain 230400
scoreboard players operation #kartdrift-player kartmain = @s kartdrift
scoreboard players operation #kartdrift-player kartmain += @p[tag=kartpassenger,distance=..0.3] kartdrift
scoreboard players operation #kartdrift kartmain /= #kartdrift-player kartmain

execute store result storage kartmain driftmacro float 0.1 run scoreboard players get #kartdrift kartmain

#1.0엔진 - 낮은 피치각 물리
execute if score @s kartmove matches 1000.. if score @s kart-engine matches 7 if score @s kartaccel matches 0.. on passengers as @s[tag=kartdirectiontemp,type=item_display] at @s anchored eyes rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 23.5 positioned ^ ^ ^5 rotated as @s run function kartmobil:move/steer/drift-physics/driftmacro with storage kartmain
#다른 엔진
execute if score @s kartmove matches 1000.. unless score @s kart-engine matches 7 if score @s kartaccel matches 0.. on passengers as @s[tag=kartdirectiontemp,type=item_display] at @s anchored eyes rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 35 positioned ^ ^ ^5 rotated as @s run function kartmobil:move/steer/drift-physics/driftmacro with storage kartmain
execute if score @s kartmove matches 1000.. if score @s kartaccel matches ..-1 on passengers as @s[tag=kartdirectiontemp,type=item_display] at @s anchored eyes rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~180 35 positioned ^ ^ ^5 rotated as @s run function kartmobil:move/steer/drift-physics/driftmacro-back with storage kartmain
execute if score @s kartmove matches ..999 on passengers as @s[tag=kartdirectiontemp,type=item_display] run function kartmobil:move/steer/drift-physics/driftmacro-lowspeed

#동적인 드탈 보정값 초기화
scoreboard players set @p[tag=kartpassenger,distance=..0.3] kartdrift 0
