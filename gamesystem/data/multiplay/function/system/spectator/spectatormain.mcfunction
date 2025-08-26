#3틱 뒤에 해당 대상을 관전
execute as @a[tag=multi-spectator] if score @s multi-spectate-time matches 1.. run function multiplay:system/spectator/wait-spectate
execute as @a[tag=multi-spectator] if score @s multi-spectate-time matches 1 run function multiplay:system/spectator/spectate-target-delayed

#키를 누르면 증가하는 스코어
execute as @a[tag=multi-spectator,predicate=kartmobil:s] run scoreboard players add @s multi-spectate-change 1
execute as @a[tag=multi-spectator,predicate=kartmobil:w] run scoreboard players add @s multi-spectate-change 1
execute as @a[tag=multi-spectator,predicate=!kartmobil:w,predicate=!kartmobil:s] run scoreboard players reset @s multi-spectate-change

execute as @a[tag=multi-spectator] if score @s multi-spectate-change matches 1 run function multiplay:system/spectator/set-target

#웅크리기 하면 나가기
execute as @a[tag=multi-spectator] at @s run function multiplay:system/spectator/ui
execute as @a[tag=multi-spectator,scores={multi-shift=1..}] at @s run function multiplay:system/spectator/exit

effect give @a[tag=multi-spectator] minecraft:invisibility 1 1 true

#게임이 진행중이 아니면 나가기
execute unless score #game multi-main matches 1.. as @a[tag=multi-spectator] at @s run function multiplay:system/spectator/exit