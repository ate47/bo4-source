// Atian COD Tools GSC decompiler test
#include scripts/zm_common/bgbs/zm_bgb_anywhere_but_here.gsc;
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace zm_trial_random_teleport;

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x2
// Checksum 0xdeb6308b, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_random_teleport", &__init__, undefined, undefined);
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x1 linked
// Checksum 0xa20bdac9, Offset: 0x108
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"random_teleport", &on_begin, &on_end);
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 2, eflags: 0x5 linked
// Checksum 0xc55f7553, Offset: 0x170
// Size: 0xd8
function private on_begin(n_min_time, n_max_time) {
    level.var_935c100a = zm_trial::function_5769f26a(n_min_time);
    level.var_33146b2e = zm_trial::function_5769f26a(n_max_time);
    foreach (player in getplayers()) {
        player thread function_6a04c6e6();
    }
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 1, eflags: 0x5 linked
// Checksum 0x79ecf3c7, Offset: 0x250
// Size: 0xe0
function private on_end(round_reset) {
    level notify(#"hash_34f9cf7500b33c6b");
    foreach (player in getplayers()) {
        player val::reset(#"hash_7d2b25df35ca5b3", "freezecontrols");
        player val::reset(#"hash_7d2b25df35ca5b3", "ignoreme");
    }
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x0
// Checksum 0xb3efdf1b, Offset: 0x338
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"random_teleport");
    return isdefined(challenge);
}

// Namespace zm_trial_random_teleport/zm_trial_random_teleport
// Params 0, eflags: 0x5 linked
// Checksum 0x935213f6, Offset: 0x378
// Size: 0xc8
function private function_6a04c6e6() {
    self endon(#"disconnect");
    level endon(#"hash_34f9cf7500b33c6b", #"end_game");
    while (1) {
        wait(randomfloatrange(level.var_935c100a, level.var_33146b2e));
        if (isalive(self)) {
            if (self isusingoffhand()) {
                self forceoffhandend();
            }
            self zm_bgb_anywhere_but_here::activation(0);
        }
    }
}

