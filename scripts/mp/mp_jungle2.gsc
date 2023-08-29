// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_jungle2_scripted.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/core_common/compass.gsc;

#namespace mp_jungle2;

// Namespace mp_jungle2/level_init
// Params 1, eflags: 0x40
// Checksum 0xc88aa55a, Offset: 0x88
// Size: 0xb6
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((1820.25, 87.5, 88.25), (2648.75, -1356, 270), (-86.75, -514.5, 264), (438.75, -1640.75, 124), (458.25, 1278.5, 239));
}

