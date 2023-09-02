// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_mansion_util.gsc;
#using scripts\zm\zm_mansion_pap_quest.gsc;
#using script_387eab232fe22983;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using script_3e5ec44cfab7a201;
#using scripts\zm_common\zm_sq.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;

#namespace mansion_triad;

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x39c23500, Offset: 0xa40
// Size: 0x3f4
function init() {
    clientfield::register("allplayers", "" + #"shield_fire", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"triad_beam", 8000, getminbitcountfornum(3), "int");
    clientfield::register("scriptmover", "" + #"wisp_fx", 8000, 2, "int");
    clientfield::register("scriptmover", "" + #"hash_2108935a0c33f89a", 8000, getminbitcountfornum(3), "int");
    namespace_617a54f4::function_d8383812(#"soul_capture_kp1", 8000, #"kp_1", &function_4175b958, &function_138b784e, 1);
    namespace_617a54f4::function_d8383812(#"soul_capture_kp2", 8000, #"kp_2", &function_53e85e3d, &function_25d21cdb, 1);
    namespace_617a54f4::function_d8383812(#"soul_capture_kp3", 8000, #"kp_3", &function_5e8b7383, &function_28082147, 1);
    namespace_617a54f4::function_d8383812(#"soul_capture_kp1_halfway", 8000, #"kp_1_halfway", &function_a23300bc, &function_3d90aae2, 1);
    namespace_617a54f4::function_d8383812(#"soul_capture_kp2_halfway", 8000, #"kp_2_halfway", &function_ecb921f0, &function_49798eb9, 1);
    namespace_617a54f4::function_d8383812(#"soul_capture_kp3_halfway", 8000, #"kp_3_halfway", &function_ba203e13, &function_60bda2cf, 1);
    namespace_617a54f4::function_d8383812(#"soul_capture_forest", 8000, #"kp_forest", &is_soul_capture_forest, &function_b570f926, 1);
    init_flags();
    register_steps();
    level thread function_c6e2a4fd();
    level thread function_6eb39fe4();
    level thread function_b8cc9d7e();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x210ab6fa, Offset: 0xe40
// Size: 0x9c
function function_6eb39fe4() {
    level flag::wait_till("open_pap");
    if (zm_utility::is_ee_enabled()) {
        if (zm_custom::function_901b751c(#"hash_3c5363541b97ca3e") && zm_custom::function_901b751c(#"zmpapenabled") != 2) {
            zm_sq::start(#"zm_mansion_triad");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xfc0edf8a, Offset: 0xee8
// Size: 0xf4
function function_b8cc9d7e() {
    var_74abfa21 = getent("knight_model_cemetery", "targetname");
    var_74abfa21 hidepart("tag_stone_01", "p8_zm_man_statue_kisa_stone_01", 1);
    var_4703a54b = getent("knight_model_main_hall", "targetname");
    var_4703a54b hidepart("tag_stone_02", "p8_zm_man_statue_kisa_stone_02", 1);
    var_5528f605 = getent("knight_model_greenhouse", "targetname");
    var_5528f605 hidepart("tag_stone_03", "p8_zm_man_statue_kisa_stone_03", 1);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x973b34f0, Offset: 0xfe8
// Size: 0x1d8
function function_c6e2a4fd() {
    level flag::wait_till("all_players_spawned");
    level thread forest_entrance();
    level thread zmb_ee_key_pickupmemberdeath();
    var_65c9997c = getent("stone_forest", "targetname");
    var_65c9997c ghost();
    var_5757942c = getentarray("kp_mark", "targetname");
    foreach (var_5f3c4fab in var_5757942c) {
        var_5f3c4fab ghost();
    }
    a_s_fireplaces = struct::get_array("fireplace_location");
    foreach (s_fireplace in a_s_fireplaces) {
        s_fireplace thread function_8c4357b4("hi", 1);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xb3c2b30b, Offset: 0x11c8
// Size: 0x1b4
function function_8c4357b4(str_state, b_on) {
    if (self.script_noteworthy === "kp_fireplace_main_hall") {
        if (isdefined(b_on) && b_on) {
            exploder::exploder("exp_lgt_fireplace_mainhall_" + self.script_int + "_" + str_state);
        } else {
            exploder::stop_exploder("exp_lgt_fireplace_mainhall_" + self.script_int + "_" + str_state);
        }
    } else if (self.script_noteworthy === "kp_fireplace_cemetery") {
        if (isdefined(b_on) && b_on) {
            exploder::exploder("exp_lgt_fireplace_cemetery_" + self.script_int + "_" + str_state);
        } else {
            exploder::stop_exploder("exp_lgt_fireplace_cemetery_" + self.script_int + "_" + str_state);
        }
    } else if (isdefined(b_on) && b_on) {
        exploder::exploder("exp_lgt_fireplace_greenhouse_" + self.script_int + "_" + str_state);
    } else {
        exploder::stop_exploder("exp_lgt_fireplace_greenhouse_" + self.script_int + "_" + str_state);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x2c983d19, Offset: 0x1388
// Size: 0x324
function init_flags() {
    level flag::init(#"kp_upg_main");
    level flag::init(#"kp_upg_dead");
    level flag::init(#"kp_upg_green");
    level flag::init(#"hash_4e56d6c8c78b24ef");
    level flag::init(#"hash_737628b9329f3e72");
    level flag::init(#"hash_72e622de2019c9f5");
    level flag::init(#"hash_1ccd179637a573e3");
    level flag::init(#"hash_70c18019036e06");
    level flag::init(#"hash_7c0a6f1432d54fc5");
    level flag::init(#"knight_main_hall_stationed");
    level flag::init(#"knight_cemetery_stationed");
    level flag::init(#"knight_greenhouse_stationed");
    level flag::init(#"kp1_connect");
    level flag::init(#"kp2_connect");
    level flag::init(#"kp3_connect");
    level flag::init(#"forest_done");
    level flag::init(#"forest_assault");
    level flag::init(#"forest_final");
    level flag::init(#"forest_complete");
    level flag::init(#"forest_open");
    level flag::init(#"hash_6402d013069eb3a");
    level flag::init(#"main_quest_completed");
    level flag::init(#"hash_775ff2ad49f494a7");
    level flag::init(#"hash_7583b516d2aab62e");
    level flag::init(#"hash_4ee2d51615eadbb");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x5fd540dc, Offset: 0x16b8
// Size: 0x184
function register_steps() {
    zm_sq::register(#"zm_mansion_triad", #"step_1", #"triad_step_1", &function_cdfe68a2, &cleanup_step_1);
    zm_sq::register(#"zm_mansion_triad", #"step_2", #"triad_step_2", &function_a03f8d25, &cleanup_step_2);
    zm_sq::register(#"zm_mansion_triad", #"step_3", #"triad_step_3", &function_aa79a199, &cleanup_step_3);
    zm_sq::register(#"zm_mansion_triad", #"step_4", #"triad_step_4", &function_86e35a69, &cleanup_step_4);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xe396c331, Offset: 0x1848
// Size: 0x224
function function_cdfe68a2(var_a276c861) {
    var_65c9997c = getent("gazing_stone_main_hall", "targetname");
    if (isdefined(var_65c9997c)) {
        var_47323b73 = var_65c9997c zm_unitrigger::create(undefined, 64, &function_55b79f54);
        var_47323b73.str_loc = "main_hall";
        var_47323b73.var_f0e6c7a2 = var_65c9997c;
        if (!var_47323b73.var_f0e6c7a2 flag::exists(#"flag_gazing_stone_in_use")) {
            var_47323b73.var_f0e6c7a2 flag::init(#"flag_gazing_stone_in_use");
        }
    }
    level.var_7f30bc18 = 0;
    level.var_6d7e18b3 = 0;
    level.var_3224a1fd = 0;
    level.n_forest = 0;
    level.var_835c3546 = 0;
    level.var_2ba64f64 = 0;
    level.var_94c6e50c = 0;
    level.var_dc3a898e = 1;
    level.var_ded69395 = 1;
    level.var_5f9f8ce8 = 1;
    if (!var_a276c861) {
        level flag::wait_till(#"gazed_main_hall");
        level zm_ui_inventory::function_7df6bb60(#"hash_7b00754a8b214587", 1);
        level thread kp_fireplace();
        level flag::wait_till_all(array(#"kp_upg_main", #"kp_upg_dead", #"kp_upg_green"));
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x744216cc, Offset: 0x1a78
// Size: 0xac
function cleanup_step_1(var_5ea5c94d, ended_early) {
    level notify(#"hash_12cb63ce83e1c017");
    level flag::set(#"gazed_main_hall");
    level flag::set(#"kp_upg_main");
    level flag::set(#"kp_upg_dead");
    level flag::set(#"kp_upg_green");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x4dd8d161, Offset: 0x1b30
// Size: 0x234
function function_a03f8d25(var_a276c861) {
    level zm_ui_inventory::function_7df6bb60(#"hash_22f194aa6971efed", 1);
    a_s_fireplaces = struct::get_array("fireplace_location");
    foreach (s_fireplace in a_s_fireplaces) {
        s_fireplace thread function_8c4357b4("low", 0);
        s_fireplace thread function_8c4357b4("hi", 1);
    }
    foreach (s_loc in struct::get_array("knight_protector_loc")) {
        var_47323b73 = s_loc zm_unitrigger::create(undefined, 100, &function_265858d6);
        var_47323b73.script_string = s_loc.script_string;
        var_47323b73.s_loc = s_loc;
    }
    if (!var_a276c861) {
        level flag::wait_till_all(array(#"knight_main_hall_stationed", #"knight_cemetery_stationed", #"knight_greenhouse_stationed"));
    }
    level thread function_97dd9a16();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x17498105, Offset: 0x1d70
// Size: 0x15c
function function_97dd9a16() {
    level endon(#"end_game");
    if (!(isdefined(level.var_f1028094[#"hash_4768e5d68ac1bb63"]) && level.var_f1028094[#"hash_4768e5d68ac1bb63"])) {
        if (zm_utility::is_player_valid(level.var_5beab970)) {
            e_speaker = level.var_5beab970;
        } else {
            a_players = util::get_active_players();
            if (isdefined(level.var_d96749fe)) {
                e_speaker = arraygetclosest(level.var_d96749fe.origin, a_players);
            } else {
                e_speaker = array::random(a_players);
            }
        }
        if (zm_utility::is_player_valid(e_speaker)) {
            level.var_f1028094[#"hash_4768e5d68ac1bb63"] = 1;
            e_speaker zm_vo::function_a2bd5a0c("vox_generic_responses_positive", 0, 1);
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xb77a4099, Offset: 0x1ed8
// Size: 0x2dc
function cleanup_step_2(var_5ea5c94d, ended_early) {
    level notify(#"hash_75774dc13775a414");
    level flag::set(#"knight_main_hall_stationed");
    level flag::set(#"knight_cemetery_stationed");
    level flag::set(#"knight_greenhouse_stationed");
    var_5757942c = getentarray("kp_mark", "targetname");
    foreach (var_5f3c4fab in var_5757942c) {
        var_5f3c4fab delete();
    }
    var_8de0a1bb = getent("knight_model_main_hall", "targetname");
    if (isdefined(var_8de0a1bb)) {
        var_8de0a1bb delete();
    }
    var_cbf2d010 = getent("knight_model_cemetery", "targetname");
    if (isdefined(var_cbf2d010)) {
        var_cbf2d010 delete();
    }
    var_41f3c120 = getent("knight_model_greenhouse", "targetname");
    if (isdefined(var_41f3c120)) {
        var_41f3c120 delete();
    }
    var_d29db808 = getent("kp_upg_main", "targetname");
    if (isdefined(var_d29db808)) {
        var_d29db808 delete();
    }
    var_2332b25b = getent("kp_upg_dead", "targetname");
    if (isdefined(var_2332b25b)) {
        var_2332b25b delete();
    }
    var_c6ce47 = getent("kp_upg_green", "targetname");
    if (isdefined(var_c6ce47)) {
        var_c6ce47 delete();
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x7f1405c2, Offset: 0x21c0
// Size: 0x2bc
function function_aa79a199(var_a276c861) {
    level zm_ui_inventory::function_7df6bb60(#"hash_22f193aa6971ee3a", 1);
    if (!isdefined(level.var_fbcb1d5b)) {
        s_loc = struct::get("kp_1", "script_noteworthy");
        level.var_fbcb1d5b = util::spawn_model(#"p8_zm_man_statue_kisa_stone_02", s_loc.origin);
        util::wait_network_frame();
        level.var_fbcb1d5b clientfield::set("" + #"wisp_fx", 1);
    }
    if (!isdefined(level.var_abe1b67c)) {
        s_loc = struct::get("kp_2", "script_noteworthy");
        level.var_abe1b67c = util::spawn_model(#"p8_zm_man_statue_kisa_stone_01", s_loc.origin);
        util::wait_network_frame();
        level.var_abe1b67c clientfield::set("" + #"wisp_fx", 1);
    }
    if (!isdefined(level.var_c22f75e6)) {
        s_loc = struct::get("kp_3", "script_noteworthy");
        level.var_c22f75e6 = util::spawn_model(#"p8_zm_man_statue_kisa_stone_03", s_loc.origin);
        util::wait_network_frame();
        level.var_c22f75e6 clientfield::set("" + #"wisp_fx", 1);
    }
    if (!var_a276c861) {
        level thread function_444d9cf8();
        level thread function_226e15cc();
        level flag::wait_till(#"forest_done");
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x36e002b9, Offset: 0x2488
// Size: 0x5f4
function cleanup_step_3(var_5ea5c94d, ended_early) {
    level notify(#"hash_3a7ba7e53fa848e9");
    level flag::set(#"forest_done");
    if (isdefined(level.kp1)) {
        level.kp1 clientfield::set("" + #"triad_beam", 0);
        level.kp1 thread kp_cleanup();
    }
    if (isdefined(level.kp2)) {
        level.kp2 clientfield::set("" + #"triad_beam", 0);
        level.kp2 thread kp_cleanup();
    }
    if (isdefined(level.kp3)) {
        level.kp3 clientfield::set("" + #"triad_beam", 0);
        level.kp3 thread kp_cleanup();
    }
    e_stone = getent("stone_forest", "targetname");
    e_stone playsound(#"hash_224d8c48960f71ee");
    e_stone stoploopsound();
    wait(3);
    var_a484bb88 = struct::get("kp1_end");
    var_febddc3e = struct::get("kp2_end");
    var_c0c5878c = struct::get("kp3_end");
    v_stone = getent("stone_forest", "targetname").origin + vectorscale((0, 0, 1), 2);
    if (isdefined(level.var_fbcb1d5b)) {
        level.var_fbcb1d5b clientfield::set("" + #"wisp_fx", 1);
        level.var_fbcb1d5b stopanimscripted();
        level.var_fbcb1d5b setmodel(#"p8_zm_man_statue_kisa_stone_02");
        level.var_fbcb1d5b.origin = var_a484bb88.origin;
        level.var_fbcb1d5b moveto(v_stone, 3, 0.1, 1.5);
        level.var_fbcb1d5b playsound(#"hash_20cc4a02f0ac5e7b");
    }
    if (isdefined(level.var_abe1b67c)) {
        level.var_abe1b67c clientfield::set("" + #"wisp_fx", 1);
        level.var_abe1b67c stopanimscripted();
        level.var_abe1b67c setmodel(#"p8_zm_man_statue_kisa_stone_01");
        level.var_abe1b67c.origin = var_febddc3e.origin;
        level.var_abe1b67c moveto(v_stone, 3, 0.1, 1.5);
        level.var_abe1b67c playsound(#"hash_20cc4a02f0ac5e7b");
    }
    if (isdefined(level.var_c22f75e6)) {
        level.var_c22f75e6 clientfield::set("" + #"wisp_fx", 1);
        level.var_c22f75e6 stopanimscripted();
        level.var_c22f75e6 setmodel(#"p8_zm_man_statue_kisa_stone_03");
        level.var_c22f75e6.origin = var_c0c5878c.origin;
        level.var_c22f75e6 moveto(v_stone, 3, 0.1, 1.5);
        level.var_c22f75e6 playsound(#"hash_20cc4a02f0ac5e7b");
    }
    if (!var_5ea5c94d) {
        wait(3);
    }
    if (ended_early) {
        namespace_617a54f4::function_2a94055d("soul_capture_kp1");
        namespace_617a54f4::function_2a94055d("soul_capture_kp2");
        namespace_617a54f4::function_2a94055d("soul_capture_kp3");
        namespace_617a54f4::function_2a94055d("soul_capture_kp1_halfway");
        namespace_617a54f4::function_2a94055d("soul_capture_kp2_halfway");
        namespace_617a54f4::function_2a94055d("soul_capture_kp3_halfway");
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x801a6004, Offset: 0x2a88
// Size: 0x344
function function_86e35a69(var_a276c861) {
    level thread forest_stone();
    level thread function_6b0caad3();
    level thread function_52529102();
    level thread forest_assault();
    level thread function_b646e75d();
    if (!isdefined(level.var_fbcb1d5b)) {
        var_e0d9e42f = struct::get("kp1_end");
        level.var_fbcb1d5b = util::spawn_model(#"p8_zm_man_statue_kisa_stone_02", var_e0d9e42f.origin);
        util::wait_network_frame();
        level.var_fbcb1d5b clientfield::set("" + #"wisp_fx", 1);
    }
    if (!isdefined(level.var_abe1b67c)) {
        var_c1395057 = struct::get("kp2_end");
        level.var_abe1b67c = util::spawn_model(#"p8_zm_man_statue_kisa_stone_01", var_c1395057.origin);
        util::wait_network_frame();
        level.var_abe1b67c clientfield::set("" + #"wisp_fx", 1);
    }
    if (!isdefined(level.var_c22f75e6)) {
        var_4c27be7b = struct::get("kp3_end");
        level.var_c22f75e6 = util::spawn_model(#"p8_zm_man_statue_kisa_stone_03", var_4c27be7b.origin);
        util::wait_network_frame();
        level.var_c22f75e6 clientfield::set("" + #"wisp_fx", 1);
    }
    level.var_fbcb1d5b thread function_6f244e();
    level.var_abe1b67c thread function_6f244e();
    level.var_c22f75e6 thread function_6f244e();
    if (!var_a276c861) {
        level flag::wait_till(#"forest_open");
    }
    level zm_ui_inventory::function_7df6bb60(#"hash_22f192aa6971ec87", 1);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x1798aa71, Offset: 0x2dd8
// Size: 0x2be
function cleanup_step_4(var_5ea5c94d, ended_early) {
    level notify(#"hash_106bb5214b1fb1e6");
    level flag::set(#"forest_open");
    level flag::set(#"forest_done");
    level flag::set(#"hash_6402d013069eb3a");
    level notify(#"hash_3c7945247db32d89");
    if (isdefined(level.var_fbcb1d5b)) {
        level.var_fbcb1d5b delete();
    }
    if (isdefined(level.var_abe1b67c)) {
        level.var_abe1b67c delete();
    }
    if (isdefined(level.var_c22f75e6)) {
        level.var_c22f75e6 delete();
    }
    s_relic = struct::get("relic_forest");
    mdl_relic = util::spawn_model(#"p8_zm_man_druid_door_stone_triangle", s_relic.origin, s_relic.angles);
    util::wait_network_frame();
    mdl_relic.targetname = s_relic.targetname;
    mdl_relic clientfield::set("" + #"stone_glow", 1);
    var_65c9997c = getent("stone_forest", "targetname");
    if (isdefined(var_65c9997c)) {
        var_65c9997c delete();
    }
    level flag::set(#"forest_complete");
    if (ended_early) {
        namespace_617a54f4::function_2a94055d("soul_capture_forest");
        level flag::set(#"spawn_zombies");
        level flag::set(#"zombie_drop_powerups");
    }
    if (isdefined(level.var_be97413)) {
        level.var_be97413 = undefined;
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x4d6eb4a3, Offset: 0x30a0
// Size: 0x24
function kp_cleanup() {
    wait(2);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x65b899ac, Offset: 0x30d0
// Size: 0x1a0
function function_55b79f54() {
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player) || isdefined(player.b_gazing) && player.b_gazing || isdefined(player.var_d049df11) && player.var_d049df11 || distancesquared(groundtrace(player.origin, player.origin + vectorscale((0, 0, -1), 128), 0, player)[#"position"], player.origin) > 16) {
            continue;
        }
        level thread mansion_pap::function_9e7129d2(player, self.stub.var_f0e6c7a2, 14, "triad");
        player thread mansion_util::function_58dfa337(15);
        player thread mansion_util::function_a113df82(18);
        level flag::set(#"gazed_main_hall");
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x0
// Checksum 0x94bf67c5, Offset: 0x3278
// Size: 0xc
function function_a8de7aeb(player) {
    
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xc87ec476, Offset: 0x3290
// Size: 0x188
function kp_fireplace() {
    a_s_locs = struct::get_array("fireplace_location");
    foreach (s_loc in a_s_locs) {
        s_loc thread function_8c4357b4("hi", 0);
        s_loc thread function_8c4357b4("low", 1);
        s_loc thread function_2aa04f9f();
    }
    level waittill(#"hash_12cb63ce83e1c017");
    foreach (s_loc in a_s_locs) {
        s_loc thread function_8c4357b4("blue", 0);
        if (isdefined(s_loc.t_dmg)) {
            s_loc.t_dmg delete();
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xc0454e8c, Offset: 0x3420
// Size: 0x7cc
function function_2aa04f9f() {
    level endon(#"hash_12cb63ce83e1c017");
    self endon(self.script_noteworthy + "_done");
    self.t_dmg = spawn("trigger_damage", self.origin, 0, 46, 64);
    while (1) {
        s_notify = undefined;
        s_notify = self.t_dmg waittill(#"damage");
        if (isplayer(s_notify.attacker) && mansion_util::is_shield(s_notify.weapon) && s_notify.mod === "MOD_MELEE" && isdefined(s_notify.attacker.is_blue) && s_notify.attacker.is_blue) {
            var_e4e66b68 = undefined;
            e_player = s_notify.attacker;
            self thread function_8c4357b4("low", 0);
            self thread function_8c4357b4("blue", 1);
            switch (self.script_noteworthy) {
            case #"kp_fireplace_main_hall":
                if (self.script_int == level.var_835c3546) {
                    if (self.script_int == 0) {
                        self thread function_82dc0664(e_player);
                        level.var_835c3546++;
                        var_e4e66b68 = 1;
                    } else if (!level.var_dc3a898e) {
                        level.var_835c3546++;
                        var_e4e66b68 = 1;
                    } else {
                        level.var_835c3546 = 0;
                        var_e4e66b68 = 0;
                    }
                } else {
                    level.var_835c3546 = 0;
                    var_e4e66b68 = 0;
                }
                break;
            case #"kp_fireplace_cemetery":
                if (self.script_int == level.var_2ba64f64) {
                    if (self.script_int == 0) {
                        self thread function_82dc0664(e_player);
                        level.var_2ba64f64++;
                        var_e4e66b68 = 1;
                    } else if (!level.var_ded69395) {
                        level.var_2ba64f64++;
                        var_e4e66b68 = 1;
                    } else {
                        level.var_2ba64f64 = 0;
                        var_e4e66b68 = 0;
                    }
                } else {
                    level.var_2ba64f64 = 0;
                    var_e4e66b68 = 0;
                }
                break;
            case #"hash_181850bb8bb2f622":
                if (self.script_int == level.var_94c6e50c) {
                    if (self.script_int == 0) {
                        self thread function_82dc0664(e_player);
                        level.var_94c6e50c++;
                        var_e4e66b68 = 1;
                    } else if (!level.var_5f9f8ce8) {
                        level.var_94c6e50c++;
                        var_e4e66b68 = 1;
                    } else {
                        level.var_94c6e50c = 0;
                        var_e4e66b68 = 0;
                    }
                } else {
                    level.var_94c6e50c = 0;
                    var_e4e66b68 = 0;
                }
                break;
            }
            if (var_e4e66b68) {
                if (self.script_int != 3) {
                    self waittill(#"fire_end");
                } else {
                    wait(1.5);
                }
                if (self.script_int == 3) {
                    if (isalive(e_player) && !(isdefined(e_player.var_aed1893c[#"hash_7a226c41930a49a3"]) && e_player.var_aed1893c[#"hash_7a226c41930a49a3"])) {
                        e_player.var_aed1893c[#"hash_7a226c41930a49a3"] = 1;
                        var_6a01d8dc = e_player.characterindex;
                        str_vo = "vox_fireplace_change_react_plr_" + var_6a01d8dc + "_0";
                        e_player thread zm_vo::vo_say(str_vo, 0, 1, 9999);
                    }
                    s_loc = struct::get(self.target);
                    var_ee156d3d = util::spawn_model(self.str_model, s_loc.origin, s_loc.angles);
                    var_ee156d3d.fx_org = util::spawn_model(#"tag_origin", s_loc.origin);
                    var_ee156d3d playsound(#"hash_4b1143cc57b2474b");
                    var_ee156d3d playloopsound(#"hash_661ab5dd3a814d28");
                    util::wait_network_frame();
                    var_ee156d3d.fx_org clientfield::set("" + #"hash_51257ec597a8f84f", 2);
                    var_47323b73 = s_loc zm_unitrigger::create(undefined, 100, &function_566d3cd2);
                    var_47323b73.script_flag = self.script_flag;
                    var_47323b73.var_ee156d3d = var_ee156d3d;
                    self thread function_899525c7();
                    level flag::set(self.str_model + "_reveal");
                } else {
                    self thread function_8c4357b4("blue", 0);
                    self thread function_8c4357b4("low", 1);
                }
            } else {
                wait(1.5);
                a_s_locs = struct::get_array(self.script_noteworthy, "script_noteworthy");
                foreach (s_loc in a_s_locs) {
                    s_loc notify(#"fire_end");
                    s_loc thread function_8c4357b4("blue", 0);
                    s_loc thread function_8c4357b4("low", 1);
                }
            }
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xe5c04f74, Offset: 0x3bf8
// Size: 0x21c
function function_82dc0664(e_player) {
    level endon(#"hash_12cb63ce83e1c017");
    self endon(self.script_noteworthy + "_done");
    switch (self.script_noteworthy) {
    case #"kp_fireplace_main_hall":
        level.var_dc3a898e = 0;
        break;
    case #"kp_fireplace_cemetery":
        level.var_ded69395 = 0;
        break;
    case #"hash_181850bb8bb2f622":
        level.var_5f9f8ce8 = 0;
        break;
    }
    self waittilltimeout(36, #"fire_end");
    switch (self.script_noteworthy) {
    case #"kp_fireplace_main_hall":
        level.var_dc3a898e = 1;
        level.var_835c3546 = 0;
        break;
    case #"kp_fireplace_cemetery":
        level.var_ded69395 = 1;
        level.var_2ba64f64 = 0;
        break;
    case #"hash_181850bb8bb2f622":
        level.var_5f9f8ce8 = 1;
        level.var_94c6e50c = 0;
        break;
    }
    a_s_locs = struct::get_array(self.script_noteworthy, "script_noteworthy");
    foreach (s_loc in a_s_locs) {
        s_loc notify(#"fire_end");
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x4da6c6c4, Offset: 0x3e20
// Size: 0xe8
function function_899525c7() {
    a_s_locs = struct::get_array(self.script_noteworthy, "script_noteworthy");
    foreach (s_loc in a_s_locs) {
        s_loc notify(self.script_noteworthy + "_done");
        s_loc thread function_8c4357b4("blue", 0);
        s_loc thread function_8c4357b4("low", 1);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x34552550, Offset: 0x3f10
// Size: 0x128
function function_566d3cd2() {
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        level flag::set(self.stub.script_flag);
        var_ee156d3d = self.stub.var_ee156d3d;
        player playsound(#"hash_31a648443e4497e8");
        if (isdefined(var_ee156d3d) && isdefined(var_ee156d3d.fx_org)) {
            var_ee156d3d.fx_org thread function_3c832025();
            var_ee156d3d delete();
        }
        zm_unitrigger::unregister_unitrigger(self.stub);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x91dd6017, Offset: 0x4040
// Size: 0x54
function function_3c832025() {
    self clientfield::set("" + #"hash_51257ec597a8f84f", 0);
    wait(1.5);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xf9b5e1d2, Offset: 0x40a0
// Size: 0xe0
function function_40e665ab() {
    self endon(#"extinguish");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        if (!isplayer(waitresult.activator)) {
            continue;
        }
        player = waitresult.activator;
        if (isdefined(player.currentweapon) && mansion_util::is_shield(player.currentweapon) && !player.is_blue) {
            player.is_blue = 1;
            player thread function_fb54ddba();
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x27eae026, Offset: 0x4188
// Size: 0x112
function function_fb54ddba() {
    self endon(#"disconnect");
    self notify(#"shield_timeout");
    self thread function_4c8574b3();
    self clientfield::set("" + #"shield_fire", 1);
    while (isdefined(self.is_blue) && self.is_blue) {
        s_result = undefined;
        s_result = self waittill(#"weapon_change", #"shield_timeout");
        if (s_result._notify !== "weapon_change" || !mansion_util::is_shield(s_result.weapon)) {
            self notify(#"hash_459246e5bfcc3713");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xe018d1b5, Offset: 0x42a8
// Size: 0x96
function function_4c8574b3() {
    self endon(#"disconnect");
    self waittilltimeout(55, #"shield_timeout", #"hash_459246e5bfcc3713", #"destroy_riotshield");
    self.is_blue = 0;
    self clientfield::set("" + #"shield_fire", 0);
    self notify(#"shield_timeout");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x978ae5f4, Offset: 0x4348
// Size: 0x368
function function_265858d6() {
    level endon(#"hash_75774dc13775a414");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (zm_utility::can_use(player)) {
            switch (self.stub.script_string) {
            case #"main_hall":
                var_64403099 = getent("knight_model_main_hall", "targetname");
                var_64403099 thread function_30fe35b("tag_stone_02", "p8_zm_man_statue_kisa_stone_02", 1.5);
                var_64403099 util::delay(1.5, undefined, &scene::play, #"p8_fxanim_zm_man_ka01_bundle", "crumble", var_64403099);
                level flag::set(#"hash_775ff2ad49f494a7");
                break;
            case #"cemetery":
                var_64403099 = getent("knight_model_cemetery", "targetname");
                var_64403099 thread function_30fe35b("tag_stone_01", "p8_zm_man_statue_kisa_stone_01", 1.5);
                var_64403099 util::delay(1.5, undefined, &scene::play, #"p8_fxanim_zm_man_ka03_bundle", "crumble", var_64403099);
                level flag::set(#"hash_7583b516d2aab62e");
                break;
            case #"greenhouse":
                var_64403099 = getent("knight_model_greenhouse", "targetname");
                var_64403099 thread function_30fe35b("tag_stone_03", "p8_zm_man_statue_kisa_stone_03", 1.5);
                var_64403099 util::delay(1.5, undefined, &scene::play, #"p8_fxanim_zm_man_ka02_bundle", "crumble", var_64403099);
                level flag::set(#"hash_4ee2d51615eadbb");
                break;
            }
            self.stub.s_loc thread function_4490aa7d();
            player thread zm_audio::create_and_play_dialog(#"knight_trap", #"active", undefined, 1);
            zm_unitrigger::unregister_unitrigger(self.stub);
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 3, eflags: 0x1 linked
// Checksum 0x5fd7be15, Offset: 0x46b8
// Size: 0x8c
function function_30fe35b(str_tag, str_model, n_wait) {
    self showpart(str_tag, str_model, 1);
    self playsoundontag(#"hash_7c38eb0531ca63ee", str_tag);
    wait(n_wait);
    if (isdefined(self)) {
        self hidepart(str_tag, str_model, 1);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x10c92c2c, Offset: 0x4750
// Size: 0x4b4
function function_4490aa7d() {
    level endon(#"hash_75774dc13775a414");
    s_spawn = struct::get("knight_spawnpt_" + self.script_string);
    switch (self.script_string) {
    case #"main_hall":
        var_ca0ae05d = "knight_main_hall_stationed";
        s_loc = struct::get("kp_1", "script_noteworthy");
        var_9e7c3935 = getent("kp_mark_lion", "script_noteworthy");
        var_9e7c3935 clientfield::set("" + #"hash_2108935a0c33f89a", 1);
        e_wisp = util::spawn_model(#"p8_zm_man_statue_kisa_stone_02", s_spawn.origin, s_spawn.angles);
        level.var_fbcb1d5b = e_wisp;
        break;
    case #"cemetery":
        var_ca0ae05d = "knight_cemetery_stationed";
        s_loc = struct::get("kp_2", "script_noteworthy");
        var_9e7c3935 = getent("kp_mark_cobra", "script_noteworthy");
        var_9e7c3935 clientfield::set("" + #"hash_2108935a0c33f89a", 2);
        e_wisp = util::spawn_model(#"p8_zm_man_statue_kisa_stone_01", s_spawn.origin, s_spawn.angles);
        level.var_abe1b67c = e_wisp;
        break;
    case #"greenhouse":
        var_ca0ae05d = "knight_greenhouse_stationed";
        s_loc = struct::get("kp_3", "script_noteworthy");
        var_9e7c3935 = getent("kp_mark_wolf", "script_noteworthy");
        var_9e7c3935 clientfield::set("" + #"hash_2108935a0c33f89a", 3);
        e_wisp = util::spawn_model(#"p8_zm_man_statue_kisa_stone_03", s_spawn.origin, s_spawn.angles);
        level.var_c22f75e6 = e_wisp;
        break;
    }
    util::wait_network_frame();
    e_wisp clientfield::set("" + #"wisp_fx", 1);
    var_9e7c3935 show();
    wait(2.5);
    e_wisp thread function_d409a74f(var_9e7c3935);
    e_wisp waittill(#"hash_6df5566461d13967");
    e_wisp moveto(s_loc.origin, 0.25);
    e_wisp rotateto(s_loc.angles, 0.25);
    e_wisp waittill(#"rotatedone");
    e_wisp bobbing((0, 0, 1), 2, 3);
    a_players = util::get_active_players();
    level.var_5beab970 = arraygetclosest(s_loc.origin, a_players, 600);
    level.var_d96749fe = s_loc;
    level flag::set(var_ca0ae05d);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x7d89665e, Offset: 0x4c10
// Size: 0x4d4
function function_d409a74f(var_9e7c3935) {
    level endon(#"hash_75774dc13775a414", #"end_game");
    self endon(#"death");
    self.var_7988eee5 = undefined;
    n_timer = 0;
    self.var_199faf5e = 1;
    while (distance2dsquared(self.origin, var_9e7c3935.origin) > 40000) {
        if (isdefined(self.var_7988eee5) && zm_utility::is_player_valid(self.var_7988eee5) && n_timer < 30) {
            var_2f07de84 = self.var_7988eee5.origin + (randomintrange(60 * -1, 60), randomintrange(60 * -1, 60), 0);
            v_moveto = getclosestpointonnavmesh(var_2f07de84, 64, 16);
            if (isdefined(v_moveto)) {
                v_moveto = v_moveto + vectorscale((0, 0, 1), 46);
                n_dist = distance2dsquared(self.origin, v_moveto);
            }
        } else {
            self.var_7988eee5 = self mansion_util::get_closest_valid_player(22500);
        }
        if (isdefined(self.var_199faf5e) && self.var_199faf5e) {
            self bobbing((0, 0, 1), 2, 3);
            self.var_199faf5e = 0;
        }
        if (isdefined(n_dist) && n_dist > 22500 * 4.5) {
            self.var_199faf5e = 0;
            n_timer = n_timer + 0.25;
        } else if (isdefined(n_dist) && n_dist > 22500) {
            self moveto(v_moveto, 1.35);
            self thread function_7e316825();
            n_timer = 0;
        } else {
            self.var_199faf5e = 0;
            n_timer = 0;
        }
        n_dist = undefined;
        wait(0.25);
    }
    self moveto(var_9e7c3935.origin + vectorscale((0, 0, 1), 46), 2);
    self waittill(#"movedone");
    self notify(#"hash_6df5566461d13967");
    level flag::wait_till_all(array(#"knight_main_hall_stationed", #"knight_cemetery_stationed", #"knight_greenhouse_stationed"));
    switch (var_9e7c3935.script_noteworthy) {
    case #"kp_mark_lion":
        var_9e7c3935 clientfield::set("" + #"hash_2108935a0c33f89a", 0);
        break;
    case #"kp_mark_wolf":
        var_9e7c3935 clientfield::set("" + #"hash_2108935a0c33f89a", 0);
        break;
    case #"kp_mark_cobra":
        var_9e7c3935 clientfield::set("" + #"hash_2108935a0c33f89a", 0);
        break;
    }
    wait(2);
    var_9e7c3935 delete();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x2e410ea3, Offset: 0x50f0
// Size: 0x4e
function function_7e316825() {
    self notify("399a1770792ffde7");
    self endon("399a1770792ffde7");
    self endon(#"death");
    self waittill(#"movedone");
    self.var_199faf5e = 1;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x12a9da05, Offset: 0x5148
// Size: 0x304
function function_226e15cc() {
    level endon(#"hash_3a7ba7e53fa848e9");
    level flag::wait_till_all(array(#"knight_main_hall_stationed", #"knight_cemetery_stationed", #"knight_greenhouse_stationed"));
    v_offset = vectorscale((0, 0, -1), 45);
    level.var_abe1b67c moveto(level.var_abe1b67c.origin + v_offset, 0.25);
    level.var_fbcb1d5b moveto(level.var_fbcb1d5b.origin + v_offset, 0.25);
    level.var_c22f75e6 moveto(level.var_c22f75e6.origin + v_offset, 0.25);
    array::wait_till(array(level.var_abe1b67c, level.var_fbcb1d5b, level.var_c22f75e6), "movedone", 1);
    level.var_abe1b67c.str_model = #"hash_2fd7d12881613ff1";
    level.var_fbcb1d5b.str_model = #"hash_485dabee10eddd9a";
    level.var_c22f75e6.str_model = #"hash_1e5559d9a4922ce7";
    scene::add_scene_func(#"p8_fxanim_zm_man_kag03_bundle", &function_92227ee8, "rise");
    level.var_abe1b67c thread scene::play(#"p8_fxanim_zm_man_kag03_bundle", "rise", level.var_abe1b67c);
    level.var_fbcb1d5b thread scene::play(#"p8_fxanim_zm_man_kag03_bundle", "rise", level.var_fbcb1d5b);
    level.var_c22f75e6 scene::play(#"p8_fxanim_zm_man_kag03_bundle", "rise", level.var_c22f75e6);
    namespace_617a54f4::function_3f808d3d("soul_capture_kp1");
    namespace_617a54f4::function_3f808d3d("soul_capture_kp2");
    namespace_617a54f4::function_3f808d3d("soul_capture_kp3");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x85db3797, Offset: 0x5458
// Size: 0xb0
function function_4175b958(var_88206a50, ent) {
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && distance2dsquared(var_88206a50.origin, ent.origin) <= 400 * 400;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xdfb73a69, Offset: 0x5510
// Size: 0x15c
function function_138b784e(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        n_souls_required = 12;
    } else if (getplayers().size > 1) {
        n_souls_required = 10;
    } else {
        n_souls_required = 7;
    }
    level.var_7f30bc18++;
    if (level.var_7f30bc18 >= n_souls_required) {
        level.var_7f30bc18 = 0;
        var_a4e33d04 = getent("kp_mark_lion", "script_noteworthy");
        if (isdefined(var_a4e33d04)) {
            var_a4e33d04 delete();
        }
        namespace_617a54f4::function_2a94055d(#"soul_capture_kp1");
        s_goal = struct::get("kp1_halfway");
        if (isdefined(level.var_fbcb1d5b)) {
            level.var_fbcb1d5b thread function_90cc31c4(s_goal, "soul_capture_kp1_halfway");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x3b54c6af, Offset: 0x5678
// Size: 0xb0
function function_a23300bc(var_88206a50, ent) {
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && distance2dsquared(var_88206a50.origin, ent.origin) <= 400 * 400;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xd10927dc, Offset: 0x5730
// Size: 0x11c
function function_3d90aae2(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        n_souls_required = 12;
    } else if (getplayers().size > 1) {
        n_souls_required = 10;
    } else {
        n_souls_required = 7;
    }
    level.var_7f30bc18++;
    if (level.var_7f30bc18 >= n_souls_required) {
        level.var_7f30bc18 = 0;
        namespace_617a54f4::function_2a94055d(#"soul_capture_kp1_halfway");
        s_goal = struct::get("kp1_end");
        if (isdefined(level.var_fbcb1d5b)) {
            level.var_fbcb1d5b thread function_90cc31c4(s_goal, undefined, #"kp1_connect");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x8ac67cb, Offset: 0x5858
// Size: 0xb0
function function_53e85e3d(var_88206a50, ent) {
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && distance2dsquared(var_88206a50.origin, ent.origin) <= 400 * 400;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xcb109d18, Offset: 0x5910
// Size: 0x15c
function function_25d21cdb(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        n_souls_required = 12;
    } else if (getplayers().size > 1) {
        n_souls_required = 10;
    } else {
        n_souls_required = 7;
    }
    level.var_6d7e18b3++;
    if (level.var_6d7e18b3 >= n_souls_required) {
        level.var_6d7e18b3 = 0;
        var_bd9c1ba7 = getent("kp_mark_cobra", "script_noteworthy");
        if (isdefined(var_bd9c1ba7)) {
            var_bd9c1ba7 delete();
        }
        namespace_617a54f4::function_2a94055d(#"soul_capture_kp2");
        s_goal = struct::get("kp2_halfway");
        if (isdefined(level.var_abe1b67c)) {
            level.var_abe1b67c thread function_90cc31c4(s_goal, "soul_capture_kp2_halfway");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xd21aaf50, Offset: 0x5a78
// Size: 0xb0
function function_ecb921f0(var_88206a50, ent) {
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && distance2dsquared(var_88206a50.origin, ent.origin) <= 400 * 400;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xb48f9e6b, Offset: 0x5b30
// Size: 0x11c
function function_49798eb9(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        n_souls_required = 12;
    } else if (getplayers().size > 1) {
        n_souls_required = 10;
    } else {
        n_souls_required = 7;
    }
    level.var_6d7e18b3++;
    if (level.var_6d7e18b3 >= n_souls_required) {
        level.var_6d7e18b3 = 0;
        namespace_617a54f4::function_2a94055d(#"soul_capture_kp2_halfway");
        s_goal = struct::get("kp2_end");
        if (isdefined(level.var_abe1b67c)) {
            level.var_abe1b67c thread function_90cc31c4(s_goal, undefined, #"kp2_connect");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xfb199cec, Offset: 0x5c58
// Size: 0xb0
function function_5e8b7383(var_88206a50, ent) {
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && distance2dsquared(var_88206a50.origin, ent.origin) <= 400 * 400;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xea083e32, Offset: 0x5d10
// Size: 0x15c
function function_28082147(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        n_souls_required = 12;
    } else if (getplayers().size > 1) {
        n_souls_required = 10;
    } else {
        n_souls_required = 7;
    }
    level.var_3224a1fd++;
    if (level.var_3224a1fd >= n_souls_required) {
        level.var_3224a1fd = 0;
        var_6c6c7d49 = getent("kp_mark_wolf", "script_noteworthy");
        if (isdefined(var_6c6c7d49)) {
            var_6c6c7d49 delete();
        }
        namespace_617a54f4::function_2a94055d(#"soul_capture_kp3");
        s_goal = struct::get("kp3_halfway");
        if (isdefined(level.var_c22f75e6)) {
            level.var_c22f75e6 thread function_90cc31c4(s_goal, "soul_capture_kp3_halfway");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xcff22fe1, Offset: 0x5e78
// Size: 0xb0
function function_ba203e13(var_88206a50, ent) {
    return (isdefined(ent.attacker) && isplayer(ent.attacker) || isdefined(ent.damageinflictor) && isplayer(ent.damageinflictor)) && isdefined(ent) && distance2dsquared(var_88206a50.origin, ent.origin) <= 400 * 400;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xa1cf90f8, Offset: 0x5f30
// Size: 0x124
function function_60bda2cf(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        n_souls_required = 12;
    } else if (getplayers().size > 1) {
        n_souls_required = 10;
    } else {
        n_souls_required = 7;
    }
    level.var_3224a1fd++;
    if (level.var_3224a1fd >= n_souls_required) {
        level.var_3224a1fd = 0;
        namespace_617a54f4::function_2a94055d(#"soul_capture_kp3_halfway");
        s_goal = struct::get(#"kp3_end");
        if (isdefined(level.var_c22f75e6)) {
            level.var_c22f75e6 thread function_90cc31c4(s_goal, undefined, #"kp3_connect");
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0x969e40e, Offset: 0x6060
// Size: 0x13e
function is_soul_capture_forest(var_88206a50, ent) {
    if (ent.archetype !== #"werewolf") {
        return 0;
    }
    p = ent.origin;
    a = struct::get("kp1_end").origin;
    b = struct::get("kp2_end").origin;
    c = struct::get("kp3_end").origin;
    if (function_f699a6c8(p, a, b, c) && function_f699a6c8(p, b, a, c) && function_f699a6c8(p, c, a, b)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 4, eflags: 0x1 linked
// Checksum 0xc0a2e8d0, Offset: 0x61a8
// Size: 0xb0
function function_f699a6c8(p1, p2, a, b) {
    cp1 = vectorcross(b - a, p1 - a);
    cp2 = vectorcross(b - a, p2 - a);
    if (vectordot(cp1, cp2) >= 0) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xef3923b4, Offset: 0x6260
// Size: 0xdc
function function_b570f926(var_f0e6c7a2, ent) {
    if (getplayers().size > 2) {
        var_c61e686c = 2;
    } else {
        var_c61e686c = 1;
    }
    level.n_forest++;
    if (level.n_forest >= var_c61e686c) {
        namespace_617a54f4::function_2a94055d(#"soul_capture_forest");
        level flag::set(#"forest_done");
        level thread function_3d151222(#"knight_trap", #"defend_comp");
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 3, eflags: 0x1 linked
// Checksum 0x10dd1092, Offset: 0x6348
// Size: 0x2e4
function function_90cc31c4(s_goal, var_ea62e3e9, str_flag) {
    self endon(#"death");
    self scene::play(#"p8_fxanim_zm_man_kag03_bundle", "crumble", self);
    self stopanimscripted();
    switch (self.str_model) {
    case #"hash_2fd7d12881613ff1":
        self setmodel(#"p8_zm_man_statue_kisa_stone_01");
        break;
    case #"hash_485dabee10eddd9a":
        self setmodel(#"p8_zm_man_statue_kisa_stone_02");
        break;
    case #"hash_1e5559d9a4922ce7":
        self setmodel(#"p8_zm_man_statue_kisa_stone_03");
        break;
    }
    self clientfield::set("" + #"wisp_fx", 1);
    self playsound(#"hash_20cc4a02f0ac5e7b");
    self moveto(self.origin + vectorscale((0, 0, 1), 64), 0.25);
    self waittill(#"movedone");
    self moveto(s_goal.origin, 3);
    self rotateto(s_goal.angles, 3);
    self waittill(#"movedone");
    self moveto(s_goal.origin - vectorscale((0, 0, 1), 64), 0.25);
    self waittill(#"movedone");
    if (isdefined(var_ea62e3e9)) {
        namespace_617a54f4::function_3f808d3d(var_ea62e3e9);
    }
    self scene::play(#"p8_fxanim_zm_man_kag03_bundle", "rise", self);
    if (isdefined(str_flag)) {
        level flag::set(str_flag);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x84efb112, Offset: 0x6638
// Size: 0xec
function function_92227ee8(a_ents) {
    e_wisp = a_ents[getfirstarraykey(a_ents)];
    if (isdefined(e_wisp.str_model)) {
        e_wisp ghost();
        e_wisp setmodel(e_wisp.str_model);
        util::wait_network_frame(1);
        if (isdefined(e_wisp)) {
            e_wisp show();
            e_wisp clientfield::set("" + #"wisp_fx", 2);
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x809c37ee, Offset: 0x6730
// Size: 0x33c
function function_444d9cf8() {
    level endon(#"hash_3a7ba7e53fa848e9");
    level flag::wait_till_all(array(#"kp1_connect", #"kp2_connect", #"kp3_connect"));
    wait(0.5);
    s_kp1 = struct::get("kp1_line_source");
    level.kp1 = util::spawn_model("tag_origin", s_kp1.origin, s_kp1.angles);
    s_kp2 = struct::get("kp2_line_source");
    level.kp2 = util::spawn_model("tag_origin", s_kp2.origin, s_kp2.angles);
    s_kp3 = struct::get("kp3_line_source");
    level.kp3 = util::spawn_model("tag_origin", s_kp3.origin, s_kp3.angles);
    util::wait_network_frame();
    level.kp1 clientfield::set("" + #"triad_beam", 1);
    level.kp2 clientfield::set("" + #"triad_beam", 2);
    level.kp3 clientfield::set("" + #"triad_beam", 3);
    e_stone = getent("stone_forest", "targetname");
    e_stone playsound(#"hash_7736e4287bd3440b");
    e_stone playloopsound(#"hash_22739fd2435ae7bd");
    namespace_617a54f4::function_3f808d3d(#"soul_capture_forest");
    level thread function_df2c4d2d();
    if (getplayers().size > 2) {
        var_34ac013b = 2;
    } else {
        var_34ac013b = 1;
    }
    level thread function_a78b58f6(var_34ac013b, undefined, #"forest_done");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x5 linked
// Checksum 0xff19f269, Offset: 0x6a78
// Size: 0x204
function private function_df2c4d2d() {
    level endoncallback(&function_46b38ca2, #"hash_3a7ba7e53fa848e9", #"end_game");
    var_2db98020 = 0;
    var_12bee25f = struct::get(#"kp1_end");
    level.var_411ea43b = util::spawn_model("tag_origin", var_12bee25f.origin, var_12bee25f.angles);
    waitframe(1);
    while (!(isdefined(var_2db98020) && var_2db98020)) {
        a_players = util::get_active_players();
        foreach (e_player in a_players) {
            if (level.var_411ea43b sightconetrace(e_player geteye(), e_player, e_player getweaponforwarddir(), 70)) {
                var_2db98020 = e_player zm_audio::create_and_play_dialog(#"knight_trap", #"defend", undefined, 1);
                if (isdefined(var_2db98020) && var_2db98020) {
                    break;
                }
            }
        }
        wait(1);
    }
    level.var_411ea43b delete();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x5 linked
// Checksum 0xf450bc0f, Offset: 0x6c88
// Size: 0x34
function private function_46b38ca2(var_c34665fc) {
    if (isdefined(level.var_411ea43b)) {
        level.var_411ea43b delete();
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 3, eflags: 0x1 linked
// Checksum 0x3b41e63e, Offset: 0x6cc8
// Size: 0x2de
function function_a78b58f6(n_active, var_e05ded9, var_39cddd2a) {
    a_s_center = struct::get_array("forest_center_spawns");
    a_s_north = struct::get_array("forest_n_spawns");
    var_4275b4d6 = [];
    level.var_34ac013b = 0;
    level.var_b02bf6d2 = 0;
    var_70bce1d6 = 0;
    foreach (s_loc in a_s_center) {
        if (s_loc.script_noteworthy === "werewolf_location") {
            var_4275b4d6[var_4275b4d6.size] = s_loc;
        }
    }
    foreach (s_loc in a_s_north) {
        if (s_loc.script_noteworthy === "werewolf_location") {
            var_4275b4d6[var_4275b4d6.size] = s_loc;
        }
    }
    s_loc = array::random(var_4275b4d6);
    while (!level flag::get(var_39cddd2a)) {
        if (isdefined(var_e05ded9) && var_70bce1d6 >= var_e05ded9) {
            return;
        }
        if (level.var_34ac013b < n_active) {
            ai_werewolf = zombie_werewolf_util::function_47a88a0c(1, undefined, 1, s_loc, 20);
            if (isdefined(ai_werewolf)) {
                level.var_34ac013b++;
                var_70bce1d6++;
                ai_werewolf.no_powerups = 1;
                ai_werewolf zm_score::function_acaab828();
                ai_werewolf zm_transform::function_bbaec2fd();
                ai_werewolf forceteleport(s_loc.origin, s_loc.angles);
                ai_werewolf callback::function_d8abfc3d(#"on_ai_killed", &teleporter_digger_hacked_before_breached_imp);
            }
        }
        wait(5);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xf414e00b, Offset: 0x6fb0
// Size: 0x24
function teleporter_digger_hacked_before_breached_imp(params) {
    level.var_34ac013b--;
    level.var_b02bf6d2++;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x4e766a4c, Offset: 0x6fe0
// Size: 0x234
function forest_stone() {
    level endon(#"hash_106bb5214b1fb1e6");
    level flag::wait_till(#"forest_done");
    foreach (player in util::get_active_players()) {
        player playrumbleonentity("zm_power_on_rumble");
    }
    var_65c9997c = getent("stone_forest", "targetname");
    var_65c9997c show();
    var_65c9997c clientfield::set("" + #"force_stream_model", 1);
    util::wait_network_frame();
    var_65c9997c clientfield::increment("" + #"stone_rise", 1);
    var_65c9997c movez(5, 2);
    var_65c9997c playsound(#"hash_1d64292cc84a95ed");
    var_65c9997c waittill(#"movedone");
    var_47323b73 = var_65c9997c zm_unitrigger::create(undefined, 96);
    var_47323b73.v_start = var_65c9997c.angles;
    var_65c9997c thread function_31e641f5();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xa8c8442f, Offset: 0x7220
// Size: 0x4f4
function function_31e641f5() {
    level endon(#"hash_106bb5214b1fb1e6");
    while (1) {
        self waittill(#"trigger_activated");
        b_using = 1;
        n_time = 0;
        self thread mansion_util::function_6a523c8c();
        self playsound(#"hash_5f64672d2f3be1cf");
        while (n_time < 3) {
            foreach (player in getplayers()) {
                if (!player usebuttonpressed() || !zm_utility::can_use(player) || !isdefined(self.s_unitrigger) || !isdefined(self.s_unitrigger.trigger) || !player istouching(self.s_unitrigger.trigger)) {
                    b_using = 0;
                    n_time = 0;
                    break;
                }
            }
            if (b_using == 0) {
                self notify(#"stop_wobble");
                self.angles = self.s_unitrigger.v_start;
                self clientfield::set("" + #"stone_glow", 0);
                self playsound(#"hash_44f80245c4072de");
                break;
            }
            self clientfield::set("" + #"stone_glow", 1);
            wait(0.1);
            n_time = n_time + 0.1;
        }
        if (b_using == 1) {
            self playsound(#"hash_c8be5b775b7ca39");
            break;
        }
        wait(0.1);
    }
    array::run_all(util::get_active_players(), &clientfield::increment_to_player, "" + #"mansion_mq_rumble", 1);
    level flag::set(#"disable_fast_travel");
    level clientfield::set("fasttravel_exploder", 0);
    exploder::exploder("fxexp_barrier_gameplay_forest");
    level thread mansion_util::function_f1c106b("loc2", 1);
    self clientfield::set("" + #"stone_soul", 1);
    self playloopsound(#"hash_7e416bed2776d588");
    s_dest = struct::get(self.target);
    self rotateto(s_dest.angles, 3);
    self moveto(s_dest.origin, 3);
    self waittill(#"movedone");
    self clientfield::set("" + #"stone_pickup", 1);
    wait(1);
    self.var_4c4f2b6 = self.angles;
    self thread mansion_util::function_da5cd631(vectorscale((0, 1, 0), 180));
    level flag::set(#"forest_assault");
    zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xb38c1d52, Offset: 0x7720
// Size: 0x1f4
function function_6f244e() {
    level endon(#"hash_106bb5214b1fb1e6");
    self endon(#"death");
    level flag::wait_till(#"forest_assault");
    self thread mansion_pap::function_c9c7a593();
    self thread function_3c07c22e();
    a_s_locs = struct::get_array("wisp_loc");
    wait(randomfloatrange(1.5, 2.5));
    while (!level flag::get(#"hash_6402d013069eb3a")) {
        v_loc = self function_3f504167();
        if (!isdefined(v_loc)) {
            v_loc = self function_46e4dd8b(a_s_locs);
        }
        if (isdefined(v_loc)) {
            n_time = function_de2561ce(self.origin, v_loc);
        }
        if (isdefined(n_time) && n_time > 0) {
            self moveto(v_loc + vectorscale((0, 0, 1), 45), n_time);
            self waittill(#"movedone");
            wait(randomfloatrange(1.5, 2.5));
        }
        n_time = undefined;
        v_loc = undefined;
    }
    self delete();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x76a2b3cd, Offset: 0x7920
// Size: 0x160
function function_3c07c22e() {
    level endon(#"end_game", #"hash_681be3e1ac458d79", #"hash_106bb5214b1fb1e6");
    self endon(#"death");
    while (1) {
        level waittill(#"hash_597743410e6561dd");
        var_1ef7b21 = randomintrange(20, 40);
        if (randomint(100) < 50) {
            mansion_util::function_2057ddc1(self.origin, "knight_trap", "kill", array(0), #"hash_59600c8c9675d5f9", var_1ef7b21, 1, 1);
        } else {
            mansion_util::function_2057ddc1(self.origin, "knight_trap", "kill", array(1), #"hash_59600b8c9675d446", var_1ef7b21, 1, 1);
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xfecf8b8b, Offset: 0x7a88
// Size: 0xf0
function function_46e4dd8b(a_s_locs) {
    level endon(#"hash_106bb5214b1fb1e6");
    self endon(#"death");
    a_s_loc = array::randomize(a_s_locs);
    foreach (s_loc in a_s_loc) {
        if (distance2dsquared(s_loc.origin, self.origin > 250000)) {
            return s_loc.origin;
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x9a088a90, Offset: 0x7b80
// Size: 0x19a
function function_3f504167() {
    level endon(#"hash_106bb5214b1fb1e6");
    self endon(#"death");
    a_e_zombies = array::randomize(getaiarchetypearray(#"zombie"));
    foreach (e_zombie in a_e_zombies) {
        if (isalive(e_zombie) && !(isdefined(e_zombie.var_c57bc555) && e_zombie.var_c57bc555)) {
            v_zombie_loc = mansion_util::function_a8176b98(e_zombie.origin);
        }
        if (isdefined(v_zombie_loc) && zm_zonemgr::function_66bf6a43(v_zombie_loc) && distance2dsquared(v_zombie_loc, self.origin > 250000)) {
            if (isdefined(e_zombie)) {
                e_zombie.var_c57bc555 = 1;
            }
            return v_zombie_loc;
        }
    }
    return undefined;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x1 linked
// Checksum 0xc7399998, Offset: 0x7d28
// Size: 0x58
function function_de2561ce(v_start, v_end) {
    n_distance = distance2d(v_start, v_end);
    n_time = n_distance / 400;
    return n_time;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xdc75b343, Offset: 0x7d88
// Size: 0x64
function function_de68c9b7(s_params) {
    if (!(isdefined(self.var_3f5addd0) && self.var_3f5addd0)) {
        return;
    }
    if (!(isdefined(level.var_be97413) && level.var_be97413)) {
        level thread function_5ffc956(self.origin);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xfa12da5d, Offset: 0x7df8
// Size: 0x13a
function function_5ffc956(v_zombie_origin) {
    level endon(#"end_game", #"hash_6402d013069eb3a");
    e_closest_player = arraygetclosest(v_zombie_origin, zm_vo::function_347f7d34());
    if (isalive(e_closest_player) && e_closest_player util::is_player_looking_at(v_zombie_origin) && distance2dsquared(v_zombie_origin, e_closest_player.origin) < 147456) {
        level.var_be97413 = 1 === e_closest_player zm_audio::create_and_play_dialog(#"kill", #"knight_trap", undefined, 1);
    }
    if (isdefined(level.var_be97413) && level.var_be97413) {
        wait(25);
        level.var_be97413 = 0;
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xc893dfb5, Offset: 0x7f40
// Size: 0x1d6
function function_b646e75d() {
    level endon(#"hash_106bb5214b1fb1e6");
    level flag::wait_till(#"hash_6402d013069eb3a");
    level thread zm_utility::function_9ad5aeb1(0, 1, 0, 1, 0);
    wait(2);
    var_65c9997c = getent("stone_forest", "targetname");
    s_loc = struct::get("kp_forest");
    var_65c9997c notify(#"stop_spin");
    var_65c9997c stoploopsound();
    var_65c9997c playsound(#"hash_7fb9d3b7c445909f");
    wait(0.5);
    var_65c9997c rotateto(var_65c9997c.v_start_angles, 1);
    var_65c9997c moveto(var_65c9997c.v_start_origin, 2);
    var_65c9997c waittill(#"movedone");
    var_65c9997c clientfield::set("" + #"stone_soul", 0);
    var_47323b73 = var_65c9997c zm_unitrigger::create(undefined, (80, 80, 100), &function_c9ebaa3);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x401e0204, Offset: 0x8120
// Size: 0xb8
function function_c9ebaa3() {
    level endon(#"hash_106bb5214b1fb1e6");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"trigger");
        player = waitresult.activator;
        if (!zm_utility::can_use(player)) {
            continue;
        }
        player thread mansion_util::function_f15c4657();
        level thread function_78a99a79();
        zm_unitrigger::unregister_unitrigger(self.stub);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x3d8f609e, Offset: 0x81e0
// Size: 0x10c
function function_78a99a79() {
    var_65c9997c = getent("stone_forest", "targetname");
    if (isdefined(var_65c9997c)) {
        v_loc = var_65c9997c.origin + vectorscale((0, 0, 1), 32);
        var_65c9997c clientfield::set("" + #"stone_pickup", 1);
        var_65c9997c playsound(#"hash_6386a4b7daf03dea");
        var_65c9997c thread util::delayed_delete(1);
        level thread zm_powerups::specific_powerup_drop(#"full_ammo", v_loc);
    }
    level flag::set(#"forest_open");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x207ce067, Offset: 0x82f8
// Size: 0x64
function function_6b0caad3() {
    level flag::wait_till(#"forest_assault");
    mansion_util::function_45ac4bb8();
    level thread function_3d151222(#"forest", #"defend");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x54d93076, Offset: 0x8368
// Size: 0xac
function function_52529102() {
    level flag::wait_till(#"forest_open");
    mansion_util::function_5904a8e1();
    exploder::stop_exploder("fxexp_barrier_gameplay_forest");
    level thread mansion_util::function_f1c106b("loc2", 0);
    level flag::clear(#"disable_fast_travel");
    level clientfield::set("fasttravel_exploder", 1);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x0
// Checksum 0xc238e9ed, Offset: 0x8420
// Size: 0x100
function function_81b48f5f(a_s_valid_respawn_points) {
    var_e9b059c7 = [];
    foreach (s_respawn_point in a_s_valid_respawn_points) {
        if (s_respawn_point.script_noteworthy == "zone_forest_n" || s_respawn_point.script_noteworthy == "zone_forest_s") {
            if (!isdefined(var_e9b059c7)) {
                var_e9b059c7 = [];
            } else if (!isarray(var_e9b059c7)) {
                var_e9b059c7 = array(var_e9b059c7);
            }
            var_e9b059c7[var_e9b059c7.size] = s_respawn_point;
        }
    }
    return var_e9b059c7;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xb91d2311, Offset: 0x8528
// Size: 0x1b4
function forest_assault() {
    level endon(#"hash_106bb5214b1fb1e6");
    level flag::wait_till(#"forest_assault");
    level flag::clear(#"spawn_zombies");
    level flag::clear(#"zombie_drop_powerups");
    level.var_be97413 = 0;
    callback::on_ai_killed(&function_de68c9b7);
    wait(2);
    level thread mansion_util::function_bb613572(function_d11cc23b(), #"hash_6402d013069eb3a");
    level thread _angles_cp_medal_no_deaths();
    level flag::wait_till("forest_final");
    function_b5ab717();
    level thread function_3d151222(#"forest", #"defend_comp");
    level thread function_769c307c();
    callback::remove_on_ai_killed(&function_de68c9b7);
    level flag::set(#"hash_6402d013069eb3a");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x70a24de, Offset: 0x86e8
// Size: 0x64
function function_769c307c() {
    level endon(#"boss_fight_started");
    wait(15);
    level flag::set(#"spawn_zombies");
    level flag::set(#"zombie_drop_powerups");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 2, eflags: 0x5 linked
// Checksum 0x5004368, Offset: 0x8758
// Size: 0x174
function private function_3d151222(var_f49ead21, var_5e1197bc) {
    var_4421515 = array(#"zone_forest_n", #"zone_forest_center", #"zone_forest_s");
    a_e_players = array::randomize(util::get_active_players());
    foreach (e_player in a_e_players) {
        str_zone = e_player zm_zonemgr::get_player_zone();
        if (isdefined(str_zone)) {
            var_fafc280c = hash(str_zone);
            if (array::contains(var_4421515, var_fafc280c)) {
                e_player thread zm_audio::create_and_play_dialog(var_f49ead21, var_5e1197bc, undefined, 1);
                break;
            }
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x5ef1d6b8, Offset: 0x88d8
// Size: 0x3b8
function _angles_cp_medal_no_deaths() {
    function_f0a7d11b();
    wait(10);
    switch (getplayers().size) {
    case 1:
        n_num = 64;
        n_next_wave = 42;
        break;
    case 2:
        n_num = 84;
        n_next_wave = 60;
        break;
    case 3:
        n_num = 114;
        n_next_wave = 82;
        break;
    case 4:
        n_num = 164;
        n_next_wave = 112;
        break;
    }
    a_str_archetypes = [];
    var_a1fc54b0 = 0;
    var_3833f77b = 0;
    while (!level flag::get(#"hash_6402d013069eb3a")) {
        wait(1);
        if (!var_a1fc54b0 && level.var_3dd9f9be >= n_next_wave) {
            var_a1fc54b0 = 1;
            level flag::set(#"hash_29b12646045186fa");
            wait(15 - getplayers().size);
            level flag::clear(#"hash_29b12646045186fa");
        }
        if (!var_3833f77b && level.var_3dd9f9be >= n_num) {
            var_3833f77b = 1;
            level flag::set("forest_final");
            level flag::set(#"hash_29b12646045186fa");
            wait(15 - getplayers().size);
            level flag::clear(#"hash_29b12646045186fa");
        }
        a_zombies = getaiarchetypearray(#"zombie");
        if (level.var_8a64ef3a < 9 && a_zombies.size >= 9) {
            if (!a_str_archetypes.size) {
                a_str_archetypes = array::randomize(array(#"corrosive_scripted", #"water_scripted", #"electric_scripted", #"plasma_scripted"));
            }
            foreach (ai in a_zombies) {
                if (ai zm_ai_utility::function_db610082()) {
                    zm_transform::function_9acf76e6(ai, array::pop(a_str_archetypes, undefined, 0));
                    break;
                }
            }
        }
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x2c1564cc, Offset: 0x8c98
// Size: 0x11c
function function_b5ab717() {
    a_players = getplayers();
    switch (a_players.size) {
    case 1:
        n_num = 3;
        n_active = 2;
        break;
    case 2:
        n_num = 4;
        n_active = 2;
        break;
    case 3:
        n_num = 5;
        n_active = 3;
        break;
    case 4:
        n_num = 6;
        n_active = 4;
        break;
    }
    level thread function_a78b58f6(n_active, n_num, #"hash_6402d013069eb3a");
    while (level.var_b02bf6d2 < n_num) {
        wait(0.5);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x0
// Checksum 0x57d840bc, Offset: 0x8dc0
// Size: 0x24
function function_9b73d9d3(params) {
    level.var_3f26be33--;
    level.var_1d2ffde3++;
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xe5f62e09, Offset: 0x8df0
// Size: 0x8e
function zmb_ee_key_pickupmemberdeath() {
    for (var_1363654e = 1; var_1363654e < 4; var_1363654e++) {
        level waittill(#"hash_3c7945247db32d89");
        zm_audio::sndmusicsystem_playstate("quest_" + var_1363654e);
        playsoundatposition(#"hash_27659ddbc81c63cc" + var_1363654e, (0, 0, 0));
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x5d991b96, Offset: 0x8e88
// Size: 0x144
function forest_entrance() {
    level flag::wait_till_all(array(#"forest_open", #"cemetery_open", #"greenhouse_open"));
    scene::add_scene_func(#"p8_fxanim_zm_man_druid_door_bundle", &function_de7be188, "init");
    level scene::init(#"p8_fxanim_zm_man_druid_door_bundle");
    scene::remove_scene_func(#"p8_fxanim_zm_man_druid_door_bundle", &function_de7be188, "init");
    s_door = struct::get("s_forest_door");
    s_door zm_unitrigger::create(#"hash_6d663dca450595ef", 150);
    s_door thread trigger_forest_entrance();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x2f34cc6c, Offset: 0x8fd8
// Size: 0x4c
function function_de7be188(a_ents) {
    level.var_bc889083 = a_ents[getfirstarraykey(a_ents)];
    level.var_bc889083 ghost();
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0x3548a63f, Offset: 0x9030
// Size: 0x334
function trigger_forest_entrance() {
    e_door = getent("forest_stone_holder", "targetname");
    while (1) {
        self waittill(#"trigger_activated");
        e_door playsound(#"hash_4a0656a938f60847");
        b_using = 1;
        n_time = 0;
        while (n_time < 2.5) {
            foreach (player in getplayers()) {
                if (!player usebuttonpressed() || !zm_utility::can_use(player) || !isdefined(self.s_unitrigger) || !isdefined(self.s_unitrigger.trigger) || !player istouching(self.s_unitrigger.trigger)) {
                    b_using = 0;
                    n_time = 0;
                    break;
                }
            }
            if (b_using == 0) {
                e_door playsound(#"hash_7b1799e118dcfdc6");
                e_door clientfield::set("" + #"stone_glow", 0);
                break;
            }
            e_door clientfield::set("" + #"stone_glow", 1);
            wait(0.1);
            n_time = n_time + 0.1;
        }
        if (b_using == 1) {
            e_door playsound(#"hash_6e67bd5897b45cb1");
            break;
        }
        wait(0.1);
    }
    player = array::random(zm_vo::function_347f7d34());
    if (isdefined(player)) {
        player thread zm_vo::function_a2bd5a0c(#"hash_7cedb4ec0f14ff50", 1);
    }
    level thread function_a112ed5e();
    if (isdefined(self.s_unitrigger)) {
        zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xa4b44b8d, Offset: 0x9370
// Size: 0x454
function function_a112ed5e() {
    exploder::exploder("exp_lgt_boss_entrance");
    array::run_all(util::get_active_players(), &freezecontrolsallowlook, 1);
    array::run_all(util::get_active_players(), &val::set, "boss_door_opening", "ignoreme", 1);
    array::run_all(util::get_active_players(), &val::set, "boss_door_opening", "takedamage", 0);
    wait(1);
    array::run_all(util::get_active_players(), &clientfield::increment_to_player, "" + #"mansion_mq_rumble", 1);
    var_3f81f68b = getent("relic_greenhouse", "targetname");
    var_b32bc0a = getent("relic_cemetery", "targetname");
    var_d73febbe = getent("relic_forest", "targetname");
    mdl_door = getent("forest_stone_holder", "targetname");
    if (isdefined(var_3f81f68b) && isdefined(var_b32bc0a) && isdefined(var_d73febbe)) {
        mdl_door clientfield::set("" + #"stone_glow", 0);
        var_3f81f68b clientfield::set("" + #"stone_glow", 0);
        var_b32bc0a clientfield::set("" + #"stone_glow", 0);
        var_d73febbe clientfield::set("" + #"stone_glow", 0);
        wait(1.25);
        level.var_bc889083 show();
        level.var_bc889083 = undefined;
        mdl_door delete();
        var_3f81f68b delete();
        var_b32bc0a delete();
        var_d73febbe delete();
    }
    level scene::play(#"p8_fxanim_zm_man_druid_door_bundle");
    wait(2.5);
    zm_sq::start(#"zm_mansion_ww");
    level flag::set(#"main_quest_completed");
    wait(2);
    array::run_all(util::get_active_players(), &freezecontrolsallowlook, 0);
    array::run_all(util::get_active_players(), &val::reset, "boss_door_opening", "ignoreme");
    array::run_all(util::get_active_players(), &val::reset, "boss_door_opening", "takedamage");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0xf48a2afd, Offset: 0x97d0
// Size: 0x122
function function_d11cc23b(str_script_noteworthy = "spawn_location") {
    a_spawns = struct::get_array(str_script_noteworthy, "script_noteworthy");
    foreach (s_loc in a_spawns) {
        if (s_loc.targetname !== "forest_n_spawns" || s_loc.targetname !== "forest_center_spawns" || s_loc.targetname !== "forest_s_spawns") {
            arrayremovevalue(a_spawns, s_loc, 1);
        }
    }
    return array::remove_undefined(a_spawns);
}

// Namespace mansion_triad/zm_mansion_triad
// Params 0, eflags: 0x1 linked
// Checksum 0xcfeeffc6, Offset: 0x9900
// Size: 0x20c
function function_f0a7d11b() {
    if (!isdefined(level.var_8a64ef3a)) {
        level.var_8a64ef3a = 0;
    }
    sp_catalyst = getspawnerarray("zombie_spawner_catalyst_corrosive", "targetname")[0];
    zm_transform::function_cfca77a7(sp_catalyst, #"corrosive_scripted", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_corrosive_spawn_pre_split", "aib_vign_zm_zod_catalyst_corrosive_spawn_post_split");
    sp_catalyst = getspawnerarray("zombie_spawner_catalyst_water", "targetname")[0];
    zm_transform::function_cfca77a7(sp_catalyst, #"water_scripted", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_water_spawn_pre_split", "aib_vign_zm_zod_catalyst_water_spawn_post_split");
    sp_catalyst = getspawnerarray("zombie_spawner_catalyst_electric", "targetname")[0];
    zm_transform::function_cfca77a7(sp_catalyst, #"electric_scripted", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_electric_spawn_pre_split", "aib_vign_zm_zod_catalyst_electric_spawn_post_split");
    sp_catalyst = getspawnerarray("zombie_spawner_catalyst_plasma", "targetname")[0];
    zm_transform::function_cfca77a7(sp_catalyst, #"plasma_scripted", &zm_ai_utility::function_db610082, 0, undefined, &function_724b3e30, "aib_vign_zm_zod_catalyst_plasma_spawn_pre_split", "aib_vign_zm_zod_catalyst_plasma_spawn_post_split");
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x512de604, Offset: 0x9b18
// Size: 0xac
function function_724b3e30(n_health) {
    if (!isdefined(level.var_8a64ef3a)) {
        level.var_8a64ef3a = 0;
    }
    self.var_12745932 = 1;
    level.var_8a64ef3a++;
    level thread function_83ad8f65(self);
    if (self.catalyst_type == 1) {
        self zombie_utility::set_zombie_run_cycle("sprint");
    } else {
        self zombie_utility::set_zombie_run_cycle("run");
    }
}

// Namespace mansion_triad/zm_mansion_triad
// Params 1, eflags: 0x1 linked
// Checksum 0x4ee37bc6, Offset: 0x9bd0
// Size: 0x50
function function_83ad8f65(ai) {
    if (!isdefined(level.var_8a64ef3a)) {
        level.var_8a64ef3a = 0;
    }
    ai waittill(#"death");
    level.var_8a64ef3a--;
}

