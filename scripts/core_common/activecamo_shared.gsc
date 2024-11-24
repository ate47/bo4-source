#using scripts\core_common\player\player_stats;
#using scripts\core_common\weapons_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\activecamo_shared_util;

#namespace activecamo;

// Namespace activecamo/activecamo_shared
// Params 0, eflags: 0x2
// Checksum 0x2d0cb793, Offset: 0xe8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"activecamo", &__init__, undefined, undefined);
}

// Namespace activecamo/activecamo_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5a1fa4d9, Offset: 0x130
// Size: 0x5c
function __init__() {
    callback::on_loadout(&on_player_loadout);
    callback::on_weapon_change(&on_weapon_change);
    /#
        thread function_265047c1();
    #/
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x83b05fd, Offset: 0x198
// Size: 0xa8
function on_weapon_change(params) {
    if (isdefined(level.var_b219667f) && level.var_b219667f) {
        self function_8d3b94ea(params.weapon, 1);
    } else {
        self function_8d3b94ea(params.weapon, 0);
    }
    if (isdefined(level.var_3993dc8e)) {
        self [[ level.var_3993dc8e ]](params.weapon);
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa584310, Offset: 0x248
// Size: 0x3c
function on_player_death(params) {
    if (game.state != "playing") {
        return;
    }
    self function_27779784();
}

// Namespace activecamo/activecamo_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xcbbe9c30, Offset: 0x290
// Size: 0x16c
function function_27779784() {
    if (!isdefined(self) || !isdefined(self.pers) || !isdefined(self.pers[#"activecamo"])) {
        return;
    }
    foreach (activecamo in self.pers[#"activecamo"]) {
        foreach (var_dd54a13b in activecamo.var_dd54a13b) {
            activecamo.weapon = var_dd54a13b.weapon;
            activecamo.baseweapon = function_c14cb514(activecamo.weapon);
            self init_stages(activecamo, 0, 1);
        }
    }
}

// Namespace activecamo/activecamo_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x951f8ed1, Offset: 0x408
// Size: 0xc0
function on_player_loadout() {
    self callback::remove_on_death(&on_player_death);
    weapons = self getweaponslist();
    foreach (weapon in weapons) {
        self function_8d3b94ea(weapon, 1);
    }
}

// Namespace activecamo/activecamo_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf9996780, Offset: 0x4d0
// Size: 0x7c
function function_8d3b94ea(weapon, owned, b_has_weapon) {
    weapon = function_94c2605(weapon);
    activecamoinfo = weapon_get_activecamo(weapon, b_has_weapon);
    if (isdefined(activecamoinfo)) {
        self init_activecamo(weapon, activecamoinfo, owned);
    }
}

// Namespace activecamo/activecamo_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x69276c5e, Offset: 0x558
// Size: 0x2e4
function init_activecamo(weapon, activecamoinfo, owned) {
    if (isdefined(activecamoinfo) && isdefined(activecamoinfo.name)) {
        if (!isdefined(self.pers[#"activecamo"])) {
            self.pers[#"activecamo"] = [];
        }
        if (!isdefined(self.pers[#"activecamo"][activecamoinfo.name])) {
            self.pers[#"activecamo"][activecamoinfo.name] = {};
        }
        activecamo = self.pers[#"activecamo"][activecamoinfo.name];
        activecamo.info = function_3aa81e0e(activecamoinfo);
        assert(isdefined(activecamo.info));
        activecamo.weapon = weapon;
        activecamo.baseweapon = function_c14cb514(activecamo.weapon);
        if (!isdefined(activecamo.var_dd54a13b)) {
            activecamo.var_dd54a13b = [];
        }
        if (!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon])) {
            activecamo.var_dd54a13b[activecamo.baseweapon] = {};
        }
        activecamo.var_dd54a13b[activecamo.baseweapon].weapon = weapon;
        activecamo.var_dd54a13b[activecamo.baseweapon].stagenum = undefined;
        if (!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].owned)) {
            activecamo.var_dd54a13b[activecamo.baseweapon].owned = 0;
        }
        activecamo.var_dd54a13b[activecamo.baseweapon].owned = activecamo.var_dd54a13b[activecamo.baseweapon].owned | owned;
        self init_stages(activecamo, 0, 0);
        self callback::on_death(&on_player_death);
    }
}

/#

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0x3c5e7c47, Offset: 0x848
    // Size: 0x116
    function function_b008f9e9(weapon) {
        if (!isdefined(level.activecamoinfo)) {
            return;
        }
        if (self getcurrentweapon() != weapon) {
            self switchtoweapon(weapon);
            self waittilltimeout(2, #"weapon_change");
        }
        foreach (info in level.activecamoinfo) {
            activecamoinfo = getscriptbundle(info.name);
            self init_activecamo(weapon, activecamoinfo, 1);
            waitframe(1);
        }
    }

#/

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd9dd53bb, Offset: 0x968
// Size: 0x646
function function_3aa81e0e(activecamoinfo) {
    info = undefined;
    if (isdefined(activecamoinfo) && isdefined(activecamoinfo.name)) {
        if (!isdefined(level.activecamoinfo)) {
            level.activecamoinfo = [];
        }
        if (!isdefined(level.activecamoinfo[activecamoinfo.name])) {
            level.activecamoinfo[activecamoinfo.name] = {};
        }
        info = level.activecamoinfo[activecamoinfo.name];
        info.name = activecamoinfo.name;
        info.isasync = activecamoinfo.isasync;
        info.istiered = activecamoinfo.istiered;
        info.var_e0b0d8cc = activecamoinfo.var_e0b0d8cc;
        info.var_ed6f91d5 = activecamoinfo.var_ed6f91d5;
        info.var_bd863267 = activecamoinfo.var_bd863267;
        info.istimer = activecamoinfo.istimer;
        info.var_fa0465c6 = activecamoinfo.var_fa0465c6;
        info.var_2034fabe = activecamoinfo.var_2034fabe;
        info.var_9ae5a2b8 = activecamoinfo.var_9ae5a2b8;
        var_d3daabe = 0;
        if (isdefined(activecamoinfo.stages)) {
            if (!isdefined(info.stages)) {
                info.stages = [];
            }
            foreach (key, var_3594168e in activecamoinfo.stages) {
                if (isdefined(var_3594168e.disabled) && var_3594168e.disabled) {
                    var_d3daabe++;
                    continue;
                }
                if (!isdefined(info.stages[key - var_d3daabe])) {
                    info.stages[key - var_d3daabe] = {};
                }
                stage = info.stages[key - var_d3daabe];
                if (isdefined(var_3594168e.camooption)) {
                    stage.var_19b6044e = function_8b51d9d1(var_3594168e.camooption);
                }
                /#
                    if (!isdefined(stage.var_19b6044e)) {
                        self debug_error("<dev string:x38>" + info.name + "<dev string:x3d>" + function_9e72a96(isdefined(var_3594168e.camooption) ? var_3594168e.camooption : "<dev string:x59>") + "<dev string:x63>" + key);
                    } else {
                        activecamoname = getactivecamo(stage.var_19b6044e);
                        var_31567a86 = undefined;
                        if (isdefined(activecamoname) && activecamoname != #"") {
                            var_31567a86 = getscriptbundle(activecamoname);
                        }
                        if (!isdefined(var_31567a86)) {
                            self debug_error("<dev string:x38>" + info.name + "<dev string:x74>" + stage.var_19b6044e + "<dev string:x63>" + key);
                        } else if (!isdefined(var_31567a86.name) || var_31567a86.name != info.name) {
                            self debug_error("<dev string:x38>" + info.name + "<dev string:x9e>" + stage.var_19b6044e + "<dev string:xb1>" + (isdefined(var_31567a86.name) ? var_31567a86.name : "<dev string:x59>") + "<dev string:x63>" + key);
                        }
                    }
                #/
                stage.permanent = var_3594168e.permanent;
                stage.statname = var_3594168e.statname;
                stage.permanentstatname = var_3594168e.permanentstatname;
                stage.var_e2dbd42d = isdefined(var_3594168e.var_e2dbd42d) ? var_3594168e.var_e2dbd42d : 0;
                stage.resettimer = isdefined(var_3594168e.resettimer) ? var_3594168e.resettimer : 0;
                stage.resetnotify = var_3594168e.resetnotify;
                stage.resetondeath = var_3594168e.resetondeath;
                stage.var_825ae630 = var_3594168e.var_c43b3dd3;
                stage.var_c33fcb85 = isdefined(var_3594168e.var_c33fcb85) ? var_3594168e.var_c33fcb85 : 0;
                /#
                    var_1936b16e = getdvarint(#"hash_45e0785aaf2e24af", 0);
                    if (var_1936b16e) {
                        stage.var_e2dbd42d = var_1936b16e;
                    }
                #/
            }
        }
    }
    return info;
}

// Namespace activecamo/activecamo_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x23992060, Offset: 0xfb8
// Size: 0xfa
function weapon_get_activecamo(weapon, b_has_weapon = 1) {
    activecamoinfo = undefined;
    if (b_has_weapon) {
        weaponoptions = self getweaponoptions(weapon);
    } else {
        weaponoptions = self getbuildkitweaponoptions(weapon);
    }
    camoindex = getcamoindex(weaponoptions);
    activecamoname = getactivecamo(camoindex);
    if (isdefined(activecamoname) && activecamoname != #"") {
        activecamoinfo = getscriptbundle(activecamoname);
    }
    return activecamoinfo;
}

// Namespace activecamo/activecamo_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6f72de30, Offset: 0x10c0
// Size: 0xba
function function_37a45562(camoindex, activecamo) {
    foreach (stagenum, stage in activecamo.info.stages) {
        if (isdefined(stage) && isdefined(stage.var_19b6044e) && stage.var_19b6044e == camoindex) {
            return stagenum;
        }
    }
    return undefined;
}

// Namespace activecamo/activecamo_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x62065fd2, Offset: 0x1188
// Size: 0xbb4
function init_stages(activecamo, var_3a8a1e00, isdeath) {
    if (isdefined(activecamo)) {
        if (isdefined(activecamo.info) && isdefined(activecamo.info.stages)) {
            weaponoptions = self getweaponoptions(activecamo.weapon);
            weaponstage = getactivecamostage(weaponoptions);
            camoindex = getcamoindex(weaponoptions);
            camoindexstage = function_37a45562(camoindex, activecamo);
            var_7491ec51 = activecamo.var_dd54a13b[activecamo.baseweapon].owned !== 1;
            if (!var_7491ec51) {
                var_7491ec51 = isdefined(camoindexstage);
                if (var_7491ec51) {
                    weaponstage = camoindexstage;
                }
            }
            if (!isdefined(activecamo.stages)) {
                activecamo.stages = [];
            }
            foreach (stagenum, infostage in activecamo.info.stages) {
                if (!isdefined(activecamo.stages[stagenum])) {
                    activecamo.stages[stagenum] = {};
                }
                stage = activecamo.stages[stagenum];
                stage.info = infostage;
                assert(isdefined(stage.info));
                if (!isdefined(stage.var_dd54a13b)) {
                    stage.var_dd54a13b = [];
                }
                if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon])) {
                    stage.var_dd54a13b[activecamo.baseweapon] = {};
                }
                if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon].statvalue)) {
                    stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
                }
                reset = 0;
                if (var_3a8a1e00) {
                    stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
                    reset = 1;
                } else if (isdeath) {
                    if (isdefined(stage.info.var_825ae630) && stage.info.var_825ae630 && isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared) {
                        stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                    } else if (isdefined(stage.info.resetondeath) && stage.info.resetondeath || stage.info.resettimer > 0) {
                        stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
                        reset = 1;
                    }
                }
                if (isdefined(stage.info.permanentstatname)) {
                    camo_stat = self stats::get_stat_global(stage.info.permanentstatname);
                    if (isdefined(camo_stat) && camo_stat < stage.info.var_e2dbd42d) {
                        var_7dfd59c3 = isdefined(stats::function_af5584ca(stage.info.permanentstatname)) ? stats::function_af5584ca(stage.info.permanentstatname) : 0;
                        if (var_7dfd59c3 > 0) {
                            camo_stat = stage.info.var_e2dbd42d;
                            self stats::set_stat_global(stage.info.permanentstatname, camo_stat);
                            self stats::set_stat_challenge(stage.info.permanentstatname, camo_stat);
                        }
                    }
                    if (isdefined(camo_stat)) {
                        stage.var_dd54a13b[activecamo.baseweapon].statvalue = camo_stat;
                    }
                } else if (isdefined(stage.info.permanent) && stage.info.permanent && isdefined(stage.info.statname)) {
                    camo_stat = self stats::get_stat_global(stage.info.statname);
                    if (isdefined(camo_stat)) {
                        stage.var_dd54a13b[activecamo.baseweapon].statvalue = camo_stat;
                    }
                }
                if (!reset && isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared) {
                    if (isdefined(activecamo.info.istiered) && activecamo.info.istiered) {
                        if (weaponstage > stagenum) {
                            stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                        }
                    }
                    if (isdefined(activecamo.info.var_2034fabe) && activecamo.info.var_2034fabe) {
                        if (isdefined(stage.info.permanentstatname)) {
                            if (weaponstage > stagenum) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                            }
                        } else if (isdefined(stage.info.permanent) && stage.info.permanent && isdefined(stage.info.statname)) {
                            if (weaponstage > stagenum) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                            }
                        } else if (weaponstage == stagenum) {
                            stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                        }
                    }
                }
                stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
                if (var_7491ec51) {
                    if (isdefined(activecamo.info.istiered) && activecamo.info.istiered) {
                        if (weaponstage > stagenum) {
                            if (isdefined(stage.info.permanentstatname)) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                            } else if (isdefined(stage.info.permanent) && stage.info.permanent && isdefined(stage.info.statname)) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                            }
                        }
                    }
                    if (isdefined(activecamo.info.var_2034fabe) && activecamo.info.var_2034fabe) {
                        if (isdefined(stage.info.permanentstatname)) {
                            if (weaponstage > stagenum) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                            }
                        } else if (isdefined(stage.info.permanent) && stage.info.permanent && isdefined(stage.info.statname)) {
                            if (weaponstage > stagenum) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                            }
                        } else if (weaponstage == stagenum) {
                            stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
                        }
                    }
                }
                if (isdefined(activecamo.info.isasync) && activecamo.info.isasync) {
                    self thread function_f0d83504(activecamo, stage, stagenum);
                }
            }
            self function_e44edbd1(activecamo);
        }
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa06126ff, Offset: 0x1d48
// Size: 0x1b2
function function_c0fa0ecb(weapon) {
    switch (weapon.statname) {
    case #"tr_midburst_t8":
    case #"sniper_powersemi_t8":
    case #"ar_damage_t8":
    case #"ar_accurate_t8":
    case #"smg_capacity_t8":
    case #"sniper_powerbolt_t8":
    case #"ar_fastfire_t8":
    case #"sniper_quickscope_t8":
    case #"lmg_heavy_t8":
    case #"ar_stealth_t8":
    case #"tr_longburst_t8":
    case #"smg_standard_t8":
    case #"lmg_spray_t8":
    case #"smg_accurate_t8":
    case #"ar_modular_t8":
    case #"smg_fastfire_t8":
    case #"lmg_standard_t8":
    case #"sniper_fastrechamber_t8":
    case #"tr_powersemi_t8":
    case #"smg_handling_t8":
        self stats::function_eec52333(weapon, #"hash_4e43a25a3e77ab5f", 1, self.class_num);
        break;
    default:
        break;
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x53452cac, Offset: 0x1f08
// Size: 0x11c
function function_c1f96c48(weapon) {
    switch (weapon.statname) {
    case #"ar_accurate_t8":
        return #"hash_3d392c6f96aa2ac1";
    case #"ar_fastfire_t8":
        return #"hash_9da725fe15aa048";
    case #"lmg_standard_t8":
        return #"hash_5cf945d7954a39e0";
    case #"pistol_standard_t8":
        return #"hash_1ffb9d5647330a52";
    case #"shotgun_semiauto_t8":
        return #"hash_6ed19b98000fb441";
    case #"smg_accurate_t8":
        return #"hash_4b703056e870752e";
    case #"smg_standard_t8":
        return #"hash_207f20afd71816c";
    default:
        break;
    }
    return undefined;
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xae3c76b0, Offset: 0x2030
// Size: 0x17c
function function_938534a8(permanentstatname) {
    var_19ef0b8d = undefined;
    switch (permanentstatname) {
    case #"hash_3d392c6f96aa2ac1":
        var_19ef0b8d = #"camo_active_ar_accurate_base";
        break;
    case #"hash_9da725fe15aa048":
        var_19ef0b8d = #"camo_active_ar_fastfire_base";
        break;
    case #"hash_5cf945d7954a39e0":
        var_19ef0b8d = #"camo_active_lmg_standard_base";
        break;
    case #"hash_1ffb9d5647330a52":
        var_19ef0b8d = #"camo_active_pistol_standard_base";
        break;
    case #"hash_6ed19b98000fb441":
        var_19ef0b8d = #"camo_active_shotgun_semiauto_base";
        break;
    case #"hash_4b703056e870752e":
        var_19ef0b8d = #"camo_active_smg_accurate_base";
        break;
    case #"hash_207f20afd71816c":
        var_19ef0b8d = #"camo_active_smg_standard_base";
        break;
    default:
        break;
    }
    if (isdefined(var_19ef0b8d)) {
        self stats::function_dad108fa(var_19ef0b8d, 1);
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x61cc4aa1, Offset: 0x21b8
// Size: 0xdc
function function_1af985ba(weapon) {
    if (!isplayer(self)) {
        return;
    }
    var_19bbfaaf = function_c1f96c48(weapon);
    if (!isdefined(var_19bbfaaf)) {
        return;
    }
    var_dfcb2df3 = isdefined(stats::function_af5584ca(var_19bbfaaf)) ? stats::function_af5584ca(var_19bbfaaf) : 0;
    if (var_dfcb2df3 > 0) {
        self stats::function_e24eec31(weapon, #"hash_19fbe2645c7f53a7", 1);
        self function_938534a8(var_19bbfaaf);
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x0
// Checksum 0x1414d7a3, Offset: 0x22a0
// Size: 0xdc
function function_cd9deb9e(weapon) {
    if (!isplayer(self)) {
        return;
    }
    var_19bbfaaf = function_c1f96c48(weapon);
    if (!isdefined(var_19bbfaaf)) {
        return;
    }
    var_dfcb2df3 = isdefined(stats::function_af5584ca(var_19bbfaaf)) ? stats::function_af5584ca(var_19bbfaaf) : 0;
    if (var_dfcb2df3 > 0) {
        self stats::function_e24eec31(weapon, #"hash_19fbe2645c7f53a7", 1);
        self function_938534a8(var_19bbfaaf);
    }
}

// Namespace activecamo/activecamo_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa2a232fc, Offset: 0x2388
// Size: 0x142
function function_36feaf9e(activecamo, value, weapon) {
    if (!isdefined(activecamo.kills)) {
        activecamo.kills = 0;
    }
    newvalue = activecamo.kills + value;
    if (activecamo.kills < 5 && newvalue >= 5) {
        self function_896ac347(weapon, "5th_kill", 1);
    }
    if (activecamo.kills < 9 && newvalue >= 9) {
        self function_896ac347(weapon, "9th_kill", 1);
    }
    if (activecamo.kills < 100 && newvalue >= 100) {
        self function_896ac347(weapon, "100th_kill", 1);
    }
    activecamo.kills = newvalue;
}

// Namespace activecamo/activecamo_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x630de28d, Offset: 0x24d8
// Size: 0x914
function function_896ac347(oweapon, statname, value) {
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(self.pers) || !isdefined(self.pers[#"activecamo"])) {
        return;
    }
    if (!isdefined(oweapon)) {
        assertmsg("<dev string:xcb>");
        return;
    }
    weapon = function_94c2605(oweapon);
    if (!isdefined(weapon)) {
        assertmsg("<dev string:xff>" + function_9e72a96(oweapon.name));
        return;
    }
    activecamoinfo = weapon_get_activecamo(weapon);
    if (isdefined(activecamoinfo)) {
        activecamo = self.pers[#"activecamo"][activecamoinfo.name];
        if (isdefined(activecamo)) {
            activecamo.weapon = weapon;
            activecamo.baseweapon = function_c14cb514(activecamo.weapon);
            if (!isdefined(activecamo.baseweapon)) {
                assertmsg("<dev string:x144>" + function_9e72a96(activecamo.weapon.name));
                return;
            }
            if (!isdefined(activecamo.var_dd54a13b[activecamo.baseweapon])) {
                assertmsg("<dev string:x192>" + function_9e72a96(activecamo.baseweapon.name) + "<dev string:x1c2>");
                return;
            }
            var_7a414d4a = 0;
            var_5c900b6e = 0;
            var_7cbc8452 = 0;
            var_15838be3 = 0;
            if (isdefined(activecamo.stages)) {
                foreach (stagenum, stage in activecamo.stages) {
                    if (isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared) {
                        if (stage.info.statname === statname) {
                            var_5c900b6e = 1;
                        }
                        continue;
                    }
                    lastvalue = stage.var_dd54a13b[activecamo.baseweapon].statvalue;
                    if (isdefined(stage.info.permanentstatname) && activecamo.var_dd54a13b[activecamo.baseweapon].owned === 1) {
                        if (stage.info.statname == statname) {
                            if (self stats::function_dad108fa(stage.info.permanentstatname, value)) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = self stats::get_stat_global(stage.info.permanentstatname);
                            }
                        }
                    } else if (isdefined(stage.info.statname)) {
                        if (isdefined(activecamo.info.var_2034fabe) && activecamo.info.var_2034fabe) {
                            if (!(isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8) && activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8)) {
                                continue;
                            }
                        }
                        if (isdefined(stage.info.permanent) && stage.info.permanent && activecamo.var_dd54a13b[activecamo.baseweapon].owned === 1) {
                            if (self stats::function_dad108fa(statname, value)) {
                                stage.var_dd54a13b[activecamo.baseweapon].statvalue = self stats::get_stat_global(statname);
                            }
                        } else if (stage.info.statname == statname) {
                            stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.var_dd54a13b[activecamo.baseweapon].statvalue + value;
                        }
                    }
                    var_804a253 = stage.var_dd54a13b[activecamo.baseweapon].statvalue > lastvalue;
                    if (var_804a253) {
                        var_7a414d4a = 1;
                        if (isdefined(activecamo.info.var_e0b0d8cc) && activecamo.info.var_e0b0d8cc) {
                            var_7cbc8452 = 1;
                            self thread function_a6bcf0e2(activecamo);
                        }
                        if (sessionmodeismultiplayergame()) {
                            if (activecamoinfo.name == #"activecamoinfo_t8_darkmatter") {
                                if (stagenum == 1 && stage.var_dd54a13b[activecamo.baseweapon].statvalue == 5) {
                                    self stats::function_dad108fa(#"hash_51eff59939399dc9", 1);
                                } else if (stagenum == 5 && stage.var_dd54a13b[activecamo.baseweapon].statvalue == 5) {
                                    self function_c0fa0ecb(weapon);
                                }
                            } else if (activecamoinfo.name == #"activecamoinfo_t8_gold") {
                                if (stagenum == 1 && stage.var_dd54a13b[activecamo.baseweapon].statvalue == 1) {
                                    self stats::function_dad108fa(#"hash_354bfe5c140365bf", 1);
                                }
                            }
                        }
                    }
                    if (isdefined(activecamo.info.istiered) && activecamo.info.istiered) {
                        break;
                    }
                }
                if (var_7a414d4a) {
                    var_15838be3 = self function_b9119037(activecamo);
                }
                if (!var_15838be3 && var_5c900b6e && !var_7cbc8452 && isdefined(activecamo.var_e0b0d8cc) && activecamo.var_e0b0d8cc) {
                    var_7cbc8452 = 1;
                    self thread function_a6bcf0e2(activecamo);
                }
            }
            if (statname == #"kills") {
                self function_36feaf9e(activecamo, value, activecamo.weapon);
            }
        }
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x41188520, Offset: 0x2df8
// Size: 0xe8
function function_94c2605(weapon) {
    if (isdefined(weapon)) {
        if (level.weaponnone != weapon) {
            activecamoweapon = weapon;
            if (activecamoweapon.inventorytype == "dwlefthand") {
                if (isdefined(activecamoweapon.dualwieldweapon) && level.weaponnone != activecamoweapon.dualwieldweapon) {
                    activecamoweapon = activecamoweapon.dualwieldweapon;
                }
            }
            if (activecamoweapon.isaltmode) {
                if (isdefined(activecamoweapon.altweapon) && level.weaponnone != activecamoweapon.altweapon) {
                    activecamoweapon = activecamoweapon.altweapon;
                }
            }
            return activecamoweapon;
        }
    }
    return weapon;
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7b04b8bc, Offset: 0x2ee8
// Size: 0x2c
function function_a6bcf0e2(activecamo) {
    self impulseactivecamo(activecamo.weapon);
}

// Namespace activecamo/activecamo_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x491337d3, Offset: 0x2f20
// Size: 0x84
function function_f0d83504(activecamo, stage, stagenum) {
    self setactivecamostage(activecamo.weapon, stagenum, 1, isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared);
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6a0dd668, Offset: 0x2fb0
// Size: 0x1d4
function function_e44edbd1(activecamo) {
    if (isdefined(activecamo.info.istiered) && activecamo.info.istiered) {
        var_e92afc26 = 0;
        for (stagenum = activecamo.stages.size - 1; stagenum >= 0; stagenum--) {
            stage = activecamo.stages[stagenum];
            if (stage.info.var_e2dbd42d > 0 && stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.info.var_e2dbd42d) {
                if (var_e92afc26 < stagenum) {
                    var_e92afc26 = stagenum;
                }
            }
            if (stagenum < var_e92afc26) {
                stage.var_dd54a13b[activecamo.baseweapon].statvalue = stage.info.var_e2dbd42d;
            }
        }
        self function_b9119037(activecamo);
    }
    if (isdefined(activecamo.info.var_2034fabe) && activecamo.info.var_2034fabe) {
        activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = 0;
        self function_b9119037(activecamo);
    }
}

// Namespace activecamo/activecamo_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7798e920, Offset: 0x3190
// Size: 0x886
function function_b9119037(activecamo) {
    if (!isdefined(activecamo.baseweapon) || !isdefined(activecamo.var_dd54a13b[activecamo.baseweapon])) {
        return;
    }
    if (isdefined(activecamo.info.istiered) && activecamo.info.istiered) {
        stagenum = 0;
        foreach (key, stage in activecamo.stages) {
            if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon])) {
                continue;
            }
            stagenum = key;
            if (stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.info.var_e2dbd42d) {
                stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
                if (activecamo.info.var_9ae5a2b8 === 1 && stagenum == activecamo.stages.size - 1) {
                    var_c70461e6 = 1;
                    break;
                }
                continue;
            }
            break;
        }
        if (var_c70461e6 === 1) {
            var_2cc4646f = 0;
            foreach (key, stage in activecamo.stages) {
                if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon])) {
                    continue;
                }
                if (!var_2cc4646f) {
                    if (stage.info.var_c33fcb85 === 1) {
                        var_2cc4646f = 1;
                        stagenum = key;
                    } else {
                        continue;
                    }
                }
                stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
                stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
                stage.resettime = undefined;
            }
            if (var_2cc4646f) {
                return set_stage_activecamo(activecamo, stagenum);
            }
        } else {
            weaponoptions = self getweaponoptions(activecamo.weapon);
            weaponstage = getactivecamostage(weaponoptions);
            if (weaponstage != stagenum || activecamo.var_dd54a13b[activecamo.baseweapon].stagenum !== stagenum) {
                return set_stage_activecamo(activecamo, stagenum);
            }
        }
        return 0;
    }
    if (isdefined(activecamo.info.var_2034fabe) && activecamo.info.var_2034fabe) {
        if (!(isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8) && activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8)) {
            var_8fc208a8 = 1;
            foreach (key, stage in activecamo.stages) {
                if (isdefined(stage.info.permanentstatname)) {
                    if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon])) {
                        continue;
                    }
                    if (stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.info.var_e2dbd42d) {
                        stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
                    }
                    if (!(isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared)) {
                        var_8fc208a8 = 0;
                    }
                    continue;
                }
                break;
            }
            if (var_8fc208a8) {
                activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = 1;
            }
        }
        var_42d9b149 = 0;
        if (isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8) && activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8) {
            for (stagenum = activecamo.stages.size - 1; stagenum >= 0; stagenum--) {
                stage = activecamo.stages[stagenum];
                if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon])) {
                    continue;
                }
                if (!(isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].statvalue >= stage.info.var_e2dbd42d) {
                    stage.var_dd54a13b[activecamo.baseweapon].cleared = 1;
                    var_42d9b149 = stagenum;
                    break;
                }
            }
            foreach (key, stage in activecamo.stages) {
                if (isdefined(stage.info.permanentstatname)) {
                    continue;
                }
                if (var_42d9b149 == key) {
                    continue;
                }
                if (!isdefined(stage.var_dd54a13b[activecamo.baseweapon])) {
                    continue;
                }
                stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
                stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
            }
        }
        weaponoptions = self getweaponoptions(activecamo.weapon);
        weaponstage = getactivecamostage(weaponoptions);
        if (weaponstage != var_42d9b149 || activecamo.var_dd54a13b[activecamo.baseweapon].stagenum !== var_42d9b149) {
            return set_stage_activecamo(activecamo, var_42d9b149);
        }
    }
    return 0;
}

// Namespace activecamo/activecamo_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2063d015, Offset: 0x3a20
// Size: 0x170
function set_stage_activecamo(activecamo, stagenum) {
    setstage = activecamo.stages[stagenum];
    if (!isdefined(setstage)) {
        return false;
    }
    activecamo.var_dd54a13b[activecamo.baseweapon].stagenum = stagenum;
    self setactivecamostage(activecamo.weapon, stagenum);
    if (isdefined(setstage.info.var_19b6044e)) {
        self setcamo(activecamo.weapon, setstage.info.var_19b6044e);
    }
    /#
        self debug_print("<dev string:x38>" + activecamo.info.name + "<dev string:x1eb>" + stagenum + "<dev string:x1fa>" + (isdefined(setstage.info.var_19b6044e) ? setstage.info.var_19b6044e : "<dev string:x20b>"));
    #/
    self thread function_a80cb651(activecamo, stagenum);
    return true;
}

// Namespace activecamo/activecamo_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x686e8977, Offset: 0x3b98
// Size: 0x34c
function function_a80cb651(activecamo, stagenum) {
    self notify("4be8cd84d8f00caa");
    self endon("4be8cd84d8f00caa");
    self endon(#"new_stage", #"death");
    stage = activecamo.stages[stagenum];
    if (stage.info.resettimer == 0 && !isdefined(stage.info.resetnotify)) {
        return;
    }
    weapon = activecamo.weapon;
    while (true) {
        if (stage.info.resettimer > 0 && isdefined(stage.info.resetnotify)) {
            stage.resettime = gettime() + stage.info.resettimer;
            s_result = self waittilltimeout(float(stage.info.resettimer) / 1000, stage.info.resetnotify);
        } else if (stage.info.resettimer > 0) {
            stage.resettime = gettime() + stage.info.resettimer;
            wait float(stage.info.resettimer) / 1000;
        } else {
            s_result = self waittill(stage.info.resetnotify);
        }
        baseweapon = function_c14cb514(weapon);
        if (!isdefined(s_result) || !isdefined(s_result.weapon) || baseweapon == s_result.weapon) {
            break;
        }
    }
    activecamo.weapon = weapon;
    activecamo.baseweapon = baseweapon;
    if (isdefined(stage.var_dd54a13b[activecamo.baseweapon].cleared) && stage.var_dd54a13b[activecamo.baseweapon].cleared) {
        return;
    }
    stage.var_dd54a13b[activecamo.baseweapon].statvalue = 0;
    stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
    stage.resettime = undefined;
    self init_stages(activecamo, 1, 0);
}

/#

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0xe0552f09, Offset: 0x3ef0
    // Size: 0xe4
    function debug_error(message, weapon) {
        if (getdvarint(#"activecamo_debug", 0) > 0) {
            weaponname = "<dev string:x217>";
            if (isdefined(weapon)) {
                weaponname = "<dev string:x21a>" + function_9e72a96(weapon.name);
            }
            self iprintlnbold("<dev string:x227>" + message + weaponname);
            println("<dev string:x247>" + self.playername + "<dev string:x25c>" + message + weaponname);
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0x8aa95882, Offset: 0x3fe0
    // Size: 0xe4
    function debug_print(message, weapon) {
        if (getdvarint(#"activecamo_debug", 0) > 0) {
            weaponname = "<dev string:x217>";
            if (isdefined(weapon)) {
                weaponname = "<dev string:x21a>" + function_9e72a96(weapon.name);
            }
            self iprintlnbold("<dev string:x247>" + message + weaponname);
            println("<dev string:x247>" + self.playername + "<dev string:x25c>" + message + weaponname);
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0x21468677, Offset: 0x40d0
    // Size: 0xa4
    function function_265047c1() {
        callback::on_connect(&on_player_connect);
        callback::on_disconnect(&on_player_disconnect);
        level.var_630fbd77 = "<dev string:x261>";
        root = "<dev string:x27f>" + level.var_630fbd77;
        function_1039ce5c(root);
        thread devgui_think();
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0xc9826166, Offset: 0x4180
    // Size: 0x34
    function on_player_connect() {
        if (self getentnum() < 4) {
            self thread devgui_player_connect();
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0x9493cc2c, Offset: 0x41c0
    // Size: 0x34
    function on_player_disconnect() {
        if (self getentnum() < 4) {
            self thread devgui_player_disconnect();
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0x9d9313d6, Offset: 0x4200
    // Size: 0xc8
    function devgui_player_connect() {
        if (!isdefined(level.var_630fbd77)) {
            return;
        }
        wait 2;
        root = level.var_630fbd77 + "<dev string:x28d>";
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (players[i] != self) {
                continue;
            }
            thread devgui_add_player_commands(root, players[i].playername, i + 1);
            return;
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0x33b89e06, Offset: 0x42d0
    // Size: 0x74
    function devgui_player_disconnect() {
        if (!isdefined(level.var_630fbd77)) {
            return;
        }
        root = level.var_630fbd77 + "<dev string:x28d>";
        cmd = "<dev string:x298>" + root + self.playername + "<dev string:x2a9>";
        thread util::add_debug_command(cmd);
    }

    // Namespace activecamo/activecamo_shared
    // Params 3, eflags: 0x0
    // Checksum 0xda4ed4c2, Offset: 0x4350
    // Size: 0xc4
    function devgui_add_player_commands(root, pname, index) {
        add_cmd_with_root = "<dev string:x27f>" + root + pname + "<dev string:x2ae>";
        pid = "<dev string:x217>" + index;
        function_f1d01720(add_cmd_with_root, index);
        function_85cb822d(add_cmd_with_root, index);
        function_de358bfd(add_cmd_with_root, index);
        function_50d79d31(add_cmd_with_root, index);
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0x8d0e48, Offset: 0x4420
    // Size: 0x44
    function function_1039ce5c(root) {
        cmd = root + "<dev string:x2b2>" + "<dev string:x2c1>";
        thread util::add_debug_command(cmd);
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0x14e9978b, Offset: 0x4470
    // Size: 0xfc
    function function_f1d01720(root, index) {
        var_37949de1 = root;
        if (!isdefined(index)) {
            index = 0;
        }
        cmd = root + "<dev string:x2e3>" + "<dev string:x2ed>" + index + "<dev string:x322>";
        thread util::add_debug_command(cmd);
        cmd = root + "<dev string:x328>" + "<dev string:x334>" + index + "<dev string:x322>";
        thread util::add_debug_command(cmd);
        cmd = root + "<dev string:x366>" + "<dev string:x370>" + index + "<dev string:x322>";
        thread util::add_debug_command(cmd);
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0x7ce7e682, Offset: 0x4578
    // Size: 0x130
    function function_85cb822d(root, index) {
        var_37949de1 = root + "<dev string:x3a0>";
        if (!isdefined(index)) {
            index = 0;
        }
        activecamos = function_2c48197b();
        foreach (activecamo in activecamos) {
            activecamoname = function_9e72a96(activecamo);
            cmd = var_37949de1 + activecamoname + "<dev string:x3a9>" + activecamoname + "<dev string:x3d9>" + index + "<dev string:x322>";
            thread util::add_debug_command(cmd);
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0xcee6755d, Offset: 0x46b0
    // Size: 0x148
    function function_de358bfd(root, index) {
        var_1520a1da = root + "<dev string:x3f3>";
        if (!isdefined(index)) {
            index = 0;
        }
        weapons = [];
        weapons[0] = "<dev string:x3fe>";
        weapons[1] = "<dev string:x40f>";
        weapons[2] = "<dev string:x425>";
        weapons[3] = "<dev string:x434>";
        foreach (weapon in weapons) {
            cmd = var_1520a1da + weapon + "<dev string:x443>" + weapon + "<dev string:x3d9>" + index + "<dev string:x322>";
            thread util::add_debug_command(cmd);
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0x385a42d, Offset: 0x4800
    // Size: 0x160
    function function_50d79d31(root, index) {
        var_82c49718 = root + "<dev string:x476>";
        if (!isdefined(index)) {
            index = 0;
        }
        stages = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
        foreach (stage in stages) {
            cmd = var_82c49718 + stage + "<dev string:x483>" + stage + "<dev string:x3d9>" + index + "<dev string:x322>";
            thread util::add_debug_command(cmd);
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0xe360edea, Offset: 0x4968
    // Size: 0x350
    function devgui_think() {
        for (;;) {
            wait 0.5;
            reset = 1;
            host = util::gethostplayer();
            switch (getdvarstring(#"hash_3e1bb44a57b02ed8")) {
            case 0:
                reset = 0;
                break;
            case #"debugprints":
                setdvar(#"activecamo_debug", !getdvarint(#"activecamo_debug", 0));
                break;
            case #"reset":
                function_cc5baf7f(&function_58719455);
                break;
            case #"impulse":
                function_cc5baf7f(&function_382462ff);
                break;
            case #"stage_next":
                function_cc5baf7f(&function_3ac4d286, 0);
                break;
            case #"stage_prev":
                function_cc5baf7f(&function_3ac4d286, 1);
                break;
            case #"set_camo":
                function_cc5baf7f(&function_9c361e56, getdvarstring(#"hash_3fe8dd280c325e8"));
                break;
            case #"give_weapon":
                function_cc5baf7f(&function_cc486b05, getdvarstring(#"hash_3fe8dd280c325e8"));
                break;
            case #"set_stage":
                function_cc5baf7f(&function_779a9561, getdvarstring(#"hash_3fe8dd280c325e8"));
                break;
            }
            if (reset) {
                setdvar(#"hash_3e1bb44a57b02ed8", "<dev string:x217>");
                setdvar(#"hash_3fe8dd280c325e8", "<dev string:x217>");
                setdvar(#"hash_324a391b56cb100", "<dev string:x217>");
            }
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0x52cfe894, Offset: 0x4cc0
    // Size: 0x150
    function function_cc5baf7f(callback, par) {
        pid = getdvarint(#"hash_324a391b56cb100", 0);
        if (pid > 0) {
            player = getplayers()[pid - 1];
            if (isdefined(player)) {
                if (isdefined(par)) {
                    player [[ callback ]](par);
                } else {
                    player [[ callback ]]();
                }
            }
            return;
        }
        players = getplayers();
        foreach (player in players) {
            if (isdefined(par)) {
                player [[ callback ]](par);
                continue;
            }
            player [[ callback ]]();
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0xdaffd2ca, Offset: 0x4e18
    // Size: 0x5c
    function function_cc486b05(weaponname) {
        weapon = getweapon(weaponname);
        self giveweapon(weapon);
        self switchtoweapon(weapon);
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0xc06f2382, Offset: 0x4e80
    // Size: 0x4f4
    function function_779a9561(stagenum) {
        weapon = self getcurrentweapon();
        weapon = function_94c2605(weapon);
        activecamoinfo = weapon_get_activecamo(weapon);
        if (isdefined(activecamoinfo)) {
            activecamo = self.pers[#"activecamo"][activecamoinfo.name];
            if (isdefined(activecamo) && isdefined(activecamo.stages) && stagenum < activecamo.stages.size) {
                activecamo.weapon = weapon;
                activecamo.baseweapon = function_c14cb514(activecamo.weapon);
                if (isdefined(activecamo.info.istiered) && activecamo.info.istiered) {
                    foreach (key, stage in activecamo.stages) {
                        statcount = 0;
                        if (key < stagenum) {
                            statcount = stage.info.var_e2dbd42d;
                        }
                        if (isdefined(stage.info.permanentstatname)) {
                            self stats::set_stat_global(stage.info.permanentstatname, statcount);
                        } else if (isdefined(stage.info.statname)) {
                            if (isdefined(stage.info.permanent) && stage.info.permanent) {
                                self stats::set_stat_global(stage.info.statname, statcount);
                            }
                        }
                        stage.var_dd54a13b[activecamo.baseweapon].statvalue = statcount;
                        stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
                    }
                } else if (isdefined(activecamo.info.var_2034fabe) && activecamo.info.var_2034fabe) {
                    activecamo.var_dd54a13b[activecamo.baseweapon].var_8fc208a8 = undefined;
                    foreach (key, stage in activecamo.stages) {
                        statcount = 0;
                        if (key < stagenum) {
                            statcount = stage.info.var_e2dbd42d;
                        }
                        if (isdefined(stage.info.permanentstatname)) {
                            self stats::set_stat_global(stage.info.permanentstatname, statcount);
                        } else if (isdefined(stage.info.statname)) {
                            statcount = 0;
                            if (key == stagenum) {
                                statcount = stage.info.var_e2dbd42d;
                            }
                            if (isdefined(stage.info.permanent) && stage.info.permanent) {
                                self stats::set_stat_global(stage.info.statname, statcount);
                            }
                        }
                        stage.var_dd54a13b[activecamo.baseweapon].statvalue = statcount;
                        stage.var_dd54a13b[activecamo.baseweapon].cleared = undefined;
                    }
                }
                self function_b9119037(activecamo);
            }
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf07ba833, Offset: 0x5380
    // Size: 0x74
    function function_9c361e56(activecamoname) {
        activecamoinfo = getscriptbundle(activecamoname);
        weapon = self getcurrentweapon();
        if (isdefined(activecamoinfo)) {
            self init_activecamo(weapon, activecamoinfo, 1);
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0x7704d71, Offset: 0x5400
    // Size: 0x4c
    function function_3ac4d286(back) {
        weapon = self getcurrentweapon();
        self function_633fbf17(weapon, back);
    }

    // Namespace activecamo/activecamo_shared
    // Params 2, eflags: 0x0
    // Checksum 0xd0b106a9, Offset: 0x5458
    // Size: 0x1cc
    function function_633fbf17(weapon, back) {
        if (isdefined(weapon)) {
            self function_8d3b94ea(weapon, 1);
            weapon = function_94c2605(weapon);
            activecamoinfo = weapon_get_activecamo(weapon);
            if (isdefined(activecamoinfo)) {
                activecamo = self.pers[#"activecamo"][activecamoinfo.name];
                if (isdefined(activecamo)) {
                    if (isdefined(activecamo.stages)) {
                        activecamo.weapon = weapon;
                        activecamo.baseweapon = function_c14cb514(activecamo.weapon);
                        currentstage = isdefined(activecamo.var_dd54a13b[activecamo.baseweapon].stagenum) ? activecamo.var_dd54a13b[activecamo.baseweapon].stagenum : -1;
                        if (back) {
                            nextstage = (currentstage - 1 + activecamo.stages.size) % activecamo.stages.size;
                        } else {
                            nextstage = (currentstage + 1) % activecamo.stages.size;
                        }
                        self function_779a9561(nextstage);
                    }
                }
            }
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0x8b1bec0b, Offset: 0x5630
    // Size: 0x3c
    function function_58719455() {
        weapon = self getcurrentweapon();
        self function_3d928fb4(weapon);
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0x7f4a8f5, Offset: 0x5678
    // Size: 0xfc
    function function_3d928fb4(weapon) {
        if (isdefined(weapon)) {
            self function_8d3b94ea(weapon, 1);
            weapon = function_94c2605(weapon);
            activecamoinfo = weapon_get_activecamo(weapon);
            if (isdefined(activecamoinfo)) {
                activecamo = self.pers[#"activecamo"][activecamoinfo.name];
                if (isdefined(activecamo)) {
                    activecamo.weapon = weapon;
                    activecamo.baseweapon = function_c14cb514(activecamo.weapon);
                    self function_9fc8a57c(activecamo);
                }
            }
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0xf01b7bb8, Offset: 0x5780
    // Size: 0xc4
    function function_9fc8a57c(activecamo) {
        if (isdefined(activecamo)) {
            if (isdefined(activecamo.stages)) {
                foreach (stagenum, stage in activecamo.stages) {
                    self function_dc6014e8(activecamo, stage, stagenum);
                }
                self init_stages(activecamo, 1, 0);
            }
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 3, eflags: 0x0
    // Checksum 0x5bd01272, Offset: 0x5850
    // Size: 0xdc
    function function_dc6014e8(activecamo, stage, stagenum) {
        if (isdefined(stage.info.permanentstatname)) {
            self stats::set_stat_global(stage.info.permanentstatname, 0);
            return;
        }
        if (isdefined(stage.info.statname)) {
            if (isdefined(stage.info.permanent) && stage.info.permanent) {
                self stats::set_stat_global(stage.info.statname, 0);
            }
        }
    }

    // Namespace activecamo/activecamo_shared
    // Params 0, eflags: 0x0
    // Checksum 0xb2c6e8cc, Offset: 0x5938
    // Size: 0x3c
    function function_382462ff() {
        weapon = self getcurrentweapon();
        self function_14a9eb5b(weapon);
    }

    // Namespace activecamo/activecamo_shared
    // Params 1, eflags: 0x0
    // Checksum 0x781181d9, Offset: 0x5980
    // Size: 0xfc
    function function_14a9eb5b(weapon) {
        if (isdefined(weapon)) {
            self function_8d3b94ea(weapon, 1);
            weapon = function_94c2605(weapon);
            activecamoinfo = weapon_get_activecamo(weapon);
            if (isdefined(activecamoinfo)) {
                activecamo = self.pers[#"activecamo"][activecamoinfo.name];
                if (isdefined(activecamo)) {
                    activecamo.weapon = weapon;
                    activecamo.baseweapon = function_c14cb514(activecamo.weapon);
                    self function_a6bcf0e2(activecamo);
                }
            }
        }
    }

#/
