#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\gametypes\overtime;
#using scripts\mp_common\gametypes\outcome;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\core_common\system_shared;

#namespace match;

// Namespace match/match
// Params 0, eflags: 0x2
// Checksum 0xac2250aa, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"match", &__init__, undefined, undefined);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x65a0a06d, Offset: 0x110
// Size: 0x14
function __init__() {
    function_94003d29();
}

// Namespace match/match
// Params 0, eflags: 0x4
// Checksum 0x805949b, Offset: 0x130
// Size: 0x42
function private function_37f04b09() {
    if (!isdefined(game.outcome)) {
        game.outcome = outcome::function_a1a81955();
        game.outcome.var_3c5fdf73 = [];
    }
}

// Namespace match/match
// Params 0, eflags: 0x4
// Checksum 0x275d83b5, Offset: 0x180
// Size: 0x4c
function private function_94003d29() {
    function_37f04b09();
    round::function_37f04b09();
    if (overtime::is_overtime_round()) {
        set_overtime();
    }
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x40e2c6f1, Offset: 0x1d8
// Size: 0xe
function function_f37f02fc() {
    return game.outcome;
}

// Namespace match/match
// Params 0, eflags: 0x4
// Checksum 0x2404ec13, Offset: 0x1f0
// Size: 0x2c
function private function_b6b94df8() {
    if (overtime::is_overtime_round()) {
        set_overtime();
    }
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x3163c761, Offset: 0x228
// Size: 0x34
function set_overtime() {
    round::set_flag("overtime");
    set_flag("overtime");
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0x1cf40c0a, Offset: 0x268
// Size: 0x2c
function set_flag(flag) {
    outcome::set_flag(game.outcome, flag);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0x9fba52b9, Offset: 0x2a0
// Size: 0x2a
function get_flag(flag) {
    return outcome::get_flag(game.outcome, flag);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0x74b29b9b, Offset: 0x2d8
// Size: 0x2a
function clear_flag(flag) {
    return outcome::clear_flag(game.outcome, flag);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0xfb6355e9, Offset: 0x310
// Size: 0x2c
function function_897438f4(var_c1e98979) {
    outcome::function_897438f4(game.outcome, var_c1e98979);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x93282f88, Offset: 0x348
// Size: 0x1a
function function_3624d032() {
    return outcome::function_3624d032(game.outcome);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0xa33dddfe, Offset: 0x370
// Size: 0x64
function function_c10174e7() {
    if (isdefined(game.outcome.team) && isdefined(level.teams[game.outcome.team])) {
        return true;
    }
    if (game.outcome.players.size) {
        return true;
    }
    return false;
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x1ad56f2e, Offset: 0x3e0
// Size: 0x1a
function get_winning_team() {
    return outcome::get_winning_team(game.outcome);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0x99f509c5, Offset: 0x408
// Size: 0x4a
function is_winning_team(team) {
    if (isdefined(game.outcome.team) && team == game.outcome.team) {
        return true;
    }
    return false;
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0xadb23937, Offset: 0x460
// Size: 0x11e
function function_a2b53e17(player) {
    if (game.outcome.platoon !== #"none" && getteamplatoon(player.pers[#"team"]) === game.outcome.platoon) {
        return true;
    }
    if (game.outcome.team !== #"free" && player.pers[#"team"] === game.outcome.team) {
        return true;
    }
    if (game.outcome.players.size) {
        if (player == game.outcome.players[0]) {
            return true;
        }
    }
    return false;
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x1709a958, Offset: 0x588
// Size: 0x24
function function_75f97ac7() {
    if (game.outcome.players.size) {
        return true;
    }
    return false;
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x86df0dd8, Offset: 0x5b8
// Size: 0x46
function function_517c0ce0() {
    if (game.outcome.players.size) {
        return game.outcome.players[0] ishost();
    }
    return 0;
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x5d61177b, Offset: 0x608
// Size: 0x1a
function function_b5f4c9d8() {
    return outcome::function_b5f4c9d8(game.outcome);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x2320205a, Offset: 0x630
// Size: 0x52
function get_winner() {
    if (isdefined(level.teambased) && level.teambased) {
        return outcome::get_winning_team(game.outcome);
    }
    return outcome::function_b5f4c9d8(game.outcome);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0xd1b4fe22, Offset: 0x690
// Size: 0x2c
function set_winner(team_or_player) {
    outcome::set_winner(game.outcome, team_or_player);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0x321224b0, Offset: 0x6c8
// Size: 0x2c
function function_af2e264f(winner) {
    outcome::function_af2e264f(game.outcome, winner);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0xcc928e45, Offset: 0x700
// Size: 0x3c
function function_870759fb() {
    winner = function_6d0354e3();
    outcome::function_af2e264f(game.outcome, winner);
}

// Namespace match/match
// Params 1, eflags: 0x0
// Checksum 0xbd9c1a11, Offset: 0x748
// Size: 0x2c
function function_35702443(platoon) {
    outcome::function_35702443(game.outcome, platoon);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0xd9b9a02e, Offset: 0x780
// Size: 0x1a
function function_d30d1a2e() {
    return outcome::function_d30d1a2e(game.outcome);
}

// Namespace match/match
// Params 0, eflags: 0x0
// Checksum 0x64b3f478, Offset: 0x7a8
// Size: 0x10a
function function_6d0354e3() {
    winner = round::get_winner();
    if (game.outcome.var_aefc8b8d.var_c1e98979 != 7) {
        if (level.teambased && get_flag("overtime")) {
            if (!(isdefined(level.doubleovertime) && level.doubleovertime) || round::get_flag("tie")) {
                winner = globallogic::determineteamwinnerbygamestat("overtimeroundswon");
            }
        } else if (level.scoreroundwinbased) {
            winner = globallogic::determineteamwinnerbygamestat("roundswon");
        } else {
            winner = globallogic::determineteamwinnerbyteamscore();
        }
    }
    return winner;
}

