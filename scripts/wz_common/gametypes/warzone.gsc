// Atian COD Tools GSC decompiler test
#include scripts/wz_common/wz_ignore_systems.gsc;
#include scripts/wz_common/wz_rat.gsc;
#include scripts/wz_common/wz_ai.gsc;
#include scripts/wz_common/player.gsc;
#include scripts/wz_common/vehicle.gsc;
#include scripts/wz_common/wz_contracts.gsc;
#include scripts/wz_common/wz_progression.gsc;
#include scripts/wz_common/wz_ai_zonemgr.gsc;
#include scripts/wz_common/spawn.gsc;
#include scripts/wz_common/infection.gsc;
#include scripts/wz_common/character_banter.gsc;
#include scripts/mp_common/bb.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/teams/teams.gsc;
#include scripts/mp_common/teams/team_assignment.gsc;
#include scripts/mp_common/teams/platoons.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/player/player_loadout.gsc;
#include scripts/mp_common/player/player_killed.gsc;
#include scripts/mp_common/laststand_warzone.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/menus.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/dogtags.gsc;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/mp_common/gametypes/gametype.gsc;
#include scripts/mp_common/gametypes/display_transition.gsc;
#include scripts/mp_common/gameadvertisement.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/core_common/voice/voice_events.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/spectating.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/player/player_shared.gsc;
#include scripts/core_common/player/player_reinsertion.gsc;
#include scripts/core_common/player_insertion.gsc;
#include scripts/core_common/platoons.gsc;
#include scripts/core_common/oob.gsc;
#include scripts/core_common/music_shared.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/laststand_shared.gsc;
#include scripts/core_common/infection.gsc;
#include scripts/core_common/hud_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/death_circle.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include script_164ba4a711296dd5;

#namespace warzone;

// Namespace warzone/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xdbea0090, Offset: 0x800
// Size: 0xecc
function event<gametype_init> main(eventstruct) {
    level.var_87bcb1b = 0;
    globallogic::init();
    util::registerroundswitch(0, 9);
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 50000);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.teamscoreperkill = getgametypesetting(#"teamscoreperkill");
    level.teamscoreperdeath = getgametypesetting(#"teamscoreperdeath");
    level.teamscoreperheadshot = getgametypesetting(#"teamscoreperheadshot");
    level.killstreaksgivegamescore = getgametypesetting(#"killstreaksgivegamescore");
    level.var_79219af4 = 0;
    if (getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0) {
        level.var_79219af4 = isdefined(getgametypesetting(#"startplayers")) ? getgametypesetting(#"startplayers") : 0;
    }
    level.var_4cea2bec = isdefined(getgametypesetting(#"hash_6cc7b012775d9662")) ? getgametypesetting(#"hash_6cc7b012775d9662") : 0;
    level.var_6c900548 = isdefined(getgametypesetting(#"hash_2b3e56efad3a1504")) ? getgametypesetting(#"hash_2b3e56efad3a1504") : 0;
    level.var_e16a689f = isdefined(getgametypesetting(#"hash_557cb4680634f585")) ? getgametypesetting(#"hash_557cb4680634f585") : 0;
    level.var_f97a6ba3 = 1;
    level.overrideteamscore = 1;
    level.onstartgametype = &on_start_game_type;
    level.onspawnplayer = &on_spawn_player;
    level.onroundswitch = &on_round_switch;
    level.onendround = &on_end_round;
    level.onendgame = &on_end_game;
    level.ondeadevent = &on_dead_event;
    level.ononeleftevent = &on_one_left_event;
    level.givecustomloadout = &give_custom_loadout;
    level.var_a962eeb6 = &function_486a8395;
    level.var_a3e209ba = &function_a3e209ba;
    level.var_3a0bbaea = 0;
    level.var_5495fbf1 = 0;
    level.var_e7b05b51 = 0;
    level.var_674e8051 = 1;
    level.var_827f5a28 = 1;
    level.var_3d984b4c = 0;
    level.var_36a111f3 = &function_10dc43bc;
    level.disableweapondrop = 1;
    level.insertionpassenger = insertion_passenger_count::register("insertionPassengerElem");
    level.var_a3c0d635 = &insertion_passenger_count::is_open;
    level.var_f3320ad2 = &insertion_passenger_count::open;
    level.var_81b39a59 = &insertion_passenger_count::close;
    level.var_ce84dde9 = &insertion_passenger_count::set_count;
    level.var_ec375172 = &function_ec375172;
    level.var_eed7c027 = [];
    level.resurrect_override_spawn = &spawn::override_spawn;
    if (isdefined(getgametypesetting(#"wzzombieapocalypsemusic")) && getgametypesetting(#"wzzombieapocalypsemusic")) {
        level.var_30783ca9 = &function_b3f02397;
    }
    clientfield::register("worlduimodel", "hudItems.warzone.collapseTimerState", 1, 2, "int");
    clientfield::register("worlduimodel", "hudItems.warzone.collapseProgress", 1, 7, "float");
    clientfield::register("worlduimodel", "hudItems.warzone.reinsertionPassengerCount", 1, 7, "int");
    clientfield::register_clientuimodel("hudItems.distanceFromDeathCircle", 1, 7, "float", 0);
    clientfield::register_clientuimodel("hudItems.alivePlayerCount", 1, 7, "int", 0);
    clientfield::register_clientuimodel("hudItems.alivePlayerCountEnemy", 1, 7, "int", 0);
    clientfield::register_clientuimodel("hudItems.aliveTeammateCount", 1, 7, "int", 1);
    clientfield::register_clientuimodel("hudItems.spectatorsCount", 1, 7, "int", 1);
    clientfield::register_clientuimodel("hudItems.playerKills", 1, 7, "int", 0);
    clientfield::register_clientuimodel("hudItems.playerCleanUps", 1, 7, "int", 0);
    clientfield::register_clientuimodel("presence.modeparam", 1, 7, "int", 1);
    clientfield::register_clientuimodel("hudItems.hasBackpack", 1, 1, "int", 0);
    clientfield::register_clientuimodel("hudItems.armorType", 1, 2, "int", 0);
    clientfield::register_clientuimodel("hudItems.streamerLoadFraction", 1, 5, "float", 1);
    clientfield::register_clientuimodel("hudItems.wzLoadFinished", 1, 1, "int", 1);
    clientfield::register_clientuimodel("hudItems.showReinsertionPassengerCount", 1, 1, "int", 0);
    clientfield::register_clientuimodel("hudItems.playerLivesRemaining", 15000, 3, "int");
    clientfield::register_clientuimodel("hudItems.playerCanRedeploy", 15000, 1, "int");
    clientfield::register_clientuimodel("hudItems.playerOnInfectedPlatoon", 21000, 1, "int");
    clientfield::register("allplayers", "eliminator_screen", 1, 1, "int");
    clientfield::register("toplayer", "realtime_multiplay", 1, 1, "int");
    clientfield::register("worlduimodel", "hudItems.warzone.collapse", 11000, 21, "int");
    clientfield::register("worlduimodel", "hudItems.warzone.waveRespawnTimer", 15000, 21, "int");
    clientfield::register("worlduimodel", "hudItems.warzone.collapseIndex", 1, 3, "int");
    clientfield::register("worlduimodel", "hudItems.warzone.collapseCount", 1, 3, "int");
    clientfield::register("worlduimodel", "hudItems.warzone.reinsertionIndex", 1, 3, "int");
    callback::on_player_killed_with_params(&function_c1a417ee);
    player::function_cf3aa03d(&player_killed);
    callback::on_spawned(&on_player_spawned);
    callback::on_connect(&on_player_connect);
    callback::on_disconnect(&on_player_disconnect);
    callback::on_game_playing(&start_warzone);
    callback::add_callback(#"hash_6b7d26d34885b425", &function_4012c0ab);
    callback::add_callback(#"on_last_alive", &function_5af3a29);
    globallogic_spawn::addsupportedspawnpointtype("tdm");
    function_aaa24662();
    level.var_bde3d03 = &function_b777ff94;
    setdvar(#"g_allowlaststandforactiveclients", 1);
    setdvar(#"hash_7036719f41a78d54", 50);
    setdvar(#"hash_6d545f685fa213dd", 3);
    setdvar(#"scr_deleteexplosivesonspawn", 0);
    level.wound_disabled = 1;
    level.var_b219667f = 1;
    level thread function_23600e7d();
    if (isdefined(getgametypesetting(#"wzspectrerising")) && getgametypesetting(#"wzspectrerising")) {
        key = "warSpectreRisingStart";
    } else if (isdefined(getgametypesetting(#"wzhardcore")) && getgametypesetting(#"wzhardcore")) {
        key = "hcStartWarzone";
    } else if (isdefined(getgametypesetting(#"wzzombieapocalypse")) && getgametypesetting(#"wzzombieapocalypse")) {
        key = "warZombieStart";
    } else {
        key = "startWarzone";
    }
    globallogic_audio::set_leader_gametype_dialog(key, undefined, undefined, undefined);
    level.var_606becce = [];
    level callback::add_callback(#"hash_7119d854cd41a4fd", &function_61c315e0);
    /#
        callback::on_vehicle_spawned(&function_5d7553c9);
        level.var_5efad16e = &function_73b0f715;
        forcedplayerteam = getdvarstring(#"forcedplayerteam", "trigger_hurt_new");
        if (forcedplayerteam != "trigger_hurt_new") {
            level.forcedplayerteam = forcedplayerteam;
        }
        level thread function_c2a75696();
    #/
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x1e448730, Offset: 0x16d8
// Size: 0xc4
function on_spawn_player() {
    spawn::on_spawn_player();
    if (infection::function_74650d7()) {
        platoon = getteamplatoon(self.team);
        var_8cc84817 = infection::function_76601b7d();
        if (var_8cc84817 != #"none" && platoon == infection::function_76601b7d()) {
            self infection::give_body();
            self player::spawn_player();
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x0
// Checksum 0x2b286512, Offset: 0x17a8
// Size: 0x134
function function_5d7553c9() {
    /#
        if (game.state == "MOD_HEAD_SHOT") {
            return;
        }
        if (level flagsys::get(#"item_world_reset")) {
            return;
        }
        if (!isdefined(self.scriptvehicletype)) {
            return;
        }
        if (!isdefined(level.var_9c103fe0)) {
            return;
        }
        if (!isinarray(level.var_9c103fe0, self.scriptvehicletype)) {
            return;
        }
        if (self isremotecontrol()) {
            return;
        }
        if (!isdefined(level.spawned_vehicles)) {
            level.spawned_vehicles = 0;
        }
        level.spawned_vehicles++;
        if (getdvarint(#"hash_10daadecda56ef52", 1) && level.spawned_vehicles > 80) {
            /#
                assert(level.spawned_vehicles <= 80, "map_corner");
            #/
        }
    #/
}

// Namespace warzone/warzone
// Params 0, eflags: 0x4
// Checksum 0x318abc98, Offset: 0x18e8
// Size: 0x130
function private function_c2a75696() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        while (1) {
            waitframe(1);
            string = getdvarstring(#"warzone_devgui_cmd", "trigger_hurt_new");
            switch (string) {
            case #"start":
                function_73b0f715();
                break;
            default:
                break;
            }
            setdvar(#"warzone_devgui_cmd", "trigger_hurt_new");
        }
    #/
}

// Namespace warzone/warzone
// Params 3, eflags: 0x5 linked
// Checksum 0x8412a6b5, Offset: 0x1a20
// Size: 0x84
function private function_75189494(var_c6ce2627, playercount, var_404397c4) {
    data = {#var_4a2854ac:var_404397c4, #var_f388074a:playercount, #var_19b5b856:var_c6ce2627};
    function_92d1707f(#"hash_7bcd081bd6940681", data);
}

// Namespace warzone/warzone
// Params 0, eflags: 0x5 linked
// Checksum 0x7f8d669f, Offset: 0x1ab0
// Size: 0xf10
function private function_23600e7d() {
    var_26ef8eea = isdefined(getgametypesetting(#"hash_bd1199baafe11fe")) ? getgametypesetting(#"hash_bd1199baafe11fe") : 1;
    /#
        var_26ef8eea = 0;
    #/
    if (var_26ef8eea && !isdedicated()) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    if (getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    while (!isdefined(game.state) || game.state != "pregame") {
        waitframe(1);
    }
    while (!isdefined(level.activeplayers)) {
        waitframe(1);
    }
    while (level.activeplayers.size == 0) {
        waitframe(1);
    }
    if (getdvarint(#"wz_test_mode", 0) != 0) {
        /#
            println("<unknown string>");
        #/
        level function_73b0f715();
        return;
    }
    level endon(#"start_warzone");
    level.var_8fcd8a61 = isdefined(getgametypesetting(#"hash_35c2d850e39fa704")) ? getgametypesetting(#"hash_35c2d850e39fa704") : 100;
    level.var_e9d6c52f = isdefined(getgametypesetting(#"hash_46f957248efbd39a")) ? getgametypesetting(#"hash_46f957248efbd39a") : 10;
    level.player_reduction = isdefined(getgametypesetting(#"player_reduction")) ? getgametypesetting(#"player_reduction") : 4;
    level.evolution_interval = isdefined(getgametypesetting(#"evolution_interval")) ? getgametypesetting(#"evolution_interval") : 20;
    level.var_8ca0499 = isdefined(getgametypesetting(#"hash_ad6c0d1cd92c1fe")) ? getgametypesetting(#"hash_ad6c0d1cd92c1fe") : 30;
    level.var_493d04d3 = isdefined(getgametypesetting(#"hash_28233b1037888945")) ? getgametypesetting(#"hash_28233b1037888945") : 15;
    level.max_wait_time = isdefined(getgametypesetting(#"max_wait_time")) ? getgametypesetting(#"max_wait_time") : 0;
    level.var_3f631d69 = isdefined(getgametypesetting(#"hash_2d4ff63e866cdd74")) ? getgametypesetting(#"hash_2d4ff63e866cdd74") : 120;
    if (level.evolution_interval <= 0) {
        level.evolution_interval = 1;
    }
    level.var_25fc8e84 = int(ceil(level.max_wait_time * 60 / level.evolution_interval));
    starttime = gettime();
    var_fb9555e1 = 3;
    level.var_a132ca2b = level.var_8fcd8a61;
    level.var_7dc1df3a = spawnstruct();
    level.var_7dc1df3a.var_e2382b29 = level.var_8fcd8a61;
    var_e09e5160 = level.activeplayers.size;
    evolution = 0;
    /#
        println("<unknown string>" + starttime);
    #/
    /#
        println("<unknown string>" + level.var_8fcd8a61);
    #/
    /#
        println("<unknown string>" + level.var_e9d6c52f);
    #/
    /#
        println("<unknown string>" + level.player_reduction);
    #/
    /#
        println("<unknown string>" + level.evolution_interval);
    #/
    /#
        println("<unknown string>" + level.var_8ca0499);
    #/
    /#
        println("<unknown string>" + level.var_493d04d3);
    #/
    /#
        println("<unknown string>" + level.max_wait_time);
    #/
    /#
        println("<unknown string>" + level.var_3f631d69);
    #/
    /#
        println("<unknown string>" + level.var_25fc8e84);
    #/
    /#
        println("<unknown string>" + level.var_a132ca2b);
    #/
    while (1) {
        /#
            println("<unknown string>");
        #/
        /#
            println("<unknown string>" + evolution);
        #/
        if (getdvarint(#"hash_2cc9b0ef1896d89a", 1) != 0) {
            /#
                println("<unknown string>");
            #/
            level.var_7dc1df3a = undefined;
            return;
        }
        if (level.max_wait_time > 0 && level.var_25fc8e84 <= 0) {
            level.var_a132ca2b = level.var_e9d6c52f;
            level.var_8ca0499 = level.var_3f631d69;
            level.var_493d04d3 = 0;
            /#
                println("<unknown string>" + level.max_wait_time + "<unknown string>");
            #/
            /#
                println("<unknown string>" + level.var_a132ca2b + "<unknown string>" + level.var_8ca0499);
            #/
        }
        if (level.activeplayers.size >= level.var_a132ca2b) {
            level.var_7dc1df3a.var_7be962bb = level.activeplayers.size;
            level.var_7dc1df3a.var_7d960258 = level.var_a132ca2b;
            if (level.activeplayers.size < level.var_8fcd8a61) {
                /#
                    println("<unknown string>" + level.var_8fcd8a61 + "<unknown string>" + level.activeplayers.size);
                #/
                if (level.var_8ca0499 > 0) {
                    timeleft = level.var_8ca0499;
                    /#
                        println("<unknown string>" + level.var_8ca0499);
                    #/
                    while (timeleft > 0) {
                        timeleft = timeleft - 1;
                        wait(1);
                        if (level.activeplayers.size >= level.var_8fcd8a61) {
                            break;
                        }
                    }
                    level.var_7dc1df3a.var_a104a7da = level.activeplayers.size - level.var_7dc1df3a.var_7be962bb;
                }
            }
            if (level.activeplayers.size < level.var_a132ca2b) {
                wait(5);
                var_fb9555e1 = 3;
                continue;
            }
            /#
                println("<unknown string>");
            #/
            gameadvertisement::setadvertisedstatus(0);
            level.var_7dc1df3a.duration = gettime() - starttime;
            /#
                println("<unknown string>" + gettime());
            #/
            level function_73b0f715();
            return;
        }
        if (level.var_493d04d3 <= 0 && level.activeplayers.size < level.var_e9d6c52f) {
            if (var_fb9555e1 > 0) {
                /#
                    println("<unknown string>" + level.activeplayers.size);
                #/
                wait(5);
                var_fb9555e1--;
                /#
                    println("<unknown string>" + var_fb9555e1);
                #/
                continue;
            }
            function_75189494(gettime() - starttime, level.activeplayers.size, level.var_e9d6c52f);
            /#
                println("<unknown string>" + gettime());
            #/
            level.var_7dc1df3a = undefined;
            exitlevel(0, #"hash_35b5848d9f1b58e0");
            return;
        }
        /#
            println("<unknown string>");
        #/
        /#
            println("<unknown string>" + level.activeplayers.size);
        #/
        /#
            println("<unknown string>" + level.var_a132ca2b);
        #/
        if (level.activeplayers.size < level.var_a132ca2b) {
            var_7bce82a7 = level.activeplayers.size - var_e09e5160;
            if (var_7bce82a7 >= 3) {
                /#
                    println("<unknown string>" + var_7bce82a7);
                #/
                if (level.var_a132ca2b < level.var_8fcd8a61 - level.maxteamplayers) {
                    var_b0c8b797 = level.var_a132ca2b - level.activeplayers.size;
                    if (var_b0c8b797 < 4 * level.maxteamplayers) {
                        level.var_a132ca2b = level.var_a132ca2b + level.maxteamplayers;
                        /#
                            println("<unknown string>" + level.var_a132ca2b);
                        #/
                    }
                }
                var_e09e5160 = level.activeplayers.size;
                wait(2);
                /#
                    println("<unknown string>" + evolution);
                #/
                continue;
            }
        }
        evolution++;
        var_e09e5160 = level.activeplayers.size;
        /#
            println("<unknown string>" + level.evolution_interval);
        #/
        timeleft = level.evolution_interval;
        while (timeleft > 0) {
            timeleft = timeleft - 1;
            wait(1);
            if (level.activeplayers.size >= level.var_a132ca2b) {
                break;
            }
        }
        if (level.activeplayers.size < level.var_a132ca2b) {
            level.var_a132ca2b = level.var_a132ca2b - level.player_reduction;
            if (level.var_a132ca2b < level.var_e9d6c52f) {
                level.var_a132ca2b = level.var_e9d6c52f;
            }
        }
        if (level.var_25fc8e84 > 0) {
            level.var_25fc8e84--;
        }
        if (level.var_493d04d3 > 0) {
            level.var_493d04d3--;
        }
        /#
            println("<unknown string>" + level.var_a132ca2b);
        #/
        /#
            println("<unknown string>" + level.var_493d04d3);
        #/
        /#
            println("<unknown string>");
        #/
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x590fd289, Offset: 0x29c8
// Size: 0x3c4
function on_start_game_type() {
    level.callbackplayerlaststand = &laststand_warzone::playerlaststand;
    level.displayroundendtext = 0;
    level.usestartspawns = 0;
    level.var_992e9235 = [];
    level thread spawn::function_e93291ff();
    level.var_86513cd0 = &function_3b0db3c2;
    level callback::add_callback(#"hash_774be40ec06d5212", &function_bcde1e07);
    level flagsys::clear(#"spawning_allowed");
    function_414115a0();
    voice_events::register_handler(#"warzombiestart", &function_8076d591);
    voice_events::register_handler(#"warspectrerisinginfiltration", &function_8076d591);
    voice_events::register_handler(#"warboostinfiltration", &function_8076d591);
    voice_events::register_handler(#"hcwarboostinfiltration", &function_8076d591);
    voice_events::register_handler(#"warpilotbail", &function_8e7ae35);
    voice_events::register_handler(#"warcircledetectedfirst", &function_8076d591);
    voice_events::register_handler(#"warcircledetectedlast", &function_8076d591);
    voice_events::register_handler(#"warcircledetected", &function_8076d591);
    voice_events::register_handler(#"warcirclecollapseimminent", &function_8076d591);
    voice_events::register_handler(#"warcirclecollapseoccurring", &function_8076d591);
    voice_events::register_handler(#"warsupplydropincoming", &function_8076d591);
    voice_events::register_handler(#"warteamwon", &function_8076d591);
    voice_events::register_handler(#"warteamlost", &function_8076d591);
    setdvar(#"hash_2b903fa2368b18c9", 0);
    if (isdefined(level.var_4cea2bec) && level.var_4cea2bec) {
        level thread function_6ee52dd0(level.var_6c900548, level.var_e16a689f);
    }
    level thread function_5db32126();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xecf407a0, Offset: 0x2d98
// Size: 0x34
function function_bcde1e07() {
    level flagsys::clear(#"spawning_allowed");
    player_insertion::function_bcde1e07();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x468c637, Offset: 0x2dd8
// Size: 0xac
function function_3b0db3c2() {
    level.prematchperiod = max(level.prematchperiod, 5);
    level thread character_banter::start();
    level waittill(#"hash_78e53817cafb5265");
    level thread character_banter::stop();
    /#
        println("<unknown string>");
    #/
    gameadvertisement::setadvertisedstatus(0);
}

// Namespace warzone/warzone
// Params 0, eflags: 0x5 linked
// Checksum 0xa57f2b4f, Offset: 0x2e90
// Size: 0x7e
function private function_70171add() {
    if (randomfloat(1) <= getdvarfloat(#"survey_chance", 0)) {
        return randomintrange(1, getdvarint(#"survey_count", 0) + 1);
    }
    return 0;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x5 linked
// Checksum 0xd44b063f, Offset: 0x2f18
// Size: 0xc4
function private start_insertion() {
    /#
        if (getdvarint(#"scr_disable_infiltration", 0)) {
            level.var_bde3d03 = undefined;
            level flagsys::set(#"insertion_teleport_completed");
            return;
        }
        while (getplayers().size == 0) {
            wait(0.5);
        }
    #/
    level flagsys::set(#"spawning_allowed");
    level player_insertion::function_8dcd8623();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x3adc830b, Offset: 0x2fe8
// Size: 0x7c
function function_a9822793() {
    if (getdvarint(#"hash_761d80face4c4459", 0)) {
        return;
    }
    customgame = gamemodeismode(1) || gamemodeismode(7);
    if (customgame) {
        return;
    }
    teams::function_a9822793();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x66e71346, Offset: 0x3070
// Size: 0x33c
function start_warzone() {
    level notify(#"start_warzone");
    if (infection::function_74650d7()) {
        infection::function_fb163563(#"platoon_1");
        infection::function_153000d0(#"hash_26cbd829e32a90c5", #"hash_197817ab19e99648");
    }
    /#
        println("<unknown string>");
    #/
    gameadvertisement::setadvertisedstatus(0);
    function_a9822793();
    if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn) {
        level callback::add_callback(#"hash_3057417db7f8acdd", &function_77319881);
    }
    if (sessionmodeisonlinegame() && getdvarint(#"hash_6aad986495699040", 0) != 0) {
        function_f539d880();
    }
    function_65469e2e();
    function_d547b972();
    level thread function_fbb2b180();
    level thread wz_ai::ai_init();
    level start_insertion();
    level.ingraceperiod = 0;
    level.var_bde3d03 = undefined;
    var_f9adbf05 = function_70171add();
    foreach (player in getplayers()) {
        player spawn::function_8cef1872();
        player val::reset(#"warzonestaging", "takedamage");
        if (sessionmodeisonlinegame()) {
            player stats::function_7a850245(#"demofileid", getdemofileid());
            if (level.rankedmatch) {
                player stats::function_7a850245("surveyId", var_f9adbf05);
            }
        }
    }
    spawn::function_cb5864fc();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x5 linked
// Checksum 0xd83e4124, Offset: 0x33b8
// Size: 0xfc
function private function_fbb2b180() {
    level flagsys::wait_till(#"insertion_teleport_completed");
    function_3ca3c6e4();
    resetglass();
    if (isdefined(level.var_82eb1dab)) {
        foreach (deathmodel in level.var_82eb1dab) {
            deathmodel delete();
        }
        level.var_82eb1dab = undefined;
    }
    level flagsys::set(#"hash_507a4486c4a79f1d");
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xdebac9db, Offset: 0x34c0
// Size: 0x4c
function on_player_connect() {
    self.var_63af7f75 = -1;
    self.var_c5134737 = 1;
    level function_22df4165();
    self wz_progression::player_connected();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xe9e07beb, Offset: 0x3518
// Size: 0x34
function on_player_disconnect() {
    self wz_progression::player_disconnected();
    level function_22df4165();
}

// Namespace warzone/warzone
// Params 2, eflags: 0x5 linked
// Checksum 0xbca7838e, Offset: 0x3558
// Size: 0x1a0
function private function_ec2c9808(response, intpayload) {
    if (!isalive(self) && !player::function_73da2f89()) {
        return;
    }
    foreach (player in getplayers()) {
        if (player.team === self.team) {
            if (response == "placed") {
                xcoord = int(intpayload / 1000);
                ycoord = intpayload - xcoord * 1000;
                player luinotifyevent(#"teammate_waypoint_placed", 3, self getentitynumber(), xcoord, ycoord);
            } else if (response == "removed") {
                player luinotifyevent(#"teammate_waypoint_removed", 1, self getentitynumber());
            }
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xafa9a779, Offset: 0x3700
// Size: 0x24
function function_cc47bb2f() {
    if (game.state == "pregame") {
        return 1;
    }
    return 0;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xaf97742d, Offset: 0x3730
// Size: 0x612
function on_player_spawned() {
    self endon(#"death");
    level endon(#"game_ended");
    if (isdefined(getgametypesetting(#"wzheavymetalheroes")) ? getgametypesetting(#"wzheavymetalheroes") : 0) {
        self setperk(#"specialty_doublejump");
        self setperk(#"specialty_fallheight");
    }
    self.var_1ab1ec0c = self.origin;
    self laststand_warzone::function_7e714b6a();
    level function_22df4165();
    character_index = self getcharacterbodytype();
    fields = getcharacterfields(character_index, currentsessionmode());
    if (isdefined(fields)) {
        if (isdefined(fields.var_9c1be670) && fields.var_9c1be670) {
            self hidepart("tag_ability_hero");
        }
        if (isdefined(fields.var_1b216715) && fields.var_1b216715) {
            self hidepart("tag_equipment_hero");
        }
    }
    if (isdefined(self.pers) && isdefined(self.pers[#"lives"])) {
        self spawn::function_1390f875(self.pers[#"lives"]);
        if (infection::function_74650d7() && self infection::is_infected()) {
            if (function_47851c07()) {
                self clientfield::set_player_uimodel("hudItems.showReinsertionPassengerCount", 1);
                self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 1);
                self.var_874448e8 = 1;
            } else {
                self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 0);
            }
        } else {
            if (self.pers[#"lives"] != 1 && !(isdefined(self.var_874448e8) && self.var_874448e8)) {
                self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 1);
                self.var_874448e8 = 1;
            }
            if (self.pers[#"lives"] == 1) {
                self clientfield::set_player_uimodel("hudItems.playerCanRedeploy", 0);
            }
        }
    }
    self menus::register_menu_response_callback("WaypointPlaced", &function_ec2c9808);
    if (function_cc47bb2f()) {
        self val::reset(#"spawn_player", "freezecontrols");
        self val::reset(#"spawn_player", "disablegadgets");
        self val::set(#"warzonestaging", "takedamage", 0);
        if (level.var_79219af4 > 0 && level.activeplayers.size + 1 >= level.var_79219af4) {
            level function_73b0f715();
        }
    } else if (infection::function_74650d7() && self infection::is_infected()) {
        self infection::function_8bdd6715();
    } else {
        /#
            if (getdvarint(#"scr_disable_infiltration", 0)) {
                self menus::register_menu_response_callback("<unknown string>", &function_ec2c9808);
                return;
            }
        #/
        var_7eb8f61a = isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0;
        self clientfield::set_to_player("realtime_multiplay", 1);
        switch (var_7eb8f61a) {
        case 0:
            self thread player_reinsertion::function_584c9f1();
            break;
        case 1:
            self thread player_reinsertion::function_39a51e47();
            break;
        case 2:
            self thread player_reinsertion::function_3c4884f1();
            break;
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xadfe711e, Offset: 0x3d50
// Size: 0x24
function on_round_switch() {
    gametype::on_round_switch();
    globallogic_score::updateteamscorebyroundswon();
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xaeed2a51, Offset: 0x3d80
// Size: 0x34
function on_end_round(var_c1e98979) {
    function_f1394038();
    function_16e6bd2e(var_c1e98979);
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0x882bcc22, Offset: 0x3dc0
// Size: 0x6a
function function_74a8f2ed(var_d3ba512b, var_c0856555) {
    if (var_d3ba512b.score > var_c0856555.score) {
        return 1;
    }
    if (var_c0856555.score > var_d3ba512b.score) {
        return 0;
    }
    return function_39971b81(var_d3ba512b, var_c0856555);
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x3e275e16, Offset: 0x3e38
// Size: 0x620
function function_f1394038() {
    if (infection::function_74650d7()) {
        placement = 1;
        params = globallogic::function_9c839e9();
        if (!function_eb1c0d37(params.var_dfa2cc2c)) {
            foreach (team in params.var_dfa2cc2c) {
                level.var_eed7c027[team] = placement;
            }
            placement++;
        }
        var_6c4bfa17 = infection::function_76601b7d();
        foreach (team in function_37d3bfcb(var_6c4bfa17)) {
            level.var_eed7c027[team] = placement;
        }
        return;
    }
    if (platoons::function_382a49e0()) {
        placement = 1;
        foreach (platoon, _ in level.platoons) {
            if (!platoons::is_all_dead(platoon)) {
                foreach (team in function_37d3bfcb(platoon)) {
                    level.var_eed7c027[team] = placement;
                }
                placement++;
            }
        }
        foreach (platoon, _ in level.platoons) {
            if (platoons::is_all_dead(platoon)) {
                foreach (team in function_37d3bfcb(platoon)) {
                    level.var_eed7c027[team] = placement;
                }
                placement++;
            }
        }
        return;
    }
    var_17616452 = [];
    foreach (team, _ in level.teams) {
        if (teams::function_9dd75dad(team) && !(isdefined(level.var_606becce[team]) && level.var_606becce[team]) && !isdefined(level.var_eed7c027[team])) {
            players = getplayers(team);
            team_score = [[ level._getteamscore ]](team);
            team_kills = function_7e309c84(team, players);
            damage_done = function_3915e148(team, players);
            if (!isdefined(var_17616452)) {
                var_17616452 = [];
            } else if (!isarray(var_17616452)) {
                var_17616452 = array(var_17616452);
            }
            var_17616452[var_17616452.size] = {#score:team_score, #damage:damage_done, #kills:team_kills, #last_alive:undefined, #players:players, #team:team};
        }
    }
    var_ec950e92 = array::merge_sort(var_17616452, &function_74a8f2ed);
    placement = 1;
    foreach (team in var_ec950e92) {
        level.var_eed7c027[team.team] = placement;
        placement++;
    }
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0x48577924, Offset: 0x4460
// Size: 0xe2
function function_94203702(team, players) {
    var_b7771cfa = 0;
    last_player = undefined;
    foreach (player in players) {
        if (isdefined(player.teamkilled) && player.teamkilled) {
            continue;
        }
        if (player.deathtime > var_b7771cfa) {
            var_b7771cfa = player.deathtime;
            last_player = player;
        }
    }
    return last_player;
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0x56cd6fdf, Offset: 0x4550
// Size: 0x98
function function_7e309c84(team, players) {
    team_kills = 0;
    foreach (player in players) {
        team_kills = team_kills + player.kills;
    }
    return team_kills;
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0xf599f2e3, Offset: 0x45f0
// Size: 0x98
function function_3915e148(team, players) {
    damage_done = 0;
    foreach (player in players) {
        damage_done = damage_done + player.damagedone;
    }
    return damage_done;
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0xe3f3c6e5, Offset: 0x4690
// Size: 0x172
function function_39971b81(var_d3ba512b, var_c0856555) {
    if (isdefined(var_d3ba512b.last_alive) && !isdefined(var_c0856555.last_alive)) {
        return 1;
    }
    if (isdefined(var_c0856555.last_alive) && !isdefined(var_d3ba512b.last_alive)) {
        return 0;
    }
    if (isdefined(var_d3ba512b.last_alive) && var_d3ba512b.last_alive.deathtime > var_c0856555.last_alive.deathtime) {
        return 1;
    }
    if (isdefined(var_d3ba512b.last_alive) && var_c0856555.last_alive.deathtime > var_d3ba512b.last_alive.deathtime) {
        return 0;
    }
    if (var_d3ba512b.kills > var_c0856555.kills) {
        return 1;
    }
    if (var_c0856555.kills > var_d3ba512b.kills) {
        return 0;
    }
    if (var_d3ba512b.damage > var_c0856555.damage) {
        return 1;
    }
    if (var_c0856555.damage > var_d3ba512b.damage) {
        return 0;
    }
    return 1;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x7bbe80b0, Offset: 0x4810
// Size: 0x1da
function function_c7eae573() {
    var_d72df62 = [];
    foreach (team, _ in level.teams) {
        if (teams::function_9dd75dad(team) && !(isdefined(level.var_606becce[team]) && level.var_606becce[team]) && teams::is_all_dead(team)) {
            players = getplayers(team);
            last_alive = function_94203702(team, players);
            team_kills = function_7e309c84(team, players);
            damage_done = function_3915e148(team, players);
            var_d72df62[var_d72df62.size] = {#damage:damage_done, #kills:team_kills, #last_alive:last_alive, #players:players, #team:team};
        }
    }
    var_ec950e92 = array::merge_sort(var_d72df62, &function_39971b81);
    return var_ec950e92;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x588a7bdf, Offset: 0x49f8
// Size: 0x4e
function function_c2f2fb84(var_d72df62) {
    if (var_d72df62.size == 0) {
        return undefined;
    }
    if (var_d72df62.size == 1) {
        return var_d72df62[0].team;
    }
    return var_d72df62[0].team;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x3172871f, Offset: 0x4a50
// Size: 0xf8
function function_5fed3908(team) {
    if (!isdefined(team)) {
        return;
    }
    level thread wz_progression::function_5648f82(team);
    level thread wz_contracts::function_5648f82(team);
    if (function_8b1a219a()) {
        players = getplayers(team);
        foreach (player in players) {
            player clientfield::set_to_player("RGB_keyboard_manager", 1);
        }
    }
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0x71441969, Offset: 0x4b50
// Size: 0x15e
function team_eliminated(team, var_293493b) {
    level.var_606becce[team] = 1;
    wz_progression::team_eliminated(team, var_293493b);
    level function_22df4165();
    level thread function_9498e451(team);
    deadteam = getplayers(team);
    foreach (teammember in deadteam) {
        teammember notify(#"end_respawn");
        if (!platoons::function_382a49e0()) {
            teammember luinotifyevent(#"team_eliminated", 1, var_293493b);
        }
    }
    level.var_eed7c027[team] = var_293493b;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x827247c, Offset: 0x4cb8
// Size: 0x39c
function on_dead_event(team) {
    if (team == "all") {
        var_d72df62 = function_c7eae573();
        winning_team = function_c2f2fb84(var_d72df62);
        count = 2;
        foreach (final_team in var_d72df62) {
            if (!isdefined(winning_team) || util::function_fbce7263(winning_team, final_team.team)) {
                team_eliminated(final_team.team, count);
                count++;
            }
        }
        function_5fed3908(winning_team);
        round::function_af2e264f(winning_team);
        thread globallogic::end_round(6);
    } else {
        platoon = getteamplatoon(team);
        if (infection::function_74650d7()) {
            var_293493b = 2;
            level.var_eed7c027[team] = var_293493b;
            wz_progression::team_eliminated(team, var_293493b);
        } else if (platoons::function_382a49e0() && platoon != #"none" && platoon != #"invalid") {
            if (teams::function_9dd75dad(team) && !(isdefined(level.var_606becce[team]) && level.var_606becce[team]) && platoons::is_all_dead(platoon)) {
                foreach (team in function_37d3bfcb(platoon)) {
                    team_eliminated(team, platoons::function_cea75f29() + 1);
                }
            }
        } else if (teams::function_9dd75dad(team) && !(isdefined(level.var_606becce[team]) && level.var_606becce[team]) && teams::is_all_dead(team)) {
            team_eliminated(team, globallogic::function_e9e52d05() + 1);
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xcad18e91, Offset: 0x5060
// Size: 0x4c
function function_61c315e0() {
    if (infection::function_74650d7()) {
        params = globallogic::function_9c839e9();
        function_ded0be06(params);
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x3b7c0f6d, Offset: 0x50b8
// Size: 0xde
function function_a40b79b1(team) {
    if (!isdefined(team) || teams::is_all_dead(team)) {
        return 1;
    }
    foreach (player in getplayers(team)) {
        if (isalive(player) && !player laststand::player_is_in_laststand()) {
            return 0;
        }
    }
    return 1;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xe9fb959e, Offset: 0x51a0
// Size: 0xa8
function function_eb1c0d37(teams) {
    if (!isdefined(teams)) {
        return 1;
    }
    foreach (team in teams) {
        if (!isdefined(team) || function_a40b79b1(team)) {
            continue;
        }
        return 0;
    }
    return 1;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x2a72b663, Offset: 0x5250
// Size: 0x51c
function function_ded0be06(params) {
    if (function_eb1c0d37(params.var_dfa2cc2c)) {
        level notify(#"hash_334bade8f4c0b69f");
    } else {
        level endon(#"hash_334bade8f4c0b69f");
        if (flagsys::get(#"hash_402b08cbe8f533d2")) {
            return;
        }
        music::setmusicstate("pan_timeout_01");
        flagsys::set(#"hash_402b08cbe8f533d2");
        foreach (player in getplayers()) {
            player luinotifyevent(#"create_prematch_timer", 3, gettime() + 60000, 1, 1);
        }
        wait(60);
    }
    var_f1a61e0 = 0;
    foreach (var_a505a9b4 in params.var_dfa2cc2c) {
        if (!isdefined(var_a505a9b4)) {
            continue;
        }
        if (!function_a40b79b1(var_a505a9b4) && getteamplatoon(var_a505a9b4) != infection::function_76601b7d()) {
            if (var_f1a61e0 == 0) {
                round::function_af2e264f(var_a505a9b4);
            } else {
                round::function_af2e264f();
            }
            level thread function_3832a0d2(var_a505a9b4);
            function_5fed3908(var_a505a9b4);
            var_f1a61e0++;
        }
    }
    var_b00f47b3 = var_f1a61e0 >= 1;
    platoon = infection::function_76601b7d();
    if (!var_b00f47b3) {
        round::function_35702443(platoon);
    }
    foreach (team in function_37d3bfcb(platoon)) {
        if (teams::function_9dd75dad(team)) {
            if (var_b00f47b3) {
                wz_progression::team_eliminated(team, 2);
            } else {
                level thread function_3832a0d2(team);
                function_5fed3908(team);
            }
        }
    }
    if (!var_b00f47b3 && (isdefined(params.var_46a749a8) || isdefined(params.var_dfa2cc2c))) {
        foreach (team in params.var_dfa2cc2c) {
            if (getteamplatoon(team) != platoon) {
                wz_progression::team_eliminated(team, 2);
            }
        }
        foreach (team in params.var_46a749a8) {
            if (getteamplatoon(team) != platoon) {
                wz_progression::team_eliminated(team, 2);
            }
        }
    }
    thread globallogic::end_round(6);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x85ea7b0d, Offset: 0x5778
// Size: 0x17c
function function_5af3a29(params) {
    if (infection::function_74650d7()) {
        level function_ded0be06(params);
    } else if (platoons::function_382a49e0()) {
        platoon = getteamplatoon(params.teams_alive[0]);
        foreach (team in function_37d3bfcb(platoon)) {
            if (teams::function_9dd75dad(team)) {
                level thread function_3832a0d2(team);
                function_5fed3908(team);
            }
        }
    } else {
        level thread function_3832a0d2(params.teams_alive[0]);
        function_5fed3908(params.teams_alive[0]);
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x3726aa9f, Offset: 0x5900
// Size: 0x114
function function_3832a0d2(team) {
    winner = function_b5f4c9d8(team);
    if (isdefined(winner)) {
        var_fc96f513 = winner getmpdialogname();
        if (isdefined(var_fc96f513)) {
            player_bundle = struct::get_script_bundle("mpdialog_player", var_fc96f513);
            if (isdefined(player_bundle)) {
                var_520b24a = player_bundle.boostwin;
                if (isdefined(var_520b24a)) {
                    level.var_fec861a7 = 1;
                    winner battlechatter::function_a48c33ff(var_520b24a, 148, 5);
                    level.var_fec861a7 = undefined;
                }
            }
        }
    }
    wait(5);
    globallogic_audio::leader_dialog("warTeamWon", team);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xeede985e, Offset: 0x5a20
// Size: 0x102
function function_b5f4c9d8(team) {
    winner = undefined;
    players = getplayers(team);
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        if (!isdefined(player.lastkilltime)) {
            player.lastkilltime = 0;
        }
        if (!isdefined(winner) || player.lastkilltime > winner.lastkilltime) {
            winner = player;
        }
    }
    return winner;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x270fb890, Offset: 0x5b30
// Size: 0x3a
function function_9498e451(team) {
    wait(1);
    while (isdefined(level.var_fec861a7) && level.var_fec861a7) {
        waitframe(1);
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xfa51c0c7, Offset: 0x5b78
// Size: 0x132
function on_one_left_event(team) {
    if (team == "all") {
        return;
    }
    platoon = getteamplatoon(team);
    if (platoon != #"none" && platoon != #"invalid") {
        return;
    }
    foreach (player in getplayers(team)) {
        if (isalive(player) && !player laststand::player_is_in_laststand()) {
            player globallogic_audio::leader_dialog_on_player("warLastManStanding");
            return;
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xbd99ace6, Offset: 0x5cb8
// Size: 0x24
function function_379afb41() {
    death_circle::function_27d5d349();
    wz_ai_zonemgr::function_dc16557c();
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x945dddb, Offset: 0x5ce8
// Size: 0x13c
function on_end_game(var_c1e98979) {
    function_379afb41();
    if (infection::function_74650d7()) {
        luinotifyevent(#"prematch_timer_ended", 2, 1, 1);
    }
    level.var_bde3d03 = &function_b777ff94;
    level thread globallogic_audio::function_85818e24("matchcomplete");
    winner = round::get_winner();
    var_1167be0c = round::function_d30d1a2e();
    match::function_af2e264f(winner);
    match::function_35702443(var_1167be0c);
    setmatchflag("game_ended", 0);
    wait(2);
    setmatchflag("game_ended", 1);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x86cd2404, Offset: 0x5e30
// Size: 0x28c
function function_c1a417ee(params) {
    level function_22df4165();
    attacker = params.attacker;
    weapon = params.weapon;
    smeansofdeath = params.smeansofdeath;
    if (isdefined(params.laststandparams)) {
        attacker = params.laststandparams.attacker;
        weapon = params.laststandparams.sweapon;
        smeansofdeath = params.laststandparams.smeansofdeath;
    }
    if (isplayer(attacker)) {
        itemindex = getitemindexfromref(weapon.name);
        if (itemindex == 0) {
            itemindex = getitemindexfromref(weapon.statname);
        }
        var_97dcd0a5 = getunlockableiteminfofromindex(itemindex, 1);
        if (isdefined(var_97dcd0a5)) {
            attackerid = attacker getentitynumber();
            self luinotifyevent(#"eliminator_info", 3, attackerid, 0, weapon.statindex);
        } else {
            self luinotifyevent(#"eliminator_info", 3, 0, function_4a856ead(smeansofdeath), 0);
        }
    } else {
        self luinotifyevent(#"eliminator_info", 3, 0, function_4a856ead(smeansofdeath), 0);
    }
    self function_75134917();
    self function_e6f9e3cd();
    self.specialty = self getloadoutperks(0);
    self loadout::register_perks();
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xcf16f5d2, Offset: 0x60c8
// Size: 0x120
function function_75134917() {
    if (infection::function_74650d7() && !self infection::is_infected()) {
        foreach (player in getplayers()) {
            if (player.team === self.team) {
                player luinotifyevent(#"teammate_waypoint_removed", 1, self getentitynumber());
                self luinotifyevent(#"teammate_waypoint_removed", 1, player getentitynumber());
            }
        }
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x6c8a5d39, Offset: 0x61f0
// Size: 0x154
function function_c14ef1aa(attacker) {
    if (getdvarint(#"hash_10c3f1c0958c1fba", 0) == 0) {
        return 0;
    }
    if (!isdedicated()) {
        return 0;
    }
    if (isalive(self)) {
        return 0;
    }
    if (isdefined(self.switching_teams)) {
        return 0;
    }
    if (isdefined(attacker) && attacker == self) {
        return 0;
    }
    if (level.teambased && isdefined(attacker) && isdefined(attacker.team) && attacker.team == self.team) {
        return 0;
    }
    if (isdefined(attacker) && (!isdefined(attacker.team) || attacker.team == "free") && (attacker.classname == "trigger_hurt_new" || attacker.classname == "worldspawn")) {
        return 0;
    }
    return 1;
}

// Namespace warzone/warzone
// Params 9, eflags: 0x1 linked
// Checksum 0x6d84f30f, Offset: 0x6350
// Size: 0x456
function player_killed(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    self clientfield::set_to_player("realtime_multiplay", 0);
    if (smeansofdeath == "MOD_META") {
        return;
    }
    if (isdefined(level.droppedtagrespawn) && level.droppedtagrespawn) {
        thread dogtags::checkallowspectating();
        should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
        if (should_spawn_tags) {
            level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
        }
    }
    if (isplayer(attacker) && self function_c14ef1aa(attacker)) {
        var_27a8d662 = self getxuid(1) + attacker getxuid(1);
        self function_b096092b(var_27a8d662);
        attacker function_b096092b(var_27a8d662);
    }
    if (!isdefined(killstreaks::get_killstreak_for_weapon(weapon)) || isdefined(level.killstreaksgivegamescore) && level.killstreaksgivegamescore) {
        attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperkill);
        self globallogic_score::giveteamscoreforobjective(self.team, level.teamscoreperdeath * -1);
        if (smeansofdeath == "MOD_HEAD_SHOT") {
            attacker globallogic_score::giveteamscoreforobjective(attacker.team, level.teamscoreperheadshot);
        }
    }
    if (infection::function_74650d7()) {
        params = globallogic::function_9c839e9();
        lastsurvivor = 0;
        if (params.var_dfa2cc2c.size == 1) {
            survivors = 0;
            foreach (player in getplayers(params.var_dfa2cc2c[0])) {
                if (isalive(player) && !player laststand::player_is_in_laststand()) {
                    survivors++;
                }
            }
            lastsurvivor = survivors <= 1;
        }
        if (!lastsurvivor) {
            self infection::function_d3da95cf();
            self clientfield::set_player_uimodel("hudItems.playerOnInfectedPlatoon", 1);
            if (level.numlives == 0 && function_47851c07()) {
                self.pers[#"lives"] = 1;
            }
        }
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xc1fee8a0, Offset: 0x67b0
// Size: 0x114
function function_16e6bd2e(var_c1e98979) {
    var_1e866967 = spawnstruct();
    var_1e866967.remainingtime = max(0, globallogic_utils::gettimeremaining());
    switch (var_c1e98979) {
    case 2:
        var_1e866967.wintype = "time_limit_reached";
        break;
    case 3:
        var_1e866967.wintype = "score_limit_reached";
        break;
    case 9:
    case 10:
    default:
        var_1e866967.wintype = "NA";
        break;
    }
    bb::function_bf5cad4e(var_1e866967);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x3d68518b, Offset: 0x68d0
// Size: 0x88
function function_73b0f715(player = undefined) {
    if (game.state != "pregame") {
        return;
    }
    if (isdedicated()) {
        if (getdvarint(#"hash_41feb500743b0d15", 0) != 0) {
            return;
        }
    }
    level notify(#"hash_78e53817cafb5265");
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x161a416a, Offset: 0x6960
// Size: 0xca
function function_47851c07() {
    if (game.state != "playing") {
        return 0;
    }
    if (infection::function_74650d7()) {
        return 1;
    }
    if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn) {
        return death_circle::function_d66a3de1();
    }
    if (isdefined(level.wave_spawn) && level.wave_spawn && (death_circle::function_9956f107() || isdefined(level.var_75db41a7) && gettime() > level.var_75db41a7)) {
        return 0;
    }
    return 1;
}

// Namespace warzone/warzone
// Params 2, eflags: 0x1 linked
// Checksum 0x5b446bbc, Offset: 0x6a38
// Size: 0x356
function function_de15dc32(killed_player, disconnected_player) {
    player_count = {#alive_platoons:[], #alive:0, #total:0};
    var_77cfc33d = game.state == "pregame" || function_47851c07();
    foreach (team in level.teams) {
        players = getplayers(team);
        if (players.size == 0) {
            continue;
        }
        platoon = getteamplatoon(team);
        var_40073db2 = 0;
        var_ead60f69 = 0;
        foreach (player in players) {
            if (disconnected_player === player) {
                continue;
            }
            player_count.total++;
            if (isalive(player) || infection::function_74650d7() && player infection::is_infected()) {
                var_40073db2++;
            } else if (player.sessionstate != "playing" || killed_player === player) {
                if (player globallogic_spawn::function_38527849()) {
                    var_ead60f69++;
                }
            }
        }
        player_count.alive = player_count.alive + var_40073db2;
        if (!isdefined(player_count.alive_platoons[platoon])) {
            player_count.alive_platoons[platoon] = 0;
        }
        player_count.alive_platoons[platoon] = player_count.alive_platoons[platoon] + var_40073db2;
        if (var_77cfc33d && level.var_c2cc011f && var_40073db2 > 0) {
            player_count.alive = player_count.alive + var_ead60f69;
            player_count.alive_platoons[platoon] = player_count.alive_platoons[platoon] + var_ead60f69;
        }
    }
    return player_count;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x8830226c, Offset: 0x6d98
// Size: 0x12
function function_22df4165() {
    level.var_22df4165 = 1;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x389bcb37, Offset: 0x6db8
// Size: 0x48
function function_5db32126() {
    while (1) {
        waitframe(1);
        if (isdefined(level.var_22df4165) && level.var_22df4165) {
            function_e91890a7();
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x29ed4be5, Offset: 0x6e08
// Size: 0x35a
function function_e91890a7() {
    if (!(isdefined(level.var_22df4165) && level.var_22df4165)) {
        return;
    }
    util::waittillslowprocessallowed();
    player_counts = function_de15dc32();
    players = getplayers();
    foreach (player in players) {
        aliveplayercount = player_counts.alive;
        player clientfield::set_player_uimodel("presence.modeparam", aliveplayercount);
        if (!platoons::function_382a49e0()) {
            player clientfield::set_player_uimodel("hudItems.alivePlayerCount", aliveplayercount);
        } else {
            var_a4812ee3 = getteamplatoon(player.team);
            /#
                assert(isdefined(player_counts.alive_platoons[var_a4812ee3]));
            #/
            player clientfield::set_player_uimodel("hudItems.alivePlayerCount", player_counts.alive_platoons[var_a4812ee3]);
            player clientfield::set_player_uimodel("hudItems.alivePlayerCountEnemy", 0);
            foreach (platoon, _ in player_counts.alive_platoons) {
                if (platoon == var_a4812ee3) {
                    continue;
                }
                player clientfield::set_player_uimodel("hudItems.alivePlayerCountEnemy", player_counts.alive_platoons[platoon]);
                break;
            }
        }
        var_31cc0ff8 = 0;
        teammembers = getplayers(player.team);
        foreach (member in teammembers) {
            if (isalive(member) && member != player) {
                var_31cc0ff8++;
            }
        }
        player clientfield::set_player_uimodel("hudItems.aliveTeammateCount", var_31cc0ff8);
    }
    level.var_22df4165 = undefined;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x4cf6e29e, Offset: 0x7170
// Size: 0x44
function function_4012c0ab(params) {
    count = function_c14f7557();
    level clientfield::set_world_uimodel("hudItems.warzone.reinsertionPassengerCount", count);
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x3a5df67, Offset: 0x71c0
// Size: 0x24c
function function_c14f7557() {
    if (game.state != "pregame" && game.state != "playing") {
        return 0;
    }
    if (!infection::function_74650d7()) {
        if (isdefined(level.deathcirclerespawn) && level.deathcirclerespawn && death_circle::function_4dc40125()) {
            return 0;
        }
        if (isdefined(level.wave_spawn) && level.wave_spawn && death_circle::function_9956f107()) {
            return 0;
        }
    }
    count = 0;
    foreach (team in level.teams) {
        players = getplayers(team);
        var_40073db2 = 0;
        var_ead60f69 = 0;
        foreach (player in players) {
            if (isalive(player)) {
                var_40073db2++;
            } else if (player.sessionstate != "playing" && player globallogic_spawn::function_38527849()) {
                var_ead60f69++;
            }
        }
        if (!level.var_c2cc011f || var_40073db2 > 0) {
            count = count + var_ead60f69;
        }
    }
    return count;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xce59cabb, Offset: 0x7418
// Size: 0x6c
function function_2f66bc37() {
    /#
        assert(isplayer(self));
    #/
    self setactionslot(3, "flourish_callouts");
    self setactionslot(4, "sprays_boasts");
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xa844c801, Offset: 0x7490
// Size: 0x8c
function function_cb4b48d5(var_80427091 = 1) {
    /#
        assert(isplayer(self));
    #/
    if (var_80427091) {
        self setactionslot(3, "");
    }
    self setactionslot(4, "");
}

// Namespace warzone/enter_vehicle
// Params 1, eflags: 0x40
// Checksum 0x4824a151, Offset: 0x7528
// Size: 0x3c
function event<enter_vehicle> codecallback_entervehicle(eventstruct) {
    if (isplayer(self)) {
        self function_cb4b48d5(0);
    }
}

// Namespace warzone/exit_vehicle
// Params 1, eflags: 0x40
// Checksum 0x98f5a52, Offset: 0x7570
// Size: 0x3c
function event<exit_vehicle> codecallback_exitvehicle(eventstruct) {
    if (isplayer(self)) {
        self function_2f66bc37();
    }
}

// Namespace warzone/freefall
// Params 1, eflags: 0x40
// Checksum 0xeffe119d, Offset: 0x75b8
// Size: 0x54
function event<freefall> function_5019e563(eventstruct) {
    if (eventstruct.freefall) {
        self function_cb4b48d5();
    } else if (!eventstruct.var_695a7111) {
        self function_2f66bc37();
    }
}

// Namespace warzone/parachute
// Params 1, eflags: 0x40
// Checksum 0x777ff0b0, Offset: 0x7618
// Size: 0x44
function event<parachute> function_87b05fa3(eventstruct) {
    if (eventstruct.parachute) {
        self function_cb4b48d5();
    } else {
        self function_2f66bc37();
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xb4a873c5, Offset: 0x7668
// Size: 0x318
function give_custom_loadout(takeoldweapon = 0) {
    self loadout::init_player(!takeoldweapon);
    if (takeoldweapon) {
        oldweapon = self getcurrentweapon();
        weapons = self getweaponslist();
        foreach (weapon in weapons) {
            self takeweapon(weapon);
        }
    }
    nullprimary = getweapon(#"null_offhand_primary");
    self giveweapon(nullprimary);
    self setweaponammoclip(nullprimary, 0);
    self switchtooffhand(nullprimary);
    if (self.firstspawn !== 0) {
        function_2f66bc37();
    }
    healthgadget = getweapon(#"gadget_health_regen");
    self giveweapon(healthgadget);
    self setweaponammoclip(healthgadget, 0);
    self switchtooffhand(healthgadget);
    level.var_ef61b4b5 = healthgadget;
    var_fb6490c8 = self gadgetgetslot(healthgadget);
    self gadgetpowerset(var_fb6490c8, 0);
    bare_hands = getweapon(#"bare_hands");
    self giveweapon(bare_hands);
    self function_c9a111a(bare_hands);
    self switchtoweapon(bare_hands, 1);
    if (self.firstspawn !== 0) {
        self setspawnweapon(bare_hands);
    }
    self.specialty = self getloadoutperks(0);
    self loadout::register_perks();
    return bare_hands;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0x259a467b, Offset: 0x7988
// Size: 0x6
function function_486a8395() {
    return 0;
}

// Namespace warzone/warzone
// Params 2, eflags: 0x5 linked
// Checksum 0x1a5fe4a, Offset: 0x7998
// Size: 0x54
function private function_8076d591(event, params) {
    if (isdefined(params)) {
        globallogic_audio::leader_dialog(event, params.team);
    } else {
        globallogic_audio::leader_dialog(event);
    }
}

// Namespace warzone/warzone
// Params 2, eflags: 0x5 linked
// Checksum 0xd8f51f03, Offset: 0x79f8
// Size: 0x140
function private function_8e7ae35(event, params) {
    var_e8d63736 = array(#"hash_780a85992e00c556", #"hash_1669c4b328d5e163", #"hash_67baa029914d2410", #"hash_3f71a3968fd86875");
    var_1f1b9efb = var_e8d63736[randomint(var_e8d63736.size)];
    if (isdefined(params) && isdefined(params.insertion)) {
        foreach (player in params.insertion.players) {
            if (isdefined(player)) {
                player playlocalsound(var_1f1b9efb);
            }
        }
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xf89efa8e, Offset: 0x7b40
// Size: 0x1e
function function_a3e209ba() {
    if (player_insertion::function_6660c1f()) {
        return 0;
    }
    return 1;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xbcc99739, Offset: 0x7b68
// Size: 0x6c
function function_aaa24662() {
    belowworldtrigger = getent("below_world_trigger", "targetname");
    if (!isentity(belowworldtrigger)) {
        return;
    }
    belowworldtrigger callback::on_trigger(&function_3c8be2d2);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x5 linked
// Checksum 0x25bbe0e8, Offset: 0x7be0
// Size: 0x28c
function private function_1e150a0b(player) {
    if (!isplayer(player)) {
        /#
            assert(0);
        #/
        return;
    }
    var_9c24b065 = 5;
    var_2497d4aa = 100;
    var_9a5b8004 = 250;
    var_3a60655f = 100;
    var_50c30b0c = 250;
    var_5988a0d = 10000;
    var_85d40a8 = player.origin[2] + 500;
    startpos = (player.origin[0] + randomintrange(var_2497d4aa, var_9a5b8004), player.origin[1] + randomintrange(var_3a60655f, var_50c30b0c), var_5988a0d);
    endpos = (startpos[0], startpos[1], var_85d40a8);
    for (index = 0; index < var_9c24b065; index++) {
        var_708a2754 = physicstrace(startpos, endpos, (0, 0, 0), (0, 0, 0), player, 32);
        if (var_708a2754[#"fraction"] < 1) {
            player setorigin(var_708a2754[#"position"]);
            return;
        }
        startpos = (startpos[0] + randomintrange(var_2497d4aa, var_9a5b8004), startpos[1] + randomintrange(var_3a60655f, var_50c30b0c), var_5988a0d);
        endpos = (startpos[0], startpos[1], var_85d40a8);
    }
    player dodamage(player.health * 100, player.origin);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x5 linked
// Checksum 0x4e2b6bda, Offset: 0x7e78
// Size: 0x17c
function private function_293cd859(ent) {
    if (isplayer(ent)) {
        data = {#type:#"player", #pos_z:ent.origin[2], #pos_y:ent.origin[1], #pos_x:ent.origin[0]};
        function_92d1707f(#"hash_5820ed7a498888c4", data);
    } else {
        data = {#type:ent.model, #pos_z:ent.origin[2], #pos_y:ent.origin[1], #pos_x:ent.origin[0]};
        function_92d1707f(#"hash_5820ed7a498888c4", data);
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x5 linked
// Checksum 0x5d154c17, Offset: 0x8000
// Size: 0x324
function private function_3c8be2d2(trigger_struct) {
    level endon(#"game_ended");
    self endon(#"disconnect", #"death");
    usetrigger = self;
    activator = trigger_struct.activator;
    if (isplayer(activator)) {
        /#
            iprintlnbold("<unknown string>" + activator.origin[0] + "<unknown string>" + activator.origin[1] + "<unknown string>" + activator.origin[2] + "<unknown string>");
        #/
        function_293cd859(activator);
        if (activator isinvehicle()) {
            vehicle = activator getvehicleoccupied();
            occupants = vehicle getvehoccupants();
            foreach (occupant in occupants) {
                occupant unlink();
            }
            vehicle delete();
            foreach (occupant in occupants) {
                function_1e150a0b(occupant);
            }
            return;
        }
        function_1e150a0b(activator);
    } else if (isentity(activator)) {
        /#
            iprintlnbold("<unknown string>" + activator.origin[0] + "<unknown string>" + activator.origin[1] + "<unknown string>" + activator.origin[2] + "<unknown string>");
        #/
        function_293cd859(activator);
        activator delete();
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x5 linked
// Checksum 0x7a175009, Offset: 0x8330
// Size: 0x70
function private function_3c597e8d() {
    var_6024133d = getentarray("map_corner", "targetname");
    if (var_6024133d.size) {
        return math::find_box_center(var_6024133d[0].origin, var_6024133d[1].origin);
    }
    return (0, 0, 0);
}

// Namespace warzone/warzone
// Params 1, eflags: 0x5 linked
// Checksum 0x44057760, Offset: 0x83a8
// Size: 0x122
function private function_2a3d483d(start) {
    mapcenter = function_3c597e8d();
    jumpdistance = 600;
    var_d7afe542 = mapcenter - start;
    var_d80c8cde = length(var_d7afe542);
    var_fa57b4b3 = vectornormalize(var_d7afe542);
    steps = int(var_d80c8cde / jumpdistance);
    for (index = 1; index <= steps; index++) {
        newpoint = start + var_fa57b4b3 * index * jumpdistance;
        if (!oob::chr_party(newpoint)) {
            return newpoint;
        }
    }
    return mapcenter;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x5 linked
// Checksum 0x1b400ddf, Offset: 0x84d8
// Size: 0x128
function private function_c1471c7c(point) {
    startpoint = (point[0], point[1], 10000);
    endpoint = (point[0], point[1], -10000);
    groundtrace = groundtrace(startpoint, endpoint, 0, undefined, 0, 0);
    physicstrace = physicstraceex(startpoint, endpoint, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), undefined, 32);
    if (groundtrace[#"position"][2] > physicstrace[#"position"][2]) {
        return groundtrace[#"position"];
    }
    return physicstrace[#"position"];
}

// Namespace warzone/warzone
// Params 3, eflags: 0x5 linked
// Checksum 0xfeb2779c, Offset: 0x8608
// Size: 0x112
function private _teleport_player(origin, angles, var_9914886a = 0) {
    self endon(#"disconnect", #"insertion_starting");
    self.oobdisabled = 1;
    fadetime = 0.5;
    self thread hud::fade_to_black_for_x_sec(0, 1, fadetime, fadetime);
    wait(fadetime);
    self.var_63b63c2 = 1;
    self unlink();
    self setorigin(origin);
    self setplayerangles((0, angles[1], 0));
    self.oobdisabled = 0;
    self.var_63b63c2 = 0;
}

// Namespace warzone/warzone
// Params 1, eflags: 0x5 linked
// Checksum 0x4c5e96ab, Offset: 0x8728
// Size: 0x2be
function private function_b777ff94(entity) {
    /#
        iprintlnbold("<unknown string>" + entity.origin[0] + "<unknown string>" + entity.origin[1] + "<unknown string>" + entity.origin[2] + "<unknown string>");
    #/
    if (!isdefined(entity)) {
        return;
    }
    players = [];
    var_9914886a = 0;
    if (isplayer(entity) && entity isinvehicle()) {
        vehicle = entity getvehicleoccupied();
        players = vehicle getvehoccupants();
        if (isdefined(vehicle.scriptvehicletype) && vehicle.scriptvehicletype == #"tactical_raft_wz") {
            var_9914886a = 1;
        }
    } else {
        players[players.size] = entity;
    }
    playeroffset = vectorscale((0, 1, 0), 120);
    mapcenter = function_3c597e8d();
    for (index = 0; index < players.size; index++) {
        player = players[index];
        startpoint = player.origin + playeroffset * index;
        validpoint = function_2a3d483d(startpoint);
        validpoint = function_c1471c7c(validpoint);
        toangles = vectortoangles(mapcenter - player.origin);
        if (!isplayer(player)) {
            player dodamage(player.health, player.origin);
        } else {
            player thread _teleport_player(validpoint, toangles, var_9914886a);
        }
    }
}

// Namespace warzone/warzone
// Params 2, eflags: 0x5 linked
// Checksum 0xe67d92bd, Offset: 0x89f0
// Size: 0x284
function private function_6ee52dd0(damage, damageinterval) {
    level flagsys::wait_till(#"insertion_teleport_completed");
    var_366959 = 0;
    var_1b5e849 = int(damageinterval * 1000);
    while (!(isdefined(level.gameended) && level.gameended)) {
        time = gettime();
        foreach (i, player in getplayers()) {
            if (!isalive(player)) {
                continue;
            }
            if (!isdefined(player.var_21b83511)) {
                if (player ishidden() || player isinfreefall() || player function_9a0edd92()) {
                    continue;
                }
                player.var_21b83511 = time + var_1b5e849;
            } else if (player.heal.enabled) {
                delta = player.var_21b83511 - time;
                player.var_21b83511 = time + delta;
            } else if (i % 10 == var_366959 && player.var_21b83511 < time) {
                player dodamage(damage, player.origin, undefined, undefined, undefined, "MOD_BLED_OUT");
                player.var_21b83511 = time + var_1b5e849;
            }
        }
        var_366959 = (var_366959 + 1) % 10;
        waitframe(1);
    }
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xcd74593c, Offset: 0x8c80
// Size: 0x11c
function function_77319881() {
    if (!(isdefined(level.deathcirclerespawn) && level.deathcirclerespawn)) {
        return;
    }
    level flagsys::set(#"spawning_allowed");
    /#
        function_cc5d43a1("<unknown string>");
    #/
    level player_reinsertion::function_fec68e5c();
    /#
        function_cc5d43a1("<unknown string>");
    #/
    level flagsys::clear(#"spawning_allowed");
    waitframe(1);
    if (!function_47851c07()) {
        player_reinsertion::function_8ea9be1c();
        level callback::remove_callback(#"hash_3057417db7f8acdd", &function_77319881);
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x0
// Checksum 0xffb89ea0, Offset: 0x8da8
// Size: 0x3c
function function_cc5d43a1(msg) {
    /#
        println(msg);
        adddebugcommand("<unknown string>");
    #/
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0xf340412d, Offset: 0x8df0
// Size: 0x17a
function function_ec375172(player) {
    if (!isdefined(player)) {
        return;
    }
    player endon(#"disconnect");
    characterassetname = getcharacterassetname(player getcharacterbodytype(), currentsessionmode());
    if (characterassetname !== #"hash_4b5db84146fbdfd5" && !getdvarint(#"hash_65cc1eba6dcaba72", 0)) {
        return;
    }
    var_410bcc74 = isdefined(getgametypesetting(#"wzplayerinsertiontypeindex")) ? getgametypesetting(#"wzplayerinsertiontypeindex") : 0;
    switch (var_410bcc74) {
    case 0:
        wait(0.1);
        playfxontag(#"hash_57f2dadebce0586c", player, "j_spine4");
        break;
    case 1:
        wait(0.1);
        break;
    }
}

// Namespace warzone/warzone
// Params 1, eflags: 0x1 linked
// Checksum 0x3ae34062, Offset: 0x8f78
// Size: 0xaa
function function_10dc43bc(params) {
    if (infection::function_74650d7()) {
        if (params.var_8245068d == 0) {
            return 0;
        }
        if (params.platoons_alive.size == 1 && params.platoons_alive[0] == infection::function_76601b7d()) {
            return 1;
        }
        if (params.var_dfa2cc2c.size == 1) {
            return 1;
        }
        return 0;
    }
    return globallogic::function_10dc43bc(params);
}

// Namespace warzone/warzone
// Params 0, eflags: 0x1 linked
// Checksum 0xf0e7b33b, Offset: 0x9030
// Size: 0x46
function function_b3f02397() {
    n_variant = "0" + randomintrange(1, 2);
    game.musicset = "_za_" + n_variant;
}

// Namespace warzone/warzone
// Params 0, eflags: 0x5 linked
// Checksum 0x50ed4033, Offset: 0x9080
// Size: 0x1ac
function private function_414115a0() {
    if (util::get_game_type() == "warzone_heavy_metal_heroes") {
        laststand_warzone::function_414115a0(900, 150);
        laststand_warzone::function_414115a0(200, 150);
        laststand_warzone::function_414115a0(90, 150);
        laststand_warzone::function_414115a0(40, 150);
        laststand_warzone::function_414115a0(10, 150);
        laststand_warzone::function_414115a0(3, 150);
        laststand_warzone::function_414115a0(1, 150);
        laststand_warzone::function_414115a0(0, 150);
    } else {
        laststand_warzone::function_414115a0(90, 150);
        laststand_warzone::function_414115a0(25, 150);
        laststand_warzone::function_414115a0(15, 150);
        laststand_warzone::function_414115a0(10, 150);
        laststand_warzone::function_414115a0(5, 150);
        laststand_warzone::function_414115a0(3, 150);
        laststand_warzone::function_414115a0(1, 150);
        laststand_warzone::function_414115a0(0, 150);
    }
}
