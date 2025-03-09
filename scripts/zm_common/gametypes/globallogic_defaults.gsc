#using scripts\core_common\callbacks_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\gametypes\globallogic;
#using scripts\zm_common\gametypes\globallogic_audio;
#using scripts\zm_common\gametypes\globallogic_score;
#using scripts\zm_common\gametypes\globallogic_utils;
#using scripts\zm_common\gametypes\spawnlogic;
#using scripts\zm_common\util;

#namespace globallogic_defaults;

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x4c029395, Offset: 0x138
// Size: 0x3a
function getwinningteamfromloser(losing_team) {
    if (level.multiteam) {
        return "tie";
    }
    return util::getotherteam(losing_team);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0xad9fa983, Offset: 0x180
// Size: 0x2ec
function default_onforfeit(team) {
    level.gameforfeited = 1;
    level notify(#"forfeit in progress");
    level endon(#"forfeit in progress");
    level endon(#"abort forfeit");
    forfeit_delay = 20;
    announcement(game.strings[#"opponent_forfeiting_in"], forfeit_delay, 0);
    wait 10;
    announcement(game.strings[#"opponent_forfeiting_in"], 10, 0);
    wait 10;
    endreason = #"";
    if (!isdefined(team)) {
        setdvar(#"ui_text_endreason", game.strings[#"players_forfeited"]);
        endreason = game.strings[#"players_forfeited"];
        winner = level.players[0];
    } else if (isdefined(level.teams[team])) {
        endreason = game.strings[team + "_forfeited"];
        setdvar(#"ui_text_endreason", endreason);
        winner = getwinningteamfromloser(team);
    } else {
        assert(isdefined(team), "<dev string:x38>");
        assert(0, "<dev string:x58>" + team + "<dev string:x6a>");
        winner = "tie";
    }
    level.forcedend = 1;
    /#
        if (isplayer(winner)) {
            print("<dev string:x83>" + winner getxuid() + "<dev string:x94>" + winner.name + "<dev string:x98>");
        } else {
            globallogic_utils::logteamwinstring("<dev string:x9c>", winner);
        }
    #/
    thread globallogic::endgame(winner, endreason);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x738dacb2, Offset: 0x478
// Size: 0x1bc
function default_ondeadevent(team) {
    level callback::callback(#"on_team_eliminated", team);
    if (isdefined(level.teams[team])) {
        eliminatedstring = game.strings[team + "_eliminated"];
        iprintln(eliminatedstring);
        setdvar(#"ui_text_endreason", eliminatedstring);
        winner = getwinningteamfromloser(team);
        globallogic_utils::logteamwinstring("team eliminated", winner);
        thread globallogic::endgame(winner, eliminatedstring);
        return;
    }
    setdvar(#"ui_text_endreason", game.strings[#"tie"]);
    globallogic_utils::logteamwinstring("tie");
    if (level.teambased) {
        thread globallogic::endgame("tie", game.strings[#"tie"]);
        return;
    }
    thread globallogic::endgame(undefined, game.strings[#"tie"]);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0xc45be514, Offset: 0x640
// Size: 0xc
function default_onalivecountchange(team) {
    
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x69c3262a, Offset: 0x658
// Size: 0x10
function default_onroundendgame(winner) {
    return winner;
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0xbcfe80d8, Offset: 0x670
// Size: 0x162
function default_ononeleftevent(team) {
    if (!level.teambased) {
        winner = globallogic_score::gethighestscoringplayer();
        /#
            if (isdefined(winner)) {
                print("<dev string:xa6>" + winner.name);
            } else {
                print("<dev string:xbe>");
            }
        #/
        thread globallogic::endgame(winner, #"mp_enemies_eliminated");
        return;
    }
    for (index = 0; index < level.players.size; index++) {
        player = level.players[index];
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(player.pers[#"team"]) || player.pers[#"team"] != team) {
        }
    }
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0x4d890536, Offset: 0x7e0
// Size: 0x12c
function default_ontimelimit() {
    winner = undefined;
    if (level.teambased) {
        winner = globallogic::determineteamwinnerbygamestat("teamScores");
        globallogic_utils::logteamwinstring("time limit", winner);
    } else {
        winner = globallogic_score::gethighestscoringplayer();
        /#
            if (isdefined(winner)) {
                print("<dev string:xdd>" + winner.name);
            } else {
                print("<dev string:xf1>");
            }
        #/
    }
    setdvar(#"ui_text_endreason", game.strings[#"time_limit_reached"]);
    thread globallogic::endgame(winner, game.strings[#"time_limit_reached"]);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0x200c021a, Offset: 0x918
// Size: 0x148
function default_onscorelimit() {
    if (!level.endgameonscorelimit) {
        return false;
    }
    winner = undefined;
    if (level.teambased) {
        winner = globallogic::determineteamwinnerbygamestat("teamScores");
        globallogic_utils::logteamwinstring("scorelimit", winner);
    } else {
        winner = globallogic_score::gethighestscoringplayer();
        /#
            if (isdefined(winner)) {
                print("<dev string:x103>" + winner.name);
            } else {
                print("<dev string:x117>");
            }
        #/
    }
    setdvar(#"ui_text_endreason", game.strings[#"score_limit_reached"]);
    thread globallogic::endgame(winner, game.strings[#"score_limit_reached"]);
    return true;
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 2, eflags: 0x0
// Checksum 0xf2f76a16, Offset: 0xa68
// Size: 0xf4
function default_onspawnspectator(origin, angles) {
    if (isdefined(origin) && isdefined(angles)) {
        self spawn(origin, angles);
        return;
    }
    spawnpointname = "mp_global_intermission";
    spawnpoints = getentarray(spawnpointname, "classname");
    assert(spawnpoints.size, "<dev string:x129>");
    spawnpoint = spawnlogic::getspawnpoint_random(spawnpoints);
    self spawn(spawnpoint.origin, spawnpoint.angles);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0x5097ef2e, Offset: 0xb68
// Size: 0xb4
function default_onspawnintermission() {
    spawnpointname = "mp_global_intermission";
    spawnpoints = getentarray(spawnpointname, "classname");
    spawnpoint = spawnpoints[0];
    if (isdefined(spawnpoint)) {
        self spawn(spawnpoint.origin, spawnpoint.angles);
        return;
    }
    /#
        util::error("<dev string:x185>" + spawnpointname + "<dev string:x18b>");
    #/
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0x82f90cab, Offset: 0xc28
// Size: 0x42
function default_gettimelimit() {
    return math::clamp(getgametypesetting(#"timelimit"), level.timelimitmin, level.timelimitmax);
}

