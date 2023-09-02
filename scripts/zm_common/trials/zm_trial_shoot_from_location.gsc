// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_shoot_from_location;

// Namespace zm_trial_shoot_from_location/zm_trial_shoot_from_location
// Params 0, eflags: 0x2
// Checksum 0xa1e1572a, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_shoot_from_location", &__init__, undefined, undefined);
}

// Namespace zm_trial_shoot_from_location/zm_trial_shoot_from_location
// Params 0, eflags: 0x1 linked
// Checksum 0xfaccded7, Offset: 0x158
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"shoot_from_location", &on_begin, &on_end);
}

// Namespace zm_trial_shoot_from_location/zm_trial_shoot_from_location
// Params 0, eflags: 0x5 linked
// Checksum 0x628ed64e, Offset: 0x1c0
// Size: 0x248
function private on_begin() {
    if (util::get_map_name() == "zm_office") {
        elevator1 = getent("elevator1", "targetname");
        elevator2 = getent("elevator2", "targetname");
        elevator1.cost = 0;
        elevator2.cost = 0;
        trigger1 = getent(elevator1.targetname + "_buy", "script_noteworthy");
        trigger2 = getent(elevator2.targetname + "_buy", "script_noteworthy");
        trigger1 sethintstring(level.var_31560d97, elevator1.cost);
        trigger2 sethintstring(level.var_31560d97, elevator2.cost);
    }
    str_targetname = "trials_shoot_from_location";
    level.var_7f31a12d = getentarray(str_targetname, "targetname");
    /#
        assert(level.var_7f31a12d.size, "<unknown string>");
    #/
    callback::function_33f0ddd3(&function_33f0ddd3);
    foreach (player in getplayers()) {
        player thread function_3658663();
    }
}

// Namespace zm_trial_shoot_from_location/zm_trial_shoot_from_location
// Params 1, eflags: 0x5 linked
// Checksum 0x57685273, Offset: 0x410
// Size: 0x202
function private on_end(round_reset) {
    callback::function_824d206(&function_33f0ddd3);
    if (util::get_map_name() == "zm_office") {
        elevator1 = getent("elevator1", "targetname");
        elevator2 = getent("elevator2", "targetname");
        elevator1.cost = 500;
        elevator2.cost = 500;
        trigger1 = getent(elevator1.targetname + "_buy", "script_noteworthy");
        trigger2 = getent(elevator2.targetname + "_buy", "script_noteworthy");
        trigger1 sethintstring(level.var_31560d97, elevator1.cost);
        trigger2 sethintstring(level.var_31560d97, elevator2.cost);
    }
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_dc0859e();
    }
    level.var_7f31a12d = undefined;
}

// Namespace zm_trial_shoot_from_location/zm_trial_shoot_from_location
// Params 0, eflags: 0x5 linked
// Checksum 0x271fc3f, Offset: 0x620
// Size: 0x146
function private function_3658663() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656");
    var_407eb07 = 0;
    while (1) {
        var_f2b6fe6e = 0;
        foreach (var_3953f2a9 in level.var_7f31a12d) {
            if (self istouching(var_3953f2a9)) {
                var_f2b6fe6e = 1;
                break;
            }
        }
        if (var_f2b6fe6e && var_407eb07) {
            self zm_trial_util::function_dc0859e();
            var_407eb07 = 0;
        } else if (!var_f2b6fe6e && !var_407eb07) {
            self zm_trial_util::function_bf710271();
            var_407eb07 = 1;
        }
        waitframe(1);
    }
}

// Namespace zm_trial_shoot_from_location/zm_trial_shoot_from_location
// Params 1, eflags: 0x5 linked
// Checksum 0xfbd008c1, Offset: 0x770
// Size: 0x10c
function private function_33f0ddd3(s_event) {
    if (s_event.event === "give_weapon") {
        var_f2b6fe6e = 0;
        foreach (var_3953f2a9 in level.var_7f31a12d) {
            if (self istouching(var_3953f2a9)) {
                var_f2b6fe6e = 1;
                break;
            }
        }
        if (!var_f2b6fe6e && !zm_loadout::function_2ff6913(s_event.weapon)) {
            self function_28602a03(s_event.weapon, 1, 1);
        }
    }
}

