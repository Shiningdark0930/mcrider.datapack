tag @s[tag=a2-using-instant-boost] remove a2-using-instant-boost

#부스터 쿨타임(일부러 부스터 사이에 텀을 만들기)
scoreboard players set @p[tag=kartpassenger,distance=..0.3] kartboosttime 2

function kartmobil:move/boost-effect/show-boost-model/hide-flame

#서서히 줄어드는 불(jiu) 판정 제거
execute on passengers if entity @s[tag=kartmodelsaddle,type=item_display] on passengers run tag @s[tag=kart-boost-flame,tag=kart-boost-flame-slow-fade,type=#kartmobil:kartmodels] remove kart-boost-flame-slow-fade
execute if entity @s[tag=shadow-main] on passengers run tag @s[tag=kart-boost-flame,tag=kart-boost-flame-slow-fade,type=#kartmobil:kartmodels] remove kart-boost-flame-slow-fade

#블록 숨기기 (jiu는 자동변신이 있으므로 무시)
##sidite 분기
execute if score #sidite-cursed-mod kartmain matches 0 unless score @s kart-engine matches 2 unless score @s kart-engine matches 1000 run function kartmobil:move/boost-effect/show-boost-model/hide-block
execute if score #sidite-cursed-mod kartmain matches 1 unless score @s kart-engine matches 2 unless score @s kart-engine matches 1000 run function kartmobil:move/boost-effect/show-boost-model/hide-block