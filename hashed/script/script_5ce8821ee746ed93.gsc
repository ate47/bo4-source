#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace success_screen;

// Namespace success_screen
// Method(s) 5 Total 12
class csuccess_screen : cluielem {

    // Namespace csuccess_screen/success_screen
    // Params 1, eflags: 0x0
    // Checksum 0x5858e354, Offset: 0x230
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace csuccess_screen/success_screen
    // Params 2, eflags: 0x0
    // Checksum 0x8b9d6df1, Offset: 0x1e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "success_screen", persistent);
    }

    // Namespace csuccess_screen/success_screen
    // Params 1, eflags: 0x0
    // Checksum 0xe1d3dff0, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0xfd107bda, Offset: 0xb8
// Size: 0x40
function register(uid) {
    elem = new csuccess_screen();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace success_screen/success_screen
// Params 2, eflags: 0x0
// Checksum 0xba30f2f1, Offset: 0x100
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0x39c122f5, Offset: 0x140
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace success_screen/success_screen
// Params 1, eflags: 0x0
// Checksum 0xfa1c3bb7, Offset: 0x168
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

