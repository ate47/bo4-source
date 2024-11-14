#using scripts\core_common\flag_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\system_shared;

#namespace zm_trial_disable_hud;

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x2
// Checksum 0x9d7b1cb, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_disable_hud", &__init__, undefined, undefined);
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x0
// Checksum 0x1afacf61, Offset: 0x108
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"disable_hud", &on_begin, &on_end);
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x4
// Checksum 0x7d36dd88, Offset: 0x170
// Size: 0x1c
function private on_begin() {
    level thread function_afe4a356();
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 0, eflags: 0x0
// Checksum 0x6b437454, Offset: 0x198
// Size: 0x100
function function_afe4a356() {
    level endon(#"hash_7646638df88a3656", #"end_game");
    wait 12;
    level.var_dc60105c = 1;
    level clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", 1);
    foreach (player in getplayers()) {
        player function_e0c7d69(0);
        player playsoundtoplayer(#"hash_79fced3c02a68283", player);
    }
}

// Namespace zm_trial_disable_hud/zm_trial_disable_hud
// Params 1, eflags: 0x4
// Checksum 0x2251729d, Offset: 0x2a0
// Size: 0x120
function private on_end(round_reset) {
    level clientfield::set_world_uimodel("ZMHudGlobal.trials.hudDeactivated", 0);
    level.var_dc60105c = undefined;
    if (level flag::get("round_reset") || level flag::get(#"trial_failed")) {
        return;
    }
    foreach (player in getplayers()) {
        player function_e0c7d69(1);
        player playsoundtoplayer(#"hash_18aab7ffde259877", player);
    }
}

