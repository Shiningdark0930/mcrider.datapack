
execute if entity @p[tag=kartpassenger,predicate=kartmobil:a,predicate=kartmobil:space,distance=..0.3] run tag @s add kart-mario-a
execute if entity @p[tag=kartpassenger,predicate=kartmobil:d,predicate=kartmobil:space,distance=..0.3] run tag @s add kart-mario-d

tag @s[tag=kart-mario-a] add kart-drifting
tag @s[tag=kart-mario-d] add kart-drifting

execute if entity @s[tag=!kart-jumped] if score floor-distance kartmain matches ..1 run function kartmobil:move/dummy-mini-jump