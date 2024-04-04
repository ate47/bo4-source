// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace wz_revive_prompt;

// Namespace wz_revive_prompt
// Method(s) 10 Total 16
class cwz_revive_prompt : cluielem {

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb7cf891f, Offset: 0x5c0
    // Size: 0x30
    function set_cowardsway(localclientnum, value) {
        set_data(localclientnum, "cowardsWay", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0xaee2342, Offset: 0x588
    // Size: 0x30
    function set_reviveprogress(localclientnum, value) {
        set_data(localclientnum, "reviveProgress", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0x9481cd05, Offset: 0x550
    // Size: 0x30
    function set_health(localclientnum, value) {
        set_data(localclientnum, "health", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1f3ca30b, Offset: 0x518
    // Size: 0x30
    function set_clientnum(localclientnum, value) {
        set_data(localclientnum, "clientnum", value);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 1, eflags: 0x1 linked
    // Checksum 0x34c71d1b, Offset: 0x4e0
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"wz_revive_prompt");
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 1, eflags: 0x1 linked
    // Checksum 0x54e50c91, Offset: 0x430
    // Size: 0xa4
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        set_data(localclientnum, "clientnum", 0);
        set_data(localclientnum, "health", 0);
        set_data(localclientnum, "reviveProgress", 0);
        set_data(localclientnum, "cowardsWay", 0);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 1, eflags: 0x1 linked
    // Checksum 0x96dcc47a, Offset: 0x400
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cwz_revive_prompt/wz_revive_prompt
    // Params 6, eflags: 0x1 linked
    // Checksum 0x6cac4af6, Offset: 0x308
    // Size: 0xec
    function setup_clientfields(uid, var_c05c67e2, healthcallback, var_d65e5a18, var_f228b5fa, var_7cb8f98a) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("clientnum", 1, 7, "int", var_c05c67e2);
        cluielem::add_clientfield("health", 1, 5, "float", healthcallback);
        cluielem::add_clientfield("reviveProgress", 1, 5, "float", var_d65e5a18);
        cluielem::add_clientfield("cowardsWay", 17000, 1, "int", var_7cb8f98a);
    }

}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 6, eflags: 0x1 linked
// Checksum 0xb4a67d89, Offset: 0xe0
// Size: 0x7c
function register(uid, var_c05c67e2, healthcallback, var_d65e5a18, var_f228b5fa, var_7cb8f98a) {
    elem = new cwz_revive_prompt();
    [[ elem ]]->setup_clientfields(uid, var_c05c67e2, healthcallback, var_d65e5a18, var_f228b5fa, var_7cb8f98a);
    return elem;
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0xfad9fc1c, Offset: 0x168
// Size: 0x40
function register_clientside(uid) {
    elem = new cwz_revive_prompt();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x44e9a4fe, Offset: 0x1b0
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0xb00c27ca, Offset: 0x1d8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 1, eflags: 0x0
// Checksum 0x1a470293, Offset: 0x200
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0xcf89d320, Offset: 0x228
// Size: 0x28
function set_clientnum(localclientnum, value) {
    [[ self ]]->set_clientnum(localclientnum, value);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x65f94891, Offset: 0x258
// Size: 0x28
function set_health(localclientnum, value) {
    [[ self ]]->set_health(localclientnum, value);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0xb89f71b7, Offset: 0x288
// Size: 0x28
function set_reviveprogress(localclientnum, value) {
    [[ self ]]->set_reviveprogress(localclientnum, value);
}

// Namespace wz_revive_prompt/wz_revive_prompt
// Params 2, eflags: 0x0
// Checksum 0x42056bd3, Offset: 0x2b8
// Size: 0x28
function set_cowardsway(localclientnum, value) {
    [[ self ]]->set_cowardsway(localclientnum, value);
}

