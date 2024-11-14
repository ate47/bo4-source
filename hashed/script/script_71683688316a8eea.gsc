#using scripts\core_common\ai\zombie_utility;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_trial;
#using scripts\core_common\util_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;

#namespace namespace_b43e152a;

// Namespace namespace_b43e152a/namespace_b43e152a
// Params 0, eflags: 0x2
// Checksum 0xe63e7a3b, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_77f93374658c46e4", &__init__, undefined, undefined);
}

// Namespace namespace_b43e152a/namespace_b43e152a
// Params 0, eflags: 0x0
// Checksum 0xb9145c3a, Offset: 0x108
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_10949a7065d076ef", &on_begin, &on_end);
}

// Namespace namespace_b43e152a/namespace_b43e152a
// Params 8, eflags: 0x4
// Checksum 0xf9d894a, Offset: 0x170
// Size: 0x144
function private on_begin(n_max_zombies, var_2ec39966, str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9, var_a7a5a6ef) {
    level endon(#"hash_7646638df88a3656");
    a_str_zones = array(str_zone1, str_zone2, var_588808b1, var_91e2fb66, var_84245fe9, var_a7a5a6ef);
    arrayremovevalue(a_str_zones, undefined);
    if (isdefined(n_max_zombies)) {
        n_max_zombies = zm_trial::function_5769f26a(n_max_zombies);
    }
    wait 5;
    if (isdefined(var_2ec39966)) {
        self.var_2ec39966 = var_2ec39966;
        zm_utility::function_75fd65f9(self.var_2ec39966, 1);
    }
    assert(a_str_zones.size, "<dev string:x38>");
    level thread function_65e6d40c(a_str_zones, n_max_zombies);
}

// Namespace namespace_b43e152a/namespace_b43e152a
// Params 1, eflags: 0x4
// Checksum 0x3b5da61e, Offset: 0x2c0
// Size: 0x4e
function private on_end(round_reset) {
    zm_trial_util::function_f3dbeda7();
    if (isdefined(self.var_2ec39966)) {
        zm_utility::function_b1f3be5c(undefined, self.var_2ec39966);
        self.var_2ec39966 = undefined;
    }
}

// Namespace namespace_b43e152a/namespace_b43e152a
// Params 2, eflags: 0x4
// Checksum 0xfc0f7df6, Offset: 0x318
// Size: 0x310
function private function_65e6d40c(a_str_zones, n_max_zombies = 0) {
    level endon(#"hash_7646638df88a3656", #"end_game");
    level waittill(#"zombie_total_set");
    a_s_locs = zm_utility::function_9f7fd525("zombie_location", a_str_zones, 0);
    foreach (s_loc in a_s_locs) {
        if (level.zombie_total > 0) {
            ai = zombie_utility::spawn_zombie(level.zombie_spawners[0], undefined, s_loc);
            if (isdefined(ai)) {
                ai.b_ignore_cleanup = 1;
                ai.var_45cec07d = 1;
                level.zombie_total--;
                util::wait_network_frame();
            }
        }
    }
    while (true) {
        a_ai_enemies = getaiteamarray(level.zombie_team);
        var_d1d851f3 = 0;
        foreach (ai in a_ai_enemies) {
            if (isalive(ai) && isdefined(ai.completed_emerging_into_playable_area) && ai.completed_emerging_into_playable_area) {
                str_zone_name = ai zm_utility::get_current_zone();
                if (isdefined(str_zone_name) && isinarray(a_str_zones, hash(str_zone_name))) {
                    var_d1d851f3++;
                }
            }
            if (n_max_zombies > 0) {
                zm_trial_util::function_dace284(var_d1d851f3, 1);
                zm_trial_util::function_2976fa44(n_max_zombies + 1);
            }
            if (var_d1d851f3 > n_max_zombies) {
                zm_trial::fail(#"hash_622e72c9731cca58");
                return;
            }
        }
        wait 0.5;
    }
}

