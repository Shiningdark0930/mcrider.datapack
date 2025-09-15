#이펙트 및 fov 초기화
execute as @a run attribute @s minecraft:movement_speed modifier remove 1-1-1-1-1
execute as @a run attribute @s minecraft:movement_speed modifier remove 1-1-1-1-2

kfchideflamefinish2
kfchideflamefinish
kfcmain
kfcsync
kfcdraft
kfccollision
kfcmadcrashspin

#차량 소환
execute as @a if items entity @s weapon.offhand iron_nugget[minecraft:custom_data~{kartmobil:1}] at @s run function kartmobil:summon/summonkart
execute as @a if items entity @s weapon.offhand gold_nugget[minecraft:custom_data~{kartmobil:1}] at @s run function kartmobil:summon/summonkartbike