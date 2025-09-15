#두 차의 속력을 그대로 스왑
scoreboard players operation #kartAvector kartmove = @n[tag=carA] kartmove
scoreboard players operation @n[tag=carA] kartmove = @n[tag=carB] kartmove
scoreboard players operation @n[tag=carB] kartmove = #kartAvector kartmove

