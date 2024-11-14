#using scripts\core_common\lui_shared;

#namespace ct_timer_mod_ticks;

// Namespace ct_timer_mod_ticks
// Method(s) 8 Total 14
class cct_timer_mod_ticks : cluielem {

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 2, eflags: 0x0
    // Checksum 0xf44fd624, Offset: 0x578
    // Size: 0x30
    function set_timemod(localclientnum, value) {
        set_data(localclientnum, "timeMod", value);
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 2, eflags: 0x0
    // Checksum 0x593a9c9e, Offset: 0x3a8
    // Size: 0x1c4
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"plus" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"minus" == state_name) {
            set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"plus_destroyedobj" == state_name) {
            set_data(localclientnum, "_state", 3);
            return;
        }
        if (#"plus_dogkill" == state_name) {
            set_data(localclientnum, "_state", 4);
            return;
        }
        if (#"hash_654551b30d95836c" == state_name) {
            set_data(localclientnum, "_state", 5);
            return;
        }
        if (#"plus_multikill" == state_name) {
            set_data(localclientnum, "_state", 6);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 1, eflags: 0x0
    // Checksum 0x3856a1cd, Offset: 0x370
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_timer_mod_ticks");
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 1, eflags: 0x0
    // Checksum 0xe97e35b5, Offset: 0x308
    // Size: 0x60
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
        set_data(localclientnum, "timeMod", 0);
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 1, eflags: 0x0
    // Checksum 0x23da378c, Offset: 0x2d8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_timer_mod_ticks/ct_timer_mod_ticks
    // Params 2, eflags: 0x0
    // Checksum 0x24b36ff5, Offset: 0x250
    // Size: 0x7c
    function setup_clientfields(uid, var_2b2f0c89) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 3, "int");
        cluielem::add_clientfield("timeMod", 1, 6, "int", var_2b2f0c89);
    }

}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 2, eflags: 0x0
// Checksum 0x7d853c59, Offset: 0xb8
// Size: 0x4c
function register(uid, var_2b2f0c89) {
    elem = new cct_timer_mod_ticks();
    [[ elem ]]->setup_clientfields(uid, var_2b2f0c89);
    return elem;
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0xdb8f4d7f, Offset: 0x110
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_timer_mod_ticks();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0xf00de01b, Offset: 0x158
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0x82e5f13c, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 1, eflags: 0x0
// Checksum 0x615c3b8d, Offset: 0x1a8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 2, eflags: 0x0
// Checksum 0xafa1a19, Offset: 0x1d0
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace ct_timer_mod_ticks/ct_timer_mod_ticks
// Params 2, eflags: 0x0
// Checksum 0x79c8f290, Offset: 0x200
// Size: 0x28
function set_timemod(localclientnum, value) {
    [[ self ]]->set_timemod(localclientnum, value);
}

