// Atian COD Tools GSC decompiler test
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/userspawnselection.gsc;
#include scripts/mp_common/spawnbeacon.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/hud_message.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_defaults.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include script_4c8dba49908aecc2;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/mp_common/challenges.gsc;
#include scripts/mp_common/bb.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/trigger_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/sound_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/potm_shared.gsc;
#include scripts/core_common/popups_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/persistence_shared.gsc;
#include scripts/core_common/hostmigration_shared.gsc;
#include scripts/core_common/globallogic/globallogic_score.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/demo_shared.gsc;
#include scripts/core_common/contracts_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace namespace_2225cf06;

// Namespace namespace_2225cf06/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xf0579c66, Offset: 0x990
// Size: 0x786
function event<gametype_init> main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerscorelimit(0, 2000);
    util::registernumlives(0, 100);
    util::registerroundswitch(0, 9);
    util::registerroundlimit(0, 10);
    util::registerroundwinlimit(0, 10);
    util::registerscorelimit(0, 5000);
    globallogic::registerfriendlyfiredelay(level.gametype, 15, 0, 1440);
    game.var_f89ce1fc = "mpl_flagcapture_sting_friend";
    game.var_90aa6ae6 = "mpl_flagcapture_sting_enemy";
    level.onstartgametype = &on_start_gametype;
    level.onspawnplayer = &on_spawn_player;
    player::function_cf3aa03d(&on_player_killed);
    player::function_3c5cc656(&function_610d3790);
    level.ontimelimit = &function_ee410a60;
    level.onendgame = &on_end_game;
    level.ononeleftevent = &ononeleftevent;
    level.onendround = &on_end_round;
    level.gettimelimit = &gettimelimit;
    level.var_cdb8ae2c = &function_a8da260c;
    level.ondeadevent = &on_dead_event;
    level.doprematch = 1;
    level.overrideteamscore = 1;
    level.var_bfa006c9 = 0;
    level.var_f5a73a96 = 1;
    level.takelivesondeath = 1;
    level.b_allow_vehicle_proximity_pickup = 1;
    level.scoreroundwinbased = getgametypesetting(#"cumulativeroundscores") == 0;
    level.var_a346e384 = getgametypesetting(#"hash_6090fb2501533436");
    level.capturetime = getgametypesetting(#"capturetime");
    level.var_1f102992 = getgametypesetting(#"hash_2668df77d6e3dae4");
    level.var_51e6ac2d = getgametypesetting(#"hash_4b491f67e68ad5de");
    level.var_8b4ff11a = getgametypesetting(#"hash_16efbe2186f760ad");
    level.var_e3595063 = getgametypesetting(#"hash_5d39db2666484b69");
    level.var_66171824 = getgametypesetting(#"hash_c20a87c80edb10e");
    level.var_fdb59386 = getgametypesetting(#"hash_5e8cc49cfd2a1fd2");
    level.var_dcddca2b = getgametypesetting(#"hash_4ea8f72af0b6d15b");
    level.var_25830aa = getgametypesetting(#"hash_63cf0861bfd26240");
    level.var_26ee7cf = getgametypesetting(#"hash_3de4aa2f016161ec");
    level.autodecaytime = isdefined(getgametypesetting(#"autodecaytime")) ? getgametypesetting(#"autodecaytime") : undefined;
    level.timerpaused = 0;
    level.var_3c4ca038 = [];
    level.var_b9d36d8e = [];
    level.var_46ff851e = 0;
    level.var_433c44c5 = 0;
    level.var_5479f3ce = getgametypesetting(#"hash_57fe8e4f461c236d");
    level.var_d1614bb1 = isdefined(getgametypesetting(#"hash_3bbb6171dd1867a1")) ? getgametypesetting(#"hash_3bbb6171dd1867a1") : 0;
    globallogic_audio::set_leader_gametype_dialog("startControl", "hcStartControl", "controlOrdersOfs", "controlOrdersDef", "bbStartControl", "hcbbStartControl");
    register_clientfields();
    callback::on_connect(&on_player_connect);
    level.var_53305148 = [];
    level.var_8b2913b0 = getscriptbundle("mission_settings_control");
    globallogic_spawn::addsupportedspawnpointtype("control");
    game.strings[#"hash_bab7f2001813aa7"] = #"hash_15294f07ee519376";
    game.strings[#"hash_5db475ae2d5164e1"] = #"hash_3a9b595d0bf81f13";
    hud_message::function_36419c2(1, game.strings[#"hash_bab7f2001813aa7"], game.strings[#"hash_5db475ae2d5164e1"]);
    level.var_61a8cce3 = int(level.var_8b2913b0.var_bb89b5c5);
    if (!isdefined(level.var_61a8cce3)) {
        level.var_61a8cce3 = 5000;
    }
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
    level.var_1aef539f = &function_a800815;
    level.var_d3a438fb = &function_d3a438fb;
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0xfee2bf62, Offset: 0x1120
// Size: 0x1fc
function function_fcee7d01() {
    globallogic_spawn::function_c40af6fa();
    globallogic_spawn::addsupportedspawnpointtype("control");
    var_66eb1393 = [];
    foreach (zone in level.zones) {
        if (!isdefined(zone.gameobject)) {
            continue;
        }
        var_66eb1393[zone.zone_index] = isdefined(zone.gameobject.var_f9a5e231) && zone.gameobject.var_f9a5e231;
    }
    if (var_66eb1393.size == 2) {
        if (var_66eb1393[0]) {
            globallogic_spawn::addsupportedspawnpointtype("control_attack_add_1");
            globallogic_spawn::addsupportedspawnpointtype("control_defend_add_1");
        } else {
            globallogic_spawn::addsupportedspawnpointtype("control_attack_remove_0");
            globallogic_spawn::addsupportedspawnpointtype("control_defend_remove_0");
        }
        if (var_66eb1393[1]) {
            globallogic_spawn::addsupportedspawnpointtype("control_attack_add_0");
            globallogic_spawn::addsupportedspawnpointtype("control_defend_add_0");
        } else {
            globallogic_spawn::addsupportedspawnpointtype("control_attack_remove_1");
            globallogic_spawn::addsupportedspawnpointtype("control_defend_remove_1");
        }
    }
    globallogic_spawn::addspawns();
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x7c21aa57, Offset: 0x1328
// Size: 0xc4
function register_clientfields() {
    clientfield::register("world", "warzone", 1, 5, "int");
    clientfield::register("world", "warzonestate", 1, 10, "int");
    clientfield::register("worlduimodel", "hudItems.missions.captureMultiplierStatus", 1, 2, "int");
    clientfield::register("worlduimodel", "hudItems.war.attackingTeam", 1, 2, "int");
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x296a60e4, Offset: 0x13f8
// Size: 0xa4
function function_ee410a60() {
    if (level.zones.size == level.var_907fd719) {
        level thread globallogic::end_round(1);
        return;
    }
    if (isdefined(level.var_66171824) && level.var_66171824) {
        round::function_870759fb();
    } else {
        round::set_winner(game.defenders);
    }
    thread globallogic::end_round(2);
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xb6f57c0b, Offset: 0x14a8
// Size: 0x64
function on_spawn_player(predictedspawn) {
    spawning::onspawnplayer(predictedspawn);
    self.var_c1647e26 = undefined;
    if (level.numlives > 0) {
        clientfield::set_player_uimodel("hudItems.playerLivesCount", game.lives[self.team]);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x595da37a, Offset: 0x1518
// Size: 0x3e
function gettimelimit() {
    timelimit = globallogic_defaults::default_gettimelimit();
    if (level.var_e321292) {
        return (timelimit + level.var_25830aa);
    }
    return timelimit;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x3ed4c4ed, Offset: 0x1560
// Size: 0x7c
function on_end_game(var_c1e98979) {
    if (level.scoreroundwinbased) {
        globallogic_score::updateteamscorebyroundswon();
        winner = globallogic::determineteamwinnerbygamestat("roundswon");
    } else {
        winner = globallogic::determineteamwinnerbyteamscore();
    }
    match::function_af2e264f(winner);
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xe2203c4f, Offset: 0x15e8
// Size: 0xb4
function on_end_round(var_c1e98979) {
    if (globallogic::function_8b4fc766(var_c1e98979)) {
        winning_team = round::get_winning_team();
        globallogic_score::giveteamscoreforobjective(winning_team, 1);
    }
    if (var_c1e98979 == 6) {
        winning_team = round::get_winning_team();
        challenges::last_man_defeat_3_enemies(winning_team);
    }
    function_68387604(var_c1e98979);
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0xc6dac18b, Offset: 0x16a8
// Size: 0x30
function function_d126ce1b() {
    if (!isdefined(self.touchtriggers)) {
        return 1;
    }
    if (self.touchtriggers.size == 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 4, eflags: 0x0
// Checksum 0xaac72eac, Offset: 0x16e0
// Size: 0x66c
function function_610d3790(einflictor, victim, idamage, weapon) {
    if (victim.var_4ef33446 === 1) {
        return;
    }
    var_376742ed = 1;
    if (isdefined(weapon) && isdefined(level.iskillstreakweapon)) {
        if ([[ level.iskillstreakweapon ]](weapon) || isdefined(weapon.statname) && [[ level.iskillstreakweapon ]](getweapon(weapon.statname))) {
            var_376742ed = 0;
        }
    }
    attacker = self;
    var_1cfdf798 = isdefined(victim.lastattacker) ? victim.lastattacker === attacker : 0;
    if (!isplayer(attacker) || level.capturetime && victim function_d126ce1b() && attacker function_d126ce1b() || attacker.pers[#"team"] == victim.pers[#"team"]) {
        if (var_376742ed) {
            victim function_580fd2d5(attacker, weapon);
        }
        return;
    }
    foreach (controlzone in level.zones) {
        radius = (controlzone.trigger.maxs[0] - controlzone.trigger.mins[0]) * 0.5;
        var_c7c5e631 = victim thread globallogic_score::function_7d830bc(einflictor, attacker, weapon, controlzone.trigger, radius, controlzone.team, controlzone.trigger);
        if (var_c7c5e631 === 1) {
            zone = controlzone;
        }
    }
    var_a8cbc1c4 = 0;
    var_e4b6c276 = 0;
    ownerteam = undefined;
    if (level.capturetime == 0) {
        if (!isdefined(zone)) {
            return;
        }
        ownerteam = zone.gameobject.ownerteam;
        if (!isdefined(ownerteam) || ownerteam == #"neutral") {
            return;
        }
    }
    if (!victim function_d126ce1b() || level.capturetime == 0 && victim istouching(zone.trigger)) {
        attacker challenges::function_2f462ffd(victim, weapon, einflictor, zone.gameobject);
        attacker.pers[#"objectiveekia"]++;
        attacker.objectiveekia = attacker.pers[#"objectiveekia"];
        attacker.pers[#"objectives"]++;
        attacker.objectives = attacker.pers[#"objectives"];
        if (victim.team == game.attackers && attacker.team == game.defenders) {
            attacker thread challenges::killedbaseoffender(zone.gameobject, weapon, einflictor);
            if (var_1cfdf798 && var_376742ed) {
                attacker thread function_353427b(victim, weapon);
                scoreevents::processscoreevent(#"hash_339b0e87303dbd56", attacker, self, weapon);
            }
        }
        if (victim.team == game.defenders && attacker.team == game.attackers) {
            attacker thread challenges::killedbasedefender(zone.gameobject);
            if (var_376742ed) {
                if (var_1cfdf798 && (!attacker function_d126ce1b() || level.capturetime == 0 && attacker istouching(zone.trigger))) {
                    scoreevents::processscoreevent(#"hash_75a65ea8fdda2ceb", attacker, victim, weapon);
                }
                scoreevents::processscoreevent(#"hash_126aaff0ffbd9376", attacker, victim, weapon);
            }
        }
        if (var_1cfdf798 && var_376742ed) {
            attacker challenges::function_82bb78f7(weapon);
        }
    } else if (var_376742ed) {
        victim function_580fd2d5(attacker, weapon);
    }
}

// Namespace namespace_2225cf06/control
// Params 9, eflags: 0x0
// Checksum 0x4ba49a38, Offset: 0x1d58
// Size: 0x214
function on_player_killed(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isdefined(self) && isdefined(self.var_c1647e26)) {
        bb::function_95a5b5c2("exited_control_point_death", self.zoneindex, self.team, self.origin, self);
        self.var_c1647e26 = undefined;
        self notify(#"hash_68e3332f714afbbc");
    }
    if (!isdefined(self) || !isdefined(attacker) || !isplayer(attacker)) {
        return;
    }
    if (attacker != self && isdefined(self.pers) && self.pers[#"lives"] == 0 && attacker.team != self.team) {
        scoreevents::processscoreevent(#"eliminated_enemy", attacker, self, weapon);
        if (!isdefined(level.var_c473f6ca)) {
            level.var_c473f6ca = [];
        }
        if (!isdefined(level.var_c473f6ca[self.team])) {
            level.var_c473f6ca[self.team] = 0;
        }
        level.var_c473f6ca[self.team]++;
        if (level.playercount[self.team] == level.var_c473f6ca[self.team]) {
            attacker stats::function_dad108fa(#"hash_f7fc3ff160a3ac5", 1);
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x0
// Checksum 0x9b8bded3, Offset: 0x1f78
// Size: 0x180
function function_a800815(victim, attacker) {
    if (!isdefined(victim.pers) || !isdefined(victim.pers[#"team"])) {
        return 0;
    }
    if (!isdefined(attacker.pers) || !isdefined(attacker.pers[#"team"])) {
        return 0;
    }
    if (isdefined(victim.touchtriggers) && victim.touchtriggers.size && attacker.pers[#"team"] != victim.pers[#"team"] && victim.pers[#"team"] == game.attackers) {
        var_34bb9c9e = getarraykeys(victim.touchtriggers);
        zone = victim.touchtriggers[var_34bb9c9e[0]].useobj;
        if (zone.curprogress > 0) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xffb89f4e, Offset: 0x2100
// Size: 0xba
function function_d3a438fb(entity) {
    foreach (zone in level.zones) {
        if (!isdefined(zone) || !isdefined(zone.trigger)) {
            continue;
        }
        if (entity istouching(zone.trigger)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x0
// Checksum 0xcf8c9d2e, Offset: 0x21c8
// Size: 0x1b8
function function_580fd2d5(attacker, weapon) {
    if (!isplayer(attacker)) {
        return;
    }
    foreach (zone in level.zones) {
        if (!isdefined(zone.trigger)) {
            continue;
        }
        if (!(isdefined(zone.gameobject.var_f9a5e231) && zone.gameobject.var_f9a5e231) && self istouching(zone.trigger, (350, 350, 100))) {
            if (self.team == game.attackers && attacker.team == game.defenders) {
                scoreevents::processscoreevent(#"killed_attacker", attacker, self, weapon);
            }
            if (self.team == game.defenders && attacker.team == game.attackers) {
                scoreevents::processscoreevent(#"killed_defender", attacker, self, weapon);
            }
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xab6a51f9, Offset: 0x2388
// Size: 0x82
function function_7317c1bb(var_f66fb259) {
    var_c12a0335 = 1;
    if (isdefined(self.playerrole)) {
        if (self.team == game.attackers) {
            var_c12a0335 = self.playerrole.var_b0ddf8e5;
        } else if (self.team == game.defenders) {
            var_c12a0335 = self.playerrole.var_3a1d8b72;
        }
    }
    return var_c12a0335;
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0xe3f3ae9c, Offset: 0x2418
// Size: 0x24
function on_player_connect() {
    self gameobjects::setplayergametypeuseratecallback(&function_7317c1bb);
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0x2d69bd61, Offset: 0x2448
// Size: 0x2a
function private use_start_spawns() {
    level waittill(#"grace_period_ending");
    level.usestartspawns = 0;
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0xca65675b, Offset: 0x2480
// Size: 0xdc
function on_start_gametype() {
    level.var_e321292 = 0;
    level.var_83220de2 = 0;
    level.var_83f7fa3b = undefined;
    function_d494e69();
    globallogic_score::resetteamscores();
    level.var_e25d4ecc = 0;
    level.var_d3a30eff = 0;
    thread use_start_spawns();
    userspawnselection::supressspawnselectionmenuforallplayers();
    function_5274dbe8();
    function_fcee7d01();
    thread set_ui_team();
    thread function_9bb83f0();
    thread function_caff2d60();
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x2bf75c48, Offset: 0x2568
// Size: 0x57a
function function_5274dbe8() {
    level.zones = function_c9bc70d6();
    if (level.zones.size == 0) {
        globallogic_utils::print_map_errors();
        return 0;
    }
    if (level.zones.size > 1) {
        level.var_df6215f4 = level.zones.size;
        trigs = getentarray("control_zone_trigger", "targetname");
    } else {
        level.var_df6215f4 = 1;
        trigs = getentarray("control_zone_trigger", "targetname");
    }
    for (var_eaaaa736 = 0; var_eaaaa736 < level.var_df6215f4; var_eaaaa736++) {
        zone = level.zones[var_eaaaa736];
        var_b2150652 = 0;
        zone.trigger = undefined;
        for (j = 0; j < trigs.size; j++) {
            if (zone istouching(trigs[j])) {
                if (isdefined(zone.trigger)) {
                    globallogic_utils::add_map_error("Zone at " + zone.origin + " is touching more than one "zonetrigger" trigger");
                    var_b2150652 = 1;
                    break;
                }
                zone.trigger = trigs[j];
                break;
            }
        }
        if (!isdefined(zone.trigger)) {
            if (!var_b2150652) {
                globallogic_utils::add_map_error("Zone at " + zone.origin + " is not inside any "zonetrigger" trigger");
                return;
            }
        }
        /#
            assert(!var_b2150652);
        #/
        zone.trigger trigger::function_1792c799(16);
        zone.var_3390c6f0 = zone.trigger.origin;
        zone.var_24fbbe05 = spawn("script_model", zone.origin);
        visuals = [];
        visuals[0] = zone;
        if (isdefined(zone.target)) {
            var_1f95679e = getentarray(zone.target, "targetname");
            for (j = 0; j < var_1f95679e.size; j++) {
                visuals[visuals.size] = var_1f95679e[j];
            }
        }
        ownerteam = game.defenders;
        if (isdefined(level.var_66171824) && level.var_66171824) {
            ownerteam = #"neutral";
        }
        zone.gameobject = gameobjects::create_use_object(ownerteam, zone.trigger, visuals, (0, 0, 0), "control_" + var_eaaaa736);
        zone.gameobject gameobjects::set_objective_entity(zone);
        zone.gameobject gameobjects::disable_object();
        zone.gameobject gameobjects::set_model_visibility(0);
        zone.gameobject.var_cb205f83 = zone;
        zone.trigger.useobj = zone.gameobject;
        zone.gameobject.var_2d4c706 = #"neutral";
        zone.gameobject.var_eac9e8ae = 1;
        zone.gameobject.var_a0ff5eb8 = !level.var_5479f3ce;
        zone.zoneindex = var_eaaaa736;
        zone.scores = [];
        foreach (team, _ in level.teams) {
            zone.scores[team] = 0;
        }
        zone function_fadbbfea();
    }
    if (globallogic_utils::print_map_errors()) {
        return 0;
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0x6c0e8134, Offset: 0x2af0
// Size: 0xa4
function private function_a8da260c() {
    spawning::add_spawn_points(game.attackers, "mp_strong_spawn_attacker_region_1");
    spawning::add_spawn_points(game.defenders, "mp_strong_spawn_defender_region_1");
    spawning::updateallspawnpoints();
    if (level.usestartspawns) {
        spawning::add_start_spawn_points(game.attackers, "mp_war_spawn_attacker_zone_1_start");
        spawning::add_start_spawn_points(game.defenders, "mp_war_spawn_defender_zone_1_start");
    }
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x0
// Checksum 0xe0c033d, Offset: 0x2ba0
// Size: 0xfc
function function_e7e84c96(zone_a, zone_b) {
    var_4aeef54 = zone_a.script_index;
    var_2e6a42ca = zone_b.script_index;
    if (!isdefined(var_4aeef54) && !isdefined(var_2e6a42ca)) {
        return 0;
    }
    if (!isdefined(var_4aeef54) && isdefined(var_2e6a42ca)) {
        /#
            println("kothActiveDialogBuffer" + zone_a.origin);
        #/
        return 1;
    }
    if (isdefined(var_4aeef54) && !isdefined(var_2e6a42ca)) {
        /#
            println("kothActiveDialogBuffer" + zone_b.origin);
        #/
        return 0;
    }
    if (var_4aeef54 > var_2e6a42ca) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x15531f40, Offset: 0x2ca8
// Size: 0x37c
function function_c9bc70d6() {
    var_c96c663b = getentarray("control_zone_center", "targetname");
    if (!isdefined(var_c96c663b)) {
        globallogic_utils::add_map_error("Cannot find any zone entities");
        return [];
    }
    if (var_c96c663b.size == 0) {
        globallogic_utils::add_map_error("There are no control zones defined for this map " + util::get_map_name());
        return [];
    }
    if (var_c96c663b.size > 1) {
        var_71b9425c = [];
        var_93fd6689 = var_c96c663b.size;
        for (i = 0; i < var_93fd6689; i++) {
            fieldname = "zoneinfo" + var_93fd6689 + i + 1;
            index = isdefined(level.var_8b2913b0.(fieldname)) ? level.var_8b2913b0.(fieldname) : 0;
            var_71b9425c[var_71b9425c.size] = index;
        }
        zones = [];
        for (i = 0; i < var_c96c663b.size; i++) {
            var_9e434550 = var_c96c663b[i].script_index;
            if (isdefined(var_9e434550)) {
                for (j = 0; j < var_71b9425c.size; j++) {
                    if (var_71b9425c[j] == var_9e434550) {
                        zones[zones.size] = var_c96c663b[i];
                        break;
                    }
                }
            } else {
                globallogic_utils::add_map_error("Zone with no script_index set");
            }
        }
    } else {
        zones = getentarray("control_zone_center", "targetname");
    }
    if (!isdefined(zones)) {
        globallogic_utils::add_map_error("Cannot find any zone entities");
        return [];
    }
    var_58429fdf = 1;
    for (n = zones.size; var_58429fdf; n--) {
        var_58429fdf = 0;
        for (i = 0; i < n - 1; i++) {
            if (function_e7e84c96(zones[i], zones[i + 1])) {
                temp = zones[i];
                zones[i] = zones[i + 1];
                zones[i + 1] = temp;
                var_58429fdf = 1;
            }
        }
    }
    for (i = 0; i < zones.size; i++) {
        zones[i].zone_index = i;
    }
    return zones;
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x0
// Checksum 0x3de200a3, Offset: 0x3030
// Size: 0xe6
function update_objective_hint_message(attackersmsg, defendersmsg) {
    gametype = util::get_game_type();
    foreach (team, _ in level.teams) {
        if (team == game.attackers) {
            game.strings["objective_hint_" + team] = attackersmsg;
        } else {
            game.strings["objective_hint_" + team] = defendersmsg;
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0xbdb9a718, Offset: 0x3120
// Size: 0x152
function function_d494e69() {
    level.var_96c0acbc = #"hash_428c6be88cdba7e1";
    level.var_5046f809 = #"hash_20ab0af94351c0d8";
    level.var_962c97ec = #"hash_257d8ae2e7fc8eb8";
    if (level.var_a346e384) {
        update_objective_hint_message(level.var_96c0acbc);
    } else {
        update_objective_hint_message(level.var_5046f809);
    }
    game.strings[game.attackers + "_mission_win"] = #"hash_6ed10cd957ecbde6";
    game.strings[game.attackers + "_mission_loss"] = #"hash_504843f8a8fe0230";
    game.strings[game.defenders + "_mission_win"] = #"hash_74e465610ac830ce";
    game.strings[game.defenders + "_mission_loss"] = #"hash_7d37cafde0ab4ecd";
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xb8c3d622, Offset: 0x3280
// Size: 0xd4
function function_d137466e(enabled) {
    if (enabled) {
        level.var_e25d4ecc = level.var_e25d4ecc | 1 << self.zone_index;
    } else {
        level.var_e25d4ecc = level.var_e25d4ecc & ~(1 << self.zone_index);
    }
    level.var_d3a30eff = level.var_d3a30eff & ~(3 << self.zone_index);
    level clientfield::set("warzone", level.var_e25d4ecc);
    level clientfield::set("warzonestate", level.var_d3a30eff);
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x5ecbd892, Offset: 0x3360
// Size: 0x348
function function_9bb83f0() {
    level endon(#"game_ended");
    while (level.inprematchperiod) {
        waitframe(1);
    }
    thread function_c4922ad8();
    wait(1);
    sound::play_on_players("mp_suitcase_pickup");
    if (level.var_a346e384 && !(isdefined(level.var_66171824) && level.var_66171824)) {
        foreach (zone in level.zones) {
            zone.gameobject gameobjects::set_flags(1);
        }
        update_objective_hint_message(level.var_96c0acbc);
        wait(level.var_a346e384);
        foreach (zone in level.zones) {
            zone.gameobject gameobjects::set_flags(0);
        }
    }
    waittillframeend();
    if (isdefined(level.var_66171824) && level.var_66171824) {
        update_objective_hint_message(#"hash_68ddcee590e87b3d", #"hash_68ddcee590e87b3d");
    } else {
        update_objective_hint_message(#"hash_68ddcee590e87b3d", #"hash_4900ca003706dc1d");
    }
    sound::play_on_players("mpl_hq_cap_us");
    thread function_22c0cb97();
    thread function_23bedaa1();
    foreach (zone in level.zones) {
        thread function_4fb0ec25(zone);
    }
    level.var_907fd719 = 0;
    while (level.var_907fd719 < level.zones.size) {
        res = undefined;
        res = level waittill(#"zone_captured");
        waitframe(1);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x51097490, Offset: 0x36b0
// Size: 0x10e
function function_22c0cb97() {
    level endon(#"game_ended");
    self notify(#"hash_78d966dcae0916fa");
    self endon(#"hash_78d966dcae0916fa");
    while (1) {
        foreach (zone in level.zones) {
            if (function_73d7b040(zone.gameobject)) {
                playsoundatposition(#"hash_3cdbad029d1c9f65", zone.gameobject.origin);
                break;
            }
        }
        wait(1);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x22dcabd, Offset: 0x37c8
// Size: 0x9c
function function_23bedaa1() {
    level endon(#"game_ended");
    self notify(#"hash_5e9e72ecc3fc7569");
    self endon(#"hash_5e9e72ecc3fc7569");
    while (1) {
        for (i = 0; i < level.zones.size; i++) {
            function_9ed0e6e9(i, 0);
        }
        wait(0.1);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x3fac149d, Offset: 0x3870
// Size: 0x3c
function function_31c391cf() {
    util::wait_network_frame();
    util::wait_network_frame();
    self function_d137466e(1);
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x7db15487, Offset: 0x38b8
// Size: 0x5d6
function function_4fb0ec25(zone) {
    level endon(#"game_ended");
    level.var_bfa006c9 = gettime();
    zone.gameobject gameobjects::set_flags(0);
    zone.gameobject gameobjects::enable_object();
    objective_onentity(zone.gameobject.objectiveid, zone.var_24fbbe05);
    zone.gameobject.var_1d42950b = 0;
    zone.gameobject gameobjects::allow_use(#"enemy");
    zone.gameobject gameobjects::set_use_time(level.capturetime);
    zone.gameobject gameobjects::set_use_text(#"hash_467145983994c6c2");
    numtouching = zone.gameobject function_109febeb();
    zone.gameobject gameobjects::set_visible_team(#"any");
    zone.gameobject gameobjects::set_model_visibility(1);
    zone.gameobject gameobjects::must_maintain_claim(0);
    zone.gameobject gameobjects::can_contest_claim(1);
    zone.gameobject.decayprogress = 1;
    zone.gameobject gameobjects::set_decay_time(level.capturetime);
    zone.autodecaytime = level.autodecaytime;
    if (isdefined(level.var_66171824) && level.var_66171824) {
        zone.gameobject.onuse = &function_ef9ae3d9;
    } else {
        zone.gameobject.onuse = &function_2efe6449;
    }
    zone.gameobject.onbeginuse = &function_c6249b2e;
    zone.gameobject.onenduse = &function_55f0016b;
    zone.gameobject.var_3c57b17d = &function_8c50d606;
    zone.gameobject.var_df79c725 = &function_bcaf6836;
    zone.gameobject.onendtouchuse = &function_27b934b5;
    zone.gameobject.onresumeuse = &function_8c50d606;
    zone.gameobject.stage = 1;
    if (isdefined(level.var_66171824) && level.var_66171824) {
        zone.gameobject.onuseupdate = &function_ebb16836;
    } else {
        zone.gameobject.onuseupdate = &function_59ab563c;
    }
    zone.gameobject.ondecaycomplete = &function_76a36857;
    zone thread function_31c391cf();
    spawn_beacon::function_18f38647(zone.trigger);
    level waittill("zone_captured" + zone.zone_index, #"hash_6ab56017e4e08f62");
    ownerteam = zone.gameobject gameobjects::get_owner_team();
    profilestart();
    zone.gameobject.var_346e7b46 = undefined;
    zone.gameobject gameobjects::set_visible_team(#"any");
    zone.gameobject gameobjects::allow_use(#"none");
    zone.gameobject gameobjects::set_owner_team(#"neutral");
    zone.gameobject gameobjects::set_model_visibility(0);
    zone.gameobject gameobjects::must_maintain_claim(0);
    zone.gameobject.decayprogress = 1;
    zone.autodecaytime = level.autodecaytime;
    objective_setstate(zone.gameobject.objectiveid, "done");
    zone function_d137466e(0);
    spawn_beacon::function_60a53911(zone.trigger);
    zone.gameobject gameobjects::disable_object();
    profilestop();
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0xc4b0a156, Offset: 0x3e98
// Size: 0x8e
function private function_109febeb() {
    numtouching = 0;
    foreach (team, _ in level.teams) {
        numtouching = numtouching + self.numtouching[team];
    }
    return numtouching;
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0xd803329, Offset: 0x3f30
// Size: 0x5c
function private function_c4922ad8() {
    level notify(#"hash_1d7d82960127eba");
    level endon(#"hash_1d7d82960127eba");
    level waittill(#"game_ended");
    setmatchflag("bomb_timer_a", 0);
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x4
// Checksum 0xf2ef59f0, Offset: 0x3f98
// Size: 0xb6
function private function_8c5f5bed(touchlist, team) {
    wait(0.05);
    util::waittillslowprocessallowed();
    foreach (touch in touchlist) {
        player = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(player)) {
            continue;
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0x732aa5a0, Offset: 0x4058
// Size: 0x5e
function private function_720063db(sentient) {
    if (sentient.team != game.attackers) {
        return;
    }
    if (!isdefined(self.var_2d4c706)) {
        return;
    }
    if (self.var_2d4c706 == sentient.team) {
        return;
    }
    self.var_b94d5f63 = 1;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xd87cfb20, Offset: 0x40c0
// Size: 0x5e
function private function_f777c684(sentient) {
    if (sentient.team != game.defenders) {
        return;
    }
    if (isdefined(self.var_2d4c706) && self.var_2d4c706 == sentient.team) {
        return;
    }
    self.var_c1bda824 = 1;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0x76ba3936, Offset: 0x4128
// Size: 0x6c
function private function_edcc7296(sentient) {
    if (isdefined(level.var_66171824) && level.var_66171824) {
        self.var_704b8073 = 1;
    } else {
        function_720063db(sentient);
        function_f777c684(sentient);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0x2f7e0697, Offset: 0x41a0
// Size: 0x1b6
function private function_bcaf6836() {
    if (!isdefined(self.var_9f5ef882)) {
        self.var_9f5ef882 = 0;
    }
    var_464f0169 = self.var_9f5ef882;
    self.var_9f5ef882 = function_73d7b040(self);
    if (self.var_9f5ef882) {
        if (!var_464f0169) {
            foreach (playerlist in self.touchlist) {
                foreach (struct in playerlist) {
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

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xa52108a8, Offset: 0x4360
// Size: 0x14c
function private function_8c50d606(sentient) {
    if (isplayer(sentient)) {
        if (function_73d7b040(self) && (isdefined(sentient.var_c8d27c06) ? sentient.var_c8d27c06 : 0) < gettime()) {
            sentient playsoundtoplayer(#"hash_5daa27b37c13bc01", sentient);
            sentient.var_c8d27c06 = gettime() + 5000;
        }
        bb::function_95a5b5c2("entered_control_point", self.zoneindex, sentient.team, sentient.origin, sentient);
        self notify(#"hash_68e3332f714afbbc");
        sentient.var_c1647e26 = self.zoneindex;
        sentient thread function_c0a83418(self);
    }
    self function_edcc7296(sentient);
    self function_28481667();
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0x77c2fc54, Offset: 0x44b8
// Size: 0x96
function private function_88acffae(sentient) {
    sentient endon(#"hash_68e3332f714afbbc");
    if (!isplayer(sentient)) {
        return;
    }
    waitframe(1);
    waitframe(1);
    if (!isdefined(sentient)) {
        return;
    }
    bb::function_95a5b5c2("exited_control_point_default", self.zoneindex, sentient.team, sentient.origin, sentient);
    sentient.var_c1647e26 = undefined;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xf4056c35, Offset: 0x4558
// Size: 0x5c
function private function_27b934b5(sentient) {
    sentient notify("use_stopped" + self.var_cb205f83.zone_index);
    self function_28481667();
    self thread function_88acffae(sentient);
}

// Namespace namespace_2225cf06/control
// Params 3, eflags: 0x4
// Checksum 0x94ed2c7f, Offset: 0x45c0
// Size: 0x54
function private function_55f0016b(team, sentient, success) {
    sentient notify("event_ended" + self.var_cb205f83.zone_index);
    self function_28481667();
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x4
// Checksum 0x93d8d879, Offset: 0x4620
// Size: 0x8c
function private function_56716d30(var_ed3792dc, team) {
    if (isdefined(level.var_53305148[var_ed3792dc])) {
        if (level.var_53305148[var_ed3792dc] + level.var_61a8cce3 > gettime()) {
            return;
        }
    }
    level.var_53305148[var_ed3792dc] = gettime();
    thread globallogic_audio::leader_dialog(var_ed3792dc, team, undefined, "gamemode_objective", undefined, "kothActiveDialogBuffer");
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x4
// Checksum 0x30f3556e, Offset: 0x46b8
// Size: 0x1e8
function private function_17bc20e1(zone, var_4456a2ef) {
    foreach (team, _ in level.teams) {
        if (team == var_4456a2ef) {
            var_37dac42b = "controlZ" + zone.zone_index + 1 + "TakenOfs";
            function_56716d30(var_37dac42b, team);
            if (level.var_df6215f4 == 0) {
                var_37dac42b = "controlAllZonesCapOfs";
            } else {
                var_37dac42b = "controlLastZoneOfs";
            }
            function_56716d30(var_37dac42b, team);
            thread sound::play_on_players(game.var_f89ce1fc, team);
        } else {
            var_37dac42b = "controlZ" + zone.zone_index + 1 + "LostDef";
            function_56716d30(var_37dac42b, team);
            if (level.var_df6215f4 == 0) {
                var_37dac42b = "controlAllZonesCapDef";
            } else {
                var_37dac42b = "controlLastZoneDef";
            }
            function_56716d30(var_37dac42b, team);
            thread sound::play_on_players(game.var_90aa6ae6, team);
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xe9eb7c24, Offset: 0x48a8
// Size: 0xe4
function ononeleftevent(team) {
    index = util::function_ff74bf7(team);
    players = level.players;
    if (index == players.size) {
        return;
    }
    player = players[index];
    enemyteam = util::get_enemy_team(team);
    if (level.alivecount[enemyteam] > 2) {
        player.var_66cfa07f = 1;
    }
    util::function_5a68c330(17, player.team, player getentitynumber());
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xa128979a, Offset: 0x4998
// Size: 0x5fc
function private function_2efe6449(sentient) {
    level.var_df6215f4--;
    var_4456a2ef = sentient.team;
    capturetime = gettime();
    string = #"hash_6d6f47aad6be619f";
    if (!isdefined(self.var_346e7b46) || self.var_346e7b46 != var_4456a2ef) {
        if (isdefined(getgametypesetting(#"hash_5362566b7e897067")) && getgametypesetting(#"hash_5362566b7e897067")) {
            var_1dbb2b2b = arraycopy(self.var_1dbb2b2b[var_4456a2ef]);
            var_6d7ae157 = arraycopy(self.touchlist[var_4456a2ef]);
            self thread function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, capturetime, var_4456a2ef, self.var_346e7b46);
        } else {
            touchlist = arraycopy(self.touchlist[var_4456a2ef]);
            thread function_48b7eb27(touchlist, string, capturetime, var_4456a2ef, self.var_346e7b46);
        }
    }
    level.var_61ae3b1c = var_4456a2ef;
    level.var_bb7f17e5 = 1;
    util::function_5a68c330(20, sentient.team, -1, function_da460cb8(self.var_f23c87bd));
    self gameobjects::set_owner_team(var_4456a2ef);
    foreach (team, _ in level.teams) {
        if (team == var_4456a2ef) {
            for (index = 0; index < level.players.size; index++) {
                player = level.players[index];
                if (player.pers[#"team"] == team) {
                    if (player.lastkilltime + 500 > gettime()) {
                        player challenges::killedlastcontester();
                    }
                }
            }
        }
    }
    function_17bc20e1(self.var_cb205f83, var_4456a2ef);
    self.var_1d42950b++;
    self.var_346e7b46 = var_4456a2ef;
    self.var_f9a5e231 = 1;
    self gameobjects::must_maintain_claim(1);
    self function_28481667();
    if (isplayer(sentient)) {
        sentient recordgameevent("hardpoint_captured");
        bb::function_95a5b5c2("exited_control_point_captured", self.zoneindex, sentient.team, sentient.origin, sentient);
        self notify(#"hash_68e3332f714afbbc");
    }
    level.var_907fd719++;
    if (level.var_907fd719 == 1 && [[ level.gettimelimit ]]() > 0) {
        level.var_e321292 = 1;
    }
    if (level.var_907fd719 == 1 && (isdefined(level.var_d1614bb1) ? level.var_d1614bb1 : 0) > 0 && var_4456a2ef == game.attackers) {
        game.lives[game.attackers] = game.lives[game.attackers] + level.var_d1614bb1;
        teamid = "team" + level.teamindex[game.attackers];
        clientfield::set_world_uimodel("hudItems." + teamid + ".livesCount", game.lives[game.attackers]);
    }
    level notify("zone_captured" + self.var_cb205f83.zone_index);
    level notify(#"zone_captured");
    level notify("zone_captured" + var_4456a2ef);
    sentient notify("event_ended" + self.var_cb205f83.zone_index);
    if (level.zones.size == level.var_907fd719) {
        round::set_winner(game.attackers);
        level thread globallogic::end_round(1);
    }
    thread function_fcee7d01();
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xf463a32, Offset: 0x4fa0
// Size: 0x44e
function private function_ef9ae3d9(sentient) {
    var_4456a2ef = sentient.team;
    capturetime = gettime();
    string = #"hash_6d6f47aad6be619f";
    if (!isdefined(self.var_346e7b46) || self.var_346e7b46 != var_4456a2ef) {
        if (isdefined(getgametypesetting(#"hash_5362566b7e897067")) && getgametypesetting(#"hash_5362566b7e897067")) {
            var_1dbb2b2b = arraycopy(self.var_1dbb2b2b[var_4456a2ef]);
            var_6d7ae157 = arraycopy(self.touchlist[var_4456a2ef]);
            self thread function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, capturetime, var_4456a2ef, self.var_346e7b46);
        } else {
            touchlist = arraycopy(self.touchlist[var_4456a2ef]);
            thread function_48b7eb27(touchlist, string, capturetime, var_4456a2ef, self.var_346e7b46);
        }
    }
    level.var_61ae3b1c = var_4456a2ef;
    level.var_bb7f17e5 = 1;
    if (!(isdefined(level.var_fdb59386) && level.var_fdb59386)) {
        if (self.ownerteam != var_4456a2ef) {
            self thread function_aeb2df43(var_4456a2ef);
            self gameobjects::set_owner_team(var_4456a2ef);
        }
    } else {
        if (self.ownerteam == #"neutral") {
            self gameobjects::set_owner_team(var_4456a2ef);
            self thread function_aeb2df43(var_4456a2ef);
        }
        if (self.ownerteam != var_4456a2ef) {
            level notify(#"hash_21c87cf883134285");
            self gameobjects::set_owner_team(#"neutral");
        }
    }
    foreach (team, _ in level.teams) {
        if (team == var_4456a2ef) {
            for (index = 0; index < level.players.size; index++) {
                player = level.players[index];
                if (player.pers[#"team"] == team) {
                    if (player.lastkilltime + 500 > gettime()) {
                        player challenges::killedlastcontester();
                    }
                }
            }
        }
    }
    function_17bc20e1(self.var_cb205f83, var_4456a2ef);
    self.var_1d42950b++;
    self.var_346e7b46 = var_4456a2ef;
    self gameobjects::must_maintain_claim(1);
    self function_28481667();
    if (isplayer(sentient)) {
        sentient recordgameevent("hardpoint_captured");
    }
    sentient notify("event_ended" + self.var_cb205f83.zone_index);
}

// Namespace namespace_2225cf06/control
// Params 6, eflags: 0x4
// Checksum 0x187e4a06, Offset: 0x53f8
// Size: 0x364
function private function_ef09febd(var_1dbb2b2b, var_6d7ae157, string, capturetime, var_4456a2ef, var_346e7b46) {
    var_b4613aa2 = [];
    earliestplayer = undefined;
    foreach (contribution in var_1dbb2b2b) {
        if (isdefined(contribution)) {
            contributor = contribution.player;
            if (isdefined(contributor) && isdefined(contribution.contribution)) {
                percentage = 100 * contribution.contribution / self.usetime;
                contributor.var_759a143b = int(0.5 + percentage);
                contributor.var_1aea8209 = contribution.starttime;
                if (percentage < getgametypesetting(#"contributionmin")) {
                    continue;
                }
                if (contribution.var_e22ea52b && (!isdefined(earliestplayer) || contributor.var_1aea8209 < earliestplayer.var_1aea8209)) {
                    earliestplayer = contributor;
                }
                if (!isdefined(var_b4613aa2)) {
                    var_b4613aa2 = [];
                } else if (!isarray(var_b4613aa2)) {
                    var_b4613aa2 = array(var_b4613aa2);
                }
                var_b4613aa2[var_b4613aa2.size] = contributor;
            }
        }
    }
    foreach (player in var_b4613aa2) {
        var_a84f97bf = earliestplayer === player;
        var_af8f6146 = 0;
        foreach (touch in var_6d7ae157) {
            if (!isdefined(touch)) {
                continue;
            }
            if (touch.player === player) {
                var_af8f6146 = 1;
                break;
            }
        }
        function_5a9598f0(player, string, capturetime, var_4456a2ef, var_346e7b46, var_a84f97bf, var_af8f6146);
    }
    self gameobjects::function_98aae7cf();
}

// Namespace namespace_2225cf06/control
// Params 5, eflags: 0x4
// Checksum 0xc22dc5cd, Offset: 0x5768
// Size: 0xe0
function private function_48b7eb27(touchlist, string, capturetime, var_4456a2ef, var_346e7b46) {
    foreach (touch in touchlist) {
        player = gameobjects::function_73944efe(touchlist, touch);
        if (!isdefined(player)) {
            continue;
        }
        function_5a9598f0(player, string, capturetime, var_4456a2ef, var_346e7b46, 0, 1);
    }
}

// Namespace namespace_2225cf06/control
// Params 7, eflags: 0x4
// Checksum 0xfb042b23, Offset: 0x5850
// Size: 0x374
function private function_5a9598f0(player, string, capturetime, var_4456a2ef, var_346e7b46, var_a84f97bf, var_af8f6146) {
    player function_6e852882(var_346e7b46);
    if (!function_e28be4d4(player)) {
        player challenges::capturedobjective(capturetime, self.trigger);
        scoreevents::processscoreevent(#"hash_28f5087b6d10647", player, undefined, undefined);
        player recordgameevent("capture");
        if (var_a84f97bf) {
            level thread popups::displayteammessagetoall(string, player);
        }
        if (isdefined(player.pers[#"captures"])) {
            player.pers[#"captures"]++;
            player.captures = player.pers[#"captures"];
        }
        player.pers[#"objectives"]++;
        player.objectives = player.pers[#"objectives"];
        if (level.var_bfa006c9 + 500 > capturetime) {
            player challenges::immediatecapture();
        }
        demo::bookmark(#"event", gettime(), player);
        potm::bookmark(#"event", gettime(), player);
        player stats::function_bb7eedf0(#"captures", 1);
        player globallogic_score::incpersstat(#"objectivescore", 1, 0, 1);
        if (isdefined(getgametypesetting(#"hash_5362566b7e897067")) && getgametypesetting(#"hash_5362566b7e897067")) {
            player luinotifyevent(#"hash_289bacbf80b953c9", 2, self.var_f23c87bd, player.var_759a143b);
            player.var_759a143b = undefined;
        }
        if (var_af8f6146) {
            player stats::function_dad108fa(#"hash_2f1df496791a2f5f", 1);
            player contracts::increment_contract(#"hash_4fa0008b60deaab4");
        }
    } else {
        /#
            player iprintlnbold("NA");
        #/
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xfbf67a6d, Offset: 0x5bd0
// Size: 0x58
function private function_73d7b040(gameobject) {
    if (gameobject.touchlist[game.attackers].size > 0 && gameobject.touchlist[game.defenders].size > 0) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x350d32c9, Offset: 0x5c30
// Size: 0x120
function function_aeb2df43(team) {
    level endon(#"game_ended");
    level notify("awardCapturePointsRunningNeutral" + self.var_cb205f83.zone_index);
    level endon("awardCapturePointsRunningNeutral" + self.var_cb205f83.zone_index);
    seconds = int(level.var_8b2913b0.var_4ff97309);
    if (!isdefined(seconds)) {
        seconds = 4;
    }
    score = int(level.var_8b2913b0.var_1fa4234f);
    if (!isdefined(score)) {
        score = 5;
    }
    while (!level.gameended) {
        wait(seconds);
        hostmigration::waittillhostmigrationdone();
        globallogic_score::giveteamscoreforobjective(team, score);
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0xd9617471, Offset: 0x5d58
// Size: 0x224
function function_d033480b(team) {
    level endon(#"game_ended");
    level notify(#"hash_48acd4ddfac8ca2a");
    level endon(#"hash_48acd4ddfac8ca2a");
    seconds = 1;
    score = 1;
    while (!level.gameended) {
        wait(seconds);
        hostmigration::waittillhostmigrationdone();
        if (!function_73d7b040(self)) {
            if (level.var_e3595063) {
                score = self.numtouching[team];
            }
            globallogic_score::giveteamscoreforobjective(team, score);
            level.var_83220de2++;
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
            }
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x0
// Checksum 0x3541a26, Offset: 0x5f88
// Size: 0x216
function function_353427b(victim, weapon) {
    self endon(#"disconnect");
    if (!isdefined(self.var_f58d97ed) || self.var_f58d97ed + 5000 < gettime()) {
        self.var_80220c95 = 0;
    }
    self.var_80220c95++;
    self.var_f58d97ed = gettime();
    foreach (trigger in victim.touchtriggers) {
        foreach (zone in level.zones) {
            if (trigger == zone.trigger) {
                point = zone.trigger.useobj;
                found = 1;
                break;
            }
        }
        if (found) {
            break;
        }
    }
    waitframe(1);
    if (isdefined(point) && point.touchlist[game.attackers].size == 0 && self.var_80220c95 >= 2) {
        scoreevents::processscoreevent(#"hash_5d581b2af1ef6338", self, victim, undefined);
        self challenges::function_e0f51b6f(weapon);
        self.var_80220c95 = 0;
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x59617029, Offset: 0x61a8
// Size: 0x1be
function function_fadbbfea() {
    if (!isdefined(level.var_aa8eff32)) {
        return;
    }
    foreach (var_f8de67c4 in level.var_aa8eff32) {
        mindist = 1410065408;
        var_41891211 = undefined;
        foreach (zone in level.zones) {
            distance = distancesquared(var_f8de67c4.origin, zone.origin);
            if (distance < mindist) {
                var_41891211 = zone;
                mindist = distance;
            }
        }
        if (isdefined(var_41891211) && var_41891211 == self) {
            if (!isdefined(var_41891211.gameobject.exclusions)) {
                var_41891211.gameobject.exclusions = [];
            }
            var_41891211.gameobject.exclusions[var_41891211.gameobject.exclusions.size] = var_f8de67c4;
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x8653dd82, Offset: 0x6370
// Size: 0x3a0
function function_c0a83418(gameobject) {
    self notify("player_use_loop_singleton" + gameobject.var_cb205f83.zone_index);
    self endon("player_use_loop_singleton" + gameobject.var_cb205f83.zone_index);
    player = self;
    player endon("use_stopped" + gameobject.var_cb205f83.zone_index, "event_ended" + gameobject.var_cb205f83.zone_index, #"death");
    if (!isdefined(player.playerrole)) {
        return;
    }
    var_ea7cfb48 = 1.5;
    var_c3d6bd84 = 1;
    var_d1b869cc = isdefined(player.playerrole.var_b0ddf8e5) ? player.playerrole.var_b0ddf8e5 : 1;
    var_e301b275 = isdefined(player.playerrole.var_3a1d8b72) ? player.playerrole.var_3a1d8b72 : 1;
    if (var_d1b869cc <= var_ea7cfb48 && var_e301b275 <= var_c3d6bd84) {
        return;
    }
    while (1) {
        while (!isdefined(gameobject.userate) || isdefined(gameobject.userate) && gameobject.userate == 0 || gameobject.claimteam == "none") {
            wait(0.2);
        }
        var_fab1d216 = 0;
        var_5502873c = 0;
        var_4a8afb8e = level.time + 5000;
        while (level.time < var_4a8afb8e) {
            var_be41be3d = gameobject.curprogress;
            wait(1);
            if (gameobject.curprogress > var_be41be3d) {
                var_fab1d216 = 1;
            } else if (gameobject.curprogress < var_be41be3d) {
                var_5502873c = 1;
            }
        }
        if (isdefined(gameobject.userate) && gameobject.userate != 0 && gameobject.claimteam != "none") {
            if (var_fab1d216 && player.pers[#"team"] == game.attackers && var_d1b869cc > var_ea7cfb48) {
                scoreevents::processscoreevent(#"hash_3cf3f60798783a68", player, undefined, undefined);
            } else if (var_5502873c && var_e301b275 > var_c3d6bd84) {
                scoreevents::processscoreevent(#"hash_401df3d8102f77d4", player, undefined, undefined);
            }
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xafc0f651, Offset: 0x6718
// Size: 0x10c
function private function_c6249b2e(sentient) {
    if (isplayer(sentient)) {
        ownerteam = self gameobjects::get_owner_team();
        if (ownerteam == #"neutral") {
            sentient thread battlechatter::gametype_specific_battle_chatter("hq_protect", sentient.pers[#"team"]);
        } else {
            sentient thread battlechatter::gametype_specific_battle_chatter("hq_attack", sentient.pers[#"team"]);
        }
    }
    self function_edcc7296(sentient);
    self function_28481667();
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xb4e1deb4, Offset: 0x6830
// Size: 0x86
function private function_702a4443(touchlist) {
    foreach (var_2ac436b0 in touchlist) {
        if (var_2ac436b0.userate > 1) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x4
// Checksum 0xed5f263b, Offset: 0x68c0
// Size: 0xe6
function private function_6e160542(touchlist, var_f1e25cce) {
    foreach (var_2ac436b0 in touchlist) {
        if (!isdefined(var_2ac436b0)) {
            continue;
        }
        if (isplayer(var_2ac436b0.player) && isdefined(var_2ac436b0.player.playerrole) && var_2ac436b0.player.playerrole.rolename == var_f1e25cce) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0x3c8084b, Offset: 0x69b0
// Size: 0x1a4
function private function_4f1fa16a(zone) {
    if (function_73d7b040(zone)) {
        clientfield::set_world_uimodel("hudItems.missions.captureMultiplierStatus", 0);
        zone.var_2d4c706 = "contested";
    } else if (zone.touchlist[game.attackers].size > 0) {
        if (function_6e160542(zone.touchlist[game.attackers], "objective")) {
            clientfield::set_world_uimodel("hudItems.missions.captureMultiplierStatus", 1);
        }
        zone.var_2d4c706 = game.attackers;
    } else if (zone.touchlist[game.defenders].size > 0 && zone.curprogress > 0) {
        if (function_6e160542(zone.touchlist[game.defenders], "objective")) {
            clientfield::set_world_uimodel("hudItems.missions.captureMultiplierStatus", 2);
        }
        zone.var_2d4c706 = game.defenders;
    } else {
        clientfield::set_world_uimodel("hudItems.missions.captureMultiplierStatus", 0);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0xe059e580, Offset: 0x6b60
// Size: 0x284
function private function_28481667() {
    level.var_d3a30eff = 0;
    for (var_eaaaa736 = 0; var_eaaaa736 < level.zones.size; var_eaaaa736++) {
        var_6c384e11 = level.zones[var_eaaaa736].gameobject;
        ownerteam = var_6c384e11 gameobjects::get_owner_team();
        state = 0;
        flags = 0;
        if (isdefined(level.var_66171824) && level.var_66171824) {
            if (var_6c384e11.claimteam == "none" || !isdefined(level.teamindex[var_6c384e11.claimteam])) {
                flags = 0;
            } else {
                flags = level.teamindex[var_6c384e11.claimteam];
            }
        } else if (function_73d7b040(var_6c384e11)) {
            state = 3;
        } else if (var_6c384e11.claimteam != "none" && var_6c384e11.numtouching[var_6c384e11.claimteam] > 0) {
            if (var_6c384e11.claimteam == game.attackers) {
                state = 2;
                flags = level.teamindex[var_6c384e11.claimteam];
            } else {
                state = 1;
            }
        } else if (var_6c384e11.numtouching[ownerteam]) {
            if (ownerteam == game.attackers) {
                state = 2;
                flags = 1;
            } else {
                state = 1;
            }
        }
        level.var_d3a30eff = level.var_d3a30eff | state << var_eaaaa736 * 2;
        var_6c384e11 gameobjects::set_flags(flags);
    }
    level clientfield::set("warzonestate", level.var_d3a30eff);
    function_4f1fa16a(self);
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x5faa258f, Offset: 0x6df0
// Size: 0x12a
function function_6e852882(var_277c627b) {
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
    self.var_36cd5e69 = self.var_8bf2fa7 / minutespassed;
    if (self.var_36cd5e69 > self.var_8bf2fa7) {
        self.var_36cd5e69 = self.var_8bf2fa7;
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x1afc563a, Offset: 0x6f28
// Size: 0x3e
function function_e28be4d4(player) {
    if (!level.rankedmatch) {
        return 0;
    }
    if (player.var_36cd5e69 > level.var_26ee7cf) {
        return 1;
    }
    return 0;
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x3bd47fab, Offset: 0x6f70
// Size: 0x168
function function_76a36857() {
    clientfield::set_world_uimodel("hudItems.missions.captureMultiplierStatus", 0);
    self gameobjects::set_flags(0);
    if (!(isdefined(self.var_670f7a7f) && self.var_670f7a7f)) {
        if (self.touchlist[game.attackers].size == 0 && self.touchlist[game.defenders].size > 0) {
            self.var_670f7a7f = 1;
            foreach (st in self.touchlist[game.defenders]) {
                var_5498ee18 = gameobjects::function_73944efe(self.touchlist[game.defenders], st);
                if (!isdefined(var_5498ee18)) {
                    continue;
                }
                scoreevents::processscoreevent(#"hash_abbc936bf9059a6", var_5498ee18, undefined, undefined);
            }
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x9babeb89, Offset: 0x70e0
// Size: 0x150
function function_e99b8010(var_277695bd) {
    trig = self.var_cb205f83.trigger;
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (player.team == game.attackers) {
            player playsoundtoplayer(#"hash_554eb90f62c68b44", player);
            if (player istouching(trig)) {
                scoreevents::processscoreevent(#"hash_494906cc7e7b8bc2", player);
            }
            bb::function_95a5b5c2("control_segment_complete" + var_277695bd, self.zoneindex, player.team, player.origin, player);
            self notify(#"hash_68e3332f714afbbc");
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 3, eflags: 0x0
// Checksum 0x226ecbd2, Offset: 0x7238
// Size: 0x74e
function function_59ab563c(team, progress, change) {
    if (isdefined(level.var_dcddca2b) && level.var_dcddca2b && !(isdefined(level.var_66171824) && level.var_66171824)) {
        if (progress >= 0.666667) {
            if (self.stage == 2) {
                self.decayprogressmin = int(0.666667 * self.usetime);
                self function_e99b8010(2);
                self.stage = 3;
                util::function_5a68c330(23, team, -1, function_da460cb8(self.var_f23c87bd));
            }
        } else if (progress >= 0.333333) {
            if (self.stage == 1) {
                self.decayprogressmin = int(0.333333 * self.usetime);
                self function_e99b8010(1);
                self.stage = 2;
                util::function_5a68c330(23, team, -1, function_da460cb8(self.var_f23c87bd));
            }
        }
    }
    if (!(isdefined(level.var_66171824) && level.var_66171824)) {
        function_9ed0e6e9(self.var_cb205f83.zone_index, change);
    }
    if (change > 0 && self.var_eac9e8ae) {
        level.var_433c44c5++;
        self.var_eac9e8ae = 0;
        players = getplayers();
        foreach (player in players) {
            if (player.team == game.attackers) {
                player playsoundtoplayer(#"hash_3cca41b3702f764a", player);
            } else {
                player playsoundtoplayer(#"hash_2bb2a0ec776ba8f7", player);
            }
        }
    } else if (change == 0 && !self.var_eac9e8ae) {
        level.var_433c44c5--;
        self.var_eac9e8ae = 1;
    }
    if (progress > 0.05) {
        if (change > 0 && isdefined(self.var_b94d5f63) && self.var_b94d5f63) {
            if (!(isdefined(level.var_66171824) && level.var_66171824)) {
                if (level.var_433c44c5 <= 1) {
                    var_35f7ecde = "controlZ" + self.var_cb205f83.zone_index + 1 + "CapturingOfs";
                    var_3d9d108 = "controlZ" + self.var_cb205f83.zone_index + 1 + "LosingDef";
                    function_56716d30(var_35f7ecde, game.attackers);
                    function_56716d30(var_3d9d108, game.defenders);
                } else {
                    function_56716d30("controlZMCapturingOfs", game.attackers);
                    function_56716d30("controlZMLosingDef", game.defenders);
                }
            }
            self.var_b94d5f63 = 0;
        } else if (change < 0 && isdefined(self.var_c1bda824) && self.var_c1bda824) {
            function_56716d30("warLosingProgressOfs", game.attackers);
            function_56716d30("warLosingProgressDef", game.defenders);
            self.var_c1bda824 = 0;
        }
    }
    if (isdefined(self.decayprogressmin) && change == 0 && (progress == 0.333333 || progress == 0.666667)) {
        if (clientfield::get_world_uimodel("hudItems.missions.captureMultiplierStatus") != 0) {
            clientfield::set_world_uimodel("hudItems.missions.captureMultiplierStatus", 0);
        }
    }
    if (change > 0) {
        self.var_670f7a7f = undefined;
    }
    if (change == 0 && !(isdefined(self.var_670f7a7f) && self.var_670f7a7f)) {
        if (self.touchlist[game.attackers].size == 0 && self.touchlist[game.defenders].size > 0) {
            self.var_670f7a7f = 1;
            foreach (st in self.touchlist[game.defenders]) {
                scoreevents::processscoreevent(#"hash_6633004bacaa9787", st.player, undefined, undefined);
            }
        }
    }
    if (self.touchlist[game.attackers].size == 0 && self.touchlist[game.defenders].size > 0) {
        if (!(isdefined(self.var_8b62ad00) && self.var_8b62ad00) && self.decayprogressmin === self.curprogress) {
            self function_28481667();
            self.var_8b62ad00 = 1;
        }
    } else {
        self.var_8b62ad00 = undefined;
    }
}

// Namespace namespace_2225cf06/control
// Params 3, eflags: 0x0
// Checksum 0x606de0d0, Offset: 0x7990
// Size: 0x176
function function_ebb16836(team, progress, change) {
    if (progress > 0.05) {
        if (isdefined(self.var_704b8073) && self.var_704b8073) {
            if (change > 0) {
                if (self.ownerteam == #"neutral") {
                    function_56716d30("warCapturingOfs", team);
                    function_56716d30("warCapturingDef", util::getotherteam(team));
                    self.var_704b8073 = 0;
                } else {
                    function_56716d30("warLosingProgressDef", team);
                    function_56716d30("warLosingProgressOfs", util::getotherteam(team));
                    self.var_704b8073 = 0;
                }
            } else if (change < 0) {
                function_56716d30("warLosingProgressOfs", team);
                function_56716d30("warLosingProgressDef", util::getotherteam(team));
                self.var_704b8073 = 0;
            }
        }
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x4
// Checksum 0x689aeb66, Offset: 0x7b10
// Size: 0x84
function private set_ui_team() {
    wait(0.05);
    if (game.attackers == #"allies" || isdefined(level.var_66171824) && level.var_66171824) {
        clientfield::set_world_uimodel("hudItems.war.attackingTeam", 1);
    } else {
        clientfield::set_world_uimodel("hudItems.war.attackingTeam", 2);
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x83df5d44, Offset: 0x7ba0
// Size: 0x52
function pause_time() {
    if (level.var_51e6ac2d && !(isdefined(level.timerpaused) && level.timerpaused)) {
        globallogic_utils::pausetimer();
        level.timerpaused = 1;
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x2c8729cd, Offset: 0x7c00
// Size: 0x52
function function_8984d8eb() {
    if (level.var_51e6ac2d && isdefined(level.timerpaused) && level.timerpaused) {
        globallogic_utils::resumetimer();
        level.timerpaused = 0;
    }
}

// Namespace namespace_2225cf06/control
// Params 2, eflags: 0x0
// Checksum 0x687c9c05, Offset: 0x7c60
// Size: 0xfc
function function_9ed0e6e9(zoneindex, change) {
    if (change > 0 || function_73d7b040(level.zones[zoneindex].gameobject)) {
        level.var_3c4ca038[zoneindex] = 1;
        pause_time();
    } else {
        level.var_3c4ca038[zoneindex] = 0;
        for (var_eaaaa736 = 0; var_eaaaa736 < level.zones.size; var_eaaaa736++) {
            if (isdefined(level.var_3c4ca038[var_eaaaa736]) && level.var_3c4ca038[var_eaaaa736]) {
                return;
            }
        }
        function_8984d8eb();
    }
}

// Namespace namespace_2225cf06/control
// Params 0, eflags: 0x0
// Checksum 0x4382dafc, Offset: 0x7d68
// Size: 0x2d4
function function_caff2d60() {
    level endon(#"game_ended");
    self notify(#"hash_2562ed6d6d163c1a");
    self endon(#"hash_2562ed6d6d163c1a");
    while (1) {
        var_af32dd2d = 1;
        for (i = 0; i < level.zones.size; i++) {
            if (!function_73d7b040(level.zones[i].gameobject)) {
                var_af32dd2d = 0;
                level.var_46ff851e = 0;
                break;
            }
        }
        if (var_af32dd2d) {
            if (!(isdefined(level.var_46ff851e) && level.var_46ff851e)) {
                level.var_46ff851e = 1;
                function_56716d30("controlContestedOfsAll", game.attackers);
                function_56716d30("controlContestedDefAll", game.defenders);
            }
        } else {
            if (function_73d7b040(level.zones[0].gameobject)) {
                if (!(isdefined(level.var_b9d36d8e[0]) && level.var_b9d36d8e[0])) {
                    level.var_b9d36d8e[0] = 1;
                    function_56716d30("controlContestedOfsA", game.attackers);
                    function_56716d30("controlContestedDefA", game.defenders);
                }
            } else {
                level.var_b9d36d8e[0] = 0;
            }
            if (function_73d7b040(level.zones[1].gameobject)) {
                if (!(isdefined(level.var_b9d36d8e[1]) && level.var_b9d36d8e[1])) {
                    level.var_b9d36d8e[1] = 1;
                    function_56716d30("controlContestedOfsB", game.attackers);
                    function_56716d30("controlContestedDefB", game.defenders);
                }
            } else {
                level.var_b9d36d8e[1] = 0;
            }
        }
        wait(0.2);
    }
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x0
// Checksum 0x399ee459, Offset: 0x8048
// Size: 0x18c
function function_68387604(var_c1e98979) {
    var_1e866967 = spawnstruct();
    var_1e866967.var_20de6a02 = game.lives[#"allies"];
    var_1e866967.var_be1de2ab = game.lives[#"axis"];
    switch (var_c1e98979) {
    case 2:
        var_1e866967.wintype = "time_limit_reached";
        break;
    case 1:
        var_1e866967.wintype = "captured_all_zones";
        break;
    case 6:
        var_1e866967.wintype = "no_lives_left";
        break;
    case 9:
    case 10:
    default:
        var_1e866967.wintype = "NA";
        break;
    }
    var_1e866967.remainingtime = globallogic_utils::gettimeremaining();
    if (var_1e866967.remainingtime < 0) {
        var_1e866967.remainingtime = 0;
    }
    bb::function_bf5cad4e(var_1e866967);
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0xf9a4158d, Offset: 0x81e0
// Size: 0x4c
function private function_da460cb8(var_b6ec55d) {
    if (var_b6ec55d == "control_0") {
        var_2989dcef = 1;
    } else if (var_b6ec55d == "control_1") {
        var_2989dcef = 2;
    }
    return var_2989dcef;
}

// Namespace namespace_2225cf06/control
// Params 1, eflags: 0x4
// Checksum 0x944d9593, Offset: 0x8238
// Size: 0x4c
function private on_dead_event(team) {
    if (team != "all") {
        return;
    }
    round::set_flag("tie");
    thread globallogic::end_round(6);
}

