

execute if function gamemain:cannot-start-condition run return 1

#방에 입장
scoreboard players set @p trackselect-game-id 4
scoreboard players reset @p trackselect-map-id

tp @p 44 -60 185 180 0
