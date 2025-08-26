execute unless entity @a[scores={updown-count=1..}] run tellraw @a[distance=..50] [{"text":"아무도 ","color":"red"},{"text":"도전 UP & DOWN","color":"aqua"},{"text":"을 플레이하지 않습니다.","color":"red"}]
execute unless entity @a[scores={updown-count=1..}] run return 1


tag @s add updown-spectator
scoreboard players reset @s multi-shift
gamemode spectator @s

scoreboard players set @s multi-spectate-time 0

function gamemain:getmapdata/playbgm

function updown:system/spectator/spectate-target