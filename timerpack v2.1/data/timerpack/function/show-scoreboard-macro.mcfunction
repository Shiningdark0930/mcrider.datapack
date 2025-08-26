scoreboard players set timertext timerdisplay 2147483647
scoreboard players set timertext2 timerdisplay 2147483646

$data modify storage timermain time set value {"text":"$(min):$(sec).$(milisec)","color":"aqua"}
$scoreboard players display name timertext timerdisplay {"text":"   $(min):$(sec).$(milisec)   ","color":"aqua"}
scoreboard players display name timertext2 timerdisplay ""

scoreboard players display numberformat timertext timerdisplay blank
scoreboard players display numberformat timertext2 timerdisplay blank