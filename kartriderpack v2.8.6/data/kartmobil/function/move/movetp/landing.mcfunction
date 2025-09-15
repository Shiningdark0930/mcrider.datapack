execute if score @s kartmovey matches 900.. run playsound minecraft:block.stone.place neutral @a ~ ~ ~ 1 0
execute if score @s kartmovey matches 900.. run playsound minecraft:block.note_block.basedrum neutral @a ~ ~ ~ 1 1
execute if score @s kartmovey matches 900.. run playsound minecraft:block.scaffolding.break neutral @a ~ ~ ~ 1 0.5
execute if score @s kartmovey matches 900.. run playsound minecraft:block.nether_bricks.place neutral @a ~ ~ ~ 1 0.75
execute if score @s kartmovey matches 900.. run playsound minecraft:block.nether_bricks.place neutral @a ~ ~ ~ 1 0.5

execute if score @s kartmovey matches 900.. run playsound minecraft:entity.generic.big_fall neutral @a ~ ~ ~ 1 0.5
execute if score @s kartmovey matches 900.. run playsound minecraft:entity.generic.big_fall neutral @a ~ ~ ~ 1 1
execute if score @s kartmovey matches 900.. run playsound minecraft:entity.generic.small_fall neutral @a ~ ~ ~ 1 0.5
execute if score @s kartmovey matches 900.. run playsound minecraft:entity.generic.small_fall neutral @a ~ ~ ~ 1 1

execute if score @s kartmovey matches 900.. run playsound minecraft:entity.zombie.attack_wooden_door neutral @a ~ ~ ~ 0.25 0.5
execute if score @s kartmovey matches 900.. on passengers if entity @s[tag=kartmodelsaddle,type=item_display] at @s run rotate @s ~ -7.5

execute if score @s kartmovey matches 2000.. run particle minecraft:cloud ~ ~0.1 ~ 0.65 0 0.65 0 12 force @a

scoreboard players set @s kartmovey 0
tag @s remove kart-jumped

#매드 크래시 - 점프드리프트시 튕김
execute if entity @s[tag=mad-crash] unless score #kartangle kartmain matches -500..500 if predicate kartmobil:0.5random run scoreboard players remove @s kartmovey 750
execute if entity @s[tag=mad-crash] unless score #kartangle kartmain matches -650..650 if predicate kartmobil:0.1random run scoreboard players remove @s kartmovey 1000