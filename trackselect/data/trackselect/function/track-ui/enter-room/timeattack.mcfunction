

execute if function gamemain:cannot-start-condition run return 1

data modify entity @e[tag=trackselect-mode,limit=1] text set value [{"text":"타임어택","color":"yellow"}]

#타임어택 모드로 방에 입장
scoreboard players set @p trackselect-game-id 1
scoreboard players reset @p trackselect-map-id

tp @p 44 5 185 180 0

execute as @e[tag=track-main] at @s run function trackselect:track-ui/show-theme-ui