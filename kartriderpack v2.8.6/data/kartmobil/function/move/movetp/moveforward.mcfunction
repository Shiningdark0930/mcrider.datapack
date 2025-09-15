
#내려가기
execute if block ~ -64 ~ honey_block run function kartmobil:move/movetp/stepdown

#올라가기
execute if score #kartspeed kartmove matches 25.. run function kartmobil:move/movetp/stepup
execute if score #kartspeed kartmove matches 13..24 run function kartmobil:move/movetp/stepupatlowspeed

#대각선 벽통과 막기
execute positioned as @s rotated ~45 0 unless block ^ ^ ^0.7 #kartmobil:ignoreblock rotated ~-90 0 unless block ^ ^ ^0.7 #kartmobil:ignoreblock run return 1

#이진tp + 점프/부스터패드
execute positioned as @s if block ~ ~-0.5 ~ #kartmobil:jumpboostpad run function kartmobil:move/movetp/jump-and-boost/pad-detect
execute positioned as @s if block ~ ~-1.5 ~ #kartmobil:jumpboostpad run function kartmobil:move/movetp/jump-and-boost/pad-detect

execute if score @s kartmove-remain matches 8000.. positioned as @s if block ^ ^ ^0.5 #kartmobil:ignoreblock if block ^ ^1 ^0.5 #kartmobil:ignoreblock positioned ^ ^ ^0.4 run function kartmobil:move/movetp/tp-bug-fix/tp
execute if score @s kartmove-remain matches 8000.. run scoreboard players remove @s kartmove-remain 8000

execute positioned as @s if block ~ ~-0.5 ~ #kartmobil:jumpboostpad run function kartmobil:move/movetp/jump-and-boost/pad-detect
execute positioned as @s if block ~ ~-1.5 ~ #kartmobil:jumpboostpad run function kartmobil:move/movetp/jump-and-boost/pad-detect

execute if score @s kartmove-remain matches 4000.. positioned as @s if block ^ ^ ^0.5 #kartmobil:ignoreblock if block ^ ^1 ^0.5 #kartmobil:ignoreblock positioned ^ ^ ^0.2 run function kartmobil:move/movetp/tp-bug-fix/tp
execute if score @s kartmove-remain matches 4000.. run scoreboard players remove @s kartmove-remain 4000

execute if score @s kartmove-remain matches 2000.. positioned as @s if block ^ ^ ^0.5 #kartmobil:ignoreblock if block ^ ^1 ^0.5 #kartmobil:ignoreblock positioned ^ ^ ^0.1 run function kartmobil:move/movetp/tp-bug-fix/tp
execute if score @s kartmove-remain matches 2000.. run scoreboard players remove @s kartmove-remain 2000

execute if score @s kartmove-remain matches 1000.. positioned as @s if block ^ ^ ^0.5 #kartmobil:ignoreblock if block ^ ^1 ^0.5 #kartmobil:ignoreblock positioned ^ ^ ^0.05 run function kartmobil:move/movetp/tp-bug-fix/tp
execute if score @s kartmove-remain matches 1000.. run scoreboard players remove @s kartmove-remain 1000

#벽피하기
execute positioned as @s rotated 0 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main
execute positioned as @s rotated 90 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main
execute positioned as @s rotated 180 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main
execute positioned as @s rotated -90 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main

execute positioned as @s rotated 45 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main
execute positioned as @s rotated -45 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main
execute positioned as @s rotated 135 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main
execute positioned as @s rotated -135 0 unless block ^ ^ ^1 #kartmobil:ignoreblock run function kartmobil:move/movetp/wallcollision/main

execute if score @s kartmove-remain matches 1000.. run function kartmobil:move/movetp/moveforward