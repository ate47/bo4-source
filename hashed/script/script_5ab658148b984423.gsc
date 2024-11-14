#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_build_progress;

// Namespace zm_build_progress
// Method(s) 6 Total 13
class czm_build_progress : cluielem {

    var var_47e79fc;

    // Namespace czm_build_progress/zm_build_progress
    // Params 2, eflags: 0x1 linked
    // Checksum 0x36f7b894, Offset: 0x2d0
    // Size: 0x3c
    function set_progress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "progress", value);
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb597955b, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 2, eflags: 0x1 linked
    // Checksum 0x53bb0713, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_build_progress", persistent);
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2fd8a6c1, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("progress", 1, 6, "float");
    }

}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x1 linked
// Checksum 0x26de4028, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new czm_build_progress();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_build_progress/zm_build_progress
// Params 2, eflags: 0x1 linked
// Checksum 0x41e23b41, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x1 linked
// Checksum 0xcec74df9, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x1 linked
// Checksum 0xa5fb3282, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_build_progress/zm_build_progress
// Params 2, eflags: 0x1 linked
// Checksum 0xaffbc2ba, Offset: 0x1a8
// Size: 0x28
function set_progress(player, value) {
    [[ self ]]->set_progress(player, value);
}

