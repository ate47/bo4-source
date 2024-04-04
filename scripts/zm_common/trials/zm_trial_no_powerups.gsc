// Atian COD Tools GSC decompiler test
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_no_powerups;

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 0, eflags: 0x2
// Checksum 0x4f3891a9, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_no_powerups", &__init__, undefined, undefined);
}

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x7b080dc0, Offset: 0xe8
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"no_powerups", &on_begin, &on_end);
}

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 0, eflags: 0x5 linked
// Checksum 0xba9af2c3, Offset: 0x150
// Size: 0xb2
function private on_begin() {
    self.active = 1;
    self.enemies_killed = 0;
    zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 80);
    zm_spawner::register_zombie_death_event_callback(&function_138aec8e);
    kill_count = zm_powerups::function_2ff352cc();
    if (!isdefined(level.var_1dce56cc) || kill_count < level.var_1dce56cc) {
        level.var_1dce56cc = kill_count;
    }
}

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 1, eflags: 0x5 linked
// Checksum 0x16841fcb, Offset: 0x210
// Size: 0xb4
function private on_end(round_reset) {
    self.active = 0;
    zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 4);
    level.var_1dce56cc = level.n_total_kills + randomintrangeinclusive(15, 25);
    zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
    zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x4c9ed45b, Offset: 0x2d0
// Size: 0x56
function is_active() {
    challenge = zm_trial::function_a36e8c38(#"no_powerups");
    return isdefined(challenge) && isdefined(challenge.active) && challenge.active;
}

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xb96d5548, Offset: 0x330
// Size: 0xfa
function function_2fc5f13() {
    challenge = zm_trial::function_a36e8c38(#"no_powerups");
    assert(isdefined(challenge));
    var_5843af96 = zm_round_logic::get_zombie_count_for_round(level.round_number, getplayers().size);
    frac = math::clamp(challenge.enemies_killed / var_5843af96, 0, 1);
    modifier = lerpfloat(25, 40, frac);
    return modifier;
}

// Namespace zm_trial_no_powerups/zm_trial_no_powerups
// Params 1, eflags: 0x5 linked
// Checksum 0x5594d037, Offset: 0x438
// Size: 0x98
function private function_138aec8e(attacker) {
    if (!isplayer(attacker) && !(isdefined(self.nuked) && self.nuked)) {
        return;
    }
    challenge = zm_trial::function_a36e8c38(#"no_powerups");
    assert(isdefined(challenge));
    challenge.enemies_killed++;
}

