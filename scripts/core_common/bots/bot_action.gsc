// Atian COD Tools GSC decompiler test
#include scripts/killstreaks/killstreaks_util.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/bots/bot_position.gsc;
#include scripts/core_common/bots/bot_stance.gsc;
#include scripts/core_common/bots/bot.gsc;
#include scripts/core_common/ai_shared.gsc;

#namespace bot_action;

// Namespace bot_action/bot_action
// Params 0, eflags: 0x2
// Checksum 0xa153ae7d, Offset: 0x4b8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"bot_action", &__init__, undefined, undefined);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x11dbccb, Offset: 0x500
// Size: 0x1e
function __init__() {
    level.botactions = [];
    level.botweapons = [];
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x79a8e4cc, Offset: 0x528
// Size: 0x5f4
function register_actions() {
    register_action(#"revive_player", &rank_priority, &revive_player_weight, &revive_player);
    register_action(#"use_gameobject", &rank_priority, &function_3cb4c00e, &use_gameobject);
    register_action(#"switch_to_weapon", &best_stowed_primary_weapon_rank, &switch_to_weapon_weight, &switch_to_weapon);
    register_action(#"hash_78881ac649c38041", &rank_priority, &function_5647e838, &function_40aa6f87);
    register_action(#"melee_glass", &current_melee_weapon_rank, &function_abf40e98, &melee_glass);
    register_action(#"melee_enemy", &current_melee_weapon_rank, &melee_enemy_weight, &melee_enemy);
    register_action(#"reload_weapon", &current_weapon_rank, &reload_weapon_weight, &reload_weapon);
    register_action(#"look_for_enemy", &current_weapon_rank, &look_for_enemy_weight, &look_for_enemy);
    register_action(#"hash_55fc6b6e868ae6c3", &current_weapon_rank, &function_1176a20b, &function_e0dcb8c1);
    register_action(#"hash_2bbb309be663cb4c", &function_728212e8, &scan_for_threats_weight, &function_9e1d8dfe);
    register_action(#"scan_for_threats", &function_728212e8, &scan_for_threats_weight, &scan_for_threats);
    register_action(#"bleed_out", &rank_priority, &bleed_out_weight, &bleed_out);
    register_action(#"hash_7aaeac32a4e1bf84", &weapon_rank, &function_36505c2d, &function_a314673);
    register_action(#"hash_434716893aa869f3", &weapon_rank, &function_294f4909, &function_e73c8946);
    register_action(#"hash_4c707ba80bf09cec", &weapon_rank, &function_294f4909, &function_22e2ba8c);
    register_action(#"hash_3d7dd2878425bcce", &weapon_rank, &function_2bc7472b, &function_36ca6d92);
    register_action(#"fire_grenade", &weapon_rank, &registersndrampend_death, &fire_grenade);
    register_action(#"fire_rocketlauncher", &weapon_rank, &function_a365f27e, &fire_rocketlauncher);
    register_action(#"fire_locked_rocketlauncher", &weapon_rank, &function_4de5fcc3, &fire_locked_rocketlauncher);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x6c2b1998, Offset: 0xb28
// Size: 0x3c4
function register_weapons() {
    register_weapon(#"none", &function_d9c35bee);
    register_bulletweapon(#"ar_accurate_t8");
    register_bulletweapon(#"ar_damage_t8");
    register_bulletweapon(#"ar_fastfire_t8");
    register_bulletweapon(#"ar_modular_t8");
    register_bulletweapon(#"ar_stealth_t8");
    register_bulletweapon(#"lmg_double_t8");
    register_bulletweapon(#"lmg_heavy_t8");
    register_bulletweapon(#"lmg_spray_t8");
    register_bulletweapon(#"lmg_standard_t8");
    register_bulletweapon(#"pistol_burst_t8");
    register_bulletweapon(#"pistol_standard_t8");
    register_bulletweapon(#"pistol_revolver_t8");
    register_bulletweapon(#"shotgun_pump_t8");
    register_bulletweapon(#"shotgun_semiauto_t8");
    register_bulletweapon(#"smg_accurate_t8");
    register_bulletweapon(#"smg_capacity_t8");
    register_bulletweapon(#"smg_fastfire_t8");
    register_bulletweapon(#"smg_handling_t8");
    register_bulletweapon(#"smg_standard_t8");
    register_sniperweapon(#"sniper_fastrechamber_t8");
    register_sniperweapon(#"sniper_powerbolt_t8");
    register_sniperweapon(#"sniper_powersemi_t8");
    register_sniperweapon(#"sniper_quickscope_t8");
    register_bulletweapon(#"tr_leveraction_t8");
    register_bulletweapon(#"tr_longburst_t8");
    register_bulletweapon(#"tr_midburst_t8");
    register_bulletweapon(#"tr_powersemi_t8");
    register_weapon(#"launcher_standard_t8", &function_317d4797);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x1fb0a170, Offset: 0xef8
// Size: 0x54
function function_25f1e3c1() {
    function_a2c83569(#"launcher_standard_t8", "fire_rocketlauncher");
    function_a2c83569(#"launcher_standard_t8", "fire_locked_rocketlauncher");
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x12d1969, Offset: 0xf58
// Size: 0x1c
function start() {
    self function_42907fd4();
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xc7bab538, Offset: 0xf80
// Size: 0x5a
function function_42907fd4() {
    self.bot.var_469cfe53 = {#isfavoriteenemy:0, #istarget:0, #distsq:1000000, #maxhealth:100};
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xfb4ae047, Offset: 0xfe8
// Size: 0x16
function stop() {
    self notify(#"hash_5b4f399c08222e2");
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x41e5015b, Offset: 0x1008
// Size: 0x22
function reset() {
    if (isdefined(self.bot)) {
        self.bot.var_bdbba2cd = 0;
    }
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x6e2756ab, Offset: 0x1038
// Size: 0x104
function update() {
    if (isdefined(self.bot.action)) {
        self notify(#"hash_347a612b61067eb3");
        /#
            forcedstr = isdefined(self.bot.actionparams.forced) && self.bot.actionparams.forced ? "chopper" : "<unknown string>";
            record3dtext("<unknown string>" + function_9e72a96(self.bot.action.name) + forcedstr, self.origin, (1, 0, 1), "<unknown string>", self, 0.5);
        #/
        return;
    }
    self thread execution_loop();
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x0
// Checksum 0xa2b48867, Offset: 0x1148
// Size: 0x70
function force(actionname, weapon, target) {
    action = get_action(actionname);
    if (!isdefined(action)) {
        return 0;
    }
    self function_fced7d8a(action, weapon, target);
    return 1;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x86b89c44, Offset: 0x11c0
// Size: 0x19c
function function_ee2eaccc(slot) {
    gadgetweapon = undefined;
    weapons = self getweaponslist();
    foreach (weapon in weapons) {
        if (self gadgetgetslot(weapon) == slot) {
            gadgetweapon = weapon;
            break;
        }
    }
    if (!isdefined(gadgetweapon)) {
        return;
    }
    var_13e42e18 = gadgetweapon.rootweapon.var_791bc2f7;
    if (!isdefined(var_13e42e18) || var_13e42e18.size <= 0) {
        /#
            self botprinterror("<unknown string>" + function_9e72a96(weapon.name));
        #/
        return;
    }
    self gadgetpowerset(slot, 100);
    self gadgetcharging(slot, 0);
    self function_fced7d8a(var_13e42e18[0], gadgetweapon, self.enemy);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xcd6dab1a, Offset: 0x1368
// Size: 0x12c
function function_4a53ae1f() {
    scorestreakweapon = undefined;
    weapons = self getweaponslist();
    for (i = 5; i < weapons.size; i++) {
        if (killstreaks::is_killstreak_weapon(weapons[i])) {
            scorestreakweapon = weapons[i];
            break;
        }
    }
    if (!isdefined(scorestreakweapon)) {
        return;
    }
    var_13e42e18 = scorestreakweapon.rootweapon.var_791bc2f7;
    if (!isdefined(var_13e42e18) || var_13e42e18.size <= 0) {
        /#
            self botprinterror("<unknown string>" + function_9e72a96(weapons[i].name));
        #/
        return;
    }
    self function_fced7d8a(var_13e42e18[0], scorestreakweapon, self.enemy);
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x5 linked
// Checksum 0x30b838df, Offset: 0x14a0
// Size: 0x84
function private function_fced7d8a(action, weapon, target) {
    self.bot.var_e6a1f475 = {#forced:1, #target:target, #weapon:weapon, #action:action};
    self reset();
}

// Namespace bot_action/bot_action
// Params 4, eflags: 0x1 linked
// Checksum 0x1cdc59e4, Offset: 0x1530
// Size: 0x7e
function register_action(name, rankfunc, weightfunc, executefunc) {
    level.botactions[name] = {#executefunc:executefunc, #weightfunc:weightfunc, #rankfunc:rankfunc, #name:name};
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xc60ff221, Offset: 0x15b8
// Size: 0x82
function register_weapon(weaponname, rankfunc) {
    weapon = getweapon(weaponname);
    if (weapon.name == #"none") {
        return;
    }
    level.botweapons[weaponname] = weapon;
    weapon.var_ede647ad = rankfunc;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x0
// Checksum 0x102103e5, Offset: 0x1648
// Size: 0x5c
function function_36052a7f(weaponname) {
    /#
        if (!isdefined(level.botweapons[weaponname])) {
            /#
                assertmsg("<unknown string>" + function_9e72a96(weaponname) + "<unknown string>");
            #/
        }
    #/
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa99c6c5a, Offset: 0x16b0
// Size: 0x6c
function register_bulletweapon(weaponname) {
    register_weapon(weaponname, &function_22991a48);
    function_a2c83569(weaponname, #"hash_7aaeac32a4e1bf84");
    function_a2c83569(weaponname, #"hash_434716893aa869f3");
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd80aaf55, Offset: 0x1728
// Size: 0x4c
function register_sniperweapon(weaponname) {
    register_weapon(weaponname, &function_22991a48);
    function_a2c83569(weaponname, #"hash_4c707ba80bf09cec");
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x1 linked
// Checksum 0x3dfb1b9b, Offset: 0x1780
// Size: 0x6a
function function_f4302f2a(weaponname, rankfunc, activatefunc) {
    register_weapon(weaponname, rankfunc);
    weapon = level.botweapons[weaponname];
    if (!isdefined(weapon)) {
        return;
    }
    weapon.var_c7e8f553 = activatefunc;
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x1 linked
// Checksum 0x79e91c7, Offset: 0x17f8
// Size: 0x6a
function function_c67ea19e(weaponname, rankfunc, activatefunc) {
    register_weapon(weaponname, rankfunc);
    weapon = level.botweapons[weaponname];
    if (!isdefined(weapon)) {
        return;
    }
    weapon.var_c75f000 = activatefunc;
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x118e0ab, Offset: 0x1870
// Size: 0x9e
function function_a2c83569(weaponname, actionname) {
    weapon = level.botweapons[weaponname];
    if (!isdefined(weapon)) {
        return;
    }
    action = get_action(actionname);
    if (!isdefined(action)) {
        return;
    }
    if (!isdefined(weapon.var_e2f5d985)) {
        weapon.var_e2f5d985 = [];
    }
    weapon.var_e2f5d985[weapon.var_e2f5d985.size] = action;
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x1117ba3b, Offset: 0x1918
// Size: 0x9e
function function_7e847a84(weaponname, actionname) {
    weapon = level.botweapons[weaponname];
    if (!isdefined(weapon)) {
        return;
    }
    action = get_action(actionname);
    if (!isdefined(action)) {
        return;
    }
    if (!isdefined(weapon.var_791bc2f7)) {
        weapon.var_791bc2f7 = [];
    }
    weapon.var_791bc2f7[weapon.var_791bc2f7.size] = action;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x6ca057e1, Offset: 0x19c0
// Size: 0x1c
function get_action(name) {
    return level.botactions[name];
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xcd88e315, Offset: 0x19e8
// Size: 0xf0
function function_10723c01(weapon, var_3f4e87bd) {
    if (!isdefined(var_3f4e87bd)) {
        return;
    }
    paramslist = self.bot.paramslist;
    foreach (action in var_3f4e87bd) {
        actionparams = {#weapon:weapon, #action:action};
        /#
            actionparams.debug = [];
        #/
        paramslist[paramslist.size] = actionparams;
    }
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x2a48440, Offset: 0x1ae0
// Size: 0x28a
function function_fd9117cc() {
    currentweapon = self getcurrentweapon();
    var_c300ee65 = self.bot.var_469cfe53;
    if (self function_3094610b(self.bot.tacbundle.var_82aa37d8)) {
        var_c300ee65 = spawnstruct();
        var_c300ee65.maxhealth = self.enemy get_max_health();
        var_c300ee65.distsq = distancesquared(self.origin, self.enemy.origin);
        var_c300ee65.istarget = target_istarget(self.enemy);
        var_c300ee65.isfavoriteenemy = isdefined(self.favoriteenemy) && self.favoriteenemy == self.enemy;
    }
    if (isdefined(self.revivetrigger)) {
        self rank_weapon(currentweapon, var_c300ee65);
        self function_10723c01(currentweapon, currentweapon.rootweapon.var_e2f5d985);
        return;
    }
    weapons = self getweaponslist();
    foreach (weapon in weapons) {
        self rank_weapon(weapon, var_c300ee65);
        if (weapon == currentweapon) {
            self function_10723c01(weapon, weapon.rootweapon.var_e2f5d985);
        } else {
            self function_10723c01(weapon, weapon.rootweapon.var_791bc2f7);
        }
    }
    self.bot.var_469cfe53 = var_c300ee65;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xf8b369a0, Offset: 0x1d78
// Size: 0x146
function function_9480d296() {
    actionlist = self.bot.tacbundle.actionlist;
    if (!isdefined(actionlist)) {
        return;
    }
    paramslist = self.bot.paramslist;
    for (i = 0; i < actionlist.size; i++) {
        if (!isdefined(actionlist[i])) {
            continue;
        }
        actionname = actionlist[i].name;
        if (!isdefined(actionname)) {
            continue;
        }
        action = get_action(actionname);
        if (!isdefined(action)) {
            /#
                self botprinterror("<unknown string>" + function_9e72a96(actionname));
            #/
        } else {
            actionparams = {#action:action};
            /#
                actionparams.debug = [];
            #/
            paramslist[paramslist.size] = actionparams;
        }
    }
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x5 linked
// Checksum 0x65fdce51, Offset: 0x1ec8
// Size: 0x138
function private execution_loop() {
    self endon(#"hash_5b4f399c08222e2", #"death", #"entering_last_stand", #"enter_vehicle", #"animscripted_start");
    level endon(#"game_ended");
    while (self bot::initialized()) {
        actionparams = self function_9e181b0f();
        if (isdefined(self.bot.var_211ab18e) && !self.bot.var_211ab18e) {
            self bot_position::start();
        }
        if (!isdefined(actionparams)) {
            /#
                self botprintwarning("<unknown string>");
            #/
            return;
        }
        self function_e7b123e8(actionparams);
        self bot::function_ffbfd83b();
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x5 linked
// Checksum 0x5d2e3c7c, Offset: 0x2008
// Size: 0x1f2
function private function_e7b123e8(actionparams) {
    self endoncallback(&function_7a456ee0, #"hash_5b4f399c08222e2", #"death", #"entering_last_stand", #"enter_vehicle", #"animscripted_start");
    level endon(#"game_ended");
    action = actionparams.action;
    self.bot.action = action;
    self.bot.actionparams = actionparams;
    self thread action_timeout(action.name);
    executetime = gettime();
    self function_fef5423c(self.bot.tacbundle.var_5eaa9e02, self.bot.tacbundle.var_bc0b2a06);
    self [[ action.executefunc ]](actionparams);
    self notify(#"hash_1728f8b5de3bde13");
    finishtime = gettime();
    if (executetime == finishtime) {
        /#
            self botprinterror("<unknown string>" + function_9e72a96(action.name) + "<unknown string>");
        #/
        self waittill(#"hash_347a612b61067eb3");
    }
    self.bot.action = undefined;
    self.bot.actionparams = undefined;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x5 linked
// Checksum 0x39ca3bb9, Offset: 0x2208
// Size: 0x46
function private function_7a456ee0(notifyhash) {
    if (!self bot::initialized()) {
        return;
    }
    self.bot.action = undefined;
    self.bot.actionparams = undefined;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x5 linked
// Checksum 0x589c25f1, Offset: 0x2258
// Size: 0xfe
function private action_timeout(actionname) {
    self endon(#"hash_5b4f399c08222e2", #"death", #"entering_last_stand", #"enter_vehicle", #"animscripted_start", #"hash_1728f8b5de3bde13");
    level endon(#"game_ended");
    wait(10);
    if (!isbot(self)) {
        return;
    }
    /#
        self botprintwarning("<unknown string>" + function_9e72a96(actionname) + "<unknown string>" + 10 + "<unknown string>");
    #/
    self notify(#"hash_5b4f399c08222e2");
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xc3ca3442, Offset: 0x2360
// Size: 0x3a
function function_fef5423c(smin, smax) {
    self.bot.var_bdbba2cd = bot::function_7aeb27f1(smin, smax);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x82ae1e70, Offset: 0x23a8
// Size: 0x18
function function_cf788c22() {
    return gettime() > self.bot.var_bdbba2cd;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xb69b34a5, Offset: 0x23c8
// Size: 0x600
function function_9e181b0f() {
    self.bot.weaponranks = [];
    self.bot.paramslist = [];
    /#
        self.bot.var_c4fbaffc = [];
    #/
    var_e6a1f475 = function_54449420();
    if (isdefined(var_e6a1f475)) {
        /#
            if (self bot::should_record("<unknown string>")) {
                record3dtext("<unknown string>" + function_9e72a96(var_e6a1f475.action.name), self.origin, (1, 0, 1), "<unknown string>", self, 0.5);
            }
        #/
        return var_e6a1f475;
    }
    /#
        if (self bot::should_record("<unknown string>")) {
            record3dtext("<unknown string>", self.origin, (1, 0, 1), "<unknown string>", self, 0.5);
        }
    #/
    self function_bf21ead1();
    self function_fd9117cc();
    self function_9480d296();
    pixbeginevent(#"bot_pick_action");
    aiprofile_beginentry("bot_pick_action");
    self rank_actions();
    var_3a4035f3 = self weight_actions();
    pixendevent();
    aiprofile_endentry();
    /#
        if (self bot::should_record("<unknown string>")) {
            pixbeginevent(#"bot_record_action_eval");
            aiprofile_beginentry("<unknown string>");
            foreach (actionparams in self.bot.paramslist) {
                color = vectorscale((1, 1, 1), 0.75);
                headerstr = "<unknown string>";
                recordrank = "<unknown string>";
                recordweight = "<unknown string>";
                if (isdefined(actionparams.rank)) {
                    recordrank = actionparams.rank;
                    if (isdefined(actionparams.weight)) {
                        color = (1, 1, 1);
                        headerstr = "<unknown string>";
                        recordweight = actionparams.weight;
                        if (isdefined(var_3a4035f3)) {
                            if (actionparams.rank >= var_3a4035f3.rank) {
                                color = utility_color(actionparams.weight, 100);
                                headerstr = actionparams == var_3a4035f3 ? "<unknown string>" : "<unknown string>";
                            }
                        }
                    }
                }
                record3dtext(headerstr + function_9e72a96(actionparams.action.name) + "<unknown string>" + recordrank + "<unknown string>" + recordweight, self.origin, color, "<unknown string>", self, 0.5);
                if (isdefined(actionparams.weapon) && isdefined(self.bot.var_c4fbaffc[actionparams.weapon])) {
                    foreach (str in self.bot.var_c4fbaffc[actionparams.weapon]) {
                        record3dtext("<unknown string>" + str, self.origin, color, "<unknown string>", self, 0.5);
                    }
                }
                foreach (entry in actionparams.debug) {
                    record3dtext("<unknown string>" + entry, self.origin, color, "<unknown string>", self, 0.5);
                }
            }
            pixendevent();
            aiprofile_endentry();
        }
    #/
    return var_3a4035f3;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xec3b9bcd, Offset: 0x29d0
// Size: 0x56
function function_54449420() {
    if (!isdefined(self.bot.var_e6a1f475)) {
        return undefined;
    }
    actionparams = self.bot.var_e6a1f475;
    self.bot.var_e6a1f475 = undefined;
    if (!isdefined(actionparams)) {
        return undefined;
    }
    return actionparams;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x7277527d, Offset: 0x2a30
// Size: 0x260
function weight_actions() {
    pixbeginevent(#"bot_weight_actions");
    aiprofile_beginentry("bot_weight_actions");
    var_3a4035f3 = undefined;
    bestrank = undefined;
    bestweight = undefined;
    paramslist = self.bot.paramslist;
    foreach (actionparams in paramslist) {
        if (!isdefined(actionparams.rank)) {
            continue;
        }
        action = actionparams.action;
        pixbeginevent("bot_weight_" + action.name);
        aiprofile_beginentry("bot_weight_" + action.name);
        actionparams.weight = self [[ action.weightfunc ]](actionparams);
        pixendevent();
        aiprofile_endentry();
        if (!isdefined(actionparams.weight)) {
            continue;
        }
        if (isdefined(var_3a4035f3) && actionparams.rank < bestrank) {
            continue;
        }
        if (!isdefined(var_3a4035f3) || actionparams.rank > bestrank || actionparams.weight > bestweight) {
            var_3a4035f3 = actionparams;
            bestrank = actionparams.rank;
            bestweight = actionparams.weight;
        }
    }
    pixendevent();
    aiprofile_endentry();
    return var_3a4035f3;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x98dcd003, Offset: 0x2c98
// Size: 0x184
function rank_actions() {
    pixbeginevent(#"bot_rank_actions");
    aiprofile_beginentry("bot_rank_actions");
    paramslist = self.bot.paramslist;
    foreach (actionparams in paramslist) {
        action = actionparams.action;
        pixbeginevent("bot_rank_" + action.name);
        aiprofile_beginentry("bot_rank_" + action.name);
        actionparams.rank = self [[ action.rankfunc ]](actionparams);
        pixendevent();
        aiprofile_endentry();
    }
    pixendevent();
    aiprofile_endentry();
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xaa1b24f7, Offset: 0x2e28
// Size: 0x10
function rank_priority(actionparams) {
    return 1000;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x0
// Checksum 0xca8edd5c, Offset: 0x2e40
// Size: 0x10
function function_b85d4a92(actionparams) {
    return -1000;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x9df636b7, Offset: 0x2e58
// Size: 0x1a6
function current_melee_weapon_rank(actionparams) {
    weapon = self getcurrentweapon();
    actionparams.weapon = weapon;
    if (sessionmodeiszombiesgame()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return 1000;
    }
    if (!weapon.ismeleeweapon) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = weapon.name + "<unknown string>";
        #/
        return undefined;
    }
    return 1000;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x186ff341, Offset: 0x3008
// Size: 0x6a
function current_weapon_rank(actionparams) {
    weapon = self getcurrentweapon();
    actionparams.weapon = weapon;
    if (weapon == level.weaponnone) {
        return -1000;
    }
    return weapon_rank(actionparams);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x212b8f03, Offset: 0x3080
// Size: 0x1f2
function best_stowed_primary_weapon_rank(actionparams) {
    currentweapon = self getcurrentweapon();
    weapons = self getweaponslistprimaries();
    bestweapon = undefined;
    bestweaponrank = undefined;
    foreach (weapon in weapons) {
        if (weapon == currentweapon) {
            continue;
        }
        weaponrank = self function_30e579d5(weapon);
        if (!isdefined(weaponrank)) {
            continue;
        }
        if (!isdefined(bestweapon) || bestweaponrank < weaponrank) {
            bestweapon = weapon;
            bestweaponrank = weaponrank;
        }
    }
    if (!isdefined(bestweapon)) {
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
    actionparams.weapon = bestweapon;
    return weapon_rank(actionparams);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x314996dd, Offset: 0x3280
// Size: 0x3a
function weapon_rank(actionparams) {
    weapon = actionparams.weapon;
    return self function_30e579d5(weapon);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa827cfd3, Offset: 0x32c8
// Size: 0x54
function function_30e579d5(weapon) {
    ammo = self getammocount(weapon);
    if (ammo <= 0) {
        return -1000;
    }
    return self.bot.weaponranks[weapon];
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xf281550a, Offset: 0x3328
// Size: 0x38
function function_3df363bf(actionparams) {
    weapon = actionparams.weapon;
    return self.bot.weaponranks[weapon];
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x7cd170c3, Offset: 0x3368
// Size: 0x50
function rank_weapon(weapon, var_c300ee65) {
    rankfunc = weapon.rootweapon.var_ede647ad;
    if (!isdefined(rankfunc)) {
        return;
    }
    self [[ rankfunc ]](weapon, var_c300ee65);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xe8f4d039, Offset: 0x33c0
// Size: 0x2c
function function_d31777fa(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, 0);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xcb40d7e5, Offset: 0x33f8
// Size: 0xbc
function function_22991a48(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, 1);
    self factor_damage_range(weapon, var_c300ee65);
    if (weapon.weapclass == "pistol" || weapon.weapclass == "pistol spread") {
        self set_weapon_rank(weapon, 0.8, "Pistol");
    }
    self factor_ammo(weapon);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xe61c4a07, Offset: 0x34c0
// Size: 0x8c
function function_317d4797(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, 0);
    self factor_lockon(weapon, var_c300ee65);
    self factor_dumbfire_range(weapon, var_c300ee65);
    self factor_rocketlauncher_overkill(weapon, var_c300ee65);
    self factor_ammo(weapon);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xb843615c, Offset: 0x3558
// Size: 0x54
function function_6d366261(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, 998, "Secondary offhand weapon");
    self factor_ammo(weapon, var_c300ee65);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x6ebe15b5, Offset: 0x35b8
// Size: 0x54
function function_1879a202(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, 999, "Special offhand weapon");
    self factor_ammo(weapon, var_c300ee65);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x1220968e, Offset: 0x3618
// Size: 0x84
function function_791f5097(weapon, var_c300ee65) {
    if (self getcurrentweapon() != weapon) {
        self set_weapon_rank(weapon, 999, "Scorestreak weapon");
    } else {
        self set_weapon_rank(weapon, -1000, "Don't use scorestreak weapon that is already equipped");
    }
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x47ec950c, Offset: 0x36a8
// Size: 0x54
function function_2c39b990(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, 1000, "This weapon is a priority");
    self factor_ammo(weapon, var_c300ee65);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x17ee35e8, Offset: 0x3708
// Size: 0x3c
function function_d9c35bee(weapon, var_c300ee65) {
    self set_weapon_rank(weapon, -1000, "This weapon is unusable");
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x1 linked
// Checksum 0xcd225f96, Offset: 0x3750
// Size: 0xe8
function set_weapon_rank(weapon, rank, reason) {
    self.bot.weaponranks[weapon] = rank;
    /#
        rankstr = isdefined(rank) ? rank : "<unknown string>";
        self.bot.var_c4fbaffc[weapon] = array(weapon.name + "<unknown string>" + rankstr);
        if (isdefined(reason)) {
            self.bot.var_c4fbaffc[weapon][self.bot.var_c4fbaffc[weapon].size] = "<unknown string>" + reason;
        }
    #/
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x1 linked
// Checksum 0xd9ba1d71, Offset: 0x3840
// Size: 0xec
function modify_weapon_rank(weapon, amount, reason) {
    if (!isdefined(self.bot.weaponranks[weapon])) {
        return;
    }
    self.bot.weaponranks[weapon] = self.bot.weaponranks[weapon] + amount;
    /#
        sign = amount < 0 ? "<unknown string>" : "<unknown string>";
        self.bot.var_c4fbaffc[weapon][self.bot.var_c4fbaffc[weapon].size] = "<unknown string>" + sign + amount + "<unknown string>" + reason;
    #/
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x652eb45, Offset: 0x3938
// Size: 0xf4
function factor_ammo(weapon, var_c300ee65) {
    clipammo = self clip_ammo(weapon);
    stockammo = self getweaponammostock(weapon);
    if (clipammo + stockammo <= 0) {
        if (weapon.isgadget) {
            slot = self gadgetgetslot(weapon);
            if (!self gadgetisready(slot)) {
                self set_weapon_rank(weapon, undefined, "Gadget not ready");
            }
        } else {
            self set_weapon_rank(weapon, -1000, "No ammo");
        }
    }
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xe2fb61a8, Offset: 0x3a38
// Size: 0x104
function factor_damage_range(weapon, var_c300ee65) {
    if (!isdefined(self.enemy)) {
        return;
    } else if (var_c300ee65.distsq < weapon.maxdamagerange * weapon.maxdamagerange) {
        self modify_weapon_rank(weapon, 1, "In max damage range");
    } else if (var_c300ee65.distsq >= weapon.mindamagerange * weapon.mindamagerange) {
        if (weapon.weapclass == "spread") {
            self set_weapon_rank(weapon, undefined, "Outside of spread min damage range");
            return;
        }
        self modify_weapon_rank(weapon, -1, "In min damage range");
    }
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x41ca6249, Offset: 0x3b48
// Size: 0x94
function factor_lockon(weapon, var_c300ee65) {
    if (var_c300ee65.istarget) {
        if (weapon.lockontype != "None") {
            self modify_weapon_rank(weapon, 3, "Lockon Target");
        }
    } else if (weapon.requirelockontofire) {
        self set_weapon_rank(weapon, undefined, "Requires Lockon");
    }
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x1c3c5891, Offset: 0x3be8
// Size: 0xa4
function factor_dumbfire_range(weapon, var_c300ee65) {
    if (var_c300ee65.istarget && weapon.lockontype != "None") {
        return;
    }
    if (var_c300ee65.distsq < 2250000) {
        self modify_weapon_rank(weapon, 1, "In Dumbfire Range");
    } else {
        self modify_weapon_rank(weapon, -1, "Outside Dumbfire Range");
    }
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x15e3b295, Offset: 0x3c98
// Size: 0x114
function factor_rocketlauncher_overkill(weapon, var_c300ee65) {
    if (var_c300ee65.istarget && weapon.lockontype != "None") {
        return;
    }
    if (!isdefined(var_c300ee65.maxhealth)) {
        self set_weapon_rank(weapon, undefined, "Max Health is undefined");
    } else if (var_c300ee65.maxhealth >= 400) {
        self modify_weapon_rank(weapon, 2, "Enemy Max Health " + var_c300ee65.maxhealth + " >= " + 400);
    } else {
        self modify_weapon_rank(weapon, -1, "Enemy Max Health " + var_c300ee65.maxhealth + " < " + 400);
    }
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x0
// Checksum 0xb866686c, Offset: 0x3db8
// Size: 0x12c
function utility_color(utility, targetutility) {
    /#
        colorscale = array((1, 0, 0), (1, 0.5, 0), (1, 1, 0), (0, 1, 0));
        if (utility >= targetutility) {
            return colorscale[colorscale.size - 1];
        } else if (utility <= 0) {
            return colorscale[0];
        }
        utilityindex = utility * colorscale.size / targetutility;
        utilityindex = utilityindex - 1;
        colorindex = int(utilityindex);
        colorfrac = utilityindex - colorindex;
        utilitycolor = vectorlerp(colorscale[colorindex], colorscale[colorindex + 1], colorfrac);
        return utilitycolor;
    #/
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x8a8095bb, Offset: 0x3ef0
// Size: 0x260
function look_for_enemy_weight(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
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
    if (self is_target_visible(actionparams)) {
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
    if (!self function_3094610b(self.bot.tacbundle.var_82aa37d8)) {
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
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x593a9bcc, Offset: 0x4158
// Size: 0xe6
function look_for_enemy(actionparams) {
    var_47851891 = self.enemy;
    weapon = self getcurrentweapon();
    while (!self function_cf788c22() && self function_ab4c3550() && self bot::in_combat() && self is_target_enemy(actionparams) && !self is_target_visible(actionparams)) {
        self function_d273d4e7();
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xea422b05, Offset: 0x4248
// Size: 0x246
function function_1176a20b(actionparams) {
    if (self.ignoreall) {
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
    if (self bot::has_visible_enemy()) {
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
    target = self ai::function_31a31a25(0);
    if (!isdefined(target)) {
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
    actionparams.target = target;
    self set_target_aim(actionparams);
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xbaa22ec, Offset: 0x4498
// Size: 0x116
function function_e0dcb8c1(actionparams) {
    target = actionparams.target;
    self setentitytarget(target);
    self.bot.var_2a98e9ea = 1;
    while (!self function_cf788c22() && !self.ignoreall && isdefined(target) && self is_target_enemy(actionparams) && isalive(target) && !self is_target_visible(actionparams)) {
        self function_8a2b82ad(actionparams);
        self aim_at_target(actionparams);
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x3907942a, Offset: 0x45b8
// Size: 0x40
function function_728212e8(actionparams) {
    currentweaponrank = self current_weapon_rank(actionparams);
    if (isdefined(currentweaponrank)) {
        return currentweaponrank;
    }
    return -1000;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x9c61b516, Offset: 0x4600
// Size: 0x36
function scan_for_threats_weight(actionparams) {
    actionparams.target = self.enemy;
    self set_target_aim(actionparams);
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x79331b7e, Offset: 0x4640
// Size: 0x1e2
function scan_for_threats(actionparams) {
    targetvisible = self is_target_visible(actionparams);
    actionparams.targetvisible = targetvisible;
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && actionparams.targetvisible == targetvisible) {
        if (targetvisible && self function_ee402bf6(actionparams)) {
            self function_8a2b82ad(actionparams);
            self function_e69a1e2e(actionparams);
        } else if (!targetvisible && self function_ee402bf6(actionparams)) {
            self function_8a2b82ad(actionparams);
            self function_e69a1e2e(actionparams);
        } else if (self function_4fbd6cf1()) {
            self function_3b98ad10();
        } else if (targetvisible) {
            self function_8a2b82ad(actionparams);
            self aim_at_target(actionparams);
        } else {
            self function_2b8f7067();
        }
        self waittill(#"hash_347a612b61067eb3");
        targetvisible = self is_target_visible(actionparams);
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x218cc68b, Offset: 0x4830
// Size: 0x1aa
function function_9e1d8dfe(actionparams) {
    targetvisible = self is_target_visible(actionparams);
    actionparams.targetvisible = targetvisible;
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && actionparams.targetvisible == targetvisible) {
        if (targetvisible && self function_ee402bf6(actionparams)) {
            self function_8a2b82ad(actionparams);
            self function_e69a1e2e(actionparams);
        } else if (!targetvisible && self function_ee402bf6(actionparams)) {
            self function_8a2b82ad(actionparams);
            self function_e69a1e2e(actionparams);
        } else if (self function_4fbd6cf1()) {
            self function_3b98ad10();
        } else {
            self function_2b8f7067();
        }
        self waittill(#"hash_347a612b61067eb3");
        targetvisible = self is_target_visible(actionparams);
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x8afc43e7, Offset: 0x49e8
// Size: 0x592
function revive_player_weight(actionparams) {
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
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x2e8bd41a, Offset: 0x4f88
// Size: 0x27c
function revive_player(actionparams) {
    player = actionparams.revivetarget;
    if (!isdefined(player)) {
        /#
            self botprinterror("<unknown string>" + "<unknown string>");
        #/
        return;
    }
    self.attackeraccuracy = 0.01;
    while (isalive(player) && isdefined(player.revivetrigger) && self istouching(player.revivetrigger)) {
        if (isdefined(player.revivetrigger.beingrevived) && player.revivetrigger.beingrevived) {
            function_e0c89027();
            return;
        }
        self look_at_point(player.revivetrigger.origin, "Revive Trigger", (1, 1, 1));
        if (self botgetlookdot() >= 0) {
            self botsetlookcurrent();
            break;
        }
        self bot_stance::crouch();
        self waittill(#"hash_347a612b61067eb3");
    }
    while (isalive(player) && isdefined(player.revivetrigger) && self istouching(player.revivetrigger)) {
        self look_at_point(player.revivetrigger.origin, "Revive Trigger", (1, 1, 1));
        self bot_stance::crouch();
        self bottapbutton(3);
        self waittill(#"hash_347a612b61067eb3");
    }
    self function_e0c89027();
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x587a48c0, Offset: 0x5210
// Size: 0x2c
function function_e0c89027(notifyhash) {
    self.attackeraccuracy = 1;
    self bot_stance::reset();
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa54e39d8, Offset: 0x5248
// Size: 0x25a
function function_3cb4c00e(actionparams) {
    if (!self bot::function_dd750ead()) {
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
    gameobject = self bot::get_interact();
    actionparams.gameobject = gameobject;
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
    if (!self istouching(gameobject.trigger)) {
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

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xb822e114, Offset: 0x54b0
// Size: 0x212
function use_gameobject(actionparams) {
    gameobject = actionparams.gameobject;
    lookpoint = gameobject.trigger.origin;
    while (isdefined(gameobject) && gameobject === self bot::get_interact() && self istouching(gameobject.trigger)) {
        self look_at_point(lookpoint, "Gameobject Trigger", (1, 1, 1));
        if (self botgetlookdot() >= 0.76) {
            self botsetlookcurrent();
            break;
        }
        waitframe(1);
    }
    while (isdefined(gameobject) && gameobject === self bot::get_interact() && self istouching(gameobject.trigger) && !isdefined(self.claimtrigger)) {
        self bottapbutton(3);
        waitframe(1);
    }
    if (isdefined(gameobject) && gameobject === self bot::get_interact() && isdefined(gameobject.inuse) && gameobject.inuse && isdefined(gameobject.trigger) && self.claimtrigger === gameobject.trigger) {
        self bottapbutton(3);
        waitframe(1);
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x48a3621e, Offset: 0x56d0
// Size: 0x242
function function_5647e838(actionparams) {
    if (!isdefined(self.bot.traversal)) {
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
    if (isdefined(self.bot.traversal.mantlenode)) {
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
    if (self.bot.traversal.targetheight < 40) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>" + self.bot.traversal.targetheight + "<unknown string>";
        #/
        return undefined;
    }
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xbba63f64, Offset: 0x5920
// Size: 0x66
function function_40aa6f87(actionparams) {
    while (isdefined(self.bot.traversal)) {
        self botsetlookpoint(self.bot.traversal.endpos);
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x8e0449db, Offset: 0x5990
// Size: 0x10c
function switch_to_weapon_weight(actionparams) {
    currentweapon = self getcurrentweapon();
    currentweaponrank = self function_30e579d5(currentweapon);
    if (isdefined(currentweaponrank) && actionparams.rank <= currentweaponrank) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>" + currentweaponrank;
        #/
        return undefined;
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xdd84317a, Offset: 0x5aa8
// Size: 0x7e
function switch_to_weapon(actionparams) {
    weapon = actionparams.weapon;
    self botswitchtoweapon(weapon);
    self waittill(#"hash_347a612b61067eb3");
    while (self isswitchingweapons()) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x36e34332, Offset: 0x5b30
// Size: 0x3a0
function reload_weapon_weight(actionparams) {
    weapon = actionparams.weapon;
    actionparams.target = self.enemy;
    self set_target_aim(actionparams);
    stockammo = self getweaponammostock(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + stockammo;
    #/
    if (stockammo <= 0) {
        return undefined;
    }
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo >= weapon.clipsize) {
        return undefined;
    }
    if (self bot::in_combat() && clipammo > weapon.clipsize * 0.2) {
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
    if (self isreloading()) {
        return 100;
    }
    if (!self function_a39f313c()) {
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
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xc1867892, Offset: 0x5ed8
// Size: 0x1d6
function reload_weapon(actionparams) {
    weapon = self getcurrentweapon();
    if (!self isreloading()) {
        self bottapbutton(4);
    }
    self waittill(#"hash_347a612b61067eb3");
    while (self isreloading()) {
        if (self is_target_enemy(actionparams) && self is_target_visible(actionparams)) {
            self function_8a2b82ad(actionparams);
            self function_e69a1e2e(actionparams);
        } else if (self is_target_enemy(actionparams) && self function_3094610b(self.bot.tacbundle.var_82aa37d8)) {
            if (self function_ca71ffdb()) {
                self function_d273d4e7();
            } else {
                self function_c17972fc();
            }
        } else if (self function_4fbd6cf1()) {
            self function_3b98ad10();
        } else {
            self function_2b8f7067();
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x6c5b5d8, Offset: 0x60b8
// Size: 0x40
function function_4d9b6e04() {
    if (level.script == "mp_mountain2") {
        return 1;
    }
    if (level.script == "mp_slums2") {
        return 1;
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x3651ad84, Offset: 0x6100
// Size: 0x392
function function_abf40e98(actionparams) {
    if (!function_4d9b6e04()) {
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
    if (!self haspath()) {
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
    eye = self geteye();
    forwarddir = anglestoforward(self getplayerangles());
    traceend = eye + forwarddir * actionparams.weapon.var_bfbec33f;
    trace = bullettrace(eye, traceend, 0, self);
    if (trace[#"fraction"] >= 1) {
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
    if (!isdefined(trace[#"surfacetype"]) || trace[#"surfacetype"] != "glass") {
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

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa5ebb960, Offset: 0x64a0
// Size: 0xae
function melee_glass(actionparams) {
    self look_along_path();
    self bottapbutton(2);
    self waittill(#"hash_347a612b61067eb3");
    if (self ismeleeing()) {
        self look_along_path();
        while (self ismeleeing()) {
            self waittill(#"hash_347a612b61067eb3");
        }
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xcca62c6f, Offset: 0x6558
// Size: 0x408
function melee_enemy_weight(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    if (distancesquared(self.origin, self.enemy.origin) > meleerange * meleerange) {
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
    if (self bot::fwd_dot(self.enemy.origin) < 0.5) {
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
    if (!isdefined(self.bot.var_d8397b2) || gettime() - self.bot.var_d8397b2 > 1000) {
        self.bot.var_d8397b2 = gettime();
        self.bot.meleeallowed = randomfloat(1) < (isdefined(self.bot.tacbundle.var_ecf6111e) ? self.bot.tacbundle.var_ecf6111e : 0);
    }
    if (!self.bot.meleeallowed) {
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
    self set_target_aim(actionparams);
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x2ade5942, Offset: 0x6968
// Size: 0xce
function melee_enemy(actionparams) {
    self function_8a2b82ad(actionparams);
    self function_e69a1e2e(actionparams);
    self bottapbutton(2);
    if (sessionmodeiszombiesgame()) {
        wait(0.5);
        return;
    }
    self waittill(#"hash_347a612b61067eb3");
    if (self ismeleeing()) {
        while (self ismeleeing()) {
            self waittill(#"hash_347a612b61067eb3");
        }
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd3c86747, Offset: 0x6a40
// Size: 0x290
function function_36505c2d(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo <= 0) {
        return undefined;
    }
    if (!self function_ee402bf6(actionparams)) {
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
    self set_target_aim(actionparams);
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa1f8e0ef, Offset: 0x6cd8
// Size: 0x10e
function function_a314673(actionparams) {
    weapon = actionparams.weapon;
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_8a2b82ad(actionparams);
        self function_e69a1e2e(actionparams);
        if (self function_31a76186(actionparams)) {
            self bot::function_e2c892a5();
            self bot::function_e2c892a5(1);
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x6f5b24ea, Offset: 0x6df0
// Size: 0x420
function function_294f4909(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    if (!weapon.aimdownsight) {
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
    if (self haspath() && !(isdefined(self.bot.tacbundle.var_abf895b5) && self.bot.tacbundle.var_abf895b5)) {
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
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo <= 0) {
        return undefined;
    }
    if (!self function_679b5b7a(actionparams)) {
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
    self set_target_aim(actionparams);
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xe2677703, Offset: 0x7218
// Size: 0x15e
function function_e73c8946(actionparams) {
    weapon = actionparams.weapon;
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_8a2b82ad(actionparams);
        self aim_at_target(actionparams);
        if (self function_55d5a581(actionparams)) {
            self bottapbutton(11);
            if (self function_bacb1c08(actionparams) && self playerads() >= 1) {
                self bot::function_e2c892a5();
                self bot::function_e2c892a5(1);
            }
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x8dfe4ac7, Offset: 0x7380
// Size: 0x33e
function function_22e2ba8c(actionparams) {
    weapon = actionparams.weapon;
    weaponclass = util::getweaponclass(weapon);
    /#
        assert(weaponclass == #"weapon_sniper");
    #/
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_8a2b82ad(actionparams);
        self aim_at_target(actionparams);
        if (self function_55d5a581(actionparams)) {
            self bottapbutton(11);
            if (self function_bacb1c08(actionparams) && self playerads() >= 1) {
                if (!isdefined(self.bot.var_ddc0e12b)) {
                    self.bot.var_ddc0e12b = randomfloat(1) < (isdefined(self.bot.tacbundle.var_6ef48dfa) ? self.bot.tacbundle.var_6ef48dfa : 0);
                }
                if (!isdefined(self.bot.var_f2b47a08)) {
                    if (self.bot.var_ddc0e12b) {
                        self.bot.var_f2b47a08 = gettime();
                    } else {
                        delaytimesec = randomfloatrange(isdefined(self.bot.tacbundle.var_b9f05fc) ? self.bot.tacbundle.var_b9f05fc : 0, isdefined(self.bot.tacbundle.var_c850085f) ? self.bot.tacbundle.var_c850085f : 0);
                        self.bot.var_f2b47a08 = gettime() + int(delaytimesec * 1000);
                    }
                }
                if (gettime() >= self.bot.var_f2b47a08) {
                    self bot::function_e2c892a5();
                    self bot::function_e2c892a5(1);
                }
            }
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa4e06b4, Offset: 0x76c8
// Size: 0x378
function function_2bc7472b(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    if (self haspath() && !(isdefined(self.bot.tacbundle.var_abf895b5) && self.bot.tacbundle.var_abf895b5)) {
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
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo <= 0) {
        return undefined;
    }
    if (!self function_679b5b7a(actionparams)) {
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
    self set_target_aim(actionparams);
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x93231f43, Offset: 0x7a48
// Size: 0x1be
function function_36ca6d92(actionparams) {
    weapon = actionparams.weapon;
    self function_b74c1de4();
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_8a2b82ad(actionparams);
        self aim_at_target(actionparams);
        self bottapbutton(11);
        self bottapbutton(24);
        if (self function_55d5a581(actionparams)) {
            if (self function_bacb1c08(actionparams)) {
                self bot::function_e2c892a5();
                self bot::function_e2c892a5(1);
            }
        }
        self waittill(#"hash_347a612b61067eb3");
    }
    self function_b74c1de4();
    wait(0.1);
    while (self isswitchingweapons()) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xc64aab23, Offset: 0x7c10
// Size: 0x412
function registersndrampend_death(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo <= 0) {
        return undefined;
    }
    self function_8a2b82ad(actionparams);
    self function_a3dfc4aa(actionparams);
    if (!isdefined(actionparams.var_cb785841)) {
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
    self function_9004d3ca(actionparams);
    if (!self function_ade341c(actionparams)) {
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

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x4622bcd3, Offset: 0x8030
// Size: 0x15e
function fire_grenade(actionparams) {
    weapon = actionparams.weapon;
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_8a2b82ad(actionparams);
        self function_a3dfc4aa(actionparams);
        self function_9004d3ca(actionparams);
        self function_3a2f51fd(actionparams);
        if (self function_ade341c(actionparams)) {
            if (self botgetlookdot() >= 1 && self bot::function_a7106162()) {
                self bot::function_b78e1ebf();
            }
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x57f8f691, Offset: 0x8198
// Size: 0x352
function function_4de5fcc3(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    if (!self function_daa4968(actionparams)) {
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
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo <= 0) {
        return undefined;
    }
    distsq = distancesquared(self.origin, self.enemy.origin);
    if (distsq < 2250000) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return 0;
    }
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x75dd54f7, Offset: 0x84f8
// Size: 0x25e
function fire_locked_rocketlauncher(actionparams) {
    target = actionparams.target;
    weapon = actionparams.weapon;
    lockedflag = 1 << self getentitynumber();
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self function_daa4968(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_ab6b1fc9(actionparams);
        self aim_at_target(actionparams);
        if (self function_55d5a581(actionparams)) {
            self bottapbutton(11);
            if (self playerads() >= 1 && isdefined(self.stingertarget) && isdefined(self.stingertarget.locked_on) && self.stingertarget.locked_on & lockedflag) {
                self bottapbutton(0);
            }
        }
        self waittill(#"hash_347a612b61067eb3");
        if (self isfiring()) {
            break;
        }
    }
    while (self isfiring()) {
        if (self is_target_visible(actionparams)) {
            self function_8a2b82ad(actionparams);
            self aim_at_target(actionparams);
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa116727, Offset: 0x8760
// Size: 0x2a2
function function_a365f27e(actionparams) {
    actionparams.target = self.enemy;
    weapon = actionparams.weapon;
    if (!self is_target_visible(actionparams)) {
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
    clipammo = self clip_ammo(weapon);
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + clipammo + "<unknown string>" + weapon.clipsize;
    #/
    if (clipammo <= 0) {
        return undefined;
    }
    distsq = distancesquared(self.origin, self.enemy.origin);
    if (distsq > 2250000) {
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

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xb10a925, Offset: 0x8a10
// Size: 0x23e
function fire_rocketlauncher(actionparams) {
    target = actionparams.target;
    weapon = actionparams.weapon;
    while (!self function_cf788c22() && self is_target_enemy(actionparams) && self is_target_visible(actionparams) && self bot::weapon_loaded(weapon)) {
        self function_8a2b82ad(actionparams);
        self aim_at_target(actionparams);
        if (self function_55d5a581(actionparams)) {
            if (self function_bacb1c08(actionparams)) {
                if (!self haspath()) {
                    self bottapbutton(11);
                    if (self playerads() >= 1) {
                        self bottapbutton(0);
                        self waittill(#"hash_347a612b61067eb3");
                        break;
                    }
                } else {
                    self bottapbutton(0);
                }
            }
        }
        self waittill(#"hash_347a612b61067eb3");
        if (self isfiring()) {
            break;
        }
    }
    while (self isfiring()) {
        if (self is_target_visible(actionparams)) {
            self function_8a2b82ad(actionparams);
            self aim_at_target(actionparams);
        }
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd76c6f85, Offset: 0x8c58
// Size: 0x6e
function function_ccdcc5d9(weapon) {
    activatefunc = weapon.rootweapon.var_c7e8f553;
    if (!isdefined(activatefunc)) {
        /#
            self botprinterror(weapon.name + "<unknown string>");
        #/
        return;
    }
    self [[ activatefunc ]](weapon);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x31e81229, Offset: 0x8cd0
// Size: 0xae
function activate_health_gadget(actionparams) {
    weapon = actionparams.weapon;
    self function_ccdcc5d9(weapon);
    while (self isthrowinggrenade() || !self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xc3ddadfb, Offset: 0x8d88
// Size: 0x12c
function function_5aa9dd1b(actionparams) {
    if (self is_target_enemy(actionparams) && self is_target_visible(actionparams)) {
        var_b4843bc3 = actionparams.aimpoint;
        var_7c23d596 = actionparams.var_97065630;
        var_66c8d0f4 = actionparams.var_cb785841;
        self function_8a2b82ad(actionparams);
        self function_a3dfc4aa(actionparams);
        self function_9004d3ca(actionparams);
        if (!self function_ade341c(actionparams)) {
            actionparams.aimpoint = var_b4843bc3;
            actionparams.var_97065630 = var_7c23d596;
            actionparams.var_cb785841 = var_66c8d0f4;
        }
    }
    self function_3a2f51fd(actionparams);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xf907344, Offset: 0x8ec0
// Size: 0x296
function function_90c011d5(actionparams) {
    weapon = actionparams.weapon;
    self function_ccdcc5d9(weapon);
    slot = self gadgetgetslot(weapon);
    button = self function_c6e02c38(weapon);
    self function_5aa9dd1b(actionparams);
    self waittill(#"hash_347a612b61067eb3");
    while (!self function_d911b948()) {
        self function_5aa9dd1b(actionparams);
        self bottapbutton(button);
        self waittill(#"hash_347a612b61067eb3");
    }
    holding = 1;
    while (!self function_cf788c22() && self isthrowinggrenade()) {
        self function_5aa9dd1b(actionparams);
        if (holding) {
            self bottapbutton(button);
            if (self botgetlookdot() >= 1) {
                holding = 0;
            }
        }
        self waittill(#"hash_347a612b61067eb3");
    }
    if (holding) {
        while (self isthrowinggrenade()) {
            self bottapbutton(71);
            self bottapbutton(49);
            self function_c17972fc();
            self waittill(#"hash_347a612b61067eb3");
        }
    }
    while (!self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x1c36d5f0, Offset: 0x9160
// Size: 0x366
function bleed_out_weight(actionparams) {
    if (!isdefined(self.owner)) {
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
    if (self.owner.sessionstate == "playing") {
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
    if (!isdefined(self.revivetrigger)) {
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
    if (isdefined(self.revivetrigger.beingrevived) && self.revivetrigger.beingrevived) {
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
    /#
        if (!isdefined(actionparams.debug)) {
            actionparams.debug = [];
        } else if (!isarray(actionparams.debug)) {
            actionparams.debug = array(actionparams.debug);
        }
        actionparams.debug[actionparams.debug.size] = "<unknown string>" + self.owner.sessionstate;
    #/
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd824e1c6, Offset: 0x94d0
// Size: 0x7e
function bleed_out(actionparams) {
    while (!isdefined(self.revivetrigger) && !(isdefined(self.revivetrigger.beingrevived) && self.revivetrigger.beingrevived)) {
        self bottapbutton(3);
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xdf4d3b8b, Offset: 0x9558
// Size: 0xcc
function set_target_aim(actionparams) {
    if (!isdefined(self.bot.var_67b4ea54)) {
        self.bot.var_67b4ea54 = randomfloat(1) < (isdefined(self.bot.tacbundle.var_fc299ded) ? self.bot.tacbundle.var_fc299ded : 0);
    }
    if (self.bot.var_67b4ea54) {
        function_d4102d11(actionparams);
    } else {
        function_9c6ca396(actionparams);
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x2ad48982, Offset: 0x9630
// Size: 0x3c
function function_9c6ca396(actionparams) {
    self function_26c2bce7(actionparams, self.bot.tacbundle.var_a78526b8);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x137f9c7e, Offset: 0x9678
// Size: 0x3c
function function_d4102d11(actionparams) {
    self function_26c2bce7(actionparams, self.bot.tacbundle.var_b6b1339c);
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xc7ef8093, Offset: 0x96c0
// Size: 0xf2
function function_26c2bce7(actionparams, aimtag) {
    target = actionparams.target;
    if (!isentity(target)) {
        return;
    }
    if (self.scriptenemy === target && isdefined(self.scriptenemytag)) {
        actionparams.aimtag = self.scriptenemytag;
    } else if (isdefined(target.shootattag)) {
        actionparams.aimtag = target.shootattag;
    } else {
        actionparams.aimtag = aimtag;
    }
    actionparams.var_5b865e5e = actionparams.aimtag;
    if (isdefined(target.aimattag)) {
        actionparams.var_5b865e5e = target.aimattag;
    }
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x5 linked
// Checksum 0x12b15135, Offset: 0x97c0
// Size: 0x80
function private function_627e3d2c(tag, target, var_c8e8809e) {
    if (!isdefined(tag)) {
        return var_c8e8809e;
    }
    if (tag == "tag_origin") {
        return target.origin;
    }
    tagorigin = target gettagorigin(tag);
    if (isdefined(tagorigin)) {
        return tagorigin;
    }
    return var_c8e8809e;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xe7731538, Offset: 0x9848
// Size: 0x1e4
function function_8a2b82ad(actionparams) {
    target = actionparams.target;
    if (isdefined(target)) {
        if (isvec(target)) {
            actionparams.aimpoint = target;
        } else if (function_ffa5b184(target)) {
            actionparams.aimpoint = target.var_88f8feeb;
        } else if (isentity(target)) {
            centroid = target getcentroid();
            actionparams.aimpoint = function_627e3d2c(actionparams.aimtag, target, centroid);
            actionparams.var_97065630 = function_627e3d2c(actionparams.var_5b865e5e, target, centroid);
        }
    } else {
        eyes = self geteye();
        angles = self getplayerangles();
        fwd = anglestoforward(angles);
        actionparams.aimpoint = eyes + fwd * 300;
    }
    if (!isdefined(actionparams.var_97065630)) {
        actionparams.var_97065630 = actionparams.aimpoint;
    }
    if (isdefined(actionparams.aimpoint)) {
        self function_7355c240(actionparams);
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd8c069aa, Offset: 0x9a38
// Size: 0x26a
function function_7355c240(actionparams) {
    if (!isdefined(self.bot.var_d7771ac3) || gettime() >= self.bot.var_d7771ac3) {
        eyes = self geteye();
        angles = self getplayerangles();
        fwd = anglestoforward(angles);
        right = anglestoright(angles);
        up = anglestoup(angles);
        aimoffset = function_d2e41376(actionparams.aimpoint, eyes, fwd, right, up, self.bot.var_ea5b64df, 0);
        if (isdefined(aimoffset)) {
            self.bot.aimoffset = aimoffset;
        }
        var_9492fdcb = function_d2e41376(actionparams.var_97065630, eyes, fwd, right, up, self.bot.var_ea5b64df, 1);
        if (isdefined(var_9492fdcb)) {
            self.bot.var_9492fdcb = var_9492fdcb;
        }
        if (isdefined(aimoffset) || isdefined(var_9492fdcb)) {
            self.bot.var_ea5b64df = self.bot.var_ea5b64df * randomfloatrange(0.8, 0.9);
            self.bot.var_d7771ac3 = gettime() + randomintrange(300, 600);
        }
    }
    actionparams.aimpoint = actionparams.aimpoint + self.bot.aimoffset;
    actionparams.var_97065630 = actionparams.var_97065630 + self.bot.var_9492fdcb;
}

// Namespace bot_action/bot_action
// Params 7, eflags: 0x1 linked
// Checksum 0x3030c6bb, Offset: 0x9cb0
// Size: 0x2a8
function function_d2e41376(var_9d9ae85, eyes, fwd, right, up, var_ea5b64df, close) {
    var_24e5c8be = var_9d9ae85 - eyes;
    var_df4809a5 = vectornormalize(var_24e5c8be);
    aimoffset = undefined;
    if (vectordot(fwd, var_df4809a5) > 0.7) {
        var_dafe1813 = min(var_ea5b64df, length(var_24e5c8be) * 0.25);
        if (close) {
            var_dafe1813 = var_dafe1813 * 0.5;
        }
        if (var_dafe1813 == 0) {
            return (0, 0, 0);
        }
        var_18451fac = var_dafe1813 * 0.25;
        var_d83e24eb = var_dafe1813;
        /#
            assert(var_18451fac > 0);
        #/
        /#
            assert(var_d83e24eb > 0);
        #/
        var_b91ee594 = vectordot(var_24e5c8be, right) < 0;
        if (var_b91ee594) {
            aimoffset = right * randomfloatrange(var_d83e24eb * -1, var_18451fac);
        } else {
            aimoffset = right * randomfloatrange(var_18451fac * -1, var_d83e24eb);
        }
        var_7bbaffc = vectordot(var_24e5c8be, up) < 0;
        if (var_7bbaffc) {
            aimoffset = (aimoffset[0], aimoffset[1], randomfloatrange(var_d83e24eb * -1, var_18451fac) * 0.5);
        } else {
            aimoffset = (aimoffset[0], aimoffset[1], randomfloatrange(var_18451fac * -1, var_d83e24eb) * 0.5);
        }
    }
    return aimoffset;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x1705b5a8, Offset: 0x9f60
// Size: 0xae
function function_ab6b1fc9(actionparams) {
    target = actionparams.target;
    if (!isentity(target)) {
        return;
    }
    subtargets = target_getsubtargets(target);
    if (subtargets[0] != 0) {
        actionparams.aimpoint = target_getorigin(target, subtargets[0]);
    } else {
        actionparams.aimpoint = target_getorigin(target);
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xad6f563a, Offset: 0xa018
// Size: 0x7e
function function_a3dfc4aa(actionparams) {
    aimpoint = actionparams.aimpoint;
    weapon = actionparams.weapon;
    if (isdefined(aimpoint) && isdefined(weapon)) {
        actionparams.var_cb785841 = self botgetprojectileaimangles(weapon, aimpoint);
    } else {
        actionparams.var_cb785841 = undefined;
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x0
// Checksum 0x45e38ceb, Offset: 0xa0a0
// Size: 0x76
function function_d136dabe(actionparams) {
    aimpoint = actionparams.aimpoint;
    if (isdefined(aimpoint)) {
        actionparams.bullettrace = bullettrace(self geteye(), aimpoint, 1, self);
    } else {
        actionparams.bullettrace = undefined;
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x23e2072f, Offset: 0xa120
// Size: 0x86
function function_9004d3ca(actionparams) {
    var_cb785841 = actionparams.var_cb785841;
    weapon = actionparams.weapon;
    if (isdefined(var_cb785841) && isdefined(weapon)) {
        actionparams.var_e6ba3ec9 = self function_6e8a2d86(weapon, var_cb785841.var_478aeacd);
    } else {
        actionparams.var_e6ba3ec9 = undefined;
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xb0f734b2, Offset: 0xa1b0
// Size: 0xd6
function is_target_visible(actionparams) {
    target = actionparams.target;
    if (!isdefined(target)) {
        return 0;
    }
    if (isentity(target)) {
        return (isalive(target) && self cansee(target, self.bot.tacbundle.var_82aa37d8));
    }
    if (isvec(target)) {
        return sighttracepassed(self geteye(), target, 1, self);
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xb2c105c9, Offset: 0xa290
// Size: 0x172
function function_ecf6dc7a(actionparams) {
    if (!self bot::in_combat()) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return 0;
    }
    if (!self is_target_visible(actionparams)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return 0;
    }
    return 1;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x81bfcebd, Offset: 0xa410
// Size: 0x58
function function_b70a8fcf(actionparams) {
    target = actionparams.target;
    if (!isdefined(target)) {
        return 0;
    }
    if (isplayer(target)) {
        return isdefined(target.revivetrigger);
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x26bedaf0, Offset: 0xa470
// Size: 0x48
function is_target_enemy(actionparams) {
    target = actionparams.target;
    if (isvec(target)) {
        return 1;
    }
    return self.enemy === target;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x83237433, Offset: 0xa4c0
// Size: 0x42
function function_daa4968(actionparams) {
    target = actionparams.target;
    if (!isdefined(target)) {
        return 0;
    }
    return target_istarget(target);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd195b11, Offset: 0xa510
// Size: 0x12a
function function_ee402bf6(actionparams) {
    target = actionparams.target;
    weapon = actionparams.weapon;
    if (!isdefined(target) || !isdefined(weapon)) {
        return 0;
    }
    if (issentient(target) && self lastknowntime(target) + 5000 < gettime()) {
        return 0;
    }
    targetorigin = isvec(target) ? target : target.origin;
    targetdistsq = distancesquared(self.origin, targetorigin);
    var_1d4ad8f2 = self.bot.tacbundle.var_bda90bb9;
    return targetdistsq <= var_1d4ad8f2 * var_1d4ad8f2;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x5838690b, Offset: 0xa648
// Size: 0xea
function function_679b5b7a(actionparams) {
    target = actionparams.target;
    weapon = actionparams.weapon;
    if (!isdefined(target) || !isdefined(weapon)) {
        return 0;
    }
    targetorigin = isvec(target) ? target : target.origin;
    targetdistsq = distancesquared(self.origin, targetorigin);
    var_97c37e78 = self.bot.tacbundle.maxrange;
    return targetdistsq <= var_97c37e78 * var_97c37e78;
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0xdf9663be, Offset: 0xa740
// Size: 0xe6
function function_faa6a59d(actionparams, range) {
    target = actionparams.target;
    if (!isdefined(target)) {
        return 0;
    }
    if (issentient(target) && self lastknowntime(target) + 5000 < gettime()) {
        return 0;
    }
    targetorigin = isvec(target) ? target : target.origin;
    targetdistsq = distancesquared(self.origin, targetorigin);
    return targetdistsq <= range * range;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x0
// Checksum 0xf327eef, Offset: 0xa830
// Size: 0xc4
function function_43505382(actionparams) {
    target = actionparams.target;
    bullettrace = actionparams.bullettrace;
    if (!isdefined(target) || !isdefined(bullettrace)) {
        return 0;
    }
    if (isentity(target)) {
        return (target === bullettrace[#"entity"]);
    } else if (isvec(target)) {
        return (bullettrace[#"fraction"] >= 1);
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa15dcdd7, Offset: 0xa900
// Size: 0xdc
function function_ade341c(actionparams) {
    target = actionparams.target;
    var_e6ba3ec9 = actionparams.var_e6ba3ec9;
    if (!isdefined(target) || !isdefined(var_e6ba3ec9)) {
        return 0;
    }
    if (isentity(target)) {
        return (target === var_e6ba3ec9[#"entity"]);
    } else if (isvec(target)) {
        return (distancesquared(var_e6ba3ec9[#"position"], target) < 100);
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xd63b727c, Offset: 0xa9e8
// Size: 0x58
function aim_at_target(actionparams) {
    aimpoint = actionparams.aimpoint;
    if (!isdefined(aimpoint)) {
        return;
    }
    self look_at_point(aimpoint, "Aim", (1, 0, 0));
    return aimpoint;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xaba68166, Offset: 0xaa48
// Size: 0x58
function function_e69a1e2e(actionparams) {
    aimpoint = actionparams.var_97065630;
    if (!isdefined(aimpoint)) {
        return;
    }
    self look_at_point(aimpoint, "Aim", (1, 0, 0));
    return aimpoint;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xcdee250b, Offset: 0xaaa8
// Size: 0xf4
function function_3a2f51fd(actionparams) {
    var_cb785841 = actionparams.var_cb785841;
    if (isdefined(var_cb785841)) {
        self botsetlookangles(var_cb785841.var_478aeacd);
    }
    /#
        if (self bot::should_record("<unknown string>") && isdefined(actionparams.aimpoint)) {
            recordsphere(actionparams.aimpoint, 4, (1, 0, 0), "<unknown string>");
            record3dtext("<unknown string>", actionparams.aimpoint + vectorscale((0, 0, 1), 5), (1, 0, 0), "<unknown string>", undefined, 0.5);
        }
    #/
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xe26d55e6, Offset: 0xaba8
// Size: 0x90
function function_31a76186(actionparams) {
    var_f5842481 = self haspath() ? self.bot.tacbundle.var_19019506 : self.bot.tacbundle.var_d5bf8f0d;
    if (!isdefined(var_f5842481)) {
        var_f5842481 = 0;
    }
    return self botgetlookdot() >= var_f5842481;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xa6fb73ab, Offset: 0xac40
// Size: 0x68
function function_bacb1c08(actionparams) {
    var_b4c8298c = isdefined(self.bot.tacbundle.var_b4c8298c) ? self.bot.tacbundle.var_b4c8298c : 0;
    return self botgetlookdot() >= var_b4c8298c;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x3c5062dd, Offset: 0xacb0
// Size: 0x68
function function_55d5a581(actionparams) {
    var_f80f8551 = isdefined(self.bot.tacbundle.var_f80f8551) ? self.bot.tacbundle.var_f80f8551 : 0;
    return self botgetlookdot() >= var_f80f8551;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x6b640349, Offset: 0xad20
// Size: 0x2e
function get_max_health() {
    if (isvehicle(self)) {
        return self.healthdefault;
    }
    return self.maxhealth;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xe7fa8d17, Offset: 0xad58
// Size: 0x1dc
function look_along_path() {
    var_e125ba43 = "Path";
    debugcolor = (1, 1, 1);
    var_8be65bb9 = self function_f04bd922();
    if (isdefined(var_8be65bb9) && isdefined(var_8be65bb9.var_2cfdc66d)) {
        var_104d463 = var_8be65bb9.var_2cfdc66d;
        var_e125ba43 = "Corner";
        if (isdefined(var_8be65bb9.var_b7af6731)) {
            distsq = distance2dsquared(self.origin, var_104d463);
            if (distsq < 4096) {
                var_104d463 = var_8be65bb9.var_b7af6731;
                var_e125ba43 = "Next Corner";
            }
        }
        lookpoint = var_104d463;
        debugcolor = (1, 1, 0);
    } else if (isdefined(self.overridegoalpos)) {
        lookpoint = self.overridegoalpos;
        var_e125ba43 = "Override Goal Pos";
        debugcolor = (1, 0, 1);
    } else {
        lookpoint = self.goalpos;
        var_e125ba43 = self.goalforced ? "Goal Pos (Forced)" : "Goal Pos";
        debugcolor = self.goalforced ? (0, 1, 1) : (0, 1, 0);
    }
    viewheight = self getplayerviewheight();
    lookpoint = lookpoint + (0, 0, viewheight);
    self look_at_point(lookpoint, var_e125ba43, debugcolor);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x86f672b4, Offset: 0xaf40
// Size: 0x23c
function function_412e04fa(node) {
    var_208965cf = node.spawnflags & 262144;
    var_a26a51ba = node.spawnflags & 524288;
    if (!var_208965cf && !var_a26a51ba) {
        self botsetlookangles(node.angles);
        return;
    }
    noderight = anglestoright(node.angles);
    rotation = function_9ccb67a3(node) ? 20 : 45;
    if (var_208965cf && var_a26a51ba) {
        if (function_9ccb67a3(node)) {
            if (vectordot(noderight, self.origin - node.origin) >= 0) {
                rotation = rotation * -1;
            }
        } else if (isdefined(self.enemylastseenpos)) {
            if (vectordot(noderight, self.enemylastseenpos - self.origin) >= 0) {
                rotation = rotation * -1;
            }
        } else if (randomint(2) > 0) {
            rotation = rotation * -1;
        }
    } else if (var_a26a51ba) {
        rotation = rotation * -1;
    }
    lookangles = (node.angles[0], node.angles[1] + rotation, node.angles[2]);
    self botsetlookangles(lookangles);
}

// Namespace bot_action/bot_action
// Params 3, eflags: 0x1 linked
// Checksum 0x999ce25b, Offset: 0xb188
// Size: 0xbc
function look_at_point(point, var_e125ba43, debugcolor) {
    self botsetlookpoint(point);
    /#
        if (self bot::should_record("<unknown string>")) {
            recordsphere(point, 4, debugcolor, "<unknown string>");
            record3dtext(var_e125ba43, point + vectorscale((0, 0, 1), 5), debugcolor, "<unknown string>", undefined, 0.5);
        }
    #/
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xc58209f1, Offset: 0xb250
// Size: 0x5c4
function function_2b8f7067() {
    if (self haspath()) {
        self look_along_path();
        return;
    }
    if (isdefined(self.ignoreall) && self.ignoreall || isdefined(self.var_911100f4) && self.var_911100f4) {
        self function_c17972fc();
        return;
    }
    if (length(self getvelocity()) > 10) {
        self function_c17972fc();
        return;
    }
    var_4f1e4d22 = !isdefined(self.var_b6b6a5d9) || distancesquared(self.origin, self.var_b6b6a5d9) > 256;
    if (var_4f1e4d22) {
        self.var_83867a22 = undefined;
        self.var_b6b6a5d9 = self.origin;
        var_7607a546 = getclosesttacpoint(self.origin);
        if (!isdefined(var_7607a546)) {
            return;
        }
        var_7607a546.searched = 1;
        var_b43277fd = [0:var_7607a546];
        var_d56aeea7 = [0:var_7607a546];
        v_start_hardpoint_navmesh_collision = [];
        var_4a39f740 = [];
        self.var_77ae9678 = [];
        while (var_b43277fd.size > 0) {
            currentpoint = var_b43277fd[0];
            newpoints = function_9086d9a4(currentpoint);
            foreach (point in newpoints) {
                if (!(isdefined(point.searched) && point.searched)) {
                    point.searched = 1;
                    var_d56aeea7[var_d56aeea7.size] = point;
                    if (var_7607a546.region != point.region) {
                        if (!array::contains(v_start_hardpoint_navmesh_collision, currentpoint)) {
                            v_start_hardpoint_navmesh_collision[v_start_hardpoint_navmesh_collision.size] = currentpoint;
                        }
                    } else if (!function_96c81b85(var_7607a546, point.origin + vectorscale((0, 0, 1), 60))) {
                        if (!array::contains(var_4a39f740, currentpoint)) {
                            var_4a39f740[var_4a39f740.size] = currentpoint;
                        }
                    } else {
                        var_b43277fd[var_b43277fd.size] = point;
                    }
                }
            }
            var_b43277fd = array::remove_index(var_b43277fd, 0);
        }
        foreach (point in var_d56aeea7) {
            point.searched = undefined;
        }
        self.var_77ae9678 = arraycombine(v_start_hardpoint_navmesh_collision, var_4a39f740, 0, 0);
    }
    if (isdefined(self.var_77ae9678) && self.var_77ae9678.size > 0) {
        if (!isdefined(self.var_83867a22) || !isdefined(self.var_fa107838) || gettime() >= self.var_fa107838) {
            self.var_fa107838 = gettime() + randomintrange(2000, 4000);
            pointsarray = self.var_77ae9678;
            if (isdefined(self.var_83867a22) && pointsarray.size >= 2) {
                arrayremovevalue(pointsarray, self.var_83867a22);
            }
            self.var_83867a22 = array::random(pointsarray);
        }
    }
    if (isdefined(self.var_83867a22)) {
        viewheight = self getplayerviewheight();
        lookpoint = self.var_83867a22.origin + (0, 0, viewheight);
        var_e125ba43 = "Neighboring Region Entrance";
        debugcolor = (1, 0, 0);
        self look_at_point(lookpoint, var_e125ba43, debugcolor);
    } else {
        node = self bot::get_position_node();
        if (isdefined(node)) {
            self function_412e04fa(node);
        } else {
            self function_c17972fc();
        }
    }
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x6ce1e8a5, Offset: 0xb820
// Size: 0x24
function function_c17972fc() {
    self botsetlookangles(self.angles);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x6b912608, Offset: 0xb850
// Size: 0xc
function function_ab4c3550() {
    return isdefined(self.enemylastseenpos);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x7c9ef8a, Offset: 0xb868
// Size: 0x48
function function_3094610b(limit = 0) {
    return isdefined(self.enemylastseenpos) && isdefined(self.enemylastseentime) && gettime() < self.enemylastseentime + limit;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xb2ee710e, Offset: 0xb8b8
// Size: 0x32
function function_ca71ffdb() {
    return sighttracepassed(self geteye(), self.enemylastseenpos, 0, self);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xd7feb905, Offset: 0xb8f8
// Size: 0x34
function function_d273d4e7() {
    self look_at_point(self.enemylastseenpos, "EnemyLastSeenPos", (1, 0.5, 0));
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x790f633c, Offset: 0xb938
// Size: 0xc
function function_4fbd6cf1() {
    return isdefined(self.var_2925fedc);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x110150f9, Offset: 0xb950
// Size: 0x34
function function_3b98ad10() {
    self look_at_point(self.var_2925fedc, "LikelyEnemyPosition", (1, 0.5, 0));
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x8fd69221, Offset: 0xb990
// Size: 0x44
function clip_ammo(weapon) {
    return self getweaponammoclip(weapon) + self getweaponammoclip(weapon.dualwieldweapon);
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x8c6b8fa1, Offset: 0xb9e0
// Size: 0xce
function function_39317d6e(actionparams) {
    if (self.ignoreall) {
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
    if (!self function_5de4c088(actionparams)) {
        return undefined;
    }
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x19f332ba, Offset: 0xbab8
// Size: 0xda
function function_30636b1c(actionparams) {
    if (!self function_5de4c088(actionparams)) {
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
    return 100;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x674fd86d, Offset: 0xbba0
// Size: 0xda
function function_38d0d1df(actionparams) {
    if (!self function_5de4c088(actionparams)) {
        return undefined;
    }
    if (self bot::has_visible_enemy()) {
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

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xfd840cf5, Offset: 0xbc88
// Size: 0x82
function function_a9847723(weapon) {
    slot = self gadgetgetslot(weapon);
    button = self function_c6e02c38(weapon);
    if (!isdefined(button)) {
        return;
    }
    self bottapbutton(button);
    self waittill(#"hash_347a612b61067eb3");
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x6694426d, Offset: 0xbd18
// Size: 0xb2
function function_8171a298(weapon) {
    slot = self gadgetgetslot(weapon);
    button = self function_c6e02c38(weapon);
    if (!isdefined(button)) {
        return;
    }
    self botswitchtoweapon(weapon);
    self waittill(#"hash_347a612b61067eb3");
    self bottapbutton(button);
    self waittill(#"hash_347a612b61067eb3");
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x90e05d7b, Offset: 0xbdd8
// Size: 0x9a
function function_ec16df22(weapon) {
    slot = self gadgetgetslot(weapon);
    button = self function_c6e02c38(weapon);
    if (!isdefined(button)) {
        return;
    }
    self bottapbutton(button);
    self botswitchtoweapon(weapon);
    self waittill(#"hash_347a612b61067eb3");
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x1cce020d, Offset: 0xbe80
// Size: 0xf6
function test_gadget(actionparams) {
    weapon = actionparams.weapon;
    if (!isdefined(weapon)) {
        /#
            self botprinterror("<unknown string>" + "<unknown string>");
        #/
        self waittill(#"hash_347a612b61067eb3");
        return;
    }
    self function_ccdcc5d9(weapon);
    while (self isthrowinggrenade() || !self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xf494314e, Offset: 0xbf80
// Size: 0xac
function function_fe0b0c29(slot) {
    switch (slot) {
    case 0:
        return self ai::get_behavior_attribute("allowprimaryoffhand");
    case 1:
        return self ai::get_behavior_attribute("allowsecondaryoffhand");
    case 2:
        return self ai::get_behavior_attribute("allowspecialoffhand");
        break;
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x3d0a1068, Offset: 0xc038
// Size: 0x1aa
function function_5de4c088(actionparams) {
    weapon = actionparams.weapon;
    slot = self gadgetgetslot(weapon);
    if (!self function_fe0b0c29(slot)) {
        /#
            if (!isdefined(actionparams.debug)) {
                actionparams.debug = [];
            } else if (!isarray(actionparams.debug)) {
                actionparams.debug = array(actionparams.debug);
            }
            actionparams.debug[actionparams.debug.size] = "<unknown string>";
        #/
        return 0;
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
        return 0;
    }
    return 1;
}

// Namespace bot_action/bot_action
// Params 2, eflags: 0x1 linked
// Checksum 0x497c345, Offset: 0xc1f0
// Size: 0x10e
function function_49161e05(actionparams, checkgrenade) {
    weapon = actionparams.weapon;
    if (!isdefined(weapon)) {
        /#
            self botprinterror("<unknown string>" + "<unknown string>");
        #/
        self waittill(#"hash_347a612b61067eb3");
        return;
    }
    self function_ccdcc5d9(weapon);
    while (isdefined(checkgrenade) && checkgrenade && self isthrowinggrenade() || !self function_a39f313c() || self getcurrentweapon() == level.weaponnone) {
        self waittill(#"hash_347a612b61067eb3");
    }
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0xf2427427, Offset: 0xc308
// Size: 0x2c
function function_94f96101(actionparams) {
    self function_49161e05(actionparams, 1);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0x44b4bb89, Offset: 0xc340
// Size: 0x22
function function_e7fa3d0() {
    return self ai::get_behavior_attribute("allowscorestreak");
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x66c94f3d, Offset: 0xc370
// Size: 0x3a
function function_29163ca5(weapon) {
    self botswitchtoweapon(weapon);
    self waittill(#"hash_347a612b61067eb3");
}

// Namespace bot_action/bot_action
// Params 1, eflags: 0x1 linked
// Checksum 0x15a4e0ce, Offset: 0xc3b8
// Size: 0x6e
function function_11c3d810(weapon) {
    activatefunc = weapon.rootweapon.var_c75f000;
    if (!isdefined(activatefunc)) {
        /#
            self botprinterror(weapon.name + "<unknown string>");
        #/
        return;
    }
    self [[ activatefunc ]](weapon);
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xabd5951b, Offset: 0xc430
// Size: 0x1de
function function_bf21ead1() {
    if (!isdefined(self.bot.tacbundle.var_d1fb2f1a) || (isdefined(self.bot.tacbundle.var_d1fb2f1a) ? self.bot.tacbundle.var_d1fb2f1a : 0) == 0) {
        return;
    }
    if (!self function_37256a9b()) {
        return;
    }
    if (!isdefined(self.var_3ec95cb4) || gettime() >= self.var_3ec95cb4) {
        if (self bot::has_visible_enemy() && self.enemy.classname == "player") {
            self.favoriteenemy = undefined;
            self clearentitytarget();
            return;
        }
        self.favoriteenemy = self function_2a24a928();
        if (isdefined(self.favoriteenemy)) {
            self setentitytarget(self.favoriteenemy);
        } else {
            self clearentitytarget();
        }
        if (!isdefined(self.favoriteenemy) && !isdefined(self.enemy) && self.bot.var_469cfe53.isfavoriteenemy) {
            self function_42907fd4();
        }
        self.var_3ec95cb4 = gettime() + randomintrange(1000, 10000);
    }
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xf814394f, Offset: 0xc618
// Size: 0xf2
function function_37256a9b() {
    weapons = self getweaponslist();
    foreach (weapon in weapons) {
        if (weapon.lockontype != "None") {
            clipammo = self clip_ammo(weapon);
            stockammo = self getweaponammostock(weapon);
            if (clipammo + stockammo > 0) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace bot_action/bot_action
// Params 0, eflags: 0x1 linked
// Checksum 0xe3477b58, Offset: 0xc718
// Size: 0x586
function function_2a24a928() {
    potentialtargets = [];
    if (isdefined(level.spawneduavs)) {
        foreach (uav in level.spawneduavs) {
            if (isdefined(uav) && util::function_fbce7263(uav.team, self.team)) {
                potentialtargets[potentialtargets.size] = uav;
            }
        }
    }
    if (isdefined(level.counter_uav_entities)) {
        foreach (cuav in level.counter_uav_entities) {
            if (isdefined(cuav) && util::function_fbce7263(cuav.team, self.team)) {
                potentialtargets[potentialtargets.size] = cuav;
            }
        }
    }
    choppers = getentarray("chopper", "targetName");
    if (isdefined(choppers)) {
        foreach (chopper in choppers) {
            if (isdefined(chopper) && util::function_fbce7263(chopper.team, self.team)) {
                potentialtargets[potentialtargets.size] = chopper;
            }
        }
    }
    planes = getentarray("strafePlane", "targetName");
    if (isdefined(planes)) {
        foreach (plane in planes) {
            if (isdefined(plane) && util::function_fbce7263(plane.team, self.team)) {
                potentialtargets[potentialtargets.size] = plane;
            }
        }
    }
    if (isdefined(level.ac130) && util::function_fbce7263(level.ac130.team, self.team)) {
        potentialtargets[potentialtargets.size] = level.ac130;
    }
    if (potentialtargets.size == 0) {
        return undefined;
    }
    var_137299d = [];
    var_7607a546 = getclosesttacpoint(self.origin);
    if (isdefined(var_7607a546)) {
        foreach (target in potentialtargets) {
            if (issentient(target)) {
                if (!isdefined(target.var_e38e137f) || !isdefined(target.var_e38e137f[self getentitynumber()])) {
                    target.var_e38e137f[self getentitynumber()] = randomfloat(1) < (isdefined(self.bot.tacbundle.var_d1fb2f1a) ? self.bot.tacbundle.var_d1fb2f1a : 0);
                }
                if (!target.var_e38e137f[self getentitynumber()]) {
                    continue;
                }
                if (function_96c81b85(var_7607a546, target.origin)) {
                    var_137299d[var_137299d.size] = target;
                }
            }
        }
    }
    if (var_137299d.size == 0) {
        return undefined;
    }
    var_1f5c2eac = util::get_array_of_closest(self.origin, var_137299d);
    return var_1f5c2eac[0];
}

