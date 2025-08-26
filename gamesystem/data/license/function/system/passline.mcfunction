scoreboard players add @s timelap 2

execute if score @s timelap = #maxlap timelap run function lapsound:play
execute if score @s timelap = #maxlap timelap run title @s title [{"text":"마지막 바퀴","color":"yellow"}]
execute unless score @s timelap >= #maxlap timelap run function lapsound1:play
execute unless score @s timelap >= #maxlap timelap run title @s title [{"score":{"name":"@s","objective":"timelap","color":"yellow"},"color":"yellow"},{"text":"바퀴째","color":"yellow"}]

scoreboard players remove @s timelap 1

function checkpoint:system/init