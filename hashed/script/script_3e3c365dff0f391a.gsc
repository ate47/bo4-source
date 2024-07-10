#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace fail_screen;

// Namespace fail_screen
// Method(s) 5 Total 12
class cfail_screen : cluielem {

    // Namespace cfail_screen/fail_screen
    // Params 1, eflags: 0x0
    // Checksum 0x6a16fbdd, Offset: 0x228
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cfail_screen/fail_screen
    // Params 2, eflags: 0x0
    // Checksum 0xacc65bf7, Offset: 0x1d8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "fail_screen", persistent);
    }

    // Namespace cfail_screen/fail_screen
    // Params 1, eflags: 0x0
    // Checksum 0xab2ba741, Offset: 0x1a8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace fail_screen/fail_screen
// Params 1, eflags: 0x0
// Checksum 0x18af3e38, Offset: 0xb0
// Size: 0x40
function register(uid) {
    elem = new cfail_screen();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace fail_screen/fail_screen
// Params 2, eflags: 0x0
// Checksum 0x72e7bd7e, Offset: 0xf8
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace fail_screen/fail_screen
// Params 1, eflags: 0x0
// Checksum 0x5802c75f, Offset: 0x138
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace fail_screen/fail_screen
// Params 1, eflags: 0x0
// Checksum 0xedf23ab5, Offset: 0x160
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

