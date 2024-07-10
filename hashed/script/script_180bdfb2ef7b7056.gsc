#using scripts\core_common\lui_shared.csc;

#namespace self_respawn;

// Namespace self_respawn
// Method(s) 7 Total 13
class cself_respawn : cluielem {

    // Namespace cself_respawn/self_respawn
    // Params 2, eflags: 0x0
    // Checksum 0x4f8d2406, Offset: 0x330
    // Size: 0x30
    function set_percent(localclientnum, value) {
        set_data(localclientnum, "percent", value);
    }

    // Namespace cself_respawn/self_respawn
    // Params 1, eflags: 0x0
    // Checksum 0x815a405b, Offset: 0x2f8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"self_respawn");
    }

    // Namespace cself_respawn/self_respawn
    // Params 1, eflags: 0x0
    // Checksum 0x5b95a9a2, Offset: 0x2a8
    // Size: 0x48
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "percent", 0);
    }

    // Namespace cself_respawn/self_respawn
    // Params 1, eflags: 0x0
    // Checksum 0x75c572b1, Offset: 0x278
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cself_respawn/self_respawn
    // Params 2, eflags: 0x0
    // Checksum 0xac8ac4a8, Offset: 0x218
    // Size: 0x54
    function setup_clientfields(uid, var_1089a5f3) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("percent", 4000, 6, "float", var_1089a5f3);
    }

}

// Namespace self_respawn/self_respawn
// Params 2, eflags: 0x0
// Checksum 0xcc9d396c, Offset: 0xb0
// Size: 0x4c
function register(uid, var_1089a5f3) {
    elem = new cself_respawn();
    [[ elem ]]->setup_clientfields(uid, var_1089a5f3);
    return elem;
}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0xc8cbe6b8, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new cself_respawn();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0x28f2ab3e, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0x603dc5c2, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace self_respawn/self_respawn
// Params 1, eflags: 0x0
// Checksum 0xc1113908, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace self_respawn/self_respawn
// Params 2, eflags: 0x0
// Checksum 0x8b484602, Offset: 0x1c8
// Size: 0x28
function set_percent(localclientnum, value) {
    [[ self ]]->set_percent(localclientnum, value);
}

