// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace zm_towers_pap_hud;

// Namespace zm_towers_pap_hud
// Method(s) 9 Total 16
class czm_towers_pap_hud : cluielem {

    var var_47e79fc;

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0x48780f9d, Offset: 0x4e0
    // Size: 0x3c
    function set_odin_acquired(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "odin_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0xb2e3eefc, Offset: 0x498
    // Size: 0x3c
    function set_zeus_acquired(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "zeus_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0x5bee22c6, Offset: 0x450
    // Size: 0x3c
    function set_ra_acquired(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "ra_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0x343e20de, Offset: 0x408
    // Size: 0x3c
    function set_danu_acquired(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "danu_acquired", value);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 1, eflags: 0x0
    // Checksum 0xfdefabbe, Offset: 0x3d8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 2, eflags: 0x0
    // Checksum 0x6f3bd843, Offset: 0x388
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_towers_pap_hud", persistent);
    }

    // Namespace czm_towers_pap_hud/zm_towers_pap_hud
    // Params 1, eflags: 0x0
    // Checksum 0x8e6378a7, Offset: 0x2b8
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("danu_acquired", 1, 1, "int");
        cluielem::add_clientfield("ra_acquired", 1, 1, "int");
        cluielem::add_clientfield("zeus_acquired", 1, 1, "int");
        cluielem::add_clientfield("odin_acquired", 1, 1, "int");
    }

}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0x81cc59fd, Offset: 0x100
// Size: 0x40
function register(uid) {
    elem = new czm_towers_pap_hud();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0xfd5d22e8, Offset: 0x148
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0xa6177e61, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 1, eflags: 0x0
// Checksum 0x2102f99c, Offset: 0x1b0
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0x1dd72f4a, Offset: 0x1d8
// Size: 0x28
function set_danu_acquired(player, value) {
    [[ self ]]->set_danu_acquired(player, value);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0xfa5c49a1, Offset: 0x208
// Size: 0x28
function set_ra_acquired(player, value) {
    [[ self ]]->set_ra_acquired(player, value);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0xfd216808, Offset: 0x238
// Size: 0x28
function set_zeus_acquired(player, value) {
    [[ self ]]->set_zeus_acquired(player, value);
}

// Namespace zm_towers_pap_hud/zm_towers_pap_hud
// Params 2, eflags: 0x0
// Checksum 0xbda447b7, Offset: 0x268
// Size: 0x28
function set_odin_acquired(player, value) {
    [[ self ]]->set_odin_acquired(player, value);
}

