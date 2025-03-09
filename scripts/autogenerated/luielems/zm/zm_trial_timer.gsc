#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace zm_trial_timer;

// Namespace zm_trial_timer
// Method(s) 7 Total 14
class czm_trial_timer : cluielem {

    var _uid;

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 2, eflags: 0x0
    // Checksum 0xb293f207, Offset: 0x388
    // Size: 0x3c
    function set_under_round_rules(player, value) {
        player clientfield::function_9bf78ef8(_uid, "under_round_rules", value);
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 2, eflags: 0x0
    // Checksum 0xe2b92088, Offset: 0x340
    // Size: 0x3c
    function set_timer_text(player, value) {
        player clientfield::function_9bf78ef8(_uid, "timer_text", value);
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 1, eflags: 0x0
    // Checksum 0x58b8363d, Offset: 0x310
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 2, eflags: 0x0
    // Checksum 0x879c2e53, Offset: 0x2c0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_trial_timer", persistent);
    }

    // Namespace czm_trial_timer/zm_trial_timer
    // Params 1, eflags: 0x0
    // Checksum 0x1405ef7, Offset: 0x240
    // Size: 0x74
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::function_dcb34c80("string", "timer_text", 1);
        cluielem::add_clientfield("under_round_rules", 5000, 1, "int");
    }

}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1, eflags: 0x0
// Checksum 0x1b5e4684, Offset: 0xe8
// Size: 0x40
function register(uid) {
    elem = new czm_trial_timer();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 2, eflags: 0x0
// Checksum 0x313eca49, Offset: 0x130
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1, eflags: 0x0
// Checksum 0xf9250091, Offset: 0x170
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 1, eflags: 0x0
// Checksum 0xc5809ca1, Offset: 0x198
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 2, eflags: 0x0
// Checksum 0xd4255224, Offset: 0x1c0
// Size: 0x28
function set_timer_text(player, value) {
    [[ self ]]->set_timer_text(player, value);
}

// Namespace zm_trial_timer/zm_trial_timer
// Params 2, eflags: 0x0
// Checksum 0x8cf695, Offset: 0x1f0
// Size: 0x28
function set_under_round_rules(player, value) {
    [[ self ]]->set_under_round_rules(player, value);
}

