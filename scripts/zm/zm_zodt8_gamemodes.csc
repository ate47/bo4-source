// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_zodt8_zstandard.csc;
#using scripts\core_common\util_shared.csc;

#namespace zm_zodt8_gamemodes;

// Namespace zm_zodt8_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0x28d9ecb6, Offset: 0x78
// Size: 0xe2
function event_handler[level_finalizeinit] main(eventstruct) {
    if (!isdefined(level.flag) || !(isdefined(level.flag[#"load_main_complete"]) && level.flag[#"load_main_complete"])) {
        level waittill(#"load_main_complete");
    }
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"zstandard":
        zm_zodt8_zstandard::main();
        return;
    }
}

