item replace entity @s weapon.offhand with carrot_on_a_stick 1

title @s actionbar "기능 없음"
title @s[nbt={SelectedItemSlot:0}] actionbar "체크포인트 설치하기"
title @s[nbt={SelectedItemSlot:1}] actionbar "대형 체크포인트 설치하기"
title @s[nbt={SelectedItemSlot:2}] actionbar "체크포인트 삭제하기(10m범위)"
title @s[nbt={SelectedItemSlot:3}] actionbar "체크포인트 숫자 수정하기(10m범위)"

execute if entity @s[nbt={SelectedItemSlot:0}] run particle dust{color:[0, 1, 0],scale:1} ~ ~0.25 ~ .2 .2 .2 1 1
execute if entity @s[nbt={SelectedItemSlot:0},scores={carrot=1..}] run function checkpoint:tool/summon

execute if entity @s[nbt={SelectedItemSlot:1}] run particle dust{color:[0, 1, 0],scale:1} ~ ~0.25 ~ .2 .2 .2 1 1
execute if entity @s[nbt={SelectedItemSlot:1},scores={carrot=1..}] run function checkpoint:tool/summon-large

execute if entity @s[nbt={SelectedItemSlot:2}] at @n[tag=check-point,distance=..10] run particle dust{color:[1, 0, 0],scale:1} ~ ~0.25 ~ .2 .2 .2 1 1
execute if entity @s[nbt={SelectedItemSlot:2},scores={carrot=1..}] run function checkpoint:tool/remove
execute if entity @s[nbt={SelectedItemSlot:3},scores={carrot=1..}] run function checkpoint:tool/setnum

execute if score 10tick check-prev matches 1 at @s as @e[tag=check-point,distance=..200] at @s run function checkpoint:tool/shownum

scoreboard players reset @s carrot