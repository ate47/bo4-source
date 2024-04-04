// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace vehicleturretoverheat;

// Namespace vehicleturretoverheat
// Method(s) 8 Total 14
class cvehicleturretoverheat : cluielem {

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 2, eflags: 0x1 linked
    // Checksum 0x38f34591, Offset: 0x470
    // Size: 0x30
    function set_bar_percent(localclientnum, value) {
        set_data(localclientnum, "bar_percent", value);
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb0b459a4, Offset: 0x3b8
    // Size: 0xac
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"overheat" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        assertmsg("<unknown string>");
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 1, eflags: 0x1 linked
    // Checksum 0xab228b31, Offset: 0x380
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"vehicleturretoverheat");
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 1, eflags: 0x1 linked
    // Checksum 0x21811193, Offset: 0x310
    // Size: 0x68
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
        set_data(localclientnum, "bar_percent", 0);
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 1, eflags: 0x1 linked
    // Checksum 0xa474a7f8, Offset: 0x2e0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 2, eflags: 0x1 linked
    // Checksum 0xcdcd568a, Offset: 0x258
    // Size: 0x7c
    function setup_clientfields(uid, var_661989d5) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::add_clientfield("bar_percent", 4000, 6, "float", var_661989d5);
    }

}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 2, eflags: 0x1 linked
// Checksum 0x262673da, Offset: 0xc0
// Size: 0x4c
function register(uid, var_661989d5) {
    elem = new cvehicleturretoverheat();
    [[ elem ]]->setup_clientfields(uid, var_661989d5);
    return elem;
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0x3a57c5b5, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new cvehicleturretoverheat();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0xdb3bdbdd, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0xebcea365, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0xb3eebc47, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 2, eflags: 0x0
// Checksum 0x6cc4f1fb, Offset: 0x1d8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 2, eflags: 0x0
// Checksum 0x6b997ad2, Offset: 0x208
// Size: 0x28
function set_bar_percent(localclientnum, value) {
    [[ self ]]->set_bar_percent(localclientnum, value);
}

