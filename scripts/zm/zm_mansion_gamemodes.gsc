// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_mansion_zstandard.gsc;
#include scripts/core_common/util_shared.gsc;

#namespace zm_mansion_gamemodes;

// Namespace zm_mansion_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0xa4ea617e, Offset: 0x78
// Size: 0xe2
function event<level_finalizeinit> main(eventstruct) {
    if (!isdefined(level.flag) || !(isdefined(level.flag[#"load_main_complete"]) && level.flag[#"load_main_complete"])) {
        level waittill(#"load_main_complete");
    }
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"zstandard":
        zm_mansion_zstandard::main();
        break;
    }
}
