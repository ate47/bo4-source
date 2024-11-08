#using script_24c32478acf44108;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\aat_shared.gsc;

#namespace zm_aat_frostbite;

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 0, eflags: 0x2
// Checksum 0x97075212, Offset: 0x188
// Size: 0x3c
function autoexec __init__system__() {
    system::register("zm_aat_frostbite", &__init__, undefined, #"aat");
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 0, eflags: 0x1 linked
// Checksum 0x4346a532, Offset: 0x1d0
// Size: 0x164
function __init__() {
    if (!(isdefined(level.aat_in_use) && level.aat_in_use)) {
        return;
    }
    aat::register("zm_aat_frostbite", 0.75, 0, 0, 0, 1, &result, "t7_hud_zm_aat_thunderwall", "wpn_aat_thunder_wall_plr", undefined, 4);
    clientfield::register("actor", "zm_aat_frostbite_trail_clientfield", 1, 1, "int");
    clientfield::register("vehicle", "zm_aat_frostbite_trail_clientfield", 1, 1, "int");
    clientfield::register("actor", "zm_aat_frostbite_explosion_clientfield", 1, 1, "counter");
    clientfield::register("vehicle", "zm_aat_frostbite_explosion_clientfield", 1, 1, "counter");
    namespace_9ff9f642::register_slowdown(#"hash_7cb479d48ba9bbd6", 0.1, 3);
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 4, eflags: 0x1 linked
// Checksum 0x1111d934, Offset: 0x340
// Size: 0x104
function result(death, attacker, mod, weapon) {
    self notify(#"hash_3c2776b4262d3359");
    self endon(#"hash_3c2776b4262d3359");
    if (!isactor(self) && !isvehicle(self)) {
        return;
    }
    if (isdefined(self.aat_turned) && self.aat_turned) {
        return;
    }
    if (death && function_a2e05e6(attacker)) {
        level thread frostbite_explosion(self, self.origin, attacker, mod, weapon);
        return;
    }
    self thread function_158a3a18(attacker, mod, weapon);
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 1, eflags: 0x5 linked
// Checksum 0x50c0d48, Offset: 0x450
// Size: 0xce
function private function_a2e05e6(e_attacker) {
    n_current_time = float(gettime()) / 1000;
    if (isplayer(e_attacker)) {
        if (!isdefined(e_attacker.aat_cooldown_start[#"zm_aat_frostbite_explosion"])) {
            return true;
        } else if (isdefined(e_attacker.aat_cooldown_start[#"zm_aat_frostbite_explosion"]) && n_current_time >= e_attacker.aat_cooldown_start[#"zm_aat_frostbite_explosion"] + 30) {
            return true;
        }
    }
    return false;
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 4, eflags: 0x1 linked
// Checksum 0xe2e5b37e, Offset: 0x528
// Size: 0x1c4
function function_158a3a18(attacker, mod, weapon, var_e1ec1eee = 0) {
    self endon(#"death");
    if (!isdefined(self.var_cbf4894c)) {
        self.var_cbf4894c = 1;
    } else if (self.var_cbf4894c <= 0.4) {
        return;
    }
    if (!isdefined(weapon) || !isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (var_e1ec1eee) {
        self.var_cbf4894c = 0.4;
    } else {
        n_baseweapon = zm_weapons::get_base_weapon(weapon);
        var_fa87e189 = n_baseweapon.firetime;
        self.var_cbf4894c -= var_fa87e189 * 1.5;
        if (self.var_cbf4894c <= 0.4) {
            self.var_cbf4894c = 0.4;
        }
    }
    self clientfield::set("zm_aat_frostbite_trail_clientfield", 1);
    self thread namespace_9ff9f642::slowdown(#"hash_7cb479d48ba9bbd6", self.var_cbf4894c);
    self thread function_dab102b8(attacker, weapon);
    self thread function_35d3ac3b();
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 2, eflags: 0x1 linked
// Checksum 0xb83d35b2, Offset: 0x6f8
// Size: 0x116
function function_dab102b8(e_attacker, weapon) {
    self notify(#"hash_6f92e6943e40092b");
    self endon(#"hash_6f92e6943e40092b", #"death");
    for (i = 0; i < 8; i++) {
        wait 0.375;
        self.var_cbf4894c += 0.125;
        if (self.var_cbf4894c >= 1) {
            break;
        }
        self thread namespace_9ff9f642::slowdown(#"hash_7cb479d48ba9bbd6", self.var_cbf4894c);
    }
    self clientfield::set("zm_aat_frostbite_trail_clientfield", 0);
    self.var_cbf4894c = 1;
    self notify(#"hash_652c15c8a7e2949");
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 3, eflags: 0x1 linked
// Checksum 0x421e6b02, Offset: 0x818
// Size: 0xec
function function_35d3ac3b(attacker, mod, weapon) {
    self notify(#"hash_b04750a529cb350");
    self endon(#"hash_b04750a529cb350", #"hash_652c15c8a7e2949");
    self waittill(#"death");
    if (isdefined(self)) {
        if (self.var_cbf4894c <= 0.6 && function_a2e05e6(attacker)) {
            level thread frostbite_explosion(self, self.origin, attacker, mod, weapon);
            return;
        }
        self namespace_9ff9f642::function_520f4da5(#"hash_7cb479d48ba9bbd6");
    }
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 5, eflags: 0x1 linked
// Checksum 0x3e6f324a, Offset: 0x910
// Size: 0x2a8
function frostbite_explosion(var_4589e270, var_23255fc5, attacker, mod, weapon) {
    if (randomfloat(100) > 40) {
        return;
    }
    var_4589e270 clientfield::increment("zm_aat_frostbite_explosion_clientfield");
    if (isplayer(attacker)) {
        attacker.aat_cooldown_start[#"zm_aat_frostbite_explosion"] = float(gettime()) / 1000;
        attacker zm_stats::increment_challenge_stat(#"zombie_hunter_frostbite");
    }
    a_potential_targets = array::get_all_closest(var_23255fc5, level.ai[#"axis"], undefined, undefined, 128);
    foreach (e_target in a_potential_targets) {
        if (!isalive(e_target)) {
            continue;
        }
        if (isdefined(level.aat[#"zm_aat_frostbite"].immune_result_indirect[e_target.archetype]) && level.aat[#"zm_aat_frostbite"].immune_result_indirect[e_target.archetype]) {
            return;
        }
        if (!(isdefined(e_target.var_7cc959b1) && e_target.var_7cc959b1)) {
            continue;
        }
        if (var_4589e270 === e_target) {
            continue;
        }
        e_target function_11c85ac6(var_23255fc5, attacker, weapon);
        if (isalive(e_target)) {
            e_target thread function_158a3a18(attacker, mod, weapon, 1);
        }
        util::wait_network_frame();
    }
}

// Namespace zm_aat_frostbite/zm_aat_frostbite
// Params 3, eflags: 0x1 linked
// Checksum 0xb329e179, Offset: 0xbc0
// Size: 0xbc
function function_11c85ac6(var_23255fc5, e_attacker, weapon) {
    n_damage = 20000;
    self dodamage(n_damage, var_23255fc5, e_attacker, undefined, "none", "MOD_AAT", 0, weapon);
    if (!isalive(self) && isplayer(e_attacker)) {
        e_attacker zm_stats::increment_challenge_stat(#"zombie_hunter_frostbite");
    }
}

