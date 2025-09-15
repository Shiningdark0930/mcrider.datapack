playsound minecraft:entity.zombie.attack_wooden_door neutral @a[tag=kart-listener-collision] ~ ~ ~ 0.2 2

#내 차가 벽충돌을 당했으면
execute at @n[tag=carA] facing entity @n[tag=carB] feet rotated ~180 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^ ^ ^1 #kartmobil:ignoreblock run scoreboard players add @n[tag=carB] kartweirdcollisioncount 1
execute at @n[tag=carB] facing entity @n[tag=carA] feet rotated ~180 0 align xyz positioned ~0.5 ~ ~0.5 unless block ^ ^ ^1 #kartmobil:ignoreblock run scoreboard players add @n[tag=carA] kartweirdcollisioncount 1

#서로서로 밀어내기(겹침 방지)
execute as @s at @s if entity @e[tag=carB,type=item_display,distance=..1.5] facing entity @e[tag=carB,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp
execute as @e[tag=carB,type=item_display] at @s if entity @e[tag=carA,type=item_display,distance=..1.5] facing entity @e[tag=carA,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp

execute as @s at @s if entity @e[tag=carB,type=item_display,distance=..1.5] facing entity @e[tag=carB,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp
execute as @e[tag=carB,type=item_display] at @s if entity @e[tag=carA,type=item_display,distance=..1.5] facing entity @e[tag=carA,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp

execute as @s at @s if entity @e[tag=carB,type=item_display,distance=..1.5] facing entity @e[tag=carB,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp
execute as @e[tag=carB,type=item_display] at @s if entity @e[tag=carA,type=item_display,distance=..1.5] facing entity @e[tag=carA] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp

execute as @s at @s if entity @e[tag=carB,type=item_display,distance=..1.5] facing entity @e[tag=carB,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp
execute as @e[tag=carB,type=item_display] at @s if entity @e[tag=carA,type=item_display,distance=..1.5] facing entity @e[tag=carA,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp

execute as @s at @s if entity @e[tag=carB,type=item_display,distance=..1.5] facing entity @e[tag=carB,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp
execute as @e[tag=carB,type=item_display] at @s if entity @e[tag=carA,type=item_display,distance=..1.5] facing entity @e[tag=carA,type=item_display] feet rotated ~180 0 positioned ^ ^ ^0.2 if block ^ ^ ^0.4 #kartmobil:ignoreblock run function kartmobil:move/movetp/tp-bug-fix/tp
