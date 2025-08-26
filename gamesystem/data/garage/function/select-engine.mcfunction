scoreboard players operation @s kart-engine = @n[type=interaction] kart-engine

# 멀티 전용 기능
execute store result entity @s attributes[{id:"minecraft:armor_toughness"}].base int 1 run scoreboard players get @n[type=interaction] kart-engine

particle minecraft:trial_spawner_detection ~ ~ ~ .5 .5 .5 0 25
execute at @s run particle minecraft:trial_spawner_detection ~ ~ ~ .5 .5 .5 0 25

playsound minecraft:block.trial_spawner.about_to_spawn_item weather @a ~ ~ ~ 1 2

tellraw @s [{"entity":"@n[tag=kart-engine-text]","nbt":"text","bold":false,"interpret":true},{"text":"엔진을 선택했습니다.","color":"green","bold":false}]


