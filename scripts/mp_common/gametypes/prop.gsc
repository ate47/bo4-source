// Atian COD Tools GSC decompiler test
#using script_7fb8e6e31dd139d;
#using script_8abbc35fe12516a;
#using scripts\weapons\weapons.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\killcam_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\tweakables_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\damagefeedback_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\mp_common\gametypes\round.gsc;
#using scripts\mp_common\gametypes\_prop_dev.gsc;
#using scripts\mp_common\gametypes\_prop_controls.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\spawning.gsc;
#using scripts\mp_common\gametypes\globallogic_utils.gsc;
#using scripts\mp_common\gametypes\globallogic_ui.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_defaults.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\globallogic.gsc;
#using scripts\mp_common\gametypes\dogtags.gsc;
#using scripts\mp_common\gametypes\deathicons.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\mp_common\util.gsc;

#namespace prop;

// Namespace prop/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x13d6dcfa, Offset: 0xa60
// Size: 0x1096
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registerroundswitch(0, 9);
    util::registertimelimit(0, 4);
    util::registerscorelimit(0, 0);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 3);
    util::registernumlives(0, 1);
    level.phsettings = spawnstruct();
    level.phsettings.prophidetime = 30;
    level.phsettings.propwhistletime = function_dfd42f55();
    level.phsettings.propchangecount = 2;
    level.phsettings.propnumflashes = 1;
    level.phsettings.propnumclones = 3;
    level.phsettings.propspeedscale = 1.55;
    level.phsettings.var_a9769d62 = 2;
    level.phsettings.var_36f59fc5 = 0;
    level.phsettings.var_86fda1fd = getweapon("eq_slow_grenade_hunter_ph");
    level.phsettings.var_bca517c5 = level.script == "mp_nuketown_4";
    level.phsettings.var_5b677bf1 = level.phsettings.var_bca517c5;
    if (level.phsettings.var_5b677bf1) {
        level.phsettings.propnumclones = 10;
    }
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.isprophunt = 1;
    level.allow_teamchange = 1;
    level.killstreaksenabled = 0;
    level.teambased = 1;
    level.overrideteamscore = 1;
    level.alwaysusestartspawns = 1;
    level.var_60507c71 = 1;
    level.scoreroundwinbased = getgametypesetting("cumulativeRoundScores") == 0;
    level.teamscoreperkill = getgametypesetting("teamScorePerKill");
    level.teamscoreperdeath = getgametypesetting("teamScorePerDeath");
    level.teamscoreperheadshot = getgametypesetting("teamScorePerHeadshot");
    level.killstreaksgivegamescore = getgametypesetting("killstreaksGiveGameScore");
    level.var_79f19f00 = &function_79f19f00;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.onplayerdisconnect = &onplayerdisconnect;
    level.onroundendgame = &onroundendgame;
    level.onroundswitch = &onroundswitch;
    level.var_dcc71445 = &function_dcc71445;
    level.ononeleftevent = &ononeleftevent;
    level.ontimelimit = &ontimelimit;
    level.ondeadevent = &ondeadevent;
    level.var_badba495 = &function_5cde0fbe;
    level.var_2ff10342 = &playdeathsoundph;
    level.overrideplayerdamage = &gamemodemodifyplayerdamage;
    level.var_ef516d85 = &function_ef516d85;
    level.var_7470e459 = &function_7470e459;
    level.var_d24f3562 = &function_d24f3562;
    level.givecustomloadout = &givecustomloadout;
    level.var_8276e538 = &function_9c2f28fb;
    level.var_d1f10992 = &function_d1f10992;
    level.determinewinner = &determinewinner;
    level.onplayerdamage = &onplayerdamage;
    game.var_1d3545e = &function_a0794036;
    level.var_f42d0db9 = 1;
    gameobjects::register_allowed_gameobject(level.gametype);
    player::function_cf3aa03d(&onplayerkilled);
    callback::on_loadout(&on_player_loadout);
    callback::on_connect(&onplayerconnect);
    globallogic_defaults::function_daa7e9d5();
    globallogic_audio::set_leader_gametype_dialog("startProp", "hcStartProp", undefined, "propOrdersDef", "bbStartProp", "hcbbStartProp");
    var_d64c0127 = [];
    if (!isdefined(var_d64c0127)) {
        var_d64c0127 = [];
    } else if (!isarray(var_d64c0127)) {
        var_d64c0127 = array(var_d64c0127);
    }
    var_d64c0127[var_d64c0127.size] = "specialty_sprint";
    if (!isdefined(var_d64c0127)) {
        var_d64c0127 = [];
    } else if (!isarray(var_d64c0127)) {
        var_d64c0127 = array(var_d64c0127);
    }
    var_d64c0127[var_d64c0127.size] = "specialty_slide";
    var_a4a535e = [];
    level.var_d64c0127 = var_d64c0127;
    level.var_a4a535e = var_a4a535e;
    level.proplist = [];
    level.propindex = [];
    level.var_8d2f7166 = [];
    level.abilities = array("FLASH", "CLONE");
    populateproplist();
    level.graceperiod = int(level.phsettings.prophidetime + 0.5);
    if (!isdefined(game.var_c449674c)) {
        game.var_5042a345 = [];
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("smg_standard_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("smg_accurate_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("smg_fastfire_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("smg_capacity_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("smg_handling_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("ar_accurate_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("ar_damage_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("ar_modular_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("ar_stealth_t8");
        if (!isdefined(game.var_5042a345)) {
            game.var_5042a345 = [];
        } else if (!isarray(game.var_5042a345)) {
            game.var_5042a345 = array(game.var_5042a345);
        }
        game.var_5042a345[game.var_5042a345.size] = getweapon("ar_fastfire_t8");
        array::remove_undefined(game.var_5042a345);
        game.var_c449674c = array::random(game.var_5042a345);
    }
    globallogic_spawn::addsupportedspawnpointtype("tdm");
    level thread delayset();
    level thread function_70d75619();
    util::set_dvar_int_if_unset("scr_prop_minigame", 1);
    /#
        level.var_a7997034 = 0;
        thread prop_dev::function_93440c52();
    #/
    clientfield::register("allplayers", "hideTeamPlayer", 16000, 2, "int");
    clientfield::register("allplayers", "pingHighlight", 16000, 1, "int");
    clientfield::register("toplayer", "PROP.change_prop", 16000, 1, "int");
    clientfield::register("toplayer", "PROP.cameraHeight", 16000, 8, "int");
    clientfield::register("toplayer", "PROP.cameraRange", 16000, 8, "int");
    clientfield::register("toplayer", "PROP.hide_prop", 16000, 1, "int");
    clientfield::register("worlduimodel", "hudItems.war.attackingTeam", 16000, 2, "int");
    clientfield::register_clientuimodel("hudItems.numPropsAlive", 16000, 4, "int", 0);
    clientfield::register_clientuimodel("hudItems.numPropConcusses", 16000, 2, "int", 0);
    clientfield::register_clientuimodel("hudItems.numPropChanges", 16000, 2, "int", 0);
    clientfield::register_clientuimodel("hudItems.numPropDecoys", 16000, 4, "int", 0);
    clientfield::register("toplayer", "realtime_multiplay", 16000, 1, "int");
    level.hide_timer = mp_prop_timer::register("HideTimer");
    level.prop_controls = mp_prop_controls::register("PropControls");
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xb7f3320b, Offset: 0x1b00
// Size: 0x2c
function function_a0794036() {
    potm::function_80cdf4b2(1);
    potm::function_f6b119c7();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xd30927bd, Offset: 0x1b38
// Size: 0x8
function function_dfd42f55() {
    return 20;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x27b70aa3, Offset: 0x1b48
// Size: 0x22
function delayset() {
    waitframe(1);
    level.playstartconversation = 0;
    level.allowspecialistdialog = 0;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xeaacd462, Offset: 0x1b78
// Size: 0x44
function onendgame(winningteam) {
    if (isdefined(winningteam) && isdefined(level.teams[winningteam])) {
        globallogic_score::giveteamscoreforobjective(winningteam, 1);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x59541942, Offset: 0x1bc8
// Size: 0xe4
function onroundswitch() {
    function_c676c423();
    if (!isdefined(game.switchedsides)) {
        game.switchedsides = 0;
    }
    game.switchedsides = !game.switchedsides;
    if (level.scoreroundwinbased) {
        foreach (team in level.teams) {
            [[ level._setteamscore ]](team, game.stat[#"roundswon"][team]);
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x1b18108c, Offset: 0x1cb8
// Size: 0xd8
function function_c676c423() {
    foreach (player in level.players) {
        if (player util::isprop()) {
            propents = array(player.prop, player.propanchor, player.propent);
            player function_4ef97d9b(propents);
        }
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x21afd6a5, Offset: 0x1d98
// Size: 0x80
function onroundendgame(var_ea2932d6) {
    gamewinner = var_ea2932d6;
    if (level.gameended) {
        gamewinner = function_cdcbe19(gamewinner, 1);
    }
    if (gamewinner == "allies" || gamewinner == "axis") {
        ph_setfinalkillcamwinner(gamewinner);
    }
    return gamewinner;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x6f1b4524, Offset: 0x1e20
// Size: 0x22
function determinewinner(roundwinner) {
    return function_cdcbe19(roundwinner, 0);
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x8c30539, Offset: 0x1e50
// Size: 0x27e
function function_cdcbe19(roundwinner, var_2cd61e6c) {
    gamewinner = roundwinner;
    var_41886d38 = "roundswon";
    level.proptiebreaker = "none";
    if (game.stat[var_41886d38][#"allies"] == game.stat[var_41886d38][#"axis"]) {
        level.proptiebreaker = "kills";
        if (game.propscore[#"axis"] == game.propscore[#"allies"]) {
            level.proptiebreaker = "time";
            if (game.hunterkilltime[#"axis"] == game.hunterkilltime[#"allies"]) {
                level.proptiebreaker = "tie";
                gamewinner = "tie";
            } else if (game.hunterkilltime[#"axis"] < game.hunterkilltime[#"allies"]) {
                gamewinner = "axis";
            } else {
                gamewinner = "allies";
            }
        } else if (game.propscore[#"axis"] > game.propscore[#"allies"]) {
            gamewinner = "axis";
        } else {
            gamewinner = "allies";
        }
        if (gamewinner != "tie" && var_2cd61e6c) {
            globallogic_score::giveteamscoreforobjective_delaypostprocessing(gamewinner, 1);
        }
    } else if (game.stat[var_41886d38][#"axis"] > game.stat[var_41886d38][#"allies"]) {
        gamewinner = "axis";
    } else {
        gamewinner = "allies";
    }
    return gamewinner;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x4c03efdc, Offset: 0x20d8
// Size: 0x1a4
function onscoreclosemusic() {
    teamscores = [];
    while (!level.gameended) {
        scorelimit = level.scorelimit;
        scorethreshold = scorelimit * 0.1;
        scorethresholdstart = abs(scorelimit - scorethreshold);
        scorelimitcheck = scorelimit - 10;
        topscore = 0;
        runnerupscore = 0;
        foreach (team in level.teams) {
            score = [[ level._getteamscore ]](team);
            if (score > topscore) {
                runnerupscore = topscore;
                topscore = score;
            } else if (score > runnerupscore) {
                runnerupscore = score;
            }
        }
        scoredif = topscore - runnerupscore;
        if (topscore >= scorelimit * 0.5) {
            level notify(#"sndmusichalfway");
            return;
        }
        wait(1);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x337b5da8, Offset: 0x2288
// Size: 0x76
function onplayerconnect() {
    self.var_d290c555 = 0;
    if (isdefined(level.allow_teamchange) && !level.allow_teamchange) {
        self.hasdonecombat = 1;
    }
    if (!isdefined(self.pers[#"objtime"])) {
        self.pers[#"objtime"] = 0;
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xe0de3985, Offset: 0x2308
// Size: 0xf8
function hidehudintermission() {
    level waittill(#"game_ended");
    if (useprophudserver()) {
        level.elim_hud.alpha = 0;
        if (level.phsettings.propwhistletime > 0) {
            level.phwhistletimer.alpha = 0;
            level.whistling.alpha = 0;
        }
    }
    foreach (player in level.players) {
        player prop_controls::propabilitykeysvisible(0);
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xff5e92de, Offset: 0x2408
// Size: 0xce
function update_objective_hint_message(attackersmsg, defendersmsg) {
    foreach (team, _ in level.teams) {
        if (team == game.attackers) {
            game.strings["objective_hint_" + team] = attackersmsg;
        } else {
            game.strings["objective_hint_" + team] = defendersmsg;
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xdb6d82bd, Offset: 0x24e0
// Size: 0xa2
function function_751eb311() {
    level._effect[#"propdeathfx"] = "destruct/fx8_dest_prop_md";
    level._effect[#"propdeathfx_s"] = "destruct/fx8_dest_prop_sm";
    level._effect[#"propdeathfx_m"] = "destruct/fx8_dest_prop_md";
    level._effect[#"propdeathfx_l"] = "destruct/fx8_dest_prop_lg";
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x6401671f, Offset: 0x2590
// Size: 0x51c
function onstartgametype() {
    setclientnamemode("manual_change");
    if (!isdefined(game.switchedsides)) {
        game.switchedsides = 0;
    }
    level.displayroundendtext = 0;
    influencers::create_map_placed_influencers();
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    util::setobjectivetext(game.attackers, #"objectives_ph_attacker");
    util::setobjectivetext(game.defenders, #"objectives_ph_defender");
    update_objective_hint_message(#"objectives_ph_attacker_hint", #"objectives_ph_defender_hint");
    if (level.splitscreen) {
        util::setobjectivescoretext(game.attackers, #"objectives_ph_attacker");
        util::setobjectivescoretext(game.defenders, #"objectives_ph_defender");
    } else {
        util::setobjectivescoretext(game.attackers, #"objectives_ph_attacker_score");
        util::setobjectivescoretext(game.defenders, #"objectives_ph_defender_score");
    }
    level.mapcenter = math::find_box_center(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    spawnpoint = spawning::get_random_intermission_point();
    setdemointermissionpoint(spawnpoint.origin, spawnpoint.angles);
    level thread onscoreclosemusic();
    if (!util::isoneround()) {
        level.displayroundendtext = 1;
        if (level.scoreroundwinbased) {
            globallogic_score::resetteamscores();
        }
    }
    if (isdefined(level.droppedtagrespawn) && level.droppedtagrespawn) {
        level.numlives = 1;
    }
    level._effect[#"propflash"] = "destruct/fx8_dest_prop_md";
    function_751eb311();
    if (!isdefined(game.propscore)) {
        game.propscore = [];
        game.propscore[#"allies"] = 0;
        game.propscore[#"axis"] = 0;
    }
    if (!isdefined(game.propsurvivaltime)) {
        game.propsurvivaltime = [];
        game.propsurvivaltime[#"allies"] = 0;
        game.propsurvivaltime[#"axis"] = 0;
    }
    if (!isdefined(game.hunterkilltime)) {
        game.hunterkilltime = [];
        game.hunterkilltime[#"allies"] = 0;
        game.hunterkilltime[#"axis"] = 0;
    }
    level flag::init("props_hide_over", 0);
    level thread setuproundstarthud();
    if (level.phsettings.propwhistletime > 0) {
        level thread propwhistle();
    }
    level thread hidehudintermission();
    level thread monitortimers();
    level thread setphteamscores();
    level thread stillalivexp();
    level thread function_675bd286();
    level thread tracktimealive();
    level thread set_ui_team();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x3488918b, Offset: 0x2ab8
// Size: 0x98
function function_75b4c8bc() {
    level endon(#"game_ended");
    foreach (player in level.players) {
        level.hide_timer mp_prop_timer::close(player);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xc1714460, Offset: 0x2b58
// Size: 0x2a6
function function_7913d068(var_fae892d1) {
    level endon(#"game_ended", #"props_hide_over");
    var_fb3f700 = var_fae892d1 * 1000 + gettime();
    foreach (player in level.players) {
        level.hide_timer mp_prop_timer::open(player, 1);
        if (player util::isprop()) {
            level.hide_timer mp_prop_timer::set_isprop(player, 1);
            level.prop_controls mp_prop_controls::open(player, 1);
        } else {
            level.hide_timer mp_prop_timer::set_isprop(player, 0);
        }
    }
    while (1) {
        foreach (player in level.players) {
            level.hide_timer mp_prop_timer::set_timeremaining(player, int((var_fb3f700 - gettime()) / 1000));
        }
        n_current_time = (var_fb3f700 - gettime()) / 1000;
        var_4dd94c4c = int(n_current_time);
        if (var_4dd94c4c <= 5 && var_4dd94c4c > 0) {
            playsoundatposition("uin_timer_5", (0, 0, 0));
        } else if (var_4dd94c4c == 0 && n_current_time >= 0) {
            playsoundatposition("uin_ph_ready", (0, 0, 0));
        }
        wait(1);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x26b5b1b0, Offset: 0x2e08
// Size: 0x8c
function function_ce0544e0(weapon) {
    self.primaryweapon = weapon;
    self giveweapon(weapon);
    self switchtoweapon(weapon);
    self setspawnweapon(weapon);
    self.spawnweapon = weapon;
    self setblockweaponpickup(weapon, 1);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x2f909971, Offset: 0x2ea0
// Size: 0x54
function function_fc1f8d0(weapon) {
    self.secondaryweapon = weapon;
    self giveweapon(weapon);
    self setblockweaponpickup(weapon, 1);
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x40cdacc7, Offset: 0x2f00
// Size: 0x76
function function_78f5da6(primaryoffhand, primaryoffhandcount) {
    self giveweapon(primaryoffhand);
    self setweaponammostock(primaryoffhand, primaryoffhandcount);
    self switchtooffhand(primaryoffhand);
    self.grenadetypeprimary = primaryoffhand;
    self.grenadetypeprimarycount = primaryoffhandcount;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xd420b314, Offset: 0x2f80
// Size: 0x76
function function_28a51449(secondaryoffhand, secondaryoffhandcount) {
    self giveweapon(secondaryoffhand);
    self setweaponammoclip(secondaryoffhand, secondaryoffhandcount);
    self switchtooffhand(secondaryoffhand);
    self.grenadetypesecondary = secondaryoffhand;
    self.grenadetypesecondarycount = secondaryoffhandcount;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xe174ea1f, Offset: 0x3000
// Size: 0xb0
function giveperks(perknames) {
    self clearperks();
    foreach (perkname in perknames) {
        if (!self hasperk(perkname)) {
            self setperk(perkname);
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x362909ec, Offset: 0x30b8
// Size: 0x1b2
function givecustomloadout() {
    loadout::init_player(1);
    loadout::function_f436358b(self.curclass);
    self clearperks();
    weapon = undefined;
    if (self util::isprop()) {
        weapon = getweapon("bare_hands");
        self function_ce0544e0(weapon);
        self giveperks(level.var_a4a535e);
    } else {
        weapon = getweapon("pistol_standard_t8");
        self function_fc1f8d0(weapon);
        self giveperks(level.var_d64c0127);
        weapon = game.var_c449674c;
        self function_ce0544e0(weapon);
        if (!function_5a6214bd()) {
            self function_c2958208();
        } else {
            self attackerinitammo();
        }
    }
    self giveweapon(level.weaponbasemelee);
    self notify(#"applyloadout");
    return weapon;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xc42e1943, Offset: 0x3278
// Size: 0x1a
function is_player_gamepad_enabled() {
    return self gamepadusedlast();
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x3b40b59c, Offset: 0x32a0
// Size: 0x5c
function whistlestarttimer(duration) {
    level notify(#"hash_581d4ff3d0fa766c");
    counttime = int(duration);
    if (counttime >= 0) {
        thread whistlestarttimer_internal(counttime);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xfd4699ea, Offset: 0x3308
// Size: 0x52
function whistlestarttimer_internal(counttime) {
    level endon(#"hash_581d4ff3d0fa766c");
    waittillframeend();
    while (counttime > 0 && !level.gameended) {
        counttime--;
        wait(1);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x8bced6df, Offset: 0x3368
// Size: 0x3c
function useprophudserver() {
    /#
        if (getdvarint(#"scr_ph_useprophudserver", 0) != 0) {
            return 1;
        }
    #/
    return 1;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x9852ed95, Offset: 0x33b0
// Size: 0x1a
function settimer(time) {
    self.time = time;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x4a6d4bc2, Offset: 0x33d8
// Size: 0x1a
function setvalue(value) {
    self.value = value;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x8cd14257, Offset: 0x3400
// Size: 0x46e
function setuproundstarthud() {
    level.phcountdowntimer = spawnstruct();
    level.phcountdowntimer.label = #"mp_ph_starts_in";
    level.phcountdowntimer.alpha = 0;
    level.phcountdowntimer.archived = 0;
    level.phcountdowntimer.hidewheninmenu = 1;
    level.phcountdowntimer.sort = 1;
    if (useprophudserver()) {
        var_ed243a5d = 110;
        var_15c99f84 = 20;
        if (!level.console) {
            var_ed243a5d = 125;
            var_15c99f84 = 15;
        }
        level.elim_hud = spawnstruct();
        level.elim_hud.label = #"mp_ph_alive";
        level.elim_hud setvalue(0);
        level.elim_hud.x = 5;
        level.elim_hud.y = var_ed243a5d;
        level.elim_hud.alignx = "left";
        level.elim_hud.aligny = "top";
        level.elim_hud.horzalign = "left";
        level.elim_hud.vertalign = "top";
        level.elim_hud.archived = 1;
        level.elim_hud.alpha = 0;
        level.elim_hud.glowalpha = 0;
        level.elim_hud.hidewheninmenu = 0;
        level thread eliminatedhudmonitor();
        if (level.phsettings.propwhistletime > 0) {
            level.phwhistletimer = spawnstruct();
            level.phwhistletimer.x = 5;
            level.phwhistletimer.y = var_ed243a5d + var_15c99f84;
            level.phwhistletimer.alignx = "left";
            level.phwhistletimer.aligny = "top";
            level.phwhistletimer.horzalign = "left";
            level.phwhistletimer.vertalign = "top";
            level.phwhistletimer.label = #"mp_ph_whistle_in";
            level.phwhistletimer.alpha = 0;
            level.phwhistletimer.archived = 1;
            level.phwhistletimer.hidewheninmenu = 0;
            level.phwhistletimer settimer(120);
            level.whistling = spawnstruct();
            level.whistling.label = #"mp_ph_whistling";
            level.whistling.x = 5;
            level.whistling.y = var_ed243a5d + var_15c99f84;
            level.whistling.alignx = "left";
            level.whistling.aligny = "top";
            level.whistling.horzalign = "left";
            level.whistling.vertalign = "top";
            level.whistling.archived = 1;
            level.whistling.alpha = 0;
            level.whistling.glowalpha = 0.2;
            level.whistling.hidewheninmenu = 0;
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x19e4c72b, Offset: 0x3878
// Size: 0x150
function eliminatedhudmonitor() {
    level endon(#"game_ended");
    while (1) {
        props = get_alive_nonspecating_players(game.defenders);
        level.elim_hud setvalue(props.size);
        foreach (player in level.players) {
            player clientfield::set_player_uimodel("hudItems.numPropsAlive", props.size);
        }
        level waittill(#"player_spawned", #"player_killed", #"player_eliminated", #"playercountchanged", #"propcountchanged", #"playerdisconnected");
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x6c38fe4c, Offset: 0x39d0
// Size: 0x104
function get_alive_nonspecating_players(team) {
    var_534b8623 = [];
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player) && (!isdefined(player.sessionstate) || player.sessionstate == "playing")) {
            if (!isdefined(team) || player.team == team) {
                var_534b8623[var_534b8623.size] = player;
            }
        }
    }
    return var_534b8623;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xf2932989, Offset: 0x3ae0
// Size: 0x11c
function function_3a38741e() {
    level notify(#"huntersforfeit");
    level endon(#"huntersforfeit", #"game_ended");
    wait(5);
    numhunters = 0;
    foreach (player in level.players) {
        if (isdefined(player) && isalive(player) && player.team === game.attackers) {
            numhunters++;
        }
    }
    if (numhunters < 1) {
        ph_endgame(game.defenders, 7);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x2e755c9e, Offset: 0x3c08
// Size: 0x5c
function onplayerdisconnect() {
    level notify(#"playerdisconnected");
    if (function_5a6214bd()) {
        thread function_2e77fae3(0.05);
    }
    level thread function_3a38741e();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x656e4991, Offset: 0x3c70
// Size: 0x2e
function function_241f7953() {
    while (isdefined(level.inprematchperiod) && level.inprematchperiod) {
        waitframe(1);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x3c52c8e6, Offset: 0x3ca8
// Size: 0x154
function function_71a55567() {
    level endon(#"game_ended");
    self endon(#"disconnect", #"death");
    waitframe(1);
    if (isdefined(self)) {
        changecount = int(level.phsettings.propchangecount);
        abilitycount = undefined;
        var_3a346a8 = undefined;
        if (isdefined(self.spawnedonce) && isdefined(self.changesleft)) {
            changecount = self.changesleft;
            abilitycount = self.abilityleft;
            var_3a346a8 = self.clonesleft;
        }
        self prop_controls::propsetchangesleft(changecount);
        self prop_controls::setnewabilitycount(self.currentability, abilitycount);
        self prop_controls::setnewabilitycount("CLONE", var_3a346a8);
        self clientfield::set_to_player("realtime_multiplay", 1);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x8affafdc, Offset: 0x3e08
// Size: 0x28c
function onspawnplayer(predictedspawn) {
    self.breathingstoptime = 0;
    if (self util::isprop()) {
        self.registermod_gas_spawn_ = undefined;
        if (!isdefined(self.abilityleft)) {
            self.abilityleft = 0;
        }
        if (!isdefined(self.clonesleft)) {
            self.clonesleft = 0;
        }
        if (!isdefined(self.pers[#"ability"])) {
            self.pers[#"ability"] = 0;
        }
        self.currentability = level.abilities[self.pers[#"ability"]];
        if (useprophudserver()) {
            self thread prop_controls::propcontrolshud();
        }
        self.isangleoffset = 0;
        self.var_b279086a = 1;
        self.var_4c45f505 = 1;
        self thread function_71a55567();
        self thread prop_controls::cleanuppropcontrolshudondeath();
        self thread handleprop();
    } else {
        self.abilityleft = undefined;
        self.clonesleft = undefined;
        self.var_4c45f505 = 0;
        if (!isdefined(self.registermod_gas_spawn_)) {
            self.registermod_gas_spawn_ = 0;
        }
        if (!isdefined(self.thrownspecialcount)) {
            self.thrownspecialcount = 0;
        }
        self thread function_58c3eef7();
    }
    self thread attackerswaittime();
    if (level.usestartspawns && !level.ingraceperiod && !level.playerqueuedrespawn) {
        level.usestartspawns = 0;
    }
    self.spawnedonce = 1;
    spawning::onspawnplayer(predictedspawn);
    if (!function_5a6214bd()) {
        if (self util::isprop()) {
            self function_ad2b0245();
        } else {
            self function_c2958208();
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x84d23be7, Offset: 0x40a0
// Size: 0x2aa
function monitortimers() {
    level endon(#"game_ended");
    function_241f7953();
    level.allow_teamchange = 0;
    foreach (player in level.players) {
        player.hasdonecombat = 1;
    }
    level thread function_6fd396();
    if (level.phsettings.prophidetime > 0) {
        level.phcountdowntimer settimer(level.phsettings.prophidetime);
        level.phcountdowntimer.alpha = 1;
    }
    if (useprophudserver() && level.phsettings.propwhistletime > 0) {
        level.phwhistletimer settimer(level.phsettings.propwhistletime + level.phsettings.prophidetime);
    }
    if (level.phsettings.prophidetime > 0 || level.phsettings.propwhistletime > 0) {
        whistlestarttimer(level.phsettings.propwhistletime + level.phsettings.prophidetime);
    }
    if (level.phsettings.prophidetime > 0) {
        function_1ee6f124(level.phsettings.prophidetime);
    }
    level flag::set("props_hide_over");
    if (useprophudserver()) {
        if (level.phsettings.propwhistletime > 0) {
            level.phwhistletimer.alpha = 1;
        }
        level.elim_hud.alpha = 1;
    }
    level.phcountdowntimer.alpha = 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x79db6dd9, Offset: 0x4358
// Size: 0x26a
function function_6fd396() {
    level endon(#"game_ended", #"props_hide_over");
    var_fb3f700 = int(level.phsettings.prophidetime + gettime() / 1000);
    totaltimepassed = 0;
    while (1) {
        level waittill(#"host_migration_begin");
        level.phcountdowntimer.alpha = 0;
        if (useprophudserver() && level.phsettings.propwhistletime > 0) {
            level.phwhistletimer.alpha = 0;
        }
        timepassed = int(hostmigration::waittillhostmigrationdone() / 1000);
        totaltimepassed = totaltimepassed + timepassed;
        timepassed = totaltimepassed;
        var_af091f9e = var_fb3f700 + timepassed - int(gettime() / 1000);
        level.phcountdowntimer settimer(var_af091f9e);
        if (useprophudserver() && level.phsettings.propwhistletime > 0) {
            level.phwhistletimer settimer(level.phsettings.propwhistletime + var_af091f9e);
        }
        whistlestarttimer(level.phsettings.propwhistletime + var_af091f9e);
        level.phcountdowntimer.alpha = 1;
        if (useprophudserver() && level.phsettings.propwhistletime > 0) {
            level.phwhistletimer.alpha = 1;
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xab23652e, Offset: 0x45d0
// Size: 0x2cc
function handleprop() {
    level endon(#"game_ended");
    self endon(#"disconnect", #"death");
    self waittill(#"applyloadout");
    self allowprone(0);
    self allowcrouch(0);
    self allowsprint(0);
    self allowslide(0);
    self allowmelee(0);
    self playerknockback(0);
    self takeallweapons();
    self disableweaponfire();
    self allowspectateteam(game.attackers, 1);
    self ghost();
    self setclientuivisibilityflag("weapon_hud_visible", 0);
    self function_6638bcd5(0);
    self.healthregendisabled = 1;
    self.concussionimmune = undefined;
    self.var_f16a71ae = 1;
    /#
        assert(!isdefined(self.prop));
    #/
    self thread setupprop();
    self thread prop_controls::setupkeybindings();
    self thread setupdamage();
    self thread prop_controls::propinputwatch();
    self thread propwatchdeath();
    self thread propwatchcleanupondisconnect();
    self thread propwatchcleanuponroundend();
    self thread propwatchprematchsettings();
    /#
        if (getdvarint(#"hash_41fd7f61c0fc49af", 0) == 1) {
            self thread function_63d4897();
        }
    #/
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x15db4a2a, Offset: 0x48a8
// Size: 0x64
function on_player_loadout() {
    if (self util::isprop()) {
        self setmovespeedscale(level.phsettings.propspeedscale);
    } else {
        self setmovespeedscale(1);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x9e6d9cf0, Offset: 0x4918
// Size: 0xce
function getthirdpersonrangeforsize(propsize) {
    switch (propsize) {
    case 50:
        return 120;
    case 75:
        return 150;
    case 150:
        return 180;
    case 250:
        return 260;
    case 350:
        return 320;
    default:
        /#
            assertmsg("destruct/fx8_dest_prop_lg" + propsize);
        #/
        break;
    }
    return 120;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x3d38b2d8, Offset: 0x49f0
// Size: 0xc4
function getthirdpersonheightoffsetforsize(propsize) {
    switch (propsize) {
    case 50:
        return -30;
    case 75:
        return -20;
    case 150:
        return 0;
    case 250:
        return 20;
    case 350:
        return 40;
    default:
        /#
            assertmsg("destruct/fx8_dest_prop_lg" + propsize);
        #/
        break;
    }
    return 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x430549b0, Offset: 0x4ac0
// Size: 0x162
function applyxyzoffset() {
    if (!isdefined(self.prop.xyzoffset)) {
        return;
    }
    self.prop.angles = self.angles;
    forward = anglestoforward(self.prop.angles) * self.prop.xyzoffset[0];
    right = anglestoright(self.prop.angles) * self.prop.xyzoffset[1];
    up = anglestoup(self.prop.angles) * self.prop.xyzoffset[2];
    self.prop.origin = self.prop.origin + forward;
    self.prop.origin = self.prop.origin + right;
    self.prop.origin = self.prop.origin + up;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x91634c52, Offset: 0x4c30
// Size: 0x6e
function applyanglesoffset() {
    if (!isdefined(self.prop.anglesoffset)) {
        return;
    }
    self.prop.angles = self.angles;
    self.prop.angles = self.prop.angles + self.prop.anglesoffset;
    self.isangleoffset = 1;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x3f0e75c3, Offset: 0x4ca8
// Size: 0x550
function propwhistle() {
    level endon(#"game_ended");
    function_241f7953();
    var_e9aeaa85 = gettime();
    whistletime = level.phsettings.propwhistletime * 1000;
    var_cc98cae0 = 20000;
    var_2baed43 = var_cc98cae0;
    var_2d0854a2 = 500;
    var_99b741b6 = 5000;
    var_ec943162 = 0;
    var_b87d1ed = (0, 0, 0);
    var_8419e70e = getentarray("minimap_corner", "targetname");
    if (var_8419e70e.size > 0) {
        var_b87d1ed = var_8419e70e[0].origin;
    }
    hostmigration::waitlongdurationwithhostmigrationpause(level.phsettings.prophidetime);
    setbombtimer("A", gettime() + whistletime);
    setmatchflag("bomb_timer_a", 1);
    hostmigration::waitlongdurationwithhostmigrationpause(level.phsettings.propwhistletime);
    while (1) {
        if (var_e9aeaa85 + whistletime - var_2d0854a2 < gettime()) {
            var_ec943162++;
            setmatchflag("bomb_timer_a", 0);
            if (useprophudserver()) {
                level.phwhistletimer.alpha = 0;
                level.whistling.alpha = 1;
                level.whistling.alpha = 0.6;
            }
            sortedplayers = arraysortclosest(level.players, var_b87d1ed);
            foreach (player in sortedplayers) {
                if (!isdefined(player)) {
                    continue;
                }
                if (player util::isprop() && isalive(player)) {
                    playsoundatposition("mpl_phunt_char_whistle", player.origin + vectorscale((0, 0, 1), 60));
                    hostmigration::waitlongdurationwithhostmigrationpause(1.5);
                }
            }
            var_e9aeaa85 = gettime();
            if (var_2baed43 >= globallogic_utils::gettimeremaining() - var_99b741b6) {
                if (useprophudserver()) {
                    level.whistling.alpha = 0;
                }
                return;
            } else {
                if (var_2baed43 * 2 + getteamplayersalive(game.defenders) * 2500 >= globallogic_utils::gettimeremaining() - var_99b741b6) {
                    if (useprophudserver()) {
                        level.phwhistletimer.label = #"mp_ph_final_whistle";
                    }
                    var_2baed43 = var_2baed43 + getteamplayersalive(game.defenders) * 2500;
                }
                if (useprophudserver()) {
                    level.phwhistletimer settimer(int(whistletime / 1000));
                }
                whistlestarttimer(int(whistletime / 1000));
                if (useprophudserver()) {
                    level.whistling.alpha = 0;
                    level.phwhistletimer.alpha = 1;
                }
            }
            setbombtimer("A", gettime() + int(whistletime));
            setmatchflag("bomb_timer_a", 1);
        }
        hostmigration::waitlongdurationwithhostmigrationpause(0.5);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xda5e91d, Offset: 0x5200
// Size: 0xd8
function getlivingplayersonteam(team) {
    players = [];
    foreach (player in level.players) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (isalive(player) && player.team == team) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x68ad15f4, Offset: 0x52e0
// Size: 0xb4
function setupdamage() {
    level endon(#"game_ended");
    self endon(#"death", #"disconnect");
    hostmigration::waitlongdurationwithhostmigrationpause(0.5);
    self.prop.health = 99999;
    self.prop.maxhealth = 99999;
    self.prop thread function_aa8db165(&damagewatch);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x7276db99, Offset: 0x53a0
// Size: 0xea
function function_aa8db165(damagecallback) {
    level endon(#"game_ended");
    self endon(#"death");
    while (1) {
        res = undefined;
        res = self waittill(#"damage");
        self thread [[ damagecallback ]](res.amount, res.attacker, res.direction, res.position, res.mod, res.model_name, res.bone_name, res.part_name, res.weapon, res.flags);
    }
}

// Namespace prop/prop
// Params 10, eflags: 0x0
// Checksum 0x1f1e125a, Offset: 0x5498
// Size: 0x1aa
function damagewatch(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, weapon, idflags) {
    if (!isdefined(attacker)) {
        return;
    }
    if (!isdefined(self.owner)) {
        return;
    }
    if (isplayer(attacker)) {
        if (attacker.pers[#"team"] == self.owner.pers[#"team"]) {
            return;
        }
        attacker thread damagefeedback::update();
        if (isdefined(weapon) && weapon.rootweapon === level.phsettings.var_86fda1fd && isdefined(meansofdeath) && meansofdeath != "MOD_IMPACT") {
            prop_controls::function_d04b961(attacker, undefined, meansofdeath, damage, point, weapon);
        }
    }
    self.owner dodamage(damage, point, attacker, attacker, "none", "MOD_IMPACT", idflags, weapon);
    self.health = 99999;
    self.maxhealth = 99999;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x914f97d2, Offset: 0x5650
// Size: 0x4c
function propcleanup() {
    array = array(self.prop, self.propanchor, self.propent);
    self thread propcleanupdelayed(array);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x835b8ab5, Offset: 0x56a8
// Size: 0x88
function function_4ef97d9b(propents) {
    foreach (prop in propents) {
        if (isdefined(prop)) {
            prop unlink();
        }
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x90d6f909, Offset: 0x5738
// Size: 0xa8
function propcleanupdelayed(propents) {
    function_4ef97d9b(propents);
    waitframe(1);
    foreach (prop in propents) {
        if (isdefined(prop)) {
            prop delete();
        }
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x694ce139, Offset: 0x57e8
// Size: 0xe2
function function_d43d7033(propsize) {
    if (isdefined(propsize)) {
        switch (propsize) {
        case 50:
            return "propDeathFX_s";
        case 75:
            return "propDeathFX_s";
        case 150:
            return "propDeathFX_m";
        case 250:
            return "propDeathFX_l";
        case 350:
            return "propDeathFX_l";
        default:
            /#
                assertmsg("destruct/fx8_dest_prop_lg" + propsize);
            #/
            break;
        }
    }
    return "propDeathFX";
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x7d024d0a, Offset: 0x58d8
// Size: 0x13c
function propwatchdeath() {
    level endon(#"game_ended");
    self endon(#"disconnect");
    self waittill(#"death");
    corpse = self.body;
    playsoundatposition("wpn_flash_grenade_explode", self.prop.origin + vectorscale((0, 0, 1), 4));
    var_7659ae6f = function_d43d7033(self.prop.info.propsize);
    playfx(fx::get(var_7659ae6f), self.prop.origin + vectorscale((0, 0, 1), 4));
    if (isdefined(corpse)) {
        corpse delete();
    }
    self propcleanup();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x16952eff, Offset: 0x5a20
// Size: 0x7c
function propwatchcleanupondisconnect() {
    self notify(#"propwatchcleanupondisconnect");
    self endon(#"propwatchcleanupondisconnect");
    level endon(#"game_ended");
    self waittill(#"disconnect");
    self propcleanup();
    self propclonecleanup();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x869b4ab9, Offset: 0x5aa8
// Size: 0x7c
function propwatchcleanuponroundend() {
    self notify(#"hash_23d745b724b7c0bd");
    self endon(#"hash_23d745b724b7c0bd", #"disconnect");
    level waittill(#"round_end_done");
    self propcleanup();
    self propclonecleanup();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x3f32fd1a, Offset: 0x5b30
// Size: 0x90
function propclonecleanup() {
    if (isdefined(self.propclones)) {
        foreach (clone in self.propclones) {
            if (isdefined(clone)) {
                clone delete();
            }
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xc604872b, Offset: 0x5bc8
// Size: 0xa4
function propwatchprematchsettings() {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    function_241f7953();
    self allowprone(0);
    self allowcrouch(0);
    self allowsprint(0);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x747ef7e1, Offset: 0x5c78
// Size: 0x22
function organizeproplist(inarray) {
    return array::randomize(inarray);
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x97a70488, Offset: 0x5ca8
// Size: 0x182
function randgetpropsizetoallocate() {
    var_7e9c5521 = 10 * isdefined(level.proplist[50]);
    var_640cfc88 = 30 * isdefined(level.proplist[75]);
    var_dade57fb = 40 * isdefined(level.proplist[150]);
    var_bc337198 = 20 * isdefined(level.proplist[250]);
    var_b232d552 = 10 * isdefined(level.proplist[350]);
    randomrange = var_7e9c5521 + var_640cfc88 + var_dade57fb + var_bc337198 + var_b232d552;
    randomval = randomint(randomrange);
    if (randomval < var_7e9c5521) {
        return 50;
    }
    randomval = randomval - var_7e9c5521;
    if (randomval < var_640cfc88) {
        return 75;
    }
    randomval = randomval - var_640cfc88;
    if (randomval < var_dade57fb) {
        return 150;
    }
    randomval = randomval - var_dade57fb;
    if (randomval < var_bc337198) {
        return 250;
    }
    randomval = randomval - var_bc337198;
    return 350;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x4180bdcd, Offset: 0x5e38
// Size: 0x280
function getnextprop(inplayer) {
    var_f220f2d1 = randgetpropsizetoallocate();
    var_d4cb730b = getarraykeys(level.proplist);
    var_d4cb730b = array::randomize(var_d4cb730b);
    var_698ec5ba = array(var_f220f2d1);
    foreach (size in var_d4cb730b) {
        if (size != var_f220f2d1) {
            var_698ec5ba[var_698ec5ba.size] = size;
        }
    }
    prop = undefined;
    for (i = 0; i < var_698ec5ba.size; i++) {
        size = var_698ec5ba[i];
        if (!isdefined(level.proplist[size]) || !level.proplist[size].size) {
            continue;
        }
        _tomb_zmb_ee_monitor_button = array::randomize(level.proplist[size]);
        for (j = 0; j < _tomb_zmb_ee_monitor_button.size; j++) {
            prop = _tomb_zmb_ee_monitor_button[j];
            var_72595382 = 0;
            if (isdefined(inplayer.usedprops) && inplayer.usedprops.size) {
                for (index = 0; index < inplayer.usedprops.size; index++) {
                    if (prop.modelname == inplayer.usedprops[index].modelname) {
                        var_72595382 = 1;
                        break;
                    }
                }
            }
            if (!var_72595382) {
                return prop;
            }
        }
    }
    return prop;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x838b7ab4, Offset: 0x60c0
// Size: 0xe
function getmapname() {
    return level.script;
}

// Namespace prop/prop
// Params 3, eflags: 0x0
// Checksum 0xe6f259dd, Offset: 0x60d8
// Size: 0x5e
function tablelookupbyrow(var_a01224f2, rowindex, columnindex) {
    columns = tablelookuprow(var_a01224f2, rowindex);
    if (columnindex < columns.size) {
        return columns[columnindex];
    }
    return "";
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xa9b146d7, Offset: 0x6140
// Size: 0x4ae
function populateproplist() {
    mapname = getmapname();
    var_a01224f2 = "gamedata/tables/mp/" + mapname + "_ph.csv";
    numrows = tablelookuprowcount(var_a01224f2);
    for (rowindex = 0; rowindex < numrows; rowindex++) {
        modelname = tablelookupbyrow(var_a01224f2, rowindex, 0);
        propsizetext = tablelookupbyrow(var_a01224f2, rowindex, 1);
        propscale = float(tablelookupbyrow(var_a01224f2, rowindex, 2));
        offsetx = int(tablelookupbyrow(var_a01224f2, rowindex, 3));
        offsety = int(tablelookupbyrow(var_a01224f2, rowindex, 4));
        offsetz = int(tablelookupbyrow(var_a01224f2, rowindex, 5));
        rotationx = int(tablelookupbyrow(var_a01224f2, rowindex, 6));
        rotationy = int(tablelookupbyrow(var_a01224f2, rowindex, 7));
        rotationz = int(tablelookupbyrow(var_a01224f2, rowindex, 8));
        propheight = tablelookupbyrow(var_a01224f2, rowindex, 9);
        proprange = tablelookupbyrow(var_a01224f2, rowindex, 10);
        offset = undefined;
        if (isdefined(offsetx) && isdefined(offsety) && isdefined(offsetz)) {
            offset = (offsetx, offsety, offsetz);
        }
        rotation = undefined;
        if (isdefined(rotationx) && isdefined(rotationy) && isdefined(rotationz)) {
            rotation = (rotationx, rotationy, rotationz);
        }
        if (!isdefined(propscale) || propscale == 0) {
            propscale = 1;
        }
        propsize = getpropsize(propsizetext);
        if (!isdefined(propheight) || propheight == "") {
            propheight = getthirdpersonheightoffsetforsize(propsize);
        } else {
            propheight = int(propheight);
        }
        if (!isdefined(proprange) || proprange == "") {
            proprange = getthirdpersonrangeforsize(propsize);
        } else {
            proprange = int(proprange);
        }
        addproptolist(modelname, propsize, offset, rotation, propsizetext, propscale, propheight, proprange);
    }
    if (numrows == 0) {
        addproptolist("tag_origin", 150, (0, 0, 0), (0, 0, 0), "medium", 1, getthirdpersonheightoffsetforsize(150), getthirdpersonrangeforsize(150));
    }
    level.proplist = organizeproplist(level.proplist);
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x67272f08, Offset: 0x65f8
// Size: 0x54c
function setupprop() {
    self notsolid();
    if (!isdefined(level.phsettings.var_b5f21379) || level.phsettings.var_b5f21379 == 0) {
        level.phsettings.var_b5f21379 = self setcontents(0);
    } else {
        self setcontents(0);
    }
    self setplayercollision(0);
    propinfo = self.propinfo;
    if (!isdefined(self.propinfo)) {
        propinfo = getnextprop(self);
    }
    self.propanchor = spawn("script_model", self.origin);
    self.propanchor.targetname = "propAnchor";
    self.propanchor linkto(self);
    self.propanchor setcontents(0);
    self.propanchor notsolid();
    self.propanchor setplayercollision(0);
    self.propent = spawn("script_model", self.origin);
    self.propent.targetname = "propEnt";
    self.propent linkto(self.propanchor);
    self.propent setcontents(0);
    self.propent notsolid();
    self.propent setplayercollision(0);
    self.prop = spawn("script_model", self.propent.origin);
    self.prop.targetname = "prop";
    self.prop setmodel(propinfo.modelname);
    self.prop setscale(propinfo.propscale);
    self.prop setcandamage(1);
    self.prop setowner(self);
    self.prop.xyzoffset = propinfo.xyzoffset;
    self.prop.anglesoffset = propinfo.anglesoffset;
    self applyxyzoffset();
    self applyanglesoffset();
    self.prop linkto(self.propent);
    self.prop.owner = self;
    self.prop.health = 10000;
    self.prop setplayercollision(0);
    self.prop clientfield::set("enemyequip", 1);
    if (function_5a6214bd()) {
        self thread function_9c1a133a(0);
    }
    self.thirdpersonrange = propinfo.proprange;
    self.thirdpersonheightoffset = propinfo.propheight;
    self clientfield::set_to_player("PROP.cameraRange", int(self.thirdpersonrange / 10));
    self clientfield::set_to_player("PROP.cameraHeight", int(self.thirdpersonheightoffset / 10));
    self clientfield::set_to_player("PROP.change_prop", !clientfield::get_to_player("PROP.change_prop"));
    self setclientthirdperson(1);
    self.prop.info = propinfo;
    self.propinfo = propinfo;
    if (!isdefined(self.spawnedonce)) {
        self.usedprops = [];
    }
    self.health = getprophealth(propinfo);
    self function_239d2233(int(self.health));
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xcd26161b, Offset: 0x6b50
// Size: 0x816
function function_63d4897() {
    /#
        level endon(#"game_ended");
        self endon(#"disconnect");
        function_32041818();
        var_309e583f = spawnstruct();
        var_309e583f.xyzoffset = self.prop.info.xyzoffset;
        var_309e583f.anglesoffset = self.prop.info.anglesoffset;
        var_309e583f.propheight = self.prop.info.propheight;
        var_309e583f.proprange = self.prop.info.proprange;
        var_309e583f.propscale = self.prop.info.propscale;
        while (1) {
            var_94903b3f = 0;
            offsetx = getdvarfloat(#"prop_offsetx", -0.0123);
            offsety = getdvarfloat(#"prop_offsety", -0.0123);
            offsetz = getdvarfloat(#"prop_offsetz", -0.0123);
            if (offsetx != -0.0123 && offsetx != var_309e583f.xyzoffset[0]) {
                var_309e583f.xyzoffset = (offsetx, var_309e583f.xyzoffset[1], var_309e583f.xyzoffset[2]);
                var_94903b3f = 1;
            }
            if (offsety != -0.0123 && offsety != var_309e583f.xyzoffset[1]) {
                var_309e583f.xyzoffset = (var_309e583f.xyzoffset[0], offsety, var_309e583f.xyzoffset[2]);
                var_94903b3f = 1;
            }
            if (offsetz != -0.0123 && offsetz != var_309e583f.xyzoffset[2]) {
                var_309e583f.xyzoffset = (var_309e583f.xyzoffset[0], var_309e583f.xyzoffset[1], offsetz);
                var_94903b3f = 1;
            }
            if (var_94903b3f) {
                self.prop unlink();
                self.prop.xyzoffset = var_309e583f.xyzoffset;
                self.prop.origin = self.origin;
                self applyxyzoffset();
                self applyanglesoffset();
                self.prop linkto(self.propent);
            }
            var_d0a5fa3b = 0;
            var_e82609ca = getdvarfloat(#"hash_1cc010d013592cb", -0.0123);
            var_c7d5278 = getdvarfloat(#"hash_1cc000d01359118", -0.0123);
            var_8c51d21f = getdvarfloat(#"hash_1cc030d01359631", -0.0123);
            if (var_e82609ca != -0.0123 && var_e82609ca != var_309e583f.anglesoffset[0]) {
                var_309e583f.anglesoffset = (var_e82609ca, var_309e583f.anglesoffset[1], var_309e583f.anglesoffset[2]);
                var_d0a5fa3b = 1;
            }
            if (var_c7d5278 != -0.0123 && var_c7d5278 != var_309e583f.anglesoffset[1]) {
                var_309e583f.anglesoffset = (var_309e583f.anglesoffset[0], var_c7d5278, var_309e583f.anglesoffset[2]);
                var_d0a5fa3b = 1;
            }
            if (var_8c51d21f != -0.0123 && var_8c51d21f != var_309e583f.anglesoffset[2]) {
                var_309e583f.anglesoffset = (var_309e583f.anglesoffset[0], var_309e583f.anglesoffset[1], var_8c51d21f);
                var_d0a5fa3b = 1;
            }
            if (var_d0a5fa3b) {
                self.prop unlink();
                self.prop.anglesoffset = var_309e583f.anglesoffset;
                self applyanglesoffset();
                self.prop linkto(self.propent);
            }
            height = getdvarint(#"prop_height", -1);
            if (height != -1 && height != var_309e583f.propheight) {
                var_309e583f.propheight = height;
                self.prop.info.propheight = height;
                self.thirdpersonheightoffset = height;
                clientfield::set_to_player("propDeathFX_s", int(self.thirdpersonheightoffset / 10));
            }
            range = getdvarint(#"prop_range", -1);
            if (range != -1 && range != var_309e583f.proprange) {
                var_309e583f.proprange = range;
                self.prop.info.proprange = range;
                self.thirdpersonrange = range;
                clientfield::set_to_player("still_alive_medium_bonus", int(self.thirdpersonrange / 10));
            }
            scale = getdvarfloat(#"prop_scale", -0.0123);
            if (scale != -0.0123 && scale != var_309e583f.propscale) {
                var_309e583f.propscale = scale;
                self.prop.info.propscale = scale;
                self.prop setscale(scale);
            }
            waitframe(1);
        }
    #/
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x4e17988c, Offset: 0x7370
// Size: 0x3bc
function function_32041818() {
    /#
        path = "prop_killed_all_props";
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
        adddebugcommand("<unknown string>" + path + "<unknown string>" + "<unknown string>" + "<unknown string>");
    #/
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x2291df93, Offset: 0x7738
// Size: 0x22
function getprophealth(propinfo) {
    return int(propinfo.propsize);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xb1b600f3, Offset: 0x7768
// Size: 0x6e
function function_239d2233(health) {
    self.var_66cb03ad = health;
    self.maxhealth = health;
    self.var_894f7879[#"prop"] = health - (isdefined(level.var_90bb9821) ? level.var_90bb9821 : 0) - self.spawnhealth;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xebe423, Offset: 0x77e0
// Size: 0x16e
function getpropsize(propsizetext) {
    /#
        if (propsizetext == "<unknown string>") {
            return 0;
        }
    #/
    propsize = 0;
    switch (propsizetext) {
    case #"xsmall":
        propsize = 50;
        break;
    case #"small":
        propsize = 75;
        break;
    case #"medium":
        propsize = 150;
        break;
    case #"large":
        propsize = 250;
        break;
    case #"xlarge":
        propsize = 350;
        break;
    default:
        mapname = getmapname();
        var_a01224f2 = "gamedata/tables/mp/" + mapname + "_ph.csv";
        /#
            assertmsg("<unknown string>" + propsizetext + "<unknown string>" + var_a01224f2 + "<unknown string>");
        #/
        propsize = 75;
        break;
    }
    return propsize;
}

// Namespace prop/prop
// Params 8, eflags: 0x0
// Checksum 0x1d3bca75, Offset: 0x7958
// Size: 0x204
function addproptolist(modelname, propsize, xyzoffset, anglesoffset, propsizetext, propscale, propheight, proprange) {
    if (!isdefined(level.proplist)) {
        level.proplist = [];
    }
    if (!isdefined(level.propindex)) {
        level.propindex = [];
    }
    if (!isdefined(level.proplist[propsize])) {
        level.proplist[propsize] = [];
    }
    propinfo = spawnstruct();
    propinfo.modelname = modelname;
    propinfo.propscale = propscale;
    propinfo.propsize = int(propsize);
    propinfo.propsizetext = propsizetext;
    if (isdefined(xyzoffset)) {
        propinfo.xyzoffset = xyzoffset;
    }
    if (isdefined(anglesoffset)) {
        propinfo.anglesoffset = anglesoffset;
    }
    propinfo.proprange = proprange;
    propinfo.propheight = propheight;
    index = level.propindex.size;
    level.propindex[index] = [];
    level.propindex[index][0] = propsize;
    level.propindex[index][1] = level.proplist[propsize].size;
    level.proplist[propsize][level.proplist[propsize].size] = propinfo;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x53f0f0f6, Offset: 0x7b68
// Size: 0x44
function function_36f8016e(winning_team, var_c1e98979) {
    round::set_winner(winning_team);
    thread globallogic::function_a3e3bd39(winning_team, var_c1e98979);
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xc8850221, Offset: 0x7bb8
// Size: 0x74
function ph_endgame(winningteam, endreasontext) {
    if (isdefined(level.endingph) && level.endingph) {
        return;
    }
    level.endingph = 1;
    ph_setfinalkillcamwinner(winningteam);
    thread function_36f8016e(winningteam, endreasontext);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x3183bdb5, Offset: 0x7c38
// Size: 0x3e
function ph_setfinalkillcamwinner(winningteam) {
    level.finalkillcam_winner = winningteam;
    if (level.finalkillcam_winner == game.defenders) {
        level.var_5614d415 = 1;
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xfab2ce5, Offset: 0x7c80
// Size: 0xdc
function setphteamscores() {
    level endon(#"game_ended");
    var_492090b6 = 0;
    var_4e6d94ea = 0;
    if (isdefined(game.stat[#"roundswon"])) {
        var_4e6d94ea = game.stat[#"roundswon"][game.defenders];
        var_492090b6 = game.stat[#"roundswon"][game.attackers];
    }
    setteamscore(game.defenders, var_4e6d94ea);
    setteamscore(game.attackers, var_492090b6);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xf0749b71, Offset: 0x7d68
// Size: 0x184
function ononeleftevent(team) {
    if (isdefined(level.gameended) && level.gameended) {
        return;
    }
    if (team == game.attackers) {
        return;
    }
    lastplayer = undefined;
    foreach (player in level.players) {
        if (isdefined(team) && player.team != team) {
            continue;
        }
        if (!isalive(player) && !player globallogic_spawn::mayspawn()) {
            continue;
        }
        if (isdefined(lastplayer)) {
            return;
        }
        lastplayer = player;
    }
    if (!isdefined(lastplayer)) {
        return;
    }
    globallogic_audio::leader_dialog("propNoLivesEnemy", game.defenders);
    globallogic_audio::leader_dialog("propNoLives", game.attackers);
    lastplayer thread givelastonteamwarning();
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x64d60df9, Offset: 0x7ef8
// Size: 0xd0
function waittillrecoveredhealth(time, interval) {
    self endon(#"death", #"disconnect");
    fullhealthtime = 0;
    if (!isdefined(interval)) {
        interval = 0.05;
    }
    if (!isdefined(time)) {
        time = 0;
    }
    while (1) {
        if (self.health != self.maxhealth) {
            fullhealthtime = 0;
        } else {
            fullhealthtime = fullhealthtime + interval;
        }
        wait(interval);
        if (self.health == self.maxhealth && fullhealthtime >= time) {
            break;
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x7398a15f, Offset: 0x7fd8
// Size: 0xa8
function givelastonteamwarning() {
    self endon(#"death", #"disconnect");
    level endon(#"game_ended");
    self waittillrecoveredhealth(3);
    if (self util::isprop()) {
        level notify(#"hash_2732c975dc66dd9e");
        level.nopropsspectate = 1;
    }
    level notify(#"last_alive", self);
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x541307cf, Offset: 0x8088
// Size: 0x44
function function_c4aeb146(var_efb758a8, calloutplayer) {
    luinotifyevent(#"player_callout", 2, var_efb758a8, calloutplayer.entnum);
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xe04904b5, Offset: 0x80d8
// Size: 0x1a4
function ontimelimit() {
    if (!(isdefined(level.gameending) && level.gameending)) {
        function_12388dcc();
        if (isdefined(level.finalkillcam) && level.finalkillcam) {
            choosefinalkillcam();
        }
        potm::function_1cffcfda();
        potm::function_3438c1f4();
        potm::function_734a7d24(0);
        foreach (player in level.players) {
            if (player util::isprop() && isalive(player)) {
                if (isdefined(1) && 1) {
                    potm::bookmark(#"prop_survive", gettime(), player);
                }
                scoreevents::processscoreevent("prop_survived_entire_round", player);
            }
        }
        ph_endgame(game.defenders, 2);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x92d105f6, Offset: 0x8288
// Size: 0xde
function function_12388dcc() {
    var_16710857 = globallogic_defaults::default_gettimelimit() * 60 * 1000;
    timepassed = globallogic_utils::gettimepassed();
    var_b058d557 = int(min(var_16710857, timepassed));
    game.propsurvivaltime[game.defenders] = game.propsurvivaltime[game.defenders] + var_b058d557;
    game.hunterkilltime[game.attackers] = game.hunterkilltime[game.attackers] + var_b058d557;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x91672ee, Offset: 0x8370
// Size: 0x19c
function choosefinalkillcam() {
    var_545f0775 = getlivingplayersonteam(game.defenders);
    if (var_545f0775.size < 1) {
        return;
    }
    var_57713248 = getlivingplayersonteam(game.attackers);
    if (var_57713248.size < 1) {
        return;
    }
    var_c0cc60e6 = choosebestpropforkillcam(var_545f0775, var_57713248);
    if (isplayer(var_c0cc60e6)) {
        attackernum = var_c0cc60e6 getentitynumber();
    } else {
        attackernum = -1;
    }
    victim = var_57713248[0];
    victim.deathtime = gettime() - 1000;
    weap = getweapon("none");
    killcam_entity_info = killcam::get_killcam_entity_info(var_c0cc60e6, var_c0cc60e6, weap);
    level thread killcam::record_settings(attackernum, victim getentitynumber(), weap, "MOD_UNKNOWN", victim.deathtime, 0, 0, killcam_entity_info, [], [], var_c0cc60e6);
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xa681b288, Offset: 0x8518
// Size: 0x1fa
function choosebestpropforkillcam(var_545f0775, var_57713248) {
    var_66c9ce36 = undefined;
    var_910c4a2e = 1073741824;
    foreach (prop in var_545f0775) {
        /#
            assert(isalive(prop));
        #/
        var_e2abfc9e = undefined;
        var_9916cef = 1073741824;
        foreach (hunter in var_57713248) {
            pathdist = pathdistance(prop.origin, hunter.origin);
            if (!isdefined(pathdist)) {
                pathdist = distance(prop.origin, hunter.origin);
            }
            if (pathdist < var_9916cef) {
                var_9916cef = pathdist;
                var_e2abfc9e = hunter;
            }
        }
        if (var_9916cef < var_910c4a2e) {
            var_910c4a2e = var_9916cef;
            var_66c9ce36 = prop;
        }
    }
    if (!isdefined(var_66c9ce36)) {
        var_66c9ce36 = array::random(var_545f0775);
    }
    return var_66c9ce36;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x600fdd25, Offset: 0x8720
// Size: 0x5c
function function_d25cfae3(setclientfield) {
    self show();
    self notify(#"showplayer");
    if (setclientfield) {
        self clientfield::set("hideTeamPlayer", 0);
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xf5b32206, Offset: 0x8788
// Size: 0xdc
function function_832a882d(team, setclientfield) {
    self hide();
    if (setclientfield) {
        self thread function_aa8a29ee(team);
    }
    foreach (player in level.players) {
        self thread function_8e69759(player, team);
    }
    self thread function_3ea2519e(team);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x9aa44c4e, Offset: 0x8870
// Size: 0x94
function function_aa8a29ee(team) {
    level endon(#"game_ended");
    self endon(#"disconnect", #"showplayer");
    waitframe(1);
    teamint = 1;
    if (team == "axis") {
        teamint = 2;
    }
    self clientfield::set("hideTeamPlayer", teamint);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x83bf69c3, Offset: 0x8910
// Size: 0xb0
function function_3ea2519e(team) {
    level endon(#"game_ended");
    self endon(#"disconnect", #"showplayer");
    while (1) {
        res = undefined;
        res = level waittill(#"connected");
        player = res.player;
        self thread function_8e69759(player, team);
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x4b6aedf5, Offset: 0x89c8
// Size: 0x130
function function_8e69759(player, team) {
    level endon(#"game_ended");
    self endon(#"disconnect", #"showplayer");
    player endon(#"disconnect");
    if (self util::isprop()) {
        self ghost();
    }
    while (1) {
        if (isdefined(player.hasspawned) && player.hasspawned && player.team != team) {
            self showtoplayer(player);
            if (self util::isprop()) {
                self ghost();
            }
        }
        player waittill(#"spawned");
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xf566d75b, Offset: 0x8b00
// Size: 0x16c
function function_58c3eef7() {
    self.thirdpersonrange = undefined;
    self setclientthirdperson(0);
    self allowprone(1);
    self allowsprint(1);
    self allowmelee(1);
    self allowslide(1);
    self playerknockback(1);
    self enableweaponfire();
    self show();
    self setclientuivisibilityflag("weapon_hud_visible", 1);
    self function_6638bcd5(1);
    if (function_5a6214bd()) {
        self function_416db484(0);
    }
    self.var_f07d3654 = 0;
    self.var_f16a71ae = 0;
    self.concussionimmune = 1;
    self.healthregendisabled = 0;
    self thread attackerregenammo();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x40e52c5b, Offset: 0x8c78
// Size: 0x262
function stillalivexp() {
    level endon(#"game_ended");
    level.var_b06adc58[#"kill"][#"value"] = 300;
    level waittill(#"props_hide_over");
    while (1) {
        hostmigration::waitlongdurationwithhostmigrationpause(10);
        /#
            if (getgametypesetting("<unknown string>") == 0) {
                continue;
            }
        #/
        foreach (player in level.players) {
            if (!isdefined(player.team)) {
                continue;
            }
            if (player.team == game.attackers) {
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            if (!isdefined(player.prop)) {
                continue;
            }
            scoreevents::processscoreevent("still_alive", player);
            switch (player.prop.info.propsize) {
            case 150:
                scoreevents::processscoreevent("still_alive_medium_bonus", player);
                break;
            case 250:
                scoreevents::processscoreevent("still_alive_large_bonus", player);
                break;
            case 350:
                scoreevents::processscoreevent("still_alive_extra_large_bonus", player);
                break;
            default:
                break;
            }
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x7eb34dbd, Offset: 0x8ee8
// Size: 0x190
function tracktimealive() {
    level endon(#"game_ended");
    function_241f7953();
    while (1) {
        foreach (player in level.players) {
            if (!isdefined(player.team)) {
                continue;
            }
            if (player.team == game.attackers) {
                continue;
            }
            if (!isalive(player)) {
                continue;
            }
            player.pers[#"objtime"]++;
            player.objtime = player.pers[#"objtime"];
            player stats::function_bb7eedf0(#"objective_time", 1);
            player globallogic_score::incpersstat(#"objectivetime", 1, 0, 1);
        }
        hostmigration::waitlongdurationwithhostmigrationpause(1);
    }
}

// Namespace prop/prop
// Params 11, eflags: 0x0
// Checksum 0x5f99cc1b, Offset: 0x9080
// Size: 0xc2
function gamemodemodifyplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, sweapon, vpoint, vdir, shitloc, psoffsettime, boneindex) {
    victim = self;
    if (isdefined(eattacker) && isplayer(eattacker) && isalive(eattacker)) {
        if (!isdefined(eattacker.hashitplayer)) {
            eattacker.hashitplayer = 1;
        }
    }
    return idamage;
}

// Namespace prop/prop
// Params 6, eflags: 0x0
// Checksum 0xdf3734f6, Offset: 0x9150
// Size: 0xbe
function function_d1f10992(idflags, shitloc, weapon, friendlyfire, attackerishittingself, smeansofdeath) {
    if (isdefined(smeansofdeath) && smeansofdeath == "MOD_FALLING") {
        return 1;
    }
    if (self function_84793f03()) {
        if (weapon === level.phsettings.var_86fda1fd) {
            return 1;
        }
        if (issubstr(weapon.name, "destructible")) {
            return 1;
        }
    }
    return 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xe92a2b21, Offset: 0x9218
// Size: 0x144
function attackerswaittime() {
    level endon(#"game_ended");
    self endon(#"disconnect");
    function_241f7953();
    while (!isdefined(level.starttime)) {
        waitframe(1);
    }
    while (isdefined(self.controlsfrozen) && self.controlsfrozen) {
        waitframe(1);
    }
    var_167fb943 = function_7bd9c9c2();
    remainingtime = level.phsettings.prophidetime - var_167fb943;
    result = 0;
    if (remainingtime > 0) {
        if (!function_5a6214bd()) {
            result = function_6363ab34(var_167fb943, remainingtime);
        } else {
            result = function_bfc79664(var_167fb943, remainingtime);
        }
    }
    self clientfield::set_to_player("realtime_multiplay", 1);
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x6bfbe9a9, Offset: 0x9368
// Size: 0x100
function function_6363ab34(var_167fb943, remainingtime) {
    self freezecontrols(1);
    if (int(var_167fb943) > 0) {
        fadeintime = 0;
    } else {
        fadeintime = 1;
    }
    fadeouttime = 1;
    if (fadeintime + fadeouttime > remainingtime) {
        fadeintime = 0;
        fadeouttime = 0;
    }
    self thread prop_controls::function_d8b858d4(remainingtime, fadeintime, fadeouttime);
    result = self function_1ee6f124(remainingtime);
    self freezecontrols(0);
    return result;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xa262cc02, Offset: 0x9470
// Size: 0x2a0
function function_bfc79664(var_167fb943, remainingtime) {
    var_116d5db7 = 3;
    var_e03c6413 = 1;
    fadeintime = 0;
    result = 0;
    var_ed3bdaed = remainingtime - var_116d5db7;
    level propwaitminigameinit(remainingtime);
    if (self.team == game.defenders) {
        return;
    }
    self thread function_e60dbbee(var_ed3bdaed + var_e03c6413);
    waittillframeend();
    self.var_650b1469 = undefined;
    self.var_9d62f0b2 = undefined;
    if (remainingtime > 8) {
        self.var_650b1469 = self.origin;
        self.var_9d62f0b2 = self.angles;
        gameobject_link = util::spawn_model("tag_origin", self.origin, self.angles);
        self playerlinkto(gameobject_link, "tag_origin", 0, 30, 30, 30, 30);
        result = self function_1ee6f124(var_ed3bdaed);
        if (isdefined(self)) {
            self unlink();
        }
        if (isdefined(gameobject_link)) {
            gameobject_link delete();
        }
        fadeintime = 1;
    }
    var_167fb943 = function_7bd9c9c2();
    remainingtime = level.phsettings.prophidetime - var_167fb943;
    if (remainingtime > 0) {
        self freezecontrols(1);
        fadeouttime = 1;
        if (fadeintime + fadeouttime > remainingtime) {
            fadeintime = 0;
            fadeouttime = 0;
        }
        self thread prop_controls::function_d8b858d4(remainingtime, fadeintime, fadeouttime);
        result = self function_1ee6f124(remainingtime);
        self freezecontrols(0);
    }
    return result;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x96f431b8, Offset: 0x9718
// Size: 0x24
function function_7bd9c9c2() {
    return (gettime() - level.starttime - level.var_ac79a938) / 1000;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x1a7654d8, Offset: 0x9748
// Size: 0x8e
function function_70d75619() {
    level.var_ac79a938 = 0;
    while (1) {
        level waittill(#"host_migration_begin");
        starttime = gettime();
        level waittill(#"host_migration_end");
        passedtime = gettime() - starttime;
        level.var_ac79a938 = level.var_ac79a938 + passedtime;
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x75422392, Offset: 0x97e0
// Size: 0x68
function function_1ee6f124(remainingtime) {
    result = function_e32f6296(remainingtime);
    /#
        while (getdvarint(#"hash_2a5089002fa897cc", 0) != 0) {
            waitframe(1);
        }
    #/
    return result;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x1960daa3, Offset: 0x9850
// Size: 0x38
function function_e32f6296(remainingtime) {
    level endon(#"cancelcountdown");
    hostmigration::waitlongdurationwithhostmigrationpause(remainingtime);
    return 1;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x8154d831, Offset: 0x9890
// Size: 0x64
function freeze_player_controls(b_frozen = 1) {
    if (isdefined(level.hostmigrationtimer)) {
        b_frozen = 1;
    }
    if (b_frozen || !level.gameended) {
        self freezecontrols(b_frozen);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xad1c885b, Offset: 0x9900
// Size: 0x18c
function function_9c2f28fb() {
    if (self.pers[#"team"] == game.attackers) {
        self freeze_player_controls(1);
    } else {
        self thread function_a2d7a59c();
    }
    team = self.pers[#"team"];
    if (isdefined(self.pers[#"music"].spawn) && self.pers[#"music"].spawn == 0) {
        if (level.wagermatch) {
            music = "SPAWN_WAGER";
        } else {
            music = game.music["spawn_" + team];
        }
        if (game.roundsplayed == 0) {
            goto LOC_0000011c;
        }
    LOC_0000011c:
        self.pers[#"music"].spawn = 1;
    }
    if (level.splitscreen) {
        if (isdefined(level.playedstartingmusic)) {
            music = undefined;
        } else {
            level.playedstartingmusic = 1;
        }
    }
    self thread globallogic_spawn::doinitialspawnmessaging();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x9ba01a7b, Offset: 0x9a98
// Size: 0x5c
function function_a2d7a59c() {
    self endon(#"disconnect");
    self freezecontrolsallowlook(1);
    function_241f7953();
    self freezecontrolsallowlook(0);
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xc3db0883, Offset: 0x9b00
// Size: 0x1fc
function attackerinitammo() {
    primaryweapons = self getweaponslistprimaries();
    foreach (weapon in primaryweapons) {
        self givemaxammo(weapon);
        self setweaponammoclip(weapon, 999);
    }
    if (!function_5a6214bd()) {
        if (!isdefined(self.thrownspecialcount)) {
            self.thrownspecialcount = 0;
        }
        weapon = level.phsettings.var_86fda1fd;
        var_11858e48 = self getweaponammostock(weapon);
        var_11858e48 = var_11858e48 - self.thrownspecialcount;
        var_11858e48 = int(max(var_11858e48, 0));
        self setweaponammostock(weapon, var_11858e48);
        roundbased = !util::isoneround();
        firstround = util::isfirstround();
        self ability_util::gadget_reset(weapon, 0, roundbased, firstround, 0);
        if (var_11858e48 > 0) {
            self thread prop_controls::watchspecialgrenadethrow();
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x9107328b, Offset: 0x9d08
// Size: 0xb8
function attackerregenammo() {
    self endon(#"death", #"disconnect");
    self notify(#"attackerregenammo");
    self endon(#"attackerregenammo");
    level endon(#"game_ended");
    while (1) {
        self waittill(#"reload");
        primaryweapon = self getcurrentweapon();
        self givemaxammo(primaryweapon);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x7abd6c08, Offset: 0x9dc8
// Size: 0xd2
function checkkillrespawn() {
    self endon(#"disconnect");
    level endon(#"game_ended");
    hostmigration::waitlongdurationwithhostmigrationpause(0.1);
    if (self.pers[#"lives"] == 1) {
        self.pers[#"lives"]--;
        level.livescount[self.team]--;
        callback::callback(#"hash_6b7d26d34885b425", {});
        level notify(#"propcountchanged");
        return;
    }
}

// Namespace prop/prop
// Params 3, eflags: 0x0
// Checksum 0x2cd97bb, Offset: 0x9ea8
// Size: 0x45e
function function_dcc71445(attacker, smeansofdeath, weapon) {
    bestplayer = undefined;
    bestplayermeansofdeath = undefined;
    bestplayerweapon = undefined;
    if (!level flag::get("props_hide_over")) {
        return;
    }
    if (!isdefined(attacker) || attacker.classname == "trigger_hurt" || attacker.classname == "worldspawn" || isdefined(attacker.ismagicbullet) && attacker.ismagicbullet == 1 || attacker == self) {
        for (i = 0; i < self.attackers.size; i++) {
            player = self.attackers[i];
            if (!isdefined(player)) {
                continue;
            }
            if (!isdefined(self.attackerdamage[player.clientid]) || !isdefined(self.attackerdamage[player.clientid].damage)) {
                continue;
            }
            if (player == self || level.teambased && player.team == self.team) {
                continue;
            }
            if (self.attackerdamage[player.clientid].damage > 1 && !isdefined(bestplayer)) {
                bestplayer = player;
                bestplayermeansofdeath = self.attackerdamage[player.clientid].meansofdeath;
                bestplayerweapon = self.attackerdamage[player.clientid].weapon;
            } else if (isdefined(bestplayer) && self.attackerdamage[player.clientid].lasttimedamaged > self.attackerdamage[bestplayer.clientid].lasttimedamaged) {
                bestplayer = player;
                bestplayermeansofdeath = self.attackerdamage[player.clientid].meansofdeath;
                bestplayerweapon = self.attackerdamage[player.clientid].weapon;
            }
        }
        if (!isdefined(bestplayer) && self util::isprop()) {
            bestdistsq = undefined;
            foreach (player in level.players) {
                if (isalive(player) && player.team != self.team) {
                    distsq = distancesquared(player.origin, self.origin);
                    if (!isdefined(bestdistsq) || distsq < bestdistsq) {
                        bestplayer = player;
                        bestdistsq = distsq;
                    }
                }
            }
            if (isdefined(bestplayer)) {
                bestplayermeansofdeath = "MOD_MELEE";
                bestplayerweapon = getweapon("none");
            }
        }
    }
    result = undefined;
    if (isdefined(bestplayer)) {
        result = [];
        result[#"bestplayer"] = bestplayer;
        result[#"bestplayerweapon"] = bestplayerweapon;
        result[#"bestmeansofdeath"] = bestplayermeansofdeath;
    }
    return result;
}

// Namespace prop/prop
// Params 10, eflags: 0x0
// Checksum 0x1de7097a, Offset: 0xa310
// Size: 0x49e
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, sweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    victim = self;
    killedbyenemy = 0;
    level notify(#"playercountchanged");
    if (victim.team == game.attackers) {
        self thread respawnplayer();
    } else if (!level flag::get("props_hide_over")) {
        self thread respawnplayer();
        return;
    } else {
        level.prop_controls mp_prop_controls::close(self);
    }
    if (isdefined(attacker) && isplayer(attacker) && attacker != victim && victim.team != attacker.team) {
        killedbyenemy = 1;
    }
    if (killedbyenemy) {
        scoreevents::processscoreevent("prop_finalblow", attacker, victim);
        [[ level.var_37d62931 ]](attacker, 1);
        if (isdefined(attacker.var_d290c555)) {
            attacker.var_d290c555++;
            if (attacker.var_d290c555 == 3) {
                scoreevents::processscoreevent("prop_killed_three_props", attacker, victim);
            }
        }
        foreach (assailant in victim.attackers) {
            if (!isdefined(assailant) || !isentity(assailant)) {
                continue;
            }
            if (assailant == attacker) {
                assailant playhitmarker("mpl_hit_alert");
            } else {
                assailant playhitmarker("mpl_hit_alert_escort");
            }
        }
    }
    foreach (player in level.players) {
        if (player != attacker && player util::isprop() && isalive(player) && victim util::isprop()) {
            scoreevents::processscoreevent("prop_survived", player);
            [[ level.var_37d62931 ]](player, 1);
        } else if (player != attacker && player function_84793f03() && victim.team == game.defenders) {
            scoreevents::processscoreevent("prop_killed", player, victim);
        }
    }
    if (victim util::isprop()) {
        function_1e0cc068(3);
        attackerteam = util::getotherteam(victim.team);
        game.propscore[attackerteam] = game.propscore[attackerteam] + 1;
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xe7fe294, Offset: 0xa7b8
// Size: 0x1c
function respawnplayer() {
    self thread waittillcanspawnclient();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xbe067bac, Offset: 0xa7e0
// Size: 0xc6
function waittillcanspawnclient() {
    self endon(#"started_spawnplayer", #"disconnect");
    level endon(#"game_ended");
    for (;;) {
        wait(0.05);
        if (isdefined(self) && isdefined(self.curclass) && (self.sessionstate == "spectator" || !isalive(self))) {
            self.pers[#"lives"] = 1;
            self globallogic_spawn::spawnclient();
        } else {
            return;
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x62a10d42, Offset: 0xa8b0
// Size: 0xb6
function function_4b2f60ed() {
    var_69a1e246 = undefined;
    foreach (player in level.players) {
        if ((isdefined(player.var_d290c555) ? player.var_d290c555 : 0) > 0) {
            if (isdefined(var_69a1e246)) {
                return undefined;
            } else {
                var_69a1e246 = player;
            }
        }
    }
    return var_69a1e246;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xc5ffb4ac, Offset: 0xa970
// Size: 0xb4
function function_1e0cc068(numlives) {
    var_f11febcf = game.defenders;
    if (level.lastalivecount[var_f11febcf] > numlives && level.alivecount[var_f11febcf] == numlives && level.playerlives[var_f11febcf] == numlives) {
        globallogic_audio::leader_dialog("propLowLives", game.attackers);
        globallogic_audio::leader_dialog("propLowLivesEnemy", game.defenders);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x49c2cdd1, Offset: 0xaa30
// Size: 0x5c
function ondeadevent(team) {
    if (team == game.defenders) {
        /#
            if (isdefined(level.allow_teamchange) && level.allow_teamchange) {
                return;
            }
        #/
        level thread propkilledend();
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xd56519d8, Offset: 0xaa98
// Size: 0xf4
function propkilledend() {
    if (isdefined(level.hunterswonending) && level.hunterswonending) {
        return;
    }
    if (isdefined(level.gameending) && level.gameending) {
        return;
    }
    level.hunterswonending = 1;
    function_12388dcc();
    level.gameending = 1;
    var_c04bdb1c = function_4b2f60ed();
    if (isdefined(var_c04bdb1c)) {
        scoreevents::processscoreevent("prop_killed_all_props", var_c04bdb1c);
    }
    hostmigration::waitlongdurationwithhostmigrationpause(3);
    thread ph_endgame(game.attackers, 6);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xb03f0069, Offset: 0xab98
// Size: 0x34
function function_5cde0fbe(smeansofdeath) {
    if (self.team == game.attackers) {
        self battlechatter::pain_vox(smeansofdeath);
    }
}

// Namespace prop/prop
// Params 4, eflags: 0x0
// Checksum 0xcd0a8d9b, Offset: 0xabd8
// Size: 0x64
function playdeathsoundph(body, attacker, weapon, smeansofdeath) {
    if (self.team == game.attackers && isdefined(body)) {
        self battlechatter::play_death_vox(body, attacker, weapon, smeansofdeath);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xb7c000f5, Offset: 0xac48
// Size: 0x32
function round(value) {
    value = int(value + 0.5);
    return value;
}

// Namespace prop/prop
// Params 8, eflags: 0x0
// Checksum 0x62e7c2ad, Offset: 0xac88
// Size: 0x4e4
function function_ef516d85(winner, endtype, endreasontext, outcometext, team, winnerenum, notifyroundendtoui, matchbonus) {
    var_20b7e349 = getplayers(game.defenders);
    foreach (player in var_20b7e349) {
        if (mp_prop_controls::is_open(player)) {
            level.prop_controls mp_prop_controls::close(self);
        }
    }
    if (endtype == "gameend" && isdefined(level.proptiebreaker)) {
        if (!isdefined(team) || team == "spectator") {
            if (isdefined(self.team) && self.team != "spectator" && isdefined(game.stat[#"propscore"][self.team])) {
                team = self.team;
            } else if (isdefined(self.sessionteam) && self.sessionteam != "spectator" && isdefined(game.stat[#"propscore"][self.sessionteam])) {
                team = self.sessionteam;
            }
            if (!isdefined(team)) {
                return 1;
            }
        }
        otherteam = util::getotherteam(team);
        if (level.proptiebreaker == "kills") {
            winnerscore = game.stat[#"propscore"][team];
            loserscore = game.stat[#"propscore"][otherteam];
            if (winnerscore < loserscore) {
                winnerscore = game.stat[#"propscore"][otherteam];
                loserscore = game.stat[#"propscore"][team];
            }
            var_28d2c341 = (winnerscore << 8) + loserscore;
            self luinotifyevent(#"show_outcome", 6, outcometext, #"mp_ph_tiebreaker_kill", int(matchbonus), winnerenum, notifyroundendtoui, var_28d2c341);
            return 1;
        } else if (level.proptiebreaker == "time") {
            var_2d0f00cc = game.stat[#"hunterkilltime"][team] / 1000;
            otherteam = util::getotherteam(team);
            var_68c24bdc = game.stat[#"hunterkilltime"][otherteam] / 1000;
            var_4d33707d = round(var_2d0f00cc);
            var_b33664c9 = round(var_68c24bdc);
            if (var_4d33707d == var_b33664c9) {
                if (var_2d0f00cc > var_68c24bdc) {
                    var_4d33707d++;
                } else {
                    var_b33664c9++;
                }
            }
            var_b41a94fc = var_4d33707d;
            var_ec37ff61 = var_b33664c9;
            if (var_b41a94fc < var_ec37ff61) {
                var_b41a94fc = var_b33664c9;
                var_ec37ff61 = var_4d33707d;
            }
            self luinotifyevent(#"show_outcome", 7, outcometext, #"mp_ph_tiebreaker_time", int(matchbonus), winnerenum, notifyroundendtoui, var_b41a94fc, var_ec37ff61);
            return 1;
        }
    }
    return 0;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0xcaf6a777, Offset: 0xb178
// Size: 0x2a
function function_7470e459(spawnpoint, predictedspawn) {
    if (!predictedspawn) {
        self.startspawn = spawnpoint;
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x2abaed30, Offset: 0xb1b0
// Size: 0xa8
function function_79f19f00(spawn_origin) {
    foreach (player in level.players) {
        if (distance2dsquared(player.origin, spawn_origin) <= 900) {
            return 1;
        }
    }
    return 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x929e505f, Offset: 0xb260
// Size: 0x6a
function gamehasstarted() {
    if (level.teambased) {
        return globallogic_spawn::allteamshaveexisted();
    } else {
        return (level.maxplayercount > 1 || !util::isoneround() && !util::isfirstround());
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x6b7b68bc, Offset: 0xb2d8
// Size: 0x16e
function function_d24f3562() {
    /#
        if (level.var_a7997034) {
            return 1;
        }
    #/
    if (level.inovertime) {
        return 0;
    }
    if (level.playerqueuedrespawn && !isdefined(self.allowqueuespawn) && !level.ingraceperiod && !level.usestartspawns) {
        return 0;
    }
    if (level.numlives || level.numteamlives) {
        gamehasstarted = gamehasstarted();
        if (gamehasstarted && level.numlives && !self.pers[#"lives"] || level.numteamlives && !game.stat[self.team + "_lives"]) {
            return 0;
        } else if (gamehasstarted) {
            if (!level.ingraceperiod && !self.hasspawned && !level.wagermatch) {
                return 0;
            }
        }
        if (self disablespawningforplayer()) {
            return 0;
        }
    }
    return 1;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xca11e252, Offset: 0xb450
// Size: 0x5c
function disablespawningforplayer() {
    if (!gamehasstarted()) {
        return 0;
    }
    if (self function_84793f03()) {
        return 0;
    } else if (self util::isprop()) {
        return !level.ingraceperiod;
    }
    return 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x11d3cc63, Offset: 0xb4b8
// Size: 0x22
function function_84793f03() {
    return isdefined(self.team) && self.team == game.attackers;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x8e5ca9ac, Offset: 0xb4e8
// Size: 0xa0
function function_675bd286() {
    turrets = getentarray("misc_turret", "classname");
    foreach (turret in turrets) {
        turret delete();
    }
}

// Namespace prop/prop
// Params a, eflags: 0x0
// Checksum 0x313cd6b, Offset: 0xb590
// Size: 0xb8
function onplayerdamage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime) {
    self thread function_cd48b338(eattacker, einflictor, weapon, smeansofdeath, idamage, vpoint);
    if (!self util::isusingremote()) {
        self playrumbleonentity("damage_heavy");
    }
    return idamage;
}

// Namespace prop/prop
// Params 6, eflags: 0x0
// Checksum 0xd1c6309f, Offset: 0xb650
// Size: 0x314
function function_cd48b338(eattacker, einflictor, weapon, meansofdeath, damage, point) {
    self endon(#"death", #"disconnect");
    if (isdefined(level._custom_weapon_damage_func)) {
        is_weapon_registered = self [[ level._custom_weapon_damage_func ]](eattacker, einflictor, weapon, meansofdeath, damage);
        if (is_weapon_registered) {
            return;
        }
    }
    if (weapon.rootweapon === level.phsettings.var_86fda1fd) {
        if (isdefined(self.concussionimmune) && self.concussionimmune) {
            return;
        }
        radius = weapon.explosionradius;
        if (self == eattacker) {
            radius = radius * 0.5;
        }
        damageorigin = einflictor.origin;
        if (isdefined(point)) {
            damageorigin = point;
        }
        if (self prop_controls::function_d3b8a20e(damageorigin)) {
            return;
        }
        scale = 1 - distance(self.origin, damageorigin) / radius;
        if (scale < 0) {
            scale = 0;
        }
        time = 0.25 + 4 * scale;
        waitframe(1);
        if (meansofdeath != "MOD_IMPACT") {
            if (self hasperk("specialty_stunprotection")) {
                time = time * 0.1;
            } else if (self util::mayapplyscreeneffect()) {
                self shellshock("concussion_grenade_mp", time, 0);
            }
            self thread weapons::play_concussion_sound(time);
            self.concussionendtime = gettime() + time * 1000;
            self.lastconcussedby = eattacker;
            if (self util::isprop()) {
                if (isdefined(self.lock) && self.lock) {
                    self prop_controls::unlockprop();
                }
                self prop_controls::function_d04b961(einflictor, self, meansofdeath, damage, damageorigin, weapon);
            }
        }
    } else if (isdefined(level.shellshockonplayerdamage)) {
        [[ level.shellshockonplayerdamage ]](meansofdeath, damage, weapon);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xd5994d9c, Offset: 0xb970
// Size: 0x138
function function_7f7439d3() {
    level endon(#"game_ended");
    waitframe(1);
    while (!isdefined(level.mannequins)) {
        waitframe(1);
    }
    foreach (mannequin in level.mannequins) {
        mannequin notsolid();
    }
    level waittill(#"props_hide_over");
    foreach (mannequin in level.mannequins) {
        mannequin solid();
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x8e726da5, Offset: 0xbab0
// Size: 0x94
function propwaitminigameinit(time) {
    if (!isdefined(level.var_1103f74e)) {
        level.var_1103f74e = spawnstruct();
    }
    if (!(isdefined(level.var_1103f74e.started) && level.var_1103f74e.started)) {
        level.var_1103f74e.started = 1;
        level thread function_a3f4820(time);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xfa3b756e, Offset: 0xbb50
// Size: 0x84
function function_e60dbbee(time) {
    self.var_5f355eed = 0;
    self.var_5e8990b6 = 0;
    if (level.var_1103f74e.var_1455c6df && self function_84793f03() && time > 8) {
        waittillframeend();
        if (level.var_23661cff.size < 0) {
            self s_teleport_start_decaystartsupersprint();
        }
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xfed4a97e, Offset: 0xbbe0
// Size: 0x408
function function_a3f4820(time) {
    if (time <= 0) {
        level.var_1103f74e.active = 0;
        return;
    }
    globallogic_utils::pausetimer();
    level thread function_7913d068(time);
    thread function_5099a828();
    function_1ee6f124(time);
    level notify(#"hash_6b6c8ba66c97153a");
    globallogic_utils::resumetimer();
    level thread function_75b4c8bc();
    level.var_1103f74e.active = 0;
    foreach (player in level.players) {
        if (isdefined(player.pers[#"team"])) {
            if (player.pers[#"team"] == game.defenders) {
                player function_ad2b0245();
            } else if (player.pers[#"team"] == game.attackers) {
                player function_c2958208();
            }
        }
    }
    /#
    #/
    thread propminigameupdateshowwinner(level.var_1103f74e.var_e72e24b4[0], -80, 2);
    thread propminigameupdateshowwinner(level.var_1103f74e.var_e72e24b4[1], -50, 1.75);
    thread propminigameupdateshowwinner(level.var_1103f74e.var_e72e24b4[2], -20, 1.5);
    if (isdefined(level.var_1103f74e.targets)) {
        foreach (target in level.var_1103f74e.targets) {
            if (isdefined(target)) {
                target delete();
            }
        }
    }
    if (isdefined(level.var_23661cff)) {
        foreach (clone in level.var_23661cff) {
            if (isdefined(clone)) {
                if (isdefined(clone.var_297617fa)) {
                    clone.var_297617fa delete();
                }
                if (isdefined(clone.var_cab7bcf6)) {
                    gameobjects::release_obj_id(clone.var_cab7bcf6);
                }
                clone delete();
            }
        }
    }
}

// Namespace prop/prop
// Params 3, eflags: 0x0
// Checksum 0xae15f7d1, Offset: 0xbff0
// Size: 0xa0
function propminigameupdateshowwinner(hud, winyoffset, winfontscale) {
    hud endon(#"death");
    movetime = 0.5;
    showtime = 2.5;
    fadetime = 0.5;
    hud.fontscale = winfontscale;
    wait(movetime + showtime);
    hud.alpha = 0;
    /#
        wait(fadetime);
    #/
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xa8103d73, Offset: 0xc098
// Size: 0xbc
function function_c2958208() {
    if (!isdefined(self.var_1414911e)) {
        self globallogic_audio::leader_dialog_on_player("propOrdersOfs");
        self.var_1414911e = 1;
    }
    self function_416db484(1);
    self takeweapon(getweapon("null_offhand_primary"));
    self function_78f5da6(level.phsettings.var_86fda1fd, 2);
    self attackerinitammo();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xa139b9db, Offset: 0xc160
// Size: 0x1c
function function_ad2b0245() {
    self function_9c1a133a(1);
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xddc49d2c, Offset: 0xc188
// Size: 0x82
function function_5a6214bd() {
    if (!isdefined(level.var_1103f74e)) {
        level.var_1103f74e = spawnstruct();
    }
    if (!isdefined(level.var_1103f74e.active)) {
        level.var_1103f74e.active = getdvarint(#"scr_prop_minigame", 0);
    }
    return level.var_1103f74e.active;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x675c9fa, Offset: 0xc218
// Size: 0xec
function function_416db484(isvisible) {
    if (isvisible) {
        self solid();
        self function_d25cfae3(1);
        if (isdefined(self.var_650b1469)) {
            self setorigin(self.var_650b1469);
            self setplayerangles(self.var_9d62f0b2);
        }
        if (isdefined(self.var_a920bfdd)) {
            self.var_a920bfdd delete();
        }
    } else {
        self notsolid();
        self thread function_832a882d(game.defenders, 1);
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xbd3137ab, Offset: 0xc310
// Size: 0x164
function function_19f7e795(player) {
    player endon(#"disconnect");
    level endon(#"game_ended");
    if (!isdefined(player.var_a920bfdd)) {
        function_241f7953();
        wait(0.1);
        clone = util::spawn_player_clone(player, "pb_stand_alert");
        weapon = player getcurrentweapon();
        if (isdefined(weapon.worldmodel)) {
            clone attach(weapon.worldmodel, "tag_weapon_right");
        }
        clone notsolid();
        clone hidefromteam(player.pers[#"team"]);
        player.var_a920bfdd = clone;
        player thread function_63123cb(player, player.var_a920bfdd);
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x8691f3dc, Offset: 0xc480
// Size: 0x74
function function_63123cb(player, clone) {
    clone endon(#"entityshutdown", #"death");
    player waittill(#"disconnect");
    if (isdefined(clone)) {
        clone delete();
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x94246734, Offset: 0xc500
// Size: 0x194
function function_9c1a133a(isvisible) {
    if (isvisible) {
        if (isdefined(self.prop)) {
            self.prop show();
            self.prop solid();
        }
        self function_d25cfae3(0);
        self ghost();
        if (isdefined(self.propclones)) {
            foreach (clone in self.propclones) {
                if (isdefined(clone)) {
                    clone show();
                    clone solid();
                }
            }
        }
    } else {
        if (isdefined(self.prop)) {
            self.prop notsolid();
            self.prop hidefromteam(game.attackers);
        }
        self thread function_832a882d(game.attackers, 0);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xa9bc5d48, Offset: 0xc6a0
// Size: 0x2d0
function function_5099a828() {
    level.var_1103f74e.var_1455c6df = 0;
    label = #"mp_ph_pregame_hunt";
    if (randomfloat(1) < 0.5) {
        level.var_1103f74e.var_1455c6df = 1;
        label = #"mp_ph_pregame_chase";
    }
    /#
        if (getdvarint(#"hash_6132db0becb8f98", 0) == 2 && level.var_1103f74e.var_1455c6df) {
            level.var_1103f74e.var_1455c6df = 0;
            label = #"mp_ph_pregame_hunt";
        } else if (getdvarint(#"hash_6132db0becb8f98", 0) == 1 && !level.var_1103f74e.var_1455c6df) {
            level.var_1103f74e.var_1455c6df = 1;
            label = #"mp_ph_pregame_chase";
        }
    #/
    thread function_f6f7aa90(label);
    level.var_1103f74e.targetlocations = function_a62b65f8();
    level.var_1103f74e.targetlocations = array::randomize(level.var_1103f74e.targetlocations);
    level.var_1103f74e.nextindex = 0;
    if (!level.var_1103f74e.var_1455c6df) {
        thread function_9340d662();
    } else {
        level.var_23661cff = [];
    }
    foreach (player in level.players) {
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == game.attackers) {
            player thread function_4725415b(#"mp_ph_empty");
        }
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xf46ac6ba, Offset: 0xc978
// Size: 0x134
function function_a62b65f8() {
    var_55d0a272 = 90000;
    targetlocations = [];
    alllocations = spawning::get_spawnpoint_array("mp_tdm_spawn");
    hunters = getlivingplayersonteam(game.attackers);
    hunter = hunters[0];
    foreach (location in alllocations) {
        distsq = distancesquared(location.origin, hunter.origin);
        if (distsq > var_55d0a272) {
            targetlocations[targetlocations.size] = location;
        }
    }
    return targetlocations;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xf34914ed, Offset: 0xcab8
// Size: 0xa
function function_7b05fd28() {
    return "wpn_t7_uplink_ball_world";
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xa5e56366, Offset: 0xcad0
// Size: 0x13c
function function_9340d662() {
    var_57466b3 = 40;
    var_b61ad6e2 = 4;
    model = function_7b05fd28();
    numtargets = min(level.var_1103f74e.targetlocations.size, var_57466b3);
    level.var_1103f74e.targets = [];
    num = 0;
    for (i = 0; i < numtargets; i++) {
        origin = function_e63a6b8b();
        target = function_d5c899f5(origin, model);
        level.var_1103f74e.targets[level.var_1103f74e.targets.size] = target;
        num++;
        if (num >= var_b61ad6e2) {
            waitframe(1);
            num = 0;
        }
    }
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x387c30ab, Offset: 0xcc18
// Size: 0x3c
function function_e212ee3b(targetent) {
    waitframe(1);
    if (isdefined(targetent)) {
        playfxontag("ui/fx_uplink_ball_vanish", targetent, "tag_origin");
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x9437684f, Offset: 0xcc60
// Size: 0x178
function function_d5c899f5(origin, model) {
    target = spawn("script_model", origin);
    target setmodel(model);
    target.targetname = "propTarget";
    target setcandamage(1);
    target.fakehealth = 50;
    target.health = 99999;
    target.maxhealth = 99999;
    target thread function_aa8db165(&function_c3c0cc83);
    target setplayercollision(0);
    target makesentient();
    target setteam(game.defenders);
    target hidefromteam(game.defenders);
    target setscale(2);
    thread function_e212ee3b(target);
    return target;
}

// Namespace prop/prop
// Params 10, eflags: 0x0
// Checksum 0x13b6a8b4, Offset: 0xcde0
// Size: 0x11a
function function_c3c0cc83(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, weapon, idflags) {
    if (!isdefined(attacker)) {
        return;
    }
    if (isplayer(attacker)) {
        if (isdefined(self.isdying) && self.isdying) {
            return;
        }
        attacker thread damagefeedback::update();
        self.lastattacker = attacker;
        self.fakehealth = self.fakehealth - damage;
        if (self.fakehealth <= 0) {
            function_45080877(attacker);
            self thread movetarget();
        }
    }
    self.health = self.health + damage;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xf5d7d7eb, Offset: 0xcf08
// Size: 0x16e
function movetarget() {
    self.isdying = 1;
    waitframe(1);
    self.fakehealth = 50;
    fxent = playfx(fx::get("propDeathFX"), self.origin + vectorscale((0, 0, 1), 4));
    fxent hide();
    foreach (player in level.players) {
        if (player function_84793f03()) {
            fxent showtoplayer(player);
        }
    }
    fxent playsoundtoteam("wpn_flash_grenade_explode", game.attackers);
    self.origin = function_e63a6b8b();
    self dontinterpolate();
    self.isdying = 0;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0xb9295fa9, Offset: 0xd080
// Size: 0xc6
function function_fbe5e14d(location) {
    var_44efd384 = 90000;
    foreach (target in level.var_1103f74e.targets) {
        distsq = distancesquared(target.origin, location);
        if (distsq < var_44efd384) {
            return 1;
        }
    }
    return 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0xbf2aa2f3, Offset: 0xd150
// Size: 0x264
function function_e63a6b8b() {
    if (level.var_1103f74e.nextindex >= level.var_1103f74e.targetlocations.size) {
        level.var_1103f74e.nextindex = 0;
    }
    location = level.var_1103f74e.targetlocations[level.var_1103f74e.nextindex];
    if (!isdefined(location.var_59abaf85)) {
        dir = level.mapcenter - location.origin;
        dist = distance(level.mapcenter, location.origin);
        if (dist > 0) {
            dir = (dir[0] / dist, dir[1] / dist, dir[2] / dist);
        }
        attempts = 9;
        newlocation = location.origin;
        rand = randomfloat(1);
        while (attempts > 0) {
            var_15df23ab = dist * rand;
            newlocation = location.origin + dir * var_15df23ab;
            if (!function_fbe5e14d(newlocation)) {
                break;
            }
            rand = rand - 0.1;
            if (rand < 0) {
                newlocation = location.origin;
                break;
            }
            attempts--;
        }
        newlocation = getclosestpointonnavmesh(newlocation, 100);
        if (!isdefined(newlocation)) {
            newlocation = location.origin;
        }
        location.var_59abaf85 = newlocation;
    }
    origin = location.var_59abaf85 + vectorscale((0, 0, 1), 40);
    level.var_1103f74e.nextindex++;
    return origin;
}

// Namespace prop/prop
// Params 4, eflags: 0x0
// Checksum 0x7f3dc269, Offset: 0xd3c0
// Size: 0x116
function function_f4a88299(x, y, label, color) {
    var_f3be2960 = spawnstruct();
    var_f3be2960.label = label;
    var_f3be2960.x = x;
    var_f3be2960.y = y;
    var_f3be2960.alignx = "left";
    var_f3be2960.aligny = "top";
    var_f3be2960.horzalign = "left";
    var_f3be2960.vertalign = "top";
    var_f3be2960.color = color;
    var_f3be2960.archived = 1;
    var_f3be2960.alpha = 0;
    var_f3be2960.glowalpha = 0;
    var_f3be2960.hidewheninmenu = 0;
    var_f3be2960.sort = 1001;
    return var_f3be2960;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x6f358bbc, Offset: 0xd4e0
// Size: 0x29c
function function_f6f7aa90(titlelabel) {
    level.var_1103f74e.var_e72e24b4 = [];
    var_ed243a5d = 110;
    var_15c99f84 = 20;
    if (!level.console) {
        var_ed243a5d = 125;
        var_15c99f84 = 15;
    }
    x = 5;
    y = var_ed243a5d;
    level.var_1103f74e.var_e72e24b4[level.var_1103f74e.var_e72e24b4.size] = function_f4a88299(x, y, #"mp_ph_minigame_first", (1, 0.843, 0));
    y = y + var_15c99f84;
    level.var_1103f74e.var_e72e24b4[level.var_1103f74e.var_e72e24b4.size] = function_f4a88299(x, y, #"mp_ph_minigame_second", vectorscale((1, 1, 1), 0.3));
    y = y + var_15c99f84;
    level.var_1103f74e.var_e72e24b4[level.var_1103f74e.var_e72e24b4.size] = function_f4a88299(x, y, #"mp_ph_minigame_third", (0.804, 0.498, 0.196));
    level.var_1103f74e.var_b746be43 = spawnstruct();
    level.var_1103f74e.var_b746be43.label = titlelabel;
    level.var_1103f74e.var_b746be43.x = 0;
    level.var_1103f74e.var_b746be43.archived = 1;
    level.var_1103f74e.var_b746be43.alpha = 1;
    level.var_1103f74e.var_b746be43.glowalpha = 0;
    level.var_1103f74e.var_b746be43.hidewheninmenu = 0;
    thread function_58fbc880();
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x8b88a768, Offset: 0xd788
// Size: 0x34
function function_58fbc880() {
    level endon(#"game_ended");
    wait(5.5);
    wait(1);
    wait(1);
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x16baaa7d, Offset: 0xd7c8
// Size: 0x7c
function function_45080877(player) {
    var_1cb9af94 = gettime() - level.starttime - level.var_ac79a938;
    player.var_5f355eed++;
    player.var_5e8990b6 = player.var_5e8990b6 + var_1cb9af94;
    player thread function_49a6ce84();
    function_2e77fae3();
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x465f653f, Offset: 0xd850
// Size: 0x190
function function_2e77fae3(delaytime) {
    level endon(#"game_ended");
    if (isdefined(delaytime)) {
        wait(delaytime);
    }
    hunters = getlivingplayersonteam(game.attackers);
    var_1d660206 = array::merge_sort(hunters, &function_d2b8eac6);
    for (i = 0; i < 3; i++) {
        if (isdefined(var_1d660206[i]) && isdefined(var_1d660206[i].var_5f355eed) && var_1d660206[i].var_5f355eed > 0) {
            level.var_1103f74e.var_e72e24b4[i].alpha = 1;
        } else if (isdefined(level.var_1103f74e.var_e72e24b4) && isdefined(level.var_1103f74e.var_e72e24b4[i]) && level.var_1103f74e.var_e72e24b4[i].alpha > 0) {
            level.var_1103f74e.var_e72e24b4[i].alpha = 0;
        }
    }
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x44cedde4, Offset: 0xd9e8
// Size: 0xb6
function function_d2b8eac6(p1, p2) {
    if (!isdefined(p1) || !isdefined(p1.var_5f355eed)) {
        return 0;
    }
    if (!isdefined(p2) || !isdefined(p2.var_5f355eed)) {
        return 1;
    }
    if (p1.var_5f355eed > p2.var_5f355eed) {
        return 1;
    }
    return p1.var_5f355eed == p2.var_5f355eed && p1.var_5e8990b6 <= p2.var_5e8990b6;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x270ef70c, Offset: 0xdaa8
// Size: 0x11a
function function_b00ad880(label) {
    self.var_146fe456 = spawnstruct();
    self.var_146fe456.label = label;
    self.var_146fe456.x = 0;
    self.var_146fe456.y = 20;
    self.var_146fe456.alignx = "center";
    self.var_146fe456.aligny = "middle";
    self.var_146fe456.horzalign = "user_center";
    self.var_146fe456.vertalign = "middle";
    self.var_146fe456.archived = 1;
    self.var_146fe456.fontscale = 1;
    self.var_146fe456.alpha = 0;
    self.var_146fe456.glowalpha = 0.5;
    self.var_146fe456.hidewheninmenu = 0;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x135be9a1, Offset: 0xdbd0
// Size: 0x24
function function_4725415b(label) {
    self function_b00ad880(label);
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x11cf6adf, Offset: 0xdc00
// Size: 0x26
function function_49a6ce84() {
    self.var_146fe456.alpha = 1;
    self.var_146fe456.alpha = 0;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x3c6eb8, Offset: 0xdc30
// Size: 0x134
function s_teleport_start_decaystartsupersprint() {
    forward = anglestoforward(self getangles());
    origin = self.origin + vectorscale(forward, 100);
    origin = getclosestpointonnavmesh(origin, 600);
    clone = spawnactor("spawner_bo3_robot_grunt_assault_mp", origin, self.angles, "", 1);
    clone.var_297617fa = function_944a25ed(origin + vectorscale((0, 0, 1), 40));
    clone.var_297617fa linkto(clone);
    level.var_23661cff[level.var_23661cff.size] = clone;
    function_2a7250f0(clone, self, forward);
}

// Namespace prop/prop
// Params 3, eflags: 0x0
// Checksum 0xbe573fa1, Offset: 0xdd70
// Size: 0x32c
function function_2a7250f0(clone, player, forward) {
    clone.isaiclone = 1;
    clone.propername = "";
    clone.ignoretriggerdamage = 1;
    clone.minwalkdistance = 125;
    clone.overrideactordamage = &clonedamageoverride;
    clone.spawntime = gettime();
    clone.var_fd08eed5 = 1;
    clone setmaxhealth(9999);
    clone pushplayer(1);
    clone setcontents(8192);
    clone setavoidancemask("avoid none");
    clone.var_cab7bcf6 = gameobjects::get_next_obj_id();
    objective_add(clone.var_cab7bcf6, "active");
    objective_onentity(clone.var_cab7bcf6, clone);
    clone asmsetanimationrate(1.2);
    clone setclone();
    clone._goal_center_point = function_e9d33a1c();
    queryresult = undefined;
    if (isdefined(clone._goal_center_point) && clone findpath(clone.origin, clone._goal_center_point, 1, 0)) {
        queryresult = positionquery_source_navigation(clone._goal_center_point, 0, 450, 450, 100, clone);
    } else {
        queryresult = positionquery_source_navigation(clone.origin, 500, 750, 750, 50, clone);
    }
    if (queryresult.data.size > 0) {
        clone._clone_goal = queryresult.data[0].origin;
        clone._clone_goal_max_dist = 450;
    } else {
        clone._goal_center_point = clone.origin;
    }
    clone thread _updateclonepathing();
    clone hidefromteam(game.defenders);
    clone ghost();
    _configurecloneteam(clone, player);
}

// Namespace prop/prop
// Params 15, eflags: 0x0
// Checksum 0x73adbb5e, Offset: 0xe0a8
// Size: 0x7e
function clonedamageoverride(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, timeoffset, boneindex, modelindex, surfacetype, surfacenormal) {
    return 0;
}

// Namespace prop/prop
// Params 2, eflags: 0x0
// Checksum 0x7a67982b, Offset: 0xe130
// Size: 0x6a
function _configurecloneteam(clone, player) {
    team = util::getotherteam(player.team);
    clone.ignoreall = 1;
    clone setteam(team);
    clone.team = team;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x5d1e03a6, Offset: 0xe1a8
// Size: 0xe4
function function_2627c241() {
    var_5b361955 = 10000;
    var_b20ab8d6 = [];
    foreach (clone in level.var_23661cff) {
        if (self == clone) {
            continue;
        }
        distsq = distancesquared(clone.origin, self.origin);
        if (distsq < var_5b361955) {
            var_b20ab8d6[var_b20ab8d6.size] = clone;
        }
    }
    return var_b20ab8d6;
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x22c5b606, Offset: 0xe298
// Size: 0x370
function _updateclonepathing() {
    self endon(#"death");
    clone_not_moving_dist_sq = 576;
    clone_not_moving_poll_time = 2000;
    var_d04458a5 = 1500;
    if (!isdefined(level.var_1103f74e.var_faae1a42)) {
        level.var_1103f74e.var_faae1a42 = 0;
    }
    while (1) {
        if (!isdefined(self.lastknownpos)) {
            self.lastknownpos = self.origin;
            self.lastknownpostime = gettime();
        }
        if (!isdefined(self.var_caac616e)) {
            self.var_caac616e = gettime();
        }
        distance = 0;
        if (isdefined(self._clone_goal)) {
            distance = distancesquared(self._clone_goal, self.origin);
        }
        var_2fbd332 = 0;
        if (distance < 14400) {
            var_2fbd332 = 1;
        } else if (!self haspath()) {
            var_2fbd332 = 1;
        } else if (self.lastknownpostime + clone_not_moving_poll_time <= gettime()) {
            if (distancesquared(self.lastknownpos, self.origin) < clone_not_moving_dist_sq) {
                var_2fbd332 = 1;
            }
            self.lastknownpos = self.origin;
            self.lastknownpostime = gettime();
        } else if (self.var_caac616e + var_d04458a5 <= gettime() && level.var_1103f74e.var_faae1a42 != gettime()) {
            clones = function_2627c241();
            if (clones.size > 0) {
                var_2fbd332 = 1;
            }
            for (i = 0; i < clones.size; i++) {
                clones[i].var_caac616e = gettime();
            }
            self.var_caac616e = gettime();
        }
        if (var_2fbd332) {
            level.var_1103f74e.var_faae1a42 = gettime();
            self._goal_center_point = function_e9d33a1c();
            queryresult = positionquery_source_navigation(self._goal_center_point, 500, 750, 750, 100, self);
            if (queryresult.data.size == 0) {
                queryresult = positionquery_source_navigation(self.origin, 500, 750, 750, 100, self);
            }
            if (queryresult.data.size > 0) {
                randindex = randomintrange(0, queryresult.data.size);
                self._clone_goal = queryresult.data[randindex].origin;
                self._clone_goal_max_dist = 750;
            }
        }
        wait(0.5);
    }
}

// Namespace prop/prop
// Params 0, eflags: 0x0
// Checksum 0x2490f31e, Offset: 0xe610
// Size: 0x8e
function function_e9d33a1c() {
    if (level.var_1103f74e.nextindex >= level.var_1103f74e.targetlocations.size) {
        level.var_1103f74e.nextindex = 0;
    }
    location = level.var_1103f74e.targetlocations[level.var_1103f74e.nextindex];
    level.var_1103f74e.nextindex++;
    return location.origin;
}

// Namespace prop/prop
// Params 1, eflags: 0x0
// Checksum 0x46a3633b, Offset: 0xe6a8
// Size: 0x190
function function_944a25ed(origin) {
    model = function_7b05fd28();
    target = spawn("script_model", origin);
    target setmodel(model);
    target.targetname = "propTarget";
    target setcandamage(1);
    target.fakehealth = 50;
    target.health = 99999;
    target.maxhealth = 99999;
    target thread function_aa8db165(&function_80334286);
    target setplayercollision(0);
    target makesentient();
    target setteam(game.defenders);
    target hidefromteam(game.defenders);
    target setscale(2);
    thread function_e212ee3b(target);
    return target;
}

// Namespace prop/prop
// Params 10, eflags: 0x0
// Checksum 0x3d9265f2, Offset: 0xe840
// Size: 0xc2
function function_80334286(damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, weapon, idflags) {
    if (!isdefined(attacker)) {
        return;
    }
    if (isplayer(attacker)) {
        attacker thread damagefeedback::update();
        self.lastattacker = attacker;
        function_45080877(attacker);
    }
    self.health = self.health + damage;
}

// Namespace prop/prop
// Params 0, eflags: 0x4
// Checksum 0xb9d7fe9b, Offset: 0xe910
// Size: 0x64
function private set_ui_team() {
    wait(0.05);
    if (game.attackers == #"allies") {
        clientfield::set_world_uimodel("hudItems.war.attackingTeam", 1);
    } else {
        clientfield::set_world_uimodel("hudItems.war.attackingTeam", 2);
    }
}

