#using script_24c32478acf44108;
#using scripts\core_common\aat_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_weap_tricannon;

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 0, eflags: 0x2
// Checksum 0x9985daa8, Offset: 0x188
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_tricannon", &__init__, undefined, undefined);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 0, eflags: 0x0
// Checksum 0x65b2aadf, Offset: 0x1d0
// Size: 0x516
function __init__() {
    callback::on_ai_damage(&function_79f6f273);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_t8"), &function_68e4ed32);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_t8" + "_upgraded"), &function_68e4ed32);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_earth_t8"), &function_8ef8873e);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_earth_t8" + "_upgraded"), &function_8ef8873e);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_air_t8"), &function_4f2ea5e7);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_air_t8" + "_upgraded"), &function_c8912144);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_fire_t8"), &function_5a24e804);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_fire_t8" + "_upgraded"), &function_5a24e804);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_water_t8"), &function_14d49bd7);
    callback::add_weapon_fired(getweapon(#"ww_tricannon_water_t8" + "_upgraded"), &function_14d49bd7);
    namespace_9ff9f642::register_slowdown(#"hash_7dd6cbed104dd8bd", 0.75, 1);
    namespace_9ff9f642::register_slowdown(#"hash_7eece5e5a5f9cc4d", 0.85, 1);
    namespace_9ff9f642::register_slowdown(#"hash_64aafe3cc04860be", 0.65, 1);
    namespace_9ff9f642::register_slowdown(#"hash_111531769a0bf9e", 0.77, 1);
    namespace_9ff9f642::register_burn(#"hash_6adb03deacc3534", 200, 5);
    namespace_9ff9f642::register_burn(#"hash_474208b088fd5b3d", 400, 5);
    clientfield::register("actor", "water_tricannon_slow_fx", 1, 1, "int");
    clientfield::register("allplayers", "fire_tricannon_muzzle_fx", 1, 1, "counter");
    clientfield::register("allplayers", "water_tricannon_muzzle_fx", 1, 1, "counter");
    level._effect[#"earth_impact"] = #"hash_4587acdb7cd704b6";
    level._effect[#"fire_impact"] = #"hash_65320106e9ad659c";
    level.custom_magic_box_selection_logic = &function_a543db40;
    level.var_ee565b3f = &function_689d923b;
    level.var_bb2323e4 = &function_73a498c8;
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x1d0340f4, Offset: 0x6f0
// Size: 0x13c
function function_79f6f273(params) {
    if (params.weapon == getweapon(#"ww_tricannon_earth_t8") || params.weapon == getweapon(#"ww_tricannon_earth_t8" + "_upgraded")) {
        self function_71233d37(params);
        return;
    }
    if (params.weapon == getweapon(#"ww_tricannon_fire_t8") || params.weapon == getweapon(#"ww_tricannon_fire_t8" + "_upgraded")) {
        var_88fd6852 = self function_3e2e539(params);
        if (var_88fd6852) {
            self function_aa1a2228(params);
        }
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 2, eflags: 0x0
// Checksum 0x1f3d22cb, Offset: 0x838
// Size: 0x17e
function function_a543db40(w_weapon, e_player) {
    if (w_weapon === getweapon(#"ww_tricannon_t8")) {
        if (e_player zm_weapons::has_weapon_or_upgrade(getweapon(#"ww_tricannon_t8"))) {
            return false;
        } else if (e_player zm_weapons::has_weapon_or_upgrade(getweapon(#"ww_tricannon_air_t8"))) {
            return false;
        } else if (e_player zm_weapons::has_weapon_or_upgrade(getweapon(#"ww_tricannon_earth_t8"))) {
            return false;
        } else if (e_player zm_weapons::has_weapon_or_upgrade(getweapon(#"ww_tricannon_fire_t8"))) {
            return false;
        } else if (e_player zm_weapons::has_weapon_or_upgrade(getweapon(#"ww_tricannon_water_t8"))) {
            return false;
        }
    }
    return true;
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x50369747, Offset: 0x9c0
// Size: 0x2a0
function function_68e4ed32(weapon) {
    self endon(#"disconnect");
    self thread function_321f468b();
    v_start = self getweaponmuzzlepoint();
    var_ee5864e0 = self getweaponforwarddir();
    a_targets = getentitiesinradius(self.origin, 192, 15);
    foreach (ai in a_targets) {
        if (!isalive(ai) || ai.archetype !== #"zombie" && ai.archetype !== #"catalyst" || ai getteam() !== level.zombie_team || ai function_dd070839()) {
            continue;
        }
        v_ai = ai getcentroid();
        v_normal = vectornormalize(v_ai - v_start);
        dot = vectordot(var_ee5864e0, v_normal);
        if (dot <= 0) {
            continue;
        }
        waitframe(1);
        if (isalive(ai)) {
            var_f1aedaaa = vectornormalize(var_ee5864e0);
            if (0 == ai sightconetrace(v_start, self, var_f1aedaaa, 22.5)) {
                continue;
            }
            ai zombie_utility::setup_zombie_knockdown(self);
        }
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 0, eflags: 0x0
// Checksum 0x3da63ad6, Offset: 0xc68
// Size: 0x1be
function function_321f468b() {
    self endon(#"disconnect");
    a_targets = getentitiesinradius(self.origin, 64, 15);
    v_start = self getweaponmuzzlepoint();
    foreach (ai in a_targets) {
        if (!isalive(ai) || ai.archetype !== #"zombie" && ai.archetype !== #"catalyst" || ai getteam() !== level.zombie_team || ai function_dd070839()) {
            continue;
        }
        if (!sighttracepassed(v_start, ai getcentroid(), 0, self)) {
            waitframe(1);
            continue;
        }
        if (isdefined(self)) {
            ai zombie_utility::setup_zombie_knockdown(self);
        }
        waitframe(1);
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0xd536bf0e, Offset: 0xe30
// Size: 0x44
function function_c8912144(weapon) {
    self thread function_321f468b();
    self function_54d03fdd(weapon, 1);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0xf0934ed5, Offset: 0xe80
// Size: 0x3c
function function_4f2ea5e7(weapon) {
    self thread function_321f468b();
    self function_54d03fdd(weapon, 0);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 2, eflags: 0x0
// Checksum 0xa446f815, Offset: 0xec8
// Size: 0x588
function function_54d03fdd(weapon, b_packed) {
    self endon(#"disconnect");
    /#
        if (!isdefined(self.var_b01de37)) {
            self.var_b01de37 = [];
        } else if (!isarray(self.var_b01de37)) {
            self.var_b01de37 = array(self.var_b01de37);
        }
        self.var_b01de37[weapon] = 4;
    #/
    v_start = self getweaponmuzzlepoint();
    var_ee5864e0 = self getweaponforwarddir();
    var_ae51959e = getentitiesinradius(self.origin, 350);
    var_ae51959e = arraysortclosest(var_ae51959e, self.origin, undefined);
    foreach (ai in var_ae51959e) {
        if (!isalive(ai)) {
            continue;
        }
        if (ai getentitytype() !== 15 && ai getentitytype() !== 12 && ai getentitytype() !== 6) {
            continue;
        }
        if (ai.takedamage !== 1 || ai getteam() !== level.zombie_team && ai getentitytype() !== 6) {
            continue;
        }
        var_b7523d07 = ai getcentroid();
        normal = vectornormalize(var_b7523d07 - v_start);
        dot = vectordot(var_ee5864e0, normal);
        if (dot <= 0) {
            continue;
        }
        waitframe(1);
        if (!isalive(ai)) {
            continue;
        }
        var_f1aedaaa = vectornormalize(var_ee5864e0);
        if (0 == ai sightconetrace(v_start, self, var_f1aedaaa, 50)) {
            continue;
        }
        n_dist_sq = distancesquared(v_start, var_b7523d07);
        n_damage = 5000 * (122500 - n_dist_sq) / 122500;
        if (n_damage < 3000) {
            n_damage = 3000;
        }
        n_launch = 75;
        if (b_packed) {
            n_damage *= 1.75;
            n_launch *= 1.5;
            n_damage = int(n_damage);
        }
        if (ai getentitytype() === 6) {
            ai dodamage(n_damage, v_start, self, self);
            continue;
        }
        if (ai.knockdown === 1) {
            var_a6127b01 = 1;
        } else {
            var_a6127b01 = 0;
        }
        ai dodamage(n_damage, v_start, self, self);
        if (!isalive(ai)) {
            ai startragdoll(1);
            ai launchragdoll(vectornormalize(var_b7523d07 - self.origin) * n_launch);
            continue;
        }
        if (var_a6127b01 == 1) {
            continue;
        }
        if (n_dist_sq < 122500) {
            if (ai.zm_ai_category === #"heavy" || ai.zm_ai_category === #"miniboss") {
                ai ai::stun();
                continue;
            }
            ai zombie_utility::setup_zombie_knockdown(self);
        }
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x4479fb57, Offset: 0x1458
// Size: 0x8c
function function_8ef8873e(weapon) {
    /#
        if (!isdefined(self.var_b01de37)) {
            self.var_b01de37 = [];
        } else if (!isarray(self.var_b01de37)) {
            self.var_b01de37 = array(self.var_b01de37);
        }
        self.var_b01de37[weapon] = 2;
    #/
    self function_68e4ed32(weapon);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0xc65b0bdc, Offset: 0x14f0
// Size: 0x12c
function function_71233d37(params) {
    playfx(level._effect[#"earth_impact"], params.vpoint);
    if (params.idamage >= self.health) {
        if (self.archetype == #"zombie") {
            self clientfield::set("zombie_gut_explosion", 1);
            waitframe(5);
            if (isdefined(self)) {
                self delete();
            }
        }
        return;
    }
    if (self.zm_ai_category === #"heavy" || self.zm_ai_category === #"miniboss") {
        self ai::stun();
        return;
    }
    if (self.knockdown !== 1) {
        self zombie_utility::setup_zombie_knockdown(params.eattacker);
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x4f1ed64, Offset: 0x1628
// Size: 0x1d4
function function_14d49bd7(weapon) {
    /#
        if (!isdefined(self.var_b01de37)) {
            self.var_b01de37 = [];
        } else if (!isarray(self.var_b01de37)) {
            self.var_b01de37 = array(self.var_b01de37);
        }
        self.var_b01de37[weapon] = 1;
    #/
    self clientfield::increment("water_tricannon_muzzle_fx", 1);
    self function_68e4ed32(weapon);
    v_start = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = v_start + v_forward * 4000;
    results = self waittill(#"projectile_impact");
    v_impact = results.position;
    if (weapon == getweapon(#"ww_tricannon_water_t8" + "_upgraded")) {
        var_bdbde2d2 = #"hash_64aafe3cc04860be";
        n_duration = 5;
    } else {
        var_bdbde2d2 = #"hash_7dd6cbed104dd8bd";
        n_duration = 4;
    }
    self function_cee7424b(v_impact, var_bdbde2d2, n_duration);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x592e19fc, Offset: 0x1808
// Size: 0x48
function function_2d6e2fb(e_shot) {
    while (isdefined(e_shot)) {
        if (isdefined(e_shot.origin)) {
            v_impact = e_shot.origin;
        }
        waitframe(1);
    }
    return v_impact;
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 3, eflags: 0x0
// Checksum 0x41b540b9, Offset: 0x1858
// Size: 0x1fc
function function_cee7424b(v_impact, var_bdbde2d2, n_duration) {
    n_time_passed = 0;
    while (n_time_passed <= n_duration) {
        var_ae51959e = getaiteamarray(level.zombie_team);
        var_ae51959e = arraysortclosest(var_ae51959e, v_impact, undefined, undefined, 112);
        foreach (ai in var_ae51959e) {
            if (ai.zm_ai_category === #"heavy" || ai.zm_ai_category === #"miniboss") {
                if (var_bdbde2d2 == #"hash_64aafe3cc04860be") {
                    ai thread namespace_9ff9f642::slowdown(#"hash_111531769a0bf9e");
                } else {
                    ai thread namespace_9ff9f642::slowdown(#"hash_7eece5e5a5f9cc4d");
                }
            } else {
                ai thread namespace_9ff9f642::slowdown(var_bdbde2d2);
            }
            ai clientfield::set("water_tricannon_slow_fx", 1);
            ai thread function_16149496();
        }
        wait 0.25;
        n_time_passed += 0.25;
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 0, eflags: 0x0
// Checksum 0x57016c64, Offset: 0x1a60
// Size: 0xd4
function function_16149496() {
    self notify("3b62451e9d2a5945");
    self endon("3b62451e9d2a5945");
    self endon(#"death");
    do {
        waitframe(1);
    } while (isdefined(self.a_n_slowdown_timeouts[#"hash_7dd6cbed104dd8bd"]) || isdefined(self.a_n_slowdown_timeouts[#"hash_64aafe3cc04860be"]) || isdefined(self.a_n_slowdown_timeouts[#"hash_7eece5e5a5f9cc4d"]) || isdefined(self.a_n_slowdown_timeouts[#"hash_f87f19d867f4e2e"]));
    self clientfield::set("water_tricannon_slow_fx", 0);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x5412cf13, Offset: 0x1b40
// Size: 0xac
function function_5a24e804(weapon) {
    /#
        if (!isdefined(self.var_b01de37)) {
            self.var_b01de37 = [];
        } else if (!isarray(self.var_b01de37)) {
            self.var_b01de37 = array(self.var_b01de37);
        }
        self.var_b01de37[weapon] = 3;
    #/
    self function_68e4ed32(weapon);
    self clientfield::increment("fire_tricannon_muzzle_fx", 1);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x89000ff4, Offset: 0x1bf8
// Size: 0x2ac
function function_3e2e539(params) {
    if (params.smeansofdeath === "MOD_PROJECTILE_SPLASH") {
        return true;
    }
    if (params.smeansofdeath !== "MOD_PROJECTILE") {
        return false;
    }
    if (isdefined(params.einflictor) && isactor(params.einflictor)) {
        return false;
    }
    if (isalive(self)) {
        if (self.health <= params.idamage) {
            v_z_offset = (0, 0, randomfloat(0.6));
            v_launch = (vectornormalize(params.vdir) + v_z_offset) * randomintrange(75, 125);
            self startragdoll(1);
            self launchragdoll(v_launch);
            return false;
        }
        if (self.zm_ai_category === #"heavy" || self.zm_ai_category === #"miniboss") {
            self ai::stun();
            if (isdefined(params.vpoint) && isdefined(params.vdir)) {
                playfx(level._effect[#"fire_impact"], params.vpoint, params.vdir);
            }
            params.einflictor notify(#"death");
            waitframe(1);
            if (isdefined(params.einflictor) && isdefined(params.eattacker) && isplayer(params.eattacker)) {
                params.einflictor detonate(params.eattacker);
            }
        } else {
            self zombie_utility::setup_zombie_knockdown(params.eattacker);
        }
        return true;
    }
    return false;
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0xa26fc9d7, Offset: 0x1eb0
// Size: 0xd4
function function_aa1a2228(params) {
    if (!isdefined(self) || self.health <= params.idamage) {
        return;
    }
    if (params.weapon === getweapon(#"ww_tricannon_fire_t8" + "_upgraded")) {
        self namespace_9ff9f642::burn(#"hash_474208b088fd5b3d", params.eattacker, params.weapon);
        return;
    }
    self namespace_9ff9f642::burn(#"hash_6adb03deacc3534", params.eattacker, params.weapon);
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 1, eflags: 0x0
// Checksum 0x91044efe, Offset: 0x1f90
// Size: 0x298
function function_689d923b(weapon) {
    w_tricannon = getweapon(#"ww_tricannon_t8");
    w_tricannon_upg = getweapon(#"ww_tricannon_t8" + "_upgraded");
    w_tricannon_earth = getweapon(#"ww_tricannon_earth_t8");
    w_tricannon_earth_upg = getweapon(#"ww_tricannon_earth_t8" + "_upgraded");
    w_tricannon_air = getweapon(#"ww_tricannon_air_t8");
    w_tricannon_air_upg = getweapon(#"ww_tricannon_air_t8" + "_upgraded");
    w_tricannon_fire = getweapon(#"ww_tricannon_fire_t8");
    w_tricannon_fire_upg = getweapon(#"ww_tricannon_fire_t8" + "_upgraded");
    w_tricannon_water = getweapon(#"ww_tricannon_water_t8");
    w_tricannon_water_upg = getweapon(#"ww_tricannon_water_t8" + "_upgraded");
    a_w_tricannon = array(w_tricannon, w_tricannon_upg, w_tricannon_earth, w_tricannon_earth_upg, w_tricannon_air, w_tricannon_air_upg, w_tricannon_fire, w_tricannon_fire_upg, w_tricannon_water, w_tricannon_water_upg);
    if (isinarray(a_w_tricannon, weapon)) {
        foreach (w_tricannon in a_w_tricannon) {
            if (self hasweapon(w_tricannon, 1)) {
                return w_tricannon;
            }
        }
    }
}

// Namespace zm_weap_tricannon/zm_weap_tricannon
// Params 2, eflags: 0x0
// Checksum 0x29d746b, Offset: 0x2230
// Size: 0x8e8
function function_73a498c8(oldweapondata, newweapondata) {
    w_tricannon = getweapon(#"ww_tricannon_t8");
    w_tricannon_upg = getweapon(#"ww_tricannon_t8" + "_upgraded");
    w_tricannon_earth = getweapon(#"ww_tricannon_earth_t8");
    w_tricannon_earth_upg = getweapon(#"ww_tricannon_earth_t8" + "_upgraded");
    w_tricannon_air = getweapon(#"ww_tricannon_air_t8");
    w_tricannon_air_upg = getweapon(#"ww_tricannon_air_t8" + "_upgraded");
    w_tricannon_fire = getweapon(#"ww_tricannon_fire_t8");
    w_tricannon_fire_upg = getweapon(#"ww_tricannon_fire_t8" + "_upgraded");
    w_tricannon_water = getweapon(#"ww_tricannon_water_t8");
    w_tricannon_water_upg = getweapon(#"ww_tricannon_water_t8" + "_upgraded");
    a_w_tricannon = array(w_tricannon, w_tricannon_upg, w_tricannon_earth, w_tricannon_earth_upg, w_tricannon_air, w_tricannon_air_upg, w_tricannon_fire, w_tricannon_fire_upg, w_tricannon_water, w_tricannon_water_upg);
    if (isinarray(a_w_tricannon, oldweapondata[#"weapon"]) && isinarray(a_w_tricannon, newweapondata[#"weapon"])) {
        weapondata = [];
        if (oldweapondata[#"weapon"] === w_tricannon_water_upg || newweapondata[#"weapon"] === w_tricannon_water_upg) {
            weapondata[#"weapon"] = w_tricannon_earth_upg;
        } else if (oldweapondata[#"weapon"] === w_tricannon_air_upg || newweapondata[#"weapon"] === w_tricannon_air_upg) {
            weapondata[#"weapon"] = w_tricannon_earth_upg;
        } else if (oldweapondata[#"weapon"] === w_tricannon_fire_upg || newweapondata[#"weapon"] === w_tricannon_fire_upg) {
            weapondata[#"weapon"] = w_tricannon_fire_upg;
        } else if (oldweapondata[#"weapon"] === w_tricannon_earth_upg || newweapondata[#"weapon"] === w_tricannon_earth_upg) {
            weapondata[#"weapon"] = w_tricannon_earth_upg;
        } else if (oldweapondata[#"weapon"] === w_tricannon_upg || newweapondata[#"weapon"] === w_tricannon_upg) {
            weapondata[#"weapon"] = w_tricannon_upg;
        } else if (oldweapondata[#"weapon"] === w_tricannon_water || newweapondata[#"weapon"] === w_tricannon_water) {
            weapondata[#"weapon"] = w_tricannon_fire;
        } else if (oldweapondata[#"weapon"] === w_tricannon_air || newweapondata[#"weapon"] === w_tricannon_air) {
            weapondata[#"weapon"] = w_tricannon_earth;
        } else if (oldweapondata[#"weapon"] === w_tricannon_fire || newweapondata[#"weapon"] === w_tricannon_fire) {
            weapondata[#"weapon"] = w_tricannon_fire;
        } else if (oldweapondata[#"weapon"] === w_tricannon_earth || newweapondata[#"weapon"] === w_tricannon_earth) {
            weapondata[#"weapon"] = w_tricannon_earth;
        } else {
            weapondata[#"weapon"] = w_tricannon;
        }
        weapon = weapondata[#"weapon"];
        weapondata[#"clip"] = newweapondata[#"clip"] + oldweapondata[#"clip"];
        weapondata[#"stock"] = newweapondata[#"stock"] + oldweapondata[#"stock"];
        weapondata[#"fuel"] = newweapondata[#"fuel"] + oldweapondata[#"fuel"];
        weapondata[#"clip"] = int(min(weapondata[#"clip"], weapon.clipsize));
        weapondata[#"stock"] = int(min(weapondata[#"stock"], weapon.maxammo));
        weapondata[#"fuel"] = int(min(weapondata[#"fuel"], weapon.fuellife));
        weapondata[#"heat"] = int(min(newweapondata[#"heat"], oldweapondata[#"heat"]));
        weapondata[#"overheat"] = int(min(newweapondata[#"overheat"], oldweapondata[#"overheat"]));
        weapondata[#"power"] = int(max(isdefined(newweapondata[#"power"]) ? newweapondata[#"power"] : 0, isdefined(oldweapondata[#"power"]) ? oldweapondata[#"power"] : 0));
        return weapondata;
    }
}

