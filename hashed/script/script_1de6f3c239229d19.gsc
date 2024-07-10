#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_game_timer;

// Namespace zm_game_timer
// Method(s) 8 Total 15
class czm_game_timer : cluielem {

    var var_47e79fc;

    // Namespace czm_game_timer/zm_game_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xe0068f7c, Offset: 0x418
    // Size: 0x3c
    function set_showzero(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "showzero", value);
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf7ce0420, Offset: 0x3d0
    // Size: 0x3c
    function set_minutes(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "minutes", value);
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xdd0cc3a0, Offset: 0x388
    // Size: 0x3c
    function set_seconds(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "seconds", value);
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa0f6997f, Offset: 0x358
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa0872563, Offset: 0x308
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_game_timer", persistent);
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 1, eflags: 0x1 linked
    // Checksum 0x9a2525f1, Offset: 0x260
    // Size: 0x9c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("seconds", 1, 6, "int");
        cluielem::add_clientfield("minutes", 1, 9, "int");
        cluielem::add_clientfield("showzero", 1, 1, "int");
    }

}

// Namespace zm_game_timer/zm_game_timer
// Params 1, eflags: 0x0
// Checksum 0xc1ae6460, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new czm_game_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_game_timer/zm_game_timer
// Params 2, eflags: 0x0
// Checksum 0x1d9c3837, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_game_timer/zm_game_timer
// Params 1, eflags: 0x0
// Checksum 0x4df7d4ea, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_game_timer/zm_game_timer
// Params 1, eflags: 0x0
// Checksum 0xffa7bcdb, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_game_timer/zm_game_timer
// Params 2, eflags: 0x0
// Checksum 0x680352e8, Offset: 0x1b0
// Size: 0x28
function set_seconds(player, value) {
    [[ self ]]->set_seconds(player, value);
}

// Namespace zm_game_timer/zm_game_timer
// Params 2, eflags: 0x0
// Checksum 0x56d6fb4a, Offset: 0x1e0
// Size: 0x28
function set_minutes(player, value) {
    [[ self ]]->set_minutes(player, value);
}

// Namespace zm_game_timer/zm_game_timer
// Params 2, eflags: 0x0
// Checksum 0x3835487b, Offset: 0x210
// Size: 0x28
function set_showzero(player, value) {
    [[ self ]]->set_showzero(player, value);
}

