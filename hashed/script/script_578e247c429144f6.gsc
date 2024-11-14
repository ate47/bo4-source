#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace vehicleturretdurability;

// Namespace vehicleturretdurability
// Method(s) 6 Total 13
class cvehicleturretdurability : cluielem {

    var var_47e79fc;

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 2, eflags: 0x1 linked
    // Checksum 0x18948c15, Offset: 0x2d8
    // Size: 0x3c
    function set_bar_percent(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "bar_percent", value);
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4c9265f5, Offset: 0x2a8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6b8b4a3, Offset: 0x258
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "VehicleTurretDurability", persistent);
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfd55ebd, Offset: 0x200
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("bar_percent", 4000, 6, "float", 0);
    }

}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1, eflags: 0x1 linked
// Checksum 0x90d76b25, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new cvehicleturretdurability();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 2, eflags: 0x0
// Checksum 0x48a6b65e, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1, eflags: 0x1 linked
// Checksum 0xda9390a3, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1, eflags: 0x1 linked
// Checksum 0xc64d85ee, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 2, eflags: 0x0
// Checksum 0x42642c55, Offset: 0x1b0
// Size: 0x28
function set_bar_percent(player, value) {
    [[ self ]]->set_bar_percent(player, value);
}

