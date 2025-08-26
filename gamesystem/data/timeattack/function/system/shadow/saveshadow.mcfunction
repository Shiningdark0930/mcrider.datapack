$data modify storage timeattack:timeattack-shadows map$(tempmap)-shadow set from storage timeattack:timeattack-shadows temp-shadow
#플레이어 닉네임과 카트 모델링 저장
tag @s add shadow-player
setblock -139 -1 236 oak_sign{front_text:{messages:[{"selector":"@a[tag=shadow-player,limit=1]"},{"text":"'s Shadow"},{"text":""},{"text":""},{"text":""}]}} destroy
tag @s remove shadow-player
$data modify storage timeattack:timeattack-shadows map$(tempmap)-shadow.playername set from block -139 -1 236 front_text.messages[0]
$data modify storage timeattack:timeattack-shadows map$(tempmap)-shadow.hideplayer set from entity @n[tag=kartdatacarrier] data.itemdata.components.minecraft:custom_data.hideplayer
$data modify storage timeattack:timeattack-shadows map$(tempmap)-shadow.model set from entity @n[tag=kartdatacarrier] data.itemdata.components.minecraft:custom_data.model


$execute store result storage timeattack:timeattack-shadows map$(tempmap)-shadow.boostduration int 1 run scoreboard players get @n[tag=kartmobil] kartboostduration
$execute store result storage timeattack:timeattack-shadows map$(tempmap)-shadow.engine int 1 run scoreboard players get @n[tag=kartmobil] kart-engine
