#using scripts\core_common\lui_shared.csc;

#namespace success_screen;

// Namespace success_screen
// Method(s) 6 Total 12
class csuccess_screen : cluielem {

    // Namespace csuccess_screen/success_screen
    // Params 1, eflags: 0x0
    // Checksum 0x9b73c672, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"success_screen");
    }

    // Namespace csuccess_screen/success_screen
    // Params 1, eflags: 0x0
    // Checksum 0x4a9c8559, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace csuccess_screen/success_screen
    // Params 1, eflags: 0x0
    // Checksum 0x504c9d50, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace csuccess_screen/success_screen
    // Params 1, eflags: 0x0
    // Checksum 0x65dfae15, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0x9cb45a09, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new csuccess_screen();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0x7a5202cf, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new csuccess_screen();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0xe2a4807e, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0x212e3dac, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0x9402d1aa, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

