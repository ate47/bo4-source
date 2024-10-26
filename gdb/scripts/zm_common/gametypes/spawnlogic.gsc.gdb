NAME scripts\zm_common\gametypes\spawnlogic.gsc
VERSION 0
CHECKSUM 0x6557dbce
######################################################
####################  DEV STRINGS  ###################
######################################################
# spawnlogic::storespawndata@65c
STRING "<dev string:x104>" 0x1c6c
# spawnlogic::storespawndata@714
STRING "<dev string:x10b>" 0x1d24
# spawnlogic::readspawndata@b4
STRING "<dev string:x113>" 0x1efc
# spawnlogic::readspawndata@8b8
STRING "<dev string:x11a>" 0x2700
# spawnlogic::readspawndata@8fc
STRING "<dev string:x12b>" 0x2744
# spawnlogic::readspawndata@940
STRING "<dev string:x132>" 0x2788
# spawnlogic::readspawndata@998
STRING "<dev string:x143>" 0x27e0
# spawnlogic::drawspawndata@d8
STRING "<dev string:x14a>" 0x2990
# spawnlogic::drawspawndata@150
STRING "<dev string:x14f>" 0x2a08
# spawnlogic::drawspawndata@2ac
STRING "<dev string:x154>" 0x2b64
# spawnlogic::drawspawndata@33c
STRING "<dev string:x164>" 0x2bf4
# spawnlogic::drawspawndata@408
STRING "<dev string:x16f>" 0x2cc0
# spawnlogic::vectostr@2c spawnlogic::vectostr@54 spawnlogic::strtovec@1c
STRING "<dev string:x180>" 0x2d54 0x2d7c 0x2dcc
# spawnlogic::getspawnpoint_nearteam@288
STRING "<dev string:x184>" 0x3758
# spawnlogic::getspawnpoint_nearteam@2ac
STRING "<dev string:x194>" 0x377c
# spawnlogic::getspawnpoint_nearteam@2bc spawnlogic::getspawnpoint_nearteam@2ec
STRING "<dev string:x19b>" 0x378c 0x37bc
# spawnlogic::getspawnpoint_nearteam@2dc
STRING "<dev string:x19f>" 0x37ac
# spawnlogic::getspawnpoint_nearteam@30c
STRING "<dev string:x1a5>" 0x37dc
# spawnlogic::getspawnpoint_nearteam@368
STRING "<dev string:x1ac>" 0x3838
# spawnlogic::spawngraph@b4
STRING "<dev string:x1bd>" 0x42d4
# spawnlogic::spawngraph@ac
STRING "<dev string:x1ce>" 0x42cc
# spawnlogic::spawngraph@e0
STRING "<dev string:x1db>" 0x4300
# spawnlogic::spawngraph@3fc spawnlogic::spawngraph@518
STRING "<dev string:x206>" 0x461c 0x4738
# spawnlogic::loopbotspawns@f4
STRING "<dev string:x212>" 0x4b7c
# spawnlogic::loopbotspawns@1dc spawnlogic::loopbotspawns@2e0
STRING "<dev string:x218>" 0x4c64 0x4d68
# spawnlogic::loopbotspawns@1c4 spawnlogic::loopbotspawns@2c8
STRING "<dev string:x22b>" 0x4c4c 0x4d50
# spawnlogic::allowspawndatareading@1a0
STRING "<dev string:x232>" 0x4fb0
# spawnlogic::allowspawndatareading@1bc
STRING "<dev string:x24b>" 0x4fcc
# spawnlogic::showdeathsdebug@334
STRING "<dev string:x25f>" 0x5344
# spawnlogic::showdeathsdebug@3f4
STRING "<dev string:x26e>" 0x5404
# spawnlogic::spawnweightdebug@27c
STRING "<dev string:x27b>" 0x576c
# spawnlogic::avoidweapondamage@178
STRING "<dev string:x28f>" 0x5e38
# spawnlogic::avoidvisibleenemies@4b0
STRING "<dev string:x2a5>" 0x6f08
# spawnlogic::avoidvisibleenemies@4dc
STRING "<dev string:x2b9>" 0x6f34
# spawnlogic::avoidspawnreuse@208
STRING "<dev string:x2c5>" 0x7198
# spawnlogic::avoidsamespawn@b8
STRING "<dev string:x2dc>" 0x72a8
# spawnlogic::main@34 spawnlogic::main@ac spawnlogic::main@fc spawnlogic::storespawndata@448 spawnlogic::loopbotspawns@33c spawnlogic::allowspawndatareading@34 spawnlogic::allowspawndatareading@11c spawnlogic::allowspawndatareading@12c
STRING "<dev string:x38>" 0x184 0x1fc 0x24c 0x1a58 0x4dc4 0x4e44 0x4f2c 0x4f3c
# spawnlogic::addspawnpointsinternal@1fc
STRING "<dev string:x3b>" 0x854
# spawnlogic::addspawnpointsinternal@208 spawnlogic::placespawnpoints@8c spawnlogic::dropspawnpoints@54
STRING "<dev string:x4a>" 0x860 0xabc 0xbc4
# spawnlogic::placespawnpoints@80 spawnlogic::dropspawnpoints@48
STRING "<dev string:x69>" 0xab0 0xbb8
# spawnlogic::getbestweightedspawnpoint@224
STRING "<dev string:x71>" 0x1364
# spawnlogic::checkbad@7c spawnlogic::loopbotspawns@e4
STRING "<dev string:x8e>" 0x1444 0x4b6c
# spawnlogic::badspawnline@88
STRING "<dev string:x98>" 0x15b0
# spawnlogic::badspawnline@94
STRING "<dev string:xa6>" 0x15bc
# spawnlogic::storespawndata@118
STRING "<dev string:xb2>" 0x1728
# spawnlogic::storespawndata@140 spawnlogic::readspawndata@bc
STRING "<dev string:xcb>" 0x1750 0x1f04
# spawnlogic::storespawndata@138
STRING "<dev string:xdb>" 0x1748
# spawnlogic::storespawndata@164 spawnlogic::storespawndata@7f8
STRING "<dev string:xe4>" 0x1774 0x1e08
# spawnlogic::storespawndata@178 spawnlogic::storespawndata@188 spawnlogic::storespawndata@1e4 spawnlogic::storespawndata@25c spawnlogic::storespawndata@2d8 spawnlogic::storespawndata@324 spawnlogic::storespawndata@354 spawnlogic::storespawndata@3a8 spawnlogic::storespawndata@3d4 spawnlogic::storespawndata@4bc spawnlogic::storespawndata@524 spawnlogic::storespawndata@540 spawnlogic::storespawndata@550 spawnlogic::storespawndata@740 spawnlogic::storespawndata@784 spawnlogic::storespawndata@7a0
STRING "<dev string:xe8>" 0x1788 0x1798 0x17f4 0x186c 0x18e8 0x1934 0x1964 0x19b8 0x19e4 0x1acc 0x1b34 0x1b50 0x1b60 0x1d50 0x1d94 0x1db0
# spawnlogic::storespawndata@208
STRING "<dev string:xec>" 0x1818
# spawnlogic::storespawndata@21c spawnlogic::storespawndata@234
STRING "<dev string:xf1>" 0x182c 0x1844
# spawnlogic::storespawndata@5ec
STRING "<dev string:xf6>" 0x1bfc
######################################################
####################  DEV BLOCKS  ####################
######################################################
# spawnlogic::main@a
DEVBLOCK 0x15a
# spawnlogic::main@1fc
DEVBLOCK 0x34c
# spawnlogic::addspawnpointsinternal@1f4
DEVBLOCK 0x84c
# spawnlogic::placespawnpoints@4c
DEVBLOCK 0xa7c
# spawnlogic::placespawnpoints@76
DEVBLOCK 0xaa6
# spawnlogic::placespawnpoints@ea
DEVBLOCK 0xb1a
# spawnlogic::dropspawnpoints@3e
DEVBLOCK 0xbae
# spawnlogic::getspawnpoint_final@1e2
DEVBLOCK 0x10ba
# spawnlogic::getbestweightedspawnpoint@204
DEVBLOCK 0x1344
# spawnlogic::checkbad@22
DEVBLOCK 0x13ea
# spawnlogic::badspawnline@32
DEVBLOCK 0x155a
# spawnlogic::storespawndata@6a
DEVBLOCK 0x167a
# spawnlogic::readspawndata@aa
DEVBLOCK 0x1ef2
# spawnlogic::drawspawndata@32
DEVBLOCK 0x28ea
# spawnlogic::vectostr@a
DEVBLOCK 0x2d32
# spawnlogic::strtovec@12
DEVBLOCK 0x2dc2
# spawnlogic::getallalliedandenemyplayers@28
DEVBLOCK 0x3028
# spawnlogic::initweights@46
DEVBLOCK 0x31e6
# spawnlogic::getspawnpoint_nearteam@86
DEVBLOCK 0x3556
# spawnlogic::getspawnpoint_nearteam@268
DEVBLOCK 0x3738
# spawnlogic::getspawnpoint_nearteam@348
DEVBLOCK 0x3818
# spawnlogic::getspawnpoint_nearteam@48c
DEVBLOCK 0x395c
# spawnlogic::spawnlogic_begin@2
DEVBLOCK 0x3f52
# spawnlogic::watchspawnprofile@2
DEVBLOCK 0x3fca
# spawnlogic::spawnprofile@1a
DEVBLOCK 0x40aa
# spawnlogic::spawngraphcheck@2
DEVBLOCK 0x41ba
# spawnlogic::spawngraph@82
DEVBLOCK 0x42a2
# spawnlogic::drawspawngraph@4a
DEVBLOCK 0x4862
# spawnlogic::setupspawngraphpoint@12
DEVBLOCK 0x4962
# spawnlogic::spawngraphline@2a
DEVBLOCK 0x49d2
# spawnlogic::loopbotspawns@3a
DEVBLOCK 0x4ac2
# spawnlogic::allowspawndatareading@2a
DEVBLOCK 0x4e3a
# spawnlogic::showdeathsdebug@32
DEVBLOCK 0x5042
# spawnlogic::spawnweightdebug@58
DEVBLOCK 0x5548
# spawnlogic::debugnearbyplayers@22
DEVBLOCK 0x58f2
# spawnlogic::avoidweapondamage@158
DEVBLOCK 0x5e18
# spawnlogic::spawnpointupdate@166
DEVBLOCK 0x620e
# spawnlogic::spawnpointupdate@492
DEVBLOCK 0x653a
# spawnlogic::avoidvisibleenemies@140
DEVBLOCK 0x6b98
# spawnlogic::avoidvisibleenemies@24c
DEVBLOCK 0x6ca4
# spawnlogic::avoidvisibleenemies@490
DEVBLOCK 0x6ee8
# spawnlogic::avoidspawnreuse@1e8
DEVBLOCK 0x7178
# spawnlogic::avoidsamespawn@98
DEVBLOCK 0x7288
# spawnlogic::getrandomintermissionpoint@64
DEVBLOCK 0x7354
