// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace debug_center_screen;

// Namespace debug_center_screen
// Method(s) 6 Total 12
class cdebug_center_screen : cluielem {

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 0, eflags: 0x9 linked
    // Checksum 0xc86e7622, Offset: 0x1a8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xc1ab16f3, Offset: 0x290
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 1, eflags: 0x1 linked
    // Checksum 0x8610fef8, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"debug_center_screen");
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 1, eflags: 0x1 linked
    // Checksum 0x9616bdb7, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb49b3905, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 1, eflags: 0x1 linked
    // Checksum 0x83f875fe, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x1 linked
// Checksum 0xeb27f52c, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cdebug_center_screen();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0x4a9ff3c9, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cdebug_center_screen();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0x2c9aa8b, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0xac727145, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0x50039cae, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

