#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_utility;

#namespace namespace_a476311c;

// Namespace namespace_a476311c/namespace_a476311c
// Params 0, eflags: 0x2
// Checksum 0x3a4d8821, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_7ceb08aa364e4596", &__init__, undefined, undefined);
}

// Namespace namespace_a476311c/namespace_a476311c
// Params 0, eflags: 0x0
// Checksum 0xed8d6fea, Offset: 0xf0
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"hash_250115340b2e27a5", &on_begin, &on_end);
}

// Namespace namespace_a476311c/namespace_a476311c
// Params 4, eflags: 0x4
// Checksum 0x1c76b340, Offset: 0x158
// Size: 0x114
function private on_begin(var_b9c6550, var_50d1120, var_43f824d6, var_73d6ae36) {
    if (isdefined(var_b9c6550)) {
        self.var_97330ad2 = zm_trial::function_5769f26a(var_b9c6550);
    } else {
        self.var_97330ad2 = 25;
    }
    if (isdefined(var_50d1120)) {
        self.var_6633a592 = zm_trial::function_5769f26a(var_50d1120);
    } else {
        self.var_6633a592 = 8;
    }
    if (isdefined(var_43f824d6)) {
        self.var_ead3a0f2 = zm_trial::function_5769f26a(var_43f824d6);
    } else {
        self.var_ead3a0f2 = 1.1;
    }
    if (isdefined(var_73d6ae36)) {
        var_73d6ae36 = zm_trial::function_5769f26a(var_73d6ae36);
    }
    self thread function_e997bb0b(var_73d6ae36);
    zm_spawner::register_zombie_death_event_callback(&function_138aec8e);
}

// Namespace namespace_a476311c/namespace_a476311c
// Params 1, eflags: 0x4
// Checksum 0xcc5c33b5, Offset: 0x278
// Size: 0x2c
function private on_end(round_reset) {
    zm_spawner::deregister_zombie_death_event_callback(&function_138aec8e);
}

// Namespace namespace_a476311c/namespace_a476311c
// Params 1, eflags: 0x4
// Checksum 0xaed53267, Offset: 0x2b0
// Size: 0x2a4
function private function_e997bb0b(var_73d6ae36) {
    level endon(#"hash_7646638df88a3656", #"end_game");
    if (isdefined(var_73d6ae36)) {
        wait var_73d6ae36;
    } else {
        n_delay = zm_round_logic::get_delay_between_rounds();
        wait n_delay + 0;
    }
    while (true) {
        foreach (player in getplayers()) {
            /#
                if (isgodmode(player) || player isinmovemode("<dev string:x38>", "<dev string:x41>")) {
                    continue;
                }
            #/
            if (player.health > 0 && !player laststand::player_is_in_laststand() && !(isdefined(player.var_eb319d10) && player.var_eb319d10) && !(isdefined(level.intermission) && level.intermission)) {
                if (player.health <= self.var_6633a592) {
                    if (zm_utility::is_magic_bullet_shield_enabled(player)) {
                        player util::stop_magic_bullet_shield();
                    }
                    player dodamage(player.health + 1000, player.origin);
                    continue;
                }
                if (isdefined(player.armor) && player.armor > 0) {
                    player dodamage(self.var_6633a592 + 5, player.origin);
                    continue;
                }
                player dodamage(self.var_6633a592, player.origin);
            }
        }
        wait self.var_ead3a0f2;
    }
}

// Namespace namespace_a476311c/namespace_a476311c
// Params 0, eflags: 0x4
// Checksum 0x88d5f565, Offset: 0x560
// Size: 0xd2
function private function_49091c27() {
    challenge = zm_trial::function_a36e8c38(#"hash_250115340b2e27a5");
    assert(isdefined(challenge));
    new_health = self.health + challenge.var_97330ad2;
    self.health = int(math::clamp(floor(new_health), 0, max(self.maxhealth, self.var_66cb03ad)));
}

// Namespace namespace_a476311c/namespace_a476311c
// Params 1, eflags: 0x4
// Checksum 0x6a3c5db9, Offset: 0x640
// Size: 0xcc
function private function_138aec8e(attacker) {
    if (isdefined(self.nuked) && self.nuked) {
        foreach (player in getplayers()) {
            player function_49091c27();
        }
        return;
    }
    if (isplayer(attacker)) {
        attacker function_49091c27();
    }
}

