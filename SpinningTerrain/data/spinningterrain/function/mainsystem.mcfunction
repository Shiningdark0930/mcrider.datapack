execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 1.. run function spinningterrain:spinob/spinob
execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 1.. run scoreboard players add #rota NemoSteelRockFurnace_TerrainRotationTiming 1
execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 391..400 run scoreboard players set #rota NemoSteelRockFurnace_TerrainRotationTiming 1

execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 97 run function spinningterrain:type2
execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 281 run function spinningterrain:type1
execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 1 run function spinningterrain:type4
execute if score #rota NemoSteelRockFurnace_TerrainRotationTiming matches 185 run function spinningterrain:type3

#자동 리셋
execute unless entity @a[tag=kart-multi-player] run function spinningterrain:reset