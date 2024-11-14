#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace mp_prop_timer;

// Namespace mp_prop_timer
// Method(s) 7 Total 14
class cmp_prop_timer : cluielem {

    var var_47e79fc;

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 2, eflags: 0x0
    // Checksum 0xe3ae3806, Offset: 0x378
    // Size: 0x3c
    function set_isprop(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "isProp", value);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 2, eflags: 0x0
    // Checksum 0x81ca0d4c, Offset: 0x330
    // Size: 0x3c
    function set_timeremaining(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "timeRemaining", value);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 1, eflags: 0x0
    // Checksum 0x4eaaea3b, Offset: 0x300
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 2, eflags: 0x0
    // Checksum 0xbe5643e, Offset: 0x2b0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "mp_prop_timer", persistent);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 1, eflags: 0x0
    // Checksum 0xab4dceed, Offset: 0x230
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("timeRemaining", 16000, 5, "int", 0);
        cluielem::add_clientfield("isProp", 16000, 1, "int");
    }

}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0x83a467a5, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new cmp_prop_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 2, eflags: 0x0
// Checksum 0xa64d052, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0x6a1278b6, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0xbb8ed28b, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 2, eflags: 0x0
// Checksum 0x4a034187, Offset: 0x1b0
// Size: 0x28
function set_timeremaining(player, value) {
    [[ self ]]->set_timeremaining(player, value);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 2, eflags: 0x0
// Checksum 0xbe7d7888, Offset: 0x1e0
// Size: 0x28
function set_isprop(player, value) {
    [[ self ]]->set_isprop(player, value);
}

