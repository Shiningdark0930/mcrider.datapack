
#플레이어가 가까이 가면 카트 보여주기
execute at @a[tag=!multi-hub-player,tag=!kart-multi-player] run tag @e[distance=..7,tag=garage-kart,type=item_display] add garage-show
execute as @e[tag=garage-kart,tag=garage-show] at @s run function garage:system/showkart

#숨기기
execute as @e[tag=garage-kart,tag=garage-show] at @s unless entity @a[distance=..7] run function garage:system/hidekart

#엔진 선택 인터랙션
execute as @e[tag=kart-engine-interaction,type=interaction] at @s run function garage:engine-interaction
