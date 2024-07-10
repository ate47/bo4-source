#using scripts\core_common\lui_shared.csc;

#namespace zm_location;

// Namespace zm_location
// Method(s) 7 Total 13
class czm_location : cluielem {

    // Namespace czm_location/zm_location
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc2786a25, Offset: 0x340
    // Size: 0x30
    function set_location_name(localclientnum, value) {
        set_data(localclientnum, "location_name", value);
    }

    // Namespace czm_location/zm_location
    // Params 1, eflags: 0x1 linked
    // Checksum 0x7f36afbe, Offset: 0x308
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_location");
    }

    // Namespace czm_location/zm_location
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbdb01b95, Offset: 0x2b0
    // Size: 0x4c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "location_name", #"");
    }

    // Namespace czm_location/zm_location
    // Params 1, eflags: 0x1 linked
    // Checksum 0xd11d3009, Offset: 0x280
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_location/zm_location
    // Params 2, eflags: 0x1 linked
    // Checksum 0x27606f78, Offset: 0x220
    // Size: 0x54
    function setup_clientfields(uid, var_5c0f4d11) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("string", "location_name", 1);
    }

}

// Namespace zm_location/zm_location
// Params 2, eflags: 0x1 linked
// Checksum 0xe89a82ea, Offset: 0xb8
// Size: 0x4c
function register(uid, var_5c0f4d11) {
    elem = new czm_location();
    [[ elem ]]->setup_clientfields(uid, var_5c0f4d11);
    return elem;
}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x0
// Checksum 0x61fde613, Offset: 0x110
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_location();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x0
// Checksum 0x938dd70f, Offset: 0x158
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x0
// Checksum 0x520174b5, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_location/zm_location
// Params 1, eflags: 0x0
// Checksum 0x8063a3d6, Offset: 0x1a8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_location/zm_location
// Params 2, eflags: 0x0
// Checksum 0x8d484312, Offset: 0x1d0
// Size: 0x28
function set_location_name(localclientnum, value) {
    [[ self ]]->set_location_name(localclientnum, value);
}

