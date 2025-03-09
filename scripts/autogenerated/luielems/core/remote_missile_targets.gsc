#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace remote_missile_targets;

// Namespace remote_missile_targets
// Method(s) 9 Total 16
class cremote_missile_targets : cluielem {

    var _uid;

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0x52ec8bbe, Offset: 0x4f0
    // Size: 0x3c
    function set_extra_target_3(player, value) {
        player clientfield::function_9bf78ef8(_uid, "extra_target_3", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0x7e009f12, Offset: 0x4a8
    // Size: 0x3c
    function set_extra_target_2(player, value) {
        player clientfield::function_9bf78ef8(_uid, "extra_target_2", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0x82aa601f, Offset: 0x460
    // Size: 0x3c
    function set_extra_target_1(player, value) {
        player clientfield::function_9bf78ef8(_uid, "extra_target_1", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0x1d30a022, Offset: 0x418
    // Size: 0x3c
    function set_player_target_active(player, value) {
        player clientfield::function_9bf78ef8(_uid, "player_target_active", value);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 1, eflags: 0x0
    // Checksum 0x23b90db4, Offset: 0x3e8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 2, eflags: 0x0
    // Checksum 0x215a9935, Offset: 0x398
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "remote_missile_targets", persistent);
    }

    // Namespace cremote_missile_targets/remote_missile_targets
    // Params 1, eflags: 0x0
    // Checksum 0xc9e20cef, Offset: 0x2c8
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("player_target_active", 1, 16, "int");
        cluielem::add_clientfield("extra_target_1", 1, 10, "int");
        cluielem::add_clientfield("extra_target_2", 1, 10, "int");
        cluielem::add_clientfield("extra_target_3", 1, 10, "int");
    }

}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0xce1ce325, Offset: 0x110
// Size: 0x40
function register(uid) {
    elem = new cremote_missile_targets();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0x82907f9f, Offset: 0x158
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0xa7626ccf, Offset: 0x198
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 1, eflags: 0x0
// Checksum 0x8e8927fc, Offset: 0x1c0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0xc7155b29, Offset: 0x1e8
// Size: 0x28
function set_player_target_active(player, value) {
    [[ self ]]->set_player_target_active(player, value);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0xc14752f3, Offset: 0x218
// Size: 0x28
function set_extra_target_1(player, value) {
    [[ self ]]->set_extra_target_1(player, value);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0xd1101e04, Offset: 0x248
// Size: 0x28
function set_extra_target_2(player, value) {
    [[ self ]]->set_extra_target_2(player, value);
}

// Namespace remote_missile_targets/remote_missile_targets
// Params 2, eflags: 0x0
// Checksum 0xf84d24ef, Offset: 0x278
// Size: 0x28
function set_extra_target_3(player, value) {
    [[ self ]]->set_extra_target_3(player, value);
}

