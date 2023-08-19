// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_trial_util.gsc;
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/player/player_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_trial_disable_regen;

// Namespace zm_trial_disable_regen/zm_trial_disable_regen
// Params 0, eflags: 0x2
// Checksum 0x584f26bc, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_disable_regen", &__init__, undefined, undefined);
}

// Namespace zm_trial_disable_regen/zm_trial_disable_regen
// Params 0, eflags: 0x1 linked
// Checksum 0xe7f40035, Offset: 0x108
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_regen", &on_begin, &on_end);
}

// Namespace zm_trial_disable_regen/zm_trial_disable_regen
// Params 0, eflags: 0x5 linked
// Checksum 0x1678fc6d, Offset: 0x170
// Size: 0x90
function private on_begin() {
    foreach (player in getplayers()) {
        player val::set("trials_disable_regen", "health_regen", 0);
    }
}

// Namespace zm_trial_disable_regen/zm_trial_disable_regen
// Params 1, eflags: 0x5 linked
// Checksum 0xc1ddd899, Offset: 0x208
// Size: 0x98
function private on_end(round_reset) {
    foreach (player in getplayers()) {
        player val::reset("trials_disable_regen", "health_regen");
    }
}

// Namespace zm_trial_disable_regen/zm_trial_disable_regen
// Params 1, eflags: 0x0
// Checksum 0x148765f9, Offset: 0x2a8
// Size: 0x4a
function is_active(var_34f09024 = 0) {
    challenge = zm_trial::function_a36e8c38(#"disable_regen");
    return isdefined(challenge);
}

