// Atian COD Tools GSC decompiler test
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/gamestate.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace arena;

// Namespace arena/arena
// Params 0, eflags: 0x2
// Checksum 0x87ecd8bc, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"arena", &__init__, undefined, undefined);
}

// Namespace arena/arena
// Params 0, eflags: 0x1 linked
// Checksum 0x409b928e, Offset: 0x100
// Size: 0x8e
function __init__() {
    callback::on_connect(&on_connect);
    callback::on_disconnect(&on_disconnect);
    if (gamemodeisarena()) {
        callback::on_game_playing(&on_game_playing);
        level.var_a962eeb6 = &function_51203700;
    }
}

// Namespace arena/arena
// Params 0, eflags: 0x1 linked
// Checksum 0x8a582088, Offset: 0x198
// Size: 0x13e
function on_connect() {
    if (isdefined(self.pers[#"arenainit"]) && self.pers[#"arenainit"] == 1) {
        return;
    }
    draftenabled = getgametypesetting(#"pregamedraftenabled") == 1;
    voteenabled = getgametypesetting(#"pregameitemvoteenabled") == 1;
    if (!draftenabled && !voteenabled) {
        self arenabeginmatch();
        if (function_945560bf() == 1) {
            self.pers[#"hash_1b5251cc167039c8"] = self function_a200171d();
        }
    }
    self.pers[#"arenainit"] = 1;
}

// Namespace arena/arena
// Params 1, eflags: 0x1 linked
// Checksum 0x4c2994d2, Offset: 0x2e0
// Size: 0x1b4
function function_b856a952(team) {
    if (getdvarint(#"hash_6eb6c222bc98b01", 0)) {
        penalty = function_377f07c2();
        for (index = 0; index < level.players.size; index++) {
            player = level.players[index];
            if (isdefined(player.team) && player.team == team && !isdefined(player.pers[#"hash_6dbbb195b62e0dd3"])) {
                if (isdefined(player.pers[#"arenainit"]) && player.pers[#"arenainit"] == 1) {
                    if (isdefined(player.pers[#"hash_1b5251cc167039c8"])) {
                        player function_ca53535e(penalty);
                        player function_46445a75(player.pers[#"hash_1b5251cc167039c8"]);
                        player.pers[#"hash_6dbbb195b62e0dd3"] = 1;
                    }
                }
            }
        }
    }
}

// Namespace arena/arena
// Params 0, eflags: 0x1 linked
// Checksum 0x7a940d94, Offset: 0x4a0
// Size: 0x9c
function on_disconnect() {
    if (isdefined(self) && isdefined(self.team) && isdefined(level.playercount) && isdefined(level.playercount[self.team])) {
        if (!gamestate::is_game_over() && level.playercount[self.team] <= function_7a0dc792()) {
            function_b856a952(self.team);
        }
    }
}

// Namespace arena/arena
// Params 0, eflags: 0x0
// Checksum 0x563949cc, Offset: 0x548
// Size: 0x262
function update_arena_challenge_seasons() {
    eventstate = "";
    eventtype = function_945560bf();
    switch (eventtype) {
    case 0:
        eventstate = #"hash_ca4c97bc6c2963b";
        break;
    case 1:
        eventstate = #"leagueplaystats";
        break;
    case 4:
        eventstate = #"hash_4986c748eb81d3c5";
        break;
    default:
        return;
    }
    perseasonwins = self stats::get_stat(#"arenaperseasonstats", eventstate, #"matchesstats", #"wins");
    if (perseasonwins >= getdvarint(#"arena_seasonvetchallengewins", 0)) {
        arenaslot = arenagetslot();
        currentseason = self stats::get_stat(#"arenastats", arenaslot, #"season");
        seasonvetchallengearraycount = self getdstatarraycount("arenaChallengeSeasons");
        for (i = 0; i < seasonvetchallengearraycount; i++) {
            challengeseason = self stats::get_stat(#"arenachallengeseasons", i);
            if (challengeseason == currentseason) {
                return;
            }
            if (challengeseason == 0) {
                self stats::set_stat(#"arenachallengeseasons", i, currentseason);
                break;
            }
        }
    }
}

// Namespace arena/arena
// Params 0, eflags: 0x1 linked
// Checksum 0x7adfa597, Offset: 0x7b8
// Size: 0x204
function match_end() {
    for (index = 0; index < level.players.size; index++) {
        player = level.players[index];
        if (isdefined(player.pers[#"arenainit"]) && player.pers[#"arenainit"] == 1) {
            if (match::get_flag("tie")) {
                player arenaendmatch(0);
            } else if (match::function_a2b53e17(player)) {
                player arenaendmatch(1);
            } else {
                player arenaendmatch(-1);
            }
            if (isdefined(player.pers[#"hash_1b5251cc167039c8"])) {
                player function_46445a75(player.pers[#"hash_1b5251cc167039c8"]);
            }
        }
    }
    if (match::get_flag("tie") || !isdefined(game.outcome.team)) {
        function_a357a2b8(0);
    } else if (game.outcome.team == #"allies") {
        function_a357a2b8(1);
    } else {
        function_a357a2b8(-1);
    }
}

// Namespace arena/arena
// Params 0, eflags: 0x1 linked
// Checksum 0xe59d1acf, Offset: 0x9c8
// Size: 0x6
function function_51203700() {
    return 0;
}

// Namespace arena/arena
// Params 0, eflags: 0x1 linked
// Checksum 0xe746a95e, Offset: 0x9d8
// Size: 0x14
function on_game_playing() {
    function_e938380b();
}

