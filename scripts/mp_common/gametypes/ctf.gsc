// Atian COD Tools GSC decompiler test
#include scripts/abilities/mp/gadgets/gadget_smart_cover.gsc;
#include scripts/abilities/mp/gadgets/gadget_concertina_wire.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/teams/teams.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/overtime.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/hud_message.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_defaults.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/mp_common/challenges.gsc;
#include scripts/mp_common/bb.gsc;
#include scripts/killstreaks/killstreaks_util.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/sound_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/rank_shared.gsc;
#include scripts/core_common/potm_shared.gsc;
#include scripts/core_common/popups_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/influencers_shared.gsc;
#include scripts/core_common/hud_util_shared.gsc;
#include scripts/core_common/hud_message_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/demo_shared.gsc;
#include scripts/core_common/contracts_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

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
function event<gametype_init> main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registerroundswitch(0, 9);
    util::registernumlives(0, 100);
    util::registerscorelimit(0, 5000);
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.var_cdb4af94 = getgametypesetting(#"hash_45b80b22c4dc71e8");
    level.doubleovertime = 1;
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.overrideteamscore = 1;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.onprecachegametype = &onprecachegametype;
    player::function_cf3aa03d(&onplayerkilled);
    level.onendround = &onendround;
    level.onendgame = &onendgame;
    level.getteamkillpenalty = &function_e974abae;
    level.getteamkillscore = &function_ea20dd87;
    level.shouldplayovertimeround = &shouldplayovertimeround;
    level.var_e6060db3 = &function_bfc70f32;
    level.var_cdb8ae2c = &function_a8da260c;
    globallogic_spawn::addsupportedspawnpointtype("ctf");
    callback::on_connect(&onconnect);
    callback::on_joined_team(&onconnect);
    callback::on_joined_spectate(&onconnect);
    if (!isdefined(game.var_b8d7edb8)) {
        game.var_b8d7edb8[#"allies"] = 0;
        game.var_b8d7edb8[#"axis"] = 0;
    }
    level.var_537d7278 = [];
    level.var_537d7278[#"allies"] = spawnstruct();
    level.var_537d7278[#"allies"].friendly = #"p8_mp_flag_carry_1_blackops";
    level.var_537d7278[#"allies"].enemy = #"hash_1ad3d7548486082";
    level.var_537d7278[#"axis"] = spawnstruct();
    level.var_537d7278[#"axis"].friendly = #"hash_4ddde6545c52fa2f";
    level.var_537d7278[#"axis"].enemy = #"p8_mp_flag_carry_1_mercs";
    globallogic_audio::set_leader_gametype_dialog("startCtf", "hcStartCtf", "objCapture", "objCapture", "bbStartCtf", "hcbbStartCtf");
    level thread function_4f0bc14c();
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x86d00932, Offset: 0xea8
// Size: 0x5a
function onprecachegametype() {
    game.var_a4a1a3a3 = "mp_war_objective_lost";
    game.var_87ffb023 = "mp_war_objective_taken";
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
    level.var_35a2a1f7 = spawning::get_spawnpoint_array("mp_ctf_spawn_axis");
    level.var_5f4665a6 = spawning::get_spawnpoint_array("mp_ctf_spawn_allies");
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
        game.var_b8d7edb8[#"allies"] = game.var_b8d7edb8[#"allies"] + [[ level._getteamscore ]](#"allies");
        game.var_b8d7edb8[#"axis"] = game.var_b8d7edb8[#"axis"] + [[ level._getteamscore ]](#"axis");
        if (!isdefined(game.var_8f9c5645)) {
            game.var_8f9c5645[#"allies"] = 0;
            game.var_8f9c5645[#"axis"] = 0;
        }
        [[ level._setteamscore ]](#"allies", 0);
        [[ level._setteamscore ]](#"axis", 0);
        util::registerscorelimit(1, 1);
        if (isdefined(game.var_8f97f102)) {
            util::registertimelimit(game.var_8f97f102 / 60000, game.var_8f97f102 / 60000);
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
            return 1;
        }
        return 0;
    }
    if (!level.scoreroundwinbased) {
        if (game.stat[#"teamscores"][#"allies"] == game.stat[#"teamscores"][#"axis"] && (util::hitroundlimit() || game.stat[#"teamscores"][#"allies"] == level.scorelimit - 1)) {
            return 1;
        }
    } else {
        alliesroundswon = util::getroundswon(#"allies");
        axisroundswon = util::getroundswon(#"axis");
        if (level.roundwinlimit > 0 && axisroundswon == level.roundwinlimit - 1 && alliesroundswon == level.roundwinlimit - 1) {
            return 1;
        }
        if (util::hitroundlimit() && alliesroundswon == axisroundswon) {
            return 1;
        }
    }
    return 0;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x2a2c007e, Offset: 0x15d8
// Size: 0xd0
function minutesandsecondsstring(milliseconds) {
    minutes = floor(float(milliseconds) / 60000);
    milliseconds = milliseconds - minutes * 60000;
    seconds = floor(float(milliseconds) / 1000);
    if (seconds < 10) {
        return (minutes + ":0" + seconds);
    } else {
        return (minutes + ":" + seconds);
    }
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
            game.var_8f97f102 = globallogic_utils::gettimepassed();
        }
    } else {
        game.var_b329303a[#"ctf"] = winning_team;
        game.overtime_best_time[#"ctf"] = globallogic_utils::gettimepassed();
        globallogic_score::updateteamscorebyroundswon();
        if (winning_team === #"allies" || winning_team === #"axis") {
            [[ level._setteamscore ]](winning_team, game.stat[#"roundswon"][winning_team] + 1);
        }
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xa5058025, Offset: 0x1900
// Size: 0xac
function function_150411d6() {
    if (level.scoreroundwinbased) {
        return;
    }
    foreach (team, _ in level.teams) {
        [[ level._setteamscore ]](team, [[ level._getteamscore ]](team) + game.var_b8d7edb8[team]);
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
        function_150411d6();
    }
    if (overtime::is_overtime_round()) {
        if (isdefined(game.overtime_first_winner)) {
            if (round::get_flag("tie")) {
                winningteam = game.overtime_first_winner;
            } else {
                winningteam = game.outcome.var_aefc8b8d.team;
            }
            if (game.overtime_first_winner == winningteam) {
                level.var_e99b5b1a = #"hash_7cafa946822ee652";
                level.var_d6f851ca = #"hash_34d0ee5d4c21542d";
            } else {
                level.var_e99b5b1a = #"hash_7cafa946822ee652";
                level.var_d6f851ca = #"hash_5235bbca93844647";
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
    self.var_915d1726 = 0;
    self.var_34c3d626 = undefined;
    self clientfield::set("ctf_flag_carrier", 0);
    self clientfield::set("ctf_flag_carried", 0);
    spawning::onspawnplayer(predictedspawn);
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xf9ad354a, Offset: 0x1bd0
// Size: 0x1b2
function updategametypedvars() {
    level.var_90e3f42e = getgametypesetting(#"capturetime");
    level.var_fea712d3 = getgametypesetting(#"defusetime");
    level.var_4d8f5ed1 = getgametypesetting(#"hash_18d6868839108361");
    level.var_c1e20882 = getgametypesetting(#"hash_4b900e7272befb4c");
    level.var_891a40be = getgametypesetting(#"hash_2c5c31373530028d");
    level.roundlimit = getgametypesetting(#"roundlimit");
    level.cumulativeroundscores = getgametypesetting(#"cumulativeroundscores");
    level.teamkillpenaltymultiplier = getgametypesetting(#"teamkillpenalty");
    level.teamkillscoremultiplier = getgametypesetting(#"teamkillscore");
    if (level.var_fea712d3 >= 0 && level.var_fea712d3 != 63) {
        level.var_cee83d02 = 1;
    } else {
        level.var_cee83d02 = 0;
    }
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
        self.var_94885886 setvisibletoteam(self.var_f4496288);
    }
    if (isdefined(self.var_fa01a5fa)) {
        otherteam = util::get_enemy_team(self.var_f4496288);
        self.var_fa01a5fa setinvisibletoall();
        self.var_fa01a5fa setvisibletoteam(otherteam);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x34e8eabf, Offset: 0x1ee0
// Size: 0x5ee
function function_78b91dee(trigger) {
    if (isdefined(trigger.target)) {
        visuals[0] = getent(trigger.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    visuals[1] = spawn("script_model", trigger.origin);
    visuals[1].angles = trigger.angles;
    var_9319ad28 = util::function_6f4ff113(trigger.script_team);
    visuals[0] setmodel(teams::get_flag_model(var_9319ad28));
    visuals[0] setteam(var_9319ad28);
    visuals[1] setmodel(teams::get_flag_model(var_9319ad28) + "_alt");
    visuals[1] setteam(var_9319ad28);
    flag = gameobjects::create_carry_object(var_9319ad28, trigger, visuals, vectorscale((0, 0, 1), 100), var_9319ad28 + "_flag");
    flag gameobjects::set_team_use_time(#"friendly", level.var_fea712d3);
    flag gameobjects::set_team_use_time(#"enemy", level.var_90e3f42e);
    flag gameobjects::allow_carry(#"enemy");
    flag gameobjects::set_visible_team(#"any");
    flag.var_22389d70 = 0;
    flag function_ef8d5fb5();
    if (!getdvarint(#"hash_3127d4491fda6ae0", 0)) {
        flag gameobjects::set_visible_carrier_model(teams::get_flag_carry_model(var_9319ad28));
    }
    flag gameobjects::set_2d_icon(#"friendly", level.var_f1e6ac62);
    flag gameobjects::set_3d_icon(#"friendly", level.var_3ee1d113);
    flag gameobjects::set_2d_icon(#"enemy", level.var_3ca10658);
    flag gameobjects::set_3d_icon(#"enemy", level.var_9bf80f85);
    var_a319c814 = getgametypesetting(#"carrier_manualdrop");
    if (var_a319c814 === 1) {
        flag gameobjects::function_a8c842d6(1, 1);
    } else if (var_a319c814 === 2) {
        flag gameobjects::function_98c39cbc(1);
    }
    if (level.var_891a40be == 2) {
        flag.objidpingfriendly = 1;
    }
    if (getdvarint(#"hash_3127d4491fda6ae0", 0)) {
        flag.usetime = 0;
        flag.objectiveonvisuals = 1;
        flag.allowweapons = 0;
        flag.carryweapon = getweapon("ball");
        flag.var_f11eac25 = 1;
        flag.var_2b73f1d1 = 0;
        flag.disallowremotecontrol = 1;
        flag.disallowplaceablepickup = 1;
        flag.var_22389d70 = 0;
        flag.var_56ffb77d = &function_a5f40b8e;
    } else {
        flag.allowweapons = 1;
        flag.identifier = #"hash_7044a4ac19b5324e";
    }
    flag.onpickup = &onpickup;
    flag.var_ef52fbcb = &onpickup;
    flag.ondrop = &ondrop;
    flag.onreset = &onreset;
    if (level.var_4d8f5ed1 > 0) {
        flag.autoresettime = level.var_4d8f5ed1;
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
function function_b4c4546c(trigger) {
    visuals = [];
    var_9319ad28 = util::function_6f4ff113(trigger.script_team);
    var_c6deaca8 = gameobjects::create_use_object(var_9319ad28, trigger, visuals, (0, 0, 0), var_9319ad28 + "_base");
    var_c6deaca8 gameobjects::allow_use(#"friendly");
    var_c6deaca8 gameobjects::set_use_time(0);
    var_c6deaca8 gameobjects::set_use_text(#"hash_12e5f9d3793fc759");
    var_c6deaca8 gameobjects::set_visible_team(#"friendly");
    enemyteam = util::getotherteam(var_9319ad28);
    var_c6deaca8 gameobjects::set_key_object(level.var_da8cca54[enemyteam]);
    var_c6deaca8.onuse = &function_d1b86895;
    flag = level.var_da8cca54[var_9319ad28];
    flag.var_dedfef99 = var_c6deaca8;
    var_c6deaca8.flag = flag;
    var_c6deaca8 function_54b71f54(var_9319ad28);
    var_e68cc7ba = spawn("trigger_radius", trigger.origin, 120);
    smart_cover::function_18f38647(var_e68cc7ba);
    concertina_wire::function_18f38647(var_e68cc7ba);
    return var_c6deaca8;
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xbaa9e6b0, Offset: 0x26e0
// Size: 0xc8
function function_7628356f(team, origin) {
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
    level.var_da8cca54 = [];
    level.var_3409813e = [];
    level.var_2df39db0 = [];
    var_2125b0ba = getentarray("ctf_flag_pickup_trig", "targetname");
    if (!isdefined(var_2125b0ba) || var_2125b0ba.size != 2) {
        /#
            util::error("mpl_flagdrop_sting_friend");
        #/
        return;
    }
    for (index = 0; index < var_2125b0ba.size; index++) {
        trigger = var_2125b0ba[index];
        flag = function_78b91dee(trigger);
        team = flag gameobjects::get_owner_team();
        flag.var_f4496288 = team;
        level.flags[level.flags.size] = flag;
        level.var_da8cca54[team] = flag;
    }
    var_40ddb922 = getentarray("ctf_flag_zone_trig", "targetname");
    if (!isdefined(var_40ddb922) || var_40ddb922.size != 2) {
        /#
            util::error("<unknown string>");
        #/
        return;
    }
    for (index = 0; index < var_40ddb922.size; index++) {
        trigger = var_40ddb922[index];
        var_c6deaca8 = function_b4c4546c(trigger);
        team = var_c6deaca8 gameobjects::get_owner_team();
        level.var_3409813e[level.var_3409813e.size] = var_c6deaca8;
        level.var_2df39db0[team] = var_c6deaca8;
        level.var_75ea597f[team] = function_7628356f(team, trigger.origin);
        var_1cc4e917 = getdvarint(#"hash_4ad52544e80d5704", 0);
        setspawnpointsbaseweight(util::getotherteamsmask(team), trigger.origin, var_1cc4e917, level.spawnsystem.objective_facing_bonus);
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
function function_4f0bc14c() {
    level waittill(#"game_ended");
    level.var_da8cca54[#"allies"] gameobjects::set_visible_team(#"none");
    level.var_da8cca54[#"axis"] gameobjects::set_visible_team(#"none");
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xe420a297, Offset: 0x2c88
// Size: 0x9e
function function_575d9e89() {
    if (isdefined(self.var_1100ba09)) {
        self influencers::remove_influencer(self.var_1100ba09);
        self.var_1100ba09 = undefined;
    }
    if (isdefined(self.var_167e7924)) {
        self influencers::remove_influencer(self.var_167e7924);
        self.var_167e7924 = undefined;
    }
    if (isdefined(self.var_3f705da6)) {
        self.trigger influencers::remove_influencers();
        self.var_3f705da6 = undefined;
    }
}

// Namespace ctf/ctf
// Params 2, eflags: 0x0
// Checksum 0xa4489ee8, Offset: 0x2d30
// Size: 0x9a
function function_d1b40f6e(var_60cb3923, var_f1930417) {
    switch (var_60cb3923) {
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
function function_18d7960(var_60cb3923, player) {
    entnum = int(min(getdvarint(#"com_maxclients", 0), pow(2, 7))) - 1;
    if (isdefined(player)) {
        entnum = player getentitynumber();
    }
    switch (var_60cb3923) {
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
    var_1d711e07 = getplayers(self.team);
    foreach (var_ba17692e in var_1d711e07) {
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
    if (level.var_cee83d02) {
        self gameobjects::allow_carry(#"any");
        level.var_75ea597f[otherteam] turn_off();
    }
    if (isdefined(player)) {
        util::printandsoundoneveryone(team, undefined, #"hash_0", undefined, "mp_war_objective_lost");
        level thread popups::displayteammessagetoteam(#"hash_3118e621ec8d35b8", player, team, undefined, undefined);
        level thread popups::displayteammessagetoteam(#"hash_6730bd6c7d8d0567", player, otherteam, undefined, undefined);
    } else {
        util::printandsoundoneveryone(team, undefined, #"hash_0", undefined, "mp_war_objective_lost");
    }
    globallogic_audio::leader_dialog("ctfFriendlyFlagDropped", team, undefined, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagDropped", otherteam, undefined, "ctf_flag_enemy");
    /#
        if (isdefined(player)) {
            print(team + "<unknown string>");
        } else {
            print(team + "<unknown string>");
        }
    #/
    if (isdefined(player)) {
        player playlocalsound(#"hash_53a38d24fb65f1cc");
    }
    globallogic_audio::play_2d_on_team("mpl_flagdrop_sting_friend", otherteam);
    globallogic_audio::play_2d_on_team("mpl_flagdrop_sting_enemy", team);
    if (level.var_cee83d02) {
        self gameobjects::set_3d_icon(#"friendly", level.var_f12fdcf0);
        self gameobjects::set_2d_icon(#"friendly", level.var_1c4db203);
    } else {
        self gameobjects::set_3d_icon(#"friendly", level.var_2cd17752);
        self gameobjects::set_2d_icon(#"friendly", level.var_6bb45f03);
    }
    self gameobjects::set_visible_team(#"any");
    self gameobjects::set_3d_icon(#"enemy", level.var_9bf80f85);
    self gameobjects::set_2d_icon(#"enemy", level.var_3ca10658);
    thread sound::play_on_players(game.var_a4a1a3a3, game.attackers);
    self function_575d9e89();
    if (isdefined(player)) {
        player function_575d9e89();
    }
    ss = level.spawnsystem;
    var_6c94cc3d = util::getteammask(otherteam);
    var_7b6db33f = util::getteammask(team);
    self.var_3f705da6 = self.trigger influencers::create_entity_influencer("ctf_flag_dropped", var_6c94cc3d | var_7b6db33f);
    setinfluencertimeout(self.var_3f705da6, level.var_4d8f5ed1);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x2330866, Offset: 0x3598
// Size: 0xc66
function onpickup(player) {
    var_4708fae7 = self.var_4708fae7;
    self.var_4708fae7 = undefined;
    if (isdefined(self.var_3f705da6)) {
        self.trigger influencers::remove_influencers();
        self.var_3f705da6 = undefined;
    }
    player stats::function_bb7eedf0(#"pickups", 1);
    if (level.var_cee83d02) {
        self gameobjects::allow_carry(#"enemy");
    }
    self function_575d9e89();
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    if (isdefined(player) && player.pers[#"team"] == team) {
        self notify(#"picked_up");
        util::printandsoundoneveryone(team, undefined, #"hash_0", undefined, "mp_obj_returned");
        if (isdefined(player.pers[#"returns"])) {
            player.pers[#"returns"]++;
            player.returns = player.pers[#"returns"];
        }
        if (isdefined(var_4708fae7) && var_4708fae7 == player) {
            scoreevents::processscoreevent(#"hash_1892efd595c90bf3", player, undefined, undefined);
        } else if (distancesquared(self.trigger.baseorigin, player.origin) > 90000) {
            scoreevents::processscoreevent(#"hash_7f156b04645795ae", player, undefined, undefined);
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
        self function_bfc70f32();
        /#
            if (isdefined(player)) {
                print(team + "<unknown string>");
            } else {
                print(team + "<unknown string>");
            }
        #/
        util::function_5a68c330(12, player.team, player getentitynumber());
        return;
    } else {
        bb::function_95a5b5c2("ctf_flagpickup", undefined, team, player.origin);
        player recordgameevent("pickup");
        util::function_5a68c330(9, player.team, player getentitynumber());
        scoreevents::processscoreevent(#"hash_11372813b1bcaf92", player, undefined, undefined);
        demo::bookmark(#"event", gettime(), player);
        potm::bookmark(#"event", gettime(), player);
        util::printandsoundoneveryone(otherteam, undefined, #"hash_0", undefined, "mp_obj_taken", "mp_enemy_obj_taken");
        level thread popups::displayteammessagetoteam(#"hash_6b94e754d048dae9", player, team, undefined, undefined);
        level thread popups::displayteammessagetoteam(#"hash_25ed0737f009ca72", player, otherteam, undefined, undefined);
        globallogic_audio::leader_dialog("ctfFriendlyFlagTaken", team, undefined, "ctf_flag");
        globallogic_audio::leader_dialog("ctfEnemyFlagTaken", otherteam, undefined, "ctf_flag_enemy");
        player.var_915d1726 = 1;
        player.var_34c3d626 = self;
        player playlocalsound(#"hash_379a55d588578661");
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
        var_1d711e07 = getplayers(util::get_enemy_team(self.team));
        foreach (var_ba17692e in var_1d711e07) {
            objective_setinvisibletoplayer(self.objectiveid, var_ba17692e);
        }
        globallogic_audio::play_2d_on_team("mpl_flagget_sting_friend", otherteam);
        globallogic_audio::play_2d_on_team("mpl_flagget_sting_enemy", team);
        if (level.var_891a40be) {
            self gameobjects::set_visible_team(#"any");
        } else {
            self gameobjects::set_visible_team(#"enemy");
        }
        self gameobjects::set_2d_icon(#"friendly", level.var_d1c2ee5b);
        self gameobjects::set_3d_icon(#"friendly", level.var_a7f2199a);
        self gameobjects::set_2d_icon(#"enemy", level.var_98f94940);
        self gameobjects::set_3d_icon(#"enemy", level.var_18b747ea);
        player thread function_b2961524(level.var_75ea597f[otherteam]);
        function_7ed82590();
        /#
            print(team + "<unknown string>");
        #/
        ss = level.spawnsystem;
        var_6c94cc3d = util::getteammask(otherteam);
        var_7b6db33f = util::getteammask(team);
        player.var_167e7924 = player influencers::create_entity_influencer("ctf_carrier_friendly", var_6c94cc3d);
        player.var_1100ba09 = player influencers::create_entity_influencer("ctf_carrier_enemy", var_7b6db33f);
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xf6a13c3, Offset: 0x4208
// Size: 0x46
function function_7921b6cf(player) {
    self endon(#"disconnect", #"death");
    wait(6);
    if (player.var_915d1726) {
    }
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xe50336f3, Offset: 0x4258
// Size: 0x38
function function_2e3ab681() {
    if (isdefined(self.carrier)) {
        return 0;
    }
    if (self.curorigin != self.trigger.baseorigin) {
        return 0;
    }
    return 1;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x40e350a3, Offset: 0x4298
// Size: 0x26c
function function_bfc70f32() {
    team = self gameobjects::get_owner_team();
    otherteam = util::getotherteam(team);
    function_18d7960(team, undefined);
    function_d1b40f6e(team, 0);
    globallogic_audio::play_2d_on_team("mpl_flagreturn_sting", team);
    globallogic_audio::play_2d_on_team("mpl_flagreturn_sting", otherteam);
    level.var_2df39db0[otherteam] gameobjects::allow_use(#"friendly");
    level.var_2df39db0[otherteam] gameobjects::set_visible_team(#"friendly");
    function_7ed82590();
    if (level.var_cee83d02) {
        self gameobjects::allow_carry(#"enemy");
    }
    self gameobjects::return_home();
    self gameobjects::set_visible_team(#"any");
    self gameobjects::set_3d_icon(#"friendly", level.var_3ee1d113);
    self gameobjects::set_2d_icon(#"friendly", level.var_f1e6ac62);
    self gameobjects::set_3d_icon(#"enemy", level.var_9bf80f85);
    self gameobjects::set_2d_icon(#"enemy", level.var_3ca10658);
    globallogic_audio::leader_dialog("ctfFriendlyFlagReturned", team, undefined, "ctf_flag");
    globallogic_audio::leader_dialog("ctfEnemyFlagReturned", otherteam, undefined, "ctf_flag_enemy");
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x4f7d1761, Offset: 0x4510
// Size: 0x7ec
function function_d1b86895(player) {
    team = player.pers[#"team"];
    enemyteam = util::getotherteam(team);
    time = gettime();
    var_c21dacee = level.var_da8cca54[team];
    if (level.var_cdb4af94 == 1 && var_c21dacee gameobjects::is_object_away_from_home()) {
        return;
    }
    if (overtime::is_overtime_round()) {
        var_34aa4595 = int(float(globallogic_utils::gettimepassed()) / 1000);
        if ((isdefined(game.var_8f9c5645[team]) ? game.var_8f9c5645[team] : 0) != 0) {
            var_34aa4595 = min(var_34aa4595, game.var_8f9c5645[team]);
        }
        game.var_8f9c5645[team] = var_34aa4595;
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
    util::printandsoundoneveryone(team, undefined, #"hash_0", undefined, "mp_obj_captured", "mp_enemy_obj_captured");
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
    player stats::function_bb7eedf0(#"hash_2f1df496791a2f5f", 1);
    player contracts::increment_contract(#"hash_4fa0008b60deaab4");
    player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
    level thread popups::displayteammessagetoteam(#"hash_97b6e279104e355", player, team, undefined, undefined);
    level thread popups::displayteammessagetoteam(#"hash_352c694daa4f9440", player, enemyteam, undefined, undefined);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_enemy", enemyteam);
    globallogic_audio::play_2d_on_team("mpl_flagcapture_sting_friend", team);
    player function_4ff794a0(player);
    /#
        print(enemyteam + "<unknown string>");
    #/
    flag = player.carryobject;
    player challenges::capturedobjective(time, flag.trigger);
    flag.var_3f1740e9 = 1;
    flag gameobjects::return_home();
    flag gameobjects::set_owner_team(util::get_enemy_team(flag.team));
    flag.var_3f1740e9 = undefined;
    var_1d711e07 = getplayers(flag.team);
    foreach (var_ba17692e in var_1d711e07) {
        objective_setvisibletoplayer(flag.objectiveid, var_ba17692e);
    }
    otherteam = util::getotherteam(team);
    level.var_da8cca54[otherteam] gameobjects::allow_carry(#"enemy");
    level.var_da8cca54[otherteam] gameobjects::set_visible_team(#"any");
    level.var_da8cca54[otherteam] gameobjects::return_home();
    level.var_2df39db0[otherteam] gameobjects::allow_use(#"friendly");
    player.var_915d1726 = 0;
    player.var_34c3d626 = undefined;
    player clientfield::set("ctf_flag_carrier", 0);
    player clientfield::set("ctf_flag_carried", 0);
    function_18d7960(enemyteam, undefined);
    function_d1b40f6e(team, 0);
    globallogic_score::giveteamscoreforobjective(team, 1);
    globallogic_audio::leader_dialog("ctfEnemyFlagCaptured", team, undefined, "ctf_flag_enemy");
    globallogic_audio::leader_dialog("ctfFriendlyFlagCaptured", enemyteam, undefined, "ctf_flag");
    flag function_575d9e89();
    player function_575d9e89();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xd2c1a36, Offset: 0x4d08
// Size: 0x8c
function function_4ff794a0(player) {
    scoreevents::processscoreevent(#"hash_2e4b4cefa76857ca", player, undefined, undefined);
    player recordgameevent("capture");
    util::function_5a68c330(10, player.team, player getentitynumber());
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0x78d0909f, Offset: 0x4da0
// Size: 0x214
function onreset() {
    function_7ed82590();
    team = self gameobjects::get_owner_team();
    self gameobjects::set_3d_icon(#"friendly", level.var_3ee1d113);
    self gameobjects::set_2d_icon(#"friendly", level.var_f1e6ac62);
    self gameobjects::set_3d_icon(#"enemy", level.var_9bf80f85);
    self gameobjects::set_2d_icon(#"enemy", level.var_3ca10658);
    if (level.var_cee83d02) {
        self gameobjects::allow_carry(#"enemy");
        self.trigger triggerenable(1);
    }
    level.var_2df39db0[team] gameobjects::set_visible_team(#"friendly");
    level.var_2df39db0[team] gameobjects::allow_use(#"friendly");
    self.visuals[0] clientfield::set("ctf_flag_away", 0);
    self gameobjects::set_flags(0);
    function_d1b40f6e(team, 0);
    self function_ef8d5fb5();
    self function_575d9e89();
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x1e0e9667, Offset: 0x4fc0
// Size: 0x40
function function_49f369ae(flag) {
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
            var_60cb3923 = "invalidTeam";
            var_b10c6eb1 = 0;
            var_a0581c28 = 0;
            var_70f83f4 = 0;
            var_c4137417 = level.flags[index].carrier;
            if (isdefined(var_c4137417)) {
                var_61018b = level.flags[index].carrier.origin;
                var_b0d2ad27 = 1;
                if (isplayer(attacker) && attacker.pers[#"team"] != self.pers[#"team"]) {
                    if (isdefined(level.flags[index].carrier.attackerdata)) {
                        if (level.flags[index].carrier != attacker) {
                            if (isdefined(level.flags[index].carrier.attackerdata[self.clientid])) {
                                scoreevents::processscoreevent(#"hash_4cc1d471414ed800", attacker, undefined, weapon);
                            }
                        }
                    }
                }
            } else {
                var_61018b = level.flags[index].curorigin;
                var_b0d2ad27 = 0;
            }
            dist = distance2dsquared(self.origin, var_61018b);
            if (dist < level.defaultoffenseradiussq) {
                var_b10c6eb1 = 1;
                if (level.flags[index].var_f4496288 == attacker.pers[#"team"]) {
                    var_a0581c28 = 1;
                } else {
                    var_70f83f4 = 1;
                }
            }
            dist = distance2dsquared(attacker.origin, var_61018b);
            if (dist < level.defaultoffenseradiussq) {
                var_b10c6eb1 = 1;
                if (level.flags[index].var_f4496288 == attacker.pers[#"team"]) {
                    var_a0581c28 = 1;
                } else {
                    var_70f83f4 = 1;
                }
            }
            if (var_b10c6eb1 && isplayer(attacker) && attacker.pers[#"team"] != self.pers[#"team"]) {
                attacker challenges::function_82bb78f7(weapon);
                attacker.pers[#"objectiveekia"]++;
                attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                if (var_a0581c28) {
                    if (isdefined(self.var_915d1726) && self.var_915d1726) {
                        scoreevents::processscoreevent(#"kill_flag_carrier", attacker, undefined, weapon);
                        attacker stats::function_dad108fa(#"kill_carrier", 1);
                    } else {
                        scoreevents::processscoreevent(#"killed_attacker", attacker, undefined, weapon);
                    }
                    self recordkillmodifier("assaulting");
                }
                if (var_70f83f4) {
                    if (var_b0d2ad27 == 1) {
                        if (isdefined(var_c4137417) && attacker == var_c4137417) {
                            scoreevents::processscoreevent(#"hash_24327f8cc4c198ca", attacker, undefined, weapon);
                        } else {
                            scoreevents::processscoreevent(#"defend_flag_carrier", attacker, undefined, weapon);
                            attacker stats::function_dad108fa(#"hash_6c1309df331b9f9a", 1);
                        }
                    } else {
                        scoreevents::processscoreevent(#"killed_defender", attacker, undefined, weapon);
                    }
                    self recordkillmodifier("defending");
                }
            }
        }
        victim = self;
        foreach (var_797359f9 in level.var_3409813e) {
            if (isdefined(attacker.team) && attacker != victim && isdefined(victim.team)) {
                var_c508690e = distance2dsquared(attacker.origin, var_797359f9.origin);
                var_98da4820 = distance2dsquared(victim.origin, var_797359f9.origin);
                if (var_98da4820 < level.defaultoffenseradiussq || var_c508690e < level.defaultoffenseradiussq) {
                    if (victim.team == var_797359f9.team) {
                        attacker thread challenges::killedbasedefender(var_797359f9.trigger);
                    } else {
                        attacker thread challenges::killedbaseoffender(var_797359f9.trigger, weapon);
                    }
                }
            }
        }
    }
    if (!isdefined(self.var_915d1726) || !self.var_915d1726) {
        return;
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker.pers[#"team"] != self.pers[#"team"]) {
        if (isdefined(self.var_34c3d626)) {
            for (index = 0; index < level.flags.size; index++) {
                currentflag = level.flags[index];
                if (currentflag.var_f4496288 == self.team) {
                    if (currentflag.curorigin == currentflag.trigger.baseorigin) {
                        dist = distance2dsquared(self.origin, currentflag.curorigin);
                        if (dist < level.defaultoffenseradiussq) {
                            self.var_34c3d626.var_4708fae7 = attacker;
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
function function_7ed82590() {
    var_2a87e1fd = level.var_da8cca54[#"allies"];
    var_67c457cd = level.var_da8cca54[#"axis"];
    if (!level.var_cee83d02) {
        return;
    }
    if (isdefined(var_2a87e1fd.carrier) && var_67c457cd gameobjects::is_object_away_from_home()) {
        level.var_75ea597f[#"axis"] turn_on();
    } else {
        level.var_75ea597f[#"axis"] turn_off();
    }
    if (isdefined(var_67c457cd.carrier) && var_2a87e1fd gameobjects::is_object_away_from_home()) {
        level.var_75ea597f[#"allies"] turn_on();
    } else {
        level.var_75ea597f[#"allies"] turn_off();
    }
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x1ce0356f, Offset: 0x5ad8
// Size: 0x64
function function_b2961524(trigger) {
    self endon(#"disconnect");
    self clientclaimtrigger(trigger);
    self waittill(#"drop_object");
    self clientreleasetrigger(trigger);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0xd82ced33, Offset: 0x5b48
// Size: 0xda
function function_54b71f54(var_9319ad28) {
    otherteam = util::getotherteam(var_9319ad28);
    team_mask = util::getteammask(var_9319ad28);
    other_team_mask = util::getteammask(otherteam);
    self.var_dff31122 = self influencers::create_influencer("ctf_base_friendly", self.trigger.origin, team_mask);
    self.var_f7e52785 = self influencers::create_influencer("ctf_base_friendly", self.trigger.origin, other_team_mask);
}

// Namespace ctf/ctf
// Params 4, eflags: 0x0
// Checksum 0xf5abfa53, Offset: 0x5c30
// Size: 0x80
function function_e974abae(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_penalty = globallogic_defaults::default_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon);
    if (isdefined(self.var_915d1726) && self.var_915d1726) {
        teamkill_penalty = teamkill_penalty * level.teamkillpenaltymultiplier;
    }
    return teamkill_penalty;
}

// Namespace ctf/ctf
// Params 4, eflags: 0x0
// Checksum 0x6a4e79ab, Offset: 0x5cb8
// Size: 0x92
function function_ea20dd87(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_score = attacker rank::getscoreinfovalue("kill");
    if (isdefined(self.var_915d1726) && self.var_915d1726) {
        teamkill_score = teamkill_score * level.teamkillscoremultiplier;
    }
    return int(teamkill_score);
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x47e5da2d, Offset: 0x5d58
// Size: 0x37e
function function_a5f40b8e(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (isdefined(self.droptime) && self.droptime >= gettime()) {
        return 0;
    }
    if (isdefined(player.resurrect_weapon) && player getcurrentweapon() == player.resurrect_weapon) {
        return 0;
    }
    if (player iscarryingturret()) {
        return 0;
    }
    currentweapon = player getcurrentweapon();
    if (isdefined(currentweapon)) {
        if (!function_da0a9f3c(currentweapon)) {
            return 0;
        }
    }
    nextweapon = player.var_2c9849e;
    if (isdefined(nextweapon) && player isswitchingweapons()) {
        if (!function_da0a9f3c(nextweapon)) {
            return 0;
        }
    }
    if (player function_9fdee199()) {
        return 0;
    }
    flag = self.visuals[0];
    var_a098293 = 15;
    dist2 = distance2dsquared(flag.origin, player.origin);
    if (dist2 < var_a098293 * var_a098293) {
        return 1;
    }
    start = player geteye();
    end = (self.curorigin[0], self.curorigin[1], self.curorigin[2] + 5);
    if (isdefined(flag)) {
        end = (flag.origin[0], flag.origin[1], flag.origin[2] + 5);
    }
    if (isdefined(self.carrier) && isplayer(self.carrier)) {
        end = self.carrier geteye();
    }
    var_a593829f = flag;
    var_e7e8bfc = flag;
    if (isdefined(self.projectile)) {
        var_a593829f = self.projectile;
    }
    if (isdefined(self.var_2ca7619c)) {
        var_e7e8bfc = self.var_2ca7619c;
    }
    if (!bullettracepassed(end, start, 0, var_a593829f, var_e7e8bfc, 0, 0)) {
        player_origin = (player.origin[0], player.origin[1], player.origin[2] + 10);
        if (!bullettracepassed(end, player_origin, 0, var_a593829f, var_e7e8bfc, 0, 0)) {
            return 0;
        }
    }
    return 1;
}

// Namespace ctf/ctf
// Params 1, eflags: 0x0
// Checksum 0x413676a8, Offset: 0x60e0
// Size: 0x6e
function function_da0a9f3c(weapon) {
    if (weapon == level.weaponnone) {
        return 0;
    }
    if (weapon == getweapon("ball")) {
        return 0;
    }
    if (killstreaks::is_killstreak_weapon(weapon)) {
        return 0;
    }
    return 1;
}

// Namespace ctf/ctf
// Params 0, eflags: 0x0
// Checksum 0xac1e0ec5, Offset: 0x6158
// Size: 0x1c
function function_9fdee199() {
    return isdefined(self.var_ae7a3b35) && self.var_ae7a3b35 > gettime();
}

