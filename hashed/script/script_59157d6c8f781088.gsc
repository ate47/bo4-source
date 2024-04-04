// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace mp_laststand_client;

// Namespace mp_laststand_client
// Method(s) 7 Total 14
class cmp_laststand_client : cluielem {

    var var_47e79fc;

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0xe2284b3d, Offset: 0x388
    // Size: 0x3c
    function set_revive_progress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "revive_progress", value);
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0xb6bd7814, Offset: 0x340
    // Size: 0x3c
    function set_bleedout_progress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "bleedout_progress", value);
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 1, eflags: 0x0
    // Checksum 0x24fe5ca9, Offset: 0x310
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 2, eflags: 0x0
    // Checksum 0x926a061, Offset: 0x2c0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "mp_laststand_client", persistent);
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 1, eflags: 0x0
    // Checksum 0xd7972312, Offset: 0x240
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("bleedout_progress", 1, 6, "float");
        cluielem::add_clientfield("revive_progress", 1, 5, "float");
    }

}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1, eflags: 0x0
// Checksum 0x994369b8, Offset: 0xe8
// Size: 0x40
function register(uid) {
    elem = new cmp_laststand_client();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 2, eflags: 0x0
// Checksum 0xe66483c3, Offset: 0x130
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1, eflags: 0x0
// Checksum 0x7884de0e, Offset: 0x170
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1, eflags: 0x0
// Checksum 0xdf32d187, Offset: 0x198
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 2, eflags: 0x0
// Checksum 0xb21b53d4, Offset: 0x1c0
// Size: 0x28
function set_bleedout_progress(player, value) {
    [[ self ]]->set_bleedout_progress(player, value);
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 2, eflags: 0x0
// Checksum 0x96f38da6, Offset: 0x1f0
// Size: 0x28
function set_revive_progress(player, value) {
    [[ self ]]->set_revive_progress(player, value);
}

