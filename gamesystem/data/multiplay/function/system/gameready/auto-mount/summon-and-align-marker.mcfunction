
execute at @a[tag=kart-multi-player] run summon marker ~ ~ ~ {Tags:["auto-mount-marker"]}
execute as @e[tag=auto-mount-marker,type=marker] run function trackselect:read-track-data/movetomap with entity @n[tag=trackselect-multi-marker] data.track
function multiplay:system/gameready/auto-mount/loop