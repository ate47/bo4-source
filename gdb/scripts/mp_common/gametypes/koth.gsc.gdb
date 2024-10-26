NAME scripts\mp_common\gametypes\koth.gsc
VERSION 0
CHECKSUM 0x6162511a
######################################################
####################  DEV STRINGS  ###################
######################################################
# koth::spawn_first_zone@8c koth::spawn_next_zone@b4
STRING "<dev string:x38>" 0x100c 0x11cc
# koth::spawn_first_zone@ac koth::spawn_first_zone@d0 koth::spawn_next_zone@d4 koth::spawn_next_zone@f8
STRING "<dev string:x4a>" 0x102c 0x1050 0x11ec 0x1210
# koth::spawn_first_zone@f4 koth::spawn_next_zone@11c
STRING "<dev string:x4e>" 0x1074 0x1234
# koth::onzonecapture@ac
STRING "<dev string:x52>" 0x266c
# koth::give_capture_credit@3c0
STRING "<dev string:x62>" 0x2df8
# koth::comparezoneindexes@78 koth::comparezoneindexes@bc
STRING "<dev string:xa9>" 0x3838 0x387c
######################################################
####################  DEV BLOCKS  ####################
######################################################
# koth::spawn_first_zone@84
DEVBLOCK 0x1004
# koth::spawn_next_zone@aa
DEVBLOCK 0x11c2
# koth::onzonecapture@a2
DEVBLOCK 0x2662
# koth::give_capture_credit@3b6
DEVBLOCK 0x2dee
# koth::onzoneuncontested@a
DEVBLOCK 0x314a
# koth::comparezoneindexes@6e
DEVBLOCK 0x382e
# koth::comparezoneindexes@b4
DEVBLOCK 0x3874
# koth::setupzones@206
DEVBLOCK 0x3bf6
# koth::getnextzonefromqueue@32
DEVBLOCK 0x4312
