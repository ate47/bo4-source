// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_trial.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zm_trial_crawlers_only;

// Namespace zm_trial_crawlers_only/zm_trial_crawlers_only
// Params 0, eflags: 0x2
// Checksum 0x2f16565f, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_crawlers_only", &__init__, undefined, undefined);
}

// Namespace zm_trial_crawlers_only/zm_trial_crawlers_only
// Params 0, eflags: 0x0
// Checksum 0x570c7e90, Offset: 0xc0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"crawlers_only", &on_begin, &on_end);
}

// Namespace zm_trial_crawlers_only/zm_trial_crawlers_only
// Params 0, eflags: 0x4
// Checksum 0xdb340493, Offset: 0x128
// Size: 0x62
function private on_begin() {
    level.var_6d8a8e47 = 1;
    level.var_153e9058 = 1;
    level.var_fe2bb2ac = 1;
    level.var_5e45f817 = 1;
    level.var_d1b3ec4e = level.var_9b91564e;
    level.var_9b91564e = undefined;
}

// Namespace zm_trial_crawlers_only/zm_trial_crawlers_only
// Params 1, eflags: 0x4
// Checksum 0xc91fe998, Offset: 0x198
// Size: 0x5e
function private on_end(round_reset) {
    level.var_6d8a8e47 = 0;
    level.var_153e9058 = 0;
    level.var_fe2bb2ac = 0;
    level.var_5e45f817 = 0;
    level.var_9b91564e = level.var_d1b3ec4e;
    level.var_d1b3ec4e = undefined;
}

