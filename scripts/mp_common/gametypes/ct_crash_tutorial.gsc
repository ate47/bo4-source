#using scripts\abilities\ability_player;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\bots\bot_stance;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\math_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\killstreaks\ai_tank_shared;
#using scripts\killstreaks\killstreaks_shared;
#using scripts\mp_common\gametypes\ct_ai;
#using scripts\mp_common\gametypes\ct_bots;
#using scripts\mp_common\gametypes\ct_gadgets;
#using scripts\mp_common\gametypes\ct_utils;
#using scripts\mp_common\gametypes\ct_vo;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\supplypod;

#namespace ct_crash_tutorial;

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf0e21811, Offset: 0xc10
// Size: 0x40c
function init() {
    level.var_7b05c4b5 = 0;
    level.var_9f011465 = 0;
    level.var_52a2e58a = &function_52a2e58a;
    level.var_84bf013e = 1;
    level.var_30264985 = 1;
    level.var_ed73ac32 = 0;
    setdvar(#"hash_48162cd174e3034d", 0);
    ability_player::register_gadget_primed_callbacks(36, &tak5_start);
    callback::on_vehicle_damage(&function_2a6fb094);
    level.var_ae120f18 = array(#"hash_73f4f0c897cb832");
    level flag::init("opening_battle");
    level flag::init("squad_health_70");
    level flag::init("squad_health_40");
    level flag::init("stop_reinforce");
    level flag::init("first_battle_over");
    level flag::init("goto_second_battle");
    level flag::init("supply_dropped");
    level flag::init("tak5_done");
    level flag::init("supply_drop");
    level flag::init("supply_done");
    level flag::init("second_battle_over");
    level flag::init("heal_squad");
    level flag::init("goto_entry");
    level flag::init("slo_mo");
    level flag::init("flash_bang");
    level flag::init("flash_bang_done");
    level flag::init("ambush_done");
    level flag::init("ambush_failed");
    level flag::init("go_scorestreak");
    level flag::init("scorestreak_enemies");
    level flag::init("squad_dead");
    level flag::init("scorestreak_done");
    level flag::init("mantis_failed");
    level flag::init("marker_on");
    level flag::init("mantis_enemies");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x7aa4ad4e, Offset: 0x1028
// Size: 0x14
function function_d0ad09c5(effect) {
    wait 0.5;
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 2, eflags: 0x0
// Checksum 0x30ba5121, Offset: 0x1048
// Size: 0x28
function tak5_start(slot, weapon) {
    level notify(#"tak5_start");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x208273e0, Offset: 0x1078
// Size: 0x1c4
function function_c9ff0dce() {
    self.health_start = self.health;
    self.overrideplayerdamage = &callback_player_damage;
    if (self.team == #"allies") {
        if (!isbot(self)) {
            if (level.var_ad7c0539 === 4) {
                self thread function_6e01051f();
            }
            ct_utils::delete_corpses();
            waitframe(1);
            ct_utils::function_8f04870f();
            if (level.var_ad7c0539 === 1 || level.var_ad7c0539 === 2) {
                level ct_vo::play_vo(#"hash_57374b6c23156b50", 1);
            }
        } else if (isdefined(level.var_72c3ea74)) {
            self thread function_62afa484();
            self thread function_58c62280(0, 0);
            self thread function_22014724();
            if (level.var_ad7c0539 === 1) {
                self thread function_fa5d9e36();
            }
        }
        return;
    }
    self thread function_58c62280(0, 0);
    if (level.var_ad7c0539 === 1) {
        self thread function_fa5d9e36();
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc7cdbf7a, Offset: 0x1248
// Size: 0x4c
function function_62afa484() {
    self endon(#"death");
    self hide();
    wait 0.5;
    self show();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 11, eflags: 0x0
// Checksum 0x66294072, Offset: 0x12a0
// Size: 0x212
function callback_player_damage(e_inflictor, e_attacker, n_damage, n_dflags, str_means_of_death, weapon, v_point, v_dir, str_hit_loc, n_psoffsettime, var_8b69d5cf) {
    if (level.var_ad7c0539 === 1 && self.team == #"allies" && isbot(self)) {
        if (self.health > int(self.health_start * 0.3)) {
            n_damage *= 1.5;
        }
    }
    if (level.var_ad7c0539 === 4 && self.team == #"allies") {
        n_damage *= 0.1;
    } else if (self.health < int(self.health_start * 0.3) && self.team == #"allies" && isbot(self)) {
        n_damage = 0;
    } else if (isbot(e_attacker)) {
        n_damage *= 0.2;
    }
    if (level.var_ad7c0539 === 2 && self.team == #"axis") {
        n_damage *= 4;
    }
    return int(n_damage);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 9, eflags: 0x0
// Checksum 0x3a0daa88, Offset: 0x14c0
// Size: 0x2aa
function function_72ba0df6(einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration) {
    if (isbot(self) && self.team === #"axis") {
        self.isinuse = 0;
    }
    if (level.var_ad7c0539 === 4 && !isbot(self)) {
        self ct_utils::clear_killstreaks();
    }
    if (level.var_ad7c0539 === 2 && self.team === #"axis") {
        if (isalive(level.players[0])) {
            level.var_3cdb14a8--;
            level.players[0] ct_utils::function_80bf685b(level.var_3cdb14a8);
        }
        return;
    }
    if (level.var_ad7c0539 === 4 && self.team === #"axis" && isplayer(attacker)) {
        if (isdefined(level.var_f9242904) && level.var_f9242904 && isalive(level.players[0])) {
            function_1089714c();
            return;
        }
        if (weapon == getweapon("tank_robot_launcher_turret")) {
            if (math::cointoss() && !level.var_ed73ac32) {
                level.var_ed73ac32 = 1;
                ct_vo::function_5df1a850(level.mantis, array(#"hash_2fd4a4ea9c9fe580"));
                wait 0.5;
                level.var_ed73ac32 = 0;
            }
        }
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x369464f4, Offset: 0x1778
// Size: 0x39c
function function_9b9525e9() {
    level endon(#"combattraining_logic_finished");
    level.var_e6db911d = 1;
    level.var_6a0c3e3e = 1;
    level.allowspecialistdialog = 0;
    level.var_d4668c34 = 1;
    level thread ct_utils::function_9ab507a9("tak_5_collision", "start_tak_5_collision", "stop_tak_5_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("tak_5_rear_collision", "start_tak_5_rear_collision", "stop_tak_5_rear_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("assault_pack_collision", "start_assault_pack_collision", "stop_assault_pack_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("assault_pack_lower_ramp_collision", "start_assault_pack_lower_ramp_collision", "stop_assault_pack_lower_ramp_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("assault_pack_lower_exit_collision", "start_assault_pack_lower_exit_collision", "stop_assault_pack_lower_exit_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("flash_bang_collision", "start_flash_bang_collision", "stop_flash_bang_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("flash_bang_contain_collision", "start_flash_bang_contain_collision", "stop_flash_bang_contain_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("flash_bang_done_collision", "start_flash_bang_done_collision", "stop_flash_bang_done_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("massage_room_collision", "start_massage_room_collision", "stop_massage_room_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("scorestreak_collision", "start_scorestreak_collision", "stop_scorestreak_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("earn_scorestreak_collision", "start_earn_scorestreak_collision", "stop_earn_scorestreak_collision", undefined, 1, 0);
    level thread ct_utils::function_9ab507a9("flash_bang_exit_collision", "start_flash_bang_exit_collision", "stop_flash_bang_exit_collision", undefined, 1, 0);
    level.var_ad7c0539 = 1;
    function_5ac0441c();
    level.var_ad7c0539 = 2;
    function_6dd7691f();
    level.var_ad7c0539 = 3;
    function_b8b46dc4();
    level.var_ad7c0539 = 4;
    function_c43189cd();
    ct_utils::function_9aca2fa0("ct_endgame");
    ct_utils::onboarding_complete();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3a3a15ea, Offset: 0x1b20
// Size: 0x638
function function_5ac0441c() {
    level endon(#"combattraining_logic_finished");
    level.var_e72728b8 = array(#"eq_localheal", #"gadget_supplypod");
    level.var_32ae304 = undefined;
    player = getplayers()[0];
    level notify(#"start_tak_5_collision");
    level notify(#"start_tak_5_rear_collision");
    ct_vo::function_3ca1b77d();
    level.var_72c3ea74 = struct::get_array("s_squad_loc_1");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"allies");
    wait 0.5;
    level ct_vo::play_vo(#"hash_73f500c897cb9e5", 1);
    level thread ct_vo::function_14b08e49(array(#"hash_52baeef8970ea64c"), "stop_goto_nag");
    ct_utils::function_e0d36a2c(undefined, "s_tak_5_goto", array(#"eq_localheal", #"gadget_supplypod"), 0, 1, 30);
    ct_utils::function_e9ab1003("s_tak_5_goto");
    level thread function_c1069664();
    level notify(#"stop_goto_nag");
    ct_vo::function_3ca1b77d();
    level ct_vo::play_vo(#"hash_4ecdeca73eb4f6c", 1);
    level flag::set("opening_battle");
    wait 0.5;
    ct_utils::function_9aca2fa0("ct_action2");
    level.var_72c3ea74 = struct::get_array("s_enemy_loc_1");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    wait 0.5;
    player thread ct_utils::function_61c3d59c(#"hash_2bf8d3080956ea43", undefined);
    level ct_vo::play_vo(#"hash_4ece0ca73eb52d2", 1);
    level flag::wait_till("squad_health_70");
    level ct_vo::play_vo(#"hash_2ea3b644e71ae89c", 1);
    level flag::wait_till("squad_health_40");
    player thread function_592ec7be();
    n_len = soundgetplaybacktime(#"hash_66f25a8f7113d138") / 1000;
    level thread ct_vo::play_vo(#"hash_66f25a8f7113d138", 0);
    wait 2.5;
    level thread ct_vo::function_14b08e49(array(#"hash_3fbd29645b774ffa"), "stop_heal_nag");
    var_5bddeb93 = player gamepadusedlast() ? #"hash_64d49e1e2e7c63e3" : #"hash_6e680b15656b935d";
    player thread ct_utils::function_61c3d59c(var_5bddeb93, undefined);
    level.var_e72728b8 = array(#"gadget_supplypod");
    level waittill(#"hash_4acf6588b40fe941");
    level notify(#"stop_heal_nag");
    ct_vo::function_3ca1b77d();
    ct_utils::function_c2a10fc();
    level.var_e72728b8 = array(#"eq_localheal", #"gadget_supplypod");
    level flag::set("stop_reinforce");
    level ct_vo::function_831e0584(array(#"hash_50cde9f5b369d5fa", #"hash_50cdeaf5b369d7ad"), 1);
    ct_utils::function_654280be();
    ct_utils::function_9aca2fa0("ct_action");
    level flag::set("first_battle_over");
    level notify(#"stop_tak_5_collision");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7add99fa, Offset: 0x2160
// Size: 0xb30
function function_6dd7691f() {
    level endon(#"combattraining_logic_finished");
    level.var_32ae304 = &ct_bots::function_32ae304;
    player = getplayers()[0];
    level.var_986d14aa = undefined;
    level.var_3cdb14a8 = 12;
    level flag::set("goto_second_battle");
    level flag::clear("stop_reinforce");
    level notify(#"start_assault_pack_collision");
    level notify(#"start_assault_pack_lower_ramp_collision");
    level thread ct_vo::function_14b08e49(array(#"hash_52baeef8970ea64c"), "stop_goto_nag");
    ct_utils::function_e0d36a2c(undefined, "s_assault_pack_goto", array(#"eq_localheal", #"gadget_supplypod"), 0, 1, 50);
    ct_utils::function_e9ab1003("s_assault_pack_goto");
    level notify(#"stop_goto_nag");
    level notify(#"start_tak_5_collision");
    level notify(#"stop_tak_5_rear_collision");
    ct_vo::function_3ca1b77d();
    level ct_vo::function_831e0584(array(#"hash_2f703d36d8623dbd", #"hash_2f703a36d86238a4"), 1);
    s_loc = struct::get("s_assault_pack_target");
    mdl_pod = util::spawn_model("wpn_t8_eqp_supply_pod_prop", s_loc.origin, s_loc.angles);
    wait 0.1;
    mdl_pod clientfield::set("objective_glow", 1);
    player thread ct_utils::function_61c3d59c(#"hash_4949854f8fd74d4c", undefined);
    level.var_e72728b8 = array(#"eq_localheal");
    level thread ct_vo::function_14b08e49(array(#"hash_563a706b0b3c4e8c"), "stop_resupply_nag");
    while (true) {
        s_result = player waittill(#"supplypod_placed");
        if (isdefined(s_result.pod)) {
            level.var_57a0fc09 = s_result.pod.origin;
            if (distance(level.var_57a0fc09, s_loc.origin) <= 60) {
                break;
            }
            s_result.pod.supplypod supplypod::function_827486aa(0, 0);
        }
    }
    level flag::set("supply_dropped");
    level.var_e72728b8 = array(#"eq_localheal", #"gadget_supplypod");
    mdl_pod delete();
    ct_utils::function_c2a10fc();
    level notify(#"stop_resupply_nag");
    ct_vo::function_3ca1b77d();
    wait 1.5;
    level.pod = gameobjects::function_6cdadc59(level.var_57a0fc09);
    level thread function_13b1605();
    level ct_vo::function_831e0584(array(#"hash_2f703b36d8623a57", #"hash_2f703836d862353e"), 1);
    level flag::wait_till("supply_done");
    level flag::clear("supply_done");
    if (isdefined(s_result.pod)) {
        s_result.pod.supplypod supplypod::function_827486aa(0, 0);
    }
    level.var_e72728b8 = undefined;
    level thread function_885de242();
    level notify(#"hash_58b92d4fec6c6932");
    level notify(#"start_assault_pack_lower_exit_collision");
    level.players[0] thread function_c93a1ee3();
    level ct_vo::play_vo(#"hash_4338c28cf3210c0e", 1);
    level.players[0] thread ct_utils::function_61c3d59c(#"hash_37bc6064ca962640", undefined);
    wait 2;
    ct_utils::function_9aca2fa0("ct_action2");
    level.var_72c3ea74 = struct::get_array("s_enemy_loc_2");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    wait 3;
    level.players[0] thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_TeamDefend");
    level.players[0] ct_utils::function_80bf685b(level.var_3cdb14a8);
    level thread function_9ece6b44();
    wait 1;
    level flag::wait_till("second_battle_over");
    ct_utils::function_654280be();
    ct_utils::function_9aca2fa0("ct_action");
    wait 1;
    if (isdefined(level.var_cd01b270)) {
        level flag::set("supply_drop");
        level flag::set("supply_done");
        level thread ct_vo::play_vo(#"hash_50cde7f5b369d294", 0);
        ct_vo::function_3ca1b77d();
    } else {
        level notify(#"ammo_watch");
        player thread ct_utils::function_61c3d59c(#"hash_76238e91d49336be", undefined);
    }
    player thread function_a929047f();
    player thread function_7aea5503();
    if (!level flag::get("supply_drop")) {
        level thread ct_vo::function_14b08e49(array(#"hash_563a706b0b3c4e8c"), "stop_resupply_nag");
        level thread function_779e90b6();
    }
    level ct_vo::play_vo(#"hash_4ece1ca73eb5485", 1);
    level.var_e72728b8 = undefined;
    level flag::wait_till("tak5_done");
    ct_vo::function_3ca1b77d();
    level ct_vo::play_vo(#"hash_2f703c36d8623c0a", 1);
    level flag::wait_till("supply_drop");
    ct_vo::function_3ca1b77d();
    level.var_e72728b8 = array(#"eq_localheal");
    level flag::wait_till("supply_done");
    level flag::clear("supply_done");
    foreach (bot in level.players[0] ct_bots::function_71ec2b36()) {
        if (!(isdefined(bot.var_e5f68d34) && bot.var_e5f68d34)) {
            bot thread function_96069b7b();
        }
    }
    ct_vo::function_3ca1b77d();
    level.var_e72728b8 = array(#"eq_localheal", #"gadget_supplypod");
    wait 0.5;
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x4e09d8fa, Offset: 0x2c98
// Size: 0x550
function function_b8b46dc4() {
    level endon(#"combattraining_logic_finished");
    level.var_32ae304 = &ct_bots::function_32ae304;
    level flag::set("supply_done");
    level thread function_885de242();
    level ct_vo::play_vo(#"hash_4ab0c7bfd17757b0", 1);
    level notify(#"stop_assault_pack_collision");
    level flag::set("goto_entry");
    level thread ct_vo::function_14b08e49(array(#"hash_52baeef8970ea64c"), "stop_goto_nag");
    ct_utils::function_e0d36a2c(undefined, "s_flash_bang_goto", array(#"eq_localheal", #"gadget_supplypod"), 0, 0, 30);
    ct_utils::function_e9ab1003("s_flash_bang_goto");
    level notify(#"start_assault_pack_collision");
    level notify(#"start_flash_bang_collision");
    level notify(#"start_flash_bang_contain_collision");
    level notify(#"start_flash_bang_done_collision");
    level notify(#"start_flash_bang_exit_collision");
    level notify(#"stop_goto_nag");
    ct_vo::function_3ca1b77d();
    ct_utils::function_9aca2fa0("ct_action2");
    while (!level flag::get("ambush_done")) {
        level.players[0] thread slo_mo();
        level thread function_fa4b570b();
        level ct_vo::play_vo(#"hash_4ab0cabfd1775cc9", 1);
        level flag::set("flash_bang");
        level ct_vo::play_vo(#"hash_4ab0c9bfd1775b16", 1);
        level flag::set("slo_mo");
        while (isalive(level.players[0]) && !level flag::get("ambush_done") && !level flag::get("ambush_failed")) {
            waitframe(1);
        }
        wait 0.5;
        if (!level flag::get("ambush_done")) {
            a_e_bots = level.players[0] ct_bots::function_dde6edbd();
            if (isdefined(a_e_bots) && a_e_bots.size) {
                level.players[0] ct_utils::function_49e0c5bc(1);
            }
            level flag::clear("slo_mo");
            level flag::clear("flash_bang");
            level flag::clear("flash_bang_done");
            level flag::clear("ambush_failed");
            level notify(#"start_flash_bang_contain_collision");
            wait 0.5;
            level thread ct_utils::function_79957328(0.5);
            wait 0.75;
            level.var_72c3ea74 = struct::get_array("bathhouse", "script_noteworthy");
            level.var_da5432a2 = 0;
            level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"allies");
            wait 0.5;
        }
        ct_utils::function_9aca2fa0("ct_action");
        wait 0.5;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x43ca47e8, Offset: 0x31f0
// Size: 0x3d4
function function_c43189cd() {
    level endon(#"combattraining_logic_finished");
    level.var_32ae304 = &ct_bots::function_32ae304;
    level.var_e72728b8 = undefined;
    level flag::set("supply_done");
    level flag::clear("stop_reinforce");
    level flag::set("go_scorestreak");
    level notify(#"start_flash_bang_collision");
    level notify(#"stop_flash_bang_done_collision");
    level notify(#"start_massage_room_collision");
    level notify(#"start_scorestreak_collision");
    level notify(#"start_flash_bang_exit_collision");
    level thread ct_vo::function_14b08e49(array(#"hash_52baeef8970ea64c"), "stop_goto_nag");
    ct_utils::function_e0d36a2c(undefined, "s_scorestreak_goto", undefined, 0, 1, 50);
    ct_utils::function_e9ab1003("s_scorestreak_goto");
    level notify(#"stop_goto_nag");
    level notify(#"start_earn_scorestreak_collision");
    level notify(#"stop_flash_bang_collision");
    level ct_vo::function_831e0584(array(#"hash_e9de3cecbdc8e8c", #"hash_e9de4cecbdc903f", #"hash_e9de5cecbdc91f2", #"hash_e9de6cecbdc93a5"), 1);
    globallogic_score::_setplayermomentum(level.players[0], 0);
    callback::on_player_killed_with_params(&ct_utils::function_944e4110);
    level thread ct_vo::function_831e0584(array("vox_tvoi_tutor_crash_final_score_earn_4"));
    level flag::set("scorestreak_enemies");
    ct_utils::function_9aca2fa0("ct_action2");
    function_45f0ba8d();
    function_8ab81320();
    if (level.players[0] isinvehicle()) {
        ct_vo::function_5df1a850(level.mantis, array(#"hash_23cf8a3a3e0d6ed3", #"hash_23cf893a3e0d6d20", #"hash_23cf8c3a3e0d7239"));
    } else {
        level ct_vo::function_831e0584(array(#"hash_23cf8a3a3e0d6ed3", #"hash_23cf893a3e0d6d20", #"hash_23cf8c3a3e0d7239"), 1);
    }
    wait 1;
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x535c9809, Offset: 0x35d0
// Size: 0x80
function function_9b33ff60() {
    level endon(#"combattraining_logic_finished");
    while (true) {
        level waittill(#"marker_ready");
        level flag::set("marker_on");
        level flag::wait_till_clear("marker_on");
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3beba166, Offset: 0x3658
// Size: 0x93c
function function_8ab81320() {
    level endon(#"combattraining_logic_finished");
    level.spawnprotectiontime = 0;
    level thread ct_vo::function_14b08e49(array(#"hash_786dd82792eda658"), "stop_scorestreak_nag");
    level thread ct_vo::play_vo(#"hash_746bbb3099ae8d4b", 0);
    while (!level flag::get("scorestreak_done")) {
        var_c6847598 = level.players[0] gamepadusedlast() ? #"hash_6294dadea114ab41" : #"hash_57872bdaf9640a47";
        level.players[0] ct_utils::function_61c3d59c(var_c6847598, undefined);
        level.players[0] ct_utils::function_49e0c5bc(0);
        level.players[0] thread function_667b9fbc();
        level notify(#"start_earn_scorestreak_collision");
        level notify(#"start_flash_bang_exit_collision");
        level flag::wait_till("marker_on");
        ct_utils::function_c2a10fc();
        level notify(#"stop_scorestreak_nag");
        level thread ct_vo::function_14b08e49(array(#"hash_786dd82792eda658"), "stop_marker_nag");
        level.players[0] ct_utils::function_49e0c5bc(0);
        level thread function_6fec06e4();
        level.players[0] ct_utils::function_61c3d59c(#"hash_591cb25b88f61bb4", undefined);
        level.players[0] util::waittill_attack_button_pressed();
        ct_utils::function_c2a10fc();
        level.players[0] waittill(#"tank_robot");
        level notify(#"stop_marker_nag");
        level flag::clear("mantis_failed");
        level flag::clear("marker_on");
        level flag::clear("mantis_enemies");
        while (true) {
            level.mantis = getent("talon", "targetname");
            if (isdefined(level.mantis)) {
                break;
            } else if (isdefined(level.var_cf82598a) && level.var_cf82598a) {
                level ct_vo::play_vo(#"hash_fc616b0cea91320", 1);
                level.players[0] ct_utils::function_61c3d59c(#"hash_6294dadea114ab41", undefined);
                ct_utils::function_e44c5b8e(#"ai_tank_marker", 10);
                level.var_b4a06c5b = #"tank_robot";
                setdvar(#"hash_3e06b14c41136e95", 0);
                level.players[0] thread function_667b9fbc();
                level waittill(#"marker_ready");
                ct_utils::function_c2a10fc();
                level.var_cf82598a = 0;
                level.players[0] ct_utils::function_61c3d59c(#"hash_591cb25b88f61bb4", undefined);
                level.players[0] util::waittill_attack_button_pressed();
                ct_utils::function_c2a10fc();
            }
            waitframe(1);
        }
        level thread ct_vo::play_vo(#"hash_6d4d58453e122b30");
        level thread ct_vo::function_14b08e49(array(#"hash_786dd82792eda658"), "stop_mantis_nag");
        var_fc51cece = level.players[0] gamepadusedlast() ? #"hash_4015899fc4930e7d" : #"hash_6731f4ac7ebfc213";
        level.players[0] ct_utils::function_61c3d59c(var_fc51cece, undefined);
        s_result = level.mantis waittill(#"enter_vehicle", #"death");
        level.players[0] ct_utils::function_61c3d59c(#"hash_6d973e1934818fdc", undefined);
        level notify(#"stop_mantis_nag");
        if (s_result._notify === "death") {
            continue;
        } else {
            level.mantis thread function_457bfbbf();
            level notify(#"stop_earn_scorestreak_collision");
            level notify(#"stop_flash_bang_exit_collision");
            wait 2;
            if (level.players[0] isinvehicle()) {
                level thread ct_vo::function_5df1a850(level.mantis, array(#"hash_1253da940331a76a"));
            } else {
                level thread ct_vo::function_831e0584(array(#"hash_1253da940331a76a"));
            }
        }
        if (isdefined(level.mantis)) {
            level.mantis.team = #"allies";
            level.mantis thread function_27c1d990();
            level thread function_89bb199b();
        }
        s_loc = struct::get("s_enemy_mantis");
        var_c361acde = ct_ai::function_4c8f915a(s_loc.origin);
        var_c361acde thread function_119c4576(s_loc);
        var_c361acde thread function_2ba574d8();
        level flag::wait_till("mantis_enemies");
        level thread function_57da4e0f();
        level flag::wait_till_any(array("mantis_failed", "scorestreak_done"));
        if (level flag::get("mantis_failed")) {
            ct_utils::function_c2a10fc();
            if (isalive(var_c361acde)) {
                var_c361acde delete();
            }
        }
        while (!isalive(level.players[0])) {
            waitframe(1);
        }
        wait 1;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x23f84445, Offset: 0x3fa0
// Size: 0xec
function function_89bb199b() {
    level endon(#"mantis_enemies");
    trigger::wait_till("trigger_enemies");
    if (!level.players[0] isinvehicle()) {
        if (isalive(level.mantis)) {
            level flag::set("mantis_failed");
            level flag::set("mantis_enemies");
            level.mantis kill();
        }
    }
    level flag::set("mantis_enemies");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x8439ea76, Offset: 0x4098
// Size: 0x66
function function_2a6fb094(params) {
    if (params.weapon === getweapon("tank_robot_launcher_turret") && self === params.eattacker) {
        self.health += params.idamage;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x10c7b8aa, Offset: 0x4108
// Size: 0x84
function function_eabeced7() {
    ct_utils::function_c2a10fc();
    level flag::set("stop_reinforce");
    wait 1.5;
    level.players[0] ct_utils::function_49e0c5bc(0);
    wait 1.5;
    level flag::clear("stop_reinforce");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x78f8dae, Offset: 0x4198
// Size: 0x596
function function_45f0ba8d() {
    level endon(#"combattraining_logic_finished");
    level.players[0] thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_EarnMantis");
    level.var_f9242904 = 1;
    level thread function_9b33ff60();
    level.var_d4668c34 = undefined;
    while (level.var_f9242904) {
        ct_utils::function_e44c5b8e(#"ai_tank_marker", 10);
        level.var_b4a06c5b = #"tank_robot";
        setdvar(#"hash_3e06b14c41136e95", 0);
        level.players[0] thread ct_utils::function_61c3d59c(undefined, undefined, "dynobj_EarnMantis");
        level.var_37591676 = 0;
        level.players[0] ct_utils::function_80bf685b(level.var_37591676);
        level.players[0].momentum = 0;
        globallogic_score::_setplayermomentum(level.players[0], level.var_37591676);
        level.players[0] thread function_9b2c973f();
        level.players[0] thread function_6140f62e();
        level.players[0] thread function_c59990b1();
        level.var_72c3ea74 = struct::get_array("s_enemy_loc_scorestreak");
        level.var_da5432a2 = 0;
        level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
        wait 0.5;
        while (!level flag::get("squad_dead") && level.var_f9242904 && !(isdefined(level.var_51ff7a58) && level.var_51ff7a58) && isalive(level.players[0])) {
            waitframe(1);
        }
        if (level flag::get("squad_dead") || !isalive(level.players[0])) {
            level flag::set("stop_reinforce");
            level.players[0] ct_utils::function_1bb93418();
            level.players[0] ct_utils::function_49e0c5bc(1);
            if (level flag::get("squad_dead")) {
                level ct_vo::play_vo(#"hash_8a8191de2104c1a", 1);
            }
            ct_utils::function_79957328(0.5);
            wait 0.5;
            level.var_72c3ea74 = struct::get_array("s_cover_scorestreak");
            level.var_da5432a2 = 0;
            level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"allies");
            wait 0.5;
            level flag::clear("squad_dead");
            level flag::clear("stop_reinforce");
        }
        if (isdefined(level.var_51ff7a58) && level.var_51ff7a58) {
            level.players[0] ct_utils::function_49e0c5bc(0);
            level.var_f9242904 = 0;
        }
        while (!isalive(level.players[0])) {
            waitframe(1);
        }
        waitframe(1);
    }
    level notify(#"killstreak_ready");
    level.var_51ff7a58 = 0;
    callback::remove_on_player_killed_with_params(&ct_utils::function_944e4110);
    level.var_e72728b8 = array(#"eq_localheal", #"gadget_supplypod");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf70ba1c2, Offset: 0x4738
// Size: 0x78
function function_537c9eea() {
    self endon(#"death");
    level endon(#"killstreak_ready");
    self waittill(#"hash_600461f8d5fa1837");
    level.var_51ff7a58 = 1;
    self ct_utils::function_1bb93418();
    level notify(#"killstreak_ready");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xecb07ce8, Offset: 0x47b8
// Size: 0x1e4
function function_1089714c(str_type) {
    level endon(#"combattraining_logic_finished", #"killstreak_ready");
    if (isdefined(str_type)) {
        if (str_type == "ammo") {
            n_points = 50;
        } else {
            n_points = 25;
        }
        level.var_37591676 += n_points;
        event = #"ekia";
        eventindex = level.scoreinfo[event][#"row"];
        level.players[0] globallogic_score::giveplayermomentumnotification(n_points, #"hash_480234a872bd64ac", undefined, 0, level.players[0].currentweapon, 0, eventindex, event, undefined);
    } else {
        level.var_37591676 += 100;
    }
    if (level.var_37591676 < 1000) {
        level.players[0] ct_utils::function_80bf685b(level.var_37591676);
    } else {
        level.var_51ff7a58 = 1;
        level.players[0] ct_utils::function_1bb93418();
        level notify(#"killstreak_ready");
    }
    if (level.var_37591676 > 800) {
        level flag::set("stop_reinforce");
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x618432a3, Offset: 0x49a8
// Size: 0x54
function function_667b9fbc() {
    var_4152a793 = killstreaks::get_killstreak_momentum_cost(self, #"tank_robot");
    if (self.momentum < var_4152a793) {
        globallogic_score::_setplayermomentum(self, var_4152a793);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x9e9f1381, Offset: 0x4a08
// Size: 0x3bc
function function_9b2c973f() {
    level endon(#"combattraining_logic_finished");
    self endon(#"hash_600461f8d5fa1837");
    level endon(#"squad_dead");
    a_bots = self ct_bots::function_71ec2b36();
    var_c5a2f4b9 = a_bots.size;
    var_c378327e = 0;
    var_2cf11630 = 0;
    n_start_health = 0;
    n_current_health = 0;
    var_66075595 = 0;
    var_ca0b6cf8 = 0;
    var_600f40b6 = 0;
    foreach (bot in a_bots) {
        n_start_health += bot.health;
        var_c378327e += bot getammocount(bot.currentweapon);
    }
    var_9192acd9 = int(n_start_health * 0.5);
    var_8fe4b14 = int(var_c378327e * 0.5);
    while (true) {
        if (isalive(self)) {
            a_bots = self ct_bots::function_71ec2b36();
            foreach (bot in a_bots) {
                n_current_health += bot.health;
                var_2cf11630 += bot getammocount(bot.currentweapon);
            }
            if (!(isdefined(a_bots.size) && a_bots.size)) {
                level flag::set("squad_dead");
            }
            if (n_current_health <= var_9192acd9 && !var_66075595) {
                var_66075595 = 1;
                ct_vo::function_3ca1b77d();
                level ct_vo::play_vo(#"hash_552f1f27a33c7e19", 1);
            }
            if (var_2cf11630 <= var_8fe4b14 && !var_ca0b6cf8) {
                var_ca0b6cf8 = 1;
                ct_vo::function_3ca1b77d();
                level ct_vo::play_vo(#"hash_14b9de5845fb30f1", 1);
            }
            n_current_health = 0;
            var_2cf11630 = 0;
        } else {
            while (!isalive(self)) {
                waitframe(1);
            }
        }
        wait 1;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x38bd5cae, Offset: 0x4dd0
// Size: 0x1bc
function function_119c4576(s_loc) {
    self endon(#"death");
    self.targetname = "enemy _mantis";
    self.health = 1500;
    self val::set(#"ai_forcegoal", "ignoreall", 1);
    wait 0.2;
    self clientfield::set("enemy_vehicle_keyline_render", 1);
    s_goal = struct::get(s_loc.target);
    self setgoal(s_goal.origin, 1);
    while (isdefined(s_goal.target)) {
        self waittill(#"goal", #"near_goal");
        s_goal = struct::get(s_goal.target);
        self setgoal(s_goal.origin, 1);
        if (isdefined(level.mantis) && distance(self.origin, level.mantis.origin) <= 750) {
            break;
        }
    }
    self val::reset(#"ai_forcegoal", "ignoreall");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf510d5af, Offset: 0x4f98
// Size: 0x264
function function_57da4e0f() {
    level endon(#"combattraining_logic_finished", #"mantis_failed");
    level.var_72c3ea74 = struct::get_array("s_mantis_enemy_1");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    wait 1;
    a_bots = level.players[0] ct_bots::function_dde6edbd();
    n_enemy_count = a_bots.size;
    while (true) {
        a_bots = level.players[0] ct_bots::function_dde6edbd();
        if (a_bots.size <= n_enemy_count - 2) {
            break;
        }
        wait 0.5;
    }
    level.var_72c3ea74 = struct::get_array("s_mantis_enemy_2");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    a_bots = level.players[0] ct_bots::function_dde6edbd();
    n_enemy_count = a_bots.size;
    while (true) {
        a_bots = level.players[0] ct_bots::function_dde6edbd();
        if (a_bots.size <= n_enemy_count - 2) {
            break;
        }
        wait 0.5;
    }
    level.var_72c3ea74 = struct::get_array("s_mantis_enemy_3");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf794620e, Offset: 0x5208
// Size: 0xbc
function function_27c1d990() {
    level endon(#"combattraining_logic_finished");
    s_result = self waittill(#"death");
    level flag::set("mantis_failed");
    if (s_result.weapon === getweapon("tank_robot_launcher_turret_ct")) {
        ct_vo::function_5df1a850(level.mantis, array(#"hash_456fd50bbc8c59e4"));
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x568a462c, Offset: 0x52d0
// Size: 0x17c
function function_457bfbbf() {
    level endon(#"combattraining_logic_finished", #"scorestreak_done");
    level.players[0] endon(#"death");
    self endon(#"death");
    level.players[0] val::set("mantis_control", "takedamage", 0);
    while (level.players[0] isinvehicle()) {
        waitframe(1);
    }
    level.players[0] val::reset("mantis_control", "takedamage");
    ct_utils::function_79957328(undefined);
    if (isalive(self)) {
        level flag::set("mantis_failed");
        level flag::set("mantis_enemies");
        self kill();
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1e38b9c9, Offset: 0x5458
// Size: 0x11e
function function_2ba574d8() {
    level endon(#"combattraining_logic_finished", #"mantis_failed");
    s_result = self waittill(#"death");
    level thread function_eabeced7();
    if (!level flag::get("mantis_failed")) {
        level flag::set("scorestreak_done");
    }
    wait 0.5;
    while (true) {
        a_bots = level.players[0] ct_bots::function_dde6edbd();
        if (isdefined(a_bots) && a_bots.size) {
            level.players[0] ct_utils::function_49e0c5bc(0);
        }
        waitframe(1);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x7d90d95d, Offset: 0x5580
// Size: 0x44
function function_6fec06e4() {
    level endon(#"combattraining_logic_finished");
    wait 1.5;
    level thread ct_vo::play_vo(#"hash_30134c68da242470");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xa422d1f8, Offset: 0x55d0
// Size: 0x24
function function_52a2e58a(a_players) {
    level notify(#"hash_4acf6588b40fe941");
    return a_players;
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 2, eflags: 0x0
// Checksum 0x21aa821f, Offset: 0x5600
// Size: 0x3b4
function function_58c62280(b_keyline, b_ignoreall) {
    if (!isdefined(level.var_72c3ea74)) {
        return;
    }
    s_loc = level.var_72c3ea74[level.var_da5432a2];
    level.var_da5432a2++;
    if (level.var_da5432a2 >= level.var_72c3ea74.size) {
        level.var_da5432a2 = 0;
    }
    self endon(#"death");
    if (isdefined(b_ignoreall) && b_ignoreall) {
        self val::set(#"crash_bot", "ignoreall", 1);
    }
    self.n_wait = s_loc.script_wait;
    self.n_index = s_loc.script_int;
    self ct_bots::function_fd2d220e(0);
    self thread give_bot_weapon();
    self thread ct_utils::function_61d750d4(s_loc.origin, s_loc.angles);
    switch (level.var_ad7c0539) {
    case 1:
        if (self.team == #"allies") {
            self thread function_58521014(s_loc);
            self thread function_85903699();
            self thread function_68ac03e(s_loc);
            self thread function_d43893a9(s_loc);
        } else {
            self thread function_83085be6(s_loc);
        }
        break;
    case 2:
        if (self.team == #"allies") {
            self thread function_85903699();
        } else {
            self thread function_257306e5(s_loc);
        }
        break;
    case 3:
        if (self.team == #"allies") {
            self thread function_68ac03e(s_loc);
            self thread function_d43893a9(s_loc);
        } else if (s_loc.script_noteworthy === "flash_bang") {
            self thread function_a7eac7bd(s_loc);
        } else {
            self thread function_84a467cb(s_loc);
        }
        break;
    case 4:
        if (self.team == #"allies") {
            self thread function_d43893a9(s_loc);
        } else if (!isdefined(s_loc.script_noteworthy)) {
            self thread function_de259bfd(s_loc);
        } else {
            self thread function_370c032b(s_loc);
        }
        break;
    }
    wait 0.1;
    if (isdefined(b_keyline) && b_keyline) {
        self clientfield::set("enemy_keyline_render", 1);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xec148d8c, Offset: 0x59c0
// Size: 0x16c
function function_58521014(s_loc) {
    self endon(#"death");
    self.n_wait = s_loc.script_wait;
    self.n_index = s_loc.script_int;
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    s_goal = struct::get(s_loc.target);
    level flag::wait_till("opening_battle");
    wait s_loc.script_wait;
    self thread ct_utils::function_5b59f3b7(s_goal.origin, s_goal.angles, 16);
    while (distance(self.origin, s_goal.origin) > 16) {
        waitframe(1);
    }
    if (s_goal.script_noteworthy === "crouch") {
        self bot_stance::crouch();
    }
    self ct_utils::function_5149c890(1);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x49c19f8f, Offset: 0x5b38
// Size: 0x26c
function function_85903699() {
    self endon(#"death");
    self.bot.var_b2b8f0b6 = 150;
    self.bot.var_e8c941d6 = 250;
    self ct_utils::function_5149c890(1);
    level flag::wait_till("goto_second_battle");
    s_goto = struct::get("s_assault_pack_goto_" + self.n_index);
    self.s_pod = struct::get(s_goto.target);
    self.s_cover = struct::get(self.s_pod.target);
    self.var_df772c06 = struct::get("face_second_battle");
    self.s_lookat = self.var_df772c06;
    wait self.n_wait;
    self thread ct_utils::function_5b59f3b7(s_goto.origin, s_goto.angles, 16);
    self waittill(#"goal");
    self function_89cd182c(self.var_df772c06);
    if (s_goto.script_noteworthy === "crouch") {
        self bot_stance::crouch();
    } else {
        self bot_stance::stand();
    }
    level flag::wait_till("supply_dropped");
    wait self.n_wait;
    var_fbe6d5ea = level.var_57a0fc09 - self.origin;
    v_angles = vectortoangles(var_fbe6d5ea);
    self thread ct_utils::function_5b59f3b7(self.s_pod.origin, v_angles, 32);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x7ae51386, Offset: 0x5db0
// Size: 0x2b4
function function_68ac03e(s_loc) {
    self endon(#"death");
    self ct_utils::function_5149c890(1);
    level flag::wait_till("goto_entry");
    self bot_stance::stand();
    self.n_index = s_loc.script_int;
    s_goto = struct::get("s_cover_entry_" + self.n_index);
    s_cover = struct::get(s_goto.target);
    if (isdefined(self.n_wait)) {
        wait self.n_wait;
    }
    self thread ct_utils::function_5b59f3b7(s_goto.origin, s_goto.angles, 16);
    self waittill(#"goal");
    if (s_goto.script_int === 2 || s_goto.script_int === 4) {
        self bot_stance::crouch();
    }
    if (self.n_index === 1 || self.n_index === 2) {
        var_df772c06 = struct::get("s_bathhouse_face_1");
    } else {
        var_df772c06 = struct::get("s_bathhouse_face_2");
    }
    self function_89cd182c(var_df772c06);
    level flag::wait_till("flash_bang_done");
    wait randomfloatrange(0.8, 1.5);
    self bot_stance::stand();
    self thread ct_utils::function_5b59f3b7(s_cover.origin, s_cover.angles, 16);
    self waittill(#"goal");
    wait 0.3;
    self function_89cd182c(var_df772c06);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xb10a20d8, Offset: 0x6070
// Size: 0x234
function function_d43893a9(s_loc) {
    self endon(#"death");
    s_ready = struct::get("s_ready_scorestreak_" + self.n_index, "script_noteworthy");
    s_lookat = struct::get(s_ready.target);
    s_goto = struct::get("s_cover_scorestreak_" + self.n_index, "script_noteworthy");
    if (!level flag::get("squad_dead")) {
        level flag::wait_till("go_scorestreak");
        wait randomfloatrange(0.3, 0.8);
        self thread ct_utils::function_5b59f3b7(s_ready.origin, s_ready.angles, 32);
        self waittill(#"goal");
        wait 0.5;
        self function_89cd182c(s_lookat);
        self.s_lookat = s_lookat;
        self bot_stance::crouch();
        level flag::wait_till("scorestreak_enemies");
        wait randomfloatrange(1.3, 1.8);
    }
    self thread ct_utils::function_5b59f3b7(s_goto.origin, s_goto.angles, 8);
    self waittill(#"goal");
    self bot_stance::crouch();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x3d4336e4, Offset: 0x62b0
// Size: 0xfc
function function_bd8a36e(var_df772c06) {
    self endon(#"death");
    self thread ct_utils::function_5b59f3b7(self.s_cover.origin, self.s_cover.angles, 16);
    while (distance(self.origin, self.s_cover.origin) > 16) {
        waitframe(1);
    }
    self function_89cd182c(var_df772c06);
    wait 2;
    if (self.s_cover.script_noteworthy === "crouch") {
        self bot_stance::crouch();
    }
    self function_89cd182c(var_df772c06);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xfd6a99d7, Offset: 0x63b8
// Size: 0x1ec
function function_da2f82f1(n_radius) {
    self endon(#"death");
    level.pod endon(#"death");
    wait randomfloatrange(0.5, 1.2);
    var_fbe6d5ea = level.pod.origin - self.origin;
    v_angles = vectortoangles(var_fbe6d5ea);
    self function_89cd182c(level.pod);
    self thread ct_utils::function_5b59f3b7(self.s_pod.origin, v_angles, n_radius);
    self waittill(#"goal");
    while (isdefined(level.pod.in_use) && level.pod.in_use) {
        waitframe(1);
    }
    self bot_action::reset();
    waitframe(1);
    self bot::set_interact(level.pod);
    waitframe(1);
    level.pod.in_use = 1;
    self waittill(#"hash_69dbfbd660f8c53e");
    level.pod.in_use = 0;
    self thread ct_utils::function_5b59f3b7(self.origin, self.angles, 16);
    self thread function_b03052f5();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x3a987a3d, Offset: 0x65b0
// Size: 0xf4
function function_b03052f5() {
    self endon(#"death");
    self function_89cd182c(self.var_df772c06);
    wait 1.5;
    self bot_action::reset();
    wait 2;
    self thread ct_utils::function_5b59f3b7(self.s_cover.origin, self.s_cover.angles, 16);
    self waittill(#"goal");
    if (self.s_cover.script_noteworthy === "crouch") {
        self bot_stance::crouch();
        return;
    }
    self bot_stance::stand();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x95091ca4, Offset: 0x66b0
// Size: 0xf4
function function_13b1605() {
    level endon(#"combattraining_logic_finished");
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    for (i = 0; i < a_bots.size; i++) {
        if (isdefined(level.pod)) {
            a_bots[i] function_da2f82f1(32);
        }
        a_bots[i] thread function_bd8a36e(a_bots[i].var_df772c06);
    }
    wait 2;
    level flag::set("supply_done");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x2b5c320b, Offset: 0x67b0
// Size: 0x13c
function function_83085be6(s_loc) {
    self endon(#"death");
    self thread first_battle_over();
    if (!level flag::get("stop_reinforce")) {
        self thread reinforce_enemy(s_loc);
    }
    s_goal = struct::get(s_loc.target);
    s_moveto = struct::get(s_goal.target);
    self thread ct_utils::function_5b59f3b7(s_goal.origin, s_goal.angles, 32);
    self waittill(#"goal");
    self thread ct_utils::function_1e7b75f2(s_moveto);
    if (math::cointoss()) {
        self bot_stance::crouch();
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x490e4467, Offset: 0x68f8
// Size: 0x1d4
function function_257306e5(s_loc) {
    self endon(#"death");
    var_91aa9c27 = level.players[0] ct_bots::function_dde6edbd().size;
    if (!level flag::get("stop_reinforce") && var_91aa9c27 < level.var_3cdb14a8) {
        self thread reinforce_enemy(s_loc);
    }
    s_goal = struct::get(s_loc.target);
    s_moveto = struct::get(s_goal.target);
    self thread ct_utils::function_5b59f3b7(s_goal.origin, s_goal.angles, 16);
    self waittill(#"goal");
    if (!isdefined(s_loc.script_noteworthy)) {
        self thread ct_utils::function_1e7b75f2(s_moveto);
    }
    if (isdefined(s_goal.script_noteworthy)) {
        self bot_stance::crouch();
    }
    level flag::wait_till("second_battle_over");
    wait randomfloatrange(1, 2);
    self ct_bots::disablebot();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6758a74b, Offset: 0x6ad8
// Size: 0xfc
function first_battle_over() {
    self endon(#"death");
    level flag::wait_till("stop_reinforce");
    var_59367987 = struct::get("s_enemy_runto");
    wait randomfloatrange(1.5, 2.5);
    self thread ct_utils::function_5b59f3b7(var_59367987.origin, var_59367987.angles, 32);
    wait randomfloatrange(1.5, 2.5);
    self disableinvulnerability();
    self.takedamage = 1;
    self kill();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x4ccef00c, Offset: 0x6be0
// Size: 0x18c
function reinforce_enemy(s_loc) {
    level endon(#"scorestreak_done");
    self waittill(#"death");
    wait randomfloatrange(0.5, 1.5);
    if (!level flag::get("stop_reinforce")) {
        if (level flag::get("scorestreak_done")) {
            return;
        }
        if (level.var_ad7c0539 === 2) {
            if (level.players[0] ct_bots::function_dde6edbd().size < level.var_3cdb14a8) {
                level.var_72c3ea74 = array(s_loc);
                level.var_da5432a2 = 0;
                ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
            }
            return;
        }
        level.var_72c3ea74 = array(s_loc);
        level.var_da5432a2 = 0;
        ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xffa8dd83, Offset: 0x6d78
// Size: 0x184
function function_84a467cb(s_loc) {
    self endon(#"death");
    self.bot.var_b2b8f0b6 = 650;
    self.bot.var_e8c941d6 = 800;
    self val::set("ambush", "ignoreall", 1);
    self val::set("ambush", "ignoreme", 1);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 16);
    s_goal = struct::get(s_loc.target);
    level flag::wait_till("flash_bang_done");
    self val::reset("ambush", "ignoreall");
    self val::reset("ambush", "ignoreme");
    self thread ct_utils::function_5b59f3b7(s_goal.origin, s_goal.angles, 32);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xbabd161d, Offset: 0x6f08
// Size: 0x14c
function function_de259bfd(s_loc) {
    self endon(#"death");
    self.bot.var_b2b8f0b6 = 350;
    self.bot.var_e8c941d6 = 550;
    if (!level flag::get("stop_reinforce")) {
        self thread reinforce_enemy(s_loc);
    }
    s_goal = struct::get(s_loc.target);
    s_moveto = struct::get(s_goal.target);
    self thread ct_utils::function_5b59f3b7(s_goal.origin, s_goal.angles, 64);
    self waittill(#"goal");
    self thread ct_utils::function_1e7b75f2(s_moveto);
    if (math::cointoss()) {
        self bot_stance::crouch();
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x395d845, Offset: 0x7060
// Size: 0x13c
function function_370c032b(s_loc) {
    self endon(#"death");
    if (s_loc.script_noteworthy === "mantis_1") {
        s_goal = struct::get(s_loc.target);
        self thread ct_utils::function_5b59f3b7(s_goal.origin, s_goal.angles, 64);
        self waittill(#"goal");
    } else if (!level flag::get("stop_reinforce") && s_loc.script_noteworthy === "mantis_3") {
        self thread reinforce_enemy(s_loc);
    }
    if (isalive(level.mantis)) {
        self ct_utils::function_b5e31ad(level.mantis, 450, 550);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb1be921, Offset: 0x71a8
// Size: 0x1c0
function function_c1069664() {
    level endon(#"squad_health_40");
    player = getplayers()[0];
    a_bots = player ct_bots::function_71ec2b36();
    n_start_health = 600;
    n_current_health = 0;
    var_a12cbae4 = int(n_start_health * 0.7);
    var_154343e2 = int(n_start_health * 0.4);
    player thread function_c3ff6f27();
    while (true) {
        foreach (bot in a_bots) {
            n_current_health += bot.health;
        }
        if (n_current_health <= var_a12cbae4) {
            level flag::set("squad_health_70");
        }
        if (n_current_health <= var_154343e2) {
            level flag::set("squad_health_40");
        }
        n_current_health = 0;
        wait 1;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xed978519, Offset: 0x7370
// Size: 0x194
function function_c93a1ee3() {
    self endon(#"death");
    a_bots = self ct_bots::function_71ec2b36();
    n_start_health = 0;
    n_current_health = 0;
    foreach (bot in a_bots) {
        n_start_health += bot.health;
    }
    level flag::wait_till("second_battle_over");
    a_bots = self ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        n_current_health += bot.health;
    }
    if (n_current_health < n_start_health) {
        level flag::set("heal_squad");
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x244399b2, Offset: 0x7510
// Size: 0x170
function function_c3ff6f27() {
    level endon(#"combattraining_logic_finished", #"battle_over", #"squad_health_40");
    self endon(#"death");
    level flag::wait_till("squad_health_70");
    wait 10;
    while (true) {
        a_bots = self ct_bots::function_71ec2b36();
        foreach (bot in a_bots) {
            if (bot.health > 60) {
                wait randomfloatrange(0.5, 1.5);
                bot dodamage(5, bot.origin);
            }
        }
        wait randomfloatrange(1.5, 2);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6c81f8ac, Offset: 0x7688
// Size: 0x198
function function_592ec7be() {
    self endon(#"death");
    level endon(#"combattraining_logic_finished");
    level flag::wait_till("squad_health_40");
    a_bots = self ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        bot val::set("first_battle", "takedamage", 0);
    }
    level flag::wait_till("first_battle_over");
    a_bots = self ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        bot val::reset("first_battle", "takedamage");
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6022166e, Offset: 0x7828
// Size: 0xa4
function give_bot_weapon() {
    self endon(#"death");
    wait 0.2;
    if (math::cointoss()) {
        self thread ct_bots::function_35e77034(getweapon(#"ar_accurate_t8"), 1);
        return;
    }
    self thread ct_bots::function_35e77034(getweapon(#"smg_accurate_t8", 1));
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x5ccb7ad2, Offset: 0x78d8
// Size: 0x7c
function function_9ece6b44() {
    level endon(#"combattraining_logic_finished");
    while (true) {
        if (level.var_3cdb14a8 < 1) {
            break;
        }
        waitframe(1);
    }
    level flag::set("second_battle_over");
    level flag::set("stop_reinforce");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x1b54b1fd, Offset: 0x7960
// Size: 0x3b4
function function_779e90b6() {
    level endon(#"combattraining_logic_finished", #"supply_done");
    while (true) {
        s_result = level.players[0] waittill(#"supplypod_placed");
        if (isdefined(s_result.pod)) {
            level.pod = s_result.pod;
            if (ispointonnavmesh(level.pod.origin)) {
                break;
            }
            s_result.pod.supplypod supplypod::function_827486aa(0, 0);
        }
    }
    level flag::set("supply_drop");
    level.var_3092f7b8 = 0;
    level notify(#"stop_resupply_nag");
    level.var_e72728b8 = array(#"gadget_supplypod");
    var_239124a9 = positionquery_source_navigation(level.pod.origin, 48, 156, 8, 32, 1);
    var_d90eb55d = [];
    if (isdefined(var_239124a9) && isdefined(var_239124a9.data)) {
        for (i = 0; i < 4; i++) {
            if (isdefined(var_239124a9.data[i])) {
                var_d90eb55d[i] = var_239124a9.data[i].origin;
                continue;
            }
            v_pt = getnearestpathpoint(level.pod.origin, 64);
            if (isdefined(v_pt)) {
                var_d90eb55d[i] = v_pt;
                continue;
            }
            s_loc = struct::get("s_assault_pack_target");
            var_d90eb55d[i] = s_loc.origin;
        }
    }
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    for (i = 0; i < 4; i++) {
        if (isdefined(var_d90eb55d[i]) && isdefined(a_bots[i])) {
            a_bots[i] thread function_b086032b(var_d90eb55d[i]);
        }
    }
    ct_vo::function_3ca1b77d();
    level thread ct_vo::play_vo(#"hash_50cde7f5b369d294", 0);
    while (isdefined(level.pod) && level.var_3092f7b8 < 4) {
        waitframe(1);
    }
    level flag::set("supply_done");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x34bb30b2, Offset: 0x7d20
// Size: 0x37c
function function_b086032b(v_org) {
    self endon(#"death");
    level.pod endoncallback(&function_9d4e5572, #"death");
    self.var_72ec14cd = 0;
    self.s_entry = struct::get("s_bathhouse_entry_" + self.n_index);
    wait randomfloatrange(0.5, 2);
    self function_89cd182c(level.pod);
    self bot_stance::stand();
    self thread ct_utils::function_5b59f3b7(v_org, self.angles, 32);
    self waittill(#"goal");
    wait randomfloatrange(0.5, 1);
    while (isdefined(level.pod.in_use) && level.pod.in_use) {
        waitframe(1);
    }
    while (!(isdefined(self.var_72ec14cd) && self.var_72ec14cd)) {
        self bot_action::reset();
        while (isdefined(level.pod.in_use) && level.pod.in_use) {
            waitframe(1);
        }
        self bot::set_interact(level.pod.supplypod.gameobject);
        level.pod.in_use = 1;
        waitframe(1);
        self bot_action::reset();
        waitframe(1);
        self waittill(#"hash_69dbfbd660f8c53e");
        waitframe(1);
        self.var_72ec14cd = 1;
        level.var_3092f7b8++;
        level.pod.in_use = 0;
    }
    self.var_e5f68d34 = 1;
    wait 1;
    self function_89cd182c(self.s_entry);
    self thread ct_utils::function_5b59f3b7(self.s_entry.origin, self.s_entry.angles, 32);
    self waittill(#"goal");
    s_lookat = struct::get("bathhouse_lookat");
    if (isdefined(self.s_entry.script_noteworthy)) {
        self bot_stance::crouch();
    }
    wait 1;
    self function_89cd182c(s_lookat);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x996a86c, Offset: 0x80a8
// Size: 0x120
function function_9d4e5572() {
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        if (!(isdefined(bot.var_72ec14cd) && bot.var_72ec14cd)) {
            wait randomfloatrange(0.3, 0.5);
            if (isdefined(bot.s_entry)) {
                bot thread ct_utils::function_5b59f3b7(bot.s_entry.origin, bot.s_entry.angles, 32);
            }
        }
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xff4bd277, Offset: 0x81d0
// Size: 0x106
function function_22014724() {
    self endon(#"death");
    level endon(#"flash_bang", #"combattraining_logic_finished");
    while (true) {
        if (level.var_ad7c0539 === 4) {
            self val::reset("protect", "takedamage");
            return;
        }
        if (self.health <= int(self.health_start * 0.3)) {
            self val::set("protect", "takedamage", 0);
        } else {
            self val::reset("protect", "takedamage");
        }
        waitframe(1);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2bfdbb3a, Offset: 0x82e0
// Size: 0x31c
function slo_mo() {
    self endon(#"death");
    level flag::wait_till("slo_mo");
    level.var_e72728b8 = array(#"gadget_supplypod");
    var_e9cfe36e = self gamepadusedlast() ? #"hash_262142273aedf81a" : #"hash_2a38a94893bab6ba";
    self thread ct_utils::function_61c3d59c(var_e9cfe36e, undefined);
    level thread ct_vo::play_vo(#"hash_4ab0ccbfd177602f");
    setslowmotion(1, 0.2, 2);
    s_result = level waittilltimeout(2.5, #"tak5_start");
    ct_utils::function_c2a10fc();
    setslowmotion(0.2, 1, 2);
    level notify(#"stop_flash_bang_contain_collision");
    if (s_result._notify == "tak5_start") {
        level waittill(#"hash_4acf6588b40fe941");
    }
    level flag::set("flash_bang_done");
    self status_effect::function_6519f95f();
    if (s_result._notify === "tak5_start") {
        level ct_vo::play_vo(#"hash_4ab0cbbfd1775e7c", 1);
        level.players[0] thread function_2d841651();
        ct_utils::function_654280be();
        level ct_vo::play_vo(#"hash_4ab0cebfd1776395", 1);
        level flag::set("ambush_done");
        return;
    }
    level.players[0] thread kill_squad();
    wait 1;
    level ct_vo::play_vo(#"hash_2bde6f5627471e7a", 1);
    level flag::set("ambush_failed");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x450d1213, Offset: 0x8608
// Size: 0x10c
function function_fa4b570b() {
    level endon(#"combattraining_logic_finished");
    level.var_72c3ea74 = array(struct::get("s_enemy_flash_bang"));
    level.var_da5432a2 = 0;
    ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
    level flag::wait_till("flash_bang");
    wait 2;
    level.var_72c3ea74 = struct::get_array("s_enemy_flash_banger");
    level.var_da5432a2 = 0;
    level thread ct_bots::activate_bots(level.var_72c3ea74.size, #"axis");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x985d3dc9, Offset: 0x8720
// Size: 0x1ec
function function_a7eac7bd(s_loc) {
    self endon(#"death");
    level endon(#"combattraining_logic_finished");
    self val::set("flashbang", "ignoreme", 1);
    self val::set("flashbang", "ignoreall", 1);
    self thread ct_utils::function_5b59f3b7(s_loc.origin, s_loc.angles, 32);
    var_a02a7013 = struct::get("s_flash_bang_loc");
    e_grenade = self magicgrenadetype(getweapon(#"eq_swat_grenade"), var_a02a7013.origin, (200, 0, 50));
    level flag::wait_till("flash_bang");
    e_grenade detonate();
    status_effect = getstatuseffect("blind_swat_grenade");
    level.players[0] thread status_effect::status_effect_apply(status_effect, getweapon(#"eq_swat_grenade"), self);
    level.players[0] thread function_41eecea9(self, status_effect);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 2, eflags: 0x0
// Checksum 0xcb244d4e, Offset: 0x8918
// Size: 0x1ec
function function_41eecea9(enemy, status_effect) {
    self endon(#"death");
    level endon(#"combattraining_logic_finished");
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        bot thread status_effect::status_effect_apply(status_effect, getweapon(#"eq_swat_grenade"), enemy, undefined, 5000);
    }
    wait 2.5;
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        bot thread status_effect::status_effect_apply(status_effect, getweapon(#"eq_swat_grenade"), enemy, undefined, 5000);
    }
    wait 1;
    enemy ct_bots::disablebot();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb30029bb, Offset: 0x8b10
// Size: 0xc8
function kill_squad() {
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        wait randomfloatrange(0.8, 1.3);
        bot ct_bots::disablebot();
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xf7977eb6, Offset: 0x8be0
// Size: 0xae
function function_2d841651() {
    a_bots = level.players[0] ct_bots::function_dde6edbd();
    for (i = 0; i < a_bots.size; i++) {
        wait randomfloatrange(0.3, 0.8);
        if (isalive(a_bots[i])) {
            a_bots[i] ct_bots::disablebot();
        }
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc02a76f4, Offset: 0x8c98
// Size: 0x4c
function function_6e01051f() {
    if (!level flag::get("scorestreak_done")) {
        level ct_vo::play_vo(#"hash_733bb0ec44b6de6b", 1);
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xc7a911b0, Offset: 0x8cf0
// Size: 0x1d4
function function_44b78b73() {
    self endon(#"death");
    self ct_bots::function_fd2d220e(0);
    self takeweapon(getweapon(#"bare_hands_ct"));
    self takeweapon(getweapon(#"ar_accurate_t8"));
    self giveweapon(getweapon(#"ar_fastfire_t8", "elo", "fastreload", "fastreload2", "quickdraw", "quickdraw2"));
    self giveweapon(getweapon(#"pistol_standard_t8"));
    var_3ba4bf7d = self getweaponslistprimaries();
    for (i = 0; i < var_3ba4bf7d.size; i++) {
        self giveweapon(var_3ba4bf7d[i]);
        self givemaxammo(var_3ba4bf7d[i]);
    }
    self switchtoweapon(var_3ba4bf7d[0]);
    self setspawnweapon(var_3ba4bf7d[0]);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xfb061d13, Offset: 0x8ed0
// Size: 0x552
function ammo_watch(str_event) {
    self notify(#"ammo_watch");
    self endon(#"death", #"ammo_watch");
    level flag::wait_till("supply_done");
    wait 1;
    while (true) {
        var_75d65e7e = self getammocount(self.currentweapon);
        self.var_1e0b475b = 0;
        s_result = level.players[0] waittill(#"supplypod_placed");
        if (isdefined(s_result.pod)) {
            level.pod = s_result.pod;
            level.pod endoncallback(&function_70fb1a55, #"death");
            wait randomfloatrange(1, 2.5);
            var_d9fa3a2c = self getammocount(self.currentweapon);
            if (var_d9fa3a2c <= var_75d65e7e && !(isdefined(self.var_1e0b475b) && self.var_1e0b475b)) {
                if (isdefined(str_event)) {
                    self.v_org = struct::get("s_cover_scorestreak_" + self.n_index, "script_noteworthy").origin;
                    self.v_ang = struct::get("s_cover_scorestreak_" + self.n_index, "script_noteworthy").angles;
                } else {
                    self.v_org = self.origin;
                    self.v_ang = self getplayerangles();
                }
                self bot_action::reset();
                while (isdefined(level.pod.in_use) && level.pod.in_use) {
                    waitframe(1);
                }
                level.pod.in_use = 1;
                while (!(isdefined(self.var_1e0b475b) && self.var_1e0b475b)) {
                    v_dir = anglestoforward(level.pod.angles);
                    var_c657828f = level.pod.origin + v_dir * 100;
                    var_239124a9 = positionquery_source_navigation(level.pod.origin, 48, 156, 8, 32, 1);
                    var_d90eb55d = [];
                    if (isdefined(var_239124a9) && isdefined(var_239124a9.data)) {
                        for (i = 0; i < 4; i++) {
                            var_d90eb55d[var_d90eb55d.size] = var_239124a9.data[i].origin;
                        }
                    }
                    var_4e3957b9 = array::get_all_closest(self.origin, var_d90eb55d);
                    self thread ct_utils::function_5b59f3b7(var_4e3957b9[0], var_c657828f, 64);
                    self waittill(#"goal");
                    wait 1;
                    self thread ct_utils::function_5b59f3b7(self.origin, var_c657828f, 16);
                    self bot::set_interact(level.pod.supplypod.gameobject);
                    self bot_action::reset();
                    waitframe(1);
                    self waittill(#"hash_69dbfbd660f8c53e");
                    self.var_1e0b475b = 1;
                    wait 1.5;
                    self thread ct_utils::function_5b59f3b7(self.v_org, self.v_ang, 16);
                    wait 1;
                    level.pod.in_use = 0;
                    wait 1.5;
                    if (isdefined(self.s_lookat)) {
                        self function_89cd182c(self.s_lookat);
                    }
                    waitframe(1);
                }
            }
        }
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xb97607c5, Offset: 0x9430
// Size: 0xc6
function function_70fb1a55() {
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    foreach (bot in a_bots) {
        bot thread ct_utils::function_5b59f3b7(self.v_org, self.angles, 32);
        bot.var_1e0b475b = 0;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0x3beb93f5, Offset: 0x9500
// Size: 0x9a
function function_89cd182c(s_loc) {
    self endon(#"death");
    if (isdefined(s_loc)) {
        v_dir = anglestoforward(s_loc.angles);
        var_c657828f = s_loc.origin + v_dir * 100;
    }
    if (isdefined(var_c657828f)) {
        self.var_2925fedc = var_c657828f;
        wait 1;
        self.var_2925fedc = undefined;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x6e87aef4, Offset: 0x95a8
// Size: 0x12c
function function_a929047f() {
    level flag::wait_till_any(array("supply_drop", "tak5_done"));
    if (level flag::get("supply_drop")) {
        var_8c977127 = self gamepadusedlast() ? #"hash_1c4ac6e9a0d267e4" : #"hash_24b56919b50565e0";
        self thread ct_utils::function_61c3d59c(var_8c977127, undefined);
        level flag::wait_till("tak5_done");
    } else {
        self thread ct_utils::function_61c3d59c(#"hash_697b7f775adaecfe", undefined);
        level flag::wait_till("supply_drop");
    }
    ct_utils::function_c2a10fc();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x725a7020, Offset: 0x96e0
// Size: 0xc0
function function_885de242() {
    level notify(#"ammo_watch");
    level endon(#"combattraining_logic_finished", #"ammo_watch");
    while (true) {
        s_result = level.players[0] waittill(#"supplypod_placed");
        if (isdefined(s_result.pod)) {
            level.var_cd01b270 = s_result.pod;
            level.var_cd01b270 thread function_16fb5ec8();
            continue;
        }
        continue;
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x88b69bdb, Offset: 0x97a8
// Size: 0x196
function function_16fb5ec8() {
    self endon(#"death");
    var_239124a9 = positionquery_source_navigation(self.origin, 48, 156, 8, 32, 1);
    var_d90eb55d = [];
    if (isdefined(var_239124a9) && isdefined(var_239124a9.data)) {
        for (i = 0; i < 4; i++) {
            if (isdefined(var_d90eb55d) && isdefined(var_239124a9.data[i])) {
                var_d90eb55d[var_d90eb55d.size] = var_239124a9.data[i].origin;
            }
        }
    }
    a_bots = level.players[0] ct_bots::function_71ec2b36();
    for (i = 0; i < 4; i++) {
        if (isalive(a_bots[i])) {
            var_4e3957b9 = array::get_all_closest(a_bots[i].origin, var_d90eb55d);
            a_bots[i] function_7bbbb2b2(var_4e3957b9[0]);
        }
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 1, eflags: 0x0
// Checksum 0xb312c46f, Offset: 0x9948
// Size: 0x354
function function_7bbbb2b2(v_org) {
    self endon(#"death");
    if (isdefined(level.var_cd01b270)) {
        level.var_cd01b270 endoncallback(&function_70fb1a55, #"death");
    }
    self.var_72ec14cd = 0;
    if (level.var_ad7c0539 === 4) {
        self.v_org = struct::get("s_cover_scorestreak_" + self.n_index, "script_noteworthy").origin;
        self.v_ang = struct::get("s_cover_scorestreak_" + self.n_index, "script_noteworthy").angles;
    } else {
        self.v_org = self.origin;
        self.v_ang = self getplayerangles();
    }
    wait randomfloatrange(0.5, 2);
    self function_89cd182c(level.var_cd01b270);
    self bot_stance::stand();
    self thread ct_utils::function_5b59f3b7(v_org, self.angles, 32);
    self waittill(#"goal");
    wait randomfloatrange(0.5, 1);
    while (isdefined(level.var_cd01b270) && isdefined(level.var_cd01b270.in_use) && level.var_cd01b270.in_use) {
        waitframe(1);
    }
    while (!(isdefined(self.var_72ec14cd) && self.var_72ec14cd)) {
        self bot_action::reset();
        while (isdefined(level.var_cd01b270) && isdefined(level.var_cd01b270.in_use) && level.var_cd01b270.in_use) {
            waitframe(1);
        }
        self bot::set_interact(level.var_cd01b270.supplypod.gameobject);
        level.var_cd01b270.in_use = 1;
        waitframe(1);
        self bot_action::reset();
        waitframe(1);
        self waittill(#"hash_69dbfbd660f8c53e");
        waitframe(1);
        self.var_72ec14cd = 1;
        level.var_cd01b270.in_use = 0;
    }
    self thread function_bf868278();
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x407de7de, Offset: 0x9ca8
// Size: 0xd6
function function_bf868278() {
    self endon(#"death");
    wait 1;
    if (isdefined(self.s_lookat)) {
        self function_89cd182c(self.s_lookat);
    }
    self thread ct_utils::function_5b59f3b7(self.v_org, self.v_ang, 32);
    self waittill(#"goal");
    self bot_stance::crouch();
    wait 1;
    if (isdefined(self.s_lookat)) {
        self function_89cd182c(self.s_lookat);
    }
    self.var_72ec14cd = 0;
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xdbd602f5, Offset: 0x9d88
// Size: 0x88
function function_6140f62e() {
    level endon(#"killstreak_ready");
    self endon(#"death");
    while (true) {
        s_result = self waittill(#"supplypod_placed");
        if (isdefined(s_result.pod)) {
            function_1089714c("ammo");
        }
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xffc0e074, Offset: 0x9e18
// Size: 0x68
function function_c59990b1() {
    level endon(#"killstreak_ready");
    self endon(#"death");
    while (true) {
        level waittill(#"hash_4acf6588b40fe941");
        function_1089714c("heal");
    }
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x2b829199, Offset: 0x9e88
// Size: 0x15c
function function_96069b7b() {
    self endon(#"death");
    self.s_entry = struct::get("s_bathhouse_entry_" + self.n_index);
    wait randomfloatrange(0.5, 2);
    self bot_stance::stand();
    self function_89cd182c(self.s_entry);
    self thread ct_utils::function_5b59f3b7(self.s_entry.origin, self.s_entry.angles, 32);
    self waittill(#"goal");
    s_lookat = struct::get("bathhouse_lookat");
    if (isdefined(self.s_entry.script_noteworthy)) {
        self bot_stance::crouch();
    }
    wait 1;
    self function_89cd182c(s_lookat);
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0x17bbe4f, Offset: 0x9ff0
// Size: 0x3c
function function_7aea5503() {
    level waittill(#"hash_4acf6588b40fe941");
    level flag::set("tak5_done");
}

// Namespace ct_crash_tutorial/ct_crash_tutorial
// Params 0, eflags: 0x0
// Checksum 0xdcf71425, Offset: 0xa038
// Size: 0xdc
function function_fa5d9e36() {
    self endon(#"death");
    while (true) {
        var_3ba4bf7d = self getweaponslistprimaries();
        foreach (w_primary in var_3ba4bf7d) {
            if (self getammocount(w_primary) < 10) {
                self givemaxammo(w_primary);
            }
        }
        wait 3;
    }
}

