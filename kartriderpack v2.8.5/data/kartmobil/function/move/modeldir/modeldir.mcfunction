
#execute rotated as @a[tag=kartpassenger] run tp @n[distance=..0.00001,tag=kartdatacarrier,type=marker] ~ ~ ~ ~ 0
#50까지는 증가 그 후로는 감소
scoreboard players operation #kartangletemp kartmain = #kartangle kartmain
execute if score #kartangle kartmain matches -1100..-550 run scoreboard players set #kartangletemp kartmain -1100
execute if score #kartangle kartmain matches -1100..-550 run scoreboard players operation #kartangletemp kartmain -= #kartangle kartmain
execute if score #kartangle kartmain matches 550..1100 run scoreboard players set #kartangletemp kartmain 1100
execute if score #kartangle kartmain matches 550..1100 run scoreboard players operation #kartangletemp kartmain -= #kartangle kartmain

#고속턴 발작 고치기
execute unless score #kartangle kartmain matches -1100..1100 run scoreboard players set #kartangletemp kartmain 0

scoreboard players operation #kartangletemp kartmain /= #kart2 kartmain

execute store result score #kartplayerangle kartmain on passengers as @s[tag=kartdatacarrier,type=marker] run data get entity @s Rotation[0] 10
scoreboard players operation #kartplayerangle kartmain += #kartangletemp kartmain
#예외
execute if score #kartplayerangle kartmain matches 1800.. run scoreboard players remove #kartplayerangle kartmain 3600
execute if score #kartplayerangle kartmain matches ..-1800 run scoreboard players add #kartplayerangle kartmain 3600

execute on passengers if entity @s[tag=kartdatacarrier,type=marker] store result entity @s Rotation[0] float 0.1 run scoreboard players get #kartplayerangle kartmain

#execute on passengers rotated as @n[distance=..0.00001,tag=kartdatacarrier,type=marker] run data modify entity @s Rotation[0] set from entity @e[tag=kartdatacarrier,limit=1,sort=arbitrary,type=marker,distance=..0.1,limit=1,sort=arbitrary] Rotation[0]
execute on passengers if entity @s[tag=kartdatacarrier,type=marker] rotated as @s on vehicle on passengers if entity @s[tag=kartmodelsaddle,type=item_display] run rotate @s ~ 0
#execute on passengers as @s[tag=kartdatacarrier,type=marker] rotated as @s on vehicle on passengers run rotate @s[tag=kartsaddle,type=#kartmobil:kartsaddle] ~ 0
execute on passengers if entity @s[tag=kartsaddle,type=#kartmobil:kartsaddle] on passengers if entity @s[tag=kartpassenger,type=player] rotated as @s on vehicle on vehicle on passengers run function kartmobil:move/modeldir/21.5-dir
#kill @n[distance=..0.00001,tag=kartdatacarrier,type=marker]