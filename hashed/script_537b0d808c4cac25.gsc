// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace self_revive_visuals_rush;

// Namespace self_revive_visuals_rush
// Method(s) 6 Total 13
class cself_revive_visuals_rush : cluielem {

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 0, eflags: 0x8
    // Checksum 0x86ec5c37, Offset: 0x1e0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xc1b63a66, Offset: 0x320
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 2, eflags: 0x0
    // Checksum 0x21211ea8, Offset: 0x2d8
    // Size: 0x3c
    function set_revive_time(player, value) {
        player clientfield::function_9bf78ef8(self.var_47e79fc, "revive_time", value);
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 1, eflags: 0x0
    // Checksum 0xac716876, Offset: 0x2a8
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 2, eflags: 0x0
    // Checksum 0x3e68a457, Offset: 0x258
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "self_revive_visuals_rush", persistent);
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 1, eflags: 0x0
    // Checksum 0x85661467, Offset: 0x200
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("revive_time", 1, 4, "int");
    }

}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1, eflags: 0x0
// Checksum 0x2a5eed24, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new cself_revive_visuals_rush();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 2, eflags: 0x0
// Checksum 0xe930f7d7, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1, eflags: 0x0
// Checksum 0xadedff66, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1, eflags: 0x0
// Checksum 0x549cff49, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 2, eflags: 0x0
// Checksum 0xdfb17af3, Offset: 0x1b0
// Size: 0x28
function set_revive_time(player, value) {
    [[ self ]]->set_revive_time(player, value);
}

