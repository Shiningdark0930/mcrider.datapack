
#보조엔티티 탑승 + 각도 돌리기
execute as @e[tag=karttemp,tag=!kartmobil] run rotate @s ~ 0
execute as @e[tag=kartmodeltemp,tag=!kartmobil] run rotate @s ~ 0
rotate @n[distance=..0.01,tag=kartmobil,tag=karttemp,type=item_display] ~ 0

#모델링 이외 탑승
execute as @e[tag=karttemp,tag=!kartmobil] run ride @s mount @n[distance=..0.01,tag=kartmobil,tag=karttemp,type=item_display]

#모델링 탑승
execute as @e[tag=kartmodel,tag=kartmodeltemp,tag=!kartmobil] run ride @s mount @n[distance=..0.01,tag=kartmodelsaddle,tag=karttemp,type=item_display]

#플레이어 자동으로 태우기
ride @s mount @n[distance=..0.01,tag=kartsaddle,tag=karttemp,type=#kartmobil:kartsaddle]
playsound minecraft:entity.bat.takeoff neutral @s ~ ~ ~ 1 1

#플레이어와 카트의 아이디 일치(회수용)
execute unless score @s kartid = @s kartid store result score @s kartid run scoreboard players add #maxid kartid 1
scoreboard players operation @n[distance=..0.01,tag=kartmobil,tag=karttemp,type=item_display] kartid = @s kartid

#카트 0.01칸 올리기
execute at @n[distance=..0.01,tag=kartmobil,tag=karttemp,type=item_display] run tp @n[distance=..0.01,tag=kartmobil,tag=karttemp,type=item_display] ~ ~0.01 ~