execute unless loaded ~ ~ ~ run return 1

#카트 소환 못 함
execute if entity @e[distance=..10,tag=trackselect-drone,type=item_display] run return run function kartmobil:summon/cant-summon-kart
execute if entity @e[distance=..1.5,tag=garage-kart,type=item_display] run return run function kartmobil:summon/cant-summon-kart
execute if entity @e[distance=..1.5,tag=kartmobil,type=item_display] run return run function kartmobil:summon/cant-summon-kart
execute if entity @s[nbt={active_effects:[{id:"minecraft:unluck"}]}] run return run function kartmobil:summon/cant-summon-kart
execute if data entity @s RootVehicle run return run function kartmobil:summon/cant-summon-kart

#카트 엔티티들 소환
summon item_display ~ ~ ~ {Tags:["kartmodelsaddle","karttemp","kartentity"],CustomName:"mcrider-modelsaddle"}
summon item_display ~ ~ ~ {Tags:["kartdirection","kartentity","karttemp"],CustomName:"mcrider-direction"}
summon item_display ~ ~ ~ {Tags:["kartmobil","karttemp","kartentity"],teleport_duration:2}

summon marker ~ ~ ~ {Tags:["kartdatacarrier","kartentity","karttemp"]}
summon marker ~ ~ ~ {Tags:["kart-old-velocity","kartentity","karttemp"]}

summon cod ~ ~ ~ {Tags:["kartentity","kartsaddle","karttemp"],CustomName:"mcrider-saddle-common",NoAI:1b,Silent:1b,Invulnerable:1b,NoGravity:1b,DeathLootTable:"minecraft:empty"}

scoreboard players set @e[tag=kartmobil,tag=karttemp,type=item_display] kartboostgauge 1
scoreboard players set @e[tag=kartmobil,tag=karttemp,type=item_display] kartboostcount 0
scoreboard players set @e[tag=kartmobil,tag=karttemp,type=item_display] kartboosttime 0
scoreboard players set @s kartboostgauge 0
scoreboard players set @s kartboosttime 0

function kartmobil:summon/summon-model with entity @s equipment.offhand.components.minecraft:custom_data
execute as @e[distance=..0.01,tag=!kart-boost-flame,tag=!drift-effect,type=#kartmobil:kartmodels] if data entity @s {brightness:{sky:15,block:15}} run tag @s add kart-light
execute as @e[distance=..0.01,tag=kart-light] run function kartmobil:bright-blocks/light-off
function kartmobil:summon/set-kart-spec
function kartmobil:summon/manage-tag

function kartmobil:summon/drift-effect
function kartmobil:summon/boost-effect/boost-effect
execute as @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!shadow-models] run ride @s dismount

function kartmobil:summon/tp-and-ride

#견인에 의한 드탈 보정 변수
scoreboard players set @s kartdrift 0

effect give @e[tag=kartsaddle,type=#kartmobil:kartsaddle] resistance infinite 10 true
effect give @e[tag=kartsaddle,type=#kartmobil:kartsaddle] invisibility infinite 1 true

tag @e[tag=kartmodeltemp] remove kartmodeltemp
tag @e[tag=karttemp] remove karttemp






