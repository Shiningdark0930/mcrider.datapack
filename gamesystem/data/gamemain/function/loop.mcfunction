scoreboard players reset #is-game-play game-id

#버전 감지
execute if score #dataVersion game-id matches 0 store result score #dataVersion game-id run data get entity @r DataVersion
execute if score #dataVersion game-id matches 4326.. run tellraw @a "마인크래프트 버전이 너무 높아 오류가 발생했습니다. 1.21.4로 접속해주세요."
execute if score #dataVersion game-id matches ..4324 run tellraw @a "마인크래프트 버전이 너무 낮아 오류가 발생했습니다. 1.21.4로 접속해주세요."

#나갔다 들어온 플레이어를 순서트릭으로 1틱 뒤에 킥하기. 청크로딩 때문에 무조건 필요함
scoreboard players add @a[tag=kart-left-player] kartboostpadtime 1

execute as @a[tag=kart-left-player] if loaded ~ ~ ~ run ride @s dismount
execute as @a[tag=kart-left-player,scores={kartboostpadtime=5..}] at @s if loaded ~ ~ ~ run function gamemain:noleftplayer/kickleftplayer

#게임아이디랑 일치하지 않는 잔류 쉐도우 처리
execute as @e[tag=shadow-models,tag=shadow-main,type=item_display] at @s unless score @s game-id = #max-id game-id run kill @e[tag=shadow-models]

#게임 플레이중인 유저의 아이디가 일치하는지 보고 킥하기
execute as @a[tag=kart-multi-player] at @s run function gamemain:noleftplayer/leftplayerdetect
execute as @a[scores={dev-count=1..}] at @s run function gamemain:noleftplayer/leftplayerdetect
execute as @a[scores={timecount=1..}] at @s run function gamemain:noleftplayer/leftplayerdetect
execute as @a[scores={licensecount=1..}] at @s run function gamemain:noleftplayer/leftplayerdetect
execute as @a[scores={updown-count=1..}] at @s run function gamemain:noleftplayer/leftplayerdetect

#출부
execute as @e[tag=kartdirection,scores={startboosttime=1..},type=minecraft:marker] at @s run function gamemain:startboost/startboosteffect

#만약 게임이 진행중이지 않은데 타이머가 켜져있다면 끄기
execute unless score #is-game-play game-id matches 1 if score iswork timermain matches 1 run function timerpack:stop

    #팀부
    function teamboostmodule:loop
    #게임 메인
    function license:loop
    function multiplay:loop
    function timeattack:loop
    function devbattle:loop
    function updown:loop

    #차고
    function garage:loop
    function checkpoint:loop

#차안탄사람야투끄기
execute as @a[gamemode=adventure] unless predicate kartmobil:ifride at @s unless block ~ ~-1.5 ~ magma_block run effect clear @s night_vision
