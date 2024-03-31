// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\bots\bot.gsc;

#namespace zm_bot_action;

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x2
// Checksum 0xbcd51eba, Offset: 0xb8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bot_action", &__init__, &__main__, undefined);
}

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x108
// Size: 0x4
function __init__() {
    
}

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x49fa6893, Offset: 0x118
// Size: 0x94
function __main__() {
    level bot_action::register_actions();
    level bot_action::register_weapons();
    level bot_action::function_25f1e3c1();
    level register_actions();
    level register_weapons();
    level function_25f1e3c1();
}

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xe0fe932e, Offset: 0x1b8
// Size: 0x234
function register_actions() {
    bot_action::register_action(#"hash_4a5a38bf3502d071", &bot_action::current_melee_weapon_rank, &function_aa4daa54, &bot_action::melee_enemy);
    bot_action::register_action(#"hash_22d98a5a241c78ba", &bot_action::rank_priority, &function_b4d8b7d6, &function_3c22de9a);
    bot_action::register_action(#"hash_5c2824c8a8f125f7", &bot_action::rank_priority, &function_ae19f70f, &function_2c6e5988);
    bot_action::register_action(#"zombie_auto_revive", &bot_action::rank_priority, &function_f4707540, &zombie_auto_revive);
    bot_action::register_action(#"zombie_reload_weapon", &bot_action::current_weapon_rank, &bot_action::reload_weapon_weight, &zombie_reload_weapon);
    bot_action::register_action(#"zombie_revive_player", &bot_action::rank_priority, &function_296516b4, &bot_action::revive_player);
    bot_action::register_action(#"zombie_scan_for_threats", &bot_action::function_728212e8, &bot_action::scan_for_threats_weight, &zombie_scan_for_threats);
}

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x123850e, Offset: 0x3f8
// Size: 0x17c
function register_weapons() {
    bot_action::register_bulletweapon(#"ar_mg1909_t8");
    bot_action::register_bulletweapon(#"minigun");
    bot_action::register_bulletweapon(#"pistol_revolver38");
    bot_action::register_bulletweapon(#"pistol_topbreak_t8");
    bot_action::register_bulletweapon(#"shotgun_trenchgun_t8");
    bot_action::register_bulletweapon(#"smg_drum_pistol_t8");
    bot_action::register_bulletweapon(#"ww_tricannon_t8");
    bot_action::register_bulletweapon(#"ww_tricannon_air_t8");
    bot_action::register_bulletweapon(#"ww_tricannon_earth_t8");
    bot_action::register_bulletweapon(#"ww_tricannon_fire_t8");
    bot_action::register_bulletweapon(#"ww_tricannon_water_t8");
    self function_c31a5c42();
}

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x580
// Size: 0x4
function function_25f1e3c1() {
    
}

// Namespace zm_bot_action/zm_bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x590
// Size: 0x4
function function_c31a5c42() {
    
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x0
// Checksum 0xbe037c84, Offset: 0x5a0
// Size: 0x38
function function_95600a05(actionparams) {
    actionparams.target = self.enemy;
    self bot_action::function_9c6ca396(actionparams);
    return 100;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x0
// Checksum 0x424b512f, Offset: 0x5e0
// Size: 0x106
function throw_chakram(actionparams) {
    weapon = actionparams.weapon;
    dualwieldweapon = weapon.dualwieldweapon;
    while (!self bot_action::function_cf788c22() && self bot::weapon_loaded(dualwieldweapon)) {
        self bot_action::function_8a2b82ad(actionparams);
        self bot_action::function_e69a1e2e(actionparams);
        if (self bot_action::function_faa6a59d(actionparams, dualwieldweapon.maxdamagerange) && self bot_action::function_31a76186(actionparams)) {
            self bottapbutton(24);
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x0
// Checksum 0xdc26c53, Offset: 0x6f0
// Size: 0x402
function function_5f02aeee(actionparams) {
    weapon = actionparams.weapon;
    slot = self gadgetgetslot(weapon);
    if (!self bot_action::function_fe0b0c29(slot)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self gadgetisready(slot)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self bot::in_combat()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!isdefined(self.enemy) || !isalive(self.enemy)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (self getenemiesinradius(self.origin, 512).size < 8 && self getenemiesinradius(self.origin, 256).size < 5) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x0
// Checksum 0x24291bfb, Offset: 0xb00
// Size: 0x6e
function function_ef04e9cc(actionparams) {
    weapon = actionparams.weapon;
    self bot_action::function_ccdcc5d9(weapon);
    while (self isswitchingweapons()) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x82d396a0, Offset: 0xb78
// Size: 0x352
function function_aa4daa54(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    primaryweapons = self getweaponslistprimaries();
    foreach (primary in primaryweapons) {
        if (isdefined(primary) && primary.name != "none") {
            if (self getammocount(primary) > 0) {
                /#
                    if (!isdefined(actionparams.debug)) {
                        actionparams.debug = [];
                    } else if (!isarray(actionparams.debug)) {
                        actionparams.debug = array(actionparams.debug);
                    }
                    actionparams.debug[actionparams.debug.size] = "<unknown string>";
                #/
                return undefined;
            }
        }
    }
    if (!self bot_action::is_target_visible(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    meleerange = actionparams.weapon.var_bfbec33f;
    enemyradius = self.enemy getpathfindingradius();
    if (distance2dsquared(self.origin, self.enemy.origin) > (meleerange + enemyradius) * (meleerange + enemyradius)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xe2f4e5db, Offset: 0xed8
// Size: 0x3e
function zombie_auto_revive(actionparams) {
    while (isdefined(self.revivetrigger)) {
        self bottapbutton(3);
        waitframe(1);
    }
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x1402dba9, Offset: 0xf20
// Size: 0xc2
function function_f4707540(actionparams) {
    if (!isdefined(self.var_72249004) || self.var_72249004 <= 0) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x5481a9b6, Offset: 0xff0
// Size: 0x3ca
function function_ae19f70f(actionparams) {
    if (self getcurrentweapon().isgadget) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self bot::function_914feddd()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (self haspath()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    zombie_weapon_upgrade = self bot::get_interact();
    actionparams.zombie_weapon_upgrade = zombie_weapon_upgrade;
    trigger = function_d41104ab(zombie_weapon_upgrade);
    if (!isdefined(trigger)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self function_f59547eb(trigger)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x0
// Checksum 0x4f26e948, Offset: 0x13c8
// Size: 0xca
function function_99428ae2(actionparams) {
    self notify(#"hash_782d5f24975a7cd1");
    self endon(#"hash_782d5f24975a7cd1", #"hash_5b4f399c08222e2", #"death", #"entering_last_stand", #"enter_vehicle", #"animscripted_start", #"hash_1728f8b5de3bde13");
    level endon(#"game_ended");
    self waittill(#"wallbuy_done");
    actionparams.var_d9c6fa12 = 1;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x5 linked
// Checksum 0x23d637f2, Offset: 0x14a0
// Size: 0xc6
function private function_f59547eb(trigger) {
    var_e61f062b = self getpathfindingradius();
    maxs = (trigger.maxs[0], trigger.maxs[1], 0);
    var_12f8c7ca = length(maxs);
    return distance2dsquared(self.origin, trigger.origin) <= (120 + var_12f8c7ca + var_e61f062b) * (120 + var_12f8c7ca + var_e61f062b);
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x87de6fc6, Offset: 0x1570
// Size: 0x84
function function_2c6e5988(actionparams) {
    zombie_weapon_upgrade = actionparams.zombie_weapon_upgrade;
    trigger = zombie_weapon_upgrade.trigger_stub.playertrigger[self getentitynumber()];
    trigger useby(self);
    waitframe(1);
    self bot::clear_interact();
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xe2bf386c, Offset: 0x1600
// Size: 0x142
function function_d41104ab(interact) {
    /#
        assert(isbot(self));
    #/
    if (!isdefined(interact)) {
        return;
    }
    if (isentity(interact)) {
        return interact;
    }
    if (isdefined(interact.trigger_stub) && isdefined(interact.trigger_stub.playertrigger)) {
        return interact.trigger_stub.playertrigger[self getentitynumber()];
    }
    if (isdefined(interact.unitrigger_stub) && isdefined(interact.unitrigger_stub.playertrigger)) {
        return interact.unitrigger_stub.playertrigger[self getentitynumber()];
    }
    if (isdefined(interact.playertrigger)) {
        return interact.playertrigger[self getentitynumber()];
    }
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xcd67ed86, Offset: 0x1750
// Size: 0x3ca
function function_b4d8b7d6(actionparams) {
    if (self getcurrentweapon().isgadget) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self bot::function_43a720c7()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (self haspath()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    interact = self bot::get_interact();
    actionparams.interact = interact;
    trigger = function_d41104ab(interact);
    if (!isdefined(trigger)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self function_f59547eb(trigger)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xb0f5bd1f, Offset: 0x1b28
// Size: 0xa4
function function_3c22de9a(actionparams) {
    trigger = function_d41104ab(actionparams.interact);
    self bottapbutton(3);
    waitframe(1);
    if (isdefined(self) && isdefined(trigger)) {
        self bottapbutton(3);
        trigger useby(self);
    }
    waitframe(1);
    self bot::clear_interact();
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x3be96fa, Offset: 0x1bd8
// Size: 0x2aa
function zombie_scan_for_threats(actionparams) {
    targetvisible = self bot_action::is_target_visible(actionparams);
    actionparams.targetvisible = targetvisible;
    while (!self bot_action::function_cf788c22() && self bot_action::is_target_enemy(actionparams) && actionparams.targetvisible == targetvisible) {
        trigger = function_d41104ab(bot::get_interact());
        if (isdefined(trigger) && self bot::function_914feddd() && function_f59547eb(trigger)) {
            break;
        }
        if (targetvisible && self bot_action::function_ee402bf6(actionparams)) {
            self bot_action::function_8a2b82ad(actionparams);
            self bot_action::function_e69a1e2e(actionparams);
        } else if (targetvisible) {
            self bot_action::function_8a2b82ad(actionparams);
            self bot_action::aim_at_target(actionparams);
        } else if (!targetvisible && self bot_action::function_ee402bf6(actionparams) && self seerecently(actionparams.target, 4000)) {
            self bot_action::function_8a2b82ad(actionparams);
            self bot_action::function_e69a1e2e(actionparams);
        } else if (self bot_action::function_4fbd6cf1()) {
            self bot_action::function_3b98ad10();
        } else if (self haspath()) {
            self bot_action::look_along_path();
        } else {
            self bot_action::function_c17972fc();
        }
        self waittill(#"hash_347a612b61067eb3");
        targetvisible = self bot_action::is_target_visible(actionparams);
    }
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xf22812be, Offset: 0x1e90
// Size: 0x206
function zombie_reload_weapon(actionparams) {
    weapon = self getcurrentweapon();
    if (!self isreloading()) {
        self bottapbutton(4);
    }
    self waittill(#"hash_347a612b61067eb3");
    while (self isreloading()) {
        if (self bot_action::is_target_enemy(actionparams) && self bot_action::is_target_visible(actionparams)) {
            self bot_action::function_8a2b82ad(actionparams);
            self bot_action::function_e69a1e2e(actionparams);
        } else if (self bot_action::is_target_enemy(actionparams) && self bot_action::function_3094610b(self.bot.tacbundle.var_82aa37d8)) {
            if (self bot_action::function_ca71ffdb()) {
                self bot_action::function_d273d4e7();
            } else {
                self bot_action::function_c17972fc();
            }
        } else if (self bot_action::function_4fbd6cf1()) {
            self bot_action::function_3b98ad10();
        } else {
            if (self haspath()) {
                self bot_action::look_along_path();
                return;
            }
            self bot_action::function_c17972fc();
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace zm_bot_action/zm_bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x3f6e1ad4, Offset: 0x20a0
// Size: 0x722
function function_296516b4(actionparams) {
    if (self getcurrentweapon().isgadget) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self ai::get_behavior_attribute("revive")) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    revivetarget = self bot::get_revive_target();
    if (!isdefined(revivetarget)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    actionparams.revivetarget = revivetarget;
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + revivetarget.name;
    #/
    if (!isdefined(revivetarget.revivetrigger)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (!self istouching(revivetarget.revivetrigger)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    if (isdefined(revivetarget.revivetrigger.beingrevived) && revivetarget.revivetrigger.beingrevived) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return;
    }
    pathenemyfightdist = self.bot.tacbundle.pathenemyfightdist;
    if (!self ai::get_behavior_attribute("ignorepathenemyfightdist") && isdefined(self.enemy) && isdefined(pathenemyfightdist) && pathenemyfightdist > 0 && distance2dsquared(self.origin, self.enemy.origin) < pathenemyfightdist * pathenemyfightdist) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    nearbyenemies = self getenemiesinradius(revivetarget.revivetrigger.origin, 256);
    if (nearbyenemies.size > 0) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

