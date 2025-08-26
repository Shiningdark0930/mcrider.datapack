#두 차의 속력을 평균
scoreboard players operation #kart-speed-sum kartmove = @n[tag=carA] kartmove
scoreboard players operation #kart-speed-sum kartmove += @n[tag=carB] kartmove
scoreboard players operation #kart-speed-sum kartmove /= #kart2 kartmain

scoreboard players operation @n[tag=carA] kartmove = #kart-speed-sum kartmove
scoreboard players operation @n[tag=carB] kartmove = #kart-speed-sum kartmove