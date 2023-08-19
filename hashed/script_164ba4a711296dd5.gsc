// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace insertion_passenger_count;

// Namespace insertion_passenger_count
// Method(s) 6 Total 13
class cinsertion_passenger_count : cluielem {

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 0, eflags: 0x9 linked
    // Checksum 0xba011c7c, Offset: 0x1d8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x59338f25, Offset: 0x318
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1bddc49c, Offset: 0x2d0
    // Size: 0x3c
    function set_count(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "count", value);
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 1, eflags: 0x1 linked
    // Checksum 0x87f619d3, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1031fac8, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "insertion_passenger_count", persistent);
    }

    // Namespace cinsertion_passenger_count/insertion_passenger_count
    // Params 1, eflags: 0x1 linked
    // Checksum 0x10fa8c8e, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("count", 1, 7, "int");
    }

}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x1 linked
// Checksum 0x84cd9378, Offset: 0xd0
// Size: 0x40
function register(uid) {
    elem = new cinsertion_passenger_count();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 2, eflags: 0x1 linked
// Checksum 0x1cd6fdc2, Offset: 0x118
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x1 linked
// Checksum 0x60d27e45, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 1, eflags: 0x1 linked
// Checksum 0xbaf02567, Offset: 0x180
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace insertion_passenger_count/insertion_passenger_count
// Params 2, eflags: 0x1 linked
// Checksum 0x6dfe2ff4, Offset: 0x1a8
// Size: 0x28
function set_count(player, value) {
    [[ self ]]->set_count(player, value);
}

