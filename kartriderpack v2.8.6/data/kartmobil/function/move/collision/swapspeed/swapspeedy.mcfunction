#두 차의 속력을 그대로 스왑
scoreboard players operation ##kartAvector kartmovey = @n[tag=carA] kartmovey
scoreboard players operation @n[tag=carA] kartmovey = @n[tag=carB] kartmovey
scoreboard players operation @n[tag=carB] kartmovey = ##kartAvector kartmovey