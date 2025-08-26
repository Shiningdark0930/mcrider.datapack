execute if score play endcredit matches 10..2245 as @a[tag=endcredit] run spectate @e[tag=creditpoint,limit=1] @s
execute if score play endcredit matches 2252.. as @a[tag=endcredit] run spectate @e[tag=creditpoint,limit=1] @s

scoreboard players add play endcredit 1
function endcredit:mapmove
execute as @e[tag=creditmap,tag=movemain] run scoreboard players add @s endcredit 1
execute as @e[tag=creditmap,tag=movemain] at @s run tp @s ~ ~ ~0.7
execute as @e[tag=creditmap,tag=movemain] if score play endcredit matches ..2250 if score @s endcredit matches 60.. on passengers run kill @s
execute as @e[tag=creditmap,tag=movemain] if score play endcredit matches ..2250 if score @s endcredit matches 60.. run kill @s
#tp @s -1305.0 6.5 6.5 90 0

execute if score play endcredit matches 5 positioned -1298.60 7.81 281.81 run forceload add ~ ~
execute if score play endcredit matches 5 run forceload add -1313 79 -1313 -96
execute if score play endcredit matches 5 positioned -1313.5 5.0 14.5 run function endcredit:summon/endcredit-steve-summon
execute if score play endcredit matches 5 run kill @e[tag=kite-model-credit]
execute if score play endcredit matches 10 positioned -1313.5 5.00 25.5 run function endcredit:summon/endcredit-allstars-summon

execute if score play endcredit matches 60 positioned -1315.75 5.00 -13.0 run function endcredit:summon/logmodel
execute if score play endcredit matches 60 positioned -1315.75 5.00 -13.0 run tp @e[tag=logmain] ~ ~ ~ 0 0
execute if score play endcredit matches 60..125 as @e[tag=logmain] at @s run tp @s ^ ^ ^0.25 0 0

execute if score play endcredit matches 110 positioned -1316.25 5.00 -13.0 run function endcredit:summon/kitemodel
execute if score play endcredit matches 110..125 as @e[tag=kitemain] at @s run tp @s ^ ^ ^1.023 0 0

execute if score play endcredit matches 125 as @e[tag=logmain] at @s on passengers run rotate @s ~15 ~
execute if score play endcredit matches 125 as @e[tag=kitemain] at @s on passengers run rotate @s ~-15 0

execute if score play endcredit matches 125 as @e[tag=logmain] at @s run tp @s ^0.9 ^ ^ ~ 0
execute if score play endcredit matches 125 as @e[tag=kitemain] at @s run tp @s ^-0.9 ^ ^ ~ 0
execute if score play endcredit matches 126..190 as @e[tag=logmain] at @s run particle explosion ^-.9 ^ ^ 0.3 0.3 0.3 0 10 force @a
execute if score play endcredit matches 126..190 as @e[tag=logmain] at @s run particle minecraft:cloud ^-.9 ^ ^ 0 0 0 0.3 10 force @a
execute if score play endcredit matches 126..190 as @e[tag=logmain] at @s run tp @s ^ ^ ^0.6 ~ 0
execute if score play endcredit matches 126..190 as @e[tag=kitemain] at @s run tp @s ^ ^ ^0.6 ~ 0

execute if score play endcredit matches 190 run kill @e[tag=kitemodel]
execute if score play endcredit matches 190 run kill @e[tag=loggamjamodel]

execute if score play endcredit matches 160 positioned -1316.0 5.00 -13.0 run function endcredit:summon/towermodel
execute if score play endcredit matches 160..270 as @e[tag=ttower,tag=tmain] at @s run tp @s ^ ^ ^0.4 ~ 0
execute if score play endcredit matches 270 run kill @e[tag=ttower]

execute if score play endcredit matches 300 positioned -1316.0 5.00 -13.0 run function endcredit:summon/sanskart
execute if score play endcredit matches 300..420 as @e[tag=sansbike1] at @s run tp @s ^ ^ ^0.3 ~ 0
execute if score play endcredit matches 300..420 as @e[tag=!sansbike1,tag=sansbike2] at @s run rotate @s ~15 0
execute if score play endcredit matches 420 run kill @e[tag=sansbike2]

execute if score play endcredit matches 440 positioned -1313.5 5.00 -13.0 run function endcredit:summon/pangchmodel
execute if score play endcredit matches 440..550 as @e[tag=pangchmodel] at @s run tp @s ^ ^ ^0.4 ~ 0
execute if score play endcredit matches 503 as @e[tag=pangchmodel,limit=1] at @s run particle explosion ^ ^ ^ 0.3 0.3 0.3 0 10 force @a
execute if score play endcredit matches 503 as @e[tag=pangchmodel,limit=1] at @s run particle minecraft:cloud ^ ^ ^ 0 0 0 0.7 10 force @a
execute if score play endcredit matches 503 run kill @e[tag=pangchmodel]

execute if score play endcredit matches 580 positioned -1316.0 6.50 -13.0 run function endcredit:summon/custom-eggmobile
execute if score play endcredit matches 580..700 as @e[tag=eggmobile1] at @s run tp @s ^ ^ ^0.3 ~ 0
execute if score play endcredit matches 640 as @e[tag=eggmobile1,limit=1] at @s run particle explosion ^ ^ ^ 0.3 0.3 0.3 0 10 force @a
execute if score play endcredit matches 640 as @e[tag=eggmobile1,limit=1] at @s run particle minecraft:cloud ^ ^ ^ 0 0 0 0.7 10 force @a
execute if score play endcredit matches 640 run kill @e[tag=eggmobile1]

execute if score play endcredit matches 620 positioned -1316.0 6.50 -13.0 run function endcredit:summon/supersonic
execute if score play endcredit matches 620..670 as @e[tag=sonic1] at @s run tp @s ^ ^ ^0.9 ~ 0
execute if score play endcredit matches 670 run kill @e[tag=sonic1]

execute if score play endcredit matches 1000 positioned -1316.0 5.00 -13.0 run function endcredit:summon/custom-ranek
execute if score play endcredit matches 1000 as @e[tag=ranek] at @s run tp @s ~ ~ ~ ~180 0
execute if score play endcredit matches 1000..1120 as @e[tag=ranekmain] at @s run tp @s ^ ^ ^0.3 0 0
execute if score play endcredit matches 1120 run kill @e[tag=ranek]

execute if score play endcredit matches 1260 positioned -1316.0 5.00 -13.0 run function endcredit:summon/daomodel
execute if score play endcredit matches 1260..1380 as @e[tag=daomodel] at @s run tp @s ^ ^ ^0.4 0 0
execute if score play endcredit matches 1380 run kill @e[tag=daomodel]

execute if score play endcredit matches 1700 positioned -1316.0 5.00 -13.0 run function endcredit:summon/pengmodel
execute if score play endcredit matches 1700..1770 as @e[tag=pengmain] at @s run tp @s ^ ^ ^0.3 ~ 0
execute if score play endcredit matches 1800 run kill @e[tag=pengmodel]

execute if score play endcredit matches 1730 positioned -1316.0 5.00 -13.0 run function endcredit:summon/anothermodel
execute if score play endcredit matches 1730..1750 as @e[tag=anomain] at @s run tp @s ^ ^ ^0.7 ~ 0
execute if score play endcredit matches 1750..1850 as @e[tag=anomain] at @s run tp @s ^ ^ ^0.35 ~ 0

execute if score play endcredit matches 1850 run kill @e[tag=anotherone]


execute if score play endcredit matches 1750..1770 as @e[tag=pengmain] on passengers at @s run rotate @s ~30 0
execute if score play endcredit matches 1750..1770 as @e[tag=pengmain] at @s run tp @s ^ ^ ^ ~3.0 0
execute if score play endcredit matches 1770..1800 as @e[tag=pengmain] at @s run tp @s ^ ^-0.1 ^ ~ 0

execute if score play endcredit matches 1900 positioned -1316.0 5.00 -13.0 run function endcredit:summon/custom-granny
execute if score play endcredit matches 1900..2120 as @e[tag=mandick1] at @s run tp @s ^ ^ ^0.3 ~ 0
execute if score play endcredit matches 2120 run kill @e[tag=mandick]



execute as @e[tag=endtext] at @s if score play endcredit matches ..2280 run tp @s ~ ~0.15 ~
execute as @e[tag=endtext] run scoreboard players add @s endcredit 1
execute as @e[tag=endtext] if score @s endcredit matches 120.. run kill @s

execute if score play endcredit matches 20 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:[{"bold":true,"color":"yellow","italic":false,"text":"Kart"},{"bold":true,"color":"green","italic":false,"text":"R"},{"bold":true,"color":"yellow","italic":false,"text":"ider\n"},{"bold":true,"color":"green","italic":false,"text":"Minecraft"}],shadow:1b}

execute if score play endcredit matches 60 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"개발"},shadow:1b}
execute if score play endcredit matches 90 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"green","italic":false,"text":"LogGamja"},shadow:1b}
execute if score play endcredit matches 90 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"맵 제작 및 메인 개발"},shadow:1b}

execute if score play endcredit matches 115 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"green","italic":false,"text":"KITE2459"},shadow:1b}
execute if score play endcredit matches 115 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"서브 개발 및 서버 지원"},shadow:1b}

execute if score play endcredit matches 140 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"Towercrain"},shadow:1b}
execute if score play endcredit matches 140 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"물리엔진 개발 보조"},shadow:1b}

execute if score play endcredit matches 165 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"N_Devil"},shadow:1b}
execute if score play endcredit matches 165 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"싱글 플레이 버그 수정"},shadow:1b}

execute if score play endcredit matches 190 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"QUAM12"},shadow:1b}
execute if score play endcredit matches 190 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"개발 및 최적화 조언"},shadow:1b}

execute if score play endcredit matches 215 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"Pangch"},shadow:1b}
execute if score play endcredit matches 215 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"모델링 최적화 도움"},shadow:1b}

execute if score play endcredit matches 240 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"Asdf08"},shadow:1b}
execute if score play endcredit matches 240 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"엔딩 크레딧"},shadow:1b}


execute if score play endcredit matches 330 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"모델링 제공"},shadow:1b}
execute if score play endcredit matches 400 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"green","italic":false,"text":"KITE2459"},shadow:1b}
execute if score play endcredit matches 470 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"green","italic":false,"text":"LogGamja"},shadow:1b}
execute if score play endcredit matches 540 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"_Nekter_"},shadow:1b}
execute if score play endcredit matches 610 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"L_Peng"},shadow:1b}
execute if score play endcredit matches 680 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"Asdf08"},shadow:1b}
execute if score play endcredit matches 750 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"anotherone_yt"},shadow:1b}

execute if score play endcredit matches 820 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]},text:{"bold":true,"color":"gold","italic":false,"text":"Sias_kr\ntco3307402\nECYCEeeee\ncheungseo"},shadow:1b}
execute if score play endcredit matches 820 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"gold","italic":false,"text":"골든 라이더 제공"},shadow:1b}
execute if score play endcredit matches 890 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]},text:{"bold":true,"color":"white","italic":false,"text":"comet_09   SEOLEETAE\nZoropic   hyun\nmingyeol2   kimunb\nOnliy   innosday\ngangryu bal \nunderbar yeonmot"},shadow:1b}
execute if score play endcredit matches 890 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"라이더 제공"},shadow:1b}



execute if score play endcredit matches 980 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"트랙 제작"},shadow:1b}
execute if score play endcredit matches 1040 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"green","italic":false,"text":"LogGamja   KITE2459"},shadow:1b}
execute if score play endcredit matches 1100 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"GhangDhang   _Nekter_"},shadow:1b}
execute if score play endcredit matches 1160 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"L_Peng"},shadow:1b}
execute if score play endcredit matches 1170 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"anotherone_yt Asdf08"},shadow:1b}

execute if score play endcredit matches 1220 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"gold","italic":false,"text":"fourgod  tco3307402\nBKGpolar  ECYCEeeee\nGlass_Man01  EYRT\nwithlight_"},shadow:1b}
execute if score play endcredit matches 1220 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"gold","italic":false,"text":"골든 라이더 제공"},shadow:1b}
execute if score play endcredit matches 1280 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]},text:{"bold":true,"color":"white","italic":false,"text":"Kati0n  bobjihoo\nwhitecow_kim  SEOLEETAE\nDominogames0229  N_Devil\nbanjil2009  Newconner\nKoral"},shadow:1b}
execute if score play endcredit matches 1280 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"라이더 제공"},shadow:1b}


#execute if score play endcredit matches 1370 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"건축"}}
#execute if score play endcredit matches 1430 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"mingyeol2\nL_Peng\nBKGpolar"}}
#execute if score play endcredit matches 1430 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"맵 인테리어"}}

#execute if score play endcredit matches 1500 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"L_Peng"}}
#execute if score play endcredit matches 1500 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"인트로, 엔딩 건축"}}



execute if score play endcredit matches 1380 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"BGM"},shadow:1b}
execute if score play endcredit matches 1440 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"green","italic":false,"text":"LogGamja"},shadow:1b}
execute if score play endcredit matches 1440 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"green","italic":false,"text":"메인 제작자"},shadow:1b}
execute if score play endcredit matches 1500 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"gold","italic":false,"text":"Sodyum\nKITE2459\ntco3307402\nN_Devil"},shadow:1b}
execute if score play endcredit matches 1560 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"aqua","italic":false,"text":"SPECIAL THANKS"},shadow:1b}
execute if score play endcredit matches 1560 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"WyvernP"},shadow:1b}



execute if score play endcredit matches 1660 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"카트 밸런싱"},shadow:1b}
execute if score play endcredit matches 1670 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-1f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"gold","italic":false,"text":"anotherone_yt\nLogGamja\nECYCEeeee"},shadow:1b}



execute if score play endcredit matches 1760 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"관련 모드 제작"},shadow:1b}
execute if score play endcredit matches 1760 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-1f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"aqua","italic":false,"text":"Sidite"},shadow:1b}

execute if score play endcredit matches 1830 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"일부 캐릭터 저작권"},shadow:1b}

execute if score play endcredit matches 1880 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"Sonic The Hedgehog"},shadow:1b}
execute if score play endcredit matches 1880 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"by Team Sonic"},shadow:1b}

execute if score play endcredit matches 1930 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"SANS"},shadow:1b}
execute if score play endcredit matches 1930 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"by Toby Fox"},shadow:1b}

execute if score play endcredit matches 1980 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"Kirby"},shadow:1b}
execute if score play endcredit matches 1980 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"by HAL Laboratory"},shadow:1b}

execute if score play endcredit matches 2030 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2.5f,2.5f,2.5f]},text:{"bold":true,"color":"white","italic":false,"text":"Dragoon, Vulture"},shadow:1b}
execute if score play endcredit matches 2030 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,-0.25f,0f],scale:[1f,1f,1f]},text:{"bold":true,"color":"white","italic":false,"text":"by Blizzard Entertainment"},shadow:1b}

execute if score play endcredit matches 2120 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"TEAM RKC"},shadow:1b}

#execute if score play endcredit matches 2250 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[3f,3f,3f]},text:{"bold":true,"color":"green","italic":false,"text":"Thanks For Playing"}}
#execute if score play endcredit matches 2255 run summon text_display -1314.51 4.00 0.5 {teleport_duration:3,Rotation:[-90F,0F],Tags:["endtext"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[2f,2f,2f]},text:[{"bold":true,"color":"yellow","italic":false,"text":"Kart"},{"bold":true,"color":"green","italic":false,"text":"R"},{"bold":true,"color":"yellow","italic":false,"text":"ider"},{"bold":true,"color":"yellow","italic":false,"text":" Forever!"}]}



execute as @e[tag=kartsteve,type=#kartmobil:kartmodels] at @s if score play endcredit matches 2150..2309 run tp @s ~ ~ ~-0.6 ~ 0

execute if score play endcredit matches 2250 as @e[tag=creditpoint,type=villager] at @s run kill @s
execute if score play endcredit matches 2250 run summon minecraft:villager -1297.63 6.75 280.78 {NoAI:1b,Invurnerable:1b,Silent:1b,Tags:[creditpoint],Rotation:[90f,0f],active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:999999,show_particles:0b,show_icon:0b,ambient:0b}]}

execute if score play endcredit matches 2250 run tp @a[tag=endcredit] -1297.63 6.75 280.78 145.73 24.74
execute if score play endcredit matches 2250 run tp @e[tag=creditpoint,type=villager] -1297.63 6.75 280.78 145.73 24.74
execute if score play endcredit matches 2251..2379 as @e[tag=creditpoint,type=villager] at @s run tp @s ^ ^ ^0.01

execute if score play endcredit matches 2370 as @e[tag=kartsteve,type=#kartmobil:kartmodels] at @s run kill @e[distance=..1]
execute if score play endcredit matches 2379 as @e[tag=creditmap] run kill @s

execute if score play endcredit matches 2380 run time set day


execute if score play endcredit matches 2380 run gamemode adventure @a[tag=endcredit]
execute if score play endcredit matches 2380 run tp @a[tag=endcredit] -118.5 4.00 215.5 0 0
execute if score play endcredit matches 2380 run tag @a[tag=endcredit] remove endcredit
execute if score play endcredit matches 2380 run kill @e[tag=kitemodel]
execute if score play endcredit matches 2380 run kill @e[tag=loggamjamodel]
execute if score play endcredit matches 2380 run kill @e[tag=sansbike2]
execute if score play endcredit matches 2380 run kill @e[tag=ttower]
execute if score play endcredit matches 2380 run kill @e[tag=pangchmodel]
execute if score play endcredit matches 2380 run kill @e[tag=mandick]
execute if score play endcredit matches 2380 run kill @e[tag=pengmodel]
execute if score play endcredit matches 2380 run kill @e[tag=eggmobile1]
execute if score play endcredit matches 2380 run kill @e[tag=sonic1]
execute if score play endcredit matches 2380 run kill @e[tag=anotherone]
execute if score play endcredit matches 2380 run kill @e[tag=endtext]
execute if score play endcredit matches 2380 run kill @e[tag=creditpoint]

execute if score play endcredit matches 2380 run forceload remove -1313 79 -1313 -96
execute if score play endcredit matches 2380 positioned -1298.60 7.81 281.81 run forceload remove ~ ~

execute if score play endcredit matches 2380 run function endcredit:clear

execute if score play endcredit matches 2380 run scoreboard players set play endcredit 0