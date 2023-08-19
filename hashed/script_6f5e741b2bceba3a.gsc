// Atian COD Tools GSC decompiler test
#include scripts/zm/zm_white_toast.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace namespace_d9987f47;

// Namespace namespace_d9987f47/namespace_d9987f47
// Params 0, eflags: 0x2
// Checksum 0xaf059e9c, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_638b17bfdc64795a", &__init__, undefined, undefined);
}

// Namespace namespace_d9987f47/namespace_d9987f47
// Params 0, eflags: 0x1 linked
// Checksum 0xdb05aa0c, Offset: 0xf0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_168c1517a89a7cd", &on_begin, &on_end);
}

// Namespace namespace_d9987f47/namespace_d9987f47
// Params 2, eflags: 0x5 linked
// Checksum 0xcfc5877d, Offset: 0x158
// Size: 0x204
function private on_begin(var_b3d469ae, var_5cd0152f) {
    level.var_21c2f32a = zm_trial::function_5769f26a(var_b3d469ae);
    n_cost = zm_trial::function_5769f26a(var_5cd0152f);
    level.var_943b6e2b = array();
    foreach (s_wallbuy in level._spawned_wallbuys) {
        s_wallbuy.trigger_stub zm_white_toast::function_641f4ec(&zm_white_toast::function_91256361, &zm_white_toast::function_c6c9b014, n_cost, "discharge_wallbuy");
    }
    foreach (player in getplayers()) {
        player zm_trial_util::function_c2cd0cba(level.var_21c2f32a);
        player zm_trial_util::function_2190356a(0);
        level.var_943b6e2b[player.clientid] = array();
    }
    level thread wallbuy_watcher();
}

// Namespace namespace_d9987f47/namespace_d9987f47
// Params 1, eflags: 0x5 linked
// Checksum 0x57cfbe08, Offset: 0x368
// Size: 0x2a0
function private on_end(round_reset) {
    if (!round_reset) {
        var_696c3b4 = array();
        foreach (player in getplayers()) {
            if (level.var_943b6e2b[player.clientid].size < level.var_21c2f32a) {
                if (!isdefined(var_696c3b4)) {
                    var_696c3b4 = [];
                } else if (!isarray(var_696c3b4)) {
                    var_696c3b4 = array(var_696c3b4);
                }
                var_696c3b4[var_696c3b4.size] = player;
            }
        }
        if (var_696c3b4.size == 1) {
            zm_trial::fail(#"hash_75977ef6e92a8fb9", var_696c3b4);
        } else if (var_696c3b4.size > 1) {
            zm_trial::fail(#"hash_b877496afcd42c8", var_696c3b4);
        }
    }
    level.var_21c2f32a = undefined;
    level.var_943b6e2b = undefined;
    level notify(#"hash_31c14df051f6c165");
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    foreach (s_wallbuy in level._spawned_wallbuys) {
        s_wallbuy.trigger_stub zm_white_toast::function_cf62f3c7();
    }
}

// Namespace namespace_d9987f47/namespace_d9987f47
// Params 0, eflags: 0x0
// Checksum 0x1fa42c84, Offset: 0x610
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"hash_168c1517a89a7cd");
    return isdefined(challenge);
}

// Namespace namespace_d9987f47/namespace_d9987f47
// Params 0, eflags: 0x5 linked
// Checksum 0x2042692e, Offset: 0x650
// Size: 0x220
function private wallbuy_watcher() {
    level endon(#"hash_31c14df051f6c165", #"game_ended");
    while (1) {
        s_notify = undefined;
        s_notify = level waittill(#"weapon_bought");
        e_player = s_notify.player;
        if (!isinarray(level.var_943b6e2b[e_player.clientid], s_notify.weapon)) {
            if (!isdefined(level.var_943b6e2b[e_player.clientid])) {
                level.var_943b6e2b[e_player.clientid] = [];
            } else if (!isarray(level.var_943b6e2b[e_player.clientid])) {
                level.var_943b6e2b[e_player.clientid] = array(level.var_943b6e2b[e_player.clientid]);
            }
            level.var_943b6e2b[e_player.clientid][level.var_943b6e2b[e_player.clientid].size] = s_notify.weapon;
        }
        if (level.var_943b6e2b[e_player.clientid].size < level.var_21c2f32a) {
            e_player zm_trial_util::function_2190356a(level.var_943b6e2b[e_player.clientid].size);
        }
        if (self.var_943b6e2b[e_player.clientid].size >= level.var_21c2f32a) {
            e_player zm_trial_util::function_63060af4(1);
        }
    }
}

