#ex-dual-boost-end-time kartboostduration
scoreboard players operation #ex-boost-first-tick kartboostduration = @s kartboostduration
scoreboard players remove #ex-boost-first-tick kartboostduration 1

#부스터 파티클
particle dust{color:[1f, 0.5f, 0.5f], scale:1} ~ ~ ~ .75 .75 .75 1 1

#부스터 소리
execute if score @s kartboosttime = #ex-boost-first-tick kartboostduration run function kartmobil:move/boost-effect/jiu/boost-sound
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 if score @s kartboosttime = #ex-boost-first-tick kartboostduration run function kartmobil:move/boost-effect/show-boost-model/show-flame
execute if score #sidite-cursed-mod kartmain matches 1 if score @s kartboosttime = #ex-boost-first-tick kartboostduration run function kartmobil:move/boost-effect/show-boost-model/show-flame-sidite

#마무리 모션
execute if score @s kartboosttime matches 0 run function kartmobil:move/boost-effect/force-cut-boost