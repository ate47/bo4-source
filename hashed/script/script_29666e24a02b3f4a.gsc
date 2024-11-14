#using scripts\core_common\lui_shared;
#using scripts\core_common\clientfield_shared;

#namespace zm_towers_challenges_hud;

// Namespace zm_towers_challenges_hud
// Method(s) 9 Total 16
class czm_towers_challenges_hud : cluielem {

    var var_47e79fc;

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0x64f2b24f, Offset: 0x5b8
    // Size: 0x3c
    function set_required_goal(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "required_goal", value);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0xe6850323, Offset: 0x570
    // Size: 0x3c
    function set_challenge_text(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "challenge_text", value);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0x167b897b, Offset: 0x528
    // Size: 0x3c
    function set_progress(player, value) {
        player clientfield::function_9bf78ef8(var_47e79fc, "progress", value);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0x64b90745, Offset: 0x460
    // Size: 0xbc
    function set_state(player, state_name) {
        if (#"defaultstate" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 0);
            return;
        }
        if (#"hidden" == state_name) {
            player clientfield::function_9bf78ef8(var_47e79fc, "_state", 1);
            return;
        }
        assertmsg("<dev string:x38>");
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 1, eflags: 0x0
    // Checksum 0x9281a761, Offset: 0x430
    // Size: 0x24
    function close(player) {
        cluielem::close_luielem(player);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 2, eflags: 0x0
    // Checksum 0x7013151b, Offset: 0x3e0
    // Size: 0x44
    function open(player, persistent = 0) {
        cluielem::open_luielem(player, "zm_towers_challenges_hud", persistent);
    }

    // Namespace czm_towers_challenges_hud/zm_towers_challenges_hud
    // Params 1, eflags: 0x0
    // Checksum 0x20018be2, Offset: 0x310
    // Size: 0xc4
    function setup_clientfields(uid) {
        cluielem::setup_clientfields(uid);
        cluielem::add_clientfield("_state", 1, 1, "int");
        cluielem::add_clientfield("progress", 1, 7, "int");
        cluielem::function_dcb34c80("string", "challenge_text", 1);
        cluielem::add_clientfield("required_goal", 1, 7, "int");
    }

}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x948b7158, Offset: 0x108
// Size: 0x44
function set_challenge_progress(player, value) {
    value = int(value * 100);
    [[ self ]]->set_progress(player, value);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xc18a0693, Offset: 0x158
// Size: 0x40
function register(uid) {
    elem = new czm_towers_challenges_hud();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x711eacab, Offset: 0x1a0
// Size: 0x38
function open(player, persistent = 0) {
    [[ self ]]->open(player, persistent);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0x692d22e2, Offset: 0x1e0
// Size: 0x1c
function close(player) {
    [[ self ]]->close(player);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 1, eflags: 0x0
// Checksum 0xabc259fa, Offset: 0x208
// Size: 0x1a
function is_open(player) {
    return [[ self ]]->function_7bfd10e6(player);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xbf0988e4, Offset: 0x230
// Size: 0x28
function set_state(player, state_name) {
    [[ self ]]->set_state(player, state_name);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xfa343d39, Offset: 0x260
// Size: 0x28
function set_progress(player, value) {
    [[ self ]]->set_progress(player, value);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0x706c61b3, Offset: 0x290
// Size: 0x28
function set_challenge_text(player, value) {
    [[ self ]]->set_challenge_text(player, value);
}

// Namespace zm_towers_challenges_hud/zm_towers_challenges_hud
// Params 2, eflags: 0x0
// Checksum 0xd6911059, Offset: 0x2c0
// Size: 0x28
function set_required_goal(player, value) {
    [[ self ]]->set_required_goal(player, value);
}

