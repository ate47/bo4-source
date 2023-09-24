// Atian COD Tools GSC decompiler test
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace rank;

// Namespace rank/rank_shared
// Params 0, eflags: 0x2
// Checksum 0xfb84fd23, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"rank", &__init__, undefined, undefined);
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd805e866, Offset: 0x160
// Size: 0x24
function __init__() {
    callback::on_start_gametype(&init);
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xee0ff086, Offset: 0x190
// Size: 0x34c
function init() {
    level.scoreinfo = [];
    level.rankxpcap = getxpcap();
    level.usingmomentum = 1;
    level.usingscorestreaks = getdvarint(#"scr_scorestreaks", 0) != 0;
    level.scorestreaksmaxstacking = getdvarint(#"scr_scorestreaks_maxstacking", 0);
    level.maxinventoryscorestreaks = getdvarint(#"scr_maxinventory_scorestreaks", 3);
    level.usingrampage = !isdefined(level.usingscorestreaks) || !level.usingscorestreaks;
    level.rampagebonusscale = getdvarfloat(#"scr_rampagebonusscale", 0);
    level.ranktable = [];
    if (sessionmodeiscampaigngame()) {
        level.xpscale = getdvarfloat(#"scr_xpscalecp", 0);
    } else if (sessionmodeiszombiesgame()) {
        level.xpscale = getdvarfloat(#"scr_xpscalezm", 0);
    } else {
        level.xpscale = getdvarfloat(#"scr_xpscalemp", 0);
    }
    initscoreinfo();
    level.maxrank = int(getrankcap());
    level.maxprestige = int(getprestigecap());
    for (rankid = 0; rankid <= level.maxrank; rankid++) {
        level.ranktable[rankid][0] = getrankminxp(rankid);
        level.ranktable[rankid][1] = getrankmaxxp(rankid);
        level.ranktable[rankid][2] = level.ranktable[rankid][1] - level.ranktable[rankid][0];
    }
    callback::on_connect(&on_player_connect);
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x91f12470, Offset: 0x4e8
// Size: 0x656
function initscoreinfo() {
    scoreinfotablename = scoreevents::getscoreeventtablename(level.gametype);
    rowcount = tablelookuprowcount(scoreinfotablename);
    if (sessionmodeismultiplayergame() && rowcount === 0) {
        scoreinfotablename = #"gamedata/tables/mp/scoreinfo/mp_scoreinfo" + "_base.csv";
        rowcount = tablelookuprowcount(scoreinfotablename);
    }
    for (row = 0; row < rowcount; row++) {
        type = tablelookupcolumnforrow(scoreinfotablename, row, 0);
        if (isdefined(type) && type != "") {
            labelstring = tablelookupcolumnforrow(scoreinfotablename, row, 9);
            label = undefined;
            if (labelstring != "") {
                label = tablelookup(scoreinfotablename, 0, type, 9);
            }
            lp = int(tablelookupcolumnforrow(scoreinfotablename, row, 1));
            xp = int(tablelookupcolumnforrow(scoreinfotablename, row, 2));
            sp = int(tablelookupcolumnforrow(scoreinfotablename, row, 3));
            hs = int(tablelookupcolumnforrow(scoreinfotablename, row, 4));
            res = float(tablelookupcolumnforrow(scoreinfotablename, row, 5));
            var_e775f7ed = tablelookupcolumnforrow(scoreinfotablename, row, 6);
            dp = int(tablelookupcolumnforrow(scoreinfotablename, row, 7));
            is_objective = tablelookupcolumnforrow(scoreinfotablename, row, 8);
            medalname = tablelookupcolumnforrow(scoreinfotablename, row, 11);
            job_type = tablelookupcolumnforrow(scoreinfotablename, row, 16);
            var_b6593614 = tablelookupcolumnforrow(scoreinfotablename, row, 17);
            var_1a39d14 = tablelookupcolumnforrow(scoreinfotablename, row, 18);
            var_bdbfb0e = tablelookupcolumnforrow(scoreinfotablename, row, 19);
            var_a434fd2d = tablelookupcolumnforrow(scoreinfotablename, row, 20);
            is_deprecated = tablelookupcolumnforrow(scoreinfotablename, row, 21);
            bounty_reward = tablelookupcolumnforrow(scoreinfotablename, row, 22);
            var_65181181 = int(isdefined(tablelookupcolumnforrow(scoreinfotablename, row, 24)) ? tablelookupcolumnforrow(scoreinfotablename, row, 24) : 0);
            registerscoreinfo(type, row, lp, xp, sp, hs, res, var_e775f7ed, dp, is_objective, label, medalname, job_type, var_b6593614, var_1a39d14, var_bdbfb0e, var_a434fd2d, is_deprecated, bounty_reward, var_65181181);
            if (!isdefined(game.scoreinfoinitialized)) {
                setddlstat = tablelookupcolumnforrow(scoreinfotablename, row, 12);
                addplayerstat = 0;
                if (setddlstat) {
                    addplayerstat = 1;
                }
                ismedal = 0;
                var_9750677a = tablelookup(scoreinfotablename, 0, type, 10);
                var_9f6af7ed = tablelookup(scoreinfotablename, 0, type, 11);
                if (isdefined(var_9750677a) && var_9750677a != #"" && isdefined(var_9f6af7ed) && var_9f6af7ed != #"") {
                    ismedal = 1;
                }
                registerxp(type, xp, addplayerstat, ismedal, dp, row, var_65181181);
            }
        }
    }
    game.scoreinfoinitialized = 1;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x83431d00, Offset: 0xb48
// Size: 0x50
function getrankxpcapped(inrankxp) {
    if (isdefined(level.rankxpcap) && level.rankxpcap && level.rankxpcap <= inrankxp) {
        return level.rankxpcap;
    }
    return inrankxp;
}

// Namespace rank/rank_shared
// Params 14, eflags: 0x1 linked
// Checksum 0x78cc2557, Offset: 0xba0
// Size: 0x748
function registerscoreinfo(type, row, lp, xp, sp, hs, res, var_e775f7ed, dp, is_obj, label, medalname, job_type, var_b6593614, var_1a39d14, var_bdbfb0e, var_a434fd2d, is_deprecated, bounty_reward, var_65181181) {
    overridedvar = "scr_" + level.gametype + "_score_" + type;
    if (getdvarstring(overridedvar) != "") {
        value = getdvarint(overridedvar, 0);
    }
    if (!sessionmodeismultiplayergame()) {
        if (isdefined(xp) && xp) {
            level.scoreinfo[type][#"xp"] = xp;
        }
    }
    if (isdefined(sp) && sp) {
        level.scoreinfo[type][#"sp"] = sp;
    }
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        level.scoreinfo[type][#"row"] = row;
        if (isdefined(lp) && lp) {
            level.scoreinfo[type][#"lp"] = lp;
        }
        if (isdefined(hs) && hs) {
            level.scoreinfo[type][#"hs"] = hs;
        }
        if (isdefined(res) && res) {
            level.scoreinfo[type][#"res"] = res;
        }
        if (isdefined(var_e775f7ed) && var_e775f7ed) {
            level.scoreinfo[type][#"hash_4e7be147d773e419"] = var_e775f7ed;
        }
        if (isdefined(dp) && dp) {
            level.scoreinfo[type][#"dp"] = dp;
        }
        if (isdefined(is_obj) && is_obj) {
            level.scoreinfo[type][#"isobj"] = is_obj;
        }
        if (isdefined(medalname)) {
            if (type == "kill" || type == "ekia") {
                multiplier = getgametypesetting(#"killeventscoremultiplier");
                if (multiplier > 0) {
                    if (isdefined(level.scoreinfo[type][#"sp"]) && level.scoreinfo[type][#"sp"]) {
                        level.scoreinfo[type][#"sp"] = int(multiplier * level.scoreinfo[type][#"sp"]);
                    }
                }
            }
        }
        if (isdefined(label)) {
            level.scoreinfo[type][#"label"] = label;
        }
        if (isdefined(medalname) && medalname != #"") {
            level.scoreinfo[type][#"medalnamehash"] = medalname;
        }
        if (job_type != "") {
            level.scoreinfo[type][#"job_type"] = job_type;
        }
        if (var_b6593614 != "") {
            level.scoreinfo[type][#"hash_401b1493e5188252"] = var_b6593614;
        }
        if (var_1a39d14 != "") {
            level.scoreinfo[type][#"hash_251eb53657a5574e"] = var_1a39d14;
        }
        if (var_bdbfb0e != "") {
            level.scoreinfo[type][#"hash_294ec6af2b8cb400"] = var_bdbfb0e;
        }
        if (isdefined(var_a434fd2d) && var_a434fd2d) {
            level.scoreinfo[type][#"hash_6f22dfa8ea741f95"] = var_a434fd2d;
        }
        if (isdefined(is_deprecated) && is_deprecated) {
            level.scoreinfo[type][#"is_deprecated"] = is_deprecated;
        }
        if (isdefined(bounty_reward) && bounty_reward) {
            level.scoreinfo[type][#"bounty_reward"] = bounty_reward;
        }
        if (isdefined(var_65181181) && var_65181181) {
            level.scoreinfo[type][#"hash_691aeaca4a1866e3"] = var_65181181;
        }
    } else if (sessionmodeiscampaigngame()) {
        if (isdefined(res) && res) {
            level.scoreinfo[type][#"res"] = res;
        }
    } else if (sessionmodeiszombiesgame()) {
        if (isdefined(res) && res) {
            level.scoreinfo[type][#"res"] = res;
        }
        if (isdefined(label)) {
            level.scoreinfo[type][#"label"] = label;
        }
    }
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe3cf4583, Offset: 0x12f0
// Size: 0x66
function function_ca5d4a8(type) {
    return isdefined(level.scoreinfo[type]) && isdefined(level.scoreinfo[type][#"hash_6f22dfa8ea741f95"]) && level.scoreinfo[type][#"hash_6f22dfa8ea741f95"];
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe5f320b4, Offset: 0x1360
// Size: 0x11e
function getscoreinfovalue(type) {
    playerrole = getrole();
    if (isdefined(level.scoreinfo[type])) {
        n_score = isdefined(level.scoreinfo[type][#"sp"]) ? level.scoreinfo[type][#"sp"] : 0;
        if (isdefined(level.scoremodifiercallback) && isdefined(n_score)) {
            n_score = [[ level.scoremodifiercallback ]](type, n_score);
        }
        /#
            var_1eb7c454 = getdvarfloat(#"hash_eae9a8ee387705d", 1);
            n_score = int(n_score * var_1eb7c454);
        #/
        return n_score;
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1c77a0b, Offset: 0x1488
// Size: 0x22
function function_4587103(type) {
    return int(0);
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1b768aae, Offset: 0x14b8
// Size: 0xa
function getrole() {
    return "prc_mp_slayer";
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x586e3d33, Offset: 0x14d0
// Size: 0xce
function getscoreinfoposition(type) {
    playerrole = getrole();
    if (isdefined(level.scoreinfo[type])) {
        n_pos = isdefined(level.scoreinfo[type][#"hash_7c1f7c7897445706"]) ? level.scoreinfo[type][#"hash_7c1f7c7897445706"] : 0;
        if (isdefined(level.scoremodifiercallback) && isdefined(n_pos)) {
            n_resource = [[ level.scoremodifiercallback ]](type, n_pos);
        }
        return n_pos;
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x0
// Checksum 0x4646be7b, Offset: 0x15a8
// Size: 0xc6
function getscoreinforesource(type) {
    playerrole = getrole();
    if (isdefined(level.scoreinfo[type])) {
        n_resource = isdefined(level.scoreinfo[type][#"res"]) ? level.scoreinfo[type][#"res"] : 0;
        if (isdefined(level.resourcemodifiercallback) && isdefined(n_resource)) {
            n_resource = [[ level.resourcemodifiercallback ]](type, n_resource);
        }
        return n_resource;
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x0
// Checksum 0xc4b584ff, Offset: 0x1678
// Size: 0xc6
function getscoreinfoxp(type) {
    playerrole = getrole();
    if (isdefined(level.scoreinfo[type])) {
        n_xp = isdefined(level.scoreinfo[type][#"xp"]) ? level.scoreinfo[type][#"xp"] : 0;
        if (isdefined(level.xpmodifiercallback) && isdefined(n_xp)) {
            n_xp = [[ level.xpmodifiercallback ]](type, n_xp);
        }
        return n_xp;
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x0
// Checksum 0x8bf0adb1, Offset: 0x1748
// Size: 0x34
function shouldskipmomentumdisplay(type) {
    if (isdefined(level.disablemomentum) && level.disablemomentum) {
        return 1;
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x39235383, Offset: 0x1788
// Size: 0x2a
function getscoreinfolabel(type) {
    return level.scoreinfo[type][#"label"];
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x0
// Checksum 0xa938caa, Offset: 0x17c0
// Size: 0x2a
function getcombatefficiencyevent(type) {
    return level.scoreinfo[type][#"combat_efficiency_event"];
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xfaccca60, Offset: 0x17f8
// Size: 0x4c
function doesscoreinfocounttowardrampage(type) {
    return isdefined(level.scoreinfo[type][#"rampage"]) && level.scoreinfo[type][#"rampage"];
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6b83e1c7, Offset: 0x1850
// Size: 0x84
function function_f7b5d9fa(type) {
    playerrole = getrole();
    if (isdefined(level.scoreinfo[type])) {
        return (isdefined(level.scoreinfo[type][#"isobj"]) ? level.scoreinfo[type][#"isobj"] : 0);
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x155e4a72, Offset: 0x18e0
// Size: 0x5a
function getrankinfominxp(rankid = 0) {
    rankid = math::clamp(rankid, 0, 54);
    return int(level.ranktable[rankid][0]);
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xafc815b, Offset: 0x1948
// Size: 0x5a
function getrankinfomaxxp(rankid = 0) {
    rankid = math::clamp(rankid, 0, 54);
    return int(level.ranktable[rankid][1]);
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4e39d3ce, Offset: 0x19b0
// Size: 0x5a
function getrankinfoxpamt(rankid = 0) {
    rankid = math::clamp(rankid, 0, 54);
    return int(level.ranktable[rankid][2]);
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3ee29ac6, Offset: 0x1a18
// Size: 0xd8
function shouldkickbyrank() {
    if (self ishost()) {
        return 0;
    }
    if (level.rankcap > 0 && self.pers[#"rank"] > level.rankcap) {
        return 1;
    }
    if (level.rankcap > 0 && level.minprestige == 0 && self.pers[#"plevel"] > 0) {
        return 1;
    }
    if (level.minprestige > self.pers[#"plevel"]) {
        return 1;
    }
    return 0;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x35501a6f, Offset: 0x1af8
// Size: 0x98
function getrankxpstat() {
    rankxp = self stats::get_stat_global(#"rankxp", 1);
    if (!isdefined(rankxp)) {
        return 0;
    }
    rankxpcapped = getrankxpcapped(rankxp);
    if (rankxp > rankxpcapped) {
        self stats::set_stat_global(#"rankxp", rankxpcapped, 1);
    }
    return rankxpcapped;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb7f553bd, Offset: 0x1b98
// Size: 0x70
function getarenapointsstat() {
    arenaslot = arenagetslot();
    arenapoints = self stats::get_stat(#"arenastats", arenaslot, #"rankedplaystats", #"points");
    return arenapoints + 1;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1fe3eb3e, Offset: 0x1c10
// Size: 0x94c
function on_player_connect() {
    self.pers[#"rankxp"] = self getrankxpstat();
    rankid = getrankforxp(self getrankxp());
    self.pers[#"rank"] = rankid;
    self.pers[#"plevel"] = self stats::get_stat_global(#"plevel", 1);
    if (!isdefined(self.pers[#"plevel"])) {
        self.pers[#"plevel"] = 0;
    }
    if (self shouldkickbyrank()) {
        kick(self getentitynumber());
        return;
    }
    if (!isdefined(self.pers[#"participation"])) {
        self.pers[#"participation"] = 0;
    }
    if (!isdefined(self.pers[#"controllerparticipation"])) {
        self.pers[#"controllerparticipation"] = 0;
    }
    if (!isdefined(self.pers[#"controllerparticipationchecks"])) {
        self.pers[#"controllerparticipationchecks"] = 0;
    }
    if (!isdefined(self.pers[#"controllerparticipationchecksskipped"])) {
        self.pers[#"controllerparticipationchecksskipped"] = 0;
    }
    if (!isdefined(self.pers[#"controllerparticipationconsecutivesuccessmax"])) {
        self.pers[#"controllerparticipationconsecutivesuccessmax"] = 0;
    }
    if (!isdefined(self.pers[#"controllerparticipationconsecutivefailuremax"])) {
        self.pers[#"controllerparticipationconsecutivefailuremax"] = 0;
    }
    if (!isdefined(self.pers[#"hash_3b7fc8c62a7d4420"])) {
        self.pers[#"hash_3b7fc8c62a7d4420"] = 0;
    }
    if (!isdefined(self.pers[#"hash_4a01db5796cf12b1"])) {
        self.pers[#"hash_4a01db5796cf12b1"] = #"none";
    }
    if (!isdefined(self.pers[#"controllerparticipationendgameresult"])) {
        self.pers[#"controllerparticipationendgameresult"] = -1;
    }
    if (!isdefined(self.pers[#"controllerparticipationinactivitywarnings"])) {
        self.pers[#"controllerparticipationinactivitywarnings"] = 0;
    }
    if (!isdefined(self.pers[#"controllerparticipationsuccessafterinactivitywarning"])) {
        self.pers[#"controllerparticipationsuccessafterinactivitywarning"] = 0;
    }
    self.rankupdatetotal = 0;
    self.cur_ranknum = rankid;
    /#
        assert(isdefined(self.cur_ranknum), "<unknown string>" + rankid + "<unknown string>");
    #/
    prestige = self stats::get_stat_global(#"plevel", 1);
    if (!isdefined(prestige)) {
        prestige = 0;
    }
    self setrank(rankid, prestige);
    self.pers[#"prestige"] = prestige;
    if (sessionmodeismultiplayergame() && gamemodeisusingstats() || sessionmodeiszombiesgame() && sessionmodeisonlinegame()) {
        paragonrank = self stats::get_stat_global(#"paragon_rank", 1);
        if (!isdefined(paragonrank)) {
            paragonrank = 0;
        }
        paragonrank = int(min(paragonrank, 1000));
        self setparagonrank(paragonrank);
        self.pers[#"paragonrank"] = paragonrank;
        paragoniconid = self stats::get_stat_global(#"paragon_icon_id", 1);
        if (!isdefined(paragoniconid)) {
            paragoniconid = 0;
        }
        self setparagoniconid(paragoniconid);
        self.pers[#"paragoniconid"] = paragoniconid;
    }
    if (sessionmodeiswarzonegame()) {
        self setparagonrank(0);
        self.pers[#"paragonrank"] = 0;
        self setparagoniconid(0);
        self.pers[#"paragoniconid"] = 0;
    }
    if (!isdefined(self.pers[#"summary"])) {
        self.pers[#"summary"] = [];
        self.pers[#"summary"][#"xp"] = 0;
        self.pers[#"summary"][#"score"] = 0;
        self.pers[#"summary"][#"challenge"] = 0;
        self.pers[#"summary"][#"match"] = 0;
        self.pers[#"summary"][#"misc"] = 0;
    }
    if (gamemodeismode(6) && !isbot(self)) {
        arenapoints = self getarenapointsstat();
        arenapoints = int(min(arenapoints, 100));
        self.pers[#"arenapoints"] = arenapoints;
        self setarenapoints(arenapoints);
    }
    self.explosivekills[0] = 0;
    if (level.rankedmatch) {
        if (!sessionmodeiswarzonegame()) {
            self stats::set_stat_global(#"rank", rankid, 1);
            self stats::set_stat_global(#"minxp", getrankinfominxp(rankid), 1);
            self stats::set_stat_global(#"maxxp", getrankinfomaxxp(rankid), 1);
            self stats::set_stat_global(#"lastxp", getrankxpcapped(self.pers[#"rankxp"]), 1);
        }
    }
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x0
// Checksum 0x4e6a79da, Offset: 0x2568
// Size: 0x84
function atleastoneplayeroneachteam() {
    foreach (team, _ in level.teams) {
        if (!level.playercount[team]) {
            return 0;
        }
    }
    return 1;
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x0
// Checksum 0x3c09a6b8, Offset: 0x25f8
// Size: 0x32
function round_this_number(value) {
    value = int(value + 0.5);
    return value;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x0
// Checksum 0x6b23cd8e, Offset: 0x2638
// Size: 0x208
function updaterank() {
    newrankid = self getrank();
    if (newrankid == self.pers[#"rank"]) {
        return 0;
    }
    oldrank = self.pers[#"rank"];
    rankid = self.pers[#"rank"];
    self.pers[#"rank"] = newrankid;
    while (rankid <= newrankid) {
        self stats::set_stat_global(#"rank", rankid, 1);
        self stats::set_stat_global(#"minxp", int(self getrankinfominxp(rankid)), 1);
        self stats::set_stat_global(#"maxxp", int(self getrankinfomaxxp(rankid)), 1);
        rankid++;
    }
    /#
        print("<unknown string>" + oldrank + "<unknown string>" + newrankid + "<unknown string>" + self stats::get_stat_global(#"time_played_total"));
    #/
    self setrank(newrankid);
    return 1;
}

// Namespace rank/player_rankup
// Params 1, eflags: 0x40
// Checksum 0xd0f47c62, Offset: 0x2848
// Size: 0x1d8
function event_handler[player_rankup] codecallback_rankup(eventstruct) {
    if (sessionmodeismultiplayergame()) {
        if (eventstruct.rank > 53) {
            self giveachievement("mp_trophy_battle_tested");
        }
        if (eventstruct.rank > 8) {
            self giveachievement("mp_trophy_welcome_to_the_club");
        }
    }
    self.pers[#"rank"] = eventstruct.rank;
    if (sessionmodeiswarzonegame()) {
        self stats::function_62b271d8(#"rank", self.pers[#"rank"]);
        self stats::function_62b271d8(#"plevel", self.pers[#"plevel"]);
    } else {
        self luinotifyevent(#"rank_up", 3, eventstruct.rank, eventstruct.prestige, eventstruct.unlock_tokens_added);
        self function_b552ffa9(#"rank_up", 3, eventstruct.rank, eventstruct.prestige, eventstruct.unlock_tokens_added);
        if (isdefined(level.playpromotionreaction)) {
            self thread [[ level.playpromotionreaction ]]();
        }
    }
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x0
// Checksum 0x5a9de5e8, Offset: 0x2a28
// Size: 0x68
function getitemindex(refstring) {
    itemindex = getitemindexfromref(refstring);
    /#
        assert(itemindex > 0, "<unknown string>" + refstring + "<unknown string>" + itemindex);
    #/
    return itemindex;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9a3e5ad3, Offset: 0x2a98
// Size: 0x12
function endgameupdate() {
    player = self;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe37283f3, Offset: 0x2ab8
// Size: 0xa4
function getrank() {
    rankxp = getrankxpcapped(self.pers[#"rankxp"]);
    rankid = self.pers[#"rank"];
    if (rankxp < getrankinfominxp(rankid) + getrankinfoxpamt(rankid)) {
        return rankid;
    } else {
        return getrankforxp(rankxp);
    }
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x61872a64, Offset: 0x2b68
// Size: 0x74
function getspm() {
    if (isarenamode()) {
        ranklevel = getrankcap() + 1;
    } else {
        ranklevel = self getrank() + 1;
    }
    return (3 + ranklevel * 0.5) * 10;
}

// Namespace rank/rank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x17db2bba, Offset: 0x2be8
// Size: 0x2a
function getrankxp() {
    return getrankxpcapped(self.pers[#"rankxp"]);
}

// Namespace rank/rank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc980ab86, Offset: 0x2c20
// Size: 0x62
function function_bcb5e246(type) {
    var_920d60e7 = 0;
    if (isdefined(level.scoreinfo[type][#"bounty_reward"])) {
        var_920d60e7 = level.scoreinfo[type][#"bounty_reward"];
    }
    return var_920d60e7;
}

