#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_towers_crowd_meter;

// Namespace zm_towers_crowd_meter
// Method(s) 7 Total 14
class czm_towers_crowd_meter : cluielem {

    var var_47e79fc;

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 2, eflags: 0x0
    // Checksum 0x1d96674c, Offset: 0x678
    // Size: 0x3c
    function set_visible(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "visible", value);
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 2, eflags: 0x0
    // Checksum 0x66e966a6, Offset: 0x330
    // Size: 0x33c
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"crowd_server_paused" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        if (#"crowd_loathes" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 2);
            return;
        }
        if (#"crowd_hates" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 3);
            return;
        }
        if (#"crowd_no_love" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 4);
            return;
        }
        if (#"crowd_warm_up" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 5);
            return;
        }
        if (#"crowd_likes" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 6);
            return;
        }
        if (#"crowd_loves" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 7);
            return;
        }
        if (#"crowd_power_up_available_good" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 8);
            return;
        }
        if (#"crowd_power_up_available_bad" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 9);
            return;
        }
        if (#"crowd_power_up_available_good_partial" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 10);
            return;
        }
        if (#"crowd_power_up_available_bad_partial" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 11);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 1, eflags: 0x0
    // Checksum 0x698353a9, Offset: 0x300
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 2, eflags: 0x0
    // Checksum 0xbbf27285, Offset: 0x2b0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_towers_crowd_meter", persistent);
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 1, eflags: 0x0
    // Checksum 0x3687a054, Offset: 0x230
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::add_clientfield("visible", 1, 1, "int");
    }

}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0x65caa948, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new czm_towers_crowd_meter();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 2, eflags: 0x0
// Checksum 0x5a237a88, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0xdbc21d, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0x1d0b5b0f, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 2, eflags: 0x0
// Checksum 0xf232ab06, Offset: 0x1b0
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 2, eflags: 0x0
// Checksum 0x2e2d0612, Offset: 0x1e0
// Size: 0x28
function set_visible(player, value) {
    [[ self ]]->set_visible(player, value);
}

