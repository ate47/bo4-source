// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_zodt8_zstandard.gsc;
#include scripts/core_common/util_shared.gsc;

#namespace zm_zodt8_gamemodes;

// Namespace zm_zodt8_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0x5e8e8b9c, Offset: 0x78
// Size: 0xe2
function event<level_finalizeinit> main(eventstruct) {
    if (!isdefined(level.flag) || !(isdefined(level.flag[#"load_main_complete"]) && level.flag[#"load_main_complete"])) {
        level waittill(#"load_main_complete");
    }
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"zstandard":
        zm_zodt8_zstandard::main();
        break;
    }
}

