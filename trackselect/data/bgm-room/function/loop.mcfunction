execute as @a run attribute @s minecraft:entity_interaction_range modifier remove minecraft:0-0-0-0-1700
execute as @a[x=3,y=3,z=93,dx=17,dy=10,dz=12] run attribute @s minecraft:entity_interaction_range modifier add 0-0-0-0-1700 10 add_value


#인터랙션
execute as @e[tag=bgm-theme-interaction,type=interaction] at @s on attacker run function bgm-room:bgm-ui/show-bgm-ui
execute as @e[tag=bgm-theme-interaction,type=interaction] at @s on target run function bgm-room:bgm-ui/show-bgm-ui

execute as @e[tag=bgm-bgm-interaction,type=interaction] at @s on attacker run function bgm-room:bgm-ui/play-bgm
execute as @e[tag=bgm-bgm-interaction,type=interaction] at @s on target run function bgm-room:bgm-ui/play-bgm
#
execute as @e[tag=bgm-bgm-return-interaction,type=interaction] at @s on attacker as @e[tag=bgm-main] at @s run function bgm-room:bgm-ui/show-theme-ui
execute as @e[tag=bgm-bgm-return-interaction,type=interaction] at @s on target as @e[tag=bgm-main] at @s run function bgm-room:bgm-ui/show-theme-ui

