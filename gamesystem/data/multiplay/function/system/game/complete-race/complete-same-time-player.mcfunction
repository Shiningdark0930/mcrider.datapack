#tellraw @a {"score":{"name":"LogGamja","objective":"kartdrift"}}
#tellraw @a {"score":{"name":"Pangch","objective":"kartdrift"}}

scoreboard players set #max-same-time multi-rank -2147483648
scoreboard players operation #max-same-time multi-rank > @a[tag=kart-multi-same-time] kartdrift
scoreboard players operation @a[tag=kart-multi-same-time] kartdrift -= #max-same-time multi-rank

execute as @a[tag=kart-multi-same-time,scores={kartdrift=0}] at @s run function multiplay:system/game/complete-race/complete

scoreboard players operation @a[tag=kart-multi-same-time] kartdrift += #max-same-time multi-rank

execute if entity @a[tag=kart-multi-same-time] run function multiplay:system/game/complete-race/complete-same-time-player