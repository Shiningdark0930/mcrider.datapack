
scoreboard players reset * multi-instant-rank
scoreboard players reset max multi-instant-rank

scoreboard players operation check-lap multi-lap = @s multi-lap
scoreboard players set early-stop check-num 0

execute store result score player-count multi-instant-rank if entity @a[tag=kart-multi-player]

function checkpoint:system/multi-sort/sort-lap

tag @a[tag=check-ranked] remove check-ranked