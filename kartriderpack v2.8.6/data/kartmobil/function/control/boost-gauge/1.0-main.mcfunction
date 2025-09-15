#타코미터
data remove storage kartactbar message

execute unless score @s kartboostcount matches 1.. run data modify storage kartactbar message append value [{"keybind":"key.left","color":"gray","bold":false},{"text":" / NITRO [","color":"gray","bold":false}]
execute if score @s kartboostcount matches 1.. run data modify storage kartactbar message append value [{"keybind":"key.left","color":"aqua","bold":false},{"text":" / NITRO [","color":"yellow","bold":false}]



function kartmobil:control/boost-gauge/1.0-leftgauge

data modify storage kartactbar message append value [{"text":"// ","color":"aqua","bold":false}]

#속도계 수치 표시
scoreboard players operation #kart-speed-double kartmove = @s kartmove
scoreboard players operation #kart-speed-double kartmove /= #kart360 kartmain

data modify storage kartactbar message append value [{"score":{"name":"#kart-speed-double","objective":"kartmove"},"color":"aqua","bold":false},{"text":"km/h ","color":"aqua","bold":false}]

data modify storage kartactbar message append value [{"text":"\\\\","color":"aqua","bold":false}]

function kartmobil:control/boost-gauge/1.0-rightgauge

execute unless score @s kartboostcount matches 2.. run data modify storage kartactbar message append value [{"text":"] ","color":"gray","bold":false},{"text":"NITRO","color":"gray","bold":false}]
execute if score @s kartboostcount matches 2.. run data modify storage kartactbar message append value [{"text":"] ","color":"yellow","bold":false},{"text":"NITRO","color":"yellow","bold":false}]

scoreboard players operation #boost-temp kartboostcount = @s kartboostcount
scoreboard players remove #boost-temp kartboostcount 1
execute if score @s kartboostcount matches 3.. run data modify storage kartactbar message append value [{"text":" x","color":"aqua","bold":false},{"score":{"name":"#boost-temp","objective":"kartboostcount"},"color":"aqua","bold":false}]

execute unless score @s kartboostcount matches 2.. run data modify storage kartactbar message append value [{"text":" / ","color":"gray","bold":false},{"keybind":"key.right","color":"gray","bold":false}]
execute if score @s kartboostcount matches 2.. run data modify storage kartactbar message append value [{"text":" / ","color":"yellow","bold":false},{"keybind":"key.right","color":"aqua","bold":false}]


title @a[tag=kart-listener] actionbar [{"nbt":"message[]","storage":"kartactbar","interpret":true,"separator":{"text":""}}]
