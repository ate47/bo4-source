#using scripts\core_common\lui_shared;

#namespace wz_wingsuit_hud;

// Namespace wz_wingsuit_hud
// Method(s) 6 Total 12
class cwz_wingsuit_hud : cluielem {

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 1, eflags: 0x0
    // Checksum 0xf45b9762, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"wz_wingsuit_hud");
    }

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 1, eflags: 0x0
    // Checksum 0xa585160e, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 1, eflags: 0x0
    // Checksum 0x1801df20, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 1, eflags: 0x0
    // Checksum 0xa6ef1321, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1, eflags: 0x0
// Checksum 0x2a21abc4, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cwz_wingsuit_hud();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1, eflags: 0x0
// Checksum 0xa8f05470, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cwz_wingsuit_hud();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1, eflags: 0x0
// Checksum 0xe03661ef, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1, eflags: 0x0
// Checksum 0x13ca209, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1, eflags: 0x0
// Checksum 0x430f6e1e, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

