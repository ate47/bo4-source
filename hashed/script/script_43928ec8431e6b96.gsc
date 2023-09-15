// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace ct_shared_button_prompt;

// Namespace ct_shared_button_prompt
// Method(s) 7 Total 13
class cct_shared_button_prompt : cluielem {

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 0, eflags: 0x8
    // Checksum 0x544fc580, Offset: 0x1e8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x383f3898, Offset: 0x718
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_shared_button_prompt/ct_shared_button_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x854970ef, Offset: 0x318
    // Size: 0x3f4
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
        } else if (#"smoke_button" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
        } else if (#"frag_button" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 2);
        } else if (#"hash_321379c3a0d01a39" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 3);
        } else if (#"hash_39ade572f801d7d0" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 4);
        } else if (#"x_button" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 5);
        } else if (#"hash_554e932bc3ab8c3e" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 6);
        } else if (#"hash_15620c895dcec00e" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 7);
        } else if (#"hash_2cb5a2ce94a6ee6d" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 8);
        } else if (#"hash_4df4fd56580d5967" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 9);
        } else if (#"hash_343bc60e8e1af20d" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 10);
        } else if (#"hash_35030aa3c799fe40" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 11);
        } else if (#"hash_2269874f1c7c7493" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 12);
        } else if (#"square_button" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 13);
        } else if (#"hash_72d4665454938ae" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 14);
        } else if (#"hash_1e3e2411c866b2a0" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 15);
        } else if (#"hash_55f9c9d7bfc38059" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 16);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
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
        [[ self ]]->set_state(localclientnum, #"defaultstate");
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

