execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 1.. run scoreboard players remove @p[tag=kartpassenger,distance=..0.3] kartboostgauge 150
execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 1.. run scoreboard players add @s kartmove 215
execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches 1.. rotated ~ 0 run particle snowflake ~ ~1 ~ .5 .5 .5 0.2 2 normal @a

execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches ..0 run stopsound @a[tag=kart-listener] neutral minecraft:item.elytra.flying
execute if score @p[tag=kartpassenger,distance=..0.3] kartboostgauge matches ..0 run tag @s remove kart-exceed-active