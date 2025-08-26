execute as @e[tag=kite-lock,type=minecraft:interaction] on attacker run function multiplay:lever/lock-notify
execute as @e[tag=kite-lock,type=minecraft:interaction] on target run function multiplay:lever/lock-notify
execute as @e[tag=kite-lock,type=minecraft:interaction] run data remove entity @s attack
execute as @e[tag=kite-lock,type=minecraft:interaction] run data remove entity @s interaction