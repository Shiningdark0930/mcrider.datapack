execute if entity @a[tag=multi-hub-player,tag=bangjang] run tellraw @a [{"selector":"@a[tag=bangjang,limit=1]",color:"yellow"},{color:"aqua","text":" 라이더가 ",bold:true},{color:"green","text":"방장",bold:true},{color:"aqua","text":"입니다",bold:true}]
execute as @a[tag=multi-hub-player,tag=bangjang] at @s run playsound minecraft:entity.experience_orb.pickup master @a ~ ~ ~ 2 0.5


function bangjang:bossbar

scoreboard players reset #alert multi-main
