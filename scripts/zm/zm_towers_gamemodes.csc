// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_towers_zstandard.csc;
#include scripts/core_common/util_shared.csc;

#namespace zm_towers_gamemodes;

// Namespace zm_towers_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0x6668f62, Offset: 0x78
// Size: 0xe2
function event_handler[level_finalizeinit] main(eventstruct) {
    if (!isdefined(level.flag) || !(isdefined(level.flag[#"load_main_complete"]) && level.flag[#"load_main_complete"])) {
        level waittill(#"load_main_complete");
    }
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"zstandard":
        zm_towers_zstandard::main();
        break;
    }
}

