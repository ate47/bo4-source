#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace self_respawn;

// Namespace self_respawn
// Method(s) 6 Total 13
class cself_respawn : cluielem {

    var var_47e79fc;

    // Namespace cself_respawn/self_respawn
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc0d82e, Offset: 0x2c8
    // Size: 0x3c
    function set_percent(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "percent", value);
    }

    // Namespace cself_respawn/self_respawn
    // Params 1, eflags: 0x1 linked
    // Checksum 0x53b71be3, Offset: 0x298
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cself_respawn/self_respawn
    // Params 2, eflags: 0x1 linked
    // Checksum 0x65556246, Offset: 0x248
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "self_respawn", persistent);
    }

    // Namespace cself_respawn/self_respawn
    // Params 1, eflags: 0x1 linked
    // Checksum 0x144fe2df, Offset: 0x1f0
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("percent", 4000, 6, "float");
    }

}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0x50e1b8b, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new cself_respawn();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace self_respawn/self_respawn
// Params 2, eflags: 0x0
// Checksum 0x4657dd92, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0x7b4b45b9, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0x4ead0d56, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace self_respawn/self_respawn
// Params 2, eflags: 0x0
// Checksum 0x592a5fbc, Offset: 0x1a0
// Size: 0x28
function set_percent(player, value) {
    [[ self ]]->set_percent(player, value);
}

