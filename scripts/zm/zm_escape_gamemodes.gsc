#using scripts\core_common\util_shared;
#using scripts\zm\zm_escape_zstandard;

#namespace zm_escape_gamemodes;

// Namespace zm_escape_gamemodes/level_finalizeinit
// Params 1, eflags: 0x40
// Checksum 0x34fbc09d, Offset: 0x78
// Size: 0xe2
function event_handler[level_finalizeinit] main(eventstruct) {
    if (!isdefined(level.flag) || !(isdefined(level.flag[#"load_main_complete"]) && level.flag[#"load_main_complete"])) {
        level waittill(#"load_main_complete");
    }
    gametype = hash(util::get_game_type());
    switch (gametype) {
    case #"zstandard":
        zm_escape_zstandard::main();
        break;
    }
}

