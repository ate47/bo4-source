#using script_24c32478acf44108;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;

#namespace namespace_82497b8a;

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x2
// Checksum 0xbe9f5e4, Offset: 0x250
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"hash_7d2cbc6b35608ae5", &__init__, &__main__, undefined);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x791a3234, Offset: 0x2a0
// Size: 0x4b4
function __init__() {
    clientfield::register("scriptmover", "" + #"hash_64f62d9a3170948e", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_6848ec3d200d443b", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_6848ec3d200d443b", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_6f59675863e19a50", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_6f59675863e19a50", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_32156a79f13e8c37", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_30c86f39ae8ea002", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_1dd40649a6474f30", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_1dd40649a6474f30", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_12b19992ccb300e7", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_54fdcf7f8eb5449e", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_69b312bcaae6308b", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_2ff818c8cb4c17ba", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_2ff818c8cb4c17ba", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_3bedaaea2c17af23", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_3bedaaea2c17af23", 1, 1, "int");
    zm::function_84d343d(#"hash_46ad37ce8122812e", &function_14a32f64);
    zm::function_84d343d(#"hash_3a8348f19a7e7629", &function_14a32f64);
    namespace_9ff9f642::register_slowdown(#"hash_7f87c0765184088f", 0.7);
    namespace_9ff9f642::register_slowdown(#"hash_193617f42c166879", 0.1);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x65e55d7, Offset: 0x760
// Size: 0x48c
function __main__() {
    level.var_f086136b = getweapon(#"hash_138efe2bb30be63c");
    level.var_6fe89212 = getweapon(#"hash_138f012bb30beb55");
    level.var_74cf08b1 = getweapon(#"hash_46ad37ce8122812e");
    level.var_7b9ca97a = getweapon(#"hash_138f002bb30be9a2");
    level.var_4b14202f = getweapon(#"hash_3a8348f19a7e7629");
    zm_weapons::include_zombie_weapon(#"hash_138efe2bb30be63c", 0);
    zm_weapons::include_zombie_weapon(#"hash_138f012bb30beb55", 0);
    zm_weapons::include_zombie_weapon(#"hash_138f002bb30be9a2", 0);
    zm_laststand::function_aac4b2c9(level.var_f086136b);
    level.var_350d976 = [];
    if (!isdefined(level.var_350d976)) {
        level.var_350d976 = [];
    } else if (!isarray(level.var_350d976)) {
        level.var_350d976 = array(level.var_350d976);
    }
    level.var_350d976[level.var_350d976.size] = 0;
    if (!isdefined(level.var_350d976)) {
        level.var_350d976 = [];
    } else if (!isarray(level.var_350d976)) {
        level.var_350d976 = array(level.var_350d976);
    }
    level.var_350d976[level.var_350d976.size] = 1;
    level.var_42cb6a06 = [];
    level.var_42cb6a06 = arraycopy(level.var_350d976);
    if (!isdefined(level.var_42cb6a06)) {
        level.var_42cb6a06 = [];
    } else if (!isarray(level.var_42cb6a06)) {
        level.var_42cb6a06 = array(level.var_42cb6a06);
    }
    level.var_42cb6a06[level.var_42cb6a06.size] = 2;
    if (!isdefined(level.var_42cb6a06)) {
        level.var_42cb6a06 = [];
    } else if (!isarray(level.var_42cb6a06)) {
        level.var_42cb6a06 = array(level.var_42cb6a06);
    }
    level.var_42cb6a06[level.var_42cb6a06.size] = 3;
    level.var_2ec91d6e = [];
    /#
        if (isdefined(0) && false) {
            callback::add_weapon_fired(level.var_6fe89212, &function_74c0728c);
            callback::add_weapon_fired(level.var_7b9ca97a, &function_74c0728c);
        }
    #/
    callback::add_weapon_fired(level.var_74cf08b1, &function_74c0728c);
    callback::add_weapon_fired(level.var_4b14202f, &function_74c0728c);
    level.var_b897ed83 = &function_7f12f6a2;
    /#
        level thread function_58b7cdd7();
    #/
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0xceb357c3, Offset: 0xbf8
// Size: 0xd8
function function_1998c3ac(weapon) {
    if (weapon === level.var_f086136b || weapon === level.var_6fe89212 || weapon === level.var_7b9ca97a) {
        if (self hasweapon(level.var_f086136b, 1)) {
            return level.var_f086136b;
        }
        if (self hasweapon(level.var_6fe89212, 1)) {
            return level.var_6fe89212;
        }
        if (self hasweapon(level.var_7b9ca97a, 1)) {
            return level.var_7b9ca97a;
        }
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x88c75ade, Offset: 0xcd8
// Size: 0x560
function function_912c1a28(oldweapondata, newweapondata) {
    if ((oldweapondata[#"weapon"] === level.var_f086136b || oldweapondata[#"weapon"] === level.var_6fe89212 || oldweapondata[#"weapon"] === level.var_7b9ca97a) && (newweapondata[#"weapon"] === level.var_f086136b || newweapondata[#"weapon"] === level.var_6fe89212 || newweapondata[#"weapon"] === level.var_7b9ca97a)) {
        weapondata = [];
        if (oldweapondata[#"weapon"] === level.var_7b9ca97a || newweapondata[#"weapon"] === level.var_7b9ca97a) {
            weapondata[#"weapon"] = level.var_7b9ca97a;
        } else if (oldweapondata[#"weapon"] === level.var_f086136b) {
            weapondata[#"weapon"] = newweapondata[#"weapon"];
        } else if (newweapondata[#"weapon"] === level.var_f086136b) {
            weapondata[#"weapon"] = oldweapondata[#"weapon"];
        } else {
            weapondata[#"weapon"] = level.var_6fe89212;
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

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 12, eflags: 0x1 linked
// Checksum 0x4dd86eaf, Offset: 0x1240
// Size: 0x82
function function_14a32f64(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    return self function_1ec5c573(weapon, damage, meansofdeath);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0x775e3894, Offset: 0x12d0
// Size: 0x258
function function_1ec5c573(weapon, n_damage, meansofdeath) {
    var_aebb78d5 = n_damage;
    if (self.var_6f84b820 !== #"heavy" && self.var_6f84b820 !== #"miniboss") {
        if (!(isdefined(self.var_6a36f6dc) && self.var_6a36f6dc) && !(isdefined(self.var_780857a) && self.var_780857a) && !(isdefined(self.var_7fcb707c) && self.var_7fcb707c) && !(isdefined(self.var_bd48b030) && self.var_bd48b030)) {
            self.instakill_func = &function_35a0a5cc;
            self.var_3ca04328 = 1;
            var_aebb78d5 = 1;
            self.no_gib = 1;
            self.var_f46fbf3f = 1;
        }
    } else if (meansofdeath === "MOD_PROJECTILE" || meansofdeath === "MOD_PROJECTILE_SPLASH") {
        self.var_287c79bd = gettime();
        var_e6204470 = weapon === level.var_74cf08b1 ? level.var_6fe89212 : level.var_7b9ca97a;
        var_d6f1df38 = var_e6204470.explosioninnerdamage;
        var_aebb78d5 = int(var_d6f1df38 * 3);
        var_aebb78d5 = zm_utility::round_up_to_ten(var_aebb78d5);
        /#
            iprintln("<dev string:x38>" + function_9e72a96(self.archetype) + "<dev string:x42>" + self getentnum() + "<dev string:x46>" + var_aebb78d5 + "<dev string:x4b>" + function_9e72a96(meansofdeath));
        #/
    }
    return var_aebb78d5;
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0x65b170e1, Offset: 0x1530
// Size: 0x20
function function_35a0a5cc(player, mod, hit_location) {
    return true;
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0xb7af4411, Offset: 0x1558
// Size: 0x1bc
function function_af59b4aa(var_9345432e, s_waitresult) {
    self endon(#"disconnect");
    var_9345432e endon(#"death");
    if (isdefined(var_9345432e.vehcheckforpredictedcrash) && var_9345432e.vehcheckforpredictedcrash) {
        var_9345432e waittilltimeout(4, #"veh_predictedcollision");
        /#
            if (getdvarint(#"hash_e2e03328b366e75", 0)) {
                sphere(var_9345432e.origin, 4, (1, 1, 1), 1, 1, 8, 300);
            }
        #/
        a_trace = groundtrace(var_9345432e.origin, var_9345432e.origin - (0, 0, 800), 0, undefined);
        self thread function_656b149c(a_trace[#"position"], s_waitresult);
        return;
    }
    a_trace = groundtrace(var_9345432e.origin, var_9345432e.origin - (0, 0, 800), 0, undefined);
    self thread function_656b149c(a_trace[#"position"], s_waitresult);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x2b8656c1, Offset: 0x1720
// Size: 0x100
function function_2ce99526(e_enemy) {
    if (e_enemy isonground() && !e_enemy isplayinganimscripted()) {
        var_c74d5934 = e_enemy.origin;
    } else {
        a_trace = groundtrace(e_enemy.origin, e_enemy.origin - (0, 0, 800), 0, undefined);
        var_c74d5934 = a_trace[#"position"];
    }
    if (isdefined(var_c74d5934) && zm_utility::function_21f4ac36()) {
        if (!zm_zonemgr::function_66bf6a43(var_c74d5934, 0)) {
            var_c74d5934 = undefined;
        }
    }
    return var_c74d5934;
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0xfbab04eb, Offset: 0x1828
// Size: 0x5ba
function function_656b149c(var_c74d5934, s_waitresult, var_41bf50f) {
    /#
        if (getdvarint(#"hash_e2e03328b366e75", 0)) {
            sphere(var_c74d5934, 4, (0, 1, 0), 1, 1, 8, 200);
            line(s_waitresult.position, var_c74d5934, (1, 1, 0), 1, 8, 200);
        }
    #/
    if (isdefined(level.var_573d960c)) {
        var_ea0a46dc = level.var_573d960c;
    } else {
        if (s_waitresult.weapon == level.var_74cf08b1) {
            var_5f90d951 = level.var_350d976;
        } else {
            var_5f90d951 = level.var_42cb6a06;
        }
        if (!isdefined(self.var_3d7d20b)) {
            self.var_3d7d20b = -1;
        }
        var_b0d6e367 = [];
        foreach (var_d3b8de37 in var_5f90d951) {
            if (!isinarray(level.var_2ec91d6e, var_d3b8de37) && var_d3b8de37 != self.var_3d7d20b) {
                if (!isdefined(var_b0d6e367)) {
                    var_b0d6e367 = [];
                } else if (!isarray(var_b0d6e367)) {
                    var_b0d6e367 = array(var_b0d6e367);
                }
                var_b0d6e367[var_b0d6e367.size] = var_d3b8de37;
            }
        }
        if (var_b0d6e367.size) {
            var_ea0a46dc = array::random(var_b0d6e367);
            /#
                if (var_b0d6e367.size == 1) {
                    switch (var_ea0a46dc) {
                    case 0:
                        iprintln("<dev string:x6d>");
                        break;
                    case 1:
                        iprintln("<dev string:x94>");
                        break;
                    case 2:
                        iprintln("<dev string:xb5>");
                        break;
                    case 3:
                        iprintln("<dev string:xdb>");
                        break;
                    }
                }
            #/
        } else {
            var_ea0a46dc = array::random(var_5f90d951);
            /#
                switch (var_ea0a46dc) {
                case 0:
                    iprintln("<dev string:x104>");
                    break;
                case 1:
                    iprintln("<dev string:x12b>");
                    break;
                case 2:
                    iprintln("<dev string:x14c>");
                    break;
                case 3:
                    iprintln("<dev string:x172>");
                    break;
                }
            #/
        }
        if (s_waitresult.weapon === level.var_4b14202f) {
            self.var_3d7d20b = var_ea0a46dc;
        }
        /#
            if (isdefined(0) && false) {
                self.var_3d7d20b = var_ea0a46dc;
            }
        #/
    }
    if (isalive(self)) {
        self function_139ffb96();
    }
    level.var_2ec91d6e[self.playernum] = var_ea0a46dc;
    switch (var_ea0a46dc) {
    case 0:
        level thread function_936c6968(var_c74d5934, self, self.playernum, var_41bf50f);
        break;
    case 1:
        level thread function_9537d6cb(var_c74d5934, self, self.playernum, var_41bf50f);
        break;
    case 2:
        level thread function_1f3fc48(var_c74d5934, self, self.playernum, var_41bf50f);
        break;
    case 3:
        level thread function_ca108f41(var_c74d5934, self, self.playernum, var_41bf50f);
        break;
    }
    if (isalive(self)) {
        self.var_ea0a46dc = var_ea0a46dc;
    }
}

/#

    // Namespace namespace_82497b8a/namespace_a20a2d7a
    // Params 0, eflags: 0x0
    // Checksum 0xb9cb4931, Offset: 0x1df0
    // Size: 0x21a
    function function_58b7cdd7() {
        while (true) {
            foreach (n_index, var_e41be0c2 in level.var_2ec91d6e) {
                n_y_pos = 480 + 18.7 * n_index;
                switch (var_e41be0c2) {
                case 0:
                    str_text = "<dev string:x19b>";
                    break;
                case 1:
                    str_text = "<dev string:x1ae>";
                    break;
                case 2:
                    str_text = "<dev string:x1bb>";
                    break;
                case 3:
                    str_text = "<dev string:x1cd>";
                    break;
                default:
                    str_text = undefined;
                    break;
                }
                if (isdefined(str_text)) {
                    debug2dtext((120, n_y_pos, 0), "<dev string:x1ea>" + n_index + "<dev string:x1f3>", (1, 1, 0), 1, (0, 0, 0), 0.4, 1, 2);
                    debug2dtext((120 + 100, n_y_pos, 0), str_text, (1, 1, 1), 1, (0, 0, 0), 0.4, 1, 2);
                }
            }
            waitframe(2);
        }
    }

#/

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x565f450f, Offset: 0x2018
// Size: 0x78
function function_7f12f6a2() {
    if (isdefined(self.var_6a36f6dc) && self.var_6a36f6dc) {
        return false;
    }
    if (isdefined(self.var_bd48b030) && self.var_bd48b030) {
        return false;
    }
    if (isdefined(self.var_7fcb707c) && self.var_7fcb707c) {
        return false;
    }
    if (isdefined(self.var_780857a) && self.var_780857a) {
        return false;
    }
    return true;
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0xd96ed2c5, Offset: 0x2098
// Size: 0x164
function function_74c0728c(weapon) {
    self thread function_5114b093();
    if (weapon == level.var_74cf08b1) {
        w_base = level.var_6fe89212;
    } else if (weapon == level.var_4b14202f) {
        w_base = level.var_7b9ca97a;
    }
    /#
        if (isdefined(0) && false) {
            return;
        }
    #/
    n_ammo_clip = self getweaponammoclip(w_base);
    if (n_ammo_clip >= 2) {
        self setweaponammoclip(w_base, n_ammo_clip - 2);
        return;
    }
    self setweaponammoclip(w_base, 0);
    n_ammo_stock = self getweaponammostock(w_base) - 2 - n_ammo_clip;
    n_ammo_stock = math::clamp(n_ammo_stock, 0, w_base.maxammo);
    self setweaponammostock(w_base, n_ammo_stock);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x43b635ff, Offset: 0x2208
// Size: 0x5bc
function function_5114b093() {
    self notify("11bb4425fa0edb34");
    self endon("11bb4425fa0edb34");
    self endon(#"death");
    var_97e851d8 = array(level.var_74cf08b1, level.var_4b14202f);
    /#
        if (isdefined(0) && false) {
            if (!isdefined(var_97e851d8)) {
                var_97e851d8 = [];
            } else if (!isarray(var_97e851d8)) {
                var_97e851d8 = array(var_97e851d8);
            }
            var_97e851d8[var_97e851d8.size] = level.var_6fe89212;
            if (!isdefined(var_97e851d8)) {
                var_97e851d8 = [];
            } else if (!isarray(var_97e851d8)) {
                var_97e851d8 = array(var_97e851d8);
            }
            var_97e851d8[var_97e851d8.size] = level.var_7b9ca97a;
        }
    #/
    var_c74d5934 = undefined;
    var_8c561676 = undefined;
    s_waitresult = self waittill(#"projectile_impact");
    if (isdefined(s_waitresult.weapon) && isinarray(var_97e851d8, s_waitresult.weapon)) {
        var_5dcc0b6c = getaiteamarray(#"axis");
        var_4a7cc161 = arraysortclosest(var_5dcc0b6c, s_waitresult.position, 16, 0, 128);
        if (var_4a7cc161.size) {
            foreach (var_688083e6 in var_4a7cc161) {
                if (var_688083e6.damageweapon === s_waitresult.weapon) {
                    var_688083e6.no_gib = undefined;
                    if (isvehicle(var_688083e6)) {
                        var_8c561676 = 1;
                        self thread function_af59b4aa(var_688083e6, s_waitresult);
                        /#
                            if (getdvarint(#"hash_e2e03328b366e75", 0)) {
                                sphere(s_waitresult.position, 4, (1, 0, 0), 1, 1, 8, 300);
                            }
                        #/
                        break;
                    }
                    var_dc70aff9 = 1;
                    if (var_688083e6.var_6f84b820 === #"heavy" || var_688083e6.var_6f84b820 === #"miniboss") {
                        if (isdefined(var_688083e6.var_287c79bd) && gettime() - var_688083e6.var_287c79bd > 50) {
                            /#
                                var_a9dd0fe1 = gettime();
                            #/
                            var_dc70aff9 = 0;
                        }
                    }
                    if (var_dc70aff9) {
                        var_c74d5934 = function_2ce99526(var_688083e6);
                        var_41bf50f = var_688083e6;
                        /#
                            if (getdvarint(#"hash_e2e03328b366e75", 0)) {
                                sphere(s_waitresult.position, 4, (1, 0, 0), 1, 1, 8, 300);
                            }
                        #/
                        break;
                    }
                }
            }
        }
        if (!isdefined(var_c74d5934)) {
            v_close = getclosestpointonnavmesh(s_waitresult.position, 84, 16);
            if (isdefined(v_close)) {
                n_z_diff = v_close[2] - s_waitresult.position[2];
                if (n_z_diff < 4) {
                    var_c74d5934 = v_close;
                } else if (bullettracepassed(v_close, self geteye(), 0, undefined)) {
                    var_c74d5934 = v_close;
                }
            }
            if (isdefined(var_c74d5934) && zm_utility::function_21f4ac36()) {
                if (!zm_zonemgr::function_66bf6a43(var_c74d5934, 0)) {
                    var_c74d5934 = undefined;
                }
            }
        }
        if (isdefined(var_c74d5934)) {
            self thread function_656b149c(var_c74d5934, s_waitresult, var_41bf50f);
        }
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0xe3488561, Offset: 0x27d0
// Size: 0xec
function function_139ffb96() {
    self endon(#"disconnect");
    if (!self flag::exists("flag_player_clear_charged_shot")) {
        self flag::init("flag_player_clear_charged_shot");
    }
    if (!self flag::get("flag_player_clear_charged_shot")) {
        self flag::set("flag_player_clear_charged_shot");
        self util::delay(0.1, "disconnect", &flag::clear, "flag_player_clear_charged_shot");
        return;
    }
    self flag::clear("flag_player_clear_charged_shot");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x1b908264, Offset: 0x28c8
// Size: 0x344
function function_6cd38e99(var_f5716a6, var_18e8905a) {
    var_4bb8adfe = [];
    foreach (e_zombie in getaiteamarray(level.zombie_team)) {
        if (e_zombie istouching(self)) {
            var_430d5f23 = !(isdefined(e_zombie.var_bd48b030) && e_zombie.var_bd48b030) && !(isdefined(e_zombie.var_7fcb707c) && e_zombie.var_7fcb707c) && !(isdefined(e_zombie.var_780857a) && e_zombie.var_780857a) && !(var_f5716a6 == 0 && isdefined(e_zombie.var_6a36f6dc) && e_zombie.var_6a36f6dc);
            if (var_430d5f23 && isalive(e_zombie) && !(isdefined(e_zombie.marked_for_death) && e_zombie.marked_for_death) && !(isdefined(e_zombie.aat_turned) && e_zombie.aat_turned)) {
                v_trace_start = isdefined(var_18e8905a) ? var_18e8905a : self.origin + (0, 0, 16);
                a_trace = bullettrace(v_trace_start, e_zombie getcentroid(), 0, undefined);
                if (isdefined(a_trace) && a_trace[#"fraction"] == 1) {
                    if (!isdefined(var_4bb8adfe)) {
                        var_4bb8adfe = [];
                    } else if (!isarray(var_4bb8adfe)) {
                        var_4bb8adfe = array(var_4bb8adfe);
                    }
                    var_4bb8adfe[var_4bb8adfe.size] = e_zombie;
                    if (isdefined(e_zombie.var_6a36f6dc) && e_zombie.var_6a36f6dc) {
                        e_zombie notify(#"hash_2250ef170a9d4a6");
                    }
                    continue;
                }
                /#
                    if (getdvarint(#"hash_e2e03328b366e75", 0)) {
                        iprintlnbold("<dev string:x1f7>" + e_zombie getentnum() + "<dev string:x200>");
                    }
                #/
            }
        }
    }
    return var_4bb8adfe;
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x21 linked variadic
// Checksum 0xa9707dd6, Offset: 0x2c18
// Size: 0xc4
function function_f8679f8d(var_ea0a46dc, var_8c987230, ...) {
    a_zombies = self function_6cd38e99(var_ea0a46dc);
    foreach (e_zombie in a_zombies) {
        if (!isdefined(e_zombie)) {
            continue;
        }
        e_zombie thread [[ var_8c987230 ]](vararg);
        wait 0.1;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 4, eflags: 0x21 linked variadic
// Checksum 0x8e40cce8, Offset: 0x2ce8
// Size: 0x36
function function_a7c67ad6(ai_enemy, var_ea0a46dc, var_8c987230, ...) {
    ai_enemy thread [[ var_8c987230 ]](vararg);
}

/#

    // Namespace namespace_82497b8a/namespace_a20a2d7a
    // Params 3, eflags: 0x0
    // Checksum 0x6fed84c0, Offset: 0x2d28
    // Size: 0x68
    function function_45b0dfc6(v_origin, str_text, str_endon) {
        self endon(str_endon);
        while (true) {
            print3d(v_origin, str_text, (0, 1, 0), 1, 0.7, 3);
            wait 0.1;
        }
    }

#/

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x61df0b00, Offset: 0x2d98
// Size: 0x204
function function_2d3beb68(var_ea0a46dc, e_attacker) {
    self endon(#"death");
    if (self.var_6f84b820 === #"heavy" || self.var_6f84b820 === #"miniboss") {
        self function_a851c777(var_ea0a46dc, e_attacker);
        return;
    }
    switch (var_ea0a46dc) {
    case 0:
        var_d31c4f26 = level.var_74cf08b1;
        /#
            var_1deac56b = "<dev string:x221>";
        #/
        break;
    case 1:
        var_d31c4f26 = level.var_74cf08b1;
        /#
            var_1deac56b = "<dev string:x1ae>";
        #/
        break;
    case 2:
        var_d31c4f26 = level.var_4b14202f;
        /#
            var_1deac56b = "<dev string:x1bb>";
        #/
        break;
    case 3:
        var_d31c4f26 = level.var_4b14202f;
        /#
            var_1deac56b = "<dev string:x236>";
        #/
        break;
    }
    self dodamage(var_d31c4f26.damagevalues[0], self.origin, e_attacker, e_attacker, undefined, "MOD_UNKNOWN", 0, var_d31c4f26);
    /#
        iprintlnbold("<dev string:x24b>" + var_1deac56b + "<dev string:x251>" + level.var_74cf08b1.damagevalues[0] + "<dev string:x265>" + function_9e72a96(self.archetype));
    #/
    wait 0.6;
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x76395e49, Offset: 0x2fa8
// Size: 0x272
function function_a851c777(var_ea0a46dc, e_attacker) {
    self endon(#"death");
    switch (var_ea0a46dc) {
    case 0:
    case 1:
        n_damage = level.var_74cf08b1.damagevalues[0];
        break;
    case 2:
    case 3:
        n_damage = level.var_4b14202f.damagevalues[0];
        break;
    }
    self dodamage(n_damage, self.origin, e_attacker, e_attacker, undefined, "MOD_UNKNOWN", 0, level.var_4b14202f);
    /#
        iprintln("<dev string:x38>" + function_9e72a96(self.archetype) + "<dev string:x42>" + self getentnum() + "<dev string:x46>" + n_damage);
    #/
    wait 0.6;
    switch (var_ea0a46dc) {
    case 0:
        self clientfield::set("" + #"hash_1dd40649a6474f30", 0);
        self.var_6a36f6dc = 0;
        break;
    case 1:
        self.var_bd48b030 = 0;
        break;
    case 2:
        self clientfield::set("" + #"hash_2ff818c8cb4c17ba", 0);
        self.var_7fcb707c = 0;
        break;
    case 3:
        self clientfield::set("" + #"hash_6f59675863e19a50", 0);
        self.var_780857a = 0;
        break;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x4d9582a2, Offset: 0x3228
// Size: 0x8c
function function_61b2f057(e_attacker, var_5a20091) {
    if (zm_utility::is_magic_bullet_shield_enabled(self)) {
        self util::stop_magic_bullet_shield();
    }
    self.allowdeath = 1;
    self dodamage(self.health, self.origin, e_attacker, e_attacker, undefined, "MOD_UNKNOWN", 0, var_5a20091);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 4, eflags: 0x1 linked
// Checksum 0x23d69863, Offset: 0x32c0
// Size: 0x26a
function function_ca108f41(v_origin, e_attacker, var_a257f75d, var_41bf50f) {
    var_1c95b19 = v_origin + (0, 0, 140);
    e_origin = spawn("script_model", var_1c95b19);
    if (!isdefined(e_origin) || !isdefined(e_attacker)) {
        level.var_2ec91d6e[var_a257f75d] = -1;
        return;
    }
    e_origin thread shrink_globe();
    e_trigger = spawn("trigger_radius", v_origin, 512 | 1, 128, 128);
    e_trigger thread function_e607e26e(e_attacker);
    e_attacker thread function_9b512839(e_trigger);
    /#
        if (getdvarint(#"hash_e2e03328b366e75", 0)) {
            e_trigger thread function_45b0dfc6(v_origin, "<dev string:x277>", "<dev string:x28c>");
        }
    #/
    e_attacker flag::wait_till_clear_timeout(10, "flag_player_clear_charged_shot");
    if (isdefined(e_attacker)) {
        e_attacker flag::wait_till_timeout(10, "flag_player_clear_charged_shot");
    } else {
        wait 10;
    }
    e_origin notify(#"hash_775ddc8cde7b36e4");
    e_trigger notify(#"hash_775ddc8cde7b36e4");
    e_trigger delete();
    if (level.var_2ec91d6e[var_a257f75d] == 3) {
        if (isdefined(e_attacker)) {
            if (!e_attacker flag::get("flag_player_clear_charged_shot")) {
                level.var_2ec91d6e[var_a257f75d] = -1;
            }
            return;
        }
        level.var_2ec91d6e[var_a257f75d] = -1;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0xf5301246, Offset: 0x3538
// Size: 0x8e
function function_9b512839(e_trigger) {
    e_trigger endon(#"hash_775ddc8cde7b36e4");
    self endon(#"disconnect");
    for (var_358ea838 = 0; var_358ea838 < 15; var_358ea838++) {
        self waittill(#"zombie_shrunk");
    }
    self notify(#"hash_148a0d55a59ee6a3");
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0xd74eaf1a, Offset: 0x35d0
// Size: 0x8c
function shrink_globe() {
    waitframe(1);
    self clientfield::set("" + #"hash_64f62d9a3170948e", 1);
    self waittill(#"hash_775ddc8cde7b36e4");
    self clientfield::set("" + #"hash_64f62d9a3170948e", 0);
    wait 2;
    self delete();
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x254132bf, Offset: 0x3668
// Size: 0xa0
function function_e607e26e(e_attacker) {
    self endon(#"hash_775ddc8cde7b36e4");
    self thread function_f8679f8d(3, &function_c9b2e87f, e_attacker);
    while (true) {
        self waittill(#"touch");
        self function_f8679f8d(3, &function_c9b2e87f, e_attacker);
        wait 0.5;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x21 linked variadic
// Checksum 0x59b7af34, Offset: 0x3710
// Size: 0x2d2
function function_c9b2e87f(...) {
    if (isdefined(self.var_780857a) && self.var_780857a) {
        return;
    }
    self endon(#"death");
    e_attacker = vararg[0][0];
    if (!zm_transform::function_5db4f2f5(self)) {
        return;
    }
    self.var_780857a = 1;
    if (self.var_6f84b820 === #"boss" || self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"heavy") {
        self function_2d3beb68(3, e_attacker);
        return;
    }
    self clientfield::set("" + #"hash_6f59675863e19a50", 1);
    waitframe(1);
    switch (self.archetype) {
    case #"bat":
    case #"catalyst":
    case #"zombie_dog":
    case #"zombie":
    case #"nosferatu":
        self val::set(#"hash_16bf0b1b6bc69c97", "ignoreall", 1);
        self val::set(#"hash_7e08001e1389be82", "ignoreme", 1);
        self.marked_for_death = 1;
        self clientfield::set("" + #"hash_6848ec3d200d443b", 1);
        waitframe(1);
        self ghost();
        self thread namespace_9ff9f642::slowdown(#"hash_193617f42c166879");
        wait 1;
        if (isdefined(e_attacker)) {
            e_attacker notify(#"zombie_shrunk");
        }
        self function_61b2f057(e_attacker, level.var_4b14202f);
        break;
    default:
        self function_2d3beb68(3, e_attacker);
        break;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 4, eflags: 0x1 linked
// Checksum 0x73065cf7, Offset: 0x39f0
// Size: 0x2d4
function function_936c6968(v_origin, e_attacker, var_a257f75d, var_41bf50f) {
    e_attacker.e_vortex = spawn("script_model", v_origin);
    e_vortex = e_attacker.e_vortex;
    if (!isdefined(e_vortex) || !isdefined(e_attacker)) {
        level.var_2ec91d6e[var_a257f75d] = -1;
        return;
    }
    e_vortex clientfield::set("" + #"hash_32156a79f13e8c37", 1);
    e_attacker.e_trigger = spawn("trigger_radius", v_origin, 512 | 1, 160, 160);
    e_trigger = e_attacker.e_trigger;
    e_trigger thread function_e46e9108(e_vortex, v_origin, e_attacker);
    /#
        if (getdvarint(#"hash_e2e03328b366e75", 0)) {
            e_trigger thread function_45b0dfc6(v_origin, "<dev string:x29f>", "<dev string:x2b4>");
        }
    #/
    e_attacker flag::wait_till_clear_timeout(12, "flag_player_clear_charged_shot");
    if (isdefined(e_attacker)) {
        e_attacker flag::wait_till_timeout(12, "flag_player_clear_charged_shot");
    } else {
        wait 12;
    }
    e_trigger notify(#"hash_51bbb146cbe1a24d");
    e_trigger delete();
    e_vortex clientfield::set("" + #"hash_32156a79f13e8c37", 0);
    e_vortex notify(#"hash_51bbb146cbe1a24d");
    if (level.var_2ec91d6e[var_a257f75d] == 0) {
        if (isdefined(e_attacker)) {
            if (!e_attacker flag::get("flag_player_clear_charged_shot")) {
                level.var_2ec91d6e[var_a257f75d] = -1;
            }
        } else {
            level.var_2ec91d6e[var_a257f75d] = -1;
        }
    }
    wait 2;
    e_vortex delete();
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0x46c28f02, Offset: 0x3cd0
// Size: 0xb0
function function_e46e9108(e_vortex, v_origin, e_attacker) {
    e_vortex endon(#"hash_51bbb146cbe1a24d");
    self thread function_f8679f8d(0, &function_bbbbc4d0, v_origin, e_attacker);
    while (true) {
        self waittill(#"touch");
        self function_f8679f8d(0, &function_bbbbc4d0, v_origin, e_attacker);
        wait 0.5;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x21 linked variadic
// Checksum 0x2246fa77, Offset: 0x3d88
// Size: 0x8c
function function_bbbbc4d0(...) {
    if (isdefined(self.var_6a36f6dc) && self.var_6a36f6dc) {
        return;
    }
    self endon(#"death");
    v_start_pos = vararg[0][0];
    e_attacker = vararg[0][1];
    self.var_6a36f6dc = 1;
    self thread function_f724358c(e_attacker);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x38f79bac, Offset: 0x3e20
// Size: 0x1aa
function function_f724358c(e_attacker) {
    if (!zm_transform::function_5db4f2f5(self)) {
        self.var_6a36f6dc = 0;
        return;
    }
    if (self.var_6f84b820 === #"boss" || self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"heavy") {
        self function_2d3beb68(0, e_attacker);
        return;
    }
    self clientfield::set("" + #"hash_1dd40649a6474f30", 1);
    switch (self.archetype) {
    case #"bat":
    case #"zombie_dog":
        self function_61b2f057(e_attacker, level.var_74cf08b1);
        break;
    case #"catalyst":
    case #"zombie":
    case #"nosferatu":
        self thread function_ad3de341(e_attacker);
        break;
    default:
        self thread function_2d3beb68(0, e_attacker);
        break;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0xbb8a0c5f, Offset: 0x3fd8
// Size: 0x2e0
function function_ad3de341(e_attacker) {
    self endoncallback(&function_e313ef46, #"hash_2250ef170a9d4a6", #"death", #"scriptedanim", #"new_scripted_anim");
    if (self isplayinganimscripted()) {
        self notify(#"hash_2250ef170a9d4a6");
    }
    self val::set(#"hash_1b572998d0efb58f", "ignoreall", 1);
    self val::set(#"hash_1b572998d0efb58f", "ignoreme", 1);
    self.canbetargetedbyturnedzombies = 0;
    self.v_zombie_custom_goal_pos = self.origin;
    self zombie_utility::set_zombie_run_cycle("walk");
    self thread function_b47bcfb0(e_attacker);
    if (isdefined(level.var_27f4ef2f)) {
        b_continue = self [[ level.var_27f4ef2f ]](e_attacker);
        if (!(isdefined(b_continue) && b_continue)) {
            return;
        }
    }
    while (true) {
        n_xoff = randomfloatrange(-600, 600);
        n_yoff = randomfloatrange(-600, 600);
        v_loc = self.origin + (n_xoff, n_yoff, 0);
        v_loc = getclosestpointonnavmesh(v_loc, 64, 16);
        if (isdefined(v_loc)) {
            str_zone = zm_zonemgr::get_zone_from_position(v_loc, 1);
            if (isdefined(str_zone) && level.zones[str_zone].is_active) {
                self.n_zombie_custom_goal_radius = 8;
                self.v_zombie_custom_goal_pos = v_loc;
                self waittill(#"goal");
                wait randomfloatrange(0.1, 2);
            }
        }
        wait randomfloatrange(0.1, 0.3);
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0xbd284657, Offset: 0x42c0
// Size: 0x11c
function function_b47bcfb0(e_attacker, var_3ae458c8) {
    self notify("2635a9c678b738b");
    self endon("2635a9c678b738b");
    self endon(#"death");
    var_1ee06b23 = self.archetype === #"nosferatu" ? 4 : 12;
    n_timeout = isdefined(var_3ae458c8) ? var_3ae458c8 : var_1ee06b23;
    util::wait_endon(n_timeout, #"hash_28e3235da53ba083");
    if (isalive(self)) {
        self.marked_for_death = 1;
        gibserverutils::gibhead(self);
        self function_61b2f057(e_attacker, level.var_74cf08b1);
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x6a6d3f70, Offset: 0x43e8
// Size: 0xa6
function function_e313ef46(str_notify) {
    var_81c53418 = 1;
    if (isdefined(level.var_8b14dbe3)) {
        var_81c53418 = self [[ level.var_8b14dbe3 ]]();
    }
    if (isalive(self) && var_81c53418) {
        self.var_6a36f6dc = 0;
        self clientfield::set("" + #"hash_1dd40649a6474f30", 0);
        self.v_zombie_custom_goal_pos = undefined;
        self.n_zombie_custom_goal_radius = undefined;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 4, eflags: 0x1 linked
// Checksum 0x17b240a7, Offset: 0x4498
// Size: 0x344
function function_9537d6cb(v_origin, e_attacker, var_a257f75d, var_41bf50f) {
    e_attacker.e_tornado = spawn("script_model", v_origin);
    e_tornado = e_attacker.e_tornado;
    if (!isdefined(e_tornado) || !isdefined(e_attacker)) {
        level.var_2ec91d6e[var_a257f75d] = -1;
        return;
    }
    e_tornado clientfield::set("" + #"hash_12b19992ccb300e7", 1);
    e_tornado.targetname = "spin_cycle_entity";
    e_tornado.var_9f00aa3b = [];
    e_tornado.var_9f00aa3b[0] = 0;
    e_tornado.var_9f00aa3b[1] = 0;
    e_tornado.var_9f00aa3b[2] = 0;
    e_tornado.var_9f00aa3b[3] = 0;
    e_attacker.e_trigger = spawn("trigger_radius", v_origin, 512 | 1, 96, 96);
    e_trigger = e_attacker.e_trigger;
    e_trigger thread function_b3d8a8c4(v_origin, e_attacker, e_tornado);
    /#
        if (getdvarint(#"hash_e2e03328b366e75", 0)) {
            e_trigger thread function_45b0dfc6(v_origin, "<dev string:x2cd>", "<dev string:x2da>");
        }
    #/
    e_attacker flag::wait_till_clear_timeout(12, "flag_player_clear_charged_shot");
    if (isdefined(e_attacker)) {
        e_attacker flag::wait_till_timeout(12, "flag_player_clear_charged_shot");
    } else {
        wait 12;
    }
    e_trigger notify(#"end_spin_cycle");
    e_trigger delete();
    e_tornado notify(#"end_spin_cycle");
    e_tornado clientfield::set("" + #"hash_12b19992ccb300e7", 0);
    if (level.var_2ec91d6e[var_a257f75d] == 1) {
        if (isdefined(e_attacker)) {
            if (!e_attacker flag::get("flag_player_clear_charged_shot")) {
                level.var_2ec91d6e[var_a257f75d] = -1;
            }
        } else {
            level.var_2ec91d6e[var_a257f75d] = -1;
        }
    }
    wait 2;
    e_tornado delete();
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0x90d5d86e, Offset: 0x47e8
// Size: 0xc0
function function_b3d8a8c4(v_origin, e_attacker, e_tornado) {
    e_tornado endon(#"end_spin_cycle");
    self thread function_f8679f8d(1, &function_e5e6e403, e_attacker, e_tornado);
    while (true) {
        self waittill(#"touch");
        self function_f8679f8d(1, &function_e5e6e403, e_attacker, e_tornado);
        wait 0.5;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x21 linked variadic
// Checksum 0xa461cba, Offset: 0x48b0
// Size: 0x3f2
function function_e5e6e403(...) {
    if (isdefined(self.var_bd48b030) && self.var_bd48b030) {
        return;
    }
    e_attacker = vararg[0][0];
    e_tornado = vararg[0][1];
    e_tornado endon(#"death");
    self endon(#"death");
    if (!zm_transform::function_5db4f2f5(self)) {
        return;
    }
    self.var_bd48b030 = 1;
    if (self.var_6f84b820 === #"boss" || self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"heavy") {
        self function_2d3beb68(1, e_attacker);
        return;
    }
    switch (self.archetype) {
    case #"bat":
    case #"zombie_dog":
        self.marked_for_death = 1;
        wait 0.5;
        self function_61b2f057(e_attacker, level.var_74cf08b1);
        break;
    case #"catalyst":
    case #"zombie":
    case #"nosferatu":
        self thread function_ba22c7e1();
        self thread function_6476c708(e_attacker, e_tornado);
        self thread function_a7fcc7db();
        self val::set(#"ww_ignoreme", "ignoreme", 1);
        self val::set(#"ww_ignorall", "ignoreall", 1);
        self util::delay(randomfloatrange(0.5, 1.5), "death", &function_c5eccfa2);
        wait 2;
        self.var_4a4430c5 = undefined;
        for (i = 0; i < 4; i++) {
            if (!e_tornado.var_9f00aa3b[i]) {
                e_tornado.var_9f00aa3b[i] = 1;
                self.var_4a4430c5 = i;
                break;
            }
        }
        if (isdefined(self.var_4a4430c5)) {
            self util::delay(randomfloatrange(0.5, 1.5), "death", &function_c5eccfa2);
            wait randomfloatrange(3, 5);
            e_tornado.var_9f00aa3b[self.var_4a4430c5] = 0;
        }
        wait 0.5;
        self thread function_3ebc5d0c(e_attacker);
        break;
    default:
        self thread function_2d3beb68(1, e_attacker);
        break;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x97a61b21, Offset: 0x4cb0
// Size: 0xdc
function function_ba22c7e1() {
    self endon(#"death");
    self.marked_for_death = 1;
    self.no_powerups = 1;
    if (self.archetype == #"nosferatu") {
        var_444cebf6 = #"aib_vign_zm_man_tornado_nfrtu_start";
        var_38c23eeb = #"aib_vign_zm_man_tornado_nfrtu_loop";
    } else {
        var_444cebf6 = #"aib_vign_zm_man_tornado_zombie_start";
        var_38c23eeb = #"aib_vign_zm_man_tornado_zombie_loop";
    }
    self scene::play(var_444cebf6, self);
    self thread scene::play(var_38c23eeb, self);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0x5886c551, Offset: 0x4d98
// Size: 0xf2
function function_c5eccfa2() {
    switch (randomint(3)) {
    case 0:
        gibserverutils::gibrightleg(self);
        break;
    case 1:
        gibserverutils::gibleftleg(self);
        break;
    case 2:
        gibserverutils::gibrightarm(self);
        break;
    case 3:
        gibserverutils::gibleftarm(self);
        break;
    case 4:
        self zombie_utility::zombie_head_gib();
        break;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 2, eflags: 0x1 linked
// Checksum 0x284d2be2, Offset: 0x4e98
// Size: 0x94
function function_6476c708(e_attacker, e_tornado) {
    self endon(#"death");
    s_waitresult = e_tornado waittill(#"end_spin_cycle", #"death");
    if (s_waitresult._notify === "end_spin_cycle") {
        wait 0.5;
    }
    self thread function_3ebc5d0c(e_attacker);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x1 linked
// Checksum 0xadcfbe8d, Offset: 0x4f38
// Size: 0x74
function function_a7fcc7db() {
    self endon(#"hash_76dc39ad26e9f187");
    waitresult = self waittill(#"death");
    if (isdefined(self)) {
        self zombie_utility::gib_random_parts();
        gibserverutils::annihilate(self);
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x92264b2c, Offset: 0x4fb8
// Size: 0x15c
function function_3ebc5d0c(e_attacker) {
    if (isalive(self)) {
        self scene::stop();
        self notify(#"hash_76dc39ad26e9f187");
        self function_61b2f057(e_attacker, level.var_74cf08b1);
        self zm_utility::function_ffc279((0, 0, 0), e_attacker, self.health + 666, level.var_4b14202f);
        if (self.archetype == #"nosferatu") {
            gibserverutils::annihilate(self);
            return;
        }
        gibserverutils::gibhead(self);
        if (math::cointoss()) {
            gibserverutils::gibleftarm(self);
        } else {
            gibserverutils::gibrightarm(self);
        }
        gibserverutils::gibleftleg(self);
        gibserverutils::gibrightleg(self);
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 4, eflags: 0x1 linked
// Checksum 0x593e9a0e, Offset: 0x5120
// Size: 0x44
function function_1f3fc48(v_origin, e_attacker, var_a257f75d, var_41bf50f) {
    level thread function_b9078d40(v_origin, e_attacker, var_a257f75d);
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0xa04b7fbd, Offset: 0x5170
// Size: 0x35a
function function_b9078d40(v_origin, e_attacker, var_a257f75d) {
    if (!isdefined(e_attacker)) {
        level.var_2ec91d6e[var_a257f75d] = -1;
        return;
    }
    v_normal = getnavmeshfacenormal(v_origin, 32);
    if (!isdefined(v_normal)) {
        v_normal = (0, 0, 1);
    }
    v_angles = vectortoangles(v_normal);
    v_origin_offset = v_normal * 4;
    e_attacker.e_portal = util::spawn_model("tag_origin", v_origin + v_origin_offset, v_angles);
    e_portal = e_attacker.e_portal;
    e_portal.targetname = "entity_drag";
    e_attacker.e_trigger = spawn("trigger_radius", v_origin, 512 | 1, 128, 128);
    e_trigger = e_attacker.e_trigger;
    e_portal clientfield::set("" + #"hash_54fdcf7f8eb5449e", 1);
    waitframe(1);
    e_trigger thread function_1250965b(e_attacker);
    e_trigger thread function_1beb7376(e_attacker);
    /#
        if (getdvarint(#"hash_e2e03328b366e75", 0)) {
            e_trigger thread function_45b0dfc6(v_origin, "<dev string:x2eb>", "<dev string:x2fa>");
        }
    #/
    if (isdefined(e_attacker)) {
        e_attacker flag::wait_till_clear_timeout(12, "flag_player_clear_charged_shot");
    }
    if (isdefined(e_attacker)) {
        e_attacker flag::wait_till_timeout(12, "flag_player_clear_charged_shot");
    } else {
        wait 12;
    }
    e_trigger notify(#"hash_7e07bb5b7a331e0b");
    e_trigger delete();
    e_portal clientfield::set("" + #"hash_54fdcf7f8eb5449e", 0);
    waitframe(1);
    e_portal delete();
    if (level.var_2ec91d6e[var_a257f75d] == 2) {
        if (isdefined(e_attacker)) {
            if (!e_attacker flag::get("flag_player_clear_charged_shot")) {
                level.var_2ec91d6e[var_a257f75d] = -1;
            }
            return;
        }
        level.var_2ec91d6e[var_a257f75d] = -1;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x418cc58b, Offset: 0x54d8
// Size: 0xae
function function_1250965b(e_attacker) {
    self endon(#"hash_7e07bb5b7a331e0b", #"death");
    self thread function_f8679f8d(2, &function_886f2b8d, self, e_attacker);
    while (true) {
        self waittill(#"touch");
        self function_f8679f8d(2, &function_886f2b8d, self, e_attacker);
        waitframe(1);
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0xacf1bfdf, Offset: 0x5590
// Size: 0x22c
function function_1beb7376(e_attacker) {
    self endon(#"hash_7e07bb5b7a331e0b", #"death");
    var_ceedbc10 = 204.8 * 204.8;
    while (true) {
        var_cbf658a0 = getaiarchetypearray(#"bat");
        foreach (var_45acb524 in var_cbf658a0) {
            if (!(isdefined(var_45acb524.var_7fcb707c) && var_45acb524.var_7fcb707c) && isalive(var_45acb524) && var_45acb524.origin[2] - self.origin[2] < 400 && distance2dsquared(var_45acb524.origin, self.origin) < var_ceedbc10) {
                v_trace_start = self.origin + (0, 0, 16);
                a_trace = bullettrace(v_trace_start, var_45acb524 getcentroid(), 0, undefined);
                if (isdefined(a_trace) && a_trace[#"fraction"] == 1) {
                    function_a7c67ad6(var_45acb524, 2, &function_886f2b8d, self, e_attacker);
                }
            }
        }
        wait 0.1;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x21 linked variadic
// Checksum 0x84a86d9, Offset: 0x57c8
// Size: 0x3aa
function function_886f2b8d(...) {
    if (isdefined(self.var_7fcb707c) && self.var_7fcb707c) {
        return;
    }
    e_trigger = vararg[0][0];
    e_attacker = vararg[0][1];
    if (isdefined(e_trigger)) {
        var_8007b1a0 = e_trigger.origin;
    }
    self endon(#"death");
    if (!zm_transform::function_5db4f2f5(self)) {
        return;
    }
    self.var_7fcb707c = 1;
    if (self.var_6f84b820 === #"boss" || self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"heavy") {
        self function_2d3beb68(2, e_attacker);
        return;
    }
    self clientfield::set("" + #"hash_2ff818c8cb4c17ba", 1);
    switch (self.archetype) {
    case #"bat":
    case #"catalyst":
    case #"zombie_dog":
        self function_61b2f057(e_attacker, level.var_4b14202f);
        break;
    case #"zombie":
    case #"nosferatu":
        self.marked_for_death = 1;
        self thread function_9253dc3e(2.2);
        self thread namespace_9ff9f642::slowdown(#"hash_7f87c0765184088f");
        wait 1.5;
        self thread namespace_9ff9f642::slowdown(#"hash_193617f42c166879");
        wait 0.7;
        self clientfield::set("" + #"hash_3bedaaea2c17af23", 1);
        self notsolid();
        if (isdefined(var_8007b1a0)) {
            level thread function_e8ab7e4d(var_8007b1a0, self geteye(), randomfloatrange(1.3, 1.7));
        }
        self val::set(#"hash_4ca9f93d2b6aefb2", "ignoreall", 1);
        self val::set(#"hash_6fc94bc41cfa5e91", "ignoreme", 1);
        wait 0.5;
        self function_61b2f057(e_attacker, level.var_4b14202f);
        break;
    default:
        self function_2d3beb68(2, e_attacker);
        break;
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 3, eflags: 0x1 linked
// Checksum 0x56b1914, Offset: 0x5b80
// Size: 0xb4
function function_e8ab7e4d(var_8007b1a0, var_446e486f, n_move_time) {
    var_2d9e33ca = util::spawn_model(#"tag_origin", var_446e486f);
    var_2d9e33ca clientfield::set("" + #"hash_69b312bcaae6308b", 1);
    var_2d9e33ca moveto(var_8007b1a0, n_move_time);
    wait n_move_time;
    var_2d9e33ca delete();
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 1, eflags: 0x1 linked
// Checksum 0x1cce097c, Offset: 0x5c40
// Size: 0x2c
function function_9253dc3e(n_delay) {
    wait n_delay;
    if (isdefined(self)) {
        self ghost();
    }
}

// Namespace namespace_82497b8a/namespace_a20a2d7a
// Params 0, eflags: 0x0
// Checksum 0x7cb41527, Offset: 0x5c78
// Size: 0xec
function function_52569c7e() {
    if (isdefined(self.no_gib) && self.no_gib) {
        return;
    }
    playsoundatposition(#"zmb_death_gibss", self.origin);
    self zombie_utility::zombie_head_gib();
    gibserverutils::gibrightleg(self);
    gibserverutils::gibleftleg(self);
    if (!gibserverutils::isgibbed(self, 32)) {
        gibserverutils::gibrightarm(self);
    }
    if (!gibserverutils::isgibbed(self, 16)) {
        gibserverutils::gibleftarm(self);
    }
}

