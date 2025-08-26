tag @s add kartself
execute on passengers run tag @s[tag=kartdirection,type=marker] add kartdirectiontemp

#각도 차이용 정보 저장(플레이어 nbt접근 우회), 10을 곱함
execute store result score #kartangle kartmain on passengers if entity @s[tag=kartdatacarrier,type=marker] run data get entity @s Rotation[0] 10
execute store result score #kartdirectionangle kartmain on passengers if entity @s[tag=kartdirectiontemp,type=marker] run data get entity @s Rotation[0] 10

#조향각 및 조향각의 절댓값 구하기
function kartmobil:move/steer/getsteerangle

#그립주행 감속 - 기어
execute if score @s[tag=!kart-drifting] kart-engine matches 1005 unless score #kartangle kartmain matches -75..75 run scoreboard players remove @s kartmove 38
execute if score @s[tag=!kart-drifting] kart-engine matches 1005 unless score #kartangle kartmain matches -125..125 run scoreboard players remove @s kartmove 38

#드리프트 시작
execute if score @s kart-engine matches 6 if entity @p[tag=kartpassenger,tag=kart-infinity-sunbu] on passengers run scoreboard players set @s[tag=kartdirection] kartdrifttime 20
execute unless score @s[tag=!kart-drifting] kart-engine matches 1003 unless score @s[tag=!kart-drifting] kart-engine matches 9 unless score #kartangle kartmain matches -250..250 run function kartmobil:move/steer/drift-start
execute if score @s[tag=!kart-drifting] kart-engine matches 9 unless score #kartangle kartmain matches -150..150 run function kartmobil:move/steer/drift-start

#드리프트
execute if entity @s[tag=kart-drifting] run function kartmobil:move/steer/drift

#드리프트 마무리
execute unless score @s kart-engine matches 1000 unless score @s kart-engine matches 1002..1003 if score #kartangle kartmain matches -250..250 if entity @s[tag=kart-drifting] run function kartmobil:move/steer/drift-end

execute if score @s kart-engine matches 1000 if score #kartangle kartmain matches -100..100 if entity @s[tag=kart-drifting] run function kartmobil:move/steer/drift-end
execute if score @s kart-engine matches 1002 unless score @s kartdrifttime matches 8.. if score #kartangle kartmain matches -5..5 if entity @s[tag=kart-drifting] run function kartmobil:move/steer/drift-end
execute if score @s kart-engine matches 1002 if score @s kartdrifttime matches 8.. if score #kartangle kartmain matches -250..250 if entity @s[tag=kart-drifting] run function kartmobil:move/steer/drift-end
execute if score @s kart-engine matches 9 if score #kartangle kartmain matches -150..150 if entity @s[tag=kart-drifting] run function kartmobil:move/steer/drift-end

execute unless score @s kart-engine matches 1003 unless score @s kart-engine matches 9 if score @s[tag=!kart-drifting] kartboostgauge matches 2000.. run function kartmobil:move/steer/getboost

#모델링 회전(1.0엔진은 발작 모델링 재현)
execute if score @s kart-engine matches 7 if score @s[tag=!kart-stop] kartmove matches 1.. run function kartmobil:move/modeldir/1.0-modeldir
execute unless score @s kart-engine matches 7 if score @s[tag=!kart-stop] kartmove matches 1.. run function kartmobil:move/modeldir/modeldir

#부스터 및 부스터 발판 타이머
function kartmobil:move/boost-effect/boost-main
execute if score @s kartboostpadtime matches 1.. run scoreboard players remove @s kartboostpadtime 1

#뛰라이더
execute unless score @s kart-engine matches 7 if entity @s[tag=kart-use-run-anime] run function kartmobil:move/run-anime/main

#A2 - 순부
execute if score @s kart-engine matches 6 run function kartmobil:move/instant-boost/instant-boost
execute if score @s kart-engine matches 8 run function kartmobil:move/instant-boost/instant-boost
execute if entity @s[tag=!a2-using-instant-boost] on passengers if score @s[tag=kartdirection] kartmove matches 1.. run scoreboard players remove @s kartmove 1
execute if entity @s[tag=!a2-using-instant-boost] on passengers if score @s[tag=kartdirection] kartmove matches ..-1 run scoreboard players add @s kartmove 1

#V1 - 익시드
execute if score @s[tag=!can-jump] kart-engine matches 5 run function kartmobil:move/v1-exceed/main

#업다운 - 점프
execute if entity @p[tag=kartpassenger,distance=..0.3,predicate=kartmobil:space] if entity @s[tag=can-jump,tag=!kart-jumped] unless score @s kartmovey matches 1000.. run function kartmobil:move/jump

#전진(1.0은 디더링 없음)
scoreboard players set @s[tag=kart-stop] kartmove 0

execute if score @s kart-engine matches 7 run scoreboard players set @s kartmove-remain 0
execute if score @s kartmove-remain matches 10000.. run scoreboard players set @s kartmove-remain 0
scoreboard players operation @s[tag=!kart-stop] kartmove-remain += @s kartmove

    #kart-old-velocity - 저항과 드리프트 연산 전에 미리
    execute on passengers if entity @s[tag=kart-old-velocity] run scoreboard players operation @s kartmove = @n[tag=kartself,type=item_display] kartmove-remain
    execute on passengers if entity @s[tag=kartdirectiontemp] rotated as @s rotated ~ 0 on vehicle on passengers if entity @s[tag=kart-old-velocity] run rotate @s ~ ~

tag @s[tag=kart-command-pad-executed] remove kart-command-pad-executed
execute if score @s[tag=!kart-stop] kartmove-remain matches 1000.. at @s on passengers rotated as @s[tag=kartdirectiontemp,type=marker] on vehicle rotated ~ 0 run function kartmobil:move/movetp/moveforward

#드래프트 쿨타임 및 보조 가속(@s kartmain)
execute if score @s kartmain matches 60.. run scoreboard players add @s kartmain 1
execute if score @s kartmain matches 200.. run scoreboard players reset @s kartmain

#마찰저항 / 공기저항
execute if score @s kartmove matches 20.. run scoreboard players remove @s kartmove 20
execute if score @s kartmove matches 1000.. if block ~ ~-0.5 ~ soul_sand run tag @p[tag=kartpassenger] add kartdeceleration
execute if score @s kartmove matches 1000.. unless block ~ ~-0.5 ~ soul_sand if block ~ ~-1.5 ~ soul_sand run tag @p[tag=kartpassenger] add kartdeceleration

execute if entity @p[tag=kartpassenger,tag=kartdeceleration] run scoreboard players remove @s kartmove 350
execute unless score @s kart-engine matches 1005 unless score @s kart-engine matches 9 run function kartmobil:move/airresist
execute if score @s kart-engine matches 1005 run function kartmobil:move/airresist-gear
execute if score @s kart-engine matches 9 run function kartmobil:move/airresist-rally

#드리프트 탈출력 + 드리프트 물리
function kartmobil:move/steer/drift-physics/main

execute on passengers run tag @s[tag=kartdirectiontemp] remove kartdirectiontemp
tag @s remove kartself