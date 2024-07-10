#using scripts\zm\zm_towers_crowd.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace namespace_8a476bc7;

// Namespace namespace_8a476bc7/namespace_8a476bc7
// Params 0, eflags: 0x2
// Checksum 0x25c71c39, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_48f50c5660fa9f4c", &__init__, undefined, undefined);
}

// Namespace namespace_8a476bc7/namespace_8a476bc7
// Params 0, eflags: 0x1 linked
// Checksum 0xa7a77724, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_1fd6f58939deba71", &on_begin, &on_end);
}

// Namespace namespace_8a476bc7/namespace_8a476bc7
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x140
// Size: 0x4
function private on_begin() {
    
}

// Namespace namespace_8a476bc7/namespace_8a476bc7
// Params 1, eflags: 0x5 linked
// Checksum 0xde4b9aea, Offset: 0x150
// Size: 0x144
function private on_end(round_reset) {
    if (!round_reset) {
        var_acba5af0 = array();
        foreach (e_player in level.players) {
            if (!e_player zm_towers_crowd::function_aa0b6eb()) {
                if (!isdefined(var_acba5af0)) {
                    var_acba5af0 = [];
                } else if (!isarray(var_acba5af0)) {
                    var_acba5af0 = array(var_acba5af0);
                }
                if (!isinarray(var_acba5af0, e_player)) {
                    var_acba5af0[var_acba5af0.size] = e_player;
                }
            }
        }
        if (var_acba5af0.size) {
            zm_trial::fail(#"hash_746c876308278b16", var_acba5af0);
        }
    }
}

