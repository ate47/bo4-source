#using scripts\core_common\bb_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\globallogic\globallogic_player;
#using scripts\core_common\healthoverlay;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\hud_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\persistence_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\popups_shared;
#using scripts\core_common\potm_shared;
#using scripts\core_common\rank_shared;
#using scripts\core_common\simple_hostmigration;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\tweakables_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\weapons\zm\weaponobjects;
#using scripts\zm_common\gametypes\dev;
#using scripts\zm_common\gametypes\globallogic_audio;
#using scripts\zm_common\gametypes\globallogic_defaults;
#using scripts\zm_common\gametypes\globallogic_player;
#using scripts\zm_common\gametypes\globallogic_score;
#using scripts\zm_common\gametypes\globallogic_spawn;
#using scripts\zm_common\gametypes\globallogic_ui;
#using scripts\zm_common\gametypes\globallogic_utils;
#using scripts\zm_common\gametypes\hostmigration;
#using scripts\zm_common\gametypes\hud_message;
#using scripts\zm_common\gametypes\spawnlogic;
#using scripts\zm_common\rat;
#using scripts\zm_common\util;
#using scripts\zm_common\zm_weapons;

#namespace globallogic;

// Namespace globallogic/globallogic
// Params 0, eflags: 0x2
// Checksum 0x26364fe0, Offset: 0x450
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"globallogic", &__init__, undefined, #"visionset_mgr");
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x4b7f67d2, Offset: 0x4a0
// Size: 0x44
function __init__() {
    visionset_mgr::register_info("visionset", "crithealth", 1, 4, 25, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x76196a6b, Offset: 0x4f0
// Size: 0x8be
function init() {
    level.language = getdvarstring(#"language");
    level.splitscreen = issplitscreen();
    level.xenon = getdvarstring(#"xenongame") == "true";
    level.ps3 = getdvarstring(#"ps3game") == "true";
    level.wiiu = getdvarstring(#"wiiugame") == "true";
    level.orbis = getdvarstring(#"orbisgame") == "true";
    level.durango = getdvarstring(#"durangogame") == "true";
    level.createfx_disable_fx = getdvarint(#"disable_fx", 0) == 1;
    level.onlinegame = sessionmodeisonlinegame();
    level.systemlink = sessionmodeissystemlink();
    level.console = level.xenon || level.ps3 || level.wiiu || level.orbis || level.durango;
    level.rankedmatch = gamemodeisusingxp();
    level.leaguematch = 0;
    level.arenamatch = 0;
    level.contractsenabled = !getgametypesetting(#"disablecontracts");
    level.contractsenabled = 0;
    level.new_health_model = getdvarint(#"new_health_model", 1) > 0;
    /#
        if (getdvarint(#"scr_forcerankedmatch", 0) == 1) {
            level.rankedmatch = 1;
        }
    #/
    level.script = util::get_map_name();
    level.gametype = util::get_game_type();
    level.var_837aa533 = hash(level.gametype);
    level.teambased = 0;
    level.teamcount = 1;
    level.multiteam = level.teamcount > 2;
    if (sessionmodeiszombiesgame()) {
        level.zombie_team_index = level.teamcount + 1;
        if (2 == level.zombie_team_index) {
            level.zombie_team = #"axis";
        } else {
            level.zombie_team = "team" + level.zombie_team_index;
        }
    }
    level.teams = [];
    level.teamindex = [];
    teamcount = level.teamcount;
    level.teams[#"allies"] = "allies";
    level.teams[#"axis"] = "axis";
    level.teamindex[#"neutral"] = 0;
    level.teamindex[#"allies"] = 1;
    level.teamindex[#"axis"] = 2;
    for (teamindex = 3; teamindex <= teamcount; teamindex++) {
        level.teams[hash("team" + teamindex)] = "team" + teamindex;
        level.teamindex[hash("team" + teamindex)] = teamindex;
    }
    level.overrideteamscore = 0;
    level.overrideplayerscore = 0;
    level.displayhalftimetext = 0;
    level.displayroundendtext = 1;
    level.endgameonscorelimit = 1;
    level.endgameontimelimit = 1;
    level.scoreroundwinbased = 0;
    level.resetplayerscoreeveryround = 0;
    level.gameforfeited = 0;
    level.forceautoassign = 0;
    level.halftimetype = "halftime";
    level.halftimesubcaption = #"hash_54b0f0ec952ddba8";
    level.laststatustime = 0;
    level.waswinning = [];
    level.lastslowprocessframe = 0;
    level.placement = [];
    foreach (team, _ in level.teams) {
        level.placement[team] = [];
    }
    level.placement[#"all"] = [];
    level.postroundtime = 7;
    level.inovertime = 0;
    level.defaultoffenseradius = 560;
    level.dropteam = getdvarint(#"sv_maxclients", 0);
    level.infinalkillcam = 0;
    registerdvars();
    level.oldschool = getdvarint(#"scr_oldschool", 0);
    if (level.oldschool) {
        /#
            print("<dev string:x38>");
        #/
        setdvar(#"jump_height", 64);
        setdvar(#"jump_slowdownenable", 0);
        setdvar(#"bg_falldamageminheight", 256);
        setdvar(#"bg_falldamagemaxheight", 512);
        setdvar(#"player_clipsizemultiplier", 2);
    }
    if (!isdefined(game.tiebreaker)) {
        game.tiebreaker = 0;
    }
    if (!isdefined(game.stat)) {
        game.stat = [];
    }
    level.figure_out_attacker = &globallogic_player::figureoutattacker;
    level.figure_out_friendly_fire = &globallogic_player::figureoutfriendlyfire;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x771059de, Offset: 0xdb8
// Size: 0x1ae
function registerdvars() {
    if (!isdefined(getdvar(#"scr_oldschool"))) {
        setdvar(#"scr_oldschool", 0);
    }
    if (!isdefined(getdvar(#"ui_guncycle"))) {
        setdvar(#"ui_guncycle", 0);
    }
    if (!isdefined(getdvar(#"ui_weapon_tiers"))) {
        setdvar(#"ui_weapon_tiers", 0);
    }
    setdvar(#"ui_text_endreason", "");
    setmatchflag("bomb_timer", 0);
    level.vehicledamagescalar = getdvarfloat(#"scr_vehicle_damage_scalar", 1);
    level.fire_audio_repeat_duration = getdvarint(#"fire_audio_repeat_duration", 0);
    level.fire_audio_random_max_duration = getdvarint(#"fire_audio_random_max_duration", 0);
}

// Namespace globallogic/globallogic
// Params 10, eflags: 0x1 linked
// Checksum 0x7de50794, Offset: 0xf70
// Size: 0x54
function blank(arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10) {
    
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x0
// Checksum 0xdbb63d6e, Offset: 0xfd0
// Size: 0x42e
function setupcallbacks() {
    level.spawnplayer = &globallogic_spawn::spawnplayer;
    level.spawnplayerprediction = &globallogic_spawn::spawnplayerprediction;
    level.spawnclient = &globallogic_spawn::spawnclient;
    level.spawnspectator = &globallogic_spawn::spawnspectator;
    level.spawnintermission = &globallogic_spawn::spawnintermission;
    level.scoreongiveplayerscore = &globallogic_score::giveplayerscore;
    level.onplayerscore = &globallogic_score::default_onplayerscore;
    level.wavespawntimer = &wavespawntimer;
    level.spawnmessage = &globallogic_spawn::default_spawnmessage;
    level.onspawnplayer = &blank;
    level.onspawnplayerunified = &blank;
    level.onspawnspectator = &globallogic_defaults::default_onspawnspectator;
    level.onspawnintermission = &globallogic_defaults::default_onspawnintermission;
    level.onrespawndelay = &blank;
    level.onforfeit = &globallogic_defaults::default_onforfeit;
    level.ontimelimit = &globallogic_defaults::default_ontimelimit;
    level.onscorelimit = &globallogic_defaults::default_onscorelimit;
    level.onalivecountchange = &globallogic_defaults::default_onalivecountchange;
    level.ondeadevent = &globallogic_defaults::default_ondeadevent;
    level.ononeleftevent = &globallogic_defaults::default_ononeleftevent;
    level.giveteamscore = &globallogic_score::giveteamscore;
    level.onlastteamaliveevent = undefined;
    level.gettimepassed = &globallogic_utils::gettimepassed;
    level.gettimelimit = &globallogic_defaults::default_gettimelimit;
    level.getteamkillpenalty = &blank;
    level.getteamkillscore = &blank;
    level.iskillboosting = &globallogic_score::default_iskillboosting;
    level._setteamscore = &globallogic_score::_setteamscore;
    level._setplayerscore = &globallogic_score::_setplayerscore;
    level._getteamscore = &globallogic_score::_getteamscore;
    level._getplayerscore = &globallogic_score::_getplayerscore;
    level.onprecachegametype = &blank;
    level.onstartgametype = &blank;
    level.onplayerconnect = &blank;
    level.onplayerdisconnect = &blank;
    level.onplayerdamage = &blank;
    level.onplayerkilled = &blank;
    level.onplayerkilledextraunthreadedcbs = [];
    level.onteamoutcomenotify = &blank;
    level.onoutcomenotify = &blank;
    level.onendgame = &blank;
    level.onroundendgame = &globallogic_defaults::default_onroundendgame;
    level.onmedalawarded = &blank;
    level.dogmanagerongetdogs = &blank;
    level.var_fc5ef179 = &blank;
}

// Namespace globallogic/globallogic
// Params 4, eflags: 0x1 linked
// Checksum 0x4968a130, Offset: 0x1408
// Size: 0x106
function compareteambygamestat(gamestat, teama, teamb, previous_winner_score) {
    winner = undefined;
    if (teama == "tie") {
        winner = #"tie";
        if (previous_winner_score < game.stat[gamestat][teamb]) {
            winner = teamb;
        }
    } else if (game.stat[gamestat][teama] == game.stat[gamestat][teamb]) {
        winner = #"tie";
    } else if (game.stat[gamestat][teamb] > game.stat[gamestat][teama]) {
        winner = teamb;
    } else {
        winner = teama;
    }
    return winner;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xdd392cbb, Offset: 0x1518
// Size: 0xe0
function determineteamwinnerbygamestat(gamestat) {
    teamkeys = getarraykeys(level.teams);
    winner = teamkeys[0];
    previous_winner_score = game.stat[gamestat][winner];
    for (teamindex = 1; teamindex < teamkeys.size; teamindex++) {
        winner = compareteambygamestat(gamestat, winner, teamkeys[teamindex], previous_winner_score);
        if (winner != "tie") {
            previous_winner_score = game.stat[gamestat][winner];
        }
    }
    return winner;
}

// Namespace globallogic/globallogic
// Params 3, eflags: 0x1 linked
// Checksum 0xfeb5e38b, Offset: 0x1600
// Size: 0xda
function compareteambyteamscore(teama, teamb, previous_winner_score) {
    winner = undefined;
    teambscore = [[ level._getteamscore ]](teamb);
    if (teama == "tie") {
        winner = "tie";
        if (previous_winner_score < teambscore) {
            winner = teamb;
        }
        return winner;
    }
    teamascore = [[ level._getteamscore ]](teama);
    if (teambscore == teamascore) {
        winner = "tie";
    } else if (teambscore > teamascore) {
        winner = teamb;
    } else {
        winner = teama;
    }
    return winner;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x0
// Checksum 0x51878a2b, Offset: 0x16e8
// Size: 0xcc
function determineteamwinnerbyteamscore() {
    teamkeys = getarraykeys(level.teams);
    winner = teamkeys[0];
    previous_winner_score = [[ level._getteamscore ]](winner);
    for (teamindex = 1; teamindex < teamkeys.size; teamindex++) {
        winner = compareteambyteamscore(winner, teamkeys[teamindex], previous_winner_score);
        if (winner != "tie") {
            previous_winner_score = [[ level._getteamscore ]](winner);
        }
    }
    return winner;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0x408af8b0, Offset: 0x17c0
// Size: 0x1cc
function forceend(hostsucks = 0) {
    if (level.hostforcedend || level.forcedend) {
        return;
    }
    winner = undefined;
    if (level.teambased) {
        winner = determineteamwinnerbygamestat("teamScores");
        globallogic_utils::logteamwinstring("host ended game", winner);
    } else {
        winner = globallogic_score::gethighestscoringplayer();
        /#
            if (isdefined(winner)) {
                print("<dev string:x4f>" + winner.name);
            } else {
                print("<dev string:x68>");
            }
        #/
    }
    level.forcedend = 1;
    level.hostforcedend = 1;
    if (hostsucks) {
        endstring = #"mp/host_sucks";
    } else if (level.splitscreen) {
        endstring = #"mp/ended_game";
    } else {
        endstring = #"hash_cd63faed592da03";
    }
    setmatchflag("disableIngameMenu", 1);
    setdvar(#"ui_text_endreason", endstring);
    thread endgame(winner, endstring);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xb84ec3ee, Offset: 0x1998
// Size: 0x164
function killserverpc() {
    if (level.hostforcedend || level.forcedend) {
        return;
    }
    winner = undefined;
    if (level.teambased) {
        winner = determineteamwinnerbygamestat("teamScores");
        globallogic_utils::logteamwinstring("host ended game", winner);
    } else {
        winner = globallogic_score::gethighestscoringplayer();
        /#
            if (isdefined(winner)) {
                print("<dev string:x4f>" + winner.name);
            } else {
                print("<dev string:x68>");
            }
        #/
    }
    level.forcedend = 1;
    level.hostforcedend = 1;
    level.killserver = 1;
    endstring = #"hash_cd63faed592da03";
    println("<dev string:x7f>");
    thread endgame(winner, endstring);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x64a9105, Offset: 0x1b08
// Size: 0x88
function someoneoneachteam() {
    foreach (team, _ in level.teams) {
        if (level.playercount[team] == 0) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xd76cc7a2, Offset: 0x1b98
// Size: 0x64
function checkifteamforfeits(team) {
    if (!level.everexisted[team]) {
        return false;
    }
    if (level.playercount[team] < 1 && util::totalplayercount() > 0) {
        return true;
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x37c0cc24, Offset: 0x1c08
// Size: 0x9c
function checkforanyteamforfeit() {
    foreach (team, _ in level.teams) {
        if (checkifteamforfeits(team)) {
            thread [[ level.onforfeit ]](team);
            return true;
        }
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x5fc815f1, Offset: 0x1cb0
// Size: 0x90
function dospawnqueueupdates() {
    foreach (team, _ in level.teams) {
        if (level.spawnqueuemodified[team]) {
            [[ level.onalivecountchange ]](team);
        }
    }
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0x55782f20, Offset: 0x1d48
// Size: 0x4c
function isteamalldead(team) {
    return level.everexisted[team] && !level.alivecount[team] && !level.playerlives[team];
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xdbb02d72, Offset: 0x1da0
// Size: 0x8a
function areallteamsdead() {
    foreach (team, _ in level.teams) {
        if (!isteamalldead(team)) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x7b9a977a, Offset: 0x1e38
// Size: 0x94
function alldeadteamcount() {
    count = 0;
    foreach (team, _ in level.teams) {
        if (isteamalldead(team)) {
            count++;
        }
    }
    return count;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x6368f4c, Offset: 0x1ed8
// Size: 0x1f8
function dodeadeventupdates() {
    if (level.teambased) {
        if (areallteamsdead()) {
            [[ level.ondeadevent ]]("all");
            return true;
        }
        if (isdefined(level.onlastteamaliveevent)) {
            if (alldeadteamcount() == level.teams.size - 1) {
                foreach (team, _ in level.teams) {
                    if (!isteamalldead(team)) {
                        [[ level.onlastteamaliveevent ]](team);
                        return true;
                    }
                }
            }
        } else {
            foreach (team, _ in level.teams) {
                if (isteamalldead(team)) {
                    [[ level.ondeadevent ]](team);
                    return true;
                }
            }
        }
    } else if (totalalivecount() == 0 && totalplayerlives() == 0 && level.maxplayercount > 1) {
        [[ level.ondeadevent ]]("all");
        return true;
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xbd5d47a5, Offset: 0x20d8
// Size: 0x58
function isonlyoneleftaliveonteam(team) {
    return level.lastalivecount[team] > 1 && level.alivecount[team] == 1 && level.playerlives[team] == 1;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x5dd70034, Offset: 0x2138
// Size: 0x110
function doonelefteventupdates() {
    if (level.teambased) {
        foreach (team, _ in level.teams) {
            if (isonlyoneleftaliveonteam(team)) {
                [[ level.ononeleftevent ]](team);
                return true;
            }
        }
    } else if (totalalivecount() == 1 && totalplayerlives() == 1 && level.maxplayercount > 1) {
        [[ level.ononeleftevent ]]("all");
        return true;
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x4862b4fe, Offset: 0x2250
// Size: 0x208
function updategameevents() {
    /#
        if (getdvarint(#"scr_hostmigrationtest", 0) == 1) {
            return;
        }
    #/
    if ((level.rankedmatch || level.leaguematch) && !level.ingraceperiod) {
        if (level.teambased) {
            if (!level.gameforfeited) {
                if (game.state == "playing" && checkforanyteamforfeit()) {
                    return;
                }
            } else if (someoneoneachteam()) {
                level.gameforfeited = 0;
                level notify(#"abort forfeit");
            }
        } else if (!level.gameforfeited) {
            if (util::totalplayercount() == 1 && level.maxplayercount > 1) {
                thread [[ level.onforfeit ]]();
                return;
            }
        } else if (util::totalplayercount() > 1) {
            level.gameforfeited = 0;
            level notify(#"abort forfeit");
        }
    }
    if (!level.playerqueuedrespawn && !level.numlives && !level.inovertime) {
        return;
    }
    if (level.ingraceperiod) {
        return;
    }
    if (level.playerqueuedrespawn) {
        dospawnqueueupdates();
    }
    if (dodeadeventupdates()) {
        return;
    }
    if (doonelefteventupdates()) {
        return;
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x9ad71d74, Offset: 0x2460
// Size: 0x14c
function matchstarttimer() {
    waitforplayers();
    counttime = int(level.prematchperiod);
    var_5654073f = counttime >= 2;
    luinotifyevent(#"create_prematch_timer", 2, gettime() + int(counttime * 1000), var_5654073f);
    if (var_5654073f) {
        while (counttime > 0 && !level.gameended) {
            if (counttime == 2) {
                visionsetnaked("default", 3);
            }
            counttime--;
            wait 1;
        }
    } else {
        visionsetnaked("default", 1);
    }
    luinotifyevent(#"prematch_timer_ended", 1, var_5654073f);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xebc91704, Offset: 0x25b8
// Size: 0x1c
function matchstarttimerskip() {
    visionsetnaked("default", 0);
}

// Namespace globallogic/globallogic
// Params 2, eflags: 0x1 linked
// Checksum 0x89272693, Offset: 0x25e0
// Size: 0x82
function notifyteamwavespawn(team, time) {
    if (time - level.lastwave[team] > level.wavedelay[team] * 1000) {
        level notify("wave_respawn_" + team);
        level.lastwave[team] = time;
        level.waveplayerspawnindex[team] = 0;
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xcb4c48cf, Offset: 0x2670
// Size: 0xc2
function wavespawntimer() {
    level endon(#"game_ended");
    while (game.state == "playing") {
        time = gettime();
        foreach (team, _ in level.teams) {
            notifyteamwavespawn(team, time);
        }
        waitframe(1);
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xdffb3407, Offset: 0x2740
// Size: 0xc4
function hostidledout() {
    hostplayer = util::gethostplayer();
    /#
        if (getdvarint(#"scr_writeconfigstrings", 0) == 1 || getdvarint(#"scr_hostmigrationtest", 0) == 1) {
            return false;
        }
    #/
    if (isdefined(hostplayer) && !(isdefined(hostplayer.hasspawned) && hostplayer.hasspawned) && !isdefined(hostplayer.selectedclass)) {
        return true;
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 3, eflags: 0x1 linked
// Checksum 0xb194c140, Offset: 0x2810
// Size: 0x5c
function incrementmatchcompletionstat(gamemode, playedorhosted, stat) {
    self stats::inc_stat(#"gamehistory", gamemode, #"modehistory", playedorhosted, stat, 1);
}

// Namespace globallogic/globallogic
// Params 3, eflags: 0x0
// Checksum 0xeab7c88c, Offset: 0x2878
// Size: 0x5c
function setmatchcompletionstat(gamemode, playedorhosted, stat) {
    self stats::set_stat(#"gamehistory", gamemode, #"modehistory", playedorhosted, stat, 1);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x1c00e724, Offset: 0x28e0
// Size: 0xc4
function getendreasontext() {
    if (util::hitroundlimit() || util::hitroundwinlimit()) {
        return game.strings[#"round_limit_reached"];
    } else if (util::hitscorelimit()) {
        return game.strings[#"score_limit_reached"];
    }
    if (level.forcedend) {
        if (level.hostforcedend) {
            return #"hash_cd63faed592da03";
        } else {
            return #"mp/ended_game";
        }
    }
    return game.strings[#"time_limit_reached"];
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x0
// Checksum 0x84a0c502, Offset: 0x29b0
// Size: 0x6a
function resetoutcomeforallplayers() {
    players = level.players;
    for (index = 0; index < players.size; index++) {
        player = players[index];
        player notify(#"reset_outcome");
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xfba296a0, Offset: 0x2a28
// Size: 0x78
function getgamelength() {
    if (!level.timelimit || level.forcedend) {
        gamelength = globallogic_utils::gettimepassed() / 1000;
        gamelength = min(gamelength, 1200);
    } else {
        gamelength = level.timelimit * 60;
    }
    return gamelength;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xb863b6c9, Offset: 0x2aa8
// Size: 0x14a
function gamehistoryplayerquit() {
    if (!gamemodeismode(0)) {
        return;
    }
    teamscoreratio = 0;
    self gamehistoryfinishmatch(3, 0, 0, 0, 0, teamscoreratio);
    if (isdefined(self.pers[#"matchesplayedstatstracked"])) {
        gamemode = util::getcurrentgamemode();
        self incrementmatchcompletionstat(gamemode, "played", "quit");
        if (isdefined(self.pers[#"matcheshostedstatstracked"])) {
            self incrementmatchcompletionstat(gamemode, "hosted", "quit");
            self.pers[#"matcheshostedstatstracked"] = undefined;
        }
        self.pers[#"matchesplayedstatstracked"] = undefined;
    }
    uploadstats(self);
    wait 1;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xa83698fb, Offset: 0x2c00
// Size: 0x66
function function_6c8d7c31(winner) {
    players = level.players;
    for (index = 0; index < players.size; index++) {
        globallogic_player::function_7314957c(players[index], winner);
    }
}

// Namespace globallogic/globallogic
// Params 2, eflags: 0x1 linked
// Checksum 0x5eeb3025, Offset: 0x2c70
// Size: 0x85c
function endgame(winner, endreasontext) {
    if (game.state == "postgame" || level.gameended) {
        return;
    }
    if (isdefined(level.onendgame)) {
        [[ level.onendgame ]](winner);
    }
    if (!isdefined(level.disableoutrovisionset) || level.disableoutrovisionset == 0) {
        if (sessionmodeiszombiesgame() && level.forcedend) {
            visionsetnaked("zombie_last_stand", 2);
        } else {
            visionsetnaked("mpOutro", 2);
        }
    }
    setmatchflag("cg_drawSpectatorMessages", 0);
    setmatchflag("game_ended", 1);
    game.state = "postgame";
    level.gameendtime = gettime();
    level.gameended = 1;
    setdvar(#"g_gameended", 1);
    level.ingraceperiod = 0;
    level notify(#"game_ended");
    level.allowbattlechatter[#"bc"] = 0;
    if (!isdefined(game.overtime_round) || util::waslastround()) {
        game.roundsplayed++;
        game.roundwinner[game.roundsplayed] = winner;
        if (level.teambased) {
            game.stat[#"roundswon"][winner]++;
        }
    }
    if (isdefined(winner) && isdefined(level.teams[winner])) {
        level.finalkillcam_winner = winner;
    } else {
        level.finalkillcam_winner = "none";
    }
    setgameendtime(0);
    updateplacement();
    updaterankedmatch(winner);
    players = level.players;
    newtime = gettime();
    gamelength = getgamelength();
    setmatchtalkflag("EveryoneHearsEveryone", 1);
    bbgameover = 0;
    if (util::isoneround() || util::waslastround()) {
        bbgameover = 1;
        if (level.teambased) {
            if (winner == "tie") {
                recordgameresult(#"draw");
            } else {
                recordgameresult(winner);
            }
        } else if (!isdefined(winner)) {
            recordgameresult(#"draw");
        } else {
            recordgameresult(winner.team);
        }
    }
    for (index = 0; index < players.size; index++) {
        player = players[index];
        player globallogic_player::freezeplayerforroundend();
        player thread roundenddof(4);
        player zm_weapons::updateweapontimingszm(newtime);
        player bbplayermatchend(gamelength, endreasontext, bbgameover);
        clientnum = player getentitynumber();
        player stats::set_stat(#"afteractionreportstats", #"clientnum", clientnum);
        if ((level.rankedmatch || level.leaguematch) && !player issplitscreen()) {
            if (isdefined(player.setpromotion)) {
                player stats::set_stat(#"afteractionreportstats", #"lobbypopup", #"promotion");
                continue;
            }
            player stats::set_stat(#"afteractionreportstats", #"lobbypopup", #"summary");
        }
    }
    music::setmusicstate("SILENT");
    thread challenges::roundend(winner);
    function_6c8d7c31(winner);
    globallogic_player::recordactiveplayersendgamematchrecordstats();
    if (!util::isoneround()) {
        if (isdefined(level.onroundendgame)) {
            winner = [[ level.onroundendgame ]](winner);
        }
        endreasontext = getendreasontext();
    }
    skillupdate(winner, level.teambased);
    thread challenges::gameend(winner);
    if (util::isoneround()) {
        globallogic_utils::executepostroundevents();
    }
    level.intermission = 1;
    setmatchtalkflag("EveryoneHearsEveryone", 1);
    stopdemorecording();
    players = level.players;
    for (index = 0; index < players.size; index++) {
        player = players[index];
        recordplayerstats(player, "present_at_end", 1);
        player closeingamemenu();
        player notify(#"reset_outcome");
        player thread [[ level.spawnintermission ]]();
        player setclientuivisibilityflag("hud_visible", 1);
        player setclientuivisibilityflag("weapon_hud_visible", 1);
    }
    level notify(#"sfade");
    /#
        print("<dev string:x9b>");
    #/
    if (!isdefined(level.skipgameend) || !level.skipgameend) {
        wait 5;
    }
    exitlevel(0);
}

// Namespace globallogic/globallogic
// Params 3, eflags: 0x1 linked
// Checksum 0xb9c9e236, Offset: 0x34d8
// Size: 0xc6
function bbplayermatchend(gamelength, endreasonstring, gameover) {
    playerrank = getplacementforplayer(self);
    totaltimeplayed = 0;
    if (isdefined(self.timeplayed) && isdefined(self.timeplayed[#"total"])) {
        totaltimeplayed = self.timeplayed[#"total"];
        if (totaltimeplayed > gamelength) {
            totaltimeplayed = gamelength;
        }
    }
    xuid = self getxuid();
}

// Namespace globallogic/globallogic
// Params 2, eflags: 0x0
// Checksum 0x96025b74, Offset: 0x35a8
// Size: 0x78
function roundendwait(defaultdelay, matchbonus) {
    if (!matchbonus) {
        wait defaultdelay;
        level notify(#"round_end_done");
        return;
    }
    wait defaultdelay / 2;
    level notify(#"give_match_bonus");
    wait defaultdelay / 2;
    level notify(#"round_end_done");
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xf16d2f6d, Offset: 0x3628
// Size: 0x2c
function roundenddof(time) {
    self clientfield::set_to_player("player_dof_settings", 2);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xcfcd6ef4, Offset: 0x3660
// Size: 0x130
function checktimelimit() {
    if (isdefined(level.timelimitoverride) && level.timelimitoverride) {
        return;
    }
    if (game.state != "playing") {
        setgameendtime(0);
        return;
    }
    if (level.timelimit <= 0) {
        setgameendtime(0);
        return;
    }
    if (level.inprematchperiod) {
        setgameendtime(0);
        return;
    }
    if (level.timerstopped) {
        setgameendtime(0);
        return;
    }
    if (!isdefined(level.starttime)) {
        return;
    }
    timeleft = globallogic_utils::gettimeremaining();
    setgameendtime(gettime() + int(timeleft));
    if (timeleft > 0) {
        return;
    }
    [[ level.ontimelimit ]]();
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x8a207cdf, Offset: 0x3798
// Size: 0x98
function allteamsunderscorelimit() {
    foreach (team, _ in level.teams) {
        if (game.stat[#"teamscores"][team] >= level.scorelimit) {
            return false;
        }
    }
    return true;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x679aa6c2, Offset: 0x3838
// Size: 0xa4
function checkscorelimit() {
    if (game.state != "playing") {
        return 0;
    }
    if (level.scorelimit <= 0) {
        return 0;
    }
    if (level.teambased) {
        if (allteamsunderscorelimit()) {
            return 0;
        }
    } else {
        if (!isplayer(self)) {
            return 0;
        }
        if (self.score < level.scorelimit) {
            return 0;
        }
    }
    [[ level.onscorelimit ]]();
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x6f903cbd, Offset: 0x38e8
// Size: 0x23a
function updategametypedvars() {
    level endon(#"game_ended");
    while (game.state == "playing") {
        roundlimit = math::clamp(getgametypesetting(#"roundlimit"), level.roundlimitmin, level.roundlimitmax);
        if (roundlimit != level.roundlimit) {
            level.roundlimit = roundlimit;
            level notify(#"update_roundlimit");
        }
        timelimit = [[ level.gettimelimit ]]();
        if (timelimit != level.timelimit) {
            level.timelimit = timelimit;
            setdvar(#"ui_timelimit", level.timelimit);
            level notify(#"update_timelimit");
        }
        thread checktimelimit();
        scorelimit = math::clamp(getgametypesetting(#"scorelimit"), level.scorelimitmin, level.scorelimitmax);
        if (scorelimit != level.scorelimit) {
            level.scorelimit = scorelimit;
            setdvar(#"ui_scorelimit", level.scorelimit);
            level notify(#"update_scorelimit");
        }
        thread checkscorelimit();
        if (isdefined(level.starttime)) {
            if (globallogic_utils::gettimeremaining() < 3000) {
                wait 0.1;
                continue;
            }
        }
        wait 1;
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x4c9644b6, Offset: 0x3b30
// Size: 0x202
function removedisconnectedplayerfromplacement() {
    offset = 0;
    numplayers = level.placement[#"all"].size;
    found = 0;
    for (i = 0; i < numplayers; i++) {
        if (level.placement[#"all"][i] == self) {
            found = 1;
        }
        if (found) {
            level.placement[#"all"][i] = level.placement[#"all"][i + 1];
        }
    }
    if (!found) {
        return;
    }
    level.placement[#"all"][numplayers - 1] = undefined;
    assert(level.placement[#"all"].size == numplayers - 1);
    /#
        globallogic_utils::assertproperplacement();
    #/
    updateteamplacement();
    if (level.teambased) {
        return;
    }
    numplayers = level.placement[#"all"].size;
    for (i = 0; i < numplayers; i++) {
        player = level.placement[#"all"][i];
        player notify(#"update_outcome");
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x920c8016, Offset: 0x3d40
// Size: 0x26c
function updateplacement() {
    if (!level.players.size) {
        return;
    }
    level.placement[#"all"] = [];
    foreach (player in level.players) {
        if (!level.teambased || isdefined(level.teams[player.team])) {
            level.placement[#"all"][level.placement[#"all"].size] = player;
        }
    }
    placementall = level.placement[#"all"];
    for (i = 1; i < placementall.size; i++) {
        player = placementall[i];
        playerscore = player.score;
        for (j = i - 1; j >= 0 && (playerscore > placementall[j].score || playerscore == placementall[j].score && player.deaths < placementall[j].deaths); j--) {
            placementall[j + 1] = placementall[j];
        }
        placementall[j + 1] = player;
    }
    level.placement[#"all"] = placementall;
    /#
        globallogic_utils::assertproperplacement();
    #/
    updateteamplacement();
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x2a79c2dc, Offset: 0x3fb8
// Size: 0x1be
function updateteamplacement() {
    foreach (team, _ in level.teams) {
        placement[team] = [];
    }
    placement[#"spectator"] = [];
    if (!level.teambased) {
        return;
    }
    placementall = level.placement[#"all"];
    placementallsize = placementall.size;
    for (i = 0; i < placementallsize; i++) {
        player = placementall[i];
        if (isdefined(player)) {
            team = player.pers[#"team"];
            placement[team][placement[team].size] = player;
        }
    }
    foreach (team, _ in level.teams) {
        level.placement[team] = placement[team];
    }
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xd25d7657, Offset: 0x4180
// Size: 0xb0
function getplacementforplayer(player) {
    updateplacement();
    playerrank = -1;
    placement = level.placement[#"all"];
    for (placementindex = 0; placementindex < placement.size; placementindex++) {
        if (level.placement[#"all"][placementindex] == player) {
            playerrank = placementindex + 1;
            break;
        }
    }
    return playerrank;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xece65ab3, Offset: 0x4238
// Size: 0x1a4
function sortdeadplayers(team) {
    if (!level.playerqueuedrespawn) {
        return;
    }
    for (i = 1; i < level.deadplayers[team].size; i++) {
        player = level.deadplayers[team][i];
        for (j = i - 1; j >= 0 && player.deathtime < level.deadplayers[team][j].deathtime; j--) {
            level.deadplayers[team][j + 1] = level.deadplayers[team][j];
        }
        level.deadplayers[team][j + 1] = player;
    }
    for (i = 0; i < level.deadplayers[team].size; i++) {
        if (level.deadplayers[team][i].spawnqueueindex != i) {
            level.spawnqueuemodified[team] = 1;
        }
        level.deadplayers[team][i].spawnqueueindex = i;
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xce16cc22, Offset: 0x43e8
// Size: 0x92
function totalalivecount() {
    count = 0;
    foreach (team, _ in level.teams) {
        count += level.alivecount[team];
    }
    return count;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xff8d91d, Offset: 0x4488
// Size: 0x92
function totalplayerlives() {
    count = 0;
    foreach (team, _ in level.teams) {
        count += level.playerlives[team];
    }
    return count;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0x753ba72e, Offset: 0x4528
// Size: 0xb4
function initteamvariables(team) {
    if (!isdefined(level.alivecount)) {
        level.alivecount = [];
    }
    level.alivecount[team] = 0;
    level.lastalivecount[team] = 0;
    level.everexisted[team] = 0;
    level.wavedelay[team] = 0;
    level.lastwave[team] = 0;
    level.waveplayerspawnindex[team] = 0;
    resetteamvariables(team);
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0x8f23a289, Offset: 0x45e8
// Size: 0xce
function resetteamvariables(team) {
    level.playercount[team] = 0;
    level.botscount[team] = 0;
    level.lastalivecount[team] = level.alivecount[team];
    level.alivecount[team] = 0;
    level.playerlives[team] = 0;
    level.aliveplayers[team] = [];
    level.deadplayers[team] = [];
    level.squads[team] = [];
    level.spawnqueuemodified[team] = 0;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0x88160ee9, Offset: 0x46c0
// Size: 0x3e0
function updateteamstatus(var_bdfe75a7) {
    profilestart();
    if (game.state == "postgame") {
        profilestop();
        return;
    }
    foreach (team, _ in level.teams) {
        resetteamvariables(team);
    }
    level.activeplayers = [];
    self.var_bdfe75a7 = var_bdfe75a7;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player) && level.splitscreen) {
            continue;
        }
        team = player.team;
        if (team != "spectator") {
            level.playercount[team]++;
            if (isbot(player)) {
                level.botscount[team]++;
            }
            if (player.sessionstate == "playing" && !(isdefined(player.var_bdfe75a7) && player.var_bdfe75a7)) {
                level.alivecount[team]++;
                level.playerlives[team]++;
                player.spawnqueueindex = -1;
                if (isalive(player)) {
                    level.aliveplayers[team][level.aliveplayers[team].size] = player;
                    level.activeplayers[level.activeplayers.size] = player;
                } else {
                    level.deadplayers[team][level.deadplayers[team].size] = player;
                }
                continue;
            }
            level.deadplayers[team][level.deadplayers[team].size] = player;
            if (player globallogic_spawn::mayspawn()) {
                level.playerlives[team]++;
            }
        }
    }
    totalalive = totalalivecount();
    if (totalalive > level.maxplayercount) {
        level.maxplayercount = totalalive;
    }
    foreach (team, _ in level.teams) {
        if (level.alivecount[team] && level.everexisted[team] == 0) {
            level.everexisted[team] = gettime();
        }
        sortdeadplayers(team);
    }
    level updategameevents();
    self.var_bdfe75a7 = undefined;
    profilestop();
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0x3d47a59b, Offset: 0x4aa8
// Size: 0xb0
function checkteamscorelimitsoon(team) {
    assert(isdefined(team));
    if (level.scorelimit <= 0) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    if (globallogic_utils::gettimepassed() < 60000) {
        return;
    }
    timeleft = globallogic_utils::getestimatedtimeuntilscorelimit(team);
    if (timeleft < 1) {
        level notify(#"match_ending_soon", "score");
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x0
// Checksum 0xccd53179, Offset: 0x4b60
// Size: 0xb8
function checkplayerscorelimitsoon() {
    assert(isplayer(self));
    if (level.scorelimit <= 0) {
        return;
    }
    if (level.teambased) {
        return;
    }
    if (globallogic_utils::gettimepassed() < 60000) {
        return;
    }
    timeleft = globallogic_utils::getestimatedtimeuntilscorelimit(undefined);
    if (timeleft < 1) {
        level notify(#"match_ending_soon", "score");
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x499ce3a7, Offset: 0x4c20
// Size: 0x1cc
function startgame() {
    thread globallogic_utils::gametimer();
    level.timerstopped = 0;
    setmatchtalkflag("DeadChatWithDead", level.voip.deadchatwithdead);
    setmatchtalkflag("DeadChatWithTeam", level.voip.deadchatwithteam);
    setmatchtalkflag("DeadHearTeamLiving", level.voip.deadhearteamliving);
    setmatchtalkflag("DeadHearAllLiving", level.voip.deadhearallliving);
    setmatchtalkflag("EveryoneHearsEveryone", level.voip.everyonehearseveryone);
    setmatchtalkflag("DeadHearKiller", level.voip.deadhearkiller);
    setmatchtalkflag("KillersHearVictim", level.voip.killershearvictim);
    prematchperiod();
    level notify(#"prematch_over");
    level.prematch_over = 1;
    thread graceperiod();
    thread watchmatchendingsoon();
    if (isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats) {
        return;
    }
    recordmatchbegin();
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x4df8
// Size: 0x4
function waitforplayers() {
    
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x183fdcde, Offset: 0x4e08
// Size: 0x192
function prematchperiod() {
    setmatchflag("hud_hardcore", level.hardcoremode);
    level endon(#"game_ended");
    if (level.prematchperiod > 0) {
        thread matchstarttimer();
        waitforplayers();
        wait level.prematchperiod;
    } else {
        matchstarttimerskip();
        waitframe(1);
    }
    level.inprematchperiod = 0;
    foreach (player in level.players) {
        player val::reset(#"prematch_period", "freezecontrols");
        player val::reset(#"prematch_period", "disable_weapons");
        player val::reset(#"prematch_period", "disablegadgets");
    }
    if (game.state != "playing") {
        return;
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x93bad3f1, Offset: 0x4fa8
// Size: 0x140
function graceperiod() {
    level endon(#"game_ended");
    if (isdefined(level.graceperiodfunc)) {
        [[ level.graceperiodfunc ]]();
    } else {
        wait level.graceperiod;
    }
    level notify(#"grace_period_ending");
    waitframe(1);
    level.ingraceperiod = 0;
    if (game.state != "playing") {
        return;
    }
    if (level.numlives) {
        players = level.players;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!player.hasspawned && player.sessionteam != "spectator" && !isalive(player)) {
                player.statusicon = "hud_status_dead";
            }
        }
    }
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x7c7c0ae9, Offset: 0x50f0
// Size: 0x64
function watchmatchendingsoon() {
    setdvar(#"xblive_matchendingsoon", 0);
    level waittill(#"match_ending_soon");
    setdvar(#"xblive_matchendingsoon", 1);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x5160
// Size: 0x4
function assertteamvariables() {
    
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x20a3d5a2, Offset: 0x5170
// Size: 0x84
function anyteamhaswavedelay() {
    foreach (team, _ in level.teams) {
        if (level.wavedelay[team]) {
            return true;
        }
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0xbb85164b, Offset: 0x5200
// Size: 0x159c
function callback_startgametype() {
    level.prematchperiod = 0;
    level.intermission = 0;
    setmatchflag("cg_drawSpectatorMessages", 1);
    setmatchflag("game_ended", 0);
    if (!isdefined(game.gamestarted)) {
        if (!isdefined(game.allies)) {
            game.allies = "seals";
        }
        if (!isdefined(game.axis)) {
            game.axis = "pmc";
        }
        if (!isdefined(game.attackers)) {
            game.attackers = #"allies";
        }
        if (!isdefined(game.defenders)) {
            game.defenders = #"axis";
        }
        assert(game.attackers != game.defenders);
        foreach (team, _ in level.teams) {
            if (!isdefined(game.team)) {
                game.team = "pmc";
            }
        }
        if (!isdefined(game.state)) {
            game.state = "playing";
        }
        setdvar(#"cg_thirdpersonangle", 354);
        game.strings[#"press_to_spawn"] = #"hash_203ff65a4ee460e6";
        if (level.teambased) {
            game.strings[#"waiting_for_teams"] = #"hash_150c54160239825";
            game.strings[#"opponent_forfeiting_in"] = #"hash_52d76ed35e0b625a";
        } else {
            game.strings[#"waiting_for_teams"] = #"hash_47c479655d474f31";
            game.strings[#"opponent_forfeiting_in"] = #"hash_52d76ed35e0b625a";
        }
        game.strings[#"match_starting_in"] = #"hash_18e58cc95db34427";
        game.strings[#"spawn_next_round"] = #"hash_590100cdca62e7db";
        game.strings[#"waiting_to_spawn"] = #"hash_44d60a6e6ed2a53c";
        game.strings[#"waiting_to_spawn_ss"] = #"hash_78bf3a61cf52e257";
        game.strings[#"you_will_spawn"] = #"hash_53c0ba6abce1c0ea";
        game.strings[#"match_starting"] = #"mp/match_starting";
        game.strings[#"change_class"] = #"hash_181a96fe9c28ada2";
        game.strings[#"last_stand"] = #"hash_5732d212e4511a00";
        game.strings[#"cowards_way"] = #"hash_268e464278a2f8ff";
        game.strings[#"tie"] = #"mp/match_tie";
        game.strings[#"round_draw"] = #"mp/round_draw";
        game.strings[#"enemies_eliminated"] = #"mp_enemies_eliminated";
        game.strings[#"score_limit_reached"] = #"mp/score_limit_reached";
        game.strings[#"round_limit_reached"] = #"mp/round_limit_reached";
        game.strings[#"time_limit_reached"] = #"mp/time_limit_reached";
        game.strings[#"players_forfeited"] = #"mp/players_forfeited";
        assertteamvariables();
        [[ level.onprecachegametype ]]();
        game.gamestarted = 1;
        game.totalkills = 0;
        foreach (team, _ in level.teams) {
            game.stat[#"teamscores"][team] = 0;
            game.totalkillsteam[team] = 0;
        }
        if (!level.splitscreen) {
            level.prematchperiod = getgametypesetting(#"prematchperiod");
        }
    }
    if (!isdefined(game.timepassed)) {
        game.timepassed = 0;
    }
    if (!isdefined(game.roundsplayed)) {
        game.roundsplayed = 0;
    }
    setroundsplayed(game.roundsplayed);
    if (!isdefined(game.roundwinner)) {
        game.roundwinner = [];
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
    level.skipvote = 0;
    level.gameended = 0;
    setdvar(#"g_gameended", 0);
    level.objidstart = 0;
    level.forcedend = 0;
    level.hostforcedend = 0;
    level.hardcoremode = getgametypesetting(#"hardcoremode");
    if (level.hardcoremode) {
        /#
            print("<dev string:xa8>");
        #/
        if (!isdefined(level.friendlyfiredelaytime)) {
            level.friendlyfiredelaytime = 0;
        }
    }
    level.rankcap = getdvarint(#"scr_max_rank", 0);
    level.minprestige = getdvarint(#"scr_min_prestige", 0);
    level.usestartspawns = 1;
    level.cumulativeroundscores = getgametypesetting(#"cumulativeroundscores");
    level.allowhitmarkers = getgametypesetting(#"allowhitmarkers");
    level.playerqueuedrespawn = getgametypesetting(#"playerqueuedrespawn");
    level.playerforcerespawn = getgametypesetting(#"playerforcerespawn");
    level.perksenabled = getgametypesetting(#"perksenabled");
    level.disableattachments = getgametypesetting(#"disableattachments");
    level.disabletacinsert = getgametypesetting(#"disabletacinsert");
    level.disablecac = getgametypesetting(#"disablecac");
    level.disableweapondrop = getgametypesetting(#"disableweapondrop");
    level.onlyheadshots = getgametypesetting(#"onlyheadshots");
    level.minimumallowedteamkills = getgametypesetting(#"teamkillpunishcount") - 1;
    level.teamkillreducedpenalty = getgametypesetting(#"teamkillreducedpenalty");
    level.teamkillpointloss = getgametypesetting(#"teamkillpointloss");
    level.teamkillspawndelay = getgametypesetting(#"teamkillspawndelay");
    level.deathpointloss = getgametypesetting(#"deathpointloss");
    level.leaderbonus = getgametypesetting(#"leaderbonus");
    level.forceradar = getgametypesetting(#"forceradar");
    level.playersprinttime = getgametypesetting(#"playersprinttime");
    level.bulletdamagescalar = getgametypesetting(#"bulletdamagescalar");
    level.playermaxhealth = getgametypesetting(#"playermaxhealth");
    level.playerhealthregentime = getgametypesetting(#"playerhealthregentime");
    level.playerrespawndelay = getgametypesetting(#"playerrespawndelay");
    level.playerobjectiveheldrespawndelay = getgametypesetting(#"playerobjectiveheldrespawndelay");
    level.waverespawndelay = getgametypesetting(#"waverespawndelay");
    level.spectatetype = getgametypesetting(#"spectatetype");
    level.voip = spawnstruct();
    level.voip.deadchatwithdead = getgametypesetting(#"voipdeadchatwithdead");
    level.voip.deadchatwithteam = getgametypesetting(#"voipdeadchatwithteam");
    level.voip.deadhearallliving = getgametypesetting(#"voipdeadhearallliving");
    level.voip.deadhearteamliving = getgametypesetting(#"voipdeadhearteamliving");
    level.voip.everyonehearseveryone = getgametypesetting(#"voipeveryonehearseveryone");
    level.voip.deadhearkiller = getgametypesetting(#"voipdeadhearkiller");
    level.voip.killershearvictim = getgametypesetting(#"voipkillershearvictim");
    callback::callback(#"on_start_gametype");
    level.prematchperiod = 0;
    level.persistentdatainfo = [];
    level.maxrecentstats = 10;
    level.maxhitlocations = 19;
    level.globalshotsfired = 0;
    thread hud_message::init();
    foreach (team, _ in level.teams) {
        initteamvariables(team);
    }
    level.maxplayercount = 0;
    level.activeplayers = [];
    level.allowannouncer = getgametypesetting(#"allowannouncer");
    if (!isdefined(level.timelimit)) {
        util::registertimelimit(1, 1440);
    }
    if (!isdefined(level.scorelimit)) {
        util::registerscorelimit(1, 500);
    }
    if (!isdefined(level.roundlimit)) {
        util::registerroundlimit(0, 10);
    }
    if (!isdefined(level.roundwinlimit)) {
        util::registerroundwinlimit(0, 10);
    }
    globallogic_utils::registerpostroundevent(&potm::post_round_potm);
    wavedelay = level.waverespawndelay;
    if (wavedelay) {
        foreach (team, _ in level.teams) {
            level.wavedelay[team] = wavedelay;
            level.lastwave[team] = 0;
        }
        level thread [[ level.wavespawntimer ]]();
    }
    level.inprematchperiod = 1;
    if (level.prematchperiod > 2) {
        level.prematchperiod += randomfloat(4) - 2;
    }
    if (level.numlives || anyteamhaswavedelay() || level.playerqueuedrespawn) {
        level.graceperiod = 15;
    } else {
        level.graceperiod = 5;
    }
    level.ingraceperiod = 1;
    level.roundenddelay = 5;
    level.halftimeroundenddelay = 3;
    globallogic_score::updateallteamscores();
    level.killstreaksenabled = 1;
    if (getdvarstring(#"scr_game_rankenabled") == "") {
        setdvar(#"scr_game_rankenabled", 1);
    }
    level.rankenabled = getdvarint(#"scr_game_rankenabled", 0);
    if (getdvarstring(#"scr_game_medalsenabled") == "") {
        setdvar(#"scr_game_medalsenabled", 1);
    }
    level.medalsenabled = getdvarint(#"scr_game_medalsenabled", 0);
    if (level.hardcoremode && level.rankedmatch && getdvarstring(#"scr_game_friendlyfiredelay") == "") {
        setdvar(#"scr_game_friendlyfiredelay", 1);
    }
    level.friendlyfiredelay = getdvarint(#"scr_game_friendlyfiredelay", 0);
    [[ level.onstartgametype ]]();
    if (getdvarint(#"custom_killstreak_mode", 0) == 1) {
        level.killstreaksenabled = 0;
    }
    level thread potm::play_potm(1);
    thread startgame();
    level thread updategametypedvars();
    level thread simple_hostmigration::updatehostmigrationdata();
    /#
        if (getdvarint(#"scr_writeconfigstrings", 0) == 1) {
            level.skipgameend = 1;
            level.roundlimit = 1;
            wait 1;
            thread forceend(0);
        }
        if (getdvarint(#"scr_hostmigrationtest", 0) == 1) {
            thread forcedebughostmigration();
        }
    #/
}

/#

    // Namespace globallogic/globallogic
    // Params 0, eflags: 0x0
    // Checksum 0x2004a5ba, Offset: 0x67a8
    // Size: 0x50
    function forcedebughostmigration() {
        while (true) {
            hostmigration::waittillhostmigrationdone();
            wait 60;
            starthostmigration();
            hostmigration::waittillhostmigrationdone();
        }
    }

#/

// Namespace globallogic/globallogic
// Params 4, eflags: 0x1 linked
// Checksum 0xf1517221, Offset: 0x6800
// Size: 0x116
function registerfriendlyfiredelay(dvarstring, defaultvalue, minvalue, maxvalue) {
    dvarstring = "scr_" + dvarstring + "_friendlyFireDelayTime";
    if (getdvarstring(dvarstring) == "") {
        setdvar(dvarstring, defaultvalue);
    }
    if (getdvarint(dvarstring, 0) > maxvalue) {
        setdvar(dvarstring, maxvalue);
    } else if (getdvarint(dvarstring, 0) < minvalue) {
        setdvar(dvarstring, minvalue);
    }
    level.friendlyfiredelaytime = getdvarint(dvarstring, 0);
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x0
// Checksum 0xdc1b5a98, Offset: 0x6920
// Size: 0x90
function checkroundswitch() {
    if (!isdefined(level.roundswitch) || !level.roundswitch) {
        return false;
    }
    if (!isdefined(level.onroundswitch)) {
        return false;
    }
    assert(game.roundsplayed > 0);
    if (game.roundsplayed % level.roundswitch == 0) {
        [[ level.onroundswitch ]]();
        return true;
    }
    return false;
}

// Namespace globallogic/globallogic
// Params 0, eflags: 0x1 linked
// Checksum 0x538844ce, Offset: 0x69b8
// Size: 0x64
function listenforgameend() {
    self endon(#"disconnect");
    self waittill(#"host_sucks_end_game");
    level.skipvote = 1;
    if (!level.gameended) {
        level thread forceend(1);
    }
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x0
// Checksum 0x3854bb85, Offset: 0x6a28
// Size: 0x124
function getkillstreaks(player) {
    for (killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++) {
        killstreak[killstreaknum] = "killstreak_null";
    }
    if (isplayer(player) && !level.oldschool && level.disablecac != 1 && !isbot(player) && isdefined(player.killstreak)) {
        currentkillstreak = 0;
        for (killstreaknum = 0; killstreaknum < level.maxkillstreaks; killstreaknum++) {
            if (isdefined(player.killstreak[killstreaknum])) {
                killstreak[currentkillstreak] = player.killstreak[killstreaknum];
                currentkillstreak++;
            }
        }
    }
    return killstreak;
}

// Namespace globallogic/globallogic
// Params 1, eflags: 0x1 linked
// Checksum 0xdcf5cb28, Offset: 0x6b58
// Size: 0x5c
function updaterankedmatch(winner) {
    if (level.rankedmatch) {
        if (hostidledout()) {
            level.hostforcedend = 1;
            /#
                print("<dev string:xbe>");
            #/
        }
    }
}

