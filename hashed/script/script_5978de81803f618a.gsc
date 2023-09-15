// Atian COD Tools GSC decompiler test
#using scripts\core_common\lui_shared.csc;

#namespace mp_infect_timer;

// Namespace mp_infect_timer
// Method(s) 7 Total 13
class cmp_infect_timer : cluielem {

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 0, eflags: 0x8
    // Checksum 0x3cb618fe, Offset: 0x208
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xb66bef60, Offset: 0x370
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 2, eflags: 0x0
    // Checksum 0xa5f2d1e6, Offset: 0x338
    // Size: 0x30
    function function_8c8674a4(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "infectionTimeRemaining", value);
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 1, eflags: 0x0
    // Checksum 0x661c8e06, Offset: 0x300
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"mp_infect_timer");
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 1, eflags: 0x0
    // Checksum 0xe5247d38, Offset: 0x2b8
    // Size: 0x40
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "infectionTimeRemaining", 0);
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 1, eflags: 0x0
    // Checksum 0xc9323ce3, Offset: 0x288
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 2, eflags: 0x0
    // Checksum 0xcdfd9984, Offset: 0x228
    // Size: 0x54
    function setup_clientfields(uid, var_7682811d) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("infectionTimeRemaining", 15000, 4, "int", var_7682811d);
    }

}

// Namespace mp_infect_timer/mp_infect_timer
// Params 2, eflags: 0x0
// Checksum 0xae1dd65a, Offset: 0xc0
// Size: 0x4c
function register(uid, var_7682811d) {
    elem = new cmp_infect_timer();
    [[ elem ]]->setup_clientfields(uid, var_7682811d);
    return elem;
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0xb3fd2519, Offset: 0x118
// Size: 0x40
function register_clientside(uid) {
    elem = new cmp_infect_timer();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0xe3ea458, Offset: 0x160
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0x3c16360, Offset: 0x188
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0x3606580e, Offset: 0x1b0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 2, eflags: 0x0
// Checksum 0xf16ee281, Offset: 0x1d8
// Size: 0x28
function function_8c8674a4(localclientnum, value) {
    [[ self ]]->function_8c8674a4(localclientnum, value);
}

