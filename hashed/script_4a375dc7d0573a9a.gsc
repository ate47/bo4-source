// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace zm_tut_hint_text;

// Namespace zm_tut_hint_text
// Method(s) 8 Total 14
class czm_tut_hint_text : cluielem {

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 0, eflags: 0x8
    // Checksum 0xb598b50d, Offset: 0x238
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xeca5f4e4, Offset: 0x4b0
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 2, eflags: 0x0
    // Checksum 0x1a05bcb, Offset: 0x478
    // Size: 0x30
    function set_text(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "text", value);
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 2, eflags: 0x0
    // Checksum 0xdbf84f73, Offset: 0x3c0
    // Size: 0xac
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 0);
        } else if (#"visible" == state_name) {
            [[ self ]]->set_data(localclientnum, "_state", 1);
        } else {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
        }
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 1, eflags: 0x0
    // Checksum 0x2a57e68f, Offset: 0x388
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_tut_hint_text");
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 1, eflags: 0x0
    // Checksum 0x655a5c6f, Offset: 0x310
    // Size: 0x6c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_state(localclientnum, #"defaultstate");
        [[ self ]]->set_data(localclientnum, "text", #"hash_0");
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 1, eflags: 0x0
    // Checksum 0xbb97785a, Offset: 0x2e0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_tut_hint_text/zm_tut_hint_text
    // Params 2, eflags: 0x0
    // Checksum 0x47fa5e35, Offset: 0x258
    // Size: 0x7c
    function setup_clientfields(uid, var_f5852d69) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::function_dcb34c80("string", "text", 1);
    }

}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 2, eflags: 0x0
// Checksum 0x273f94fa, Offset: 0xc0
// Size: 0x4c
function register(uid, var_f5852d69) {
    elem = new czm_tut_hint_text();
    [[ elem ]]->setup_clientfields(uid, var_f5852d69);
    return elem;
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0x241fe201, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_tut_hint_text();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0x849f970a, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0xc2a5a3f4, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 1, eflags: 0x0
// Checksum 0x17b35ec0, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 2, eflags: 0x0
// Checksum 0x7a56bd73, Offset: 0x1d8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace zm_tut_hint_text/zm_tut_hint_text
// Params 2, eflags: 0x0
// Checksum 0x285228dd, Offset: 0x208
// Size: 0x28
function set_text(localclientnum, value) {
    [[ self ]]->set_text(localclientnum, value);
}

