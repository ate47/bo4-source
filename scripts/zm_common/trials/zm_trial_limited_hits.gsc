#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_limited_hits;

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 0, eflags: 0x2
// Checksum 0x9f735110, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_limited_hits", &__init__, undefined, undefined);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 0, eflags: 0x1 linked
// Checksum 0xaccb983c, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"limited_hits", &on_begin, &on_end);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 2, eflags: 0x5 linked
// Checksum 0x32e39b0d, Offset: 0x148
// Size: 0xd4
function private on_begin(var_85af3be4, var_752d90ad) {
    if (getplayers().size == 1) {
        level.var_b529249b = zm_trial::function_5769f26a(var_752d90ad);
    } else {
        level.var_b529249b = zm_trial::function_5769f26a(var_85af3be4);
    }
    level.var_4b9163d5 = 0;
    zm_trial_util::function_2976fa44(level.var_b529249b);
    zm_trial_util::function_dace284(level.var_b529249b, 1);
    callback::on_player_damage(&on_player_damage);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 1, eflags: 0x5 linked
// Checksum 0xe57531a3, Offset: 0x228
// Size: 0x54
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    level.var_b529249b = undefined;
    level.var_4b9163d5 = undefined;
    callback::remove_on_player_damage(&on_player_damage);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 0, eflags: 0x0
// Checksum 0xb8aa7329, Offset: 0x288
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"limited_hits");
    return isdefined(challenge);
}

// Namespace zm_trial_limited_hits/zm_trial_limited_hits
// Params 1, eflags: 0x5 linked
// Checksum 0x880a4432, Offset: 0x2c8
// Size: 0xa4
function private on_player_damage(params) {
    if (params.idamage >= 0) {
        level.var_4b9163d5++;
        zm_trial_util::function_dace284(level.var_b529249b - level.var_4b9163d5);
        if (level.var_4b9163d5 >= level.var_b529249b) {
            zm_trial::fail(#"hash_404865fbf8dd5cc2", array(self));
        }
    }
}

