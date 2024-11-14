#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm;
#using scripts\zm_common\util;
#using scripts\zm_common\gametypes\spectating;
#using scripts\zm_common\gametypes\spawnlogic;
#using scripts\zm_common\gametypes\spawning;
#using scripts\zm_common\gametypes\hostmigration;
#using scripts\zm_common\gametypes\globallogic_utils;
#using scripts\zm_common\gametypes\globallogic_ui;
#using scripts\zm_common\gametypes\globallogic_spawn;
#using scripts\zm_common\gametypes\globallogic_score;
#using scripts\zm_common\gametypes\globallogic_audio;
#using scripts\zm_common\gametypes\globallogic;
#using scripts\core_common\globallogic\globallogic_score;
#using scripts\core_common\globallogic\globallogic_player;
#using scripts\weapons\weapon_utils;
#using scripts\core_common\weapons_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\tweakables_shared;
#using scripts\core_common\player\player_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\hud_message_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\demo_shared;
#using scripts\core_common\challenges_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\bb_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace globallogic_player;

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0xd41a50ff, Offset: 0x2e8
// Size: 0x84
function freezeplayerforroundend() {
    self hud_message::clearlowermessage();
    self closeingamemenu();
    self val::set(#"round_end", "freezecontrols");
    self val::set(#"round_end", "disablegadgets");
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0xabcb0276, Offset: 0x378
// Size: 0x10c4
function callback_playerconnect() {
    zm_characters::set_character();
    self thread zm::initialblack();
    thread notifyconnecting();
    self.statusicon = "$default";
    self waittill(#"begin");
    if (isdefined(level.reset_clientdvars)) {
        self [[ level.reset_clientdvars ]]();
    }
    waittillframeend();
    self.statusicon = "";
    self.guid = self getguid();
    profilelog_begintiming(4, "ship");
    level notify(#"connected", {#player:self});
    demo::reset_actor_bookmark_kill_times();
    callback::callback(#"on_player_connect");
    if (self ishost()) {
        self thread globallogic::listenforgameend();
    }
    if (!level.splitscreen && !isdefined(self.pers[#"score"])) {
        iprintln(#"mp/connected", self);
    }
    if (!isdefined(self.pers[#"score"])) {
        self thread zm_stats::adjustrecentstats();
    }
    if (gamemodeismode(0) && !isdefined(self.pers[#"matchesplayedstatstracked"])) {
        gamemode = util::getcurrentgamemode();
        self globallogic::incrementmatchcompletionstat(gamemode, "played", "started");
        if (!isdefined(self.pers[#"matcheshostedstatstracked"]) && self islocaltohost()) {
            self globallogic::incrementmatchcompletionstat(gamemode, "hosted", "started");
            self.pers[#"matcheshostedstatstracked"] = 1;
        }
        self.pers[#"matchesplayedstatstracked"] = 1;
        self thread zm_stats::uploadstatssoon();
    }
    lpselfnum = self getentitynumber();
    lpguid = self getguid();
    lpxuid = self getxuid(1);
    bb::function_afcc007d(self.name, lpselfnum, lpxuid);
    if (level.forceradar == 1) {
        self.pers[#"hasradar"] = 1;
        self.hasspyplane = 1;
        level.activeuavs[self getentitynumber()] = 1;
    }
    if (level.forceradar == 2) {
        self setclientuivisibilityflag("g_compassShowEnemies", level.forceradar);
    } else {
        self setclientuivisibilityflag("g_compassShowEnemies", 0);
    }
    self setclientplayersprinttime(level.playersprinttime);
    self setclientnumlives(level.numlives);
    self [[ level.player_stats_init ]]();
    self.killedplayerscurrent = [];
    if (!isdefined(self.pers[#"best_kill_streak"])) {
        self.pers[#"killed_players"] = [];
        self.pers[#"killed_by"] = [];
        self.pers[#"nemesis_tracking"] = [];
        self.pers[#"artillery_kills"] = 0;
        self.pers[#"dog_kills"] = 0;
        self.pers[#"nemesis_name"] = "";
        self.pers[#"nemesis_rank"] = 0;
        self.pers[#"nemesis_rankicon"] = 0;
        self.pers[#"nemesis_xp"] = 0;
        self.pers[#"nemesis_xuid"] = "";
        self.pers[#"best_kill_streak"] = 0;
    }
    if (!isdefined(self.pers[#"music"])) {
        self.pers[#"music"] = spawnstruct();
        self.pers[#"music"].spawn = 0;
        self.pers[#"music"].inque = 0;
        self.pers[#"music"].currentstate = "SILENT";
        self.pers[#"music"].previousstate = "SILENT";
        self.pers[#"music"].nextstate = "UNDERSCORE";
        self.pers[#"music"].returnstate = "UNDERSCORE";
    }
    self.leaderdialogqueue = [];
    self.leaderdialogactive = 0;
    self.leaderdialoggroups = [];
    self.currentleaderdialoggroup = "";
    self.currentleaderdialog = "";
    self.currentleaderdialogtime = 0;
    if (!isdefined(self.pers[#"cur_kill_streak"])) {
        self.pers[#"cur_kill_streak"] = 0;
    }
    if (!isdefined(self.pers[#"cur_total_kill_streak"])) {
        self.pers[#"cur_total_kill_streak"] = 0;
        self setplayercurrentstreak(0);
    }
    if (!isdefined(self.pers[#"totalkillstreakcount"])) {
        self.pers[#"totalkillstreakcount"] = 0;
    }
    if (!isdefined(self.pers[#"killstreaksearnedthiskillstreak"])) {
        self.pers[#"killstreaksearnedthiskillstreak"] = 0;
    }
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"killstreak_quantity"])) {
        self.pers[#"killstreak_quantity"] = [];
    }
    if (isdefined(level.usingscorestreaks) && level.usingscorestreaks && !isdefined(self.pers[#"held_killstreak_ammo_count"])) {
        self.pers[#"held_killstreak_ammo_count"] = [];
    }
    self.lastkilltime = 0;
    self.cur_death_streak = 0;
    self disabledeathstreak();
    self.death_streak = 0;
    self.kill_streak = 0;
    self.gametype_kill_streak = 0;
    self.spawnqueueindex = -1;
    self.deathtime = 0;
    self.lastgrenadesuicidetime = -1;
    self.teamkillsthisround = 0;
    player::init_heal(1, 1);
    if (!isdefined(level.livesdonotreset) || !level.livesdonotreset || !isdefined(self.pers[#"lives"])) {
        self.pers[#"lives"] = level.numlives;
    }
    if (!level.teambased) {
        self.pers[#"team"] = undefined;
    }
    self.hasspawned = 0;
    self.waitingtospawn = 0;
    self.wantsafespawn = 0;
    self.deathcount = 0;
    self.wasaliveatmatchstart = 0;
    if (level.splitscreen) {
        setdvar(#"splitscreen_playernum", level.players.size);
    }
    if (game.state == "postgame") {
        self.pers[#"needteam"] = 1;
        self.pers[#"team"] = "spectator";
        self.team = "spectator";
        self.sessionteam = "spectator";
        self setclientuivisibilityflag("hud_visible", 0);
        self [[ level.spawnintermission ]]();
        self closeingamemenu();
        profilelog_endtiming(4, "gs=" + game.state + " zom=" + sessionmodeiszombiesgame());
        return;
    }
    if (self istestclient()) {
        recordplayerstats(self, "is_bot", 1);
    }
    level endon(#"game_ended");
    if (isdefined(level.hostmigrationtimer)) {
        self thread hostmigration::hostmigrationtimerthink();
    }
    if (level.oldschool) {
        self.pers[#"class"] = undefined;
        self.curclass = self.pers[#"class"];
    }
    if (isdefined(self.pers[#"team"])) {
        self.team = self.pers[#"team"];
    }
    if (isdefined(self.pers[#"class"])) {
        self.curclass = self.pers[#"class"];
    }
    if (!isdefined(self.pers[#"team"]) || isdefined(self.pers[#"needteam"])) {
        self.pers[#"needteam"] = undefined;
        self.pers[#"team"] = "spectator";
        self.team = "spectator";
        self.sessionstate = "dead";
        [[ level.spawnspectator ]]();
        if (level.rankedmatch) {
            [[ level.autoassign ]](0);
            self thread globallogic_spawn::kickifdontspawn();
        } else {
            [[ level.autoassign ]](0);
        }
        if (self.pers[#"team"] == "spectator") {
            self.sessionteam = "spectator";
            self thread spectate_player_watcher();
        }
        if (level.teambased) {
            self.sessionteam = self.pers[#"team"];
            if (!isalive(self)) {
                self.statusicon = "hud_status_dead";
            }
            self thread spectating::setspectatepermissions();
        }
    } else if (self.pers[#"team"] == "spectator") {
        [[ level.spawnspectator ]]();
        self.sessionteam = "spectator";
        self.sessionstate = "spectator";
        self thread spectate_player_watcher();
    } else {
        self.sessionteam = self.pers[#"team"];
        self.sessionstate = "dead";
        [[ level.spawnspectator ]]();
        if (globallogic_utils::isvalidclass(self.pers[#"class"])) {
            self thread [[ level.spawnclient ]]();
        }
        self thread spectating::setspectatepermissions();
    }
    if (self.sessionteam != "spectator") {
        self thread spawning::onspawnplayer_unified(1);
    }
    profilelog_endtiming(4, "gs=" + game.state + " zom=" + sessionmodeiszombiesgame());
    if (!isdefined(level.players)) {
        level.players = [];
    } else if (!isarray(level.players)) {
        level.players = array(level.players);
    }
    if (!isinarray(level.players, self)) {
        level.players[level.players.size] = self;
    }
    globallogic::updateteamstatus();
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0xf7475461, Offset: 0x1448
// Size: 0x284
function spectate_player_watcher() {
    self endon(#"disconnect");
    self.watchingactiveclient = 1;
    while (true) {
        if (self.pers[#"team"] != "spectator" || level.gameended) {
            self val::reset(#"spectate", "freezecontrols");
            self.watchingactiveclient = 0;
            break;
        }
        /#
            if (!level.splitscreen && !level.hardcoremode && getdvarint(#"scr_showperksonspawn", 0) == 1 && game.state != "<dev string:x38>" && !isdefined(self.perkhudelem)) {
                if (level.perksenabled == 1) {
                    self hud::showperks();
                }
            }
        #/
        count = 0;
        for (i = 0; i < level.players.size; i++) {
            if (level.players[i].team != "spectator") {
                count++;
                break;
            }
        }
        if (count > 0) {
            if (!self.watchingactiveclient) {
                self val::reset(#"spectate", "freezecontrols");
                println("<dev string:x43>");
            }
            self.watchingactiveclient = 1;
        } else {
            if (self.watchingactiveclient) {
                [[ level.onspawnspectator ]]();
                self val::set(#"spectate", "freezecontrols", 1);
            }
            self.watchingactiveclient = 0;
        }
        wait 0.5;
    }
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0x21cbbbd, Offset: 0x16d8
// Size: 0xd0
function callback_playermigrated() {
    println("<dev string:x5a>" + self.name + "<dev string:x64>" + gettime());
    if (isdefined(self.connected) && self.connected) {
    }
    self thread inform_clientvm_of_migration();
    level.hostmigrationreturnedplayercount++;
    if (level.hostmigrationreturnedplayercount >= level.players.size * 2 / 3) {
        println("<dev string:x83>");
        level notify(#"hostmigration_enoughplayers");
    }
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0x92f06310, Offset: 0x17b0
// Size: 0x20
function inform_clientvm_of_migration() {
    self endon(#"disconnect");
    wait 1;
}

// Namespace globallogic_player/globallogic_player
// Params 1, eflags: 0x1 linked
// Checksum 0x4ab1ff4d, Offset: 0x17d8
// Size: 0x82
function arraytostring(inputarray) {
    targetstring = "";
    for (i = 0; i < inputarray.size; i++) {
        targetstring += inputarray[i];
        if (i != inputarray.size - 1) {
            targetstring += ",";
        }
    }
    return targetstring;
}

// Namespace globallogic_player/globallogic_player
// Params 2, eflags: 0x1 linked
// Checksum 0xe2148a6d, Offset: 0x1868
// Size: 0x6f4
function function_7314957c(player, result) {
    lpselfnum = player getentitynumber();
    lpxuid = player getxuid(1);
    bb::function_e0dfa262(player.name, lpselfnum, lpxuid);
    primaryweaponname = #"";
    primaryweaponattachstr = "";
    secondaryweaponname = #"";
    secondaryweaponattachstr = "";
    if (isdefined(player.primaryloadoutweapon)) {
        primaryweaponname = player.primaryloadoutweapon.name;
        primaryweaponattachstr = arraytostring(getarraykeys(player.primaryloadoutweapon.attachments));
    }
    if (isdefined(player.secondaryloadoutweapon)) {
        secondaryweaponname = player.secondaryloadoutweapon.name;
        secondaryweaponattachstr = arraytostring(getarraykeys(player.secondaryloadoutweapon.attachments));
    }
    resultstr = result;
    if (isdefined(player.team) && result == player.team) {
        resultstr = #"win";
    } else if (result == #"allies" || result == #"axis") {
        resultstr = #"lose";
    }
    timeplayed = game.timepassed / 1000;
    var_906bdcf3 = spawnstruct();
    var_906bdcf3.match_id = getdemofileid();
    var_906bdcf3.game_variant = "zm";
    var_906bdcf3.game_mode = level.gametype;
    var_906bdcf3.private_match = sessionmodeisprivate();
    var_906bdcf3.game_map = util::get_map_name();
    var_906bdcf3.player_xuid = player getxuid(1);
    var_906bdcf3.player_ip = player getipaddress();
    var_906bdcf3.season_pass_owned = player hasseasonpass(0);
    var_906bdcf3.dlc_owned = player getdlcavailable();
    var_811ed119 = spawnstruct();
    var_811ed119.match_kills = player.kills;
    var_811ed119.match_deaths = player.deaths;
    var_811ed119.match_score = player.score;
    var_811ed119.match_result = resultstr;
    var_811ed119.match_duration = int(timeplayed);
    var_811ed119.match_hits = player.shotshit;
    var_811ed119.match_streak = player player::function_2abc116("best_kill_streak");
    var_811ed119.match_captures = player player::function_2abc116("captures");
    var_811ed119.match_defends = player player::function_2abc116("defends");
    var_811ed119.match_headshots = player player::function_2abc116("headshots");
    var_811ed119.match_longshots = player player::function_2abc116("longshots");
    var_811ed119.prestige_max = player player::function_2abc116("plevel");
    var_811ed119.level_max = player player::function_2abc116("rank");
    var_a14ea2be = spawnstruct();
    var_a14ea2be.player_gender = player getplayergendertype(currentsessionmode());
    var_a14ea2be.loadout_primary_weapon = primaryweaponname;
    var_a14ea2be.loadout_secondary_weapon = secondaryweaponname;
    var_a14ea2be.loadout_primary_attachments = primaryweaponattachstr;
    var_a14ea2be.loadout_secondary_attachments = secondaryweaponattachstr;
    end_match_zm = spawnstruct();
    end_match_zm.money = player.score;
    end_match_zm.zombie_waves = level.round_number;
    end_match_zm.revives = player player::function_2abc116("revives");
    end_match_zm.doors = player player::function_2abc116("doors_purchased");
    end_match_zm.downs = player player::function_2abc116("downs");
    function_92d1707f(#"hash_4c5946fa1191bc64", #"hash_71960e91f80c3365", var_906bdcf3, #"hash_4682ee0eb5071d2", var_811ed119, #"hash_209c80d657442a83", var_a14ea2be, #"end_match_zm", end_match_zm);
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0x1d692e04, Offset: 0x1f68
// Size: 0x524
function callback_playerdisconnect() {
    profilelog_begintiming(5, "ship");
    if (game.state != "postgame" && !level.gameended) {
        gamelength = globallogic::getgamelength();
        self globallogic::bbplayermatchend(gamelength, "MP_PLAYER_DISCONNECT", 0);
    }
    arrayremovevalue(level.players, self);
    if (level.splitscreen) {
        players = level.players;
        if (players.size <= 1) {
            level thread globallogic::forceend();
        }
        setdvar(#"splitscreen_playernum", isarray(players) ? players.size : 0);
    }
    if (isdefined(self.score) && isdefined(self.pers) && isdefined(self.pers[#"team"])) {
        /#
            print("<dev string:xac>" + self.pers[#"team"] + "<dev string:xbb>" + self.score);
        #/
        level.dropteam += 1;
    }
    [[ level.onplayerdisconnect ]]();
    lpselfnum = self getentitynumber();
    function_7314957c(self, #"disconnected");
    for (entry = 0; entry < level.players.size; entry++) {
        if (level.players[entry] == self) {
            while (entry < level.players.size - 1) {
                level.players[entry] = level.players[entry + 1];
                entry++;
            }
            level.players[entry] = undefined;
            break;
        }
    }
    for (entry = 0; entry < level.players.size; entry++) {
        if (isdefined(level.players[entry].pers[#"killed_players"][self.name])) {
            level.players[entry].pers[#"killed_players"][self.name] = undefined;
        }
        if (isdefined(level.players[entry].killedplayerscurrent[self.name])) {
            level.players[entry].killedplayerscurrent[self.name] = undefined;
        }
        if (isdefined(level.players[entry].pers[#"killed_by"][self.name])) {
            level.players[entry].pers[#"killed_by"][self.name] = undefined;
        }
        if (isdefined(level.players[entry].pers[#"nemesis_tracking"][self.name])) {
            level.players[entry].pers[#"nemesis_tracking"][self.name] = undefined;
        }
        if (level.players[entry].pers[#"nemesis_name"] == self.name) {
            level.players[entry] choosenextbestnemesis();
        }
    }
    if (level.gameended) {
        self globallogic::removedisconnectedplayerfromplacement();
    }
    globallogic::updateteamstatus();
    profilelog_endtiming(5, "gs=" + game.state + " zom=" + sessionmodeiszombiesgame());
}

// Namespace globallogic_player/globallogic_player
// Params 8, eflags: 0x1 linked
// Checksum 0x15d14d95, Offset: 0x2498
// Size: 0xc4
function callback_playermelee(eattacker, idamage, weapon, vorigin, vdir, boneindex, shieldhit, frombehind) {
    hit = 1;
    if (level.teambased && self.team == eattacker.team) {
        if (level.friendlyfire == 0) {
            hit = 0;
        }
    }
    self finishmeleehit(eattacker, weapon, vorigin, vdir, boneindex, shieldhit, hit, frombehind);
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0x1ff14ba0, Offset: 0x2568
// Size: 0x256
function choosenextbestnemesis() {
    nemesisarray = self.pers[#"nemesis_tracking"];
    nemesisarraykeys = getarraykeys(nemesisarray);
    nemesisamount = 0;
    nemesisname = "";
    if (nemesisarraykeys.size > 0) {
        for (i = 0; i < nemesisarraykeys.size; i++) {
            nemesisarraykey = nemesisarraykeys[i];
            if (nemesisarray[nemesisarraykey] > nemesisamount) {
                nemesisname = nemesisarraykey;
                nemesisamount = nemesisarray[nemesisarraykey];
            }
        }
    }
    self.pers[#"nemesis_name"] = nemesisname;
    if (nemesisname != "") {
        for (playerindex = 0; playerindex < level.players.size; playerindex++) {
            if (level.players[playerindex].name == nemesisname) {
                nemesisplayer = level.players[playerindex];
                self.pers[#"nemesis_rank"] = nemesisplayer.pers[#"rank"];
                self.pers[#"nemesis_rankicon"] = nemesisplayer.pers[#"rankxp"];
                self.pers[#"nemesis_xp"] = nemesisplayer.pers[#"prestige"];
                self.pers[#"nemesis_xuid"] = nemesisplayer getxuid();
                break;
            }
        }
        return;
    }
    self.pers[#"nemesis_xuid"] = "";
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0xace4ae45, Offset: 0x27c8
// Size: 0x5c
function notifyconnecting() {
    waittillframeend();
    if (isdefined(self)) {
        level notify(#"connecting", {#player:self});
        self callback::callback(#"on_player_connecting");
    }
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0x79ec5b85, Offset: 0x2830
// Size: 0xa0
function recordactiveplayersendgamematchrecordstats() {
    foreach (player in level.players) {
        recordplayermatchend(player);
        recordplayerstats(player, "present_at_end", 1);
    }
}

// Namespace globallogic_player/globallogic_player
// Params 2, eflags: 0x1 linked
// Checksum 0xa3ba54d8, Offset: 0x28d8
// Size: 0x1e
function figureoutfriendlyfire(victim, attacker) {
    return level.friendlyfire;
}

// Namespace globallogic_player/globallogic_player
// Params 0, eflags: 0x1 linked
// Checksum 0x18fdcca6, Offset: 0x2900
// Size: 0x2e
function function_b2873ebe() {
    globallogic::updateteamstatus(1);
    self notify(#"death");
}

