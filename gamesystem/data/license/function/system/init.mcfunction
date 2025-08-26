title @s times 0 20 20
scoreboard players reset time timermain

scoreboard players reset @s timelap

execute store result score #maxlap timelap run function gamemain:getmapdata/getmaxlap

function checkpoint:system/init