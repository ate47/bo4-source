// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace mp_prop_timer;

// Namespace mp_prop_timer
// Method(s) 8 Total 14
class cmp_prop_timer : cluielem {

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 0, eflags: 0x8
    // Checksum 0xac46c36c, Offset: 0x240
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x65042f7c, Offset: 0x430
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 2, eflags: 0x0
    // Checksum 0xdab05039, Offset: 0x3f8
    // Size: 0x30
    function set_isprop(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "isProp", value);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 2, eflags: 0x0
    // Checksum 0x942688b, Offset: 0x3c0
    // Size: 0x30
    function set_timeremaining(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "timeRemaining", value);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 1, eflags: 0x0
    // Checksum 0x1035bc4f, Offset: 0x388
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"mp_prop_timer");
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 1, eflags: 0x0
    // Checksum 0x6aecbdb5, Offset: 0x320
    // Size: 0x5c
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "timeRemaining", 0);
        [[ self ]]->set_data(localclientnum, "isProp", 0);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 1, eflags: 0x0
    // Checksum 0x7b012251, Offset: 0x2f0
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cmp_prop_timer/mp_prop_timer
    // Params 3, eflags: 0x0
    // Checksum 0x9f9d967d, Offset: 0x260
    // Size: 0x84
    function setup_clientfields(uid, var_43c7e6f7, var_6fb92716) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("timeRemaining", 16000, 5, "int", var_43c7e6f7);
        cluielem::add_clientfield("isProp", 16000, 1, "int", var_6fb92716);
    }

}

// Namespace mp_prop_timer/mp_prop_timer
// Params 3, eflags: 0x0
// Checksum 0xd63b5f49, Offset: 0xc0
// Size: 0x58
function register(uid, var_43c7e6f7, var_6fb92716) {
    elem = new cmp_prop_timer();
    [[ elem ]]->setup_clientfields(uid, var_43c7e6f7, var_6fb92716);
    return elem;
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0x1cb70698, Offset: 0x120
// Size: 0x40
function register_clientside(uid) {
    elem = new cmp_prop_timer();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0xbf86b356, Offset: 0x168
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0x27045a6a, Offset: 0x190
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 1, eflags: 0x0
// Checksum 0x42404214, Offset: 0x1b8
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 2, eflags: 0x0
// Checksum 0xb02543fc, Offset: 0x1e0
// Size: 0x28
function set_timeremaining(localclientnum, value) {
    [[ self ]]->set_timeremaining(localclientnum, value);
}

// Namespace mp_prop_timer/mp_prop_timer
// Params 2, eflags: 0x0
// Checksum 0x494630c8, Offset: 0x210
// Size: 0x28
function set_isprop(localclientnum, value) {
    [[ self ]]->set_isprop(localclientnum, value);
}

