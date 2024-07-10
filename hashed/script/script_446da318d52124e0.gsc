#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;

#namespace ct_timer_mod_ticks;

// Namespace ct_timer_mod_ticks
// Method(s) 7 Total 14
class cct_timer_mod_ticks : cluielem {

    var var_47e79fc;

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 2, eflags: 0x0
    // Checksum 0xa389fedf, Offset: 0x530
    // Size: 0x3c
    function set_timemod(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "timeMod", value);
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 2, eflags: 0x0
    // Checksum 0x6a6703ec, Offset: 0x328
    // Size: 0x1fc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"plus" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        if (#"minus" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 2);
            return;
        }
        if (#"plus_destroyedobj" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 3);
            return;
        }
        if (#"plus_dogkill" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 4);
            return;
        }
        if (#"hash_654551b30d95836c" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 5);
            return;
        }
        if (#"plus_multikill" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 6);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 1, eflags: 0x0
    // Checksum 0xc71d7412, Offset: 0x2f8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 2, eflags: 0x0
    // Checksum 0xc47c6532, Offset: 0x2a8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_timer_mod_ticks", persistent);
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 1, eflags: 0x0
    // Checksum 0x54e64423, Offset: 0x228
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 3, "int");
        cluielem::add_clientfield("timeMod", 1, 6, "int");
    }

}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0x3f12fe3d, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new cct_timer_mod_ticks();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 2, eflags: 0x0
// Checksum 0x7da8ac5a, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0xe6901a0e, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0x4746f9f8, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 2, eflags: 0x0
// Checksum 0x5fd00c92, Offset: 0x1a8
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 2, eflags: 0x0
// Checksum 0xf19f2cf1, Offset: 0x1d8
// Size: 0x28
function set_timemod(player, value) {
    [[ self ]]->set_timemod(player, value);
}

