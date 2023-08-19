// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace ct_recon_enemy_reinforcement;

// Namespace ct_recon_enemy_reinforcement
// Method(s) 6 Total 12
class class_27e8fec4 : cluielem {

    // Namespace class_27e8fec4/ct_recon_enemy_reinforcement
    // Params 0, eflags: 0x8
    // Checksum 0x4bef5c42, Offset: 0x1a8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace class_27e8fec4/ct_recon_enemy_reinforcement
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0x6b6c5108, Offset: 0x290
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 1, eflags: 0x0
    // Checksum 0xab138b20, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_recon_enemy_reinforcement");
    }

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 1, eflags: 0x0
    // Checksum 0xfd4173f0, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 1, eflags: 0x0
    // Checksum 0x2db13416, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 1, eflags: 0x0
    // Checksum 0x5caadb76, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0x7920f4fe, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new class_27e8fec4();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0xca895b0b, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new class_27e8fec4();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0x77ea1d75, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0xfde06293, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0xd0a49c07, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

