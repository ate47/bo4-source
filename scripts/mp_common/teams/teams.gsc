// Atian COD Tools GSC decompiler test
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spectating.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\persistence_shared.gsc;
#using scripts\core_common\gamestate.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace teams;

// Namespace teams/teams
// Params 0, eflags: 0x2
// Checksum 0xc4ebaa8, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"teams", &__init__, undefined, undefined);
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xd34dd1e7, Offset: 0x118
// Size: 0x4e
function __init__() {
    callback::on_start_gametype(&init);
    level.getenemyteam = &getenemyteam;
    level.use_team_based_logic_for_locking_on = 1;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x8cbdf1c6, Offset: 0x170
// Size: 0x1bc
function init() {
    game.strings[#"autobalance"] = #"mp/autobalance_now";
    level.teambalance = getdvarint(#"scr_teambalance", 0);
    level.teambalancetimer = 0;
    level.timeplayedcap = getdvarint(#"scr_timeplayedcap", 1800);
    level.freeplayers = [];
    if (level.teambased) {
        level.alliesplayers = [];
        level.axisplayers = [];
        callback::on_connect(&on_player_connect);
        callback::on_joined_team(&on_joined_team);
        callback::on_joined_spectate(&on_joined_spectators);
        level thread update_balance_dvar();
        wait(0.15);
        level thread update_player_times();
        level thread function_badbaae6();
        return;
    }
    callback::on_connect(&on_free_player_connect);
    wait(0.15);
    level thread update_player_times();
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xd2e2bc, Offset: 0x338
// Size: 0x1c
function on_player_connect() {
    self init_played_time();
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x8095f6d6, Offset: 0x360
// Size: 0x1c
function on_free_player_connect() {
    self thread track_free_played_time();
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0x6a6b1c6d, Offset: 0x388
// Size: 0x24
function on_joined_team(params) {
    self update_time();
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0x40fe6f89, Offset: 0x3b8
// Size: 0x24
function on_joined_spectators(params) {
    self.pers[#"teamtime"] = undefined;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xc68d6773, Offset: 0x3e8
// Size: 0x10e
function init_played_time() {
    if (!isdefined(self.pers[#"totaltimeplayed"])) {
        self.pers[#"totaltimeplayed"] = 0;
    }
    self.timeplayed[#"free"] = 0;
    self.timeplayed[#"other"] = 0;
    self.timeplayed[#"alive"] = 0;
    if (!isdefined(self.timeplayed[#"total"]) || !(level.gametype == "twar" && 0 < game.roundsplayed && 0 < self.timeplayed[#"total"])) {
        self.timeplayed[#"total"] = 0;
    }
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x176e0350, Offset: 0x500
// Size: 0x68
function function_badbaae6() {
    level endon(#"game_ended");
    while (level.inprematchperiod) {
        waitframe(1);
    }
    for (;;) {
        if (game.state == "playing") {
            function_351a57a9();
        }
        wait(1);
    }
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x61fd82c, Offset: 0x570
// Size: 0x78
function update_player_times() {
    nexttoupdate = 0;
    for (;;) {
        nexttoupdate++;
        if (nexttoupdate >= level.players.size) {
            nexttoupdate = 0;
        }
        if (isdefined(level.players[nexttoupdate])) {
            level.players[nexttoupdate] update_played_time();
        }
        wait(1);
    }
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x1a238d09, Offset: 0x5f0
// Size: 0x4b6
function update_played_time() {
    pixbeginevent(#"updateplayedtime");
    if (!isdefined(self.timeplayed)) {
        self.timeplayed = [];
    }
    foreach (team, str_team in level.teams) {
        if (isdefined(self.timeplayed[team]) && self.timeplayed[team]) {
            time = int(min(self.timeplayed[team], level.timeplayedcap));
            if (sessionmodeismultiplayergame()) {
                if (level.teambased) {
                    self stats::function_dad108fa(#"time_played_" + str_team, time);
                }
                if (isdefined(level.hardcoremode) && level.hardcoremode) {
                    hc_time_played = self stats::get_stat(#"playerstatslist", #"hc_time_played", #"statvalue") + time;
                    self stats::set_stat(#"playerstatslist", #"hc_time_played", #"statvalue", hc_time_played);
                }
            }
            self stats::function_bb7eedf0(#"time_played_total", time);
        }
    }
    if (self.timeplayed[#"other"]) {
        time = int(min(self.timeplayed[#"other"], level.timeplayedcap));
        self stats::function_dad108fa(#"time_played_other", time);
        self stats::function_bb7eedf0(#"time_played_other", time);
    }
    if (self.timeplayed[#"alive"]) {
        timealive = int(min(self.timeplayed[#"alive"], level.timeplayedcap));
        self stats::function_dad108fa(#"time_played_alive", timealive);
    }
    timealive = int(min(self.timeplayed[#"alive"], level.timeplayedcap));
    self.pers[#"time_played_alive"] = self.pers[#"time_played_alive"] + timealive;
    pixendevent();
    if (gamestate::is_game_over()) {
        return;
    }
    foreach (team, _ in level.teams) {
        if (isdefined(self.timeplayed[team])) {
            self.timeplayed[team] = 0;
        }
    }
    self.timeplayed[#"other"] = 0;
    self.timeplayed[#"alive"] = 0;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xb276cf32, Offset: 0xab0
// Size: 0x36
function update_time() {
    if (game.state != "playing") {
        return;
    }
    self.pers[#"teamtime"] = gettime();
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x32423392, Offset: 0xaf0
// Size: 0x68
function update_balance_dvar() {
    for (;;) {
        level.teambalance = getdvarint(#"scr_teambalance", 0);
        level.timeplayedcap = getdvarint(#"scr_timeplayedcap", 1800);
        wait(1);
    }
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0x83de1f4d, Offset: 0xb60
// Size: 0x176
function change(team) {
    if (self.sessionstate != "dead") {
        self.switching_teams = 1;
        self.switchedteamsresetgadgets = 1;
        self.joining_team = team;
        self.leaving_team = self.pers[#"team"];
        self suicide();
    }
    self.pers[#"team"] = team;
    self.team = team;
    self.pers[#"spawnweapon"] = undefined;
    self.pers[#"savedmodel"] = undefined;
    self.pers[#"teamtime"] = undefined;
    self.sessionteam = self.pers[#"team"];
    self globallogic_ui::updateobjectivetext();
    self spectating::set_permissions();
    self openmenu(game.menu[#"menu_start_menu"]);
    self notify(#"end_respawn");
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x42d55e4e, Offset: 0xce0
// Size: 0x158
function count_players() {
    players = level.players;
    playercounts = [];
    foreach (team, _ in level.teams) {
        playercounts[team] = 0;
    }
    foreach (player in level.players) {
        if (player == self) {
            continue;
        }
        team = player.pers[#"team"];
        if (isdefined(team) && isdefined(level.teams[team])) {
            playercounts[team]++;
        }
    }
    return playercounts;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x412ca5fe, Offset: 0xe40
// Size: 0x21c
function track_free_played_time() {
    self endon(#"disconnect");
    if (!isdefined(self.timeplayed)) {
        self.timeplayed = [];
    }
    foreach (team, _ in level.teams) {
        if (isdefined(self.timeplayed[team])) {
            self.timeplayed[team] = 0;
        }
    }
    self.timeplayed[#"other"] = 0;
    self.timeplayed[#"total"] = 0;
    self.timeplayed[#"alive"] = 0;
    for (;;) {
        if (game.state == "playing") {
            team = self.pers[#"team"];
            if (isdefined(team) && isdefined(level.teams[team]) && self.sessionteam != #"spectator") {
                if (!isdefined(self.timeplayed[team])) {
                    self.timeplayed[team] = 0;
                }
                self.timeplayed[team]++;
                self.timeplayed[#"total"]++;
                if (isalive(self)) {
                    self.timeplayed[#"alive"]++;
                }
            } else {
                self.timeplayed[#"other"]++;
            }
        }
        wait(1);
    }
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0xa895f77a, Offset: 0x1068
// Size: 0x64
function get_flag_model(teamref) {
    /#
        assert(isdefined(game.flagmodels));
    #/
    /#
        assert(isdefined(game.flagmodels[teamref]));
    #/
    return game.flagmodels[teamref];
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0xf888569e, Offset: 0x10d8
// Size: 0x64
function get_flag_carry_model(teamref) {
    /#
        assert(isdefined(game.carry_flagmodels));
    #/
    /#
        assert(isdefined(game.carry_flagmodels[teamref]));
    #/
    return game.carry_flagmodels[teamref];
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0xe10fafc5, Offset: 0x1148
// Size: 0x70
function getteamindex(team) {
    if (!isdefined(team)) {
        return 0;
    }
    if (team == #"free") {
        return 0;
    }
    if (team == #"allies") {
        return 1;
    }
    if (team == #"axis") {
        return 2;
    }
    return 0;
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0xa67466e4, Offset: 0x11c0
// Size: 0xba
function getenemyteam(player_team) {
    foreach (team, _ in level.teams) {
        if (team == player_team) {
            continue;
        }
        if (team == #"spectator") {
            continue;
        }
        return team;
    }
    return util::getotherteam(player_team);
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0x163d4f68, Offset: 0x1288
// Size: 0x138
function getenemyplayers() {
    enemies = [];
    foreach (player in level.players) {
        if (player.team == #"spectator") {
            continue;
        }
        if (level.teambased && player util::isenemyteam(self.team) || !level.teambased && player != self) {
            if (!isdefined(enemies)) {
                enemies = [];
            } else if (!isarray(enemies)) {
                enemies = array(enemies);
            }
            enemies[enemies.size] = player;
        }
    }
    return enemies;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xcee0b6f3, Offset: 0x13c8
// Size: 0xf8
function getfriendlyplayers() {
    friendlies = [];
    foreach (player in level.players) {
        if (!player util::isenemyteam(self.team) && player != self) {
            if (!isdefined(friendlies)) {
                friendlies = [];
            } else if (!isarray(friendlies)) {
                friendlies = array(friendlies);
            }
            friendlies[friendlies.size] = player;
        }
    }
    return friendlies;
}

// Namespace teams/teams
// Params 6, eflags: 0x0
// Checksum 0xc7fc9cf7, Offset: 0x14c8
// Size: 0xca
function waituntilteamchange(player, callback, arg, end_condition1, end_condition2, end_condition3) {
    if (isdefined(end_condition1)) {
        self endon(end_condition1);
    }
    if (isdefined(end_condition2)) {
        self endon(end_condition2);
    }
    if (isdefined(end_condition3)) {
        self endon(end_condition3);
    }
    event = undefined;
    event = player waittill(#"joined_team", #"disconnect", #"joined_spectators");
    if (isdefined(callback)) {
        self [[ callback ]](arg, event);
    }
}

// Namespace teams/teams
// Params 7, eflags: 0x0
// Checksum 0x4aaa9a6d, Offset: 0x15a0
// Size: 0xea
function waituntilteamchangesingleton(player, singletonstring, callback, arg, end_condition1, end_condition2, end_condition3) {
    self notify(singletonstring);
    self endon(singletonstring);
    if (isdefined(end_condition1)) {
        self endon(end_condition1);
    }
    if (isdefined(end_condition2)) {
        self endon(end_condition2);
    }
    if (isdefined(end_condition3)) {
        self endon(end_condition3);
    }
    event = undefined;
    event = player waittill(#"joined_team", #"disconnect", #"joined_spectators");
    if (isdefined(callback)) {
        self thread [[ callback ]](arg, event);
    }
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xdab65cee, Offset: 0x1698
// Size: 0x74
function hidetosameteam() {
    if (isdefined(self)) {
        if (level.teambased) {
            self setvisibletoallexceptteam(self.team);
            return;
        }
        self setvisibletoall();
        if (isdefined(self.owner)) {
            self setinvisibletoplayer(self.owner);
        }
    }
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0x621a7084, Offset: 0x1718
// Size: 0x1c
function function_9dd75dad(team) {
    return level.everexisted[team];
}

// Namespace teams/teams
// Params 1, eflags: 0x0
// Checksum 0xd1e1bc40, Offset: 0x1740
// Size: 0x40
function is_all_dead(team) {
    if (level.playerlives[team]) {
        return 0;
    }
    if (level.alivecount[team]) {
        return 0;
    }
    return 1;
}

// Namespace teams/teams
// Params 0, eflags: 0x0
// Checksum 0xa400ad6a, Offset: 0x1788
// Size: 0x16a
function function_596bfb16() {
    foreach (team, _ in level.teams) {
        if (level.alivecount[team]) {
            game.everexisted[team] = 1;
            level.var_4ad4bec3 = 1;
            if (level.everexisted[team] == 0) {
                level.everexisted[team] = gettime();
            }
        }
    }
    /#
        if (getdvarint(#"hash_79f55d595a926104", 0)) {
            foreach (team, _ in level.teams) {
                game.everexisted[team] = 0;
                level.everexisted[team] = 0;
            }
        }
    #/
}

