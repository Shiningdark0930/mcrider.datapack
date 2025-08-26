

execute if score @s licensecount matches 5 run function gamemain:getmapdata/movetomap


#11초(220) 안에 완주
bossbar set minecraft:license max 79500

bossbar set minecraft:license name {"text":"01:19.500 내로 완주","color":"aqua"}

execute store result bossbar minecraft:license value run scoreboard players get time timermain

execute if score time timermain matches 79501.. run function license:system/retirefail
#완주 못하면 리타이어

#체크포인트 통과
execute if score @s licensecount matches 61.. run function checkpoint:system/player-main

#결승선을 지나기
execute if block ~ ~-1.6 ~ magma_block if entity @s[tag=check-pass-last] run function license:system/passline
execute if score @s timelap >= #maxlap timelap run function license:system/pro/mission4complete
