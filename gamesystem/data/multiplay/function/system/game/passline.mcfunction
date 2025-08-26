scoreboard players add @s multi-lap 2

execute if score @s multi-lap = #max-lap multi-lap run function lapsound:play
execute if score @s multi-lap = #max-lap multi-lap run title @s title [{"text":"마지막 바퀴","color":"yellow"}]
execute unless score @s multi-lap >= #max-lap multi-lap run function lapsound1:play
execute unless score @s multi-lap >= #max-lap multi-lap run title @s title [{"score":{"name":"@s","objective":"multi-lap","color":"yellow"},"color":"yellow"},{"text":"바퀴째","color":"yellow"}]

scoreboard players remove @s multi-lap 1

function checkpoint:system/init