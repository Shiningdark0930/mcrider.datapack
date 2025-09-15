#이펙트 및 fov 초기화
execute as @a run attribute @s minecraft:movement_speed modifier remove 1-1-1-1-1
execute as @a run attribute @s minecraft:movement_speed modifier remove 1-1-1-1-2

#부스터 불꽃 숨기기
execute as @e[tag=kart-boost-flame-hide-finish,tag=kart-boost-flame-hide-finish-2,type=#kartmobil:kartmodels] run function kartmain:hide-flame-finish
tag @e[tag=kart-boost-flame-hide-finish,type=#kartmobil:kartmodels] add kart-boost-flame-hide-finish-2

#카트 메인 함수
tag @a[tag=kartdeceleration,predicate=kartmobil:ifride] remove kartdeceleration
execute as @e[tag=kartmobil,type=item_display] at @s run function kartmobil:main
bossbar set minecraft:deceleration players @a[tag=kartdeceleration,predicate=kartmobil:ifride]

#드래프트
execute as @e[tag=kartmobil,type=item_display] at @s if entity @e[tag=kartmobil,type=item_display,distance=1..30] run function kartmobil:move/draft/main

#충돌 판정
execute as @e[tag=kartmobil,tag=!no-collision,type=item_display] at @s if entity @n[tag=kartmobil,tag=!no-collision,distance=0.01..1.5,type=item_display] run function kartmobil:move/collision/onkartcollision
#execute as @e[tag=kartmobil,tag=!no-collision,type=item_display] at @s if entity @n[tag=kartmobil,tag=!no-collision,distance=0.01..1.5,type=item_display] run function kartmobil:boat-engine/move/collision


execute as @e[tag=kartmobil,tag=mad-crash-spin,tag=!no-collision,type=item_display] at @s run function kartmain:mad-crash-spin

#차량 소환
execute as @a if items entity @s weapon.offhand iron_nugget[minecraft:custom_data~{kartmobil:1}] at @s run function kartmobil:summon/summonkart
execute as @a if items entity @s weapon.offhand gold_nugget[minecraft:custom_data~{kartmobil:1}] at @s run function kartmobil:summon/summonkartbike