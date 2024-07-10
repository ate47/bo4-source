#using scripts\core_common\lui_shared.csc;

#namespace ct_shared_button_prompt;

// Namespace ct_shared_button_prompt
// Method(s) 7 Total 13
class cct_shared_button_prompt : cluielem {

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x854970ef, Offset: 0x318
    // Size: 0x3f4
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"smoke_button" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"frag_button" == state_name) {
            set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"hash_321379c3a0d01a39" == state_name) {
            set_data(localclientnum, "_state", 3);
            return;
        }
        if (#"hash_39ade572f801d7d0" == state_name) {
            set_data(localclientnum, "_state", 4);
            return;
        }
        if (#"x_button" == state_name) {
            set_data(localclientnum, "_state", 5);
            return;
        }
        if (#"hash_554e932bc3ab8c3e" == state_name) {
            set_data(localclientnum, "_state", 6);
            return;
        }
        if (#"hash_15620c895dcec00e" == state_name) {
            set_data(localclientnum, "_state", 7);
            return;
        }
        if (#"hash_2cb5a2ce94a6ee6d" == state_name) {
            set_data(localclientnum, "_state", 8);
            return;
        }
        if (#"hash_4df4fd56580d5967" == state_name) {
            set_data(localclientnum, "_state", 9);
            return;
        }
        if (#"hash_343bc60e8e1af20d" == state_name) {
            set_data(localclientnum, "_state", 10);
            return;
        }
        if (#"hash_35030aa3c799fe40" == state_name) {
            set_data(localclientnum, "_state", 11);
            return;
        }
        if (#"hash_2269874f1c7c7493" == state_name) {
            set_data(localclientnum, "_state", 12);
            return;
        }
        if (#"square_button" == state_name) {
            set_data(localclientnum, "_state", 13);
            return;
        }
        if (#"square_button_paused" == state_name) {
            set_data(localclientnum, "_state", 14);
            return;
        }
        if (#"hash_1e3e2411c866b2a0" == state_name) {
            set_data(localclientnum, "_state", 15);
            return;
        }
        if (#"hash_55f9c9d7bfc38059" == state_name) {
            set_data(localclientnum, "_state", 16);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 1, eflags: 0x0
    // Checksum 0xcc88b59d, Offset: 0x2e0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_shared_button_prompt");
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x62e46cfa, Offset: 0x290
    // Size: 0x44
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x706cf58e, Offset: 0x260
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 1, eflags: 0x0
    // Checksum 0xf9a20d6b, Offset: 0x208
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 5, "int");
    }

}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0x56f02918, Offset: 0xb0
// Size: 0x40
function register(uid) {
    elem = new cct_shared_button_prompt();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0x962c4ce6, Offset: 0xf8
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_shared_button_prompt();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0xbb3164ce, Offset: 0x140
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0xec20b0a, Offset: 0x168
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 1, eflags: 0x0
// Checksum 0xe8664c18, Offset: 0x190
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace ct_shared_button_prompt/ct_shared_button_prompt
// Params 2, eflags: 0x0
// Checksum 0x4859a3ea, Offset: 0x1b8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

