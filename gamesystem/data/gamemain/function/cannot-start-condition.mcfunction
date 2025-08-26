execute if entity @a[tag=kart-multi-player] run tellraw @a[distance=..50] [{"text":"멀티 플레이 ","color":"aqua"},{"text":"경기가 진행 중입니다.","color":"red"}]
execute if entity @a[scores={dev-count=1..}] run tellraw @a[distance=..50] [{"text":"누군가가 ","color":"red"},{"text":"제작자와의 대결","color":"aqua"},{"text":"을 플레이 중입니다.","color":"red"}]
execute if entity @a[scores={timecount=1..}] run tellraw @a[distance=..50] [{"text":"누군가가 ","color":"red"},{"text":"타임어택","color":"aqua"},{"text":"을 플레이 중입니다.","color":"red"}]
execute if entity @a[scores={licensecount=1..}] run tellraw @a[distance=..50] [{"text":"누군가가 ","color":"red"},{"text":"라이센스","color":"aqua"},{"text":"를 플레이 중입니다.","color":"red"}]
execute unless entity @s[scores={trackselect-game-id=1..}] if entity @a[scores={trackselect-game-id=1..}] run tellraw @a[distance=..50] [{"text":"누군가가 ","color":"red"},{"text":"트랙 선택 ","color":"aqua"},{"text":"장소에 있습니다.","color":"red"}]

execute if entity @a[tag=kart-multi-player] run return 1
execute if entity @a[scores={dev-count=1..}] run return 1
execute if entity @a[scores={timecount=1..}] run return 1
execute if entity @a[scores={licensecount=1..}] run return 1
execute unless entity @s[scores={trackselect-game-id=1..}] if entity @a[scores={trackselect-game-id=1..}] run return 1