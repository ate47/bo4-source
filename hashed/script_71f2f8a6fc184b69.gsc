// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace insertion_passenger_count;

// Namespace insertion_passenger_count
// Method(s) 7 Total 13
class cinsertion_passenger_count : cluielem {

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 0, eflags: 0x9 linked
    // Checksum 0x4f07467, Offset: 0x1f0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0xbe7d7daa, Offset: 0x358
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 2, eflags: 0x1 linked
    // Checksum 0x2966892c, Offset: 0x320
    // Size: 0x30
    function set_count(localclientnum, value) {
        [[ self ]]->set_data(localclientnum, "count", value);
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 1, eflags: 0x1 linked
    // Checksum 0x515377c3, Offset: 0x2e8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"insertion_passenger_count");
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 1, eflags: 0x1 linked
    // Checksum 0xffe3b3db, Offset: 0x2a0
    // Size: 0x40
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "count", 0);
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2a2cfaaf, Offset: 0x270
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 2, eflags: 0x1 linked
    // Checksum 0x75b74d01, Offset: 0x210
    // Size: 0x54
    function setup_clientfields(uid, var_fbcc4763) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("count", 1, 7, "int", var_fbcc4763);
    }

}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 2, eflags: 0x1 linked
// Checksum 0x17db45a3, Offset: 0xa8
// Size: 0x4c
function register(uid, var_fbcc4763) {
    elem = new cinsertion_passenger_count();
    [[ elem ]]->setup_clientfields(uid, var_fbcc4763);
    return elem;
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x0
// Checksum 0x7f774449, Offset: 0x100
// Size: 0x40
function register_clientside(uid) {
    elem = new cinsertion_passenger_count();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x0
// Checksum 0xb2c98bb5, Offset: 0x148
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x0
// Checksum 0xad6abcf6, Offset: 0x170
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x0
// Checksum 0xa9d3cced, Offset: 0x198
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 2, eflags: 0x0
// Checksum 0x99e6eac4, Offset: 0x1c0
// Size: 0x28
function set_count(localclientnum, value) {
    [[ self ]]->set_count(localclientnum, value);
}

