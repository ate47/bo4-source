// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\teams\platoons.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\match.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\platoons.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\infection.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace globallogic_defaults;

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0xdef64724, Offset: 0x140
// Size: 0x32
function getwinningteamfromloser(losing_team) {
    if (level.multiteam) {
        return undefined;
    }
    return util::getotherteam(losing_team);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x5b0f49e, Offset: 0x180
// Size: 0x1bc
function default_onforfeit(params) {
    level.gameforfeited = 1;
    level notify(#"forfeit in progress");
    level endon(#"forfeit in progress", #"abort forfeit");
    forfeit_delay = 20;
    announcement(game.strings[#"opponent_forfeiting_in"], forfeit_delay, 0);
    wait(10);
    announcement(game.strings[#"opponent_forfeiting_in"], 10, 0);
    wait(10);
    if (!isdefined(params)) {
        round::set_winner(level.players[0]);
    } else {
        if (platoons::function_382a49e0() && params.var_b2ee6c67.size) {
            round::function_35702443(params.var_b2ee6c67[0]);
        }
        if (params.var_6eb69269.size) {
            round::set_winner(params.var_6eb69269[0]);
        }
    }
    level.forcedend = 1;
    round::set_flag("force_end");
    thread globallogic::end_round(7);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0xfc770032, Offset: 0x348
// Size: 0xdc
function default_ondeadevent(team) {
    var_2e0d5506 = round::get_winner();
    if (isdefined(var_2e0d5506) && var_2e0d5506 != #"free") {
        return;
    }
    if (isdefined(level.teams[team])) {
        round::set_winner(getwinningteamfromloser(team));
        thread globallogic::end_round(6);
        return;
    }
    round::set_flag("tie");
    thread globallogic::end_round(6);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x7ea93f66, Offset: 0x430
// Size: 0x164
function function_dcf41142(params) {
    if (gamestate::is_game_over()) {
        return;
    }
    if (infection::function_74650d7() && platoons::function_382a49e0() && params.var_dfa2cc2c.size) {
        round::function_af2e264f(params.var_dfa2cc2c[0]);
    } else if (platoons::function_382a49e0() && params.platoons_alive.size) {
        round::function_35702443(params.platoons_alive[0]);
    } else if (params.teams_alive.size && isdefined(level.teams[params.teams_alive[0]])) {
        round::function_af2e264f(params.teams_alive[0]);
    } else {
        round::set_flag("tie");
    }
    thread globallogic::end_round(6);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0x571ee84b, Offset: 0x5a0
// Size: 0x34
function function_daa7e9d5() {
    level callback::remove_callback(#"on_last_alive", &function_dcf41142);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x2b6c3193, Offset: 0x5e0
// Size: 0xc
function default_onalivecountchange(team) {
    
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x4dbb18b5, Offset: 0x5f8
// Size: 0x54
function onendgame(var_c1e98979) {
    if (level.scoreroundwinbased) {
        globallogic_score::updateteamscorebyroundswon();
    }
    match::function_af2e264f(match::function_6d0354e3());
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x9e9371c0, Offset: 0x658
// Size: 0x140
function default_ononeleftevent(team) {
    if (!level.teambased) {
        round::set_winner(globallogic_score::gethighestscoringplayer());
        thread globallogic::end_round(6);
        return;
    }
    foreach (player in level.players) {
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(player.pers[#"team"]) || player.pers[#"team"] != team) {
            continue;
        }
        player globallogic_audio::leader_dialog_on_player("sudden_death");
    }
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0xd1678e43, Offset: 0x7a0
// Size: 0x2c
function default_ontimelimit() {
    round::function_870759fb();
    thread globallogic::end_round(2);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0x6dc02c2a, Offset: 0x7d8
// Size: 0x48
function default_onscorelimit() {
    if (!level.endgameonscorelimit) {
        return 0;
    }
    round::function_870759fb();
    thread globallogic::end_round(3);
    return 1;
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0xb0f5b1b7, Offset: 0x828
// Size: 0x40
function default_onroundscorelimit() {
    round::function_870759fb();
    param1 = 4;
    thread globallogic::end_round(param1);
    return 1;
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 2, eflags: 0x0
// Checksum 0x79c854dd, Offset: 0x870
// Size: 0xdc
function default_onspawnspectator(origin, angles) {
    if (isdefined(origin) && isdefined(angles)) {
        self spawn(origin, angles);
        return;
    }
    spawnpoints = spawning::get_spawnpoint_array("mp_global_intermission");
    /#
        assert(spawnpoints.size, "<unknown string>");
    #/
    spawnpoint = spawning::get_spawnpoint_random(spawnpoints);
    self spawn(spawnpoint.origin, spawnpoint.angles);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x8b9b417f, Offset: 0x958
// Size: 0x94
function default_onspawnintermission(endgame) {
    if (isdefined(endgame) && endgame) {
        return;
    }
    spawnpoint = spawning::get_random_intermission_point();
    if (isdefined(spawnpoint)) {
        self spawn(spawnpoint.origin, spawnpoint.angles);
        return;
    }
    /#
        util::error("<unknown string>");
    #/
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0xa8b7c23c, Offset: 0x9f8
// Size: 0xba
function default_gettimelimit() {
    /#
        if (getdvarfloat(#"timelimit_override", -1) != -1) {
            return math::clamp(getdvarfloat(#"timelimit_override", -1), level.timelimitmin, level.timelimitmax);
        }
    #/
    return math::clamp(getgametypesetting(#"timelimit"), level.timelimitmin, level.timelimitmax);
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 4, eflags: 0x0
// Checksum 0x1ec67370, Offset: 0xac0
// Size: 0x6c
function default_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_penalty = 1;
    if (killstreaks::is_killstreak_weapon(weapon)) {
        teamkill_penalty = teamkill_penalty * killstreaks::get_killstreak_team_kill_penalty_scale(weapon);
    }
    return teamkill_penalty;
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 4, eflags: 0x0
// Checksum 0x6210232e, Offset: 0xb38
// Size: 0x42
function default_getteamkillscore(einflictor, attacker, smeansofdeath, weapon) {
    return attacker rank::getscoreinfovalue("team_kill");
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 1, eflags: 0x0
// Checksum 0x8dd910ae, Offset: 0xb88
// Size: 0x100
function get_alive_players(players) {
    alive_players = [];
    foreach (player in players) {
        if (player == self) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(alive_players)) {
            alive_players = [];
        } else if (!isarray(alive_players)) {
            alive_players = array(alive_players);
        }
        alive_players[alive_players.size] = player;
    }
    return alive_players;
}

// Namespace globallogic_defaults/globallogic_defaults
// Params 0, eflags: 0x0
// Checksum 0xfe56083f, Offset: 0xc90
// Size: 0xcc
function function_108c4b65() {
    if (platoons::function_382a49e0()) {
        teammates = getplayers(self.team);
        var_2927adba = get_alive_players(teammates);
        if (var_2927adba.size) {
            return var_2927adba[0];
        }
        platoon = getteamplatoon(self.team);
        var_bf97e486 = platoons::function_a214d798(platoon);
        return spectating::function_18b8b7e4(var_bf97e486, self.origin);
    }
}

