#ex-dual-boost-end-time kartboostduration
scoreboard players operation #ex-boost-first-tick kartboostduration = @s kartboostduration
scoreboard players remove #ex-boost-first-tick kartboostduration 1

scoreboard players operation #ex-boost-first-tick-minus-8 kartboostduration = @s kartboostduration
scoreboard players remove #ex-boost-first-tick-minus-8 kartboostduration 8

#부스터 파티클
particle dust{color:[0, 0, 1], scale:1} ~ ~ ~ .75 .75 .75 1 1

#부스터 소리
execute if score @s kartboosttime = #ex-boost-first-tick kartboostduration run function kartmobil:move/boost-effect/pro/boost-sound
execute if score @s kartboosttime = #ex-boost-first-tick-minus-8 kartboostduration run playsound minecraft:entity.breeze.shoot neutral @a[tag=kart-listener] ~ ~ ~ 1.5 0 1

#부스터 불꽃 보이기
execute if score @s kartboosttime <= #ex-boost-first-tick kartboostduration run function kartmobil:move/boost-effect/show-boost-model/show-flame

#마무리 모션
execute if score @s kartboosttime matches 0 run function kartmobil:move/boost-effect/force-cut-boost

