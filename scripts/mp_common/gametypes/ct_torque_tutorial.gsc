// Atian COD Tools GSC decompiler test
#using scripts\weapons\sensor_dart.gsc;
#using scripts\weapons\deployable.gsc;
#using scripts\mp_common\player\player_loadout.gsc;
#using scripts\mp_common\gametypes\globallogic_spawn.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\ct_vo.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\killstreaks\mp\swat_team.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\killstreaks\helicopter_shared.gsc;
#using scripts\core_common\bots\bot_stance.gsc;
#using scripts\core_common\bots\bot_action.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawning_shared.gsc;
#using scripts\core_common\spawnbeacon_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\abilities\gadgets\gadget_smart_cover.gsc;
#using scripts\abilities\gadgets\gadget_concertina_wire.gsc;

#namespace ct_torque_tutorial;

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8371ec89, Offset: 0x19e0
// Size: 0x224
function init() {
    setdvar(#"compassmaxrange", "3600");
    level.var_ae120f18 = array("vox_tvoi_tutor_torq_start_0");
    level.var_bb9429c2 = level.var_c8b46e18;
    level.onconcertinawireplaced = &on_concertinawire_placed;
    level.var_d013d2e3 = level.onsmartcoverplaced;
    level.onsmartcoverplaced = &on_smartcover_placed;
    level.var_eea9be19 = 150;
    level.var_e72728b8 = [];
    level flag::init("fin1_enemies_spawn_done");
    level flag::init("fin2_killstreak_used");
    level flag::init("fin2_killstreak_earned");
    level.var_66da9c3c = 1;
    level.forceusekillstreak = 0;
    level thread function_7036ef4();
    level.var_c8f47cbe = 3;
    a_nodes = getnodearray("ct_disable_node", "script_noteworthy");
    foreach (node in a_nodes) {
        setenablenode(node, 0);
    }
    /#
        level thread function_16eca645();
    #/
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe2dcc424, Offset: 0x1c10
// Size: 0x158
function function_7036ef4() {
    level endon(#"combattraining_logic_finished");
    level thread ct_utils::function_6b71f442();
    a_col_torque_tut_fin_ground = getentarray("col_torque_tut_fin_ground", "targetname");
    foreach (col_torque_tut_fin_ground in a_col_torque_tut_fin_ground) {
        col_torque_tut_fin_ground.origin = col_torque_tut_fin_ground.origin + vectorscale((0, 0, 1), 1024);
    }
    wait(1);
    foreach (var_29bfcd7c in a_col_torque_tut_fin_ground) {
        var_29bfcd7c disconnectpaths();
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x871be912, Offset: 0x1d70
// Size: 0x94
function function_82c1c712(str_weapon) {
    level endon(#"combattraining_logic_finished");
    wpn = getweapon(str_weapon);
    self giveweapon(wpn);
    while (!self hasweapon(wpn)) {
        waitframe(1);
    }
    self switchtoweapon(wpn, 1);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xfe307b4d, Offset: 0x1e10
// Size: 0x44
function function_222141a5(var_58d9f1c6 = 1) {
    level endon(#"combattraining_logic_finished");
    self ct_bots::function_fd2d220e();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xca3aa296, Offset: 0x1e60
// Size: 0x186
function setup() {
    level.var_8ca3c62 = 0;
    level clientfield::set("area_arrows_specialist", 6);
    level thread function_26185fc3();
    level.a_ai_targets = [];
    if (isdefined(level.var_87226c31.bundle.timeout) && level.var_87226c31.bundle.timeout > 0) {
        level.var_805601a1 = level.var_87226c31.bundle.timeout;
    }
    if (isdefined(level.smartcoversettings.bundle.timeout) && level.smartcoversettings.bundle.timeout > 0) {
        level.var_b22514ca = level.smartcoversettings.bundle.timeout;
    }
    level.var_87226c31.bundle.timeout = 0;
    level.smartcoversettings.bundle.timeout = 0;
    level.var_e8126cf6 = 0;
    level.var_d1f07c87 = 0;
    level.forceusekillstreak = 0;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x15962740, Offset: 0x1ff0
// Size: 0x66
function function_3661baa8() {
    if (isdefined(level.var_805601a1)) {
        level.var_87226c31.bundle.timeout = level.var_805601a1;
    }
    if (isdefined(level.var_b22514ca)) {
        level.smartcoversettings.bundle.timeout = level.var_b22514ca;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xa9f95aac, Offset: 0x2060
// Size: 0x96
function function_26185fc3() {
    a_s_loc = struct::get_array("spawn_pt", "script_noteworthy");
    foreach (s_loc in a_s_loc) {
        s_loc.e_occupant = undefined;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6d61e6cf, Offset: 0x2100
// Size: 0x4bc
function function_c9ff0dce() {
    self thread ct_utils::player_reset();
    if (!isbot(self)) {
        self.overrideplayerdamage = &overridedamage_player;
        if (isdefined(level.var_8ca3c62)) {
            if (level.var_8ca3c62 === 1) {
                self thread ct_utils::function_61d750d4("s_torque_tut_1_respawn");
            }
            if (level.var_8ca3c62 === 2) {
                self thread ct_utils::function_61d750d4("s_torque_tut_2_respawn");
            } else if (level.var_8ca3c62 === 3) {
                self thread ct_utils::function_61d750d4("s_torque_tut_3_respawn");
            } else if (level.var_8ca3c62 === 4) {
                self thread ct_utils::function_61d750d4("s_torque_tut_4_respawn");
            } else if (level.var_8ca3c62 === 5) {
                self thread ct_utils::function_61d750d4("s_torque_tut_5_respawn");
            } else if (level.var_8ca3c62 === 6) {
                self thread ct_utils::function_61d750d4("s_torque_tut_6_respawn");
            } else if (level.var_8ca3c62 === 7 || level.var_8ca3c62 === 8) {
                self thread ct_utils::function_61d750d4("s_torque_tut_fin_respawn");
            }
        }
        level.var_86b67c3f = 1;
    } else if (isdefined(level.var_72d7275b) && level.var_72d7275b) {
        self.ignoreall = 0;
        if (self.team === #"axis") {
            self.var_71a70093 = 150;
            if (isdefined(level.var_8ca3c62)) {
                level.var_1569cc4d = 1;
                if (level.var_8ca3c62 != 5) {
                    self thread function_4e7e54cd();
                }
                if (level.var_8ca3c62 === 2) {
                    self thread function_8d55c46b();
                } else if (level.var_8ca3c62 === 3) {
                    self thread _enemy_setup("s_torque_tut_3_enemy_spawn", 0, 32, 1);
                } else if (level.var_8ca3c62 === 4) {
                    self thread function_bab30cda();
                } else if (level.var_8ca3c62 === 5) {
                    self thread function_c0bc3c1c();
                } else if (level.var_8ca3c62 === 6) {
                    level.var_1569cc4d = 0;
                    self thread function_ceb8d558();
                } else if (level.var_8ca3c62 === 7 || level.var_8ca3c62 === 8) {
                    level.var_1569cc4d = 0;
                    self thread function_a67d04b7();
                } else {
                    str_spawn = "s_torque_tut_" + level.var_8ca3c62 + "_enemy_spawn";
                    self thread _enemy_setup(str_spawn);
                }
            }
            if (isdefined(level.var_1569cc4d) && level.var_1569cc4d) {
                self thread ct_utils::function_8963dae3();
            }
        } else if (self.team === #"allies") {
            self.var_71a70093 = 150;
            if (isdefined(level.var_8ca3c62)) {
                self thread function_65f22190();
            }
        }
        self thread ct_utils::function_5149c890(1);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa5ce347c, Offset: 0x25c8
// Size: 0x54
function function_4e7e54cd(n_wait = 0.5) {
    self endon(#"death");
    wait(n_wait);
    self clientfield::set("enemy_on_radar", 1);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 9, eflags: 0x0
// Checksum 0xedd8b06b, Offset: 0x2628
// Size: 0x194
function function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isbot(self)) {
        self.overrideplayerdamage = undefined;
        if (level.var_8ca3c62 == 7) {
            if (self.team === #"axis" && attacker == ct_utils::get_player()) {
                self thread function_5d65fa2b();
            }
        }
        if (self.team == #"axis" && isdefined(self.b_sniper) && self.b_sniper) {
            level.var_e8126cf6--;
            self.b_sniper = 0;
        }
        self clientfield::set("enemy_on_radar", 0);
        if (isdefined(self.var_41f5536a) && self.var_41f5536a) {
            if (isdefined(level.var_69cfcf85)) {
                level.var_69cfcf85++;
            }
            level.var_ec07b7b8 = 1;
        }
        self.var_41f5536a = 0;
        self ct_bots::function_43df30a8();
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xcdcc332f, Offset: 0x27c8
// Size: 0x4a4
function function_9b9525e9() {
    level endon(#"combattraining_logic_finished");
    level.var_72d7275b = 1;
    level.var_e6db911d = 1;
    exploder::exploder("fxexp_wind_constant");
    level thread ct_utils::function_9ab507a9("colbounds_ct_torque_tutorial", "colbounds_on", "colbounds_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_1", "colbounds_tut_1_on", "colbounds_tut_1_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_2_left", "colbounds_tut_2_left_on", "colbounds_tut_2_left_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_2_right", "colbounds_tut_2_right_on", "colbounds_tut_2_right_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_3", "colbounds_tut_3_on", "colbounds_tut_3_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_3_window", "colbounds_tut_3_window_on", "colbounds_tut_3_window_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_4", "colbounds_tut_4_on", "colbounds_tut_4_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_4_5_doorway", "colbounds_tut_4_5_doorway_on", "colbounds_tut_4_5_doorway_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_5", "colbounds_tut_5_on", "colbounds_tut_5_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_6_south", "colbounds_tut_6_on", "colbounds_tut_6_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_6_north", "colbounds_tut_6_on", "colbounds_tut_6_off", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("colbounds_tut_windows_block", "colbounds_tut_windows_block_on", "colbounds_tut_windows_block_off", undefined, 1, 0);
    e_player = ct_utils::get_player();
    waitframe(1);
    level notify(#"colbounds_on");
    level notify(#"colbounds_tut_1_on");
    level notify(#"hash_1d1e5f7db2d03858");
    e_player setlowready(0);
    e_player function_2823bfa7();
    e_player function_3068d031();
    e_player function_6f544e0b();
    e_player function_7b076571();
    e_player function_43d3770a();
    wait(1);
    e_player function_5d93aa8a();
    wait(1);
    e_player function_e2a695f2();
    e_player function_fee5ce70();
    level thread ct_utils::function_49e0c5bc(1);
    e_player ct_utils::function_c2a10fc();
    e_player ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_end_0", "vox_tvoi_tutor_torq_end_1"));
    ct_utils::onboarding_complete();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x579fe4af, Offset: 0x2c78
// Size: 0x204
function function_2823bfa7() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 1;
    self setnormalhealth(1);
    self thread ct_utils::player_collisionbox(undefined, self.origin);
    self ct_vo::function_3ca1b77d(1);
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_utils::function_6ad0c151();
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_start_1"));
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    level notify(#"hash_4c9c5fbc89779e64");
    waitframe(1);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag", 30, 15);
    self ct_utils::tutorial_goto("s_torque_tut_1_goto");
    level notify(#"hash_60e26e14a51c5211");
    do {
        self function_c37caebd();
    } while(!(isdefined(level.var_5b4739ff) && level.var_5b4739ff));
    self ct_utils::function_c2a10fc();
    self ct_utils::function_6ad0c151();
    wait(1);
    self concertina_wire::function_42b34d5a();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x27cd9d43, Offset: 0x2e88
// Size: 0x3f8
function function_c37caebd() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death", #"hash_34a524e09eb9209f");
    level.var_5b4739ff = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_utils::function_6ad0c151();
    self ct_vo::function_3ca1b77d(1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_razor_wire_2"));
    wait(5.56);
    level thread ct_utils::function_a3f8ddfa("colbounds_tut_1");
    level.var_e72728b8 = array(#"ability_smart_cover");
    self setlowready(0);
    self thread ct_utils::function_61c3d59c(#"hash_33e497e4d3690fb");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_razor_wire_nag");
    s_loc = struct::get("s_torque_tut_1_razorwire_deploy", "targetname");
    self function_44776cd(1, s_loc);
    level notify(#"hash_60e26e14a51c5211");
    self ct_utils::function_1bb93418();
    wait(1);
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self thread function_222141a5();
    self setlowready(1);
    ct_bots::activate_bots(1, #"axis", "bot_stuckguy", 1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_stuck_0"));
    level waittill(#"enemy_stuck_in_razorwire");
    self ct_vo::function_3ca1b77d(1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_stuck_1"));
    self setlowready(0);
    self thread ct_utils::function_61c3d59c(#"hash_5fadc5cf57233ef4");
    self ct_utils::function_d00e0eeb();
    level notify(#"hash_60e26e14a51c5211");
    level.var_5b4739ff = 1;
    level notify(#"colbounds_tut_1_off");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x4520d243, Offset: 0x3288
// Size: 0x34
function function_ccbb894d() {
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_stuck_0", "vox_tvoi_tutor_torq_enemy_stuck_1"));
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xec078401, Offset: 0x32c8
// Size: 0x20c
function function_3068d031() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 2;
    self setnormalhealth(1);
    level notify(#"colbounds_tut_2_left_on");
    level notify(#"colbounds_tut_2_right_on");
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_two_razor_wire_0"));
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_two_razor_wire_1"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag");
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_torque_tut_2_goto");
    level notify(#"hash_60e26e14a51c5211");
    do {
        self function_23f8245b();
    } while(!(isdefined(level.release_spawn) && level.release_spawn));
    self ct_utils::function_c2a10fc();
    level thread ct_utils::function_95f28639("colbounds_tut_2_right");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_razor_wire_window_0"));
    level notify(#"colbounds_tut_2_left_off");
    self concertina_wire::function_42b34d5a();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3fb5189f, Offset: 0x34e0
// Size: 0x6b4
function function_23f8245b() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death", #"hash_34a524e09eb9209f");
    level.release_spawn = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self ct_utils::function_6ad0c151();
    level notify(#"colbounds_tut_1_on");
    level notify(#"colbounds_tut_2_left_on");
    level notify(#"colbounds_tut_2_right_on");
    self ct_vo::function_3ca1b77d(1);
    level.var_e72728b8 = array(#"ability_smart_cover");
    self function_b512a9bf(0);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_two_razor_wire_3"), 1);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_two_razor_wire_nag", 30, 15);
    self thread ct_utils::function_61c3d59c(#"hash_3967aa9d33b8058b", undefined);
    level thread ct_utils::function_a3f8ddfa("colbounds_tut_2_left");
    self function_44776cd(1, "s_torque_tut_2_razorwire_deploy_l");
    level notify(#"hash_60e26e14a51c5211");
    wait(1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_two_razor_wire_4"), 1);
    level thread ct_utils::function_a3f8ddfa("colbounds_tut_2_right");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_two_razor_wire_nag", 30, 15);
    self function_44776cd(1, "s_torque_tut_2_razorwire_deploy_r");
    self setlowready(1);
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_utils::function_1bb93418();
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_two_razor_wire_5", "vox_tvoi_tutor_torq_two_razor_wire_6"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_shoot_enemy_nag", 30, 15);
    self ct_utils::function_1bb93418();
    level.var_ec07b7b8 = 0;
    level.a_s_targets = struct::get_array("s_torque_tut_2_enemy_spawn", "targetname");
    level.a_s_targets = array::sort_by_script_int(level.a_s_targets, 1);
    self thread function_222141a5();
    self setlowready(1);
    do {
        level.var_c1ee2be7 = 0;
        level.var_69cfcf85 = 0;
        ct_bots::activate_bots(1, #"axis", "bot_stuckguy", 1);
        level waittill(#"enemy_stuck_in_razorwire");
        self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillWireTrappedEnemies");
        level.var_a731abd6 = 3;
        self ct_utils::function_80bf685b(level.var_a731abd6);
        self setlowready(0);
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_1_down"));
        self ct_utils::function_d00e0eeb();
        self ct_vo::function_3ca1b77d(1);
        level notify(#"hash_4c2e751dd9e2bb57");
        self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_enemy_2_down", "enemy_stuck_in_razorwire");
        ct_bots::activate_bots(1, #"axis", "bot_stuckguy", 1);
        wait(0.5);
        ct_bots::activate_bots(1, #"axis", "bot_stuckguy", 1);
        self ct_utils::function_d00e0eeb();
        level notify(#"hash_4c2e751dd9e2bb57");
    } while(!level.var_ec07b7b8 && level.var_69cfcf85 < level.a_s_targets.size);
    level notify(#"hash_60e26e14a51c5211");
    waitframe(1);
    level.release_spawn = 1;
    self ct_utils::function_6ad0c151();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x19fac3f7, Offset: 0x3ba0
// Size: 0xbc
function function_8d55c46b() {
    level endon(#"combattraining_logic_finished");
    if (level.var_c1ee2be7 >= level.a_s_targets.size) {
        level.var_c1ee2be7 = 0;
    }
    s_loc = level.a_s_targets[level.var_c1ee2be7];
    self.var_c1ee2be7 = level.var_c1ee2be7;
    level.var_c1ee2be7++;
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread function_5fd87ab3(s_loc);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x27ed4849, Offset: 0x3c68
// Size: 0x120
function function_5fd87ab3(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_529bea71, #"death");
    s_dest = struct::get(s_loc.target, "targetname");
    self ct_bots::function_35e77034(getweapon(#"smg_standard_t8"));
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 1, 1, 0);
    self thread function_a20738a();
    while (isalive(self)) {
        waitframe(1);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x6ccbdcbd, Offset: 0x3d90
// Size: 0x84
function function_529bea71(_hash) {
    e_player = ct_utils::get_player();
    if (isdefined(level.var_a731abd6)) {
        level.var_a731abd6--;
        if (level.var_a731abd6 > 0) {
            e_player ct_utils::function_80bf685b(level.var_a731abd6);
        } else {
            e_player ct_utils::function_c2a10fc();
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc7baee9d, Offset: 0x3e20
// Size: 0xe4
function function_6f544e0b() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 3;
    self setnormalhealth(1);
    level notify(#"colbounds_tut_4_5_doorway_on");
    level notify(#"colbounds_tut_3_window_on");
    do {
        self function_b2770e99();
    } while(!(isdefined(level.var_89961b65) && level.var_89961b65));
    self ct_utils::function_c2a10fc();
    level notify(#"colbounds_tut_3_window_off");
    self concertina_wire::function_42b34d5a();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8144e70a, Offset: 0x3f10
// Size: 0x3f4
function function_b2770e99() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death", #"hash_34a524e09eb9209f");
    level.var_89961b65 = 0;
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self ct_utils::function_6ad0c151();
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag", 30, 15);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_razor_wire_window_1"));
    self ct_utils::tutorial_goto("s_torque_tut_3_goto");
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_tut_3_on");
    self ct_vo::function_3ca1b77d(1);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_razor_wire_window_nag");
    self thread ct_utils::function_61c3d59c(#"hash_567d726ecbe59075", array("vox_tvoi_tutor_torq_razor_wire_window_2"));
    s_loc = struct::get("s_torque_tut_3_razorwire_deploy", "targetname");
    self function_44776cd(1, s_loc);
    level notify(#"hash_60e26e14a51c5211");
    self ct_utils::function_1bb93418();
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_razor_wire_comp_0"));
    self thread function_6ad22c31();
    level.var_ec07b7b8 = 0;
    self thread function_222141a5();
    do {
        self setlowready(1);
        ct_bots::activate_bots(1, #"axis", "bot_dummyfish", 1);
        level waittill(#"enemy_stuck_in_razorwire");
        self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_smoked_0"));
        self setlowready(0);
        self ct_utils::function_654280be();
    } while(!level.var_ec07b7b8);
    level.var_89961b65 = 1;
    self ct_utils::function_6ad0c151();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xbf8f0504, Offset: 0x4310
// Size: 0x144
function function_7b076571() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 4;
    self setnormalhealth(1);
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_vo::function_3ca1b77d(1);
    do {
        self function_4aa64c88();
    } while(!(isdefined(level.var_5610eee8) && level.var_5610eee8));
    self ct_utils::function_c2a10fc();
    level notify(#"colbounds_tut_4_off");
    wait(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_rad_field_2"));
    self smart_cover::function_b11be5dc();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9f559188, Offset: 0x4460
// Size: 0x624
function function_4aa64c88() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_5610eee8 = 0;
    level notify(#"colbounds_tut_4_on");
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self ct_utils::function_6ad0c151();
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag", 30, 15);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0", array("vox_tvoi_tutor_torq_smrt_cvr_0", "vox_tvoi_tutor_torq_smrt_cvr_1"));
    self ct_utils::tutorial_goto("s_torque_tut_4_goto");
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"hash_777ed15e2c354712");
    level notify(#"colbounds_tut_windows_block_on");
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_smrt_cvr_2"));
    level.var_e72728b8 = array(#"eq_concertina_wire");
    var_89975e11 = self gamepadusedlast() ? #"hash_75eaa8ffc71cdd9d" : #"hash_69973debc6e768f3";
    self thread ct_utils::function_61c3d59c(var_89975e11);
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_smrt_cvr_nag", 30, 20);
    s_loc = struct::get("s_torque_tut_4_barricade_deploy", "targetname");
    self function_44776cd(2, s_loc);
    level notify(#"hash_60e26e14a51c5211");
    self ct_utils::function_1bb93418();
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_vo::function_3ca1b77d(1);
    self thread ct_utils::function_61c3d59c(#"hash_4a1a6d0229d29555");
    level.a_s_targets = struct::get_array("s_torque_tut_4_enemy_spawn", "targetname");
    level.a_s_targets = array::sort_by_script_int(level.a_s_targets, 1);
    level.var_c1ee2be7 = 0;
    ct_bots::activate_bots(1, #"axis", "bot_friedguy", 1);
    wait(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_rad_field_0"));
    a_e_enemies = self ct_bots::function_dde6edbd();
    foreach (e_enemy in a_e_enemies) {
        if (e_enemy.targetname == "bot_friedguy") {
            e_friedguy = e_enemy;
            break;
        }
    }
    if (isalive(e_friedguy)) {
        e_friedguy kill();
    }
    self ct_utils::function_d00e0eeb();
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_rad_field_1"));
    self thread function_222141a5();
    ct_bots::activate_bots(2, #"axis");
    self thread ct_utils::function_61c3d59c(#"hash_4263e7f721a63f27");
    self ct_utils::function_d00e0eeb();
    self ct_vo::function_3ca1b77d(1);
    level.var_5610eee8 = 1;
    self ct_utils::function_6ad0c151();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x13dc64e, Offset: 0x4a90
// Size: 0x94
function function_bab30cda() {
    level endon(#"combattraining_logic_finished");
    s_loc = level.a_s_targets[level.var_c1ee2be7];
    self.var_c1ee2be7 = level.var_c1ee2be7;
    level.var_c1ee2be7++;
    self ct_utils::function_61d750d4(s_loc.origin);
    waitframe(1);
    self thread function_f29fcec6(s_loc);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x87982020, Offset: 0x4b30
// Size: 0x244
function function_f29fcec6(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_e243f675, #"death");
    self ct_bots::function_35e77034(getweapon(#"ar_accurate_t8"));
    s_dest = struct::get(s_loc.target, "targetname");
    if (self.var_c1ee2be7 === 0) {
        s_dest = struct::get("s_torque_tut_4_barrier_dest", "targetname");
        var_b900d859 = struct::get("s_torque_tut_4_barrier_dest_bak", "targetname");
        if (!self canpath(self.origin, s_dest.origin)) {
            s_dest = var_b900d859;
        }
        self val::set("torque_tut_ignore", "ignoreall", 1);
    }
    self thread ct_utils::function_1746776e();
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, 32, 1, 1, 1);
    self ct_bots::function_35e77034(getweapon(#"smg_standard_t8"));
    self.bot.var_b2b8f0b6 = 100;
    self.bot.var_e8c941d6 = 500;
    if (isdefined(s_dest.var_48dd881a)) {
        self waittill(#"goal");
        self bot_stance::crouch();
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x9d3f56e6, Offset: 0x4d80
// Size: 0x34
function function_e243f675(_hash) {
    self val::reset("torque_tut_ignore", "ignoreall");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe8ae1e5a, Offset: 0x4dc0
// Size: 0xf4
function function_43d3770a() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 5;
    self setnormalhealth(1);
    self ct_vo::function_3ca1b77d(1);
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    level notify(#"colbounds_tut_windows_block_on");
    do {
        self function_d27e566();
    } while(!(isdefined(level.var_431fcb17) && level.var_431fcb17));
    self ct_utils::function_1bb93418();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc8a4d6b1, Offset: 0x4ec0
// Size: 0x432
function function_d27e566() {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_344aee09, #"death");
    level.var_431fcb17 = 0;
    level notify(#"colbounds_tut_4_5_doorway_off");
    level notify(#"colbounds_tut_5_on");
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self thread function_222141a5();
    self setlowready(1);
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0", array("vox_tvoi_tutor_torq_rad_field_3"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag");
    self ct_utils::tutorial_goto("s_torque_tut_5_goto", undefined, 48);
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_tut_4_5_doorway_on");
    waitframe(1);
    level.var_7cab580 = ct_utils::get_roleindex(#"prt_mp_engineer");
    level.select_character = ct_utils::get_roleindex(#"prt_mp_engineer");
    ct_bots::activate_bots(1, #"axis");
    self thread function_fd0b81b();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_razor_wire_0", "vox_tvoi_tutor_torq_enemy_razor_wire_1"));
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_razor_wire_rpg"));
    self function_82c1c712(#"launcher_standard_t8");
    self setlowready(0);
    self allowmelee(0);
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_enemy_razor_wire_rpg_miss", "rpg_miss", 0, 0, 5);
    self thread function_dbc41f2b();
    self thread ct_utils::function_61c3d59c(#"hash_56eb0801e59fea09");
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_enemy_razor_wire_nag", 30, 20);
    level waittill(#"hash_38e6233b0c75e979");
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"hash_4c2e751dd9e2bb57");
    self takeweapon(getweapon(#"launcher_standard_t8"));
    self allowmelee(1);
    level.var_431fcb17 = 1;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x938a3b1b, Offset: 0x5300
// Size: 0x150
function function_fd0b81b() {
    level endon(#"combattraining_logic_finished");
    while (!isdefined(level.var_7afae51f)) {
        waitframe(1);
    }
    waitframe(1);
    level.var_7afae51f clientfield::set("enemyobj_keyline_render", 1);
    level.var_7afae51f.waypoint = ct_utils::create_waypoint(#"hash_3489718f227fba3", level.var_7afae51f.origin, level.var_7afae51f.angles, #"axis", #"axis", undefined);
    level.var_7afae51f waittill(#"death");
    if (isdefined(level.var_7afae51f)) {
        level.var_7afae51f clientfield::set("enemyobj_keyline_render", 0);
    }
    level.var_7afae51f.waypoint ct_utils::function_f9ed304d();
    level notify(#"hash_38e6233b0c75e979");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x79348e6f, Offset: 0x5458
// Size: 0x70
function function_d7355d9(_hash) {
    if (isdefined(level.var_7afae51f)) {
        level.var_7afae51f clientfield::set("enemyobj_keyline_render", 0);
    }
    level.var_7afae51f.waypoint ct_utils::function_f9ed304d();
    level notify(#"hash_38e6233b0c75e979");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xd446068f, Offset: 0x54d0
// Size: 0xcc
function function_dbc41f2b() {
    while (!isdefined(level.var_7afae51f)) {
        waitframe(1);
    }
    e_player = ct_utils::get_player();
    level.var_7afae51f endoncallback(&function_eeee0be0, #"death");
    e_player endoncallback(&function_eeee0be0, #"death");
    while (1) {
        e_player waittill(#"weapon_fired");
        wait(1);
        level notify(#"rpg_miss");
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xfdf4b5a7, Offset: 0x55a8
// Size: 0x20
function function_eeee0be0(_hash) {
    level notify(#"hash_4c2e751dd9e2bb57");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xee7b0882, Offset: 0x55d0
// Size: 0x376
function function_c0bc3c1c() {
    level.var_6c7517de = self;
    self waittill(#"loadout_given");
    self ghost();
    self.var_ef59b90 = 6;
    s_loc = struct::get("s_torque_tut_5_enemy_razorwire", "targetname");
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self val::set("torque_tut_ignore", "ignoreall", 1);
    if (isdefined(self.waypoint)) {
        self.waypoint ct_utils::function_f9ed304d();
    }
    self setgoal(self.origin, 1, 1);
    wpn_razorwire = getweapon(#"eq_concertina_wire");
    self takeallweapons();
    waitframe(1);
    bare_hands = getweapon(#"bare_hands");
    self giveweapon(bare_hands);
    while (!self hasweapon(bare_hands)) {
        waitframe(1);
    }
    self giveweapon(wpn_razorwire);
    while (!self hasweapon(wpn_razorwire)) {
        waitframe(1);
    }
    gadget_health_regen = getweapon(#"gadget_health_regen");
    self giveweapon(gadget_health_regen);
    while (!self hasweapon(gadget_health_regen)) {
        waitframe(1);
    }
    wpn_barricade = getweapon(#"ability_smart_cover");
    self giveweapon(wpn_barricade);
    while (!self hasweapon(wpn_barricade)) {
        waitframe(1);
    }
    n_slot = self gadgetgetslot(wpn_razorwire);
    self bot_action::function_ee2eaccc(n_slot);
    wait(0.5);
    self waittill(#"hash_794fe961bd7a1e08");
    level notify(#"hash_7dc3e85f3283efb7");
    self thread function_159532aa();
    wait(1);
    self notify(#"hash_505598c7196ba834");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x418013a6, Offset: 0x5950
// Size: 0xb0
function function_159532aa() {
    self endoncallback(&function_9c64562d, #"hash_505598c7196ba834");
    s_escape = struct::get("s_torque_tut_5_razorwire_owner_hide", "targetname");
    self setorigin(s_escape.origin);
    while (1) {
        self setgoal(s_escape.origin, 1, 1);
        wait(0.5);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa193ac6a, Offset: 0x5a08
// Size: 0x54
function function_9c64562d(_hash) {
    level.var_6c7517de show();
    level.var_6c7517de solid();
    level.var_6c7517de ct_bots::disablebot();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x4ce3d678, Offset: 0x5a68
// Size: 0x2bc
function function_5d93aa8a() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 6;
    self setnormalhealth(1);
    level.var_e72728b8 = [];
    level notify(#"colbounds_tut_5_off");
    level notify(#"colbounds_tut_6_on");
    level notify(#"colbounds_tut_windows_block_on");
    self ct_utils::function_6ad0c151();
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_razor_success"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag");
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_torque_tut_6_goto");
    level notify(#"hash_60e26e14a51c5211");
    self ct_vo::function_3ca1b77d(1);
    do {
        self function_b17df12a();
    } while(!(isdefined(level.var_8197175) && level.var_8197175));
    level thread ct_utils::function_95f28639("colbounds_tut_6_north");
    level thread ct_utils::function_95f28639("colbounds_tut_6_south");
    level notify(#"hash_60e26e14a51c5211");
    self thread ct_utils::function_49e0c5bc();
    wait(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_defense_success"));
    self ct_utils::function_49e0c5bc();
    self concertina_wire::function_42b34d5a();
    self smart_cover::function_b11be5dc();
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x699d99bd, Offset: 0x5d30
// Size: 0x68c
function function_b17df12a() {
    level endoncallback(&function_3d1b545f, #"tut_6_barricade_dead", #"tut_6_razorwire_dead");
    self endoncallback(&function_344aee09, #"death");
    level.var_8197175 = 0;
    level thread ct_utils::function_95f28639("colbounds_tut_6_north");
    level thread ct_utils::function_95f28639("colbounds_tut_6_south");
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self ct_utils::function_6ad0c151();
    level notify(#"colbounds_tut_6_on");
    self setlowready(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_combo_cover_1"));
    self setlowready(0);
    var_78747412 = self gamepadusedlast() ? #"hash_75eaa8ffc71cdd9d" : #"hash_69973debc6e768f3";
    self thread ct_utils::function_61c3d59c(var_78747412);
    self function_b512a9bf(2);
    level thread ct_utils::function_a3f8ddfa("colbounds_tut_6_south");
    s_loc = struct::get("s_torque_tut_6_barricade_deploy", "targetname");
    self function_44776cd(2, s_loc);
    wait(0.5);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_place_smrt_cvr"));
    self thread ct_utils::function_61c3d59c(#"hash_3967aa9d33b8058b");
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self function_b512a9bf(0);
    level thread ct_utils::function_a3f8ddfa("colbounds_tut_6_north");
    s_loc = struct::get("s_torque_tut_6_razorwire_deploy", "targetname");
    self function_44776cd(1, s_loc);
    self thread ct_utils::function_1bb93418();
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self setlowready(1);
    self ct_vo::function_3ca1b77d(1);
    self thread ct_utils::function_1bb93418();
    self thread function_222141a5();
    level.var_e72728b8 = array(#"ability_smart_cover", #"eq_concertina_wire");
    self setlowready(0);
    var_a4b595d7 = self function_6e4b6ccc(2);
    var_f2f6bc54 = self function_6e4b6ccc(1);
    var_a4b595d7 thread ct_vo::vo_on_damage("vox_tvoi_tutor_torq_smrt_cvr_dmg_nag");
    var_f2f6bc54 thread ct_vo::vo_on_damage("vox_tvoi_tutor_torq_razor_wire_dmg_nag");
    var_a4b595d7 thread function_b2e3d55a("tut_6_barricade_dead");
    var_f2f6bc54 thread function_b2e3d55a("tut_6_razorwire_dead");
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_place_razor_wire_0", "vox_tvoi_tutor_torq_place_razor_wire_1"));
    wait(3);
    self thread ct_utils::countdown_timer(45);
    waitframe(1);
    self thread ct_utils::function_61c3d59c(#"hash_762869628e9f6b19");
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_combo_cover_motivate", "tut_6_motivate", 0, 0, 5);
    ct_utils::function_9aca2fa0("ct_action2");
    self function_d4463404();
    level notify(#"hash_3ce5abc259d8b041");
    self ct_utils::function_1bb93418();
    level notify(#"hash_4c2e751dd9e2bb57");
    level.var_8197175 = 1;
    ct_utils::function_9aca2fa0("ct_action");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xd091bd1b, Offset: 0x63c8
// Size: 0x44
function function_3d1b545f(_hash) {
    wait(randomfloatrange(0.05, 0.2));
    self thread function_344aee09(_hash);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xd831e104, Offset: 0x6418
// Size: 0x2ae
function function_d4463404() {
    level endoncallback(&function_713b1c8, #"countdown_timer_done", #"hash_582be86269c7fecc", #"tut_6_barricade_dead", #"tut_6_razorwire_dead");
    self endoncallback(&function_713b1c8, #"death");
    level thread function_e96cc63f(1, "s_torque_tut_6_enemy_razorwire_balc", 1, 2, 1, 0, "bot_razorwire_balc");
    level thread function_e96cc63f(2, "s_torque_tut_6_enemy_razorwire", 1, 1, 1, 1, "bot_razorwire");
    wait(15);
    level notify(#"hash_3ce5abc259d8b041");
    waitframe(1);
    level thread function_e96cc63f(1, "s_torque_tut_6_enemy_barricade_balc", 1, 2, 1, 0, "bot_barricade_balc");
    level thread function_e96cc63f(2, "s_torque_tut_6_enemy_barricade", 1, 1, 1, 1, "bot_barricade");
    wait(15);
    level notify(#"hash_3ce5abc259d8b041");
    ct_utils::function_d00e0eeb();
    waitframe(1);
    level thread function_e96cc63f(1, "s_torque_tut_6_enemy_razorwire_balc", 1, 3, 1, 0, "bot_razorwire_balc");
    level thread function_e96cc63f(1, "s_torque_tut_6_enemy_barricade_balc", 1, 3, 1, 0, "bot_barricade_balc");
    level thread function_e96cc63f(2, "s_torque_tut_6_enemy_razorwire", 1, 3, 1, 1, "bot_razorwire_last");
    level thread function_e96cc63f(2, "s_torque_tut_6_enemy_barricade", 1, 3, 1, 1, "bot_barricade_last");
    wait(26);
    level notify(#"hash_3ce5abc259d8b041");
    wait(4);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x44bba649, Offset: 0x66d0
// Size: 0x20
function function_713b1c8(_hash) {
    level notify(#"hash_3ce5abc259d8b041");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x144c95f0, Offset: 0x66f8
// Size: 0xf4
function function_ceb8d558() {
    self endon(#"death");
    self thread ct_utils::function_5149c890(1);
    var_33ae7665 = self.targetname;
    s_loc = level.var_a76a5221[var_33ae7665][level.var_b6e6a025[var_33ae7665]];
    level.var_b6e6a025[var_33ae7665]++;
    if (level.var_b6e6a025[var_33ae7665] >= level.var_a76a5221[var_33ae7665].size) {
        level.var_b6e6a025[var_33ae7665] = 0;
    }
    self ct_utils::function_61d750d4(s_loc);
    self thread function_fb37c68(s_loc);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x3ec67a97, Offset: 0x67f8
// Size: 0x1e8
function function_fb37c68(s_loc) {
    self endoncallback(&function_fd651c5e, #"death");
    e_player = ct_utils::get_player();
    if (randomint(10) > 5) {
        str_wpn = #"smg_standard_t8";
    } else {
        str_wpn = #"ar_accurate_t8";
    }
    wpn = getweapon(str_wpn);
    self giveweapon(wpn);
    self switchtoweaponimmediate(wpn, 1);
    self.bot.var_b2b8f0b6 = 250;
    self.bot.var_e8c941d6 = 1000;
    self ct_bots::function_911f9e8f(e_player function_6e4b6ccc(s_loc.script_int));
    if (isdefined(s_loc.target)) {
        s_dest = struct::get(s_loc.target, "targetname");
        self ct_utils::function_1e7b75f2(s_dest);
    } else {
        self ct_utils::function_4caeacf6();
        self.var_38b6161f = 1;
    }
    self waittill(#"death");
    waitframe(1);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa038ea81, Offset: 0x69e8
// Size: 0x76
function function_fd651c5e(_hash) {
    if (!isdefined(level.var_82cd7b94)) {
        level.var_82cd7b94 = 0;
    }
    level.var_82cd7b94++;
    if (level.var_82cd7b94 > 5) {
        level notify(#"tut_6_motivate");
        level.var_82cd7b94 = 0;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xdde2cca6, Offset: 0x6a68
// Size: 0xfc
function function_e2a695f2() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 7;
    self setnormalhealth(1);
    level notify(#"colbounds_tut_windows_block_on");
    level thread function_3661baa8();
    do {
        self function_fac42259();
    } while(!(isdefined(level.var_e3b5a41e) && level.var_e3b5a41e));
    ct_utils::function_9aca2fa0("ct_action");
    level notify(#"hash_3ce5abc259d8b041");
    self ct_utils::function_1bb93418();
    self ct_vo::function_3ca1b77d(1);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xae059f20, Offset: 0x6b70
// Size: 0x382
function function_fac42259() {
    self endoncallback(&function_344aee09, #"death");
    level.var_e3b5a41e = 0;
    level notify(#"colbounds_tut_4_5_doorway_off");
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    level thread function_1e7b4cf9();
    self thread function_222141a5();
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_slide_2_nag");
    self thread ct_utils::function_61c3d59c(#"hash_15262616ac3924f0");
    self ct_utils::tutorial_goto("s_torque_tut_fin1_goto");
    level notify(#"hash_60e26e14a51c5211");
    level notify(#"colbounds_tut_4_5_doorway_on");
    self ct_vo::function_3ca1b77d(1);
    level thread function_907568bb();
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_event_1_attack_0"));
    level.var_e72728b8 = [];
    self function_b512a9bf(2);
    self function_b512a9bf(0);
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_smrt_cvr_good_place", "good_barricade_placement");
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_razor_wire_good_place", "good_razorwire_placement");
    self ct_utils::function_61c3d59c(#"hash_2325be4e764d2cd0");
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_event_1_attack_1"));
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_smrt_cvr_dmg", "good_barricade_damaged", 0, 0, 20);
    self thread ct_vo::function_625a37f9("vox_tvoi_tutor_torq_razor_wire_dmg", "good_razorwire_damaged", 0, 0, 20);
    wait(5);
    self thread function_e91ea518();
    self ct_utils::function_61c3d59c(#"hash_69bea6d7bb16646a");
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_event_1_arrive"));
    self fin1_enemies_spawn();
    level.var_e3b5a41e = 1;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x87629dd6, Offset: 0x6f00
// Size: 0x58
function function_e91ea518() {
    self endon(#"death");
    while (!(isdefined(level.var_e3b5a41e) && level.var_e3b5a41e)) {
        wait(30);
        level thread fin1_escalate();
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xeb59454a, Offset: 0x6f60
// Size: 0x134
function function_74d4f033(var_f3aa6dfe) {
    self endon(#"death");
    var_7dd5b77 = [];
    var_7dd5b77[2] = "s_torque_tut_fin1_goodplace_barricade";
    var_7dd5b77[1] = "s_torque_tut_fin1_goodplace_razorwire";
    var_9d1d9d2d = [];
    var_9d1d9d2d[2] = "good_barricade_placement";
    var_9d1d9d2d[1] = "good_razorwire_placement";
    var_7429705d = struct::get_array(var_7dd5b77[var_f3aa6dfe]);
    var_4cd2162 = arraygetclosest(self.origin, var_7429705d);
    var_effd527b = self function_9326b2b2(var_f3aa6dfe, var_4cd2162, 48);
    if (isdefined(var_effd527b) && var_effd527b) {
        level notify(var_9d1d9d2d[var_f3aa6dfe]);
    }
    self thread function_f22f1511(var_f3aa6dfe);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x31b050f6, Offset: 0x70a0
// Size: 0x17c
function function_f22f1511(var_f3aa6dfe) {
    level endon(#"combattraining_logic_finished");
    var_304623ae = [];
    var_304623ae[2] = "good_barricade_damaged";
    var_304623ae[1] = "good_razorwire_damaged";
    var_c3a1cb60 = [];
    var_c3a1cb60[2] = "vox_tvoi_tutor_torq_final_1_smrt_cvr_destroy";
    var_c3a1cb60[1] = "vox_tvoi_tutor_torq_final_1_wire_destroy";
    do {
        s_notify = undefined;
        s_notify = self waittill(#"damage", #"death");
        if (isdefined(s_notify.attacker) && s_notify.attacker.team === #"axis") {
            level notify(var_304623ae[var_f3aa6dfe]);
        }
    } while(isalive(self));
    if (isdefined(s_notify.attacker) && s_notify.attacker.team === #"axis") {
        ct_vo::function_831e0584(array(var_c3a1cb60[var_f3aa6dfe]));
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x8816481e, Offset: 0x7228
// Size: 0x100
function function_1e7b4cf9() {
    level.a_ai_allies = [];
    level.var_29e32c32 = struct::get_array("s_torque_tut_fin1_ally", "targetname");
    level.var_29e32c32 = array::sort_by_script_int(level.var_29e32c32, 1);
    level.var_21844d8c = 0;
    foreach (s_ally in level.var_29e32c32) {
        ct_bots::activate_bots(1, #"allies");
        wait(0.5);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc919da9b, Offset: 0x7330
// Size: 0x14a
function function_65f22190() {
    if (!self flag::exists("ally_vulnerable")) {
        self flag::init("ally_vulnerable");
    }
    self flag::clear("ally_vulnerable");
    self.overrideplayerdamage = &function_24e6adf3;
    s_loc = level.var_29e32c32[level.var_21844d8c];
    self ct_utils::function_61d750d4(s_loc);
    self.var_21844d8c = level.var_21844d8c;
    level.a_ai_allies[level.a_ai_allies.size] = self;
    self thread function_4740cfb1(s_loc);
    if (isdefined(s_loc.script_string)) {
        self.script_string = s_loc.script_string;
    }
    level.var_21844d8c++;
    if (level.var_21844d8c >= level.var_29e32c32.size) {
        level.var_21844d8c = 0;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x3bc1af19, Offset: 0x7488
// Size: 0x1a0
function function_4740cfb1(s_loc) {
    self endoncallback(&function_20547133, #"death");
    self clientfield::set("player_keyline_render", 1);
    a_str_wpns = array(#"smg_standard_t8", #"ar_accurate_t8");
    str_wpn = array::random(a_str_wpns);
    self ct_utils::give_weapon(str_wpn);
    self.bot.var_b2b8f0b6 = 100;
    self.bot.var_e8c941d6 = 250;
    self thread util::magic_bullet_shield();
    self ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32, 1, 0, 1);
    while (1) {
        if (randomint(100) > 50) {
            self bot_stance::crouch();
        } else {
            self bot_stance::stand();
        }
        wait(randomintrange(2, 4));
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc215c54d, Offset: 0x7630
// Size: 0x44
function function_20547133(_hash) {
    if (isdefined(level.var_79178f9) && level.var_79178f9) {
        level thread function_a854ca60();
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2236d102, Offset: 0x7680
// Size: 0x10c
function function_a854ca60() {
    a_str_vo = array("vox_tvoi_tutor_torq_team_1_down", "vox_tvoi_tutor_torq_team_2_down", "vox_tvoi_tutor_torq_team_all_down");
    if (level.var_5c91565b <= a_str_vo.size - 1) {
        e_player = ct_utils::get_player();
        e_player thread ct_vo::function_831e0584(array(a_str_vo[level.var_5c91565b]));
        level.var_5c91565b++;
        if (level.var_5c91565b == a_str_vo.size) {
            level flag::set("fin1_enemies_spawn_done");
            level notify(#"hash_5ead4664baf07eab");
            e_player ct_utils::function_49e0c5bc();
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5369a5bb, Offset: 0x7798
// Size: 0x184
function fin1_escalate() {
    level endon(#"combattraining_logic_finished");
    e_player = ct_utils::get_player();
    e_player endon(#"death");
    if (level.var_65a1b648 < level.var_29e32c32.size) {
        var_648823c3 = level.a_ai_allies[level.var_65a1b648];
        level.var_65a1b648++;
        var_648823c3 util::stop_magic_bullet_shield();
        var_648823c3 flag::set("ally_vulnerable");
        var_648823c3 thread function_1633d58c();
        level.var_ff8d53af = level.var_ff8d53af + 1;
        level.var_f0293ecb = level.var_f0293ecb + 1;
        level.var_9a350e30 = level.var_9a350e30 - 0.2;
        level notify(#"hash_3ce5abc259d8b041");
        wait(1);
        level thread function_e96cc63f(level.var_f0293ecb, "s_fin_enemy", 1, level.var_9a350e30, 2, 1, "bot_fin1_escalate");
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xed729041, Offset: 0x7928
// Size: 0x110
function function_1633d58c() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        if (isdefined(s_notify.attacker) && s_notify.attacker.team == #"axis") {
            self dodamage(s_notify.amount * 0.5, s_notify.position, s_notify.attacker, s_notify.inflictor, s_notify.part_name, s_notify.mod, s_notify.flags, s_notify.weapon);
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xfac34b23, Offset: 0x7a40
// Size: 0x18a
function fin1_enemies_spawn() {
    level endoncallback(&function_fd2b7387, #"combattraining_logic_finished");
    self endoncallback(&function_fd2b7387, #"death");
    ct_utils::function_9aca2fa0("ct_action2");
    level flag::clear("fin1_enemies_spawn_done");
    level.var_e8126cf6 = 0;
    level.var_65a1b648 = 0;
    level.var_5928e809 = 0;
    level.var_db968903 = 0;
    level.var_7f48145d = 0;
    level.var_5c91565b = 0;
    level.var_ff8d53af = 2;
    level.var_f0293ecb = 3;
    level.var_9a350e30 = 1.5;
    level.var_79178f9 = 1;
    level thread function_e96cc63f(level.var_f0293ecb, "s_fin_enemy", 1, level.var_9a350e30, 1, 1, "bot_fin1_start");
    level flag::wait_till("fin1_enemies_spawn_done");
    level.var_79178f9 = 0;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc259500b, Offset: 0x7bd8
// Size: 0x1a
function function_fd2b7387(_hash) {
    level.var_79178f9 = 0;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2b9cbf71, Offset: 0x7c00
// Size: 0x7a
function function_5d65fa2b() {
    var_6c754dc0 = randomintrange(3, 5);
    level.var_db968903++;
    level.var_7f48145d++;
    if (level.var_7f48145d >= var_6c754dc0) {
        level thread fin1_escalate();
        level.var_7f48145d = 0;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe3264e20, Offset: 0x7c88
// Size: 0xd2
function function_a67d04b7() {
    self endon(#"death");
    var_33ae7665 = self.targetname;
    s_loc = level.var_a76a5221[var_33ae7665][level.var_b6e6a025[var_33ae7665]];
    self ct_utils::function_61d750d4(s_loc);
    self thread function_d8b20bcd(s_loc);
    level.var_b6e6a025[var_33ae7665]++;
    if (level.var_b6e6a025[var_33ae7665] >= level.var_a76a5221[var_33ae7665].size) {
        level.var_b6e6a025[var_33ae7665] = 0;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbc2b977, Offset: 0x7d68
// Size: 0x87c
function function_d8b20bcd(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    if (!self flag::exists("fixate_on_player")) {
        self flag::init("fixate_on_player");
    }
    self flag::clear("fixate_on_player");
    if (level.var_e8126cf6 < 2) {
        a_str_wpns = array(#"smg_standard_t8", #"ar_accurate_t8", #"shotgun_pump_t8", #"sniper_powerbolt_t8");
    } else {
        a_str_wpns = array(#"smg_standard_t8", #"ar_accurate_t8", #"shotgun_pump_t8", #"lmg_standard_t8");
    }
    str_wpn = array::random(a_str_wpns);
    self ct_utils::give_weapon(str_wpn);
    if (str_wpn == #"sniper_powerbolt_t8") {
        self.b_sniper = 1;
        level.var_e8126cf6++;
    }
    e_player = ct_utils::get_player();
    a_s_locs = struct::get_array("s_torque_tut_fin_enemy_move", "script_noteworthy");
    var_65769d68 = struct::get_array("s_torque_tut_fin_enemy_sniper_pt", "script_noteworthy");
    self thread function_a1692d5d();
    self setentitytarget(e_player, 0.7);
    do {
        if (!self flag::get("fixate_on_player")) {
            self.e_target = self function_32d78b44();
            if (self.e_target !== e_player) {
                self ct_bots::function_911f9e8f(self.e_target, 0.5);
            }
            switch (self.e_target.var_d1da3a83) {
            case #"bot":
            case #"cover_wire":
            case #"cover_barricade":
                self.bot.var_b2b8f0b6 = 200;
                self.bot.var_e8c941d6 = 400;
                break;
            default:
                self.bot.var_b2b8f0b6 = 450;
                self.bot.var_e8c941d6 = 900;
                break;
            }
            if (str_wpn != #"sniper_powerbolt_t8" && !isbot(self.e_target)) {
                if (self.e_target.var_d1da3a83 == "cover_barricade" && !(isdefined(self.e_target.b_badplace) && self.e_target.b_badplace)) {
                    s_loc = undefined;
                    b_water_plant_intro_go_dust_ = arraycopy(self.e_target.b_water_plant_intro_go_dust_);
                    while (b_water_plant_intro_go_dust_.size > 0 && !isdefined(s_loc)) {
                        s_destroy = arraygetclosest(self.origin, b_water_plant_intro_go_dust_);
                        if (self canpath(self.origin, s_destroy.origin)) {
                            s_loc = s_destroy;
                            break;
                        } else {
                            arrayremovevalue(b_water_plant_intro_go_dust_, s_destroy);
                        }
                        waitframe(1);
                    }
                    if (!isdefined(s_loc)) {
                        self.e_target.b_badplace = 1;
                        s_loc = arraygetclosest(self.e_target.origin, a_s_locs);
                    }
                } else if (self canpath(self.origin, self.e_target.origin)) {
                    self ct_utils::function_4caeacf6();
                    self.var_38b6161f = 1;
                } else {
                    v_pos = getclosestpointonnavmesh(self.e_target.origin, 128, 32);
                    if (isdefined(v_pos)) {
                        self ct_utils::function_5b59f3b7(v_pos, self.angles, 64, 0, 0, 1);
                    } else {
                        self ct_utils::function_5b59f3b7(self.origin, self.angles, 64, 0, 0, 1);
                    }
                    wait(randomfloatrange(1, 3));
                    goto LOC_00000872;
                }
            } else {
                if (str_wpn == #"sniper_powerbolt_t8") {
                    self.bot.var_b2b8f0b6 = 50;
                    self.bot.var_e8c941d6 = 100;
                    s_loc = arraygetclosest(self.e_target.origin, var_65769d68, 200);
                    if (!isdefined(s_loc)) {
                        s_loc = arraygetclosest(self.origin, var_65769d68);
                    }
                } else {
                    if (isbot(self.e_target)) {
                        var_6fe8eca4 = "toshoot_" + self.e_target.script_string;
                        a_s_locs = struct::get_array(var_6fe8eca4, "script_string");
                        s_loc = array::random(a_s_locs);
                    }
                    if (!isdefined(s_loc)) {
                        s_loc = array::random(a_s_locs);
                    }
                }
                self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
                self waittill(#"goal");
                if (isdefined(s_loc.target)) {
                    self thread function_e32e98c9(s_loc);
                }
            }
            if (isdefined(self.e_target)) {
                util::waittill_level_any_timeout(3, self.e_target);
            } else {
                wait(3);
            }
        } else {
            if (!self canpath(self.origin, e_player.origin)) {
                self ct_utils::function_5b59f3b7(self.origin, self.angles, 32, 0, 0, 1);
            }
            self flag::wait_till_clear("fixate_on_player");
        LOC_00000872:
        }
    LOC_00000872:
    } while(1);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x438185f2, Offset: 0x85f0
// Size: 0x100
function function_a1692d5d() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    e_player = ct_utils::get_player();
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        if (s_notify.attacker === e_player) {
            self flag::set("fixate_on_player");
            self.e_target = e_player;
            self ct_bots::function_911f9e8f(self.e_target, 0.9);
            wait(5);
            self flag::clear("fixate_on_player");
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xb282ee66, Offset: 0x86f8
// Size: 0x270
function function_e32e98c9(s_loc) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (1) {
        a_s_loc = struct::get_array(s_loc.target, "targetname");
        if (a_s_loc.size > 1) {
            s_loc = array::random(a_s_loc);
        } else {
            s_loc = a_s_loc[0];
        }
        if (!self canpath(self.origin, s_loc.origin)) {
            self thread ct_utils::function_4caeacf6();
        } else {
            self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
            while (self canpath(self.origin, s_loc.origin)) {
                n_dist = distance(s_loc.origin, self.origin);
                if (n_dist < 32) {
                    break;
                }
                waitframe(1);
            }
        }
        var_c481f7e6 = randomfloatrange(0, 100);
        if (isdefined(s_loc.script_noteworthy) && s_loc.script_noteworthy == #"crouch" || var_c481f7e6 < 50) {
            self bot_stance::crouch();
        }
        n_wait = randomfloatrange(2, 4);
        wait(n_wait);
        if (randomint(100) > 50) {
            self bot_stance::stand();
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb29fbb5f, Offset: 0x8970
// Size: 0x3e0
function function_32d78b44() {
    e_player = ct_utils::get_player();
    e_player.var_d1da3a83 = "player";
    a_e_covers = [];
    if (isdefined(e_player.concertinawire) && isdefined(e_player.concertinawire.activelist)) {
        foreach (e_wire in e_player.concertinawire.activelist) {
            if (isalive(e_wire)) {
                e_wire.var_d1da3a83 = "cover_wire";
                a_e_covers[a_e_covers.size] = e_wire;
            }
        }
    }
    e_barricade = e_player function_6e4b6ccc(2);
    if (isalive(e_barricade)) {
        e_barricade.var_d1da3a83 = "cover_barricade";
        a_e_covers[a_e_covers.size] = e_barricade;
    }
    var_538664a6 = [];
    if (isdefined(level.a_ai_allies) && level.a_ai_allies.size > 0) {
        a_ai_bots = ct_bots::function_fbe3dcbb();
        foreach (ai_bot in a_ai_bots) {
            if (isalive(ai_bot) && ai_bot.team == #"allies" && isdefined(ai_bot.allowdeath) && ai_bot.allowdeath) {
                ai_bot.var_d1da3a83 = "bot";
                var_538664a6[var_538664a6.size] = ai_bot;
            }
        }
    }
    var_dce7716b = arraycombine(var_538664a6, a_e_covers, 0, 0);
    if (var_dce7716b.size > 0) {
        e_closest_target = arraygetclosest(self.origin, var_dce7716b);
        var_2f5df674 = distancesquared(self.origin, e_closest_target.origin);
    } else {
        var_2f5df674 = 25000000;
    }
    var_818b5e10 = distancesquared(self.origin, e_player.origin);
    var_3b8b1c86 = var_818b5e10 < var_2f5df674 && self canpath(self.origin, e_player.origin);
    if (var_3b8b1c86 || var_dce7716b.size == 0) {
        return e_player;
    } else {
        return e_closest_target;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xdf795a30, Offset: 0x8d58
// Size: 0xf4
function function_fee5ce70() {
    level endon(#"combattraining_logic_finished");
    level.var_8ca3c62 = 8;
    self setnormalhealth(1);
    level notify(#"colbounds_tut_windows_block_on");
    level thread function_3661baa8();
    self ct_vo::function_3ca1b77d(1);
    level flag::clear("fin2_killstreak_used");
    do {
        self function_b452b299();
    } while(!(isdefined(level.var_3ba25888) && level.var_3ba25888));
    self ct_vo::function_3ca1b77d(1);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xa3fb3d94, Offset: 0x8e58
// Size: 0x2da
function function_b452b299() {
    self endoncallback(&function_344aee09, #"death");
    level.var_3ba25888 = 0;
    level notify(#"colbounds_tut_4_5_doorway_off");
    while (isdefined(level.var_29324553) && level.var_29324553 || !(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
        waitframe(1);
    }
    self function_222141a5();
    level.var_e72728b8 = [];
    self ct_vo::function_3ca1b77d(1);
    level notify(#"colbounds_tut_4_5_doorway_on");
    level thread function_907568bb();
    level.var_ff8d53af = 5;
    level.var_f0293ecb = 7;
    level.var_9a350e30 = 1.5;
    self thread function_bfebe12d();
    if (!level flag::get("fin2_killstreak_earned")) {
        self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_2_score_0", "vox_tvoi_tutor_torq_final_2_score_1"));
    }
    level thread ct_utils::function_e96cc63f(5, "s_fin_enemy", 2, 2, 1, 1, "fin2_enemies");
    level flag::wait_till("fin2_killstreak_used");
    level notify(#"hash_3ce5abc259d8b041");
    waitframe(1);
    ct_utils::function_d00e0eeb();
    level thread ct_utils::function_e96cc63f(5, "s_fin_enemy", 5, 1, 1, 1, "fin2_enemies");
    wait(20);
    level notify(#"hash_3ce5abc259d8b041");
    function_c71d563f();
    ct_utils::function_9aca2fa0("ct_endgame");
    level notify(#"hash_1496d0fbb526a24a");
    ct_utils::function_49e0c5bc();
    level.var_3ba25888 = 1;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x4389ee34, Offset: 0x9140
// Size: 0x86
function function_c71d563f() {
    self endon(#"death");
    self thread function_60ad1028();
    self thread function_d04c80b2();
    while (!(isdefined(self.var_7175094a) && self.var_7175094a) && !(isdefined(self.var_87bacb64) && self.var_87bacb64)) {
        waitframe(1);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9dfd9067, Offset: 0x91d0
// Size: 0x42
function function_60ad1028() {
    self endon(#"death");
    self.var_7175094a = 0;
    ct_utils::function_d00e0eeb();
    self.var_7175094a = 1;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x32c6a375, Offset: 0x9220
// Size: 0x46
function function_d04c80b2() {
    self endon(#"death");
    self.var_87bacb64 = 0;
    self waittill(#"hash_71a1db99eb99dcff");
    self.var_87bacb64 = 1;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xe2ead78f, Offset: 0x9270
// Size: 0x3a4
function function_bfebe12d() {
    self endoncallback(&function_e178ad70, #"death");
    level.var_51ff7a58 = 0;
    wait(1);
    if (!level flag::get("fin2_killstreak_earned")) {
        ct_utils::function_e44c5b8e(#"swat_team", 10, 1);
        self thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillToEarnSWAT");
        self thread ct_utils::function_80bf685b(0);
        level.var_d1f07c87 = 0;
        waitframe(1);
        callback::on_player_killed_with_params(&function_78986232);
        self waittill(#"hash_50fd5d1e6267d529");
    } else {
        ct_utils::function_e44c5b8e(#"swat_team", 0, 1);
    }
    level.var_51ff7a58 = 1;
    level flag::set("fin2_killstreak_earned");
    self ct_utils::function_1bb93418();
    wait(1);
    var_ec746d30 = self gamepadusedlast() ? #"hash_68966a9a9f01485a" : #"hash_5aa86538a8f0dfa";
    self thread ct_utils::function_61c3d59c(var_ec746d30, undefined, undefined);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_2_strike_ready"));
    self thread ct_vo::function_261ed63c("vox_tvoi_tutor_torq_final_2_strike_ready_nag");
    self waittill(#"hash_6e666a0689c3fd62");
    ct_utils::function_9aca2fa0("ct_action2");
    level.b_killstreak_used = 1;
    self thread ct_utils::function_61c3d59c(#"hash_5c2b727f43f4c8ef");
    level notify(#"hash_60e26e14a51c5211");
    wait(5);
    self ct_vo::function_3ca1b77d(1);
    self ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_2_strike_approach"));
    wait(1);
    self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_2_strike_arrive"));
    level flag::set("fin2_killstreak_used");
    wait(8);
    var_bb3b2607 = self gamepadusedlast() ? #"hash_4beba6ce2b7174c7" : #"hash_7dc6bf042b71ba71";
    self thread ct_utils::function_61c3d59c(var_bb3b2607, undefined, undefined);
    function_e178ad70(#"hash_1e9ac26db38673e4");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xdb047777, Offset: 0x9620
// Size: 0x2c
function function_e178ad70(_hash) {
    callback::remove_on_player_killed_with_params(&function_78986232);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x23f0fb6d, Offset: 0x9658
// Size: 0x1a4
function function_78986232(params) {
    eattacker = params.eattacker;
    weapon = params.weapon;
    if (isplayer(eattacker) && !(isdefined(level.var_51ff7a58) && level.var_51ff7a58)) {
        cost = killstreaks::get_killstreak_momentum_cost(eattacker, #"swat_team");
        var_23efb519 = 10;
        var_595e41ee = 150;
        event = #"ekia";
        eventindex = level.scoreinfo[event][#"row"];
        eattacker globallogic_score::giveplayermomentumnotification(var_595e41ee, #"hash_480234a872bd64ac", undefined, 0, weapon, 0, eventindex, event, undefined);
        level.var_d1f07c87++;
        if (!eattacker ct_utils::function_a7540094()) {
            eattacker thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillToEarnSWAT");
        }
        eattacker thread ct_utils::function_80bf685b(var_595e41ee * level.var_d1f07c87);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 3, eflags: 0x0
// Checksum 0xfb4774f2, Offset: 0x9808
// Size: 0x168
function function_b2e3d55a(str_notify, var_6202642d = #"axis", var_64179396 = 1) {
    level endon(#"combattraining_logic_finished", #"hash_4daf98b666a39c1d");
    e_player = ct_utils::get_player();
    e_player endon(#"death");
    s_notify = undefined;
    s_notify = self waittill(#"death");
    var_4b3bb6d9 = isdefined(var_64179396) && var_64179396 && s_notify.attacker === e_player;
    if (!(isdefined(self.var_14dd0ac7) && self.var_14dd0ac7) && isdefined(s_notify.mod) && (!isdefined(s_notify.attacker) || s_notify.attacker.team === var_6202642d || var_4b3bb6d9)) {
        level notify(str_notify);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 6, eflags: 0x0
// Checksum 0x7f7d781a, Offset: 0x9978
// Size: 0x1f2
function vo_on_damage(str_vo, var_f4b1cabb = 1, n_rest = 10, var_515667fb = #"axis", str_mod, str_weapon) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    e_player = ct_utils::get_player();
    e_player endon(#"death");
    do {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        var_17ec8061 = !isdefined(s_notify.attacker) || s_notify.attacker.team == var_515667fb;
        var_d8d43f9a = !isdefined(str_mod) || s_notify.mod === str_mod;
        var_95ea2eec = !isdefined(str_weapon) || getweapon(str_weapon) === s_notify.weapon;
        if (var_17ec8061 && var_d8d43f9a && var_95ea2eec) {
            e_player ct_vo::function_3ca1b77d(1);
            e_player ct_vo::function_831e0584(array(str_vo));
        }
        wait(n_rest);
    } while(var_f4b1cabb);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 5, eflags: 0x0
// Checksum 0xc657cb4b, Offset: 0x9b78
// Size: 0x30c
function function_fde0ed2f(a_n_counts, spawnpts, n_rest = 0.25, b_randomize = 0, var_e9cd12e3 = 0) {
    self endoncallback(&function_8749da79, #"death", #"hash_5ead4664baf07eab");
    level.var_2c6e8cfe = 0;
    if (isarray(spawnpts)) {
        level.a_s_targets = [];
        a_str_spawns = spawnpts;
        foreach (str_spawns in a_str_spawns) {
            var_e47f1087 = struct::get_array(str_spawns, "targetname");
            level.a_s_targets = arraycombine(level.a_s_targets, var_e47f1087, 0, 0);
        }
    } else {
        level.a_s_targets = struct::get_array(spawnpts, "targetname");
    }
    if (b_randomize) {
        level.a_s_targets = array::randomize(level.a_s_targets);
    }
    foreach (n_count in a_n_counts) {
        if (var_e9cd12e3 == 0) {
            ct_bots::activate_bots(n_count, #"axis", "bot_enemy_wave");
        } else {
            for (i = 0; i <= n_count; i++) {
                ct_bots::activate_bots(1, #"axis", "bot_enemy_wave");
                wait(var_e9cd12e3);
            }
        }
        self ct_utils::function_d00e0eeb();
        wait(n_rest);
    }
    self thread function_8749da79(#"done");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x1a06e7c0, Offset: 0x9e90
// Size: 0x50
function function_8749da79(_hash) {
    level notify(#"hash_6ebe7e4ea0726f0b");
    if (_hash == #"done") {
        level notify(#"hash_7284521e58220f16");
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 7, eflags: 0x0
// Checksum 0x4a8598bd, Offset: 0x9ee8
// Size: 0x3c6
function function_e96cc63f(n_count = 3, spawnpts, var_810b40e6 = 1, var_4837ee77 = 1, var_32df2a60 = 1, b_randomize = 0, str_targetname = "fillspawn_enemies") {
    level endon(#"combattraining_logic_finished", #"hash_3ce5abc259d8b041");
    e_player = getplayers()[0];
    e_player endon(#"death");
    if (!isdefined(level.var_b6e6a025)) {
        level.var_b6e6a025 = [];
    }
    level.var_b6e6a025[str_targetname] = 0;
    if (!isdefined(level.var_a76a5221)) {
        level.var_a76a5221 = [];
    }
    if (isarray(spawnpts)) {
        a_s_targets = [];
        a_str_spawns = spawnpts;
        foreach (str_spawns in a_str_spawns) {
            var_e47f1087 = struct::get_array(str_spawns, "targetname");
            a_s_targets = arraycombine(a_s_targets, var_e47f1087, 0, 0);
        }
    } else {
        a_s_targets = struct::get_array(spawnpts, "targetname");
    }
    if (isdefined(b_randomize) && b_randomize) {
        a_s_targets = array::randomize(a_s_targets);
    }
    level.var_a76a5221[str_targetname] = a_s_targets;
    while (1) {
        a_enemies = function_3dd59a93(str_targetname);
        var_d24d310 = 0;
        wait(var_4837ee77);
        while (a_enemies.size < n_count) {
            n_to_spawn = n_count - a_enemies.size;
            if (n_to_spawn > var_810b40e6) {
                n_to_spawn = var_810b40e6;
            }
            ct_bots::activate_bots(n_to_spawn, #"axis", str_targetname);
            var_d24d310 = var_d24d310 + n_to_spawn;
            /#
                var_1411e20e = e_player ct_bots::function_dde6edbd();
            #/
            wait(var_4837ee77);
            a_enemies = function_3dd59a93(str_targetname);
        }
        if (b_randomize && var_d24d310 >= n_count) {
            level.var_a76a5221[str_targetname] = array::randomize(level.var_a76a5221[str_targetname]);
            var_d24d310 = 0;
        }
        wait(var_32df2a60);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xc8720431, Offset: 0xa2b8
// Size: 0xd6
function function_3dd59a93(str_targetname) {
    level endon(#"combattraining_logic_finished");
    a_e_potentials = ct_bots::function_fbe3dcbb();
    a_e_bots = [];
    foreach (e_potential in a_e_potentials) {
        if (e_potential.targetname === str_targetname) {
            a_e_bots[a_e_bots.size] = e_potential;
        }
    }
    return a_e_bots;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x967757a3, Offset: 0xa398
// Size: 0x802
function function_344aee09(_hash) {
    level endon(#"combattraining_logic_finished");
    if (!(isdefined(level.var_29324553) && level.var_29324553)) {
        level.var_29324553 = 1;
        level notify(#"hash_4daf98b666a39c1d");
        level.var_86b67c3f = 0;
        e_player = ct_utils::get_player();
        level notify(#"hash_582be86269c7fecc");
        level notify(#"hash_4c9c5fbc89779e64");
        level notify(#"hash_3ce5abc259d8b041");
        level notify(#"hash_360fb35e8476aec5");
        level notify(#"hash_269c201d6122a737");
        level notify(#"tutorial_goto_end");
        level notify(#"hash_60e26e14a51c5211");
        level notify(#"hash_4c2e751dd9e2bb57");
        level notify(#"hash_6ebe7e4ea0726f0b");
        waitframe(1);
        e_player thread ct_utils::function_1bb93418();
        if (isalive(level.var_7afae51f)) {
            level.var_7afae51f concertina_wire::function_4ee7d46a(1);
        }
        if (_hash == #"death") {
            n_wait = 1;
            if (level.var_8ca3c62 === 4) {
                e_player ct_vo::function_c72e58c1(#"died");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_rad_field_player_dead"));
                b_prompt = 0;
            } else if (level.var_8ca3c62 === 6 || level.var_8ca3c62 === 7) {
                e_player ct_vo::function_c72e58c1(#"died");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_event_1_player_dead"));
                b_prompt = 0;
            } else if (level.var_8ca3c62 === 8) {
                e_player thread ct_vo::function_c72e58c1(#"died");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_final_2_player_dead"));
                e_player thread swat_team::swat_cleanup();
                b_prompt = 0;
            }
            if (isdefined(b_prompt) && b_prompt) {
                e_player ct_utils::function_a61ebb46(#"hash_1502cac237754caf");
            }
            level thread lui::screen_fade_out(0.75);
        } else {
            n_wait = 2;
            if (_hash == #"tut_6_barricade_dead") {
                e_player ct_vo::function_c72e58c1(#"failed");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_smrt_cvr_destroy"));
                var_16b5c6bb = e_player gamepadusedlast() ? #"hash_4194c81053f07918" : #"hash_7b43013359063e4";
                ct_utils::function_a61ebb46(var_16b5c6bb);
                var_fd96aacc = "s_torque_tut_6_respawn";
            } else if (_hash == #"tut_6_razorwire_dead") {
                e_player ct_vo::function_c72e58c1(#"failed");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_razor_wire_destroy"));
                var_edd14440 = e_player gamepadusedlast() ? #"hash_16e6d107836c380a" : #"hash_618673f250fa320a";
                ct_utils::function_a61ebb46(var_edd14440);
                var_fd96aacc = "s_torque_tut_6_respawn";
            } else if (_hash == #"hash_34a524e09eb9209f") {
                e_player ct_vo::function_c72e58c1(#"failed");
                e_player thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_enemy_stuck_nag"));
                var_a139eb64 = e_player gamepadusedlast() ? #"hash_4762a2aaf0787460" : #"hash_1736a34805e7e1cc";
                ct_utils::function_a61ebb46(var_a139eb64);
                var_a2176ec6 = [];
                var_a2176ec6[1] = "s_torque_tut_1_respawn";
                var_a2176ec6[2] = "s_torque_tut_2_respawn";
                var_a2176ec6[3] = "s_torque_tut_3_respawn";
                var_a2176ec6[4] = "s_torque_tut_4_respawn";
                var_a2176ec6[5] = "s_torque_tut_5_respawn";
                var_a2176ec6[6] = "s_torque_tut_6_respawn";
                var_fd96aacc = var_a2176ec6[level.var_8ca3c62];
            }
            e_player thread ct_utils::function_79957328(undefined, var_fd96aacc);
            level waittill(#"hash_603de7ab282bcda9");
            e_player thread ct_utils::function_49e0c5bc(1);
            e_player ct_vo::function_3ca1b77d(1);
            var_3069da18 = 1;
        }
        e_player thread concertina_wire::function_42b34d5a();
        e_player thread smart_cover::function_b11be5dc();
        e_player thread ct_utils::function_49e0c5bc(1);
        e_player ct_utils::clear_killstreaks();
        wait(n_wait);
        if (isdefined(var_3069da18) && var_3069da18) {
            e_player setnormalhealth(1);
            level.var_86b67c3f = 1;
        } else {
            while (!(isdefined(level.var_86b67c3f) && level.var_86b67c3f)) {
                waitframe(1);
            }
            e_player ct_vo::function_3ca1b77d();
            level lui::screen_fade_in(0.75);
        }
        level.var_29324553 = 0;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 4, eflags: 0x0
// Checksum 0x96fe7f5, Offset: 0xaba8
// Size: 0x33c
function _enemy_setup(var_1640cf17, b_ignoreall = 1, var_bab91f2 = 32, var_cde63359 = 0) {
    level endon(#"combattraining_logic_finished");
    a_s_loc = struct::get_array(var_1640cf17, "targetname");
    a_s_loc = array::randomize(a_s_loc);
    foreach (var_6e392b7c in a_s_loc) {
        if (!isdefined(var_6e392b7c.e_occupant)) {
            s_loc = var_6e392b7c;
            s_loc.e_occupant = self;
            break;
        }
    }
    /#
        assert(isdefined(s_loc), "colbounds_tut_windows_block");
    #/
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    a_str_wpn = array(#"smg_standard_t8", #"ar_accurate_t8");
    self ct_bots::function_35e77034(getweapon(array::random(a_str_wpn)));
    self.bot.var_b2b8f0b6 = 450;
    self.bot.var_e8c941d6 = 900;
    s_dest = s_loc;
    if (isdefined(s_loc.target)) {
        s_dest = struct::get(s_loc.target, "targetname");
    }
    /#
        debugstar(s_dest.origin, 9999, (0, 0, 1));
    #/
    self thread ct_utils::function_5b59f3b7(s_dest.origin, s_dest.angles, var_bab91f2);
    self val::set("torque_tut_ignoreall", "ignoreall", 1);
    level.a_ai_targets[level.a_ai_targets.size] = self;
    if (s_loc.script_string === "razorwire_victim") {
        self thread function_a20738a(var_cde63359);
    }
    level thread function_331992ca(self, s_loc);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 2, eflags: 0x0
// Checksum 0xf7b3d9fc, Offset: 0xaef0
// Size: 0x4e
function function_331992ca(e_enemy, s_loc) {
    level endon(#"combattraining_logic_finished");
    e_enemy waittill(#"death");
    s_loc.e_occupant = undefined;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xba5cf1c7, Offset: 0xaf48
// Size: 0x162
function function_a20738a(var_fd986e47 = 0) {
    level endon(#"combattraining_logic_finished");
    self notify(#"hash_61dc8f3ee9a14061");
    waitframe(1);
    self endon(#"death", #"hash_61dc8f3ee9a14061");
    e_player = ct_utils::get_player();
    self.var_41f5536a = 0;
    e_razorwire = self function_d5935c84();
    if (issentient(e_razorwire)) {
        e_razorwire function_60d50ea4();
    }
    level notify(#"enemy_stuck_in_razorwire");
    self.var_ef59b90 = 6;
    self.var_41f5536a = 1;
    self thread _enemy_razorwire_flounder(e_razorwire);
    self thread ct_utils::function_1746776e();
    if (isdefined(var_fd986e47) && var_fd986e47) {
        self.ignoreall = 0;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xfe99aa7b, Offset: 0xb0b8
// Size: 0xf2
function function_d5935c84() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (1) {
        foreach (razorwire in level.var_87226c31.var_925bbb2) {
            if (!isdefined(razorwire)) {
                continue;
            }
            if (!isdefined(razorwire.trigger)) {
                continue;
            }
            if (self istouching(razorwire.trigger)) {
                return razorwire;
            }
        }
        waitframe(1);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xf37912b0, Offset: 0xb1b8
// Size: 0x398
function _enemy_razorwire_flounder(e_inflictor) {
    if (!isdefined(e_inflictor)) {
        return;
    }
    level endon(#"hash_4daf98b666a39c1d");
    self endon(#"death");
    if (isalive(e_inflictor)) {
        e_player = ct_utils::get_player();
        a_s_flounder = struct::get_array("razorwire_flounder", "script_noteworthy");
        s_flounder = arraygetclosest(self.origin, a_s_flounder);
        var_82eec69f = 0;
        var_9af37af8 = 1.5;
        var_bb87b2bc = 2;
        var_5c3e2c40 = 6;
        self thread ct_utils::function_df8f80c4(e_player, 1, 2);
        while (var_82eec69f < var_5c3e2c40) {
            if (isdefined(s_flounder.target)) {
                s_flounder = struct::get(s_flounder.target, "targetname");
                if (randomfloat(100) > 50) {
                    self bot_stance::crouch();
                } else {
                    self bot_stance::stand();
                }
                self setgoal(s_flounder.origin, 1, 1);
                self ct_bots::function_911f9e8f(e_player, 0.85);
            }
            var_82eec69f++;
            var_2ec2c819 = randomfloatrange(var_9af37af8, var_bb87b2bc);
            wait(var_2ec2c819);
        }
        var_e1333d7f = struct::get_array("razorwire_flounder_escape", "script_noteworthy");
        s_escape = arraygetclosest(self.origin, var_e1333d7f);
        self setgoal(s_escape.origin, 1, 1);
        self waittill(#"goal");
        self setgoal(self.origin, 1, 1);
        self.ignorall = 0;
        self ct_bots::function_911f9e8f(ct_utils::get_player(), 0.75);
        wait(0.5);
        self bottapbutton(0);
        wait(0.5);
        self bottapbutton(0);
        wait(0.5);
        self bottapbutton(0);
        wait(0.5);
        e_player notify(#"hash_34a524e09eb9209f");
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 3, eflags: 0x0
// Checksum 0x229360c2, Offset: 0xb558
// Size: 0x13e
function function_e1e35c8b(var_f3aa6dfe, a_s_loc, n_range = 32) {
    level endon(#"combattraining_logic_finished");
    var_b43f496 = 0;
    var_45006933 = [];
    var_45006933[2] = "barricade_placed_near_spot";
    var_45006933[1] = "razorwire_placed_near_spot";
    foreach (s_loc in a_s_loc) {
        self thread function_44776cd(var_f3aa6dfe, s_loc);
    }
    for (n_placed = 0; n_placed < a_s_loc.size; n_placed++) {
        self waittill(var_45006933[var_f3aa6dfe]);
    }
    var_b43f496 = 0;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 3, eflags: 0x0
// Checksum 0x768635e3, Offset: 0xb6a0
// Size: 0x526
function function_44776cd(var_f3aa6dfe, s_loc, n_range = 24) {
    level endon(#"combattraining_logic_finished");
    self endoncallback(&function_fb9249d1, #"death", #"hash_390f0b2fe23f5ee8");
    self endon(#"disconnect");
    while (isdefined(self.var_8209baa4) && self.var_8209baa4) {
        waitframe(1);
    }
    var_df82cc86 = [];
    var_df82cc86[2] = 2;
    var_df82cc86[1] = 0;
    self function_b512a9bf(var_df82cc86[var_f3aa6dfe]);
    var_b0d4d7bc = [];
    var_b0d4d7bc[2] = "smartcover_placed";
    var_b0d4d7bc[1] = "razorwire_placed";
    var_b4c85699 = [];
    var_b4c85699[2] = &smart_cover::function_b11be5dc;
    var_b4c85699[1] = &function_400149db;
    var_5930a601 = [];
    var_5930a601[2] = &function_eef69955;
    var_5930a601[1] = &function_9cd21c72;
    var_45006933 = [];
    var_45006933[2] = "barricade_placed_near_spot";
    var_45006933[1] = "razorwire_placed_near_spot";
    var_4633cf09 = [];
    var_4633cf09[2] = #"wpn_t8_eqp_smartcover_cover_blue_fac_10";
    var_4633cf09[1] = #"p8_fxanim_test_concertina_wire_mod";
    var_88b303ee = [];
    var_88b303ee[2] = #"hash_390cef32b1105c1d";
    var_88b303ee[1] = #"hash_5885b4abb984f9df";
    if (isstring(s_loc)) {
        s_loc = struct::get(s_loc, "targetname");
    }
    v_pos = s_loc.origin;
    v_fwd = anglestoforward(s_loc.angles);
    var_6c267b3 = vectornormalize((v_fwd[0], v_fwd[1], 0));
    self.mdl_hint = util::spawn_model(var_4633cf09[var_f3aa6dfe], v_pos, s_loc.angles);
    self.mdl_hint notsolid();
    self.mdl_hint clientfield::set("objective_glow", 1);
    self.mdl_hint ct_utils::function_6434a9f(0.1, 1, 0.25);
    playfx("player/fx8_plyr_spawn_distortion", v_pos, v_fwd * -1);
    n_range_sq = n_range * n_range;
    do {
        self waittill(var_b0d4d7bc[var_f3aa6dfe]);
        wait(0.5);
        e_cover = self function_6e4b6ccc(var_f3aa6dfe);
        var_af9bc380 = e_cover function_9326b2b2(var_f3aa6dfe, s_loc);
        if (!var_af9bc380) {
            self [[ var_b4c85699[var_f3aa6dfe] ]]();
            if (var_f3aa6dfe === 1) {
                self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_razor_wire_bad_place"));
            } else {
                self thread ct_vo::function_831e0584(array("vox_tvoi_tutor_torq_smrt_cvr_bad_place"));
            }
        }
    } while(!var_af9bc380);
    if (isdefined(e_cover)) {
        e_cover.b_valid = 1;
    }
    self notify(var_45006933[var_f3aa6dfe]);
    self thread [[ var_5930a601[var_f3aa6dfe] ]]();
    self notify(#"hash_390f0b2fe23f5ee8");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x66b92324, Offset: 0xbbd0
// Size: 0xb6
function function_fb9249d1(_hash) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"disconnect");
    self.var_8209baa4 = 1;
    if (isdefined(self.mdl_hint.waypoint)) {
        self.mdl_hint.waypoint ct_utils::function_f9ed304d();
    }
    self.mdl_hint clientfield::set("objective_glow", 0);
    self.mdl_hint delete();
    waitframe(1);
    self.var_8209baa4 = 0;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 3, eflags: 0x0
// Checksum 0xf4092d1d, Offset: 0xbc90
// Size: 0x1ba
function function_9326b2b2(var_f3aa6dfe, s_loc, n_range = 20) {
    n_range_sq = n_range * n_range;
    v_pos = s_loc.origin;
    v_fwd = anglestoforward(s_loc.angles);
    var_6c267b3 = vectornormalize((v_fwd[0], v_fwd[1], 0));
    n_dist_sq = distancesquared(self.origin, v_pos);
    b_in_range = n_dist_sq <= n_range_sq;
    var_afb005ee = anglestoforward(self.angles);
    var_bc976a18 = vectornormalize((var_afb005ee[0], var_afb005ee[1], 0));
    n_dot = vectordot(var_bc976a18, var_6c267b3);
    if (var_f3aa6dfe == 1) {
        var_fe9fdb90 = abs(n_dot) >= 0.95;
    } else {
        var_fe9fdb90 = n_dot >= 0.95;
    }
    return b_in_range && var_fe9fdb90;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc34d2233, Offset: 0xbe58
// Size: 0x16
function function_eef69955() {
    self notify(#"hash_1c913166e11fcd67");
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf96c6955, Offset: 0xbe78
// Size: 0xa0
function function_9cd21c72() {
    self notify(#"hash_312b7bff7032a041");
    foreach (concertinawire in self.concertinawire.var_a3aac76c) {
        if (isdefined(concertinawire)) {
            concertinawire connectpaths();
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2a24f465, Offset: 0xbf20
// Size: 0xe8
function function_400149db() {
    if (!isdefined(self) || !isdefined(self.concertinawire) || !isdefined(self.concertinawire.activelist)) {
        return;
    }
    foreach (concertinawire in self.concertinawire.activelist) {
        if (isdefined(concertinawire) && !(isdefined(concertinawire.b_valid) && concertinawire.b_valid)) {
            concertinawire concertina_wire::function_4ee7d46a(1);
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 3, eflags: 0x0
// Checksum 0x896c214d, Offset: 0xc010
// Size: 0xac
function function_6ad22c31(var_9a9deac6, var_227aa02e, str_objective = #"hash_5fadc5cf57233ef4") {
    level endon(#"combattraining_logic_finished");
    self ct_utils::function_1bb93418();
    level waittill(#"enemy_stuck_in_razorwire");
    if (isdefined(var_9a9deac6)) {
        self ct_vo::function_831e0584(var_9a9deac6);
    }
    self ct_utils::function_61c3d59c(str_objective, var_227aa02e);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x84200c7e, Offset: 0xc0c8
// Size: 0x204
function on_concertinawire_placed(newcover) {
    if (isdefined(level.var_bb9429c2)) {
        self [[ level.var_bb9429c2 ]](newcover);
    }
    if (self.team === #"axis") {
        level.var_7afae51f = newcover.concertinawire;
        level.var_7afae51f thread function_1df46b8d();
        self notify(#"hash_794fe961bd7a1e08");
    } else if (isdefined(self.concertinawire) && isdefined(self.concertinawire.var_a3aac76c)) {
        self notify(#"razorwire_placed");
        if (!isbot(self)) {
            self function_60d7db7f(newcover.concertinawire, 1);
            newcover.concertinawire function_84fcafbc();
            if (level.var_8ca3c62 === 7) {
                newcover.concertinawire thread function_74d4f033(1);
            }
            if (level.var_8ca3c62 === 7 || level.var_8ca3c62 === 8) {
                newcover.concertinawire thread function_c785404a();
            }
            if (level.var_8ca3c62 !== 6) {
                newcover.concertinawire connectpaths();
            }
            newcover.concertinawire.team = self.team;
            newcover.concertinawire thread function_e8bbfb11();
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x71209949, Offset: 0xc2d8
// Size: 0x5a
function function_6de225c7() {
    while (self.var_86a21346 !== &smart_cover::function_d2368084) {
        waitframe(1);
    }
    self.var_5b9c9f43 = &smart_cover::function_d2368084;
    self.var_86a21346 = &function_1689d4b;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3aefdfa8, Offset: 0xc340
// Size: 0x5a
function function_e8bbfb11() {
    while (self.var_86a21346 !== &concertina_wire::function_82c4beb0) {
        waitframe(1);
    }
    self.var_5b9c9f43 = &concertina_wire::function_82c4beb0;
    self.var_86a21346 = &function_1689d4b;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 12, eflags: 0x0
// Checksum 0xc66ab534, Offset: 0xc3a8
// Size: 0xd2
function function_1689d4b(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex) {
    if (eattacker.team === self.team) {
        return 0;
    }
    idamage = self [[ self.var_5b9c9f43 ]](einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, iboneindex, imodelindex);
    return int(idamage);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6971e257, Offset: 0xc488
// Size: 0x226
function function_84fcafbc() {
    self endon(#"death");
    v_right = anglestoright(self.angles);
    v_forward = anglestoforward(self.angles);
    var_10ed11b0 = self.origin + v_right * 32;
    var_dbfef697 = self.origin - v_right * 32;
    var_84e90289 = self.origin - v_forward * 92;
    /#
        debugstar(self.origin, 10000);
        debugstar(var_dbfef697, 10000, (0, 1, 0));
        debugstar(var_10ed11b0, 10000, (1, 0, 0));
    #/
    a_s_flounder = struct::get_array("razorwire_flounder", "script_noteworthy");
    var_7d172a46 = arraygetclosest(var_10ed11b0, a_s_flounder);
    var_7d172a46.origin = var_10ed11b0;
    var_f9acf4b = struct::get(var_7d172a46.target, "targetname");
    var_f9acf4b.origin = var_dbfef697;
    a_s_escapes = struct::get_array("razorwire_flounder_escape", "script_noteworthy");
    s_escape = arraygetclosest(self.origin, a_s_escapes);
    s_escape.origin = var_84e90289;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x54920e1, Offset: 0xc6b8
// Size: 0x22c
function function_1df46b8d(n_percentage = 0.25) {
    self endon(#"death");
    n_health_min = self.health * n_percentage;
    while (self.health > n_health_min) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        if (s_notify.mod == "MOD_MELEE_WEAPON_BUTT") {
            e_player = s_notify.attacker;
            e_player.health = e_player.health + int(s_notify.amount / 2);
            if (e_player.health > e_player.maxhealth) {
                e_player.health = e_player.maxhealth;
            }
            if (e_player.health < 50) {
                e_player.health = 50;
            }
            self dodamage(s_notify.amount, s_notify.position, s_notify.attacker, s_notify.inflictor, s_notify.part_name, s_notify.mod, s_notify.flags, s_notify.weapon);
        }
        waitframe(1);
    }
    self dodamage(self.health + 1000, self.origin, s_notify.attacker, s_notify.inflictor, undefined, "MOD_EXPLOSIVE", 1, getweapon(#"launcher_standard_t8"));
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbca5b9f5, Offset: 0xc8f0
// Size: 0x682
function on_smartcover_placed(newcover) {
    if (isdefined(level.var_d013d2e3)) {
        self [[ level.var_d013d2e3 ]](newcover);
    }
    if (isdefined(self.smartcover) && isdefined(self.smartcover.var_58e8b64d)) {
        self notify(#"smartcover_placed");
        function_1eaaceab(self.smartcover.var_58e8b64d);
        if (!isbot(self)) {
            self function_60d7db7f(newcover.smartcover, 2);
            newcover.smartcover thread function_6de225c7();
            var_786a241a = array(6, 7, 8);
            if (!isinarray(var_786a241a, level.var_8ca3c62)) {
                newcover.smartcover connectpaths();
            }
            if (level.var_8ca3c62 === 7) {
                newcover.smartcover thread function_74d4f033(2);
            }
            if (level.var_8ca3c62 === 7 || level.var_8ca3c62 === 8) {
                newcover.smartcover thread function_c785404a();
                e_cover = newcover.smartcover;
                var_15ef6cf8 = struct::get("s_barricade_destroy_fwd_left", "targetname");
                var_4a145539 = struct::get("s_barricade_destroy_fwd_right", "targetname");
                var_b1c99b8c = struct::get("s_barricade_destroy_back_left", "targetname");
                var_6730065e = struct::get("s_barricade_destroy_back_center", "targetname");
                var_d79d2df = struct::get("s_barricade_destroy_back_right", "targetname");
                v_fwd = anglestoforward(e_cover.angles);
                v_right = anglestoright(e_cover.angles);
                var_d877e7e8 = e_cover.origin - v_right * 64 + v_fwd * 70;
                var_52875b95 = e_cover.origin + v_right * 64 + v_fwd * 70;
                var_fb034023 = e_cover.origin - v_right * 64 - v_fwd * 64;
                var_e95f1cd7 = e_cover.origin - v_fwd * 64;
                var_9ef3080c = e_cover.origin + v_right * 64 - v_fwd * 64;
                var_aec0cd16 = 64;
                var_d42616a6 = 48;
                var_5e0a08e8 = getclosestpointonnavmesh(var_d877e7e8, var_aec0cd16, var_d42616a6);
                var_5e1d0902 = getclosestpointonnavmesh(var_52875b95, var_aec0cd16, var_d42616a6);
                var_28eee9d4 = getclosestpointonnavmesh(var_fb034023, var_aec0cd16, var_d42616a6);
                var_e089d8e3 = getclosestpointonnavmesh(var_e95f1cd7, var_aec0cd16, var_d42616a6);
                var_28f7e9e2 = getclosestpointonnavmesh(var_9ef3080c, var_aec0cd16, var_d42616a6);
                var_15ef6cf8.origin = var_5e0a08e8;
                var_4a145539.origin = var_5e1d0902;
                var_b1c99b8c.origin = var_28eee9d4;
                var_6730065e.origin = var_e089d8e3;
                var_d79d2df.origin = var_28f7e9e2;
                b_water_plant_intro_go_dust_ = array(var_15ef6cf8, var_4a145539, var_b1c99b8c, var_6730065e, var_d79d2df);
                e_cover.b_water_plant_intro_go_dust_ = [];
                foreach (s_destroy in b_water_plant_intro_go_dust_) {
                    if (isdefined(s_destroy.origin)) {
                        e_cover.b_water_plant_intro_go_dust_[e_cover.b_water_plant_intro_go_dust_.size] = s_destroy;
                    }
                }
            } else if (level.var_8ca3c62 === 4) {
                level.var_3ba8ccc1 = newcover.smartcover;
                level.var_d116fd0d = struct::get("s_torque_tut_4_barrier_dest", "targetname");
                v_fwd = anglestoforward(level.var_3ba8ccc1.angles);
                level.var_d116fd0d.origin = level.var_3ba8ccc1.origin + v_fwd * 72;
            }
        }
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x355dd9bd, Offset: 0xcf80
// Size: 0xb8
function function_c785404a() {
    self endon(#"death");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"damage");
        self dodamage(s_notify.amount, s_notify.position, s_notify.attacker, s_notify.inflictor, s_notify.part_name, s_notify.mod, s_notify.flags, s_notify.weapon);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 2, eflags: 0x0
// Checksum 0xb843db0e, Offset: 0xd040
// Size: 0x5e
function function_60d7db7f(var_de22a8df, var_f3aa6dfe) {
    if (!isdefined(self.var_bb1b065f)) {
        self.var_bb1b065f = [];
        self.var_bb1b065f[2] = undefined;
        self.var_bb1b065f[1] = undefined;
    }
    self.var_bb1b065f[var_f3aa6dfe] = var_de22a8df;
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x828149bc, Offset: 0xd0a8
// Size: 0x2e
function function_6e4b6ccc(var_f3aa6dfe) {
    if (isdefined(self.var_bb1b065f)) {
        return self.var_bb1b065f[var_f3aa6dfe];
    } else {
        return undefined;
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x8272e803, Offset: 0xd0e0
// Size: 0xa4
function function_b512a9bf(n_slot) {
    var_dee68e3f = [];
    var_dee68e3f[2] = #"ability_smart_cover";
    var_dee68e3f[0] = #"eq_concertina_wire";
    str_gadget = var_dee68e3f[n_slot];
    if (isdefined(level.var_e72728b8)) {
        arrayremovevalue(level.var_e72728b8, str_gadget);
    }
    self ct_gadgets::function_be6376db(n_slot);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0xd54f258d, Offset: 0xd190
// Size: 0x2b4
function function_907568bb(str_volume = "trig_torque_tut_finale_area") {
    level notify(#"hash_1496d0fbb526a24a");
    waitframe(1);
    level endoncallback(&function_a9832377, #"combattraining_logic_finished", #"hash_1496d0fbb526a24a");
    e_player = getplayers()[0];
    e_volume = getent(str_volume, "targetname");
    n_total = 0;
    n_mode = -1;
    while (1) {
        e_player = getplayers()[0];
        var_443af604 = 0;
        a_bots = e_player ct_bots::function_dde6edbd();
        foreach (bot in a_bots) {
            if (bot istouching(e_volume)) {
                var_443af604 = 1;
                break;
            }
        }
        if (e_player istouching(e_volume)) {
            if (var_443af604) {
                if (n_mode != 3) {
                    level clientfield::set("area_arrows", 4);
                    n_mode = 3;
                }
            } else if (n_mode != 1) {
                level clientfield::set("area_arrows", 2);
                n_mode = 1;
            }
        } else if (var_443af604) {
            if (n_mode != 2) {
                level clientfield::set("area_arrows", 3);
                n_mode = 2;
            }
        } else if (n_mode != 0) {
            level clientfield::set("area_arrows", 1);
            n_mode = 0;
        }
        waitframe(1);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 1, eflags: 0x0
// Checksum 0x48498ac, Offset: 0xd450
// Size: 0x2c
function function_a9832377(_hash) {
    level clientfield::set("area_arrows", 0);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 11, eflags: 0x0
// Checksum 0xb42bd121, Offset: 0xd488
// Size: 0x72
function overridedamage_player(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    return int(n_damage / 5);
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 11, eflags: 0x0
// Checksum 0xfb79a388, Offset: 0xd508
// Size: 0xa4
function function_24e6adf3(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    if (self flag::get("ally_vulnerable")) {
        return n_damage;
    } else {
        return int(n_damage / 10);
    }
}

// Namespace ct_torque_tutorial/ct_torque_tutorial
// Params 0, eflags: 0x0
// Checksum 0x82c3facc, Offset: 0xd5b8
// Size: 0x8
function function_16eca645() {
    /#
    #/
}

