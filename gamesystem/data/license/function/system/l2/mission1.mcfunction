
execute if score @s licensecount matches 5 run tp @s -64 4 434 0 0

#11초(220) 안에 완주
bossbar set minecraft:license max 16250

bossbar set minecraft:license name {"text":"00:16.250 내로 부스터 1개 이상 보유한 채 완주","color":"aqua"}

execute store result bossbar minecraft:license value run scoreboard players get time timermain

execute if score time timermain matches 16251.. run function license:system/retirefail
#완주 못하면 리타이어

#결승선을 지나기
execute if block ~ ~-1.6 ~ end_stone if score @n[tag=kartmobil,type=item_display] kartboostcount matches 1.. run function license:system/l2/mission1complete
execute if block ~ ~-1.6 ~ end_stone unless score @n[tag=kartmobil,type=item_display] kartboostcount matches 1.. run tellraw @s {"text":"부스터를 1개 이상 보유하지 않아 탈락했습니다.","color":"red"}
execute if block ~ ~-1.6 ~ end_stone unless score @n[tag=kartmobil,type=item_display] kartboostcount matches 1.. run function license:system/retire
