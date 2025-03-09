#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace vehicleturretoverheat;

// Namespace vehicleturretoverheat
// Method(s) 7 Total 14
class cvehicleturretoverheat : cluielem {

    var _uid;

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 2, eflags: 0x0
    // Checksum 0x197db59e, Offset: 0x400
    // Size: 0x3c
    function set_bar_percent(player, value) {
        player clientfield::function_9bf78ef8(_uid, "bar_percent", value);
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 2, eflags: 0x0
    // Checksum 0x543ec8d6, Offset: 0x338
    // Size: 0xbc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(_uid, "_state", 0);
            return;
        }
        if (#"overheat" == state_name) {
            player clientfield::function_9bf78ef8(_uid, "_state", 1);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 1, eflags: 0x0
    // Checksum 0xa8204b39, Offset: 0x308
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 2, eflags: 0x0
    // Checksum 0x4aa2925f, Offset: 0x2b8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "VehicleTurretOverheat", persistent);
    }

    // Namespace cvehicleturretoverheat/vehicleturretoverheat
    // Params 1, eflags: 0x0
    // Checksum 0xb83bc254, Offset: 0x238
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::add_clientfield("bar_percent", 4000, 6, "float", 0);
    }

}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0x145d78fb, Offset: 0xe0
// Size: 0x40
function register(uid) {
    elem = new cvehicleturretoverheat();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 2, eflags: 0x0
// Checksum 0x4e7da7a4, Offset: 0x128
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0xe9530d87, Offset: 0x168
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 1, eflags: 0x0
// Checksum 0x2ed54047, Offset: 0x190
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 2, eflags: 0x0
// Checksum 0x332f47c8, Offset: 0x1b8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace vehicleturretoverheat/vehicleturretoverheat
// Params 2, eflags: 0x0
// Checksum 0xfabe0e84, Offset: 0x1e8
// Size: 0x28
function set_bar_percent(player, value) {
    [[ self ]]->set_bar_percent(player, value);
}

