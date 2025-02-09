#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_shared_ingame_hint;

// Namespace ct_shared_ingame_hint
// Method(s) 7 Total 14
class cct_shared_ingame_hint : cluielem {

    var var_47e79fc;

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 2, eflags: 0x0
    // Checksum 0x311f4293, Offset: 0x600
    // Size: 0x3c
    function set_ingamehint(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "inGameHint", value);
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 2, eflags: 0x0
    // Checksum 0x7aac8cd4, Offset: 0x338
    // Size: 0x2bc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"fadeout" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        if (#"green" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 2);
            return;
        }
        if (#"grey" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 3);
            return;
        }
        if (#"red" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 4);
            return;
        }
        if (#"green_fadeout" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 5);
            return;
        }
        if (#"grey_fadeout" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 6);
            return;
        }
        if (#"red_fadeout" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 7);
            return;
        }
        if (#"red_paused" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 8);
            return;
        }
        if (#"hash_3d131b584420ca82" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 9);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 1, eflags: 0x0
    // Checksum 0xe1d24083, Offset: 0x308
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 2, eflags: 0x0
    // Checksum 0x89da9830, Offset: 0x2b8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_shared_ingame_hint", persistent);
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 1, eflags: 0x0
    // Checksum 0x35d44ee, Offset: 0x238
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::function_dcb34c80("string", "inGameHint", 1);
    }

}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0xdf62e3a4, Offset: 0xe0
// Size: 0x40
function register(uid) {
    elem = new cct_shared_ingame_hint();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 2, eflags: 0x0
// Checksum 0x1aa1d2c7, Offset: 0x128
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0x37b76330, Offset: 0x168
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0x2f90f3a3, Offset: 0x190
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 2, eflags: 0x0
// Checksum 0x81bb4fca, Offset: 0x1b8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 2, eflags: 0x0
// Checksum 0x4ada5926, Offset: 0x1e8
// Size: 0x28
function set_ingamehint(player, value) {
    [[ self ]]->set_ingamehint(player, value);
}

