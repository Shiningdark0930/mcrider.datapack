execute if score @s timecount matches 1.. if score @s timelap matches 1.. run tag @s add check-pass-last
execute if score @s dev-count matches 1.. if score @s dev-lap matches 1.. run tag @s add check-pass-last
execute if entity @s[tag=kart-multi-player] if score @s multi-lap matches 1.. run tag @s add check-pass-last
execute if score @s licensecount matches 1.. if score @s timelap matches 1.. run tag @s add check-pass-last
