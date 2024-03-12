// Atian COD Tools GSC decompiler test
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace spectating;

// Namespace spectating/spectating
// Params 0, eflags: 0x2
// Checksum 0x6c0475ac, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_spectating", &__init__, undefined, undefined);
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x2dcf9c03, Offset: 0xf8
// Size: 0x24
function __init__() {
    callback::on_start_gametype(&main);
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x62ef05af, Offset: 0x128
// Size: 0xac
function main() {
    foreach (team, _ in level.teams) {
        level.spectateoverride[team] = spawnstruct();
    }
    callback::on_connecting(&on_player_connecting);
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xc7d7e727, Offset: 0x1e0
// Size: 0x64
function on_player_connecting() {
    callback::on_joined_team(&on_joined_team);
    callback::on_spawned(&on_player_spawned);
    callback::on_joined_spectate(&on_joined_spectate);
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x854c6884, Offset: 0x250
// Size: 0x2c
function on_player_spawned() {
    self endon(#"disconnect");
    self setspectatepermissions();
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0xaf98a67, Offset: 0x288
// Size: 0x34
function on_joined_team(params) {
    self endon(#"disconnect");
    self setspectatepermissionsformachine();
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0x1230ccc9, Offset: 0x2c8
// Size: 0x34
function on_joined_spectate(params) {
    self endon(#"disconnect");
    self setspectatepermissionsformachine();
}

// Namespace spectating/spectating
// Params 0, eflags: 0x0
// Checksum 0x95dfc1f3, Offset: 0x308
// Size: 0x66
function updatespectatesettings() {
    level endon(#"game_ended");
    for (index = 0; index < level.players.size; index++) {
        level.players[index] setspectatepermissions();
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x6a0be8ce, Offset: 0x378
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
    return self.sessionteam;
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x278d5889, Offset: 0x450
// Size: 0xb8
function otherlocalplayerstillalive() {
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
        if (isalive(level.players[index])) {
            return 1;
        }
    }
    return 0;
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0xacdd95b1, Offset: 0x510
// Size: 0x88
function allowspectateallteams(allow) {
    foreach (team, _ in level.teams) {
        self allowspectateteam(team, allow);
    }
}

// Namespace spectating/spectating
// Params 2, eflags: 0x1 linked
// Checksum 0xcee31c25, Offset: 0x5a0
// Size: 0xa8
function allowspectateallteamsexceptteam(skip_team, allow) {
    foreach (team, _ in level.teams) {
        if (team == skip_team) {
            continue;
        }
        self allowspectateteam(team, allow);
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xf2cb8ab5, Offset: 0x650
// Size: 0x54c
function setspectatepermissions() {
    team = self.sessionteam;
    if (team == "spectator") {
        if (self issplitscreen() && !level.splitscreen) {
            team = getsplitscreenteam();
        }
        if (team == "spectator") {
            self allowspectateallteams(1);
            self allowspectateteam("freelook", 0);
            self allowspectateteam("none", 1);
            self allowspectateteam("localplayers", 1);
            return;
        }
    }
    spectatetype = level.spectatetype;
    switch (spectatetype) {
    case 0:
        self allowspectateallteams(0);
        self allowspectateteam("freelook", 0);
        self allowspectateteam("none", 1);
        self allowspectateteam("localplayers", 0);
        break;
    case 3:
        if (self issplitscreen() && self otherlocalplayerstillalive()) {
            self allowspectateallteams(0);
            self allowspectateteam("none", 0);
            self allowspectateteam("freelook", 0);
            self allowspectateteam("localplayers", 1);
            break;
        }
    case 1:
        if (!level.teambased) {
            self allowspectateallteams(1);
            self allowspectateteam("none", 1);
            self allowspectateteam("freelook", 0);
            self allowspectateteam("localplayers", 1);
        } else if (isdefined(team) && isdefined(level.teams[team])) {
            self allowspectateteam(team, 1);
            self allowspectateallteamsexceptteam(team, 0);
            self allowspectateteam("freelook", 0);
            self allowspectateteam("none", 0);
            self allowspectateteam("localplayers", 1);
        } else {
            self allowspectateallteams(0);
            self allowspectateteam("freelook", 0);
            self allowspectateteam("none", 0);
            self allowspectateteam("localplayers", 1);
        }
        break;
    case 2:
        self allowspectateallteams(1);
        self allowspectateteam("freelook", 1);
        self allowspectateteam("none", 1);
        self allowspectateteam("localplayers", 1);
        break;
    }
    if (isdefined(team) && isdefined(level.teams[team])) {
        if (isdefined(level.spectateoverride[team].allowfreespectate)) {
            self allowspectateteam("freelook", 1);
        }
        if (isdefined(level.spectateoverride[team].allowenemyspectate)) {
            self allowspectateallteamsexceptteam(team, 1);
        }
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xe106ddaf, Offset: 0xba8
// Size: 0xde
function setspectatepermissionsformachine() {
    self setspectatepermissions();
    if (!self issplitscreen()) {
        return;
    }
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
        level.players[index] setspectatepermissions();
    }
}

