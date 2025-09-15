function kartmobil:control/boost-gauge/rally-main

#전진 키 이벤트(불빛 깜빡임을 위해)
tag @s remove kart-w-press
tag @s remove kart-w-release
execute if entity @s[tag=kart-w-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:w,distance=..0.3] run tag @s add kart-w-release
execute if entity @s[tag=kart-w-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:w,distance=..0.3] run tag @s remove kart-w-pressed
execute if entity @s[tag=!kart-w-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] run tag @s add kart-w-press
execute if entity @s[tag=!kart-w-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] run tag @s add kart-w-pressed

#부스터 키 이벤트
tag @s remove kart-boost-press
execute if entity @s[tag=kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=!kartmobil:a,predicate=!kartmobil:d,distance=..0.3] run tag @s remove kart-boost-pressed
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:a,distance=..0.3] run tag @s add kart-boost-press
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:d,distance=..0.3] run tag @s add kart-boost-press
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:a,distance=..0.3] run tag @s add kart-boost-pressed
execute if entity @s[tag=!kart-boost-pressed] if entity @p[tag=kartpassenger,predicate=kartmobil:d,distance=..0.3] run tag @s add kart-boost-pressed

#페달조작
execute if entity @p[tag=kartpassenger,predicate=kartmobil:w,distance=..0.3] run function kartmobil:control/rally-mode/accel
execute if entity @p[tag=kartpassenger,predicate=kartmobil:s,distance=..0.3] run function kartmobil:control/brake

#기어조작
execute unless score @s[tag=kart-boost-press] kartboostcount matches 5.. rotated as @p[tag=kartpassenger,predicate=kartmobil:d,distance=..0.3] run scoreboard players add @s kartboostcount 1
execute unless score @s[tag=kart-boost-press] kartboostcount matches ..1 rotated as @p[tag=kartpassenger,predicate=kartmobil:a,distance=..0.3] run scoreboard players remove @s kartboostcount 1

execute if entity @s[tag=kart-boost-press] at @s as @e[limit=2] run playsound minecraft:block.nether_bricks.break weather @a[tag=kart-listener] ~ ~ ~ 1.5 0