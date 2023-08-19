// Atian COD Tools GSC decompiler test
#include scripts/mp_common/teams/teams.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/platoons.gsc;
#include scripts/core_common/infection.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace platoons;

// Namespace platoons/platoons
// Params 0, eflags: 0x2
// Checksum 0x4e37c83c, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"mp_platoons", &__init__, undefined, undefined);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0x32721095, Offset: 0xf0
// Size: 0x24
function __init__() {
    callback::on_start_gametype(&on_start_gametype);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x5 linked
// Checksum 0x59549cfe, Offset: 0x120
// Size: 0x34
function private on_start_gametype() {
    level callback::add_callback(#"hash_d8880c680eac47a", &function_a929f627);
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0xc50ce9a1, Offset: 0x160
// Size: 0x36c
function update_status() {
    if (!function_382a49e0()) {
        return;
    }
    if (infection::function_74650d7()) {
        return;
    }
    params = {#var_42c20e77:[], #var_1ab40902:[]};
    foreach (var_b6173883, platoon in level.platoons) {
        if (platoon.var_9dd75dad == 0) {
            continue;
        }
        if (platoon.eliminated > 0) {
            continue;
        }
        platoon_teams = function_37d3bfcb(var_b6173883);
        var_87a87094 = [];
        foreach (team in platoon_teams) {
            if (teams::function_9dd75dad(team) && level.teameliminated[team] == 0) {
                if (!isdefined(var_87a87094)) {
                    var_87a87094 = [];
                } else if (!isarray(var_87a87094)) {
                    var_87a87094 = array(var_87a87094);
                }
                var_87a87094[var_87a87094.size] = team;
            }
        }
        if (var_87a87094.size == 0) {
            platoon.eliminated = gettime();
            if (!isdefined(params.var_42c20e77)) {
                params.var_42c20e77 = [];
            } else if (!isarray(params.var_42c20e77)) {
                params.var_42c20e77 = array(params.var_42c20e77);
            }
            params.var_42c20e77[params.var_42c20e77.size] = var_b6173883;
        } else {
            if (!isdefined(params.var_1ab40902)) {
                params.var_1ab40902 = [];
            } else if (!isarray(params.var_1ab40902)) {
                params.var_1ab40902 = array(params.var_1ab40902);
            }
            params.var_1ab40902[params.var_1ab40902.size] = var_b6173883;
        }
    }
    if (params.var_42c20e77.size > 0) {
        level callback::callback(#"hash_d8880c680eac47a", params);
    }
}

// Namespace platoons/platoons
// Params 1, eflags: 0x1 linked
// Checksum 0x82b6b1c5, Offset: 0x4d8
// Size: 0xac
function function_a929f627(params) {
    if (params.var_1ab40902.size == 0) {
        round::set_flag("tie");
        thread globallogic::end_round(6);
    } else if (params.var_1ab40902.size == 1) {
        round::function_35702443(params.var_1ab40902[0]);
        thread globallogic::end_round(6);
    }
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0x888f0581, Offset: 0x590
// Size: 0x94
function function_cea75f29() {
    count = 0;
    foreach (platoon, _ in level.platoons) {
        if (!is_all_dead(platoon)) {
            count++;
        }
    }
    return count;
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0x3cf6ad04, Offset: 0x630
// Size: 0x148
function count_players() {
    player_counts = [];
    foreach (platoon, _ in level.platoons) {
        player_counts[platoon] = 0;
    }
    var_6a39bbbd = self teams::count_players();
    foreach (team, _ in var_6a39bbbd) {
        platoon = getteamplatoon(team);
        if (!isdefined(level.platoons[platoon])) {
            continue;
        }
        player_counts[platoon] = player_counts[platoon] + var_6a39bbbd[team];
    }
    return player_counts;
}

// Namespace platoons/platoons
// Params 0, eflags: 0x5 linked
// Checksum 0x658dcf26, Offset: 0x780
// Size: 0xd4
function private function_ef7959f0() {
    playercounts = self count_players();
    count = 9999;
    var_c15f9be2 = undefined;
    foreach (platoon, _ in level.platoons) {
        if (count > playercounts[platoon]) {
            count = playercounts[platoon];
            var_c15f9be2 = platoon;
        }
    }
    return var_c15f9be2;
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0x273db2c1, Offset: 0x860
// Size: 0xea
function function_77ad4730() {
    assignment = function_ef7959f0();
    /#
        var_655b66e0 = getdvarstring(#"scr_playerplatoons", "<unknown string>");
        playerplatoons = strtok(var_655b66e0, "<unknown string>");
        if (playerplatoons.size > 0) {
            playerplatoon = playerplatoons[self getentitynumber()];
            if (isdefined(playerplatoon) && isdefined(level.platoons[playerplatoon])) {
                assignment = hash(playerplatoon);
            }
        }
    #/
    return assignment;
}

// Namespace platoons/platoons
// Params 0, eflags: 0x1 linked
// Checksum 0xdf66d0e, Offset: 0x958
// Size: 0xdc
function function_4b016b57() {
    if (!function_382a49e0() || level.platoon.assignment != 1) {
        return;
    }
    team = self.pers[#"team"];
    platoon = getteamplatoon(team);
    if (platoon != #"invalid" && platoon != #"none") {
        return;
    }
    assignment = function_77ad4730();
    function_334c4bec(team, assignment);
}

// Namespace platoons/platoons
// Params 1, eflags: 0x1 linked
// Checksum 0x7409c319, Offset: 0xa40
// Size: 0x18c
function function_a214d798(platoon) {
    players = [];
    if (platoon == #"none" || platoon == #"invalid") {
        return players;
    }
    teams = function_37d3bfcb(platoon);
    foreach (team in teams) {
        foreach (player in level.aliveplayers[team]) {
            if (!isdefined(players)) {
                players = [];
            } else if (!isarray(players)) {
                players = array(players);
            }
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace platoons/platoons
// Params 1, eflags: 0x1 linked
// Checksum 0x1f73da3b, Offset: 0xbd8
// Size: 0xaa
function is_all_dead(platoon) {
    teams = function_37d3bfcb(platoon);
    foreach (team in teams) {
        if (!teams::is_all_dead(team)) {
            return 0;
        }
    }
    return 1;
}

