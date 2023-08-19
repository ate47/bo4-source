// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace prototype_self_revive;

// Namespace prototype_self_revive
// Method(s) 5 Total 12
class cprototype_self_revive : cluielem {

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 0, eflags: 0x8
    // Checksum 0xe96d028b, Offset: 0x198
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x59f33f6c, Offset: 0x268
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 1, eflags: 0x0
    // Checksum 0x5e7fcaf0, Offset: 0x238
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 2, eflags: 0x0
    // Checksum 0xeb9e8122, Offset: 0x1e8
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "prototype_self_revive", persistent);
    }

    // Namespace cprototype_self_revive/prototype_self_revive
    // Params 1, eflags: 0x0
    // Checksum 0xed0678a9, Offset: 0x1b8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0x8cb972fb, Offset: 0xc0
// Size: 0x40
function register(uid) {
    elem = new cprototype_self_revive();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 2, eflags: 0x0
// Checksum 0x4025e7a2, Offset: 0x108
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0x7b27d931, Offset: 0x148
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace prototype_self_revive/prototype_self_revive
// Params 1, eflags: 0x0
// Checksum 0xd98ef968, Offset: 0x170
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

