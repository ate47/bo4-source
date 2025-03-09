#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace zm_arcade_keys;

// Namespace zm_arcade_keys
// Method(s) 6 Total 13
class czm_arcade_keys : cluielem {

    var _uid;

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 2, eflags: 0x0
    // Checksum 0x5c61b4, Offset: 0x2c8
    // Size: 0x3c
    function set_key_count(player, value) {
        player clientfield::function_9bf78ef8(_uid, "key_count", value);
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 1, eflags: 0x0
    // Checksum 0x1541a95e, Offset: 0x298
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 2, eflags: 0x0
    // Checksum 0x8b56151e, Offset: 0x248
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_arcade_keys", persistent);
    }

    // Namespace czm_arcade_keys/zm_arcade_keys
    // Params 1, eflags: 0x0
    // Checksum 0x8fc351e0, Offset: 0x1f0
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("key_count", 1, 4, "int");
    }

}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0x278c3f92, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new czm_arcade_keys();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 2, eflags: 0x0
// Checksum 0x88c54e08, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0xce00d88c, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 1, eflags: 0x0
// Checksum 0xdd731bf1, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_arcade_keys/zm_arcade_keys
// Params 2, eflags: 0x0
// Checksum 0xa212bb4e, Offset: 0x1a0
// Size: 0x28
function set_key_count(player, value) {
    [[ self ]]->set_key_count(player, value);
}

