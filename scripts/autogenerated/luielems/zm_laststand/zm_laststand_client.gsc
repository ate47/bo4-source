#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace zm_laststand_client;

// Namespace zm_laststand_client
// Method(s) 8 Total 15
class czm_laststand_client : cluielem {

    var _uid;

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0x2aa94ce6, Offset: 0x438
    // Size: 0x3c
    function set_num_downs(player, value) {
        player clientfield::function_9bf78ef8(_uid, "num_downs", value);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0x31eb79ab, Offset: 0x3f0
    // Size: 0x3c
    function set_revive_progress(player, value) {
        player clientfield::function_9bf78ef8(_uid, "revive_progress", value);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0x7f8bce4f, Offset: 0x3a8
    // Size: 0x3c
    function set_bleedout_progress(player, value) {
        player clientfield::function_9bf78ef8(_uid, "bleedout_progress", value);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 1, eflags: 0x0
    // Checksum 0x9cd1480d, Offset: 0x378
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0x722b5ff3, Offset: 0x328
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_laststand_client", persistent);
    }

    // Namespace czm_laststand_client/zm_laststand_client
    // Params 1, eflags: 0x0
    // Checksum 0x23772c, Offset: 0x280
    // Size: 0x9c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("bleedout_progress", 1, 6, "float");
        cluielem::add_clientfield("revive_progress", 1, 5, "float");
        cluielem::add_clientfield("num_downs", 1, 8, "int");
    }

}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0x1c64caf, Offset: 0xf8
// Size: 0x40
function register(uid) {
    elem = new czm_laststand_client();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0xd41f7363, Offset: 0x140
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0xe30331e, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 1, eflags: 0x0
// Checksum 0xf9ff5b8a, Offset: 0x1a8
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0xa6ce9a48, Offset: 0x1d0
// Size: 0x28
function set_bleedout_progress(player, value) {
    [[ self ]]->set_bleedout_progress(player, value);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0x2c1a498a, Offset: 0x200
// Size: 0x28
function set_revive_progress(player, value) {
    [[ self ]]->set_revive_progress(player, value);
}

// Namespace zm_laststand_client/zm_laststand_client
// Params 2, eflags: 0x0
// Checksum 0x66b06dc2, Offset: 0x230
// Size: 0x28
function set_num_downs(player, value) {
    [[ self ]]->set_num_downs(player, value);
}

