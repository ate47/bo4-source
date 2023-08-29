// Atian COD Tools GSC decompiler test
#include scripts/mp_common/load.gsc;
#include scripts/core_common/compass.gsc;

#namespace mp_cosmodrome;

// Namespace mp_cosmodrome/level_init
// Params 1, eflags: 0x40
// Checksum 0x63dfa4e5, Offset: 0x80
// Size: 0x34
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
}

