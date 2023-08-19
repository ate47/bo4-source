// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;

#namespace zm_trial_weapon_locked;

// Namespace zm_trial_weapon_locked
// Method(s) 6 Total 13
class czm_trial_weapon_locked : cluielem {

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 0, eflags: 0x8
    // Checksum 0xe092ac28, Offset: 0x1d8
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 0, eflags: 0x90 class_linked
    // Checksum 0xae2606f5, Offset: 0x310
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x0
    // Checksum 0xdf200818, Offset: 0x2d0
    // Size: 0x34
    function function_1e74977(player) {
        player clientfield::function_bb878fc3(self.var_47e79fc, "show_icon");
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x0
    // Checksum 0x8159d702, Offset: 0x2a0
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 2, eflags: 0x0
    // Checksum 0x7a109e1b, Offset: 0x250
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_trial_weapon_locked", persistent);
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x0
    // Checksum 0xd5ac8b98, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("show_icon", 1, 1, "counter");
    }

}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x0
// Checksum 0x6b18ba85, Offset: 0xd8
// Size: 0x40
function register(uid) {
    elem = new czm_trial_weapon_locked();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 2, eflags: 0x0
// Checksum 0x5a389af7, Offset: 0x120
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x0
// Checksum 0xc559a93e, Offset: 0x160
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x0
// Checksum 0x7f3a5514, Offset: 0x188
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x0
// Checksum 0x242fb16c, Offset: 0x1b0
// Size: 0x1c
function function_1e74977(player) {
    [[ self ]]->function_1e74977(player);
}

