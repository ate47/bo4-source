#using scripts\core_common\lui_shared.csc;

#namespace death_zone;

// Namespace death_zone
// Method(s) 7 Total 13
class cdeath_zone : cluielem {

    // Namespace cdeath_zone/death_zone
    // Params 2, eflags: 0x0
    // Checksum 0xc9f3b802, Offset: 0x328
    // Size: 0x30
    function set_shutdown_sec(localclientnum, value) {
        set_data(localclientnum, "shutdown_sec", value);
    }

    // Namespace cdeath_zone/death_zone
    // Params 1, eflags: 0x0
    // Checksum 0xb041637e, Offset: 0x2f0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"death_zone");
    }

    // Namespace cdeath_zone/death_zone
    // Params 1, eflags: 0x0
    // Checksum 0xd91eba63, Offset: 0x2a8
    // Size: 0x40
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "shutdown_sec", 0);
    }

    // Namespace cdeath_zone/death_zone
    // Params 1, eflags: 0x0
    // Checksum 0xaf31a14, Offset: 0x278
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cdeath_zone/death_zone
    // Params 2, eflags: 0x0
    // Checksum 0xc30c40a7, Offset: 0x218
    // Size: 0x54
    function setup_clientfields(uid, var_fd61f748) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("shutdown_sec", 1, 9, "int", var_fd61f748);
    }

}

// Namespace death_zone/death_zone
// Params 2, eflags: 0x0
// Checksum 0x11d389ed, Offset: 0xb0
// Size: 0x4c
function register(uid, var_fd61f748) {
    elem = new cdeath_zone();
    [[ elem ]]->setup_clientfields(uid, var_fd61f748);
    return elem;
}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0x5b41d384, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new cdeath_zone();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0xb41cbcb9, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0x6eb1445c, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace death_zone/death_zone
// Params 1, eflags: 0x0
// Checksum 0xcc88ac93, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace death_zone/death_zone
// Params 2, eflags: 0x0
// Checksum 0x1ba2743, Offset: 0x1c8
// Size: 0x28
function set_shutdown_sec(localclientnum, value) {
    [[ self ]]->set_shutdown_sec(localclientnum, value);
}

