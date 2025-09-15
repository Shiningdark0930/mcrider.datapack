#태그 겹침 제거
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-light,tag=kart-boost-flame] remove kart-light
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-light,tag=drift-effect] remove kart-light

#부스터 블록 종류 태그
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-move-start] add kart-boost-blocks
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-move-end] add kart-boost-blocks
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-block] add kart-boost-blocks
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-instant] add kart-boost-blocks
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-fade] add kart-boost-blocks

#뛰라이더 태그
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-run-anime-first] add kart-run-anime
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-run-anime-mid] add kart-run-anime
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-run-anime-last] add kart-run-anime

execute if entity @e[distance=..0.01,type=#kartmobil:kartmodels,tag=kart-run-anime] run tag @e[tag=kartmobil,tag=karttemp,type=item_display] add kart-use-run-anime

#움직이는 변부 태그
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-block] add kart-boost-move
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-move-start] add kart-boost-move

#변신 부스터 태그
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-blocks] add kart-boost
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost-flame] add kart-boost

#태그 삭제 무시
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=drift-effect] add kart-bypass-tag
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-boost] add kart-bypass-tag
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-run-anime] add kart-bypass-tag
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=kart-light] add kart-bypass-tag

#모델링의 태그 삭제 처리
execute as @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=!shadow-models] run data merge entity @s {teleport_duration:1}
execute as @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=!shadow-models] run data merge entity @s[tag=!kart-bypass-tag] {Tags:[""]}

tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=!shadow-models] add kartmodel
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=!shadow-models] add kartentity
tag @e[distance=..0.01,type=#kartmobil:kartmodels,tag=!kartmobil,tag=!kartmodelsaddle,tag=!kartdirection,tag=!shadow-models] add kartmodeltemp
