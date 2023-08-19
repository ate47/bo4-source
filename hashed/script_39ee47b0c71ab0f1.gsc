// Atian COD Tools GSC decompiler test
#include scripts/core_common/lui_shared.csc;

#namespace zm_trial_weapon_locked;

// Namespace zm_trial_weapon_locked
// Method(s) 7 Total 13
class czm_trial_weapon_locked : cluielem {

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 0, eflags: 0x9 linked
    // Checksum 0xb462a51b, Offset: 0x1f0
    // Size: 0x14
    __constructor() {
        cluielem::__constructor();
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x42851bf2, Offset: 0x398
    // Size: 0x14
    __destructor() {
        cluielem::__destructor();
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x1 linked
    // Checksum 0x526a0cd, Offset: 0x320
    // Size: 0x6c
    function function_1e74977(localclientnum) {
        var_1ed06bbc = [[ self ]]->get_data(localclientnum, "show_icon");
        new_val = (var_1ed06bbc + 1) % 2;
        [[ self ]]->set_data(localclientnum, "show_icon", new_val);
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1b4521df, Offset: 0x2e8
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"zm_trial_weapon_locked");
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x1 linked
    // Checksum 0x70e2304, Offset: 0x2a0
    // Size: 0x40
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
        [[ self ]]->set_data(localclientnum, "show_icon", 0);
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbe497453, Offset: 0x270
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace czm_trial_weapon_locked/zm_trial_weapon_locked
    // Params 2, eflags: 0x1 linked
    // Checksum 0x56ae2337, Offset: 0x210
    // Size: 0x54
    function setup_clientfields(uid, var_18c795d0) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("show_icon", 1, 1, "counter", var_18c795d0);
    }

}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 2, eflags: 0x0
// Checksum 0xab62e2f1, Offset: 0xb0
// Size: 0x4c
function register(uid, var_18c795d0) {
    elem = new czm_trial_weapon_locked();
    [[ elem ]]->setup_clientfields(uid, var_18c795d0);
    return elem;
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x1 linked
// Checksum 0x96becb73, Offset: 0x108
// Size: 0x40
function register_clientside(uid) {
    elem = new czm_trial_weapon_locked();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x1 linked
// Checksum 0x68a9790a, Offset: 0x150
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x0
// Checksum 0xc911088b, Offset: 0x178
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x1 linked
// Checksum 0xe0b7306d, Offset: 0x1a0
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

// Namespace zm_trial_weapon_locked/zm_trial_weapon_locked
// Params 1, eflags: 0x1 linked
// Checksum 0x8da03ccc, Offset: 0x1c8
// Size: 0x1c
function function_1e74977(localclientnum) {
    [[ self ]]->function_1e74977(localclientnum);
}

