#using scripts\core_common\aat_shared;
#using scripts\core_common\activecamo_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\trials\zm_trial_disable_upgraded_weapons;
#using scripts\zm_common\util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_camos;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_pap_util;

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 0, eflags: 0x0
// Checksum 0x39cb9daf, Offset: 0x1d0
// Size: 0x24
function function_a81f02e5() {
    callback::function_33f0ddd3(&function_33f0ddd3);
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 0, eflags: 0x0
// Checksum 0xf6deb3f5, Offset: 0x200
// Size: 0x7e
function init_parameters() {
    if (!isdefined(level.pack_a_punch)) {
        level.pack_a_punch = spawnstruct();
        level.pack_a_punch.timeout = 15;
        level.pack_a_punch.interaction_height = 35;
        level.pack_a_punch.grabbable_by_anyone = 0;
        level.pack_a_punch.triggers = [];
    }
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x71f8ba0f, Offset: 0x288
// Size: 0x32
function set_timeout(n_timeout_s) {
    init_parameters();
    level.pack_a_punch.timeout = n_timeout_s;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x2af0d4a9, Offset: 0x2c8
// Size: 0x32
function set_interaction_height(n_height) {
    init_parameters();
    level.pack_a_punch.interaction_height = n_height;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x3ee114d9, Offset: 0x308
// Size: 0x32
function function_11f3a609(n_width) {
    init_parameters();
    level.pack_a_punch.var_280e196b = n_width;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x1a42eef, Offset: 0x348
// Size: 0x32
function function_530eb959(n_length) {
    init_parameters();
    level.pack_a_punch.var_c89ce627 = n_length;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x2fcd3e91, Offset: 0x388
// Size: 0x32
function set_interaction_trigger_height(n_height) {
    init_parameters();
    level.pack_a_punch.interaction_trigger_height = n_height;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0xba8b42f1, Offset: 0x3c8
// Size: 0x32
function function_11fdb083(n_offset) {
    init_parameters();
    level.pack_a_punch.var_11fdb083 = n_offset;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 0, eflags: 0x0
// Checksum 0x6732c9f9, Offset: 0x408
// Size: 0x2a
function set_grabbable_by_anyone() {
    init_parameters();
    level.pack_a_punch.grabbable_by_anyone = 1;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x67cb129a, Offset: 0x440
// Size: 0x770
function update_hint_string(player) {
    pap_machine = self.stub.zbarrier;
    if (!pap_machine flag::get("pap_waiting_for_user")) {
        if (pap_machine.pack_player === player) {
            if (pap_machine flag::get("pap_offering_gun")) {
                var_12680c28 = player getcurrentweapon();
                if (var_12680c28 != level.weaponnone) {
                    if (function_8b1a219a()) {
                        self sethintstring(#"hash_21247f6d4bd72b9");
                    } else {
                        self sethintstring(#"hash_51194149fb39a693");
                    }
                    return true;
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } else {
            self sethintstring(#"hash_5b77a8f33d352c37");
            return true;
        }
    }
    w_current = player getcurrentweapon();
    b_weapon_supports_aat = zm_weapons::weapon_supports_aat(w_current);
    if (pap_machine flag::get("pap_in_retrigger_delay") || !player player_use_can_pack_now(pap_machine) || player bgb::is_active(#"zm_bgb_ephemeral_enhancement")) {
        if (zm_utility::is_standard()) {
            if (!zm_custom::function_901b751c(#"zmsuperpapenabled") || !b_weapon_supports_aat) {
                self sethintstringforplayer(player, #"hash_fea06394ae21371");
                return true;
            } else if (isdefined(player.var_486c9d59) && player.var_486c9d59) {
                return true;
            }
        }
        return false;
    }
    if (zm_trial_disable_buys::is_active()) {
        self sethintstring(#"hash_55d25caf8f7bbb2f");
        return true;
    }
    if (zm_trial_disable_upgraded_weapons::is_active()) {
        return false;
    }
    var_cbf27833 = zm_weapons::is_weapon_upgraded(w_current);
    current_cost = pap_machine function_aaf2d8(player, w_current, b_weapon_supports_aat, var_cbf27833);
    if (isdefined(level.var_3e3d6409) && self [[ level.var_3e3d6409 ]](player)) {
        if (isdefined(player.var_486c9d59) && player.var_486c9d59) {
            return false;
        }
        return true;
    }
    if (var_cbf27833 && b_weapon_supports_aat) {
        if (isdefined(level.var_e4e8d300) && level.var_e4e8d300) {
            if (player function_7352d8cc(w_current)) {
                if (function_8b1a219a()) {
                    self sethintstring(#"hash_1a0df3bc59a8029b");
                } else {
                    self sethintstring(#"hash_11c1749ce5b09c1f");
                }
            } else if (function_8b1a219a()) {
                self sethintstring(#"hash_4614bd9a185769d4");
            } else {
                self sethintstring(#"hash_3dfc1041d71fc05e");
            }
        } else if (isdefined(pap_machine.var_b64e889a) && pap_machine.var_b64e889a) {
            if (player function_7352d8cc(w_current)) {
                if (function_8b1a219a()) {
                    self sethintstring(#"hash_23e352cd04548513", current_cost);
                } else {
                    self sethintstring(#"hash_6cd48e5ddab079ed", current_cost);
                }
            } else if (function_8b1a219a()) {
                self sethintstring(#"hash_6942dfa9737b6ac8", current_cost);
            } else {
                self sethintstring(#"hash_117f528808767024", current_cost);
            }
        } else if (player function_7352d8cc(w_current)) {
            if (function_8b1a219a()) {
                self sethintstring(#"hash_7f57747f6802bc18", current_cost);
            } else {
                self sethintstring(#"hash_673794817f9c09b4", current_cost);
            }
        } else if (function_8b1a219a()) {
            self sethintstring(#"hash_4ded27bb7bc35a8d", current_cost);
        } else {
            self sethintstring(#"hash_4c9d507af46126af", current_cost);
        }
    } else if (isdefined(level.var_e4e8d300) && level.var_e4e8d300) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_12517f2f23bd1966");
        } else {
            self sethintstring(#"hash_6c8cfa12133d4a58");
        }
    } else if (function_8b1a219a()) {
        self sethintstring(#"hash_4b18cdd522ca58f7", current_cost);
    } else {
        self sethintstring(#"zombie/perk_packapunch", current_cost);
    }
    return true;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 4, eflags: 0x0
// Checksum 0x36531c31, Offset: 0xbb8
// Size: 0x230
function function_aaf2d8(player, weapon, b_weapon_supports_aat, var_a86430cb) {
    var_6224cea8 = player function_7352d8cc(weapon);
    if (zombie_utility::get_zombie_var(#"zombie_powerup_bonfire_sale_on")) {
        var_376755db = 1000;
        if (b_weapon_supports_aat && var_a86430cb) {
            if (var_6224cea8) {
                var_376755db = 300;
            } else {
                var_376755db = 500;
            }
        }
        if (isdefined(level.var_bceee222)) {
            var_376755db = int(min(var_376755db, level.var_bceee222));
        }
        return var_376755db;
    }
    if (isdefined(level.var_bceee222)) {
        var_376755db = level.var_bceee222;
    } else {
        var_376755db = 5000;
        if (b_weapon_supports_aat && var_a86430cb) {
            if (var_6224cea8) {
                var_376755db = 1500;
            } else {
                var_376755db = 2500;
            }
        }
    }
    if (isdefined(player.talisman_weapon_reducepapcost) && player.talisman_weapon_reducepapcost) {
        var_376755db -= player.talisman_weapon_reducepapcost;
    }
    var_376755db = int(max(10, var_376755db));
    if (isdefined(level.var_66153d2c)) {
        foreach (var_f403380b in level.var_66153d2c) {
            if (var_f403380b === weapon) {
                var_376755db = 0;
            }
        }
    }
    return var_376755db;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 12, eflags: 0x0
// Checksum 0x21ed0a2c, Offset: 0xdf0
// Size: 0x1c2
function function_873e8824(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (!isplayer(attacker) || !isdefined(weapon) || !isdefined(meansofdeath)) {
        return damage;
    }
    if (isplayer(inflictor) || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_GRENADE" || meansofdeath == "MOD_GRENADE_SPLASH" || meansofdeath == "MOD_IMPACT") {
        var_f651a2e7 = attacker function_6d45375a(weapon);
        damage = int(damage * var_f651a2e7);
        if (isdefined(attacker.var_b01de37) && isdefined(self.var_d1c70689)) {
            damage = self [[ self.var_d1c70689 ]](inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype);
        }
    }
    return damage;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 2, eflags: 0x4
// Checksum 0x96d47cbe, Offset: 0xfc0
// Size: 0xfe
function private can_pack_weapon(weapon, pap_machine) {
    if (weapon.isriotshield) {
        return false;
    }
    if (!pap_machine flag::get("pap_waiting_for_user")) {
        return true;
    }
    if (!(isdefined(level.b_allow_idgun_pap) && level.b_allow_idgun_pap) && isdefined(level.idgun_weapons)) {
        if (isinarray(level.idgun_weapons, weapon)) {
            return false;
        }
    }
    weapon = self zm_weapons::get_nonalternate_weapon(weapon);
    if (!zm_weapons::is_weapon_or_base_included(weapon)) {
        return false;
    }
    if (!self zm_weapons::can_upgrade_weapon(weapon)) {
        return false;
    }
    return true;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x4
// Checksum 0x2cffa00a, Offset: 0x10c8
// Size: 0x122
function private player_use_can_pack_now(pap_machine) {
    if (self laststand::player_is_in_laststand() || isdefined(self.intermission) && self.intermission || self isthrowinggrenade()) {
        return false;
    }
    if (!self zm_magicbox::can_buy_weapon(0) || self bgb::is_enabled(#"zm_bgb_disorderly_combat")) {
        return false;
    }
    if (self zm_equipment::hacker_active()) {
        return false;
    }
    current_weapon = self getcurrentweapon();
    if (!self can_pack_weapon(current_weapon, pap_machine) && !zm_weapons::weapon_supports_aat(current_weapon)) {
        return false;
    }
    return true;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 2, eflags: 0x0
// Checksum 0x82f1fe9e, Offset: 0x11f8
// Size: 0x15c
function repack_weapon(weapon, n_repacks) {
    if (!isdefined(self.var_2843d3cc)) {
        self.var_2843d3cc = [];
    } else if (!isarray(self.var_2843d3cc)) {
        self.var_2843d3cc = array(self.var_2843d3cc);
    }
    w_original = weapon;
    weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(n_repacks)) {
        n_repacks = math::clamp(n_repacks, 0, 4);
        self.var_2843d3cc[weapon] = n_repacks;
    } else {
        if (!isdefined(self.var_2843d3cc[weapon])) {
            self.var_2843d3cc[weapon] = 0;
        }
        if (self.var_2843d3cc[weapon] < 4) {
            self.var_2843d3cc[weapon]++;
        }
    }
    if (self.var_2843d3cc[weapon] == 4) {
        self activecamo::function_896ac347(w_original, #"pap_weapon_double_packed", 1);
    }
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x8eff596c, Offset: 0x1360
// Size: 0x8c
function function_c01d9f22(weapon) {
    w_original = weapon;
    weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(self.var_2843d3cc) && isdefined(self.var_2843d3cc[weapon])) {
        self.var_2843d3cc[weapon] = undefined;
        self zm_camos::function_a24c564f(#"hash_bc45c49c8304dc8", weapon);
    }
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x447a4b99, Offset: 0x13f8
// Size: 0x66
function function_b81da3fd(weapon) {
    weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(self.var_2843d3cc) && isdefined(self.var_2843d3cc[weapon]) && self.var_2843d3cc[weapon] > 0) {
        return true;
    }
    return false;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x9e702958, Offset: 0x1468
// Size: 0x68
function function_7352d8cc(weapon) {
    weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(self.var_2843d3cc) && isdefined(self.var_2843d3cc[weapon]) && self.var_2843d3cc[weapon] == 4) {
        return true;
    }
    return false;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0x74299142, Offset: 0x14d8
// Size: 0x58
function function_83c29ddb(weapon) {
    weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(self.var_2843d3cc) && isdefined(self.var_2843d3cc[weapon])) {
        return self.var_2843d3cc[weapon];
    }
    return 0;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x0
// Checksum 0xcd93662f, Offset: 0x1538
// Size: 0x8e
function function_6d45375a(weapon) {
    weapon = zm_weapons::function_93cd8e76(weapon);
    n_multiplier = 1;
    if (isdefined(self.var_2843d3cc) && isdefined(self.var_2843d3cc[weapon])) {
        n_multiplier += (2 - 1) * self.var_2843d3cc[weapon] / 4;
    }
    return n_multiplier;
}

// Namespace zm_pap_util/zm_pack_a_punch_util
// Params 1, eflags: 0x4
// Checksum 0x8c81d713, Offset: 0x15d0
// Size: 0x54
function private function_33f0ddd3(s_event) {
    if (s_event.event === "take_weapon" && isdefined(s_event.weapon)) {
        self function_c01d9f22(s_event.weapon);
    }
}

