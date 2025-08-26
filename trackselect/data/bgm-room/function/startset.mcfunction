#초기화
data modify storage bgm-room themes set value []
data remove storage bgm-room bgms

#테마 정의#테마 정의
data modify storage bgm-room themes append value {key:"forest",text:{"text":"포레스트","color":"green"},icon:"minecraft:oak_log"}
data modify storage bgm-room themes append value {key:"desert",text:{"text":"사막","color":"yellow"},icon:"minecraft:suspicious_sand"}
data modify storage bgm-room themes append value {key:"village",text:{"text":"빌리지","color":"blue"},icon:"minecraft:light_blue_wool"}
data modify storage bgm-room themes append value {key:"ice",text:{"text":"아이스","color":"blue"},icon:"minecraft:blue_ice"}
data modify storage bgm-room themes append value {key:"tomb",text:{"text":"공동묘지","color":"red"},icon:"minecraft:bone_block"}
data modify storage bgm-room themes append value {key:"mine",text:{"text":"광산","color":"light_purple"},icon:"minecraft:deepslate_gold_ore"}

data modify storage bgm-room themes append value {key:"planet",text:{"text":"노르테유","color":"light_purple"},icon:"minecraft:amethyst_block"}
data modify storage bgm-room themes append value {key:"factory",text:{"text":"팩토리","color":"yellow"},icon:"minecraft:waxed_chiseled_copper"}
data modify storage bgm-room themes append value {key:"pirate",text:{"text":"해적","color":"blue"},icon:"minecraft:lapis_block"}
data modify storage bgm-room themes append value {key:"moonhill",text:{"text":"문힐시티","color":"dark_blue"},icon:"minecraft:polished_blackstone"}
data modify storage bgm-room themes append value {key:"gold",text:{"text":"황금문명","color":"gold"},icon:"minecraft:raw_gold_block"}
data modify storage bgm-room themes append value {key:"china",text:{"text":"차이나","color":"red"},icon:"minecraft:red_shulker_box"}
data modify storage bgm-room themes append value {key:"mansion",text:{"text":"대저택","color":"red"},icon:"minecraft:stripped_acacia_wood"}

data modify storage bgm-room themes append value {key:"wkc",text:{"text":"WKC","color":"gold"},icon:"minecraft:reinforced_deepslate"}
data modify storage bgm-room themes append value {key:"beach",text:{"text":"비치","color":"blue"},icon:"minecraft:prismarine"}
data modify storage bgm-room themes append value {key:"world",text:{"text":"월드","color":"blue"},icon:"minecraft:light_blue_glazed_terracotta"}
data modify storage bgm-room themes append value {key:"nemo",text:{"text":"네모","color":"green"},icon:"minecraft:emerald_block"}
data modify storage bgm-room themes append value {key:"sword",text:{"text":"도검","color":"white"},icon:"minecraft:calcite"}
data modify storage bgm-room themes append value {key:"abyss",text:{"text":"어비스","color":"blue"},icon:"minecraft:blue_glazed_terracotta"}

data modify storage bgm-room themes append value {key:"korea",text:{"text":"코리아","color":"blue"},icon:"minecraft:white_shulker_box"}
data modify storage bgm-room themes append value {key:"maple",text:{"text":"메이플","color":"gold"},icon:"minecraft:red_mushroom_block"}
data modify storage bgm-room themes append value {key:"minecraft",text:{"text":"마인크래프트","color":"green"},icon:"minecraft:grass_block"}
data modify storage bgm-room themes append value {key:"kauzee",text:{"text":"카우지","color":"light_purple"},icon:"minecraft:structure_block"}

data modify storage bgm-room themes append value {key:"mariokart",text:{"text":"마리오카트","color":"red"},icon:"minecraft:player_head",mariokart:1}
data modify storage bgm-room themes append value {key:"thirdparty",text:{"text":"서드파티","color":"gold"},icon:"minecraft:command_block"}
data modify storage bgm-room themes append value {key:"etc",text:{"text":"기타","color":"yellow"},icon:"minecraft:white_wool"}

#포레스트
data modify storage bgm-room bgms.forest append value {bgm:"forest",text:[{"text":"포레스트\n","color":"green"},{"text":"아루와 나무꾼","color":"aqua"}],composer:{"text":"By Sodyum","color":"aqua"}}
data modify storage bgm-room bgms.forest append value {bgm:"forest2",text:[{"text":"포레스트\n","color":"green"},{"text":"숲 속 산책로","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#사막
data modify storage bgm-room bgms.desert append value {bgm:"desert",text:[{"text":"사막\n","color":"yellow"},{"text":"낙타 경주","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.desert append value {bgm:"desert2",text:[{"text":"사막\n","color":"yellow"},{"text":"춤추는 신기루","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#빌리지
data modify storage bgm-room bgms.village append value {bgm:"village",text:[{"text":"빌리지\n","color":"blue"},{"text":"배찌 뒹굴","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.village append value {bgm:"village2",text:[{"text":"빌리지\n","color":"blue"},{"text":"배찌 뒹굴뒹굴","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.village append value {bgm:"village3",text:[{"text":"빌리지\n","color":"blue"},{"text":"붐힐 삼총사","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}
data modify storage bgm-room bgms.village append value {bgm:"village4",text:[{"text":"빌리지\n","color":"blue"},{"text":"세컨드 드라이브","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#광산
data modify storage bgm-room bgms.mine append value {bgm:"mine",text:[{"text":"광산\n","color":"light_purple"},{"text":"다이아몬드 러쉬","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.mine append value {bgm:"mine2",text:[{"text":"광산\n","color":"light_purple"},{"text":"석탄 열차","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#차이나
data modify storage bgm-room bgms.china append value {bgm:"china",text:[{"text":"차이나\n","color":"red"},{"text":"대륙의 공휴일","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.china append value {bgm:"china2",text:[{"text":"차이나\n","color":"red"},{"text":"중국식 교차로","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#월드
data modify storage bgm-room bgms.world append value {bgm:"rio",text:[{"text":"월드\n","color":"blue"},{"text":"리오 다운힐","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.world append value {bgm:"world",text:[{"text":"월드\n","color":"blue"},{"text":"새로운 세계","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.world append value {bgm:"world2",text:[{"text":"월드\n","color":"blue"},{"text":"첫번째 세계여행","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#대저택
data modify storage bgm-room bgms.mansion append value {bgm:"mansion3",text:[{"text":"대저택\n","color":"red"},{"text":"루이 알마의\n화려한 레이스","color":"aqua"}],composer:{"text":"By tco3307402","color":"aqua"}}
data modify storage bgm-room bgms.mansion append value {bgm:"mansion2",text:[{"text":"대저택\n","color":"red"},{"text":"대저택 댄스 배틀","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.mansion append value {bgm:"mansion",text:[{"text":"대저택\n","color":"red"},{"text":"대저택 댄스 배틀\n[α]","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#노르테유
data modify storage bgm-room bgms.planet append value {bgm:"planet",text:[{"text":"노르테유\n","color":"light_purple"},{"text":"타키의 무대","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.planet append value {bgm:"planet2",text:[{"text":"노르테유\n","color":"light_purple"},{"text":"행성 점프","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#아이스
data modify storage bgm-room bgms.ice append value {bgm:"ice",text:[{"text":"아이스\n","color":"blue"},{"text":"눈 내리는 마을","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.ice append value {bgm:"ice2",text:[{"text":"아이스\n","color":"blue"},{"text":"목표를 향해!","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#네모
data modify storage bgm-room bgms.nemo append value {bgm:"nemo",text:[{"text":"네모\n","color":"green"},{"text":"마녀는 장난을 좋아해","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.nemo append value {bgm:"nemo2",text:[{"text":"네모\n","color":"green"},{"text":"겨울에는 캐롤","color":"aqua"}],composer:{"text":"By tco3307402","color":"aqua"}}
data modify storage bgm-room bgms.nemo append value {bgm:"nemo4",text:[{"text":"네모\n","color":"green"},{"text":"네모네모 페스티벌","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.nemo append value {bgm:"nemo3",text:[{"text":"네모\n","color":"green"},{"text":"네모네모 페스티벌\n[α]","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#해적
data modify storage bgm-room bgms.pirate append value {bgm:"pirate",text:[{"text":"해적\n","color":"blue"},{"text":"약탈의 춤사위","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.pirate append value {bgm:"pirate2",text:[{"text":"해적\n","color":"blue"},{"text":"거침없는 항해","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.pirate append value {bgm:"pirate3",text:[{"text":"해적\n","color":"blue"},{"text":"로두마니! 출항","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#문힐시티
data modify storage bgm-room bgms.moonhill append value {bgm:"moonhill",text:[{"text":"문힐시티\n","color":"dark_blue"},{"text":"악당들은 네오 조심","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}


#메이플
data modify storage bgm-room bgms.maple append value {bgm:"maplenew",text:[{"text":"메이플\n","color":"gold"},{"text":"꿈의 파편","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.maple append value {bgm:"maple",text:[{"text":"메이플\n","color":"gold"},{"text":"꿈의 파편[α]","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.maple append value {bgm:"maple2",text:[{"text":"메이플\n","color":"gold"},{"text":"Going on a Picnic","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#황금문명
data modify storage bgm-room bgms.gold append value {bgm:"gold",text:[{"text":"황금문명\n","color":"gold"},{"text":"금빛 문이 열리면","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#마인크래프트
data modify storage bgm-room bgms.minecraft append value {bgm:"otherside",text:[{"text":"마인크래프트\n","color":"green"},{"text":"An otherside","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.minecraft append value {bgm:"dream",text:[{"text":"마인크래프트\n","color":"green"},{"text":"드래곤의 분노","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.minecraft append value {bgm:"lavachicken",text:[{"text":"마인크래프트\n","color":"green"},{"text":"Lava Chicken","color":"aqua"}],composer:{"text":"By tco3307402","color":"aqua"}}


#비치
data modify storage bgm-room bgms.beach append value {bgm:"beach",text:[{"text":"비치\n","color":"blue"},{"text":"알로하, 레나!","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#WKC
data modify storage bgm-room bgms.wkc append value {bgm:"wkc",text:[{"text":"WKC\n","color":"gold"},{"text":"오버드라이브","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.wkc append value {bgm:"wkcdrift",text:[{"text":"WKC\n","color":"gold"},{"text":"오버드라이브\n(Drift ver)","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.wkc append value {bgm:"wkc2",text:[{"text":"WKC\n","color":"gold"},{"text":"월드 챔프","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}
data modify storage bgm-room bgms.wkc append value {bgm:"wind",text:[{"text":"WKC\n","color":"gold"},{"text":"바람을 가르며","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#팩토리
data modify storage bgm-room bgms.factory append value {bgm:"factory",text:[{"text":"팩토리\n","color":"yellow"},{"text":"관계자 외 출입금지","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.factory append value {bgm:"factory2",text:[{"text":"팩토리\n","color":"yellow"},{"text":"신규 설비","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}
data modify storage bgm-room bgms.factory append value {bgm:"factory3",text:[{"text":"팩토리\n","color":"yellow"},{"text":"즐거운 생산라인","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}
data modify storage bgm-room bgms.factory append value {bgm:"factory4",text:[{"text":"팩토리[브로디]\n","color":"yellow"},{"text":"혁신! 브로디","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#어비스
data modify storage bgm-room bgms.abyss append value {bgm:"abyss",text:[{"text":"어비스\n","color":"blue"},{"text":"너울대는 파도처럼","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.abyss append value {bgm:"abyss2",text:[{"text":"어비스\n","color":"blue"},{"text":"꿈꾸는 소녀","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#코리아
data modify storage bgm-room bgms.korea append value {bgm:"korea",text:[{"text":"코리아\n","color":"blue"},{"text":"여우 꼬리는 아홉 개?","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.korea append value {bgm:"korea2a",text:[{"text":"코리아\n","color":"blue"},{"text":"웰컴 투 코리아","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}
data modify storage bgm-room bgms.korea append value {bgm:"korea2",text:[{"text":"코리아\n","color":"blue"},{"text":"웰컴 투 코리아\nver.2","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#공동묘지
data modify storage bgm-room bgms.tomb append value {bgm:"tomb",text:[{"text":"공동묘지\n","color":"red"},{"text":"래빗홀의 습격","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.tomb append value {bgm:"tomb2",text:[{"text":"공동묘지\n","color":"red"},{"text":"내 뒤엔 유령 댄서","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}

#카우지
data modify storage bgm-room bgms.kauzee append value {bgm:"kauzee",text:[{"text":"카우지\n","color":"light_purple"},{"text":"낙원의 땅, 카우지","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}

#도검
data modify storage bgm-room bgms.sword append value {bgm:"sword",text:[{"text":"도검\n","color":"white"},{"text":"바람보다 자유롭게","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.sword append value {bgm:"fengshen",text:[{"text":"도검[봉신전설]\n","color":"white"},{"text":"빛이 인도하는 전설","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}


#마리오카트
data modify storage bgm-room bgms.mariokart append value {bgm:"mkddrainbow",text:[{"text":"마리오카트\n","color":"red"},{"text":"무지개 로드 GC","color":"aqua"}],composer:{"text":"By KITE2459","color":"aqua"}}
data modify storage bgm-room bgms.mariokart append value {bgm:"mk8rainbow64",text:[{"text":"마리오카트\n","color":"red"},{"text":"무지개 로드 64","color":"aqua"}],composer:{"text":"By KITE2459","color":"aqua"}}
data modify storage bgm-room bgms.mariokart append value {bgm:"mkdswaluigi",text:[{"text":"마리오카트\n","color":"red"},{"text":"와루이지 핀볼","color":"aqua"}],composer:{"text":"By KITE2459","color":"aqua"}}
data modify storage bgm-room bgms.mariokart append value {bgm:"mkdsdelfino",text:[{"text":"마리오카트\n","color":"red"},{"text":"몬테 타운","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.mariokart append value {bgm:"mkscsnowland",text:[{"text":"마리오카트\n","color":"red"},{"text":"스노우랜드","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}


#서드파티
data modify storage bgm-room bgms.thirdparty append value {bgm:"run90",text:[{"text":"서드파티\n","color":"gold"},{"text":"Running in the 90\'s","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.thirdparty append value {bgm:"cityescape",text:[{"text":"서드파티\n","color":"gold"},{"text":"Escape From\nthe City","color":"aqua"}],composer:{"text":"By tco3307402","color":"aqua"}}
data modify storage bgm-room bgms.thirdparty append value {bgm:"banjo",text:[{"text":"서드파티\n","color":"gold"},{"text":"Pause Screen","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.thirdparty append value {bgm:"sans",text:[{"text":"서드파티\n","color":"gold"},{"text":"Megalovania","color":"aqua"}],composer:{"text":"By N_Devil","color":"aqua"}}




#그 외
data modify storage bgm-room bgms.etc append value {bgm:"introbgm",text:[{"text":"오프닝\n","color":"yellow"},{"text":"K/A/R/T/R/I/D/E/R","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.etc append value {bgm:"end",text:[{"text":"엔딩\n","color":"yellow"},{"text":"낙타 경주","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.etc append value {bgm:"creditmusic",text:[{"text":"엔딩 크레딧\n","color":"yellow"},{"text":"깃발이 어딨지?","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.etc append value {bgm:"license",text:[{"text":"라이센스\n","color":"yellow"},{"text":"라이센스","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.etc append value {bgm:"kartstore",text:[{"text":"차고\n","color":"yellow"},{"text":"상점","color":"aqua"}],composer:{"text":"By KITE2459","color":"aqua"}}
data modify storage bgm-room bgms.etc append value {bgm:"driftgarage",text:[{"text":"스페셜 차고\n","color":"yellow"},{"text":"차량 정비","color":"aqua"}],composer:{"text":"By LogGamja","color":"aqua"}}
data modify storage bgm-room bgms.etc append value {bgm:"multiplayroom",text:[{"text":"메뉴\n","color":"yellow"},{"text":"멀티플레이어","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}
data modify storage bgm-room bgms.etc append value {bgm:"singleplayroom",text:[{"text":"메뉴\n","color":"yellow"},{"text":"싱글플레이어","color":"aqua"}],composer:{"text":"By WyvernP","color":"aqua"},composer2:{"text":"Producer KITE2459","color":"green"}}


#변수 설정
scoreboard objectives add track-ui dummy
