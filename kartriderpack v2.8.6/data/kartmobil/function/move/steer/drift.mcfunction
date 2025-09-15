scoreboard players add @s kartdrifttime 1

#속도계 패치 전의 게충 시뮬레이션
scoreboard players operation #kartboostgauge kartmove = @s kartmove
scoreboard players operation #kartboostgauge kartmove /= #kart360 kartmain

#kartboostgauge == 부스터게이지 (@s kartboostgaugecharge는 게충) + 속도 60 이하일 때 게충 보너스
execute unless score @s kart-engine matches 1003 unless score @s kart-engine matches 1002..1003 if score floor-distance kartmain matches ..1 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartboostgauge += #kartboostgauge kartmove
execute unless score @s kart-engine matches 1003 if score @s kart-engine matches 1002..1003 if score floor-distance kartmain matches ..1 if score #kartspeed kartmove matches 25.. unless score #kartangle kartmain matches -250..250 run scoreboard players operation @s kartboostgauge += #kartboostgauge kartmove
execute unless score @s kart-engine matches 1003 if score floor-distance kartmain matches ..1 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartboostgauge += @s kartboostgaugecharge
execute unless score @s kart-engine matches 1003 if score floor-distance kartmain matches ..1 if score #kartspeed kartmove matches 25.. unless score @s kartmove matches 21600.. run scoreboard players add @s kartboostgauge 15
execute unless score @s kart-engine matches 1003 if score floor-distance kartmain matches ..1 if score @s kartboostpadtime matches 1.. run scoreboard players add @s kartboostgauge 25

#1.0엔진 - 공중 게충 부활
execute if score @s kart-engine matches 7 unless score floor-distance kartmain matches ..1 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartboostgauge += #kartboostgauge kartmove
execute if score @s kart-engine matches 7 unless score floor-distance kartmain matches ..1 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartboostgauge += @s kartboostgaugecharge

#감속(코너링 잠재력 고려, 10 - 10/6 = 8.33) / 1.0엔진은 감속이 심함
scoreboard players operation #kartdecel kartmain = #kartangleabs kartmain
execute if score @s kart-engine matches 7 run scoreboard players set #kartdecel kartmain 0
execute unless score @s kart-engine matches 7 run scoreboard players operation #kartdecel kartmain /= #kart6 kartmain

#마리오카트 엔진은 감속이 없음
execute unless score @s kart-engine matches 1003 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartmove -= @s kartcorner
execute unless score @s kart-engine matches 1003 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartmove -= #kartangleabs kartmain
execute unless score @s kart-engine matches 1003 if score #kartspeed kartmove matches 25.. run scoreboard players operation @s kartmove += #kartdecel kartmain

#톡톡이
execute if score @s[tag=drag-accel] kartdrifttime matches 15.. run function kartmobil:move/steer/drag-accel/mode-drag-accel
execute unless score @s[tag=!drag-accel] kart-engine matches 1000..1003 run function kartmobil:move/steer/drag-accel/default-drag-accel
execute if score @s kart-engine matches 1000 run function kartmobil:move/steer/drag-accel/n1-drag-accel
execute if score @s kart-engine matches 1001 run function kartmobil:move/steer/drag-accel/n1-drag-accel
#execute if score @s kart-engine matches 1001 run function kartmobil:move/steer/drag-accel/rx-drag-accel
execute if score @s kart-engine matches 1002 run function kartmobil:move/steer/drag-accel/a2-d-drag-accel

#저속 무감속
execute if score #kartspeed kartmove matches ..-25 run scoreboard players operation @s kartmove += #kartangleabs kartmain

#이펙트
execute on passengers at @s[tag=kartdatacarrier,type=marker] on vehicle run function kartmobil:move/steer/drifteffect