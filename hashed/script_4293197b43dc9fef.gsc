// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace ct_recon_melee_vip;

// Namespace ct_recon_melee_vip
// Method(s) 6 Total 12
class cct_recon_melee_vip : cluielem {

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 0, eflags: 0x8
    // Checksum 0x704df030, Offset: 0x1a8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x7888bdf, Offset: 0x290
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 1, eflags: 0x0
    // Checksum 0x5bc4ae03, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_recon_melee_vip");
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 1, eflags: 0x0
    // Checksum 0x1c262195, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 1, eflags: 0x0
    // Checksum 0x8f52469b, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_recon_melee_vip/ct_recon_melee_vip
    // Params 1, eflags: 0x0
    // Checksum 0x45b46734, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0x21d34da, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cct_recon_melee_vip();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0xe8a0e93a, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_recon_melee_vip();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0xf376a119, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0xdadd4b03, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_recon_melee_vip/ct_recon_melee_vip
// Params 1, eflags: 0x0
// Checksum 0xe569b4a0, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

