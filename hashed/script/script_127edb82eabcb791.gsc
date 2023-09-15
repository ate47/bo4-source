// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace ct_firebreak_multi_kill;

// Namespace ct_firebreak_multi_kill
// Method(s) 6 Total 12
class cct_firebreak_multi_kill : cluielem {

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 0, eflags: 0x8
    // Checksum 0xcdd8bf00, Offset: 0x1a8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xa0040272, Offset: 0x290
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 1, eflags: 0x0
    // Checksum 0xf0a6c6c4, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_firebreak_multi_kill");
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 1, eflags: 0x0
    // Checksum 0x4cb89252, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 1, eflags: 0x0
    // Checksum 0xbb3e3e47, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_firebreak_multi_kill/ct_firebreak_multi_kill
    // Params 1, eflags: 0x0
    // Checksum 0xaadce22d, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0x5bf02508, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cct_firebreak_multi_kill();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0xcd6ebb5d, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_firebreak_multi_kill();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0xe739fac, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0x3bf24d65, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_firebreak_multi_kill/ct_firebreak_multi_kill
// Params 1, eflags: 0x0
// Checksum 0x2245903b, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

