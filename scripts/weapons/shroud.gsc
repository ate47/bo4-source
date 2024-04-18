// Atian COD Tools GSC decompiler test
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\weapons\weaponobjects.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace shroud;

// Namespace shroud/shroud
// Params 0, eflags: 0x2
// Checksum 0x798b2ad3, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"shroud", &init_shared, undefined, undefined);
}

// Namespace shroud/shroud
// Params 0, eflags: 0x1 linked
// Checksum 0x23110648, Offset: 0x218
// Size: 0x1f4
function init_shared() {
    level thread register();
    callback::on_spawned(&on_player_spawned);
    weaponobjects::function_e6400478(#"eq_shroud", &function_2fb567f2, 1);
    globallogic_score::register_kill_callback(getweapon("eq_shroud"), &function_75f9989a);
    globallogic_score::function_86f90713(getweapon("eq_shroud"), &function_75f9989a);
    level.var_9bc205c6 = getweapon("eq_shroud");
    if (getgametypesetting(#"competitivesettings") === 1) {
        level.var_88c99ac4 = getscriptbundle("shroud_custom_settings_comp");
    } else if (isdefined(level.var_9bc205c6.customsettings)) {
        level.var_88c99ac4 = getscriptbundle(level.var_9bc205c6.customsettings);
    } else {
        level.var_88c99ac4 = getscriptbundle("shroud_custom_settings");
    }
    level.var_f53da9ba = &function_4db10465;
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace shroud/shroud
// Params 0, eflags: 0x1 linked
// Checksum 0x2b32c619, Offset: 0x418
// Size: 0x70
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](level.var_9bc205c6, &function_bff5c062);
    }
    if (isdefined(level.var_a5dacbea)) {
        [[ level.var_a5dacbea ]](level.var_9bc205c6, &weaponobjects::function_127fb8f3);
    }
}

// Namespace shroud/shroud
// Params 2, eflags: 0x1 linked
// Checksum 0x3125721, Offset: 0x490
// Size: 0x284
function function_bff5c062(shroud, attackingplayer) {
    shroud.owner weaponobjects::hackerremoveweapon(shroud);
    arrayremovevalue(shroud.owner.shrouds, shroud);
    shroud setteam(attackingplayer.team);
    shroud.team = attackingplayer.team;
    shroud.owner = attackingplayer;
    shroud setowner(attackingplayer);
    shroud notify(#"hacked");
    shroud clientfield::set("shroud_state", 1);
    shroud weaponobjects::function_386fa470(attackingplayer);
    if (!isdefined(attackingplayer.shrouds)) {
        attackingplayer.shrouds = [];
    }
    if (!isdefined(attackingplayer.shrouds)) {
        attackingplayer.shrouds = [];
    } else if (!isarray(attackingplayer.shrouds)) {
        attackingplayer.shrouds = array(attackingplayer.shrouds);
    }
    attackingplayer.shrouds[attackingplayer.shrouds.size] = shroud;
    if (isdefined(level.var_f1edf93f)) {
        _station_up_to_detention_center_triggers = [[ level.var_f1edf93f ]]() * 1000;
        if (isdefined(_station_up_to_detention_center_triggers) ? _station_up_to_detention_center_triggers : 0) {
            shroud notify(#"cancel_timeout");
            shroud thread weaponobjects::function_d9c08e94(_station_up_to_detention_center_triggers, &function_4db10465);
        }
    }
    if (isdefined(level.var_fc1bbaef)) {
        [[ level.var_fc1bbaef ]](shroud);
    }
    shroud thread weaponobjects::function_6d8aa6a0(attackingplayer, shroud.var_2d045452);
}

// Namespace shroud/shroud
// Params 0, eflags: 0x1 linked
// Checksum 0x130163c0, Offset: 0x720
// Size: 0x64
function register() {
    clientfield::register("missile", "shroud_state", 1, 1, "int");
    clientfield::register("clientuimodel", "hudItems.shroudCount", 1, 3, "int");
}

// Namespace shroud/shroud
// Params 0, eflags: 0x1 linked
// Checksum 0xbc94152, Offset: 0x790
// Size: 0x6c
function on_player_spawned() {
    weapon = getweapon("eq_shroud");
    if (isdefined(weapon) && !self hasweapon(weapon)) {
        self clientfield::set_player_uimodel("hudItems.shroudCount", 0);
    }
}

// Namespace shroud/shroud
// Params 5, eflags: 0x1 linked
// Checksum 0xed8cce08, Offset: 0x808
// Size: 0x236
function function_75f9989a(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(attackerweapon) || !isdefined(attacker) || !isdefined(victim) || !isdefined(weapon)) {
        return false;
    }
    if (weapon == attackerweapon) {
        return false;
    }
    function_a86d28fc(attacker, victim);
    if (isdefined(attacker.shrouds)) {
        foreach (dart in attacker.shrouds) {
            if (isdefined(dart) && distance2dsquared(victim.origin, dart.origin) < 1350 * 1350) {
                dart.killcount = (isdefined(dart.killcount) ? dart.killcount : 0) + 1;
                if (!isdefined(dart.var_cbca1a8f) && isdefined(level.var_ac6052e9) && dart.killcount >= [[ level.var_ac6052e9 ]]("shroudSuccessKillCount", 0) && isdefined(level.playgadgetsuccess) && isdefined(dart.owner)) {
                    dart.owner [[ level.playgadgetsuccess ]](getweapon("eq_shroud"), undefined, victim);
                    dart.var_cbca1a8f = 1;
                }
                return true;
            }
        }
    }
    return false;
}

// Namespace shroud/shroud
// Params 2, eflags: 0x1 linked
// Checksum 0xa3ea24d7, Offset: 0xa48
// Size: 0x200
function function_a86d28fc(attacker, victim) {
    if (!level.teambased) {
        return;
    }
    if (!util::function_fbce7263(attacker.team, victim.team)) {
        return;
    }
    var_f557e840 = getplayers(attacker.team);
    foreach (teammate in var_f557e840) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (teammate == attacker) {
            continue;
        }
        if (!isdefined(teammate.shrouds)) {
            continue;
        }
        foreach (dart in teammate.shrouds) {
            if (!isdefined(dart)) {
                continue;
            }
            if (distance2dsquared(victim.origin, dart.origin) >= 1350 * 1350) {
                continue;
            }
            scoreevents::processscoreevent(#"shroud_assist", teammate, victim, getweapon(#"eq_shroud"));
            break;
        }
    }
}

// Namespace shroud/shroud
// Params 1, eflags: 0x1 linked
// Checksum 0xb8eb0ead, Offset: 0xc50
// Size: 0x116
function function_2fb567f2(watcher) {
    watcher.ondetonatecallback = &function_4b3bc61d;
    watcher.hackable = 1;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.deleteonplayerspawn = 0;
    watcher.enemydestroy = 1;
    watcher.onspawn = &function_f4970a20;
    watcher.ondamage = &function_55de888f;
    watcher.ondestroyed = &function_c142e8ec;
    watcher.pickup = &weaponobjects::function_db70257;
    watcher.var_994b472b = &function_95c69960;
}

// Namespace shroud/shroud
// Params 1, eflags: 0x1 linked
// Checksum 0x95a86e14, Offset: 0xd70
// Size: 0x24
function function_95c69960(player) {
    self function_c142e8ec(undefined, undefined);
}

// Namespace shroud/shroud
// Params 2, eflags: 0x1 linked
// Checksum 0x56ad7a82, Offset: 0xda0
// Size: 0x400
function function_f4970a20(watcher, player) {
    player endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self endon(#"death");
    self weaponobjects::onspawnuseweaponobject(watcher, player);
    self clientfield::set("shroud_state", 1);
    self.var_2d045452 = watcher;
    self.weapon = getweapon(#"eq_shroud");
    self setweapon(self.weapon);
    if (!isdefined(player.shrouds)) {
        player.shrouds = [];
    }
    if (!isdefined(player.shrouds)) {
        player.shrouds = [];
    } else if (!isarray(player.shrouds)) {
        player.shrouds = array(player.shrouds);
    }
    player.shrouds[player.shrouds.size] = self;
    waitresult = self waittilltimeout(5, #"stationary");
    if (waitresult._notify == #"timeout") {
        function_4db10465();
        return;
    }
    player notify(#"shroud_active", {#dart:self});
    player clientfield::set_player_uimodel("hudItems.shroudCount", player.shrouds.size);
    player stats::function_e24eec31(self.weapon, #"used", 1);
    self util::make_sentient();
    self thread function_aa8bb7be();
    self thread function_6852f0e1();
    if (isdefined(level.var_3a9b373a)) {
        level thread [[ level.var_3a9b373a ]](self, player);
    }
    if (isdefined(level.var_7e7cce95)) {
        n_fuse_time = level.var_7e7cce95;
    } else {
        n_fuse_time = int((isdefined(level.var_88c99ac4.var_c4e30db1) ? level.var_88c99ac4.var_c4e30db1 : 0) * 1000);
    }
    self thread weaponobjects::function_d9c08e94(n_fuse_time, &function_4db10465);
    self clientfield::set("enemyequip", 1);
    playfxontag(#"hash_18309807d9c34a77", self, "tag_fx");
    if (isdefined(level.var_bd715920)) {
        player [[ level.var_bd715920 ]](self.weapon, undefined, self.origin, self);
    }
}

// Namespace shroud/shroud
// Params 0, eflags: 0x5 linked
// Checksum 0x32b0292f, Offset: 0x11a8
// Size: 0xec
function private function_6852f0e1() {
    owner = self.owner;
    waitresult = self waittill(#"picked_up", #"death");
    if (isdefined(owner) && isdefined(owner.shrouds)) {
        arrayremovevalue(owner.shrouds, undefined);
        owner clientfield::set_player_uimodel("hudItems.shroudCount", owner.shrouds.size);
    }
    if (waitresult._notify == "death") {
        return;
    }
    if (isdefined(self)) {
        self clientfield::set("shroud_state", 0);
    }
}

// Namespace shroud/shroud
// Params 0, eflags: 0x1 linked
// Checksum 0xab5d18ef, Offset: 0x12a0
// Size: 0x2a
function function_aa8bb7be() {
    self endon(#"death");
    self waittill(#"hacked");
}

// Namespace shroud/shroud
// Params 2, eflags: 0x1 linked
// Checksum 0x37b48593, Offset: 0x12d8
// Size: 0x15c
function function_c142e8ec(attacker, callback_data) {
    playfx(level._equipment_explode_fx_lg, self.origin);
    self playsound(#"hash_330c9380b91a673");
    var_3c4d4b60 = isdefined(self.owner);
    if (isdefined(attacker) && (!var_3c4d4b60 || self.owner util::isenemyplayer(attacker))) {
        if (var_3c4d4b60) {
            self.owner thread killstreaks::play_taacom_dialog("shroudDestroyedFriendly");
        }
        attacker challenges::destroyedequipment();
        scoreevents::processscoreevent(#"shroud_shutdown", attacker, self.owner, undefined);
        if (isdefined(level.var_d2600afc)) {
            self [[ level.var_d2600afc ]](attacker, self.owner, self.weapon);
        }
    }
    self delete();
}

// Namespace shroud/shroud
// Params 0, eflags: 0x1 linked
// Checksum 0x789b81d7, Offset: 0x1440
// Size: 0x1c
function function_4db10465() {
    self thread function_c142e8ec(undefined, undefined);
}

// Namespace shroud/shroud
// Params 3, eflags: 0x1 linked
// Checksum 0xbb021b7d, Offset: 0x1468
// Size: 0x204
function function_4b3bc61d(attacker, weapon, target) {
    level notify(#"shroud_destroyed");
    if (!isdefined(weapon) || !weapon.isemp) {
        playfx(level._equipment_explode_fx_lg, self.origin);
    }
    if (isdefined(level.var_88c99ac4.var_bb6c29b4) && isdefined(weapon) && weapon == getweapon(#"shock_rifle")) {
        playfx(level.var_88c99ac4.var_bb6c29b4, self.origin);
    }
    if (isdefined(attacker) && self.owner util::isenemyplayer(attacker)) {
        attacker challenges::destroyedequipment(weapon);
        self.owner globallogic_score::function_5829abe3(attacker, weapon, self.weapon);
    }
    if (function_3238d10d(self.origin)) {
        playsoundatposition(#"hash_330c9380b91a673", self.origin);
    }
    if (isdefined(level.var_d2600afc)) {
        self [[ level.var_d2600afc ]](attacker, self.owner, self.weapon, weapon);
    }
    self.owner luinotifyevent(#"shroud_destroyed");
    self delete();
}

// Namespace shroud/shroud
// Params 1, eflags: 0x1 linked
// Checksum 0xb42aed79, Offset: 0x1678
// Size: 0x38e
function function_55de888f(watcher) {
    self endon(#"death");
    self setcandamage(1);
    damagemax = 20;
    if (!self util::ishacked()) {
        self.damagetaken = 0;
    }
    self.maxhealth = 10000;
    self.health = self.maxhealth;
    self setmaxhealth(self.maxhealth);
    attacker = undefined;
    while (true) {
        waitresult = self waittill(#"damage");
        profilestart();
        damage = waitresult.amount;
        type = waitresult.mod;
        weapon = waitresult.weapon;
        damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
        attacker = self [[ level.figure_out_attacker ]](waitresult.attacker);
        attackerisplayer = isplayer(attacker);
        profilestop();
        if (level.teambased && !sessionmodeiswarzonegame()) {
            if (attackerisplayer && !(isdefined(level.hardcoremode) && level.hardcoremode) && !util::function_fbce7263(self.owner.team, attacker.pers[#"team"]) && self.owner != attacker) {
                continue;
            }
        }
        profilestart();
        if (watcher.stuntime > 0 && weapon.dostun) {
            self thread weaponobjects::stunstart(watcher, watcher.stuntime);
        }
        if (attackerisplayer && damage::friendlyfirecheck(self.owner, attacker)) {
            if (damagefeedback::dodamagefeedback(weapon, attacker)) {
                attacker damagefeedback::update();
            }
        }
        if (type == "MOD_MELEE" || type == "MOD_MELEE_WEAPON_BUTT" || weapon.isemp || weapon.destroysequipment) {
            self.damagetaken = damagemax;
        } else {
            self.damagetaken += damage;
        }
        if (self.damagetaken >= damagemax) {
            watcher thread weaponobjects::waitanddetonate(self, 0.05, attacker, weapon);
            profilestop();
            return;
        }
        profilestop();
    }
}

