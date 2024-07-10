#using scripts\killstreaks\ai_tank_shared.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_prophet_tutorial.gsc;
#using scripts\mp_common\gametypes\ct_core.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\mp_common\gametypes\ct_ai.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace ct_prophet;

// Namespace ct_prophet/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x28e3c08a, Offset: 0x1e0
// Size: 0x2ec
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    level.select_character = ct_utils::get_roleindex(#"prt_mp_technomancer");
    level.var_820c5561 = "PROPHET";
    ct_utils::function_be3a76b7(level.var_820c5561);
    level.var_d6d98fbe = 0;
    level.debugbots = 0;
    ct_core::function_fa03fc55();
    level.var_4c2ecc6f = &function_6db6572b;
    level.var_c01b7f8b = &function_ba542258;
    level.var_49240db3 = &function_b89106ad;
    level.var_8b9d690e = &function_cf3224fe;
    level.onspawnplayer = &function_7c4ef26b;
    player::function_cf3aa03d(&function_9d65db70);
    level.var_cdb8ae2c = &ct_utils::function_a8da260c;
    level.resurrect_override_spawn = &ct_utils::function_78469779;
    level.var_e31c5d7a = &ct_bots::function_e31c5d7a;
    callback::on_game_playing(&ct_core::function_1e84c767);
    globallogic_spawn::addsupportedspawnpointtype("ct");
    ct_utils::function_6046a5e3(#"ar_accurate_t8", array("reddot", "grip", "grip2", "steadyaim"));
    ct_utils::function_c3e647e2(#"pistol_standard_t8");
    level flag::init("mission_success");
    level flag::init("mission_failed");
    level flag::init("enemy_group_defeated");
    level flag::init("combat_training_started");
    level.var_9bf1e805 = &ct_prophet_tutorial::function_9bf1e805;
    if (level.ctdifficulty == 0) {
        level ct_prophet_tutorial::init();
    }
}

// Namespace ct_prophet/ct_prophet
// Params 1, eflags: 0x0
// Checksum 0x3cd542eb, Offset: 0x4d8
// Size: 0x1f0
function function_7c4ef26b(predictedspawn) {
    if (level.ctdifficulty == 0) {
        self ct_prophet_tutorial::function_c9ff0dce();
        return;
    }
    setdvar(#"custom_killstreak_mode", 2);
    setdvar(#"custom_killstreak1", level.killstreakindices[#"uav"]);
    setdvar(#"custom_killstreak2", level.killstreakindices[#"satellite"]);
    setdvar(#"custom_killstreak3", level.killstreakindices[#"remote_missile"]);
    self thread ct_core::function_d2845186();
    spawning::onspawnplayer(predictedspawn);
    if (self.team == #"allies") {
        if (!(isdefined(level.var_f0e1e497) && level.var_f0e1e497)) {
            self thread function_1c8a3d23();
        }
        self thread function_ca179a0c();
    } else {
        self thread function_680a694b();
    }
    if (isbot(self)) {
        if (isdefined(level.var_e31c5d7a)) {
            self [[ level.var_e31c5d7a ]]();
        }
    }
}

// Namespace ct_prophet/ct_prophet
// Params 9, eflags: 0x0
// Checksum 0xc925debe, Offset: 0x6d0
// Size: 0x13c
function function_9d65db70(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (level.ctdifficulty == 0) {
        self ct_prophet_tutorial::function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        return;
    }
    if (self.team == #"allies") {
        self thread ct_utils::function_ee4639dd(-10);
        return;
    }
    if (isdefined(weapon) && weapon == getweapon(#"shock_rifle")) {
        e_player = getplayers()[0];
        e_player thread ct_utils::function_d471f8fa(10);
    }
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0xf3fb0a5, Offset: 0x818
// Size: 0x12
function function_6db6572b() {
    level.var_e6db911d = 1;
}

// Namespace ct_prophet/ct_prophet
// Params 1, eflags: 0x0
// Checksum 0xde1a921, Offset: 0x838
// Size: 0x10e
function function_ba542258(mode) {
    level flag::clear("mission_success");
    level flag::clear("mission_failed");
    level flag::clear("enemy_group_defeated");
    level flag::clear("times_up");
    if (isdefined(level.var_1ecfe3a2)) {
        self.var_71a70093 = level.var_1ecfe3a2;
    }
    self thread ct_gadgets::function_19181566();
    self loadout::function_cdb86a18();
    var_61ca8276 = 420000;
    self function_9270ab93(0, var_61ca8276);
    level.var_f0e1e497 = undefined;
}

// Namespace ct_prophet/ct_prophet
// Params 2, eflags: 0x0
// Checksum 0xb2d9b7a7, Offset: 0x950
// Size: 0x224
function function_9270ab93(var_db89c655, var_27875ecd) {
    var_e7cc5e43 = [];
    var_e7cc5e43[#"mp_frenetic"][1] = 240000;
    var_e7cc5e43[#"mp_frenetic"][2] = 180000;
    var_e7cc5e43[#"mp_frenetic"][3] = 120000;
    var_e7cc5e43[#"mp_offshore"][1] = 240000;
    var_e7cc5e43[#"mp_offshore"][2] = 180000;
    var_e7cc5e43[#"mp_offshore"][3] = 120000;
    var_e7cc5e43[#"mp_seaside"][1] = 240000;
    var_e7cc5e43[#"mp_seaside"][2] = 180000;
    var_e7cc5e43[#"mp_seaside"][3] = 120000;
    var_e7cc5e43[#"mp_silo"][1] = 240000;
    var_e7cc5e43[#"mp_silo"][2] = 180000;
    var_e7cc5e43[#"mp_silo"][3] = 120000;
    str_map = hash(getrootmapname());
    ct_utils::function_7a21ac57(var_db89c655, var_27875ecd, var_e7cc5e43[str_map][1], var_e7cc5e43[str_map][2], var_e7cc5e43[str_map][3]);
}

// Namespace ct_prophet/ct_prophet
// Params 1, eflags: 0x0
// Checksum 0x3e70cb10, Offset: 0xb80
// Size: 0x100
function function_b89106ad(gamedifficulty) {
    level endon(#"combattraining_logic_finished");
    if (gamedifficulty != 0) {
        self ct_utils::objcounter_init(#"hash_f132b2ca7bae8be", 0, 3, 1);
    }
    level notify(#"hash_2a473e02881ca991");
    level.usingscorestreaks = 0;
    level.disablescoreevents = 1;
    level.disablemomentum = 1;
    if (gamedifficulty == 0) {
        ct_prophet_tutorial::function_9b9525e9();
    } else {
        j_fore_le_01();
    }
    level notify(#"combattraining_logic_finished", {#success:1});
}

// Namespace ct_prophet/ct_prophet
// Params 1, eflags: 0x0
// Checksum 0x24bff597, Offset: 0xc88
// Size: 0x4e
function function_cf3224fe(b_success) {
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    var_cd803a6b = gettime();
    return var_cd803a6b;
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0x897662ce, Offset: 0xce0
// Size: 0x280
function j_fore_le_01() {
    level endon(#"combattraining_logic_finished");
    level thread ct_utils::function_1db91571();
    level thread ct_utils::function_289b4b9f(#"hash_2ef12070900a4e87", 5, 15, "stop_seeker_nag", &function_b80b4832);
    n_bomb_timer = int(gettime() + 1000 + int((180 - 1) * 1000));
    setmatchflag("bomb_timer_a", 1);
    setbombtimer("A", n_bomb_timer);
    level.var_cbcb0078 = 1;
    level flag::clear("times_up");
    level.var_8db5b490 = 0;
    while (level.var_8db5b490 < 3) {
        level flag::clear("enemy_group_defeated");
        function_f1e4097d();
        if (level flag::get("mission_success") || level flag::get("mission_failed")) {
            break;
        }
        e_player = getplayers()[0];
        e_player thread ct_utils::function_785eb2ca();
        waitframe(1);
        level.var_8db5b490++;
    }
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    if (level flag::get("mission_failed")) {
        wait(0.1);
        level notify(#"combattraining_logic_finished", {#success:0});
    }
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0x5e05bafe, Offset: 0xf68
// Size: 0x142
function function_f1e4097d() {
    level thread intro_msg();
    level.var_a62b1ae0 = getnode("nd_enemy_group_" + level.var_8db5b490 + 1, "targetname");
    level thread function_671e5ede();
    while (true) {
        if (!level.var_cbcb0078 && level flag::get("times_up")) {
            level flag::set("mission_failed");
        }
        if (level flag::get("enemy_group_defeated")) {
            break;
        }
        if (level flag::get("mission_success") || level flag::get("mission_failed")) {
            break;
        }
        waitframe(1);
    }
    level.var_a62b1ae0 = undefined;
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0xd5d619b9, Offset: 0x10b8
// Size: 0x3cc
function function_671e5ede() {
    level.var_394c5463 = 1;
    var_e8d6f89 = 3 + level.var_8db5b490;
    level thread ct_bots::activate_bots(var_e8d6f89, #"axis");
    var_468ef41 = level.var_8db5b490;
    if (var_468ef41) {
        level thread function_544df02a(1, level.var_a62b1ae0.origin);
    }
    wait(1);
    var_2f41d654 = 1;
    while (var_2f41d654) {
        a_bots = ct_bots::function_fbe3dcbb();
        foreach (bot in a_bots) {
            if (bot.team == #"axis") {
                if (isdefined(bot.canseeplayer) && bot.canseeplayer) {
                    var_2f41d654 = 0;
                    break;
                }
            }
        }
        if (!(isdefined(level.var_394c5463) && level.var_394c5463)) {
            break;
        }
        e_player = getplayers()[0];
        n_dist = distance(e_player.origin, level.var_a62b1ae0.origin);
        if (n_dist <= 500) {
            if (e_player ct_utils::can_see(level.var_a62b1ae0.origin, 0)) {
                break;
            }
        }
        waitframe(1);
    }
    level.var_394c5463 = 0;
    waypoint = ct_utils::create_waypoint(#"hash_14f53e0433721169", level.var_a62b1ae0.origin, (0, 0, 0), #"any", undefined, 0, undefined);
    level thread ct_utils::function_bfa522d1(0);
    level thread function_3e3366eb();
    level.var_cbcb0078 = 0;
    while (true) {
        if (level flag::get("times_up")) {
            level flag::set("mission_failed");
            break;
        }
        a_ai = getaiarray();
        var_9f8e943 = ct_utils::function_4a23fd2b();
        if (!var_9f8e943 && a_ai.size == 0) {
            level flag::set("enemy_group_defeated");
            break;
        }
        waitframe(1);
    }
    level.var_cbcb0078 = 1;
    waypoint gameobjects::set_visible_team("none");
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0xdbcd54ad, Offset: 0x1490
// Size: 0xbc
function function_ca179a0c() {
    if (isdefined(level.var_a62b1ae0)) {
        var_bfdeaeb8 = getnodearray("nd_prophet_player_start_" + level.var_8db5b490 + 1, "targetname");
        var_bfdeaeb8 = array::randomize(var_bfdeaeb8);
        var_f34999b8 = var_bfdeaeb8[0];
        self setorigin(var_f34999b8.origin);
        self setplayerangles(var_f34999b8.angles);
    }
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0xd7f9d305, Offset: 0x1558
// Size: 0x3c
function function_680a694b() {
    if (isdefined(level.var_394c5463) && level.var_394c5463) {
        self thread function_dd1fa6e7();
    }
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0xb2938e0b, Offset: 0x15a0
// Size: 0xf4
function function_dd1fa6e7() {
    if (!isdefined(level.var_a62b1ae0)) {
        return;
    }
    self setorigin(level.var_a62b1ae0.origin);
    self setplayerangles(level.var_a62b1ae0.angles);
    n_goal_radius = 400;
    if (isdefined(level.var_a62b1ae0.radius) && level.var_a62b1ae0.radius > 100) {
        n_goal_radius = level.var_a62b1ae0.radius;
    }
    self ct_utils::function_5b59f3b7(level.var_a62b1ae0.origin, level.var_a62b1ae0.angles, n_goal_radius);
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0x6f45b53d, Offset: 0x16a0
// Size: 0x4e
function function_1c8a3d23() {
    self endon(#"death");
    self waittill(#"hash_225857690f87699b");
    level notify(#"stop_seeker_nag");
    level.var_f0e1e497 = 1;
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0x3a20759b, Offset: 0x16f8
// Size: 0x6
function function_b80b4832() {
    return false;
}

// Namespace ct_prophet/ct_prophet
// Params 2, eflags: 0x0
// Checksum 0x489a8608, Offset: 0x1708
// Size: 0xb6
function function_544df02a(var_468ef41, var_8b84b3ce) {
    while (var_468ef41 > 0) {
        robot = ct_ai::function_4c8f915a(var_8b84b3ce);
        ai_tank::function_9b13ebf(robot);
        robot.goalradius = 900;
        robot setgoal(var_8b84b3ce);
        robot.health = 350;
        robot.overridevehicledamage = &function_e1086742;
        var_468ef41--;
        waitframe(1);
    }
}

// Namespace ct_prophet/ct_prophet
// Params 15, eflags: 0x0
// Checksum 0x4e46488f, Offset: 0x17c8
// Size: 0x7e
function function_e1086742(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    return false;
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0x70d2cc0a, Offset: 0x1850
// Size: 0x54
function intro_msg() {
    e_player = getplayers()[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_2ef12070900a4e87", 5, "green");
}

// Namespace ct_prophet/ct_prophet
// Params 0, eflags: 0x0
// Checksum 0x21eba194, Offset: 0x18b0
// Size: 0x5c
function function_3e3366eb() {
    e_player = getplayers()[0];
    e_player ct_utils::function_329f9ba6(#"hash_3ccd3d10d2142048", 5, "green", 2);
}

