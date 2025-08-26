
title @a title [{"bold":false,"color":"yellow","italic":false,"text":"Kart"},{"bold":false,"color":"green","italic":false,"text":"R"},{"bold":false,"color":"yellow","italic":false,"text":"ider"},{"bold":false,"color":"yellow","italic":false,"text":" Forever!"}]
title @a subtitle {"text":"플레이해주셔서 감사합니다","color":"aqua"}
tellraw @s [{"text":"차고의 ","color":"green"},{"text":"[카트바디 성능 커스텀]","color":"aqua"},{"text":"이 해금되었습니다!","color":"green"}]
tellraw @s [{"text":"[스페셜]","color":"aqua"},{"text":"등급 카트가 해금되었습니다!","color":"green"}]
execute positioned -118.5 4.00 215.0 run playsound minecraft:ui.toast.challenge_complete weather @a ~ ~ ~ 1 1 1

setblock -102 5 216 minecraft:oak_button[face=wall,facing=east,powered=false]
setblock -102 5 212 minecraft:oak_button[face=wall,facing=east,powered=false]