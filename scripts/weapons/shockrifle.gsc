#using scripts\abilities\ability_player;
#using scripts\abilities\ability_power;
#using scripts\abilities\gadgets\gadget_radiation_field;
#using scripts\core_common\audio_shared;
#using scripts\core_common\bots\bot_stance;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\damage;
#using scripts\core_common\damagefeedback_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\killcam_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\weapons_shared;
#using scripts\killstreaks\killstreaks_util;
#using scripts\weapons\weaponobjects;

#namespace shockrifle;

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0xc8820309, Offset: 0x290
// Size: 0x1cc
function init_shared() {
    clientfield::register("toplayer", "shock_rifle_shocked", 1, 1, "int");
    clientfield::register("toplayer", "shock_rifle_damage", 1, 1, "int");
    clientfield::register("allplayers", "shock_rifle_sound", 1, 1, "int");
    level.shockrifleweapon = getweapon(#"shock_rifle");
    if (isdefined(level.shockrifleweapon.customsettings)) {
        level.var_a5ff950 = getscriptbundle(level.shockrifleweapon.customsettings);
    } else {
        level.var_a5ff950 = getscriptbundle("shock_rifle_custom_settings");
    }
    weaponobjects::function_e6400478(#"shock_rifle", &function_c1aa8f6b, 0);
    globallogic_score::function_a458dbe1(#"shock_rifle_shock", &function_95a892a);
    callback::on_connecting(&onplayerconnect);
    callback::on_spawned(&on_player_spawned);
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0x2c25fadd, Offset: 0x468
// Size: 0x44
function on_player_spawned() {
    self clientfield::set_to_player("shock_rifle_damage", 0);
    self clientfield::set("shock_rifle_sound", 0);
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0xf28e5533, Offset: 0x4b8
// Size: 0x26
function onplayerconnect() {
    profilestart();
    self callback::on_player_killed(&onplayerkilled);
    profilestop();
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0xd78e2dc4, Offset: 0x4e8
// Size: 0x1c
function onplayerkilled() {
    self function_3474c820();
}

// Namespace shockrifle/shockrifle
// Params 5, eflags: 0x0
// Checksum 0xc34eda1e, Offset: 0x510
// Size: 0x5a
function function_95a892a(attacker, victim, var_3d1ed4bd, attackerweapon, meansofdeath) {
    if (!isdefined(var_3d1ed4bd) || !isdefined(attackerweapon) || var_3d1ed4bd == attackerweapon) {
        return false;
    }
    return true;
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0xf20b2dae, Offset: 0x578
// Size: 0x1be
function function_c1aa8f6b(watcher) {
    watcher.watchforfire = 1;
    watcher.hackable = 1;
    watcher.hackertoolradius = level.equipmenthackertoolradius;
    watcher.hackertooltimems = level.equipmenthackertooltimems;
    watcher.activatefx = 1;
    watcher.ownergetsassist = 1;
    watcher.ignoredirection = 1;
    watcher.immediatedetonation = 1;
    watcher.detectiongraceperiod = 0;
    watcher.detonateradius = level.var_a5ff950.var_9c0267f2 + 50;
    watcher.onstun = &weaponobjects::weaponstun;
    watcher.stuntime = 1;
    watcher.timeout = level.var_a5ff950.shockduration;
    watcher.ondetonatecallback = &function_7ce0a335;
    watcher.activationdelay = 0;
    watcher.activatesound = #"wpn_claymore_alert";
    watcher.immunespecialty = "specialty_immunetriggershock";
    watcher.onspawn = &function_aa6e2f52;
    watcher.ondamage = &function_bcc47944;
    watcher.ontimeout = &function_7ce0a335;
    watcher.onfizzleout = &function_7ce0a335;
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0xe4a0c5d0, Offset: 0x740
// Size: 0x64
function function_a0081b68(ent) {
    self endon(#"death");
    ent waittill(#"death");
    wait level.var_a5ff950.var_e6dccd20;
    self function_7ce0a335(undefined, undefined, undefined);
}

// Namespace shockrifle/shockrifle
// Params 2, eflags: 0x0
// Checksum 0xc1b97891, Offset: 0x7b0
// Size: 0x25a
function function_aa6e2f52(watcher, owner) {
    self endon(#"death");
    self.protected_entities = [];
    self.hit_ents = [];
    self.var_7471e7b7 = 0;
    self setcandamage(0);
    waitresult = self waittill(#"grenade_stuck");
    waitframe(2);
    if (!isdefined(waitresult.hitent)) {
        return;
    }
    if (isdefined(waitresult.hitent.isdog) && waitresult.hitent.isdog) {
        watcher.timeout = 0.75;
    } else {
        watcher.timeout = level.var_a5ff950.shockduration;
    }
    self playsound("prj_lightning_impact_human_fatal");
    self thread function_a0081b68(waitresult.hitent);
    if (!isactor(waitresult.hitent)) {
        self function_92eabc2f(waitresult.hitent, 1);
    }
    playfxontag("weapon/fx8_hero_sig_shockrifle_spike_active", self, "tag_fx");
    wait isdefined(level.var_a5ff950.var_aded392d) ? level.var_a5ff950.var_aded392d : 0;
    if (isdefined(waitresult.hitent) && isdefined(owner) && util::function_fbce7263(waitresult.hitent.team, owner.team)) {
        self thread function_5fff8c45(watcher, waitresult.hitent);
    }
    self.owner = owner;
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0x9f57478d, Offset: 0xa18
// Size: 0x5a
function function_7cc07921(ent) {
    if (distancesquared(self.origin, ent.origin) <= level.var_a5ff950.var_9c0267f2 * level.var_a5ff950.var_9c0267f2) {
        return true;
    }
    return false;
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0x97241eb9, Offset: 0xa80
// Size: 0x4c
function function_a6beb598(notifystr) {
    if (!isdefined(self) || !isdefined(self.var_56c34a84)) {
        return;
    }
    self.var_56c34a84 function_7ce0a335(undefined, undefined, undefined);
}

// Namespace shockrifle/shockrifle
// Params 2, eflags: 0x0
// Checksum 0x3c2a1656, Offset: 0xad8
// Size: 0x22c
function function_5fff8c45(watcher, hitent) {
    self endon(#"death", #"hacked", #"kill_target_detection");
    if (isdefined(hitent)) {
        hitent endoncallback(&function_a6beb598, #"hash_16c7de1837351e82");
        hitent.var_56c34a84 = self;
    }
    damagearea = weaponobjects::proximityweaponobject_createdamagearea(watcher);
    up = anglestoup(self.angles);
    traceorigin = self.origin + up;
    while (self.var_7471e7b7 < level.var_a5ff950.var_1fb6bd43) {
        waitresult = damagearea waittill(#"trigger");
        ent = waitresult.activator;
        if (isdefined(self.detonating) && self.detonating) {
            return;
        }
        if (!weaponobjects::proximityweaponobject_validtriggerentity(watcher, ent)) {
            continue;
        }
        if (weaponobjects::proximityweaponobject_isspawnprotected(watcher, ent)) {
            continue;
        }
        if (!function_7cc07921(ent)) {
            continue;
        }
        if (function_33020ed7(ent)) {
            continue;
        }
        if (!isplayer(ent)) {
            continue;
        }
        if (ent damageconetrace(traceorigin, self) > 0) {
            self thread function_92eabc2f(ent, 0);
        }
    }
    function_7ce0a335(undefined, undefined, undefined);
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0x9d8e2d53, Offset: 0xd10
// Size: 0x54
function function_33020ed7(ent) {
    for (i = 0; i < self.hit_ents.size; i++) {
        if (self.hit_ents[i] == ent) {
            return true;
        }
    }
    return false;
}

// Namespace shockrifle/shockrifle
// Params 2, eflags: 0x0
// Checksum 0x4ab97795, Offset: 0xd70
// Size: 0x8e
function function_c23ed15d(ent, shockduration) {
    if (isdefined(ent.hittime) && ent.hittime + shockduration + int((isdefined(level.var_a5ff950.var_80cecde8) ? level.var_a5ff950.var_80cecde8 : 0) * 1000) > gettime()) {
        return true;
    }
    return false;
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0xb7630109, Offset: 0xe08
// Size: 0x70
function function_a64504d2() {
    shockduration = level.var_a5ff950.shockduration;
    if (isplayer(self)) {
        var_341cbc9e = self function_aa61b0b();
        if (var_341cbc9e) {
            shockduration *= var_341cbc9e;
        }
    }
    return shockduration;
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0xdb26a2f5, Offset: 0xe80
// Size: 0x3c
function deleteobjective(objectiveid) {
    objective_delete(objectiveid);
    gameobjects::release_obj_id(objectiveid);
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0xff55d770, Offset: 0xec8
// Size: 0x142
function function_13c7b967(owner) {
    if (isdefined(self.var_c3f76d52)) {
        return;
    }
    obj_id = gameobjects::get_next_obj_id();
    objective_add(obj_id, "invisible", self.origin, #"shockrifle_shocked");
    objective_onentity(obj_id, self);
    objective_setvisibletoall(obj_id);
    objective_setteam(obj_id, owner getteam());
    function_da7940a3(obj_id, 1);
    objective_setinvisibletoplayer(obj_id, self);
    function_3ae6fa3(obj_id, owner getteam(), 0);
    objective_setstate(obj_id, "active");
    self.var_c3f76d52 = obj_id;
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0x21aee504, Offset: 0x1018
// Size: 0x36
function function_3474c820() {
    if (!isdefined(self.var_c3f76d52)) {
        return;
    }
    deleteobjective(self.var_c3f76d52);
    self.var_c3f76d52 = undefined;
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0x2200a81f, Offset: 0x1058
// Size: 0xe0
function function_5439aa67(shockcharge) {
    self endon(#"death", #"shock_end");
    while (isdefined(self)) {
        if (self isplayerswimming()) {
            if (isdefined(shockcharge)) {
                self dodamage(10000, shockcharge.origin, shockcharge.owner, shockcharge, undefined, "MOD_UNKNOWN", 0, level.shockrifleweapon);
                return;
            }
            self dodamage(10000, self.origin, undefined, undefined, undefined, "MOD_UNKNOWN", 0, level.shockrifleweapon);
            return;
        }
        waitframe(1);
    }
}

// Namespace shockrifle/shockrifle
// Params 0, eflags: 0x0
// Checksum 0x4c66d592, Offset: 0x1140
// Size: 0x3c
function watchfordeath() {
    self waittill(#"death");
    self clientfield::set("shock_rifle_sound", 0);
}

// Namespace shockrifle/shockrifle
// Params 3, eflags: 0x0
// Checksum 0x3fdbef8b, Offset: 0x1188
// Size: 0x56e
function function_c80bac1f(shockcharge, var_51415470, shockduration) {
    self endon(#"death");
    self ability_player::function_fc4dc54(1);
    self.hittime = gettime();
    owner = shockcharge.owner;
    damagepos = shockcharge.origin;
    var_40aed931 = 0;
    if (var_40aed931) {
        self function_13c7b967(owner);
    }
    self playsound("wpn_shockrifle_bounce");
    if (isplayer(self)) {
        self thread function_5439aa67(shockcharge);
        self freezecontrolsallowlook(1);
    }
    shocked_hands = getweapon(#"shocked_hands");
    var_cb36e12 = getweapon(#"hash_19abd3767bd1566d");
    self giveweapon(shocked_hands);
    self switchtoweaponimmediate(shocked_hands, 1);
    prevstance = self getstance();
    self setstance("crouch");
    self disableweaponcycling();
    firstraisetime = isdefined(shocked_hands.firstraisetime) ? shocked_hands.firstraisetime : 1;
    wait firstraisetime;
    self allowcrouch(1);
    self allowprone(0);
    self allowstand(0);
    self giveweapon(var_cb36e12);
    self switchtoweaponimmediate(var_cb36e12, 1);
    if (isplayer(self)) {
        self freezecontrolsallowlook(0);
        self clientfield::set_to_player("shock_rifle_shocked", 1);
        self clientfield::set("shock_rifle_sound", 1);
    }
    if (isdefined(owner) && util::function_fbce7263(self.team, owner.team)) {
        if (var_51415470) {
            scoreevents::processscoreevent(#"hash_6f0ec202863eacd", owner, self, level.shockrifleweapon);
        } else {
            scoreevents::processscoreevent(#"tempest_shock_chain", owner, self, level.shockrifleweapon);
        }
    }
    wait shockduration;
    if (isdefined(self)) {
        self notify(#"hash_16c7de1837351e82");
    }
    self.var_beee9523 = 0;
    self function_3474c820();
    playsoundatposition(#"hash_f2b6a97233cbeb2", self.origin);
    if (isplayer(self)) {
        self clientfield::set_to_player("shock_rifle_shocked", 0);
        self clientfield::set_to_player("shock_rifle_damage", 0);
        self clientfield::set("shock_rifle_sound", 0);
    }
    self enableweaponcycling();
    self takeweapon(var_cb36e12);
    self takeweapon(shocked_hands);
    self killstreaks::switch_to_last_non_killstreak_weapon(1, 0, 0);
    self waittill(#"weapon_change");
    self setstance(prevstance);
    self allowprone(1);
    self allowstand(1);
    self notify(#"shock_end");
}

// Namespace shockrifle/shockrifle
// Params 2, eflags: 0x0
// Checksum 0x6e9cfb93, Offset: 0x1700
// Size: 0x1c4
function function_e0141557(ent, var_51415470) {
    damage = var_51415470 ? level.var_a5ff950.impactdamage : level.var_a5ff950.shockdamage;
    isplayer = isplayer(ent);
    if (isdefined(ent.var_beee9523) && ent.var_beee9523) {
        damage = 10000;
    } else if (isdefined(ent.var_dda9b735) && isdefined(ent.var_dda9b735.isshocked) && ent.var_dda9b735.isshocked) {
        damage = 10000;
    } else if (isplayer && ent isplayerswimming()) {
        damage = 10000;
    } else if ((isplayer || isbot(ent)) && (ent isremotecontrolling() || ent.currentweapon.statname == #"recon_car")) {
        damage = 10000;
    }
    damagescalar = isplayer ? ent function_6e30f4a3() : 1;
    return damage * damagescalar;
}

// Namespace shockrifle/shockrifle
// Params 2, eflags: 0x0
// Checksum 0xce148c89, Offset: 0x18d0
// Size: 0x404
function function_92eabc2f(ent, var_51415470) {
    ent endon(#"death");
    self endon(#"death");
    self.hit_ents[self.hit_ents.size] = ent;
    self.var_7471e7b7++;
    if (isplayer(ent) && isdefined(ent.var_d44d1214)) {
        ent gadget_radiation_field::shutdown(1);
    }
    if (!var_51415470) {
        var_3e74fd3b = spawn("script_model", self.origin);
        var_3e74fd3b setmodel("tag_origin");
        tag = ent gettagorigin("j_spineupper");
        if (!isdefined(tag)) {
            tag = ent.origin;
        }
        var_6fad972 = spawn("script_model", tag);
        var_6fad972 setmodel("tag_origin");
        beamlaunch(var_3e74fd3b, var_6fad972, "tag_origin", "tag_origin", level.shockrifleweapon);
        level thread function_1c34cd1b(var_3e74fd3b);
        level thread function_1c34cd1b(var_6fad972);
    }
    ent.var_e8bb749a = 1;
    damage = function_e0141557(ent, var_51415470);
    ent dodamage(damage, self.origin, self.owner, self, undefined, "MOD_UNKNOWN", 0, level.shockrifleweapon);
    ent.var_beee9523 = 1;
    shockduration = ent function_a64504d2();
    params = getstatuseffect(#"shock_rifle_shock");
    ent status_effect::status_effect_apply(params, level.shockrifleweapon, self.owner, 0, int((shockduration + level.var_a5ff950.var_772f6a9c) * 1000), undefined, self.origin);
    isplayer = isplayer(ent);
    if (isplayer) {
        ent clientfield::set_to_player("shock_rifle_damage", 1);
    }
    if (!function_c23ed15d(ent, shockduration) && isplayer) {
        if (ent clientfield::get_to_player("vision_pulse_active") == 1) {
            ent [[ level.shutdown_vision_pulse ]](0, 1, ent.var_1ad61d27);
            waitframe(1);
        }
        ent thread function_c80bac1f(self, var_51415470, shockduration);
        return;
    }
    ent playsound("wpn_shockrifle_bounce");
}

// Namespace shockrifle/shockrifle
// Params 3, eflags: 0x0
// Checksum 0xbe14f82a, Offset: 0x1ce0
// Size: 0xfc
function function_7ce0a335(attacker, weapon, target) {
    self endon(#"death");
    if (isdefined(self.detonating) && self.detonating) {
        return;
    }
    self.detonating = 1;
    playfx(#"hash_788f36f3ae067065", self.origin);
    self ghost();
    self notsolid();
    self stoploopsound(0.5);
    wait level.var_a5ff950.shockduration + 1;
    self delete();
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0x36770ae3, Offset: 0x1de8
// Size: 0x24
function function_1c34cd1b(object) {
    wait 5;
    object delete();
}

// Namespace shockrifle/shockrifle
// Params 1, eflags: 0x0
// Checksum 0x16371324, Offset: 0x1e18
// Size: 0x312
function function_bcc47944(watcher) {
    self endon(#"death");
    damagemax = 20;
    self.maxhealth = 100000;
    self.health = self.maxhealth;
    self.damagetaken = 0;
    attacker = undefined;
    while (true) {
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        damage = waitresult.amount;
        type = waitresult.mod;
        idflags = waitresult.flags;
        if (weapon == level.shockrifleweapon) {
            continue;
        }
        damage = weapons::function_74bbb3fa(damage, weapon, self.weapon);
        attacker = self [[ level.figure_out_attacker ]](waitresult.attacker);
        if (!isplayer(attacker)) {
            continue;
        }
        if (level.teambased) {
            if (!level.hardcoremode && !util::function_fbce7263(self.owner.team, attacker.pers[#"team"]) && self.owner != attacker) {
                continue;
            }
        }
        if (watcher.stuntime > 0 && weapon.dostun) {
            self thread weaponobjects::stunstart(watcher, watcher.stuntime);
        }
        if (damage::friendlyfirecheck(self.owner, attacker)) {
            if (damagefeedback::dodamagefeedback(weapon, attacker)) {
                attacker damagefeedback::update();
            }
        }
        if (type == "MOD_MELEE" || weapon.isemp || weapon.destroysequipment) {
            self.damagetaken = damagemax;
        } else {
            self.damagetaken += damage;
        }
        if (self.damagetaken >= damagemax) {
            watcher thread weaponobjects::waitanddetonate(self, 0.05, attacker, weapon);
            return;
        }
    }
}

