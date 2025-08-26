#가속력. 음수여도 양수로 취급
execute if score @s kartaccel matches 0.. run scoreboard players operation @s kartmove += @s kartaccel
execute if score @s kartaccel matches ..-1 run scoreboard players operation @s kartmove -= @s kartaccel

#마리오카트엔진 추가 가속
execute if score @s kart-engine matches 1003 run scoreboard players operation @s kartmove += @s kartboost

#부스터
execute if score @s kartboosttime matches 1.. unless score @s kart-engine matches 8 unless score @s kart-engine matches 1003 run scoreboard players operation @s kartmove += @s kartboost

execute if score @s kartboosttime matches 1.. if score @s kart-engine matches 8 run scoreboard players operation #kartboost-temp kartboost = @s kartboost
execute if score @s kartboosttime matches 1.. if score @s kart-engine matches 8 run scoreboard players operation #kartboost-temp kartboost /= #kart2 kartmain
execute if score @s kartboosttime matches 1.. if score @s kart-engine matches 8 run scoreboard players operation @s kartmove += #kartboost-temp kartboost


execute if score @s kart-engine matches 0 run function kartmobil:control/dualboost-accel/x
execute if score @s kart-engine matches 1 run function kartmobil:control/dualboost-accel/ex
execute if score @s kart-engine matches 5 run function kartmobil:control/dualboost-accel/v1
execute if score @s kart-engine matches 7 run function kartmobil:control/dualboost-accel/1.0

execute if score @s kart-engine matches 1001 run function kartmobil:control/dualboost-accel/x
