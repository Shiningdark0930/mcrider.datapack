$data modify storage devattack:dev-attack-shadows map$(tempmap)-dev$(tempdev)-shadow set from storage devattack:dev-attack-shadows temp-shadow
#플레이어 닉네임과 카트 모델링 저장
tag @s add shadow-player
#setblock -139 -1 236 oak_sign{front_text:{messages:[{{"selector":"@a[tag=shadow-player,limit=1]"}},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 1 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"LogGamja"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 2 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"KITE2459"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 3 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"anotherone_yt"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 4 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"Pangch"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 5 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"_Nekter_"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 6 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"L_Peng"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 7 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"GhangDhang"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 8 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"Towercrain"},{"text":""},{"text":""},{"text":""}]}} destroy
execute if score #dev dev-count matches 9 run setblock -139 -1 236 oak_sign{front_text:{messages:[{"text":"Sidite"},{"text":""},{"text":""},{"text":""}]}} destroy
tag @s remove shadow-player
$data modify storage devattack:dev-attack-shadows map$(tempmap)-dev$(tempdev)-shadow.playername set from block -139 -1 236 front_text.messages[0]
$data modify storage devattack:dev-attack-shadows map$(tempmap)-dev$(tempdev)-shadow.hideplayer set from entity @n[tag=kartdatacarrier] data.itemdata.components.minecraft:custom_data.hideplayer
$data modify storage devattack:dev-attack-shadows map$(tempmap)-dev$(tempdev)-shadow.model set from entity @n[tag=kartdatacarrier] data.itemdata.components.minecraft:custom_data.model

$execute store result storage devattack:dev-attack-shadows map$(tempmap)-dev$(tempdev)-shadow.boostduration int 1 run scoreboard players get @n[tag=kartmobil] kartboostduration
$execute store result storage devattack:dev-attack-shadows map$(tempmap)-dev$(tempdev)-shadow.engine int 1 run scoreboard players get @n[tag=kartmobil] kart-engine
