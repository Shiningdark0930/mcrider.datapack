scoreboard players add @s dev-lap 2

execute if score @s dev-lap = #maxlap dev-lap run function lapsound:play
execute if score @s dev-lap = #maxlap dev-lap run title @s title [{"text":"마지막 바퀴","color":"yellow"}]
execute unless score @s dev-lap >= #maxlap dev-lap run function lapsound1:play
execute unless score @s dev-lap >= #maxlap dev-lap run title @s title [{"score":{"name":"@s","objective":"dev-lap","color":"yellow"},"color":"yellow"},{"text":"바퀴째","color":"yellow"}]

scoreboard players remove @s dev-lap 1



tag @s remove checkpointpass

function checkpoint:system/init