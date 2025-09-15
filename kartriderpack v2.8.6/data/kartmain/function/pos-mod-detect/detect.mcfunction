scoreboard players set #pos-mod kartmain 0
summon marker 0 0 0 {Tags:["pos-mod-detect"]}
execute as @e[tag=pos-mod-detect] at @s run function kartmain:pos-mod-detect/if-pos-mod
kill @e[tag=pos-mod-detect]

scoreboard players set #pos-mod-timer kartmain 0

#뛰라이더 인원수 감지
execute store result score #late-sync-player-count kartmain if entity @a
