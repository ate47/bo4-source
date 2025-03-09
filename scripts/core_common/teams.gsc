#namespace teams;

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0x1b930823, Offset: 0x68
// Size: 0x14c
function function_dc7eaabd(assignment) {
    assert(isdefined(assignment));
    self.pers[#"team"] = assignment;
    self.team = assignment;
    self.sessionteam = assignment;
    if (isdefined(level.teams[assignment])) {
        status = self function_3d288f14();
        if (!isdefined(level.var_75dffa9f[assignment]) || status != level.var_75dffa9f[assignment] && status == #"game") {
            if (status == #"game") {
                level.var_75dffa9f[assignment] = #"game";
            } else {
                level.var_75dffa9f[assignment] = #"none";
            }
        }
    }
    /#
        self thread function_ba459d03(assignment);
    #/
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x3730f504, Offset: 0x1c0
// Size: 0x11a
function function_3d288f14() {
    /#
        if (isbot(self)) {
            if (isdefined(self.var_30e2c3ec)) {
                return self.var_30e2c3ec;
            }
            rand = randomintrange(0, 3);
            switch (rand) {
            case 0:
                self.var_30e2c3ec = #"none";
                break;
            case 1:
                self.var_30e2c3ec = #"game";
                break;
            case 2:
                self.var_30e2c3ec = #"system";
                break;
            }
            return self.var_30e2c3ec;
        }
    #/
    status = self voipstatus();
    return status;
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0x5827011, Offset: 0x2e8
// Size: 0x42
function is_team_empty(team) {
    team_players = getplayers(team);
    if (team_players.size > 0) {
        return false;
    }
    return true;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x166658c5, Offset: 0x338
// Size: 0xea
function function_959bac94() {
    foreach (team in level.teams) {
        if (self is_team_empty(team)) {
            println("<dev string:x38>" + "<dev string:x4c>" + self.name + "<dev string:x61>" + team);
            /#
                function_d28f6fa0(team);
            #/
            return team;
        }
    }
    return #"spectator";
}

/#

    // Namespace teams/teams
    // Params 1, eflags: 0x4
    // Checksum 0x788ca9a1, Offset: 0x430
    // Size: 0x134
    function private function_ba459d03(team) {
        if (isdefined(level.var_ba13fb7a) && level.var_ba13fb7a) {
            team_str = string(team);
            if (isdefined(level.teams[team])) {
                team_str = level.teams[team];
            }
            voip = "<dev string:x73>";
            if (isdefined(level.var_75dffa9f[team])) {
                voip += level.var_75dffa9f[team] == #"game" ? "<dev string:x7b>" : "<dev string:x82>";
            } else {
                voip += "<dev string:x8b>";
            }
            println("<dev string:x38>" + "<dev string:x97>" + self.name + "<dev string:x9c>" + team_str + "<dev string:xa1>" + voip);
        }
    }

    // Namespace teams/teams
    // Params 1, eflags: 0x0
    // Checksum 0x9c7cdf23, Offset: 0x570
    // Size: 0xd0
    function function_a9d594a0(party) {
        foreach (party_member in party.party_members) {
            var_2798314b = party_member getparty();
            if (var_2798314b.var_a15e4438 != party.var_a15e4438) {
                assertmsg("<dev string:xa5>");
            }
        }
    }

    // Namespace teams/teams
    // Params 1, eflags: 0x0
    // Checksum 0x53c776fa, Offset: 0x648
    // Size: 0xb0
    function function_d28f6fa0(team) {
        players = getplayers(team);
        foreach (player in players) {
            function_a9d594a0(player getparty());
        }
    }

#/
