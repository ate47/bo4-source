// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_location;

// Namespace zm_location
// Method(s) 6 Total 13
class czm_location : cluielem {

    var var_47e79fc;

    // Namespace czm_location/zm_location
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2828a4d, Offset: 0x2d0
    // Size: 0x3c
    function set_location_name(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "location_name", value);
    }

    // Namespace czm_location/zm_location
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb9850192, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_location/zm_location
    // Params 2, eflags: 0x1 linked
    // Checksum 0xcb8de962, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_location", persistent);
    }

    // Namespace czm_location/zm_location
    // Params 1, eflags: 0x1 linked
    // Checksum 0x8dc2e22c, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("string", "location_name", 1);
    }

}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x1 linked
// Checksum 0x7c862202, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new czm_location();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_location/zm_location
// Params 2, eflags: 0x1 linked
// Checksum 0x5be47cea, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x1 linked
// Checksum 0x671b2c7c, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x1 linked
// Checksum 0xcf1407a2, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_location/zm_location
// Params 2, eflags: 0x1 linked
// Checksum 0x8c44b296, Offset: 0x1a8
// Size: 0x28
function set_location_name(player, value) {
    [[ self ]]->set_location_name(player, value);
}

