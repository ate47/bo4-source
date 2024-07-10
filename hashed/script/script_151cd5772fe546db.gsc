#using scripts\core_common\lui_shared.csc;

#namespace zm_arcade_timer;

// Namespace zm_arcade_timer
// Method(s) 10 Total 16
class czm_arcade_timer : cluielem {

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x0
    // Checksum 0xa6e6a9e0, Offset: 0x598
    // Size: 0x30
    function set_title(localclientnum, value) {
        set_data(localclientnum, "title", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x0
    // Checksum 0x8ee5e467, Offset: 0x560
    // Size: 0x30
    function set_minutes(localclientnum, value) {
        set_data(localclientnum, "minutes", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x0
    // Checksum 0x5ac68377, Offset: 0x528
    // Size: 0x30
    function set_seconds(localclientnum, value) {
        set_data(localclientnum, "seconds", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 2, eflags: 0x0
    // Checksum 0x2d8946b8, Offset: 0x4f0
    // Size: 0x30
    function set_showzero(localclientnum, value) {
        set_data(localclientnum, "showzero", value);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 1, eflags: 0x0
    // Checksum 0x42d913ad, Offset: 0x4b8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_arcade_timer");
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 1, eflags: 0x0
    // Checksum 0x6ab17a46, Offset: 0x408
    // Size: 0xa4
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "showzero", 0);
        set_data(localclientnum, "seconds", 0);
        set_data(localclientnum, "minutes", 0);
        set_data(localclientnum, "title", #"");
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 1, eflags: 0x0
    // Checksum 0x27725eb9, Offset: 0x3d8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_arcade_timer/zm_arcade_timer
    // Params 5, eflags: 0x0
    // Checksum 0x5fb7986, Offset: 0x2e8
    // Size: 0xe4
    function setup_clientfields(uid, var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("showzero", 1, 1, "int", var_8fd8bfaa);
        cluielem::add_clientfield("seconds", 1, 6, "int", var_b1de907e);
        cluielem::add_clientfield("minutes", 1, 4, "int", var_359a4d9a);
        cluielem::function_dcb34c80("string", "title", 1);
    }

}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 5, eflags: 0x0
// Checksum 0x2a58250a, Offset: 0xd0
// Size: 0x70
function register(uid, var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059) {
    elem = new czm_arcade_timer();
    [[ elem ]]->setup_clientfields(uid, var_8fd8bfaa, var_b1de907e, var_359a4d9a, var_395b3059);
    return elem;
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x0
// Checksum 0xa759b441, Offset: 0x148
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_arcade_timer();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x0
// Checksum 0x6247fff2, Offset: 0x190
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x0
// Checksum 0xc41c8c3f, Offset: 0x1b8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 1, eflags: 0x0
// Checksum 0xedfb820, Offset: 0x1e0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x0
// Checksum 0x40403259, Offset: 0x208
// Size: 0x28
function set_showzero(localclientnum, value) {
    [[ self ]]->set_showzero(localclientnum, value);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x0
// Checksum 0xc416f0f4, Offset: 0x238
// Size: 0x28
function set_seconds(localclientnum, value) {
    [[ self ]]->set_seconds(localclientnum, value);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x0
// Checksum 0xfd822439, Offset: 0x268
// Size: 0x28
function set_minutes(localclientnum, value) {
    [[ self ]]->set_minutes(localclientnum, value);
}

// Namespace zm_arcade_timer/zm_arcade_timer
// Params 2, eflags: 0x0
// Checksum 0xd3600d3c, Offset: 0x298
// Size: 0x28
function set_title(localclientnum, value) {
    [[ self ]]->set_title(localclientnum, value);
}

