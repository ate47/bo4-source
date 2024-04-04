// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_build_progress;

// Namespace zm_build_progress
// Method(s) 7 Total 13
class czm_build_progress : cluielem {

    // Namespace czm_build_progress/zm_build_progress
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1a68dfc5, Offset: 0x330
    // Size: 0x30
    function set_progress(localclientnum, value) {
        set_data(localclientnum, "progress", value);
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4b95ee6b, Offset: 0x2f8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_build_progress");
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 1, eflags: 0x1 linked
    // Checksum 0xdfda8ca4, Offset: 0x2a8
    // Size: 0x48
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "progress", 0);
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa0f86e98, Offset: 0x278
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_build_progress/zm_build_progress
    // Params 2, eflags: 0x1 linked
    // Checksum 0x915af0a2, Offset: 0x218
    // Size: 0x54
    function setup_clientfields(uid, progresscallback) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("progress", 1, 6, "float", progresscallback);
    }

}

// Namespace zm_build_progress/zm_build_progress
// Params 2, eflags: 0x1 linked
// Checksum 0x590cb2c7, Offset: 0xb0
// Size: 0x4c
function register(uid, progresscallback) {
    elem = new czm_build_progress();
    [[ elem ]]->setup_clientfields(uid, progresscallback);
    return elem;
}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x0
// Checksum 0x5f5d7922, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_build_progress();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x0
// Checksum 0x36187fa, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x0
// Checksum 0x17e11995, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_build_progress/zm_build_progress
// Params 1, eflags: 0x0
// Checksum 0x2bd8fcc4, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_build_progress/zm_build_progress
// Params 2, eflags: 0x0
// Checksum 0xe4ec5688, Offset: 0x1c8
// Size: 0x28
function set_progress(localclientnum, value) {
    [[ self ]]->set_progress(localclientnum, value);
}

