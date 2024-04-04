// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace ct_shared_ingame_hint;

// Namespace ct_shared_ingame_hint
// Method(s) 8 Total 14
class cct_shared_ingame_hint : cluielem {

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 2, eflags: 0x0
    // Checksum 0x3ad3dde8, Offset: 0x638
    // Size: 0x30
    function set_ingamehint(localclientnum, value) {
        set_data(localclientnum, "inGameHint", value);
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 2, eflags: 0x0
    // Checksum 0xc831c040, Offset: 0x3c0
    // Size: 0x26c
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"fadeout" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        if (#"green" == state_name) {
            set_data(localclientnum, "_state", 2);
            return;
        }
        if (#"grey" == state_name) {
            set_data(localclientnum, "_state", 3);
            return;
        }
        if (#"red" == state_name) {
            set_data(localclientnum, "_state", 4);
            return;
        }
        if (#"green_fadeout" == state_name) {
            set_data(localclientnum, "_state", 5);
            return;
        }
        if (#"grey_fadeout" == state_name) {
            set_data(localclientnum, "_state", 6);
            return;
        }
        if (#"red_fadeout" == state_name) {
            set_data(localclientnum, "_state", 7);
            return;
        }
        if (#"red_paused" == state_name) {
            set_data(localclientnum, "_state", 8);
            return;
        }
        if (#"hash_3d131b584420ca82" == state_name) {
            set_data(localclientnum, "_state", 9);
            return;
        }
        assertmsg("<unknown string>");
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 1, eflags: 0x0
    // Checksum 0xc55bc2d6, Offset: 0x388
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_shared_ingame_hint");
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 1, eflags: 0x0
    // Checksum 0x993198b9, Offset: 0x310
    // Size: 0x6c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
        set_data(localclientnum, "inGameHint", #"");
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 1, eflags: 0x0
    // Checksum 0xf351fa1f, Offset: 0x2e0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_shared_ingame_hint/ct_shared_ingame_hint
    // Params 2, eflags: 0x0
    // Checksum 0x518042bd, Offset: 0x258
    // Size: 0x7c
    function setup_clientfields(uid, var_8384ab7f) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 4, "int");
        cluielem::function_dcb34c80("string", "inGameHint", 1);
    }

}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 2, eflags: 0x0
// Checksum 0x5e9d381a, Offset: 0xc0
// Size: 0x4c
function register(uid, var_8384ab7f) {
    elem = new cct_shared_ingame_hint();
    [[ elem ]]->setup_clientfields(uid, var_8384ab7f);
    return elem;
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0x98100508, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_shared_ingame_hint();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0x29f37bfc, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0x392c5be5, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 1, eflags: 0x0
// Checksum 0xb476e60, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 2, eflags: 0x0
// Checksum 0x9dbcfb7c, Offset: 0x1d8
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace ct_shared_ingame_hint/ct_shared_ingame_hint
// Params 2, eflags: 0x0
// Checksum 0x9a2817a0, Offset: 0x208
// Size: 0x28
function set_ingamehint(localclientnum, value) {
    [[ self ]]->set_ingamehint(localclientnum, value);
}

