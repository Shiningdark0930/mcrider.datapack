# 게임 시작 로그 출력 - 플레이어 정보
# 각 플레이어에 대해 이름 | 엔진 | 카트 정보 출력
execute at @s run logtellraw targets @a[tag=logtellraw] [{"selector":"@s","color":"aqua"},{"text":" | 엔진: ","color":"yellow"},{"score":{"name":"@s","objective":"kart-engine"}},{"text":", 카트: ","color":"yellow"},{"nbt":"data.itemdata.components.minecraft:custom_name","entity":"@n[type=!minecraft:player,tag=kartdatacarrier]","interpret":true}]
