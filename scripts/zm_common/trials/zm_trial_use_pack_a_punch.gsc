#using scripts\zm_common\callbacks;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\array_shared;
#using scripts\core_common\system_shared;

#namespace zm_trial_use_pack_a_punch;

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 0, eflags: 0x2
// Checksum 0xce8e3060, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_use_pack_a_punch", &__init__, undefined, undefined);
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 0, eflags: 0x0
// Checksum 0x1a8b2a69, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"use_pack_a_punch", &on_begin, &on_end);
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 1, eflags: 0x4
// Checksum 0xbb1f17a6, Offset: 0x148
// Size: 0x100
function private on_begin(n_count) {
    callback::function_aebeafc0(&function_aebeafc0);
    level.var_195590fb = zm_trial::function_5769f26a(n_count);
    foreach (player in getplayers()) {
        player.var_92cd5237 = [];
        player zm_trial_util::function_c2cd0cba(level.var_195590fb);
        player zm_trial_util::function_2190356a(0);
    }
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 1, eflags: 0x4
// Checksum 0xeba8edb9, Offset: 0x250
// Size: 0x1d4
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player zm_trial_util::function_f3aacffb();
    }
    if (!round_reset) {
        var_57807cdc = [];
        foreach (player in getplayers()) {
            if (player.var_92cd5237.size < level.var_195590fb) {
                array::add(var_57807cdc, player, 0);
            }
            player.var_f8c35ed5 = undefined;
        }
        if (var_57807cdc.size == 1) {
            zm_trial::fail(#"hash_6dbd3c476c903f66", var_57807cdc);
        } else if (var_57807cdc.size > 1) {
            zm_trial::fail(#"hash_59d734dda39935cf", var_57807cdc);
        }
    }
    level.var_195590fb = undefined;
    callback::function_3e2ed898(&function_aebeafc0);
}

// Namespace zm_trial_use_pack_a_punch/zm_trial_use_pack_a_punch
// Params 1, eflags: 0x4
// Checksum 0x7eab2514, Offset: 0x430
// Size: 0xf4
function private function_aebeafc0(upgraded_weapon) {
    w_base = zm_weapons::get_base_weapon(upgraded_weapon);
    if (!isdefined(self.var_92cd5237)) {
        self.var_92cd5237 = [];
    } else if (!isarray(self.var_92cd5237)) {
        self.var_92cd5237 = array(self.var_92cd5237);
    }
    if (!isinarray(self.var_92cd5237, w_base)) {
        self.var_92cd5237[self.var_92cd5237.size] = w_base;
    }
    if (self.var_92cd5237.size <= level.var_195590fb) {
        zm_trial_util::function_2190356a(self.var_92cd5237.size);
    }
}

