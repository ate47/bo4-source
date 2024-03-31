// Atian COD Tools GSC decompiler test
#using scripts\mp_common\userspawnselection.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\challenges.gsc;
#using scripts\mp_common\bb.gsc;
#using scripts\mp_common\teams\teams.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_record.gsc;
#using scripts\mp_common\player\player_damage.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\display_transition.gsc;
#using scripts\mp_common\gametypes\deathicons.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\weapons\weapons.gsc;
#using scripts\weapons\weapon_utils.gsc;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\player\player_role.gsc;
#using scripts\core_common\player\player_loadout.gsc;
#using scripts\core_common\platoons.gsc;
#using scripts\core_common\medals_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\match_record.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\globallogic\globallogic_vehicle.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\globallogic\globallogic_player.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\infection.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\audio_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;

#namespace player;

// Namespace player/player_killed
// Params 3, eflags: 0x0
// Checksum 0xa7de1e79, Offset: 0x698
// Size: 0x2ae
function function_df36a02d(attacker, weapon, mod) {
    if (isdefined(weapon)) {
        var_2f9ea2b9 = weapons::getbaseweapon(weapon);
        baseweaponindex = getbaseweaponitemindex(var_2f9ea2b9);
        self clientfield::set_player_uimodel("huditems.killedByItemIndex", baseweaponindex);
    } else {
        self clientfield::set_player_uimodel("huditems.killedByItemIndex", 0);
    }
    if (isdefined(attacker)) {
        self clientfield::set_player_uimodel("huditems.killedByEntNum", attacker getentitynumber());
    } else {
        self clientfield::set_player_uimodel("huditems.killedByEntNum", 15);
    }
    if (isdefined(mod)) {
        modindex = function_4a856ead(mod);
        if (mod != "MOD_META") {
            if (attacker === self) {
                modindex = function_4a856ead("MOD_SUICIDE");
            } else if (weapon === level.weaponnone) {
                modindex = function_4a856ead("MOD_UNKNOWN");
                self clientfield::set_player_uimodel("huditems.killedByEntNum", self getentitynumber());
            }
        }
        self clientfield::set_player_uimodel("huditems.killedByMOD", modindex);
    } else {
        self clientfield::set_player_uimodel("huditems.killedByEntNum", 15);
    }
    attachments = function_30d57f0e(weapon);
    self clientfield::set_player_uimodel("huditems.killedByAttachmentCount", attachments.size);
    for (var_20d65af5 = 0; var_20d65af5 < attachments.size && var_20d65af5 < 5; var_20d65af5++) {
        self clientfield::set_player_uimodel("huditems.killedByAttachment" + var_20d65af5, attachments[var_20d65af5]);
    }
}

// Namespace player/player_killed
// Params 1, eflags: 0x0
// Checksum 0xff984379, Offset: 0x950
// Size: 0x116
function function_7622d447(attacker) {
    if (isdefined(self.attackers)) {
        for (j = 0; j < self.attackers.size; j++) {
            player = self.attackers[j];
            if (self function_ca27b62b(attacker, player)) {
                damage_done = self.attackerdamage[player.clientid].damage;
                einflictor = self.attackerdamage[player.clientid].einflictor;
                weapon = self.attackerdamage[player.clientid].weapon;
                player function_b8871aa2(einflictor, self, damage_done, weapon);
            }
        }
    }
}

// Namespace player/player_killed
// Params 2, eflags: 0x0
// Checksum 0xfa76e3f3, Offset: 0xa70
// Size: 0x138
function function_ca27b62b(attacker, player) {
    if (!isdefined(player)) {
        return false;
    }
    if (isdefined(attacker) && player util::isenemyteam(attacker.team)) {
        return false;
    }
    if (self.attackerdamage[player.clientid].damage == 0) {
        return false;
    }
    if (isdefined(level.ekiaresetondeath) && level.ekiaresetondeath && isdefined(player.deathtime) && player.deathtime > self.attackerdamage[player.clientid].lastdamagetime) {
        return false;
    }
    if (isdefined(level.var_c77de7d6) && gettime() > int(level.var_c77de7d6 * 1000) + self.attackerdamage[player.clientid].lastdamagetime) {
        return false;
    }
    return true;
}

// Namespace player/player_killed
// Params 3, eflags: 0x0
// Checksum 0xee83462, Offset: 0xbb0
// Size: 0x26e
function function_284c61bd(attacker, meansofdeath, bledout = 0) {
    if (sessionmodeiswarzonegame()) {
        return;
    }
    if (isdefined(self.attackers) && isdefined(attacker)) {
        for (j = 0; j < self.attackers.size; j++) {
            player = self.attackers[j];
            if (!isdefined(player)) {
                continue;
            }
            if (player util::isenemyteam(attacker.team)) {
                continue;
            }
            if (self.attackerdamage[player.clientid].damage == 0) {
                continue;
            }
            if (isdefined(level.ekiaresetondeath) && level.ekiaresetondeath && isdefined(player.deathtime) && player.deathtime > self.attackerdamage[player.clientid].lastdamagetime) {
                continue;
            }
            if (isdefined(level.var_c77de7d6) && level.var_c77de7d6 && gettime() > int(level.var_c77de7d6 * 1000) + self.attackerdamage[player.clientid].lastdamagetime && !bledout) {
                continue;
            }
            einflictor = self.attackerdamage[player.clientid].einflictor;
            weapon = self.attackerdamage[player.clientid].weapon;
            if (player != attacker) {
                meansofdeath = self.attackerdamage[player.clientid].meansofdeath;
            }
            self function_4e3e8bee(einflictor, player, meansofdeath, weapon, attacker);
        }
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0xeaaf795e, Offset: 0xe28
// Size: 0xda
function private function_66cec679() {
    team = self.team;
    teammates = getplayers(team);
    foreach (player in teammates) {
        if (player == self) {
            continue;
        }
        if (player.sessionstate == "spectator") {
            player.spectatorclient = self getentitynumber();
        }
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0xb593dc4b, Offset: 0xf10
// Size: 0x176
function private function_448f7ed2() {
    if (isdefined(level.wave_spawn) && level.wave_spawn) {
        time = gettime();
        team = self.pers[#"team"];
        if (isdefined(team) && isdefined(level.lastwave) && isdefined(level.lastwave[team]) && isdefined(level.wavedelay) && isdefined(level.wavedelay[team])) {
            wavedelay = int(level.wavedelay[team] * 1000);
            lasttime = time - level.lastwave[team];
            timediff = wavedelay - lasttime;
            var_4e7f2872 = isdefined(level.var_75db41a7) && time >= level.var_75db41a7;
            if (timediff > 5000 && !var_4e7f2872) {
                return true;
            }
        }
    } else {
        return true;
    }
    return false;
}

// Namespace player/player_killed
// Params 10, eflags: 0x0
// Checksum 0x10161b5e, Offset: 0x1090
// Size: 0x3104
function callback_playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration, enteredresurrect = 0) {
    profilelog_begintiming(7, "ship");
    self endon(#"spawned");
    self.var_4ef33446 = smeansofdeath == "MOD_META";
    if (gamestate::is_game_over()) {
        post_game_death(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        return;
    }
    if (self.sessionteam == #"spectator") {
        return;
    }
    util::function_1ea0b2ce();
    level.var_445b1bca = gettime();
    self needsrevive(0);
    if (isdefined(self.burning) && self.burning == 1) {
        self setburn(0);
    }
    self.suicide = 0;
    self.teamkilled = 0;
    countdeath = !(isdefined(self.var_cee93f5) && self.var_cee93f5) && !self.var_4ef33446;
    if (countdeath) {
        if (!isdefined(self.var_a7d7e50a)) {
            self.var_a7d7e50a = 0;
        }
        level.deaths[self.team]++;
        self.var_a7d7e50a++;
        start_generator_captureshouldshowpain();
    }
    self callback::callback(#"on_player_killed");
    attacker callback::callback(#"on_killed_player");
    self thread globallogic_audio::flush_leader_dialog_key_on_player("equipmentDestroyed");
    weapon = update_weapon(einflictor, weapon);
    pixbeginevent(#"hash_47eb123ec5413349");
    self thread audio::function_30d4f8c4(attacker, smeansofdeath, weapon);
    wasinlaststand = 0;
    bledout = 0;
    deathtimeoffset = 0;
    attackerstance = undefined;
    self.laststandthislife = undefined;
    self.vattackerorigin = undefined;
    self function_df36a02d(attacker, weapon, smeansofdeath);
    weapon_at_time_of_death = self getcurrentweapon();
    var_8efc9727 = isplayer(attacker) && self util::isenemyplayer(attacker) == 0;
    var_41c4d474 = isplayer(attacker) && self == attacker;
    vattacker = isdefined(attacker) ? attacker : self;
    callbackparams = {#victimorigin:self.origin, #var_5fceefd4:self getplayerangles(), #victimweapon:self.currentweapon, #einflictor:einflictor, #attacker:attacker, #attackerorigin:vattacker.origin, #var_83634238:isplayer(vattacker.origin) ? vattacker getplayerangles() : vattacker.angles, #idamage:idamage, #smeansofdeath:smeansofdeath, #sweapon:weapon, #vdir:vdir, #shitloc:shitloc, #matchtime:function_f8d53445()};
    laststandparams = self.laststandparams;
    var_a1d415ee = self.var_a1d415ee;
    if (isdefined(self.uselaststandparams) && enteredresurrect == 0) {
        self.uselaststandparams = undefined;
        /#
            assert(isdefined(self.laststandparams));
        #/
        if (isdefined(self.laststandparams) && (!level.teambased || !isdefined(attacker) || !isplayer(attacker) || !var_8efc9727 || var_41c4d474)) {
            einflictor = self.laststandparams.einflictor;
            attacker = self.laststandparams.attacker;
            attackerstance = self.laststandparams.attackerstance;
            idamage = self.laststandparams.idamage;
            smeansofdeath = self.laststandparams.smeansofdeath;
            weapon = self.laststandparams.sweapon;
            vdir = self.laststandparams.vdir;
            shitloc = self.laststandparams.shitloc;
            self.vattackerorigin = self.laststandparams.vattackerorigin;
            self.killcam_entity_info_cached = self.laststandparams.killcam_entity_info_cached;
            if (!(isdefined(self.laststandparams.var_59b19c1b) && self.laststandparams.var_59b19c1b)) {
                deathtimeoffset = float(gettime() - self.laststandparams.laststandstarttime) / 1000;
            }
            bledout = self.laststandparams.bledout;
            wasinlaststand = 1;
            var_8efc9727 = isplayer(attacker) && self util::isenemyplayer(attacker) == 0;
            var_41c4d474 = isplayer(attacker) && self == attacker;
        }
    }
    params = {#einflictor:einflictor, #eattacker:attacker, #idamage:idamage, #smeansofdeath:smeansofdeath, #weapon:weapon, #vdir:vdir, #shitloc:shitloc, #psoffsettime:psoffsettime, #deathanimduration:deathanimduration, #laststandparams:laststandparams};
    self callback::callback(#"on_player_killed_with_params", params);
    self stopsounds();
    bestplayer = undefined;
    bestplayermeansofdeath = undefined;
    obituarymeansofdeath = undefined;
    bestplayerweapon = undefined;
    obituaryweapon = weapon;
    assistedsuicide = 0;
    if (isdefined(self.attackers) && (!isdefined(attacker) || attacker.classname === "trigger_hurt_new" || attacker.classname === "worldspawn" || isdefined(attacker.ismagicbullet) && attacker.ismagicbullet || attacker == self)) {
        if (!isdefined(bestplayer)) {
            for (i = 0; i < self.attackers.size; i++) {
                player = self.attackers[i];
                if (!isdefined(player)) {
                    continue;
                }
                if (!isdefined(self.attackerdamage[player.clientid]) || !isdefined(self.attackerdamage[player.clientid].damage)) {
                    continue;
                }
                if (var_41c4d474 || var_8efc9727) {
                    continue;
                }
                if (player == self) {
                    continue;
                }
                if (isdefined(level.var_c77de7d6) && gettime() > int(level.var_c77de7d6 * 1000) + self.attackerdamage[player.clientid].lastdamagetime) {
                    continue;
                }
                if (!globallogic_player::allowedassistweapon(self.attackerdamage[player.clientid].weapon)) {
                    continue;
                }
                if (self.attackerdamage[player.clientid].damage > 1 && !isdefined(bestplayer)) {
                    bestplayer = player;
                    bestplayermeansofdeath = self.attackerdamage[player.clientid].meansofdeath;
                    bestplayerweapon = self.attackerdamage[player.clientid].weapon;
                    continue;
                }
                if (isdefined(bestplayer) && self.attackerdamage[player.clientid].damage > self.attackerdamage[bestplayer.clientid].damage) {
                    bestplayer = player;
                    bestplayermeansofdeath = self.attackerdamage[player.clientid].meansofdeath;
                    bestplayerweapon = self.attackerdamage[player.clientid].weapon;
                }
            }
        }
        if (isdefined(bestplayer)) {
            scoreevents::processscoreevent(#"assisted_suicide", bestplayer, self, bestplayerweapon);
            self recordkillmodifier("assistedsuicide");
            assistedsuicide = 1;
        }
    }
    if (isdefined(bestplayer)) {
        attacker = bestplayer;
        obituarymeansofdeath = bestplayermeansofdeath;
        obituaryweapon = bestplayerweapon;
        if (isdefined(bestplayerweapon)) {
            weapon = bestplayerweapon;
        }
    }
    if (isdefined(attacker) && isplayer(attacker) && isdefined(self.clientid)) {
        if (!isdefined(attacker.damagedplayers)) {
            attacker.damagedplayers = [];
        }
        attacker.damagedplayers[self.clientid] = undefined;
    }
    if (enteredresurrect == 0) {
        globallogic::doweaponspecifickilleffects(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
    }
    self.deathtime = gettime();
    self.pers[#"deathtime"] = self.deathtime;
    if (!var_41c4d474 && !var_8efc9727) {
        /#
            assert(isdefined(self.lastspawntime));
        #/
        if (!isdefined(self.alivetimecurrentindex)) {
            self.alivetimecurrentindex = 0;
        }
        if (isdefined(self.lastspawntime)) {
            self.alivetimes[self.alivetimecurrentindex] = self.deathtime - self.lastspawntime;
        } else {
            self.alivetimes[self.alivetimecurrentindex] = 0;
        }
        self.alivetimecurrentindex = (self.alivetimecurrentindex + 1) % level.alivetimemaxcount;
    }
    attacker = update_attacker(attacker, weapon);
    einflictor = update_inflictor(einflictor);
    smeansofdeath = self function_b029639e(attacker, einflictor, weapon, smeansofdeath, shitloc);
    if (!isdefined(obituarymeansofdeath)) {
        obituarymeansofdeath = smeansofdeath;
    }
    self.hasriotshield = 0;
    self.hasriotshieldequipped = 0;
    self thread function_8826f676();
    var_a1f4d122 = undefined;
    if (isdefined(self.var_a1d415ee)) {
        if (isplayer(self.var_a1d415ee.attacker)) {
            var_a1f4d122 = self.var_a1d415ee.attacker;
        }
    }
    if (!self.var_4ef33446) {
        self function_abbc84ad(attacker, weapon, smeansofdeath, einflictor);
        self function_a3030357(attacker, einflictor, obituaryweapon, obituarymeansofdeath, var_a1f4d122);
    }
    if (wasinlaststand) {
        function_caabcf70(self, callbackparams, laststandparams, var_a1d415ee);
    }
    if (enteredresurrect == 0) {
        self.sessionstate = "dead";
        self.statusicon = "hud_status_dead";
    }
    self.pers[#"weapon"] = undefined;
    self.killedplayerscurrent = [];
    if (countdeath) {
        if (!isdefined(self.deathcount)) {
            self.deathcount = 0;
        }
        self.deathcount++;
    }
    /#
        println("controlLowLivesEnemy" + self.clientid + "teamkillerplaylistbanpenalty" + self.deathcount);
    #/
    if (bledout == 0) {
        self update_killstreaks(attacker, weapon);
    }
    lpselfnum = self getentitynumber();
    lpselfname = self.name;
    lpattackguid = "";
    lpattackname = "";
    lpselfteam = self.team;
    lpselfguid = self getguid();
    lpattackteam = "";
    lpattackorigin = (0, 0, 0);
    lpattacknum = -1;
    var_c8fa9c41 = 0;
    awardassists = 0;
    wasteamkill = 0;
    wassuicide = 0;
    pixendevent();
    if (countdeath) {
        scoreevents::processscoreevent(#"death", self, self, weapon);
    }
    if (isplayer(attacker)) {
        lpattackguid = attacker getguid();
        lpattackname = attacker.name;
        lpattackteam = attacker.team;
        lpattackorigin = attacker.origin;
        var_c8fa9c41 = attacker getxuid();
        if (attacker == self || assistedsuicide == 1) {
            if (countdeath) {
                dokillcam = 0;
                wassuicide = 1;
                awardassists = self suicide(einflictor, attacker, smeansofdeath, weapon, shitloc);
                if (assistedsuicide == 1) {
                    self function_284c61bd(attacker, smeansofdeath);
                }
                if (level.friendlyfire == 4) {
                    self team_kill(einflictor, attacker, smeansofdeath, weapon, shitloc);
                }
            }
        } else {
            pixbeginevent(#"hash_3c7e54851be0668");
            lpattacknum = attacker getentitynumber();
            dokillcam = 1;
            if (var_8efc9727 && smeansofdeath == "MOD_GRENADE" && level.friendlyfire == 0) {
            } else if (var_8efc9727) {
                wasteamkill = 1;
                self team_kill(einflictor, attacker, smeansofdeath, weapon, shitloc);
            } else {
                updatekillstreak(einflictor, attacker, weapon);
                if (bledout == 0 || level.var_7d1eeba9 === 1) {
                    self kill(einflictor, attacker, smeansofdeath, weapon, shitloc);
                    self function_284c61bd(attacker, smeansofdeath, bledout);
                }
                if (bledout == 0 || level.var_81ca6158 === 1) {
                    if (level.teambased) {
                        awardassists = 1;
                    }
                }
            }
            if ((smeansofdeath == "MOD_HEAD_SHOT" || smeansofdeath == "MOD_IMPACT" && shitloc == "head") && !wasteamkill && !isdefined(killstreaks::get_killstreak_for_weapon(weapon))) {
                scoreevents::processscoreevent(#"headshot", attacker, self, weapon);
                attacker contracts::player_contract_event(#"headshot");
            }
            pixendevent();
        }
    } else if (isdefined(attacker) && (attacker.classname == "trigger_hurt_new" || attacker.classname == "worldspawn")) {
        dokillcam = 0;
        lpattacknum = -1;
        var_c8fa9c41 = 0;
        lpattackguid = "";
        lpattackname = "";
        lpattackteam = "world";
        scoreevents::processscoreevent(#"suicide", self, undefined, undefined);
        self globallogic_score::incpersstat(#"suicides", 1);
        self.suicides = self globallogic_score::getpersstat(#"suicides");
        self.suicide = 1;
        thread battlechatter::on_player_suicide_or_team_kill(self, "suicide");
        awardassists = 1;
        self function_284c61bd(undefined, smeansofdeath);
        if (level.maxsuicidesbeforekick > 0 && level.maxsuicidesbeforekick <= self.suicides) {
            self notify(#"teamkillkicked");
            self function_3c238bc5();
        }
    } else {
        dokillcam = 0;
        lpattacknum = -1;
        var_c8fa9c41 = 0;
        lpattackguid = "";
        lpattackname = "";
        lpattackteam = "world";
        wassuicide = 1;
        if (isdefined(einflictor) && isdefined(einflictor.killcament)) {
            dokillcam = 1;
            lpattacknum = self getentitynumber();
            wassuicide = 0;
        }
        if (isdefined(attacker) && isdefined(attacker.team) && isdefined(level.teams[attacker.team])) {
            if (self util::isenemyteam(attacker.team)) {
                if (level.teambased) {
                    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
                        globallogic_score::giveteamscore("kill", attacker.team, attacker, self);
                    }
                }
                wassuicide = 0;
            }
        }
        awardassists = 1;
        self function_284c61bd(undefined, smeansofdeath);
    }
    if (isplayer(attacker) && isdefined(attacker.pers)) {
        if (attacker.pers[#"hash_49e7469988944ecf"] === 1) {
            if (weapon.statindex == level.weapon_hero_annihilator.statindex) {
                scoreevents::processscoreevent(#"hash_39926f44fa76b382", attacker, self, weapon);
                attacker.pers[#"hash_49e7469988944ecf"] = undefined;
            }
        }
    }
    if (!level.ingraceperiod && enteredresurrect == 0) {
        if (smeansofdeath != "MOD_FALLING") {
            if (weapon.name != "incendiary_fire") {
                self weapons::drop_scavenger_for_death(attacker);
            }
        }
        if (should_drop_weapon_on_death(wasteamkill, wassuicide, weapon_at_time_of_death, smeansofdeath)) {
            self weapons::drop_for_death(attacker, weapon, smeansofdeath, 0);
        }
    }
    if (awardassists) {
        self function_48a1200f(einflictor, attacker, weapon, lpattackteam);
    }
    pixbeginevent(#"hash_6f37a114f9261138");
    self.lastattacker = attacker;
    self.lastdeathpos = self.origin;
    if (isdefined(attacker) && isplayer(attacker) && !var_41c4d474 && !var_8efc9727) {
        attacker notify(#"killed_enemy_player", {#victim:self, #weapon:weapon, #time:gettime()});
        self thread challenges::playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc, attackerstance, bledout);
    } else {
        self notify(#"playerkilledchallengesprocessed");
    }
    killerheropoweractive = 0;
    killer = undefined;
    killerloadoutindex = -1;
    killerwasads = 0;
    killerinvictimfov = 0;
    victiminkillerfov = 0;
    victimspecialist = function_b14806c6(self player_role::get(), currentsessionmode());
    if (isplayer(attacker)) {
        attackerspecialist = function_b14806c6(attacker player_role::get(), currentsessionmode());
        attacker.lastkilltime = gettime();
        killer = attacker;
        killerloadoutindex = attacker.class_num;
        killerwasads = attacker playerads() >= 1;
        killerinvictimfov = util::within_fov(self.origin, self.angles, attacker.origin, self.fovcosine);
        victiminkillerfov = util::within_fov(attacker.origin, attacker.angles, self.origin, attacker.fovcosine);
        if (attacker ability_player::is_using_any_gadget()) {
            killerheropoweractive = 1;
        }
        var_c144d535 = isdefined(self.currentweapon) ? self.currentweapon.name : "";
        if (killstreaks::is_killstreak_weapon(weapon)) {
            killstreak = killstreaks::get_killstreak_for_weapon_for_stats(weapon);
            bb::function_c3b9e07f(attacker, lpattackorigin, attackerspecialist, weapon.name, self, self.origin, victimspecialist, var_c144d535, idamage, smeansofdeath, shitloc, 1, killerheropoweractive, killstreak);
        } else {
            bb::function_c3b9e07f(attacker, lpattackorigin, attackerspecialist, weapon.name, self, self.origin, victimspecialist, var_c144d535, idamage, smeansofdeath, shitloc, 1, killerheropoweractive, undefined);
        }
    } else {
        bb::function_c3b9e07f(undefined, undefined, undefined, weapon.name, self, self.origin, victimspecialist, undefined, idamage, smeansofdeath, shitloc, 1, 0, undefined);
    }
    victimweapon = undefined;
    victimweaponpickedup = 0;
    victimkillstreakweaponindex = 0;
    var_8926cc9f = 0;
    if (isdefined(weapon_at_time_of_death)) {
        victimweapon = weapon_at_time_of_death;
        if (isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[victimweapon])) {
            victimweaponpickedup = 1;
        }
        if (killstreaks::is_killstreak_weapon(victimweapon)) {
            killstreak = killstreaks::get_killstreak_for_weapon_for_stats(victimweapon);
            if (isdefined(level.killstreaks[killstreak].menuname)) {
                var_8926cc9f = 1;
                victimkillstreakweaponindex = level.killstreakindices[level.killstreaks[killstreak].menuname];
                if (!isdefined(victimkillstreakweaponindex)) {
                    var_8926cc9f = 0;
                    victimkillstreakweaponindex = 0;
                }
            }
        }
    }
    victimwasads = self playerads() >= 1;
    victimheropoweractive = self ability_player::is_using_any_gadget();
    killerweaponpickedup = 0;
    killerkillstreakweaponindex = 0;
    var_28af8061 = 0;
    if (isdefined(weapon)) {
        if (isdefined(killer) && isdefined(killer.pickedupweapons) && isdefined(killer.pickedupweapons[weapon])) {
            killerweaponpickedup = 1;
        }
        if (killstreaks::is_killstreak_weapon(weapon)) {
            killstreak = killstreaks::get_killstreak_for_weapon_for_stats(weapon);
            if (isdefined(level.killstreaks[killstreak].menuname)) {
                var_28af8061 = 1;
                killerkillstreakweaponindex = level.killstreakindices[level.killstreaks[killstreak].menuname];
                if (!isdefined(killerkillstreakweaponindex)) {
                    var_28af8061 = 0;
                    killerkillstreakweaponindex = 0;
                }
            }
        }
    }
    paramstruct = spawnstruct();
    paramstruct.victimloadoutindex = self.class_num;
    paramstruct.victimweaponpickedup = victimweaponpickedup;
    paramstruct.victimwasads = victimwasads;
    paramstruct.killerloadoutindex = killerloadoutindex;
    paramstruct.killerweaponpickedup = killerweaponpickedup;
    paramstruct.killerwasads = killerwasads;
    paramstruct.victimheropoweractive = victimheropoweractive;
    paramstruct.killerheropoweractive = killerheropoweractive;
    paramstruct.victiminkillerfov = victiminkillerfov;
    paramstruct.killerinvictimfov = killerinvictimfov;
    paramstruct.killerkillstreakweaponindex = killerkillstreakweaponindex;
    paramstruct.victimkillstreakweaponindex = victimkillstreakweaponindex;
    paramstruct.var_28af8061 = var_28af8061;
    paramstruct.var_8926cc9f = var_8926cc9f;
    matchrecordlogadditionaldeathinfo(self, killer, victimweapon, weapon, paramstruct);
    self player_record::record_special_move_data_for_life(killer);
    self.pickedupweapons = [];
    self.switching_teams = undefined;
    self.joining_team = undefined;
    self.leaving_team = undefined;
    attackerstring = "none";
    if (isplayer(attacker)) {
        attackerstring = attacker getxuid() + "(" + lpattackname + ")";
    }
    /#
        print("<unknown string>" + smeansofdeath + "<unknown string>" + weapon.name + "<unknown string>" + attackerstring + "<unknown string>" + idamage + "<unknown string>" + shitloc + "<unknown string>" + int(self.origin[0]) + "<unknown string>" + int(self.origin[1]) + "<unknown string>" + int(self.origin[2]));
    #/
    level thread globallogic::updateteamstatus();
    level thread globallogic::updatealivetimes(self.team);
    self thread function_395ef176();
    if (isdefined(self.killcam_entity_info_cached)) {
        killcam_entity_info = self.killcam_entity_info_cached;
        self.killcam_entity_info_cached = undefined;
    } else {
        killcam_entity_info = killcam::get_killcam_entity_info(attacker, einflictor, weapon);
    }
    if (isdefined(self.killstreak_delay_killcam)) {
        dokillcam = 0;
    }
    self weapons::detach_carry_object_model();
    pixendevent();
    pixbeginevent(#"hash_6a07afbdee38d766");
    vattackerorigin = undefined;
    if (isdefined(attacker)) {
        vattackerorigin = attacker.origin;
    }
    if (enteredresurrect == 0) {
        clone_weapon = weapon;
        if (weapon_utils::ismeleemod(smeansofdeath) && clone_weapon.type != "melee") {
            clone_weapon = level.weaponnone;
        }
        body = self cloneplayer(deathanimduration, clone_weapon, attacker, vdir);
        if (isdefined(body) && !level.inprematchperiod) {
            self create_body(attacker, idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, body);
            self battlechatter::play_death_vox(body, attacker, weapon, smeansofdeath);
            if (isdefined(var_a1d415ee)) {
                globallogic::doweaponspecificcorpseeffects(body, var_a1d415ee.einflictor, var_a1d415ee.attacker, var_a1d415ee.idamage, var_a1d415ee.smeansofdeath, var_a1d415ee.sweapon, var_a1d415ee.vdir, var_a1d415ee.shitloc, psoffsettime);
            } else if (!isdefined(laststandparams) || !(isdefined(laststandparams.bledout) && laststandparams.bledout)) {
                globallogic::doweaponspecificcorpseeffects(body, einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime);
            }
        }
    }
    pixendevent();
    if (enteredresurrect) {
        thread globallogic_spawn::spawnqueuedclient(self.team, attacker);
    }
    self function_ff3ec0d4(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
    self function_7622d447();
    self.laststandparams = undefined;
    self.var_a1d415ee = undefined;
    if (isdefined(self.attackers)) {
        self.attackers = [];
    }
    self.wantsafespawn = 0;
    perks = [];
    killstreaks = globallogic::getkillstreaks(attacker);
    if (!isdefined(self.killstreak_delay_killcam)) {
        self thread [[ level.spawnplayerprediction ]]();
    }
    profilelog_endtiming(7, "gs=" + game.state);
    self thread killcam::function_eb3deeec(lpattacknum, self getentitynumber(), killcam_entity_info, weapon, smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, attacker);
    if (wasteamkill == 0 && assistedsuicide == 0 && smeansofdeath != "MOD_SUICIDE" && !(!isdefined(attacker) || attacker.classname == "trigger_hurt_new" || attacker.classname == "worldspawn" || attacker == self || isdefined(attacker.disablefinalkillcam))) {
        level thread killcam::record_settings(lpattacknum, self getentitynumber(), killcam_entity_info, weapon, smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, attacker);
        if (level.gametype === "bounty") {
            if (isdefined(var_a1f4d122)) {
                level thread potm::function_5523a49a(#"bh_kill", lpattacknum, var_c8fa9c41, self, killcam_entity_info, weapon, smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, var_a1f4d122, einflictor);
            }
        } else {
            level thread potm::function_5523a49a(#"kill", lpattacknum, var_c8fa9c41, self, killcam_entity_info, weapon, smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, perks, killstreaks, attacker, einflictor);
        }
    }
    if (enteredresurrect) {
        return;
    }
    if (!self.var_4ef33446) {
        if (isdefined(self.var_342564dd) && self.var_342564dd && self == attacker) {
            waitframe(1);
        } else {
            wait(0.25);
        }
    }
    weaponclass = util::getweaponclass(weapon);
    if (isdefined(weaponclass) && weaponclass == #"weapon_sniper") {
        self thread battlechatter::killed_by_sniper(attacker);
    } else {
        self thread battlechatter::player_killed(attacker, killstreak, einflictor, weapon, smeansofdeath);
    }
    self.cancelkillcam = 0;
    if (isdefined(self.killstreak_delay_killcam)) {
        dokillcam = 0;
    }
    if (!userspawnselection::isspawnselectenabled()) {
        self thread killcam::cancel_on_use();
    }
    if (!self.var_4ef33446) {
        self watch_death(weapon, attacker, smeansofdeath, deathanimduration);
    } else {
        dokillcam = 0;
    }
    /#
        if (getdvarint(#"scr_forcekillcam", 0) != 0) {
            dokillcam = 1;
            if (lpattacknum < 0) {
                lpattacknum = self getentitynumber();
                var_c8fa9c41 = 0;
            }
        }
    #/
    if (self.currentspectatingclient != -1 && level.spectatetype == 4 && self.pers[#"team"] != #"spectator") {
        function_39a7df61(self);
    }
    keep_deathcam = 0;
    self.respawntimerstarttime = gettime();
    if (sessionmodeiswarzonegame()) {
        self.var_686890d5 = undefined;
        if (!gamestate::is_game_over()) {
            if (teams::is_all_dead(self.team)) {
                self function_66cec679();
                if (!platoons::function_382a49e0()) {
                    self thread display_transition::function_1caf5c87(self.team);
                }
            } else if (function_73da2f89()) {
                if (self function_448f7ed2()) {
                    self thread display_transition::function_b3964dc9();
                }
            } else {
                self thread display_transition::function_9b2bd02c();
            }
        }
        self.sessionstate = "dead";
        self.spectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self.spectatekillcam = 0;
        dokillcam = 0;
        livesleft = !(level.numlives && !self.pers[#"lives"]) && !(level.numteamlives && !game.lives[self.team]);
        if (livesleft) {
            if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn) {
                self thread [[ level.spawnspectator ]](self.origin + vectorscale((0, 0, 1), 60), self.angles);
            } else {
                function_93115f65();
            }
            return;
        }
        if (!(isdefined(self.var_686890d5) && self.var_686890d5)) {
            self thread [[ level.spawnspectator ]](self.origin + vectorscale((0, 0, 1), 60), self.angles);
        }
        return;
    } else {
        if (game.state != "playing") {
            return;
        }
        if (isdefined(self.overrideplayerdeadstatus)) {
            keep_deathcam = self [[ self.overrideplayerdeadstatus ]]();
        }
    }
    if (!self.cancelkillcam && dokillcam && level.killcam && wasteamkill == 0) {
        self clientfield::set_player_uimodel("hudItems.killcamActive", 1);
        livesleft = !(level.numlives && !self.pers[#"lives"]) && !(level.numteamlives && !game.lives[self.team]);
        timeuntilspawn = globallogic_spawn::timeuntilspawn(1);
        willrespawnimmediately = livesleft && timeuntilspawn <= 0 && !level.playerqueuedrespawn && !userspawnselection::isspawnselectenabled();
        self killcam::killcam(lpattacknum, self getentitynumber(), killcam_entity_info, weapon, smeansofdeath, self.deathtime, deathtimeoffset, psoffsettime, willrespawnimmediately, globallogic_utils::timeuntilroundend(), perks, killstreaks, attacker, keep_deathcam);
        if (sessionmodeiswarzonegame()) {
            self luinotifyevent(#"hash_5b2d65a026de792d", 0);
        }
    } else if (self.cancelkillcam) {
        if (isdefined(self.killcamsskipped)) {
            self.killcamsskipped++;
        } else {
            self.killcamsskipped = 1;
        }
    }
    self clientfield::set_player_uimodel("hudItems.killcamActive", 0);
    self function_7b0f4389();
    if (self.var_4ef33446) {
        waitframe(1);
    }
    secondary_deathcam = 0;
    timeuntilspawn = globallogic_spawn::timeuntilspawn(1);
    shoulddoseconddeathcam = timeuntilspawn > 0;
    if (shoulddoseconddeathcam && isdefined(self.secondarydeathcamtime)) {
        secondary_deathcam = self [[ self.secondarydeathcamtime ]]();
    }
    if (secondary_deathcam > 0 && !self.cancelkillcam) {
        self.spectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self.spectatekillcam = 0;
        globallogic_utils::waitfortimeornotify(secondary_deathcam, "end_death_delay");
        self notify(#"death_delay_finished");
    }
    if (!self.cancelkillcam && dokillcam && level.killcam && keep_deathcam) {
        self.sessionstate = "dead";
        self.spectatorclient = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self.spectatekillcam = 0;
    }
    function_93115f65();
}

// Namespace player/player_killed
// Params 0, eflags: 0x0
// Checksum 0xd51ef74, Offset: 0x41a0
// Size: 0x90
function function_d5c8119d() {
    var_8e3c3c5b = level.deathcircles.size - 1;
    if (var_8e3c3c5b < 0) {
        return false;
    }
    if (level.deathcircleindex === var_8e3c3c5b) {
        return (isdefined(level.deathcircle.scaling) && level.deathcircle.scaling || level.deathcircle.radius <= 0);
    }
    return false;
}

// Namespace player/player_killed
// Params 0, eflags: 0x0
// Checksum 0x7a5cebf4, Offset: 0x4238
// Size: 0x38
function function_9956f107() {
    if (isdefined(level.deathcircle) && !isdefined(level.deathcircle.nextcircle)) {
        return true;
    }
    return false;
}

// Namespace player/player_killed
// Params 0, eflags: 0x0
// Checksum 0xe911c4e7, Offset: 0x4278
// Size: 0x102
function function_73da2f89() {
    if (game.state != "pregame" && game.state != "playing") {
        return 0;
    }
    if (!infection::function_74650d7()) {
        if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn) {
            if (function_d5c8119d()) {
                return 0;
            }
            if (isdefined(level.var_78442886) && isdefined(level.var_245d4af9) && level.var_78442886 >= level.var_245d4af9) {
                return 0;
            }
        }
        if (isdefined(level.wave_spawn) && level.wave_spawn && function_9956f107()) {
            return 0;
        }
    }
    return globallogic_spawn::function_38527849();
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0xde6f117a, Offset: 0x4388
// Size: 0x15e
function private function_93115f65() {
    if (game.state != "playing") {
        self.sessionstate = "dead";
        self.spectatorclient = -1;
        self.killcamtargetentity = -1;
        self.killcamentity = -1;
        self.archivetime = 0;
        self.psoffsettime = 0;
        self.spectatekillcam = 0;
        return;
    }
    function_f9dc085a();
    userespawntime = 1;
    if (isdefined(level.hostmigrationtimer)) {
        userespawntime = 0;
    }
    hostmigration::waittillhostmigrationcountdown();
    if (globallogic_utils::isvalidclass(self.curclass) || !loadout::function_87bcb1b()) {
        timepassed = undefined;
        if (isdefined(self.respawntimerstarttime) && userespawntime) {
            timepassed = float(gettime() - self.respawntimerstarttime) / 1000;
        }
        self thread [[ level.spawnclient ]](timepassed);
        self.respawntimerstarttime = undefined;
    }
}

// Namespace player/player_killed
// Params 4, eflags: 0x4
// Checksum 0xfb8ad2f4, Offset: 0x44f0
// Size: 0x37c
function private function_caabcf70(victim, callbackparams, laststandparams, var_a1d415ee) {
    /#
        assert(isdefined(victim));
    #/
    /#
        assert(isdefined(callbackparams));
    #/
    if (!isdefined(victim) || !isdefined(callbackparams)) {
        return;
    }
    var_f53d817d = isdefined(laststandparams) ? laststandparams : callbackparams;
    var_ee2f4691 = isdefined(var_a1d415ee) ? var_a1d415ee : callbackparams;
    function_ad11630f(victim, var_f53d817d.victimorigin, var_f53d817d.var_5fceefd4, var_f53d817d.victimweapon, var_f53d817d.attacker, var_f53d817d.attackerorigin, var_f53d817d.var_83634238, var_f53d817d.sweapon, var_f53d817d.matchtime, var_f53d817d.shitloc, var_f53d817d.smeansofdeath, var_ee2f4691.attacker, var_ee2f4691.attackerorigin, var_ee2f4691.var_83634238, var_ee2f4691.sweapon, var_ee2f4691.matchtime, var_ee2f4691.shitloc, var_ee2f4691.smeansofdeath);
    lifeindex = victim match_record::get_player_stat(#"hash_ec4aea1a8bbd82");
    if (isdefined(lifeindex) && isdefined(victim) && isplayer(victim)) {
        victimindex = victim match_record::get_player_index();
        if (isdefined(victimindex)) {
            match_record::set_stat(#"lives", lifeindex, #"player_index", victimindex);
        }
        if (isdefined(var_f53d817d) && isdefined(var_f53d817d.attacker) && isplayer(var_f53d817d.attacker)) {
            attackerindex = var_f53d817d.attacker match_record::get_player_index();
            if (isdefined(attackerindex)) {
                match_record::set_stat(#"lives", lifeindex, #"attacker_index", attackerindex);
            }
        }
        if (isdefined(var_ee2f4691) && isdefined(var_ee2f4691.attacker) && isplayer(var_ee2f4691.attacker)) {
            killerindex = var_ee2f4691.attacker match_record::get_player_index();
            if (isdefined(killerindex)) {
                match_record::set_stat(#"lives", lifeindex, #"killer_index", killerindex);
            }
        }
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x11cd057a, Offset: 0x4878
// Size: 0x18c
function private function_7b0f4389() {
    self.var_eca4c67f = 0;
    if (userspawnselection::isspawnselectenabled() && !(isdefined(self.switching_teams) && self.switching_teams) && self globallogic_spawn::mayspawn()) {
        while (!self function_d1be915f()) {
            waitframe(1);
        }
        showmenu = self userspawnselection::shouldshowspawnselectionmenu();
        if (showmenu) {
            if (isdefined(self.predicted_spawn_point)) {
                self setorigin(self.predicted_spawn_point.origin);
                self setplayerangles(self.predicted_spawn_point.angles);
            }
            specialistindex = self player_role::get();
            if (player_role::is_valid(specialistindex)) {
                self.var_eca4c67f = 1;
                self userspawnselection::function_b55c5868();
                self userspawnselection::waitforspawnselection();
            }
            return;
        }
        self userspawnselection::activatespawnselectionmenu();
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0xa67e2a0e, Offset: 0x4a10
// Size: 0x38
function private function_d1be915f() {
    if (self isremotecontrolling()) {
        return false;
    }
    if (isdefined(self.killstreak_delay_killcam)) {
        return false;
    }
    return true;
}

// Namespace player/player_killed
// Params 4, eflags: 0x4
// Checksum 0x1634faf1, Offset: 0x4a50
// Size: 0x116
function private watch_death(weapon, attacker, smeansofdeath, deathanimduration) {
    defaultplayerdeathwatchtime = 1.75;
    if (smeansofdeath == "MOD_MELEE_ASSASSINATE" || 0 > weapon.deathcamtime) {
        defaultplayerdeathwatchtime = deathanimduration * 0.001 + 0.5;
    } else if (0 < weapon.deathcamtime) {
        defaultplayerdeathwatchtime = weapon.deathcamtime;
    }
    if (isdefined(level.overrideplayerdeathwatchtimer)) {
        defaultplayerdeathwatchtime = [[ level.overrideplayerdeathwatchtimer ]](defaultplayerdeathwatchtime);
    }
    if (!(isdefined(self.var_342564dd) && self.var_342564dd && self == attacker)) {
        globallogic_utils::waitfortimeornotify(defaultplayerdeathwatchtime, "end_death_delay");
    }
    self notify(#"death_delay_finished");
}

// Namespace player/player_killed
// Params 5, eflags: 0x4
// Checksum 0x5a476565, Offset: 0x4b70
// Size: 0x10e
function private function_b029639e(attacker, einflictor, weapon, smeansofdeath, shitloc) {
    if (globallogic_utils::isheadshot(weapon, shitloc, smeansofdeath, einflictor) && isplayer(attacker) && !weapon_utils::ismeleemod(smeansofdeath)) {
        return "MOD_HEAD_SHOT";
    }
    switch (weapon.name) {
    case #"dog_bite":
        smeansofdeath = "MOD_PISTOL_BULLET";
        break;
    case #"destructible_car":
        smeansofdeath = "MOD_EXPLOSIVE";
        break;
    case #"explodable_barrel":
        smeansofdeath = "MOD_EXPLOSIVE";
        break;
    }
    return smeansofdeath;
}

// Namespace player/player_killed
// Params 2, eflags: 0x4
// Checksum 0x14aeb3dc, Offset: 0x4c88
// Size: 0x434
function private update_killstreaks(attacker, weapon) {
    if (!isdefined(self.switching_teams) && !self.var_4ef33446) {
        if (isplayer(attacker) && level.teambased && attacker != self && !self util::isenemyteam(attacker.team)) {
            self.pers[#"cur_kill_streak"] = 0;
            self.pers[#"cur_total_kill_streak"] = 0;
            self.pers[#"totalkillstreakcount"] = 0;
            self.pers[#"killstreaksearnedthiskillstreak"] = 0;
            self setplayercurrentstreak(0);
        } else {
            if (!(isdefined(self.var_cee93f5) && self.var_cee93f5)) {
                self globallogic_score::incpersstat(#"deaths", 1, 1, 1);
            }
            self.deaths = self globallogic_score::getpersstat(#"deaths");
            self updatestatratio("kdratio", "kills", "deaths");
            if (self.pers[#"cur_kill_streak"] > self.pers[#"best_kill_streak"]) {
                self.pers[#"best_kill_streak"] = self.pers[#"cur_kill_streak"];
            }
            self.pers[#"kill_streak_before_death"] = self.pers[#"cur_kill_streak"];
            if (isdefined(self.pers[#"hvo"]) && isdefined(self.pers[#"hvo"][#"current"])) {
                self.pers[#"hvo"][#"current"][#"highestkillstreak"] = 0;
            }
            self.pers[#"cur_kill_streak"] = 0;
            self.pers[#"cur_total_kill_streak"] = 0;
            self.pers[#"totalkillstreakcount"] = 0;
            self.pers[#"killstreaksearnedthiskillstreak"] = 0;
            self setplayercurrentstreak(0);
            if (isdefined(self.cur_death_streak)) {
                self.cur_death_streak++;
                if (self.cur_death_streak >= getdvarint(#"perk_deathstreakcountrequired", 0)) {
                    self enabledeathstreak();
                }
            }
        }
    } else {
        self.pers[#"cur_kill_streak"] = 0;
        self.pers[#"cur_total_kill_streak"] = 0;
        self.pers[#"totalkillstreakcount"] = 0;
        self.pers[#"killstreaksearnedthiskillstreak"] = 0;
        self setplayercurrentstreak(0);
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        level.globalkillstreaksdeathsfrom++;
    }
}

// Namespace player/player_killed
// Params 4, eflags: 0x4
// Checksum 0xa0d833ef, Offset: 0x50c8
// Size: 0x3fc
function private function_abbc84ad(attacker, weapon, smeansofdeath, inflictor) {
    if (isplayer(attacker) && attacker != self && (!level.teambased || self util::isenemyteam(attacker.team))) {
        attackerweaponpickedup = 0;
        if (isdefined(attacker.pickedupweapons) && isdefined(attacker.pickedupweapons[weapon])) {
            attackerweaponpickedup = 1;
        }
        self stats::function_eec52333(weapon, #"deaths", 1, self.class_num, attackerweaponpickedup);
        victim_weapon = self.lastdroppableweapon;
        if (isdefined(victim_weapon)) {
            victimweaponpickedup = 0;
            if (isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[victim_weapon])) {
                victimweaponpickedup = 1;
            }
            self stats::function_eec52333(victim_weapon, #"deathsduringuse", 1, self.class_num, victimweaponpickedup);
        }
        recordweaponstatkills = 1;
        if (attacker.isthief === 1 && isdefined(weapon) && weapon.isheroweapon === 1) {
            recordweaponstatkills = 0;
        }
        if (smeansofdeath != "MOD_FALLING" && recordweaponstatkills) {
            if (weapon.name == #"explosive_bolt" && isdefined(inflictor) && isdefined(inflictor.ownerweaponatlaunch) && inflictor.owneradsatlaunch) {
                inflictorownerweaponatlaunchpickedup = 0;
                if (isdefined(attacker.pickedupweapons) && isdefined(attacker.pickedupweapons[inflictor.ownerweaponatlaunch])) {
                    inflictorownerweaponatlaunchpickedup = 1;
                }
                attacker stats::function_eec52333(inflictor.ownerweaponatlaunch, #"kills", 1, attacker.class_num, inflictorownerweaponatlaunchpickedup, 1);
            } else {
                attacker stats::function_eec52333(weapon, #"kills", 1, attacker.class_num, attackerweaponpickedup);
            }
        }
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            attacker stats::function_eec52333(weapon, #"headshots", 1, attacker.class_num, attackerweaponpickedup);
        }
        if (smeansofdeath == "MOD_PROJECTILE") {
            attacker stats::function_e24eec31(weapon, #"direct_hit_kills", 1);
        }
        victimisroulette = self.isroulette === 1;
        if (self ability_player::gadget_checkheroabilitykill(attacker) && !victimisroulette) {
            attacker stats::function_e24eec31(attacker.heroability, #"kills_while_active", 1);
        }
    }
}

// Namespace player/player_killed
// Params 5, eflags: 0x0
// Checksum 0xf08eae7, Offset: 0x54d0
// Size: 0x534
function function_a3030357(attacker, einflictor, weapon, smeansofdeath, var_bee367e6 = undefined) {
    if (sessionmodeiswarzonegame()) {
        return;
    }
    if (smeansofdeath == "MOD_META") {
        return;
    }
    if (!isplayer(attacker) || self util::isenemyplayer(attacker) == 0 || isdefined(weapon) && killstreaks::is_killstreak_weapon(weapon)) {
        level notify(#"reset_obituary_count");
        level.lastobituaryplayercount = 0;
        level.lastobituaryplayer = undefined;
    } else {
        if (isdefined(level.lastobituaryplayer) && level.lastobituaryplayer == attacker) {
            level.lastobituaryplayercount++;
        } else {
            level notify(#"reset_obituary_count");
            level.lastobituaryplayer = attacker;
            level.lastobituaryplayercount = 1;
        }
        level thread scoreevents::decrementlastobituaryplayercountafterfade();
        if (level.lastobituaryplayercount >= 4) {
            level notify(#"reset_obituary_count");
            level.lastobituaryplayercount = 0;
            level.lastobituaryplayer = undefined;
            self thread scoreevents::uninterruptedobitfeedkills(attacker, weapon);
        }
    }
    overrideentitycamera = function_c0f28ff9(attacker, weapon);
    var_50d1e41a = potm::function_775b9ad1(weapon, smeansofdeath);
    var_e9d49a33 = 0;
    if (isdefined(weapon) && killstreaks::is_killstreak_weapon(weapon)) {
        var_e9d49a33 = 1;
    }
    if (isdefined(einflictor) && (isdefined(einflictor.var_e9d49a33) && einflictor.var_e9d49a33 || isdefined(einflictor.owner) && isdefined(einflictor.owner.var_e9d49a33) && einflictor.owner.var_e9d49a33)) {
        var_e9d49a33 = 1;
    }
    var_f87dccb5 = self util::isenemyteam(attacker.team);
    if (self != attacker && !var_f87dccb5) {
        var_e9d49a33 = 1;
    }
    if (isdefined(einflictor) && einflictor.archetype === "robot") {
        if (smeansofdeath == "MOD_HIT_BY_OBJECT") {
            weapon = getweapon(#"combat_robot_marker");
        }
        smeansofdeath = "MOD_RIFLE_BULLET";
    }
    if (level.teambased && isdefined(attacker.pers) && !var_f87dccb5 && smeansofdeath == "MOD_GRENADE" && level.friendlyfire == 0) {
        obituary(self, self, weapon, smeansofdeath);
        demo::kill_bookmark(self, self, einflictor, var_50d1e41a, overrideentitycamera);
        if (!var_e9d49a33) {
            if (level.gametype === "bounty") {
                potm::function_66d09fea(#"bh_kill", self, self, einflictor, var_50d1e41a, overrideentitycamera);
            } else {
                potm::kill_bookmark(self, self, einflictor, var_50d1e41a, overrideentitycamera);
            }
        }
        return;
    }
    obituary(self, attacker, weapon, smeansofdeath);
    demo::kill_bookmark(attacker, self, einflictor, var_50d1e41a, overrideentitycamera);
    if (!var_e9d49a33) {
        if (level.gametype === "bounty") {
            if (isdefined(var_bee367e6)) {
                potm::function_66d09fea(#"bh_kill", var_bee367e6, self, einflictor, var_50d1e41a, overrideentitycamera);
            }
            return;
        }
        potm::kill_bookmark(attacker, self, einflictor, var_50d1e41a, overrideentitycamera);
    }
}

// Namespace player/player_killed
// Params 2, eflags: 0x0
// Checksum 0xbff70dc, Offset: 0x5a10
// Size: 0x62
function function_c0f28ff9(attacker, weapon) {
    overrideentitycamera = 0;
    if (!isdefined(weapon)) {
        return overrideentitycamera;
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        overrideentitycamera = killstreaks::should_override_entity_camera_in_demo(attacker, weapon);
    }
    return overrideentitycamera;
}

// Namespace player/player_killed
// Params 5, eflags: 0x4
// Checksum 0x481ec24a, Offset: 0x5a80
// Size: 0x370
function private suicide(einflictor, attacker, smeansofdeath, weapon, shitloc) {
    awardassists = 0;
    self.suicide = 0;
    if (isdefined(self.switching_teams)) {
        if (!level.teambased && isdefined(level.teams[self.leaving_team]) && isdefined(level.teams[self.joining_team]) && level.teams[self.leaving_team] != level.teams[self.joining_team]) {
            playercounts = self teams::count_players();
            playercounts[self.leaving_team]--;
            playercounts[self.joining_team]++;
            if (playercounts[self.joining_team] - playercounts[self.leaving_team] > 1) {
                scoreevents::processscoreevent(#"suicide", self, undefined, undefined);
                self globallogic_score::incpersstat(#"suicides", 1);
                self.suicides = self globallogic_score::getpersstat(#"suicides");
                self.suicide = 1;
            }
        }
    } else {
        scoreevents::processscoreevent(#"suicide", self);
        self globallogic_score::incpersstat(#"suicides", 1);
        self.suicides = self globallogic_score::getpersstat(#"suicides");
        if (smeansofdeath === "MOD_SUICIDE" && shitloc === "none" && isdefined(self.throwinggrenade) && self.throwinggrenade) {
            self.lastgrenadesuicidetime = gettime();
        }
        if (level.maxsuicidesbeforekick > 0 && level.maxsuicidesbeforekick <= self.suicides) {
            self notify(#"teamkillkicked");
            self function_3c238bc5();
        }
        thread battlechatter::on_player_suicide_or_team_kill(self, "suicide");
        awardassists = 1;
        self.suicide = 1;
    }
    if (isdefined(self.friendlydamage)) {
        self iprintln(#"hash_7d1a0e5bd191fce");
        if (level.teamkillpointloss) {
            scoresub = self [[ level.getteamkillscore ]](einflictor, attacker, smeansofdeath, weapon);
            globallogic_score::function_17a678b7(attacker, scoresub);
        }
    }
    return awardassists;
}

// Namespace player/player_killed
// Params 5, eflags: 0x4
// Checksum 0x76a5178b, Offset: 0x5df8
// Size: 0x34c
function private team_kill(einflictor, attacker, smeansofdeath, weapon, shitloc) {
    scoreevents::processscoreevent(#"team_kill", attacker, undefined, weapon);
    self.teamkilled = 1;
    if (!ignore_team_kills(weapon, smeansofdeath, einflictor)) {
        teamkill_penalty = self [[ level.getteamkillpenalty ]](einflictor, attacker, smeansofdeath, weapon);
        attacker globallogic_score::incpersstat(#"teamkills_nostats", teamkill_penalty, 0);
        attacker globallogic_score::incpersstat(#"teamkills", 1);
        if (!isdefined(attacker.teamkillsthisround)) {
            attacker.teamkillsthisround = 0;
        }
        attacker.teamkillsthisround++;
        if (level.friendlyfire == 4 && attacker.pers[#"teamkills_nostats"] == level.var_fe3ff9c1) {
            attacker.var_e03ca8a5 = 1;
        }
        if (level.teamkillpointloss) {
            scoresub = self [[ level.getteamkillscore ]](einflictor, attacker, smeansofdeath, weapon);
            globallogic_score::function_17a678b7(attacker, scoresub);
        }
        if (globallogic_utils::gettimepassed() < 5000) {
            var_821200bb = 1;
        } else if (attacker.pers[#"teamkills_nostats"] > 1 && globallogic_utils::gettimepassed() < int((8 + attacker.pers[#"teamkills_nostats"]) * 1000)) {
            var_821200bb = 1;
        } else {
            var_821200bb = attacker function_821200bb();
        }
        if (var_821200bb > 0) {
            attacker.teamkillpunish = 1;
            attacker thread wait_and_suicide();
            if (attacker function_78a6af2d(var_821200bb)) {
                attacker notify(#"teamkillkicked");
                attacker thread function_dd602974();
            }
            attacker thread function_a932bf9c();
        }
        if (isplayer(attacker)) {
            thread battlechatter::on_player_suicide_or_team_kill(attacker, "teamkill");
        }
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x3d6ba7a3, Offset: 0x6150
// Size: 0x8c
function private wait_and_suicide() {
    self endon(#"disconnect");
    self val::set(#"wait_and_suicide", "freezecontrols");
    wait(0.25);
    self val::reset(#"wait_and_suicide", "freezecontrols");
    self suicide();
}

// Namespace player/player_killed
// Params 4, eflags: 0x4
// Checksum 0xad58c403, Offset: 0x61e8
// Size: 0x2fc
function private function_48a1200f(einflictor, attacker, weapon, lpattackteam) {
    pixbeginevent(#"hash_115d2072d5ab2061");
    if (isdefined(self.attackers)) {
        for (j = 0; j < self.attackers.size; j++) {
            player = self.attackers[j];
            if (!isdefined(player)) {
                continue;
            }
            if (player == attacker) {
                continue;
            }
            if (player util::isenemyteam(lpattackteam)) {
                continue;
            }
            damage_done = self.attackerdamage[player.clientid].damage;
            if (sessionmodeismultiplayergame() && isdefined(player.currentweapon)) {
                function_92d1707f(#"hash_d1357992f4715f0", {#gametime:function_f8d53445(), #assistspawnid:getplayerspawnid(player), #assistspecialist:function_b14806c6(player player_role::get(), currentsessionmode()), #assistweapon:player.currentweapon.name});
            }
            player thread globallogic_score::processassist(self, damage_done, self.attackerdamage[player.clientid].weapon, self.attackerdamage[player.clientid].time, self.attackerdamage[player.clientid].meansofdeath);
        }
    }
    if (level.teambased) {
        self globallogic_score::processkillstreakassists(attacker, einflictor, weapon);
    }
    if (isdefined(self.lastattackedshieldplayer) && isdefined(self.lastattackedshieldtime) && self.lastattackedshieldplayer != attacker) {
        if (gettime() - self.lastattackedshieldtime < 4000) {
            self.lastattackedshieldplayer thread globallogic_score::processshieldassist(self);
        }
    }
    pixendevent();
}

// Namespace player/player_killed
// Params 1, eflags: 0x0
// Checksum 0x1d48dbe1, Offset: 0x64f0
// Size: 0x114
function function_f632c17e(weapon) {
    if (isdefined(weapon) && isdefined(level.iskillstreakweapon) && [[ level.iskillstreakweapon ]](weapon)) {
        return true;
    }
    if (isdefined(weapon) && isdefined(weapon.statname) && isdefined(level.iskillstreakweapon) && [[ level.iskillstreakweapon ]](getweapon(weapon.statname))) {
        return true;
    }
    switch (weapon.name) {
    case #"ar_accurate_t8_swat":
    case #"hash_17df39d53492b0bf":
    case #"tank_robot_launcher_turret":
    case #"ac130_chaingun":
    case #"hash_7b24d0d0d2823bca":
        return true;
    }
    return false;
}

// Namespace player/player_killed
// Params 5, eflags: 0x4
// Checksum 0xf414f30, Offset: 0x6610
// Size: 0x414
function private function_4e3e8bee(einflictor, attacker, smeansofdeath, weapon, var_e7a369ea) {
    attacker thread globallogic_score::givekillstats(smeansofdeath, weapon, self, var_e7a369ea);
    killstreak = killstreaks::get_killstreak_for_weapon(weapon);
    if (isdefined(killstreak)) {
        if (scoreevents::isregisteredevent(killstreak)) {
            scoreevents::processscoreevent(killstreak, attacker, self, weapon);
        }
        if (isdefined(einflictor)) {
            bundle = einflictor killstreak_bundles::function_48e9536e();
            if (isdefined(bundle) && isdefined(bundle.var_ad1e41b) && bundle.var_ad1e41b) {
                scoreevents::processscoreevent(#"ekia", attacker, self, weapon);
            }
            if (killstreak == "dart" || killstreak == "inventory_dart") {
                einflictor notify(#"veh_collision");
                callback::callback(#"veh_collision", {#normal:(0, 0, 1)});
            }
        }
    } else if (!function_f632c17e(weapon)) {
        if (var_e7a369ea == attacker) {
            if (isdefined(self.laststandparams)) {
                if (isdefined(self.var_a1d415ee) && self.laststandparams.attacker !== self.var_a1d415ee.attacker) {
                    scoreevents::processscoreevent(#"kill", self.laststandparams.attacker, self, self.laststandparams.sweapon);
                    scoreevents::processscoreevent(#"cleaned_up", self.var_a1d415ee.attacker, self, self.var_a1d415ee.sweapon);
                } else {
                    scoreevents::processscoreevent(#"kill", attacker, self, weapon);
                }
            } else {
                scoreevents::processscoreevent(#"kill", attacker, self, weapon);
            }
        }
        scoreevents::processscoreevent(#"ekia", attacker, self, weapon);
        if (weapon_utils::ismeleemod(smeansofdeath)) {
            scoreevents::processscoreevent(#"melee_kill", attacker, self, weapon);
        }
    }
    damage = self function_40c6c42d(attacker);
    function_f887b191(self, attacker, damage);
    attacker thread globallogic_score::trackattackerkill(self.name, self.pers[#"rank"], self.pers[#"rankxp"], self.pers[#"prestige"], self getxuid(), weapon);
    attacker thread globallogic_score::inckillstreaktracker(weapon);
}

// Namespace player/player_killed
// Params 5, eflags: 0x4
// Checksum 0x659a797c, Offset: 0x6a30
// Size: 0x22c
function private kill(einflictor, attacker, smeansofdeath, weapon, shitloc) {
    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
        globallogic_score::inctotalkills(attacker.team);
    }
    attackername = attacker.name;
    self thread globallogic_score::trackattackeedeath(attackername, attacker.pers[#"rank"], attacker.pers[#"rankxp"], attacker.pers[#"prestige"], attacker getxuid());
    self thread medals::setlastkilledby(attacker, einflictor);
    if (level.teambased && attacker.team != #"spectator") {
        killstreak = killstreaks::get_killstreak_for_weapon(weapon);
        if (!isdefined(killstreak) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
            globallogic_score::giveteamscore("kill", attacker.team, attacker, self);
        }
    }
    scoresub = level.deathpointloss;
    if (scoresub != 0) {
        globallogic_score::function_17a678b7(self, scoresub);
    }
    level thread function_e8decd0b(attacker, weapon, self, einflictor, smeansofdeath);
}

// Namespace player/player_killed
// Params 1, eflags: 0x4
// Checksum 0x6cae3624, Offset: 0x6c68
// Size: 0x24
function private should_allow_postgame_death(smeansofdeath) {
    if (smeansofdeath == "MOD_POST_GAME") {
        return true;
    }
    return false;
}

// Namespace player/player_killed
// Params 9, eflags: 0x4
// Checksum 0xeddd478, Offset: 0x6c98
// Size: 0x17c
function private post_game_death(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (!should_allow_postgame_death(smeansofdeath)) {
        return;
    }
    self weapons::detach_carry_object_model();
    self.sessionstate = "dead";
    self.spectatorclient = -1;
    self.killcamentity = -1;
    self.archivetime = 0;
    self.psoffsettime = 0;
    clone_weapon = weapon;
    if (weapon_utils::ismeleemod(smeansofdeath) && clone_weapon.type != "melee") {
        clone_weapon = level.weaponnone;
    }
    body = self cloneplayer(deathanimduration, clone_weapon, attacker, vdir);
    if (isdefined(body)) {
        self create_body(attacker, idamage, smeansofdeath, weapon, shitloc, vdir, (0, 0, 0), deathanimduration, einflictor, body);
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x55494fb7, Offset: 0x6e20
// Size: 0x6a0
function private function_395ef176() {
    self endon(#"disconnect");
    var_8f42b3ff = isdefined(level.var_8a400007) ? level.var_8a400007 : 10;
    var_65671d4a = level.numteamlives - var_8f42b3ff;
    if (isdefined(level.teambased) && level.teambased && isdefined(level.takelivesondeath) && level.takelivesondeath && level.numteamlives > 0) {
        enemy_team = util::getotherteam(self.team);
        teamarray = getplayers(self.team);
        if (game.lives[self.team] == 0 && !level.var_61952d8b[self.team]) {
            level.var_61952d8b[self.team] = 1;
            level.var_a236b703[self.team] = 1;
            thread globallogic_audio::leader_dialog("controlNoLives", self.team);
            thread globallogic_audio::leader_dialog("controlNoLivesEnemy", enemy_team);
            clientfield::set_world_uimodel("hudItems.team" + level.teamindex[self.team] + ".noRespawnsLeft", 1);
            game.lives[self.team] = 0;
            level.var_9161927e[self.team] = teamarray.size;
            teammates = util::get_active_players(self.team);
            foreach (player in teammates) {
                player luinotifyevent(#"hash_6b67aa04e378d681", 1, 7);
            }
            util::function_5a68c330(24, self.team);
        }
        if (level.deaths[self.team] >= var_65671d4a && !level.var_a236b703[self.team]) {
            level.var_a236b703[self.team] = 1;
            thread globallogic_audio::leader_dialog("controlLowLives", self.team);
            thread globallogic_audio::leader_dialog("controlLowLivesEnemy", enemy_team);
        }
        if (isdefined(level.var_9161927e) && isdefined(level.var_9161927e[self.team])) {
            if (level.var_9161927e[self.team] > 0) {
                teammates = util::get_active_players(self.team);
                foreach (player in teammates) {
                    player luinotifyevent(#"hash_6b67aa04e378d681", 2, 1, level.var_9161927e[self.team]);
                }
            }
            if (level.var_9161927e[self.team] == 1) {
                thread globallogic_audio::leader_dialog("roundEncourageLastPlayer", self.team);
                thread globallogic_audio::leader_dialog("roundEncourageLastPlayerEnemy", enemy_team);
            }
            level.var_9161927e[self.team]--;
        }
        function_c49fc862(self.team);
        return;
    }
    clientfield::set_player_uimodel("hudItems.playerLivesCount", level.numlives - self.var_a7d7e50a);
    if (isdefined(level.var_4348a050) && level.var_4348a050) {
        var_e6caaa48 = level.playerlives[#"allies"];
        var_5724b72f = level.playerlives[#"axis"];
        if (level.gametype == "sd" && userspawnselection::function_127864f2(self)) {
            return;
        }
        if (self.team == #"allies") {
            var_e6caaa48 = var_e6caaa48 - 1;
        } else if (self.team == #"axis") {
            var_5724b72f = var_5724b72f - 1;
        }
        if (var_e6caaa48 > 0 && var_5724b72f > 0) {
            foreach (player in level.activeplayers) {
                if (!isdefined(player)) {
                    continue;
                }
                player luinotifyevent(#"hash_6b67aa04e378d681", 3, 2, var_e6caaa48, var_5724b72f);
            }
        }
    }
}

// Namespace player/player_killed
// Params 1, eflags: 0x4
// Checksum 0xcce66119, Offset: 0x74c8
// Size: 0x46
function private function_5c5a8dad(lives) {
    if (lives == 0) {
        level notify(#"player_eliminated");
        self notify(#"player_eliminated");
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x13e8f127, Offset: 0x7518
// Size: 0x254
function private start_generator_captureshouldshowpain() {
    if (!(isdefined(level.takelivesondeath) && level.takelivesondeath)) {
        self function_5c5a8dad(self.pers[#"lives"]);
        return;
    }
    if (isdefined(self.var_cee93f5) && self.var_cee93f5) {
        return;
    }
    if (game.lives[self.team] > 0) {
        if (isdefined(level.competitiveteamlives) && level.competitiveteamlives) {
        } else if (self.attackers.size < 1) {
            return;
        } else {
            foreach (attacker in self.attackers) {
                if (!isdefined(attacker)) {
                    continue;
                }
                if (attacker.team != self.team) {
                    removelives = 1;
                    break;
                }
            }
            if (!(isdefined(removelives) && removelives)) {
                return;
            }
        }
        game.lives[self.team]--;
        if (self.pers[#"lives"] == 0) {
            self function_5c5a8dad(game.lives[self.team]);
        }
        return;
    }
    if (self.pers[#"lives"]) {
        self.pers[#"lives"]--;
        level callback::callback(#"hash_e702d557e24bb6", {#player:self});
        self function_5c5a8dad(self.pers[#"lives"]);
    }
}

// Namespace player/player_killed
// Params 10, eflags: 0x4
// Checksum 0x2ae76091, Offset: 0x7778
// Size: 0x37c
function private create_body(attacker, idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, body) {
    if (smeansofdeath == "MOD_HIT_BY_OBJECT" && self getstance() == "prone") {
        self.body = body;
        if (!isdefined(self.switching_teams)) {
            thread deathicons::add(body, self, self.team);
        }
        return;
    }
    if (isdefined(level.ragdoll_override) && self [[ level.ragdoll_override ]](idamage, smeansofdeath, weapon, shitloc, vdir, vattackerorigin, deathanimduration, einflictor, 0, body)) {
        return;
    }
    if (self isonladder() || self ismantling() || smeansofdeath == "MOD_CRUSH" || smeansofdeath == "MOD_HIT_BY_OBJECT") {
        body startragdoll();
    }
    if (!self isonground() && smeansofdeath != "MOD_FALLING") {
        if (getdvarint(#"scr_disable_air_death_ragdoll", 0) == 0) {
            body startragdoll();
        }
    }
    if (smeansofdeath == "MOD_MELEE_ASSASSINATE" && !attacker isonground()) {
        body start_death_from_above_ragdoll(vdir);
    }
    if (self is_explosive_ragdoll(weapon, einflictor)) {
        body start_explosive_ragdoll(vdir, weapon);
    }
    thread delayed_ragdoll(body, shitloc, vdir, weapon, einflictor, smeansofdeath);
    if (smeansofdeath == "MOD_CRUSH") {
        body globallogic_vehicle::vehiclecrush(attacker, einflictor);
    }
    self.body = body;
    if (!isdefined(self.switching_teams)) {
        thread deathicons::add(body, self, self.team);
    }
    params = spawnstruct();
    params.smeansofdeath = smeansofdeath;
    params.weapon = weapon;
    body.player = self;
    body.iscorpse = 1;
    self.body callback::callback(#"on_player_corpse");
}

// Namespace player/player_killed
// Params 4, eflags: 0x4
// Checksum 0x5dc0baef, Offset: 0x7b00
// Size: 0xa4
function private should_drop_weapon_on_death(wasteamkill, wassuicide, current_weapon, smeansofdeath) {
    if (wasteamkill) {
        return false;
    }
    if (wassuicide) {
        return false;
    }
    if (smeansofdeath == "MOD_TRIGGER_HURT" && !self isonground()) {
        return false;
    }
    if (isdefined(current_weapon) && current_weapon.isheavyweapon) {
        return false;
    }
    if (smeansofdeath == "MOD_META") {
        return false;
    }
    return true;
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x99355f9f, Offset: 0x7bb0
// Size: 0x2c
function private function_8826f676() {
    if (isbot(self)) {
        level.globallarryskilled++;
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x456b414e, Offset: 0x7be8
// Size: 0x44
function private function_f9dc085a() {
    if (isdefined(self.killstreak_delay_killcam)) {
        while (isdefined(self.killstreak_delay_killcam)) {
            wait(0.1);
        }
        wait(2);
        self killstreaks::reset_killstreak_delay_killcam();
    }
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x12111e7c, Offset: 0x7c38
// Size: 0x94
function private function_3c238bc5() {
    self globallogic_score::incpersstat(#"sessionbans", 1);
    self endon(#"disconnect");
    waittillframeend();
    globallogic::gamehistoryplayerkicked();
    ban(self getentitynumber());
    globallogic_audio::leader_dialog("gamePlayerKicked");
}

// Namespace player/player_killed
// Params 0, eflags: 0x4
// Checksum 0x6aafd0e8, Offset: 0x7cd8
// Size: 0x1dc
function private function_dd602974() {
    self globallogic_score::incpersstat(#"sessionbans", 1);
    self endon(#"disconnect");
    waittillframeend();
    playlistbanquantum = tweakables::gettweakablevalue("team", "teamkillerplaylistbanquantum");
    playlistbanpenalty = tweakables::gettweakablevalue("team", "teamkillerplaylistbanpenalty");
    if (playlistbanquantum > 0 && playlistbanpenalty > 0) {
        timeplayedtotal = self stats::get_stat_global(#"time_played_total");
        minutesplayed = timeplayedtotal / 60;
        freebees = 2;
        banallowance = int(floor(minutesplayed / playlistbanquantum)) + freebees;
        if (self.sessionbans > banallowance) {
            self stats::set_stat_global(#"gametypeban", timeplayedtotal + playlistbanpenalty * 60);
        }
    }
    globallogic::gamehistoryplayerkicked();
    ban(self getentitynumber(), "EXE/PLAYERKICK_TEAM_KILL");
    globallogic_audio::leader_dialog("gamePlayerKicked");
}

// Namespace player/player_killed
// Params 0, eflags: 0x0
// Checksum 0xe9f1d993, Offset: 0x7ec0
// Size: 0xe2
function function_821200bb() {
    teamkills = self.pers[#"teamkills_nostats"];
    if (level.friendlyfire == 4) {
        if (teamkills < level.var_fe3ff9c1) {
            return 0;
        } else {
            exceeded = teamkills - level.var_fe3ff9c1 - 1;
            return (level.var_ca1c5097 + level.var_2c3d094b * exceeded);
        }
        return;
    }
    if (level.minimumallowedteamkills < 0 || teamkills <= level.minimumallowedteamkills) {
        return 0;
    }
    exceeded = teamkills - level.minimumallowedteamkills;
    return level.teamkillspawndelay * exceeded;
}

// Namespace player/player_killed
// Params 1, eflags: 0x4
// Checksum 0x59957515, Offset: 0x7fb0
// Size: 0xdc
function private function_78a6af2d(var_821200bb) {
    if (isbot(self)) {
        return false;
    }
    if (level.friendlyfire == 4) {
        if (self.pers[#"teamkills_nostats"] >= level.var_fe3ff9c1 + level.var_3297fce5) {
            return true;
        }
        return false;
    }
    if (var_821200bb && level.minimumallowedteamkills >= 0) {
        if (globallogic_utils::gettimepassed() >= 5000) {
            return true;
        }
        if (self.pers[#"teamkills_nostats"] > 1) {
            return true;
        }
    }
    return false;
}

// Namespace player/player_killed
// Params 0, eflags: 0x0
// Checksum 0x2d732386, Offset: 0x8098
// Size: 0xf4
function function_a932bf9c() {
    if (level.friendlyfire == 4) {
        return;
    }
    timeperoneteamkillreduction = 20;
    reductionpersecond = 1 / timeperoneteamkillreduction;
    while (true) {
        if (isalive(self)) {
            self.pers[#"teamkills_nostats"] = self.pers[#"teamkills_nostats"] - reductionpersecond;
            if (self.pers[#"teamkills_nostats"] < level.minimumallowedteamkills) {
                self.pers[#"teamkills_nostats"] = level.minimumallowedteamkills;
                break;
            }
        }
        wait(1);
    }
}

// Namespace player/player_killed
// Params 3, eflags: 0x4
// Checksum 0x6ae9e516, Offset: 0x8198
// Size: 0x10e
function private ignore_team_kills(weapon, smeansofdeath, einflictor) {
    if (weapon_utils::ismeleemod(smeansofdeath)) {
        return false;
    }
    if (weapon.ignore_team_kills === 1 || weapon.ignoreteamkills === 1) {
        return true;
    }
    if (isdefined(einflictor) && einflictor.ignore_team_kills === 1) {
        return true;
    }
    if (isdefined(einflictor) && isdefined(einflictor.destroyedby) && isdefined(einflictor.owner) && einflictor.destroyedby != einflictor.owner) {
        return true;
    }
    if (isdefined(einflictor) && einflictor.classname == "worldspawn") {
        return true;
    }
    return false;
}

// Namespace player/player_killed
// Params 2, eflags: 0x4
// Checksum 0x872dc50, Offset: 0x82b0
// Size: 0xb6
function private is_explosive_ragdoll(weapon, inflictor) {
    if (!isdefined(weapon)) {
        return false;
    }
    if (weapon.name == #"destructible_car" || weapon.name == #"explodable_barrel") {
        return true;
    }
    if (weapon.projexplosiontype == "grenade") {
        if (isdefined(inflictor) && isdefined(inflictor.stucktoplayer)) {
            if (inflictor.stucktoplayer == self) {
                return true;
            }
        }
    }
    return false;
}

// Namespace player/player_killed
// Params 2, eflags: 0x4
// Checksum 0xd3bcd3d8, Offset: 0x8370
// Size: 0x1b4
function private start_explosive_ragdoll(dir, weapon) {
    if (!isdefined(self)) {
        return;
    }
    x = randomintrange(50, 100);
    y = randomintrange(50, 100);
    z = randomintrange(10, 20);
    if (isdefined(weapon) && (weapon.name == #"sticky_grenade" || weapon.name == #"explosive_bolt")) {
        if (isdefined(dir) && lengthsquared(dir) > 0) {
            x = dir[0] * x;
            y = dir[1] * y;
        }
    } else {
        if (math::cointoss()) {
            x = x * -1;
        }
        if (math::cointoss()) {
            y = y * -1;
        }
    }
    self startragdoll();
    self launchragdoll((x, y, z));
}

// Namespace player/player_killed
// Params 1, eflags: 0x4
// Checksum 0xf2e48dfa, Offset: 0x8530
// Size: 0x4c
function private start_death_from_above_ragdoll(dir) {
    if (!isdefined(self)) {
        return;
    }
    self startragdoll();
    self launchragdoll(vectorscale((0, 0, -1), 100));
}

// Namespace player/player_killed
// Params 6, eflags: 0x4
// Checksum 0x1034d48f, Offset: 0x8588
// Size: 0x17c
function private delayed_ragdoll(ent, shitloc, vdir, weapon, einflictor, smeansofdeath) {
    if (isdefined(ent)) {
        deathanim = ent getcorpseanim();
        if (animhasnotetrack(deathanim, "ignore_ragdoll")) {
            return;
        }
    }
    waittillframeend();
    if (!isdefined(ent)) {
        return;
    }
    if (ent isragdoll()) {
        return;
    }
    deathanim = ent getcorpseanim();
    startfrac = 0.35;
    if (animhasnotetrack(deathanim, "start_ragdoll")) {
        times = getnotetracktimes(deathanim, "start_ragdoll");
        if (isdefined(times)) {
            startfrac = times[0];
        }
    }
    waittime = startfrac * getanimlength(deathanim);
    if (waittime > 0) {
        wait(waittime);
    }
    if (isdefined(ent)) {
        ent startragdoll();
    }
}

// Namespace player/player_killed
// Params 2, eflags: 0x4
// Checksum 0xd7ce6776, Offset: 0x8710
// Size: 0x32c
function private update_attacker(attacker, weapon) {
    if (isai(attacker) && isdefined(attacker.script_owner)) {
        if (!level.teambased || self util::isenemyteam(attacker.script_owner.team)) {
            attacker = attacker.script_owner;
        }
    }
    if (attacker.classname == "script_vehicle" && isdefined(attacker.owner)) {
        attacker notify(#"killed", {#victim:self});
        attacker = attacker.owner;
    }
    if (isai(attacker)) {
        attacker notify(#"killed", {#victim:self});
    }
    if (isdefined(self.capturinglastflag) && self.capturinglastflag == 1) {
        attacker.lastcapkiller = 1;
    }
    if (isdefined(attacker) && attacker != self && isdefined(weapon)) {
        if (weapon.statname == #"planemortar") {
            if (!isdefined(attacker.planemortarbda)) {
                attacker.planemortarbda = 0;
            }
            attacker.planemortarbda++;
        } else if (weapon.statname == #"dart" || weapon.statname == #"dart_turret") {
            if (!isdefined(attacker.dartbda)) {
                attacker.dartbda = 0;
            }
            attacker.dartbda++;
        } else if (weapon.name == #"straferun_rockets" || weapon.name == #"straferun_gun") {
            if (isdefined(attacker.straferunbda)) {
                attacker.straferunbda++;
            }
        } else if (weapon.statname == #"remote_missile" || weapon.statname == #"remote_missile_missile" || weapon.name == #"remote_missile_bomblet") {
            if (!isdefined(attacker.remotemissilebda)) {
                attacker.remotemissilebda = 0;
            }
            attacker.remotemissilebda++;
        }
    }
    return attacker;
}

// Namespace player/player_killed
// Params 1, eflags: 0x4
// Checksum 0xbf9dd843, Offset: 0x8a48
// Size: 0x78
function private update_inflictor(einflictor) {
    if (isdefined(einflictor) && einflictor.classname == "script_vehicle") {
        einflictor notify(#"killed", {#victim:self});
        if (isdefined(einflictor.bda)) {
            einflictor.bda++;
        }
    }
    return einflictor;
}

// Namespace player/player_killed
// Params 2, eflags: 0x4
// Checksum 0xd24875fc, Offset: 0x8ac8
// Size: 0xea
function private update_weapon(einflictor, weapon) {
    if (weapon == level.weaponnone && isdefined(einflictor)) {
        if (isdefined(einflictor.targetname) && einflictor.targetname == "explodable_barrel") {
            weapon = getweapon(#"explodable_barrel");
        } else if (isdefined(einflictor.destructible_type) && issubstr(einflictor.destructible_type, "vehicle_")) {
            weapon = getweapon(#"destructible_car");
        }
    }
    return weapon;
}

// Namespace player/player_killed
// Params 5, eflags: 0x4
// Checksum 0x7a61e260, Offset: 0x8bc0
// Size: 0xf8
function private function_e8decd0b(attacker, weapon, victim, einflictor, smeansofdeath) {
    if (isplayer(attacker)) {
        if (!killstreaks::is_killstreak_weapon(weapon) || killstreaks::function_e3a30c69(weapon)) {
            level thread battlechatter::say_kill_battle_chatter(attacker, weapon, victim, einflictor, smeansofdeath);
        }
    }
    if (isdefined(einflictor)) {
        bhtnactionstartevent(einflictor, "attack_kill");
        einflictor notify(#"bhtn_action_notify", {#action:"attack_kill"});
    }
}

// Namespace player/player_killed
// Params 3, eflags: 0x0
// Checksum 0xd4b05c93, Offset: 0x8cc0
// Size: 0x5da
function updatekillstreak(einflictor, attacker, weapon) {
    if (isalive(attacker)) {
        pixbeginevent(#"killstreak");
        if (!isdefined(einflictor) || !isdefined(einflictor.requireddeathcount) || attacker.deathcount == einflictor.requireddeathcount) {
            shouldgivekillstreak = killstreaks::should_give_killstreak(weapon);
            if (shouldgivekillstreak) {
                attacker killstreaks::add_to_killstreak_count(weapon);
            }
            attacker.pers[#"cur_total_kill_streak"]++;
            attacker setplayercurrentstreak(attacker.pers[#"cur_total_kill_streak"]);
            if (isdefined(level.killstreaks) && shouldgivekillstreak) {
                attacker.pers[#"cur_kill_streak"]++;
                if (attacker.pers[#"cur_kill_streak"] >= 2) {
                    if (attacker.pers[#"cur_kill_streak"] % 5 == 0) {
                        attacker activecamo::function_896ac347(weapon, #"killstreak_5", 1);
                        attacker contracts::increment_contract(#"hash_4c15367eed618401");
                        attacker contracts::increment_contract(#"contract_wl_kills_without_dying");
                    }
                    if (attacker.pers[#"cur_kill_streak"] % 10 == 0) {
                        attacker challenges::killstreakten();
                        attacker contracts::increment_contract(#"contract_mp_merciless");
                    }
                    if (attacker.pers[#"cur_kill_streak"] <= 30) {
                        scoreevents::processscoreevent(#"killstreak_" + attacker.pers[#"cur_kill_streak"], attacker, self, weapon);
                        if (attacker.pers[#"cur_kill_streak"] == 30) {
                            attacker challenges::killstreak_30_noscorestreaks();
                        }
                    } else {
                        scoreevents::processscoreevent(#"killstreak_more_than_30", attacker, self, weapon);
                    }
                    if (isdefined(attacker.var_ea1458aa)) {
                        if (attacker.pers[#"cur_kill_streak"] >= 5 && attacker.pers[#"cur_kill_streak"] % 5 && attacker.pers[#"cur_kill_streak"] < 30 || attacker.pers[#"cur_kill_streak"] > 30) {
                            if (!isdefined(attacker.var_ea1458aa.var_2bad4cbb)) {
                                attacker.var_ea1458aa.var_2bad4cbb = 0;
                            }
                            attacker.var_ea1458aa.var_2bad4cbb++;
                            attacker challenges::function_a4db0a4c();
                        }
                    }
                }
                if (!isdefined(level.usingmomentum) || !level.usingmomentum) {
                    attacker thread killstreaks::give_for_streak();
                }
            }
        }
        pixendevent();
    }
    if (isdefined(attacker.gametype_kill_streak) && attacker.pers[#"cur_kill_streak"] > attacker.gametype_kill_streak) {
        attacker stats::function_baa25a23(#"kill_streak", attacker.pers[#"cur_kill_streak"]);
        attacker.gametype_kill_streak = attacker.pers[#"cur_kill_streak"];
    }
    if (isdefined(attacker.var_b6f732c0) && attacker.pers[#"cur_kill_streak"] > attacker.var_b6f732c0) {
        attacker stats::set_stat_global(#"longest_killstreak", attacker.pers[#"cur_kill_streak"]);
        attacker.var_b6f732c0 = attacker.pers[#"cur_kill_streak"];
    }
}

// Namespace player/player_killed
// Params 9, eflags: 0x0
// Checksum 0xba4fa33e, Offset: 0x92a8
// Size: 0x132
function function_ff3ec0d4(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    foreach (callback in level.var_da2045d0) {
        if (callback.threaded) {
            self thread [[ callback.callback ]](einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
            continue;
        }
        profilestart();
        self [[ callback.callback ]](einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        profilestop();
    }
}

// Namespace player/player_killed
// Params 4, eflags: 0x0
// Checksum 0x1767c030, Offset: 0x93e8
// Size: 0xe2
function function_b8871aa2(einflictor, victim, idamage, weapon) {
    foreach (callback in level.var_fa66fada) {
        if (callback.threaded) {
            self thread [[ callback.callback ]](einflictor, victim, idamage, weapon);
            continue;
        }
        profilestart();
        self [[ callback.callback ]](einflictor, victim, idamage, weapon);
        profilestop();
    }
}

