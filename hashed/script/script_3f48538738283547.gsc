#using scripts\core_common\lui_shared.csc;

#namespace zm_towers_crowd_meter;

// Namespace zm_towers_crowd_meter
// Method(s) 8 Total 14
class czm_towers_crowd_meter : cluielem {

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 2, eflags: 0x0
    // Checksum 0xd6858549, Offset: 0x690
    // Size: 0x30
    function set_visible(localclientnum, value) {
        set_data(localclientnum, "visible", value);
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 2, eflags: 0x0
    // Checksum 0xe7951bd4, Offset: 0x3a8
    // Size: 0x2dc
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"crowd_server_paused" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"crowd_loathes" == state_name) {
            set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"crowd_hates" == state_name) {
            set_data(localclientnum, "_state", 3);
            return;
        }
        if (#"crowd_no_love" == state_name) {
            set_data(localclientnum, "_state", 4);
            return;
        }
        if (#"crowd_warm_up" == state_name) {
            set_data(localclientnum, "_state", 5);
            return;
        }
        if (#"crowd_likes" == state_name) {
            set_data(localclientnum, "_state", 6);
            return;
        }
        if (#"crowd_loves" == state_name) {
            set_data(localclientnum, "_state", 7);
            return;
        }
        if (#"crowd_power_up_available_good" == state_name) {
            set_data(localclientnum, "_state", 8);
            return;
        }
        if (#"crowd_power_up_available_bad" == state_name) {
            set_data(localclientnum, "_state", 9);
            return;
        }
        if (#"crowd_power_up_available_good_partial" == state_name) {
            set_data(localclientnum, "_state", 10);
            return;
        }
        if (#"crowd_power_up_available_bad_partial" == state_name) {
            set_data(localclientnum, "_state", 11);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 1, eflags: 0x0
    // Checksum 0x1cc81db2, Offset: 0x370
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_towers_crowd_meter");
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 1, eflags: 0x0
    // Checksum 0x2a4cbc0b, Offset: 0x308
    // Size: 0x60
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
        set_data(localclientnum, "visible", 0);
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 1, eflags: 0x0
    // Checksum 0xcd390f97, Offset: 0x2d8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_towers_crowd_meter/zm_towers_crowd_meter
    // Params 2, eflags: 0x0
    // Checksum 0xce367597, Offset: 0x250
    // Size: 0x7c
    function setup_clientfields(uid, var_6ad1a3bb) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::add_clientfield("visible", 1, 1, "int", var_6ad1a3bb);
    }

}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 2, eflags: 0x0
// Checksum 0xf81ab299, Offset: 0xb8
// Size: 0x4c
function register(uid, var_6ad1a3bb) {
    elem = new czm_towers_crowd_meter();
    [[ elem ]]->setup_clientfields(uid, var_6ad1a3bb);
    return elem;
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0xecdac24, Offset: 0x110
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_towers_crowd_meter();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0xfd22eae5, Offset: 0x158
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0x57f33c7f, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 1, eflags: 0x0
// Checksum 0x403fe8a, Offset: 0x1a8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 2, eflags: 0x0
// Checksum 0x5d4d4467, Offset: 0x1d0
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace zm_towers_crowd_meter/zm_towers_crowd_meter
// Params 2, eflags: 0x0
// Checksum 0xef530cc4, Offset: 0x200
// Size: 0x28
function set_visible(localclientnum, value) {
    [[ self ]]->set_visible(localclientnum, value);
}

