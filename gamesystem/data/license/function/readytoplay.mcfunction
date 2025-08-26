execute as @a[x=-145,y=4,z=253,dx=92,dy=7,dz=10] run function bgm-room:manage-bgm/stopbgm

#만약 멀티 플레이, 제작자 대결, 타임어택, 라이센스 중 하나라도 플레이중이라면 return
execute if function gamemain:cannot-start-condition run return 1

execute unless items entity @p weapon *[minecraft:custom_data~{kartmobil:1}] run tellraw @a[distance=..50] [{"text":"손에 ","color":"red"},{"text":"탑승할 카트","color":"aqua"},{"text":"를 들어주세요.","color":"red"}]
execute unless items entity @p weapon *[minecraft:custom_data~{kartmobil:1}] run return 1

effect give @p minecraft:unluck 1 1 true

#게임 아이디 변경
scoreboard players add #max-id game-id 1
scoreboard players operation @p game-id = #max-id game-id

#게임 시작
$scoreboard players set @p licensestage $(licensestage)
scoreboard players set @p licensecount 1

#l2
execute if score @p licensestage matches 8 run scoreboard players set #map timeattack 6
execute if score @p licensestage matches 9 run scoreboard players set #map timeattack 4

#L1라센 브금
execute if score @p licensestage matches 11 run scoreboard players set #map timeattack 8
execute if score @p licensestage matches 12 run scoreboard players set #map timeattack 9
#프로라센 브금
execute if score @p licensestage matches 13 run scoreboard players set #map timeattack 5
execute if score @p licensestage matches 14 run scoreboard players set #map timeattack 24
execute if score @p licensestage matches 15 run scoreboard players set #map timeattack 23
execute if score @p licensestage matches 16 run scoreboard players set #map timeattack 18
execute if score @p licensestage matches 17 run scoreboard players set #map timeattack 1
#기본 브금 라센
execute unless score @p licensestage matches 8..9 unless score @p licensestage matches 11.. run scoreboard players set #map timeattack -1