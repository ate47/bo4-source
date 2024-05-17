// Atian COD Tools GSC decompiler test
#using scripts\zm_common\util.gsc;
#using scripts\zm_common\gametypes\spectating.gsc;
#using scripts\zm_common\gametypes\globallogic_player.gsc;
#using scripts\zm_common\gametypes\globallogic.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace globallogic_ui;

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x2
// Checksum 0x7df4d212, Offset: 0x118
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"globallogic_ui", &__init__, undefined, undefined);
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function __init__() {
    
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x0
// Checksum 0xf937da09, Offset: 0x170
// Size: 0x7e
function setupcallbacks() {
    level.autoassign = &menuautoassign;
    level.spectator = &menuspectator;
    level.curclass = &menuclass;
    level.teammenu = &menuteam;
    level.autocontrolplayer = &menuautocontrolplayer;
}

/#

    // Namespace globallogic_ui/globallogic_ui
    // Params 0, eflags: 0x0
    // Checksum 0xb7d2efce, Offset: 0x1f8
    // Size: 0x27c
    function freegameplayhudelems() {
        if (isdefined(self.perkicon)) {
            for (numspecialties = 0; numspecialties < level.maxspecialties; numspecialties++) {
                if (isdefined(self.perkicon[numspecialties])) {
                    self.perkicon[numspecialties] hud::destroyelem();
                    self.perkname[numspecialties] hud::destroyelem();
                }
            }
        }
        if (isdefined(self.perkhudelem)) {
            self.perkhudelem hud::destroyelem();
        }
        if (isdefined(self.killstreakicon)) {
            if (isdefined(self.killstreakicon[0])) {
                self.killstreakicon[0] hud::destroyelem();
            }
            if (isdefined(self.killstreakicon[1])) {
                self.killstreakicon[1] hud::destroyelem();
            }
            if (isdefined(self.killstreakicon[2])) {
                self.killstreakicon[2] hud::destroyelem();
            }
            if (isdefined(self.killstreakicon[3])) {
                self.killstreakicon[3] hud::destroyelem();
            }
            if (isdefined(self.killstreakicon[4])) {
                self.killstreakicon[4] hud::destroyelem();
            }
        }
        if (isdefined(self.lowermessage)) {
            self.lowermessage hud::destroyelem();
        }
        if (isdefined(self.lowertimer)) {
            self.lowertimer hud::destroyelem();
        }
        if (isdefined(self.proxbar)) {
            self.proxbar hud::destroyelem();
        }
        if (isdefined(self.proxbartext)) {
            self.proxbartext hud::destroyelem();
        }
        if (isdefined(self.carryicon)) {
            self.carryicon hud::destroyelem();
        }
    }

#/

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x0
// Checksum 0x691a2637, Offset: 0x480
// Size: 0xb2
function teamplayercountsequal(playercounts) {
    count = undefined;
    foreach (team, _ in level.teams) {
        if (!isdefined(count)) {
            count = playercounts[team];
            continue;
        }
        if (count != playercounts[team]) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_ui/globallogic_ui
// Params 2, eflags: 0x0
// Checksum 0xb0bda484, Offset: 0x540
// Size: 0xc0
function teamwithlowestplayercount(playercounts, ignore_team) {
    count = 9999;
    lowest_team = undefined;
    foreach (team, _ in level.teams) {
        if (count > playercounts[team]) {
            count = playercounts[team];
            lowest_team = team;
        }
    }
    return lowest_team;
}

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x1 linked
// Checksum 0x948ab1b2, Offset: 0x608
// Size: 0x574
function menuautoassign(comingfrommenu) {
    teamkeys = getarraykeys(level.teams);
    assignment = teamkeys[randomint(teamkeys.size)];
    self closemenus();
    if (isdefined(level.forceallallies) && level.forceallallies) {
        assignment = #"allies";
    } else if (level.teambased) {
        if (getdvarint(#"party_autoteams", 0) == 1) {
            if (level.allow_teamchange && (self.hasspawned || comingfrommenu)) {
                assignment = "";
            } else {
                team = getassignedteam(self);
                switch (team) {
                case 1:
                    assignment = teamkeys[1];
                    break;
                case 2:
                    assignment = teamkeys[0];
                    break;
                case 3:
                    assignment = teamkeys[2];
                    break;
                case 4:
                    if (!isdefined(level.forceautoassign) || !level.forceautoassign) {
                        return;
                    }
                default:
                    assignment = "";
                    if (isdefined(level.teams[team])) {
                        assignment = team;
                    } else if (team == "spectator" && !level.forceautoassign) {
                        return;
                    }
                    break;
                }
            }
        }
        if (assignment == "" || getdvarint(#"party_autoteams", 0) == 0) {
            assignment = #"allies";
        }
        if (assignment == self.pers[#"team"] && (self.sessionstate == "playing" || self.sessionstate == "dead")) {
            self beginclasschoice();
            return;
        }
    } else if (getdvarint(#"party_autoteams", 0) == 1) {
        if (!level.allow_teamchange || !self.hasspawned && !comingfrommenu) {
            team = getassignedteam(self);
            if (isdefined(level.teams[team])) {
                assignment = team;
            } else if (team == "spectator" && !level.forceautoassign) {
                return;
            }
        }
    }
    if (isdefined(self.botteam) && self.botteam != "autoassign") {
        assignment = self.botteam;
    }
    if (assignment != self.pers[#"team"] && (self.sessionstate == "playing" || self.sessionstate == "dead")) {
        self.switching_teams = 1;
        self.joining_team = assignment;
        self.leaving_team = self.pers[#"team"];
        self suicide();
    }
    self.pers[#"team"] = assignment;
    self.team = assignment;
    self.pers[#"class"] = undefined;
    self.curclass = undefined;
    self.pers[#"weapon"] = undefined;
    self.pers[#"savedmodel"] = undefined;
    self updateobjectivetext();
    self.sessionteam = assignment;
    if (!isalive(self)) {
        self.statusicon = "hud_status_dead";
    }
    self player::function_466d8a4b(comingfrommenu);
    self notify(#"end_respawn");
    self beginclasschoice();
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0xe43aee19, Offset: 0xb88
// Size: 0xbc
function teamscoresequal() {
    score = undefined;
    foreach (team, _ in level.teams) {
        if (!isdefined(score)) {
            score = getteamscore(team);
            continue;
        }
        if (score != getteamscore(team)) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0x41db77a5, Offset: 0xc50
// Size: 0xae
function teamwithlowestscore() {
    score = 99999999;
    lowest_team = undefined;
    foreach (team, _ in level.teams) {
        if (score > getteamscore(team)) {
            lowest_team = team;
        }
    }
    return lowest_team;
}

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x0
// Checksum 0x628eae2f, Offset: 0xd08
// Size: 0x7a
function pickteamfromscores(teams) {
    assignment = #"allies";
    if (teamscoresequal()) {
        assignment = teams[randomint(teams.size)];
    } else {
        assignment = teamwithlowestscore();
    }
    return assignment;
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x0
// Checksum 0xa4034c58, Offset: 0xd90
// Size: 0xca
function getsplitscreenteam() {
    for (index = 0; index < level.players.size; index++) {
        if (!isdefined(level.players[index])) {
            continue;
        }
        if (level.players[index] == self) {
            continue;
        }
        if (!self isplayeronsamemachine(level.players[index])) {
            continue;
        }
        team = level.players[index].sessionteam;
        if (team != "spectator") {
            return team;
        }
    }
    return "";
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0x7c092e3f, Offset: 0xe68
// Size: 0x24
function updateobjectivetext() {
    self setclientcgobjectivetext("");
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0x6c75f1fd, Offset: 0xe98
// Size: 0x1c
function closemenus() {
    self closeingamemenu();
}

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x1 linked
// Checksum 0xa658585d, Offset: 0xec0
// Size: 0x144
function beginclasschoice(forcenewchoice) {
    assert(isdefined(level.teams[self.pers[#"team"]]));
    team = self.pers[#"team"];
    if (level.disablecac == 1) {
        self.pers[#"class"] = level.defaultclass;
        self.curclass = level.defaultclass;
        if (self.sessionstate != "playing" && game.state == "playing") {
            self thread [[ level.spawnclient ]]();
        }
        self thread spectating::setspectatepermissionsformachine();
        return;
    }
    self openmenu(game.menu["menu_changeclass_" + level.teams[team]]);
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x0
// Checksum 0x6cb26a6f, Offset: 0x1010
// Size: 0x9c
function showmainmenuforteam() {
    assert(isdefined(level.teams[self.pers[#"team"]]));
    team = self.pers[#"team"];
    self openmenu(game.menu["menu_changeclass_" + level.teams[team]]);
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0x18598400, Offset: 0x10b8
// Size: 0x54
function menuautocontrolplayer() {
    self closemenus();
    if (self.pers[#"team"] != "spectator") {
        toggleplayercontrol(self);
    }
}

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x1 linked
// Checksum 0xcba5e22d, Offset: 0x1118
// Size: 0x204
function menuteam(team) {
    self closemenus();
    if (!level.console && !level.allow_teamchange && isdefined(self.hasdonecombat) && self.hasdonecombat) {
        return;
    }
    if (self.pers[#"team"] != team) {
        if (level.ingraceperiod && (!isdefined(self.hasdonecombat) || !self.hasdonecombat)) {
            self.hasspawned = 0;
        }
        if (self.sessionstate == "playing") {
            self.switching_teams = 1;
            self.joining_team = team;
            self.leaving_team = self.pers[#"team"];
            self suicide();
        }
        self.pers[#"team"] = team;
        self.team = team;
        self.pers[#"class"] = undefined;
        self.curclass = undefined;
        self.pers[#"weapon"] = undefined;
        self.pers[#"savedmodel"] = undefined;
        self updateobjectivetext();
        self.sessionteam = team;
        self player::function_466d8a4b(1);
        self notify(#"end_respawn");
    }
    self beginclasschoice();
}

// Namespace globallogic_ui/globallogic_ui
// Params 0, eflags: 0x1 linked
// Checksum 0xa8b178b1, Offset: 0x1328
// Size: 0x18e
function menuspectator() {
    self closemenus();
    if (self.pers[#"team"] != "spectator") {
        if (isalive(self)) {
            self.switching_teams = 1;
            self.joining_team = "spectator";
            self.leaving_team = self.pers[#"team"];
            self suicide();
        }
        self.pers[#"team"] = "spectator";
        self.team = "spectator";
        self.pers[#"class"] = undefined;
        self.curclass = undefined;
        self.pers[#"weapon"] = undefined;
        self.pers[#"savedmodel"] = undefined;
        self updateobjectivetext();
        self.sessionteam = "spectator";
        [[ level.spawnspectator ]]();
        self thread globallogic_player::spectate_player_watcher();
        self notify(#"joined_spectators");
    }
}

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x1 linked
// Checksum 0xdb1dbc6a, Offset: 0x14c0
// Size: 0x24
function menuclass(response) {
    self closemenus();
}

// Namespace globallogic_ui/globallogic_ui
// Params 1, eflags: 0x0
// Checksum 0x284cba01, Offset: 0x14f0
// Size: 0x54
function removespawnmessageshortly(delay) {
    self endon(#"disconnect");
    waittillframeend();
    self endon(#"end_respawn");
    wait(delay);
    self hud_message::clearlowermessage();
}

