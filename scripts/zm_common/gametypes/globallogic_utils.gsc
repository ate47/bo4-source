#using scripts\zm_common\gametypes\hostmigration.gsc;
#using scripts\zm_common\gametypes\globallogic_score.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_utils;

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xa8dc9b43, Offset: 0xd0
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
// Checksum 0x6c582fe9, Offset: 0x198
// Size: 0x94
function testhps() {
    self endon(#"death", #"disconnect");
    hps = [];
    hps[hps.size] = "radar";
    hps[hps.size] = "artillery";
    hps[hps.size] = "dogs";
    for (;;) {
        hp = "radar";
        wait 20;
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xfcb415c8, Offset: 0x238
// Size: 0xe4
function timeuntilroundend() {
    if (level.gameended) {
        timepassed = (gettime() - level.gameendtime) / 1000;
        timeremaining = level.postroundtime - timepassed;
        if (timeremaining < 0) {
            return 0;
        }
        return timeremaining;
    }
    if (level.inovertime) {
        return undefined;
    }
    if (level.timelimit <= 0) {
        return undefined;
    }
    if (!isdefined(level.starttime)) {
        return undefined;
    }
    timepassed = (gettimepassed() - level.starttime) / 1000;
    timeremaining = level.timelimit * 60 - timepassed;
    return timeremaining + level.postroundtime;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x1 linked
// Checksum 0x9cfc9827, Offset: 0x328
// Size: 0x2c
function gettimeremaining() {
    return level.timelimit * 60 * 1000 - gettimepassed();
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xa01c2f7, Offset: 0x360
// Size: 0x46
function registerpostroundevent(eventfunc) {
    if (!isdefined(level.postroundevents)) {
        level.postroundevents = [];
    }
    level.postroundevents[level.postroundevents.size] = eventfunc;
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x1 linked
// Checksum 0xe7e66fca, Offset: 0x3b0
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
// Checksum 0x445b9128, Offset: 0x410
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
    // Checksum 0x265ed4e2, Offset: 0x468
    // Size: 0x1c2
    function assertproperplacement() {
        numplayers = level.placement[#"all"].size;
        for (i = 0; i < numplayers - 1; i++) {
            if (isdefined(level.placement[#"all"][i]) && isdefined(level.placement[#"all"][i + 1])) {
                if (level.placement[#"all"][i].score < level.placement[#"all"][i + 1].score) {
                    println("<dev string:x38>");
                    for (i = 0; i < numplayers; i++) {
                        player = level.placement[#"all"][i];
                        println("<dev string:x4d>" + i + "<dev string:x52>" + player.name + "<dev string:x57>" + player.score);
                    }
                    assertmsg("<dev string:x5c>");
                    break;
                }
            }
        }
    }

#/

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xf28d881c, Offset: 0x638
// Size: 0x6a
function isvalidclass(vclass) {
    if (level.oldschool || sessionmodeiszombiesgame()) {
        assert(!isdefined(vclass));
        return true;
    }
    return isdefined(vclass) && vclass != "";
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x3a70db50, Offset: 0x6b0
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
// Checksum 0xa4b3fec0, Offset: 0x7d0
// Size: 0x16
function stoptickingsound() {
    self notify(#"stop_ticking");
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x1 linked
// Checksum 0x10be8ead, Offset: 0x7f0
// Size: 0xe8
function gametimer() {
    level endon(#"game_ended");
    level waittill(#"prematch_over");
    level.starttime = gettime();
    level.discardtime = 0;
    if (isdefined(game.roundmillisecondsalreadypassed)) {
        level.starttime -= game.roundmillisecondsalreadypassed;
        game.roundmillisecondsalreadypassed = undefined;
    }
    prevtime = gettime();
    while (game.state == "playing") {
        if (!level.timerstopped) {
            game.timepassed += gettime() - prevtime;
        }
        prevtime = gettime();
        wait 1;
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x1 linked
// Checksum 0x843b0220, Offset: 0x8e0
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
// Params 0, eflags: 0x0
// Checksum 0xd5124267, Offset: 0x950
// Size: 0x2e
function pausetimer() {
    if (level.timerstopped) {
        return;
    }
    level.timerstopped = 1;
    level.timerpausetime = gettime();
}

// Namespace globallogic_utils/globallogic_utils
// Params 0, eflags: 0x0
// Checksum 0xbe93c885, Offset: 0x988
// Size: 0x46
function resumetimer() {
    if (!level.timerstopped) {
        return;
    }
    level.timerstopped = 0;
    level.discardtime += gettime() - level.timerpausetime;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xca695483, Offset: 0x9d8
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
// Params 1, eflags: 0x1 linked
// Checksum 0xb1eee434, Offset: 0xa80
// Size: 0xea
function getscoreperminute(team) {
    assert(isplayer(self) || isdefined(team));
    scorelimit = level.scorelimit;
    timelimit = level.timelimit;
    minutespassed = gettimepassed() / 60000 + 0.0001;
    if (isplayer(self)) {
        return (globallogic_score::_getplayerscore(self) / minutespassed);
    }
    return getteamscore(team) / minutespassed;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x1 linked
// Checksum 0xd3faf349, Offset: 0xb78
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
// Checksum 0xf47ac2b4, Offset: 0xc20
// Size: 0x48
function rumbler() {
    self endon(#"disconnect");
    while (true) {
        wait 0.1;
        self playrumbleonentity("damage_heavy");
    }
}

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x1 linked
// Checksum 0x785f180f, Offset: 0xc70
// Size: 0x24
function waitfortimeornotify(time, notifyname) {
    self endon(notifyname);
    wait time;
}

// Namespace globallogic_utils/globallogic_utils
// Params 2, eflags: 0x0
// Checksum 0x88a1e57f, Offset: 0xca0
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
// Checksum 0x36e202bd, Offset: 0xd08
// Size: 0x86
function isheadshot(weapon, shitloc, smeansofdeath, einflictor) {
    if (shitloc != "head" && shitloc != "helmet") {
        return false;
    }
    switch (smeansofdeath) {
    case #"mod_impact":
    case #"mod_melee":
        return false;
    }
    return true;
}

// Namespace globallogic_utils/globallogic_utils
// Params 1, eflags: 0x0
// Checksum 0x7ace2227, Offset: 0xd98
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
    // Checksum 0xe7748731, Offset: 0xf08
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
// Checksum 0xe16a2bf3, Offset: 0xf70
// Size: 0x56
function isexcluded(entity, entitylist) {
    for (index = 0; index < entitylist.size; index++) {
        if (entity == entitylist[index]) {
            return true;
        }
    }
    return false;
}

/#

    // Namespace globallogic_utils/globallogic_utils
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf6ffc7d9, Offset: 0xfd0
    // Size: 0xfc
    function logteamwinstring(wintype, winner) {
        log_string = wintype;
        if (isdefined(winner)) {
            log_string = log_string + "<dev string:x86>" + winner;
        }
        foreach (team, str_team in level.teams) {
            log_string = log_string + "<dev string:x90>" + str_team + "<dev string:x57>" + game.stat[#"teamscores"][team];
        }
        print(log_string);
    }

#/
