// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_activate_hazards;

// Namespace zm_trial_activate_hazards/zm_trial_activate_hazards
// Params 0, eflags: 0x2
// Checksum 0x68789e7a, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_activate_hazards", &__init__, undefined, undefined);
}

// Namespace zm_trial_activate_hazards/zm_trial_activate_hazards
// Params 0, eflags: 0x0
// Checksum 0x621266c2, Offset: 0xc8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"activate_hazards", &on_begin, &on_end);
}

// Namespace zm_trial_activate_hazards/zm_trial_activate_hazards
// Params 0, eflags: 0x4
// Checksum 0x74af0748, Offset: 0x130
// Size: 0x12
function private on_begin() {
    level.var_2d307e50 = 1;
}

// Namespace zm_trial_activate_hazards/zm_trial_activate_hazards
// Params 1, eflags: 0x4
// Checksum 0x6d8244eb, Offset: 0x150
// Size: 0x16
function private on_end(round_reset) {
    level.var_2d307e50 = undefined;
}

