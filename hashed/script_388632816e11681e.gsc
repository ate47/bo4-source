// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace mp_infect_timer;

// Namespace mp_infect_timer
// Method(s) 6 Total 13
class cmp_infect_timer : cluielem {

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 0, eflags: 0x8
    // Checksum 0xef345fd7, Offset: 0x1e0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xa88732c1, Offset: 0x320
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 2, eflags: 0x0
    // Checksum 0x800210c9, Offset: 0x2d8
    // Size: 0x3c
    function function_8c8674a4(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "infectionTimeRemaining", value);
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 1, eflags: 0x0
    // Checksum 0x73a0aa5f, Offset: 0x2a8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 2, eflags: 0x0
    // Checksum 0x3d81944c, Offset: 0x258
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "mp_infect_timer", persistent);
    }

    // Namespace cmp_infect_timer/mp_infect_timer
    // Params 1, eflags: 0x0
    // Checksum 0xace91bc8, Offset: 0x200
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("infectionTimeRemaining", 15000, 4, "int", 0);
    }

}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0xd131e89c, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new cmp_infect_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 2, eflags: 0x0
// Checksum 0x2c6a30cf, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0x6b37a554, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 1, eflags: 0x0
// Checksum 0x8ef4b7e5, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace mp_infect_timer/mp_infect_timer
// Params 2, eflags: 0x0
// Checksum 0x8d3d4158, Offset: 0x1b0
// Size: 0x28
function function_8c8674a4(player, value) {
    [[ self ]]->function_8c8674a4(player, value);
}

