// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_reset_points;

// Namespace zm_trial_reset_points/zm_trial_reset_points
// Params 0, eflags: 0x2
// Checksum 0xdbf50ec, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_reset_points", &__init__, undefined, undefined);
}

// Namespace zm_trial_reset_points/zm_trial_reset_points
// Params 0, eflags: 0x0
// Checksum 0x6eb8dfc, Offset: 0xe0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"reset_points", &on_begin, &on_end);
}

// Namespace zm_trial_reset_points/zm_trial_reset_points
// Params 1, eflags: 0x4
// Checksum 0x36c5f326, Offset: 0x148
// Size: 0xc8
function private on_begin(var_899c6d17) {
    if (isdefined(var_899c6d17)) {
        var_899c6d17 = zm_trial::function_5769f26a(var_899c6d17);
    } else {
        var_899c6d17 = 0;
    }
    wait(6);
    foreach (player in getplayers()) {
        player thread reset_points(var_899c6d17);
    }
}

// Namespace zm_trial_reset_points/zm_trial_reset_points
// Params 1, eflags: 0x4
// Checksum 0xb06211fd, Offset: 0x218
// Size: 0x8e
function private reset_points(var_899c6d17) {
    if (self bgb::is_enabled(#"zm_bgb_shopping_free")) {
        self bgb::do_one_shot_use();
        self playsoundtoplayer(#"zmb_bgb_shoppingfree_coinreturn", self);
        return;
    }
    self.score = var_899c6d17;
    self.pers[#"score"] = var_899c6d17;
}

// Namespace zm_trial_reset_points/zm_trial_reset_points
// Params 1, eflags: 0x4
// Checksum 0x5463264f, Offset: 0x2b0
// Size: 0xc
function private on_end(round_reset) {
    
}

