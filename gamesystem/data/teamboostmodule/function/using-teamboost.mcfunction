#팀 부스터 보너스 가속
execute unless score @s kart-engine matches 0 unless score @s kart-engine matches 5 unless score @s kart-engine matches 7 run scoreboard players add @s kartmove 5

#부스터 시간 반복으로 1초 연장
execute if score @s kartboosttime matches 11 run scoreboard players add @s kart-teamboost-repeat-count 1
execute if score @s kartboosttime matches 11 run scoreboard players add @s kartboosttime 4