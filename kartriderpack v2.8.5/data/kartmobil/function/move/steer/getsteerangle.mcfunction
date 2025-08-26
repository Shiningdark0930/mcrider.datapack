
#이전 틱과 현재 틱의 각도 차이(드리프트 각도) + 절댓값 구하기
execute if score @s kartaccel matches ..-1 run scoreboard players add #kartangle kartmain 1800
scoreboard players operation #kartangle kartmain -= #kartdirectionangle kartmain
execute if score #kartangle kartmain matches 1800.. run scoreboard players remove #kartangle kartmain 3600
execute if score #kartangle kartmain matches ..-1800 run scoreboard players add #kartangle kartmain 3600

#회전 각도 차이의 절댓값 구하기
scoreboard players operation #kartangleabs kartmain = #kartangle kartmain
execute if score #kartangleabs kartmain matches ..-1 run scoreboard players operation #kartangleabs kartmain *= #kart-1 kartmain