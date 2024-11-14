#using scripts\mp_common\gametypes\overtime;
#using scripts\mp_common\gametypes\outcome;

#namespace round;

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x713e5fe4, Offset: 0x78
// Size: 0x5e
function function_37f04b09() {
    outcome = outcome::function_a1a81955();
    game.outcome.var_3c5fdf73[game.outcome.var_3c5fdf73.size] = outcome;
    game.outcome.var_aefc8b8d = outcome;
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x9174c357, Offset: 0xe0
// Size: 0x16
function function_f37f02fc() {
    return game.outcome.var_aefc8b8d;
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x3d601cff, Offset: 0x100
// Size: 0x212
function round_stats_init() {
    if (!isdefined(game.roundsplayed)) {
        game.roundsplayed = 0;
    }
    setroundsplayed(game.roundsplayed + overtime::get_rounds_played());
    overtime::round_stats_init();
    if (!isdefined(game.roundwinner)) {
        game.roundwinner = [];
    }
    if (!isdefined(game.lastroundscore)) {
        game.lastroundscore = [];
    }
    if (!isdefined(game.stat[#"roundswon"])) {
        game.stat[#"roundswon"] = [];
    }
    if (!isdefined(game.stat[#"roundswon"][#"tie"])) {
        game.stat[#"roundswon"][#"tie"] = 0;
    }
    foreach (team, _ in level.teams) {
        if (!isdefined(game.stat[#"roundswon"][team])) {
            game.stat[#"roundswon"][team] = 0;
        }
        level.teamspawnpoints[team] = [];
        level.spawn_point_team_class_names[team] = [];
    }
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0x678ab895, Offset: 0x320
// Size: 0x34
function set_flag(flag) {
    outcome::set_flag(game.outcome.var_aefc8b8d, flag);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0x77a4974a, Offset: 0x360
// Size: 0x32
function get_flag(flag) {
    return outcome::get_flag(game.outcome.var_aefc8b8d, flag);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0x11384e49, Offset: 0x3a0
// Size: 0x32
function clear_flag(flag) {
    return outcome::clear_flag(game.outcome.var_aefc8b8d, flag);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0x52aab565, Offset: 0x3e0
// Size: 0x34
function function_897438f4(var_c1e98979) {
    outcome::function_897438f4(game.outcome.var_aefc8b8d, var_c1e98979);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x1c5c6369, Offset: 0x420
// Size: 0x22
function function_3624d032() {
    return outcome::function_3624d032(game.outcome.var_aefc8b8d);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x1851e7e2, Offset: 0x450
// Size: 0x22
function get_winning_team() {
    return outcome::get_winning_team(game.outcome.var_aefc8b8d);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0xc5bf3ec4, Offset: 0x480
// Size: 0x22
function function_b5f4c9d8() {
    return outcome::function_b5f4c9d8(game.outcome.var_aefc8b8d);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x6a88045f, Offset: 0x4b0
// Size: 0x22
function get_winner() {
    return outcome::get_winner(game.outcome.var_aefc8b8d);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0xf97e709e, Offset: 0x4e0
// Size: 0x32
function is_winner(team_or_player) {
    return outcome::is_winner(game.outcome.var_aefc8b8d, team_or_player);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0x907f95d6, Offset: 0x520
// Size: 0x34
function set_winner(team_or_player) {
    outcome::set_winner(game.outcome.var_aefc8b8d, team_or_player);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0xd9016928, Offset: 0x560
// Size: 0x5c
function function_35702443(platoon) {
    assert(isdefined(level.platoons[platoon]));
    outcome::function_35702443(game.outcome.var_aefc8b8d, platoon);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x4efb076, Offset: 0x5c8
// Size: 0x22
function function_d30d1a2e() {
    return outcome::function_d30d1a2e(game.outcome.var_aefc8b8d);
}

// Namespace round/round
// Params 1, eflags: 0x0
// Checksum 0x2e28d93, Offset: 0x5f8
// Size: 0x34
function function_af2e264f(winner) {
    outcome::function_af2e264f(game.outcome.var_aefc8b8d, winner);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0xbc54af33, Offset: 0x638
// Size: 0x24
function function_870759fb() {
    outcome::function_870759fb(game.outcome.var_aefc8b8d);
}

// Namespace round/round
// Params 0, eflags: 0x0
// Checksum 0x2dddb871, Offset: 0x668
// Size: 0x1c
function is_overtime_round() {
    if (game.overtime_round > 0) {
        return true;
    }
    return false;
}

