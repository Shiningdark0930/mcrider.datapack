#아이디시스템(회수용)
scoreboard objectives add kartid dummy

#엔진 차별화용(플레이어)
scoreboard objectives add kart-engine dummy

#성능 차별화용
scoreboard objectives add kartspeed dummy
scoreboard objectives add kartaccel dummy
scoreboard objectives add kartboost dummy
scoreboard objectives add kartcorner dummy

scoreboard objectives add kartdrift dummy
scoreboard objectives add kartboostgaugecharge dummy
scoreboard objectives add kartboostduration dummy
scoreboard objectives add kartmaxboostcount dummy

scoreboard objectives add kartdefense dummy

#카트 물리엔진 변수
scoreboard objectives add kartmain dummy
scoreboard objectives add kartmove dummy
scoreboard objectives add kartmove-remain dummy
scoreboard objectives add kartmovey dummy

scoreboard objectives add kartboosttime dummy
scoreboard objectives add kartboostcount dummy
scoreboard objectives add kartboostgauge dummy

scoreboard objectives add kartcollisiontime dummy
scoreboard objectives add kartweirdcollisioncount dummy
scoreboard objectives add kartboostpadtime dummy

#방향키 엔진
scoreboard objectives add kart-wasd-rotation-speed dummy

#드리프트한 시간 - 톡톡이 모드를 위함
scoreboard objectives add kartdrifttime dummy

#뛰라이더 애님
scoreboard objectives add kart-run-anime dummy
scoreboard objectives add kart-run-anime-state dummy

#rotafix
scoreboard objectives add rotafix dummy

#상수
scoreboard players set #kart-1 kartmain -1

scoreboard players set #kart2 kartmain 2
scoreboard players set #kart3 kartmain 3
scoreboard players set #kart4 kartmain 4
scoreboard players set #kart5 kartmain 5
scoreboard players set #kart6 kartmain 6
scoreboard players set #kart10 kartmain 10
scoreboard players set #kart15 kartmain 15

scoreboard players set #kart55 kartmain 55
scoreboard players set #kart64 kartmain 64

scoreboard players set #kart100 kartmain 100
scoreboard players set #kart138 kartmain 138
scoreboard players set #kart139 kartmain 139
scoreboard players set #kart278 kartmain 278
scoreboard players set #kart360 kartmain 360

scoreboard players set #kart1000 kartmain 1000

#감속알림
bossbar add deceleration {"text":"감속 발생","color":"red","bold":true}
bossbar set minecraft:deceleration color red
bossbar set minecraft:deceleration value 100

#보트 엔진
function kartmobil:boat-engine/startset

#원점을 사용하기 위한 강제로드
execute positioned 0 0 0 run forceload add ~ ~
execute positioned 0 0 -1 run forceload add ~ ~
execute positioned -1 0 0 run forceload add ~ ~
execute positioned -1 0 -1 run forceload add ~ ~