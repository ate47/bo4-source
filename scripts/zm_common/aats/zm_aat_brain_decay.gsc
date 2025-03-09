#using scripts\core_common\aat_shared;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\trials\zm_trial_headshots_only;
#using scripts\zm_common\zm_stats;

#namespace zm_aat_brain_decay;

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 0, eflags: 0x2
// Checksum 0xee22878f, Offset: 0x178
// Size: 0x3c
function autoexec __init__system__() {
    system::register("zm_aat_brain_decay", &__init__, undefined, #"aat");
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 0, eflags: 0x0
// Checksum 0x705a4883, Offset: 0x1c0
// Size: 0x144
function __init__() {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    aat::register("zm_aat_brain_decay", 0.25, 0, 48, 5, 0, &result, "t7_hud_zm_aat_turned", "wpn_aat_turned_plr", &function_682e5375, 1);
    clientfield::register("actor", "zm_aat_brain_decay", 1, 1, "int");
    clientfield::register("vehicle", "zm_aat_brain_decay", 1, 1, "int");
    clientfield::register("actor", "zm_aat_brain_decay_exp", 1, 1, "counter");
    clientfield::register("vehicle", "zm_aat_brain_decay_exp", 1, 1, "counter");
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 4, eflags: 0x0
// Checksum 0xb4573efd, Offset: 0x310
// Size: 0x1ec
function result(death, attacker, mod, weapon) {
    self thread clientfield::set("zm_aat_brain_decay", 1);
    self thread zombie_death_time_limit(attacker, weapon);
    self.team = #"allies";
    self.aat_turned = 1;
    self.n_aat_turned_zombie_kills = 0;
    self.var_16d0eb06 = 20000;
    self.takedamage = 0;
    self.allowdeath = 0;
    self.allowpain = 0;
    self.b_ignore_cleanup = 1;
    if (self.archetype === #"zombie") {
        self zombie_utility::set_zombie_run_cycle("super_sprint");
        if (math::cointoss()) {
            if (self.zombie_arms_position == "up") {
                self.variant_type = 6;
            } else {
                self.variant_type = 7;
            }
        } else if (self.zombie_arms_position == "up") {
            self.variant_type = 7;
        } else {
            self.variant_type = 8;
        }
    }
    if (isplayer(attacker)) {
        attacker zm_stats::increment_challenge_stat(#"zombie_hunter_brain_decay");
        self.var_443d78cc = attacker;
    }
    self thread function_8e97a3a4(attacker, weapon);
    self thread zombie_kill_tracker(attacker);
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 2, eflags: 0x0
// Checksum 0xd9daecfb, Offset: 0x508
// Size: 0x208
function function_8e97a3a4(attacker, weapon) {
    var_3c9de13d = self.origin;
    a_ai_zombies = array::get_all_closest(var_3c9de13d, getaiteamarray(#"axis"), undefined, undefined, 90);
    if (!isdefined(a_ai_zombies)) {
        return;
    }
    var_2cc3b86b = 8100;
    n_flung_zombies = 0;
    for (i = 0; i < a_ai_zombies.size; i++) {
        if (!isdefined(a_ai_zombies[i]) || !isalive(a_ai_zombies[i])) {
            continue;
        }
        if (isdefined(level.aat[#"zm_aat_brain_decay"].immune_result_indirect[a_ai_zombies[i].archetype]) && level.aat[#"zm_aat_brain_decay"].immune_result_indirect[a_ai_zombies[i].archetype]) {
            continue;
        }
        if (a_ai_zombies[i] == self) {
            continue;
        }
        v_curr_zombie_origin = a_ai_zombies[i] getcentroid();
        if (distancesquared(var_3c9de13d, v_curr_zombie_origin) > var_2cc3b86b) {
            continue;
        }
        a_ai_zombies[i] function_fef86dd4(var_3c9de13d, 20000, attacker, weapon);
        n_flung_zombies++;
        if (-1 && n_flung_zombies >= 3) {
            break;
        }
    }
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 4, eflags: 0x4
// Checksum 0x4be31d57, Offset: 0x718
// Size: 0x164
function private function_fef86dd4(var_c5ad44f1, n_damage, e_attacker, weapon) {
    if (zm_trial_headshots_only::is_active()) {
        return;
    }
    v_curr_zombie_origin = self getcentroid();
    self dodamage(n_damage, v_curr_zombie_origin, e_attacker, e_attacker, undefined, "MOD_AAT", 0, weapon);
    if (isalive(self)) {
        self zombie_utility::setup_zombie_knockdown(var_c5ad44f1);
        return;
    }
    n_random_x = randomfloatrange(-3, 3);
    n_random_y = randomfloatrange(-3, 3);
    self startragdoll(1);
    self launchragdoll(60 * vectornormalize(v_curr_zombie_origin - var_c5ad44f1 + (n_random_x, n_random_y, 10)), "torso_lower");
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 0, eflags: 0x0
// Checksum 0x8566cac5, Offset: 0x888
// Size: 0x126
function function_682e5375() {
    if (isdefined(level.aat[#"zm_aat_brain_decay"].immune_result_direct[self.archetype]) && level.aat[#"zm_aat_brain_decay"].immune_result_direct[self.archetype]) {
        return false;
    }
    if (isdefined(self.barricade_enter) && self.barricade_enter) {
        return false;
    }
    if (isdefined(self.is_traversing) && self.is_traversing) {
        return false;
    }
    if (isdefined(self.var_69a981e6) && self.var_69a981e6) {
        return false;
    }
    if (!(isdefined(self.completed_emerging_into_playable_area) && self.completed_emerging_into_playable_area)) {
        return false;
    }
    if (isdefined(self.is_leaping) && self.is_leaping) {
        return false;
    }
    if (isdefined(level.var_b897ed83) && !self [[ level.var_b897ed83 ]]()) {
        return false;
    }
    return true;
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 2, eflags: 0x0
// Checksum 0x2d809d31, Offset: 0x9b8
// Size: 0x12c
function zombie_death_time_limit(e_attacker, weapon) {
    self endon(#"death");
    level endoncallback(&function_a22e41ec, #"end_game", #"restart_round");
    self waittilltimeout(8, #"hash_1bbb03bd582e937f");
    var_8651a024 = self getcentroid();
    self clientfield::set("zm_aat_brain_decay", 0);
    self clientfield::increment("zm_aat_brain_decay_exp", 1);
    waitframe(1);
    self.takedamage = 1;
    self.allowdeath = 1;
    self zombie_death_explosion(var_8651a024, e_attacker, weapon);
    self zombie_death_gib(e_attacker, weapon);
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 1, eflags: 0x0
// Checksum 0x45850472, Offset: 0xaf0
// Size: 0x160
function function_a22e41ec(_hash) {
    if (!isdefined(level.ai)) {
        return;
    }
    self notify("dad16f153c7d14b");
    self endon("dad16f153c7d14b");
    ai_zombies = getaiteamarray(#"axis", #"allies");
    foreach (ai in ai_zombies) {
        if (isalive(ai) && isdefined(ai.aat_turned) && ai.aat_turned) {
            ai.takedamage = 1;
            ai.allowdeath = 1;
            waitframe(1);
            if (isalive(ai)) {
                ai kill();
            }
        }
    }
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 3, eflags: 0x0
// Checksum 0xfc2f5ff2, Offset: 0xc58
// Size: 0x206
function zombie_death_explosion(var_58928a4b, e_attacker, weapon) {
    a_ai_zombies = array::get_all_closest(var_58928a4b, getaiteamarray(#"axis"), undefined, undefined, 160);
    if (!isdefined(a_ai_zombies)) {
        return;
    }
    var_2cc3b86b = 25600;
    n_flung_zombies = 0;
    for (i = 0; i < a_ai_zombies.size; i++) {
        if (!isdefined(a_ai_zombies[i]) || !isalive(a_ai_zombies[i])) {
            continue;
        }
        if (isdefined(level.aat[#"zm_aat_brain_decay"].immune_result_indirect[a_ai_zombies[i].archetype]) && level.aat[#"zm_aat_brain_decay"].immune_result_indirect[a_ai_zombies[i].archetype]) {
            continue;
        }
        if (a_ai_zombies[i] == self) {
            continue;
        }
        v_curr_zombie_origin = a_ai_zombies[i] getcentroid();
        if (distancesquared(var_58928a4b, v_curr_zombie_origin) > var_2cc3b86b) {
            continue;
        }
        a_ai_zombies[i] function_fef86dd4(var_58928a4b, 20000, e_attacker, weapon);
        util::wait_network_frame(randomintrange(1, 3));
    }
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 1, eflags: 0x0
// Checksum 0xddf69ad2, Offset: 0xe68
// Size: 0x86
function zombie_kill_tracker(e_attacker) {
    self endon(#"death");
    var_a57adbdc = 1;
    while (self.n_aat_turned_zombie_kills < 6) {
        if (!isdefined(self.favoriteenemy)) {
            if (!var_a57adbdc) {
                break;
            }
            var_a57adbdc = 0;
        } else {
            var_a57adbdc = 1;
        }
        wait 1;
    }
    self notify(#"hash_1bbb03bd582e937f");
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 2, eflags: 0x0
// Checksum 0xeab78241, Offset: 0xef8
// Size: 0x10c
function zombie_death_gib(e_attacker, weapon) {
    gibserverutils::gibhead(self);
    if (math::cointoss()) {
        gibserverutils::gibleftarm(self);
    } else {
        gibserverutils::gibrightarm(self);
    }
    gibserverutils::giblegs(self);
    if (isdefined(level.headshots_only) && level.headshots_only || zm_trial_headshots_only::is_active()) {
        self kill();
        return;
    }
    self dodamage(self.health, self.origin, e_attacker, undefined, undefined, "MOD_AAT", 0, weapon);
}

