
#속력을 스왑
function kartmobil:move/collision/swapspeed/e0.5
function kartmobil:move/collision/swapspeed/swapspeedy

#뭉개기를 많이 했을 경우 벌을 받아야겠지?
scoreboard players remove @n[tag=carA,scores={kartweirdcollisioncount=5..,kartmove=5000..}] kartmove 5000
scoreboard players remove @n[tag=carB,scores={kartweirdcollisioncount=5..,kartmove=5000..}] kartmove 5000

#A와 B의 y벡터를 스왑
execute store result storage kartmain kartAdefense int 1 run scoreboard players get @n[tag=carA] kartdefense
execute store result storage kartmain kartBdefense int 1 run scoreboard players get @n[tag=carB] kartdefense
function kartmobil:move/collision/swap-direction with storage kartmain

kill @e[tag=carAvector]
