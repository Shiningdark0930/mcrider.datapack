
#만약 타임어택 준비중인 사람이 있다면
execute as @a at @s if score @s updown-count matches 1.. if score @s updown-map matches 1.. run function updown:system/main

#관전자
bossbar set updown-spectator-ui players @a[tag=updown-spectator]
execute if entity @a[tag=updown-spectator] run function updown:system/spectator/spectatormain