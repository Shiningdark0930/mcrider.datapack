$execute at @p[tag=kartpassenger] run rotate @p[tag=kartpassenger] $(boostpaddirection) ~
$execute at @n[tag=kartdirection] run rotate @n[tag=kartdirection] $(boostpaddirection) ~
$execute if score @s kart-engine matches 1002..1003 run rotate @s $(boostpaddirection) ~

$execute if score @s kartaccel matches ..-1 at @p[tag=kartpassenger] rotated 180 0 run rotate @p[tag=kartpassenger] ~$(boostpaddirection) ~