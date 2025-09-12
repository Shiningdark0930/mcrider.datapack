tellraw @a[tag=kite-played] [{text:"⛨",color:yellow},{text:" 유저는 최소한의 몸싸움을 원합니다",color:aqua}]
tellraw @a[tag=kite-played] [{text:"🗡",color:red},{text:" 유저는 적극적인 몸싸움을 원합니다",color:aqua}]
tellraw @a[tag=kite-played] [{text:"표식 변경은 /trigger bump-allow 입력",color:aqua}]
tellraw @a {"text":"----적용된 모드----","color":"yellow"}
execute unless score team-battle multi-main matches 1 unless score no-collision multi-main matches 1 unless score inf-boost multi-main matches 1 unless score no-draft multi-main matches 1 unless score drag-accel multi-main matches 1 unless score mad-crash multi-main matches 1 unless score wall-crash multi-main matches 1 run tellraw @a {"text":"없음","color":"aqua"}
execute if score team-battle multi-main matches 1 run tellraw @a {"text":"팀전","color":"blue"}
execute if score no-collision multi-main matches 1 run tellraw @a {"text":"고스트 모드","color":"aqua"}
execute if score inf-boost multi-main matches 1 run tellraw @a {"text":"무한 부스터 모드","color":"aqua"}
execute if score no-draft multi-main matches 1 run tellraw @a {"text":"드래프트 끄기","color":"aqua"}
execute if score drag-accel multi-main matches 1 run tellraw @a {"text":"톡톡이 모드","color":"aqua"}
execute if score mad-crash multi-main matches 1 run tellraw @a {"text":"갓겜 모드","color":"aqua"}
execute if score wall-crash multi-main matches 1 run tellraw @a {"text":"벽 충돌 페널티","color":"aqua"}