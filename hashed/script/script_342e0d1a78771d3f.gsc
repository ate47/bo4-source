#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace remote_missile_target_lockon;

// Namespace remote_missile_target_lockon
// Method(s) 9 Total 16
class cremote_missile_target_lockon : cluielem {

    var var_47e79fc;

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0x8b9bb7ed, Offset: 0x4d8
    // Size: 0x3c
    function set_killed(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "killed", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0x759e8f5b, Offset: 0x490
    // Size: 0x3c
    function set_ishawktag(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "isHawkTag", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0xf410146f, Offset: 0x448
    // Size: 0x3c
    function set_target_locked(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "target_locked", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0x4c625cda, Offset: 0x400
    // Size: 0x3c
    function set_clientnum(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "clientnum", value);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 1, eflags: 0x0
    // Checksum 0x393b5a57, Offset: 0x3d0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 2, eflags: 0x0
    // Checksum 0x8e633b6d, Offset: 0x380
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "remote_missile_target_lockon", persistent);
    }

    // Namespace cremote_missile_target_lockon/remote_missile_target_lockon
    // Params 1, eflags: 0x0
    // Checksum 0xdead670c, Offset: 0x2b0
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int");
        cluielem::add_clientfield("target_locked", 1, 1, "int");
        cluielem::add_clientfield("isHawkTag", 13000, 1, "int");
        cluielem::add_clientfield("killed", 13000, 1, "int");
    }

}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x0
// Checksum 0xa418dcfa, Offset: 0xf8
// Size: 0x40
function register(uid) {
    elem = new cremote_missile_target_lockon();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x0
// Checksum 0xfb90081a, Offset: 0x140
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x0
// Checksum 0x8c344c47, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 1, eflags: 0x0
// Checksum 0xce3c822a, Offset: 0x1a8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x0
// Checksum 0xba55c22e, Offset: 0x1d0
// Size: 0x28
function set_clientnum(player, value) {
    [[ self ]]->set_clientnum(player, value);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x0
// Checksum 0x9d37f010, Offset: 0x200
// Size: 0x28
function set_target_locked(player, value) {
    [[ self ]]->set_target_locked(player, value);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x0
// Checksum 0xe78eea26, Offset: 0x230
// Size: 0x28
function set_ishawktag(player, value) {
    [[ self ]]->set_ishawktag(player, value);
}

// Namespace remote_missile_target_lockon/remote_missile_target_lockon
// Params 2, eflags: 0x0
// Checksum 0xd9f42b91, Offset: 0x260
// Size: 0x28
function set_killed(player, value) {
    [[ self ]]->set_killed(player, value);
}

