execute if block -13 0 153 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript1 kart-mod [{"text":"팀전: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -13 0 153 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript1 kart-mod [{"text":"팀전: "},{"bold":true,"text":"✔","color":"green"}]

execute if block -11 0 153 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript2 kart-mod [{"text":"고스트 모드: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -11 0 153 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript2 kart-mod [{"text":"고스트 모드: "},{"bold":true,"text":"✔","color":"green"}]

execute if block -9 0 153 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript3 kart-mod [{"text":"무한 부스터: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -9 0 153 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript3 kart-mod [{"text":"무한 부스터: "},{"bold":true,"text":"✔","color":"green"}]

execute if block -7 0 153 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript4 kart-mod [{"text":"드래프트 끄기: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -7 0 153 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript4 kart-mod [{"text":"드래프트 끄기: "},{"bold":true,"text":"✔","color":"green"}]

execute if block -5 0 153 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript5 kart-mod [{"text":"톡톡이 모드: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -5 0 153 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript5 kart-mod [{"text":"톡톡이 모드: "},{"bold":true,"text":"✔","color":"green"}]

execute if block -3 0 155 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript6 kart-mod [{"text":"갓겜 모드: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -3 0 155 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript6 kart-mod [{"text":"갓겜 모드: "},{"bold":true,"text":"✔","color":"green"}]

execute if block -3 0 157 minecraft:redstone_lamp[lit=false] run scoreboard players display name modscript7 kart-mod [{"text":"벽 충돌 패널티: "},{"bold":true,"text":"❌","color":"dark_red"}]
execute if block -3 0 157 minecraft:redstone_lamp[lit=true] run scoreboard players display name modscript7 kart-mod [{"text":"벽 충돌 패널티: "},{"bold":true,"text":"✔","color":"green"}]
