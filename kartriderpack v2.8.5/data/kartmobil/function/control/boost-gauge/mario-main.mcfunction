#타코미터
data remove storage kartactbar message

execute if entity @s[tag=!kart-drifting] run data modify storage kartactbar message append value [{"text":"MINI ","color":"gray","bold":false},{"text":" |","color":"yellow","bold":false}]
execute if entity @s[tag=kart-drifting] run data modify storage kartactbar message append value [{"text":"MINI ","color":"aqua","bold":false},{"text":" |","color":"yellow","bold":false}]

#마리오는 속도계 없음
function kartmobil:control/boost-gauge/mario-leftgauge
function kartmobil:control/boost-gauge/mario-rightgauge

execute if entity @s[tag=!kart-drifting] run data modify storage kartactbar message append value [{"text":"| ","color":"yellow","bold":false},{"text":"TURBO","color":"gray","bold":false}]
execute if entity @s[tag=kart-drifting] run data modify storage kartactbar message append value [{"text":"| ","color":"yellow","bold":false},{"text":"TURBO","color":"aqua","bold":false}]

title @a[tag=kart-listener] actionbar [{"nbt":"message[]","storage":"kartactbar","interpret":true,"separator":{"text":""}}]
