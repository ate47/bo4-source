// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace prototype_defend_timer;

// Namespace prototype_defend_timer
// Method(s) 6 Total 12
class cprototype_defend_timer : cluielem {

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 0, eflags: 0x8
    // Checksum 0xed05de0a, Offset: 0x1a8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x6578cfa4, Offset: 0x290
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 1, eflags: 0x0
    // Checksum 0x5f7ebddf, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"prototype_defend_timer");
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 1, eflags: 0x0
    // Checksum 0x8caeda1, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 1, eflags: 0x0
    // Checksum 0xc7ed1123, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cprototype_defend_timer/prototype_defend_timer
    // Params 1, eflags: 0x0
    // Checksum 0x48f17400, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x6d91bcf2, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cprototype_defend_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x8b975e97, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cprototype_defend_timer();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x7fc91c37, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x8f3cfc34, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace prototype_defend_timer/prototype_defend_timer
// Params 1, eflags: 0x0
// Checksum 0x9a666015, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

