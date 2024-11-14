#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_board_games;

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x2
// Checksum 0x1fa1e4ee, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_board_games", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_board_games/zm_bgb_board_games
// Params 0, eflags: 0x1 linked
// Checksum 0x5a72b93e, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_board_games", "time");
}

