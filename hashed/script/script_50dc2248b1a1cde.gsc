// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace zm_towers_challenges_hud;

// Namespace zm_towers_challenges_hud
// Method(s) 10 Total 16
class czm_towers_challenges_hud : cluielem {

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0xc8477c11, Offset: 0x618
    // Size: 0x30
    function set_required_goal(localclientnum, value) {
        set_data(localclientnum, "required_goal", value);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0x4d4750bb, Offset: 0x5e0
    // Size: 0x30
    function set_challenge_text(localclientnum, value) {
        set_data(localclientnum, "challenge_text", value);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0x4408084f, Offset: 0x5a8
    // Size: 0x30
    function set_progress(localclientnum, value) {
        set_data(localclientnum, "progress", value);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0xfe25f32, Offset: 0x4f0
    // Size: 0xac
    function set_state(localclientnum, state_name) {
        if (#"defaultstate" == state_name) {
            set_data(localclientnum, "_state", 0);
            return;
        }
        if (#"hidden" == state_name) {
            set_data(localclientnum, "_state", 1);
            return;
        }
        assertmsg("<unknown string>");
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 1, eflags: 0x0
    // Checksum 0x4deb17c3, Offset: 0x4b8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_towers_challenges_hud");
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 1, eflags: 0x0
    // Checksum 0x33f484dc, Offset: 0x408
    // Size: 0xa8
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_state(localclientnum, #"defaultstate");
        set_data(localclientnum, "progress", 0);
        set_data(localclientnum, "challenge_text", #"");
        set_data(localclientnum, "required_goal", 0);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 1, eflags: 0x0
    // Checksum 0xf1b271e3, Offset: 0x3d8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 4, eflags: 0x0
    // Checksum 0x23e26286, Offset: 0x2f0
    // Size: 0xdc
    function setup_clientfields(uid, progresscallback, var_c00108aa, var_db844c2) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::add_clientfield("progress", 1, 7, "int", progresscallback);
        cluielem::function_dcb34c80("string", "challenge_text", 1);
        cluielem::add_clientfield("required_goal", 1, 7, "int", var_db844c2);
    }

}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 4, eflags: 0x0
// Checksum 0xf934108c, Offset: 0xe0
// Size: 0x64
function register(uid, progresscallback, var_c00108aa, var_db844c2) {
    elem = new czm_towers_challenges_hud();
    [[ elem ]]->setup_clientfields(uid, progresscallback, var_c00108aa, var_db844c2);
    return elem;
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xe9829b6b, Offset: 0x150
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_towers_challenges_hud();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xda63fcb5, Offset: 0x198
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0x56fc7192, Offset: 0x1c0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0x81c4f12f, Offset: 0x1e8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x1b16e4de, Offset: 0x210
// Size: 0x28
function set_state(localclientnum, state_name) {
    [[ self ]]->set_state(localclientnum, state_name);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x4dc977cb, Offset: 0x240
// Size: 0x28
function set_progress(localclientnum, value) {
    [[ self ]]->set_progress(localclientnum, value);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x5b4c1701, Offset: 0x270
// Size: 0x28
function set_challenge_text(localclientnum, value) {
    [[ self ]]->set_challenge_text(localclientnum, value);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xca367f0e, Offset: 0x2a0
// Size: 0x28
function set_required_goal(localclientnum, value) {
    [[ self ]]->set_required_goal(localclientnum, value);
}

