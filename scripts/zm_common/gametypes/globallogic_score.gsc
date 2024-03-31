// Atian COD Tools GSC decompiler test
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\gametypes\globallogic_utils.gsc;
#using scripts\zm_common\gametypes\globallogic_audio.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\challenges_shared.gsc;
#using scripts\core_common\bb_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_score;

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0xad015f8f, Offset: 0x190
// Size: 0x128
function gethighestscoringplayer() {
    players = level.players;
    winner = undefined;
    tie = 0;
    for (i = 0; i < players.size; i++) {
        if (!isdefined(players[i].score)) {
            continue;
        }
        if (players[i].score < 1) {
            continue;
        }
        if (!isdefined(winner) || players[i].score > winner.score) {
            winner = players[i];
            tie = 0;
            continue;
        }
        if (players[i].score == winner.score) {
            tie = 1;
        }
    }
    if (tie || !isdefined(winner)) {
        return undefined;
    }
    return winner;
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0x3513dd1b, Offset: 0x2c0
// Size: 0x2e
function resetscorechain() {
    self notify(#"reset_score_chain");
    self.scorechain = 0;
    self.rankupdatetotal = 0;
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0x4f76d058, Offset: 0x2f8
// Size: 0x74
function scorechaintimer() {
    self notify(#"score_chain_timer");
    self endon(#"reset_score_chain", #"score_chain_timer", #"death", #"disconnect");
    wait(20);
    self thread resetscorechain();
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x1 linked
// Checksum 0x37137667, Offset: 0x378
// Size: 0x52
function roundtonearestfive(score) {
    rounding = score % 5;
    if (rounding <= 2) {
        return (score - rounding);
    }
    return score + 5 - rounding;
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xef55e45, Offset: 0x3d8
// Size: 0x1f4
function giveplayermomentumnotification(score, label, descvalue, countstowardrampage) {
    rampagebonus = 0;
    if (isdefined(level.usingrampage) && level.usingrampage) {
        if (countstowardrampage) {
            if (!isdefined(self.scorechain)) {
                self.scorechain = 0;
            }
            self.scorechain++;
            self thread scorechaintimer();
        }
        if (isdefined(self.scorechain) && self.scorechain >= 999) {
            rampagebonus = roundtonearestfive(int(score * level.rampagebonusscale + 0.5));
        }
    }
    combat_efficiency_factor = 0;
    if (score != 0) {
        self luinotifyevent(#"score_event", 4, label, score, rampagebonus, combat_efficiency_factor);
    }
    score = score + rampagebonus;
    if (score > 0 && self hasperk(#"specialty_earnmoremomentum")) {
        score = roundtonearestfive(int(score * getdvarfloat(#"perk_killstreakmomentummultiplier", 0) + 0.5));
    }
    _setplayermomentum(self, self.pers[#"momentum"] + score);
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xb82b24d5, Offset: 0x5d8
// Size: 0x54
function resetplayermomentumondeath() {
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks) {
        _setplayermomentum(self, 0);
        self thread resetscorechain();
    }
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x1 linked
// Checksum 0x40561cf1, Offset: 0x638
// Size: 0x170
function giveplayerxpdisplay(event, player, victim, descvalue) {
    score = player rank::getscoreinfovalue(event);
    /#
        assert(isdefined(score));
    #/
    xp = player rank::getscoreinfoxp(event);
    /#
        assert(isdefined(xp));
    #/
    label = rank::getscoreinfolabel(event);
    if (xp && !level.gameended && isdefined(label)) {
        xpscale = player getxpscale();
        if (1 != xpscale) {
            xp = int(xp * xpscale + 0.5);
        }
        player luinotifyevent(#"score_event", 2, label, xp);
    }
    return score;
}

// Namespace globallogic_score/globallogic_score
// Params 6, eflags: 0x1 linked
// Checksum 0x9c7e2620, Offset: 0x7b0
// Size: 0x52
function giveplayerscore(event, player, victim, descvalue, weapon, var_36f23f1f) {
    return giveplayerxpdisplay(event, player, victim, descvalue);
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x1 linked
// Checksum 0x9d941782, Offset: 0x810
// Size: 0x1c
function default_onplayerscore(event, player, victim) {
    
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x1 linked
// Checksum 0x2133fa99, Offset: 0x838
// Size: 0x14
function _setplayerscore(player, score) {
    
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x1 linked
// Checksum 0x6e8134a0, Offset: 0x858
// Size: 0x28
function _getplayerscore(player) {
    return player.pers[#"score"];
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x1 linked
// Checksum 0x23196879, Offset: 0x888
// Size: 0x122
function _setplayermomentum(player, momentum) {
    momentum = math::clamp(momentum, 0, 2000);
    oldmomentum = player.pers[#"momentum"];
    if (momentum == oldmomentum) {
        return;
    }
    player bb::add_to_stat("momentum", momentum - oldmomentum);
    if (momentum > oldmomentum) {
        highestmomentumcost = 0;
        numkillstreaks = player.killstreak.size;
        killstreaktypearray = [];
    }
    player.pers[#"momentum"] = momentum;
    player.momentum = player.pers[#"momentum"];
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xbb668e19, Offset: 0x9b8
// Size: 0x24
function _giveplayerkillstreakinternal(player, momentum, oldmomentum, killstreaktypearray) {
    
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0x73d1af9b, Offset: 0x9e8
// Size: 0xf8
function setplayermomentumdebug() {
    /#
        setdvar(#"sv_momentumpercent", 0);
        while (true) {
            wait(1);
            momentumpercent = getdvarfloat(#"sv_momentumpercent", 0);
            if (momentumpercent != 0) {
                player = util::gethostplayer();
                if (!isdefined(player)) {
                    return;
                }
                if (isdefined(player.killstreak)) {
                    _setplayermomentum(player, int(2000 * momentumpercent / 100));
                }
            }
        }
    #/
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x1 linked
// Checksum 0xdaf76dac, Offset: 0xae8
// Size: 0x19c
function giveteamscore(event, team, player, victim) {
    if (level.overrideteamscore) {
        return;
    }
    pixbeginevent(#"hash_66d4a941ef078585");
    teamscore = game.stat[#"teamscores"][team];
    [[ level.onteamscore ]](event, team);
    pixendevent();
    newscore = game.stat[#"teamscores"][team];
    zmteamscores = {#gametime:function_f8d53445(), #event:event, #team:team, #diff:newscore - teamscore, #score:newscore};
    function_92d1707f(#"hash_6823717ff11a304a", zmteamscores);
    if (teamscore == newscore) {
        return;
    }
    updateteamscores(team);
    thread globallogic::checkscorelimit();
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x0
// Checksum 0x9ed5f53d, Offset: 0xc90
// Size: 0xac
function giveteamscoreforobjective(team, score) {
    teamscore = game.stat[#"teamscores"][team];
    onteamscore(score, team);
    newscore = game.stat[#"teamscores"][team];
    if (teamscore == newscore) {
        return;
    }
    updateteamscores(team);
    thread globallogic::checkscorelimit();
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x1 linked
// Checksum 0x83493861, Offset: 0xd48
// Size: 0x8c
function _setteamscore(team, teamscore) {
    if (teamscore == game.stat[#"teamscores"][team]) {
        return;
    }
    game.stat[#"teamscores"][team] = teamscore;
    updateteamscores(team);
    thread globallogic::checkscorelimit();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0x3c9e524e, Offset: 0xde0
// Size: 0xc4
function resetteamscores() {
    if (level.scoreroundwinbased || util::isfirstround()) {
        foreach (team, _ in level.teams) {
            game.stat[#"teamscores"][team] = 0;
        }
    }
    updateallteamscores();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x0
// Checksum 0xfee44b8f, Offset: 0xeb0
// Size: 0x24
function resetallscores() {
    resetteamscores();
    resetplayerscores();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0x16776dd4, Offset: 0xee0
// Size: 0xa6
function resetplayerscores() {
    players = level.players;
    winner = undefined;
    tie = 0;
    for (i = 0; i < players.size; i++) {
        if (isdefined(players[i].pers[#"score"])) {
            _setplayerscore(players[i], 0);
        }
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x1 linked
// Checksum 0x7daf9532, Offset: 0xf90
// Size: 0x54
function updateteamscores(team) {
    setteamscore(team, game.stat[#"teamscores"][team]);
    level thread globallogic::checkteamscorelimitsoon(team);
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0xafcab97a, Offset: 0xff0
// Size: 0x80
function updateallteamscores() {
    foreach (team, _ in level.teams) {
        updateteamscores(team);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x1 linked
// Checksum 0xf845cc76, Offset: 0x1078
// Size: 0x26
function _getteamscore(team) {
    return game.stat[#"teamscores"][team];
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0x73b5827f, Offset: 0x10a8
// Size: 0xea
function gethighestteamscoreteam() {
    score = 0;
    winning_teams = [];
    foreach (team, _ in level.teams) {
        team_score = game.stat[#"teamscores"][team];
        if (team_score > score) {
            score = team_score;
            winning_teams = [];
        }
        if (team_score == score) {
            winning_teams[team] = team;
        }
    }
    return winning_teams;
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x1 linked
// Checksum 0x679b0601, Offset: 0x11a0
// Size: 0xa0
function areteamarraysequal(teamsa, teamsb) {
    if (teamsa.size != teamsb.size) {
        return false;
    }
    foreach (team in teamsa) {
        if (!isdefined(teamsb[team])) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_score/globallogic_score
// Params 2, eflags: 0x1 linked
// Checksum 0x665cb0bf, Offset: 0x1248
// Size: 0x2a2
function onteamscore(score, team) {
    game.stat[#"teamscores"][team] = game.stat[#"teamscores"][team] + score;
    if (level.scorelimit && game.stat[#"teamscores"][team] > level.scorelimit) {
        game.stat[#"teamscores"][team] = level.scorelimit;
    }
    if (level.splitscreen) {
        return;
    }
    if (level.scorelimit == 1) {
        return;
    }
    iswinning = gethighestteamscoreteam();
    if (iswinning.size == 0) {
        return;
    }
    if (gettime() - level.laststatustime < 5000) {
        return;
    }
    if (areteamarraysequal(iswinning, level.waswinning)) {
        return;
    }
    level.laststatustime = gettime();
    if (iswinning.size == 1) {
        foreach (team in iswinning) {
            if (isdefined(level.waswinning[team])) {
                if (level.waswinning.size == 1) {
                }
            }
        }
    }
    if (level.waswinning.size == 1) {
        foreach (team in level.waswinning) {
            if (isdefined(iswinning[team])) {
                if (iswinning.size == 1) {
                    continue;
                }
                if (level.waswinning.size > 1) {
                }
            }
        }
    }
    level.waswinning = iswinning;
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x1 linked
// Checksum 0xdffb3809, Offset: 0x14f8
// Size: 0xea
function initpersstat(dataname, record_stats, init_to_stat_value) {
    if (!isdefined(self.pers[dataname])) {
        self.pers[dataname] = 0;
    }
    if (!isdefined(record_stats) || record_stats == 1) {
        recordplayerstats(self, dataname, int(self.pers[dataname]));
    }
    if (isdefined(init_to_stat_value) && init_to_stat_value == 1) {
        self.pers[dataname] = self stats::get_stat(#"playerstatslist", dataname, #"statvalue");
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x1 linked
// Checksum 0x243dd70a, Offset: 0x15f0
// Size: 0x18
function getpersstat(dataname) {
    return self.pers[dataname];
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x1 linked
// Checksum 0x50f49dd8, Offset: 0x1610
// Size: 0xf4
function incpersstat(dataname, increment, record_stats, includegametype) {
    pixbeginevent(#"incpersstat");
    /#
        /#
            assert(isdefined(self.pers[dataname]), dataname + "<unknown string>");
        #/
    #/
    self.pers[dataname] = self.pers[dataname] + increment;
    self stats::function_dad108fa(dataname, increment);
    if (!isdefined(record_stats) || record_stats == 1) {
        self thread threadedrecordplayerstats(dataname);
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x1 linked
// Checksum 0x562a1d96, Offset: 0x1710
// Size: 0x44
function threadedrecordplayerstats(dataname) {
    self endon(#"disconnect");
    waittillframeend();
    recordplayerstats(self, dataname, self.pers[dataname]);
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xcbd068, Offset: 0x1760
// Size: 0x8e
function inckillstreaktracker(weapon) {
    self endon(#"disconnect");
    waittillframeend();
    if (weapon.name == #"artillery") {
        self.pers[#"artillery_kills"]++;
    }
    if (weapon.name == #"dog_bite") {
        self.pers[#"dog_kills"]++;
    }
}

// Namespace globallogic_score/globallogic_score
// Params 5, eflags: 0x0
// Checksum 0x8202b116, Offset: 0x17f8
// Size: 0x3ac
function trackattackerkill(name, rank, xp, prestige, xuid) {
    self endon(#"disconnect");
    attacker = self;
    waittillframeend();
    pixbeginevent(#"trackattackerkill");
    if (!isdefined(attacker.pers[#"killed_players"][name])) {
        attacker.pers[#"killed_players"][name] = 0;
    }
    if (!isdefined(attacker.killedplayerscurrent[name])) {
        attacker.killedplayerscurrent[name] = 0;
    }
    if (!isdefined(attacker.pers[#"nemesis_tracking"][name])) {
        attacker.pers[#"nemesis_tracking"][name] = 0;
    }
    attacker.pers[#"killed_players"][name]++;
    attacker.killedplayerscurrent[name]++;
    attacker.pers[#"nemesis_tracking"][name] = attacker.pers[#"nemesis_tracking"][name] + 1;
    if (attacker.pers[#"nemesis_name"] == name) {
        attacker challenges::killednemesis();
    }
    if (attacker.pers[#"nemesis_name"] == "" || attacker.pers[#"nemesis_tracking"][name] > attacker.pers[#"nemesis_tracking"][attacker.pers[#"nemesis_name"]]) {
        attacker.pers[#"nemesis_name"] = name;
        attacker.pers[#"nemesis_rank"] = rank;
        attacker.pers[#"nemesis_rankicon"] = prestige;
        attacker.pers[#"nemesis_xp"] = xp;
        attacker.pers[#"nemesis_xuid"] = xuid;
    } else if (isdefined(attacker.pers[#"nemesis_name"]) && attacker.pers[#"nemesis_name"] == name) {
        attacker.pers[#"nemesis_rank"] = rank;
        attacker.pers[#"nemesis_xp"] = xp;
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 5, eflags: 0x0
// Checksum 0x9cfca01d, Offset: 0x1bb0
// Size: 0x394
function trackattackeedeath(attackername, rank, xp, prestige, xuid) {
    self endon(#"disconnect");
    waittillframeend();
    pixbeginevent(#"trackattackeedeath");
    if (!isdefined(self.pers[#"killed_by"][attackername])) {
        self.pers[#"killed_by"][attackername] = 0;
    }
    self.pers[#"killed_by"][attackername]++;
    if (!isdefined(self.pers[#"nemesis_tracking"][attackername])) {
        self.pers[#"nemesis_tracking"][attackername] = 0;
    }
    self.pers[#"nemesis_tracking"][attackername] = self.pers[#"nemesis_tracking"][attackername] + 1.5;
    if (self.pers[#"nemesis_name"] == "" || self.pers[#"nemesis_tracking"][attackername] > self.pers[#"nemesis_tracking"][self.pers[#"nemesis_name"]]) {
        self.pers[#"nemesis_name"] = attackername;
        self.pers[#"nemesis_rank"] = rank;
        self.pers[#"nemesis_rankicon"] = prestige;
        self.pers[#"nemesis_xp"] = xp;
        self.pers[#"nemesis_xuid"] = xuid;
    } else if (isdefined(self.pers[#"nemesis_name"]) && self.pers[#"nemesis_name"] == attackername) {
        self.pers[#"nemesis_rank"] = rank;
        self.pers[#"nemesis_xp"] = xp;
    }
    if (self.pers[#"nemesis_name"] == attackername && self.pers[#"nemesis_tracking"][attackername] >= 2) {
        self setclientuivisibilityflag("killcam_nemesis", 1);
    } else {
        self setclientuivisibilityflag("killcam_nemesis", 0);
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 0, eflags: 0x1 linked
// Checksum 0xd2cd2965, Offset: 0x1f50
// Size: 0x6
function default_iskillboosting() {
    return false;
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0xacfc716b, Offset: 0x1f60
// Size: 0x1ac
function givekillstats(smeansofdeath, weapon, evictim) {
    self endon(#"disconnect");
    waittillframeend();
    if (level.rankedmatch && self [[ level.iskillboosting ]]()) {
        /#
            self iprintlnbold("<unknown string>");
        #/
        return;
    }
    pixbeginevent(#"givekillstats");
    self incpersstat(#"kills", 1, 1, 1);
    self.kills = self getpersstat(#"kills");
    self updatestatratio("kdratio", "kills", "deaths");
    attacker = self;
    if (smeansofdeath == "MOD_HEAD_SHOT") {
        attacker thread incpersstat(#"headshots", 1, 1, 0);
        attacker.headshots = attacker.pers[#"headshots"];
        evictim recordkillmodifier("headshot");
    }
    pixendevent();
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xdc74fb1e, Offset: 0x2118
// Size: 0x50
function inctotalkills(team) {
    if (level.teambased && isdefined(level.teams[team])) {
        game.totalkillsteam[team]++;
    }
    game.totalkills++;
}

// Namespace globallogic_score/globallogic_score
// Params 3, eflags: 0x0
// Checksum 0x5c0bff0d, Offset: 0x2170
// Size: 0x184
function setinflictorstat(einflictor, eattacker, weapon) {
    if (!isdefined(eattacker)) {
        return;
    }
    if (!isdefined(einflictor)) {
        eattacker stats::function_e24eec31(weapon, #"hits", 1);
        return;
    }
    if (!isdefined(einflictor.playeraffectedarray)) {
        einflictor.playeraffectedarray = [];
    }
    foundnewplayer = 1;
    for (i = 0; i < einflictor.playeraffectedarray.size; i++) {
        if (einflictor.playeraffectedarray[i] == self) {
            foundnewplayer = 0;
            break;
        }
    }
    if (foundnewplayer) {
        einflictor.playeraffectedarray[einflictor.playeraffectedarray.size] = self;
        if (weapon == "concussion_grenade" || weapon == "tabun_gas") {
            eattacker stats::function_e24eec31(weapon, #"used", 1);
        }
        eattacker stats::function_e24eec31(weapon, #"hits", 1);
    }
}

// Namespace globallogic_score/globallogic_score
// Params 1, eflags: 0x0
// Checksum 0xbc132548, Offset: 0x2300
// Size: 0x112
function processshieldassist(killedplayer) {
    self endon(#"disconnect");
    killedplayer endon(#"disconnect");
    waitframe(1);
    util::waittillslowprocessallowed();
    if (!isdefined(level.teams[self.pers[#"team"]])) {
        return;
    }
    if (self.pers[#"team"] == killedplayer.pers[#"team"]) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    self incpersstat(#"assists", 1, 1, 1);
    self.assists = self getpersstat(#"assists");
}

// Namespace globallogic_score/globallogic_score
// Params 4, eflags: 0x0
// Checksum 0xa852e6a6, Offset: 0x2420
// Size: 0x284
function processassist(killedplayer, damagedone, weapon, assist_level = undefined) {
    self endon(#"disconnect");
    killedplayer endon(#"disconnect");
    waitframe(1);
    util::waittillslowprocessallowed();
    if (!isdefined(level.teams[self.pers[#"team"]])) {
        return;
    }
    if (self.pers[#"team"] == killedplayer.pers[#"team"]) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    assist_level = "assist";
    assist_level_value = int(ceil(damagedone / 25));
    if (assist_level_value < 1) {
        assist_level_value = 1;
    } else if (assist_level_value > 3) {
        assist_level_value = 3;
    }
    assist_level = assist_level + "_" + assist_level_value * 25;
    self incpersstat(#"assists", 1, 1, 1);
    self.assists = self getpersstat(#"assists");
    switch (weapon.name) {
    case #"concussion_grenade":
        assist_level = "assist_concussion";
        break;
    case #"flash_grenade":
        assist_level = "assist_flash";
        break;
    case #"emp_grenade":
        assist_level = "assist_emp";
        break;
    case #"proximity_grenade":
    case #"proximity_grenade_aoe":
        assist_level = "assist_proximity";
        break;
    }
    self challenges::assisted();
}

