// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace revive_hud;

// Namespace revive_hud
// Method(s) 9 Total 15
class crevive_hud : cluielem {

    // Namespace crevive_hud/revive_hud
    // Params 0, eflags: 0x8
    // Checksum 0xf160f090, Offset: 0x288
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace crevive_hud/revive_hud
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xbc2fe78d, Offset: 0x508
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace crevive_hud/revive_hud
    // Params 2, eflags: 0x0
    // Checksum 0xfffa0b09, Offset: 0x4d0
    // Size: 0x30
    function set_fadetime(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "fadeTime", value);
    }

    // Namespace crevive_hud/revive_hud
    // Params 2, eflags: 0x0
    // Checksum 0xc098c761, Offset: 0x498
    // Size: 0x30
    function set_clientnum(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "clientNum", value);
    }

    // Namespace crevive_hud/revive_hud
    // Params 2, eflags: 0x0
    // Checksum 0x3d1c9a0e, Offset: 0x460
    // Size: 0x30
    function set_text(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "text", value);
    }

    // Namespace crevive_hud/revive_hud
    // Params 1, eflags: 0x0
    // Checksum 0xb859d4c2, Offset: 0x428
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"revive_hud");
    }

    // Namespace crevive_hud/revive_hud
    // Params 1, eflags: 0x0
    // Checksum 0xe11d356f, Offset: 0x398
    // Size: 0x84
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "text", #"hash_0");
        [[ self ]]->set_data(localclientnum, "clientNum", 0);
        [[ self ]]->set_data(localclientnum, "fadeTime", 0);
    }

    // Namespace crevive_hud/revive_hud
    // Params 1, eflags: 0x0
    // Checksum 0xbb6bcae6, Offset: 0x368
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace crevive_hud/revive_hud
    // Params 4, eflags: 0x0
    // Checksum 0x218c541, Offset: 0x2a8
    // Size: 0xb4
    function setup_clientfields(uid, var_f5852d69, var_c05c67e2, var_415094af) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("string", "text", 1);
        cluielem::add_clientfield("clientNum", 1, 6, "int", var_c05c67e2);
        cluielem::add_clientfield("fadeTime", 1, 5, "int", var_415094af);
    }

}

// Namespace revive_hud/revive_hud
// Params 4, eflags: 0x0
// Checksum 0xf79b02de, Offset: 0xc8
// Size: 0x64
function register(uid, var_f5852d69, var_c05c67e2, var_415094af) {
    elem = new crevive_hud();
    [[ elem ]]->setup_clientfields(uid, var_f5852d69, var_c05c67e2, var_415094af);
    return elem;
}

// Namespace revive_hud/revive_hud
// Params 1, eflags: 0x0
// Checksum 0xa79d4f92, Offset: 0x138
// Size: 0x40
function register_clientside(uid) {
    elem = new crevive_hud();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace revive_hud/revive_hud
// Params 1, eflags: 0x0
// Checksum 0xf2afc202, Offset: 0x180
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace revive_hud/revive_hud
// Params 1, eflags: 0x0
// Checksum 0xd7b2f8c5, Offset: 0x1a8
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace revive_hud/revive_hud
// Params 1, eflags: 0x0
// Checksum 0x894acd8a, Offset: 0x1d0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace revive_hud/revive_hud
// Params 2, eflags: 0x0
// Checksum 0x4766f76b, Offset: 0x1f8
// Size: 0x28
function set_text(localclientnum, value) {
    [[ self ]]->set_text(localclientnum, value);
}

// Namespace revive_hud/revive_hud
// Params 2, eflags: 0x0
// Checksum 0x2f71a5f8, Offset: 0x228
// Size: 0x28
function set_clientnum(localclientnum, value) {
    [[ self ]]->set_clientnum(localclientnum, value);
}

// Namespace revive_hud/revive_hud
// Params 2, eflags: 0x0
// Checksum 0x2127309d, Offset: 0x258
// Size: 0x28
function set_fadetime(localclientnum, value) {
    [[ self ]]->set_fadetime(localclientnum, value);
}

