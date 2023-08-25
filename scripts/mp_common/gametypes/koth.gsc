// Atian COD Tools GSC decompiler test
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/spawnbeacon.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/spawning.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/outcome.gsc;
#include scripts/mp_common/gametypes/hostmigration.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include script_4c8dba49908aecc2;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/mp_common/challenges.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/sound_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/potm_shared.gsc;
#include scripts/core_common/popups_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/persistence_shared.gsc;
#include scripts/core_common/medals_shared.gsc;
#include scripts/core_common/influencers_shared.gsc;
#include scripts/core_common/hud_util_shared.gsc;
#include scripts/core_common/hostmigration_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/demo_shared.gsc;
#include scripts/core_common/contracts_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;

#namespace koth;

// Namespace koth/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1a485f58, Offset: 0x518
// Size: 0x436
function event<gametype_init> main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 1000);
    util::registernumlives(0, 100);
    util::registerroundswitch(0, 9);
    util::registerroundwinlimit(0, 10);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.doprematch = 1;
    level.overrideteamscore = 1;
    level.var_16be36fd = 0;
    level.onstartgametype = &onstartgametype;
    level.var_76d547e4 = &function_f59d4d0f;
    player::function_cf3aa03d(&onplayerkilled);
    player::function_3c5cc656(&function_610d3790);
    level.var_c605eb2a = &function_38874bf6;
    clientfield::register("world", "hardpoint", 1, 5, "int");
    clientfield::register("world", "hardpointteam", 1, 5, "int");
    level.var_33472be6 = getgametypesetting(#"autoDestroyTime");
    level.var_a346e384 = getgametypesetting(#"objectiveSpawnTime");
    level.var_b2e3f6c2 = getgametypesetting(#"hash_390e4cbe0520da44");
    level.capturetime = getgametypesetting(#"capturetime");
    level.destroyTime = getgametypesetting(#"destroyTime");
    level.var_1a64cbde = getgametypesetting(#"hash_16efbe2186f760ad");
    level.var_4b326b68 = getgametypesetting(#"randomObjectiveLocations");
    level.scorePerPlayer = getgametypesetting(#"scorePerPlayer");
    level.timePausesWhenInZone = getgametypesetting(#"timePausesWhenInZone");
    level.b_allow_vehicle_proximity_pickup = 1;
    level.var_c85170d1 = 1;
    globallogic_spawn::addsupportedspawnpointtype("koth");
    globallogic_audio::set_leader_gametype_dialog("startHardPoint", "hcStartHardPoint", "objCapture", "objCapture", "bbStartHardPoint", "hcbbStartHardPoint");
    game.var_f89ce1fc = "mpl_flagcapture_sting_friend";
    game.var_90aa6ae6 = "mpl_flagcapture_sting_enemy";
    game.var_25cd68fa = "mpl_flagreturn_sting";
    level.var_d0529f49 = [];
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
    level.var_d3a438fb = &function_d3a438fb;
}

// Namespace koth/koth
// Params 0, eflags: 0x4
// Checksum 0x95988673, Offset: 0x958
// Size: 0x132
function private function_14e751e9() {
    level endon(#"game_ended");
    while (1) {
        waitframe(1);
        foreach (player in level.players) {
            if (isdefined(player.var_592f3e3c)) {
                if (isdefined(level.zone.gameobject.var_db2b5893) && level.zone.gameobject.var_db2b5893 || !isdefined(player.touchtriggers) || !isdefined(player.touchtriggers[level.zone.gameobject.entnum])) {
                    player.var_592f3e3c = undefined;
                }
            }
        }
    }
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0xd7e441a8, Offset: 0xa98
// Size: 0xd2
function function_95263ce5(var_21e008ac, var_ea097672, var_d2d7243e) {
    foreach (team, _ in level.teams) {
        if (var_21e008ac == team) {
            game.strings["objective_hint_" + team] = var_ea097672;
        } else {
            game.strings["objective_hint_" + team] = var_d2d7243e;
        }
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x25388a27, Offset: 0xb78
// Size: 0x8e
function function_1440e2f8(message) {
    foreach (team, _ in level.teams) {
        game.strings["objective_hint_" + team] = message;
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x4
// Checksum 0xc9a557ee, Offset: 0xc10
// Size: 0x10c
function private function_785d5e6d() {
    foreach (team, _ in level.teams) {
        spawning::add_spawn_points(team, "mp_tdm_spawn");
        spawning::add_spawn_points(team, "mp_multi_team_spawn");
        spawning::place_spawn_points(spawning::gettdmstartspawnname(team));
        spawning::add_start_spawn_points(team, spawning::gettdmstartspawnname(team));
    }
    spawning::updateallspawnpoints();
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x5854419d, Offset: 0xd28
// Size: 0x144
function onstartgametype() {
    globallogic_score::resetteamscores();
    level.var_afccf6fa = 0;
    level.var_96c0acbc = #"hash_428c6be88cdba7e1";
    level.var_5046f809 = #"hash_20ab0af94351c0d8";
    level.var_962c97ec = #"hash_257d8ae2e7fc8eb8";
    if (getgametypesetting(#"hash_2a7683d2b8e8be59")) {
        level.ontimelimit = &function_a2ef4132;
    }
    if (level.var_a346e384) {
        function_1440e2f8(level.var_96c0acbc);
    } else {
        function_1440e2f8(level.var_5046f809);
    }
    function_785d5e6d();
    if (!function_e095149()) {
        return;
    }
    updategametypedvars();
    thread function_c996aade();
    thread function_14e751e9();
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xca3f2cf3, Offset: 0xe78
// Size: 0x32
function pause_time() {
    if (level.timePausesWhenInZone) {
        globallogic_utils::pausetimer();
        level.timerpaused = 1;
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x4963dceb, Offset: 0xeb8
// Size: 0x5a
function function_8984d8eb() {
    if (level.timePausesWhenInZone) {
        globallogic_utils::resumetimerdiscardoverride(int(level.var_afccf6fa * 1000));
        level.timerpaused = 0;
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x25568ff4, Offset: 0xf20
// Size: 0x56
function updategametypedvars() {
    level.var_26ee7cf = getgametypesetting(#"hash_3de4aa2f016161ec");
    level.timePausesWhenInZone = getgametypesetting(#"timePausesWhenInZone");
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x4b995b5c, Offset: 0xf80
// Size: 0x18c
function function_512a9a39(delay) {
    if (level.var_4b326b68 == 1) {
        level.zone = function_e8a91696();
    } else {
        level.zone = function_6494da00();
    }
    if (!isdefined(level.zone)) {
        globallogic_utils::add_map_error("No zones available");
        return;
    }
    /#
        print("<unknown string>" + level.zone.var_3390c6f0[0] + "<unknown string>" + level.zone.var_3390c6f0[1] + "<unknown string>" + level.zone.var_3390c6f0[2] + "<unknown string>");
    #/
    level.zone enable_influencers(1);
    level.zone.gameobject.trigger allowtacticalinsertion(0);
    spawn_beacon::function_18f38647(level.zone.trig);
    matchrecordroundstart();
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xfb53cfb0, Offset: 0x1118
// Size: 0x1b4
function function_cdddf2ad() {
    level.zone.gameobject.trigger allowtacticalinsertion(1);
    if (level.var_4b326b68 != 0) {
        level.zone = function_e8a91696();
    } else {
        level.zone = function_f1cb5c85();
    }
    matchrecordroundend();
    if (isdefined(level.zone)) {
        /#
            print("<unknown string>" + level.zone.var_3390c6f0[0] + "<unknown string>" + level.zone.var_3390c6f0[1] + "<unknown string>" + level.zone.var_3390c6f0[2] + "<unknown string>");
        #/
        level.zone enable_influencers(1);
        spawn_beacon::function_18f38647(level.zone.trig);
        matchrecordroundstart();
    }
    level.zone.gameobject.trigger allowtacticalinsertion(0);
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x916f3918, Offset: 0x12d8
// Size: 0x2c
function function_568f7563() {
    level waittill(#"game_ended");
    matchrecordroundend();
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xab6a705f, Offset: 0x1310
// Size: 0x8e
function function_f129b83() {
    numtouching = 0;
    foreach (team, _ in level.teams) {
        numtouching = numtouching + self.numtouching[team];
    }
    return numtouching;
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x8c050dc5, Offset: 0x13a8
// Size: 0x6c
function togglezoneeffects(enabled) {
    index = 0;
    if (enabled) {
        index = self.script_index;
    }
    level clientfield::set("hardpoint", index);
    level clientfield::set("hardpointteam", 0);
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x737dfb57, Offset: 0x1420
// Size: 0x510
function function_cc1a9002() {
    level endon(#"game_ended", #"hash_5569ebbd3d9725c3");
    level.var_16be36fd = gettime();
    while (1) {
        level.zone.gameobject gameobjects::allow_use(#"any");
        level.zone.gameobject gameobjects::set_use_time(level.capturetime);
        level.zone.gameobject gameobjects::set_use_text(#"hash_467145983994c6c2");
        numtouching = level.zone.gameobject function_f129b83();
        level.zone.gameobject gameobjects::set_visible_team(#"any");
        level.zone.gameobject gameobjects::set_model_visibility(1);
        level.zone.gameobject gameobjects::must_maintain_claim(0);
        level.zone.gameobject gameobjects::can_contest_claim(1);
        level.zone.gameobject.onuse = &function_74efe656;
        level.zone.gameobject.onbeginuse = &onbeginuse;
        level.zone.gameobject.onenduse = &onenduse;
        level.zone.gameobject.var_3c57b17d = &function_3c57b17d;
        level.zone.gameobject.var_df79c725 = &function_df79c725;
        level.zone togglezoneeffects(1);
        msg = undefined;
        msg = level waittill(#"zone_captured", #"hash_43c7c39cc47f6ac3");
        if (msg._notify == "zone_destroyed") {
            continue;
        }
        ownerteam = level.zone.gameobject gameobjects::get_owner_team();
        foreach (_ in level.teams) {
            function_95263ce5(ownerteam, level.var_962c97ec, level.var_5046f809);
        }
        level.zone.gameobject gameobjects::allow_use(#"none");
        level.zone.gameobject.onuse = undefined;
        level.zone.gameobject.var_b37ddee9 = &function_fcf50ef8;
        level.zone.gameobject.var_9e5340b9 = &function_763c73a;
        level.zone.gameobject.var_8a5299ba = &function_20458175;
        waitresult = undefined;
        waitresult = level waittill(#"hash_43c7c39cc47f6ac3");
        if (!level.var_b2e3f6c2 || level.var_5c5d8cbb) {
            break;
        }
        thread function_d5560d60(ownerteam);
        if (isdefined(waitresult.var_5891d00a)) {
            level.zone.gameobject gameobjects::set_owner_team(waitresult.var_5891d00a);
        } else {
            level.zone.gameobject gameobjects::set_owner_team("none");
        }
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x52203c2d, Offset: 0x1938
// Size: 0x610
function function_c996aade() {
    level endon(#"game_ended");
    function_512a9a39();
    while (level.inprematchperiod) {
        waitframe(1);
    }
    pause_time();
    wait(5);
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    thread hidetimerdisplayongameend();
    thread function_568f7563();
    while (1) {
        function_8984d8eb();
        sound::play_on_players("mp_suitcase_pickup");
        globallogic_audio::leader_dialog("kothLocated", undefined, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
        level.zone.gameobject gameobjects::set_model_visibility(1);
        if (level.var_a346e384) {
            level.zone.gameobject gameobjects::set_visible_team(#"any");
            level.zone.gameobject gameobjects::set_flags(1);
            function_1440e2f8(level.var_96c0acbc);
            setmatchflag("bomb_timer_a", 1);
            setbombtimer("A", int(gettime() + 1000 + int(level.var_a346e384 * 1000)));
            wait(level.var_a346e384);
            level.zone.gameobject gameobjects::set_flags(0);
            globallogic_audio::leader_dialog("kothOnline", undefined, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
        }
        setmatchflag("bomb_timer_a", 0);
        waittillframeend();
        function_1440e2f8(level.var_5046f809);
        sound::play_on_players("mpl_hq_cap_us");
        level.zone.gameobject gameobjects::enable_object();
        objective_onentity(level.zone.gameobject.objectiveid, level.zone.var_24fbbe05);
        level.zone.gameobject.var_1d42950b = 0;
        if (level.var_33472be6) {
            thread function_6474a7ba(level.var_33472be6);
            setmatchflag("bomb_timer_a", 1);
            setbombtimer("A", int(gettime() + 1000 + int(level.var_33472be6 * 1000)));
        } else {
            level.var_5c5d8cbb = 0;
        }
        function_cc1a9002();
        ownerteam = level.zone.gameobject gameobjects::get_owner_team();
        pause_time();
        level.zone enable_influencers(0);
        level.zone.gameobject.var_346e7b46 = undefined;
        level.zone.gameobject gameobjects::disable_object();
        level.zone.gameobject gameobjects::allow_use(#"none");
        level.zone.gameobject gameobjects::set_owner_team(#"neutral");
        level.zone.gameobject gameobjects::set_model_visibility(0);
        level.zone.gameobject gameobjects::must_maintain_claim(0);
        level.zone togglezoneeffects(0);
        spawn_beacon::function_60a53911(level.zone.trig);
        level notify(#"hash_b7f7b74d021a377");
        setmatchflag("bomb_timer_a", 0);
        function_cdddf2ad();
        wait(0.5);
        thread function_d5560d60(ownerteam);
        wait(0.5);
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xc50447d0, Offset: 0x1f50
// Size: 0x34
function hidetimerdisplayongameend() {
    level waittill(#"game_ended");
    setmatchflag("bomb_timer_a", 0);
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x2f705548, Offset: 0x1f90
// Size: 0xaa
function function_d5560d60(team) {
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!isdefined(player)) {
            continue;
        }
        if (player.pers[#"team"] == team) {
            player notify(#"force_spawn");
            wait(0.1);
        }
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x73785c22, Offset: 0x2048
// Size: 0x104
function function_1da5ed1c() {
    ownerteam = self gameobjects::get_owner_team();
    if (isdefined(self.var_db2b5893) && self.var_db2b5893) {
        level clientfield::set("hardpointteam", 3);
    } else if (ownerteam == #"neutral") {
        level clientfield::set("hardpointteam", 0);
    } else if (ownerteam == #"allies") {
        level clientfield::set("hardpointteam", 1);
    } else {
        level clientfield::set("hardpointteam", 2);
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x4
// Checksum 0x804aaa24, Offset: 0x2158
// Size: 0x58
function private function_62dd771f(gameobject) {
    if (gameobject.touchlist[game.attackers].size > 0 && gameobject.touchlist[game.defenders].size > 0) {
        return 1;
    }
    return 0;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xb5cadf6b, Offset: 0x21b8
// Size: 0x1c6
function function_df79c725() {
    if (!isdefined(self.var_db2b5893)) {
        self.var_db2b5893 = 0;
        self.var_464f0169 = 0;
    }
    self.var_db2b5893 = function_62dd771f(self);
    if (self.var_db2b5893) {
        if (!self.var_464f0169) {
            foreach (playerlist in self.touchlist) {
                if (!isdefined(playerlist)) {
                    continue;
                }
                foreach (struct in playerlist) {
                    if (!isdefined(struct)) {
                        continue;
                    }
                    player = struct.player;
                    if (isdefined(player) && isplayer(player) && (isdefined(player.var_c8d27c06) ? player.var_c8d27c06 : 0) < gettime()) {
                        player playsoundtoplayer(#"hash_5daa27b37c13bc01", player);
                        player.var_c8d27c06 = gettime() + 5000;
                    }
                }
            }
        }
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x5345d344, Offset: 0x2388
// Size: 0xae
function function_3c57b17d(sentient) {
    if (isplayer(sentient)) {
        self.var_464f0169 = self.var_db2b5893;
        if (function_62dd771f(self) && (isdefined(sentient.var_c8d27c06) ? sentient.var_c8d27c06 : 0) < gettime()) {
            sentient playsoundtoplayer(#"hash_5daa27b37c13bc01", sentient);
            sentient.var_c8d27c06 = gettime() + 5000;
        }
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x682da8e5, Offset: 0x2440
// Size: 0xfc
function onbeginuse(sentient) {
    player = sentient;
    if (!isplayer(player)) {
        player = sentient.owner;
    }
    ownerteam = self gameobjects::get_owner_team();
    if (ownerteam == #"neutral") {
        player thread battlechatter::gametype_specific_battle_chatter("hq_protect", player.pers[#"team"]);
    } else {
        player thread battlechatter::gametype_specific_battle_chatter("hq_attack", player.pers[#"team"]);
    }
}

// Namespace koth/koth
// Params 3, eflags: 0x0
// Checksum 0xad0c2044, Offset: 0x2548
// Size: 0x70
function onenduse(team, sentient, success) {
    if (!isdefined(sentient)) {
        return;
    }
    player = sentient;
    if (!isplayer(player)) {
        player = sentient.owner;
    }
    player notify(#"hash_69dfa712e01f884c");
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0xe1f29281, Offset: 0x25c0
// Size: 0x460
function function_74efe656(sentient) {
    player = sentient;
    if (!isplayer(player)) {
        player = sentient.owner;
    }
    var_4456a2ef = player.team;
    capturetime = gettime();
    /#
        print("<unknown string>");
    #/
    pause_time();
    string = #"hash_446b7b0b3e4df72e";
    level.zone.gameobject.var_db2b5893 = 0;
    level.usestartspawns = 0;
    if (!isdefined(self.var_346e7b46) || self.var_346e7b46 != var_4456a2ef) {
        touchlist = arraycopy(self.touchlist[var_4456a2ef]);
        thread function_48b7eb27(touchlist, string, capturetime, var_4456a2ef, self.var_346e7b46);
    }
    level.var_c915a489 = var_4456a2ef;
    self gameobjects::set_owner_team(var_4456a2ef);
    if (!level.var_b2e3f6c2) {
        self gameobjects::set_use_time(level.destroyTime);
    }
    foreach (team, _ in level.teams) {
        if (team == var_4456a2ef) {
            if (!isdefined(self.var_346e7b46) || self.var_346e7b46 != team) {
                globallogic_audio::leader_dialog("kothSecured", team, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
                for (index = 0; index < level.players.size; index++) {
                    player = level.players[index];
                    if (player.pers[#"team"] == team) {
                        if (player.lastkilltime + 500 > gettime()) {
                            player challenges::killedlastcontester();
                        }
                    }
                }
            }
            thread sound::play_on_players(game.var_f89ce1fc, team);
        } else {
            if (!isdefined(self.var_346e7b46)) {
                globallogic_audio::leader_dialog("kothCaptured", team, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
            } else if (self.var_346e7b46 == team) {
                globallogic_audio::leader_dialog("kothLost", team, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
            }
            thread sound::play_on_players(game.var_90aa6ae6, team);
        }
    }
    self thread function_d000bb60(var_4456a2ef, self.var_346e7b46);
    self.var_1d42950b++;
    self.var_346e7b46 = var_4456a2ef;
    self gameobjects::must_maintain_claim(1);
    self function_1da5ed1c();
    level notify(#"zone_captured");
    level notify("zone_captured" + var_4456a2ef);
    player notify(#"hash_69dfa712e01f884c");
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x2a28
// Size: 0x4
function function_65e97fbd() {
    
}

// Namespace koth/koth
// Params 5, eflags: 0x0
// Checksum 0x95ac49cd, Offset: 0x2a38
// Size: 0x3e8
function function_48b7eb27(touchlist, string, capturetime, var_4456a2ef, var_346e7b46) {
    waitframe(1);
    util::waittillslowprocessallowed();
    foreach (touch in touchlist) {
        player = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(player)) {
            continue;
        }
        player function_91d77b44(var_346e7b46);
        if (!function_dacbb6ac(player)) {
            player challenges::capturedobjective(capturetime, self.trigger);
            if (level.var_16be36fd + 3000 > capturetime && level.var_c915a489 == var_4456a2ef) {
                scoreevents::processscoreevent(#"hash_1335ab8faf81b248", player, undefined, undefined);
                player stats::function_dad108fa(#"hash_60545a50ce7c9791", 1);
            }
            scoreevents::processscoreevent(#"hash_dbe2d6f83282b1d", player, undefined, undefined);
            player recordgameevent("capture");
            player recordgameevent("hardpoint_captured");
            level thread popups::displayteammessagetoall(string, player);
            if (isdefined(player.pers[#"captures"])) {
                player.pers[#"captures"]++;
                player.captures = player.pers[#"captures"];
            }
            player.pers[#"objectives"]++;
            player.objectives = player.pers[#"objectives"];
            if (level.var_16be36fd + 500 > capturetime) {
                player challenges::immediatecapture();
            }
            demo::bookmark(#"event", gettime(), player);
            potm::bookmark(#"event", gettime(), player);
            player stats::function_bb7eedf0(#"captures", 1);
            player stats::function_bb7eedf0(#"hash_2f1df496791a2f5f", 1);
            player contracts::increment_contract(#"hash_4fa0008b60deaab4");
        } else {
            /#
                player iprintlnbold("<unknown string>");
            #/
        }
    }
}

// Namespace koth/koth
// Params 2, eflags: 0x0
// Checksum 0x364a0fde, Offset: 0x2e28
// Size: 0xe0
function function_8c5f5bed(touchlist, team) {
    waitframe(1);
    util::waittillslowprocessallowed();
    foreach (touch in touchlist) {
        player = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(player)) {
            continue;
        }
        scoreevents::processscoreevent(#"hash_196614fa51986a53", player, undefined, undefined);
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xace39953, Offset: 0x2f10
// Size: 0xbe
function function_fcf50ef8() {
    level notify(#"hash_43c7c39cc47f6ac3");
    level.var_c915a489 = #"neutral";
    level.zone.gameobject.var_7057d73 = 1;
    level.zone.gameobject.var_db2b5893 = 0;
    level.zone.gameobject recordgameeventnonplayer("hardpoint_empty");
    function_8984d8eb();
    self function_1da5ed1c();
    self.mustmaintainclaim = 0;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x6616ac0d, Offset: 0x2fd8
// Size: 0x160
function function_763c73a() {
    var_cdf9433c = self gameobjects::get_owner_team();
    self.var_fdeac09e = 1;
    self.var_db2b5893 = 1;
    self function_1da5ed1c();
    self recordgameeventnonplayer("hardpoint_contested");
    function_8984d8eb();
    util::function_5a68c330(8, #"free");
    foreach (team, _ in level.teams) {
        if (team == var_cdf9433c) {
            thread sound::play_on_players(game.var_25cd68fa, team);
            globallogic_audio::leader_dialog("kothContested", team, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
        }
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0xf1dee2fb, Offset: 0x3140
// Size: 0xc8
function function_20458175(lastclaimteam) {
    /#
        assert(lastclaimteam == level.zone.gameobject gameobjects::get_owner_team());
    #/
    self.var_db2b5893 = 0;
    pause_time();
    self gameobjects::set_claim_team(lastclaimteam);
    self function_1da5ed1c();
    self recordgameeventnonplayer("hardpoint_uncontested");
    level notify(#"hash_2b3ed5fc55e60749");
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0xd12232de, Offset: 0x3210
// Size: 0x1e4
function function_6474a7ba(time) {
    level endon(#"game_ended", #"hash_b7f7b74d021a377");
    level.var_6fcfa12b = gettime() + int(time * 1000);
    level.var_5c5d8cbb = 0;
    wait(time);
    if (isdefined(level.overtime) && level.overtime) {
        return;
    }
    if (!isdefined(level.zone.gameobject.var_fdeac09e) || level.zone.gameobject.var_fdeac09e == 0) {
        if (!isdefined(level.zone.gameobject.var_7057d73) || level.zone.gameobject.var_7057d73 == 0) {
            var_cdf9433c = level.zone.gameobject gameobjects::get_owner_team();
            challenges::controlzoneentirely(var_cdf9433c);
        }
    }
    level.var_5c5d8cbb = 1;
    level.zone.gameobject recordgameeventnonplayer("hardpoint_moved");
    level notify(#"hash_5569ebbd3d9725c3");
    level.zone.gameobject.onuse = undefined;
    util::function_5a68c330(6, #"free");
}

// Namespace koth/koth
// Params 2, eflags: 0x0
// Checksum 0x3988a2e2, Offset: 0x3400
// Size: 0x3a8
function function_d000bb60(team, var_346e7b46) {
    level endon(#"game_ended", #"hash_43c7c39cc47f6ac3", #"hash_b7f7b74d021a377", #"hash_5569ebbd3d9725c3");
    level notify(#"hash_48acd4ddfac8ca2a");
    level endon(#"hash_48acd4ddfac8ca2a");
    foreach (player in level.players) {
        player.var_592f3e3c = undefined;
    }
    seconds = 1;
    score = 1;
    while (!level.gameended) {
        wait(seconds);
        hostmigration::waittillhostmigrationdone();
        if (!level.zone.gameobject.var_db2b5893) {
            if (level.scorePerPlayer) {
                score = level.zone.gameobject.numtouching[team];
            }
            globallogic_score::giveteamscoreforobjective(team, score);
            level.var_afccf6fa++;
            foreach (player in level.aliveplayers[team]) {
                if (!isdefined(player.touchtriggers[self.entnum])) {
                    continue;
                }
                if (isdefined(player.pers[#"objtime"])) {
                    player.pers[#"objtime"]++;
                    player.objtime = player.pers[#"objtime"];
                }
                player stats::function_bb7eedf0(#"objective_time", 1);
                player globallogic_score::incpersstat(#"objectivetime", 1, 0, 1);
                if (!isdefined(player.var_592f3e3c)) {
                    player.var_592f3e3c = gettime();
                } else if (player.var_592f3e3c <= gettime() - 5000) {
                    player scoreevents::processscoreevent(#"hash_58b63cf172d29d0", player);
                    player.var_592f3e3c = gettime();
                }
            }
            if (isdefined(level.overtime) && level.overtime && isdefined(outcome::function_6d0354e3())) {
                round::function_870759fb();
                thread globallogic::end_round(2);
            }
        }
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x37b0
// Size: 0x4
function function_f59d4d0f() {
    
}

// Namespace koth/koth
// Params 2, eflags: 0x0
// Checksum 0xd2da3afb, Offset: 0x37c0
// Size: 0xfc
function function_91078bb5(zone_a, zone_b) {
    var_4aeef54 = zone_a.script_index;
    var_2e6a42ca = zone_b.script_index;
    if (!isdefined(var_4aeef54) && !isdefined(var_2e6a42ca)) {
        return 0;
    }
    if (!isdefined(var_4aeef54) && isdefined(var_2e6a42ca)) {
        /#
            println("<unknown string>" + zone_a.origin);
        #/
        return 1;
    }
    if (isdefined(var_4aeef54) && !isdefined(var_2e6a42ca)) {
        /#
            println("<unknown string>" + zone_b.origin);
        #/
        return 0;
    }
    if (var_4aeef54 > var_2e6a42ca) {
        return 1;
    }
    return 0;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xa2330d81, Offset: 0x38c8
// Size: 0x11e
function function_6030c4b2() {
    zones = getentarray("koth_zone_center", "targetname");
    if (!isdefined(zones)) {
        return undefined;
    }
    var_58429fdf = 1;
    for (n = zones.size; var_58429fdf; n--) {
        var_58429fdf = 0;
        for (i = 0; i < n - 1; i++) {
            if (function_91078bb5(zones[i], zones[i + 1])) {
                temp = zones[i];
                zones[i] = zones[i + 1];
                zones[i + 1] = temp;
                var_58429fdf = 1;
            }
        }
    }
    return zones;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xecf214, Offset: 0x39f0
// Size: 0x430
function function_e095149() {
    zones = function_6030c4b2();
    if (zones.size == 0) {
        globallogic_utils::add_map_error("No zones found for KOTH in map " + util::get_map_name());
    }
    trigs = getentarray("koth_zone_trigger", "targetname");
    for (i = 0; i < zones.size; i++) {
        var_b2150652 = 0;
        zone = zones[i];
        zone.trig = undefined;
        for (j = 0; j < trigs.size; j++) {
            if (zone istouching(trigs[j])) {
                if (isdefined(zone.trig)) {
                    globallogic_utils::add_map_error("Zone at " + zone.origin + " is touching more than one "zonetrigger" trigger");
                    var_b2150652 = 1;
                    break;
                }
                zone.trig = trigs[j];
                zone.trig trigger::function_1792c799(16);
                break;
            }
        }
        if (!isdefined(zone.trig)) {
            jumpiftrue(var_b2150652) LOC_00000206;
            globallogic_utils::add_map_error("Zone at " + zone.origin + " is not inside any "zonetrigger" trigger");
        } else {
        LOC_00000206:
            /#
                assert(!var_b2150652);
            #/
            zone.var_3390c6f0 = zone.trig.origin;
            zone.var_24fbbe05 = spawn("script_model", zone.origin);
            visuals = [];
            visuals[0] = zone;
            if (isdefined(zone.target)) {
                var_1f95679e = getentarray(zone.target, "targetname");
                for (j = 0; j < var_1f95679e.size; j++) {
                    visuals[visuals.size] = var_1f95679e[j];
                }
            }
            objective_name = #"hardpoint";
            zone.gameobject = gameobjects::create_use_object(#"neutral", zone.trig, visuals, (0, 0, 0), objective_name);
            zone.gameobject gameobjects::set_objective_entity(zone);
            zone.gameobject gameobjects::disable_object();
            zone.gameobject gameobjects::set_model_visibility(0);
            zone.trig.useobj = zone.gameobject;
            zone function_7349b017();
        }
    }
    if (globallogic_utils::print_map_errors()) {
        return 0;
    }
    level.zones = zones;
    level.var_45787ca7 = undefined;
    level.var_578985d0 = undefined;
    function_9017da04();
    return 1;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x2365fdb9, Offset: 0x3e28
// Size: 0x1b2
function function_9017da04() {
    if (!isdefined(level.var_d5338387)) {
        return;
    }
    foreach (var_f8de67c4 in level.var_d5338387) {
        mindist = 1410065408;
        var_41891211 = undefined;
        foreach (zone in level.zones) {
            distance = distancesquared(var_f8de67c4.origin, zone.origin);
            if (distance < mindist) {
                var_41891211 = zone;
                mindist = distance;
            }
        }
        if (isdefined(var_41891211)) {
            if (!isdefined(var_41891211.gameobject.exclusions)) {
                var_41891211.gameobject.exclusions = [];
            }
            var_41891211.gameobject.exclusions[var_41891211.gameobject.exclusions.size] = var_f8de67c4;
        }
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x5f4bab6f, Offset: 0x3fe8
// Size: 0x88
function function_6494da00() {
    zone = level.zones[0];
    level.var_578985d0 = level.var_45787ca7;
    level.var_45787ca7 = zone;
    level.var_2da2fa7b = 0;
    function_129c1feb();
    arrayremovevalue(level.var_d0529f49, zone);
    return zone;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xd6ab3a7a, Offset: 0x4078
// Size: 0x82
function function_f1cb5c85() {
    var_877b65ed = (level.var_2da2fa7b + 1) % level.zones.size;
    zone = level.zones[var_877b65ed];
    level.var_578985d0 = level.var_45787ca7;
    level.var_45787ca7 = zone;
    level.var_2da2fa7b = var_877b65ed;
    return zone;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x6a29f626, Offset: 0x4108
// Size: 0x76
function function_46dbe00f() {
    level.var_2da2fa7b = randomint(level.zones.size);
    zone = level.zones[level.var_2da2fa7b];
    level.var_578985d0 = level.var_45787ca7;
    level.var_45787ca7 = zone;
    return zone;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xaf6cad9d, Offset: 0x4188
// Size: 0x14a
function function_129c1feb() {
    level.var_d0529f49 = [];
    var_f99838b6 = arraycopy(level.zones);
    for (var_8e7707bc = var_f99838b6.size; var_8e7707bc > 0; var_8e7707bc--) {
        index = randomint(var_8e7707bc);
        var_ea245516 = 0;
        for (zone = 0; zone < level.zones.size; zone++) {
            if (!isdefined(var_f99838b6[zone])) {
                continue;
            }
            if (var_ea245516 == index) {
                if (level.var_d0529f49.size == 0 && isdefined(level.zone) && level.zone == var_f99838b6[zone]) {
                    continue;
                }
                level.var_d0529f49[level.var_d0529f49.size] = var_f99838b6[zone];
                zone = [];
                continue;
            }
            var_ea245516++;
        }
    }
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x56102e76, Offset: 0x42e0
// Size: 0x90
function function_e8a91696() {
    if (level.var_d0529f49.size == 0) {
        function_129c1feb();
    }
    /#
        assert(level.var_d0529f49.size > 0);
    #/
    var_fb380252 = level.var_d0529f49[0];
    arrayremoveindex(level.var_d0529f49, 0);
    return var_fb380252;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x1cd4b707, Offset: 0x4378
// Size: 0x28
function function_38874bf6() {
    if (isdefined(level.zone)) {
        return level.zone.origin;
    }
}

// Namespace koth/koth
// Params 4, eflags: 0x0
// Checksum 0x7b5cb8d3, Offset: 0x43a8
// Size: 0xbfc
function function_610d3790(einflictor, victim, idamage, weapon) {
    attacker = self;
    if (!isplayer(attacker) || level.capturetime && !victim.touchtriggers.size && !attacker.touchtriggers.size || attacker.pers[#"team"] == victim.pers[#"team"]) {
        return;
    }
    if (isdefined(weapon) && isdefined(level.iskillstreakweapon)) {
        if ([[ level.iskillstreakweapon ]](weapon) || isdefined(weapon.statname) && [[ level.iskillstreakweapon ]](getweapon(weapon.statname))) {
            weaponiskillstreak = 1;
        }
    }
    var_a8cbc1c4 = 0;
    var_e4b6c276 = 0;
    var_1cfdf798 = isdefined(victim.lastattacker) ? victim.lastattacker === attacker : 0;
    ownerteam = undefined;
    if (level.capturetime == 0) {
        if (!isdefined(level.zone)) {
            return;
        }
        ownerteam = level.zone.gameobject.ownerteam;
        if (!isdefined(ownerteam) || ownerteam == #"neutral") {
            return;
        }
    }
    if (victim.touchtriggers.size || level.capturetime == 0 && victim istouching(level.zone.trig)) {
        if (level.capturetime > 0) {
            var_34bb9c9e = getarraykeys(victim.touchtriggers);
            ownerteam = victim.touchtriggers[var_34bb9c9e[0]].useobj.ownerteam;
        }
        if (ownerteam != #"neutral") {
            attacker.lastkilltime = gettime();
            team = attacker.pers[#"team"];
            if (team == ownerteam) {
                if (!var_a8cbc1c4) {
                    attacker medals::offenseglobalcount();
                    attacker thread challenges::killedbaseoffender(level.zone.trig, weapon, einflictor);
                    attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.zone.gameobject);
                    attacker.pers[#"objectiveekia"]++;
                    attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                    attacker.pers[#"objectives"]++;
                    attacker.objectives = attacker.pers[#"objectives"];
                    var_a8cbc1c4 = 1;
                }
                if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                    scoreevents::processscoreevent(#"hash_55246ac76af21bc7", attacker, undefined, weapon);
                }
                victim recordkillmodifier("defending");
                var_e4b6c276 = 1;
            } else {
                if (!var_a8cbc1c4) {
                    if (isdefined(attacker.pers[#"defends"])) {
                        attacker.pers[#"defends"]++;
                        attacker.defends = attacker.pers[#"defends"];
                    }
                    attacker medals::defenseglobalcount();
                    var_a8cbc1c4 = 1;
                    attacker thread challenges::killedbasedefender(level.zone.trig);
                    attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.zone.gameobject);
                    attacker.pers[#"objectiveekia"]++;
                    attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                    attacker.pers[#"objectives"]++;
                    attacker.objectives = attacker.pers[#"objectives"];
                    attacker recordgameevent("defending");
                }
                attacker challenges::killedzoneattacker(weapon);
                if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                    scoreevents::processscoreevent(#"hash_55246ac76af21bc7", attacker, undefined, weapon);
                }
                victim recordkillmodifier("assaulting");
                var_e4b6c276 = 1;
            }
        }
    }
    if (isdefined(level.zone)) {
        if (isdefined(attacker) && isdefined(einflictor) && einflictor != attacker) {
            var_7901de48 = distance2dsquared(level.zone.trig.maxs, level.zone.trig.mins) * 0.5 + 350 * 350;
            dist = distance2dsquared(einflictor.origin, level.zone.origin);
            if (dist > var_7901de48) {
                return;
            }
        }
    }
    if (attacker.touchtriggers.size || level.capturetime == 0 && attacker istouching(level.zone.trig)) {
        if (level.capturetime > 0) {
            var_34bb9c9e = getarraykeys(attacker.touchtriggers);
            ownerteam = attacker.touchtriggers[var_34bb9c9e[0]].useobj.ownerteam;
        }
        if (ownerteam != #"neutral") {
            team = victim.pers[#"team"];
            if (team == ownerteam) {
                if (!var_a8cbc1c4) {
                    if (isdefined(attacker.pers[#"defends"])) {
                        attacker.pers[#"defends"]++;
                        attacker.defends = attacker.pers[#"defends"];
                    }
                    attacker medals::defenseglobalcount();
                    var_a8cbc1c4 = 1;
                    attacker thread challenges::killedbasedefender(level.zone.trig);
                    attacker recordgameevent("defending");
                }
                if (var_e4b6c276 == 0) {
                    attacker challenges::killedzoneattacker(weapon);
                    if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                        scoreevents::processscoreevent(#"hash_55246ac76af21bc7", attacker, undefined, weapon);
                    }
                    victim recordkillmodifier("assaulting");
                    attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.zone.gameobject);
                    attacker.pers[#"objectiveekia"]++;
                    attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                    attacker.pers[#"objectives"]++;
                    attacker.objectives = attacker.pers[#"objectives"];
                }
            } else {
                if (!var_a8cbc1c4) {
                    attacker medals::offenseglobalcount();
                    var_a8cbc1c4 = 1;
                    attacker thread challenges::killedbaseoffender(level.zone.trig, weapon, einflictor);
                }
                if (var_e4b6c276 == 0) {
                    if (!(isdefined(weaponiskillstreak) && weaponiskillstreak)) {
                        scoreevents::processscoreevent(#"hash_55246ac76af21bc7", attacker, undefined, weapon);
                    }
                    victim recordkillmodifier("defending");
                    attacker challenges::function_2f462ffd(victim, weapon, einflictor, level.zone.gameobject);
                    attacker.pers[#"objectiveekia"]++;
                    attacker.objectiveekia = attacker.pers[#"objectiveekia"];
                    attacker.pers[#"objectives"]++;
                    attacker.objectives = attacker.pers[#"objectives"];
                }
            }
        }
    }
    if (var_1cfdf798 && var_e4b6c276 === 1) {
        attacker challenges::function_82bb78f7(weapon);
    }
}

// Namespace koth/koth
// Params 9, eflags: 0x0
// Checksum 0xc49915e9, Offset: 0x4fb0
// Size: 0x4c
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x282a0642, Offset: 0x5008
// Size: 0x3c
function enable_influencers(enabled) {
    enableinfluencer(self.var_5b314f1d, enabled);
    enableinfluencer(self.var_565062d8, enabled);
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x202a82cb, Offset: 0x5050
// Size: 0x104
function function_7349b017() {
    self.var_5b314f1d = self influencers::create_influencer("koth_large", self.gameobject.curorigin, 0);
    self.var_565062d8 = influencers::create_influencer("koth_small", self.gameobject.curorigin, 0);
    self enable_influencers(0);
    if ((isdefined(self.var_caa7270c) ? self.var_caa7270c : 0) > 0) {
        function_2e07e8f9(self.var_565062d8, self.var_caa7270c);
    }
    if ((isdefined(self.var_aa2f147a) ? self.var_aa2f147a : 0) > 0) {
        function_2e07e8f9(self.var_5b314f1d, self.var_aa2f147a);
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x58566fb7, Offset: 0x5160
// Size: 0x146
function function_91d77b44(var_277c627b) {
    if (!isdefined(self.var_36cd5e69)) {
        self.var_8bf2fa7 = 0;
        self.var_36cd5e69 = 0;
    }
    if (!isdefined(var_277c627b) || var_277c627b == #"neutral") {
        return;
    }
    self.var_8bf2fa7++;
    minutespassed = float(globallogic_utils::gettimepassed()) / 60000;
    if (isplayer(self) && isdefined(self.timeplayed[#"total"])) {
        minutespassed = self.timeplayed[#"total"] / 60;
    }
    if (minutespassed <= 0) {
        self.var_36cd5e69 = self.var_8bf2fa7;
        return;
    }
    self.var_36cd5e69 = self.var_8bf2fa7 / minutespassed;
    if (self.var_36cd5e69 > self.var_8bf2fa7) {
        self.var_36cd5e69 = self.var_8bf2fa7;
    }
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x66e57934, Offset: 0x52b0
// Size: 0x3e
function function_dacbb6ac(player) {
    if (!level.rankedmatch) {
        return 0;
    }
    if (player.var_36cd5e69 > level.var_26ee7cf) {
        return 1;
    }
    return 0;
}

// Namespace koth/koth
// Params 1, eflags: 0x0
// Checksum 0x8eb843ea, Offset: 0x52f8
// Size: 0x6e
function function_d3a438fb(entity) {
    if (!isdefined(level.zone) || !isdefined(level.zone.trig)) {
        return 0;
    }
    if (entity istouching(level.zone.trig)) {
        return 1;
    }
    return 0;
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0xcfdc722f, Offset: 0x5370
// Size: 0x84
function function_a2ef4132() {
    if (isdefined(level.overtime) && level.overtime) {
        return;
    }
    if (isdefined(outcome::function_6d0354e3())) {
        round::function_870759fb();
        thread globallogic::end_round(2);
        return;
    }
    function_841cf30a();
}

// Namespace koth/koth
// Params 0, eflags: 0x0
// Checksum 0x436f32a, Offset: 0x5400
// Size: 0xd0
function function_841cf30a() {
    level.overtime = 1;
    setmatchflag("bomb_timer_a", 0);
    globallogic_audio::leader_dialog("roundOvertime");
    foreach (player in level.players) {
        player luinotifyevent(#"hash_6b67aa04e378d681", 1, 8);
    }
}

