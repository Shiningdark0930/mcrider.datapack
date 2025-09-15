
#전진카트
execute if score @n[tag=kartself,distance=..5,type=item_display] kartaccel matches 0.. at @s rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~ 35 positioned as @s run rotate @s ~ ~
#후진카트
execute if score @n[tag=kartself,distance=..5,type=item_display] kartaccel matches ..-1 at @s rotated as @p[tag=kartpassenger,distance=..0.3] rotated ~180 35 positioned as @s run rotate @s ~ ~
