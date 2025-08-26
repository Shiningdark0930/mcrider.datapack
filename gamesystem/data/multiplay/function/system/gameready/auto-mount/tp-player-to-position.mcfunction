execute as @a[tag=kart-multi-player] at @s run function multiplay:system/gameready/auto-mount/tp-player-to-marker
kill @e[tag=auto-mount-marker,type=marker]
execute as @a[tag=kart-multi-player] run function kartmobil:summon/swaphand