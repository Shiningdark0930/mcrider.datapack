data modify storage kartmain boosttag set from storage kartmain boosttags[0]

function kartmobil:summon/boost-effect/run-anime/save-transform with storage kartmain
data remove storage kartmain boosttags[0]

execute if data storage kartmain boosttags[0] run function kartmobil:summon/boost-effect/run-anime/find-numeric-tag-loop