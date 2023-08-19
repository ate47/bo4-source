// Atian COD Tools GSC decompiler test
#include scripts/mp/mp_militia_scripted.gsc;
#include scripts/mp/mp_militia_sound.gsc;
#include scripts/mp/mp_militia_fx.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/load.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/compass.gsc;

#namespace mp_militia;

// Namespace mp_militia/level_init
// Params 1, eflags: 0x40
// Checksum 0x92078107, Offset: 0xb0
// Size: 0xbc
function event<level_init> main(eventstruct) {
    mp_militia_fx::main();
    mp_militia_sound::main();
    load::main();
    level.cleandepositpoints = array(vectorscale((0, 0, -1), 122), (2344, -64, 9.5), (-1464, -2040, 157), (-940, 488, 4), (186.5, -1688, 65));
    compass::setupminimap("");
}

