#using scripts\core_common\flagsys_shared;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_score;

#namespace outcome;

// Namespace outcome/outcome
// Params 0, eflags: 0x2
// Checksum 0xc927b62d, Offset: 0xa0
// Size: 0x9a
function autoexec main() {
    level.var_9b671c3c[#"tie"] = {#flag:"tie", #code_flag:1};
    level.var_9b671c3c[#"overtime"] = {#flag:"overtime", #code_flag:2};
}

// Namespace outcome/outcome
// Params 0, eflags: 0x0
// Checksum 0x51553bae, Offset: 0x148
// Size: 0xfa
function function_a1a81955() {
    outcome = spawnstruct();
    outcome.flags = 0;
    outcome.var_c1e98979 = 0;
    outcome.team = #"free";
    foreach (team, _ in level.teams) {
        outcome.team_score[team] = 0;
    }
    outcome.platoon = #"none";
    outcome.players = [];
    outcome.players_score = [];
    return outcome;
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0x1391bbce, Offset: 0x250
// Size: 0xda
function is_winner(outcome, team_or_player) {
    if (isplayer(team_or_player)) {
        if (isdefined(outcome.players) && outcome.players.size && outcome.players[0] == team_or_player) {
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

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0x90555bfa, Offset: 0x338
// Size: 0x2c
function set_flag(outcome, flag) {
    outcome flagsys::set(flag);
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0xda160e79, Offset: 0x370
// Size: 0x2a
function get_flag(outcome, flag) {
    return outcome flagsys::get(flag);
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0x5457b92b, Offset: 0x3a8
// Size: 0x2a
function clear_flag(outcome, flag) {
    return outcome flagsys::clear(flag);
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0x95d947de, Offset: 0x3e0
// Size: 0xb4
function function_2e00fa44(outcome) {
    flags = 0;
    foreach (flag_type in level.var_9b671c3c) {
        if (outcome flagsys::get(flag_type.flag)) {
            flags |= flag_type.code_flag;
        }
    }
    return flags;
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0xaa8108ad, Offset: 0x4a0
// Size: 0x22
function function_897438f4(outcome, var_c1e98979) {
    outcome.var_c1e98979 = var_c1e98979;
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0x3de4e931, Offset: 0x4d0
// Size: 0x16
function function_3624d032(outcome) {
    return outcome.var_c1e98979;
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0x1689d40a, Offset: 0x4f0
// Size: 0x5a
function get_winning_team(outcome) {
    if (isdefined(outcome.team)) {
        return outcome.team;
    }
    if (outcome.players.size) {
        return outcome.players[0].team;
    }
    return #"free";
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0x4a0f43ed, Offset: 0x558
// Size: 0x30
function function_b5f4c9d8(outcome) {
    if (outcome.players.size) {
        return outcome.players[0];
    }
    return undefined;
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0xc3977a02, Offset: 0x590
// Size: 0x4c
function get_winner(outcome) {
    if (isdefined(outcome.team)) {
        return outcome.team;
    }
    if (outcome.players.size) {
        return outcome.players[0];
    }
    return undefined;
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0x2c5f1c5c, Offset: 0x5e8
// Size: 0x16
function function_d30d1a2e(outcome) {
    return outcome.platoon;
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0x357c5877, Offset: 0x608
// Size: 0x82
function set_winner(outcome, team_or_player) {
    if (!isdefined(team_or_player)) {
        return;
    }
    if (isplayer(team_or_player)) {
        outcome.players[outcome.players.size] = team_or_player;
        outcome.team = team_or_player.team;
        return;
    }
    outcome.team = team_or_player;
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0xc3015c6e, Offset: 0x698
// Size: 0x2e
function function_35702443(outcome, platoon) {
    if (!isdefined(platoon)) {
        return;
    }
    outcome.platoon = platoon;
}

// Namespace outcome/outcome
// Params 2, eflags: 0x0
// Checksum 0xfb4d15dc, Offset: 0x6d0
// Size: 0x54
function function_af2e264f(outcome, winner) {
    if (isdefined(winner)) {
        set_winner(outcome, winner);
        return;
    }
    set_flag(outcome, "tie");
}

// Namespace outcome/outcome
// Params 0, eflags: 0x0
// Checksum 0xd21c0486, Offset: 0x730
// Size: 0x52
function function_6d0354e3() {
    if (level.teambased) {
        winner = globallogic::determineteamwinnerbygamestat("teamScores");
    } else {
        winner = globallogic_score::gethighestscoringplayer();
    }
    return winner;
}

// Namespace outcome/outcome
// Params 1, eflags: 0x0
// Checksum 0x3dcdb9ed, Offset: 0x790
// Size: 0x3c
function function_870759fb(outcome) {
    winner = function_6d0354e3();
    function_af2e264f(outcome, winner);
}

