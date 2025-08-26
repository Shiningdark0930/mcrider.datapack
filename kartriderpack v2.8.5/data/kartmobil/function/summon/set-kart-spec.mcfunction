#아이템을 기반으로 카트의 커스텀 성능 설정
execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartspeed run data get entity @s equipment.offhand.components.minecraft:custom_data.speed
execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartaccel run data get entity @s equipment.offhand.components.minecraft:custom_data.accel
execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartboost run data get entity @s equipment.offhand.components.minecraft:custom_data.boost

#실제 내부적으로 적용되는 코너링 = 300 - 수치, 높을수록 안 좋음
scoreboard players set @n[tag=kartmobil,tag=karttemp,type=item_display] kartcorner 300
execute store result score #kartcornertemp kartcorner run data get entity @s equipment.offhand.components.minecraft:custom_data.corner
scoreboard players operation @n[tag=kartmobil,tag=karttemp,type=item_display] kartcorner -= #kartcornertemp kartcorner

execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartdrift run data get entity @s equipment.offhand.components.minecraft:custom_data.drift
execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartboostgaugecharge run data get entity @s equipment.offhand.components.minecraft:custom_data.gauge
execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartboostduration run data get entity @s equipment.offhand.components.minecraft:custom_data.boosttime
execute store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartdefense run data get entity @s equipment.offhand.components.minecraft:custom_data.defense

scoreboard players set @n[tag=kartmobil,tag=karttemp,type=item_display] kartmaxboostcount 2
execute if data entity @s equipment.offhand.components.minecraft:custom_data.maxboostcount store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kartmaxboostcount run data get entity @s equipment.offhand.components.minecraft:custom_data.maxboostcount

#작은 벽 충돌(붓 등)
execute store result score #size kartdefense run data get entity @s equipment.offhand.components.minecraft:custom_data.size
execute if score #size kartdefense matches 0 run tag @n[tag=kartmobil,tag=karttemp,type=item_display] add kart-small-size
execute if score #size kartdefense matches 1 run tag @n[tag=kartmobil,tag=karttemp,type=item_display] add kart-mid-size
                                          #2는 기본 크기
execute if score #size kartdefense matches 3 run tag @n[tag=kartmobil,tag=karttemp,type=item_display] add kart-large-size

#성능 조절
scoreboard players add @n[tag=kartmobil,tag=karttemp,type=item_display] kartboostgaugecharge 2

#플레이어 숨기기 여부
execute store result score #karthidetemp kartmain run data get entity @s equipment.offhand.components.minecraft:custom_data.hideplayer
execute if score #karthidetemp kartmain matches 1 if items entity @s armor.head leather_helmet run item replace entity @s armor.head with air
execute if score #karthidetemp kartmain matches 1 run tag @n[tag=kartmobil,tag=karttemp,type=item_display] add karthideplayer

    #엔진
    scoreboard players set @e[tag=kartmobil,tag=karttemp,type=item_display] kart-engine 0
    execute unless score @s kart-engine = @s kart-engine run scoreboard players set @s kart-engine 0
    scoreboard players operation @e[tag=kartmobil,tag=karttemp,type=item_display] kart-engine = @s kart-engine

    #엔진이 고정된 카트인지 감지
    execute as @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!shadow-models] if data entity @s data.engine-fix store result score @n[tag=kartmobil,tag=karttemp,type=item_display] kart-engine run data get entity @s data.engine-fix
    execute as @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!shadow-models] if data entity @s data.engine-fix run tellraw @p {"text":"[🔒] 특정 엔진으로 고정된 카트입니다.","color":"red"}
    
#데이터 캐리어에 아이템 정보 등록
data modify entity @n[tag=kartdatacarrier,tag=karttemp,type=marker] data.itemdata set from entity @s equipment.offhand
item replace entity @s weapon.offhand with air

#엔진에 따른 버프
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 1 run function kartmobil:summon/kart-spec-consider-engine/ex
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 2 run function kartmobil:summon/kart-spec-consider-engine/jiu
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 3 run function kartmobil:summon/kart-spec-consider-engine/new
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 4 run function kartmobil:summon/kart-spec-consider-engine/z7
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 5 run function kartmobil:summon/kart-spec-consider-engine/v1
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 6 run function kartmobil:summon/kart-spec-consider-engine/a2
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 7 run function kartmobil:summon/kart-spec-consider-engine/1.0
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 8 run function kartmobil:summon/kart-spec-consider-engine/pro
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 9 run function kartmobil:summon/kart-spec-consider-engine/rally

execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 1000 run function kartmobil:summon/kart-spec-consider-engine/dummy/n1
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 1001 run function kartmobil:summon/kart-spec-consider-engine/dummy/rx
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 1002 run function kartmobil:summon/kart-spec-consider-engine/dummy/a2-d-keyboard
execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 1003 run function kartmobil:summon/kart-spec-consider-engine/dummy/mario

execute as @n[tag=kartmobil,tag=karttemp,type=item_display] if score @s kart-engine matches 1005 run function kartmobil:summon/kart-spec-consider-engine/dummy/gear



