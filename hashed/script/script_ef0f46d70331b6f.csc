#using scripts\core_common\lui_shared;

#namespace ct_crash_kill_remaining_enemy;

// Namespace ct_crash_kill_remaining_enemy
// Method(s) 6 Total 12
class cct_crash_kill_remaining_enemy : cluielem {

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 1, eflags: 0x0
    // Checksum 0x886a6bec, Offset: 0x258
    // Size: 0x2c
    function open(localclientnum) {
        cluielem::open(localclientnum, #"ct_crash_kill_remaining_enemy");
    }

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 1, eflags: 0x0
    // Checksum 0xf4b4344a, Offset: 0x228
    // Size: 0x24
    function function_fa582112(localclientnum) {
        cluielem::function_fa582112(localclientnum);
    }

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 1, eflags: 0x0
    // Checksum 0x399ee642, Offset: 0x1f8
    // Size: 0x24
    function register_clientside(uid) {
        cluielem::register_clientside(uid);
    }

    // Namespace cct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
    // Params 1, eflags: 0x0
    // Checksum 0xecefdb36, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
    }

}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1, eflags: 0x0
// Checksum 0xe2ac7855, Offset: 0xa0
// Size: 0x40
function register(uid) {
    elem = new cct_crash_kill_remaining_enemy();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1, eflags: 0x0
// Checksum 0x2090f0d4, Offset: 0xe8
// Size: 0x40
function register_clientside(uid) {
    elem = new cct_crash_kill_remaining_enemy();
    [[ elem ]]->register_clientside(uid);
    return elem;
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1, eflags: 0x0
// Checksum 0x48a7e7cd, Offset: 0x130
// Size: 0x1c
function open(player) {
    [[ self ]]->open(player);
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1, eflags: 0x0
// Checksum 0x468ccc13, Offset: 0x158
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace ct_crash_kill_remaining_enemy/ct_crash_kill_remaining_enemy
// Params 1, eflags: 0x0
// Checksum 0x1eca2ef1, Offset: 0x180
// Size: 0x1a
function is_open(localclientnum) {
    return [[ self ]]->is_open(localclientnum);
}

