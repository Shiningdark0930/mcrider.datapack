

#위치
data modify storage timeattack:timeattack-shadows temp-shadow.pos append from entity @n[tag=kartmobil,type=item_display,distance=..1,limit=1] Pos
#회전각도
execute as @n[tag=kartmodel,type=#kartmobil:modeldir] run data modify storage timeattack:timeattack-shadows temp-shadow.rotation append from entity @s Rotation
#부스터 타이밍
execute store result storage timeattack:timeattack-shadows temp-booster int 1 run scoreboard players get @n[tag=kartmobil,type=item_display,distance=..1,limit=1] kartboosttime
data modify storage timeattack:timeattack-shadows temp-shadow.booster append from storage timeattack:timeattack-shadows temp-booster