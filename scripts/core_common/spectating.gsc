#using scripts\core_common\callbacks_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\system_shared;

#namespace spectating;

// Namespace spectating/spectating
// Params 0, eflags: 0x2
// Checksum 0x61e01d0e, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"spectating", &__init__, undefined, undefined);
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xfd8dba83, Offset: 0xf8
// Size: 0xa4
function __init__() {
    callback::on_start_gametype(&init);
    callback::on_spawned(&set_permissions);
    callback::on_joined_team(&set_permissions_for_machine);
    callback::on_joined_spectate(&set_permissions_for_machine);
    callback::on_player_killed_with_params(&on_player_killed);
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xae94b03, Offset: 0x1a8
// Size: 0x8a
function init() {
    foreach (team, _ in level.teams) {
        level.spectateoverride[team] = spawnstruct();
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xb4d83c32, Offset: 0x240
// Size: 0x90
function update_settings() {
    level endon(#"game_ended");
    foreach (player in level.players) {
        player set_permissions();
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xde9052a7, Offset: 0x2d8
// Size: 0xce
function get_splitscreen_team() {
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
        if (team != #"spectator") {
            return team;
        }
    }
    return self.sessionteam;
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x85705c3d, Offset: 0x3b0
// Size: 0xb8
function other_local_player_still_alive() {
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
            return true;
        }
    }
    return false;
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0xea1dce04, Offset: 0x470
// Size: 0x56c
function set_permissions() {
    team = self.sessionteam;
    if (team == #"spectator") {
        if (self issplitscreen() && !level.splitscreen) {
            team = get_splitscreen_team();
        }
        if (team == #"spectator") {
            self.spectatorteam = #"invalid";
            self allowspectateallteams(1);
            self allowspectateteam("freelook", 0);
            self allowspectateteam(#"none", 1);
            self allowspectateteam("localplayers", 1);
            return;
        }
    }
    self allowspectateallteams(0);
    self allowspectateteam("localplayers", 1);
    self allowspectateteam("freelook", 0);
    switch (level.spectatetype) {
    case 0:
        self.spectatorteam = #"invalid";
        self allowspectateteam(#"none", 1);
        self allowspectateteam("localplayers", 0);
        break;
    case 3:
        self.spectatorteam = #"invalid";
        if (self issplitscreen() && self other_local_player_still_alive()) {
            self allowspectateteam(#"none", 0);
            break;
        }
    case 1:
        self.spectatorteam = #"invalid";
        if (!level.teambased) {
            self allowspectateallteams(1);
            self allowspectateteam(#"none", 1);
        } else if (isdefined(team) && isdefined(level.teams[team])) {
            self allowspectateteam(team, 1);
            self allowspectateteam(#"none", 0);
        } else {
            self allowspectateteam(#"none", 0);
        }
        break;
    case 2:
        self.spectatorteam = #"invalid";
        self allowspectateteam(#"none", 1);
        self allowspectateallteams(1);
        foreach (team in level.teams) {
            if (self.team == team) {
                continue;
            }
            self allowspectateteam(team, 1);
        }
        break;
    case 4:
        return;
    }
    if (isdefined(team) && isdefined(level.teams[team])) {
        if (isdefined(level.spectateoverride[team].allowfreespectate)) {
            self allowspectateteam("freelook", 1);
        }
        if (isdefined(level.spectateoverride[team].allowenemyspectate)) {
            if (level.spectateoverride[team].allowenemyspectate == #"all") {
                self allowspectateallteams(1);
                return;
            }
            self allowspectateallteams(0);
            self allowspectateteam(level.spectateoverride[team].allowenemyspectate, 1);
        }
    }
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0xb29741b, Offset: 0x9e8
// Size: 0x1ee
function function_4c37bb21(var_2b7584f0) {
    var_156b3879 = self function_b7c8d984(undefined, 0);
    if (isdefined(var_156b3879) && isplayer(var_156b3879)) {
        self.spectatorteam = var_156b3879.team;
        if (var_2b7584f0) {
            self setcurrentspectatorclient(var_156b3879);
        }
        return;
    }
    spectator_team = undefined;
    players = getplayers(self.team);
    foreach (player in players) {
        if (player == self) {
            continue;
        }
        if (player.spectatorteam != #"invalid") {
            spectator_team = player.spectatorteam;
            break;
        }
    }
    if (!isdefined(spectator_team)) {
        foreach (team, count in level.alivecount) {
            if (count > 0) {
                self.spectatorteam = team;
                break;
            }
        }
    }
    if (isdefined(spectator_team)) {
        self.spectatorteam = spectator_team;
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x9f570be0, Offset: 0xbe0
// Size: 0x15e
function set_permissions_for_machine() {
    if (level.spectatetype == 4 && self.spectatorteam != #"invalid") {
        var_c37023cb = 1;
        if (sessionmodeismultiplayergame()) {
            if (self.sessionstate === "playing") {
                var_c37023cb = 0;
            }
        }
        function_4c37bb21(var_c37023cb);
    }
    self set_permissions();
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
        level.players[index] set_permissions();
    }
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x49aad242, Offset: 0xd48
// Size: 0x6a
function function_7d15f599() {
    livesleft = !(level.numlives && !self.pers[#"lives"]);
    if (!level.alivecount[self.team] && !livesleft) {
        return false;
    }
    return true;
}

// Namespace spectating/spectating
// Params 0, eflags: 0x0
// Checksum 0xa03e551b, Offset: 0xdc0
// Size: 0x3c
function function_23c5f4f2() {
    self endon(#"disconnect");
    waitframe(1);
    function_493d2e03(#"all");
}

// Namespace spectating/spectating
// Params 1, eflags: 0x5 linked
// Checksum 0x4947f2e0, Offset: 0xe08
// Size: 0x5c
function private function_493d2e03(team) {
    if (!self function_7d15f599()) {
        level.spectateoverride[self.team].allowenemyspectate = team;
        update_settings();
    }
}

// Namespace spectating/spectating
// Params 1, eflags: 0x0
// Checksum 0x95bf10dd, Offset: 0xe70
// Size: 0xa8
function function_34460764(team) {
    players = getplayers(team);
    foreach (player in players) {
        player allowspectateallteams(1);
    }
}

// Namespace spectating/spectating
// Params 2, eflags: 0x0
// Checksum 0xcef69866, Offset: 0xf20
// Size: 0xd8
function function_ef775048(team, var_6f1b46b8) {
    self endon(#"disconnect");
    waitframe(1);
    if (level.alivecount[team]) {
        return;
    }
    players = getplayers(team);
    foreach (player in players) {
        player function_493d2e03(var_6f1b46b8);
    }
}

// Namespace spectating/spectating
// Params 2, eflags: 0x1 linked
// Checksum 0x62e77089, Offset: 0x1000
// Size: 0xde
function function_18b8b7e4(players, origin) {
    sorted_players = arraysort(players, origin);
    foreach (player in sorted_players) {
        if (player == self) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (player laststand::player_is_in_laststand()) {
            continue;
        }
        return player;
    }
    return undefined;
}

// Namespace spectating/spectating
// Params 0, eflags: 0x1 linked
// Checksum 0x864e8e29, Offset: 0x10e8
// Size: 0xc2
function function_7ad5ad8() {
    if (self.team == #"spectator") {
        return undefined;
    }
    assert(isdefined(level.aliveplayers[self.team]));
    teammates = level.aliveplayers[self.team];
    player = function_18b8b7e4(teammates, self.origin);
    if (!isdefined(player) && isdefined(level.var_df67ea13)) {
        player = self [[ level.var_df67ea13 ]]();
    }
    return player;
}

// Namespace spectating/spectating
// Params 2, eflags: 0x1 linked
// Checksum 0x54891b3e, Offset: 0x11b8
// Size: 0xb2
function function_b7c8d984(attacker, var_1178af52) {
    if (!isdefined(self) || !isdefined(self.team)) {
        return undefined;
    }
    teammate = function_7ad5ad8();
    spectate_player = undefined;
    if (var_1178af52 && attacker.team == self.team) {
        spectate_player = attacker;
    } else if (isdefined(teammate)) {
        spectate_player = teammate;
    } else if (var_1178af52) {
        spectate_player = attacker;
    }
    return spectate_player;
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0x2da0cbf0, Offset: 0x1278
// Size: 0x5e
function follow_chain(var_41349818) {
    if (!isdefined(var_41349818)) {
        return;
    }
    while (isdefined(var_41349818) && var_41349818.spectatorclient != -1) {
        var_41349818 = getentbynum(var_41349818.spectatorclient);
    }
    return var_41349818;
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0xde811140, Offset: 0x12e0
// Size: 0x16e
function function_2b728d67(attacker) {
    if (level.spectatetype != 4) {
        return;
    }
    var_8447710e = player::figure_out_attacker(attacker);
    var_6407d695 = isdefined(var_8447710e) && isplayer(var_8447710e) && var_8447710e != self && isalive(var_8447710e);
    var_156b3879 = self function_b7c8d984(var_8447710e, var_6407d695);
    if (!isdefined(var_156b3879)) {
        var_156b3879 = self function_18b8b7e4(level.activeplayers, self.origin);
    }
    var_156b3879 = follow_chain(var_156b3879);
    if (isdefined(var_156b3879) && isplayer(var_156b3879)) {
        self.spectatorclient = -1;
        self.spectatorteam = var_156b3879.team;
        self setcurrentspectatorclient(var_156b3879);
        return;
    }
    self.spectatorteam = self.team;
}

// Namespace spectating/spectating
// Params 1, eflags: 0x1 linked
// Checksum 0xf8802c1, Offset: 0x1458
// Size: 0x3c
function on_player_killed(params) {
    if (level.spectatetype == 4) {
        self thread function_2b728d67(params.eattacker);
    }
}

