#using scripts\zm_common\zm_bgb_pack.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_disable_bgbs;

// Namespace zm_trial_disable_bgbs/zm_trial_disable_bgbs
// Params 0, eflags: 0x2
// Checksum 0x62ab5b49, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_disable_bgbs", &__init__, undefined, undefined);
}

// Namespace zm_trial_disable_bgbs/zm_trial_disable_bgbs
// Params 0, eflags: 0x1 linked
// Checksum 0xb69c50b9, Offset: 0xd0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_bgbs", &on_begin, &on_end);
}

// Namespace zm_trial_disable_bgbs/zm_trial_disable_bgbs
// Params 0, eflags: 0x5 linked
// Checksum 0xdf601257, Offset: 0x138
// Size: 0xc8
function private on_begin() {
    level zm_trial::function_2b3a3307(1);
    level zm_trial::function_19a1098f(1);
    foreach (player in getplayers()) {
        player bgb::take();
        player bgb_pack::function_ac9cb612(1);
    }
}

// Namespace zm_trial_disable_bgbs/zm_trial_disable_bgbs
// Params 1, eflags: 0x5 linked
// Checksum 0x58f40ddb, Offset: 0x208
// Size: 0xc0
function private on_end(round_reset) {
    level zm_trial::function_2b3a3307(0);
    level zm_trial::function_19a1098f(0);
    foreach (player in getplayers()) {
        player bgb_pack::function_ac9cb612(0);
    }
}

// Namespace zm_trial_disable_bgbs/zm_trial_disable_bgbs
// Params 0, eflags: 0x1 linked
// Checksum 0x225d45fd, Offset: 0x2d0
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"disable_bgbs");
    return isdefined(challenge);
}

