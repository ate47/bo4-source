// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace debug_center_screen;

// Namespace debug_center_screen
// Method(s) 5 Total 12
class cdebug_center_screen : cluielem {

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 0, eflags: 0x9 linked
    // Checksum 0x1895a1aa, Offset: 0x190
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x37bbb31b, Offset: 0x260
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 1, eflags: 0x1 linked
    // Checksum 0x147a73a7, Offset: 0x230
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 2, eflags: 0x1 linked
    // Checksum 0x79da4e5c, Offset: 0x1e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "debug_center_screen", persistent);
    }

    // Namespace cdebug_center_screen/debug_center_screen
    // Params 1, eflags: 0x1 linked
    // Checksum 0xda6394be, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0x9f298373, Offset: 0xb8
// Size: 0x40
function register(uid) {
    elem = new cdebug_center_screen();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace debug_center_screen/debug_center_screen
// Params 2, eflags: 0x0
// Checksum 0x5bca4e14, Offset: 0x100
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0xfca7bc00, Offset: 0x140
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace debug_center_screen/debug_center_screen
// Params 1, eflags: 0x0
// Checksum 0x60346c09, Offset: 0x168
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

