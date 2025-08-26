
execute if score @s licensecount matches 5 run tp @s -689 46 875 0 0

#11초(220) 안에 완주
bossbar set minecraft:license max 30500

bossbar set minecraft:license name {"text":"00:30.500 내로 완주","color":"aqua"}

execute store result bossbar minecraft:license value run scoreboard players get time timermain

execute if score time timermain matches 30501.. run function license:system/retirefail
#완주 못하면 리타이어

#체크포인트 통과
execute if score @s licensecount matches 61.. run function checkpoint:system/player-main

#결승선을 지나기
execute if block ~ ~-1.6 ~ magma_block if entity @s[tag=check-pass-last] run function license:system/rookie/mission3complete

tag @e[tag=mykart,type=item_display] remove mykart