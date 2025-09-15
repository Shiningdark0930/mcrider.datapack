
#A와 B의 방향을 스왑
execute at @e[tag=carA] run summon marker ~ ~ ~ {Tags:["carAvector"]}
execute as @e[tag=carAvector] positioned as @s rotated as @e[tag=carAdirection] run rotate @s ~ ~

$execute as @n[tag=carAdirection] at @s positioned as @s rotated as @e[tag=carBdirection] run rotate @s[tag=!collision-cheat] ~ $(kartAdefense)
$execute as @n[tag=carBdirection] at @s positioned as @s rotated as @e[tag=carAvector] run rotate @s[tag=!collision-cheat] ~ $(kartBdefense)