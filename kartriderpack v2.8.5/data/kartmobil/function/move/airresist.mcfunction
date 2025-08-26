scoreboard players operation #kartairresist kartmove = @s kartmove

#공기저항(카트 스피드 스펙을 고려)
scoreboard players operation #kartairresistconst kartmove = @s kartspeed

#부스터를 쓸 경우 84 증가
execute if score @s kartboosttime matches 1.. unless score @s kart-engine matches 8 run scoreboard players add #kartairresistconst kartmove 84

#pro엔진은 부스터를 안 써도 증가
execute if score @s kart-engine matches 8 run scoreboard players add #kartairresistconst kartmove 84

#jiu - 드래프트를 받으면 스피드 2 버프
execute if score @s kart-engine matches 2 if score @s kartmain matches 60..100 run scoreboard players add #kartairresistconst kartmove 2

#공기저항공식 - 속도의 제곱에 비례
scoreboard players operation #kartairresist kartmove *= #kart4 kartmain
scoreboard players operation #kartairresist kartmove /= #kartairresistconst kartmove

scoreboard players operation #kartairresist kartmove *= #kartairresist kartmove

scoreboard players operation #kartairresist kartmove *= #kart4 kartmain
scoreboard players operation #kartairresist kartmove /= #kartairresistconst kartmove

execute if score @s kartmove matches 1.. run scoreboard players operation @s kartmove -= #kartairresist kartmove
execute if score @s kartmove matches ..-1 run scoreboard players operation @s kartmove += #kartairresist kartmove
