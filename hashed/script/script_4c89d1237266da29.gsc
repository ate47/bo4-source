#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace ct_recon_enemy_reinforcement;

// Namespace ct_recon_enemy_reinforcement
// Method(s) 5 Total 12
class class_27e8fec4 : cluielem {

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 1, eflags: 0x0
    // Checksum 0x7e07fdba, Offset: 0x240
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 2, eflags: 0x0
    // Checksum 0x796bcc77, Offset: 0x1f0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "ct_recon_enemy_reinforcement", persistent);
    }

    // Namespace namespace_27e8fec4/ct_recon_enemy_reinforcement
    // Params 1, eflags: 0x0
    // Checksum 0xdf3221cd, Offset: 0x1c0
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0x138335fe, Offset: 0xc8
// Size: 0x40
function register(uid) {
    elem = new class_27e8fec4();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 2, eflags: 0x0
// Checksum 0x378602e7, Offset: 0x110
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0x9fbc3959, Offset: 0x150
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_recon_enemy_reinforcement/ct_recon_enemy_reinforcement
// Params 1, eflags: 0x0
// Checksum 0xf09f0a7, Offset: 0x178
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

