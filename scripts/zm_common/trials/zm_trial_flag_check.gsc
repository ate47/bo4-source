// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_flag_check;

// Namespace zm_trial_flag_check/zm_trial_flag_check
// Params 0, eflags: 0x2
// Checksum 0xd21d74f3, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_flag_check", &__init__, undefined, undefined);
}

// Namespace zm_trial_flag_check/zm_trial_flag_check
// Params 0, eflags: 0x1 linked
// Checksum 0x365126ef, Offset: 0xd8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"flag_check", &on_begin, &on_end);
}

// Namespace zm_trial_flag_check/zm_trial_flag_check
// Params 2, eflags: 0x5 linked
// Checksum 0x4a580e45, Offset: 0x140
// Size: 0x64
function private on_begin(str_flag, var_60bdad5f) {
    zm_trial_util::function_7d32b7d0(0);
    level.var_5fccce01 = str_flag;
    level.var_4ce2a315 = var_60bdad5f;
    level thread monitor_flag(str_flag);
}

// Namespace zm_trial_flag_check/zm_trial_flag_check
// Params 1, eflags: 0x5 linked
// Checksum 0xd6823854, Offset: 0x1b0
// Size: 0x64
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    if (!round_reset) {
        if (!level flag::get(level.var_5fccce01)) {
            zm_trial::fail(level.var_4ce2a315);
        }
    }
}

// Namespace zm_trial_flag_check/zm_trial_flag_check
// Params 1, eflags: 0x5 linked
// Checksum 0xe7f06ec6, Offset: 0x220
// Size: 0x90
function private monitor_flag(str_flag) {
    level endon(#"hash_7646638df88a3656");
    while (true) {
        level flag::wait_till(str_flag);
        zm_trial_util::function_7d32b7d0(1);
        level flag::wait_till_clear(str_flag);
        zm_trial_util::function_7d32b7d0(0);
    }
}

