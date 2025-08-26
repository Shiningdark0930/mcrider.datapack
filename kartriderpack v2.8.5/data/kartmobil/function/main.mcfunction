#카트 자동 회수.
function kartmain:break-kart/break

#태그 주기
# tag @p[distance=..0.3,predicate=kartmobil:ifride] add kartpassenger
execute on passengers if entity @s[tag=kartsaddle,predicate=kartmobil:ifpassenger,type=#kartmobil:kartsaddle] on passengers run tag @s[predicate=kartmobil:ifride,type=player] add kartpassenger

#소리 듣기
tag @a[tag=kartpassenger] add kart-listener
execute on passengers at @s[tag=kartdirection,type=marker] on vehicle positioned ~ ~0.2 ~ positioned ^ ^ ^-1.5 run tag @a[gamemode=spectator,distance=..2] add kart-listener

#데이터캐리어를 플레이어 시선 전달자로 사용
execute rotated as @p[tag=kartpassenger,distance=..0.3] on passengers run rotate @s[tag=kartdatacarrier,type=marker] ~ 0

#플레이어 숨기기
execute if entity @s[distance=..0.3,tag=karthideplayer] run effect give @p[tag=kartpassenger,distance=..0.3] invisibility 1 1 true

#UI - 수치 1000은 1m/s임
scoreboard players operation #kartspeed kartmove = @s kartmove
scoreboard players operation #kartspeed kartmove /= #kart278 kartmain

#조작과 UI
execute unless score @s kart-engine matches 1004..1005 unless score @s kart-engine matches 9 run function kartmobil:control/control
execute if score @s kart-engine matches 1005 run function kartmobil:control/gear-mode/control
execute if score @s kart-engine matches 9 run function kartmobil:control/rally-mode/control

execute if entity @s[tag=kart-w-press] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] on passengers if entity @s[tag=kart-light] run function kartmobil:bright-blocks/light-on
execute if entity @s[tag=kart-w-release] on passengers if entity @s[tag=kartmodelsaddle,type=item_display] on passengers if entity @s[tag=kart-light] run function kartmobil:bright-blocks/light-off

#바닥과의 거리 감지
scoreboard players set floor-distance kartmain 0
execute if block ~ ~-0.1 ~ #kartmobil:ignoreblock align xyz positioned ~0.5 ~ ~0.5 run function kartmobil:detect-floor-distance

#PRO엔진 후처리
execute if entity @s[tag=pro-transform-need] run function kartmobil:pro-always-transform

#이동
function kartmobil:soundandfov/sound
execute unless score @s kart-engine matches 1004 if score @s kartmove matches 1.. run function kartmobil:move/move
execute if score @s kart-engine matches 1004 run function kartmobil:boat-engine/main

#중력
execute if block ~ ~-0.1 ~ #kartmobil:ignoreblock run scoreboard players add @s kartmovey 250

#낙하와 착지, 점프
scoreboard players operation #movetp-y kartmain = @s kartmovey
execute if score @s kartmovey matches 1.. unless block ~ ~-0.1 ~ #kartmobil:ignoreblock run function kartmobil:move/movetp/landing

execute if score #movetp-y kartmain matches 200.. at @s run function kartmobil:move/movetp/moveupdown/movedown
execute if score @s kartmovey matches 400.. on passengers if entity @s[tag=kartmodelsaddle,type=item_display] at @s run rotate @s ~ 7.5

execute if score #movetp-y kartmain matches ..-200 at @s run function kartmobil:move/movetp/moveupdown/moveup
execute if score @s kartmovey matches ..-400 on passengers if entity @s[tag=kartmodelsaddle,type=item_display] at @s run rotate @s ~ -7.5

#r키 고스팅
execute if score @s kartcollisiontime matches 10.. run function kartmobil:rkey-ghost/main

#충돌 쿨타임 및 뭉개기 카운트
scoreboard players remove @s[scores={kartcollisiontime=1..}] kartcollisiontime 1
scoreboard players remove @s[scores={kartcollisiontime=..0,kartweirdcollisioncount=1..}] kartweirdcollisioncount 1
#텔레포트 싱크
#execute if entity @a[tag=needsync,limit=1] run 
# function gamemain:teleport/sync

#모델 회전 보조
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 run function kartmobil:modeldir-support-vanilla
execute if score #sidite-cursed-mod kartmain matches 1 run function kartmobil:modeldir-support-sidite

#태그 제거
tag @a[tag=kartpassenger] remove kartpassenger
tag @a[tag=kart-listener] remove kart-listener