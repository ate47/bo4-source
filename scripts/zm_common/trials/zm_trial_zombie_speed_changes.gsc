#using script_24c32478acf44108;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_zombie_speed_changes;

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 0, eflags: 0x2
// Checksum 0x6c6fdfcc, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_zombie_speed_changes", &__init__, undefined, undefined);
}

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 0, eflags: 0x0
// Checksum 0x704e8d67, Offset: 0x118
// Size: 0x84
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"zombie_speed_changes", &on_begin, &on_end);
    namespace_9ff9f642::register_slowdown(#"zm_trial_zombie_speed_changes", 1.5);
}

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 0, eflags: 0x4
// Checksum 0x8fd89e3b, Offset: 0x1a8
// Size: 0x3c
function private on_begin() {
    level thread function_4458377c();
    level thread zm_utility::play_sound_2d("zmb_trial_horror_round_start");
}

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 1, eflags: 0x4
// Checksum 0xc525636, Offset: 0x1f0
// Size: 0xc
function private on_end(round_reset) {
    
}

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 0, eflags: 0x4
// Checksum 0xe2d41d44, Offset: 0x208
// Size: 0x220
function private function_4458377c() {
    level endon(#"hash_7646638df88a3656");
    while (true) {
        a_ai_zombies = getaiteamarray(level.zombie_team);
        foreach (ai in a_ai_zombies) {
            if (!isalive(ai) || isdefined(ai.var_cda2fa8) && ai.var_cda2fa8) {
                continue;
            }
            e_player = arraygetclosest(ai.origin, getplayers());
            if (isplayer(e_player) && distance(ai.origin, e_player.origin) > 100) {
                ai thread function_fe65f5a6(randomfloatrange(1.25, 1.5), e_player);
            } else if (math::cointoss(20)) {
                ai thread function_fe65f5a6(randomfloatrange(1.1, 1.25), e_player);
            }
            waitframe(1);
        }
        n_wait_time = randomfloatrange(1, 2);
        wait(n_wait_time);
    }
}

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 3, eflags: 0x0
// Checksum 0x8fd19a22, Offset: 0x430
// Size: 0x28e
function function_fe65f5a6(var_b7358df3, e_player, n_timeout = 1) {
    self endon(#"death");
    self.var_cda2fa8 = 1;
    if (!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area) && self.archetype !== #"zombie_dog") {
        self waittill(#"completed_emerging_into_playable_area");
    }
    self thread namespace_9ff9f642::slowdown(#"zm_trial_zombie_speed_changes", 0.75);
    n_delay_time = randomfloatrange(2, 5);
    wait(n_delay_time);
    self thread namespace_9ff9f642::slowdown(#"zm_trial_zombie_speed_changes", var_b7358df3);
    self playsound(#"hash_46661e1d0062f53b");
    if (math::cointoss(20)) {
        if (isdefined(e_player) && isalive(e_player)) {
            if (e_player islookingat(self)) {
                self playsoundtoplayer(#"hash_69671b54d86128ce", e_player);
            }
        }
    }
    n_timer = 0;
    while (n_timer < n_timeout) {
        if (isalive(e_player) && distance(e_player.origin, self.origin) < 100) {
            break;
        }
        n_timer += float(function_60d95f53()) / 1000;
        waitframe(1);
    }
    self thread namespace_9ff9f642::slowdown(#"zm_trial_zombie_speed_changes", 0.75);
    self.var_cda2fa8 = undefined;
}

// Namespace zm_trial_zombie_speed_changes/zm_trial_zombie_speed_changes
// Params 0, eflags: 0x0
// Checksum 0x2dc0cb10, Offset: 0x6c8
// Size: 0x32
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"zombie_speed_changes");
    return isdefined(challenge);
}

