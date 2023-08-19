// Atian COD Tools GSC decompiler test
#include scripts/weapons/weaponobjects.gsc;
#include scripts/weapons/heatseekingmissile.gsc;
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/player/player_utils.gsc;
#include scripts/mp_common/gametypes/round.gsc;
#include scripts/mp_common/gametypes/overtime.gsc;
#include scripts/mp_common/gametypes/match.gsc;
#include scripts/mp_common/gametypes/hud_message.gsc;
#include scripts/mp_common/gametypes/hostmigration.gsc;
#include scripts/mp_common/gametypes/globallogic_utils.gsc;
#include scripts/mp_common/gametypes/globallogic_spawn.gsc;
#include scripts/mp_common/gametypes/globallogic_score.gsc;
#include scripts/mp_common/gametypes/globallogic_audio.gsc;
#include scripts/mp_common/gametypes/globallogic.gsc;
#include scripts/mp_common/challenges.gsc;
#include scripts/mp_common/bb.gsc;
#include scripts/killstreaks/mp/supplydrop.gsc;
#include scripts/killstreaks/killstreak_bundles.gsc;
#include scripts/killstreaks/helicopter_shared.gsc;
#include scripts/killstreaks/airsupport.gsc;
#include scripts/core_common/vehicleriders_shared.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/spawning_shared.gsc;
#include scripts/core_common/scoreevents_shared.gsc;
#include scripts/core_common/popups_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/influencers_shared.gsc;
#include scripts/core_common/hud_util_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/flagsys_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/ai_shared.gsc;
#include script_35598499769dbb3d;
#include script_522aeb6ae906391e;
#include scripts/core_common/ai/archetype_utility.gsc;
#include scripts/core_common/ai/archetype_robot.gsc;
#include script_3819e7a1427df6d2;
#include scripts/abilities/gadgets/gadget_smart_cover.gsc;
#include scripts/abilities/gadgets/gadget_concertina_wire.gsc;

#namespace escort;

// Namespace escort/escort
// Params 0, eflags: 0x2
// Checksum 0x6ff4d6fb, Offset: 0x988
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"escort", &__init__, undefined, undefined);
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x560f7cfb, Offset: 0x9d0
// Size: 0xb4
function __init__() {
    clientfield::register("actor", "escort_robot_burn", 6000, 1, "int");
    clientfield::register("worlduimodel", "Escort.robotProgress", 6000, 7, "float");
    clientfield::register("worlduimodel", "Escort.robotMoving", 6000, 1, "int");
    callback::on_spawned(&on_player_spawned);
}

// Namespace escort/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x60aed8f9, Offset: 0xa90
// Size: 0x53c
function event<gametype_init> main(eventstruct) {
    globallogic::init();
    util::registertimelimit(0, 1440);
    util::registerroundscorelimit(0, 2000);
    util::registerscorelimit(0, 5000);
    util::registerroundlimit(0, 12);
    util::registerroundswitch(0, 9);
    util::registerroundwinlimit(0, 10);
    util::registernumlives(0, 100);
    level.var_14bef9d0 = getgametypesetting(#"hash_3a64e31d02834194");
    level.var_3512ee2c = getgametypesetting(#"hash_1d5318dc84fcfef1");
    level.var_d5a22fd4 = getgametypesetting(#"hash_1e5d29788698deda");
    level.var_24b79196 = getgametypesetting(#"hash_7add838fc1bf8a8e");
    level.var_a6ffdf8d = getgametypesetting(#"hash_75aa1b4ab753e35e");
    level.var_bbac08e3 = "run";
    level.var_cdb8ae2c = &function_a8da260c;
    switch (getgametypesetting(#"hash_78e80a41589e26aa")) {
    case 1:
        level.var_25a81c62 = "escort_robot_low";
        break;
    case 2:
        level.var_25a81c62 = "escort_robot";
        break;
    case 3:
        level.var_25a81c62 = "escort_robot_high";
    case 0:
    default:
        level.var_4bd0d861 = 0;
        break;
    }
    if (isdefined(level.var_25a81c62)) {
        killstreak_bundles::register_killstreak_bundle(level.var_25a81c62);
        level.var_4bd0d861 = killstreak_bundles::get_max_health(level.var_25a81c62);
    }
    switch (isdefined(getgametypesetting(#"hash_52378dd81e94f2da")) ? getgametypesetting(#"hash_52378dd81e94f2da") : 0) {
    case 1:
    default:
        level.var_bbac08e3 = "run";
        break;
    case 2:
        level.var_bbac08e3 = "sprint";
        break;
    case 0:
        level.var_bbac08e3 = "walk";
        break;
    }
    globallogic_audio::set_leader_gametype_dialog("startSafeguard", "hcStartSafeguard", "sfgStartAttack", "sfgStartDefend", "bbStartSafeguard", "hcbbStartSafeguard");
    level.overrideteamscore = 1;
    level.scoreroundwinbased = 1;
    level.doubleovertime = 1;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    player::function_cf3aa03d(&onplayerkilled);
    level.ontimelimit = &ontimelimit;
    level.onendround = &onendround;
    level.shouldplayovertimeround = &shouldplayovertimeround;
    var_31e4b09c = function_a7ec8007();
    level.var_e02589eb = function_9c0c4127(var_31e4b09c[0], var_31e4b09c);
    killstreak_bundles::register_killstreak_bundle("escort_robot");
    globallogic_spawn::addsupportedspawnpointtype("escort");
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x48a6c94b, Offset: 0xfd8
// Size: 0x114
function function_a8da260c() {
    spawning::place_spawn_points("mp_escort_spawn_attacker_start");
    spawning::place_spawn_points("mp_escort_spawn_defender_start");
    spawning::add_start_spawn_points("attackers", "mp_escort_spawn_attacker_start");
    spawning::add_start_spawn_points("defenderss", "mp_escort_spawn_defender_start");
    spawning::add_spawn_points("attackers", "mp_escort_spawn_attacker");
    spawning::add_spawn_points("defenders", "mp_escort_spawn_defender");
    spawning::add_fallback_spawnpoints("attackers", "mp_tdm_spawn");
    spawning::add_fallback_spawnpoints("defenders", "mp_tdm_spawn");
    spawning::updateallspawnpoints();
    spawning::update_fallback_spawnpoints();
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x79d71681, Offset: 0x10f8
// Size: 0x12c
function onstartgametype() {
    if (overtime::is_overtime_round()) {
        [[ level._setteamscore ]](#"allies", 0);
        [[ level._setteamscore ]](#"axis", 0);
        level.ontimelimit = &function_e4457f17;
        if (game.overtime_round == 1) {
            level.onendround = &function_c8a1552d;
        } else if (isdefined(game.var_8e2b660a)) {
            times = float(game.var_8e2b660a) / 1000;
            var_bbf05134 = int(times) / 60;
            util::registertimelimit(var_bbf05134, var_bbf05134);
        }
    }
    level thread function_b38a0ce0();
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x1802d87e, Offset: 0x1230
// Size: 0x24
function onspawnplayer(predictedspawn) {
    spawning::onspawnplayer(predictedspawn);
}

// Namespace escort/escort
// Params 9, eflags: 0x1 linked
// Checksum 0x11507760, Offset: 0x1260
// Size: 0x282
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (!isdefined(attacker) || attacker == self || !isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (self.team == game.defenders && isdefined(attacker.var_838ecd80) && attacker.var_838ecd80) {
        attacker recordgameevent("attacking");
        scoreevents::processscoreevent(#"killed_defender", attacker, self, weapon);
        attacker challenges::function_82bb78f7(weapon);
        [[ level.var_37d62931 ]](attacker, 1);
        attacker.pers[#"objectiveekia"]++;
        attacker.objectiveekia = attacker.pers[#"objectiveekia"];
    } else if (self.team == game.attackers && isdefined(self.var_838ecd80) && self.var_838ecd80) {
        attacker recordgameevent("defending");
        scoreevents::processscoreevent(#"killed_attacker", attacker, self, weapon);
        attacker challenges::function_82bb78f7(weapon);
        [[ level.var_37d62931 ]](attacker, 1);
        attacker.pers[#"objectiveekia"]++;
        attacker.objectiveekia = attacker.pers[#"objectiveekia"];
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x1e555ba9, Offset: 0x14f0
// Size: 0x54
function ontimelimit() {
    globallogic_score::giveteamscoreforobjective_delaypostprocessing(game.defenders, 1);
    round::set_winner(game.defenders);
    level thread globallogic::end_round(2);
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xfe16f743, Offset: 0x1550
// Size: 0x34
function function_e4457f17() {
    round::set_winner(game.defenders);
    level thread globallogic::end_round(2);
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x74940b2, Offset: 0x1590
// Size: 0x94
function onendround(var_c1e98979) {
    winningteam = round::get_winning_team();
    /#
        if (isdefined(level.robot.distancetraveled)) {
            iprintln("escort_robot_path_start" + level.robot.distancetraveled);
        }
    #/
    if (isdefined(level.robot)) {
        level.robot thread function_e9ad1736();
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x6a499e4, Offset: 0x1630
// Size: 0xfc
function function_c8a1552d(var_c1e98979) {
    /#
        if (isdefined(level.robot.distancetraveled)) {
            iprintln("escort_robot_path_start" + level.robot.distancetraveled);
        }
    #/
    switch (var_c1e98979) {
    case 1:
        game.var_8e2b660a = globallogic_utils::gettimepassed();
        break;
    case 2:
        game.var_69b0dc87 = level.robot.origin;
        break;
    default:
        break;
    }
    level.robot thread function_e9ad1736();
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x326c9ff0, Offset: 0x1738
// Size: 0xc6
function shouldplayovertimeround() {
    if (overtime::is_overtime_round()) {
        if (game.overtime_round == 1 || !level.gameended) {
            return 1;
        }
        return 0;
    }
    alliesroundswon = util::getroundswon(#"allies");
    axisroundswon = util::getroundswon(#"axis");
    if (util::hitroundlimit() && alliesroundswon == axisroundswon) {
        return 1;
    }
    return 0;
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xa29c83f7, Offset: 0x1808
// Size: 0xe
function on_player_spawned() {
    self.var_838ecd80 = undefined;
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x585ba75d, Offset: 0x1820
// Size: 0x8dc
function function_b38a0ce0() {
    level endon(#"game_ended");
    globallogic::waitforplayers();
    if (overtime::is_overtime_round()) {
        globallogic_audio::leader_dialog("sfgStartOvertime");
    }
    var_1646544f = getent("escort_robot_move_trig", "targetname");
    var_289d873a = function_a7ec8007();
    var_2bbd993b = var_289d873a[0] - var_1646544f.origin;
    startangles = vectortoangles(var_2bbd993b);
    drop_origin = var_1646544f.origin;
    drop_height = isdefined(level.var_f32c0d57) ? level.var_f32c0d57 : supplydrop::getdropheight(drop_origin);
    heli_drop_goal = (drop_origin[0], drop_origin[1], drop_height);
    level.var_234c4109 = drop_origin;
    goalpath = undefined;
    dropoffset = vectorscale((0, -1, 0), 120);
    goalpath = supplydrop::supplydrophelistartpath_v2_setup(heli_drop_goal, dropoffset);
    supplydrop::supplydrophelistartpath_v2_part2_local(heli_drop_goal, goalpath, dropoffset);
    drop_direction = vectortoangles((heli_drop_goal[0], heli_drop_goal[1], 0) - (goalpath.start[0], goalpath.start[1], 0));
    chopper = spawnvehicle("vehicle_t8_mil_helicopter_transport_mp_escort", heli_drop_goal, (0, 0, 0));
    chopper.maxhealth = 999999;
    chopper.health = 999999;
    chopper setteam(game.attackers);
    chopper.spawntime = gettime();
    var_710802a7 = isdefined(level.var_c206d875) ? level.var_c206d875 : getdvarint(#"hash_3b550686bec6f805", 1000);
    var_96487324 = isdefined(level.var_2250f66a) ? level.var_2250f66a : getdvarint(#"hash_26017f6c33ae2cf6", 1000);
    chopper setspeed(var_710802a7, var_96487324);
    maxpitch = getdvarint(#"scr_supplydropmaxpitch", 25);
    maxroll = getdvarint(#"scr_supplydropmaxroll", 45);
    chopper setmaxpitchroll(0, maxroll);
    chopper setrotorspeed(1);
    var_8d9f7441 = (0, 0, 0);
    spawnangles = (0, 0, 0);
    level.robot = function_bf9b418c(var_8d9f7441, spawnangles);
    level.robot.onground = undefined;
    level.robot.team = game.attackers;
    level.robot setforcenocull();
    vehicle::get_in(level.robot, chopper, "driver");
    level.robot.dropundervehicleoriginoverride = 1;
    level.robot.targetangles = startangles;
    chopper vehicle::unload("all");
    level.robot playsound(#"hash_7bac31e605fbae20");
    chopper thread function_d33dc7f5();
    while (level.robot flagsys::get(#"in_vehicle")) {
        wait(1);
    }
    level.robot.var_289d873a = var_289d873a;
    level.robot.pathindex = 0;
    level.robot.victimsoundmod = "safeguard_robot";
    level.robot.var_2db651d0 = 0;
    level.robot thread function_f05d667f();
    level.robot thread function_6b6768fc();
    level.robot thread function_dd7755c1();
    level.robot thread function_2c3b1920();
    level.robot thread function_a316d24();
    level.robot.var_dff31122 = level.robot influencers::create_entity_friendly_influencer("escort_robot_attackers", game.attackers);
    /#
        function_c8d55752();
        level thread function_b0693b2c();
    #/
    level.var_171f17cc = function_b3d560f2(level.robot, "escort_robot_move_trig");
    level.var_e1f98cba = function_c2fb1ec0(level.robot, "escort_robot_goal_trig");
    function_9d7e4873(level.robot, "escort_robot_reboot_trig");
    if (level.var_14bef9d0) {
        level.var_171f17cc gameobjects::set_flags(1);
        level.robot setblackboardattribute("_stance", "crouch");
        level.robot ai::set_behavior_attribute("rogue_control_speed", level.var_bbac08e3);
        level.robot function_4e5bb046();
    } else {
        objective_setprogress(level.var_171f17cc.objectiveid, 1);
        level.var_171f17cc gameobjects::allow_use(#"friendly");
    }
    level.robot thread function_fe01da38();
    level.robot thread function_7045a646();
    while (level.inprematchperiod) {
        waitframe(1);
    }
    level.robot.onground = 1;
    level.robot.distancetraveled = 0;
    level.robot thread function_ba95878f();
    if (level.var_14bef9d0) {
        level.robot thread function_c282aa58(level.var_14bef9d0);
    } else if (level.var_24b79196 == 0) {
        level.robot function_cd983806();
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xc85e2bb0, Offset: 0x2108
// Size: 0x154
function function_d33dc7f5() {
    chopper = self;
    wait(1);
    var_710802a7 = getdvarint(#"hash_5394e1e2dfd8c2c7", 250);
    var_96487324 = getdvarint(#"hash_2c8ce11aa2f94da", 60);
    chopper setspeed(var_710802a7, var_96487324);
    goal = helicopter::getvalidrandomleavenode(chopper.origin, 1).origin;
    chopper setgoal(goal);
    chopper setneargoalnotifydist(400);
    result = undefined;
    result = chopper waittill(#"near_goal", #"goal_reached", #"goal");
    chopper delete();
}

// Namespace escort/escort
// Params 0, eflags: 0x0
// Checksum 0x185f233a, Offset: 0x2268
// Size: 0x1b8
function function_c8d55752() {
    /#
        if ((isdefined(getdvarint(#"hash_5be9167d7fae9d8b", 0)) ? getdvarint(#"hash_5be9167d7fae9d8b", 0) : 0) == 0) {
            return;
        }
        debug_duration = 999999999;
        pathnodes = level.robot.var_289d873a;
        for (i = 0; i < pathnodes.size - 1; i++) {
            var_552d0ef5 = pathnodes[i];
            nextnode = pathnodes[i + 1];
            util::debug_line(var_552d0ef5, nextnode, vectorscale((0, 1, 0), 0.9), 0.9, 0, debug_duration);
        }
        foreach (path in pathnodes) {
            util::debug_sphere(path, 6, vectorscale((0, 0, 1), 0.9), 0.9, debug_duration);
        }
    #/
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0x1c54fb4b, Offset: 0x2428
// Size: 0x1b0
function function_4d2f7bfd(var_3b5dcf39&) {
    /#
        if ((isdefined(getdvarint(#"hash_5be9167d7fae9d8b", 0)) ? getdvarint(#"hash_5be9167d7fae9d8b", 0) : 0) == 0) {
            return;
        }
        debug_duration = 60;
        pathnodes = var_3b5dcf39;
        for (i = 0; i < pathnodes.size - 1; i++) {
            var_552d0ef5 = pathnodes[i];
            nextnode = pathnodes[i + 1];
            util::debug_line(var_552d0ef5, nextnode, vectorscale((1, 1, 0), 0.9), 0.9, 0, debug_duration);
        }
        foreach (path in pathnodes) {
            util::debug_sphere(path, 3, (0, 0.5, 0.5), 0.9, debug_duration);
        }
    #/
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0x18e28ed7, Offset: 0x25e0
// Size: 0xb4
function function_e31bd066(goal) {
    /#
        if ((isdefined(getdvarint(#"hash_5be9167d7fae9d8b", 0)) ? getdvarint(#"hash_5be9167d7fae9d8b", 0) : 0) == 0) {
            return;
        }
        if (isdefined(goal)) {
            debug_duration = 60;
            util::debug_sphere(goal, 8, vectorscale((0, 1, 0), 0.9), 0.9, debug_duration);
        }
    #/
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0x5f68f3d, Offset: 0x26a0
// Size: 0xc4
function function_2ad70da6(pathgoal) {
    /#
        if ((isdefined(getdvarint(#"hash_5be9167d7fae9d8b", 0)) ? getdvarint(#"hash_5be9167d7fae9d8b", 0) : 0) == 0) {
            return;
        }
        if (isdefined(pathgoal)) {
            debug_duration = 60;
            util::debug_sphere(pathgoal + vectorscale((0, 0, 1), 18), 6, vectorscale((1, 0, 0), 0.9), 0.9, debug_duration);
        }
    #/
}

// Namespace escort/escort
// Params 1, eflags: 0x0
// Checksum 0xdffad5ff, Offset: 0x2770
// Size: 0xc4
function function_6890a094(var_424dcc0a) {
    /#
        if ((isdefined(getdvarint(#"hash_5be9167d7fae9d8b", 0)) ? getdvarint(#"hash_5be9167d7fae9d8b", 0) : 0) == 0) {
            return;
        }
        if (isdefined(var_424dcc0a)) {
            debug_duration = 60;
            util::debug_sphere(var_424dcc0a + vectorscale((0, 0, 1), 18), 6, vectorscale((1, 0, 1), 0.9), 0.9, debug_duration);
        }
    #/
}

// Namespace escort/escort
// Params 2, eflags: 0x0
// Checksum 0xa7750708, Offset: 0x2840
// Size: 0x10c
function function_7b6e70ee(center, radius) {
    /#
        if ((isdefined(getdvarint(#"hash_5be9167d7fae9d8b", 0)) ? getdvarint(#"hash_5be9167d7fae9d8b", 0) : 0) == 0) {
            return;
        }
        if (isdefined(center)) {
            debug_duration = 200;
            circle(center + vectorscale((0, 0, 1), 2), radius, vectorscale((1, 0, 0), 0.9), 1, 1, debug_duration);
            circle(center + vectorscale((0, 0, 1), 4), radius, vectorscale((1, 0, 0), 0.9), 1, 1, debug_duration);
        }
    #/
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xe5e8cf1a, Offset: 0x2958
// Size: 0x78
function function_2c3b1920() {
    level endon(#"game_ended");
    while (1) {
        self waittill(#"hash_357c0d12046b0ee6");
        self recordgameeventnonplayer("robot_start");
        level clientfield::set_world_uimodel("Escort.robotMoving", 1);
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xd70adbed, Offset: 0x29d8
// Size: 0x88
function function_a316d24() {
    level endon(#"game_ended");
    while (1) {
        self waittill(#"hash_aca1ee8e85e3f39");
        if (self.active) {
            self recordgameeventnonplayer("robot_stop");
            level clientfield::set_world_uimodel("Escort.robotMoving", 0);
        }
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xaba03280, Offset: 0x2a68
// Size: 0x178
function function_fe01da38() {
    level endon(#"game_ended");
    while (1) {
        self waittill(#"hash_19b6c6cf9dfb51ca");
        level.var_171f17cc gameobjects::allow_use(#"none");
        objective_setprogress(level.var_171f17cc.objectiveid, -0.05);
        level.var_171f17cc gameobjects::set_flags(1);
        otherteam = util::getotherteam(self.team);
        globallogic_audio::leader_dialog("sfgRobotDisabledAttacker", self.team, undefined, "robot");
        globallogic_audio::leader_dialog("sfgRobotDisabledDefender", otherteam, undefined, "robot");
        globallogic_audio::play_2d_on_team("mpl_safeguard_disabled_sting_friend", self.team);
        globallogic_audio::play_2d_on_team("mpl_safeguard_disabled_sting_enemy", otherteam);
        self thread function_c282aa58(level.var_3512ee2c);
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xb67a968d, Offset: 0x2be8
// Size: 0x1e8
function function_7045a646() {
    level endon(#"game_ended");
    while (1) {
        self waittill(#"hash_2b6b3dbde7859981");
        self recordgameeventnonplayer("robot_repair_complete");
        level.var_171f17cc gameobjects::allow_use(#"friendly");
        otherteam = util::getotherteam(self.team);
        globallogic_audio::leader_dialog("sfgRobotRebootedAttacker", self.team, undefined, "robot");
        globallogic_audio::leader_dialog("sfgRobotRebootedDefender", otherteam, undefined, "robot");
        globallogic_audio::play_2d_on_team("mpl_safeguard_reboot_sting_friend", self.team);
        globallogic_audio::play_2d_on_team("mpl_safeguard_reboot_sting_enemy", otherteam);
        objective_setprogress(level.var_171f17cc.objectiveid, 1);
        if (level.var_24b79196 == 0) {
            self function_cd983806();
        } else if (level.var_171f17cc.numtouching[level.var_171f17cc.ownerteam] == 0) {
            level clientfield::set_world_uimodel("Escort.robotMoving", 0);
        }
        level.var_171f17cc gameobjects::set_flags(0);
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x1e958db, Offset: 0x2dd8
// Size: 0x2ac
function function_c282aa58(time) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"hash_2b6b3dbde7859981", #"game_ended");
    shutdowntime = 0;
    while (shutdowntime < time) {
        rate = 0;
        var_c01d8dbb = level.var_171f17cc.numtouching[level.var_171f17cc.ownerteam];
        if (!level.var_d5a22fd4) {
            rate = float(function_60d95f53()) / 1000;
        } else if (var_c01d8dbb > 0) {
            rate = float(function_60d95f53()) / 1000;
            if (var_c01d8dbb > 1) {
                var_eadfcb09 = (var_c01d8dbb - 1) * float(function_60d95f53()) / 1000 * 0;
                rate = rate + var_eadfcb09;
            }
        }
        if (rate > 0) {
            shutdowntime = shutdowntime + rate;
            percent = min(1, shutdowntime / time);
            objective_setprogress(level.var_171f17cc.objectiveid, percent);
        }
        waitframe(1);
    }
    if (level.var_d5a22fd4 > 0) {
        foreach (struct in level.var_171f17cc.touchlist[game.attackers]) {
            scoreevents::processscoreevent(#"hash_7ed287a2b6b9112a", struct.player, undefined, undefined);
        }
    }
    self thread function_f31ccd44();
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x8d330d5d, Offset: 0x3090
// Size: 0x162
function function_6b6768fc() {
    level endon(#"game_ended");
    while (1) {
        self waittill(#"hash_4786d33b29c15c8f");
        percent = min(1, self.var_4bd0d861 / level.var_4bd0d861);
        objective_setprogress(level.var_171f17cc.objectiveid, 1 - percent);
        health = level.var_4bd0d861 - self.var_4bd0d861;
        lowhealth = killstreak_bundles::get_low_health(level.var_25a81c62);
        if (!(isdefined(self.var_36a986e6) && self.var_36a986e6) && health <= lowhealth) {
            globallogic_audio::leader_dialog("sfgRobotUnderFire", self.team, undefined, "robot");
            self.var_36a986e6 = 1;
        } else if (health > lowhealth) {
            self.var_36a986e6 = 0;
        }
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xe6e1d65f, Offset: 0x3200
// Size: 0x1b6
function function_dd7755c1() {
    self endon(#"death");
    level endon(#"game_ended");
    while (1) {
        animrate = 1;
        if (isdefined(self.var_85c3882d) && self.var_85c3882d) {
            animrate = animrate - 0.3;
            self.var_85c3882d = 0;
        }
        if (isdefined(self.beingmicrowavedby) && self.beingmicrowavedby.size > 0) {
            var_628b766f = getarraykeys(self.beingmicrowavedby);
            foreach (var_318fa3a5 in var_628b766f) {
                var_24c04bd9 = getentbynum(var_318fa3a5);
                if (isdefined(var_24c04bd9) && isdefined(var_24c04bd9.weapon) && var_24c04bd9.weapon.name === #"ability_smart_cover") {
                    animrate = animrate - 0.3;
                    break;
                }
            }
        }
        self asmsetanimationrate(animrate);
        waitframe(1);
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xfe0f4a84, Offset: 0x33c0
// Size: 0x44
function function_e9ad1736() {
    self endon(#"death");
    level waittill(#"endgame_intermission");
    self delete();
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x17a5ae88, Offset: 0x3410
// Size: 0x12c
function function_a7ec8007() {
    if (isdefined(level.var_be95a734)) {
        /#
            println("return");
        #/
        return level.var_be95a734;
    }
    /#
        println("<unknown string>");
    #/
    var_289d873a = [];
    var_552d0ef5 = getnode("escort_robot_path_start", "targetname");
    var_289d873a[var_289d873a.size] = var_552d0ef5.origin;
    while (isdefined(var_552d0ef5.target)) {
        var_552d0ef5 = getnode(var_552d0ef5.target, "targetname");
        var_289d873a[var_289d873a.size] = var_552d0ef5.origin;
    }
    if (isdefined(level.var_aac7424a)) {
        [[ level.var_aac7424a ]](var_289d873a);
    }
    return var_289d873a;
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0x61b22baa, Offset: 0x3548
// Size: 0xb8
function function_9c0c4127(var_e81a87b7, var_289d873a) {
    distance = 0;
    lastpoint = var_e81a87b7;
    for (i = 0; i < var_289d873a.size; i++) {
        distance = distance + distance(lastpoint, var_289d873a[i]);
        lastpoint = var_289d873a[i];
    }
    /#
        println("<unknown string>" + distance);
    #/
    return distance;
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0x56703e8c, Offset: 0x3608
// Size: 0x458
function function_bf9b418c(position, angles) {
    robot = spawnactor("spawner_bo3_robot_grunt_assault_mp_escort", position, angles, "", 1);
    robot.pathablematerial = robot.pathablematerial | 2;
    robot.enableterrainik = 1;
    robot ai::set_behavior_attribute("rogue_allow_pregib", 0);
    robot ai::set_behavior_attribute("rogue_allow_predestruct", 0);
    robot ai::set_behavior_attribute("rogue_control", "forced_level_2");
    robot ai::set_behavior_attribute("rogue_control_speed", level.var_bbac08e3);
    robot val::set(#"hash_40c2f18bb880e692", "ignoreall", 1);
    robot.allowdeath = 0;
    robot ai::set_behavior_attribute("can_become_crawler", 0);
    robot ai::set_behavior_attribute("can_be_meleed", 0);
    robot ai::set_behavior_attribute("can_initiateaivsaimelee", 0);
    robot ai::set_behavior_attribute("traversals", "procedural");
    aiutility::clearaioverridedamagecallbacks(robot);
    robot.active = 1;
    robot.var_3b78d9f5 = 1;
    robot.moving = 0;
    robot.var_4bd0d861 = 0;
    robot.propername = "";
    robot.ignoretriggerdamage = 1;
    robot.allowpain = 0;
    robot clientfield::set("robot_mind_control", 0);
    robot ai::set_behavior_attribute("robot_lights", 3);
    robot.pushable = 0;
    robot collidewithactors(1);
    robot pushplayer(1);
    robot setavoidancemask("avoid none");
    robot disableaimassist();
    robot setsteeringmode("slow steering");
    robot setblackboardattribute("_robot_locomotion_type", "alt1");
    if (level.var_a6ffdf8d) {
        aiutility::attachriotshield(robot, getweapon("riotshield"), "wpn_t7_shield_riot_world_lh", "tag_stowed_back");
    }
    robot asmsetanimationrate(1.1);
    if (isdefined(level.var_4bd0d861) && level.var_4bd0d861) {
        target_set(robot, vectorscale((0, 0, 1), 50));
    }
    robot.overrideactordamage = &function_47c9fa3c;
    robot thread function_a16b3a55();
    robot.missiletargetmissdistance = 64;
    robot thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile();
    return robot;
}

// Namespace escort/escort
// Params 12, eflags: 0x1 linked
// Checksum 0x6e7da46f, Offset: 0x3a68
// Size: 0x702
function function_47c9fa3c(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex) {
    if (!(isdefined(self.onground) && self.onground)) {
        return 0;
    }
    if (!isdefined(eattacker)) {
        return 0;
    }
    if (level.var_4bd0d861 <= 0 || !self.active || eattacker.team == game.attackers) {
        return 0;
    }
    level.usestartspawns = 0;
    weapon_damage = killstreak_bundles::get_weapon_damage(level.var_25a81c62, level.var_4bd0d861, eattacker, weapon, smeansofdeath, idamage, idflags, undefined);
    if (!isdefined(weapon_damage)) {
        weapon_damage = idamage;
    }
    if (!weapon_damage) {
        return 0;
    }
    self.var_4bd0d861 = self.var_4bd0d861 + weapon_damage;
    self notify(#"hash_4786d33b29c15c8f");
    if (!isdefined(eattacker.var_d6b81efd)) {
        eattacker.var_d6b81efd = 0;
    }
    eattacker.var_d6b81efd = eattacker.var_d6b81efd + weapon_damage;
    if (self.var_4bd0d861 >= level.var_4bd0d861) {
        origin = (0, 0, 0);
        if (isplayer(eattacker)) {
            level thread popups::displayteammessagetoall(#"hash_6fd616c1d7988357", eattacker);
            level.robot recordgameeventnonplayer("robot_disabled");
            if (distance2dsquared(self.origin, level.var_e1f98cba.trigger.origin) < (level.var_e1f98cba.trigger.radius + 50) * (level.var_e1f98cba.trigger.radius + 50)) {
                scoreevents::processscoreevent(#"hash_55d9982c385962d2", eattacker, undefined, undefined);
            } else {
                scoreevents::processscoreevent(#"hash_d619fe1e6e3e8b9", eattacker, undefined, undefined);
            }
            [[ level.var_37d62931 ]](eattacker, 1);
            if (isdefined(eattacker.pers[#"disables"])) {
                eattacker.pers[#"disables"]++;
                eattacker.disables = eattacker.pers[#"disables"];
            }
            eattacker stats::function_bb7eedf0(#"disables", 1);
            eattacker recordgameevent("return");
            origin = eattacker.origin;
        }
        foreach (player in level.players) {
            if (player == eattacker || player.team == self.team || !isdefined(player.var_d6b81efd)) {
                continue;
            }
            damagepercent = player.var_d6b81efd / level.var_4bd0d861;
            if (damagepercent >= 0.5) {
                scoreevents::processscoreevent(#"hash_48e06d4b02042bfb", player, undefined, undefined);
            } else if (damagepercent >= 0.25) {
                scoreevents::processscoreevent(#"hash_48e3f04b0207406b", player, undefined, undefined);
            }
            player.var_d6b81efd = undefined;
        }
        bb::function_95a5b5c2("escort_shutdown", undefined, game.defenders, origin);
        self function_4e5bb046();
        if (isdefined(eattacker) && eattacker != self && isdefined(weapon)) {
            if (weapon.statname == #"planemortar") {
                if (!isdefined(eattacker.planemortarbda)) {
                    eattacker.planemortarbda = 0;
                }
                eattacker.planemortarbda++;
            } else if (weapon.statname == #"dart" || weapon.name == #"dart_turret") {
                if (!isdefined(eattacker.dartbda)) {
                    eattacker.dartbda = 0;
                }
                eattacker.dartbda++;
            } else if (weapon.name == #"straferun_rockets" || weapon.name == #"straferun_gun") {
                if (isdefined(eattacker.straferunbda)) {
                    eattacker.straferunbda++;
                }
            } else if (weapon.statname == #"remote_missile_missile" || weapon.name == #"remote_missile_bomblet") {
                if (!isdefined(eattacker.remotemissilebda)) {
                    eattacker.remotemissilebda = 0;
                }
                eattacker.remotemissilebda++;
            }
        }
    }
    self.health = self.health + 1;
    return 1;
}

// Namespace escort/escort
// Params 12, eflags: 0x1 linked
// Checksum 0x5709520b, Offset: 0x4178
// Size: 0x66
function function_6810f6d7(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex) {
    return 0;
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xbdff85d8, Offset: 0x41e8
// Size: 0x154
function function_4e5bb046() {
    self.active = 0;
    self val::set(#"hash_3de2bce887b7b68d", "ignoreme", 1);
    self.var_3b78d9f5 = 0;
    self function_92cafff7();
    self notify(#"hash_19b6c6cf9dfb51ca");
    if (target_istarget(self)) {
        target_remove(self);
    }
    if (isdefined(self.riotshield)) {
        self asmchangeanimmappingtable(1);
        self detach(self.riotshield.model, self.riotshield.tag);
        aiutility::attachriotshield(self, getweapon("riotshield"), "wpn_t7_shield_riot_world_lh", "tag_weapon_left");
    }
    self ai::set_behavior_attribute("shutdown", 1);
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x5bfb0414, Offset: 0x4348
// Size: 0x1aa
function function_f31ccd44() {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"hash_19b6c6cf9dfb51ca");
    level endon(#"game_ended");
    self.active = 1;
    self.var_4bd0d861 = 0;
    self val::reset(#"hash_3de2bce887b7b68d", "ignoreme");
    self notify(#"hash_2b6b3dbde7859981");
    if (isdefined(level.var_4bd0d861) && level.var_4bd0d861) {
        target_set(self, vectorscale((0, 0, 1), 50));
    }
    if (isdefined(self.riotshield)) {
        self asmchangeanimmappingtable(0);
        self detach(self.riotshield.model, self.riotshield.tag);
        aiutility::attachriotshield(self, getweapon("riotshield"), "wpn_t7_shield_riot_world_lh", "tag_stowed_back");
    }
    self ai::set_behavior_attribute("shutdown", 0);
    wait(getanimlength(#"hash_2202ec85f2325d29"));
    if (isdefined(self)) {
        self.var_3b78d9f5 = 1;
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xa5f43fe3, Offset: 0x4500
// Size: 0xb4
function function_cd983806() {
    if (self.active == 0 || self.moving || !isdefined(self.pathindex)) {
        return;
    }
    if (self function_bbd6a5a8()) {
        return;
    }
    if (gettime() < (isdefined(self.var_5b6b68f2) ? self.var_5b6b68f2 : 0)) {
        return;
    }
    self notify(#"hash_357c0d12046b0ee6");
    self.moving = 1;
    self function_7292b417();
    self thread function_48d5a5d5();
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xb87cc974, Offset: 0x45c0
// Size: 0x1ce
function function_ba95878f() {
    level endon(#"game_ended");
    while (1) {
        if (self.moving) {
            distance = 0;
            if (self.pathindex > 0) {
                distance = distance + distance(level.var_234c4109, self.var_289d873a[0]);
                for (i = 1; i < self.pathindex; i++) {
                    distance = distance + distance(self.var_289d873a[i - 1], self.var_289d873a[i]);
                }
                distance = distance + distance(self.var_289d873a[self.pathindex - 1], self.origin);
            } else {
                distance = distance + distance(level.var_234c4109, self.origin);
            }
            if (distance > self.distancetraveled) {
                self.distancetraveled = distance;
                var_14b14914 = distance / level.var_e02589eb;
                if (var_14b14914 < 0) {
                    var_14b14914 = 0;
                } else if (var_14b14914 > 1) {
                    var_14b14914 = 1;
                }
                level clientfield::set_world_uimodel("Escort.robotProgress", var_14b14914);
            }
        }
        waitframe(1);
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xd1ed009c, Offset: 0x4798
// Size: 0x2c
function function_7de71781() {
    return isdefined(self.var_e301f36f) ? self.var_e301f36f : self.var_289d873a[self.pathindex];
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x144819d5, Offset: 0x47d0
// Size: 0xfe
function function_b237dbdc(var_475bafcd) {
    if (isdefined(self.var_e301f36f)) {
        return 0;
    }
    distsqr = distancesquared(var_475bafcd, self.origin);
    var_5a97a250 = distsqr <= 24 * 24;
    if (var_5a97a250) {
        var_8b664227 = distancesquared(var_475bafcd, self.var_289d873a[self.pathindex]) > 1 * 1;
        if (var_8b664227) {
            var_c42e0921 = self function_71dde260(self.origin, self.var_289d873a[self.pathindex]);
            if (var_c42e0921) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x10be8693, Offset: 0x48d8
// Size: 0x1bc
function function_bbd6a5a8() {
    if (!self.var_3b78d9f5) {
        return 0;
    }
    if (gettime() < (isdefined(self.var_5b6b68f2) ? self.var_5b6b68f2 : 0)) {
        wait(float(self.var_5b6b68f2 - gettime()) / 1000);
    }
    var_475bafcd = self function_da79711f();
    var_12dabaab = self.pathindex > 0 && !isdefined(self.var_e301f36f) ? self.var_289d873a[self.pathindex - 1] : self.origin;
    if (self.var_2db651d0 || self function_b237dbdc(var_475bafcd) || self function_71dde260(var_12dabaab, var_475bafcd)) {
        self.var_2db651d0 = 0;
        var_48a86177 = 1;
        var_32994cfd = self function_3135a437(var_475bafcd);
        if (var_32994cfd) {
            var_48a86177 = self function_71dde260(var_12dabaab, var_475bafcd);
            if (var_48a86177) {
                self.var_5b6b68f2 = gettime() + 200;
                self function_92cafff7();
            }
        } else {
            self function_626f279();
        }
        return var_48a86177;
    }
    return 0;
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x6c90ac71, Offset: 0x4aa0
// Size: 0x10c
function function_626f279() {
    pathgoal = self.var_289d873a[self.pathindex];
    var_c8faa89b = self.origin;
    /#
        function_2ad70da6(pathgoal);
    #/
    var_424dcc0a = function_32cc17ce(vectorlerp(var_c8faa89b, pathgoal, 0.5));
    while (self function_71dde260(var_c8faa89b, var_424dcc0a)) {
        var_424dcc0a = function_32cc17ce(vectorlerp(var_c8faa89b, var_424dcc0a, 0.5));
    }
    self.var_e301f36f = var_424dcc0a;
    /#
        function_6890a094(self.var_e301f36f);
    #/
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0xcf29374a, Offset: 0x4bb8
// Size: 0xba
function function_71dde260(var_12dabaab, goal) {
    var_10963261 = self calcapproximatepathtoposition(goal);
    var_a845a835 = min(distance(self.origin, goal), distance(var_12dabaab, goal));
    var_97040bb7 = function_4d0baea8(var_10963261, var_a845a835 * 2.5);
    return var_97040bb7;
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x82b6ef74, Offset: 0x4c80
// Size: 0x13a
function function_d1a2b84b(goal) {
    self notify(#"hash_32cec95ad713789a");
    self endon(#"hash_32cec95ad713789a", #"hash_aca1ee8e85e3f39", #"goal");
    level endon(#"game_ended");
    var_43e45614 = 1e+09;
    while (1) {
        wait(0.1);
        if (isdefined(self.traversestartnode)) {
            self waittill(#"hash_255dc2e132c1a7e1");
            continue;
        }
        if (self asmistransdecrunning()) {
            continue;
        }
        if (!self.var_3b78d9f5) {
            continue;
        }
        var_b1dbd5b3 = distancesquared(self.origin, goal);
        if (var_b1dbd5b3 < var_43e45614) {
            var_43e45614 = var_b1dbd5b3;
        } else {
            self.var_2db651d0 = 1;
            self notify(#"hash_32ec5d1632ebe315");
        }
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xe1970396, Offset: 0x4dc8
// Size: 0x13e
function function_1355041() {
    self notify(#"hash_3ea08fca40d25910");
    self endon(#"hash_3ea08fca40d25910", #"hash_1e42b7cde9400998");
    level endon(#"game_ended");
    while (isdefined(self.traversestartnode)) {
        self waittill(#"hash_255dc2e132c1a7e1");
    }
    self.var_8fb3cca9 = 1;
    startpos = self.origin;
    var_4c0ed1c9 = 0;
    var_6dc2c2e3 = 0;
    while (self.moving) {
        wait(0.1);
        if (distancesquared(startpos, self.origin) < 1) {
            var_4c0ed1c9++;
        }
        if (var_4c0ed1c9 >= 2) {
            self.var_2db651d0 = 1;
            self notify(#"hash_32ec5d1632ebe315");
        }
        var_6dc2c2e3++;
        if (var_6dc2c2e3 >= 3) {
            break;
        }
    }
    self.var_8fb3cca9 = 0;
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xfd64c9a0, Offset: 0x4f10
// Size: 0x12e
function function_92cafff7() {
    if (!self.moving) {
        return;
    }
    if (isdefined(self.traversestartnode)) {
        self thread function_de7b7c31();
        return;
    }
    self.moving = 0;
    self.var_200757da = undefined;
    self.var_8fb3cca9 = 0;
    velocity = self getvelocity();
    var_1e202cb1 = velocity * 0.05;
    var_633cb6a9 = isdefined(getclosestpointonnavmesh(self.origin + var_1e202cb1, 48, 15)) ? getclosestpointonnavmesh(self.origin + var_1e202cb1, 48, 15) : self.origin;
    self setgoal(var_633cb6a9, 0);
    self notify(#"hash_aca1ee8e85e3f39");
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x58d53314, Offset: 0x5048
// Size: 0xe4
function function_de7b7c31() {
    self notify(#"hash_1791a09042310ba1");
    self endon(#"hash_1791a09042310ba1", #"death");
    self waittill(#"hash_255dc2e132c1a7e1");
    var_2cc818f7 = isdefined(level.var_171f17cc.numtouching[level.var_171f17cc.ownerteam]) ? level.var_171f17cc.numtouching[level.var_171f17cc.ownerteam] : 0;
    if (var_2cc818f7 < level.var_24b79196) {
        self function_92cafff7();
    } else {
        self function_cd983806();
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x89683cd0, Offset: 0x5138
// Size: 0x78
function function_f05d667f() {
    self endon(#"death");
    level endon(#"game_ended");
    while (1) {
        self waittill(#"hash_255dc2e132c1a7e1");
        if (!self.moving) {
            self setgoal(self.origin, 1);
        }
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x6370fe55, Offset: 0x51b8
// Size: 0x288
function function_48d5a5d5() {
    self endon(#"hash_aca1ee8e85e3f39", #"death");
    level endon(#"game_ended");
    while (1) {
        self waittill(#"goal", #"hash_32ec5d1632ebe315");
        if (!isdefined(self.var_8fb3cca9) || self.var_8fb3cca9 == 0) {
            self thread function_1355041();
        }
        if (distancesquared(self.origin, function_7de71781()) < 24 * 24) {
            self.pathindex = self.pathindex + (isdefined(self.var_e301f36f) ? 0 : 1);
            self.var_e301f36f = undefined;
        }
        while (self.pathindex < self.var_289d873a.size && distancesquared(self.origin, self.var_289d873a[self.pathindex]) < (48 + 1) * (48 + 1)) {
            self.pathindex++;
        }
        if (self.pathindex >= self.var_289d873a.size) {
            self.pathindex = undefined;
            self function_92cafff7();
            return;
        }
        if (self.pathindex + 1 >= self.var_289d873a.size) {
            otherteam = util::getotherteam(self.team);
            globallogic_audio::leader_dialog("sfgRobotCloseAttacker", self.team, undefined, "robot");
            globallogic_audio::leader_dialog("sfgRobotCloseDefender", otherteam, undefined, "robot");
        }
        if (self function_bbd6a5a8()) {
            self function_92cafff7();
        }
        function_7292b417();
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xf492130, Offset: 0x5448
// Size: 0x82
function function_da79711f() {
    var_424dcc0a = function_7de71781();
    var_1e3ed60 = getclosestpointonnavmesh(var_424dcc0a, 48, 15);
    if (!isdefined(var_1e3ed60)) {
        var_1e3ed60 = getclosestpointonnavmesh(var_424dcc0a, 96, 15);
    }
    return isdefined(var_1e3ed60) ? var_1e3ed60 : var_424dcc0a;
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x44882952, Offset: 0x54d8
// Size: 0x104
function function_32cc17ce(point) {
    var_1e3ed60 = getclosestpointonnavmesh(point, 48, 15);
    if (!isdefined(var_1e3ed60)) {
        var_1e3ed60 = getclosestpointonnavmesh(point, 96, 15);
    }
    if (!isdefined(var_1e3ed60)) {
        var_4d1b016a = 0;
        var_f887ec51 = point - vectorscale((0, 0, 1), 36);
        while (!isdefined(var_1e3ed60) && var_4d1b016a < 5) {
            var_1e3ed60 = getclosestpointonnavmesh(var_f887ec51, 48, 15);
            var_f887ec51 = var_f887ec51 - vectorscale((0, 0, 1), 36);
            var_4d1b016a++;
        }
    }
    return isdefined(var_1e3ed60) ? var_1e3ed60 : point;
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x3b842550, Offset: 0x55e8
// Size: 0x144
function function_7292b417(var_96a19edf = 0) {
    self.var_2db651d0 = 0;
    var_1e3ed60 = self function_da79711f();
    if (isdefined(var_1e3ed60)) {
        if (!isdefined(self.var_200757da) || distancesquared(var_1e3ed60, self.var_200757da) > 1) {
            self setgoal(var_1e3ed60, 0, 24);
            self thread function_d1a2b84b(var_1e3ed60);
            self.var_200757da = var_1e3ed60;
        }
    } else if (var_96a19edf < 3) {
        self function_626f279();
        self function_7292b417(var_96a19edf + 1);
    } else {
        self function_92cafff7();
    }
    /#
        function_e31bd066(var_1e3ed60);
    #/
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0xc761eaa3, Offset: 0x5738
// Size: 0xd8
function function_4d0baea8(var_289d873a&, var_a4c43ac5) {
    /#
        function_4d2f7bfd(var_289d873a);
    #/
    if (var_a4c43ac5 < 20) {
        var_a4c43ac5 = 20;
    }
    var_6dadca51 = 0;
    var_392eec6 = var_289d873a.size - 1;
    for (i = 0; i < var_392eec6; i++) {
        var_6dadca51 = var_6dadca51 + distance(var_289d873a[i], var_289d873a[i + 1]);
        if (var_6dadca51 >= var_a4c43ac5) {
            return 1;
        }
    }
    return 0;
}

// Namespace escort/escort
// Params 0, eflags: 0x0
// Checksum 0x8754ea49, Offset: 0x5818
// Size: 0x250
function function_b0693b2c() {
    /#
        level endon(#"game_ended");
        while (1) {
            if ((isdefined(getdvarint(#"hash_363f484622731b83", 0)) ? getdvarint(#"hash_363f484622731b83", 0) : 0) > 0) {
                if (isdefined(level.robot)) {
                    pathindex = (isdefined(getdvarint(#"hash_363f484622731b83", 0)) ? getdvarint(#"hash_363f484622731b83", 0) : 0) - 1;
                    var_d7d41ff1 = level.robot.var_289d873a[pathindex];
                    var_25dfa6bf = (0, 0, 0);
                    if (pathindex < level.robot.var_289d873a.size - 1) {
                        nextpoint = level.robot.var_289d873a[pathindex + 1];
                        var_25dfa6bf = vectortoangles(nextpoint - var_d7d41ff1);
                    }
                    level.robot forceteleport(var_d7d41ff1, var_25dfa6bf);
                    level.robot.pathindex = pathindex;
                    level.robot.var_e301f36f = undefined;
                    while (isdefined(self.traversestartnode)) {
                        waitframe(1);
                    }
                    level.robot function_92cafff7();
                    level.robot setgoal(level.robot.origin, 0);
                }
                setdvar(#"hash_363f484622731b83", 0);
            }
            wait(0.5);
        }
    #/
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x61d4c8ff, Offset: 0x5a70
// Size: 0x284
function function_268637ff() {
    self clientfield::set("escort_robot_burn", 1);
    clientfield::set("robot_mind_control_explosion", 1);
    self thread function_a5dc2514();
    if (randomint(100) >= 50) {
        gibserverutils::gibleftarm(self);
    } else {
        gibserverutils::gibrightarm(self);
    }
    gibserverutils::giblegs(self);
    gibserverutils::gibhead(self);
    self hide();
    velocity = self getvelocity() * 0.125;
    self startragdoll();
    self launchragdoll((velocity[0] + randomfloatrange(-20, 20), velocity[1] + randomfloatrange(-20, 20), randomfloatrange(60, 80)), "j_mainroot");
    playfxontag("destruct/fx8_safeguard_robot_exp", self, "tag_origin");
    if (target_istarget(self)) {
        target_remove(self);
    }
    physicsexplosionsphere(self.origin, 200, 1, 1, 1, 1);
    radiusdamage(self.origin, 200, 1, 1, undefined, "MOD_EXPLOSIVE");
    playrumbleonposition("grenade_rumble", self.origin);
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x5bc3d52, Offset: 0x5d00
// Size: 0x7c
function function_a5dc2514() {
    level endon(#"game_ended");
    archetype = self.archetype;
    waitresult = undefined;
    waitresult = self waittill(#"actor_corpse");
    waitresult.corpse clientfield::set("escort_robot_burn", 1);
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0x1958533, Offset: 0x5d88
// Size: 0x78
function function_a16b3a55() {
    level endon(#"game_ended");
    while (1) {
        if (self.moving) {
            self playsoundontag("vox_robot_chatter", "J_Head");
        }
        wait(randomfloatrange(1.5, 2.5));
    }
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0x559dfdb9, Offset: 0x5e08
// Size: 0x1fe
function function_b3d560f2(robot, var_b2950fe9) {
    trigger = getent(var_b2950fe9, "targetname");
    useobj = gameobjects::create_use_object(game.attackers, trigger, [], (0, 0, 0), #"hash_40c2f18bb880e692");
    useobj gameobjects::set_objective_entity(robot);
    useobj gameobjects::allow_use(#"none");
    useobj gameobjects::set_visible_team(#"any");
    useobj gameobjects::set_use_time(0);
    trigger enablelinkto();
    trigger linkto(robot);
    useobj.onuse = &function_496d2c26;
    useobj.var_df79c725 = &function_3a2a93b8;
    useobj.robot = robot;
    if (isdefined(level.var_da151a47)) {
        if (!isdefined(useobj.exclusions)) {
            useobj.exclusions = [];
        }
        foreach (trigger in level.var_da151a47) {
            useobj.exclusions[useobj.exclusions.size] = trigger;
        }
    }
    return useobj;
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x313783f, Offset: 0x6010
// Size: 0x12c
function function_496d2c26(player) {
    level.usestartspawns = 0;
    if (self.robot.moving || !self.robot.active || self.numtouching[self.ownerteam] < level.var_24b79196) {
        return;
    }
    if (!isdefined(level.var_113c8efc)) {
        level.var_113c8efc = 0;
    }
    if (gettime() - int(5 * 1000) >= level.var_113c8efc) {
        level thread popups::displayteammessagetoteam(#"hash_752379b18bb66bd5", player, player.team, undefined, undefined);
        level.var_113c8efc = gettime();
    }
    self thread function_15c491b5();
    self.robot function_cd983806();
}

// Namespace escort/escort
// Params 3, eflags: 0x1 linked
// Checksum 0x8107abbd, Offset: 0x6148
// Size: 0x64
function function_3a2a93b8(team, progress, change) {
    var_2cc818f7 = self.numtouching[self.ownerteam];
    if (var_2cc818f7 < level.var_24b79196) {
        self.robot function_92cafff7();
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xfbf7cab8, Offset: 0x61b8
// Size: 0x122
function function_15c491b5() {
    level endon(#"game_ended");
    self.robot endon(#"hash_aca1ee8e85e3f39");
    while (1) {
        foreach (touch in self.touchlist[self.team]) {
            if (!isdefined(touch) || !isdefined(touch.player)) {
                continue;
            }
            if (!(isdefined(touch.player.var_838ecd80) && touch.player.var_838ecd80)) {
                self thread function_6d5b85e9(touch.player);
            }
        }
        waitframe(1);
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x9aa136c3, Offset: 0x62e8
// Size: 0x25c
function function_6d5b85e9(player) {
    level endon(#"game_ended");
    player endon(#"death");
    self.robot endon(#"hash_19b6c6cf9dfb51ca");
    player.var_838ecd80 = 1;
    player recordgameevent("player_escort_start");
    self thread function_b8c52342(player);
    self thread function_3156a0df(player);
    var_4cee6018 = 0;
    while (1) {
        wait(1);
        touching = 0;
        foreach (touch in self.touchlist[self.team]) {
            if (touch.player == player) {
                touching = 1;
                break;
            }
        }
        if (!touching) {
            break;
        }
        if (isdefined(player.pers[#"escorts"])) {
            player.pers[#"escorts"]++;
            player.escorts = player.pers[#"escorts"];
        }
        player stats::function_bb7eedf0(#"escorts", 1);
        var_4cee6018++;
        if (var_4cee6018 % 3 == 0) {
            scoreevents::processscoreevent(#"hash_545259529b693147", player, undefined, undefined);
        }
    }
    if (isdefined(player)) {
        player function_2ab82db2();
    }
}

// Namespace escort/escort
// Params 0, eflags: 0x1 linked
// Checksum 0xaad0291c, Offset: 0x6550
// Size: 0x3e
function function_2ab82db2() {
    self.var_838ecd80 = 0;
    self recordgameevent("player_escort_stop");
    self notify(#"hash_54aff7a581aa8c5d");
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x63c81791, Offset: 0x6598
// Size: 0x84
function function_b8c52342(player) {
    level endon(#"game_ended");
    player endon(#"hash_54aff7a581aa8c5d", #"disconnect");
    player waittill(#"death");
    if (isdefined(player)) {
        player thread function_2ab82db2();
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x70d5d883, Offset: 0x6628
// Size: 0x74
function function_3156a0df(player) {
    level endon(#"game_ended");
    player endon(#"hash_54aff7a581aa8c5d");
    self.robot waittill(#"hash_19b6c6cf9dfb51ca");
    if (isdefined(player)) {
        player thread function_2ab82db2();
    }
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0xec26e1df, Offset: 0x66a8
// Size: 0x5c
function function_9d7e4873(robot, var_b2950fe9) {
    trigger = getent(var_b2950fe9, "targetname");
    if (isdefined(trigger)) {
        trigger delete();
    }
}

// Namespace escort/escort
// Params 2, eflags: 0x1 linked
// Checksum 0x31ba0d65, Offset: 0x6710
// Size: 0x1b8
function function_c2fb1ec0(robot, var_b2950fe9) {
    trigger = getent(var_b2950fe9, "targetname");
    if (isdefined(game.var_69b0dc87)) {
        trigger = spawn("trigger_radius_new", game.var_69b0dc87);
        trigger.radius = 120;
    }
    useobj = gameobjects::create_use_object(game.defenders, trigger, [], (0, 0, 0), #"hash_69cae90a25032311");
    useobj gameobjects::set_visible_team(#"any");
    useobj gameobjects::allow_use(#"none");
    useobj gameobjects::set_use_time(0);
    fwd = (0, 0, 1);
    right = (0, -1, 0);
    useobj.fx = spawnfx("ui/fx_dom_marker_team_r120", trigger.origin, fwd, right);
    useobj.fx.team = game.defenders;
    triggerfx(useobj.fx, 0.001);
    useobj thread function_7f386b7d(robot);
    return useobj;
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x28dbd06b, Offset: 0x68d0
// Size: 0x370
function function_7f386b7d(robot) {
    robot endon(#"death");
    level endon(#"game_ended");
    radiussq = self.trigger.radius * self.trigger.radius;
    while (1) {
        if (robot.moving === 1 && distance2dsquared(self.trigger.origin, robot.origin) < radiussq) {
            level.var_24b79196 = 0;
            robot.overrideactordamage = &function_6810f6d7;
            if (target_istarget(self)) {
                target_remove(self);
            }
            attackers = game.attackers;
            self.fx.team = attackers;
            foreach (player in level.aliveplayers[attackers]) {
                if (isdefined(player.var_838ecd80) && player.var_838ecd80) {
                    scoreevents::processscoreevent(#"hash_4a1a7bd94721191b", player, undefined, undefined);
                    [[ level.var_37d62931 ]](player, 1);
                    var_6913cac0 = player stats::get_stat(#"playerstatslist", #"hash_69b694eed7150881", #"statvalue") + 1;
                    player stats::set_stat(#"playerstatslist", #"hash_69b694eed7150881", #"statvalue", var_6913cac0);
                }
            }
            level.robot recordgameeventnonplayer("robot_reached_objective");
            setgameendtime(0);
            robot val::set(#"hash_40c2f18bb880e692", "ignoreme", 1);
            robot thread function_cd24840b(1);
            globallogic_score::giveteamscoreforobjective(attackers, 1);
            round::set_winner(attackers);
            level thread globallogic::end_round(1);
            return;
        }
        waitframe(1);
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0xf853065b, Offset: 0x6c48
// Size: 0x3c
function function_cd24840b(wait_time) {
    robot = self;
    wait(wait_time);
    if (isdefined(robot)) {
        robot function_268637ff();
    }
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0xb3d38924, Offset: 0x6c90
// Size: 0x4ec
function function_3135a437(goal) {
    self endon(#"hash_3541570614886e6a");
    self.disablefinalkillcam = 1;
    var_f0594989 = vectornormalize(goal - self.origin);
    var_729e366c = 0;
    var_ac1b6e90 = undefined;
    var_2227837c = -1e+09;
    /#
        function_7b6e70ee(self.origin, 108);
    #/
    entities = getdamageableentarray(self.origin, 108);
    foreach (entity in entities) {
        if (isplayer(entity)) {
            continue;
        }
        if (entity == self) {
            continue;
        }
        if (entity.classname == "grenade") {
            continue;
        }
        if (!isalive(entity)) {
            continue;
        }
        var_78e6fc5e = vectordot(var_f0594989, entity.origin - self.origin);
        if (var_78e6fc5e > var_2227837c) {
            var_ac1b6e90 = entity;
            var_2227837c = var_78e6fc5e;
        }
    }
    if (isdefined(var_ac1b6e90)) {
        entity = var_ac1b6e90;
        if (isdefined(entity.targetname)) {
            if (entity.targetname == "talon") {
                entity notify(#"death");
                return 1;
            }
        }
        if (isdefined(entity.helitype) && entity.helitype == "qrdrone") {
            watcher = entity.owner weaponobjects::getweaponobjectwatcher("qrdrone");
            watcher thread weaponobjects::waitanddetonate(entity, 0, undefined);
            return 1;
        }
        if (entity.classname == "auto_turret") {
            if (!isdefined(entity.damagedtodeath) || !entity.damagedtodeath) {
                entity util::domaxdamage(self.origin + (0, 0, 1), self, self, 0, "MOD_CRUSH");
            }
            return 1;
        }
        if (isvehicle(entity) && (!isdefined(entity.team) || entity.team != #"neutral")) {
            if (!(isdefined(entity.magic_bullet_shield) && entity.magic_bullet_shield)) {
                entity kill();
            }
            return 1;
        }
        if (entity.team === self.team && entity.item.name === #"ability_smart_cover") {
            entity smart_cover::function_2a494565(0);
            return 1;
        }
        if (entity.team === self.team && entity.item.name === #"eq_concertina_wire") {
            entity concertina_wire::function_4ee7d46a(0);
            return 1;
        }
        entity dodamage(entity.health * 2, self.origin + (0, 0, 1), self, self, 0, "MOD_CRUSH");
        var_729e366c = 1;
    }
    var_729e366c = var_729e366c || self function_d3cfb9db(var_f0594989);
    return var_729e366c;
}

// Namespace escort/escort
// Params 1, eflags: 0x1 linked
// Checksum 0x2529d63b, Offset: 0x7188
// Size: 0x1b4
function function_d3cfb9db(var_f0594989) {
    var_f512e31d = getentarray("care_package", "script_noteworthy");
    var_2aa6783b = undefined;
    var_b230f625 = -1e+09;
    foreach (crate in var_f512e31d) {
        if (distancesquared(crate.origin, self.origin) > 108 * 108) {
            continue;
        }
        var_69535e8a = vectordot(var_f0594989, crate.origin - self.origin);
        if (var_69535e8a > var_b230f625) {
            var_2aa6783b = crate;
            var_b230f625 = var_69535e8a;
        }
    }
    if (isdefined(var_2aa6783b)) {
        playfx(level._supply_drop_explosion_fx, var_2aa6783b.origin);
        playsoundatposition(#"wpn_grenade_explode", var_2aa6783b.origin);
        wait(0.1);
        var_2aa6783b supplydrop::cratedelete();
        return 1;
    }
    return 0;
}

