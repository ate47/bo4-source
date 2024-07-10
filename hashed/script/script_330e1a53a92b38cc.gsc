#using scripts\core_common\lui_shared.csc;

#namespace mp_revive_prompt;

// Namespace mp_revive_prompt
// Method(s) 9 Total 15
class cmp_revive_prompt : cluielem {

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x198c90fe, Offset: 0x4e8
    // Size: 0x30
    function set_reviveprogress(localclientnum, value) {
        set_data(localclientnum, "reviveProgress", value);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0x4037c452, Offset: 0x4b0
    // Size: 0x30
    function set_health(localclientnum, value) {
        set_data(localclientnum, "health", value);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 2, eflags: 0x0
    // Checksum 0xaf955006, Offset: 0x478
    // Size: 0x30
    function set_clientnum(localclientnum, value) {
        set_data(localclientnum, "clientnum", value);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x9d9badd0, Offset: 0x440
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"mp_revive_prompt");
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 1, eflags: 0x0
    // Checksum 0x1a8eb7d0, Offset: 0x3b0
    // Size: 0x88
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "clientnum", 0);
        set_data(localclientnum, "health", 0);
        set_data(localclientnum, "reviveProgress", 0);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 1, eflags: 0x0
    // Checksum 0xfe6ff779, Offset: 0x380
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cmp_revive_prompt/mp_revive_prompt
    // Params 5, eflags: 0x0
    // Checksum 0xbd3a10cb, Offset: 0x2b8
    // Size: 0xbc
    function setup_clientfields(uid, var_c05c67e2, healthcallback, var_d65e5a18, var_f228b5fa) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int", var_c05c67e2);
        cluielem::add_clientfield("health", 1, 5, "float", healthcallback);
        cluielem::add_clientfield("reviveProgress", 1, 5, "float", var_d65e5a18);
    }

}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 5, eflags: 0x0
// Checksum 0xcc5e78fa, Offset: 0xd0
// Size: 0x70
function register(uid, var_c05c67e2, healthcallback, var_d65e5a18, var_f228b5fa) {
    elem = new cmp_revive_prompt();
    [[ elem ]]->setup_clientfields(uid, var_c05c67e2, healthcallback, var_d65e5a18, var_f228b5fa);
    return elem;
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x29998f8b, Offset: 0x148
// Size: 0x40
function register_clientside(uid) {
    elem = new cmp_revive_prompt();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x29f40fb7, Offset: 0x190
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x407aea09, Offset: 0x1b8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x3f12ca4, Offset: 0x1e0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0xc832ab69, Offset: 0x208
// Size: 0x28
function set_clientnum(localclientnum, value) {
    [[ self ]]->set_clientnum(localclientnum, value);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0xdcc0b1a1, Offset: 0x238
// Size: 0x28
function set_health(localclientnum, value) {
    [[ self ]]->set_health(localclientnum, value);
}

// Namespace mp_revive_prompt/mp_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x974427b7, Offset: 0x268
// Size: 0x28
function set_reviveprogress(localclientnum, value) {
    [[ self ]]->set_reviveprogress(localclientnum, value);
}

