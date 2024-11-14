#using scripts\mp_common\util;
#using scripts\mp_common\challenges;
#using scripts\mp_common\bb;
#using scripts\core_common\spawning_shared;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\gametypes\hostmigration;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_defaults;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\gametype;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish;
#using scripts\mp_common\gametypes\battlechatter;
#using scripts\abilities\mp\gadgets\gadget_concertina_wire;
#using scripts\abilities\mp\gadgets\gadget_smart_cover;
#using scripts\core_common\persistence_shared;
#using scripts\mp_common\gametypes\hud_message;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\gametypes\dogtags;
#using scripts\mp_common\contracts;
#using scripts\mp_common\userspawnselection;
#using scripts\core_common\spawnbeacon_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\sound_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\potm_shared;
#using scripts\core_common\popups_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\rank_shared;
#using scripts\core_common\medals_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\hostmigration_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\demo_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\challenges_shared;

#namespace sd;

// Namespace sd/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd62542ac, Offset: 0x5e8
// Size: 0x416
function event_handler[gametype_init] main(eventstruct) {
    globallogic::init();
    util::registerroundswitch(0, 9);
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 500);
    util::registerroundlimit(0, 12);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    level.overrideteamscore = 1;
    level.var_f5a73a96 = 1;
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    level.playerspawnedcb = &sd_playerspawnedcb;
    player::function_cf3aa03d(&onplayerkilled);
    player::function_3c5cc656(&function_610d3790);
    level.ondeadevent = &ondeadevent;
    level.ononeleftevent = &ononeleftevent;
    level.ontimelimit = &globallogic::function_61e80d63;
    level.onroundswitch = &onroundswitch;
    level.getteamkillpenalty = &sd_getteamkillpenalty;
    level.getteamkillscore = &sd_getteamkillscore;
    level.iskillboosting = &sd_iskillboosting;
    level.var_cdb8ae2c = &function_a8da260c;
    level.figure_out_gametype_friendly_fire = &figureoutgametypefriendlyfire;
    level.var_60507c71 = 1;
    level.takelivesondeath = 1;
    level.var_4348a050 = 1;
    level.endgameonscorelimit = 0;
    globallogic_defaults::function_daa7e9d5();
    register_clientfields();
    if (getdvarint(#"hash_da55c6d97d1dc52", 1)) {
        level.var_6cd68fbe = 1;
        spawn_beacon::function_5e54a568(1);
        spawn_beacon::function_ee74520a();
        spawn_beacon::function_7262646d();
        userspawnselection::function_93076e1d();
    }
    gameobjects::register_allowed_gameobject("bombzone");
    gameobjects::register_allowed_gameobject("blocker");
    globallogic_audio::set_leader_gametype_dialog("startSearchAndDestroy", "hcStartSearchAndDestroy", "objDestroy", "objDefend", "bbStartSearchAndDestroy", "hcbbStartSearchAndDestroy");
    globallogic_spawn::addsupportedspawnpointtype("sd");
    if (util::function_8570168d()) {
        ct_tutorial_skirmish::init();
    }
    level.var_1aef539f = &function_a800815;
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xe90ee7e2, Offset: 0xa08
// Size: 0x34
function register_clientfields() {
    clientfield::register("worlduimodel", "hudItems.war.attackingTeam", 1, 2, "int");
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x3e20595d, Offset: 0xa48
// Size: 0x2a
function onprecachegametype() {
    game.bomb_dropped_sound = "fly_bomb_drop_plr";
    game.bomb_recovered_sound = "fly_bomb_pickup_plr";
}

// Namespace sd/sd
// Params 4, eflags: 0x0
// Checksum 0xb4dac867, Offset: 0xa80
// Size: 0x98
function sd_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_penalty = globallogic_defaults::default_getteamkillpenalty(einflictor, attacker, smeansofdeath, weapon);
    if (isdefined(self.isdefusing) && self.isdefusing || isdefined(self.isplanting) && self.isplanting) {
        teamkill_penalty *= level.teamkillpenaltymultiplier;
    }
    return teamkill_penalty;
}

// Namespace sd/sd
// Params 4, eflags: 0x0
// Checksum 0xf1328e11, Offset: 0xb20
// Size: 0xa2
function sd_getteamkillscore(einflictor, attacker, smeansofdeath, weapon) {
    teamkill_score = rank::getscoreinfovalue("team_kill");
    if (isdefined(self.isdefusing) && self.isdefusing || isdefined(self.isplanting) && self.isplanting) {
        teamkill_score *= level.teamkillscoremultiplier;
    }
    return int(teamkill_score);
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x5fb12ff1, Offset: 0xbd0
// Size: 0xdc
function onroundswitch() {
    if (game.stat[#"teamscores"][#"allies"] == level.roundwinlimit - 1 && game.stat[#"teamscores"][#"axis"] == level.roundwinlimit - 1) {
        aheadteam = getbetterteam();
        if (aheadteam != game.defenders) {
            game.switchedsides = !game.switchedsides;
        }
        return;
    }
    gametype::on_round_switch();
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xb2cc0e6c, Offset: 0xcb8
// Size: 0x27a
function getbetterteam() {
    kills[#"allies"] = 0;
    kills[#"axis"] = 0;
    deaths[#"allies"] = 0;
    deaths[#"axis"] = 0;
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        team = player.pers[#"team"];
        if (isdefined(team) && (team == #"allies" || team == #"axis")) {
            kills[team] = kills[team] + player.kills;
            deaths[team] = deaths[team] + player.deaths;
        }
    }
    if (kills[#"allies"] > kills[#"axis"]) {
        return #"allies";
    } else if (kills[#"axis"] > kills[#"allies"]) {
        return #"axis";
    }
    if (deaths[#"allies"] < deaths[#"axis"]) {
        return #"allies";
    } else if (deaths[#"axis"] < deaths[#"allies"]) {
        return #"axis";
    }
    if (randomint(2) == 0) {
        return #"allies";
    }
    return #"axis";
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xabcc9001, Offset: 0xf40
// Size: 0x74
function function_a8da260c() {
    spawning::place_spawn_points("mp_sd_spawn_attacker");
    spawning::place_spawn_points("mp_sd_spawn_defender");
    spawning::add_start_spawn_points("defenders", "mp_sd_spawn_defender");
    spawning::add_start_spawn_points("attackers", "mp_sd_spawn_attacker");
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xbfef3243, Offset: 0xfc0
// Size: 0x2c
function function_9f49017() {
    util::wait_network_frame();
    userspawnselection::function_4f78b01d(1);
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xf2b75f10, Offset: 0xff8
// Size: 0x294
function onstartgametype() {
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    setbombtimer("B", 0);
    setmatchflag("bomb_timer_b", 0);
    setclientnamemode("manual_change");
    game.strings[#"target_destroyed"] = #"mp/target_destroyed";
    game.strings[#"bomb_defused"] = #"mp/bomb_defused";
    hud_message::function_36419c2(1, game.strings[#"target_destroyed"], game.strings[#"target_destroyed"]);
    hud_message::function_36419c2(11, game.strings[#"bomb_defused"], game.strings[#"bomb_defused"]);
    level._effect[#"bombexplosion"] = #"explosions/fx_exp_bomb_demo_mp";
    level.alwaysusestartspawns = 1;
    foreach (team, _ in level.teams) {
        level.var_a236b703[team] = 1;
        level.var_61952d8b[team] = 1;
    }
    thread function_9f49017();
    level thread function_8cac4c76();
    thread updategametypedvars();
    thread set_ui_team();
    thread bombs();
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x3ddd172, Offset: 0x1298
// Size: 0x44
function function_8cac4c76() {
    waitframe(1);
    clientfield::set_world_uimodel("hudItems.team1.noRespawnsLeft", 1);
    clientfield::set_world_uimodel("hudItems.team2.noRespawnsLeft", 1);
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0x9dc2d26a, Offset: 0x12e8
// Size: 0x44
function onspawnplayer(predictedspawn) {
    self.isplanting = 0;
    self.isdefusing = 0;
    self.isbombcarrier = 0;
    spawning::onspawnplayer(predictedspawn);
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xdf53019a, Offset: 0x1338
// Size: 0x18
function sd_playerspawnedcb() {
    level notify(#"spawned_player");
}

// Namespace sd/sd
// Params 4, eflags: 0x0
// Checksum 0x9bf5011a, Offset: 0x1358
// Size: 0x594
function function_610d3790(einflictor, victim, idamage, weapon) {
    attacker = self;
    if (isplayer(attacker) && attacker.pers[#"team"] != victim.pers[#"team"]) {
        scoreevents::processscoreevent(#"kill_sd", attacker, victim, weapon);
    }
    inbombzone = 0;
    var_1cfdf798 = isdefined(victim.lastattacker) ? victim.lastattacker === attacker : 0;
    for (index = 0; index < level.bombzones.size; index++) {
        dist = distance2dsquared(victim.origin, level.bombzones[index].curorigin);
        if (dist < level.defaultoffenseradiussq) {
            inbombzone = 1;
            currentobjective = level.bombzones[index];
            break;
        }
    }
    if (inbombzone && isplayer(attacker) && attacker.pers[#"team"] != victim.pers[#"team"]) {
        attacker challenges::function_2f462ffd(victim, weapon, einflictor, currentobjective);
        attacker.pers[#"objectiveekia"]++;
        attacker.objectiveekia = attacker.pers[#"objectiveekia"];
        attacker.pers[#"objectives"]++;
        attacker.objectives = attacker.pers[#"objectives"];
        if (game.defenders == victim.pers[#"team"]) {
            attacker medals::offenseglobalcount();
            attacker thread challenges::killedbasedefender(currentobjective);
            victim recordkillmodifier("defending");
            scoreevents::processscoreevent(#"killed_defender", attacker, victim, weapon);
        } else {
            if (isdefined(attacker.pers[#"defends"])) {
                attacker.pers[#"defends"]++;
                attacker.defends = attacker.pers[#"defends"];
            }
            attacker medals::defenseglobalcount();
            attacker thread challenges::killedbaseoffender(currentobjective, weapon, einflictor);
            victim recordkillmodifier("assaulting");
            scoreevents::processscoreevent(#"killed_attacker", attacker, victim, weapon);
        }
    }
    if (isplayer(attacker) && attacker.pers[#"team"] != victim.pers[#"team"] && isdefined(victim.isbombcarrier) && victim.isbombcarrier == 1) {
        victim recordkillmodifier("carrying");
        attacker recordgameevent("kill_carrier");
    }
    if (victim.isplanting == 1) {
        victim recordkillmodifier("planting");
    }
    if (victim.isdefusing == 1) {
        victim recordkillmodifier("defusing");
        util::function_5a68c330(14, victim.team, victim getentitynumber());
    }
    if (inbombzone && var_1cfdf798) {
        attacker challenges::function_82bb78f7(weapon);
    }
}

// Namespace sd/sd
// Params 2, eflags: 0x0
// Checksum 0x171f5469, Offset: 0x18f8
// Size: 0x30
function function_a800815(victim, attacker) {
    if (victim.isplanting === 1) {
        return true;
    }
    return false;
}

// Namespace sd/sd
// Params 9, eflags: 0x0
// Checksum 0xbbb2e365, Offset: 0x1930
// Size: 0x20c
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    clientfield::set_player_uimodel("hudItems.playerLivesCount", level.numlives - self.var_a7d7e50a);
    if (isdefined(self) && isdefined(attacker) && attacker != self && isplayer(attacker) && attacker.team != self.team) {
        scoreevents::processscoreevent(#"eliminated_enemy", attacker, self, weapon);
        attacker contracts::function_fd9fb79b(#"contract_mp_eliminations");
        if (isdefined(self.lastmansd) && self.lastmansd == 1) {
            attacker stats::function_dad108fa(#"eliminated_final_enemy", 1);
        }
    }
    if (isdefined(level.droppedtagrespawn) && level.droppedtagrespawn) {
        should_spawn_tags = self dogtags::should_spawn_tags(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        should_spawn_tags = should_spawn_tags && !globallogic_spawn::mayspawn();
        if (should_spawn_tags) {
            level thread dogtags::spawn_dog_tag(self, attacker, &dogtags::onusedogtag, 0);
        }
    }
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xf7a9f6a8, Offset: 0x1b48
// Size: 0x1b4
function ondeadevent(team) {
    if (level.bombexploded || level.bombdefused) {
        return;
    }
    if (getdvarint(#"hash_da55c6d97d1dc52", 1) && spawn_beacon::function_6b437265(team)) {
        return;
    }
    if (team == "all") {
        if (level.bombplanted) {
            globallogic::function_a3e3bd39(game.attackers, 6);
        } else {
            globallogic::function_a3e3bd39(game.defenders, 6);
        }
        return;
    }
    if (team == game.attackers) {
        enemyteam = util::get_enemy_team(team);
        challenges::last_man_defeat_3_enemies(enemyteam);
        if (level.bombplanted) {
            return;
        }
        globallogic::function_a3e3bd39(game.defenders, 6);
        return;
    }
    if (team == game.defenders) {
        enemyteam = util::get_enemy_team(team);
        challenges::last_man_defeat_3_enemies(enemyteam);
        globallogic::function_a3e3bd39(game.attackers, 6);
    }
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xcd797d8a, Offset: 0x1d08
// Size: 0x3c
function ononeleftevent(team) {
    if (level.bombexploded || level.bombdefused) {
        return;
    }
    warnlastplayer(team);
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xb8f451dd, Offset: 0x1d50
// Size: 0x1ac
function warnlastplayer(team) {
    if (!isdefined(level.warnedlastplayer)) {
        level.warnedlastplayer = [];
    }
    if (isdefined(level.warnedlastplayer[team])) {
        return;
    }
    level.warnedlastplayer[team] = 1;
    players = level.players;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (isdefined(player.pers[#"team"]) && player.pers[#"team"] == team && isdefined(player.pers[#"class"])) {
            if (player.sessionstate == "playing" && !player.afk) {
                break;
            }
        }
    }
    if (i == players.size) {
        return;
    }
    players[i] thread givelastattackerwarning(team);
    util::function_5a68c330(17, player.team, player getentitynumber());
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0x282279b5, Offset: 0x1f08
// Size: 0x184
function givelastattackerwarning(team) {
    self endon(#"death", #"disconnect");
    fullhealthtime = 0;
    interval = 0.05;
    self.lastmansd = 1;
    enemyteam = game.defenders;
    if (team == enemyteam) {
        enemyteam = game.attackers;
    }
    if (level.alivecount[enemyteam] > 2) {
        self.var_66cfa07f = 1;
    }
    while (true) {
        if (self.health != self.maxhealth) {
            fullhealthtime = 0;
        } else {
            fullhealthtime += interval;
        }
        wait interval;
        if (self.health == self.maxhealth && fullhealthtime >= 3) {
            break;
        }
    }
    self thread globallogic_audio::leader_dialog_on_player("roundEncourageLastPlayer");
    thread globallogic_audio::leader_dialog_for_other_teams("roundEncourageLastPlayerEnemy", self.team, undefined, undefined);
    self playlocalsound(#"mus_last_stand");
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xf001381f, Offset: 0x2098
// Size: 0x146
function updategametypedvars() {
    level.planttime = getgametypesetting(#"planttime");
    level.defusetime = getgametypesetting(#"defusetime");
    level.bombtimer = getgametypesetting(#"bombtimer");
    level.multibomb = getgametypesetting(#"multibomb");
    level.teamkillpenaltymultiplier = getgametypesetting(#"teamkillpenalty");
    level.teamkillscoremultiplier = getgametypesetting(#"teamkillscore");
    level.playerkillsmax = getgametypesetting(#"playerkillsmax");
    level.totalkillsmax = getgametypesetting(#"totalkillsmax");
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x5326e4bc, Offset: 0x21e8
// Size: 0xa80
function bombs() {
    level.bombplanted = 0;
    level.bombdefused = 0;
    level.bombexploded = 0;
    trigger = getent("sd_bomb_pickup_trig", "targetname");
    if (!isdefined(trigger)) {
        /#
            util::error("<dev string:x38>");
        #/
        return;
    }
    visuals[0] = getent("sd_bomb", "targetname");
    if (!isdefined(visuals[0])) {
        /#
            util::error("<dev string:x67>");
        #/
        return;
    }
    if (!level.multibomb) {
        level.sdbomb = gameobjects::create_carry_object(game.attackers, trigger, visuals, (0, 0, 0), #"sd_bomb");
        level.sdbomb gameobjects::allow_carry(#"friendly");
        level.sdbomb gameobjects::set_visible_team(#"friendly");
        level.sdbomb gameobjects::set_model_visibility(1);
        level.sdbomb gameobjects::set_use_time(0);
        level.sdbomb.allowweapons = 1;
        level.sdbomb.onpickup = &onpickup;
        level.sdbomb.ondrop = &ondrop;
        level.sdbomb.var_22389d70 = 0;
        var_a319c814 = getgametypesetting(#"carrier_manualdrop");
        if (var_a319c814 === 1) {
            level.sdbomb gameobjects::function_a8c842d6(1, 1);
        } else if (var_a319c814 === 2) {
            level.sdbomb gameobjects::function_98c39cbc(1);
        }
        foreach (visual in level.sdbomb.visuals) {
            visual.team = "free";
        }
    } else {
        trigger delete();
        visuals[0] delete();
    }
    level.bombzones = [];
    level.var_b10236da = [];
    bombzones = getentarray("bombzone", "targetname");
    for (index = 0; index < bombzones.size; index++) {
        trigger = bombzones[index];
        visuals = getentarray(bombzones[index].target, "targetname");
        smart_cover::function_18f38647(trigger);
        concertina_wire::function_18f38647(trigger);
        name = #"sd" + trigger.script_label;
        waypointname = #"sd_waypoint" + trigger.script_label;
        trigger.angles = visuals[0].angles;
        bombzone = gameobjects::create_use_object(game.defenders, trigger, visuals, (0, 0, 0), name, 1, 1);
        bombzone.angles = visuals[0].angles;
        bombzone gameobjects::allow_use(#"enemy");
        bombzone gameobjects::set_use_time(level.planttime);
        trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
        if (!level.multibomb) {
            bombzone gameobjects::set_key_object(level.sdbomb);
        }
        label = bombzone gameobjects::get_label();
        bombzone.label = label;
        bombzone gameobjects::set_visible_team(#"enemy");
        bombzone.onbeginuse = &function_5416db8d;
        bombzone.onuseclear = &onuseclear;
        bombzone.onuseupdate = &onuseupdate;
        bombzone.onenduse = &function_941367ab;
        bombzone.onuse = &onuseplantobject;
        bombzone.oncantuse = &oncantuse;
        bombzone.useweapon = getweapon(#"briefcase_bomb");
        bombzone.visuals[0].killcament = spawn("script_model", bombzone.visuals[0].origin + (0, 0, 128));
        var_69bc8821 = spawn("script_model", trigger.origin);
        var_69bc8821.objectiveid = gameobjects::get_next_obj_id();
        var_69bc8821.curorigin = trigger.origin;
        var_69bc8821.ownerteam = game.defenders;
        var_69bc8821.team = game.defenders;
        var_69bc8821.type = "Waypoint";
        objective_add(var_69bc8821.objectiveid, "invisible", var_69bc8821, waypointname);
        var_69bc8821 gameobjects::set_visible_team(#"any");
        bombzone.waypoint = var_69bc8821;
        if (isdefined(level.bomb_zone_fixup)) {
            [[ level.bomb_zone_fixup ]](bombzone);
        }
        if (!level.multibomb) {
            bombzone.trigger setinvisibletoall();
            bombzone gameobjects::hide_waypoint();
        }
        for (i = 0; i < visuals.size; i++) {
            if (isdefined(visuals[i].script_exploder)) {
                bombzone.exploderindex = visuals[i].script_exploder;
                break;
            }
        }
        foreach (visual in bombzone.visuals) {
            visual.team = "free";
        }
        level.bombzones[level.bombzones.size] = bombzone;
        level.var_b10236da[level.var_b10236da.size] = var_69bc8821;
        bombzone.bombdefusetrig = getent(visuals[0].target, "targetname");
        assert(isdefined(bombzone.bombdefusetrig));
        bombzone.bombdefusetrig.origin += (0, 0, -10000);
        bombzone.bombdefusetrig.label = label;
    }
    for (index = 0; index < level.bombzones.size; index++) {
        array = [];
        for (otherindex = 0; otherindex < level.bombzones.size; otherindex++) {
            if (otherindex != index) {
                array[array.size] = level.bombzones[otherindex];
            }
        }
        level.bombzones[index].otherbombzones = array;
    }
}

// Namespace sd/sd
// Params 3, eflags: 0x0
// Checksum 0xb9b23875, Offset: 0x2c70
// Size: 0xc4
function setbomboverheatingafterweaponchange(useobject, overheated, heat) {
    self endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    waitresult = self waittill(#"weapon_change");
    if (waitresult.weapon == useobject.useweapon) {
        self setweaponoverheating(overheated, heat, waitresult.weapon);
    }
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xad21332, Offset: 0x2d40
// Size: 0x1ac
function function_5416db8d(player) {
    player.isplanting = 1;
    player thread setbomboverheatingafterweaponchange(self, 0, 0);
    player thread battlechatter::gametype_specific_battle_chatter("sd_friendlyplant", player.pers[#"team"]);
    if (level.multibomb) {
        for (i = 0; i < self.otherbombzones.size; i++) {
            self.otherbombzones[i] gameobjects::disable_object();
            self.otherbombzones[i].waypoint gameobjects::disable_object();
        }
    }
    if (self.label == "_a") {
        var_2989dcef = 1;
    } else if (self.label == "_b") {
        var_2989dcef = 2;
    }
    util::function_5a68c330(15, player.team, player getentitynumber(), var_2989dcef);
    player playsound(#"fly_bomb_raise_plr");
    waypoint = self.waypoint;
    objective_setplayerusing(waypoint.objectiveid, player);
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0x66bd0d48, Offset: 0x2ef8
// Size: 0x13c
function function_a8c87bae(player) {
    player playsound(#"mpl_sd_bomb_defuse");
    player.isdefusing = 1;
    player thread setbomboverheatingafterweaponchange(self, 0, 0);
    player thread battlechatter::gametype_specific_battle_chatter("sd_enemyplant", player.pers[#"team"]);
    if (isdefined(level.sdbombmodel)) {
        level.sdbombmodel hide();
    }
    util::function_5a68c330(5, player.team, player getentitynumber());
    waypoint = self.waypoint;
    objective_setplayerusing(waypoint.objectiveid, player);
    player playsound(#"fly_bomb_raise_plr");
}

// Namespace sd/sd
// Params 3, eflags: 0x0
// Checksum 0xba575243, Offset: 0x3040
// Size: 0x64
function onuseupdate(team, progress, change) {
    waypoint = self.waypoint;
    objective_setprogress(waypoint.objectiveid, math::clamp(progress, 0, 1));
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x1104baa4, Offset: 0x30b0
// Size: 0x34
function onuseclear() {
    waypoint = self.waypoint;
    objective_setprogress(waypoint.objectiveid, 0);
}

// Namespace sd/sd
// Params 3, eflags: 0x0
// Checksum 0x85eaf54a, Offset: 0x30f0
// Size: 0xf6
function function_941367ab(team, player, result) {
    waypoint = self.waypoint;
    objective_clearallusing(waypoint.objectiveid);
    if (!isdefined(player)) {
        return;
    }
    player.isplanting = 0;
    player notify(#"event_ended");
    if (level.multibomb && !result) {
        for (i = 0; i < self.otherbombzones.size; i++) {
            self.otherbombzones[i] gameobjects::enable_object();
            self.otherbombzones[i].waypoint gameobjects::enable_object();
        }
    }
}

// Namespace sd/sd
// Params 3, eflags: 0x0
// Checksum 0xc4aa6fe9, Offset: 0x31f0
// Size: 0xac
function function_46031620(team, player, result) {
    waypoint = self.waypoint;
    objective_clearallusing(waypoint.objectiveid);
    if (!isdefined(player)) {
        return;
    }
    player.isdefusing = 0;
    player notify(#"event_ended");
    if (isdefined(level.sdbombmodel) && !result) {
        level.sdbombmodel show();
    }
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0x4c5b40be, Offset: 0x32a8
// Size: 0x2c
function oncantuse(player) {
    player iprintlnbold(#"hash_480e9067f6524bf");
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xe2595cf9, Offset: 0x32e0
// Size: 0x424
function onuseplantobject(player) {
    assert(isplayer(player));
    self gameobjects::set_flags(1);
    self.waypoint gameobjects::hide_waypoint();
    level thread bombplanted(self, player);
    /#
        print("<dev string:x8f>" + self.label);
    #/
    for (index = 0; index < level.bombzones.size; index++) {
        if (level.bombzones[index] == self) {
            level.bombzones[index].isplanted = 1;
            continue;
        }
        level.bombzones[index] gameobjects::disable_object();
        level.bombzones[index].waypoint gameobjects::disable_object();
    }
    thread sound::play_on_players("mus_sd_planted" + "_" + level.teampostfix[player.pers[#"team"]]);
    player notify(#"bomb_planted");
    level thread popups::displayteammessagetoall(#"hash_12473d7e6ed6e752", player);
    if (isdefined(player.pers[#"plants"])) {
        player.pers[#"plants"]++;
        player.plants = player.pers[#"plants"];
    }
    player.pers[#"objectives"]++;
    player.objectives = player.pers[#"objectives"];
    if (self.label == "_a") {
        var_2989dcef = 1;
    } else if (self.label == "_b") {
        var_2989dcef = 2;
    }
    util::function_5a68c330(4, player.team, player getentitynumber(), var_2989dcef);
    demo::bookmark(#"event", gettime(), player);
    potm::bookmark(#"event", gettime(), player);
    player stats::function_bb7eedf0(#"plants", 1);
    player stats::function_dad108fa(#"plants_defuses", 1);
    player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
    globallogic_audio::leader_dialog("bombPlanted");
    scoreevents::processscoreevent(#"planted_bomb", player, undefined, undefined);
    player recordgameevent("plant");
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xe574665f, Offset: 0x3710
// Size: 0x42c
function onusedefuseobject(player) {
    assert(isplayer(player));
    self.waypoint gameobjects::set_flags(0);
    player notify(#"bomb_defused");
    /#
        print("<dev string:xa0>" + self.label);
    #/
    bb::function_95a5b5c2("sd_bombdefuse", self.label, player.pers[#"team"], player.origin);
    self gameobjects::set_owner_team(player.pers[#"team"]);
    level thread bombdefused(self, player);
    self gameobjects::disable_object();
    self.waypoint gameobjects::disable_object();
    for (index = 0; index < level.bombzones.size; index++) {
        level.bombzones[index].isplanted = 0;
    }
    level thread popups::displayteammessagetoall(#"hash_53c3f7bb9aec1bcc", player);
    if (isdefined(player.pers[#"defuses"])) {
        player.pers[#"defuses"]++;
        player.defuses = player.pers[#"defuses"];
    }
    player.pers[#"objectives"]++;
    player.objectives = player.pers[#"objectives"];
    player stats::function_bb7eedf0(#"defuses", 1);
    player stats::function_dad108fa(#"plants_defuses", 1);
    demo::bookmark(#"event", gettime(), player);
    potm::bookmark(#"event", gettime(), player);
    globallogic_audio::leader_dialog("bombDefused");
    if (player.lastmansd === 1 && level.alivecount[game.attackers] > 0) {
        scoreevents::processscoreevent(#"defused_bomb_last_man_alive", player, undefined, undefined);
        player stats::function_dad108fa(#"defused_bomb_last_man_alive", 1);
        player stats::function_dad108fa(#"hash_55f8a59c6d7132a8", 1);
    } else {
        scoreevents::processscoreevent(#"defused_bomb", player, undefined, undefined);
    }
    player globallogic_score::incpersstat(#"objectivedefends", 1, 0, 1);
    player recordgameevent("defuse");
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0x93a1d9f6, Offset: 0x3b48
// Size: 0xac
function ondrop(player) {
    self gameobjects::set_model_visibility(1);
    if (!level.bombplanted) {
        globallogic_audio::leader_dialog("bombFriendlyDropped", game.attackers);
    }
    player notify(#"event_ended");
    sound::play_on_players(game.bomb_dropped_sound, game.attackers);
    if (isdefined(level.bombdropbotevent)) {
        [[ level.bombdropbotevent ]]();
    }
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0xe3e755fc, Offset: 0x3c00
// Size: 0x284
function onpickup(player) {
    assert(isplayer(player));
    player.isbombcarrier = 1;
    player recordgameevent("pickup");
    self gameobjects::set_model_visibility(0);
    if (!level.bombdefused) {
        if (isdefined(player) && isdefined(player.name)) {
            player stats::function_bb7eedf0(#"pickups", 1);
        }
        util::function_5a68c330(16, player.team, player getentitynumber());
        team = self gameobjects::get_owner_team();
        otherteam = util::getotherteam(team);
        globallogic_audio::leader_dialog("bombFriendlyTaken", game.attackers);
        /#
            print("<dev string:xb1>");
        #/
    }
    player playsound(#"fly_bomb_pickup_plr");
    for (i = 0; i < level.bombzones.size; i++) {
        level.bombzones[i].trigger setinvisibletoall();
        level.bombzones[i].trigger setvisibletoplayer(player);
        level.bombzones[i] gameobjects::hide_waypoint();
        level.bombzones[i] gameobjects::show_waypoint(player);
    }
    if (isdefined(level.bombpickupbotevent)) {
        [[ level.bombpickupbotevent ]]();
    }
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0xf2a7a3f0, Offset: 0x3e90
// Size: 0xac
function bombplantedmusicdelay() {
    level endon(#"bomb_defused");
    time = level.bombtimer - 30;
    /#
        if (getdvarint(#"debug_music", 0) > 0) {
            println("<dev string:xbe>" + time);
        }
    #/
    if (time > 1) {
        wait time;
        thread globallogic_audio::set_music_on_team("timeOutQuiet");
    }
}

// Namespace sd/sd
// Params 2, eflags: 0x0
// Checksum 0xdf706317, Offset: 0x3f48
// Size: 0xe04
function bombplanted(destroyedobj, player) {
    assert(isplayer(player));
    globallogic_utils::pausetimer();
    level.bombplanted = 1;
    player setweaponoverheating(1, 100, destroyedobj.useweapon);
    team = player.pers[#"team"];
    destroyedobj.visuals[0] thread globallogic_utils::playtickingsound("mpl_sab_ui_suitcasebomb_timer");
    level thread bombplantedmusicdelay();
    level.tickingobject = destroyedobj.visuals[0];
    level.timelimitoverride = 1;
    setgameendtime(gettime() + int(level.bombtimer * 1000));
    label = destroyedobj gameobjects::get_label();
    setmatchflag("bomb_timer" + label, 1);
    if (label == "_a") {
        setbombtimer("A", gettime() + int(level.bombtimer * 1000));
        setmatchflag("bomb_timer_a", 1);
    } else {
        setbombtimer("B", gettime() + int(level.bombtimer * 1000));
        setmatchflag("bomb_timer_b", 1);
    }
    bb::function_95a5b5c2("sd_bombplant", label, team, player.origin);
    if (!level.multibomb) {
        level.sdbomb gameobjects::allow_carry("none");
        level.sdbomb gameobjects::set_visible_team("none");
        level.sdbomb.dropoffset = 1;
        level.sdbomb gameobjects::set_dropped();
        level.sdbombmodel = level.sdbomb.visuals[0];
    } else {
        /#
            for (index = 0; index < level.players.size; index++) {
                if (isdefined(level.players[index].carryicon)) {
                    level.players[index].carryicon hud::destroyelem();
                }
            }
        #/
        trace = bullettrace(player.origin + (0, 0, 20), player.origin - (0, 0, 2000), 0, player);
        tempangle = randomfloat(360);
        forward = (cos(tempangle), sin(tempangle), 0);
        forward = vectornormalize(forward - vectorscale(trace[#"normal"], vectordot(forward, trace[#"normal"])));
        dropangles = vectortoangles(forward);
        level.sdbombmodel = spawn("script_model", trace[#"position"]);
        level.sdbombmodel.angles = dropangles;
        level.sdbombmodel setmodel(#"wpn_t8_eqp_briefcase_bomb_stow");
    }
    destroyedobj gameobjects::allow_use(#"none");
    destroyedobj gameobjects::set_visible_team("none");
    label = destroyedobj gameobjects::get_label();
    trigger = destroyedobj.bombdefusetrig;
    trigger function_682f34cf(-400);
    trigger.origin = level.sdbombmodel.origin;
    trigger setcursorhint("HINT_INTERACTIVE_PROMPT");
    visuals = [];
    defuseobject = gameobjects::create_use_object(game.attackers, trigger, visuals, (0, 0, 32), #"hash_7b74e27a1a2facf8", 1, 1);
    defuseobject gameobjects::allow_use(#"enemy");
    defuseobject gameobjects::set_use_time(level.defusetime);
    defuseobject gameobjects::set_use_text(#"mp/defusing_explosive");
    defuseobject gameobjects::set_use_hint_text(#"hash_754b795109a2bbba");
    defuseobject gameobjects::set_visible_team(#"any");
    defuseobject.label = label;
    defuseobject.onbeginuse = &function_a8c87bae;
    defuseobject.onuseclear = &onuseclear;
    defuseobject.onuseupdate = &onuseupdate;
    defuseobject.onenduse = &function_46031620;
    defuseobject.onuse = &onusedefuseobject;
    defuseobject.useweapon = getweapon(#"briefcase_bomb_defuse");
    var_3df9aa45 = spawn("script_model", trigger.origin);
    var_3df9aa45.objectiveid = gameobjects::get_next_obj_id();
    var_3df9aa45.curorigin = trigger.origin;
    var_3df9aa45.ownerteam = game.attackers;
    var_3df9aa45.team = game.attackers;
    var_3df9aa45.type = "Waypoint";
    objective_add(var_3df9aa45.objectiveid, "invisible", var_3df9aa45, #"sd_defuse" + label);
    var_3df9aa45 gameobjects::set_visible_team(#"any");
    var_3df9aa45 gameobjects::set_flags(1);
    defuseobject.waypoint = var_3df9aa45;
    level.defuseobject = defuseobject;
    level.var_3df9aa45 = var_3df9aa45;
    player.isbombcarrier = 0;
    player playbombplant();
    bombtimerwait();
    setbombtimer("A", 0);
    setbombtimer("B", 0);
    setmatchflag("bomb_timer_a", 0);
    setmatchflag("bomb_timer_b", 0);
    if (isdefined(destroyedobj.visuals[0])) {
        destroyedobj.visuals[0] globallogic_utils::stoptickingsound();
    }
    if (level.gameended || level.bombdefused) {
        return;
    }
    level.bombexploded = 1;
    defuseobject gameobjects::disable_object(1, 1, 0, 1);
    origin = (0, 0, 0);
    if (isdefined(player)) {
        origin = player.origin;
    }
    bb::function_95a5b5c2("sd_bombexplode", label, team, origin);
    explosionorigin = level.sdbombmodel.origin + (0, 0, 12);
    level.sdbombmodel hide();
    if (isdefined(destroyedobj.visuals[0])) {
        if (isdefined(player)) {
            destroyedobj.visuals[0] radiusdamage(explosionorigin, 512, 800, 800, player, "MOD_EXPLOSIVE", getweapon(#"briefcase_bomb"));
            level thread popups::displayteammessagetoall(#"hash_74fa1e5aa0983f9", player);
            scoreevents::processscoreevent(#"bomb_detonated", player, undefined, undefined);
            player stats::function_bb7eedf0(#"destructions", 1);
            player recordgameevent("destroy");
        } else {
            destroyedobj.visuals[0] radiusdamage(explosionorigin, 512, 600, 400, undefined, "MOD_EXPLOSIVE", getweapon(#"briefcase_bomb"));
        }
    }
    rot = randomfloat(360);
    explosioneffect = spawnfx(level._effect[#"bombexplosion"], explosionorigin + (0, 0, 50), (0, 0, 1), (cos(rot), sin(rot), 0));
    triggerfx(explosioneffect);
    thread sound::play_in_space("mpl_sd_exp_suitcase_bomb_main", explosionorigin);
    if (isdefined(destroyedobj.exploderindex)) {
        exploder::exploder(destroyedobj.exploderindex);
    }
    defuseobject.waypoint gameobjects::set_flags(2);
    foreach (zone in level.bombzones) {
        zone gameobjects::disable_object();
        zone.waypoint gameobjects::disable_object();
    }
    setgameendtime(0);
    if (isdefined(level.var_81536c1d) && level.var_81536c1d) {
        return;
    }
    wait 3;
    globallogic::function_a3e3bd39(game.attackers, 1);
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x693d322, Offset: 0x4d58
// Size: 0x44
function bombtimerwait() {
    level endon(#"game_ended", #"bomb_defused");
    hostmigration::waitlongdurationwithgameendtimeupdate(level.bombtimer);
}

// Namespace sd/sd
// Params 2, eflags: 0x0
// Checksum 0x6dada90c, Offset: 0x4da8
// Size: 0x16c
function bombdefused(defusedobject, player) {
    level.tickingobject globallogic_utils::stoptickingsound();
    level.bombdefused = 1;
    player setweaponoverheating(1, 100, defusedobject.useweapon);
    setbombtimer("A", 0);
    setbombtimer("B", 0);
    setmatchflag("bomb_timer_a", 0);
    setmatchflag("bomb_timer_b", 0);
    player playbombdefuse();
    level notify(#"bomb_defused");
    thread globallogic_audio::set_music_on_team("silent");
    if (isdefined(level.var_81536c1d) && level.var_81536c1d) {
        return;
    }
    wait 1.5;
    setgameendtime(0);
    globallogic::function_a3e3bd39(game.defenders, 11);
}

// Namespace sd/sd
// Params 0, eflags: 0x4
// Checksum 0x61d51f61, Offset: 0x4f20
// Size: 0x64
function private set_ui_team() {
    wait 0.05;
    if (game.attackers == #"allies") {
        clientfield::set_world_uimodel("hudItems.war.attackingTeam", 1);
        return;
    }
    clientfield::set_world_uimodel("hudItems.war.attackingTeam", 2);
}

// Namespace sd/sd
// Params 0, eflags: 0x0
// Checksum 0x2465a844, Offset: 0x4f90
// Size: 0xf6
function sd_iskillboosting() {
    roundsplayed = util::getroundsplayed();
    if (level.playerkillsmax == 0) {
        return false;
    }
    if (game.totalkills > level.totalkillsmax * (roundsplayed + 1)) {
        return true;
    }
    if (self.kills > level.playerkillsmax * (roundsplayed + 1)) {
        return true;
    }
    if (level.teambased && (self.team == #"allies" || self.team == #"axis")) {
        if (game.totalkillsteam[self.team] > level.playerkillsmax * (roundsplayed + 1)) {
            return true;
        }
    }
    return false;
}

// Namespace sd/sd
// Params 1, eflags: 0x0
// Checksum 0x17ca3405, Offset: 0x5090
// Size: 0x82
function figureoutgametypefriendlyfire(victim) {
    if ((level.hardcoremode || level.var_aa5e6547) && level.friendlyfire > 0 && isdefined(victim) && (victim.isplanting === 1 || victim.isdefusing === 1)) {
        return 2;
    }
    return level.friendlyfire;
}

