// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace death_zone;

// Namespace death_zone
// Method(s) 6 Total 13
class cdeath_zone : cluielem {

    var var_47e79fc;

    // Namespace cdeath_zone/death_zone
    // Params 2, eflags: 0x0
    // Checksum 0xed54badf, Offset: 0x2c8
    // Size: 0x3c
    function set_shutdown_sec(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "shutdown_sec", value);
    }

    // Namespace cdeath_zone/death_zone
    // Params 1, eflags: 0x0
    // Checksum 0xdd1b2821, Offset: 0x298
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cdeath_zone/death_zone
    // Params 2, eflags: 0x0
    // Checksum 0x37e43e6a, Offset: 0x248
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "death_zone", persistent);
    }

    // Namespace cdeath_zone/death_zone
    // Params 1, eflags: 0x0
    // Checksum 0x9b8b17f5, Offset: 0x1f0
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("shutdown_sec", 1, 9, "int");
    }

}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0x67b340d0, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new cdeath_zone();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace death_zone/death_zone
// Params 2, eflags: 0x0
// Checksum 0x2cf90ddf, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0xbfc9adf, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0x7a899dbf, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace death_zone/death_zone
// Params 2, eflags: 0x0
// Checksum 0x96214f6a, Offset: 0x1a0
// Size: 0x28
function set_shutdown_sec(player, value) {
    [[ self ]]->set_shutdown_sec(player, value);
}

