execute at @s if entity @e[tag=dog,distance=..1.39] run function banjo:play
execute at @s if entity @e[tag=dog,distance=..1.39] run return 1

execute at @s if entity @e[tag=sans,distance=..1.39] run function sans:play
execute at @s if entity @e[tag=sans,distance=..1.39] run return 1

execute at @s if entity @e[tag=minecart,distance=..1.39] run function wind:play
execute at @s if entity @e[tag=minecart,distance=..1.39] run return 1

execute at @s if entity @e[tag=chicken,distance=..1.39] run function lavachicken:play
execute at @s if entity @e[tag=chicken,distance=..1.39] run return 1

$function $(bgm):play