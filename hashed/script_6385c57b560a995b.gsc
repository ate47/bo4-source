// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace ct_recon_melee_vip;

// Namespace ct_recon_melee_vip
// Method(s) 5 Total 12
class class_c27780d9 : cluielem {

    // Namespace class_c27780d9/ct_recon_melee_vip
    // Params 0, eflags: 0x8
    // Checksum 0x1d4964fd, Offset: 0x190
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace class_c27780d9/ct_recon_melee_vip
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xf1e5281d, Offset: 0x260
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace namespace_c27780d9/ct_recon_melee_vip
    // Params 1, eflags: 0x0
    // Checksum 0x72564933, Offset: 0x230
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace namespace_c27780d9/ct_recon_melee_vip
    // Params 2, eflags: 0x0
    // Checksum 0xba48bd41, Offset: 0x1e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_recon_melee_vip", persistent);
    }

    // Namespace namespace_c27780d9/ct_recon_melee_vip
    // Params 1, eflags: 0x0
    // Checksum 0x646b4e7c, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0x95ea8e63, Offset: 0xb8
// Size: 0x40
function register(uid) {
    elem = new class_c27780d9();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 2, eflags: 0x0
// Checksum 0xbe96a2a9, Offset: 0x100
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0x7877281c, Offset: 0x140
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0xa8839daa, Offset: 0x168
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

