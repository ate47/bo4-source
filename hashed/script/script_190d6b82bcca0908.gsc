#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_game_over;

// Namespace zm_game_over
// Method(s) 7 Total 14
class czm_game_over : cluielem {

    var var_47e79fc;

    // Namespace czm_game_over/zm_game_over
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6b7ab323, Offset: 0x3f0
    // Size: 0x3c
    function set_rounds(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "rounds", value);
    }

    // Namespace czm_game_over/zm_game_over
    // Params 2, eflags: 0x1 linked
    // Checksum 0xdc920510, Offset: 0x328
    // Size: 0xbc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"gatewayopened" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace czm_game_over/zm_game_over
    // Params 1, eflags: 0x1 linked
    // Checksum 0xef2701e9, Offset: 0x2f8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_game_over/zm_game_over
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2c474e6d, Offset: 0x2a8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_game_over", persistent);
    }

    // Namespace czm_game_over/zm_game_over
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4c70e9af, Offset: 0x228
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::add_clientfield("rounds", 1, 8, "int");
    }

}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x1 linked
// Checksum 0x8240444f, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new czm_game_over();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_game_over/zm_game_over
// Params 2, eflags: 0x1 linked
// Checksum 0x5149b9b, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x1 linked
// Checksum 0xdf8e2a55, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_game_over/zm_game_over
// Params 1, eflags: 0x1 linked
// Checksum 0xa507035b, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_game_over/zm_game_over
// Params 2, eflags: 0x0
// Checksum 0xe3db5c1, Offset: 0x1a8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace zm_game_over/zm_game_over
// Params 2, eflags: 0x1 linked
// Checksum 0xf8a9f347, Offset: 0x1d8
// Size: 0x28
function set_rounds(player, value) {
    [[ self ]]->set_rounds(player, value);
}

