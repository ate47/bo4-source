// Atian COD Tools GSC decompiler test
#using scripts\killstreaks\ai_tank_shared.gsc;
#using scripts\mp_common\gametypes\globallogic_score.gsc;
#using scripts\mp_common\gametypes\globallogic_audio.gsc;
#using scripts\mp_common\gametypes\ct_vo.gsc;
#using scripts\mp_common\gametypes\ct_utils.gsc;
#using scripts\mp_common\gametypes\ct_gadgets.gsc;
#using scripts\mp_common\gametypes\ct_bots.gsc;
#using scripts\mp_common\gametypes\ct_ai.gsc;
#using scripts\killstreaks\mp\ac130.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\spawnbeacon_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\bots\bot_stance.gsc;
#using scripts\core_common\array_shared.gsc;
#using script_5961deb533dad533;

#namespace namespace_56b8c026;

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xd3530f82, Offset: 0xf68
// Size: 0x64
function init() {
    level.progress_bar = luielembar::register("progress_bar");
    level.var_ae120f18 = array(#"hash_6b76ddbfb1149179");
    function_2232d333(0);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xcbec3d7d, Offset: 0xfd8
// Size: 0x24
function setup() {
    level clientfield::set("area_arrows_specialist", 7);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x19419b75, Offset: 0x1008
// Size: 0x74a
function function_c9ff0dce() {
    self.overrideplayerdamage = &callback_player_damage;
    if (self.team == #"allies") {
        self ct_utils::player_reset();
        if (!isbot(self)) {
            ct_utils::function_8f04870f();
            self thread function_fa3dd4f0();
            if (!isdefined(level.var_ad7c0539) || level.var_ad7c0539 < 9) {
                self thread ct_gadgets::function_1be7e4f(#"hero_annihilator");
            }
            if (isdefined(level.var_ad7c0539) && level.var_ad7c0539 >= 9) {
                n_slot = self ct_gadgets::get_slot(#"hero_annihilator");
                self thread ct_gadgets::function_4db6654a(n_slot, 99.6);
            }
            if (isdefined(level.var_e21c8bfa) && level.var_e21c8bfa) {
                self thread ct_utils::function_5ccd53d5(level.progress_bar);
            }
            if (isdefined(level.var_ad7c0539)) {
                switch (level.var_ad7c0539) {
                case 2:
                case 3:
                case 4:
                case 5:
                    self thread ct_gadgets::function_9dc27b4f(#"hero_annihilator", array(#"gadget_spawnbeacon", #"hero_annihilator"), array(#"gadget_spawnbeacon"));
                    break;
                case 9:
                    self thread ct_bots::function_fd2d220e(0);
                    s_loc = struct::get("s_beacon_safe_loc", "targetname");
                    v_loc = s_loc.origin;
                    v_ang = s_loc.angles;
                    if (isdefined(level.var_79cf1332) && level.var_79cf1332) {
                        var_6d7b4014 = function_7746c49c(100);
                        if (isdefined(var_6d7b4014)) {
                            v_loc = var_6d7b4014;
                        }
                    }
                    self setorigin(v_loc);
                    self setplayerangles(v_ang);
                    break;
                case 10:
                    if (isdefined(level.var_2b87f134)) {
                        level thread ct_vo::function_41e59aeb(array(#"hash_f3af6d858521980"), 1);
                    }
                    self thread function_2b612805("s_defend_hardpoint_obj", 500);
                    self thread ct_bots::function_fd2d220e(0);
                    break;
                case 11:
                    self thread ct_bots::function_fd2d220e(0);
                    break;
                default:
                    self thread ct_bots::function_aa870283(0, 1, 1, 1);
                    break;
                }
            }
        } else if (isdefined(level.var_ad7c0539)) {
            switch (level.var_ad7c0539) {
            case 6:
                self thread ct_utils::function_5149c890(1, 1);
                self thread function_2b612805(undefined, undefined);
                self thread function_58c62280(0, 1);
                break;
            case 9:
                self thread function_b3659644();
                self thread function_2b612805("s_courtyared_bot_guard_loc", 500);
                self thread function_58c62280(0, 1);
                break;
            case 10:
                self thread function_2b612805("s_defend_hardpoint_obj", 350);
                break;
            case 11:
                if (self.team == #"axis") {
                    self thread function_58c62280(0, 1);
                } else if (isdefined(level.var_e190d640) && level.var_e190d640) {
                    self thread function_99a579e2();
                } else {
                    self thread function_b3659644();
                    self thread function_2b612805("s_ai_killstreak_guard", 1400);
                }
                break;
            }
        }
    } else if (isdefined(level.var_ad7c0539)) {
        switch (level.var_ad7c0539) {
        case 3:
        case 4:
        case 8:
            self thread function_58c62280(0, 1);
            break;
        case 5:
        case 9:
            self thread function_b3659644();
            break;
        case 2:
        case 10:
        default:
            self thread function_58c62280(0, 0);
            break;
        }
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x9bb9116c, Offset: 0x1760
// Size: 0x4c
function function_b3659644() {
    self endon(#"death");
    self thread ct_utils::function_5149c890(1, 1);
    self thread function_58c62280(0, 0);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 11, eflags: 0x0
// Checksum 0xb4da026b, Offset: 0x17b8
// Size: 0x17e
function callback_player_damage(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    if (!isdefined(level.var_ad7c0539)) {
        return n_damage;
    }
    if (isdefined(level.var_ad7c0539)) {
        if (!isbot(self)) {
            if (isdefined(level.var_e190d640) && level.var_e190d640) {
                self.health++;
                n_damage = 1;
            }
            switch (level.var_ad7c0539) {
            case 4:
                n_damage = 5;
                break;
            }
        } else {
            switch (level.var_ad7c0539) {
            case 10:
                if (self.team == #"axis" && isdefined(e_inflictor) && isbot(e_inflictor)) {
                    n_damage = n_damage * 4;
                }
                break;
            }
        }
    }
    return n_damage;
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 9, eflags: 0x0
// Checksum 0xb9ffb79b, Offset: 0x1940
// Size: 0x1ee
function function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (self.team == #"allies") {
        if (isdefined(level.var_ad7c0539)) {
            switch (level.var_ad7c0539) {
            case 10:
                if (!isbot(self) && isdefined(level.var_2b87f134)) {
                    level thread ct_vo::function_831e0584(array(#"hash_60353ddba57b41a8"), 1);
                }
                break;
            }
        }
    } else {
        if (!isbot(einflictor)) {
            level.var_a86320e8 = gettime() / 1000;
            if (!isdefined(level.var_62dd3f4a)) {
                level.var_62dd3f4a = 0;
            }
            level.var_62dd3f4a++;
            if (level.var_62dd3f4a >= 20) {
                level.var_62dd3f4a = 20;
            }
            if (isdefined(level.var_e190d640) && level.var_e190d640) {
                e_player = ct_utils::get_player();
                e_player thread ct_utils::function_80bf685b(20 - level.var_62dd3f4a);
            }
        }
        self.isinuse = 0;
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x47fd9b08, Offset: 0x1b38
// Size: 0x6ec
function function_9b9525e9() {
    level endon(#"combattraining_logic_finished");
    function_e94f91dd();
    level.var_e6db911d = 1;
    level.var_6a0c3e3e = 1;
    function_2232d333(0);
    level.allowspecialistdialog = 0;
    level.var_77e9434e = 0;
    level thread ct_utils::function_9ab507a9("begin_collision", "start_begin_collision", "stop_begin_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("begin_side_collision", "start_begin_side_collision", "stop_begin_side_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("event1_collision", "start_event1_collision", "stop_event1_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("event1_enter_collision", "start_event1_enter_collision", "stop_event1_enter_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("courtyard_collision", "start_courtyard_collision", "stop_courtyard_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("courtyard_circle_collision", "start_courtyard_circle_collision", "stop_courtyard_circle_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("courtyard_collision_door", "start_courtyard_collision_door", "stop_courtyard_collision_door", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("courtyard_collision_beacon", "start_courtyard_collision_beacon", "stop_courtyard_collision_beacon", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("courtyard_collision_beacon_exit_door", "start_courtyard_collision_beacon_exit_door", "stop_courtyard_collision_beacon_exit_door", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("5_targets_collision", "start_5_targets_collision", "stop_5_targets_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("5_targets_exit_collision", "start_5_targets_exit_collision", "stop_5_targets_exit_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("spawn_beacon_collision", "start_spawn_beacon_collision", "stop_spawn_beacon_collision", undefined, 0, 0);
    level thread ct_utils::function_9ab507a9("spawn_beacon_enter_collision", "start_spawn_beacon_enter_collision", "stop_spawn_beacon_enter_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("spawn_beacon_exit_collision", "start_spawn_beacon_exit_collision", "stop_spawn_beacon_exit_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("defend_hardpoint_collision", "start_defend_hardpoint_collision", "stop_defend_hardpoint_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("defend_hp_collision_exit_door", "start_defend_hp_collision_exit_door", "stop_defend_hp_collision_exit_door", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("approach_killstreak_collision", "start_approach_killstreak_collision", "stop_approach_killstreak_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("killstreak_collision", "start_killstreak_collision", "stop_killstreak_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("active_killstreak_collision", "start_active_killstreak_collision", "stop_active_killstreak_collision", undefined, 1, 0);
    a_nodes = getnodearray("disable_node", "script_noteworthy");
    foreach (node in a_nodes) {
        setenablenode(node, 0);
    }
    level.var_d4668c34 = 1;
    level thread function_7e060369();
    level.var_2fa4efc2 = &function_2fa4efc2;
    level.var_fa06889a = 0;
    level thread function_283155c3();
    if (function_8b1a219a()) {
        level thread function_1234c415();
    }
    level.var_ad7c0539 = 1;
    function_6cfeee53();
    level.var_ad7c0539 = 2;
    function_490f8078();
    level.var_ad7c0539 = 3;
    function_9f3fe320();
    level.var_ad7c0539 = 4;
    function_f6df6250();
    level.var_ad7c0539 = 5;
    function_f36aa3f0();
    level.var_ad7c0539 = 6;
    function_977b4171();
    level.var_ad7c0539 = 7;
    function_95e6fae3();
    level.var_ad7c0539 = 8;
    function_c8e681c8();
    level.var_ad7c0539 = 9;
    function_f036b362();
    level.var_ad7c0539 = 10;
    function_4bb467a();
    level.var_ad7c0539 = 11;
    function_c43189cd();
    ct_utils::onboarding_complete();
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x5115e699, Offset: 0x2230
// Size: 0x5f8
function function_6cfeee53() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003(undefined);
    level notify(#"start_begin_collision");
    level notify(#"start_begin_side_collision");
    level notify(#"start_event1_enter_collision");
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_teach_annihilator_goto_obj", array(#"hero_annihilator", #"gadget_spawnbeacon"), 0, undefined, 30);
    level notify(#"stop_nag");
    ct_utils::function_e9ab1003("s_teach_annihilator_goto_obj");
    level notify(#"stop_begin_collision");
    level notify(#"start_event1_collision");
    ct_vo::function_831e0584(array(#"hash_5aafec95295f15a1", #"hash_5aafea95295f123b"), 1);
    level.var_e72728b8 = array(#"gadget_spawnbeacon");
    e_player = ct_utils::get_player();
    var_f4ae3365 = e_player gamepadusedlast() ? #"hash_35f37327f50369b4" : #"hash_625da864ae1f050";
    e_player thread ct_utils::function_61c3d59c(var_f4ae3365, undefined);
    level thread ct_vo::function_14b08e49(array(#"hash_17674b4f74a1fbc7"), "stop_nag");
    wpn_annihilator = getweapon(#"hero_annihilator");
    while (e_player getcurrentweapon() !== wpn_annihilator) {
        waitframe(1);
    }
    level notify(#"stop_nag");
    ct_utils::function_c2a10fc();
    level thread function_f624b4a4();
    ct_vo::function_831e0584(array(#"hash_a8ab4cbec4fd622"), 1);
    wait(0.1);
    while (!(isdefined(level.var_7b83b757) && level.var_7b83b757)) {
        if (!(isdefined(level.var_bf847351) && level.var_bf847351)) {
            e_player = ct_utils::get_player();
            e_player thread ct_utils::function_61c3d59c(#"hash_6d04a35f4ee1b01", undefined);
            s_loc = struct::get("s_vase_target", "targetname");
            waypoint = ct_utils::create_waypoint(#"hash_43f27b76957da4d2", s_loc.origin, s_loc.angles, #"any", undefined, undefined, undefined);
            level thread ct_vo::function_14b08e49(array(#"hash_99658206c49b689"), "stop_nag");
            while (!(isdefined(level.var_96358ab6) && level.var_96358ab6)) {
                waitframe(1);
            }
            level notify(#"stop_nag");
            level.var_96358ab6 = undefined;
            waypoint ct_utils::function_f9ed304d();
            ct_utils::function_c2a10fc();
        }
        if (isdefined(level.var_7b83b757) && level.var_7b83b757) {
            break;
        }
        break;
    }
    ct_vo::function_831e0584(array(#"hash_1bf1a65a6d920456"), 1);
    level notify(#"vase_destroyed");
    wait(1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xe7e6e865, Offset: 0x2830
// Size: 0x18e
function function_f624b4a4() {
    level endon(#"combattraining_logic_finished", #"vase_destroyed");
    level.var_7b83b757 = undefined;
    level.var_bf847351 = undefined;
    while (1) {
        e_trigger = getent("t_damage_vase", "targetname");
        e_trigger trigger::wait_till();
        level.var_7b83b757 = undefined;
        level.var_bf847351 = undefined;
        s_loc = struct::get("s_vase_loc", "targetname");
        physicsexplosionsphere(s_loc.origin, 192, 100, 32);
        playsoundatposition(#"hash_3b38c48f1faa172b", (0, -1588, 60));
        level.var_96358ab6 = 1;
        e_player = ct_utils::get_player();
        if (e_player adsbuttonpressed()) {
            level.var_7b83b757 = 1;
        } else {
            level.var_bf847351 = 1;
        }
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x84d6d977, Offset: 0x29c8
// Size: 0x204
function function_490f8078() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003("s_teach_annihilator_goto_obj");
    ct_vo::function_831e0584(array(#"hash_1bf1a45a6d9200f0"), 1);
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_4d31622bf7385a03", undefined);
    level.var_72c3ea74 = struct::get_array("s_seraph_soldier_loc_1", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    level thread ct_vo::function_14b08e49(array(#"hash_680c0fc6b66455c8"), "stop_nag");
    wait(1);
    ct_vo::function_831e0584(array(#"hash_1bf1a75a6d920609"), 1);
    while (!isdefined(level.var_49674a21)) {
        waitframe(1);
    }
    while (isalive(level.var_49674a21)) {
        waitframe(1);
    }
    level notify(#"stop_nag");
    ct_utils::function_c2a10fc();
    wait(0.1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xc1c52da2, Offset: 0x2bd8
// Size: 0x804
function function_9f3fe320() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003("s_teach_annihilator_goto_obj");
    var_f8323e03 = 0;
    var_18f411e2 = 0;
    while (!var_18f411e2) {
        level.var_e72728b8 = array(#"gadget_spawnbeacon");
        if (!var_f8323e03) {
            ct_vo::function_831e0584(array(#"hash_611d337533c13e59"), 1);
        }
        wpn_annihilator = getweapon(#"hero_annihilator");
        e_player = ct_utils::get_player();
        if (e_player getcurrentweapon() !== wpn_annihilator) {
            var_8131dc5a = e_player gamepadusedlast() ? #"hash_35f37327f50369b4" : #"hash_625da864ae1f050";
            e_player thread ct_utils::function_61c3d59c(var_8131dc5a, undefined);
            level thread ct_vo::function_14b08e49(array(#"hash_17674b4f74a1fbc7"), "stop_nag");
            wpn_annihilator = getweapon(#"hero_annihilator");
            while (e_player getcurrentweapon() !== wpn_annihilator) {
                waitframe(1);
            }
            ct_utils::function_c2a10fc();
            level notify(#"stop_nag");
        }
        e_player = ct_utils::get_player();
        e_player thread ct_utils::function_61c3d59c(#"hash_36919b9e4dab2736", undefined);
        level.var_30f6fd66 = 0;
        level.var_1e06f070 = 1;
        level.var_72c3ea74 = struct::get_array("s_seraph_strafing_bot_stationary", "targetname");
        level.var_da5432a2 = 0;
        level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
        wait(0.5);
        level.var_1e06f070 = undefined;
        level.var_72c3ea74 = struct::get_array("s_seraph_soldier_loc_2", "targetname");
        level.var_da5432a2 = 0;
        level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
        if (!var_f8323e03) {
            level thread ct_vo::function_831e0584(array(#"hash_611d327533c13ca6"));
            var_f8323e03 = 1;
        }
        level thread function_98126bff();
        wait(1);
        level thread ct_vo::function_14b08e49(array(#"hash_337fb17d0fb110ef"), "stop_nag");
        b_success = 0;
        while (1) {
            e_player = getplayers()[0];
            a_bots = e_player ct_bots::function_dde6edbd();
            if (!level.var_30f6fd66 && a_bots.size == 2) {
                level.var_30f6fd66 = 1;
            }
            if (level.var_30f6fd66 > 0) {
                level notify(#"strafing_kill");
                waitframe(1);
                if (isdefined(level.var_49becb72) && level.var_49becb72) {
                    setslowmotion(0.15, 1, 0.2);
                }
                wait(0.1);
                level notify(#"stop_nag");
                e_player = ct_utils::get_player();
                if (level.var_30f6fd66 == 2) {
                    if (a_bots.size == 1 && !(isdefined(a_bots[0].var_5f67e634) && a_bots[0].var_5f67e634)) {
                        v_forward = anglestoforward(e_player.angles);
                        v_dir = vectornormalize(a_bots[0].origin - e_player.origin);
                        dp = vectordot(v_forward, v_dir);
                        if (dp > 0.996) {
                            level.var_30f6fd66++;
                            a_bots[0].var_5f67e634 = undefined;
                        }
                    }
                }
                if (level.var_30f6fd66 == 3) {
                    e_player = ct_utils::get_player();
                    a_bots = e_player ct_bots::function_dde6edbd();
                    foreach (bot in a_bots) {
                        bot ct_bots::disablebot();
                    }
                    var_18f411e2 = 1;
                    b_success = 1;
                    break;
                } else {
                    ct_vo::function_41e59aeb(array(#"hash_4983032b661f79cf"), 1);
                    level thread ct_utils::function_c561377e(0.5, 1);
                    ct_utils::function_79957328(undefined);
                    level thread ct_vo::function_14b08e49(array(#"hash_337fb17d0fb110ef"), "stop_nag");
                    break;
                }
            }
            waitframe(1);
        }
    }
    ct_utils::function_c2a10fc();
    level notify(#"strafing_complete");
    ct_vo::function_831e0584(array(#"hash_71c9e6431d4f98f4"), 1);
    wait(0.1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xaced80ce, Offset: 0x33e8
// Size: 0x1ae
function function_98126bff() {
    level endon(#"combattraining_logic_finished", #"strafing_complete", #"strafing_kill");
    s_loc = struct::get("s_seraph_strafing_bot_stationary", "targetname");
    v_forward = anglestoforward(s_loc.angles) * -1;
    s_origin = struct::get("s_strafe_origin", "targetname");
    var_2272c425 = 1;
    level.var_49becb72 = 0;
    while (1) {
        level waittill(#"hash_6510d558060bc3f3");
        if (var_2272c425) {
            wait(1.18);
            var_2272c425 = 0;
        } else {
            wait(1.43);
            var_2272c425 = 1;
        }
        level.var_49becb72 = 1;
        setslowmotion(1, 0.15, 0.2);
        wait(0.5);
        level.var_49becb72 = 0;
        setslowmotion(0.15, 1, 0.2);
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xeb9dd167, Offset: 0x35a0
// Size: 0x254
function function_f6df6250() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003("s_teach_annihilator_goto_obj");
    level.var_e72728b8 = array(#"gadget_spawnbeacon");
    level.var_72c3ea74 = struct::get_array("s_seraph_soldier_loc_3", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    wait(0.5);
    ct_vo::function_831e0584(array(#"hash_71c9e7431d4f9aa7"), 1);
    level thread ct_vo::function_831e0584(array(#"hash_71c9e8431d4f9c5a"), 1);
    level notify(#"start_firing");
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_a270385be3632ec", undefined);
    level thread ct_vo::function_14b08e49(array(#"hash_59491b5d33d05906"), "stop_nag");
    ct_utils::function_654280be();
    level notify(#"stop_nag");
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_5b98b949240b7fba"), 1);
    wait(0.1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x9ef79934, Offset: 0x3800
// Size: 0x520
function function_f36aa3f0() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003("s_5_enemies_respawn_loc");
    level notify(#"stop_event1_collision");
    level notify(#"stop_event1_enter_collision");
    level notify(#"start_5_targets_collision");
    level notify(#"start_5_targets_exit_collision");
    a_str_vo = array(#"hash_5b98ba49240b816d");
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_7ae3c7f801226d64", a_str_vo);
    wait(0.1);
    ct_vo::function_3ca1b77d();
    ct_utils::function_c2a10fc();
    while (1) {
        n_start_time = gettime() / 1000;
        var_fcb16eeb = 0;
        n_bomb_timer = int(gettime() + 1000 + int(30 * 1000));
        setmatchflag("bomb_timer_a", 1);
        setbombtimer("A", n_bomb_timer);
        waitframe(1);
        e_player = ct_utils::get_player();
        e_player thread ct_utils::function_61c3d59c(#"hash_7ae3c7f801226d64", undefined);
        b_timeout = 0;
        level.var_72c3ea74 = struct::get_array("s_seraph_soldier_loc_4", "targetname");
        level.var_da5432a2 = 0;
        level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
        wait(0.2);
        e_player = ct_utils::get_player();
        while (1) {
            if (!(isdefined(var_fcb16eeb) && var_fcb16eeb)) {
                n_time = gettime() / 1000;
                dt = n_time - n_start_time;
                if (dt >= 15) {
                    level thread ct_vo::function_831e0584(array(#"hash_76c99f76acb67f37"));
                    var_fcb16eeb = 1;
                }
            }
            if (!isalive(e_player)) {
                break;
            }
            a_bots = e_player ct_bots::function_dde6edbd();
            if (a_bots.size == 0) {
                break;
            }
            var_f08fde43 = function_4c27be22("A");
            currenttime = gettime();
            if (currenttime > var_f08fde43) {
                b_timeout = 1;
                break;
            }
            waitframe(1);
        }
        setbombtimer("A", 0);
        setmatchflag("bomb_timer_a", 0);
        if (!b_timeout) {
            if (isalive(e_player)) {
                break;
            }
        }
        ct_utils::function_c561377e(undefined);
        ct_utils::function_c2a10fc();
        ct_vo::function_3ca1b77d();
        level thread ct_vo::function_831e0584(array(#"hash_3fbc06328c14736e"), 1);
        ct_utils::function_79957328(undefined);
    }
    ct_utils::function_c2a10fc();
    ct_vo::function_831e0584(array(#"hash_68cad384570d8bd8"), 1);
    level notify(#"stop_5_targets_exit_collision");
    wait(0.1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x557538e1, Offset: 0x3d28
// Size: 0x664
function function_977b4171() {
    level endon(#"combattraining_logic_finished");
    function_2232d333(1);
    level.var_e72728b8 = array(#"gadget_spawnbeacon", #"hero_annihilator");
    level thread ct_vo::function_831e0584(array(#"hash_68cad484570d8d8b"), 1);
    level notify(#"start_spawn_beacon_collision");
    level notify(#"start_spawn_beacon_exit_collision");
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_tac_deploy_obj", array(#"hero_annihilator", #"gadget_spawnbeacon"), 0, undefined, 35);
    level notify(#"stop_nag");
    ct_utils::function_e9ab1003("s_tac_deploy_obj");
    level notify(#"start_spawn_beacon_enter_collision");
    level notify(#"stop_begin_side_collision");
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_2a2e135eb8b81ce7", undefined);
    ct_vo::function_41e59aeb(array(#"hash_68cad584570d8f3e"), 1);
    level.var_e72728b8 = array(#"hero_annihilator");
    s_loc = struct::get("s_tac_deploy_loc", "targetname");
    var_93f356cc = ct_utils::function_9a283f84(s_loc, #"wpn_t8_eqp_spawnbeacon_world");
    var_93f356cc clientfield::set("animate_spawn_beacon", 1);
    var_93f356cc.angles = (0, 0, 0);
    level thread ct_vo::function_14b08e49(array(#"hash_1ff67c7d157a8f9a"), "stop_nag");
    s_loc = struct::get("s_tac_deploy_loc", "targetname");
    while (1) {
        e_player = ct_utils::get_player();
        e_player thread ct_utils::function_61c3d59c(#"hash_446da0659a9ea1e9", undefined);
        level.var_e72728b8 = array(#"hero_annihilator");
        level waittill(#"friendly_spawn_beacon");
        n_dist = distance(level.var_2b87f134.origin, s_loc.origin);
        if (n_dist < 40) {
            break;
        }
        level.var_2b87f134 thread spawn_beacon::function_a9ff3efb(0);
        level.var_2b87f134 = undefined;
        e_player = ct_utils::get_player();
        e_player thread ct_utils::function_61c3d59c(#"hash_7dfcc9aa077909e7", undefined);
        level.var_e72728b8 = array(#"hero_annihilator", #"gadget_spawnbeacon");
        wait(2);
        ct_vo::function_831e0584(array(#"hash_5aeed2f2f83790f1"), 1);
        ct_utils::function_c2a10fc();
        wait(0.1);
    }
    level notify(#"stop_nag");
    var_93f356cc delete();
    ct_utils::function_c2a10fc();
    level thread ct_vo::function_831e0584(array(#"hash_4e2dcfc26061039a"), 1);
    wait(0.5);
    level.var_72c3ea74 = struct::get_array("s_seraph_soldier_loc_5_1", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"allies");
    wait(1);
    level.var_72c3ea74 = struct::get_array("s_seraph_soldier_loc_5_2", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"allies");
    ct_vo::function_3ca1b77d();
    wait(0.1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x619ae0d4, Offset: 0x4398
// Size: 0x5e2
function function_95e6fae3() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003(undefined);
    level notify(#"stop_spawn_beacon_exit_collision");
    level notify(#"start_courtyard_circle_collision");
    a_s_locs = struct::get_array("s_chopper_attack_soldier_loc", "targetname");
    a_bots = ct_bots::function_fbe3dcbb();
    for (i = 0; i < a_bots.size; i++) {
        bot = a_bots[i];
        s_loc = a_s_locs[i];
        if (i == 0) {
            n_delay = 0.1;
        } else {
            n_delay = 0.4;
        }
        bot thread function_322f5659(s_loc, n_delay);
    }
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_chopper_attack_loc", array(#"hero_annihilator", #"gadget_spawnbeacon"), 1, undefined, 50);
    level notify(#"stop_nag");
    ct_utils::function_e9ab1003(undefined);
    level notify(#"stop_courtyard_circle_collision");
    level thread ct_vo::function_831e0584(array(#"hash_25909e8e5ca28609"));
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_276c71244969e7f5", undefined);
    e_player clientfield::set_player_uimodel("hudItems.spawnSelectHidePrompt", 1);
    var_18ea83b9 = struct::get("s_vh_chopper", "targetname");
    vh_chopper = spawnvehicle(#"veh_t8_helicopter_gunship_mp", var_18ea83b9.origin, var_18ea83b9.angles);
    util::magic_bullet_shield(vh_chopper);
    vh_chopper setteam(#"axis");
    vh_chopper setrotorspeed(1);
    vh_chopper makesentient();
    nd_start = getnode("nd_chopper_start", "targetname");
    vh_chopper ct_utils::function_6432dd9(nd_start, 60, 30);
    wait(5);
    ct_vo::function_3ca1b77d();
    a_bots = ct_bots::function_fbe3dcbb();
    foreach (bot in a_bots) {
        vh_chopper thread ct_utils::function_31a67d65(bot, 1);
        while (isalive(bot)) {
            waitframe(1);
        }
    }
    ct_vo::function_831e0584(array(#"hash_25909d8e5ca28456"), 1);
    nd_start = getnode("nd_chopper_kill_player_loc", "targetname");
    vh_chopper ct_utils::function_6432dd9(nd_start, 100, 30);
    ct_utils::function_c2a10fc();
    level.var_582f7d48 = 1;
    level.spawnselect_timelimit_ms = 216000;
    e_player = ct_utils::get_player();
    vh_chopper thread ct_utils::function_31a67d65(e_player, 3);
    while (isalive(e_player)) {
        waitframe(1);
    }
    util::stop_magic_bullet_shield(vh_chopper);
    vh_chopper thread function_a6f8bc67();
    level notify(#"hash_4c9c5fbc89779e64");
    level.var_582f7d48 = undefined;
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x43650869, Offset: 0x4988
// Size: 0x7c
function function_a6f8bc67() {
    self endon(#"death");
    nd_start = getnode("nd_chopper_exit", "targetname");
    self ct_utils::function_6432dd9(nd_start, 60, 30);
    self delete();
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0xaec2c504, Offset: 0x4a10
// Size: 0xfc
function function_322f5659(s_loc, n_delay) {
    self endon(#"death");
    wait(n_delay);
    self ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    self.var_1574ae06 = 1;
    if (isdefined(s_loc.script_noteworthy) && s_loc.script_noteworthy == #"crouch") {
        while (1) {
            n_dist = distance(s_loc.origin, self.origin);
            if (n_dist < 40) {
                break;
            }
            waitframe(1);
        }
        self bot_stance::crouch();
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x4e465a97, Offset: 0x4b18
// Size: 0x79c
function function_c8e681c8() {
    level endon(#"combattraining_logic_finished");
    ct_vo::function_3ca1b77d();
    level.var_4a4cff9b = 0;
    level.var_f3fb470f = 1;
    e_player = getplayers()[0];
    e_player thread function_b23a52d(2.25, 1);
    var_f1f44cd4 = e_player gamepadusedlast() ? #"hash_6704e759add72c61" : #"hash_5d01463c800741a7";
    var_8193e12c = e_player gamepadusedlast() ? #"hash_51ec0cddcf9bf540" : #"hash_39b5d3b515e5b36c";
    level thread function_9d45d90a(#"hash_3daf240f47b72da9", var_8193e12c, var_f1f44cd4);
    e_player = ct_utils::get_player();
    e_player val::set(#"tak5", "freezecontrols");
    level thread ct_vo::function_831e0584(array(#"hash_3c3ed5b85cba9a60"), 1);
    wait(8);
    e_player val::reset(#"tak5", "freezecontrols");
    level.var_f3fb470f = undefined;
    level thread function_5ceffaa6("stop_nag", 0);
    level thread ct_vo::function_14b08e49(array(#"hash_21ad27ad404090b2"), "stop_nag");
    level waittill(#"hash_48b4c5f856407d62");
    level notify(#"stop_nag");
    e_player clientfield::set_player_uimodel("hudItems.spawnSelectHidePrompt", 0);
    while (1) {
        e_player = ct_utils::get_player();
        if (isalive(e_player)) {
            break;
        }
        waitframe(1);
    }
    e_player = getplayers()[0];
    e_player notify(#"menu_closed");
    s_loc = struct::get("s_chopper_attack_loc", "targetname");
    e_player = ct_utils::get_player();
    e_player thread ct_utils::player_collisionbox(undefined, s_loc.origin, 0);
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    ct_vo::function_831e0584(array(#"hash_3c3ed6b85cba9c13", #"hash_404d0140e0490cd4"), 1);
    level.var_54c1ce00 = level.var_32ae304;
    level.var_32ae304 = undefined;
    level.var_72c3ea74 = struct::get_array("s_firing_squad_loc", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    ct_vo::function_831e0584(array(#"hash_404d0240e0490e87", #"hash_404d0340e049103a"), 1);
    level notify(#"hash_34672d64ad7fb8f0");
    while (1) {
        e_player = ct_utils::get_player();
        if (!isalive(e_player)) {
            break;
        }
        waitframe(1);
    }
    level.var_f3fb470f = 1;
    level.var_4a4cff9b = 1;
    wait(2);
    ct_utils::function_c561377e(undefined);
    level.var_32ae304 = level.var_54c1ce00;
    level notify(#"hash_4c9c5fbc89779e64");
    ct_utils::function_e9ab1003("s_seraph_soldier_loc_5_2");
    e_player = getplayers()[0];
    e_player thread function_b23a52d(2.25, 0);
    var_5140744e = function_8b1a219a() ? #"hash_50a34cf1332e24f" : #"hash_10c1ccd08be6e1f9";
    var_eb32d4fd = e_player gamepadusedlast() ? #"hash_4b8f067f2ba3cf59" : #"hash_4a0ed54a946ba43f";
    level thread function_9d45d90a(#"hash_3e9e530155c75666", var_5140744e, var_eb32d4fd);
    level thread ct_vo::function_831e0584(array(#"hash_3e7cf98a7379a29c"), 1);
    wait(6);
    level.var_f3fb470f = undefined;
    level thread function_5ceffaa6("stop_nag", 1);
    level thread ct_vo::function_14b08e49(array(#"hash_612ae33753ce1a52"), "stop_nag");
    level waittill(#"hash_48b4c5f856407d62");
    level notify(#"stop_nag");
    level notify(#"start_spawn_beacon_exit_collision");
    level.var_4a4cff9b = undefined;
    ct_utils::function_c2a10fc();
    ct_vo::function_3ca1b77d();
    wait(2.5);
    ct_vo::function_831e0584(array(#"hash_1d09afd3cd0bee2e"), 1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0xdcf39d11, Offset: 0x52c0
// Size: 0xca
function function_b23a52d(n_start_delay, var_a9f1605c) {
    level endon(#"combattraining_logic_finished");
    self endon(#"death", #"menu_closed");
    level.var_79c8245d = var_a9f1605c;
    wait(n_start_delay);
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"menuresponse");
        if (waitresult.intpayload < 0) {
            level.var_79c8245d = 0;
        } else {
            level.var_79c8245d = 1;
        }
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x861cec76, Offset: 0x5398
// Size: 0xa4
function function_283155c3() {
    level endon(#"combattraining_logic_finished");
    level.var_fa06889a = 0;
    while (1) {
        e_player = getplayers()[0];
        if (isdefined(e_player)) {
            if (e_player actionbuttonpressed() || e_player reloadbuttonpressed()) {
                level.var_fa06889a = gettime() / 1000;
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xe4edfe12, Offset: 0x5448
// Size: 0xe8
function function_1234c415() {
    level endon(#"combattraining_logic_finished");
    level.var_fa06889a = 0;
    while (1) {
        e_player = getplayers()[0];
        waitresult = undefined;
        waitresult = e_player waittill(#"menuresponse");
        menu = waitresult.menu;
        response = waitresult.response;
        if (menu == "SpawnSelect" && response == "SpawnSelectKeyboard") {
            level.var_fa06889a = gettime() / 1000;
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0xd98d302, Offset: 0x5538
// Size: 0x15c
function function_5ceffaa6(var_eb2d93d3, var_651072b9) {
    level endon(#"combattraining_logic_finished", var_eb2d93d3);
    level.var_651072b9 = undefined;
    var_7f7efa6e = 0;
    while (1) {
        if (isdefined(level.var_651072b9) && level.var_651072b9 == var_651072b9) {
            while (ct_vo::function_5d127774()) {
                waitframe(1);
            }
            n_time = gettime() / 1000;
            dt = n_time - var_7f7efa6e;
            if (dt > 8) {
                if (!var_651072b9) {
                    ct_vo::function_831e0584(array(#"hash_55665ab0fe0bcc32"), 1);
                } else {
                    ct_vo::function_831e0584(array(#"hash_352ceff0f0b7e6d4"), 1);
                }
                var_7f7efa6e = gettime() / 1000;
                level.var_651072b9 = undefined;
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 3, eflags: 0x0
// Checksum 0x25c66ff6, Offset: 0x56a0
// Size: 0x19c
function function_9d45d90a(var_95a93511, var_6238499c, var_b20fd485) {
    level endon(#"combattraining_logic_finished", #"hash_48b4c5f856407d62");
    e_player = ct_utils::get_player();
    if (isdefined(var_95a93511)) {
        e_player thread ct_utils::function_61c3d59c(var_95a93511, undefined);
        while (isdefined(level.var_f3fb470f) && level.var_f3fb470f) {
            waitframe(1);
        }
    }
    if (level.var_79c8245d) {
        var_17758f4f = 1;
        e_player thread ct_utils::function_61c3d59c(var_6238499c, undefined);
    } else {
        var_17758f4f = 0;
        e_player thread ct_utils::function_61c3d59c(var_b20fd485, undefined);
    }
    while (1) {
        if (level.var_79c8245d && !var_17758f4f) {
            e_player thread ct_utils::function_61c3d59c(var_6238499c, undefined);
            var_17758f4f = 1;
        } else if (!level.var_79c8245d && var_17758f4f) {
            e_player thread ct_utils::function_61c3d59c(var_b20fd485, undefined);
            var_17758f4f = 0;
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xea0ff8bf, Offset: 0x5848
// Size: 0x65c
function function_f036b362() {
    level endon(#"combattraining_logic_finished");
    level thread ct_vo::function_831e0584(array(#"hash_1d09b0d3cd0befe1"), 1);
    function_2232d333(1);
    level.var_357913db = getentarray("vol_bad_beacon_courtyard_loc", "targetname");
    while (1) {
        e_player = ct_utils::get_player();
        if (isalive(e_player)) {
            e_player notify(#"hash_46d18c1394319d75");
            break;
        }
        waitframe(1);
    }
    e_player thread ct_bots::function_fd2d220e(0);
    level.var_e72728b8 = undefined;
    level.var_fa24d775 = array(#"hero_annihilator");
    n_slot = e_player ct_gadgets::get_slot(#"hero_annihilator");
    e_player thread ct_gadgets::function_4db6654a(n_slot, 99.6);
    level notify(#"start_courtyard_collision");
    level notify(#"start_courtyard_collision_door");
    wait(0.1);
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_5f8076551c7e0e73", undefined);
    level notify(#"stop_spawn_beacon_exit_collision");
    level thread function_3ea10d34(2, "courtyard_battle_complete");
    ct_utils::function_9aca2fa0("ct_action2");
    level.var_72c3ea74 = struct::get_array("s_seraph_soldiers_courtyard", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    wait(0.5);
    ct_utils::function_654280be();
    level thread ct_vo::function_41e59aeb(array(#"hash_b4703fd731fc56d"));
    level.var_72c3ea74 = struct::get_array("s_seraph_soldiers_courtyard_wave2", "targetname");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    wait(0.5);
    ct_utils::function_654280be();
    var_fcc58830 = 1;
    while (var_fcc58830) {
        var_fcc58830 = 0;
        for (i = 0; i < level.var_357913db.size; i++) {
            var_a08d57dd = level.var_357913db[i];
            if (isdefined(var_a08d57dd.script_noteworthy) && var_a08d57dd.script_noteworthy == #"wave2") {
                arrayremovevalue(level.var_357913db, var_a08d57dd);
                var_fcc58830 = 1;
                break;
            }
        }
    }
    level thread ct_vo::function_831e0584(array(#"hash_1641a812cb185b3e", #"hash_1641a912cb185cf1"));
    level notify(#"stop_courtyard_collision_door");
    level notify(#"start_courtyard_collision_beacon");
    level notify(#"start_courtyard_collision_beacon_exit_door");
    level.var_b4bf4d49 = [];
    level.var_b4bf4d49[level.var_b4bf4d49.size] = struct::get("s_courtyard_left", "targetname");
    level.var_b4bf4d49[level.var_b4bf4d49.size] = struct::get("s_courtyard_right", "targetname");
    level.var_b4bf4d49[level.var_b4bf4d49.size] = struct::get("s_courtyard_top", "targetname");
    level.var_b4bf4d49[level.var_b4bf4d49.size] = struct::get("s_beacon_path1", "targetname");
    level.var_b4bf4d49[level.var_b4bf4d49.size] = struct::get("s_beacon_path2", "targetname");
    level.var_9f86a24 = 0;
    function_d4bbc142();
    level.var_b4bf4d49 = undefined;
    level notify(#"courtyard_battle_complete");
    wait(0.1);
    ct_utils::function_c561377e();
    ct_utils::function_9aca2fa0("ct_action");
    wait(0.1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x2bc3a5d3, Offset: 0x5eb0
// Size: 0x592
function function_d4bbc142() {
    level endon(#"combattraining_logic_finished");
    ct_utils::function_e9ab1003(undefined);
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_481e19b6a6910262", undefined);
    level.a_spawn_beacons = [];
    a_s_loc = struct::get_array("s_seraph_spawn_beacon_loc", "targetname");
    foreach (s_loc in a_s_loc) {
        e_beacon = spawn("script_model", s_loc.origin);
        e_beacon setmodel("wpn_t8_eqp_spawnbeacon_world");
        e_beacon clientfield::set("animate_spawn_beacon", 1);
        e_beacon setcandamage(1);
        e_beacon.health = 400;
        e_beacon.team = #"axis";
        e_beacon thread function_a623876e();
        e_beacon thread function_ffdd31e0();
        e_beacon.s_loc = s_loc;
        level.a_spawn_beacons[level.a_spawn_beacons.size] = e_beacon;
        e_beacon thread function_6afc7a47(e_player);
    }
    level thread function_20380fe4();
    level.var_e72728b8 = undefined;
    n_start_time = gettime() / 1000;
    var_24593a52 = 0;
    while (level.a_spawn_beacons.size > 0) {
        n_time = gettime() / 1000;
        var_94156736 = n_time - n_start_time;
        if (var_94156736 >= 10) {
            var_36b789c0 = 1;
        } else {
            var_36b789c0 = 0;
        }
        e_player = ct_utils::get_player();
        a_bots = e_player ct_bots::function_dde6edbd();
        if (a_bots.size < 4) {
            if (var_24593a52 >= level.a_spawn_beacons.size) {
                var_24593a52 = 0;
            }
            e_beacon = level.a_spawn_beacons[var_24593a52];
            var_24593a52++;
            if (var_24593a52 >= level.a_spawn_beacons.size) {
                var_24593a52 = 0;
            }
            if (isdefined(var_36b789c0) && var_36b789c0 && a_bots.size >= 1) {
                while (1) {
                    if (!isdefined(e_beacon)) {
                        break;
                    }
                    e_player = getplayers()[0];
                    n_dist = distance(e_player.origin, e_beacon.origin);
                    if (n_dist > 350) {
                        break;
                    }
                    waitframe(1);
                }
            }
            if (isdefined(e_beacon)) {
                a_locs = struct::get_array(e_beacon.s_loc.target);
                a_locs = array::randomize(a_locs);
                level.var_7b46025 = array(a_locs[0]);
                level.var_47cd3e56 = 0;
                level thread ct_bots::activate_bots(level.var_7b46025.size, #"axis");
                if (isdefined(var_36b789c0) && var_36b789c0) {
                    wait(randomfloatrange(5, 7));
                } else {
                    wait(randomfloatrange(1, 1.8));
                }
            }
        }
        waitframe(1);
    }
    e_player = ct_utils::get_player();
    e_player ct_utils::function_d09d6958(#"hash_9e43b70f5fc84ff");
    ct_utils::function_654280be();
    e_player = ct_utils::get_player();
    e_player ct_bots::function_26d45f32(1);
    ct_utils::function_c2a10fc();
    waitframe(1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x1ecabc13, Offset: 0x6450
// Size: 0x14c
function function_6afc7a47(e_player) {
    self endon(#"death");
    self.t_use = spawn("trigger_radius_use", self.origin + vectorscale((0, 0, 1), 20), 0, 80, 80);
    self.t_use sethintstring(#"hash_33c0a447b3903430");
    self.t_use setcursorhint("HINT_NOICON");
    self.t_use setteamfortrigger(e_player.team);
    self.t_use setvisibletoplayer(e_player);
    self.t_use waittill(#"trigger");
    self.t_use delete();
    self.t_use = undefined;
    self dodamage(self.health + 100, self.origin);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x328fb24a, Offset: 0x65a8
// Size: 0x208
function function_20380fe4() {
    level endon(#"combattraining_logic_finished");
    var_269508c9 = 0;
    n_start_time = gettime() / 1000;
    while (!var_269508c9) {
        n_time = gettime() / 1000;
        dt = n_time - n_start_time;
        if (dt > 20) {
            level thread ct_vo::function_831e0584(array(#"hash_9c3ec48cc485060"));
            n_start_time = gettime() / 1000;
        }
        foreach (beacon in level.a_spawn_beacons) {
            e_player = ct_utils::get_player();
            n_dist = distance(e_player.origin, beacon.origin);
            if (n_dist < 700) {
                v_dir = vectornormalize(e_player.origin - beacon.origin);
                v_pos = beacon.origin + v_dir * 50;
                if (e_player ct_utils::can_see(v_pos, 1)) {
                    var_269508c9 = 1;
                    break;
                }
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xaa227923, Offset: 0x67b8
// Size: 0x80
function function_a623876e() {
    level endon(#"combattraining_logic_finished");
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        waitresult.attacker util::show_hit_marker(0);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xf4e99057, Offset: 0x6840
// Size: 0x12c
function function_ffdd31e0() {
    level endon(#"combattraining_logic_finished");
    self waittill(#"death");
    e_player = getplayers()[0];
    e_player util::show_hit_marker(1);
    level thread ct_vo::function_41e59aeb(array(#"hash_16d8d45fbc20d9a1"), 1);
    playfx(#"explosions/fx_exp_robot_stage3_evb", self.origin);
    arrayremovevalue(level.a_spawn_beacons, self);
    if (isdefined(self.t_use)) {
        self.t_use delete();
    }
    self delete();
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x9e651fcc, Offset: 0x6978
// Size: 0x704
function function_4bb467a() {
    level endon(#"combattraining_logic_finished");
    function_2232d333(0);
    level notify(#"kill_friendly_spawn_beacons");
    level.var_e72728b8 = array(#"gadget_spawnbeacon");
    level.var_2b87f134 = undefined;
    ct_utils::function_e9ab1003(undefined);
    level notify(#"stop_spawn_beacon_enter_collision");
    level notify(#"start_defend_hp_collision_exit_door");
    level notify(#"start_defend_hardpoint_collision");
    level notify(#"stop_courtyard_collision_beacon_exit_door");
    s_loc = struct::get("s_player_heads_to_hardpoint", "targetname");
    level thread ct_utils::function_9a4e412e(s_loc, "start_courtyard_collision_door");
    var_ec804dad = s_loc;
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_goto_hardpoint_1", array(#"gadget_spawnbeacon"), 0, undefined, 35);
    level notify(#"stop_nag");
    waitframe(1);
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_goto_hardpoint_2", array(#"gadget_spawnbeacon"), 0, undefined, 35);
    level notify(#"stop_nag");
    waitframe(1);
    level thread ct_vo::function_831e0584(array(#"hash_3b9cc53b4f549329"), 1);
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_defend_hardpoint_obj", array(#"gadget_spawnbeacon"), 0, undefined, 35);
    level notify(#"stop_nag");
    ct_utils::function_e9ab1003("s_hardpoint_player_respawn_pos");
    level.var_e72728b8 = undefined;
    function_2232d333(1);
    level thread function_3ea10d34(2, "kill_friendly_spawn_beacons");
    ct_vo::function_3ca1b77d();
    level.var_cc18b401 = 1;
    level.var_7ecb2c8e = 1;
    level.var_357913db = getentarray("vol_bad_beacon_loc", "targetname");
    a_volumes = getentarray("vol_bad_beacon_courtyard_loc", "targetname");
    level.var_357913db = arraycombine(level.var_357913db, a_volumes, 0, 0);
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_6ff0262902a8a0e3", undefined);
    e_player thread ct_bots::function_fd2d220e(0);
    level thread ct_vo::function_41e59aeb(array(#"hash_16d8d35fbc20d7ee", #"hash_16d8d25fbc20d63b"), 1);
    level thread function_1561b83f(5.5);
    ct_vo::function_3ca1b77d();
    e_player = ct_utils::get_player();
    e_player thread ct_utils::function_61c3d59c(#"hash_625d17fd42e71819", undefined);
    ct_utils::function_9aca2fa0("ct_action2");
    level.var_a1f83db8 = undefined;
    level thread ct_utils::function_1ca79c02("vol_hardpoint", 0.3, 100, level.progress_bar);
    level.var_e21c8bfa = 1;
    level thread ct_vo::function_14b08e49(array(#"hash_55fa7be54f98849"), "friendly_spawn_beacon");
    var_468ef41 = 0;
    while (!(isdefined(level.b_hardpoint_complete) && level.b_hardpoint_complete)) {
        waitframe(1);
    }
    level.var_e21c8bfa = undefined;
    level.var_7ecb2c8e = undefined;
    level notify(#"kill_friendly_spawn_beacons");
    level notify(#"friendly_spawn_beacon");
    wait(0.1);
    ct_utils::function_c561377e(undefined, 0);
    ct_utils::function_9aca2fa0("ct_action");
    level.b_hardpoint_complete = undefined;
    level.var_e72728b8 = array(#"gadget_spawnbeacon");
    wait(0.5);
    ct_vo::function_831e0584(array(#"hash_3d12730aae5bc5fe"), 1);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0xd8b0d3ab, Offset: 0x7088
// Size: 0x2c6
function function_1561b83f(var_e3a95ba5) {
    level endon(#"combattraining_logic_finished", #"kill_friendly_spawn_beacons");
    wait(var_e3a95ba5);
    var_1e0ef434 = struct::get_array("s_hardpoint_attacker", "targetname");
    var_5840cb3f = 0;
    level.var_817811b4 = [];
    level.var_817811b4[level.var_817811b4.size] = struct::get("hardpoint_path_1", "targetname");
    level.var_817811b4[level.var_817811b4.size] = struct::get("hardpoint_path_2", "targetname");
    level.var_817811b4[level.var_817811b4.size] = struct::get("hardpoint_path_3", "targetname");
    level.var_44847b09 = 0;
    n_start_time = gettime() / 1000;
    while (1) {
        n_time = gettime() / 1000;
        var_8af69517 = n_time - n_start_time;
        e_player = ct_utils::get_player();
        a_bots = e_player ct_bots::function_dde6edbd();
        if (a_bots.size < 3) {
            s_spawn_loc = var_1e0ef434[var_5840cb3f];
            var_5840cb3f++;
            if (var_5840cb3f >= var_1e0ef434.size) {
                var_5840cb3f = 0;
            }
            level.var_72c3ea74 = array(s_spawn_loc);
            level.var_da5432a2 = 0;
            level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
            if (var_8af69517 < 5) {
                n_delay = randomfloatrange(1, 2);
            } else {
                n_delay = randomfloatrange(5, 8);
            }
            wait(n_delay);
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0x68c84ed6, Offset: 0x7358
// Size: 0x10e
function function_3ea10d34(var_e8437733, var_eb2d93d3) {
    level endon(#"combattraining_logic_finished", var_eb2d93d3);
    var_d7e81496 = gettime() / 1000;
    while (1) {
        if (isdefined(level.var_2b87f134)) {
            e_player = ct_utils::get_player();
            var_70a61d6a = e_player ct_bots::function_71ec2b36();
            if (var_70a61d6a.size < var_e8437733) {
                n_time = gettime() / 1000;
                dt = n_time - var_d7e81496;
                if (dt > 1.5) {
                    level thread ct_bots::activate_bots(1, #"allies");
                    var_d7e81496 = n_time;
                }
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0xad9ef4a6, Offset: 0x7470
// Size: 0x82
function spawn_robot(var_8b84b3ce, var_ce2b0d5) {
    robot = ct_ai::function_4c8f915a(var_8b84b3ce);
    ai_tank::function_9b13ebf(robot);
    robot.goalradius = 300;
    robot setgoal(var_ce2b0d5);
    robot.health = 300;
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x709bd964, Offset: 0x7500
// Size: 0xb04
function function_c43189cd() {
    level endon(#"combattraining_logic_finished");
    level notify(#"stop_defend_hp_collision_exit_door");
    level notify(#"start_approach_killstreak_collision");
    function_2232d333(1);
    level.var_357913db = getentarray("vol_bad_beacon_killstreak_loc", "targetname");
    e_player = ct_utils::get_player();
    e_player thread ct_bots::function_fd2d220e(0);
    level thread ct_vo::function_14b08e49(array(#"hash_5895739505ac5bb0"), "stop_nag");
    ct_utils::function_e0d36a2c(undefined, "s_earn_killstreak_obj", array(#"gadget_spawnbeacon"), 0, undefined, 35);
    level notify(#"stop_nag");
    level notify(#"stop_defend_hardpoint_collision");
    level notify(#"start_active_killstreak_collision");
    function_2232d333(1);
    level.var_e72728b8 = undefined;
    ct_utils::function_e9ab1003(undefined);
    ct_vo::function_831e0584(array(#"hash_3d12740aae5bc7b1", #"hash_3d12710aae5bc298"), 1);
    level notify(#"start_killstreak_collision");
    level notify(#"stop_active_killstreak_collision");
    callback::on_player_killed_with_params(&ct_utils::function_944e4110);
    level.var_28cfc859 = 150;
    ct_utils::function_9aca2fa0("ct_action2");
    var_a05f35f3 = 0;
    while (!var_a05f35f3) {
        level.var_2b008163 = 0;
        level thread function_3ea10d34(2, "gunship_event");
        level thread function_f75fee23(2);
        while (1) {
            ct_utils::function_fdfeb384();
            ct_utils::function_e44c5b8e(#"ac130", 10);
            e_player = ct_utils::get_player();
            e_player thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillToEarnSeraphChopper");
            e_player ct_utils::function_80bf685b(0);
            e_player thread ct_utils::function_68848e5("ac130");
            level.var_a86320e8 = undefined;
            level.var_a86320e8 = gettime() / 1000;
            var_4eb6b3e4 = 0;
            var_93781b01 = 0;
            while (1) {
                e_player = ct_utils::get_player();
                if (!isalive(e_player)) {
                    var_4eb6b3e4 = 1;
                    break;
                }
                e_player thread ct_utils::function_80bf685b(level.var_de284b17);
                if (!var_93781b01 && level.var_de284b17 >= 800) {
                    level thread ct_vo::function_831e0584(array(#"hash_4064b660cbec3447"), 1);
                    var_93781b01 = 1;
                }
                if (isdefined(e_player.var_d5d10814) && e_player.var_d5d10814) {
                    break;
                }
                n_time = gettime() / 1000;
                dt = n_time - level.var_a86320e8;
                if (dt > 15) {
                    level thread ct_vo::function_41e59aeb(array(#"hash_6e57830a44ae6ca0"), 1);
                    level.var_a86320e8 = n_time + 4;
                }
                waitframe(1);
            }
            if (var_4eb6b3e4) {
                level.var_e6db911d = 1;
                ct_utils::function_c561377e(undefined);
                ct_vo::function_3ca1b77d();
                level.var_de284b17 = 0;
                level thread ct_vo::function_831e0584(array(#"hash_d186ec624023680"), 1);
                e_player = getplayers()[0];
                while (!isalive(e_player)) {
                    waitframe(1);
                }
            } else {
                break;
            }
        }
        e_player = getplayers()[0];
        if (e_player.health < 150) {
            e_player.health = 150;
        }
        level notify(#"ac130_available");
        waitframe(1);
        level thread ct_vo::function_831e0584(array(#"hash_36816442279da155"), 1);
        ct_utils::function_c561377e(undefined);
        setdvar(#"hash_3e06b14c41136e95", 0);
        while (1) {
            e_player = ct_utils::get_player();
            if (isalive(e_player)) {
                break;
            }
            waitframe(1);
        }
        e_player = ct_utils::get_player();
        var_9947490d = e_player gamepadusedlast() ? #"hash_7033e3cd667fe69" : #"hash_7bbd382da03b8aaf";
        e_player thread ct_utils::function_61c3d59c(var_9947490d, undefined);
        globallogic_score::_setplayermomentum(e_player, 0);
        while (1) {
            e_player = getplayers()[0];
            if (isalive(e_player)) {
                wpn = e_player getcurrentweapon();
                if (wpn.name == "ac130") {
                    break;
                }
                waitframe(1);
            } else {
                ct_utils::function_fdfeb384();
                ct_utils::function_e44c5b8e("ac130", 10, 1);
            }
        }
        ct_utils::function_c2a10fc();
        level notify(#"gunship_event");
        wait(0.1);
        ct_utils::function_c561377e();
        while (1) {
            b_success = gunship_event();
            if (b_success) {
                level.var_e6db911d = 1;
                waitframe(1);
                ct_utils::function_c561377e();
                level.var_77e9434e = 0;
                ct_vo::function_831e0584(array(#"hash_2cb81e56a3c996e8"), 1);
                var_a05f35f3 = 1;
                break;
            } else {
                ct_vo::function_831e0584(array(#"hash_3053b3416c2f8275"), 1);
                ct_utils::function_a61ebb46(#"hash_1c76f35cdadb1a92");
                e_player = ct_utils::get_player();
                var_2332091b = e_player gamepadusedlast() ? #"hash_7033e3cd667fe69" : #"hash_7bbd382da03b8aaf";
                e_player thread ct_utils::function_61c3d59c(var_2332091b, undefined);
                ct_utils::function_e44c5b8e(#"ac130", 0);
                wait(0.1);
                ct_utils::function_daa27144();
                setdvar(#"hash_3e06b14c41136e95", 0);
                ct_gadgets::function_350dd8ec("ac130");
                level.ac130 = undefined;
                while (!isdefined(level.ac130)) {
                    waitframe(1);
                }
                ct_utils::function_c2a10fc();
                setdvar(#"hash_3e06b14c41136e95", 1);
            }
        }
    }
    level.var_2b008163 = 0;
    callback::remove_on_player_killed_with_params(&ct_utils::function_944e4110);
    ct_vo::function_3ca1b77d();
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x372f59f0, Offset: 0x8010
// Size: 0x1e6
function function_f75fee23(var_9bff2467) {
    level endon(#"combattraining_logic_finished", #"ac130_available");
    level.var_817811b4 = [];
    level.var_817811b4[level.var_817811b4.size] = struct::get("killstreak_path_1", "targetname");
    level.var_817811b4[level.var_817811b4.size] = struct::get("killstreak_path_2", "targetname");
    level.var_817811b4[level.var_817811b4.size] = struct::get("killstreak_path_3", "targetname");
    level.var_817811b4[level.var_817811b4.size] = struct::get("killstreak_path_4", "targetname");
    level.var_44847b09 = 0;
    level.var_72c3ea74 = struct::get_array("s_killstreak_spawn", "targetname");
    level.var_da5432a2 = 0;
    while (1) {
        e_player = getplayers()[0];
        a_bots = e_player ct_bots::function_dde6edbd();
        if (a_bots.size < var_9bff2467) {
            level thread ct_bots::activate_bots(1, #"axis");
            wait(0.5);
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xe070f42c, Offset: 0x8200
// Size: 0x74e
function gunship_event() {
    level endon(#"combattraining_logic_finished");
    level.var_e190d640 = 1;
    function_2232d333(1);
    setdvar(#"hash_3e06b14c41136e95", 1);
    level.var_43da6545 = 1;
    level.var_e190d640 = 1;
    level.var_e6db911d = 0;
    e_player = getplayers()[0];
    e_player hide();
    wait(4);
    e_player = ct_utils::get_player();
    e_player val::set(#"gunship", "ignoreme", 1);
    level thread ct_vo::function_5df1a850(level.ac130, array(#"hash_37ecd97827bbf3b"));
    e_player thread ct_utils::function_61c3d59c(#"hash_1aa5c2216481240e", undefined);
    while (1) {
        if (e_player attackbuttonpressed()) {
            break;
        }
        waitframe(1);
    }
    ct_utils::function_c2a10fc();
    ct_vo::function_b86d3b7d();
    ct_vo::function_3ca1b77d();
    level thread ct_vo::function_5df1a850(level.ac130, array(#"hash_4de7f76e35d2df28"));
    var_257a5d2d = e_player gamepadusedlast() ? #"hash_4d62965b3d78662" : #"hash_3e1c84f20dbc93c2";
    e_player thread ct_utils::function_61c3d59c(var_257a5d2d, undefined);
    var_5e939643 = 0;
    b_fire = 0;
    n_start_time = gettime() / 1000;
    while (1) {
        e_player = ct_utils::get_player();
        if (e_player weaponswitchbuttonpressed()) {
            while (e_player weaponswitchbuttonpressed()) {
                waitframe(1);
            }
            var_5e939643++;
        }
        if (e_player attackbuttonpressed()) {
            b_fire = 1;
        }
        if (var_5e939643 >= 3 && b_fire) {
            break;
        }
        n_time = gettime() / 1000;
        dt = n_time - n_start_time;
        if (dt > 8.5) {
            break;
        }
        waitframe(1);
    }
    ct_utils::function_c2a10fc();
    waitframe(1);
    ct_vo::function_b86d3b7d();
    ct_vo::function_3ca1b77d();
    e_player = ct_utils::get_player();
    starttime = gettime();
    n_bomb_timer = starttime + int(60 * 1000);
    setmatchflag("bomb_timer_a", 1);
    setbombtimer("A", n_bomb_timer);
    waitframe(1);
    e_player thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_KillSoldiers");
    e_player ct_utils::function_80bf685b(20);
    level thread function_79293a0b();
    level thread function_e47d773c();
    level.var_9d057e74 = struct::get_array("s_seraph_soldiers_courtyard", "targetname");
    level.var_1937cf8e = 0;
    level thread ct_bots::activate_bots(level.var_9d057e74.size, #"allies");
    level.var_74bfba73 = 1;
    b_success = 0;
    level.var_62dd3f4a = 0;
    while (1) {
        if (level.var_62dd3f4a >= 20) {
            b_success = 1;
            break;
        }
        var_f08fde43 = function_4c27be22("A");
        currenttime = gettime();
        if (currenttime >= var_f08fde43) {
            ct_vo::function_831e0584(array(#"hash_2900ab42c0ae55a"), 1);
            break;
        }
        waitframe(1);
    }
    level.var_74bfba73 = undefined;
    level notify(#"hash_4049796fbd169552");
    e_player = getplayers()[0];
    e_player show();
    ac130::function_8721028e(level.ac130.owner, 1);
    level.var_e190d640 = 0;
    level notify(#"stop_flood_spawners");
    ct_utils::function_9aca2fa0("ct_endgame");
    waitframe(1);
    ct_utils::function_c561377e();
    ct_utils::function_c2a10fc();
    setbombtimer("A", 0);
    setmatchflag("bomb_timer_a", 0);
    level.var_e6db911d = 1;
    e_player = ct_utils::get_player();
    e_player val::reset(#"gunship", "ignoreme");
    level.var_43da6545 = undefined;
    level.var_e190d640 = undefined;
    return b_success;
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xb149954a, Offset: 0x8958
// Size: 0x210
function function_e47d773c() {
    level endon(#"combattraining_logic_finished", #"hash_4049796fbd169552");
    level thread ct_vo::function_5df1a850(level.ac130, array(#"hash_30bea962898791f8"));
    level thread function_b8fea992("s_chopper_enemy_wave1", randomfloatrange(0.7, 1.7), "stop_flood_spawners");
    wait(15);
    level notify(#"stop_flood_spawners");
    waitframe(1);
    level thread ct_vo::function_5df1a850(level.ac130, array(#"hash_30beac6289879711"));
    level thread function_b8fea992("s_chopper_garden_wave2", randomfloatrange(0.7, 1.7), "stop_flood_spawners");
    wait(15);
    level notify(#"stop_flood_spawners");
    waitframe(1);
    level thread ct_vo::function_5df1a850(level.ac130, array(#"hash_30bea962898791f8"));
    level thread function_b8fea992("s_chopper_courtyard_wave3", randomfloatrange(0.7, 1.7), "stop_flood_spawners");
    wait(15);
    level notify(#"stop_flood_spawners");
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 3, eflags: 0x0
// Checksum 0xea9ab713, Offset: 0x8b70
// Size: 0x196
function function_b8fea992(var_cd83876, var_264ee2f5, str_endon_notify) {
    level endon(#"combattraining_logic_finished", str_endon_notify);
    a_s_locs = struct::get_array(var_cd83876, "targetname");
    n_index = 0;
    var_d7e81496 = 0;
    while (1) {
        e_player = ct_utils::get_player();
        a_bots = e_player ct_bots::function_dde6edbd();
        if (a_bots.size <= 10) {
            n_time = gettime() / 1000;
            dt = n_time - var_d7e81496;
            if (dt > var_264ee2f5) {
                s_loc = a_s_locs[n_index];
                n_index++;
                if (n_index >= a_s_locs.size) {
                    n_index = 0;
                }
                level.var_72c3ea74 = array(s_loc);
                level.var_da5432a2 = 0;
                level thread ct_bots::activate_bots(1, #"axis");
                var_d7e81496 = n_time;
            }
        }
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x4662f5d, Offset: 0x8d10
// Size: 0xec
function function_79293a0b() {
    level endon(#"combattraining_logic_finished", #"hash_4049796fbd169552");
    wait(35);
    n_start_time = gettime() / 1000;
    if (level.var_62dd3f4a <= 8) {
        while (!ct_vo::function_5d127774()) {
            waitframe(1);
        }
        n_time = gettime() / 1000;
        dt = n_time - n_start_time;
        if (dt > 20) {
            return;
        }
        level thread ct_vo::function_5df1a850(level.ac130, array(#"hash_6e57830a44ae6ca0"));
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0xa696d31f, Offset: 0x8e08
// Size: 0x5ea
function function_58c62280(b_keyline, var_2f3964e3) {
    self endon(#"death");
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    if (isdefined(var_2f3964e3) && var_2f3964e3) {
        self val::set(#"enemy_bot", "ignoreall");
    }
    wait(0.2);
    if (isdefined(b_keyline) && b_keyline) {
        self clientfield::set("enemy_keyline_render", 1);
    }
    switch (level.var_ad7c0539) {
    case 2:
        s_target = struct::get(s_loc.target, "targetname");
        level.var_49674a21 = self;
        self thread ct_utils::function_5b59f3b7(s_target.origin, s_target.angles, 32);
        wait(4);
        s_loc = struct::get("s_single_soldier_path", "targetname");
        self ct_utils::function_1e7b75f2(s_loc);
        break;
    case 3:
        self thread function_3c3f8059();
        if (isdefined(level.var_1e06f070) && level.var_1e06f070) {
            self.var_5f67e634 = 1;
            self thread function_1866eabf(s_loc);
        } else {
            e_player = ct_utils::get_player();
            self.var_2925fedc = e_player.origin;
            if (!isdefined(level.var_9c095ebe)) {
                level.var_9c095ebe = [];
            }
            level.var_9c095ebe[level.var_9c095ebe.size] = self;
            self thread function_85d8bdb0(s_loc);
        }
        break;
    case 4:
        self thread function_a2ad2160(s_loc);
        break;
    case 5:
        self thread function_d832af02(s_loc);
        break;
    case 6:
        if (self.team == #"allies") {
            self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
        }
        break;
    case 8:
        self thread function_bb3b8475();
        break;
    case 9:
        self val::reset(#"enemy_bot", "ignoreall");
        if (self.team == #"allies") {
            self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 800);
        } else {
            self thread function_d832af02(s_loc);
            self val::reset(#"enemy_bot", "ignoreall");
        }
        break;
    case 10:
    case 11:
        if (self.team == #"axis") {
            self thread ct_utils::function_5149c890(1, 1);
            if (isdefined(level.var_74bfba73) && level.var_74bfba73) {
                s_loc = struct::get(s_loc.script_noteworthy, "targetname");
                self thread function_af9e55a1(s_loc);
            } else {
                s_path = level.var_817811b4[level.var_44847b09];
                level.var_44847b09++;
                if (level.var_44847b09 >= level.var_817811b4.size) {
                    level.var_44847b09 = 0;
                }
                self thread function_d832af02(s_path);
            }
        }
        break;
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x1e4b9873, Offset: 0x9400
// Size: 0x110
function function_af9e55a1(s_loc) {
    self endon(#"death");
    self ct_utils::function_f3b02850(s_loc, 400);
    var_ed1884cc = struct::get_array("s_gunship_courtyard_loc", "targetname");
    var_ed1884cc = array::randomize(var_ed1884cc);
    n_index = 0;
    while (1) {
        wait(randomfloatrange(3, 7));
        s_loc = var_ed1884cc[n_index];
        n_index++;
        if (n_index >= var_ed1884cc.size) {
            n_index = 0;
        }
        self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x2feb5c6c, Offset: 0x9518
// Size: 0xcc
function function_1866eabf(s_loc) {
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    self bot_stance::crouch();
    mdl_anchor = util::spawn_model("tag_origin", s_loc.origin, s_loc.angles);
    self linkto(mdl_anchor);
    self waittill(#"death");
    mdl_anchor delete();
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xc47a64ce, Offset: 0x95f0
// Size: 0xdc
function function_bb3b8475() {
    self endon(#"death");
    self ct_utils::give_weapon(#"ar_accurate_t8");
    waitframe(1);
    e_player = ct_utils::get_player();
    self.var_2925fedc = e_player.origin;
    self setlowready(1);
    wait(7.5);
    self setlowready(0);
    wait(3.5);
    self val::reset(#"enemy_bot", "ignoreall");
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x5fb773ee, Offset: 0x96d8
// Size: 0x28
function function_3c3f8059() {
    self waittill(#"death");
    level.var_30f6fd66++;
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x8fc89e01, Offset: 0x9708
// Size: 0x3d6
function function_85d8bdb0(s_spawn_loc) {
    self endon(#"death");
    while (level.var_9c095ebe.size < 2) {
        waitframe(1);
    }
    if (!isdefined(level.var_35179c06)) {
        level.var_35179c06 = self;
    }
    waitframe(1);
    var_e787a53 = level.var_9c095ebe[0];
    foreach (bot in level.var_9c095ebe) {
        if (bot != self) {
            var_e787a53 = bot;
            break;
        }
    }
    var_e787a53 endon(#"death");
    a_s_targets = [];
    for (i = 1; i <= 2; i++) {
        str_name = s_spawn_loc.script_noteworthy + i;
        a_s_targets[i - 1] = struct::get(str_name, "targetname");
    }
    self.var_ffb28553 = 1;
    self.b_stationary = 0;
    n_index = 0;
    while (1) {
        s_target = a_s_targets[n_index];
        n_index++;
        if (n_index >= a_s_targets.size) {
            n_index = 0;
        }
        self thread ct_utils::function_5b59f3b7(s_target.origin, s_target.angles, 32);
        while (1) {
            self.var_ec3b71df = distance(self.origin, s_target.origin);
            if (self.var_ec3b71df < 32) {
                break;
            } else {
                self.b_stationary = 0;
            }
            waitframe(1);
        }
        self setorigin(s_target.origin);
        self.b_stationary = 1;
        e_player = ct_utils::get_player();
        a_bots = e_player ct_bots::function_dde6edbd();
        var_f6f02915 = 0;
        var_6096b30a = 0;
        while (var_6096b30a < 10) {
            var_f6f02915 = 0;
            foreach (bot in a_bots) {
                if (isdefined(bot.b_stationary) && bot.b_stationary) {
                    var_f6f02915++;
                }
            }
            if (var_f6f02915 >= 2) {
                var_6096b30a++;
            } else {
                var_6096b30a = 0;
            }
            waitframe(1);
        }
        level notify(#"hash_6510d558060bc3f3");
        self.b_stationary = 0;
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0xeecfe9d8, Offset: 0x9ae8
// Size: 0x144
function function_a2ad2160(s_spawn_loc) {
    self endon(#"death");
    s_target = struct::get(s_spawn_loc.target, "targetname");
    var_a284e6d5 = getweapon(s_target.weapon);
    self giveweapon(var_a284e6d5);
    self thread ct_utils::function_5b59f3b7(s_target.origin, s_target.angles, 32);
    while (1) {
        n_dist = distance(self.origin, s_target.origin);
        if (n_dist < 60) {
            break;
        }
        waitframe(1);
    }
    level waittill(#"start_firing");
    self val::reset(#"enemy_bot", "ignoreall");
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0xa26ee28f, Offset: 0x9c38
// Size: 0x144
function function_d832af02(s_loc) {
    self endon(#"death");
    if (isdefined(level.var_b4bf4d49)) {
        s_path = level.var_b4bf4d49[level.var_9f86a24];
        level.var_9f86a24++;
        if (level.var_9f86a24 >= level.var_b4bf4d49.size) {
            level.var_9f86a24 = 0;
        }
    } else if (level.var_ad7c0539 == 10) {
        s_path = s_loc;
    } else if (level.var_ad7c0539 == 11) {
        if (self.team == #"axis") {
            s_path = s_loc;
        } else {
            s_path = struct::get(s_loc.script_noteworthy, "targetname");
        }
    } else {
        s_path = struct::get(s_loc.script_noteworthy, "targetname");
    }
    self thread ct_utils::function_1e7b75f2(s_path);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x6ee29b5f, Offset: 0x9d88
// Size: 0x82
function function_2232d333(var_9d9f02b4) {
    if (var_9d9f02b4) {
        setgametypesetting(#"spawnselectenabled", 1);
        level.spawnselectenabled = 1;
    } else {
        setgametypesetting(#"spawnselectenabled", 0);
        level.spawnselectenabled = 0;
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x641d28dd, Offset: 0x9e18
// Size: 0x1f6
function function_2fa4efc2(waitresult) {
    var_c481f7e6 = 0;
    e_player = getplayers()[0];
    waitframe(1);
    n_time = gettime() / 1000;
    dt = n_time - level.var_fa06889a;
    if (dt > 0.2) {
        return 1;
    }
    if (isdefined(level.var_4a4cff9b)) {
        if (isdefined(level.var_4a4cff9b) && level.var_4a4cff9b) {
            if (waitresult.intpayload > 0) {
                level.var_651072b9 = 0;
                var_c481f7e6 = 0;
            } else {
                globallogic_audio::play_2d_on_team(#"uin_negative", #"allies");
                level.var_651072b9 = 1;
                var_c481f7e6 = 1;
            }
        } else if (waitresult.intpayload > 0) {
            globallogic_audio::play_2d_on_team(#"uin_negative", #"allies");
            level.var_651072b9 = 0;
            var_c481f7e6 = 1;
        } else {
            level.var_651072b9 = 1;
            var_c481f7e6 = 0;
        }
    } else if (waitresult.intpayload > 0) {
        level.var_79cf1332 = 1;
    } else {
        level.var_79cf1332 = 0;
    }
    if (isdefined(level.var_f3fb470f) && level.var_f3fb470f) {
        return 1;
    }
    return var_c481f7e6;
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xe0522e48, Offset: 0xa018
// Size: 0x3ee
function function_7e060369() {
    level endon(#"combattraining_logic_finished");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"hash_31be1f8b27209ad0");
        e_beacon = waitresult.beacon.spawnbeacon;
        if (isdefined(e_beacon) && !isbot(waitresult.owner)) {
            var_e9af190e = 1;
            a_coll = getentarray("defend_hardpoint_collision", "targetname");
            var_a182836 = getentarray("defend_hp_collision_exit_door", "targetname");
            a_coll = arraycombine(a_coll, var_a182836, 0, 0);
            foreach (e_coll in a_coll) {
                if (e_beacon istouching(e_coll)) {
                    e_beacon thread spawn_beacon::function_a9ff3efb(0);
                    level.var_2b87f134 = undefined;
                    var_e9af190e = 0;
                    break;
                }
            }
            if (var_e9af190e && isdefined(level.var_357913db)) {
                foreach (vol in level.var_357913db) {
                    if (e_beacon istouching(vol)) {
                        e_beacon thread spawn_beacon::function_a9ff3efb(0);
                        level.var_2b87f134 = undefined;
                        var_e9af190e = 0;
                        break;
                    }
                }
            }
            if (var_e9af190e) {
                e_player = getplayers()[0];
                n_height_diff = abs(e_player.origin[2] - e_beacon.origin[2]);
                if (n_height_diff > 5) {
                    e_beacon thread spawn_beacon::function_a9ff3efb(0);
                    level.var_2b87f134 = undefined;
                    var_e9af190e = 0;
                }
            }
            if (var_e9af190e) {
                level.var_2b87f134 = e_beacon;
                e_beacon thread function_b5d57aff();
                level notify(#"friendly_spawn_beacon");
                e_beacon val::reset(#"sbeacon", "takedamage");
                if (isdefined(level.var_cc18b401) && level.var_cc18b401) {
                    level thread ct_vo::function_41e59aeb(array(#"hash_7f3275b34f048098"), 1);
                    level.var_cc18b401 = 0;
                }
            }
        }
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xf9385e1c, Offset: 0xa410
// Size: 0xa4
function function_b5d57aff() {
    self endon(#"death");
    level waittill(#"kill_friendly_spawn_beacons");
    self spawn_beacon::function_a9ff3efb(0);
    level.var_2b87f134 = undefined;
    if (isdefined(level.var_7ecb2c8e) && level.var_7ecb2c8e) {
        level thread ct_vo::function_41e59aeb(array(#"hash_771945b68482460c"), 1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 2, eflags: 0x0
// Checksum 0xada23e4a, Offset: 0xa4c0
// Size: 0x21c
function function_2b612805(var_47a6e8d, var_caad9028) {
    var_da6ce0d5 = 1;
    if (isdefined(level.var_2b87f134)) {
        v_loc = function_7746c49c(100);
        if (!isdefined(v_loc)) {
            v_loc = level.var_2b87f134.origin;
        }
        v_dir = vectornormalize(level.var_2b87f134.origin - v_loc);
        v_angles = vectortoangles(v_dir);
        v_angles = (v_angles[0], v_angles[1], 0);
        if (!isdefined(v_loc)) {
            var_da6ce0d5 = 0;
        } else if (isbot(self)) {
            self ct_utils::function_61d750d4(v_loc, v_angles);
            if (isdefined(var_caad9028)) {
                var_637b6a7e = struct::get(var_47a6e8d, "targetname");
                self thread ct_utils::function_5b59f3b7(var_637b6a7e.origin, var_637b6a7e.angles, var_caad9028);
            }
        } else if (isdefined(level.var_79cf1332) && level.var_79cf1332) {
            self setorigin(v_loc);
            self setplayerangles(v_angles);
        } else {
            var_da6ce0d5 = 0;
        }
    } else {
        var_da6ce0d5 = 0;
    }
    if (!var_da6ce0d5) {
        if (isbot(self)) {
            self ct_bots::disablebot();
        }
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 1, eflags: 0x0
// Checksum 0x1f352d4f, Offset: 0xa6e8
// Size: 0x262
function function_7746c49c(n_radius) {
    if (!isdefined(level.var_8dc0019e)) {
        e_player = getplayers()[0];
        level.var_8dc0019e = util::spawn_model("tag_origin", e_player.origin, e_player.angles);
    }
    if (!isdefined(level.var_2b87f134.origin)) {
        return undefined;
    }
    v_loc = level.var_2b87f134.origin;
    var_e3256b6c = randomfloatrange(n_radius * -1, n_radius);
    var_47a4d489 = randomfloatrange(n_radius * -1, n_radius);
    v_loc = (v_loc[0] + var_e3256b6c, v_loc[1] + var_47a4d489, v_loc[2]);
    v_loc = getclosestpointonnavmesh(v_loc, n_radius);
    if (isdefined(v_loc)) {
        n_height_diff = abs(level.var_2b87f134.origin[2] - v_loc[2]);
        jumpcmp(n_height_diff < 7) LOC_000001c2;
        v_loc = undefined;
    } else {
    LOC_000001c2:
        if (isdefined(v_loc) && isdefined(level.var_357913db)) {
            level.var_8dc0019e.origin = v_loc;
            foreach (vol in level.var_357913db) {
                if (level.var_8dc0019e istouching(vol)) {
                    v_loc = undefined;
                    break;
                }
            }
        }
        return v_loc;
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x4fc5259a, Offset: 0xa958
// Size: 0xc4
function function_99a579e2() {
    self endon(#"death");
    s_loc = level.var_9d057e74[level.var_1937cf8e];
    level.var_1937cf8e++;
    if (level.var_1937cf8e >= level.var_9d057e74.size) {
        level.var_1937cf8e = 0;
    }
    self setorigin(s_loc.origin);
    self setplayerangles(s_loc.angles);
    self thread function_d832af02(s_loc);
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0xffd3e868, Offset: 0xaa28
// Size: 0x80
function function_fa3dd4f0() {
    self endon(#"death");
    while (1) {
        level.var_3711d636 = undefined;
        level waittill(#"hash_4c1be11f1e312a36");
        level.var_3711d636 = 1;
        level waittill(#"hash_48b4c5f856407d62");
        level.var_3711d636 = undefined;
        waitframe(1);
    }
}

// Namespace namespace_56b8c026/namespace_56b8c026
// Params 0, eflags: 0x0
// Checksum 0x4164f05e, Offset: 0xaab0
// Size: 0xe0
function function_e94f91dd() {
    v_pos = (-352, -2746, 173);
    a_entities = getentarray();
    foreach (ent in a_entities) {
        n_dist = distance(v_pos, ent.origin);
        if (n_dist < 300) {
            ent delete();
        }
    }
}

