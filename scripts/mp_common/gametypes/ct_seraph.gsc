// Atian COD Tools GSC decompiler test
#using scripts\mp_common\gametypes\ct_ai.gsc;
#using scripts\mp_common\player\player_utils.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_seraph_tutorial.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_core.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\killstreaks\ai_tank_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawnbeacon_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_20a30e3aaa7368c9;

#namespace ct_seraph;

// Namespace ct_seraph/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x9c249ff6, Offset: 0x260
// Size: 0x3f4
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    level.var_e3049e92 = 1;
    level.var_7b05c4b5 = 0;
    level.var_dab73f4a = 1;
    clientfield::register("world", "spawn_vase", 1, 1, "counter");
    clientfield::register("clientuimodel", "hudItems.spawnSelectHidePrompt", 1, 1, "int");
    level.select_character = ct_utils::get_roleindex(#"prt_mp_enforcer");
    level.var_820c5561 = "SERAPH";
    ct_utils::function_be3a76b7(level.var_820c5561);
    level.var_d6d98fbe = 0;
    ct_core::function_fa03fc55();
    level.hardpoint_bar = luielembar_ct::register("hardpoint_bar");
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
    level flag::init("combat_training_started");
    level.var_7150ddcb = 0;
    ct_utils::function_6046a5e3(#"ar_modular_t8", array(#"reflex", #"suppressed", #"stalker", #"grip", #"quickdraw"));
    ct_utils::function_c3e647e2(#"pistol_standard_t8");
    level flag::init("mission_success");
    level flag::init("mission_failed");
    level flag::init("gamemode_started");
    level flag::init("hardpoint_active");
    level.var_b8701e49 = 100000;
    level.fx_warlord_igc_ = 0.45;
    if (level.ctdifficulty == 0) {
        level namespace_56b8c026::init();
    }
}

// Namespace ct_seraph/ct_seraph
// Params 1, eflags: 0x0
// Checksum 0x73baf071, Offset: 0x660
// Size: 0x25c
function function_7c4ef26b(predictedspawn) {
    self thread ct_core::function_d2845186();
    spawning::onspawnplayer(predictedspawn);
    if (level.ctdifficulty == 0) {
        self namespace_56b8c026::function_c9ff0dce();
        return;
    }
    if (self.team == #"allies") {
        if (!isbot(self)) {
            if (level flag::get("hardpoint_active")) {
                self thread function_5ccd53d5();
                beacon = function_ec9415a4();
                if (!isdefined(beacon)) {
                    level thread function_20bf9b40();
                }
            }
        } else {
            beacon = function_ec9415a4();
            if (isdefined(beacon)) {
                self setorigin(beacon.origin);
                self setplayerangles(beacon.angles);
            }
        }
    } else if (isdefined(level.var_6530e34f) && level.var_6530e34f) {
        var_fbd8f808 = function_1a67c935();
        self setorigin(var_fbd8f808.origin);
        self setplayerangles(var_fbd8f808.angles);
    }
    if (isbot(self)) {
        if (isdefined(level.var_e31c5d7a)) {
            self [[ level.var_e31c5d7a ]]();
        }
        if (self.team == #"axis") {
            if (level.var_7150ddcb < 5) {
                self thread function_5237d068();
            }
        }
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x7c8bd31d, Offset: 0x8c8
// Size: 0x6a
function function_ec9415a4() {
    e_player = getplayers()[0];
    beacon = e_player spawn_beacon::function_e9fea0ea();
    if (isdefined(beacon) && beacon.size > 0) {
        return beacon[0];
    }
    return undefined;
}

// Namespace ct_seraph/ct_seraph
// Params 9, eflags: 0x0
// Checksum 0x9ec9ee31, Offset: 0x940
// Size: 0xdc
function function_9d65db70(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (level.ctdifficulty == 0) {
        self namespace_56b8c026::function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration);
        return;
    }
    if (self.team == #"allies") {
        if (!isbot(self)) {
            self thread ct_utils::function_ee4639dd(5);
        }
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xfa14af95, Offset: 0xa28
// Size: 0x34
function function_6db6572b() {
    level.var_7a0aaea2 = 216000;
    /#
        level thread function_849be68a();
    #/
}

// Namespace ct_seraph/ct_seraph
// Params 1, eflags: 0x0
// Checksum 0x71bd0433, Offset: 0xa68
// Size: 0x176
function function_ba542258(mode) {
    level flag::clear("mission_success");
    level flag::clear("mission_failed");
    level flag::clear("gamemode_started");
    level flag::clear("hardpoint_active");
    level flag::clear("times_up");
    if (isdefined(level.var_1ecfe3a2)) {
        self.var_71a70093 = level.var_1ecfe3a2;
    }
    self thread ct_gadgets::function_19181566();
    var_61ca8276 = 420000;
    self function_9270ab93(0, var_61ca8276);
    self loadout::function_cdb86a18();
    if (level.ctdifficulty == 0) {
        namespace_56b8c026::setup();
        return;
    }
    ct_bots::function_a64b7003(1, 5);
    level.var_7c65ae0d = undefined;
}

// Namespace ct_seraph/ct_seraph
// Params 2, eflags: 0x0
// Checksum 0xc700c3e1, Offset: 0xbe8
// Size: 0x284
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
    var_e7cc5e43[#"mp_hacienda"][1] = 240000;
    var_e7cc5e43[#"mp_hacienda"][2] = 180000;
    var_e7cc5e43[#"mp_hacienda"][3] = 120000;
    str_map = hash(getrootmapname());
    ct_utils::function_7a21ac57(var_db89c655, var_27875ecd, var_e7cc5e43[str_map][1], var_e7cc5e43[str_map][2], var_e7cc5e43[str_map][3]);
}

// Namespace ct_seraph/ct_seraph
// Params 1, eflags: 0x0
// Checksum 0xbb4c6f80, Offset: 0xe78
// Size: 0xd0
function function_b89106ad(gamedifficulty) {
    level endon(#"combattraining_logic_finished");
    level notify(#"hash_2a473e02881ca991");
    level.usingscorestreaks = 0;
    level.disablescoreevents = 1;
    level.disablemomentum = 1;
    if (level.ctdifficulty == 0) {
        namespace_56b8c026::function_9b9525e9();
    } else {
        function_72e84e64();
    }
    level notify(#"combattraining_logic_finished", {#success:1});
}

// Namespace ct_seraph/ct_seraph
// Params 1, eflags: 0x0
// Checksum 0xf0b548db, Offset: 0xf50
// Size: 0x4e
function function_cf3224fe(b_success) {
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    var_cd803a6b = gettime();
    return var_cd803a6b;
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xe3c01d93, Offset: 0xfa8
// Size: 0x248
function function_72e84e64() {
    level endon(#"combattraining_logic_finished");
    level flag::set("gamemode_started");
    level.var_cbcb0078 = 1;
    level thread ct_utils::function_1db91571();
    level thread function_6c645ca4();
    level thread ct_utils::function_289b4b9f(#"hash_7f01e4dbd7d4b8df", undefined, 45, "stop_nag", &function_f99b3d06);
    level.var_115bb554 = 0;
    while (level.var_115bb554 < 3) {
        level flag::clear("times_up");
        level clientfield::set("area_arrows", level.var_115bb554 + 1);
        var_edc95125 = "vol_seraph_hardpoint_" + level.var_115bb554 + 1;
        function_1ca79c02(var_edc95125);
        if (level flag::get("mission_failed")) {
            break;
        }
        if (level.var_115bb554 + 1 < 3) {
            function_37adbd8f();
        }
        level.var_115bb554++;
    }
    level clientfield::set("area_arrows", 0);
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    if (level flag::get("mission_failed")) {
        wait(0.1);
        level notify(#"combattraining_logic_finished", {#success:0});
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xb5c36795, Offset: 0x11f8
// Size: 0xca
function function_37adbd8f() {
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    level clientfield::set("area_arrows", 0);
    level.var_7c65ae0d = undefined;
    level thread function_131ea9e1();
    level.var_e6db911d = 1;
    level.var_6a0c3e3e = 1;
    ct_bots::deactivate_bots();
    level thread ct_utils::function_bfa522d1(0);
    level.var_571c3787 = 1;
}

// Namespace ct_seraph/ct_seraph
// Params 1, eflags: 0x0
// Checksum 0x55b626c7, Offset: 0x12d0
// Size: 0x492
function function_1ca79c02(var_edc95125) {
    level.var_511a3f1c = getent(var_edc95125, "targetname");
    trace = bullettrace(level.var_511a3f1c.origin, level.var_511a3f1c.origin + vectorscale((0, 0, -1), 1000), 0, self);
    level.var_4d47c040 = trace[#"position"];
    level thread function_20bf9b40();
    var_133aacc1 = ct_utils::create_waypoint(#"hash_2ee615aa67beef9b", level.var_4d47c040, (0, 0, 0), #"any", undefined, 0, undefined);
    waitframe(1);
    if (isdefined(level.var_571c3787) && level.var_571c3787) {
        while (true) {
            e_player = getplayers()[0];
            n_dist = distance(e_player.origin, level.var_4d47c040);
            if (n_dist < 1500) {
                level thread function_8aa1c633();
                break;
            }
            waitframe(1);
        }
        level.var_571c3787 = undefined;
    }
    level.var_e6db911d = 0;
    level.var_6a0c3e3e = 0;
    level flag::set("hardpoint_active");
    n_bomb_timer = int(gettime() + 1000 + int((120 - 1) * 1000));
    setmatchflag("bomb_timer_a", 1);
    setbombtimer("A", n_bomb_timer);
    level.var_6530e34f = 1;
    level thread function_a29191a5();
    level waittill(#"hash_20855828f97ad4eb");
    level.var_6530e34f = undefined;
    level flag::clear("times_up");
    level.var_cbcb0078 = undefined;
    level.var_33682199 = 0;
    level.var_284fdd1c = 0;
    e_player = getplayers()[0];
    e_player thread function_5ccd53d5();
    level thread function_f704f55c();
    while (true) {
        if (level.var_33682199 >= 1) {
            level flag::set("mission_failed");
            break;
        }
        if (level flag::get("mission_success") || level flag::get("mission_failed")) {
            break;
        }
        if (level flag::get("times_up")) {
            break;
        }
        level.var_33682199 = level.var_284fdd1c / 100;
        waitframe(1);
    }
    var_133aacc1 gameobjects::set_visible_team("none");
    level flag::clear("hardpoint_active");
    if (!level flag::get("mission_failed")) {
        level thread ct_utils::function_bfa522d1(0);
    }
    waitframe(1);
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x8b5f65a6, Offset: 0x1770
// Size: 0x58
function function_a29191a5() {
    ct_bots::activate_bots(5, #"axis");
    ct_bots::activate_bots(3, #"allies");
    level notify(#"hash_20855828f97ad4eb");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xc4e3a45b, Offset: 0x17d0
// Size: 0x10c
function function_5237d068() {
    if (level flag::get("gamemode_started") == 0) {
        return;
    }
    var_fbd8f808 = function_1a67c935();
    level.var_7150ddcb++;
    self.var_fbd8f808 = var_fbd8f808;
    self thread function_32dc367f();
    self ct_utils::function_5b59f3b7(var_fbd8f808.origin, var_fbd8f808.angles, 1024);
    if (level flag::get("hardpoint_active") == 0) {
        self setorigin(var_fbd8f808.origin);
        self setplayerangles(var_fbd8f808.angles);
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x821927fe, Offset: 0x18e8
// Size: 0x38
function function_32dc367f() {
    self waittill(#"death");
    self.var_fbd8f808.b_occupied = undefined;
    level.var_7150ddcb--;
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xcb12fb54, Offset: 0x1928
// Size: 0x25a
function function_6c645ca4() {
    level endon(#"combattraining_logic_finished");
    level flag::wait_till("hardpoint_active");
    var_a918f2fa = gettime() / 1000;
    while (true) {
        n_time = gettime() / 1000;
        if (isdefined(level.var_5795f618) && !isalive(level.var_5795f618)) {
            level.var_5795f618 = undefined;
            var_a918f2fa = n_time;
        } else if (isdefined(level.var_5795f618) && isalive(level.var_5795f618) && isdefined(level.var_5795f618.var_8c70bcba) && level.var_5795f618.var_8c70bcba) {
            level.var_5795f618.var_8c70bcba = undefined;
            level.var_5795f618 = undefined;
            var_a918f2fa = n_time;
        }
        if (!isdefined(level.var_5795f618)) {
            dt = n_time - var_a918f2fa;
            if (dt > 15) {
                a_bots = ct_bots::function_fbe3dcbb();
                a_bots = arraysort(a_bots, level.var_4d47c040, 1);
                foreach (bot in a_bots) {
                    if (bot.team == #"axis") {
                        level.var_5795f618 = bot;
                        level.var_5795f618 function_bf5c4d90();
                    }
                }
            }
        }
        waitframe(1);
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x753a4060, Offset: 0x1b90
// Size: 0x210
function function_bf5c4d90() {
    self endon(#"death");
    self thread function_861806d6();
    var_728787a3 = self.var_9a79d89d;
    var_7b01722c = self.var_5ab7c19c;
    var_24d6686a = self.var_bab91f2;
    self.var_9a79d89d = level.var_4d47c040;
    self.var_5ab7c19c = self.angles;
    self.var_bab91f2 = 64;
    while (true) {
        if (self istouching(level.var_511a3f1c)) {
            level.var_a360ed5b = self;
            if (!isdefined(self.var_c467c182)) {
                self.var_c467c182 = gettime() / 1000;
            }
            n_time = gettime() / 1000;
            dt = n_time - self.var_c467c182;
            if (dt > 8) {
                self.var_9a79d89d = var_728787a3;
                self.var_5ab7c19c = var_7b01722c;
                self.var_bab91f2 = var_24d6686a;
                level.var_cbcb0078 = 0;
                self.var_e6828594 = undefined;
                self.var_8c70bcba = 1;
                self.var_c467c182 = undefined;
                return;
            }
            level.var_284fdd1c = level.var_284fdd1c + 0.1;
            level.var_cbcb0078 = 1;
            if (!(isdefined(self.var_e6828594) && self.var_e6828594)) {
                level thread function_57e457f2();
                self.var_e6828594 = 1;
            }
        } else {
            level.var_a360ed5b = undefined;
            level.var_cbcb0078 = 0;
            self.var_c467c182 = undefined;
        }
        waitframe(1);
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x9ffd6c50, Offset: 0x1da8
// Size: 0x96
function function_861806d6() {
    self waittill(#"death");
    level.var_cbcb0078 = 0;
    self.var_e6828594 = undefined;
    if (isdefined(level.var_a360ed5b) && self == level.var_a360ed5b) {
        e_player = getplayers()[0];
        e_player thread ct_utils::function_d471f8fa(-5);
    }
    level.var_a360ed5b = undefined;
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xcb0116c9, Offset: 0x1e48
// Size: 0xe8
function function_f704f55c() {
    level endon(#"mission_failed", #"mission_success", #"times_up");
    if (level.var_115bb554 == 0) {
        var_e8d6f89 = 1;
    } else {
        var_e8d6f89 = 2;
    }
    for (i = 0; i < var_e8d6f89; i++) {
        spawn_robot(0);
        waitframe(1);
    }
    while (true) {
        level waittill(#"robot_killed");
        wait(10);
        spawn_robot(1);
    }
}

// Namespace ct_seraph/ct_seraph
// Params 1, eflags: 0x0
// Checksum 0xc0aa1183, Offset: 0x1f38
// Size: 0xe8
function spawn_robot(var_fd15f2f7) {
    while (true) {
        var_fbd8f808 = function_1a67c935();
        e_player = getplayers()[0];
        if (!var_fd15f2f7 || !e_player ct_utils::can_see(var_fbd8f808.origin, 0)) {
            robot = ct_ai::function_4c8f915a(var_fbd8f808.origin);
            ai_tank::function_9b13ebf(robot);
            robot thread function_e1e9b6fc();
            return robot;
        }
        waitframe(1);
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xa2e96c11, Offset: 0x2028
// Size: 0xae
function function_e1e9b6fc() {
    self endon(#"death");
    self thread function_7b0b7f0a();
    self thread function_a63b091b();
    self thread function_492e55ed();
    self setgoal(level.var_4d47c040);
    self.goalradius = 1200;
    self waittill(#"goal");
    self.goalradius = 2200;
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x4bc4009, Offset: 0x20e0
// Size: 0xfc
function function_7b0b7f0a() {
    self endon(#"death");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        if (isdefined(waitresult.weapon) && waitresult.weapon == getweapon(#"hero_annihilator")) {
            e_player = getplayers()[0];
            e_player thread ct_utils::function_d471f8fa(-5);
            self dodamage(self.health + 100, self.origin);
            level notify(#"stop_nag");
        }
    }
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x5653d70c, Offset: 0x21e8
// Size: 0x30
function function_a63b091b() {
    self waittill(#"death");
    level notify(#"robot_killed");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x5d0b8089, Offset: 0x2220
// Size: 0x5c
function function_492e55ed() {
    self endon(#"death");
    level flag::wait_till("times_up");
    self dodamage(self.health + 100, self.origin);
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x6671ef24, Offset: 0x2288
// Size: 0xe6
function function_1a67c935() {
    if (!isdefined(level.var_7c65ae0d)) {
        var_7716dee7 = "seraph_guard_node_" + level.var_115bb554 + 1;
        level.var_7c65ae0d = getnodearray(var_7716dee7, "targetname");
        level.var_7c65ae0d = array::randomize(level.var_7c65ae0d);
        level.var_96c21c85 = 0;
    }
    var_fbd8f808 = level.var_7c65ae0d[level.var_96c21c85];
    level.var_96c21c85++;
    if (level.var_96c21c85 >= level.var_7c65ae0d.size) {
        level.var_96c21c85 = 0;
    }
    return var_fbd8f808;
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xa8455840, Offset: 0x2378
// Size: 0x27c
function function_5ccd53d5() {
    self endon(#"death");
    level flag::wait_till("combat_training_started");
    level flag::wait_till("hardpoint_active");
    self thread function_121a422a();
    level.xpos = 140;
    level.ypos = 560;
    level.width = 50;
    level.height = 4;
    self ct_utils::function_7b70bd74(level.hardpoint_bar, level.xpos, level.ypos, level.width, level.height);
    level.hardpoint_bar luielembar_ct::set_color(self, 1, 0, 0);
    while (true) {
        function_e5352267();
        level.hardpoint_bar luielembar_ct::set_bar_percent(self, level.var_33682199);
        if (level flag::get("hardpoint_active") == 0) {
            break;
        }
        if (level flag::get("times_up")) {
            break;
        }
        level.hardpoint_bar luielembar_ct::function_e5898fd7(self, level.xpos);
        level.hardpoint_bar luielembar_ct::function_58a135d3(self, level.ypos);
        level.hardpoint_bar luielembar_ct::set_width(self, level.width);
        level.hardpoint_bar luielembar_ct::set_height(self, level.height);
        waitframe(1);
    }
    level.hardpoint_bar luielembar_ct::close(self);
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xe07bacaa, Offset: 0x2600
// Size: 0x34
function function_121a422a() {
    self waittill(#"death");
    level.hardpoint_bar luielembar_ct::close(self);
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xf8503c38, Offset: 0x2640
// Size: 0xc4
function function_e5352267() {
    e_player = getplayers()[0];
    if (isdefined(level.var_a360ed5b)) {
        e_player thread ct_utils::function_b42ce622(#"downloading");
        level.var_cbcb0078 = 1;
        return;
    }
    if (level.var_33682199 == 0) {
        e_player thread ct_utils::function_b42ce622(#"awaitingconnection");
        return;
    }
    e_player thread ct_utils::function_b42ce622(#"connection_lost");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xa597853a, Offset: 0x2710
// Size: 0x6
function function_f99b3d06() {
    return false;
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x9106f7cd, Offset: 0x2720
// Size: 0x5c
function function_20bf9b40() {
    e_player = getplayers(#"allies")[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_1306d1a533b82e73", 5, "green");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xdfade363, Offset: 0x2788
// Size: 0x5c
function function_57e457f2() {
    e_player = getplayers(#"allies")[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_4635c0c445e70f61", 4, "red");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0xe00d1041, Offset: 0x27f0
// Size: 0x5c
function function_131ea9e1() {
    e_player = getplayers(#"allies")[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_5ae878b15a534c01", 10, "green");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x1b474ae, Offset: 0x2858
// Size: 0x5c
function function_8aa1c633() {
    e_player = getplayers(#"allies")[0];
    e_player thread ct_utils::function_329f9ba6(#"hash_443101fa69c21abf", 5, "green");
}

// Namespace ct_seraph/ct_seraph
// Params 0, eflags: 0x0
// Checksum 0x17996f25, Offset: 0x28c0
// Size: 0x1b8
function function_849be68a() {
    /#
        sessionmode = currentsessionmode();
        setdvar(#"hash_527da51d610a31b1", "<unknown string>");
        level flag::init("<unknown string>");
        if (sessionmode != 4) {
            adddebugcommand("<unknown string>");
        }
        while (true) {
            wait(0.25);
            cmd = getdvarstring(#"hash_527da51d610a31b1", "<unknown string>");
            if (cmd == "<unknown string>") {
                continue;
            }
            e_player = level.players[0];
            switch (cmd) {
            case #"spawn_chopper":
                a_s_chopper = struct::get_array("<unknown string>", "<unknown string>");
                break;
            case #"kill_player":
                e_player dodamage(1000, e_player.origin);
                break;
            }
            setdvar(#"hash_527da51d610a31b1", "<unknown string>");
        }
    #/
}

