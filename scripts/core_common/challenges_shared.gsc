// Atian COD Tools GSC decompiler test
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\status_effects\status_effect_util.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\globallogic\globallogic_score.gsc;
#using scripts\core_common\drown.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\activecamo_shared.gsc;
#using scripts\abilities\ability_player.gsc;

#namespace challenges;

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x2
// Checksum 0xd150d025, Offset: 0x408
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"challenges_shared", &__init__, undefined, undefined);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4d930d53, Offset: 0x450
// Size: 0x1c
function __init__() {
    level thread function_57d8515c();
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x478
// Size: 0x4
function init_shared() {
    
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0x2449fc17, Offset: 0x488
// Size: 0x10
function pickedupballisticknife() {
    self.retreivedblades++;
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x5fb4cc06, Offset: 0x4a0
// Size: 0x9e
function trackassists(attacker, damage, isflare) {
    if (!isplayer(attacker)) {
        return;
    }
    if (!isdefined(self.flareattackerdamage)) {
        self.flareattackerdamage = [];
    }
    if (isdefined(isflare) && isflare == 1) {
        self.flareattackerdamage[attacker.clientid] = 1;
    } else {
        self.flareattackerdamage[attacker.clientid] = 0;
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa98c3db1, Offset: 0x548
// Size: 0x1bc
function destroyedequipment(weapon) {
    if (sessionmodeiszombiesgame()) {
        return;
    }
    if (isdefined(weapon) && weapon.isemp) {
        if (self util::is_item_purchased(#"emp_grenade")) {
            self stats::function_dad108fa(#"destroy_equipment_with_emp_grenade", 1);
        }
        self function_be7a08a8(weapon, 1);
        if (self util::has_hacker_perk_purchased_and_equipped()) {
            self stats::function_dad108fa(#"destroy_equipment_with_emp_engineer", 1);
            self stats::function_dad108fa(#"destroy_equipment_engineer", 1);
        }
    } else if (self util::has_hacker_perk_purchased_and_equipped()) {
        self stats::function_dad108fa(#"destroy_equipment_engineer", 1);
    }
    self stats::function_dad108fa(#"destroy_equipment", 1);
    if (sessionmodeiswarzonegame()) {
        callback::callback(#"hash_67dd51a5d529c64c");
    }
    self hackedordestroyedequipment();
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe95694a3, Offset: 0x710
// Size: 0xb4
function destroyedtacticalinsert() {
    if (!isdefined(self.pers[#"tacticalinsertsdestroyed"])) {
        self.pers[#"tacticalinsertsdestroyed"] = 0;
    }
    self.pers[#"tacticalinsertsdestroyed"]++;
    if (self.pers[#"tacticalinsertsdestroyed"] >= 5) {
        self.pers[#"tacticalinsertsdestroyed"] = 0;
        self stats::function_dad108fa(#"destroy_5_tactical_inserts", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2af2b1e1, Offset: 0x7d0
// Size: 0x1da
function addflyswatterstat(weapon, aircraft) {
    if (!isdefined(self.pers[#"flyswattercount"])) {
        self.pers[#"flyswattercount"] = 0;
    }
    self stats::function_e24eec31(weapon, #"destroyed_aircraft", 1);
    self.pers[#"flyswattercount"]++;
    if (self.pers[#"flyswattercount"] == 5) {
        self stats::function_e24eec31(weapon, #"destroyed_5_aircraft", 1);
    }
    if (isdefined(aircraft) && isdefined(aircraft.birthtime)) {
        if (gettime() - aircraft.birthtime < 20000) {
            self stats::function_e24eec31(weapon, #"destroyed_aircraft_under20s", 1);
        }
    }
    if (!isdefined(self.destroyedaircrafttime)) {
        self.destroyedaircrafttime = [];
    }
    if (isdefined(self.destroyedaircrafttime[weapon]) && gettime() - self.destroyedaircrafttime[weapon] < 10000) {
        self stats::function_e24eec31(weapon, #"destroyed_2aircraft_quickly", 1);
        self.destroyedaircrafttime[weapon] = undefined;
    } else {
        self.destroyedaircrafttime[weapon] = gettime();
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x67662225, Offset: 0x9b8
// Size: 0x70
function canprocesschallenges() {
    /#
        if (getdvarint(#"scr_debug_challenges", 0)) {
            return 1;
        }
    #/
    if (level.rankedmatch || level.arenamatch || sessionmodeiscampaigngame()) {
        return 1;
    }
    return 0;
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x68cf6009, Offset: 0xa30
// Size: 0xf0
function initteamchallenges(team) {
    if (!isdefined(game.challenge)) {
        game.challenge = [];
    }
    if (!isdefined(game.challenge[team])) {
        game.challenge[team] = [];
        game.challenge[team][#"plantedbomb"] = 0;
        game.challenge[team][#"destroyedbombsite"] = 0;
        game.challenge[team][#"capturedflag"] = 0;
    }
    game.challenge[team][#"allalive"] = 1;
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x18185043, Offset: 0xb28
// Size: 0x84
function registerchallengescallback(callback, func) {
    if (!isdefined(level.challengescallbacks)) {
        level.challengescallbacks = [];
    }
    if (!isdefined(level.challengescallbacks[callback])) {
        level.challengescallbacks[callback] = [];
    }
    level.challengescallbacks[callback][level.challengescallbacks[callback].size] = func;
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf3ed8420, Offset: 0xbb8
// Size: 0xda
function dochallengecallback(callback, data) {
    if (!isdefined(level.challengescallbacks)) {
        return;
    }
    if (!isdefined(level.challengescallbacks[callback])) {
        return;
    }
    if (isdefined(data)) {
        for (i = 0; i < level.challengescallbacks[callback].size; i++) {
            thread [[ level.challengescallbacks[callback][i] ]](data);
        }
    } else {
        for (i = 0; i < level.challengescallbacks[callback].size; i++) {
            thread [[ level.challengescallbacks[callback][i] ]]();
        }
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0x7fddcfe6, Offset: 0xca0
// Size: 0x34
function on_player_connect() {
    self thread initchallengedata();
    self thread spawnwatcher();
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7744f12d, Offset: 0xce0
// Size: 0x42
function initchallengedata() {
    self.pers[#"stickexplosivekill"] = 0;
    self.pers[#"carepackagescalled"] = 0;
    self.explosiveinfo = [];
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x0
// Checksum 0x49add6a, Offset: 0xd30
// Size: 0xdc
function isdamagefromplayercontrolledaitank(eattacker, einflictor, weapon) {
    if (weapon.name == #"ai_tank_drone_gun") {
        if (isdefined(eattacker) && isdefined(eattacker.remoteweapon) && isdefined(einflictor)) {
            if (isdefined(einflictor.controlled) && einflictor.controlled) {
                if (eattacker.remoteweapon == einflictor) {
                    return 1;
                }
            }
        }
    } else if (weapon.name == #"ai_tank_drone_rocket") {
        if (isdefined(einflictor) && !isdefined(einflictor.from_ai)) {
            return 1;
        }
    }
    return 0;
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x0
// Checksum 0x90d579d0, Offset: 0xe18
// Size: 0x98
function isdamagefromplayercontrolledsentry(eattacker, einflictor, weapon) {
    if (weapon.name == #"auto_gun_turret") {
        if (isdefined(eattacker) && isdefined(eattacker.remoteweapon) && isdefined(einflictor)) {
            if (eattacker.remoteweapon == einflictor) {
                if (isdefined(einflictor.controlled) && einflictor.controlled) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x0
// Checksum 0xdb9c54a, Offset: 0xeb8
// Size: 0x74c
function perkkills(victim, isstunned, time) {
    player = self;
    if (player hasperk(#"specialty_movefaster")) {
        player stats::function_dad108fa(#"perk_movefaster_kills", 1);
    }
    if (player hasperk(#"specialty_noname")) {
        player stats::function_dad108fa(#"perk_noname_kills", 1);
    }
    if (player hasperk(#"specialty_quieter")) {
        player stats::function_dad108fa(#"perk_quieter_kills", 1);
    }
    if (player hasperk(#"specialty_longersprint")) {
        if (isdefined(player.lastsprinttime) && gettime() - player.lastsprinttime < 2500) {
            player stats::function_dad108fa(#"perk_longersprint", 1);
        }
    }
    if (player hasperk(#"specialty_fastmantle")) {
        if (isdefined(player.lastsprinttime) && gettime() - player.lastsprinttime < 2500 && player playerads() >= 1) {
            player stats::function_dad108fa(#"perk_fastmantle_kills", 1);
        }
    }
    if (player hasperk(#"specialty_loudenemies")) {
        player stats::function_dad108fa(#"perk_loudenemies_kills", 1);
    }
    if (isstunned == 1 && player hasperk(#"specialty_stunprotection")) {
        player stats::function_dad108fa(#"perk_protection_stun_kills", 1);
    }
    activeenemyemp = 0;
    activecuav = 0;
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            /#
                assert(isdefined(level.activecounteruavs[team]));
            #/
            /#
                assert(isdefined(level.emp_shared.activeemps[team]));
            #/
            if (team == player.team) {
                continue;
            }
            if (level.activecounteruavs[team] > 0) {
                activecuav = 1;
            }
            if (level.emp_shared.activeemps[team] > 0) {
                activeenemyemp = 1;
            }
        }
    } else {
        /#
            assert(isdefined(level.activecounteruavs[victim.entnum]));
        #/
        /#
            assert(isdefined(level.emp_shared.activeemps[victim.entnum]));
        #/
        players = level.players;
        for (i = 0; i < players.size; i++) {
            if (players[i] != player) {
                if (isdefined(level.activecounteruavs[players[i].entnum]) && level.activecounteruavs[players[i].entnum] > 0) {
                    activecuav = 1;
                }
                if (isdefined(level.emp_shared.activeemps[players[i].entnum]) && level.emp_shared.activeemps[players[i].entnum] > 0) {
                    activeenemyemp = 1;
                }
            }
        }
    }
    if (activecuav == 1 || activeenemyemp == 1) {
        if (player hasperk(#"specialty_immunecounteruav")) {
            player stats::function_dad108fa(#"perk_immune_cuav_kills", 1);
        }
    }
    activeuavvictim = 0;
    if (level.teambased) {
        if (level.activeuavs[victim.team] > 0) {
            activeuavvictim = 1;
        }
    } else {
        activeuavvictim = isdefined(level.activeuavs[victim.entnum]) && level.activeuavs[victim.entnum] > 0;
    }
    if (activeuavvictim == 1) {
        if (player hasperk(#"specialty_gpsjammer")) {
            player stats::function_dad108fa(#"perk_gpsjammer_immune_kills", 1);
        }
    }
    if (player.lastweaponchange + 5000 > time) {
        if (player hasperk(#"specialty_fastweaponswitch")) {
            player stats::function_dad108fa(#"perk_fastweaponswitch_kill_after_swap", 1);
        }
    }
    if (player.scavenged == 1) {
        if (player hasperk(#"specialty_scavenger")) {
            player stats::function_dad108fa(#"perk_scavenger_kills_after_resupply", 1);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x0
// Checksum 0xc7f439cd, Offset: 0x1610
// Size: 0x86
function flakjacketprotected(weapon, attacker) {
    if (weapon.name == #"claymore") {
        self.flakjacketclaymore[attacker.clientid] = 1;
    }
    self stats::function_dad108fa(#"survive_with_flak", 1);
    self.challenge_lastsurvivewithflakfrom = attacker;
    self.challenge_lastsurvivewithflaktime = gettime();
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xaaf3b0c1, Offset: 0x16a0
// Size: 0x106
function earnedkillstreak() {
    gear = self function_b958b70d(self.class_num, "tacticalgear");
    if (gear === #"gear_scorestreakcharge") {
        self stats::function_dad108fa(#"hash_656a2ab7e777796b", 1);
        if (isdefined(self.var_ea1458aa)) {
            if (!isdefined(self.var_ea1458aa.var_829c3e81)) {
                self.var_ea1458aa.var_829c3e81 = 0;
            }
            self.var_ea1458aa.var_829c3e81++;
            if (self.var_ea1458aa.var_829c3e81 == 5) {
                self stats::function_dad108fa(#"hash_1dd0ef4785aa4084", 1);
                self.var_ea1458aa.var_829c3e81 = 0;
            }
        }
    }
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xc1106cbd, Offset: 0x17b0
// Size: 0x10c
function genericbulletkill(data, victim, weapon) {
    player = self;
    time = data.time;
    if (data.victim.idflagstime == time) {
        if (data.victim.idflags & 8) {
            player stats::function_dad108fa(#"kill_enemy_through_objects", 1);
            if (isdefined(weapon) && weaponhasattachment(weapon, "fmj")) {
                player stats::function_dad108fa(#"kill_enemy_through_objects_with_fmj", 1);
            }
        }
    }
    player function_80327323(data);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x2ebbd90c, Offset: 0x18c8
// Size: 0xb4
function function_80327323(data) {
    player = self;
    attackerstance = data.attackerstance;
    if (isdefined(attackerstance)) {
        if (attackerstance == #"crouch") {
            player stats::function_dad108fa(#"kill_enemy_while_crouched", 1);
        } else if (attackerstance == #"prone") {
            player stats::function_dad108fa(#"kill_enemy_while_prone", 1);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa1dff7ee, Offset: 0x1988
// Size: 0x182
function ishighestscoringplayer(player) {
    if (!isdefined(player.score) || player.score < 1) {
        return 0;
    }
    players = level.players;
    if (level.teambased) {
        team = player.pers[#"team"];
    } else {
        team = "all";
    }
    highscore = player.score;
    for (i = 0; i < players.size; i++) {
        if (!isdefined(players[i].score)) {
            continue;
        }
        if (players[i] == player) {
            continue;
        }
        if (players[i].score < 1) {
            continue;
        }
        if (team != "all" && players[i].pers[#"team"] != team) {
            continue;
        }
        if (players[i].score >= highscore) {
            return 0;
        }
    }
    return 1;
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb422da06, Offset: 0x1b18
// Size: 0x148
function spawnwatcher() {
    self endon(#"disconnect", #"killspawnmonitor");
    self.pers[#"stickexplosivekill"] = 0;
    self.pers[#"pistolheadshot"] = 0;
    self.pers[#"assaultrifleheadshot"] = 0;
    self.pers[#"killnemesis"] = 0;
    while (1) {
        self waittill(#"spawned_player");
        self.pers[#"longshotsperlife"] = 0;
        self.weaponkills = [];
        self.attachmentkills = [];
        self.retreivedblades = 0;
        self.lastreloadtime = 0;
        self.crossbowclipkillcount = 0;
        self thread watchfordtp();
        self thread watchformantle();
        self thread monitor_player_sprint();
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xbd0cb37a, Offset: 0x1c68
// Size: 0x76
function watchfordtp() {
    self endon(#"disconnect", #"death", #"killdtpmonitor");
    self.dtptime = 0;
    while (1) {
        self waittill(#"dtp_end");
        self.dtptime = gettime() + 4000;
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x74221a0c, Offset: 0x1ce8
// Size: 0x82
function watchformantle() {
    self endon(#"disconnect", #"death", #"killmantlemonitor");
    self.mantletime = 0;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"mantle_start");
        self.mantletime = waitresult.end_time;
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3676f83f, Offset: 0x1d78
// Size: 0x2c
function disarmedhackedcarepackage() {
    self stats::function_dad108fa(#"disarm_hacked_carepackage", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5db10aa1, Offset: 0x1db0
// Size: 0x54
function destroyed_car() {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    self stats::function_dad108fa(#"destroy_car", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9c61b271, Offset: 0x1e10
// Size: 0xb4
function killednemesis() {
    if (!isdefined(self.pers[#"killnemesis"])) {
        self.pers[#"killnemesis"] = 0;
    }
    self.pers[#"killnemesis"]++;
    if (self.pers[#"killnemesis"] >= 5) {
        self.pers[#"killnemesis"] = 0;
        self stats::function_dad108fa(#"kill_nemesis", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xae1126af, Offset: 0x1ed0
// Size: 0x2c
function killwhiledamagingwithhpm() {
    self stats::function_dad108fa(#"kill_while_damaging_with_microwave_turret", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x8d74778c, Offset: 0x1f08
// Size: 0x2c
function longdistancehatchetkill() {
    self stats::function_dad108fa(#"long_distance_hatchet_kill", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf52a9fc4, Offset: 0x1f40
// Size: 0x2c
function blockedsatellite() {
    self stats::function_dad108fa(#"activate_cuav_while_enemy_satelite_active", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0xae3705fb, Offset: 0x1f78
// Size: 0x7c
function longdistancekill() {
    self.pers[#"longshotsperlife"]++;
    if (self.pers[#"longshotsperlife"] >= 3) {
        self.pers[#"longshotsperlife"] = 0;
        self stats::function_dad108fa(#"longshot_3_onelife", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0xa030a21c, Offset: 0x2000
// Size: 0x18a
function challengeroundend(data) {
    player = data.player;
    winner = data.winner;
    if (endedearly(winner, winner == "tie")) {
        return;
    }
    if (level.teambased) {
        winnerscore = game.stat[#"teamscores"][winner];
        loserscore = getlosersteamscores(winner);
    }
    switch (level.gametype) {
    case #"sd":
        if (player.team == winner) {
            if (game.challenge[winner][#"allalive"]) {
                player stats::function_d40764f3(#"round_win_no_deaths", 1);
            }
            if (isdefined(player.lastmansddefeat3enemies)) {
                player stats::function_d40764f3(#"last_man_defeat_3_enemies", 1);
            }
        }
        break;
    default:
        break;
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x1e6130b1, Offset: 0x2198
// Size: 0xc4
function last_man_defeat_3_enemies(team) {
    if (isdefined(level.alivecount) && level.alivecount[team] === 1 && isdefined(level.aliveplayers[team]) && level.aliveplayers[team].size == 1) {
        player = level.aliveplayers[team][0];
        if (isdefined(player.var_66cfa07f)) {
            player stats::function_bb7eedf0(#"last_man_defeat_3_enemies", 1);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x91563c22, Offset: 0x2268
// Size: 0x126
function roundend(winner) {
    waitframe(1);
    data = spawnstruct();
    data.time = gettime();
    if (level.teambased) {
        if (isdefined(winner) && isdefined(level.teams[winner])) {
            data.winner = winner;
        }
    } else if (isdefined(winner)) {
        data.winner = winner;
    }
    for (index = 0; index < level.placement[#"all"].size; index++) {
        data.player = level.placement[#"all"][index];
        if (isdefined(data.player)) {
            data.place = index;
            dochallengecallback("roundEnd", data);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd5280286, Offset: 0x2398
// Size: 0xe3c
function function_90185171(totaltimeplayed, credits, casexp) {
    if (!sessionmodeisonlinegame() || !(isdefined(level.rankedmatch) && level.rankedmatch)) {
        return;
    }
    player = self;
    if (!isdefined(player) || !isplayer(player) || isbot(player)) {
        return;
    }
    var_dbb56f7e = getdvarint(#"hash_4574f0b1608d9ea8", 0);
    if (var_dbb56f7e && player function_875e4dbc() && totaltimeplayed > 0) {
        timeoffset = getdvarint(#"live_timewarp", 0) * 60 * 60 * 24;
        timemultiplier = getdvarfloat(#"hash_2956967233bebd4f", 1);
        var_bf107145 = totaltimeplayed;
        if (timemultiplier > 1) {
            var_bf107145 = int(timemultiplier * totaltimeplayed);
        }
        player function_cce105c8(#"hash_499fb9199cdc0a5e", 1, int(var_bf107145), 2, int(timeoffset));
    }
    /#
        println("<unknown string>" + player.name);
    #/
    /#
        println("<unknown string>" + (isdefined(credits) ? credits : "<unknown string>"));
    #/
    /#
        println("<unknown string>" + (isdefined(casexp) ? casexp : "<unknown string>"));
    #/
    /#
        println("<unknown string>" + (isdefined(totaltimeplayed) ? totaltimeplayed : "<unknown string>"));
    #/
    /#
        println("<unknown string>" + (isdefined(player.pers[#"participation"]) ? player.pers[#"participation"] : "<unknown string>"));
    #/
    if (credits <= 0 && casexp <= 0) {
        return;
    }
    if (credits > 0 || casexp > 0) {
        if (!isdefined(totaltimeplayed) || totaltimeplayed <= 0) {
            return;
        }
        /#
            var_dfa63097 = getdvarint(#"hash_6f93a5b2133445ec", 0);
            if (var_dfa63097 > 0) {
                credits = var_dfa63097;
                player.timeplayed[#"total"]++;
                player.pers[#"participation"]++;
            }
            var_159015d5 = getdvarint(#"hash_69a151539f8595de", 0);
            if (var_159015d5 > 0) {
                casexp = var_159015d5;
                player.timeplayed[#"total"]++;
                player.pers[#"participation"]++;
            }
        #/
        if (!isdefined(player.pers[#"participation"]) || player.pers[#"participation"] < 1) {
            if (!sessionmodeiswarzonegame()) {
                /#
                    println(player.name + "<unknown string>");
                #/
                return;
            }
        }
        if (!sessionmodeiswarzonegame() && isdefined(player.pers[#"controllerparticipation"])) {
            if (isdefined(player.pers[#"controllerparticipationchecks"]) && player.pers[#"controllerparticipationchecks"]) {
                if (player.pers[#"controllerparticipationchecks"] >= level.var_42dca1dd) {
                    var_7be1e671 = player.pers[#"controllerparticipation"] / player.pers[#"controllerparticipationchecks"];
                    if (var_7be1e671 < level.var_8e1c2aa1) {
                        self.pers[#"controllerparticipationendgameresult"] = 0;
                        /#
                            println(player.name + "<unknown string>" + var_7be1e671 + "<unknown string>" + level.var_8e1c2aa1 + "<unknown string>");
                        #/
                        return;
                    } else {
                        self.pers[#"controllerparticipationendgameresult"] = 1;
                    }
                }
            }
        }
        if (getdvarint(#"loot_enableblackmarket", 1)) {
            credit_multiplier = max(player function_c52bcf79(), getdvarfloat(#"scr_credit_scale", 1));
            credits = credits * credit_multiplier;
            tier_boost = player stats::function_ff8f4f17(#"tier_boost");
            if (isdefined(tier_boost) && tier_boost > 0) {
                tier_boost = min(tier_boost, getdvarint(#"hash_20997c814ed4b7ed", 25));
                credits = credits + credits * tier_boost / 100;
                /#
                    println("<unknown string>" + player.name + "<unknown string>" + tier_boost);
                #/
            }
            bo_pass_tier_boost = player stats::function_ff8f4f17(#"bo_pass_tier_boost");
            if (isdefined(bo_pass_tier_boost) && bo_pass_tier_boost > 0) {
                credits = credits + credits * bo_pass_tier_boost / 100;
                /#
                    println("<unknown string>" + player.name + "<unknown string>" + bo_pass_tier_boost);
                #/
            }
            bo_pass_party_tier_boost = player stats::function_ff8f4f17(#"bo_pass_party_tier_boost");
            if (isdefined(bo_pass_party_tier_boost) && bo_pass_party_tier_boost > 0) {
                credits = credits + credits * bo_pass_party_tier_boost / 100;
                /#
                    println("<unknown string>" + player.name + "<unknown string>" + bo_pass_party_tier_boost);
                #/
            }
            /#
                println("<unknown string>" + player.name + "<unknown string>" + totaltimeplayed + "<unknown string>" + credits + "<unknown string>" + casexp);
            #/
            if (player function_875e4dbc()) {
                var_91503b6f = getdvarfloat(#"hash_4da039b4bc312fc1", 1.1);
                credits = credits * var_91503b6f;
            }
            var_1ed920ee = 0;
            var_5f508856 = 0;
            if (sessionmodeismultiplayergame()) {
                var_1ed920ee = getdvarint(#"hash_3bccd5b062faadee", 1000);
                var_5f508856 = getdvarint(#"hash_3ded794ceefdb21d", 1000);
            } else if (sessionmodeiswarzonegame()) {
                var_1ed920ee = getdvarint(#"hash_3be0d3b0630b5392", 1000);
                var_5f508856 = getdvarint(#"hash_3e456f4cef4816f5", 1000);
            }
            credits = min(credits, var_1ed920ee);
            casexp = min(casexp, var_5f508856);
            modeindex = 1;
            if (sessionmodeiswarzonegame()) {
                modeindex = 2;
            }
            if (credits > 0) {
                if (getdvarint(#"loot_tier_skips_enabled", 0) == 1 && getdvarint(#"lootcontracts_daily_tier_skip", 0) != 1) {
                    if (!isdefined(player.pers[#"hash_6344af0b142ed0b6"])) {
                        player.pers[#"hash_6344af0b142ed0b6"] = 0;
                    }
                    if (player.pers[#"hash_6344af0b142ed0b6"]) {
                        player function_cce105c8(#"tier_skip", 1, 1, 2, modeindex);
                    }
                }
                if (sessionmodeismultiplayergame() && getdvarint(#"hash_ed47eb88ebf25b2", 1) || sessionmodeiswarzonegame() && getdvarint(#"hash_eb27cb88ea23be6", 1)) {
                    /#
                        println("<unknown string>" + credits);
                    #/
                    player function_cce105c8(#"hash_680a99fa024dd073", 1, int(credits), 2, modeindex, 3, int(totaltimeplayed));
                }
            }
            if (casexp > 0) {
                if (sessionmodeismultiplayergame() && getdvarint(#"hash_107f9b52b0455b54", 1) || sessionmodeiswarzonegame() && getdvarint(#"hash_10d78d52b08fb960", 1)) {
                    var_ae857992 = getdvarint(#"hash_60d812bef0f782fb", 2);
                    /#
                        println("<unknown string>" + casexp);
                    #/
                    player function_cce105c8(#"hash_7c81ccc32581870e", 1, int(casexp), 2, modeindex, 3, int(totaltimeplayed), 4, int(var_ae857992));
                }
            }
        }
    }
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x61b22ceb, Offset: 0x31e0
// Size: 0xcc
function function_659f7dc(var_1ef5a3ba, var_3e853b2e, var_25ad32e1) {
    self util::function_22bf0a4a();
    if (isdefined(var_1ef5a3ba) && var_1ef5a3ba > 0) {
        var_5024088b = float(var_1ef5a3ba) / 1000;
        credits = var_5024088b * var_3e853b2e;
        casexp = var_5024088b * var_25ad32e1;
        if (credits > 0) {
            self function_90185171(var_5024088b, credits, casexp);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x5 linked
// Checksum 0x7b033bc9, Offset: 0x32b8
// Size: 0x15c
function private function_d6f929d6() {
    wait(2);
    level.var_4f654f3a = 1;
    var_b50d0caa = getdvarfloat(#"hash_13a346481f092189", 0);
    var_7f6396f0 = getdvarfloat(#"hash_5b9ffb659d9e0093", 0);
    foreach (player in level.players) {
        if (isdefined(player.pers[#"hash_150795bee4d46ce4"])) {
            var_28ee869a = gettime() - player.pers[#"hash_150795bee4d46ce4"];
            player function_659f7dc(var_28ee869a, var_b50d0caa, var_7f6396f0);
        }
    }
    function_f4f6d8a1();
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4b526f3d, Offset: 0x3420
// Size: 0x1ec
function gameend(winner, var_c1e98979) {
    waitframe(1);
    data = spawnstruct();
    data.time = gettime();
    if (level.teambased) {
        if (isdefined(winner) && isdefined(level.teams[winner])) {
            data.winner = winner;
        }
    } else if (isdefined(winner) && isplayer(winner)) {
        data.winner = winner;
    }
    for (index = 0; index < level.placement[#"all"].size; index++) {
        data.player = level.placement[#"all"][index];
        data.place = index;
        if (isdefined(data.player)) {
            dochallengecallback("gameEnd", data);
        }
    }
    if (sessionmodeismultiplayergame() && sessionmodeisonlinegame() && level.rankedmatch) {
        if (getdvarint(#"hash_7902ca2d14eb933b", 0) == 1) {
            level.var_4f654f3a = 1;
            function_f4f6d8a1();
        } else {
            thread function_d6f929d6();
        }
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x885a2a86, Offset: 0x3618
// Size: 0xde
function function_1e064861(type, var_a7674114) {
    if (type == self.pers[#"hash_4a01db5796cf12b1"]) {
        self.pers[#"hash_3b7fc8c62a7d4420"]++;
    } else {
        self.pers[#"hash_3b7fc8c62a7d4420"] = 1;
        self.pers[#"hash_4a01db5796cf12b1"] = type;
    }
    if (self.pers[#"hash_3b7fc8c62a7d4420"] > self.pers[var_a7674114]) {
        self.pers[var_a7674114] = self.pers[#"hash_3b7fc8c62a7d4420"];
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa0da4a8c, Offset: 0x3700
// Size: 0x2e8
function controllerparticipationcheck() {
    if (!isdefined(self)) {
        return 0;
    }
    if (!isdefined(self.pers[#"controllerparticipationchecksskipped"])) {
        self.pers[#"controllerparticipationchecksskipped"] = 0;
    }
    if (self.sessionstate != "playing" || isdefined(self.var_4c45f505) && self.var_4c45f505) {
        self.pers[#"controllerparticipationchecksskipped"]++;
        return 0;
    }
    self.pers[#"controllerparticipationchecks"]++;
    var_51ba979b = #"failure";
    var_a7674114 = "controllerParticipationConsecutiveFailureMax";
    var_fb144707 = self function_1bc04df9();
    if (var_fb144707 >= level.var_5b7e9056) {
        self.pers[#"controllerparticipation"]++;
        var_51ba979b = #"success";
        var_a7674114 = "controllerParticipationConsecutiveSuccessMax";
        if (self.pers[#"controllerparticipationinactivitywarnings"]) {
            self.pers[#"controllerparticipationsuccessafterinactivitywarning"] = 1;
        }
    }
    self function_1e064861(var_51ba979b, var_a7674114);
    if (!self.pers[#"controllerparticipationsuccessafterinactivitywarning"]) {
        if (self.pers[#"controllerparticipationchecks"] >= level.var_5d96cc20) {
            var_b06a954d = self.pers[#"controllerparticipation"] / self.pers[#"controllerparticipationchecks"];
            if (var_b06a954d < level.var_b6752258) {
                if (!self.pers[#"controllerparticipationinactivitywarnings"]) {
                    self.pers[#"controllerparticipationinactivitywarnings"]++;
                    self iprintlnbold(#"hash_59bd89e170a924ac");
                } else {
                    self.pers[#"controllerparticipationendgameresult"] = -2;
                    if (isdefined(level.gamehistoryplayerkicked)) {
                        self thread [[ level.gamehistoryplayerkicked ]]();
                    }
                    kick(self getentitynumber(), "GAME/DROPPEDFORINACTIVITY");
                }
            }
        }
    }
    return 1;
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x592b6093, Offset: 0x39f0
// Size: 0x380
function function_57d8515c() {
    if (!sessionmodeisonlinegame() || !(isdefined(level.rankedmatch) && level.rankedmatch)) {
        return;
    }
    var_37c0d246 = 25;
    level.var_5b7e9056 = isdefined(getgametypesetting(#"hash_410c5c7c1e60b534")) ? getgametypesetting(#"hash_410c5c7c1e60b534") : 0;
    level.var_df437ed2 = isdefined(getgametypesetting(#"hash_451245a24412d90f")) ? getgametypesetting(#"hash_451245a24412d90f") : 0;
    level.var_42dca1dd = isdefined(getgametypesetting(#"hash_6ae29c8144cb7659")) ? getgametypesetting(#"hash_6ae29c8144cb7659") : 0;
    level.var_8e1c2aa1 = isdefined(getgametypesetting(#"hash_35e9fc8eee6881e0")) ? getgametypesetting(#"hash_35e9fc8eee6881e0") : 0;
    level.var_5d96cc20 = isdefined(getgametypesetting(#"hash_7adb62a64c6d963")) ? getgametypesetting(#"hash_7adb62a64c6d963") : 0;
    level.var_b6752258 = isdefined(getgametypesetting(#"hash_1df445b9d1af641f")) ? getgametypesetting(#"hash_1df445b9d1af641f") : 0;
    level waittill(#"game_playing");
    for (;;) {
        wait(level.var_df437ed2);
        var_a3b5975e = 0;
        players = getplayers();
        foreach (player in players) {
            if (!isdefined(player) || !isplayer(player) || isbot(player)) {
                continue;
            }
            if (player controllerparticipationcheck()) {
                var_a3b5975e++;
            }
            if (12 <= var_a3b5975e) {
                waitframe(1);
            }
        }
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc0ab5801, Offset: 0x3d78
// Size: 0x4c
function getfinalkill(player) {
    if (isplayer(player)) {
        player stats::function_dad108fa(#"get_final_kill", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4d0f80d6, Offset: 0x3dd0
// Size: 0xdc
function destroy_killstreak_vehicle(weapon, vehicle, hatchet_kill_stat) {
    if (!isplayer(self) || !isdefined(weapon)) {
        return;
    }
    controlled = isdefined(vehicle.controlled) ? vehicle.controlled : 1;
    self destroyscorestreak(weapon, controlled, 1);
    if (weapon.rootweapon.name == "hatchet" && isdefined(hatchet_kill_stat)) {
        self stats::function_dad108fa(hatchet_kill_stat, 1);
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6f3cbe7d, Offset: 0x3eb8
// Size: 0xf4
function capturedcrate(owner) {
    if (isdefined(self.lastrescuedby) && isdefined(self.lastrescuedtime)) {
        if (self.lastrescuedtime + 5000 > gettime()) {
            self.lastrescuedby stats::function_dad108fa(#"defend_teammate_who_captured_package", 1);
        }
    }
    if (owner == self) {
        self stats::function_dad108fa(#"capture_own_carepackage", 1);
    } else if (level.teambased && owner.team != self.team || !level.teambased) {
        self stats::function_dad108fa(#"capture_enemy_carepackage", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xc41f87b9, Offset: 0x3fb8
// Size: 0x66c
function destroyscorestreak(weapon, playercontrolled, groundbased, countaskillstreakvehicle = 1) {
    if (!isplayer(self) || !isdefined(weapon)) {
        return;
    }
    if (groundbased) {
        self stats::function_dad108fa(#"destroy_groundbased_scorestreak", 1);
    }
    if (isdefined(level.killstreakweapons[weapon])) {
        if (level.killstreakweapons[weapon] == "dart") {
            self stats::function_dad108fa(#"destroy_scorestreak_with_dart", 1);
        }
    } else if (weapon.issignatureweapon) {
        self stats::function_dad108fa(#"destroy_scorestreak_with_specialist", 1);
    } else {
        weaponclass = util::getweaponclass(weapon);
        if (isdefined(weaponclass) && weaponclass == #"weapon_launcher") {
            self stats::function_dad108fa(#"hash_be93d1227e6db1", 1);
        }
    }
    if (!isdefined(playercontrolled) || playercontrolled == 0) {
        if (self function_6c32d092(#"talent_coldblooded")) {
            self stats::function_dad108fa(#"destroy_ai_scorestreak_coldblooded", 1);
        }
        if (self util::has_cold_blooded_perk_purchased_and_equipped()) {
            if (self util::has_blind_eye_perk_purchased_and_equipped()) {
                if (groundbased) {
                    self.pers[#"challenge_destroyed_ground"]++;
                } else {
                    self.pers[#"challenge_destroyed_air"]++;
                }
                if (self.pers[#"challenge_destroyed_ground"] > 0 && self.pers[#"challenge_destroyed_air"] > 0) {
                    self stats::function_dad108fa(#"destroy_air_and_ground_blindeye_coldblooded", 1);
                    self.pers[#"challenge_destroyed_air"] = 0;
                    self.pers[#"challenge_destroyed_ground"] = 0;
                }
            }
        }
    }
    if (!isdefined(self.pers[#"challenge_destroyed_killstreak"])) {
        self.pers[#"challenge_destroyed_killstreak"] = 0;
    }
    self.pers[#"challenge_destroyed_killstreak"]++;
    if (self.pers[#"challenge_destroyed_killstreak"] >= 5) {
        self.pers[#"challenge_destroyed_killstreak"] = 0;
        self stats::function_e24eec31(weapon, #"destroy_5_killstreak", 1);
        self stats::function_e24eec31(weapon, #"destroy_5_killstreak_vehicle", 1);
    }
    self stats::function_e24eec31(weapon, #"destroy_killstreak", 1);
    if (self function_6c32d092(#"talent_engineer")) {
        self stats::function_dad108fa(#"destroy_scorestreaks_equipment_engineer", 1);
    }
    if (isdefined(weapon.attachments) && weapon.attachments.size > 0) {
        if (self weaponhasattachmentandunlocked(weapon, "fmj2")) {
            self stats::function_dad108fa(#"hash_8bd14f245fe35fb", 1);
        }
        if (weaponhasattachment(weapon, "fmj", "rf")) {
            self stats::function_dad108fa(#"destroy_scorestreak_rapidfire_fmj", 1);
        }
        if (isdefined(weaponclass) && weaponclass == #"weapon_launcher") {
            if (self weaponhasattachmentandunlocked(weapon, "fastreload")) {
                self stats::function_dad108fa(#"hash_4b19afce40dfc918", 1);
            }
            if (self weaponhasattachmentandunlocked(weapon, "supply")) {
                self stats::function_dad108fa(#"hash_403b2535e53d1991", 1);
            }
            if (self weaponhasattachmentandunlocked(weapon, "damage")) {
                self stats::function_dad108fa(#"hash_4ad196e3eaceeb26", 1);
            }
        }
    }
    if (isdefined(level.var_c8de519d) && isdefined(level.var_c8de519d.var_ec391d55)) {
        self [[ level.var_c8de519d.var_ec391d55 ]](weapon, playercontrolled, groundbased, countaskillstreakvehicle);
    }
    self thread watchforrapiddestroy(weapon);
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xed2bfc46, Offset: 0x4630
// Size: 0x32c
function function_24db0c33(weapon, destroyedobject) {
    weaponclass = util::getweaponclass(weapon);
    weaponpickedup = 0;
    if (isdefined(self.pickedupweapons) && isdefined(self.pickedupweapons[weapon])) {
        weaponpickedup = 1;
    }
    self stats::function_eec52333(weapon, #"destroyed", 1, self.class_num, weaponpickedup);
    if (self function_6c32d092(#"talent_engineer")) {
        self stats::function_dad108fa(#"destroy_scorestreaks_equipment_engineer", 1);
    }
    if (isdefined(weaponclass) && weaponclass == #"weapon_launcher") {
        self stats::function_dad108fa(#"hash_be93d1227e6db1", 1);
        if (isdefined(weapon.attachments) && weapon.attachments.size > 0) {
            if (self weaponhasattachmentandunlocked(weapon, "fastreload")) {
                self stats::function_dad108fa(#"hash_4b19afce40dfc918", 1);
            }
            if (self weaponhasattachmentandunlocked(weapon, "supply")) {
                self stats::function_dad108fa(#"hash_403b2535e53d1991", 1);
            }
            if (self weaponhasattachmentandunlocked(weapon, "damage")) {
                self stats::function_dad108fa(#"hash_4ad196e3eaceeb26", 1);
            }
        }
    }
    if (destroyedobject.var_76ce72e8 === 1) {
        if (isdefined(weapon) && weapon.isbulletweapon && (sessionmodeismultiplayergame() || sessionmodeiswarzonegame())) {
            self stats::function_dad108fa(#"destroy_equipment_with_bullet", 1);
        }
    }
    if (sessionmodeiswarzonegame() && !(destroyedobject.name === #"eq_sensor")) {
        self stats::function_dad108fa(#"destroy_equipment", 1);
        callback::callback(#"hash_67dd51a5d529c64c");
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc35b7b43, Offset: 0x4968
// Size: 0xbc
function watchforrapiddestroy(weapon) {
    self endon(#"disconnect");
    if (!isdefined(self.challenge_previousdestroyweapon) || self.challenge_previousdestroyweapon != weapon) {
        self.challenge_previousdestroyweapon = weapon;
        self.challenge_previousdestroycount = 0;
    } else {
        self.challenge_previousdestroycount++;
    }
    self waittilltimeoutordeath(4);
    if (self.challenge_previousdestroycount > 1) {
        self stats::function_e24eec31(weapon, #"destroy_2_killstreaks_rapidly", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x0
// Checksum 0xd775f5f6, Offset: 0x4a30
// Size: 0x2be
function capturedobjective(capturetime, objective) {
    if (isdefined(self.smokegrenadetime) && isdefined(self.smokegrenadeposition)) {
        jumpcmp(self.smokegrenadetime + 14000 < capturetime) LOC_00000116;
        distsq = distancesquared(self.smokegrenadeposition, self.origin);
        jumpcmp(distsq > 57600) LOC_00000116;
        if (self util::is_item_purchased(#"willy_pete")) {
            self stats::function_dad108fa(#"capture_objective_in_smoke", 1);
        }
        self stats::function_e24eec31(getweapon(#"willy_pete"), #"combatrecordstat", 1);
    } else {
    LOC_00000116:
        heroabilitywasactiverecently = isdefined(self.heroabilityactive) || isdefined(self.heroabilitydectivatetime) && self.heroabilitydectivatetime > gettime() - 3000;
        if (heroabilitywasactiverecently && isdefined(self.heroability) && self.heroability.name == "gadget_camo") {
            scoreevents::processscoreevent(#"optic_camo_capture_objective", self);
        }
        if (isdefined(objective)) {
            if (isdefined(level.capturedobjectivefunction) && isdefined(capturetime)) {
                self [[ level.capturedobjectivefunction ]](objective, capturetime);
            }
            if (self.challenge_objectivedefensive === objective) {
                if ((isdefined(self.challenge_objectivedefensivekillcount) ? self.challenge_objectivedefensivekillcount : 0) > 0 && ((isdefined(self.recentkillcount) ? self.recentkillcount : 0) > 2 || self.challenge_objectivedefensivetriplekillmedalorbetterearned === 1)) {
                    self stats::function_dad108fa(#"triple_kill_defenders_and_capture", 1);
                }
                self.challenge_objectivedefensivekillcount = 0;
                self.challenge_objectivedefensive = undefined;
                self.challenge_objectivedefensivetriplekillmedalorbetterearned = undefined;
            }
        }
        self notify(#"capturedobjective", {#var_eced93f5:objective, #capturetime:capturetime});
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x600fe81e, Offset: 0x4cf8
// Size: 0x44
function hackedordestroyedequipment() {
    if (self util::has_hacker_perk_purchased_and_equipped()) {
        self stats::function_dad108fa(#"perk_hacker_destroy", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0x53ea541a, Offset: 0x4d48
// Size: 0xb4
function bladekill() {
    if (!isdefined(self.pers[#"bladekills"])) {
        self.pers[#"bladekills"] = 0;
    }
    self.pers[#"bladekills"]++;
    if (self.pers[#"bladekills"] >= 15) {
        self.pers[#"bladekills"] = 0;
        self stats::function_dad108fa(#"kill_15_with_blade", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0xbd96d57b, Offset: 0x4e08
// Size: 0x4c
function destroyedexplosive(weapon) {
    self destroyedequipment(weapon);
    self stats::function_dad108fa(#"destroy_explosive", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4928776e, Offset: 0x4e60
// Size: 0x2c
function assisted() {
    self stats::function_dad108fa(#"assist", 1);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb250b162, Offset: 0x4e98
// Size: 0xf4
function earnedmicrowaveassistscore(score) {
    self stats::function_dad108fa(#"assist_score_microwave_turret", score);
    self stats::function_dad108fa(#"assist_score_killstreak", score);
    self stats::function_e24eec31(getweapon(#"microwave_turret_deploy"), #"assists", 1);
    self stats::function_e24eec31(getweapon(#"microwave_turret_deploy"), #"assist_score", score);
    self contracts::increment_contract(#"hash_4840654e4b2597a5", score);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x74f5fd8f, Offset: 0x4f98
// Size: 0xf4
function earnedcuavassistscore(score) {
    self stats::function_dad108fa(#"assist_score_cuav", score);
    self stats::function_dad108fa(#"assist_score_killstreak", score);
    self stats::function_e24eec31(getweapon(#"counteruav"), #"assists", 1);
    self stats::function_e24eec31(getweapon(#"counteruav"), #"assist_score", score);
    self contracts::increment_contract(#"hash_4840654e4b2597a5", score);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf616b95c, Offset: 0x5098
// Size: 0xf4
function earneduavassistscore(score) {
    self stats::function_dad108fa(#"assist_score_uav", score);
    self stats::function_dad108fa(#"assist_score_killstreak", score);
    self stats::function_e24eec31(getweapon(#"uav"), #"assists", 1);
    self stats::function_e24eec31(getweapon(#"uav"), #"assist_score", score);
    self contracts::increment_contract(#"hash_4840654e4b2597a5", score);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x48666845, Offset: 0x5198
// Size: 0xf4
function earnedsatelliteassistscore(score) {
    self stats::function_dad108fa(#"assist_score_satellite", score);
    self stats::function_dad108fa(#"assist_score_killstreak", score);
    self stats::function_e24eec31(getweapon(#"satellite"), #"assists", 1);
    self stats::function_e24eec31(getweapon(#"satellite"), #"assist_score", score);
    self contracts::increment_contract(#"hash_4840654e4b2597a5", score);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc66d7044, Offset: 0x5298
// Size: 0xf4
function earnedempassistscore(score) {
    self stats::function_dad108fa(#"assist_score_emp", score);
    self stats::function_dad108fa(#"assist_score_killstreak", score);
    self stats::function_e24eec31(getweapon(#"emp_turret"), #"assists", 1);
    self stats::function_e24eec31(getweapon(#"emp_turret"), #"assist_score", score);
    self contracts::increment_contract(#"hash_4840654e4b2597a5", score);
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x11f45d7d, Offset: 0x5398
// Size: 0xae
function teamcompletedchallenge(team, challenge) {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].team) && players[i].team == team) {
            players[i] stats::function_d40764f3(challenge, 1);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe81a0a34, Offset: 0x5450
// Size: 0x52
function endedearly(winner, tie) {
    if (level.hostforcedend) {
        return 1;
    }
    if (!isdefined(winner)) {
        return 1;
    }
    if (level.teambased) {
        if (tie) {
            return 1;
        }
    }
    return 0;
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9fb4d58b, Offset: 0x54b0
// Size: 0xbc
function getlosersteamscores(winner) {
    teamscores = 0;
    foreach (team, _ in level.teams) {
        if (team == winner) {
            continue;
        }
        teamscores = teamscores + game.stat[#"teamscores"][team];
    }
    return teamscores;
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x0
// Checksum 0xd9909638, Offset: 0x5578
// Size: 0xaa
function didloserfailchallenge(winner, challenge) {
    foreach (team, _ in level.teams) {
        if (team == winner) {
            continue;
        }
        if (game.challenge[team][challenge]) {
            return 0;
        }
    }
    return 1;
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x7aeac033, Offset: 0x5630
// Size: 0xb6
function challengegameend(data) {
    player = data.player;
    winner = data.winner;
    if (endedearly(winner, winner == "tie")) {
        return;
    }
    if (level.teambased) {
        winnerscore = game.stat[#"teamscores"][winner];
        loserscore = getlosersteamscores(winner);
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x20661a39, Offset: 0x56f0
// Size: 0x254
function multikill(killcount, weapon) {
    if (!sessionmodeismultiplayergame() && !sessionmodeiswarzonegame()) {
        return;
    }
    doublekill = int(killcount / 2);
    if (doublekill > 0) {
        self stats::function_e24eec31(weapon, #"doublekill", doublekill);
        if (weapon.isheavyweapon) {
            self stats::function_dad108fa(#"multikill_2_with_heroweapon", doublekill);
        }
    }
    triplekill = int(killcount / 3);
    if (triplekill > 0) {
        if (isdefined(self.lastkillwheninjured)) {
            if (self.lastkillwheninjured + 5000 > gettime()) {
                self stats::function_dad108fa(#"multikill_3_near_death", 1);
            }
        }
        self stats::function_e24eec31(weapon, #"triplekill", triplekill);
        if (weapon.isheavyweapon) {
            self stats::function_dad108fa(#"multikill_3_with_heroweapon", triplekill);
        }
    }
    if (isdefined(self.var_ea1458aa)) {
        if (!isdefined(self.var_ea1458aa.var_e0bfa611)) {
            self.var_ea1458aa.var_e0bfa611 = 0;
        }
        self.var_ea1458aa.var_e0bfa611++;
        self function_a4db0a4c();
    }
    if (isdefined(level.var_c8de519d) && isdefined(level.var_c8de519d.multikill)) {
        self [[ level.var_c8de519d.multikill ]](killcount, weapon, globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800));
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc70db754, Offset: 0x5950
// Size: 0xaa
function function_a4db0a4c() {
    if (!isdefined(self.var_ea1458aa.var_e0bfa611)) {
        return;
    }
    if (!isdefined(self.var_ea1458aa.var_2bad4cbb)) {
        return;
    }
    if (self.var_ea1458aa.var_e0bfa611 > 0 && self.var_ea1458aa.var_2bad4cbb > 0) {
        self stats::function_dad108fa(#"hash_5803a1b332accd42", 1);
        self.var_ea1458aa.var_e0bfa611 = undefined;
        self.var_ea1458aa.var_2bad4cbb = undefined;
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x26593978, Offset: 0x5a08
// Size: 0x34
function domattackermultikill(killcount) {
    self stats::function_d40764f3(#"kill_2_enemies_capturing_your_objective", 1);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0xb87548af, Offset: 0x5a48
// Size: 0x2c
function totaldomination(team) {
    teamcompletedchallenge(team, "control_3_points_3_minutes");
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x0
// Checksum 0xce4e158f, Offset: 0x5a80
// Size: 0xbc
function holdflagentirematch(team, label) {
    switch (label) {
    case #"_a":
        event = "hold_a_entire_match";
        break;
    case #"_b":
        event = "hold_b_entire_match";
        break;
    case #"_c":
        event = "hold_c_entire_match";
        break;
    default:
        return;
    }
    teamcompletedchallenge(team, event);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0xcd480b61, Offset: 0x5b48
// Size: 0x2c
function capturedbfirstminute() {
    self stats::function_d40764f3(#"capture_b_first_minute", 1);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x5e6f506a, Offset: 0x5b80
// Size: 0x2c
function controlzoneentirely(team) {
    teamcompletedchallenge(team, "control_zone_entirely");
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xddbb95b3, Offset: 0x5bb8
// Size: 0x2c
function multi_lmg_smg_kill() {
    self stats::function_dad108fa(#"multikill_3_lmg_or_smg_hip_fire", 1);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0xf295a08e, Offset: 0x5bf0
// Size: 0x74
function killedzoneattacker(weapon) {
    if (weapon.statname == #"planemortar" || weapon.statname == "remote_missile_missile" || weapon.name == #"remote_missile_bomblet") {
        self thread updatezonemultikills();
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0xa1ca1076, Offset: 0x5c70
// Size: 0x10c
function killeddog() {
    origin = self.origin;
    if (level.teambased) {
        teammates = util::get_active_players(self.team);
        foreach (player in teammates) {
            if (player == self) {
                continue;
            }
            distsq = distancesquared(origin, player.origin);
            if (distsq < 57600) {
                self stats::function_dad108fa(#"killed_dog_close_to_teammate", 1);
                break;
            }
        }
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa69c99d2, Offset: 0x5d88
// Size: 0xb6
function updatezonemultikills() {
    self endon(#"disconnect");
    level endon(#"game_ended");
    self notify(#"updaterecentzonekills");
    self endon(#"updaterecentzonekills");
    if (!isdefined(self.recentzonekillcount)) {
        self.recentzonekillcount = 0;
    }
    self.recentzonekillcount++;
    wait(4);
    if (self.recentzonekillcount > 1) {
        self stats::function_dad108fa(#"multikill_2_zone_attackers", 1);
    }
    self.recentzonekillcount = 0;
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x47aac288, Offset: 0x5e48
// Size: 0x2c
function multi_rcbomb_kill() {
    self stats::function_dad108fa(#"multikill_2_with_rcbomb", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x916025dd, Offset: 0x5e80
// Size: 0x2c
function function_46754062() {
    self stats::function_dad108fa(#"hash_709699a31c8f89f7", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x437c3361, Offset: 0x5eb8
// Size: 0x2c
function multi_remotemissile_kill() {
    self stats::function_dad108fa(#"multikill_3_remote_missile", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4ebba45f, Offset: 0x5ef0
// Size: 0x2c
function multi_mgl_kill() {
    self stats::function_dad108fa(#"multikill_3_with_mgl", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0x2f7d58ad, Offset: 0x5f28
// Size: 0x2c
function immediatecapture() {
    self stats::function_d40764f3(#"immediate_capture", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0xaaf8e245, Offset: 0x5f60
// Size: 0x2c
function killedlastcontester() {
    self stats::function_d40764f3(#"contest_then_capture", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x0
// Checksum 0x3e619c04, Offset: 0x5f98
// Size: 0x2c
function bothbombsdetonatewithintime() {
    self stats::function_d40764f3(#"both_bombs_detonate_10_seconds", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd93d6abc, Offset: 0x5fd0
// Size: 0x7e
function calledincarepackage() {
    self.pers[#"carepackagescalled"]++;
    if (self.pers[#"carepackagescalled"] >= 3) {
        self stats::function_dad108fa(#"call_in_3_care_packages", 1);
        self.pers[#"carepackagescalled"] = 0;
    }
}

// Namespace challenges/challenges_shared
// Params 4, eflags: 0x0
// Checksum 0x5a6d495f, Offset: 0x6058
// Size: 0xb4
function destroyedhelicopter(attacker, weapon, damagetype, playercontrolled) {
    if (!isplayer(attacker)) {
        return;
    }
    attacker destroyedaircraft(attacker, weapon, 0, 1);
    if (isdefined(damagetype) && (damagetype == "MOD_RIFLE_BULLET" || damagetype == "MOD_PISTOL_BULLET")) {
        attacker stats::function_dad108fa(#"destroyed_helicopter_with_bullet", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x0
// Checksum 0x31e536bb, Offset: 0x6118
// Size: 0xbc
function destroyedqrdrone(damagetype, weapon) {
    self destroyscorestreak(weapon, 1, 0);
    self stats::function_dad108fa(#"destroy_qrdrone", 1);
    if (damagetype == "MOD_RIFLE_BULLET" || damagetype == "MOD_PISTOL_BULLET") {
        self stats::function_dad108fa(#"destroyed_qrdrone_with_bullet", 1);
    }
    self destroyedplayercontrolledaircraft();
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9a9a771a, Offset: 0x61e0
// Size: 0x4c
function destroyedplayercontrolledaircraft() {
    if (self hasperk(#"specialty_noname")) {
        self stats::function_dad108fa(#"destroy_helicopter", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x83dea640, Offset: 0x6238
// Size: 0x29c
function destroyedaircraft(attacker, weapon, playercontrolled, lethal = 1) {
    if (!isplayer(attacker)) {
        return;
    }
    attacker destroyscorestreak(weapon, playercontrolled, 0);
    if (isdefined(lethal) && lethal) {
        attacker stats::function_dad108fa(#"destroy_lethal_aircraft", 1);
    } else {
        attacker stats::function_dad108fa(#"destroy_nonlethal_aircraft", 1);
    }
    if (isdefined(weapon)) {
        if (weapon.name == #"emp" && attacker util::is_item_purchased(#"killstreak_emp")) {
            attacker stats::function_dad108fa(#"destroy_aircraft_with_emp", 1);
        } else if (weapon.name == #"missile_drone_projectile" || weapon.name == #"missile_drone") {
            attacker stats::function_dad108fa(#"destroy_aircraft_with_missile_drone", 1);
        } else if (weapon.isbulletweapon) {
            attacker stats::function_dad108fa(#"shoot_aircraft", 1);
        }
    }
    if (attacker util::has_blind_eye_perk_purchased_and_equipped()) {
        attacker stats::function_dad108fa(#"perk_nottargetedbyairsupport_destroy_aircraft", 1);
    }
    attacker stats::function_dad108fa(#"destroy_aircraft", 1);
    if (isdefined(playercontrolled) && playercontrolled == 0) {
        if (attacker util::has_blind_eye_perk_purchased_and_equipped()) {
            attacker stats::function_dad108fa(#"destroy_ai_aircraft_using_blindeye", 1);
        }
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6b25bca2, Offset: 0x64e0
// Size: 0x1a4
function killstreakten() {
    if (!isdefined(self.class_num)) {
        return;
    }
    primary = self getloadoutitem(self.class_num, "primary");
    if (primary != 0) {
        return;
    }
    secondary = self getloadoutitem(self.class_num, "secondary");
    if (secondary != 0) {
        return;
    }
    primarygrenade = self getloadoutitem(self.class_num, "primarygrenade");
    if (primarygrenade != 0) {
        return;
    }
    specialgrenade = self getloadoutitem(self.class_num, "specialgrenade");
    if (specialgrenade != 0) {
        return;
    }
    for (numspecialties = 0; numspecialties < level.maxspecialties; numspecialties++) {
        perk = self getloadoutitem(self.class_num, "specialty" + numspecialties + 1);
        if (perk != 0) {
            return;
        }
    }
    self stats::function_dad108fa(#"killstreak_10_no_weapons_perks", 1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x96b1c12a, Offset: 0x6690
// Size: 0xa0
function scavengedgrenade() {
    self endon(#"disconnect", #"death");
    self notify(#"scavengedgrenade");
    self endon(#"scavengedgrenade");
    self notify(#"scavenged_primary_grenade");
    for (;;) {
        self waittill(#"lethalgrenadekill");
        self stats::function_dad108fa(#"kill_with_resupplied_lethal_grenade", 1);
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbe80e712, Offset: 0x6738
// Size: 0x34
function stunnedtankwithempgrenade(attacker) {
    attacker stats::function_dad108fa(#"stun_aitank_with_emp_grenade", 1);
}

// Namespace challenges/challenges_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xa2c6815, Offset: 0x6778
// Size: 0x1aa8
function playerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, shitloc, attackerstance, bledout) {
    /#
        print(level.gametype);
    #/
    self.anglesondeath = self getplayerangles();
    if (isdefined(attacker) && isplayer(attacker)) {
        attacker.anglesonkill = attacker getplayerangles();
    }
    if (!isdefined(weapon)) {
        weapon = level.weaponnone;
    }
    self endon(#"disconnect");
    data = spawnstruct();
    victim = self;
    data.victim = victim;
    data.victimorigin = self.origin;
    data.victimforward = anglestoforward(self getplayerangles());
    data.victimstance = self getstance();
    data.einflictor = einflictor;
    data.attacker = attacker;
    data.attackerstance = attackerstance;
    data.idamage = idamage;
    data.smeansofdeath = smeansofdeath;
    data.weapon = weapon;
    data.shitloc = shitloc;
    data.time = gettime();
    data.bledout = 0;
    if (isdefined(bledout)) {
        data.bledout = bledout;
    }
    waslockingon = 0;
    washacked = 0;
    if (isdefined(einflictor)) {
        if (isdefined(einflictor.lastweaponbeforetoss)) {
            data.lastweaponbeforetoss = einflictor.lastweaponbeforetoss;
        }
        if (isdefined(einflictor.ownerweaponatlaunch)) {
            data.ownerweaponatlaunch = einflictor.ownerweaponatlaunch;
        }
        if (isdefined(einflictor.locking_on)) {
            waslockingon = waslockingon | einflictor.locking_on;
        }
        if (isdefined(einflictor.locked_on)) {
            waslockingon = waslockingon | einflictor.locked_on;
        }
        washacked = einflictor util::ishacked();
        if (isdefined(einflictor.stucktoplayer) && isdefined(einflictor.originalowner) && einflictor.stucktoplayer == self && einflictor.originalowner == attacker) {
            data.var_c274d62f = 1;
        }
    }
    victimentnum = victim getentitynumber();
    waslockingon = waslockingon & 1 << victimentnum;
    if (waslockingon != 0) {
        data.waslockingon = 1;
    } else {
        data.waslockingon = 0;
    }
    data.washacked = washacked;
    data.wasplanting = victim.isplanting;
    data.wasunderwater = victim isplayerunderwater();
    data.var_e828179e = victim depthinwater();
    if (!isdefined(data.wasplanting)) {
        data.wasplanting = 0;
    }
    data.wasdefusing = victim.isdefusing;
    if (!isdefined(data.wasdefusing)) {
        data.wasdefusing = 0;
    }
    data.var_bd10969 = [];
    if (isarray(self.var_121392a1)) {
        foreach (effect in self.var_121392a1) {
            struct = spawnstruct();
            if (isdefined(effect.var_4f6b79a4)) {
                struct.var_2e4a8800 = effect.var_4f6b79a4.var_2e4a8800;
            }
            struct.var_4b22e697 = effect.var_4b22e697;
            struct.var_3d1ed4bd = effect.var_3d1ed4bd;
            struct.name = effect.namehash;
            if (!isdefined(data.var_bd10969)) {
                data.var_bd10969 = [];
            } else if (!isarray(data.var_bd10969)) {
                data.var_bd10969 = array(data.var_bd10969);
            }
            data.var_bd10969[data.var_bd10969.size] = struct;
        }
    }
    if (isdefined(victim.var_ea1458aa)) {
        data.var_6799f1da = victim.var_ea1458aa.var_6799f1da;
    }
    if (isdefined(victim.var_9cd2c51d)) {
        data.var_70763083 = victim.var_9cd2c51d.var_c54af9a9;
    }
    data.victimweapon = victim.currentweapon;
    data.victimonground = victim isonground();
    data.victimlaststunnedby = victim.laststunnedby;
    data.var_642d3a64 = victim.lastfiretime;
    data.victimcombatefficiencylastontime = victim.combatefficiencylastontime;
    data.victimspeedburstlastontime = victim.speedburstlastontime;
    data.victimcombatefficieny = victim ability_util::gadget_is_active(12);
    data.victimheroabilityactive = ability_player::gadget_checkheroabilitykill(victim);
    data.victimelectrifiedby = victim.electrifiedby;
    data.victimheroability = victim.heroability;
    data.victimwasinslamstate = victim isslamming();
    data.victimwaslungingwitharmblades = victim isgadgetmeleecharging();
    data.var_9fb5719b = victim function_90fe764c();
    data.victimwasheatwavestunned = victim isheatwavestunned();
    data.victimpowerarmorlasttookdamagetime = victim.power_armor_last_took_damage_time;
    data.victimgadgetwasactivelastdamage = victim.gadget_was_active_last_damage;
    data.victimisthieforroulette = victim.isthief === 1 || victim.isroulette === 1;
    data.victimheroabilityname = victim.heroabilityname;
    data.var_989b2258 = victim.var_ec59e88c;
    data.var_893d5683 = victim.var_ae639436;
    data.var_59b78db0 = victim.var_700a5910;
    if (isdefined(data.victimweapon)) {
        slot = victim gadgetgetslot(data.victimweapon);
        if (slot != -1) {
            data.victimgadgetpower = victim gadgetpowerget(slot);
        }
    }
    if (isdefined(victim.in_enemy_mute_smoke) && victim.in_enemy_mute_smoke || isdefined(victim.var_2118ca55) && victim.var_2118ca55) {
        data.var_ab4f5741 = 1;
    }
    data.var_504c7a2f = victim.in_enemy_mute_smoke;
    data.var_7006e4f4 = victim.var_fd0be7bd;
    data.var_af1b39cb = victim.lastflashedby;
    data.var_e020b97e = victim isflashbanged();
    data.var_ac7c0ef7 = victim function_6c32d092(#"talent_resistance");
    data.var_a79760b1 = victim status_effect::function_4617032e(5);
    data.var_dd195b6b = victim.var_a7679005;
    data.var_31310133 = victim.var_7ef2427c;
    data.var_9084d6e = victim status_effect::function_4617032e(2);
    data.var_157f4d3b = victim.var_a010bd8f;
    data.var_f048a359 = victim.var_9060b065;
    if (!isdefined(data.victimcombatefficiencylastontime)) {
        data.victimcombatefficiencylastontime = 0;
    }
    if (!isdefined(data.victimspeedburstlastontime)) {
        data.victimspeedburstlastontime = 0;
    }
    data.victimvisionpulseactivatetime = victim.visionpulseactivatetime;
    if (!isdefined(data.victimvisionpulseactivatetime)) {
        data.victimvisionpulseactivatetime = 0;
    }
    data.victimvisionpulsearray = util::array_copy_if_array(victim.visionpulsearray);
    data.victimvisionpulseorigin = victim.visionpulseorigin;
    data.victimvisionpulseoriginarray = util::array_copy_if_array(victim.visionpulseoriginarray);
    data.victimattackersthisspawn = util::array_copy_if_array(victim.attackersthisspawn);
    data.victimlastvisionpulsedby = victim.lastvisionpulsedby;
    data.victimlastvisionpulsedtime = victim.lastvisionpulsedtime;
    if (!isdefined(data.victimlastvisionpulsedtime)) {
        data.victimlastvisionpulsedtime = 0;
    }
    data.var_31d0fbf5 = victim.var_4dcf932b;
    data.var_f91a4dd6 = victim.recentkillcountsameweapon;
    data.victim_jump_begin = victim.challenge_jump_begin;
    data.victim_jump_end = victim.challenge_jump_end;
    data.victim_swimming_begin = victim.challenge_swimming_begin;
    data.victim_swimming_end = victim.challenge_swimming_end;
    data.victim_slide_begin = victim.challenge_slide_begin;
    data.victim_slide_end = victim.challenge_slide_end;
    if (isdefined(victim.activeproximitygrenades)) {
        data.victimactiveproximitygrenades = [];
        arrayremovevalue(victim.activeproximitygrenades, undefined);
        foreach (proximitygrenade in victim.activeproximitygrenades) {
            proximitygrenadeinfo = spawnstruct();
            proximitygrenadeinfo.origin = proximitygrenade.origin;
            data.victimactiveproximitygrenades[data.victimactiveproximitygrenades.size] = proximitygrenadeinfo;
        }
    }
    if (isdefined(victim.activebouncingbetties)) {
        data.victimactivebouncingbetties = [];
        arrayremovevalue(victim.activebouncingbetties, undefined);
        foreach (bouncingbetty in victim.activebouncingbetties) {
            bouncingbettyinfo = spawnstruct();
            bouncingbettyinfo.origin = bouncingbetty.origin;
            data.victimactivebouncingbetties[data.victimactivebouncingbetties.size] = bouncingbettyinfo;
        }
    }
    if (isplayer(attacker)) {
        data.attackerorigin = attacker.origin;
        data.attackerforward = anglestoforward(attacker.anglesonkill);
        data.attackeronground = attacker isonground();
        data.var_406186a6 = attacker function_8a220d80();
        data.attackertraversing = attacker istraversing();
        data.attackersliding = attacker issliding();
        data.attackerspeedburst = attacker ability_util::gadget_is_active(10);
        data.attackerheroabilityactive = ability_player::gadget_checkheroabilitykill(attacker);
        data.attackerheroability = attacker.heroability;
        data.attackervisionpulseactivatetime = attacker.visionpulseactivatetime;
        if (!isdefined(data.attackervisionpulseactivatetime)) {
            data.attackervisionpulseactivatetime = 0;
        }
        data.attackervisionpulsearray = util::array_copy_if_array(attacker.visionpulsearray);
        data.attackervisionpulseorigin = attacker.visionpulseorigin;
        if (!isdefined(data.attackerstance)) {
            data.attackerstance = attacker getstance();
        }
        data.attackervisionpulseoriginarray = util::array_copy_if_array(attacker.visionpulseoriginarray);
        data.var_1fa3e8cc = attacker function_104d7b4d();
        data.var_8556c722 = attacker isusingoffhand();
        data.attackerwasflashed = attacker isflashbanged();
        data.attackerlastflashedby = attacker.lastflashedby;
        data.attackerlaststunnedby = attacker.laststunnedby;
        data.attackerlaststunnedtime = attacker.laststunnedtime;
        data.attackerwasconcussed = isdefined(attacker.concussionendtime) && attacker.concussionendtime > gettime();
        data.attackerwasheatwavestunned = attacker isheatwavestunned();
        data.attackerwasunderwater = attacker isplayerunderwater();
        data.attackerlastfastreloadtime = attacker.lastfastreloadtime;
        data.attackerwassliding = attacker issliding();
        data.attackerwassprinting = attacker issprinting();
        data.attackerstance = attacker getstance();
        data.attackeristhief = attacker.isthief === 1;
        data.attackerisroulette = attacker.isroulette === 1;
        data.var_911b9b40 = attacker isremotecontrolling();
        data.var_be469b25 = attacker isgrappling() || isdefined(attacker.var_700a5910) && attacker.var_700a5910 + 2000 > gettime();
        data.var_5fa4aeed = isdefined(victim.lastattackedshieldtime) && victim.lastattackedshieldtime + 500 > gettime();
        data.attacker_jump_begin = attacker.challenge_jump_begin;
        data.attacker_jump_end = attacker.challenge_jump_end;
        data.attacker_swimming_begin = attacker.challenge_swimming_begin;
        data.attacker_swimming_end = attacker.challenge_swimming_end;
        data.attacker_slide_begin = attacker.challenge_slide_begin;
        data.attacker_slide_end = attacker.challenge_slide_end;
        data.attacker_sprint_begin = attacker.challenge_sprint_begin;
        data.attacker_sprint_end = attacker.challenge_sprint_end;
        data.var_26aed950 = attacker function_65776b07();
        if (isdefined(attacker.var_ea1458aa)) {
            if (isdefined(attacker.var_ea1458aa.var_8f7ff7ed)) {
                data.var_58b48038 = attacker.var_ea1458aa.var_8f7ff7ed[victimentnum];
            }
        }
        if (isdefined(attacker.var_9cd2c51d)) {
            data.var_e5241328 = attacker.var_9cd2c51d.var_c54af9a9;
            data.var_cc8f0762 = attacker.var_9cd2c51d.var_6e219f3c;
        }
        data.var_a99236f2 = victim.var_ead9cdbf;
        if (isdefined(attacker.sensor_darts)) {
            arrayremovevalue(attacker.sensor_darts, undefined);
        }
        if (isdefined(attacker.sensor_darts) && attacker.sensor_darts.size > 0) {
            data.var_cf13980c = [];
            foreach (sensor_dart in attacker.sensor_darts) {
                if (!isdefined(data.var_cf13980c)) {
                    data.var_cf13980c = [];
                } else if (!isarray(data.var_cf13980c)) {
                    data.var_cf13980c = array(data.var_cf13980c);
                }
                data.var_cf13980c[data.var_cf13980c.size] = sensor_dart;
            }
        } else if (isdefined(attacker.team)) {
            var_8ddd9a81 = getplayers(attacker.team);
            foreach (attacking_player in var_8ddd9a81) {
                if (!isplayer(attacking_player)) {
                    continue;
                }
                if (isdefined(attacking_player.sensor_darts)) {
                    arrayremovevalue(attacking_player.sensor_darts, undefined);
                    if (attacking_player.sensor_darts.size > 0) {
                        data.var_78056843 = attacking_player;
                        data.var_4f6eb670 = [];
                        foreach (sensor_dart in attacking_player.sensor_darts) {
                            if (!isdefined(data.var_4f6eb670)) {
                                data.var_4f6eb670 = [];
                            } else if (!isarray(data.var_4f6eb670)) {
                                data.var_4f6eb670 = array(data.var_4f6eb670);
                            }
                            data.var_4f6eb670[data.var_4f6eb670.size] = sensor_dart;
                        }
                        break;
                    }
                }
            }
        }
        if (isdefined(attacker.var_2ba4c892) && isdefined(attacker.var_2ba4c892[victim getentitynumber()])) {
            data.var_7117b104 = attacker.var_2ba4c892[victim getentitynumber()];
        }
        data.var_d6553aa9 = attacker function_ac8c1222(victim);
    } else {
        data.attackeronground = 0;
        data.attackertraversing = 0;
        data.attackersliding = 0;
        data.attackerspeedburst = 0;
        data.attackervisionpulseactivatetime = 0;
        data.attackerwasflashed = 0;
        data.attackerwasconcussed = 0;
        data.attackerheroabilityactive = 0;
        data.attackerwasheatwavestunned = 0;
        data.attackerstance = "stand";
        data.attackerwasunderwater = 0;
        data.attackerwassprinting = 0;
        data.attackeristhief = 0;
        data.attackerisroulette = 0;
    }
    if (isdefined(einflictor)) {
        if (isdefined(einflictor.iscooked)) {
            data.inflictoriscooked = einflictor.iscooked;
        } else {
            data.inflictoriscooked = 0;
        }
        if (isdefined(einflictor.challenge_hatchettosscount)) {
            data.inflictorchallenge_hatchettosscount = einflictor.challenge_hatchettosscount;
        } else {
            data.inflictorchallenge_hatchettosscount = 0;
        }
        if (isdefined(einflictor.ownerwassprinting)) {
            data.inflictorownerwassprinting = einflictor.ownerwassprinting;
        } else {
            data.inflictorownerwassprinting = 0;
        }
        if (isdefined(einflictor.playerhasengineerperk)) {
            data.inflictorplayerhasengineerperk = einflictor.playerhasengineerperk;
        } else {
            data.inflictorplayerhasengineerperk = 0;
        }
    } else {
        data.inflictoriscooked = 0;
        data.inflictorchallenge_hatchettosscount = 0;
        data.inflictorownerwassprinting = 0;
        data.inflictorplayerhasengineerperk = 0;
    }
    waitandprocessplayerkilledcallback(data);
    if (isdefined(attacker)) {
        attacker notify(#"playerkilledchallengesprocessed");
    }
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc244559a, Offset: 0x8228
// Size: 0xda
function doscoreeventcallback(callback, data) {
    if (!isdefined(level.scoreeventcallbacks)) {
        return;
    }
    if (!isdefined(level.scoreeventcallbacks[callback])) {
        return;
    }
    if (isdefined(data)) {
        for (i = 0; i < level.scoreeventcallbacks[callback].size; i++) {
            thread [[ level.scoreeventcallbacks[callback][i] ]](data);
        }
    } else {
        for (i = 0; i < level.scoreeventcallbacks[callback].size; i++) {
            thread [[ level.scoreeventcallbacks[callback][i] ]]();
        }
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x97a5f700, Offset: 0x8310
// Size: 0xec
function waitandprocessplayerkilledcallback(data) {
    if (isdefined(data.attacker)) {
        data.attacker endon(#"disconnect");
    }
    waitframe(1);
    util::waittillslowprocessallowed();
    if (isdefined(data.weapon) && data.weapon != level.weaponnone && isdefined(data.attacker) && isplayer(data.attacker)) {
        level thread dochallengecallback("playerKilled", data);
    }
    level thread doscoreeventcallback("playerKilled", data);
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0xbeb953f0, Offset: 0x8408
// Size: 0x6a
function weaponisknife(weapon) {
    if (weapon == level.weaponbasemelee || weapon == level.weaponbasemeleeheld || weapon.rootweapon.statname == level.weaponballisticknife.statname) {
        return 1;
    }
    return 0;
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x0
// Checksum 0x696aa501, Offset: 0x8480
// Size: 0x4a2
function eventreceived(eventname) {
    self endon(#"disconnect");
    util::waittillslowprocessallowed();
    switch (level.gametype) {
    case #"tdm":
        if (eventname == "killstreak_10") {
            self stats::function_d40764f3(#"killstreak_10", 1);
        } else if (eventname == "killstreak_15") {
            self stats::function_d40764f3(#"killstreak_15", 1);
        } else if (eventname == "killstreak_20") {
            self stats::function_d40764f3(#"killstreak_20", 1);
        } else if (eventname == "multikill_3") {
            self stats::function_d40764f3(#"multikill_3", 1);
        } else if (eventname == "kill_enemy_who_killed_teammate") {
            self stats::function_d40764f3(#"kill_enemy_who_killed_teammate", 1);
        } else if (eventname == "kill_enemy_injuring_teammate") {
            self stats::function_d40764f3(#"kill_enemy_injuring_teammate", 1);
        }
        break;
    case #"dm":
        if (eventname == "killstreak_10") {
            self stats::function_d40764f3(#"killstreak_10", 1);
        } else if (eventname == "killstreak_15") {
            self stats::function_d40764f3(#"killstreak_15", 1);
        } else if (eventname == "killstreak_20") {
            self stats::function_d40764f3(#"killstreak_20", 1);
        } else if (eventname == "killstreak_30") {
            self stats::function_d40764f3(#"killstreak_30", 1);
        }
        break;
    case #"sd":
        if (eventname == "defused_bomb_last_man_alive") {
            self stats::function_d40764f3(#"defused_bomb_last_man_alive", 1);
        } else if (eventname == "elimination_and_last_player_alive") {
            self stats::function_d40764f3(#"elimination_and_last_player_alive", 1);
        } else if (eventname == "killed_bomb_planter") {
            self stats::function_d40764f3(#"killed_bomb_planter", 1);
        } else if (eventname == "killed_bomb_defuser") {
            self stats::function_d40764f3(#"killed_bomb_defuser", 1);
        }
        break;
    case #"ctf":
        if (eventname == "kill_flag_carrier") {
            self stats::function_d40764f3(#"kill_flag_carrier", 1);
        } else if (eventname == "defend_flag_carrier") {
            self stats::function_d40764f3(#"defend_flag_carrier", 1);
        }
        break;
    case #"dem":
        if (eventname == "killed_bomb_planter") {
            self stats::function_d40764f3(#"killed_bomb_planter", 1);
        } else if (eventname == "killed_bomb_defuser") {
            self stats::function_d40764f3(#"killed_bomb_defuser", 1);
        }
        break;
    default:
        break;
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3b459ebd, Offset: 0x8930
// Size: 0x8a
function monitor_player_sprint() {
    self endon(#"disconnect", #"killplayersprintmonitor", #"death");
    self.lastsprinttime = undefined;
    while (1) {
        self waittill(#"sprint_begin");
        self waittill(#"sprint_end");
        self.lastsprinttime = gettime();
    }
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x28a0bfaa, Offset: 0x89c8
// Size: 0x1a
function isflashbanged() {
    return status_effect::function_4617032e(1);
}

// Namespace challenges/challenges_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe7592f3b, Offset: 0x89f0
// Size: 0x1e
function isheatwavestunned() {
    return isdefined(self._heat_wave_stuned_end) && gettime() < self._heat_wave_stuned_end;
}

// Namespace challenges/challenges_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x11773bc3, Offset: 0x8a18
// Size: 0x1b4
function trophy_defense(origin, radius) {
    if (level.challenge_scorestreaksenabled === 1) {
        entities = getdamageableentarray(origin, radius);
        foreach (entity in entities) {
            if (isdefined(entity.challenge_isscorestreak)) {
                self stats::function_dad108fa(#"hash_580b295b38c0ee38", 1);
                break;
            }
            weapon = entity.weapon;
            if (isdefined(weapon)) {
                should_award = 0;
                if (weapon.issignatureweapon) {
                    should_award = 1;
                } else if (weapon.var_76ce72e8) {
                    scoreevents = globallogic_score::function_3cbc4c6c(weapon.var_2e4a8800);
                    should_award = isdefined(scoreevents) && scoreevents.var_fcd2ff3a === 1;
                }
                if (should_award) {
                    self stats::function_dad108fa(#"hash_580b295b38c0ee38", 1);
                    break;
                }
            }
        }
    }
}

// Namespace challenges/challenges_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xda62e41e, Offset: 0x8bd8
// Size: 0x26
function waittilltimeoutordeath(timeout) {
    self endon(#"death");
    wait(timeout);
}

