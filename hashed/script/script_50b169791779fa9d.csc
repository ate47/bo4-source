#using scripts\core_common\lui_shared;

#namespace ct_shared_warning;

// Namespace ct_shared_warning
// Method(s) 8 Total 14
class cct_shared_warning : cluielem {

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 2, eflags: 0x0
    // Checksum 0xcecd049, Offset: 0x5e8
    // Size: 0x30
    function set_objpoints(localclientnum, value) {
        set_data(localclientnum, "objpoints", value);
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 2, eflags: 0x0
    // Checksum 0xea7a955c, Offset: 0x3a8
    // Size: 0x234
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"warnheal_fadeout" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"hash_5e59fb81ffd2fd6b" == state_name) {
            set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"hash_4d78e6d4caf789ce" == state_name) {
            set_data(localclientnum, "_state", 3);
            return;
        }
        if (#"warnheal" == state_name) {
            set_data(localclientnum, "_state", 4);
            return;
        }
        if (#"warnheal_cycle1" == state_name) {
            set_data(localclientnum, "_state", 5);
            return;
        }
        if (#"warnheal_cycle2" == state_name) {
            set_data(localclientnum, "_state", 6);
            return;
        }
        if (#"hash_5ae2f5a909a5efa9" == state_name) {
            set_data(localclientnum, "_state", 7);
            return;
        }
        if (#"hash_5ae2f2a909a5ea90" == state_name) {
            set_data(localclientnum, "_state", 8);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 1, eflags: 0x0
    // Checksum 0x7c5e79ef, Offset: 0x370
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_shared_warning");
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 1, eflags: 0x0
    // Checksum 0xa6587b89, Offset: 0x308
    // Size: 0x60
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
        set_data(localclientnum, "objpoints", 0);
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 1, eflags: 0x0
    // Checksum 0x76103509, Offset: 0x2d8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 2, eflags: 0x0
    // Checksum 0xb40e93d6, Offset: 0x250
    // Size: 0x7c
    function setup_clientfields(uid, var_ea26adc8) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::add_clientfield("objpoints", 1, 11, "int", var_ea26adc8);
    }

}

// Namespace ct_shared_warning/ct_shared_warning
// Params 2, eflags: 0x0
// Checksum 0x675c08e2, Offset: 0xb8
// Size: 0x4c
function register(uid, var_ea26adc8) {
    elem = new cct_shared_warning();
    [[ elem ]]->setup_clientfields(uid, var_ea26adc8);
    return elem;
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1, eflags: 0x0
// Checksum 0x78580f82, Offset: 0x110
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_shared_warning();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1, eflags: 0x0
// Checksum 0xca6f5bff, Offset: 0x158
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1, eflags: 0x0
// Checksum 0x2633b8c, Offset: 0x180
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1, eflags: 0x0
// Checksum 0xc4994707, Offset: 0x1a8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 2, eflags: 0x0
// Checksum 0xeed2b638, Offset: 0x1d0
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 2, eflags: 0x0
// Checksum 0x75c43348, Offset: 0x200
// Size: 0x28
function set_objpoints(localclientnum, value) {
    [[ self ]]->set_objpoints(localclientnum, value);
}

