#using scripts\abilities\mp\gadgets\gadget_concertina_wire;
#using scripts\abilities\mp\gadgets\gadget_smart_cover;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\contracts_shared;
#using scripts\core_common\demo_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\popups_shared;
#using scripts\core_common\potm_shared;
#using scripts\core_common\rank_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\sound_shared;
#using scripts\core_common\spawning_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\killstreaks\killstreaks_util;
#using scripts\mp_common\bb;
#using scripts\mp_common\challenges;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_defaults;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\hud_message;
#using scripts\mp_common\gametypes\match;
#using scripts\mp_common\gametypes\overtime;
#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\teams\teams;
#using scripts\mp_common\util;

#namespace ctf;

// Namespace ctf/ctf
// Params 0, eflags: 0x2
// Checksum 0x36bc9c78, Offset: 0x7e0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ctf", &__init__, undefined, undefined);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x9a2058fe, Offset: 0x828
// Size: 0x1b4
function __init__() {
    clientfield::register("scriptmover", "ctf_flag_away", 17000, 1, "int");
    clientfield::register("allplayers", "ctf_flag_carried", 17000, 1, "int");
    clientfield::register("worlduimodel", "CTFLevelInfo.bestTimeAllies", 17000, 9, "int");
    clientfield::register("worlduimodel", "CTFLevelInfo.bestTimeAxis", 17000, 9, "int");
    clientfield::register("worlduimodel", "CTFLevelInfo.flagCarrierAllies", 17000, 7, "int");
    clientfield::register("worlduimodel", "CTFLevelInfo.flagCarrierAxis", 17000, 7, "int");
    clientfield::register("worlduimodel", "CTFLevelInfo.flagStateAllies", 17000, 2, "int");
    clientfield::register("worlduimodel", "CTFLevelInfo.flagStateAxis", 17000, 2, "int");
    clientfield::register("worlduimodel", "ctf_reset_score", 17000, 1, "int");
}

// Namespace ctf/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x3f55c02, Offset: 0x9e8
// Size: 0x4b4
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registerroundswitch(0, 9);
    util::registernumlives(0, 100);
    util::registerscorelimit(0, 5000);
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.flagcapturecondition = getgametypesetting(#"flagcapturecondition");
    level.doubleovertime = 1;
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.overrideteamscore = 1;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.onprecachegametype = &onprecachegametype;
    player::function_cf3aa03d(&onplayerkilled);
    level.onendround = &onendround;
    level.onendgame = &onendgame;
    level.getteamkillpenalty = &ctf_getteamkillpenalty;
    level.getteamkillscore = &ctf_getteamkillscore;
    level.shouldplayovertimeround = &shouldplayovertimeround;
    level.ctfreturnflag = &returnflag;
    level.var_cdb8ae2c = &function_a8da260c;
    globallogic_spawn::addsupportedspawnpointtype("ctf");
    callback::on_connect(&onconnect);
    callback::on_joined_team(&onconnect);
    callback::on_joined_spectate(&onconnect);
    if (!isdefined(game.ctf_teamscore_cache)) {
        game.ctf_teamscore_cache[#"allies"] = 0;
        game.ctf_teamscore_cache[#"axis"] = 0;
    }
    level.var_537d7278 = [];
    level.var_537d7278[#"allies"] = spawnstruct();
    level.var_537d7278[#"allies"].friendly = #"p8_mp_flag_carry_1_blackops";
    level.var_537d7278[#"allies"].enemy = #"hash_1ad3d7548486082";
    level.var_537d7278[#"axis"] = spawnstruct();
    level.var_537d7278[#"axis"].friendly = #"hash_4ddde6545c52fa2f";
    level.var_537d7278[#"axis"].enemy = #"p8_mp_flag_carry_1_mercs";
    globallogic_audio::set_leader_gametype_dialog("startCtf", "hcStartCtf", "objCapture", "objCapture", "bbStartCtf", "hcbbStartCtf");
    level thread ctf_icon_hide();
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x86d00932, Offset: 0xea8
// Size: 0x5a
function onprecachegametype() {
    game.flag_dropped_sound = "mp_war_objective_lost";
    game.flag_recovered_sound = "mp_war_objective_taken";
    game.strings[#"score_limit_reached"] = #"hash_5218d2db23ab36aa";
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x5d870ac7, Offset: 0xf10
// Size: 0x1a8
function function_a8da260c() {
    spawning::place_spawn_points("mp_ctf_spawn_allies_start");
    spawning::place_spawn_points("mp_ctf_spawn_axis_start");
    spawning::add_spawn_points("sidea", "mp_ctf_spawn_allies");
    spawning::add_spawn_points("sideb", "mp_ctf_spawn_axis");
    spawning::add_fallback_spawnpoints("sidea", "mp_tdm_spawn");
    spawning::add_fallback_spawnpoints("sideb", "mp_tdm_spawn");
    spawning::updateallspawnpoints();
    spawning::update_fallback_spawnpoints();
    level.spawn_axis = spawning::get_spawnpoint_array("mp_ctf_spawn_axis");
    level.spawn_allies = spawning::get_spawnpoint_array("mp_ctf_spawn_allies");
    foreach (team, _ in level.teams) {
        spawning::add_start_spawn_points(team, "mp_ctf_spawn_" + team + "_start");
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x2a06d0c4, Offset: 0x10c0
// Size: 0x54
function function_b4530b39() {
    level endon(#"game_ended");
    while (game.state != "playing") {
        waitframe(1);
    }
    globallogic_audio::leader_dialog("sfgStartOvertime");
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x2bc30ae3, Offset: 0x1120
// Size: 0x244
function onstartgametype() {
    globallogic_score::resetteamscores();
    if (overtime::is_overtime_round()) {
        game.ctf_teamscore_cache[#"allies"] = game.ctf_teamscore_cache[#"allies"] + [[ level._getteamscore ]](#"allies");
        game.ctf_teamscore_cache[#"axis"] = game.ctf_teamscore_cache[#"axis"] + [[ level._getteamscore ]](#"axis");
        if (!isdefined(game.var_8f9c5645)) {
            game.var_8f9c5645[#"allies"] = 0;
            game.var_8f9c5645[#"axis"] = 0;
        }
        [[ level._setteamscore ]](#"allies", 0);
        [[ level._setteamscore ]](#"axis", 0);
        util::registerscorelimit(1, 1);
        if (isdefined(game.ctf_overtime_time_to_beat)) {
            util::registertimelimit(game.ctf_overtime_time_to_beat / 60000, game.ctf_overtime_time_to_beat / 60000);
        }
        thread function_b4530b39();
    }
    thread updategametypedvars();
    thread ctf();
    waitframe(1);
    if (game.roundsplayed > 0 && isdefined(level.scoreroundwinbased) && level.scoreroundwinbased) {
        level clientfield::set_world_uimodel("ctf_reset_score", !clientfield::get_world_uimodel("ctf_reset_score"));
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xbf428059, Offset: 0x1370
// Size: 0x80
function onconnect() {
    foreach (flag in level.flags) {
        flag function_ef8d5fb5();
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xe88b1d41, Offset: 0x13f8
// Size: 0x1d6
function shouldplayovertimeround() {
    if (overtime::is_overtime_round()) {
        if (game.overtime_round == 1 || !level.gameended) {
            return true;
        }
        return false;
    }
    if (!level.scoreroundwinbased) {
        if (game.stat[#"teamscores"][#"allies"] == game.stat[#"teamscores"][#"axis"] && (util::hitroundlimit() || game.stat[#"teamscores"][#"allies"] == level.scorelimit - 1)) {
            return true;
        }
    } else {
        alliesroundswon = util::getroundswon(#"allies");
        axisroundswon = util::getroundswon(#"axis");
        if (level.roundwinlimit > 0 && axisroundswon == level.roundwinlimit - 1 && alliesroundswon == level.roundwinlimit - 1) {
            return true;
        }
        if (util::hitroundlimit() && alliesroundswon == axisroundswon) {
            return true;
        }
    }
    return false;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x2a2c007e, Offset: 0x15d8
// Size: 0xd0
function minutesandsecondsstring(milliseconds) {
    minutes = floor(float(milliseconds) / 60000);
    milliseconds -= minutes * 60000;
    seconds = floor(float(milliseconds) / 1000);
    if (seconds < 10) {
        return (minutes + ":0" + seconds);
    }
    return minutes + ":" + seconds;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x8edeed83, Offset: 0x16b0
// Size: 0x248
function onendround(var_c1e98979) {
    winning_team = round::get_winning_team();
    if (round::get_flag("overtime")) {
        level clientfield::set_world_uimodel("CTFLevelInfo.bestTimeAllies", int(isdefined(game.var_8f9c5645[#"allies"]) ? game.var_8f9c5645[#"allies"] : 0));
        level clientfield::set_world_uimodel("CTFLevelInfo.bestTimeAxis", int(isdefined(game.var_8f9c5645[#"axis"]) ? game.var_8f9c5645[#"axis"] : 0));
        if (game.overtime_round < 2 && isdefined(winning_team) && !round::get_flag("tie")) {
            game.overtime_first_winner = winning_team;
            game.ctf_overtime_time_to_beat = globallogic_utils::gettimepassed();
        }
        return;
    }
    game.overtime_second_winner[#"ctf"] = winning_team;
    game.overtime_best_time[#"ctf"] = globallogic_utils::gettimepassed();
    globallogic_score::updateteamscorebyroundswon();
    if (winning_team === #"allies" || winning_team === #"axis") {
        [[ level._setteamscore ]](winning_team, game.stat[#"roundswon"][winning_team] + 1);
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xa5058025, Offset: 0x1900
// Size: 0xac
function updateteamscorebyflagscaptured() {
    if (level.scoreroundwinbased) {
        return;
    }
    foreach (team, _ in level.teams) {
        [[ level._setteamscore ]](team, [[ level._getteamscore ]](team) + game.ctf_teamscore_cache[team]);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x6e937e83, Offset: 0x19b8
// Size: 0x18c
function onendgame(var_c1e98979) {
    if (level.scoreroundwinbased) {
        globallogic_score::updateteamscorebyroundswon();
    } else {
        updateteamscorebyflagscaptured();
    }
    if (overtime::is_overtime_round()) {
        if (isdefined(game.overtime_first_winner)) {
            if (round::get_flag("tie")) {
                winningteam = game.overtime_first_winner;
            } else {
                winningteam = game.outcome.var_aefc8b8d.team;
            }
            if (game.overtime_first_winner == winningteam) {
                level.endvictoryreasontext = #"hash_7cafa946822ee652";
                level.enddefeatreasontext = #"hash_34d0ee5d4c21542d";
            } else {
                level.endvictoryreasontext = #"hash_7cafa946822ee652";
                level.enddefeatreasontext = #"hash_5235bbca93844647";
            }
        } else {
            winningteam = game.outcome.var_aefc8b8d.team;
        }
        winner = winningteam;
    } else {
        winner = match::function_6d0354e3();
    }
    match::function_af2e264f(winner);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xde238b7d, Offset: 0x1b50
// Size: 0x74
function onspawnplayer(predictedspawn) {
    self.isflagcarrier = 0;
    self.flagcarried = undefined;
    self clientfield::set("ctf_flag_carrier", 0);
    self clientfield::set("ctf_flag_carried", 0);
    spawning::onspawnplayer(predictedspawn);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xf9ad354a, Offset: 0x1bd0
// Size: 0x1b2
function updategametypedvars() {
    level.flagcapturetime = getgametypesetting(#"capturetime");
    level.flagtouchreturntime = getgametypesetting(#"defusetime");
    level.idleflagreturntime = getgametypesetting(#"idleflagresettime");
    level.flagrespawntime = getgametypesetting(#"flagrespawntime");
    level.enemycarriervisible = getgametypesetting(#"enemycarriervisible");
    level.roundlimit = getgametypesetting(#"roundlimit");
    level.cumulativeroundscores = getgametypesetting(#"cumulativeroundscores");
    level.teamkillpenaltymultiplier = getgametypesetting(#"teamkillpenalty");
    level.teamkillscoremultiplier = getgametypesetting(#"teamkillscore");
    if (level.flagtouchreturntime >= 0 && level.flagtouchreturntime != 63) {
        level.touchreturn = 1;
        return;
    }
    level.touchreturn = 0;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x3533811d, Offset: 0x1d90
// Size: 0x144
function function_ef8d5fb5() {
    self.visuals[0] setinvisibletoall();
    self.visuals[0] setvisibletoteam(#"allies");
    self.visuals[1] setinvisibletoall();
    self.visuals[1] setvisibletoteam(#"axis");
    if (isdefined(self.var_94885886)) {
        self.var_94885886 setinvisibletoall();
        self.var_94885886 setvisibletoteam(self.ctf_team);
    }
    if (isdefined(self.var_fa01a5fa)) {
        otherteam = util::get_enemy_team(self.ctf_team);
        self.var_fa01a5fa setinvisibletoall();
        self.var_fa01a5fa setvisibletoteam(otherteam);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x34e8eabf, Offset: 0x1ee0
// Size: 0x5ee
function createflag(trigger) {
    if (isdefined(trigger.target)) {
        visuals[0] = getent(trigger.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    visuals[1] = spawn("script_model", trigger.origin);
    visuals[1].angles = trigger.angles;
    entityteam = util::function_6f4ff113(trigger.script_team);
    visuals[0] setmodel(teams::get_flag_model(entityteam));
    visuals[0] setteam(entityteam);
    visuals[1] setmodel(teams::get_flag_model(entityteam) + "_alt");
    visuals[1] setteam(entityteam);
    flag = gameobjects::create_carry_object(entityteam, trigger, visuals, (0, 0, 100), entityteam + "_flag");
    flag gameobjects::set_team_use_time(#"friendly", level.flagtouchreturntime);
    flag gameobjects::set_team_use_time(#"enemy", level.flagcapturetime);
    flag gameobjects::allow_carry(#"enemy");
    flag gameobjects::set_visible_team(#"any");
    flag.var_22389d70 = 0;
    flag function_ef8d5fb5();
    if (!getdvarint(#"hash_3127d4491fda6ae0", 0)) {
        flag gameobjects::set_visible_carrier_model(teams::get_flag_carry_model(entityteam));
    }
    flag gameobjects::set_2d_icon(#"friendly", level.icondefend2d);
    flag gameobjects::set_3d_icon(#"friendly", level.icondefend3d);
    flag gameobjects::set_2d_icon(#"enemy", level.iconcapture2d);
    flag gameobjects::set_3d_icon(#"enemy", level.iconcapture3d);
    var_a319c814 = getgametypesetting(#"carrier_manualdrop");
    if (var_a319c814 === 1) {
        flag gameobjects::function_a8c842d6(1, 1);
    } else if (var_a319c814 === 2) {
        flag gameobjects::function_98c39cbc(1);
    }
    if (level.enemycarriervisible == 2) {
        flag.objidpingfriendly = 1;
    }
    if (getdvarint(#"hash_3127d4491fda6ae0", 0)) {
        flag.usetime = 0;
        flag.objectiveonvisuals = 1;
        flag.allowweapons = 0;
        flag.carryweapon = getweapon("ball");
        flag.keepcarryweapon = 1;
        flag.waterbadtrigger = 0;
        flag.disallowremotecontrol = 1;
        flag.disallowplaceablepickup = 1;
        flag.var_22389d70 = 0;
        flag.canuseobject = &function_a5f40b8e;
    } else {
        flag.allowweapons = 1;
        flag.identifier = #"hash_7044a4ac19b5324e";
    }
    flag.onpickup = &onpickup;
    flag.onpickupfailed = &onpickup;
    flag.ondrop = &ondrop;
    flag.onreset = &onreset;
    if (level.idleflagreturntime > 0) {
        flag.autoresettime = level.idleflagreturntime;
    } else {
        flag.autoresettime = undefined;
    }
    flag.var_ac304f56 = 1;
    return flag;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xe7a9b5a, Offset: 0x24d8
// Size: 0x200
function createflagzone(trigger) {
    visuals = [];
    entityteam = util::function_6f4ff113(trigger.script_team);
    flagzone = gameobjects::create_use_object(entityteam, trigger, visuals, (0, 0, 0), entityteam + "_base");
    flagzone gameobjects::allow_use(#"friendly");
    flagzone gameobjects::set_use_time(0);
    flagzone gameobjects::set_use_text(#"mp/capturing_flag");
    flagzone gameobjects::set_visible_team(#"friendly");
    enemyteam = util::getotherteam(entityteam);
    flagzone gameobjects::set_key_object(level.teamflags[enemyteam]);
    flagzone.onuse = &oncapture;
    flag = level.teamflags[entityteam];
    flag.flagbase = flagzone;
    flagzone.flag = flag;
    flagzone createflagspawninfluencer(entityteam);
    excludezone = spawn("trigger_radius", trigger.origin, 120);
    smart_cover::function_18f38647(excludezone);
    concertina_wire::function_18f38647(excludezone);
    return flagzone;
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xbaa9e6b0, Offset: 0x26e0
// Size: 0xc8
function createflaghint(team, origin) {
    radius = 128;
    height = 64;
    trigger = spawn("trigger_radius", origin, 0, radius, height);
    trigger sethintstring(#"hash_479e7adbf3e4f211");
    trigger setcursorhint("HINT_NOICON");
    trigger.original_origin = origin;
    trigger turn_off();
    return trigger;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x70d9735a, Offset: 0x27b0
// Size: 0x434
function ctf() {
    level.flags = [];
    level.teamflags = [];
    level.flagzones = [];
    level.teamflagzones = [];
    flag_triggers = getentarray("ctf_flag_pickup_trig", "targetname");
    if (!isdefined(flag_triggers) || flag_triggers.size != 2) {
        /#
            util::error("<dev string:x38>");
        #/
        return;
    }
    for (index = 0; index < flag_triggers.size; index++) {
        trigger = flag_triggers[index];
        flag = createflag(trigger);
        team = flag gameobjects::get_owner_team();
        flag.ctf_team = team;
        level.flags[level.flags.size] = flag;
        level.teamflags[team] = flag;
    }
    flag_zones = getentarray("ctf_flag_zone_trig", "targetname");
    if (!isdefined(flag_zones) || flag_zones.size != 2) {
        /#
            util::error("<dev string:x7c>");
        #/
        return;
    }
    for (index = 0; index < flag_zones.size; index++) {
        trigger = flag_zones[index];
        flagzone = createflagzone(trigger);
        team = flagzone gameobjects::get_owner_team();
        level.flagzones[level.flagzones.size] = flagzone;
        level.teamflagzones[team] = flagzone;
        level.flaghints[team] = createflaghint(team, trigger.origin);
        facing_angle = getdvarint(#"scr_ctf_spawnpointfacingangle", 0);
        setspawnpointsbaseweight(util::getotherteamsmask(team), trigger.origin, facing_angle, level.spawnsystem.objective_facing_bonus);
    }
    var_786a6f75 = getent("ctf_flag_allies_base", "targetname");
    if (isdefined(var_786a6f75)) {
        var_786a6f75.team = isdefined(game.switchedsides) && game.switchedsides ? #"axis" : #"allies";
        playfxontag("ui/fx8_ctf_flag_base_team", var_786a6f75, "tag_origin");
    }
    var_846ab111 = getent("ctf_flag_axis_base", "targetname");
    if (isdefined(var_846ab111)) {
        var_846ab111.team = isdefined(game.switchedsides) && game.switchedsides ? #"allies" : #"axis";
        playfxontag("ui/fx8_ctf_flag_base_team", var_846ab111, "tag_origin");
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x206b3107, Offset: 0x2bf0
// Size: 0x8c
function ctf_icon_hide() {
    level waittill(#"game_ended");
    level.teamflags[#"allies"] gameobjects::set_visible_team(#"none");
    level.teamflags[#"axis"] gameobjects::set_visible_team(#"none");
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xe420a297, Offset: 0x2c88
// Size: 0x9e
function removeinfluencers() {
    if (isdefined(self.spawn_influencer_enemy_carrier)) {
        self influencers::remove_influencer(self.spawn_influencer_enemy_carrier);
        self.spawn_influencer_enemy_carrier = undefined;
    }
    if (isdefined(self.spawn_influencer_friendly_carrier)) {
        self influencers::remove_influencer(self.spawn_influencer_friendly_carrier);
        self.spawn_influencer_friendly_carrier = undefined;
    }
    if (isdefined(self.spawn_influencer_dropped)) {
        self.trigger influencers::remove_influencers();
        self.spawn_influencer_dropped = undefined;
    }
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xa4489ee8, Offset: 0x2d30
// Size: 0x9a
function function_d1b40f6e(flagteam, var_f1930417) {
    switch (flagteam) {
    case #"allies":
        level clientfield::set_world_uimodel("CTFLevelInfo.flagStateAllies", var_f1930417);
        break;
    case #"axis":
    default:
        level clientfield::set_world_uimodel("CTFLevelInfo.flagStateAxis", var_f1930417);
        break;
    }
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xf785dd79, Offset: 0x2dd8
// Size: 0x132
function function_18d7960(flagteam, player) {
    entnum = int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1;
    if (isdefined(player)) {
        entnum = player getentitynumber();
    }
    switch (flagteam) {
    case #"allies":
        level clientfield::set_world_uimodel("CTFLevelInfo.flagCarrierAllies", entnum);
        break;
    case #"axis":
    default:
        level clientfield::set_world_uimodel("CTFLevelInfo.flagCarrierAxis", entnum);
        break;
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xc2030d47, Offset: 0x2f18
// Size: 0x674
function ondrop(player) {
    self gameobjects::set_flags(1);
    self gameobjects::set_owner_team(util::get_enemy_team(self.team));
    flag_allies = getplayers(self.team);
    foreach (var_ba17692e in flag_allies) {
        objective_setvisibletoplayer(self.objectiveid, var_ba17692e);
    }
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    function_18d7960(team, undefined);
    function_d1b40f6e(team, 1);
    if (isdefined(self.var_94885886)) {
        self.var_94885886 delete();
    }
    if (isdefined(self.var_fa01a5fa)) {
        self.var_fa01a5fa delete();
    }
    util::function_5a68c330(26, player.team, player getentitynumber());
    bb::function_95a5b5c2("ctf_flagdropped", undefined, team, self.origin);
    self.visuals[0] clientfield::set("ctf_flag_away", 1);
    self function_ef8d5fb5();
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"any");
        level.flaghints[otherteam] turn_off();
    }
    if (isdefined(player)) {
        util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_war_objective_lost");
        level thread popups::displayteammessagetoteam(#"hash_3118e621ec8d35b8", player, team, undefined, undefined);
        level thread popups::displayteammessagetoteam(#"hash_6730bd6c7d8d0567", player, otherteam, undefined, undefined);
    } else {
        util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_war_objective_lost");
    }
    globallogic_audio::leader_dialog("ctfFriendlyFlagDropped", team, undefined, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagDropped", otherteam, undefined, "ctf_flag_enemy");
    /#
        if (isdefined(player)) {
            print(team + "<dev string:xbe>");
        } else {
            print(team + "<dev string:xbe>");
        }
    #/
    if (isdefined(player)) {
        player playlocalsound(#"mpl_flag_drop_plr");
    }
    globallogic_audio::play_2d_on_team("mpl_flagdrop_sting_friend", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagdrop_sting_enemy", team);
    if (level.touchreturn) {
        self gameobjects::set_3d_icon(#"friendly", level.iconreturn3d);
        self gameobjects::set_2d_icon(#"friendly", level.iconreturn2d);
    } else {
        self gameobjects::set_3d_icon(#"friendly", level.icondropped3d);
        self gameobjects::set_2d_icon(#"friendly", level.icondropped2d);
    }
    self gameobjects::set_visible_team(#"any");
    self gameobjects::set_3d_icon(#"enemy", level.iconcapture3d);
    self gameobjects::set_2d_icon(#"enemy", level.iconcapture2d);
    thread sound::play_on_players(game.flag_dropped_sound, game.attackers);
    self removeinfluencers();
    if (isdefined(player)) {
        player removeinfluencers();
    }
    ss = level.spawnsystem;
    player_team_mask = util::getteammask(otherteam);
    enemy_team_mask = util::getteammask(team);
    self.spawn_influencer_dropped = self.trigger influencers::create_entity_influencer("ctf_flag_dropped", player_team_mask | enemy_team_mask);
    setinfluencertimeout(self.spawn_influencer_dropped, level.idleflagreturntime);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x2330866, Offset: 0x3598
// Size: 0xc66
function onpickup(player) {
    carrierkilledby = self.carrierkilledby;
    self.carrierkilledby = undefined;
    if (isdefined(self.spawn_influencer_dropped)) {
        self.trigger influencers::remove_influencers();
        self.spawn_influencer_dropped = undefined;
    }
    player stats::function_bb7eedf0(#"pickups", 1);
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"enemy");
    }
    self removeinfluencers();
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    if (isdefined(player) && player.pers[#"team"] == team) {
        self notify(#"picked_up");
        util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_obj_returned");
        if (isdefined(player.pers[#"returns"])) {
            player.pers[#"returns"]++;
            player.returns = player.pers[#"returns"];
        }
        if (isdefined(carrierkilledby) && carrierkilledby == player) {
            scoreevents::processscoreevent(#"flag_carrier_kill_return_close", player, undefined, undefined);
        } else if (distancesquared(self.trigger.baseorigin, player.origin) > 90000) {
            scoreevents::processscoreevent(#"flag_return", player, undefined, undefined);
        }
        demo::bookmark(#"event", gettime(), player);
        potm::bookmark(#"event", gettime(), player);
        player stats::function_bb7eedf0(#"returns", 1);
        level thread popups::displayteammessagetoteam(#"hash_347504f7414c2861", player, team, undefined, undefined);
        level thread popups::displayteammessagetoteam(#"hash_565752dc258425f0", player, otherteam, undefined, undefined);
        self.visuals[0] clientfield::set("ctf_flag_away", 0);
        self gameobjects::set_flags(0);
        self function_ef8d5fb5();
        bb::function_95a5b5c2("ctf_flagreturn", undefined, team, player.origin);
        player recordgameevent("return");
        [[ level.var_37d62931 ]](player, 1);
        self returnflag();
        /#
            if (isdefined(player)) {
                print(team + "<dev string:xce>");
            } else {
                print(team + "<dev string:xce>");
            }
        #/
        util::function_5a68c330(12, player.team, player getentitynumber());
        return;
    }
    bb::function_95a5b5c2("ctf_flagpickup", undefined, team, player.origin);
    player recordgameevent("pickup");
    util::function_5a68c330(9, player.team, player getentitynumber());
    scoreevents::processscoreevent(#"flag_grab", player, undefined, undefined);
    demo::bookmark(#"event", gettime(), player);
    potm::bookmark(#"event", gettime(), player);
    util::printandsoundoneveryone(otherteam, undefined, #"", undefined, "mp_obj_taken", "mp_enemy_obj_taken");
    level thread popups::displayteammessagetoteam(#"hash_6b94e754d048dae9", player, team, undefined, undefined);
    level thread popups::displayteammessagetoteam(#"hash_25ed0737f009ca72", player, otherteam, undefined, undefined);
    globallogic_audio::leader_dialog("ctfFriendlyFlagTaken", team, undefined, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagTaken", otherteam, undefined, "ctf_flag_enemy");
    player.isflagcarrier = 1;
    player.flagcarried = self;
    player playlocalsound(#"mpl_flag_pickup_plr");
    player clientfield::set("ctf_flag_carrier", 1);
    player clientfield::set("ctf_flag_carried", 1);
    self gameobjects::set_flags(0);
    self gameobjects::set_owner_team(util::get_enemy_team(self.team));
    function_18d7960(team, player);
    function_d1b40f6e(team, 2);
    var_beb30c2b = anglestoforward(player.angles) * -1;
    var_1ac1d901 = anglestoforward(player gettagangles("tag_stowed_back"));
    up = vectorcross(var_beb30c2b, var_1ac1d901);
    var_fb082d39 = axistoangles(var_1ac1d901, up * -1);
    self.var_94885886 = util::spawn_model(level.var_537d7278[team].friendly, player gettagorigin("tag_stowed_back"), var_fb082d39);
    self.var_94885886 setinvisibletoall();
    self.var_94885886 setvisibletoteam(team);
    self.var_94885886 setinvisibletoplayer(player);
    self.var_94885886 linkto(player, "tag_stowed_back");
    self.var_fa01a5fa = util::spawn_model(level.var_537d7278[team].enemy, player gettagorigin("tag_stowed_back"), var_fb082d39);
    self.var_fa01a5fa setinvisibletoall();
    self.var_fa01a5fa setvisibletoteam(otherteam);
    self.var_fa01a5fa setinvisibletoplayer(player);
    self.var_fa01a5fa linkto(player, "tag_stowed_back");
    flag_allies = getplayers(util::get_enemy_team(self.team));
    foreach (var_ba17692e in flag_allies) {
        objective_setinvisibletoplayer(self.objectiveid, var_ba17692e);
    }
    globallogic_audio::play_2d_on_team("mpl_flagget_sting_friend", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagget_sting_enemy", team);
    if (level.enemycarriervisible) {
        self gameobjects::set_visible_team(#"any");
    } else {
        self gameobjects::set_visible_team(#"enemy");
    }
    self gameobjects::set_2d_icon(#"friendly", level.iconkill2d);
    self gameobjects::set_3d_icon(#"friendly", level.iconkill3d);
    self gameobjects::set_2d_icon(#"enemy", level.iconescort2d);
    self gameobjects::set_3d_icon(#"enemy", level.iconescort3d);
    player thread claim_trigger(level.flaghints[otherteam]);
    update_hints();
    /#
        print(team + "<dev string:xdf>");
    #/
    ss = level.spawnsystem;
    player_team_mask = util::getteammask(otherteam);
    enemy_team_mask = util::getteammask(team);
    player.spawn_influencer_friendly_carrier = player influencers::create_entity_influencer("ctf_carrier_friendly", player_team_mask);
    player.spawn_influencer_enemy_carrier = player influencers::create_entity_influencer("ctf_carrier_enemy", enemy_team_mask);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xf6a13c3, Offset: 0x4208
// Size: 0x46
function onpickupmusicstate(player) {
    self endon(#"disconnect", #"death");
    wait 6;
    if (player.isflagcarrier) {
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xe50336f3, Offset: 0x4258
// Size: 0x38
function ishome() {
    if (isdefined(self.carrier)) {
        return false;
    }
    if (self.curorigin != self.trigger.baseorigin) {
        return false;
    }
    return true;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x40e350a3, Offset: 0x4298
// Size: 0x26c
function returnflag() {
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    function_18d7960(team, undefined);
    function_d1b40f6e(team, 0);
    globallogic_audio::play_2d_on_team("mpl_flagreturn_sting", team);
    globallogic_audio::play_2d_on_team("mpl_flagreturn_sting", otherteam);
    level.teamflagzones[otherteam] gameobjects::allow_use(#"friendly");
    level.teamflagzones[otherteam] gameobjects::set_visible_team(#"friendly");
    update_hints();
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"enemy");
    }
    self gameobjects::return_home();
    self gameobjects::set_visible_team(#"any");
    self gameobjects::set_3d_icon(#"friendly", level.icondefend3d);
    self gameobjects::set_2d_icon(#"friendly", level.icondefend2d);
    self gameobjects::set_3d_icon(#"enemy", level.iconcapture3d);
    self gameobjects::set_2d_icon(#"enemy", level.iconcapture2d);
    globallogic_audio::leader_dialog("ctfFriendlyFlagReturned", team, undefined, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagReturned", otherteam, undefined, "ctf_flag_enemy");
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x4f7d1761, Offset: 0x4510
// Size: 0x7ec
function oncapture(player) {
    team = player.pers[#"team"];
    enemyteam = util::getotherteam(team);
    time = gettime();
    playerteamsflag = level.teamflags[team];
    if (level.flagcapturecondition == 1 && playerteamsflag gameobjects::is_object_away_from_home()) {
        return;
    }
    if (overtime::is_overtime_round()) {
        besttime = int(float(globallogic_utils::gettimepassed()) / 1000);
        if ((isdefined(game.var_8f9c5645[team]) ? game.var_8f9c5645[team] : 0) != 0) {
            besttime = min(besttime, game.var_8f9c5645[team]);
        }
        game.var_8f9c5645[team] = besttime;
        [[ level._setteamscore ]](team, 1);
    }
    if (!isdefined(player.carryobject)) {
        return;
    }
    if (isdefined(player.carryobject.var_94885886)) {
        player.carryobject.var_94885886 delete();
    }
    if (isdefined(player.carryobject.var_fa01a5fa)) {
        player.carryobject.var_fa01a5fa delete();
    }
    util::printandsoundoneveryone(team, undefined, #"", undefined, "mp_obj_captured", "mp_enemy_obj_captured");
    bb::function_95a5b5c2("ctf_flagcapture", undefined, enemyteam, player.origin);
    game.challenge[team][#"capturedflag"] = 1;
    if (isdefined(player.pers[#"captures"])) {
        player.pers[#"captures"]++;
        player.captures = player.pers[#"captures"];
    }
    [[ level.var_37d62931 ]](player, 1);
    demo::bookmark(#"event", gettime(), player);
    potm::bookmark(#"event", gettime(), player);
    player stats::function_bb7eedf0(#"captures", 1);
    player stats::function_bb7eedf0(#"captures_in_capture_area", 1);
    player contracts::increment_contract(#"contract_mp_objective_capture");
    player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
    level thread popups::displayteammessagetoteam(#"hash_97b6e279104e355", player, team, undefined, undefined);
    level thread popups::displayteammessagetoteam(#"hash_352c694daa4f9440", player, enemyteam, undefined, undefined);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", enemyteam);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
    player giveflagcapturexp(player);
    /#
        print(enemyteam + "<dev string:xed>");
    #/
    flag = player.carryobject;
    player challenges::capturedobjective(time, flag.trigger);
    flag.dontannouncereturn = 1;
    flag gameobjects::return_home();
    flag gameobjects::set_owner_team(util::get_enemy_team(flag.team));
    flag.dontannouncereturn = undefined;
    flag_allies = getplayers(flag.team);
    foreach (var_ba17692e in flag_allies) {
        objective_setvisibletoplayer(flag.objectiveid, var_ba17692e);
    }
    otherteam = util::getotherteam(team);
    level.teamflags[otherteam] gameobjects::allow_carry(#"enemy");
    level.teamflags[otherteam] gameobjects::set_visible_team(#"any");
    level.teamflags[otherteam] gameobjects::return_home();
    level.teamflagzones[otherteam] gameobjects::allow_use(#"friendly");
    player.isflagcarrier = 0;
    player.flagcarried = undefined;
    player clientfield::set("ctf_flag_carrier", 0);
    player clientfield::set("ctf_flag_carried", 0);
    function_18d7960(enemyteam, undefined);
    function_d1b40f6e(team, 0);
    globallogic_score::giveteamscoreforobjective(team, 1);
    globallogic_audio::leader_dialog("ctfEnemyFlagCaptured", team, undefined, "ctf_flag_enemy");
    globallogic_audio::leader_dialog("ctfFriendlyFlagCaptured", enemyteam, undefined, "ctf_flag");
    flag removeinfluencers();
    player removeinfluencers();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xd2c1a36, Offset: 0x4d08
// Size: 0x8c
function giveflagcapturexp(player) {
    scoreevents::processscoreevent(#"flag_capture", player, undefined, undefined);
    player recordgameevent("capture");
    util::function_5a68c330(10, player.team, player getentitynumber());
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x78d0909f, Offset: 0x4da0
// Size: 0x214
function onreset() {
    update_hints();
    team = self gameobjects::get_owner_team();
    self gameobjects::set_3d_icon(#"friendly", level.icondefend3d);
    self gameobjects::set_2d_icon(#"friendly", level.icondefend2d);
    self gameobjects::set_3d_icon(#"enemy", level.iconcapture3d);
    self gameobjects::set_2d_icon(#"enemy", level.iconcapture2d);
    if (level.touchreturn) {
        self gameobjects::allow_carry(#"enemy");
        self.trigger triggerenable(1);
    }
    level.teamflagzones[team] gameobjects::set_visible_team(#"friendly");
    level.teamflagzones[team] gameobjects::allow_use(#"friendly");
    self.visuals[0] clientfield::set("ctf_flag_away", 0);
    self gameobjects::set_flags(0);
    function_d1b40f6e(team, 0);
    self function_ef8d5fb5();
    self removeinfluencers();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x1e0e9667, Offset: 0x4fc0
// Size: 0x40
function getotherflag(flag) {
    if (flag == level.flags[0]) {
        return level.flags[1];
    }
    return level.flags[0];
}

// Namespace ctf/ctf
// Params 9, eflags: 0x0
// Checksum 0x550b660c, Offset: 0x5008
// Size: 0x8dc
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(attacker) && isplayer(attacker)) {
        for (index = 0; index < level.flags.size; index++) {
            flagteam = "invalidTeam";
            inflagradius = 0;
            defendedflag = 0;
            offendedflag = 0;
            flagcarrier = level.flags[index].carrier;
            if (isdefined(flagcarrier)) {
                flagorigin = level.flags[index].carrier.origin;
                iscarried = 1;
                if (isplayer(attacker) && attacker.pers[#"team"] != self.pers[#"team"]) {
                    if (isdefined(level.flags[index].carrier.attackerdata)) {
                        if (level.flags[index].carrier != attacker) {
                            if (isdefined(level.flags[index].carrier.attackerdata[self.clientid])) {
                                scoreevents::processscoreevent(#"rescue_flag_carrier", attacker, undefined, weapon);
                            }
                        }
                    }
                }
            } else {
                flagorigin = level.flags[index].curorigin;
                iscarried = 0;
            }
            dist = distance2dsquared(self.origin, flagorigin);
            if (dist < level.defaultoffenseradiussq) {
                inflagradius = 1;
                if (level.flags[index].ctf_team == attacker.pers[#"team"]) {
                    defendedflag = 1;
                } else {
                    offendedflag = 1;
                }
            }
            dist = distance2dsquared(attacker.origin, flagorigin);
            if (dist < level.defaultoffenseradiussq) {
                inflagradius = 1;
                if (level.flags[index].ctf_team == attacker.pers[#"team"]) {
                    defendedflag = 1;
                } else {
                    offendedflag = 1;
                }
            }
            if (inflagradius && isplayer(attacker) && attacker.pers[#"team"] != self.pers[#"team"]) {
                attacker challenges::function_82bb78f7(weapon);
                attacker.pers[#"objectiveekia"]++;
                attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                if (defendedflag) {
                    if (isdefined(self.isflagcarrier) && self.isflagcarrier) {
                        scoreevents::processscoreevent(#"kill_flag_carrier", attacker, undefined, weapon);
                        attacker stats::function_dad108fa(#"kill_carrier", 1);
                    } else {
                        scoreevents::processscoreevent(#"killed_attacker", attacker, undefined, weapon);
                    }
                    self recordkillmodifier("assaulting");
                }
                if (offendedflag) {
                    if (iscarried == 1) {
                        if (isdefined(flagcarrier) && attacker == flagcarrier) {
                            scoreevents::processscoreevent(#"killed_enemy_while_carrying_flag", attacker, undefined, weapon);
                        } else {
                            scoreevents::processscoreevent(#"defend_flag_carrier", attacker, undefined, weapon);
                            attacker stats::function_dad108fa(#"defend_carrier", 1);
                        }
                    } else {
                        scoreevents::processscoreevent(#"killed_defender", attacker, undefined, weapon);
                    }
                    self recordkillmodifier("defending");
                }
            }
        }
        victim = self;
        foreach (flag_zone in level.flagzones) {
            if (isdefined(attacker.team) && attacker != victim && isdefined(victim.team)) {
                dist_to_zone_origin = distance2dsquared(attacker.origin, flag_zone.origin);
                victim_dist_to_zone_origin = distance2dsquared(victim.origin, flag_zone.origin);
                if (victim_dist_to_zone_origin < level.defaultoffenseradiussq || dist_to_zone_origin < level.defaultoffenseradiussq) {
                    if (victim.team == flag_zone.team) {
                        attacker thread challenges::killedbasedefender(flag_zone.trigger);
                        continue;
                    }
                    attacker thread challenges::killedbaseoffender(flag_zone.trigger, weapon);
                }
            }
        }
    }
    if (!isdefined(self.isflagcarrier) || !self.isflagcarrier) {
        return;
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker.pers[#"team"] != self.pers[#"team"]) {
        if (isdefined(self.flagcarried)) {
            for (index = 0; index < level.flags.size; index++) {
                currentflag = level.flags[index];
                if (currentflag.ctf_team == self.team) {
                    if (currentflag.curorigin == currentflag.trigger.baseorigin) {
                        dist = distance2dsquared(self.origin, currentflag.curorigin);
                        if (dist < level.defaultoffenseradiussq) {
                            self.flagcarried.carrierkilledby = attacker;
                            break;
                        }
                    }
                }
            }
        }
        attacker recordgameevent("kill_carrier");
        self recordkillmodifier("carrying");
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x147724c4, Offset: 0x58f0
// Size: 0x22
function turn_on() {
    if (level.hardcoremode) {
        return;
    }
    self.origin = self.original_origin;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x7b4888c9, Offset: 0x5920
// Size: 0x3a
function turn_off() {
    self.origin = (self.original_origin[0], self.original_origin[1], self.original_origin[2] - 10000);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xbefb224f, Offset: 0x5968
// Size: 0x164
function update_hints() {
    allied_flag = level.teamflags[#"allies"];
    axis_flag = level.teamflags[#"axis"];
    if (!level.touchreturn) {
        return;
    }
    if (isdefined(allied_flag.carrier) && axis_flag gameobjects::is_object_away_from_home()) {
        level.flaghints[#"axis"] turn_on();
    } else {
        level.flaghints[#"axis"] turn_off();
    }
    if (isdefined(axis_flag.carrier) && allied_flag gameobjects::is_object_away_from_home()) {
        level.flaghints[#"allies"] turn_on();
        return;
    }
    level.flaghints[#"allies"] turn_off();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x1ce0356f, Offset: 0x5ad8
// Size: 0x64
function claim_trigger(trigger) {
    self endon(#"disconnect");
    self clientclaimtrigger(trigger);
    self waittill(#"drop_object");
    self clientreleasetrigger(trigger);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xd82ced33, Offset: 0x5b48
// Size: 0xda
function createflagspawninfluencer(entityteam) {
    otherteam = util::getotherteam(entityteam);
    team_mask = util::getteammask(entityteam);
    other_team_mask = util::getteammask(otherteam);
    self.spawn_influencer_friendly = self influencers::create_influencer("ctf_base_friendly", self.trigger.origin, team_mask);
    self.spawn_influencer_enemy = self influencers::create_influencer("ctf_base_friendly", self.trigger.origin, other_team_mask);
}

// Namespace ctf/ctf
// Params 4, eflags: 0x0
// Checksum 0xf5abfa53, Offset: 0x5c30
// Size: 0x80
function ctf_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_penalty = globallogic_defaults::default_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon);
    if (isdefined(self.isflagcarrier) && self.isflagcarrier) {
        teamkill_penalty *= level.teamkillpenaltymultiplier;
    }
    return teamkill_penalty;
}

// Namespace ctf/ctf
// Params 4, eflags: 0x0
// Checksum 0x6a4e79ab, Offset: 0x5cb8
// Size: 0x92
function ctf_getteamkillscore(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_score = attacker rank::getscoreinfovalue("kill");
    if (isdefined(self.isflagcarrier) && self.isflagcarrier) {
        teamkill_score *= level.teamkillscoremultiplier;
    }
    return int(teamkill_score);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x47e5da2d, Offset: 0x5d58
// Size: 0x37e
function function_a5f40b8e(player) {
    if (!isdefined(player)) {
        return false;
    }
    if (isdefined(self.droptime) && self.droptime >= gettime()) {
        return false;
    }
    if (isdefined(player.resurrect_weapon) && player getcurrentweapon() == player.resurrect_weapon) {
        return false;
    }
    if (player iscarryingturret()) {
        return false;
    }
    currentweapon = player getcurrentweapon();
    if (isdefined(currentweapon)) {
        if (!function_da0a9f3c(currentweapon)) {
            return false;
        }
    }
    nextweapon = player.changingweapon;
    if (isdefined(nextweapon) && player isswitchingweapons()) {
        if (!function_da0a9f3c(nextweapon)) {
            return false;
        }
    }
    if (player player_no_pickup_time()) {
        return false;
    }
    flag = self.visuals[0];
    thresh = 15;
    dist2 = distance2dsquared(flag.origin, player.origin);
    if (dist2 < thresh * thresh) {
        return true;
    }
    start = player geteye();
    end = (self.curorigin[0], self.curorigin[1], self.curorigin[2] + 5);
    if (isdefined(flag)) {
        end = (flag.origin[0], flag.origin[1], flag.origin[2] + 5);
    }
    if (isdefined(self.carrier) && isplayer(self.carrier)) {
        end = self.carrier geteye();
    }
    first_skip_ent = flag;
    second_skip_ent = flag;
    if (isdefined(self.projectile)) {
        first_skip_ent = self.projectile;
    }
    if (isdefined(self.lastprojectile)) {
        second_skip_ent = self.lastprojectile;
    }
    if (!bullettracepassed(end, start, 0, first_skip_ent, second_skip_ent, 0, 0)) {
        player_origin = (player.origin[0], player.origin[1], player.origin[2] + 10);
        if (!bullettracepassed(end, player_origin, 0, first_skip_ent, second_skip_ent, 0, 0)) {
            return false;
        }
    }
    return true;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x413676a8, Offset: 0x60e0
// Size: 0x6e
function function_da0a9f3c(weapon) {
    if (weapon == level.weaponnone) {
        return false;
    }
    if (weapon == getweapon("ball")) {
        return false;
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        return false;
    }
    return true;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xac1e0ec5, Offset: 0x6158
// Size: 0x1c
function player_no_pickup_time() {
    return isdefined(self.nopickuptime) && self.nopickuptime > gettime();
}

