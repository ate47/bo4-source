#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\gametypes\hud_message;
#using scripts\mp_common\gametypes\hostmigration;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\killstreaks\killstreaks_util;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\core_common\weapons_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\hostmigration_shared;
#using scripts\core_common\callbacks_shared;

#namespace globallogic_utils;

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x0
// Checksum 0x801780b6, Offset: 0x118
// Size: 0xca
function is_winner(outcome, team_or_player) {
    if (isplayer(team_or_player)) {
        if (outcome.players.size && outcome.players[0] == team_or_player) {
            return true;
        }
        if (isdefined(outcome.team) && outcome.team == team_or_player.team) {
            return true;
        }
    } else if (isdefined(outcome.team) && outcome.team == team_or_player) {
        return true;
    }
    return false;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x5e8998fb, Offset: 0x1f0
// Size: 0xba
function testshock() {
    self endon(#"death", #"disconnect");
    for (;;) {
        wait 3;
        numshots = randomint(6);
        for (i = 0; i < numshots; i++) {
            iprintlnbold(numshots);
            self shellshock(#"frag_grenade_mp", 0.2);
            wait 0.1;
        }
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x4e5cf43a, Offset: 0x2b8
// Size: 0xd0
function testhps() {
    self endon(#"death", #"disconnect");
    hps = [];
    hps[hps.size] = "radar";
    hps[hps.size] = "artillery";
    hps[hps.size] = "dogs";
    for (;;) {
        hp = "radar";
        if (self thread killstreaks::give(hp)) {
            self playlocalsound(level.killstreaks[hp].informdialog);
        }
        wait 20;
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xb71b7348, Offset: 0x390
// Size: 0x10e
function timeuntilroundend() {
    if (level.gameended) {
        timepassed = float(gettime() - level.gameendtime) / 1000;
        timeremaining = level.roundenddelay[3] - timepassed;
        if (timeremaining < 0) {
            return 0;
        }
        return timeremaining;
    }
    if (level.timelimit <= 0) {
        return undefined;
    }
    if (!isdefined(level.starttime)) {
        return undefined;
    }
    timepassed = float(gettimepassed() - level.starttime) / 1000;
    timeremaining = level.timelimit * 60 - timepassed;
    return timeremaining + level.roundenddelay[3];
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x80fee7ff, Offset: 0x4a8
// Size: 0x3c
function gettimeremaining() {
    return level.timelimit * int(60 * 1000) - gettimepassed();
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0xa8f24c3c, Offset: 0x4f0
// Size: 0x46
function registerpostroundevent(eventfunc) {
    if (!isdefined(level.postroundevents)) {
        level.postroundevents = [];
    }
    level.postroundevents[level.postroundevents.size] = eventfunc;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x28e7e3f3, Offset: 0x540
// Size: 0x58
function executepostroundevents() {
    if (!isdefined(level.postroundevents)) {
        return;
    }
    for (i = 0; i < level.postroundevents.size; i++) {
        [[ level.postroundevents[i] ]]();
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 3, eflags: 0x0
// Checksum 0xbe135104, Offset: 0x5a0
// Size: 0x4e
function getvalueinrange(value, minvalue, maxvalue) {
    if (value > maxvalue) {
        return maxvalue;
    }
    if (value < minvalue) {
        return minvalue;
    }
    return value;
}

/#

    // Namespace globallogic_utils/globallogic_utils
    // Params 0, eflags: 0x0
    // Checksum 0x9eb0d381, Offset: 0x5f8
    // Size: 0x2ca
    function assertproperplacement() {
        numplayers = level.placement[#"all"].size;
        if (level.teambased) {
            for (i = 0; i < numplayers - 1; i++) {
                if (level.placement[#"all"][i].score < level.placement[#"all"][i + 1].score) {
                    println("<dev string:x38>");
                    for (j = 0; j < numplayers; j++) {
                        player = level.placement[#"all"][j];
                        println("<dev string:x4d>" + j + "<dev string:x52>" + player.name + "<dev string:x57>" + player.score);
                    }
                    assertmsg("<dev string:x5c>");
                    break;
                }
            }
            return;
        }
        for (i = 0; i < numplayers - 1; i++) {
            if (level.placement[#"all"][i].pointstowin < level.placement[#"all"][i + 1].pointstowin) {
                println("<dev string:x38>");
                for (j = 0; j < numplayers; j++) {
                    player = level.placement[#"all"][j];
                    println("<dev string:x4d>" + j + "<dev string:x52>" + player.name + "<dev string:x57>" + player.pointstowin);
                }
                assertmsg("<dev string:x5c>");
                break;
            }
        }
    }

#/

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0xb459de5, Offset: 0x8d0
// Size: 0x22
function isvalidclass(c) {
    return isdefined(c) && c != "";
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0xf718ec3, Offset: 0x900
// Size: 0x118
function playtickingsound(gametype_tick_sound) {
    self endon(#"death", #"stop_ticking");
    level endon(#"game_ended");
    time = level.bombtimer;
    while (true) {
        self playsound(gametype_tick_sound);
        if (time > 10) {
            time -= 1;
            wait 1;
        } else if (time > 4) {
            time -= 0.5;
            wait 0.5;
        } else if (time > 1) {
            time -= 0.4;
            wait 0.4;
        } else {
            time -= 0.3;
            wait 0.3;
        }
        hostmigration::waittillhostmigrationdone();
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x3d78add6, Offset: 0xa20
// Size: 0x1e
function stoptickingsound() {
    if (isdefined(self)) {
        self notify(#"stop_ticking");
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xb62a9b3e, Offset: 0xa48
// Size: 0x10c
function gametimer() {
    level endon(#"game_ended");
    level.var_8a3a9ca4.roundstart = gettime();
    level.starttime = gettime();
    level.discardtime = 0;
    if (isdefined(game.roundmillisecondsalreadypassed)) {
        level.starttime -= game.roundmillisecondsalreadypassed;
        game.roundmillisecondsalreadypassed = undefined;
    }
    prevtime = gettime() - 1000;
    while (game.state == "playing") {
        if (!level.timerstopped) {
            game.timepassed += gettime() - prevtime;
        }
        if (!level.playabletimerstopped) {
            game.playabletimepassed += gettime() - prevtime;
        }
        prevtime = gettime();
        wait 1;
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x39180d29, Offset: 0xb60
// Size: 0x7c
function disableplayerroundstartdelay() {
    player = self;
    player endon(#"death", #"disconnect");
    if (getroundstartdelay()) {
        wait getroundstartdelay();
    }
    player disableroundstartdelay();
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xaa863064, Offset: 0xbe8
// Size: 0x54
function getroundstartdelay() {
    waittime = level.roundstartexplosivedelay - float([[ level.gettimepassed ]]()) / 1000;
    if (waittime > 0) {
        return waittime;
    }
    return 0;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x7c0e0ffa, Offset: 0xc48
// Size: 0x9c
function applyroundstartdelay() {
    self endon(#"disconnect", #"joined_spectators", #"death");
    if (game.state == "pregame") {
        level waittill(#"game_playing");
    } else {
        waitframe(1);
    }
    self enableroundstartdelay();
    self thread disableplayerroundstartdelay();
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x27108563, Offset: 0xcf0
// Size: 0x66
function gettimepassed() {
    if (!isdefined(level.starttime)) {
        return 0;
    }
    if (level.timerstopped) {
        return (level.timerpausetime - level.starttime - level.discardtime);
    }
    return gettime() - level.starttime - level.discardtime;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x8812852d, Offset: 0xd60
// Size: 0x52
function pausetimer(pauseplayabletimer = 0) {
    level.playabletimerstopped = pauseplayabletimer;
    if (level.timerstopped) {
        return;
    }
    level.timerstopped = 1;
    level.timerpausetime = gettime();
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xfe81f2f2, Offset: 0xdc0
// Size: 0x52
function resumetimer() {
    if (!level.timerstopped) {
        return;
    }
    level.timerstopped = 0;
    level.playabletimerstopped = 0;
    level.discardtime += gettime() - level.timerpausetime;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x223b9648, Offset: 0xe20
// Size: 0x3a
function resumetimerdiscardoverride(discardtime) {
    if (!level.timerstopped) {
        return;
    }
    level.timerstopped = 0;
    level.discardtime = discardtime;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0xa5c1e111, Offset: 0xe68
// Size: 0x9e
function getscoreremaining(team) {
    assert(isplayer(self) || isdefined(team));
    scorelimit = level.scorelimit;
    if (isplayer(self)) {
        return (scorelimit - globallogic_score::_getplayerscore(self));
    }
    return scorelimit - getteamscore(team);
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x35b6b5a7, Offset: 0xf10
// Size: 0x6a
function getteamscoreforround(team) {
    if (level.cumulativeroundscores && isdefined(game.lastroundscore[team])) {
        return (getteamscore(team) - game.lastroundscore[team]);
    }
    return getteamscore(team);
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x914af0ab, Offset: 0xf88
// Size: 0xd2
function getscoreperminute(team) {
    assert(isplayer(self) || isdefined(team));
    minutespassed = gettimepassed() / int(60 * 1000) + 0.0001;
    if (isplayer(self)) {
        return (globallogic_score::_getplayerscore(self) / minutespassed);
    }
    return getteamscoreforround(team) / minutespassed;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0xd43231d0, Offset: 0x1068
// Size: 0x9a
function getestimatedtimeuntilscorelimit(team) {
    assert(isplayer(self) || isdefined(team));
    scoreperminute = self getscoreperminute(team);
    scoreremaining = self getscoreremaining(team);
    if (!scoreperminute) {
        return 999999;
    }
    return scoreremaining / scoreperminute;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x15f934cc, Offset: 0x1110
// Size: 0x48
function rumbler() {
    self endon(#"disconnect");
    while (true) {
        wait 0.1;
        self playrumbleonentity("damage_heavy");
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x0
// Checksum 0x4d77e9d3, Offset: 0x1160
// Size: 0x24
function waitfortimeornotify(time, notifyname) {
    self endon(notifyname);
    wait time;
}

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x0
// Checksum 0x59a2cc19, Offset: 0x1190
// Size: 0x60
function waitfortimeornotifynoartillery(time, notifyname) {
    self endon(notifyname);
    wait time;
    while (isdefined(level.artilleryinprogress)) {
        assert(level.artilleryinprogress);
        wait 0.25;
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 4, eflags: 0x0
// Checksum 0x466d8b16, Offset: 0x11f8
// Size: 0x140
function isheadshot(weapon, shitloc, smeansofdeath, einflictor) {
    if (shitloc != "head" && shitloc != "helmet") {
        return false;
    }
    switch (smeansofdeath) {
    case #"mod_melee_assassinate":
    case #"mod_melee":
        return false;
    case #"mod_impact":
        baseweapon = weapons::getbaseweapon(weapon);
        if (!weapon.isballisticknife && baseweapon != level.weaponspecialcrossbow && baseweapon != level.weaponflechette) {
            return false;
        }
        break;
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        if (!isdefined(einflictor) || !isdefined(einflictor.controlled) || einflictor.controlled == 0) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x78d3a400, Offset: 0x1340
// Size: 0x166
function gethitlocheight(shitloc) {
    switch (shitloc) {
    case #"head":
    case #"helmet":
    case #"neck":
        return 60;
    case #"left_arm_lower":
    case #"left_arm_upper":
    case #"torso_upper":
    case #"right_arm_lower":
    case #"left_hand":
    case #"right_arm_upper":
    case #"gun":
    case #"right_hand":
        return 48;
    case #"torso_lower":
        return 40;
    case #"right_leg_upper":
    case #"left_leg_upper":
        return 32;
    case #"left_leg_lower":
    case #"right_leg_lower":
        return 10;
    case #"left_foot":
    case #"right_foot":
        return 5;
    }
    return 48;
}

/#

    // Namespace globallogic_utils/globallogic_utils
    // Params 2, eflags: 0x0
    // Checksum 0xeeaaa164, Offset: 0x14b0
    // Size: 0x5c
    function debugline(start, end) {
        for (i = 0; i < 50; i++) {
            line(start, end);
            waitframe(1);
        }
    }

#/

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x0
// Checksum 0xbf95909, Offset: 0x1518
// Size: 0x7c
function isexcluded(entity, entitylist) {
    if (!isarray(entitylist)) {
        return (entity == entitylist);
    }
    for (index = 0; index < entitylist.size; index++) {
        if (entity == entitylist[index]) {
            return true;
        }
    }
    return false;
}

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x0
// Checksum 0x4cd05528, Offset: 0x15a0
// Size: 0x2a
function function_4aa8d809(index, string) {
    level.var_336c35f1[index] = string;
}

/#

    // Namespace globallogic_utils/globallogic_utils
    // Params 1, eflags: 0x0
    // Checksum 0x822637ca, Offset: 0x15d8
    // Size: 0x22c
    function function_8d61a6c2(var_c1e98979) {
        assert(isdefined(var_c1e98979));
        assert(isdefined(level.var_336c35f1[var_c1e98979]));
        log_string = level.var_336c35f1[var_c1e98979];
        winner = round::get_winner();
        if (isplayer(winner)) {
            print("<dev string:x86>" + winner getxuid() + "<dev string:x97>" + winner.name + "<dev string:x9b>");
        }
        if (isdefined(winner)) {
            if (isplayer(winner)) {
                log_string = log_string + "<dev string:x9f>" + winner getxuid() + "<dev string:x97>" + winner.name + "<dev string:x9b>";
            } else {
                log_string = log_string + "<dev string:x9f>" + winner;
            }
        }
        foreach (team, str_team in level.teams) {
            log_string = log_string + "<dev string:xa9>" + str_team + "<dev string:x57>" + game.stat[#"teamscores"][team];
        }
        print(log_string);
    }

#/

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0xa42fa894, Offset: 0x1810
// Size: 0x46
function add_map_error(msg) {
    if (!isdefined(level.maperrors)) {
        level.maperrors = [];
    }
    level.maperrors[level.maperrors.size] = msg;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xa40d2c2a, Offset: 0x1860
// Size: 0xdc
function print_map_errors() {
    if (isdefined(level.maperrors) && level.maperrors.size > 0) {
        /#
            println("<dev string:xae>");
            for (i = 0; i < level.maperrors.size; i++) {
                println("<dev string:xd7>" + level.maperrors[i]);
            }
            println("<dev string:xe1>");
            util::error("<dev string:x10a>");
        #/
        callback::abort_level();
        return true;
    }
    return false;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0x79d32cec, Offset: 0x1948
// Size: 0x22
function function_308e3379() {
    return strendswith(level.gametype, "_bb");
}

