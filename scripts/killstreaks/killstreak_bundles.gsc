// Atian COD Tools GSC decompiler test
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace killstreak_bundles;

// Namespace killstreak_bundles/killstreak_bundles
// Params 1, eflags: 0x1 linked
// Checksum 0xf9d028c1, Offset: 0x1f8
// Size: 0xac
function register_killstreak_bundle(type) {
    level.killstreakbundle[type] = struct::get_script_bundle("killstreak", "killstreak_" + type);
    level.killstreakbundle["inventory_" + type] = level.killstreakbundle[type];
    level.killstreakmaxhealthfunction = &get_max_health;
    assert(isdefined(level.killstreakbundle[type]));
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 2, eflags: 0x1 linked
// Checksum 0x7bb645c, Offset: 0x2b0
// Size: 0x6c
function register_bundle(type, bundle) {
    level.killstreakbundle[type] = bundle;
    level.killstreakmaxhealthfunction = &get_max_health;
    assert(isdefined(level.killstreakbundle[type]));
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 1, eflags: 0x1 linked
// Checksum 0xd604cb83, Offset: 0x328
// Size: 0xaa
function get_bundle(killstreak) {
    if (killstreak.archetype === "raps") {
        return level.killstreakbundle[#"raps_drone"];
    }
    if (killstreak.killstreaktype === "drone_squadron" && sessionmodeiscampaigngame()) {
        return level.killstreakbundle["drone_squadron" + "_cp"];
    }
    return level.killstreakbundle[killstreak.killstreaktype];
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 1, eflags: 0x1 linked
// Checksum 0x8e94a788, Offset: 0x3e0
// Size: 0x1a
function spawned(bundle) {
    self.var_22a05c26 = bundle;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x26b9e3d3, Offset: 0x408
// Size: 0xa
function function_48e9536e() {
    return self.var_22a05c26;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x6fd1d0c3, Offset: 0x420
// Size: 0x22
function get_hack_timeout() {
    return get_bundle(self).kshacktimeout;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x48312667, Offset: 0x450
// Size: 0x48
function get_hack_protection() {
    return isdefined(get_bundle(self).kshackprotection) ? get_bundle(self).kshackprotection : 0;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x474ac5d3, Offset: 0x4a0
// Size: 0x4a
function get_hack_tool_inner_time() {
    return isdefined(get_bundle(self).kshacktoolinnertime) ? get_bundle(self).kshacktoolinnertime : 10000;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0xeb9c0c41, Offset: 0x4f8
// Size: 0x4a
function get_hack_tool_outer_time() {
    return isdefined(get_bundle(self).kshacktooloutertime) ? get_bundle(self).kshacktooloutertime : 10000;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0xdfe8b08d, Offset: 0x550
// Size: 0x4a
function get_hack_tool_inner_radius() {
    return isdefined(get_bundle(self).kshacktoolinnerradius) ? get_bundle(self).kshacktoolinnerradius : 10000;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x407e7325, Offset: 0x5a8
// Size: 0x4a
function get_hack_tool_outer_radius() {
    return isdefined(get_bundle(self).kshacktoolouterradius) ? get_bundle(self).kshacktoolouterradius : 10000;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x1454a4b9, Offset: 0x600
// Size: 0x4a
function get_lost_line_of_sight_limit_msec() {
    return isdefined(get_bundle(self).kshacktoollostlineofsightlimitms) ? get_bundle(self).kshacktoollostlineofsightlimitms : 1000;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x74e48abb, Offset: 0x658
// Size: 0x4a
function get_hack_tool_no_line_of_sight_time() {
    return isdefined(get_bundle(self).kshacktoolnolineofsighttime) ? get_bundle(self).kshacktoolnolineofsighttime : 1000;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x87bd2c7e, Offset: 0x6b0
// Size: 0x48
function get_hack_scoreevent() {
    return isdefined(get_bundle(self).kshackscoreevent) ? get_bundle(self).kshackscoreevent : undefined;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x3d7e30f7, Offset: 0x700
// Size: 0x4e
function get_hack_fx() {
    return isdefined(get_bundle(self).kshackfx) ? get_bundle(self).kshackfx : "";
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 0, eflags: 0x1 linked
// Checksum 0x63695afe, Offset: 0x758
// Size: 0x4e
function get_hack_loop_fx() {
    return isdefined(get_bundle(self).kshackloopfx) ? get_bundle(self).kshackloopfx : "";
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 1, eflags: 0x1 linked
// Checksum 0xc5a49f1c, Offset: 0x7b0
// Size: 0x22
function get_max_health(killstreaktype) {
    return level.killstreakbundle[killstreaktype].kshealth;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 1, eflags: 0x1 linked
// Checksum 0xb713cc4, Offset: 0x7e0
// Size: 0x22
function get_low_health(killstreaktype) {
    return level.killstreakbundle[killstreaktype].kslowhealth;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 1, eflags: 0x1 linked
// Checksum 0x3c517396, Offset: 0x810
// Size: 0x22
function get_hacked_health(killstreaktype) {
    return level.killstreakbundle[killstreaktype].kshackedhealth;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 3, eflags: 0x1 linked
// Checksum 0xc5547d50, Offset: 0x840
// Size: 0x694
function get_shots_to_kill(weapon, meansofdeath, bundle) {
    shotstokill = undefined;
    baseweapon = weapons::getbaseweapon(weapon);
    if (baseweapon === level.weaponflechette && weaponhasattachment(weapon, "uber")) {
        if (bundle.var_d3413870 === "swat_team" || bundle.var_d3413870 === "overwatch_helicopter") {
            if (isactor(self)) {
                shotstokill = bundle.var_3020f1b2;
            } else {
                shotstokill = bundle.var_5682dc25;
            }
        } else {
            shotstokill = bundle.var_3020f1b2;
        }
        return (isdefined(shotstokill) ? shotstokill : 0);
    }
    if (baseweapon === level.weaponspecialcrossbow) {
        if (bundle.var_d3413870 === "swat_team" || bundle.var_d3413870 === "overwatch_helicopter") {
            if (isactor(self)) {
                shotstokill = bundle.var_1de74ef1;
            } else {
                shotstokill = bundle.var_63c68981;
            }
        } else {
            shotstokill = bundle.var_1de74ef1;
        }
        return (isdefined(shotstokill) ? shotstokill : 0);
    }
    switch (weapon.rootweapon.name) {
    case #"remote_missile_missile":
        shotstokill = bundle.ksremote_missile_missile;
        break;
    case #"hero_annihilator":
        shotstokill = bundle.kshero_annihilator;
        break;
    case #"hero_bowlauncher2":
    case #"hero_bowlauncher3":
    case #"hero_bowlauncher4":
    case #"sig_bow_quickshot3":
    case #"sig_bow_quickshot2":
    case #"sig_bow_quickshot5":
    case #"sig_bow_quickshot4":
    case #"sig_bow_quickshot":
    case #"hero_bowlauncher":
        if (meansofdeath == "MOD_PROJECTILE_SPLASH" || meansofdeath == "MOD_PROJECTILE" || meansofdeath == "MOD_GRENADE_SPLASH") {
            shotstokill = bundle.kshero_bowlauncher;
        } else {
            shotstokill = -1;
        }
        break;
    case #"eq_gravityslam":
        shotstokill = bundle.kshero_gravityspikes;
        break;
    case #"shock_rifle":
        shotstokill = bundle.var_4be7d629;
        break;
    case #"hero_minigun":
        shotstokill = bundle.kshero_minigun;
        break;
    case #"hero_pineapple_grenade":
    case #"hero_pineapplegun":
        shotstokill = bundle.kshero_pineapplegun;
        break;
    case #"hero_firefly_swarm":
        shotstokill = (isdefined(bundle.kshero_firefly_swarm) ? bundle.kshero_firefly_swarm : 0) * 4;
        break;
    case #"dart_blade":
    case #"dart_turret":
        shotstokill = bundle.ksdartstokill;
        break;
    case #"recon_car":
        shotstokill = bundle.var_8eca21ba;
        break;
    case #"ability_dog":
        shotstokill = bundle.var_a758f9e6;
        break;
    case #"planemortar":
        shotstokill = bundle.var_843b7bd3;
        break;
    case #"gadget_heat_wave":
        shotstokill = bundle.kshero_heatwave;
        break;
    case #"hero_flamethrower":
        if (isdefined(bundle.var_2db988a0) && bundle.var_2db988a0) {
            shotstokill = 1;
        } else {
            shotstokill = bundle.var_2e48926e;
        }
        break;
    case #"eq_concertina_wire":
        if (isdefined(bundle.var_ab14c65a) && bundle.var_ab14c65a) {
            shotstokill = 1;
        }
        break;
    case #"ability_smart_cover":
        if (isdefined(bundle.var_4de0b9db) && bundle.var_4de0b9db) {
            shotstokill = 1;
        } else {
            shotstokill = bundle.var_9efbc14a;
        }
        break;
    case #"hash_17df39d53492b0bf":
        shotstokill = bundle.var_605815a6;
        break;
    case #"hash_7b24d0d0d2823bca":
        shotstokill = bundle.var_50c51e5;
        break;
    case #"ac130_chaingun":
        shotstokill = bundle.var_676a4c7;
        break;
    case #"eq_tripwire":
        shotstokill = bundle.var_8f65bc5d;
        break;
    case #"hatchet":
        shotstokill = bundle.var_8ca2602b;
        break;
    case #"eq_emp_grenade":
        shotstokill = bundle.ksempgrenadestokill;
        break;
    case #"sig_blade":
        shotstokill = bundle.var_5789ac76;
        break;
    }
    return isdefined(shotstokill) ? shotstokill : 0;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 2, eflags: 0x1 linked
// Checksum 0xa114bd40, Offset: 0xee0
// Size: 0xb8
function get_emp_grenade_damage(killstreaktype, maxhealth) {
    emp_weapon_damage = undefined;
    if (isdefined(level.killstreakbundle[killstreaktype])) {
        bundle = level.killstreakbundle[killstreaktype];
        empgrenadestokill = isdefined(bundle.ksempgrenadestokill) ? bundle.ksempgrenadestokill : 0;
        if (empgrenadestokill == 0) {
        } else if (empgrenadestokill > 0) {
            emp_weapon_damage = maxhealth / empgrenadestokill + 1;
        } else {
            emp_weapon_damage = 0;
        }
    }
    return emp_weapon_damage;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 3, eflags: 0x1 linked
// Checksum 0xdd0e7e1e, Offset: 0xfa0
// Size: 0x6e
function function_daad16b8(maxhealth, weapon_damage, var_8cef04) {
    var_8cef04 = isdefined(var_8cef04) ? var_8cef04 : 0;
    if (var_8cef04 == 0) {
    } else if (var_8cef04 > 0) {
        weapon_damage = maxhealth / var_8cef04 + 1;
    } else {
        weapon_damage = 0;
    }
    return weapon_damage;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 2, eflags: 0x1 linked
// Checksum 0xd6173b3a, Offset: 0x1018
// Size: 0x56
function function_14bd8ba5(damage, damage_multiplier) {
    damage_multiplier = isdefined(damage_multiplier) ? damage_multiplier : 0;
    if (damage_multiplier == 0) {
        return undefined;
    } else if (damage_multiplier > 0) {
        return (damage * damage_multiplier);
    }
    return 0;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 2, eflags: 0x1 linked
// Checksum 0x49a83cca, Offset: 0x1078
// Size: 0x5a
function function_6bacfedc(weapon, levelweapon) {
    return isdefined(levelweapon) && weapon.statname == levelweapon.statname && levelweapon.statname != level.weaponnone.statname;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 2, eflags: 0x0
// Checksum 0x1dde0b49, Offset: 0x10e0
// Size: 0x5a
function function_90509610(weapon, levelweapon) {
    return isdefined(levelweapon) && weapon.name == levelweapon.name && levelweapon.statname != level.weaponnone.statname;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 8, eflags: 0x1 linked
// Checksum 0x7b269847, Offset: 0x1148
// Size: 0xba
function get_weapon_damage(killstreaktype, maxhealth, attacker, weapon, type, damage, flags, chargeshotlevel) {
    weapon_damage = undefined;
    if (isdefined(level.killstreakbundle[killstreaktype])) {
        bundle = level.killstreakbundle[killstreaktype];
        weapon_damage = function_dd7587e4(bundle, maxhealth, attacker, weapon, type, damage, flags, chargeshotlevel);
    }
    return weapon_damage;
}

// Namespace killstreak_bundles/killstreak_bundles
// Params 8, eflags: 0x1 linked
// Checksum 0x95fde4e1, Offset: 0x1210
// Size: 0x6aa
function function_dd7587e4(bundle, maxhealth, attacker, weapon, type, damage, flags, chargeshotlevel) {
    weapon_damage = undefined;
    if (isdefined(bundle)) {
        if (isdefined(weapon)) {
            shotstokill = get_shots_to_kill(weapon, type, bundle);
            if (shotstokill == 0) {
            } else if (shotstokill > 0) {
                if (isdefined(chargeshotlevel) && chargeshotlevel > 0) {
                    shotstokill /= chargeshotlevel;
                }
                weapon_damage = maxhealth / shotstokill + 1;
            } else {
                weapon_damage = 0;
            }
        }
        if (!isdefined(weapon_damage)) {
            if (type == "MOD_RIFLE_BULLET" || type == "MOD_PISTOL_BULLET" || type == "MOD_HEAD_SHOT") {
                hasarmorpiercing = isdefined(attacker) && isplayer(attacker) && attacker hasperk(#"specialty_armorpiercing");
                clipstokill = isdefined(bundle.ksclipstokill) ? bundle.ksclipstokill : 0;
                if (clipstokill == -1) {
                    weapon_damage = 0;
                } else if (hasarmorpiercing && self.aitype !== "spawner_bo3_robot_grunt_assault_mp_escort") {
                    weapon_damage = damage + int(damage * level.cac_armorpiercing_data);
                }
                if (weapon.weapclass == "spread") {
                    ksshotgunmultiplier = isdefined(bundle.ksshotgunmultiplier) ? bundle.ksshotgunmultiplier : 1;
                    if (ksshotgunmultiplier == 0) {
                    } else if (ksshotgunmultiplier > 0) {
                        weapon_damage = (isdefined(weapon_damage) ? weapon_damage : damage) * ksshotgunmultiplier;
                    }
                }
            } else if (type == "MOD_IMPACT" && isdefined(level.shockrifleweapon) && function_6bacfedc(weapon, level.shockrifleweapon)) {
                var_108f064f = isdefined(bundle.var_4be7d629) ? bundle.var_4be7d629 : 0;
                if (var_108f064f == 0) {
                } else if (var_108f064f > 0) {
                    weapon_damage = maxhealth / var_108f064f + 1;
                } else {
                    weapon_damage = 0;
                }
            } else if ((type == "MOD_PROJECTILE" || type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE_SPLASH" && bundle.var_38de4989 === 1) && (!isdefined(weapon.isempkillstreak) || !weapon.isempkillstreak) && (!isdefined(level.weaponpistolenergy) || weapon.statname != level.weaponpistolenergy.statname || level.weaponpistolenergy.statname == level.weaponnone.statname) && (!isdefined(level.weaponspecialcrossbow) || weapon.statname != level.weaponspecialcrossbow.statname || level.weaponspecialcrossbow.statname == level.weaponnone.statname) && weapon.rootweapon.name != #"trophy_system") {
                if (function_6bacfedc(weapon, level.weaponshotgunenergy)) {
                    weapon_damage = function_daad16b8(maxhealth, weapon_damage, bundle.ksshotgunenergytokill);
                } else {
                    rocketstokill = isdefined(bundle.ksrocketstokill) ? bundle.ksrocketstokill : 0;
                    if (level.competitivesettingsenabled && isdefined(bundle.var_b744074b) && bundle.var_b744074b != 0) {
                        rocketstokill = bundle.var_b744074b;
                    }
                    if (rocketstokill == 0) {
                    } else if (rocketstokill > 0) {
                        if (weapon.rootweapon.name == "launcher_multi") {
                            rocketstokill *= 2;
                        }
                        weapon_damage = maxhealth / rocketstokill + 1;
                    } else {
                        weapon_damage = 0;
                    }
                }
            } else if ((type == "MOD_GRENADE" || type == "MOD_GRENADE_SPLASH") && (!isdefined(weapon.isempkillstreak) || !weapon.isempkillstreak)) {
                weapon_damage = function_14bd8ba5(damage, bundle.ksgrenadedamagemultiplier);
            } else if (type == "MOD_MELEE_WEAPON_BUTT" || type == "MOD_MELEE") {
                weapon_damage = function_14bd8ba5(damage, bundle.ksmeleedamagemultiplier);
            } else if (type == "MOD_PROJECTILE_SPLASH") {
                weapon_damage = function_14bd8ba5(damage, bundle.ksprojectilespashmultiplier);
            }
        }
    }
    return weapon_damage;
}

