#using scripts\core_common\lui_shared.csc;

#namespace zm_laststand_client;

// Namespace zm_laststand_client
// Method(s) 9 Total 15
class czm_laststand_client : cluielem {

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb979d720, Offset: 0x4e8
    // Size: 0x30
    function set_num_downs(localclientnum, value) {
        set_data(localclientnum, "num_downs", value);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x1 linked
    // Checksum 0x96d0312c, Offset: 0x4b0
    // Size: 0x30
    function set_revive_progress(localclientnum, value) {
        set_data(localclientnum, "revive_progress", value);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc5742d28, Offset: 0x478
    // Size: 0x30
    function set_bleedout_progress(localclientnum, value) {
        set_data(localclientnum, "bleedout_progress", value);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 1, eflags: 0x1 linked
    // Checksum 0xba92eeb0, Offset: 0x440
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_laststand_client");
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2a3a5c11, Offset: 0x3b0
    // Size: 0x88
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "bleedout_progress", 0);
        set_data(localclientnum, "revive_progress", 0);
        set_data(localclientnum, "num_downs", 0);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3463e936, Offset: 0x380
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 4, eflags: 0x1 linked
    // Checksum 0x8315b949, Offset: 0x2c0
    // Size: 0xb4
    function setup_clientfields(uid, var_a9a4e140, var_e97e7153, var_5db69c99) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("bleedout_progress", 1, 6, "float", var_a9a4e140);
        cluielem::add_clientfield("revive_progress", 1, 5, "float", var_e97e7153);
        cluielem::add_clientfield("num_downs", 1, 8, "int", var_5db69c99);
    }

}

// Namespace zm_laststand_client/zm_laststand_client
// Params 4, eflags: 0x1 linked
// Checksum 0x953ee0c1, Offset: 0xe0
// Size: 0x64
function register(uid, var_a9a4e140, var_e97e7153, var_5db69c99) {
    elem = new czm_laststand_client();
    [[ elem ]]->setup_clientfields(uid, var_a9a4e140, var_e97e7153, var_5db69c99);
    return elem;
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0x8673cd5e, Offset: 0x150
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_laststand_client();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0x6c42e100, Offset: 0x198
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0x3e991d85, Offset: 0x1c0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0xa1bf77c6, Offset: 0x1e8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0xe6ddc324, Offset: 0x210
// Size: 0x28
function set_bleedout_progress(localclientnum, value) {
    [[ self ]]->set_bleedout_progress(localclientnum, value);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0xeda1e986, Offset: 0x240
// Size: 0x28
function set_revive_progress(localclientnum, value) {
    [[ self ]]->set_revive_progress(localclientnum, value);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0x4b9c228c, Offset: 0x270
// Size: 0x28
function set_num_downs(localclientnum, value) {
    [[ self ]]->set_num_downs(localclientnum, value);
}

