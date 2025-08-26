
execute if score @s licensecount matches 5 run tp @s 65 8 402 0 0
#11초(220) 안에 완주
bossbar set minecraft:license max 17250

bossbar set minecraft:license name {"text":"00:17.250 내로 완주","color":"aqua"}

execute store result bossbar minecraft:license value run scoreboard players get time timermain

execute if score time timermain matches 17251.. run function license:system/retirefail
execute if block ~ ~-0.75 ~ grass_block run function license:system/retirefail
#완주 못하면 리타이어

#결승선을 지나기
execute if block ~ ~-1.6 ~ end_stone run function license:system/l3/mission2complete

tag @e[tag=mykart,type=item_display] remove mykart