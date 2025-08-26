tag @s add temp-asdf-this

tag @e[tag=kart-multi-collision] remove kart-multi-collision
execute at @s if entity @e[tag=auto-mount-marker,type=marker,tag=!temp-asdf-this,distance=..1.5] run tag @s add kart-multi-collision

#이동
execute at @s[tag=kart-multi-collision] if score auto-mount-left multi-main matches 0 if block ^1.8 ^-1.5 ^ magma_block if block ^1.8 ^0.25 ^ #kartmobil:ignoreblock run tp @s ^1.75 ^ ^
execute at @s[tag=kart-multi-collision] if score auto-mount-left multi-main matches 1 if block ^-1.8 ^-1.5 ^ magma_block if block ^-1.8 ^0.25 ^ #kartmobil:ignoreblock run tp @s ^-1.75 ^ ^

#이동 후 다시 감지
tag @s remove kart-multi-collision
execute at @s if entity @e[tag=auto-mount-marker,type=marker,tag=!temp-asdf-this,distance=..1.5] run tag @s add kart-multi-collision

#뒤로 이동(플레이어 히트박스 절반은 0.3)
execute at @s if score auto-mount-left multi-main matches 0 unless block ^0.5 ^-1.5 ^ magma_block run function multiplay:system/gameready/auto-mount/face-wall
execute at @s if score auto-mount-left multi-main matches 1 unless block ^-0.5 ^-1.5 ^ magma_block run function multiplay:system/gameready/auto-mount/face-wall
execute at @s if score auto-mount-left multi-main matches 0 if block ^0.5 ^-1.5 ^ magma_block unless block ^0.5 ^0.25 ^ #kartmobil:ignoreblock run function multiplay:system/gameready/auto-mount/face-wall
execute at @s if score auto-mount-left multi-main matches 1 if block ^-0.5 ^-1.5 ^ magma_block unless block ^-0.5 ^0.25 ^ #kartmobil:ignoreblock run function multiplay:system/gameready/auto-mount/face-wall

execute at @s[tag=kart-multi-collision] if score auto-mount-left multi-main matches 0 positioned ^-1.5 ^ ^ if entity @e[tag=auto-mount-marker,type=marker,tag=!temp-asdf-this,distance=..1.5] positioned ^1.5 ^ ^ unless block ^1.75 ^0.25 ^ #kartmobil:ignoreblock run function multiplay:system/gameready/auto-mount/face-wall
execute at @s[tag=kart-multi-collision] if score auto-mount-left multi-main matches 1 positioned ^1.5 ^ ^ if entity @e[tag=auto-mount-marker,type=marker,tag=!temp-asdf-this,distance=..1.5] positioned ^-1.5 ^ ^ unless block ^-1.75 ^0.25 ^ #kartmobil:ignoreblock run function multiplay:system/gameready/auto-mount/face-wall
execute at @s[tag=kart-multi-collision] if score auto-mount-left multi-main matches 0 positioned ^-1.5 ^ ^ if entity @e[tag=auto-mount-marker,type=marker,tag=!temp-asdf-this,distance=..1.5] positioned ^1.5 ^ ^ unless block ^1.75 ^-1.5 ^ magma_block run function multiplay:system/gameready/auto-mount/face-wall
execute at @s[tag=kart-multi-collision] if score auto-mount-left multi-main matches 1 positioned ^1.5 ^ ^ if entity @e[tag=auto-mount-marker,type=marker,tag=!temp-asdf-this,distance=..1.5] positioned ^-1.5 ^ ^ unless block ^-1.75 ^-1.5 ^ magma_block run function multiplay:system/gameready/auto-mount/face-wall

#한 플레이어를 배치 완료할때마다, 변수가 1과 0의 상태를 왔다갔다한다.
execute at @s[tag=!kart-multi-collision,tag=!face-wall] store result score auto-mount-left multi-main if score auto-mount-left multi-main matches 0
execute at @s[tag=kart-multi-collision] run function multiplay:system/gameready/auto-mount/detect-collision-and-move

#선에서 벗어나면 배치 안 하기
execute at @s unless block ~ ~-1.5 ~ magma_block run kill @s

tag @s remove temp-asdf-this
tag @s remove face-wall