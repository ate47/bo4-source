#using scripts\core_common\lui_shared.csc;

#namespace remote_missile_targets;

// Namespace remote_missile_targets
// Method(s) 10 Total 16
class cremote_missile_targets : cluielem {

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0xf8c5d6a3, Offset: 0x5a8
    // Size: 0x30
    function set_extra_target_3(localclientnum, value) {
        set_data(localclientnum, "extra_target_3", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0xe7f7ca2a, Offset: 0x570
    // Size: 0x30
    function set_extra_target_2(localclientnum, value) {
        set_data(localclientnum, "extra_target_2", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0xbcc14938, Offset: 0x538
    // Size: 0x30
    function set_extra_target_1(localclientnum, value) {
        set_data(localclientnum, "extra_target_1", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0x5a20baeb, Offset: 0x500
    // Size: 0x30
    function set_player_target_active(localclientnum, value) {
        set_data(localclientnum, "player_target_active", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 1, eflags: 0x0
    // Checksum 0x9d5ea133, Offset: 0x4c8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"remote_missile_targets");
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 1, eflags: 0x0
    // Checksum 0x74753bd5, Offset: 0x428
    // Size: 0x94
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "player_target_active", 0);
        set_data(localclientnum, "extra_target_1", 0);
        set_data(localclientnum, "extra_target_2", 0);
        set_data(localclientnum, "extra_target_3", 0);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 1, eflags: 0x0
    // Checksum 0xe351c9ba, Offset: 0x3f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 5, eflags: 0x0
    // Checksum 0x9720bbed, Offset: 0x308
    // Size: 0xe4
    function setup_clientfields(uid, var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("player_target_active", 1, 16, "int", var_9318c80d);
        cluielem::add_clientfield("extra_target_1", 1, 10, "int", var_82a5247c);
        cluielem::add_clientfield("extra_target_2", 1, 10, "int", var_afbc846a);
        cluielem::add_clientfield("extra_target_3", 1, 10, "int", var_4c87c083);
    }

}

// Namespace remote_missile_targets/remote_missile_targets
// Params 5, eflags: 0x0
// Checksum 0xec624a7a, Offset: 0xf0
// Size: 0x70
function register(uid, var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083) {
    elem = new cremote_missile_targets();
    [[ elem ]]->setup_clientfields(uid, var_9318c80d, var_82a5247c, var_afbc846a, var_4c87c083);
    return elem;
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0x89a3bb40, Offset: 0x168
// Size: 0x40
function register_clientside(uid) {
    elem = new cremote_missile_targets();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0x30fa92b3, Offset: 0x1b0
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0x37e46cf2, Offset: 0x1d8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0x43f2b421, Offset: 0x200
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0x1bc72b8c, Offset: 0x228
// Size: 0x28
function set_player_target_active(localclientnum, value) {
    [[ self ]]->set_player_target_active(localclientnum, value);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0xd916598f, Offset: 0x258
// Size: 0x28
function set_extra_target_1(localclientnum, value) {
    [[ self ]]->set_extra_target_1(localclientnum, value);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0x72d1c294, Offset: 0x288
// Size: 0x28
function set_extra_target_2(localclientnum, value) {
    [[ self ]]->set_extra_target_2(localclientnum, value);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0x2fe86834, Offset: 0x2b8
// Size: 0x28
function set_extra_target_3(localclientnum, value) {
    [[ self ]]->set_extra_target_3(localclientnum, value);
}

