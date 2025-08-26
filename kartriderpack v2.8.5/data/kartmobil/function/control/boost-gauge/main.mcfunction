#타코미터
data remove storage kartactbar message

execute unless score @s kartboostcount matches 1.. run data modify storage kartactbar message append value [{"text":"   ","color":"gray","bold":false},{"keybind":"key.left","color":"gray","bold":false},{"text":" or ","color":"aqua","bold":false},{"keybind":"key.right","color":"gray","bold":false},{"text":" |","color":"yellow","bold":false}]
execute if score @s kartboostcount matches 1.. run data modify storage kartactbar message append value [{"text":"   ","color":"yellow","bold":false},{"keybind":"key.left","color":"aqua","bold":false},{"text":" or ","color":"yellow","bold":false},{"keybind":"key.right","color":"aqua","bold":false},{"text":" |","color":"yellow","bold":false}]

function kartmobil:control/boost-gauge/leftgauge

execute unless score @s kartboosttime matches 1.. run data modify storage kartactbar message append value [{"text":"// ","color":"aqua","bold":false}]
execute if score @s kartboosttime matches 10.. run data modify storage kartactbar message append value [{"text":"// ","color":"yellow","bold":false}]
execute if score @s kartboosttime matches 7..9 run data modify storage kartactbar message append value [{"text":"// ","color":"red","bold":false}]
execute if score @s kartboosttime matches 4..6 run data modify storage kartactbar message append value [{"text":"// ","color":"yellow","bold":false}]
execute if score @s kartboosttime matches 1..3 run data modify storage kartactbar message append value [{"text":"// ","color":"red","bold":false}]

#속도계 수치를 2배로 표시
scoreboard players operation #kart-speed-double kartmove = @s kartmove
scoreboard players operation #kart-speed-double kartmove /= #kart139 kartmain

data modify storage kartactbar message append value [{"score":{"name":"#kart-speed-double","objective":"kartmove"},"color":"aqua","bold":false},{"text":"km/h ","color":"aqua","bold":false}]

execute unless score @s kartboosttime matches 1.. run data modify storage kartactbar message append value [{"text":"\\\\","color":"aqua","bold":false}]
execute if score @s kartboosttime matches 10.. run data modify storage kartactbar message append value [{"text":"\\\\","color":"yellow","bold":false}]
execute if score @s kartboosttime matches 7..9 run data modify storage kartactbar message append value [{"text":"\\\\","color":"red","bold":false}]
execute if score @s kartboosttime matches 4..6 run data modify storage kartactbar message append value [{"text":"\\\\","color":"yellow","bold":false}]
execute if score @s kartboosttime matches 1..3 run data modify storage kartactbar message append value [{"text":"\\\\","color":"red","bold":false}]

function kartmobil:control/boost-gauge/rightgauge

execute unless score @s kartboostcount matches 1.. run data modify storage kartactbar message append value [{"text":"| ","color":"yellow","bold":false},{"text":"NITRO","color":"gray","bold":false}]
execute if score @s kartboostcount matches 1 run data modify storage kartactbar message append value [{"text":"| ","color":"yellow","bold":false},{"text":"NITRO","color":"yellow","bold":false}]
execute if score @s kartboostcount matches 2 run data modify storage kartactbar message append value [{"text":"| ","color":"yellow","bold":false},{"text":"NITRO","color":"#00AAFF","bold":false}]
execute if score @s kartboostcount matches 3.. run data modify storage kartactbar message append value [{"text":"| ","color":"yellow","bold":false},{"text":"NITRO","color":"light_purple","bold":false}]

data modify storage kartactbar message append value [{"text":" x","color":"aqua","bold":false},{"score":{"name":"@s","objective":"kartboostcount"},"color":"aqua","bold":false}]

title @a[tag=kart-listener] actionbar [{"nbt":"message[]","storage":"kartactbar","interpret":true,"separator":{"text":""}}]
