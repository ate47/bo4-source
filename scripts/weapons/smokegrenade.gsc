// Atian COD Tools GSC decompiler test
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\sound_shared.gsc;

#namespace smokegrenade;

// Namespace smokegrenade/smokegrenade
// Params 0, eflags: 0x1 linked
// Checksum 0x9d8fca62, Offset: 0x150
// Size: 0x14c
function init_shared() {
    level.willypetedamageradius = 300;
    level.willypetedamageheight = 128;
    level.smokegrenadeduration = 8;
    level.smokegrenadedissipation = 4;
    level.smokegrenadetotaltime = level.smokegrenadeduration + level.smokegrenadedissipation;
    level.fx_smokegrenade_single = "smoke_center";
    level.smoke_grenade_triggers = [];
    clientfield::register("allplayers", "inenemysmoke", 14000, 1, "int");
    clientfield::register("allplayers", "insmoke", 16000, 2, "int");
    clientfield::register("scriptmover", "smoke_state", 16000, 1, "int");
    globallogic_score::function_5a241bd8(getweapon(#"eq_smoke"), &function_b4a975f1);
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x1 linked
// Checksum 0xd37cd3c3, Offset: 0x2a8
// Size: 0x6a
function function_79d42bea(weapon) {
    if (!isdefined(weapon.customsettings)) {
        return 128;
    }
    var_b0b958b3 = getscriptbundle(weapon.customsettings);
    return isdefined(var_b0b958b3.var_40dfefd1) ? var_b0b958b3.var_40dfefd1 : 128;
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x1 linked
// Checksum 0x33a14033, Offset: 0x320
// Size: 0x76
function function_f199623f(weapon) {
    if (!isdefined(weapon.customsettings)) {
        return level.smokegrenadeduration;
    }
    var_b0b958b3 = getscriptbundle(weapon.customsettings);
    return isdefined(var_b0b958b3.smokegrenadeduration) ? var_b0b958b3.smokegrenadeduration : level.smokegrenadeduration;
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x1 linked
// Checksum 0xc04cce68, Offset: 0x3a0
// Size: 0x76
function function_184e15d2(weapon) {
    if (!isdefined(weapon.customsettings)) {
        return level.smokegrenadedissipation;
    }
    var_b0b958b3 = getscriptbundle(weapon.customsettings);
    return isdefined(var_b0b958b3.smokegrenadedissipation) ? var_b0b958b3.smokegrenadedissipation : level.smokegrenadedissipation;
}

// Namespace smokegrenade/smokegrenade
// Params 5, eflags: 0x1 linked
// Checksum 0x272f4405, Offset: 0x420
// Size: 0x184
function watchsmokegrenadedetonation(owner, statweapon, smokeweapon, duration, totaltime) {
    self endon(#"trophy_destroyed");
    if (isplayer(owner)) {
        owner stats::function_e24eec31(statweapon, #"used", 1);
    }
    waitresult = undefined;
    waitresult = self waittill(#"explode", #"death");
    if (waitresult._notify != "explode") {
        return;
    }
    onefoot = vectorscale((0, 0, 1), 12);
    startpos = waitresult.position + onefoot;
    smokedetonate(owner, statweapon, smokeweapon, waitresult.position, function_79d42bea(smokeweapon), totaltime, duration);
    damageeffectarea(owner, startpos, smokeweapon.explosionradius, level.willypetedamageheight);
}

// Namespace smokegrenade/smokegrenade
// Params 7, eflags: 0x1 linked
// Checksum 0x67111e45, Offset: 0x5b0
// Size: 0x190
function smokedetonate(owner, statweapon, smokeweapon, position, radius, effectlifetime, smokeblockduration) {
    dir_up = (0, 0, 1);
    if (!isdefined(effectlifetime)) {
        effectlifetime = 10;
    }
    ent = spawntimedfx(smokeweapon, position, dir_up, int(effectlifetime));
    if (isdefined(owner)) {
        ent setteam(owner.team);
        if (isplayer(owner)) {
            ent setowner(owner);
        }
    }
    ent thread smokeblocksight(smokeweapon, radius);
    ent thread spawnsmokegrenadetrigger(smokeweapon, smokeblockduration, owner);
    if (isdefined(owner)) {
        owner.smokegrenadetime = gettime();
        owner.smokegrenadeposition = position;
    }
    thread playsmokesound(position, smokeblockduration, statweapon.projsmokestartsound, statweapon.projsmokeendsound, statweapon.projsmokeloopsound);
    return ent;
}

// Namespace smokegrenade/smokegrenade
// Params 4, eflags: 0x1 linked
// Checksum 0x4de25bf, Offset: 0x748
// Size: 0x94
function damageeffectarea(owner, position, radius, height) {
    effectarea = spawn("trigger_radius", position, 0, radius, height);
    if (isdefined(level.dogsonflashdogs)) {
        owner thread [[ level.dogsonflashdogs ]](effectarea);
    }
    effectarea delete();
}

// Namespace smokegrenade/smokegrenade
// Params 2, eflags: 0x1 linked
// Checksum 0x2b249640, Offset: 0x7e8
// Size: 0xd0
function smokeblocksight(smokeweapon, radius) {
    self endon(#"death");
    smokeradius = function_79d42bea(smokeweapon);
    while (1) {
        fxblocksight(self, radius);
        /#
            if (getdvarint(#"scr_smokegrenade_debug", 0)) {
                sphere(self.origin, smokeradius, (1, 0, 0), 0.25, 0, 10, 15);
            }
        #/
        wait(0.75);
    }
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x1 linked
// Checksum 0x4e105811, Offset: 0x8c0
// Size: 0x54
function waitanddelete(time) {
    self ghost();
    self endon(#"death");
    wait(time);
    self delete();
}

// Namespace smokegrenade/smokegrenade
// Params 3, eflags: 0x1 linked
// Checksum 0x8f7b3fa1, Offset: 0x920
// Size: 0x25c
function spawnsmokegrenadetrigger(smokeweapon, duration, owner) {
    team = self.team;
    radius = function_79d42bea(smokeweapon);
    trigger = spawn("trigger_radius", self.origin, 0, radius, radius);
    trigger.owner = owner;
    self.smoketrigger = trigger;
    anchor = spawn("script_model", self.origin);
    if (isdefined(owner)) {
        anchor setowner(owner);
        anchor setteam(owner.team);
    }
    anchor setmodel(#"tag_origin");
    self.anchor = anchor;
    if (!isdefined(level.smoke_grenade_triggers)) {
        level.smoke_grenade_triggers = [];
    } else if (!isarray(level.smoke_grenade_triggers)) {
        level.smoke_grenade_triggers = array(level.smoke_grenade_triggers);
    }
    level.smoke_grenade_triggers[level.smoke_grenade_triggers.size] = trigger;
    if (function_579815a1(smokeweapon)) {
        thread function_8b6ddd71(self, smokeweapon);
    }
    self waittilltimeout(duration, #"death");
    arrayremovevalue(level.smoke_grenade_triggers, trigger);
    if (isdefined(anchor)) {
        anchor thread waitanddelete(1);
        self.anchor = undefined;
    }
    if (isdefined(trigger)) {
        trigger delete();
    }
}

// Namespace smokegrenade/smokegrenade
// Params 5, eflags: 0x1 linked
// Checksum 0xed7c9a13, Offset: 0xb88
// Size: 0x276
function function_b4a975f1(attacker, victim, weapon, attackerweapon, meansofdeath) {
    if (!isdefined(attacker) || !isdefined(victim)) {
        return 0;
    }
    smoketrigger = victim function_367ce00e();
    if (isdefined(smoketrigger)) {
        if (attacker === smoketrigger.owner) {
            if (isdefined(attackerweapon) && attackerweapon !== level.var_8e2aec59) {
                if (isdefined(level.playgadgetsuccess) && !isdefined(smoketrigger.var_25db02aa)) {
                    smoketrigger.kills = (isdefined(smoketrigger.kills) ? smoketrigger.kills : 0) + 1;
                    if (isdefined(level.var_ac6052e9)) {
                        var_9194a036 = [[ level.var_ac6052e9 ]]("muteSmokeSuccessLineCount", 0);
                    }
                    if (smoketrigger.kills == (isdefined(var_9194a036) ? var_9194a036 : 3)) {
                        attacker [[ level.playgadgetsuccess ]](getweapon(#"eq_smoke"), undefined, victim, undefined);
                        smoketrigger.var_25db02aa = 1;
                    }
                }
            }
            return 1;
        } else if (isdefined(smoketrigger.owner) && isplayer(smoketrigger.owner) && isalive(smoketrigger.owner) && util::function_fbce7263(smoketrigger.owner.team, victim.team)) {
            if (level.teambased) {
                scoreevents::processscoreevent(#"smoke_assist", smoketrigger.owner, undefined, getweapon(#"eq_smoke"));
            }
        }
    }
    return 0;
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x1 linked
// Checksum 0xdcef04d, Offset: 0xe08
// Size: 0xb2
function function_367ce00e(var_7acab93a) {
    foreach (trigger in level.smoke_grenade_triggers) {
        if (self istouching(trigger)) {
            if (isdefined(var_7acab93a)) {
                if (var_7acab93a != trigger) {
                    return trigger;
                }
            } else {
                return trigger;
            }
        }
    }
    return undefined;
}

// Namespace smokegrenade/smokegrenade
// Params 2, eflags: 0x1 linked
// Checksum 0x7f7c9146, Offset: 0xec8
// Size: 0xd4
function function_4cc4db89(team, var_7acab93a) {
    foreach (trigger in level.smoke_grenade_triggers) {
        if (!trigger util::isenemyteam(team) && self istouching(trigger)) {
            if (isdefined(var_7acab93a)) {
                if (var_7acab93a != trigger) {
                    return trigger;
                }
            } else {
                return trigger;
            }
        }
    }
    return undefined;
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x1 linked
// Checksum 0x2a62a6c1, Offset: 0xfa8
// Size: 0x124
function function_50ef4b12(weapon) {
    if (getweapon(#"eq_smoke") == weapon.rootweapon) {
        return 1;
    }
    if (getweapon(#"willy_pete") == weapon.rootweapon) {
        return 1;
    }
    if (getweapon(#"hash_615e6c73989c85b4") == weapon.rootweapon) {
        return 1;
    }
    if (getweapon(#"hash_7a88daffaea7a9cf") == weapon.rootweapon) {
        return 1;
    }
    if (getweapon(#"spectre_grenade") == weapon.rootweapon) {
        return 1;
    }
    return 0;
}

// Namespace smokegrenade/smokegrenade
// Params 1, eflags: 0x5 linked
// Checksum 0x50f72a9c, Offset: 0x10d8
// Size: 0x80
function private function_579815a1(weapon) {
    if (!isdefined(weapon.customsettings)) {
        return 0;
    }
    var_e6fbac16 = getscriptbundle(weapon.customsettings);
    if (var_e6fbac16.var_8ceb6ac8 === 1) {
        return 1;
    }
    if (var_e6fbac16.var_6942aad6 === 1) {
        return 1;
    }
    return 0;
}

// Namespace smokegrenade/smokegrenade
// Params 2, eflags: 0x0
// Checksum 0xd19793c6, Offset: 0x1160
// Size: 0x17e
function function_87d0a127(grenadeent, smokeweapon) {
    if (!isdefined(grenadeent.smoketrigger)) {
        return;
    }
    grenadeteam = grenadeent.team;
    owner = grenadeent.smoketrigger.owner;
    while (1) {
        waitresult = undefined;
        waitresult = grenadeent waittilltimeout(0.25, #"death");
        if (isdefined(owner)) {
            if (isdefined(grenadeent) && isdefined(grenadeent.smoketrigger) && owner istouching(grenadeent.smoketrigger) && waitresult._notify == #"timeout") {
                owner clientfield::set("inenemysmoke", 1);
            } else {
                owner clientfield::set("inenemysmoke", 0);
            }
        }
        if (!isdefined(owner) || !isdefined(grenadeent) || waitresult._notify != "timeout") {
            break;
        }
    }
}

// Namespace smokegrenade/smokegrenade
// Params 2, eflags: 0x1 linked
// Checksum 0xb5509d2b, Offset: 0x12e8
// Size: 0x2f4
function function_8b6ddd71(grenadeent, smokeweapon) {
    if (!isdefined(grenadeent.smoketrigger)) {
        return;
    }
    grenadeteam = grenadeent.team;
    while (1) {
        waitresult = undefined;
        waitresult = grenadeent waittilltimeout(0.25, #"death");
        foreach (player in level.players) {
            curval = player clientfield::get("insmoke");
            if (isdefined(grenadeent) && isdefined(grenadeent.smoketrigger) && player istouching(grenadeent.smoketrigger) && waitresult._notify == #"timeout") {
                if (player util::isenemyteam(grenadeteam)) {
                    player clientfield::set("insmoke", curval | 1);
                } else {
                    player clientfield::set("insmoke", curval | 2);
                }
            } else {
                if (player util::isenemyteam(grenadeteam)) {
                    mask = 1;
                } else {
                    mask = 2;
                }
                if (curval & mask) {
                    trig = undefined;
                    if (isdefined(grenadeent)) {
                        trig = function_4cc4db89(grenadeteam, grenadeent.smoketrigger);
                    }
                    if (!isdefined(trig)) {
                        player clientfield::set("insmoke", curval & ~mask);
                    }
                }
            }
        }
        if (!isdefined(grenadeent) || waitresult._notify != "timeout" || !isdefined(grenadeent.smoketrigger) && grenadeent.item === getweapon(#"spectre_grenade")) {
            break;
        }
    }
}

// Namespace smokegrenade/grenade_fire
// Params 1, eflags: 0x40
// Checksum 0x342c8650, Offset: 0x15e8
// Size: 0x1ac
function event_handler[grenade_fire] function_debb0d4e(eventstruct) {
    weapon = eventstruct.weapon;
    if (!function_50ef4b12(weapon)) {
        return;
    }
    if (weapon.rootweapon == getweapon(#"eq_smoke")) {
        weapon_smoke = getweapon(#"eq_smoke");
    } else if (weapon.rootweapon == getweapon(#"spectre_grenade")) {
        weapon_smoke = getweapon(#"spectre_grenade");
    } else {
        weapon_smoke = getweapon(#"willy_pete");
    }
    duration = function_f199623f(weapon_smoke);
    totaltime = duration + function_184e15d2(weapon_smoke);
    grenade = eventstruct.projectile;
    if (grenade util::ishacked()) {
        return;
    }
    grenade thread watchsmokegrenadedetonation(self, weapon_smoke, weapon_smoke, duration, totaltime);
}

// Namespace smokegrenade/smokegrenade
// Params 5, eflags: 0x1 linked
// Checksum 0x6491d4bf, Offset: 0x17a0
// Size: 0x144
function playsmokesound(position, duration, startsound, stopsound, loopsound) {
    smokesound = spawn("script_origin", (0, 0, 1));
    if (isdefined(smokesound)) {
        smokesound endon(#"death");
        smokesound.origin = position;
        if (isdefined(startsound)) {
            smokesound playsound(startsound);
        }
        if (isdefined(loopsound)) {
            smokesound playloopsound(loopsound);
        }
        if (duration > 0.5) {
            wait(duration - 0.5);
        }
        if (isdefined(stopsound)) {
            thread sound::play_in_space(stopsound, position);
        }
        smokesound stoploopsound(0.5);
        wait(0.5);
        smokesound delete();
    }
}

