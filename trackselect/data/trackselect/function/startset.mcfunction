scoreboard objectives add trackselect-map-id dummy
scoreboard objectives add trackselect-game-id dummy

bossbar add trackselect {"text":"1분 안에 트랙을 선택하세요","color":"yellow"}
bossbar set trackselect max 1200
bossbar set trackselect color yellow


#초기화
data modify storage track-list themes set value []
data remove storage track-list tracks

#테마 정의
data modify storage track-list themes append value {key:"forest",text:{"text":"포레스트","color":"green"},icon:"minecraft:oak_log"}
data modify storage track-list themes append value {key:"desert",text:{"text":"사막","color":"yellow"},icon:"minecraft:suspicious_sand"}
data modify storage track-list themes append value {key:"village",text:{"text":"빌리지","color":"blue"},icon:"minecraft:light_blue_wool"}
data modify storage track-list themes append value {key:"ice",text:{"text":"아이스","color":"blue"},icon:"minecraft:blue_ice"}
data modify storage track-list themes append value {key:"tomb",text:{"text":"공동묘지","color":"red"},icon:"minecraft:bone_block"}
data modify storage track-list themes append value {key:"mine",text:{"text":"광산","color":"light_purple"},icon:"minecraft:deepslate_gold_ore"}

data modify storage track-list themes append value {key:"planet",text:{"text":"노르테유","color":"light_purple"},icon:"minecraft:amethyst_block"}
data modify storage track-list themes append value {key:"factory",text:{"text":"팩토리","color":"yellow"},icon:"minecraft:waxed_chiseled_copper"}
data modify storage track-list themes append value {key:"pirate",text:{"text":"해적","color":"blue"},icon:"minecraft:lapis_block"}
data modify storage track-list themes append value {key:"moonhill",text:{"text":"문힐시티","color":"dark_blue"},icon:"minecraft:polished_blackstone"}
data modify storage track-list themes append value {key:"gold",text:{"text":"황금문명","color":"gold"},icon:"minecraft:raw_gold_block"}
data modify storage track-list themes append value {key:"china",text:{"text":"차이나","color":"red"},icon:"minecraft:red_shulker_box"}

data modify storage track-list themes append value {key:"mansion",text:{"text":"대저택","color":"red"},icon:"minecraft:stripped_acacia_wood"}
data modify storage track-list themes append value {key:"wkc",text:{"text":"WKC","color":"gold"},icon:"minecraft:reinforced_deepslate"}
data modify storage track-list themes append value {key:"beach",text:{"text":"비치","color":"blue"},icon:"minecraft:prismarine"}
data modify storage track-list themes append value {key:"world",text:{"text":"월드","color":"blue"},icon:"minecraft:light_blue_glazed_terracotta"}
data modify storage track-list themes append value {key:"nemo",text:{"text":"네모","color":"green"},icon:"minecraft:emerald_block"}
data modify storage track-list themes append value {key:"sword",text:{"text":"도검","color":"white"},icon:"minecraft:calcite"}

data modify storage track-list themes append value {key:"abyss",text:{"text":"어비스","color":"blue"},icon:"minecraft:blue_glazed_terracotta"}
data modify storage track-list themes append value {key:"korea",text:{"text":"코리아","color":"blue"},icon:"minecraft:white_shulker_box"}
data modify storage track-list themes append value {key:"maple",text:{"text":"메이플","color":"gold"},icon:"minecraft:red_mushroom_block"}
data modify storage track-list themes append value {key:"minecraft",text:{"text":"마인크래프트","color":"green"},icon:"minecraft:grass_block"}
data modify storage track-list themes append value {key:"kauzee",text:{"text":"카우지","color":"light_purple"},icon:"minecraft:structure_block"}

data modify storage track-list themes append value {key:"alpha",text:{"text":"알파","color":"gold"},icon:"minecraft:test_block"}
data modify storage track-list themes append value {key:"mariokart",text:{"text":"마리오카트","color":"red"},icon:"minecraft:player_head",mariokart:1}
data modify storage track-list themes append value {key:"thirdparty",text:{"text":"서드파티","color":"gold"},icon:"minecraft:command_block"}


##최신 트랙 - 107 리버스 폭우
#포레스트
data modify storage track-list tracks.forest append value {bgm:"forest",text:[{"text":"포레스트\n","color":"green"},{"text":"통나무","color":"aqua"}],number:3,lap:3,pos:"-689 46 875 0 0",creator:{"text":"By GhangDhang","color":"gold"}}
data modify storage track-list tracks.forest append value {bgm:"forest",text:[{"text":"포레스트\n","color":"green"},{"text":"기암괴석","color":"aqua"}],number:17,lap:3,pos:"-893 19 271 0 0",creator:{"text":"By Kation","color":"gold"}}
data modify storage track-list tracks.forest append value {bgm:"forest",text:[{"text":"포레스트\n","color":"green"},{"text":"지그재그","color":"aqua"}],number:33,lap:2,pos:"-424 78 -1550 -90 0",creator:{"text":"By bobjihoo","color":"gold"}}
data modify storage track-list tracks.forest append value {bgm:"forest",text:[{"text":"포레스트\n","color":"green"},{"text":"통곡의 절벽","color":"aqua"}],number:34,lap:2,pos:"8999 49 9000 -90 0",creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.forest append value {bgm:"forest2",text:[{"text":"포레스트\n","color":"green"},{"text":"아슬아슬 점프","color":"aqua"}],number:53,lap:3,pos:"875 4 -1368 180 0",creator:{"text":"By LogGamja","color":"gold"}}


#사막
data modify storage track-list tracks.desert append value {bgm:"desert2",text:[{"text":"사막\n","color":"yellow"},{"text":"빙글빙글 공사장","color":"aqua"}],number:4,lap:2,pos:"50.0 4 1093 180 0",creator:{"text":"By GhangDhang","color":"gold"}}
data modify storage track-list tracks.desert append value {bgm:"desert",text:[{"text":"사막\n","color":"yellow"},{"text":"피라미드 탐험","color":"aqua"}],number:47,lap:3,pos:"1998 5 0 0 0",creator:{"text":"By Physical","color":"gold"}}
data modify storage track-list tracks.desert append value {bgm:"desert",text:[{"text":"사막\n","color":"yellow"},{"text":"놀라운 공룡 유적지","color":"aqua"}],number:54,lap:2,pos:"1981 4 3019 90 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.desert append value {bgm:"desert2",text:[{"text":"[R] 사막\n","color":"yellow","italic":true},{"text":"빙글빙글 공사장","color":"aqua","italic":true}],number:89,lap:2,pos:"5095 4 -50 0 0",creator:{"text":"By BKGpolar","color":"gold"}}


#빌리지
data modify storage track-list tracks.village append value {bgm:"village2",text:[{"text":"빌리지\n","color":"blue"},{"text":"고가의 질주","color":"aqua"}],number:1,lap:2,pos:"-221 4 80 0 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village3",text:[{"text":"빌리지\n","color":"blue"},{"text":"손가락","color":"aqua"}],number:2,lap:3,pos:"291 4 274 90 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village2",text:[{"text":"빌리지\n","color":"blue"},{"text":"남산","color":"aqua"}],number:26,lap:2,pos:"6510 5 4126 -90 0",creator:{"text":"By Dominogames0229","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village",text:[{"text":"빌리지\n","color":"blue"},{"text":"시계탑","color":"aqua"}],number:85,lap:3,pos:"4999 36 -8000 90 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village",text:[{"text":"빌리지\n","color":"blue"},{"text":"운하","color":"aqua"}],number:90,lap:3,pos:"4000 62 -8000 -90 0",creator:{"text":"By HITE_yt","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village",text:[{"text":"빌리지\n","color":"blue"},{"text":"손가락 2","color":"aqua"}],number:48,lap:2,pos:"4040 4 1941 -90 0",creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village3",text:[{"text":"빌리지\n","color":"blue"},{"text":"붐힐터널","color":"aqua"}],number:61,lap:1,pos:"-1000 31 1000 0 0",creator:{"text":"By ECYCEeeee","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village2",text:[{"text":"빌리지\n","color":"blue"},{"text":"운명의 다리","color":"aqua"}],number:64,lap:2,pos:"1010.0 29 -8949 0 0",creator:{"text":"By KITE2459","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"village4",text:[{"text":"빌리지\n","color":"blue"},{"text":"붐힐 드라이브","color":"aqua","bold":true}],number:96,lap:1,pos:"10013 62 -2183 90 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.village append value {bgm:"license",text:[{"text":"빌리지\n","color":"blue"},{"text":"뱅크 트랙","color":"aqua"}],number:101,lap:3,pos:"7999 71 -8000 90 0",creator:{"text":"By Glass_Man01","color":"gold"}}


#광산
data modify storage track-list tracks.mine append value {bgm:"mine",text:[{"text":"광산\n","color":"light_purple"},{"text":"꼬불꼬불 다운힐","color":"aqua"}],number:5,lap:1,pos:"-31 106 -1377 -90 0",creator:{"text":"By GhangDhang","color":"gold"}}
data modify storage track-list tracks.mine append value {bgm:"mine2",text:[{"text":"광산\n","color":"light_purple"},{"text":"아슬아슬 궤도전차","color":"aqua"}],number:29,lap:3,pos:"4906 32 5787 -90 0",creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.mine append value {bgm:"mine2",text:[{"text":"광산\n","color":"light_purple"},{"text":"위험한 제련소","color":"aqua"}],number:65,lap:2,pos:"5000 138 2999 0 0",creator:{"text":"By ECYCEeeee","color":"gold"}}


#노르테유
data modify storage track-list tracks.planet append value {bgm:"planet",text:[{"text":"노르테유\n","color":"light_purple"},{"text":"익스프레스","color":"aqua"}],number:99,lap:1,pos:"4998 66 -9000 90 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.planet append value {bgm:"planet",text:[{"text":"노르테유\n","color":"light_purple"},{"text":"전투비행장","color":"aqua"}],number:67,lap:2,pos:"1999 134 -5999.0 -90 0",etc:["time set 18000"],creator:{"text":"By ECYCEeeee","color":"gold"}}
data modify storage track-list tracks.planet append value {bgm:"planet2",text:[{"text":"노르테유\n","color":"light_purple"},{"text":"허공의 갈림길","color":"aqua"}],number:25,lap:3,pos:"1430 138 228 -90 0",creator:{"text":"By fourgod","color":"gold"}}
data modify storage track-list tracks.planet append value {bgm:"planet2",text:[{"text":"노르테유\n","color":"light_purple"},{"text":"붕붕 점프","color":"aqua"}],number:27,lap:3,pos:"753 159 -413 -90 0",etc:["time set 18000"],creator:{"text":"By Kation","color":"gold"}}
data modify storage track-list tracks.planet append value {bgm:"planet2",text:[{"text":"[R] 노르테유[오리지널]\n","color":"light_purple","italic":true},{"text":"익스프레스","color":"aqua","italic":true}],number:106,lap:1,pos:"3001 20 9999 -150 0",creator:{"text":"By BKGpolar","color":"gold"}}

#월드
data modify storage track-list tracks.world append value {bgm:"rio",text:[{"text":"월드\n","color":"blue"},{"text":"리오 다운힐","color":"aqua"}],number:7,lap:1,pos:"-834 129 1583 -90 0",creator:{"text":"By GhangDhang","color":"gold"}}
data modify storage track-list tracks.world append value {bgm:"world",text:[{"text":"월드\n","color":"blue"},{"text":"두바이 다운타운","color":"aqua"}],number:52,lap:2,pos:"4024 5 5990 0 0",creator:{"text":"By BKGpolar","color":"gold"}}
data modify storage track-list tracks.world append value {bgm:"world2",text:[{"text":"월드\n","color":"blue"},{"text":"파리 에펠탑 다이브","color":"aqua"}],number:75,lap:2,pos:"5050 -41 -1855 0 0",etc:["time set 12600"],creator:{"text":"By L_Peng","color":"gold"}}

#대저택
data modify storage track-list tracks.mansion append value {bgm:"mansion3",text:[{"text":"대저택\n","color":"red"},{"text":"루이의 장난감 천국","color":"aqua"}],number:55,lap:3,pos:"-5011 4 -5000 90 0",creator:{"text":"By L_Peng","color":"gold"}}
data modify storage track-list tracks.mansion append value {bgm:"mansion2",text:[{"text":"대저택\n","color":"red"},{"text":"은밀한 지하실","color":"aqua"}],number:8,lap:2,pos:"-850.0 62 -233 0 0",creator:{"text":"By GhangDhang","color":"gold"}}
data modify storage track-list tracks.mansion append value {bgm:"mansion",text:[{"text":"대저택\n","color":"red"},{"text":"루이의 숨겨진 비밀 방","color":"aqua"}],number:77,lap:3,pos:"5196 5 -3842 90 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.mansion append value {bgm:"mansion3",text:[{"text":"대저택\n","color":"red"},{"text":"럭셔리 거대욕조","color":"aqua"}],number:81,lap:3,pos:"9011 30 -29 -90 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.mansion append value {bgm:"mansion",text:[{"text":"대저택\n","color":"red"},{"text":"루이의 서재","color":"aqua"}],number:84,lap:3,pos:"-2 19 2986 90 0",creator:{"text":"By Glass_Man01","color":"gold"}}

#공동묘지
data modify storage track-list tracks.tomb append value {bgm:"tomb",text:[{"text":"공동묘지\n","color":"red"},{"text":"공포의 외길","color":"aqua"}],number:42,lap:3,pos:"-1948 71 1951 180 0",etc:["time set 18000"],creator:{"text":"By BKGpolar","color":"gold"}}
data modify storage track-list tracks.tomb append value {bgm:"tomb2",text:[{"text":"공동묘지\n","color":"red"},{"text":"마왕의 초대","color":"aqua"}],number:44,lap:2,pos:"-2973 69 -1935 90 0",etc:["time set 13500"],creator:{"text":"By L_Peng","color":"gold"}}

#아이스
data modify storage track-list tracks.ice append value {bgm:"ice2",text:[{"text":"아이스\n","color":"blue"},{"text":"신나는 하프파이프","color":"aqua"}],number:10,lap:3,pos:"9082 61 3865 180 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.ice append value {bgm:"ice",text:[{"text":"아이스\n","color":"blue"},{"text":"갈라진 빙산","color":"aqua"}],number:68,lap:3,pos:"-4838 10 -5733 180 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.ice append value {bgm:"ice",text:[{"text":"아이스\n","color":"blue"},{"text":"부서진 빙산","color":"aqua"}],number:59,lap:2,pos:"1000 19 -8001 0 0",creator:{"text":"By ECYCEeeee","color":"gold"}}
data modify storage track-list tracks.ice append value {bgm:"ice",text:[{"text":"아이스\n","color":"blue"},{"text":"설산 다운힐","color":"aqua"}],number:73,lap:2,pos:"5000 218 8000 90 0",creator:{"text":"By ECYCEeeee","color":"gold"}}
data modify storage track-list tracks.ice append value {bgm:"ice2",text:[{"text":"아이스\n","color":"blue"},{"text":"익스트림 경기장","color":"aqua"}],number:86,lap:2,pos:"-3910 55 960 180 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.ice append value {bgm:"ice2",text:[{"text":"아이스[오리지널]\n","color":"blue"},{"text":"버려진 연습장","color":"aqua"}],number:38,lap:5,pos:"1108 4 -1105 -90 0",creator:{"text":"By anotherone_yt","color":"gold"}}
data modify storage track-list tracks.ice append value {bgm:"ice",text:[{"text":"아이스[오리지널]\n","color":"blue"},{"text":"아이스리온 랜드","color":"aqua","bold":true}],number:102,lap:1,pos:"-7933 10 8256 180 0",creator:{"text":"By BKGpolar","color":"gold"}}


#차이나
data modify storage track-list tracks.china append value {bgm:"china",text:[{"text":"차이나\n","color":"red"},{"text":"서안 병마용","color":"aqua"}],number:6,lap:2,pos:"861 61 -4971 0 0",creator:{"text":"By Glass_Man01","color":"gold"}}
data modify storage track-list tracks.china append value {bgm:"china2",text:[{"text":"차이나\n","color":"red"},{"text":"무당산 다운힐","color":"aqua"}],number:45,lap:1,pos:"-2440 295 1654 0 0",creator:{"text":"By BKGpolar","color":"gold"}}
data modify storage track-list tracks.china append value {bgm:"china2",text:[{"text":"차이나\n","color":"red"},{"text":"골목길 대질주","color":"aqua"}],number:88,lap:2,pos:"-5000 34 1998 180 0",creator:{"text":"By ECYCEeeee","color":"gold"}}

#네모
data modify storage track-list tracks.nemo append value {bgm:"nemo",text:[{"text":"네모\n","color":"green"},{"text":"산타의 비밀공간","color":"aqua"}],number:15,lap:2,pos:"1169.0 163.0 -865.5 -90 0",creator:{"text":"By KITE2459","color":"gold"}}
data modify storage track-list tracks.nemo append value {bgm:"nemo2",text:[{"text":"네모\n","color":"green"},{"text":"장난감 선물공장","color":"aqua"}],number:50,lap:1,pos:"-2001 308 -1000 0 0",creator:{"text":"By ECYCEeeee","color":"gold"}}
data modify storage track-list tracks.nemo append value {bgm:"nemo4",text:[{"text":"네모\n","color":"green"},{"text":"강철바위 용광로","color":"aqua"}],number:57,lap:2,pos:"2810 224 -4293 -90 0",etc:["function spinningterrain:summonspinob","function spinningterrain:startrota"],creator:{"text":"By tco3307402","color":"gold"}}
	
#해적
data modify storage track-list tracks.pirate append value {bgm:"pirate",text:[{"text":"해적\n","color":"blue"},{"text":"로비 절벽의 전투","color":"aqua"}],number:16,lap:2,pos:"118 14 2123 180 0",creator:{"text":"By Kation","color":"gold"}}
data modify storage track-list tracks.pirate append value {bgm:"pirate2",text:[{"text":"해적\n","color":"blue"},{"text":"숨겨진 보물","color":"aqua"}],number:46,lap:2,pos:"2999 4 -1002 -90 0",creator:{"text":"By SEOLEETAE","color":"gold"}}
data modify storage track-list tracks.pirate append value {bgm:"pirate3",text:[{"text":"해적\n","color":"blue"},{"text":"가파른 감시탑","color":"aqua"}],number:83,lap:2,pos:"0 19 -7001 0 0",creator:{"text":"By EYRT","color":"gold"}}
data modify storage track-list tracks.pirate append value {bgm:"pirate",text:[{"text":"[R] 해적\n","color":"blue","italic":true},{"text":"로비 절벽의 전투","color":"aqua","italic":true}],number:98,lap:2,pos:"-9000 14 -3999 0 0",creator:{"text":"By L_Peng","color":"gold"}}

#문힐시티
data modify storage track-list tracks.moonhill append value {bgm:"moonhill",text:[{"text":"문힐시티\n","color":"dark_blue"},{"text":"숨겨진 지하터널","color":"aqua"}],number:74,lap:2,pos:"4000 100 -6997 0 0",etc:["time set 13500"],creator:{"text":"By EYRT","color":"gold"}}
data modify storage track-list tracks.moonhill append value {bgm:"moonhill",text:[{"text":"문힐시티\n","color":"dark_blue"},{"text":"폭우속의 질주","color":"aqua"}],number:105,lap:2,pos:"1001 99 10000 90 0",etc:["time set midnight","weather rain"],creator:{"text":"By EYRT","color":"gold"}}
data modify storage track-list tracks.moonhill append value {bgm:"moonhill",text:[{"text":"[R] 문힐시티\n","color":"dark_blue","italic":true},{"text":"폭우속의 질주","color":"aqua","italic":true}],number:107,lap:2,pos:"-4997 99 -10000 -90 0",etc:["time set midnight","weather rain"],creator:{"text":"By BKGpolar","color":"gold"}}


#황금문명
data modify storage track-list tracks.gold append value {bgm:"gold",text:[{"text":"황금문명\n","color":"gold"},{"text":"오르에트 황금 좌표","color":"aqua"}],number:69,lap:2,pos:"-3853 31 -3621 90 0",etc:["effect give @a minecraft:night_vision infinite 1 true","time set 12800"],creator:{"text":"By N_Devil","color":"gold"}}


#메이플
data modify storage track-list tracks.maple append value {bgm:"maplenew",text:[{"text":"메이플\n","color":"gold"},{"text":"레헬른 악몽의 시계탑","color":"aqua"}],number:18,lap:2,pos:"8200 6 7975 -90 0",etc:["time set 13500"],creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.maple append value {bgm:"maple2",text:[{"text":"메이플\n","color":"gold"},{"text":"헤네시스 공원","color":"aqua"}],number:66,lap:2,pos:"7174 76 7417 90 0",creator:{"text":"By BKGpolar","color":"gold"}}

#비치
data modify storage track-list tracks.beach append value {bgm:"beach",text:[{"text":"비치\n","color":"blue"},{"text":"신나는 여름휴가","color":"aqua"}],number:20,lap:3,pos:"2067 5 2322 90 0",creator:{"text":"By Onliy","color":"gold"}}
data modify storage track-list tracks.beach append value {bgm:"beach",text:[{"text":"비치\n","color":"blue"},{"text":"해변 드라이브","color":"aqua"}],number:22,lap:2,pos:"-2362 19 -1779 0 0",creator:{"text":"By fourgod","color":"gold"}}
data modify storage track-list tracks.beach append value {bgm:"beach",text:[{"text":"비치\n","color":"blue"},{"text":"트랙 9","color":"aqua"}],number:36,lap:1,pos:"9070 85 7575 0 0",creator:{"text":"By fourgod","color":"gold"}}

#WKC
data modify storage track-list tracks.wkc append value {bgm:"wkc",text:[{"text":"WKC\n","color":"gold"},{"text":"투어링 랠리","color":"aqua"}],number:21,lap:1,pos:"4006 69 3999 180 0",etc:["time set 12500"],creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkc2",text:[{"text":"WKC\n","color":"gold"},{"text":"상해 서킷","color":"aqua"}],number:28,lap:2,pos:"7997 5 6000 180 0",etc:["weather rain"],creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkcdrift",text:[{"text":"WKC\n","color":"gold"},{"text":"강남 서킷","color":"aqua"}],number:32,lap:1,pos:"-985 5 -670 0 0",etc:["time set 12500"],creator:{"text":"By bobjihoo","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkc",text:[{"text":"WKC\n","color":"gold"},{"text":"코리아 서킷","color":"aqua"}],number:76,lap:2,pos:"3504 4 -7651 -90 0",etc:["weather rain"],creator:{"text":"By tco3307402","color":"gold"}}

data modify storage track-list tracks.wkc append value {bgm:"wkc",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"F1 서킷","color":"aqua"}],number:11,lap:2,pos:"-470 4 -533 90 0",creator:{"text":"By SEOLEETAE","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wind",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"컴포트 레이스","color":"aqua"}],number:12,lap:2,pos:"599 4 806 180 0",creator:{"text":"By Kation","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkc",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"트럼펫","color":"aqua"}],number:13,lap:3,pos:"563 4 600 90 0",creator:{"text":"By NewConnor","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wind",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"익스트림 레이싱","color":"aqua"}],number:14,lap:2,pos:"634 4 1022 -90 0",creator:{"text":"By Kation","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkcdrift",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"미완성 서킷","color":"aqua"}],number:35,lap:3,pos:"9024.5 24 8171 0 0",creator:{"text":"© RedgraveMC","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkc2",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"서울 시가지 서킷","color":"aqua"}],number:49,lap:2,pos:"985 18 -3001 0 0",creator:{"text":"By whitecow","color":"gold"}}
data modify storage track-list tracks.wkc append value {bgm:"wkc2",text:[{"text":"WKC[오리지널]\n","color":"gold"},{"text":"인제 스피디움","color":"aqua"}],number:62,lap:3,pos:"3834 8 -1179 0 0",creator:{"text":"By banjil2009","color":"gold"}}


#어비스
data modify storage track-list tracks.abyss append value {bgm:"abyss",text:[{"text":"어비스\n","color":"blue"},{"text":"스카이라인","color":"aqua"}],number:24,lap:2,pos:"1999 161 3994 90 0",etc:["time set 18000"],creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.abyss append value {bgm:"abyss2",text:[{"text":"어비스\n","color":"blue"},{"text":"숨겨진 바닷길","color":"aqua"}],number:71,lap:2,pos:"-966 149 -1578 -117 0",etc:["time set 18000","effect give @a minecraft:night_vision infinite 1 true"],creator:{"text":"By BKGpolar","color":"gold"}}

#팩토리
data modify storage track-list tracks.factory append value {bgm:"factory",text:[{"text":"팩토리\n","color":"yellow"},{"text":"미완성 5구역","color":"aqua"}],number:23,lap:1,pos:"2974 30 1995 180 0",etc:["time set 12500"],creator:{"text":"By Kation","color":"gold"}}
data modify storage track-list tracks.factory append value {bgm:"factory3",text:[{"text":"팩토리\n","color":"yellow"},{"text":"부비트랩 공장 탐험","color":"aqua"}],number:70,lap:3,pos:"-1898 32 597 90 0",etc:["time set day"],creator:{"text":"By Koral","color":"gold"}}
data modify storage track-list tracks.factory append value {bgm:"factory2",text:[{"text":"팩토리\n","color":"yellow"},{"text":"두개의 공장","color":"aqua"}],number:63,lap:2,pos:"4001 33 -4000 0 0",etc:["time set 12500"],creator:{"text":"By L_Peng","color":"gold"}}
data modify storage track-list tracks.factory append value {bgm:"factory4",text:[{"text":"팩토리\n","color":"yellow"},{"text":"브로디 비밀의 연구소","color":"aqua"}],number:72,lap:2,pos:"3000 125 1000 180 0",etc:["time set noon"],creator:{"text":"By ECYCEeeee","color":"gold"}}

#마인크래프트
data modify storage track-list tracks.minecraft append value {bgm:"otherside",text:[{"text":"마인크래프트\n","color":"green"},{"text":"모험의 시간","color":"aqua"}],number:19,lap:2,pos:"1080 4 -1756 90 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.minecraft append value {bgm:"dream",text:[{"text":"마인크래프트\n","color":"green"},{"text":"엔드 시티 탐험","color":"aqua"}],number:30,lap:2,pos:"-3008 72 3990 180 0",etc:["time set 18000"],creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.minecraft append value {bgm:"wkc",text:[{"text":"마인크래프트\n","color":"green"},{"text":"잊혀진 정글","color":"aqua"}],number:31,lap:1,pos:"6427 11 6373 -90 0",etc:["time set 13000"],creator:{"text":"© Bluleader64","color":"gold"}}
data modify storage track-list tracks.minecraft append value {bgm:"mine",text:[{"text":"마인크래프트\n","color":"green"},{"text":"다이아몬드다!","color":"aqua"}],number:37,lap:1,pos:"3756 138 757 0 0",creator:{"text":"© ghostly","color":"gold"}}
data modify storage track-list tracks.minecraft append value {bgm:"village4",text:[{"text":"마인크래프트\n","color":"green"},{"text":"1년의 시간","color":"aqua"}],number:100,lap:1,pos:"-9022 4 -10001 90 0",creator:{"text":"By L_Peng","color":"gold"},etc:["time set midnight"]}


#코리아
data modify storage track-list tracks.korea append value {bgm:"korea",text:[{"text":"코리아\n","color":"blue"},{"text":"제주 해오름 다운힐","color":"aqua"}],number:40,lap:1,pos:"2429 226 3393 180 0",creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.korea append value {bgm:"korea2a",text:[{"text":"코리아\n","color":"blue"},{"text":"부산의 밤","color":"aqua"}],number:58,lap:2,pos:"999 87 5000 -90 0",etc:["time set 18000"],creator:{"text":"By ECYCEeeee","color":"gold"}}
data modify storage track-list tracks.korea append value {bgm:"korea2",text:[{"text":"코리아[오리지널]\n","color":"blue"},{"text":"홍대 새벽녘 질주","color":"aqua"}],number:97,lap:2,pos:"3123 4 8223 90 0",etc:["time set 23100"],creator:{"text":"By withlight_","color":"gold"}}
data modify storage track-list tracks.korea append value {bgm:"korea",text:[{"text":"코리아[오리지널]\n","color":"blue"},{"text":"울릉도 고갯길","color":"aqua"}],number:87,lap:1,pos:"2884 39 -8677 135 0",creator:{"text":"By withlight_","color":"gold"}}


#도검
data modify storage track-list tracks.sword append value {bgm:"sword",text:[{"text":"도검\n","color":"white"},{"text":"구름의 협곡","color":"aqua"}],number:56,lap:2,pos:"5796 237 -5781 -90 0",creator:{"text":"By BKGpolar","color":"gold"}}
data modify storage track-list tracks.sword append value {bgm:"fengshen",text:[{"text":"도검\n","color":"white"},{"text":"봉신전설 천외선경","color":"aqua"}],number:92,lap:2,pos:"3978 150 -9023 -90 0",etc:["effect give @a minecraft:night_vision infinite 1 true"],creator:{"text":"By L_Peng","color":"gold"}}


#카우지
data modify storage track-list tracks.kauzee append value {bgm:"kauzee",text:[{"text":"카우지\n","color":"light_purple"},{"text":"디스트릭트 13","color":"aqua"}],number:51,lap:3,pos:"1009 118 3000 90 0",creator:{"text":"By BKGpolar","color":"gold"}}

#마리오카트
data modify storage track-list tracks.mariokart append value {bgm:"mkddrainbow",text:[{"text":"마리오카트\n","color":"red"},{"text":"무지개 로드 GC","color":"aqua"}],number:78,lap:2,pos:"6000 212 -999 0 0",etc:["time set 18000"],creator:{"text":"© TheRealBlank512","color":"gold"}}
data modify storage track-list tracks.mariokart append value {bgm:"mk8rainbow64",text:[{"text":"마리오카트\n","color":"red"},{"text":"무지개 로드 64","color":"aqua"}],number:82,lap:2,pos:"-7000 150 -1 180 0",etc:["time set 18000"],creator:{"text":"© TheRealBlank512","color":"gold"}}
data modify storage track-list tracks.mariokart append value {bgm:"mkdswaluigi",text:[{"text":"마리오카트\n","color":"red"},{"text":"와루이지 핀볼","color":"aqua"}],number:79,lap:3,pos:"3999 66 8000 90 0",etc:["time set 18000"],creator:{"text":"© TheRealBlank512","color":"gold"}}
data modify storage track-list tracks.mariokart append value {bgm:"mkdsdelfino",text:[{"text":"마리오카트\n","color":"red"},{"text":"몬테 타운","color":"aqua"}],number:80,lap:3,pos:"9000 72 -4000 90 0",creator:{"text":"© Beany","color":"gold"}}
data modify storage track-list tracks.mariokart append value {bgm:"mkscsnowland",text:[{"text":"마리오카트\n","color":"red"},{"text":"스노우랜드","color":"aqua"}],number:91,lap:5,pos:"2999 4 6999 180 0",creator:{"text":"JA_hyun_VA","color":"gold"}}
data modify storage track-list tracks.mariokart append value {bgm:"mkdsyoshifalls",text:[{"text":"마리오카트\n","color":"red"},{"text":"요시알 폭포","color":"aqua"}],number:103,lap:5,pos:"11000.00 17.00 10000.0 -90 0",creator:{"text":"© Springstof","color":"gold"}}
data modify storage track-list tracks.mariokart append value {bgm:"mkdsairshipfortress",text:[{"text":"마리오카트\n","color":"red"},{"text":"킬러 해적선","color":"aqua"}],number:104,lap:3,pos:"12000 82 10000 -90 0",creator:{"text":"© Rocket Raccoon","color":"gold"}}

#서드파티
data modify storage track-list tracks.thirdparty append value {bgm:"cityescape",text:[{"text":"서드파티\n","color":"gold"},{"text":"시티 이스케이프","color":"aqua"}],number:39,lap:1,pos:"1138 299 872 -90 0",creator:{"text":"By Asdf08","color":"gold"}}
data modify storage track-list tracks.thirdparty append value {bgm:"ice2",text:[{"text":"서드파티\n","color":"gold"},{"text":"황금의 순간","color":"aqua"}],number:41,lap:2,pos:"9378 66 10314 -90 0",etc:["time set 13500"],creator:{"text":"© LASTFOR","color":"gold"}}
data modify storage track-list tracks.thirdparty append value {bgm:"run90",text:[{"text":"서드파티\n","color":"gold"},{"text":"마키나 다운힐","color":"aqua"}],number:43,lap:1,pos:"1573 222 -1394 0 0",etc:["time set 18000"],creator:{"text":"© Justinb535","color":"gold"}}

#알파
data modify storage track-list tracks.alpha append value {bgm:"china",text:[{"text":"[α] ","color":"gold"},{"text":"차이나\n","color":"red"},{"text":"서안 병마용","color":"aqua"}],number:93,lap:2,pos:"5001 84 1000 -90 0",creator:{"text":"By GhangDhang","color":"gold"}}
data modify storage track-list tracks.alpha append value {bgm:"nemo3",text:[{"text":"[α] ","color":"gold"},{"text":"네모\n","color":"green"},{"text":"산타의 비밀공간","color":"aqua"}],number:94,lap:3,pos:"5001 140 2000 -90 0",creator:{"text":"By LogGamja","color":"gold"}}
data modify storage track-list tracks.alpha append value {bgm:"maple",text:[{"text":"[α] ","color":"gold"},{"text":"메이플\n","color":"gold"},{"text":"레헬른 악몽의 시계탑","color":"aqua"}],number:95,lap:3,pos:"2000 4 2000 0 0",etc:["time set 13500"],creator:{"text":"By _Nekter_","color":"gold"}}
data modify storage track-list tracks.alpha append value {bgm:"planet",text:[{"text":"[α] ","color":"gold"},{"text":"노르테유\n","color":"light_purple"},{"text":"익스프레스","color":"aqua"}],number:9,lap:1,pos:"1418 155 17 -90 0",creator:{"text":"By GhangDhang","color":"gold"}}


# #오리지널
# data modify storage track-list tracks.original append value {bgm:"wkc",text:[{"text":"오리지널\n","color":"yellow"},{"text":"F1 서킷","color":"aqua"}],number:11,lap:2,pos:"-470 4 -533 90 0"}
# data modify storage track-list tracks.original append value {bgm:"wind",text:[{"text":"오리지널\n","color":"yellow"},{"text":"컴포트 레이스","color":"aqua"}],number:12,lap:2,pos:"599 4 806 180 0"}
# data modify storage track-list tracks.original append value {bgm:"wkc",text:[{"text":"오리지널\n","color":"yellow"},{"text":"트럼펫","color":"aqua"}],number:13,lap:3,pos:"563 4 600 90 0"}
# data modify storage track-list tracks.original append value {bgm:"wind",text:[{"text":"오리지널\n","color":"yellow"},{"text":"익스트림 레이싱","color":"aqua"}],number:14,lap:2,pos:"634 4 1022 -90 0"}
# data modify storage track-list tracks.original append value {bgm:"wkc",text:[{"text":"오리지널\n","color":"yellow"},{"text":"미완성 서킷","color":"aqua"}],number:35,lap:3,pos:"9024.5 24 8171 0 0"}
# data modify storage track-list tracks.original append value {bgm:"ice2",text:[{"text":"오리지널\n","color":"yellow"},{"text":"버려진 연습장","color":"aqua"}],number:38,lap:6,pos:"1108 4 -1105 -90 0"}
# data modify storage track-list tracks.original append value {bgm:"cityescape",text:[{"text":"오리지널\n","color":"yellow"},{"text":"시티 이스케이프","color":"aqua"}],number:39,lap:1,pos:"1138 299 872 -90 0"}
# data modify storage track-list tracks.original append value {bgm:"ice2",text:[{"text":"오리지널\n","color":"yellow"},{"text":"황금의 순간","color":"aqua"}],number:41,lap:2,pos:"9378 66 10314 -90 0",etc:["time set 13500"]}
# data modify storage track-list tracks.original append value {bgm:"run90",text:[{"text":"오리지널\n","color":"yellow"},{"text":"마키나 다운힐","color":"aqua"}],number:43,lap:1,pos:"1573 222 -1394 0 0",etc:["time set 18000","effect give @s minecraft:night_vision 65 1 true"]}
# data modify storage track-list tracks.original append value {bgm:"wkc2",text:[{"text":"오리지널\n","color":"yellow"},{"text":"서울 시가지 서킷","color":"aqua"}],number:49,lap:2,pos:"985 18 -3001 0 0"}

#변수 설정
scoreboard objectives add track-ui dummy


#테스트용
#data modify storage track-list tracks.minecraft append value {bgm:"mine",text:[{"text":"마인크래프트\n","color":"green"},{"text":"니얼굴이다!","color":"aqua"}],number:2000,lap:1,pos:"209 71 -55 180 0",creator:{"text":"© ghostly","color":"gold"},etc:["setblock 201 73 -57 minecraft:redstone_block"]}