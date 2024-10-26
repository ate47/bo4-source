#using scripts\core\gametypes\frontend.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\array_shared.csc;

#namespace zm_laboratory;

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 0, eflags: 0x2
// Checksum 0x64290b4e, Offset: 0x940
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_laboratory", &__init__, undefined, undefined);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 0, eflags: 0x1 linked
// Checksum 0x3db22a0f, Offset: 0x988
// Size: 0x24
function __init__() {
    callback::on_localclient_connect(&function_250232f4);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xdb1995e3, Offset: 0x9b8
// Size: 0x13b4
function function_250232f4(localclientnum) {
    lui::createcustomcameramenu(#"laboratory", localclientnum, &function_a856f9dd, 1, &function_ca3a6506, &function_64c9ba5);
    level flag::init(#"hash_511b4468376ea105");
    level flag::init(#"laboratory_activated");
    level flag::init(#"hash_71fc63117cc5bf06" + 1);
    level flag::init(#"hash_71fc63117cc5bf06" + 2);
    level flag::init(#"hash_71fc63117cc5bf06" + 3);
    level flag::init(#"hash_c5112e5b6ad4e15");
    level flag::init(#"hash_4f26b4e33ddb3509");
    level flag::init(#"hash_4bbc47f6a0a31743");
    animation::add_notetrack_func(#"talisman_anim_finished", &function_5e0db3e7);
    level.var_49f26c00 = spawnstruct();
    level.var_49f26c00.var_9eec6f29 = array(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
    level.var_49f26c00.var_ece3d654 = array("green", "white", "orange", "gold", "purple", "blue");
    level.var_49f26c00.var_8a28a9a = array::random(level.var_49f26c00.var_ece3d654);
    level.var_49f26c00.var_66baa9e8 = array(-1, -1, 0, 1, 3, 2);
    level.var_49f26c00.var_9af0d684 = 1;
    level.var_49f26c00.var_f538d7d4 = array(#"hash_a87603ded4882b1", #"hash_2c6105fec300cac", #"hash_165b9b0cd81e08af", #"hash_4f161447e88af8b9", #"hash_712426d0934a5cd4");
    level.var_49f26c00.var_7a5c68f2 = array(#"hash_6b40c7a7d0833180", #"hash_38d4f59cb78344b9", #"hash_78f0379f9bdc006", #"hash_102b72b6190bf34", #"hash_256e8ac9ea9c8ad9");
    level.var_49f26c00.var_b273f2b6 = getent(localclientnum, "tube_liquid_01", "targetname");
    level.var_49f26c00.var_c6761aa2 = getent(localclientnum, "tube_liquid_02", "targetname");
    level.var_49f26c00.var_dcbe4732 = getent(localclientnum, "tube_liquid_03", "targetname");
    level.var_49f26c00.var_f48ac46 = getent(localclientnum, "tube_liquid_04", "targetname");
    level.var_49f26c00.var_c6761aa2 setmodel(#"hash_147375b2a9795cd1");
    level.var_49f26c00.var_dcbe4732 setmodel(#"hash_789fccb680d65004");
    level.var_49f26c00.var_f48ac46 setmodel(#"hash_46ef488f583997fb");
    level._effect[#"hash_6d42ec7a48079d27"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_bubbles_base";
    level._effect[#"hash_7834e8ed496978a7"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_classic";
    level._effect[#"hash_6b40c7a7d0833180"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_common";
    level._effect[#"hash_102b72b6190bf34"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_epic";
    level._effect[#"hash_78f0379f9bdc006"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_legendary";
    level._effect[#"hash_38d4f59cb78344b9"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_rare";
    level._effect[#"hash_256e8ac9ea9c8ad9"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_ultra";
    level._effect[#"hash_56e6aeec2f0f9d1c"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_whimsical";
    level._effect[#"hash_3a65d1b462add54a"] = "maps/core_frontend/fx8_frontend_zombie_lab_elixir_wipe";
    level._effect[#"hash_43b44402af23c93c"] = "maps/core_frontend/fx8_frontend_zombie_lab_stills_surface";
    level._effect[#"hash_f4b99c36c8b7232"] = "maps/core_frontend/fx8_frontend_zombie_lab_stl_surface_common";
    level._effect[#"hash_8a44ebbb924768a"] = "maps/core_frontend/fx8_frontend_zombie_lab_stl_surface_epic";
    level._effect[#"hash_78125560468f4188"] = "maps/core_frontend/fx8_frontend_zombie_lab_stl_surface_legend";
    level._effect[#"hash_2be8010ec8776feb"] = "maps/core_frontend/fx8_frontend_zombie_lab_stl_surface_rare";
    level._effect[#"hash_4dd3ac60cbb0f8ab"] = "maps/core_frontend/fx8_frontend_zombie_lab_stl_surface_ultra";
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", &function_de0d6843, "play");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", &function_7c1ef1e1, "done");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", &function_7c1ef1e1, "stop");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", &function_7af39f9a, "enter");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", &function_31b459eb, "exit");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", &function_24222bb4, "skip_to_idle");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", &function_24222bb4, "skip_to_idle");
    /#
        level.var_49f26c00.var_557a03e6 = array(#"p8_zm_elixir_aftertaste_ui", #"p8_zm_elixir_alchemical_antithesis_ui", #"p8_zm_elixir_always_done_swiftly_ui", #"p8_zm_elixir_anti_entrapment_ui", #"p8_zm_elixir_anywhere_but_here_ui", #"p8_zm_elixir_arsenal_accelerator_ui", #"p8_zm_elixir_blood_debt_ui", #"hash_1a7c490a566d667", #"p8_zm_elixir_burned_out_ui", #"p8_zm_elixir_cache_back_ui", #"hash_58b3b4e50c5ad8b5", #"p8_zm_elixir_ctrl_z_ui", #"hash_5e08e862c962617a", #"p8_zm_elixir_dead_of_nuclear_winter_ui", #"p8_zm_elixir_equip_mint_ui", #"p8_zm_elixir_extra_credit_ui", #"p8_zm_elixir_free_fire_ui", #"p8_zm_elixir_head_scan_ui", #"p8_zm_elixir_immolation_liquidation_ui", #"p8_zm_elixir_in_plain_sight_ui", #"p8_zm_elixir_join_the_party_ui", #"p8_zm_elixir_kill_joy_ui", #"p8_zm_elixir_licensed_contractor_ui", #"p8_zm_elixir_newtonian_negation_ui", #"p8_zm_elixir_now_you_see_me_ui", #"p8_zm_elixir_nowhere_but_there_ui", #"hash_65291a8ef0716ac6", #"p8_zm_elixir_point_drops_ui", #"p8_zm_elixir_pop_shocks_ui", #"p8_zm_elixir_power_keg_ui", #"hash_7b8c2e9a197a1cbb", #"p8_zm_elixir_shields_up_ui", #"p8_zm_elixir_stock_option_ui", #"p8_zm_elixir_sword_flay_ui", #"p8_zm_elixir_temporal_gift_ui", #"p8_zm_elixir_undead_man_walking_ui", #"p8_zm_elixir_wall_power_ui", #"p8_zm_elixir_wall_to_wall_savings_ui", #"p8_zm_elixir_whos_keeping_score_ui");
        level.var_49f26c00.a_str_talismans = array(#"p8_zm_talisman_box_guarantee_box_only", #"p8_zm_talisman_box_guarantee_lmg", #"hash_199da03ac6e12953", #"p8_zm_talisman_coagulant", #"p8_zm_talisman_extra_claymore", #"p8_zm_talisman_extra_frag", #"p8_zm_talisman_extra_mini_turret", #"p8_zm_talisman_extra_molotov", #"p8_zm_talisman_extra_semtex", #"p8_zm_talisman_hero_weapon_lvl3", #"p8_zm_talisman_impatient", #"p8_zm_talisman_pap_cost", #"p8_zm_talisman_perk_mod_single", #"hash_27dae06ec588c817", #"hash_27dae16ec588c9ca", #"hash_27dae26ec588cb7d", #"hash_27dadb6ec588bf98", #"p8_zm_talisman_perk_vapor_permanent_1", #"p8_zm_talisman_perk_vapor_permanent_2", #"p8_zm_talisman_perk_vapor_permanent_3", #"p8_zm_talisman_perk_vapor_permanent_4", #"hash_22e20f33489f2582", #"hash_22e20e33489f23cf", #"hash_22e20d33489f221c", #"hash_22e20c33489f2069", #"p8_zm_talisman_shield_durability_legendary", #"p8_zm_talisman_shield_durability_rare", #"p8_zm_talisman_shield_price", #"p8_zm_talisman_spec_weapon_duration", #"p8_zm_talisman_spec_weapon_lvl2", #"hash_14e3ae5974c15925", #"p8_zm_talisman_start_weapon_ar", #"p8_zm_talisman_start_weapon_lmg", #"p8_zm_talisman_start_weapon_monkey", #"p8_zm_talisman_start_weapon_smg");
    #/
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_f8d486f8, "init");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_d4f9b895, "press_tease");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_d4f9b895, "press_create");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_d4f9b895, "press_no_create");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_d4f9b895, "skip_to_idle");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_43d0e81a, "done");
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", &function_43d0e81a, "stop");
    a_str_shots = scene::get_all_shot_names(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle");
    foreach (str_shot in a_str_shots) {
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", &function_94c307e0, str_shot, str_shot);
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", &function_94c307e0, str_shot, str_shot);
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", &function_94c307e0, str_shot, str_shot);
    }
    scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_centrifuge_fluid_bundle", &function_cdd906ed, "fill");
    a_str_shots = scene::get_all_shot_names(#"p8_fxanim_core_frontend_zm_lab_flask_globs_01_to_03_bundle");
    foreach (str_shot in a_str_shots) {
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_flask_globs_01_to_03_bundle", &function_989962b9, str_shot, str_shot);
    }
    a_str_shots = scene::get_all_shot_names(#"p8_fxanim_core_frontend_zm_lab_flask_globs_04_to_06_bundle");
    foreach (str_shot in a_str_shots) {
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_flask_globs_04_to_06_bundle", &function_989962b9, str_shot, str_shot);
    }
    a_str_shots = scene::get_all_shot_names(#"p8_fxanim_core_frontend_zm_lab_flask_globs_07_to_09_bundle");
    foreach (str_shot in a_str_shots) {
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_flask_globs_07_to_09_bundle", &function_989962b9, str_shot, str_shot);
    }
    a_str_shots = scene::get_all_shot_names(#"p8_fxanim_core_frontend_zm_lab_flask_globs_10_bundle");
    foreach (str_shot in a_str_shots) {
        scene::add_scene_func(#"p8_fxanim_core_frontend_zm_lab_flask_globs_10_bundle", &function_989962b9, str_shot, str_shot);
    }
    /#
        level.var_1a2c5c75 = &function_b78fb1b0;
    #/
    /#
        level thread function_1a17b820(localclientnum);
    #/
}

/#

    // Namespace zm_laboratory/frontend_zm_laboratory
    // Params 1, eflags: 0x4
    // Checksum 0xbb2c65ba, Offset: 0x1d78
    // Size: 0x410
    function private function_1a17b820(localclientnum) {
        var_596aaddb = 1;
        var_89f688b8 = "<dev string:x38>";
        foreach (var_5a5b2186 in level.var_49f26c00.var_9eec6f29) {
            adddebugcommand(localclientnum, "<dev string:x40>" + var_5a5b2186 + "<dev string:x71>" + var_5a5b2186 + "<dev string:x97>");
        }
        foreach (var_80090cfc in level.var_49f26c00.var_ece3d654) {
            adddebugcommand(localclientnum, "<dev string:x9c>" + var_80090cfc + "<dev string:xd8>" + var_80090cfc + "<dev string:x97>");
        }
        adddebugcommand(localclientnum, "<dev string:x104>" + 1 + "<dev string:x97>");
        adddebugcommand(localclientnum, "<dev string:x161>");
        adddebugcommand(localclientnum, "<dev string:x196>");
        adddebugcommand(localclientnum, "<dev string:x1f2>");
        adddebugcommand(localclientnum, "<dev string:x233>");
        adddebugcommand(localclientnum, "<dev string:x274>");
        adddebugcommand(localclientnum, "<dev string:x2b5>");
        adddebugcommand(localclientnum, "<dev string:x32b>");
        adddebugcommand(localclientnum, "<dev string:x3a1>");
        while (true) {
            var_509eb1e5 = getdvarint(#"hash_5001173ab674d344", 1);
            var_74d08f2b = getdvarstring(#"hash_5de1ac7448993686", "<dev string:x38>");
            var_8de02736 = getdvarint(#"hash_56728884d2904809", 0);
            waitframe(1);
            if (var_509eb1e5 != var_596aaddb || var_74d08f2b != var_89f688b8) {
                level notify(#"hash_6d47a1e190b93eaf", {#var_800db6bf:var_74d08f2b, #var_aba5d0f5:var_509eb1e5, #b_debug:1});
                var_596aaddb = var_509eb1e5;
                var_89f688b8 = var_74d08f2b;
            }
            if (var_8de02736) {
                function_3dd68dd9(localclientnum);
                setdvar(#"hash_56728884d2904809", 0);
                wait 0.5;
            }
        }
    }

    // Namespace zm_laboratory/frontend_zm_laboratory
    // Params 1, eflags: 0x0
    // Checksum 0x80fe9539, Offset: 0x2190
    // Size: 0x1ee
    function function_b78fb1b0(localclientnum) {
        level notify(#"hash_79bbc4f96a28b094");
        level endoncallback(&function_d160164e, #"end_controller_pulse", #"hash_79bbc4f96a28b094");
        level scene::init(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
        level scene::init(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle");
        level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "<dev string:x417>");
        level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "<dev string:x417>");
        level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "<dev string:x417>");
        level.var_32f68719 = 1;
        wait 3;
        while (true) {
            for (i = 0; i < 3; i++) {
                function_7ee5e3a2(localclientnum, array::random(level.var_49f26c00.var_ece3d654), array::random(level.var_49f26c00.var_9eec6f29), level.var_32f68719);
                wait 4;
            }
            function_365bef4(localclientnum, level.var_32f68719);
            wait 3;
        }
    }

    // Namespace zm_laboratory/frontend_zm_laboratory
    // Params 0, eflags: 0x0
    // Checksum 0x486d5c42, Offset: 0x2388
    // Size: 0x6f6
    function function_66051772() {
        self notify("<dev string:x424>");
        self endon("<dev string:x424>");
        level endon(#"hash_79bbc4f96a28b094", #"laboratory_closed");
        if (getdvarint(#"hash_510a173ea851eab1", 0)) {
            return;
        }
        while (true) {
            if (level flag::get(#"laboratory_activated")) {
                debug2dtext((35, 60, 0), "<dev string:x437>", (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            } else {
                debug2dtext((35, 60, 0), "<dev string:x442>", (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            }
            debug2dtext((35, 80, 0), "<dev string:x455>" + level.var_49f26c00.var_3e14626f, (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            switch (level.var_49f26c00.var_8a28a9a) {
            case #"blue":
                debug2dtext((35, 110, 0), "<dev string:x469>" + level.var_49f26c00.var_8a28a9a, (0, 0, 1), 1, (0, 0, 0), 1, 1, 1);
                break;
            case #"gold":
                debug2dtext((35, 110, 0), "<dev string:x469>" + level.var_49f26c00.var_8a28a9a, (1, 1, 0), 1, (0, 0, 0), 1, 1, 1);
                break;
            case #"grey":
                debug2dtext((35, 110, 0), "<dev string:x469>" + level.var_49f26c00.var_8a28a9a, (0.75, 0.75, 0.75), 1, (0, 0, 0), 1, 1, 1);
                break;
            case #"orange":
                debug2dtext((35, 110, 0), "<dev string:x469>" + level.var_49f26c00.var_8a28a9a, (1, 0.5, 0), 1, (0, 0, 0), 1, 1, 1);
                break;
            case #"purple":
                debug2dtext((35, 110, 0), "<dev string:x469>" + level.var_49f26c00.var_8a28a9a, (1, 0, 1), 1, (0, 0, 0), 1, 1, 1);
                break;
            case #"green":
            case #"white":
                debug2dtext((35, 110, 0), "<dev string:x469>" + level.var_49f26c00.var_8a28a9a, (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
                break;
            }
            debug2dtext((35, 130, 0), "<dev string:x473>" + level.var_49f26c00.var_9af0d684, (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            if (level flag::get(#"laboratory_activated")) {
                var_28da8e7b = isdefined(level.var_49f26c00.var_6138b381) ? level.var_49f26c00.var_6138b381 : "<dev string:x482>";
                var_37982bf6 = isdefined(level.var_49f26c00.var_887781fe) ? level.var_49f26c00.var_887781fe : "<dev string:x482>";
                var_544c750 = isdefined(level.var_49f26c00.var_84c77a9e) ? level.var_49f26c00.var_84c77a9e : "<dev string:x482>";
                str_talisman = isdefined(level.var_49f26c00.var_f6e518bb) ? level.var_49f26c00.var_f6e518bb : "<dev string:x482>";
                debug2dtext((35, 150, 0), "<dev string:x485>" + function_9e72a96(var_28da8e7b), (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
                debug2dtext((35, 170, 0), "<dev string:x491>" + function_9e72a96(var_37982bf6), (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
                debug2dtext((35, 190, 0), "<dev string:x49d>" + function_9e72a96(var_544c750), (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
                debug2dtext((35, 210, 0), "<dev string:x4a9>" + function_9e72a96(str_talisman), (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            }
            waitframe(1);
        }
    }

#/

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xd29f0b31, Offset: 0x2a88
// Size: 0xb4
function function_a8f6e36c(localclientnum, state) {
    /#
        if (isdefined(level.var_32f68719) && level.var_32f68719) {
            return;
        }
    #/
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_5defc90 = createuimodel(createuimodel(level.var_49f26c00.controller_model, "Laboratory"), "animState");
    setuimodelvalue(var_5defc90, state);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x8c7f6003, Offset: 0x2b48
// Size: 0xb4
function function_8192c9cf(localclientnum, val) {
    /#
        if (isdefined(level.var_32f68719) && level.var_32f68719) {
            return;
        }
    #/
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_5defc90 = createuimodel(createuimodel(level.var_49f26c00.controller_model, "Laboratory"), "shrinkLabelList");
    setuimodelvalue(var_5defc90, val);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0x9c71e352, Offset: 0x2c08
// Size: 0x84
function function_a856f9dd(localclientnum, menu_name, state) {
    camera_ent = struct::get("tag_align_zm_lab");
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_lab", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x783b218d, Offset: 0x2c98
// Size: 0x7c
function function_ca3a6506(localclientnum, menu_data) {
    exploder::exploder(#"hash_7bc4347f95dd65fc");
    function_49dde74(1, 1);
    forceambientroom("zm_elx_dml");
    level thread function_d940763b(localclientnum);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x3efec371, Offset: 0x2d20
// Size: 0xd8
function function_64c9ba5(localclientnum, menu_data) {
    exploder::stop_exploder(#"hash_7bc4347f95dd65fc");
    level notify(#"hash_490aea66046d4a50");
    function_a8f6e36c(localclientnum, 0);
    level flag::clear(#"hash_511b4468376ea105");
    function_49dde74(0);
    forceambientroom("");
    function_d160164e();
    level notify(#"laboratory_closed");
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xa49ffc76, Offset: 0x2e00
// Size: 0x3be
function function_d940763b(localclientnum) {
    level notify(#"hash_490aea66046d4a50");
    level endon(#"hash_490aea66046d4a50", #"laboratory_closed");
    level scene::init(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
    level scene::init(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_idle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_idle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_idle");
    while (true) {
        waitresult = level waittill(#"hash_201d829556393f76", #"hash_7e320f49f449ea9f", #"hash_6d47a1e190b93eaf", #"hash_7c3e120025ea0122", #"hash_341a5b4aa52ea814", #"talisman_show_label", #"bottle1_fill_complete", #"bottle1_leave", #"hash_1d604ddf352ddcca", #"hash_6551ceddc995b613");
        switch (waitresult._notify) {
        case #"hash_201d829556393f76":
            level.var_49f26c00.controller_model = getuimodelforcontroller(waitresult.controller);
            break;
        case #"hash_7e320f49f449ea9f":
            level.var_49f26c00.controller_model = undefined;
            break;
        case #"hash_6d47a1e190b93eaf":
            if (!(isdefined(level.var_ee871019) && level.var_ee871019)) {
                level thread function_7ee5e3a2(localclientnum, waitresult.var_800db6bf, waitresult.var_aba5d0f5, waitresult.b_debug);
            }
            break;
        case #"hash_7c3e120025ea0122":
            level thread function_365bef4(localclientnum);
            break;
        case #"bottle1_fill_complete":
            function_ef574f9c(localclientnum);
            break;
        case #"bottle1_leave":
            function_f0252f42(localclientnum);
            break;
        case #"hash_341a5b4aa52ea814":
            function_2cb555c6(localclientnum);
            break;
        case #"talisman_show_label":
            talisman_show_label(localclientnum);
            break;
        case #"hash_1d604ddf352ddcca":
            level thread function_4053acdb(localclientnum);
            break;
        case #"hash_6551ceddc995b613":
            break;
        }
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x66cd2a2e, Offset: 0x31c8
// Size: 0x28a
function talisman_show_label(localclientnum) {
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_9d5a2308 = createuimodel(createuimodel(level.var_49f26c00.controller_model, "laboratory"), "bottles");
    var_c7a38c4f = getuimodel(var_9d5a2308, 4);
    if (!isdefined(var_c7a38c4f)) {
        return;
    }
    if (var_c7a38c4f) {
        visiblemodel = getuimodel(var_c7a38c4f, "visible");
        if (visiblemodel) {
            setuimodelvalue(visiblemodel, 1);
        }
    }
    var_4deff3fa = function_18d7cd9b(localclientnum, 4);
    if (isdefined(level.var_49f26c00.var_ae9da777)) {
        v_origin = level.var_49f26c00.var_ae9da777.origin;
    } else {
        v_origin = (0, 0, 0);
    }
    switch (var_4deff3fa) {
    case 0:
        playsound(localclientnum, #"hash_49d438d1a1ba28b9", v_origin);
        break;
    case 1:
        playsound(localclientnum, #"hash_7d9e04c47d70ca1d", v_origin);
        break;
    case 2:
        playsound(localclientnum, #"hash_2ff41d0510d442c8", v_origin);
        break;
    case 3:
        playsound(localclientnum, #"hash_2c8d10ab46ff7e64", v_origin);
        break;
    case 4:
        playsound(localclientnum, #"hash_2409a80bfb7d6955", v_origin);
        break;
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x40275cf3, Offset: 0x3460
// Size: 0xb4
function function_ef574f9c(localclientnum) {
    /#
        if (isdefined(level.var_32f68719) && level.var_32f68719) {
            return;
        }
    #/
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_6b06e86b = createuimodel(createuimodel(level.var_49f26c00.controller_model, "laboratory"), "firstBottleFilled");
    setuimodelvalue(var_6b06e86b, 1);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x4602d065, Offset: 0x3520
// Size: 0xac
function function_f0252f42(localclientnum) {
    /#
        if (isdefined(level.var_32f68719) && level.var_32f68719) {
            return;
        }
    #/
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_6b06e86b = createuimodel(createuimodel(level.var_49f26c00.controller_model, "laboratory"), "firstBottleFilled");
    setuimodelvalue(var_6b06e86b, 0);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0xa99ef691, Offset: 0x35d8
// Size: 0xa8
function function_f47528e7(localclientnum, var_9d5a2308, index) {
    var_fd54b4c8 = getuimodel(var_9d5a2308, index + ".modelRef");
    if (isdefined(var_fd54b4c8)) {
        var_c23428a2 = getuimodelvalue(var_fd54b4c8);
        if (isdefined(var_c23428a2) && var_c23428a2 !== "" && var_c23428a2 !== #"") {
            return var_c23428a2;
        }
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x1f6cffb7, Offset: 0x3688
// Size: 0x23c
function function_18d7cd9b(localclientnum, index) {
    /#
        if (isdefined(level.var_32f68719) && level.var_32f68719) {
            return randomintrangeinclusive(0, 4);
        }
        switch (index) {
        case 1:
            if (getdvarint(#"hash_7d14f5423168c05a", -1) >= 0) {
                return getdvarint(#"hash_7d14f5423168c05a", 0);
            }
            break;
        case 2:
            if (getdvarint(#"hash_7d14f4423168bea7", -1) >= 0) {
                return getdvarint(#"hash_7d14f4423168bea7", 0);
            }
            break;
        case 3:
            if (getdvarint(#"hash_7d14f3423168bcf4", -1) >= 0) {
                return getdvarint(#"hash_7d14f3423168bcf4", 0);
            }
            break;
        }
    #/
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_9d5a2308 = createuimodel(createuimodel(level.var_49f26c00.controller_model, "laboratory"), "bottles");
    var_565f38af = getuimodel(var_9d5a2308, index + ".rarity");
    if (isdefined(var_565f38af)) {
        return getuimodelvalue(var_565f38af);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xaa7a74e7, Offset: 0x38d0
// Size: 0x94
function function_6127ea37(localclientnum, var_116287e0) {
    rarity = function_18d7cd9b(localclientnum, var_116287e0);
    if (isdefined(rarity)) {
        str_name = level.var_49f26c00.var_7a5c68f2[rarity];
    } else {
        str_name = #"hash_7834e8ed496978a7";
    }
    str_file = level._effect[str_name];
    return str_file;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xd8237404, Offset: 0x3970
// Size: 0xcc
function function_b3efb400(value) {
    /#
        if (isdefined(level.var_32f68719) && level.var_32f68719) {
            return;
        }
    #/
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_dbabde4d = getuimodel(level.var_49f26c00.controller_model, "laboratory");
    if (isdefined(var_dbabde4d)) {
        var_86150db3 = getuimodel(var_dbabde4d, "skipReady");
        if (isdefined(var_86150db3)) {
            setuimodelvalue(var_86150db3, value);
        }
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x143618af, Offset: 0x3a48
// Size: 0x24c
function function_2cb555c6(localclientnum) {
    if (!isdefined(level.var_49f26c00.controller_model)) {
        return;
    }
    var_9d5a2308 = createuimodel(createuimodel(level.var_49f26c00.controller_model, "laboratory"), "bottles");
    level.var_49f26c00.var_6138b381 = function_f47528e7(localclientnum, var_9d5a2308, 1);
    level.var_49f26c00.var_887781fe = function_f47528e7(localclientnum, var_9d5a2308, 2);
    level.var_49f26c00.var_84c77a9e = function_f47528e7(localclientnum, var_9d5a2308, 3);
    level.var_49f26c00.var_f6e518bb = function_f47528e7(localclientnum, var_9d5a2308, 4);
    if (isdefined(level.var_49f26c00.var_6138b381) && isdefined(level.var_49f26c00.var_887781fe) && isdefined(level.var_49f26c00.var_84c77a9e)) {
        level.var_49f26c00.var_6138b381 += "_lab";
        level.var_49f26c00.var_887781fe += "_lab";
        level.var_49f26c00.var_84c77a9e += "_lab";
        function_b3efb400(!level flag::get(#"hash_4bbc47f6a0a31743"));
        level flag::set(#"hash_511b4468376ea105");
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xd3ce0c1, Offset: 0x3ca0
// Size: 0x52c
function function_c7117688(localclientnum) {
    level endon(#"hash_1d604ddf352ddcca", #"reward_timeout", #"laboratory_closed");
    var_469e104d = function_18d7cd9b(localclientnum, 1);
    var_7953f5b8 = function_18d7cd9b(localclientnum, 2);
    var_6b14d93a = function_18d7cd9b(localclientnum, 3);
    if (!isdefined(var_469e104d) || !isdefined(var_7953f5b8) || !isdefined(var_6b14d93a)) {
        level flag::set(#"hash_4f26b4e33ddb3509");
        return;
    }
    var_19d0b0e2 = function_c8a51052(var_469e104d, var_7953f5b8, var_6b14d93a);
    var_bc9784a7 = function_879fc3ee(var_469e104d);
    var_35bcf6f0 = function_879fc3ee(var_7953f5b8);
    var_237e5273 = function_879fc3ee(var_6b14d93a);
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        function_b760318d(3);
    } else {
        function_b760318d(1);
    }
    level.var_49f26c00.var_53ec42bc function_523d7d8b(localclientnum, "mixer_01_bath_fluid_fx_jnt", var_469e104d);
    level.var_49f26c00.var_53ec42bc function_9b8f7969(var_bc9784a7);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_fill_finish");
    exploder::exploder(var_19d0b0e2[0]);
    wait 0.5;
    level.var_49f26c00.var_1266bfca function_523d7d8b(localclientnum, "mixer_02_bath_fluid_fx_jnt", var_7953f5b8);
    level.var_49f26c00.var_1266bfca function_9b8f7969(var_35bcf6f0);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_fill_finish");
    exploder::exploder(var_19d0b0e2[1]);
    wait 0.5;
    level.var_49f26c00.var_ffa61a49 function_523d7d8b(localclientnum, "mixer_03_bath_fluid_fx_jnt", var_6b14d93a);
    level.var_49f26c00.var_ffa61a49 function_9b8f7969(var_237e5273);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_fill_finish");
    exploder::exploder(var_19d0b0e2[2]);
    wait 0.75;
    level util::delay(0.25, #"laboratory_closed", &scene::play, #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_drain");
    level util::delay(0.5, #"laboratory_closed", &scene::play, #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_drain");
    level util::delay(0.75, #"laboratory_closed", &scene::play, #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_drain");
    exploder::stop_exploder(var_19d0b0e2[0]);
    exploder::stop_exploder(var_19d0b0e2[1]);
    exploder::stop_exploder(var_19d0b0e2[2]);
    wait 1;
    level flag::set(#"hash_4f26b4e33ddb3509");
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0xb5a57a9f, Offset: 0x41d8
// Size: 0x174
function function_523d7d8b(localclientnum, str_tag, var_4deff3fa) {
    switch (var_4deff3fa) {
    case 0:
        str_fx = level._effect[#"hash_f4b99c36c8b7232"];
        break;
    case 3:
        str_fx = level._effect[#"hash_8a44ebbb924768a"];
        break;
    case 2:
        str_fx = level._effect[#"hash_78125560468f4188"];
        break;
    case 1:
        str_fx = level._effect[#"hash_2be8010ec8776feb"];
        break;
    case 4:
        str_fx = level._effect[#"hash_4dd3ac60cbb0f8ab"];
        break;
    }
    if (isdefined(self.var_9270c414)) {
        killfx(localclientnum, self.var_9270c414);
        self.var_9270c414 = undefined;
    }
    util::playfxontag(localclientnum, str_fx, self, str_tag);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x2d45239a, Offset: 0x4358
// Size: 0x18e
function function_15ff01e1(localclientnum) {
    if (isdefined(level.var_49f26c00.var_53ec42bc) && isdefined(level.var_49f26c00.var_53ec42bc.var_9270c414)) {
        killfx(localclientnum, level.var_49f26c00.var_53ec42bc.var_9270c414);
        level.var_49f26c00.var_53ec42bc.var_9270c414 = undefined;
    }
    if (isdefined(level.var_49f26c00.var_1266bfca) && isdefined(level.var_49f26c00.var_1266bfca.var_9270c414)) {
        killfx(localclientnum, level.var_49f26c00.var_1266bfca.var_9270c414);
        level.var_49f26c00.var_1266bfca.var_9270c414 = undefined;
    }
    if (isdefined(level.var_49f26c00.var_ffa61a49) && isdefined(level.var_49f26c00.var_ffa61a49.var_9270c414)) {
        killfx(localclientnum, level.var_49f26c00.var_ffa61a49.var_9270c414);
        level.var_49f26c00.var_ffa61a49.var_9270c414 = undefined;
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0x19306537, Offset: 0x44f0
// Size: 0x736
function function_c8a51052(var_469e104d, var_7953f5b8, var_6b14d93a) {
    var_e7c55810 = [];
    switch (var_469e104d) {
    case 0:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_717e1afd73da3354";
        break;
    case 1:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_393d79b419d6f0fd";
        break;
    case 2:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_1abf5d309a03194a";
        break;
    case 3:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_6b9491f4ad3c1ca8";
        break;
    case 4:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_5a247b32bd11e4b5";
        break;
    default:
        break;
    }
    switch (var_7953f5b8) {
    case 0:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_4c8a53a6839f8eb3";
        break;
    case 1:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_d2202a98801defa";
        break;
    case 2:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_6e48468b75e04d0f";
        break;
    case 3:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_3073fd5cf35ba3db";
        break;
    case 4:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_522ce90755def5c";
        break;
    default:
        break;
    }
    switch (var_6b14d93a) {
    case 0:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_e78641f732d632";
        break;
    case 1:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_302da2442ad433eb";
        break;
    case 2:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_6144961435970d88";
        break;
    case 3:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_ce9eff11b813a8a";
        break;
    case 4:
        if (!isdefined(var_e7c55810)) {
            var_e7c55810 = [];
        } else if (!isarray(var_e7c55810)) {
            var_e7c55810 = array(var_e7c55810);
        }
        var_e7c55810[var_e7c55810.size] = #"hash_6ce89a16ef5204ab";
        break;
    default:
        break;
    }
    return var_e7c55810;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 0, eflags: 0x1 linked
// Checksum 0x99b23f81, Offset: 0x4c30
// Size: 0x244
function function_a9d89e09() {
    exploder::kill_exploder(#"hash_4948b7cb25b14ca7");
    exploder::kill_exploder(#"hash_4948b8cb25b14e5a");
    exploder::kill_exploder(#"hash_4948b9cb25b1500d");
    exploder::kill_exploder(#"hash_717e1afd73da3354");
    exploder::kill_exploder(#"hash_393d79b419d6f0fd");
    exploder::kill_exploder(#"hash_1abf5d309a03194a");
    exploder::kill_exploder(#"hash_6b9491f4ad3c1ca8");
    exploder::kill_exploder(#"hash_5a247b32bd11e4b5");
    exploder::kill_exploder(#"hash_4c8a53a6839f8eb3");
    exploder::kill_exploder(#"hash_d2202a98801defa");
    exploder::kill_exploder(#"hash_6e48468b75e04d0f");
    exploder::kill_exploder(#"hash_3073fd5cf35ba3db");
    exploder::kill_exploder(#"hash_522ce90755def5c");
    exploder::kill_exploder(#"hash_e78641f732d632");
    exploder::kill_exploder(#"hash_302da2442ad433eb");
    exploder::kill_exploder(#"hash_6144961435970d88");
    exploder::kill_exploder(#"hash_ce9eff11b813a8a");
    exploder::kill_exploder(#"hash_6ce89a16ef5204ab");
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xf699eb28, Offset: 0x4e80
// Size: 0x20a
function function_b760318d(var_74f4f287 = 2) {
    switch (var_74f4f287) {
    case 0:
        exploder::stop_exploder(#"hash_3d62d8429eda7886");
        exploder::stop_exploder(#"hash_1d282b1d0662da73");
        exploder::stop_exploder(#"hash_4a6a466efb7795c9");
        break;
    case 1:
        exploder::stop_exploder(#"hash_3d62d8429eda7886");
        exploder::stop_exploder(#"hash_1d282b1d0662da73");
        exploder::exploder(#"hash_4a6a466efb7795c9");
        break;
    case 2:
        exploder::stop_exploder(#"hash_4a6a466efb7795c9");
        exploder::stop_exploder(#"hash_1d282b1d0662da73");
        exploder::exploder(#"hash_3d62d8429eda7886");
        break;
    case 3:
        exploder::stop_exploder(#"hash_3d62d8429eda7886");
        exploder::stop_exploder(#"hash_4a6a466efb7795c9");
        exploder::exploder(#"hash_1d282b1d0662da73");
        break;
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x5a1dfffb, Offset: 0x5098
// Size: 0x1bc
function function_d160164e(str_notify) {
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_centrifuge_fluid_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", 1);
    function_b760318d(0);
    level.var_32f68719 = undefined;
    level.var_ee871019 = undefined;
    if (isdefined(level.var_49f26c00.var_42c70173)) {
        level scene::stop(level.var_49f26c00.var_42c70173, 1);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x1 linked
// Checksum 0x23271ff4, Offset: 0x5260
// Size: 0x336
function function_a1547af3(localclientnum, var_4379f16, var_34c8df6b, var_d5a65f15) {
    self notify("8ada09c39754eed");
    self endon("8ada09c39754eed");
    mdl_wheel = getent(localclientnum, "alchemy_wheel", "targetname");
    if (var_4379f16 > var_34c8df6b) {
        playsound(localclientnum, #"hash_44c48638340201d2", mdl_wheel.origin);
    } else {
        playsound(localclientnum, #"hash_378f37a553812013", mdl_wheel.origin);
    }
    var_10291968 = [];
    var_10291968[1] = (0, 145.323, 45);
    var_10291968[2] = (15.36, 129.378, 42.836);
    var_10291968[3] = (35.8885, 98.9697, 29.2134);
    var_10291968[4] = (44.9988, 55.3204, -0.000269556);
    var_10291968[5] = (38.6317, 18.3791, -25.1482);
    var_10291968[6] = (9.84793, 335.318, -44.1345);
    var_10291968[7] = (340.611, 304.713, -41.4406);
    var_10291968[8] = (315.865, 249.318, -9.84792);
    var_10291968[9] = (331.762, 177.801, 36.618);
    var_10291968[10] = (348.761, 156.779, 43.8685);
    mdl_wheel.angles = var_10291968[var_34c8df6b];
    if (var_4379f16 > var_34c8df6b) {
        for (var_5d4a7cdb = var_34c8df6b; var_5d4a7cdb < var_4379f16; var_5d4a7cdb++) {
            mdl_wheel rotateto(var_10291968[var_5d4a7cdb + 1], 0.2);
            mdl_wheel waittill(#"rotatedone");
        }
        return;
    }
    for (var_5d4a7cdb = var_34c8df6b; var_5d4a7cdb > var_4379f16; var_5d4a7cdb--) {
        mdl_wheel rotateto(var_10291968[var_5d4a7cdb - 1], 0.1);
        mdl_wheel waittill(#"rotatedone");
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x1 linked
// Checksum 0x78173ba6, Offset: 0x55a0
// Size: 0x57c
function function_7ee5e3a2(localclientnum, var_367ac609, var_509eb1e5, b_debug = 0) {
    self notify("6f8c1467ad43f7b7");
    self endon("6f8c1467ad43f7b7");
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
    if (isdefined(level.var_49f26c00.var_42c70173)) {
        level scene::stop(level.var_49f26c00.var_42c70173, 1);
        wait 0.1;
    }
    var_80ff7445 = var_509eb1e5 - level.var_49f26c00.var_9af0d684;
    if (var_80ff7445 > 0) {
        level thread function_a1547af3(localclientnum, var_509eb1e5, level.var_49f26c00.var_9af0d684, -20 * abs(var_80ff7445));
    } else if (var_80ff7445 < 0) {
        level thread function_a1547af3(localclientnum, var_509eb1e5, level.var_49f26c00.var_9af0d684, 20 * abs(var_80ff7445));
    }
    level.var_49f26c00.var_8a28a9a = var_367ac609;
    level.var_49f26c00.var_9af0d684 = var_509eb1e5;
    level.var_49f26c00.var_3e14626f = "cent_show_" + var_367ac609;
    switch (var_509eb1e5) {
    case 1:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_01_to_03_bundle";
        level.var_49f26c00.var_febe408a = "state1";
        break;
    case 2:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_01_to_03_bundle";
        level.var_49f26c00.var_febe408a = "state2";
        break;
    case 3:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_01_to_03_bundle";
        level.var_49f26c00.var_febe408a = "state3";
        break;
    case 4:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_04_to_06_bundle";
        level.var_49f26c00.var_febe408a = "state4";
        break;
    case 5:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_04_to_06_bundle";
        level.var_49f26c00.var_febe408a = "state5";
        break;
    case 6:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_04_to_06_bundle";
        level.var_49f26c00.var_febe408a = "state6";
        break;
    case 7:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_07_to_09_bundle";
        level.var_49f26c00.var_febe408a = "state7";
        break;
    case 8:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_07_to_09_bundle";
        level.var_49f26c00.var_febe408a = "state8";
        break;
    case 9:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_07_to_09_bundle";
        level.var_49f26c00.var_febe408a = "state9";
        break;
    case 10:
        level.var_49f26c00.var_42c70173 = #"p8_fxanim_core_frontend_zm_lab_flask_globs_10_bundle";
        level.var_49f26c00.var_febe408a = "state10";
        break;
    }
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle", level.var_49f26c00.var_3e14626f);
    level thread scene::play(level.var_49f26c00.var_42c70173, level.var_49f26c00.var_febe408a + "_idle");
    if (math::cointoss()) {
        level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_tease");
    }
    /#
        level thread function_66051772();
    #/
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xa0f26f54, Offset: 0x5b28
// Size: 0x46
function function_e10fba77(var_6c02358e) {
    level.var_49f26c00.var_3e14626f = "cent_spin_" + level.var_49f26c00.var_8a28a9a;
    return level.var_49f26c00.var_3e14626f;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xe61431f8, Offset: 0x5b78
// Size: 0x2ba
function function_6198ffc(var_a77705eb = 1, b_reverse = 0) {
    switch (var_a77705eb) {
    case 1:
        if (b_reverse) {
            level.var_49f26c00.var_b273f2b6 setmodel(#"p8_zm_lab_tube_01_liquid_01_reverse");
        } else {
            level.var_49f26c00.var_b273f2b6 setmodel(#"p8_zm_lab_tube_01_liquid_01");
        }
        break;
    case 2:
        if (b_reverse) {
            level.var_49f26c00.var_c6761aa2 setmodel(#"hash_1d6b60d588392994");
        } else {
            level.var_49f26c00.var_c6761aa2 setmodel(#"hash_147375b2a9795cd1");
        }
        break;
    case 3:
        if (b_reverse) {
            level.var_49f26c00.var_dcbe4732 setmodel(#"hash_7d73f1bee7a7209");
        } else {
            level.var_49f26c00.var_dcbe4732 setmodel(#"hash_789fccb680d65004");
        }
        break;
    case 4:
        if (b_reverse) {
            level.var_49f26c00.var_f48ac46 setmodel(#"hash_17fe752ca47c080a");
        } else {
            level.var_49f26c00.var_f48ac46 setmodel(#"hash_46ef488f583997fb");
        }
        break;
    case 5:
        if (b_reverse) {
            level.var_49f26c00.var_13123ed2 = #"hash_3a6d60badb3dae03";
        } else {
            level.var_49f26c00.var_13123ed2 = #"hash_513a13fb9a123f22";
        }
        break;
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 0, eflags: 0x1 linked
// Checksum 0x140fe0e1, Offset: 0x5e40
// Size: 0x46
function function_9dee7481() {
    level.var_49f26c00.var_6138b381 = undefined;
    level.var_49f26c00.var_887781fe = undefined;
    level.var_49f26c00.var_84c77a9e = undefined;
    level.var_49f26c00.var_f6e518bb = undefined;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x9c5af2cd, Offset: 0x5e90
// Size: 0x6e4
function function_49dde74(b_stream = 1, var_dd5c339d = 0) {
    level endon(#"hash_490aea66046d4a50");
    if (b_stream) {
        forcestreambundle(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
        forcestreambundle(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle");
        forcestreambundle(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle");
        forcestreambundle(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle");
        forcestreambundle(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle");
        forcestreamxmodel(#"p8_zm_lab_tube_01_liquid_01");
        forcestreamxmodel(#"p8_zm_lab_tube_01_liquid_01_reverse");
        forcestreamxmodel(#"hash_147375b2a9795cd1");
        forcestreamxmodel(#"hash_1d6b60d588392994");
        forcestreamxmodel(#"hash_789fccb680d65004");
        forcestreamxmodel(#"hash_7d73f1bee7a7209");
        forcestreamxmodel(#"hash_46ef488f583997fb");
        forcestreamxmodel(#"hash_17fe752ca47c080a");
        forcestreamxmodel(#"hash_4d36008189f01e3e");
        forcestreamxmodel(#"hash_4cbeb6f9fd0e1277");
        forcestreamxmodel(#"p8_zm_lab_talisman_press_mould_base");
        forcestreamxmodel(#"p8_zm_lab_talisman_press_mould_lid_common");
        forcestreamxmodel(#"p8_zm_lab_talisman_press_mould_lid_rare");
        forcestreamxmodel(#"p8_zm_lab_talisman_press_mould_lid_legendary");
        forcestreamxmodel(#"p8_zm_lab_talisman_press_mould_lid_epic");
        forcestreamxmodel(#"hash_21facc9d2f29d94c");
        forcestreamxmodel(#"p8_zm_lab_talisman_press_mould_lid_common_empty");
        forcestreamxmodel(#"hash_28a2c4e744e4658c");
        forcestreamxmodel(#"hash_15aeae3ca1622031");
        forcestreamxmodel(#"hash_22c3a62824ed796d");
        forcestreamxmodel(#"hash_150da5db728463e2");
        if (var_dd5c339d) {
        }
        return;
    }
    function_66b6e720(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
    function_66b6e720(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle");
    function_66b6e720(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle");
    function_66b6e720(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle");
    function_66b6e720(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle");
    stopforcestreamingxmodel(#"p8_zm_lab_tube_01_liquid_01");
    stopforcestreamingxmodel(#"p8_zm_lab_tube_01_liquid_01_reverse");
    stopforcestreamingxmodel(#"hash_147375b2a9795cd1");
    stopforcestreamingxmodel(#"hash_1d6b60d588392994");
    stopforcestreamingxmodel(#"hash_789fccb680d65004");
    stopforcestreamingxmodel(#"hash_7d73f1bee7a7209");
    stopforcestreamingxmodel(#"hash_46ef488f583997fb");
    stopforcestreamingxmodel(#"hash_17fe752ca47c080a");
    stopforcestreamingxmodel(#"hash_4d36008189f01e3e");
    stopforcestreamingxmodel(#"hash_4cbeb6f9fd0e1277");
    stopforcestreamingxmodel(#"p8_zm_lab_talisman_press_mould_base");
    stopforcestreamingxmodel(#"p8_zm_lab_talisman_press_mould_lid_common");
    stopforcestreamingxmodel(#"p8_zm_lab_talisman_press_mould_lid_rare");
    stopforcestreamingxmodel(#"p8_zm_lab_talisman_press_mould_lid_legendary");
    stopforcestreamingxmodel(#"p8_zm_lab_talisman_press_mould_lid_epic");
    stopforcestreamingxmodel(#"hash_21facc9d2f29d94c");
    stopforcestreamingxmodel(#"p8_zm_lab_talisman_press_mould_lid_common_empty");
    stopforcestreamingxmodel(#"hash_28a2c4e744e4658c");
    stopforcestreamingxmodel(#"hash_15aeae3ca1622031");
    stopforcestreamingxmodel(#"hash_22c3a62824ed796d");
    stopforcestreamingxmodel(#"hash_150da5db728463e2");
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x8844e6b6, Offset: 0x6580
// Size: 0x1f4
function function_a8188266(var_540e83c = 1, var_6b7f299d = 0.5) {
    if (var_540e83c) {
        function_6198ffc(2, 0);
        function_6198ffc(3, 0);
        function_6198ffc(4, 0);
        level.var_49f26c00.var_c6761aa2 thread function_b05ea28d(undefined, undefined, var_6b7f299d, #"randomize");
        level.var_49f26c00.var_dcbe4732 thread function_b05ea28d(undefined, undefined, var_6b7f299d, #"randomize");
        level.var_49f26c00.var_f48ac46 thread function_b05ea28d(undefined, undefined, var_6b7f299d, #"randomize");
        return;
    }
    function_6198ffc(2, 1);
    function_6198ffc(3, 1);
    function_6198ffc(4, 1);
    level.var_49f26c00.var_c6761aa2 thread function_b05ea28d(undefined, 1, var_6b7f299d);
    level.var_49f26c00.var_dcbe4732 thread function_b05ea28d(undefined, 1, var_6b7f299d);
    level.var_49f26c00.var_f48ac46 thread function_b05ea28d(undefined, 1, var_6b7f299d);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x0
// Checksum 0x92b41c2d, Offset: 0x6780
// Size: 0x282
function function_f2b7b9b4(n_index, var_540e83c = 1, var_6b7f299d = 0.5, str_color = #"randomize") {
    switch (n_index) {
    case 2:
        if (var_540e83c) {
            function_6198ffc(2, 0);
            level.var_49f26c00.var_c6761aa2 thread function_b05ea28d(undefined, undefined, var_6b7f299d, str_color);
        } else {
            function_6198ffc(2, 1);
            level.var_49f26c00.var_c6761aa2 thread function_b05ea28d(undefined, 1, var_6b7f299d);
        }
        break;
    case 3:
        if (var_540e83c) {
            function_6198ffc(3, 0);
            level.var_49f26c00.var_dcbe4732 thread function_b05ea28d(undefined, undefined, var_6b7f299d, str_color);
        } else {
            function_6198ffc(3, 1);
            level.var_49f26c00.var_dcbe4732 thread function_b05ea28d(undefined, 1, var_6b7f299d);
        }
        break;
    case 4:
        if (var_540e83c) {
            function_6198ffc(4, 0);
            level.var_49f26c00.var_f48ac46 thread function_b05ea28d(undefined, undefined, var_6b7f299d, str_color);
        } else {
            function_6198ffc(4, 1);
            level.var_49f26c00.var_f48ac46 thread function_b05ea28d(undefined, 1, var_6b7f299d);
        }
        break;
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xfad6d460, Offset: 0x6a10
// Size: 0x16c
function function_9c935526(localclientnum) {
    level.var_ee871019 = 1;
    level flag::set(#"laboratory_activated");
    level flag::clear(#"hash_71fc63117cc5bf06" + 1);
    level flag::clear(#"hash_71fc63117cc5bf06" + 2);
    level flag::clear(#"hash_71fc63117cc5bf06" + 3);
    level flag::clear(#"hash_c5112e5b6ad4e15");
    level flag::clear(#"hash_4f26b4e33ddb3509");
    function_b3efb400(0);
    function_9dee7481();
    level flag::clear(#"hash_511b4468376ea105");
    function_a8f6e36c(localclientnum, 2);
    function_b760318d(2);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xccdfa64b, Offset: 0x6b88
// Size: 0xd54
function function_365bef4(localclientnum, b_debug = 0) {
    level endon(array(#"laboratory_closed", #"hash_1d604ddf352ddcca"));
    function_9c935526();
    level flag::clear(#"hash_4bbc47f6a0a31743");
    s_cam = struct::get(#"tag_align_zm_lab");
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_lab_in", 0, "", "", s_cam.origin, s_cam.angles);
    playsound(localclientnum, #"hash_3e1e95a35dedc6bc");
    level thread scene::play(level.var_49f26c00.var_42c70173, level.var_49f26c00.var_febe408a + "_exit");
    wait 0.5;
    function_6198ffc(1, 0);
    level.var_49f26c00.var_b273f2b6 thread function_b05ea28d(undefined, undefined, 0.5);
    level thread util::delay(0.5, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_flask_tube_fluid_bundle", "fill");
    level thread util::delay(#"flask_fluid_hits_centrifuge", array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_centrifuge_fluid_bundle", "fill");
    level util::delay(0.5 + 1, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &function_6198ffc, 1, 1);
    level.var_49f26c00.var_b273f2b6 util::delay(0.5 + 1, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &function_b05ea28d, undefined, 1, 1);
    level thread util::delay(0.5 + 1 + 1, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_flask_tube_fluid_bundle", "finish");
    str_shot = function_e10fba77(level.var_49f26c00.var_3e14626f);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle", str_shot);
    level waittill(#"centrifuge_fluid_to_mixer");
    function_a8188266(1, 1);
    var_ceb7615a = max(1 - 0.4, 0);
    level thread util::delay(var_ceb7615a, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_activate");
    level thread util::delay(var_ceb7615a + 0.2, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_activate");
    level thread util::delay(var_ceb7615a + 0.4, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_activate");
    level waittill(#"centrifuge_fluid_filled");
    wait 1;
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_centrifuge_fluid_bundle", "drain");
    level waittill(#"centrifuge_fluid_drained");
    function_a8188266(0, 2);
    var_fc9cafb5 = gettime();
    if (!level flag::get(#"hash_511b4468376ea105") && !b_debug) {
        waitresult = level waittilltimeout(10, #"hash_511b4468376ea105");
        if (waitresult._notify == #"timeout") {
            function_205528f5(localclientnum);
            return;
        }
    } else {
        /#
            if (b_debug) {
                level.var_49f26c00.var_6138b381 = array::random(array::exclude(level.var_49f26c00.var_557a03e6, level.var_49f26c00.var_6138b381));
                level.var_49f26c00.var_887781fe = array::random(array::exclude(level.var_49f26c00.var_557a03e6, array(level.var_49f26c00.var_6138b381)));
                level.var_49f26c00.var_84c77a9e = array::random(array::exclude(level.var_49f26c00.var_557a03e6, array(level.var_49f26c00.var_6138b381, level.var_49f26c00.var_887781fe)));
                level.var_49f26c00.var_f6e518bb = array::random(level.var_49f26c00.a_str_talismans);
                if (math::cointoss()) {
                    level.var_49f26c00.var_f6e518bb = undefined;
                }
            }
        #/
    }
    var_68636981 = gettime();
    var_fbd388ca = float(var_68636981 - var_fc9cafb5) / 1000;
    if (var_fbd388ca < 1.5) {
        wait 1.5 - var_fbd388ca;
    }
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        function_b760318d(3);
        level flag::clear(#"hash_c5112e5b6ad4e15");
        level util::delay(2, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_create");
    } else {
        function_b760318d(1);
        level util::delay(2, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_no_create");
        level flag::set(#"hash_c5112e5b6ad4e15");
    }
    level thread function_c7117688(localclientnum);
    level flag::wait_till(#"hash_4f26b4e33ddb3509");
    function_b3efb400(0);
    level thread function_ce974bbe(localclientnum, 0);
    level thread function_f76d78f5(localclientnum, 0);
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_bottle_dof", 500, "", "", s_cam.origin, s_cam.angles);
    function_8192c9cf(localclientnum, 0);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", "enter");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", "enter");
    level flag::wait_till_all(array(#"hash_71fc63117cc5bf06" + 1, #"hash_71fc63117cc5bf06" + 2, #"hash_71fc63117cc5bf06" + 3, #"hash_c5112e5b6ad4e15"));
    function_a8f6e36c(localclientnum, 3);
    function_a8f6e36c(localclientnum, 4);
    if (b_debug) {
        wait 3;
    } else {
        waitresult = level waittill(#"mix_again");
    }
    if (isdefined(level.var_49f26c00.var_42c70173)) {
        level scene::stop(level.var_49f26c00.var_42c70173, 1);
    }
    if (!b_debug && isdefined(waitresult.param1) && waitresult.param1 == #"1") {
        function_a8f6e36c(localclientnum, 5);
        level thread function_254a0f6d(localclientnum);
        return;
    }
    function_8ab548f5(localclientnum);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x714f3d3e, Offset: 0x78e8
// Size: 0x3a6
function function_205528f5(localclientnum) {
    level notify(#"reward_timeout");
    level endon(#"laboratory_closed");
    if (isdefined(level.var_49f26c00.controller_model)) {
        var_327f3c7b = createuimodel(level.var_49f26c00.controller_model, "Laboratory.timedOut");
        if (getuimodelvalue(var_327f3c7b) !== 1) {
            setuimodelvalue(var_327f3c7b, 1);
        } else {
            forcenotifyuimodel(createuimodel(level.var_49f26c00.controller_model, "Laboratory.timedOut"));
        }
    }
    s_cam = struct::get(#"tag_align_zm_lab");
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_centrifuge_fluid_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", 1);
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle");
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle");
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle");
    level thread function_3dd68dd9(localclientnum, #"hash_6551ceddc995b613");
    level waittill(#"hash_6551ceddc995b613");
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_lab_out", 0, "", "", s_cam.origin, s_cam.angles);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_idle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_idle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_idle");
    function_9dee7481();
    function_a9d89e09();
    function_15ff01e1(localclientnum);
    function_b760318d(2);
    function_a8f6e36c(localclientnum, 0);
    level.var_ee871019 = undefined;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xcd84267f, Offset: 0x7c98
// Size: 0x6f4
function function_4053acdb(localclientnum) {
    level endon(#"laboratory_closed");
    s_cam = struct::get(#"tag_align_zm_lab");
    /#
        level thread function_66051772();
    #/
    function_b3efb400(0);
    level notify(#"hash_333aed9939c9fe17");
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_centrifuge_bundle");
    level scene::stop(#"p8_fxanim_core_frontend_zm_lab_centrifuge_fluid_bundle", 1);
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle");
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle");
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle");
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle");
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle");
    level scene::cancel(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle");
    function_15ff01e1(localclientnum);
    function_a9d89e09();
    function_a8188266(0, 0);
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        level thread function_3dd68dd9(localclientnum, 0.5);
        function_b760318d(3);
        level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_create");
        wait 1.25;
    } else {
        function_b760318d(1);
        level thread function_3dd68dd9(localclientnum, 0.5);
        level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_no_create");
    }
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", "enter");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", "enter");
    var_469e104d = function_18d7cd9b(localclientnum, 1);
    var_7953f5b8 = function_18d7cd9b(localclientnum, 2);
    var_6b14d93a = function_18d7cd9b(localclientnum, 3);
    var_bc9784a7 = function_879fc3ee(var_469e104d);
    var_35bcf6f0 = function_879fc3ee(var_7953f5b8);
    var_237e5273 = function_879fc3ee(var_6b14d93a);
    level.var_49f26c00.var_53ec42bc function_9b8f7969(var_bc9784a7);
    level.var_49f26c00.var_1266bfca function_9b8f7969(var_35bcf6f0);
    level.var_49f26c00.var_ffa61a49 function_9b8f7969(var_237e5273);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_drain");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_drain");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_drain");
    level thread function_ce974bbe(localclientnum, 0);
    level thread function_f76d78f5(localclientnum, 0);
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_bottle_dof", 0, "", "", s_cam.origin, s_cam.angles);
    function_8192c9cf(localclientnum, 0);
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        level waittill(#"talisman_show_label");
        wait 1;
    } else {
        level waittill(#"bottle3_start_fill");
        wait 1;
    }
    function_a8f6e36c(localclientnum, 3);
    function_a8f6e36c(localclientnum, 4);
    if (isdefined(level.var_49f26c00.var_42c70173)) {
        level scene::stop(level.var_49f26c00.var_42c70173, 1);
    }
    waitresult = level waittill(#"mix_again");
    if (isdefined(waitresult.param1) && waitresult.param1 == #"1") {
        function_a8f6e36c(localclientnum, 5);
        level thread function_254a0f6d(localclientnum);
        return;
    }
    function_f0252f42(localclientnum);
    function_8ab548f5(localclientnum);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x7427ba4a, Offset: 0x8398
// Size: 0x12c
function function_3dd68dd9(localclientnum, var_8bad1c0 = 1) {
    playsound(localclientnum, #"hash_7ca34384c7d609e0");
    frontend::toggle_postfx(localclientnum, 1, #"hash_2d04a3877a927be7");
    if (ishash(var_8bad1c0) || isstring(var_8bad1c0)) {
        exploder::exploder(#"hash_c283a50c0359875");
        level waittill(var_8bad1c0, #"laboratory_closed");
        exploder::stop_exploder(#"hash_c283a50c0359875");
        return;
    }
    exploder::exploder_duration(#"hash_c283a50c0359875", var_8bad1c0);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xf885cd21, Offset: 0x84d0
// Size: 0x6d4
function function_254a0f6d(localclientnum) {
    level endon(array(#"laboratory_closed", #"hash_1d604ddf352ddcca"));
    level flag::set(#"hash_4bbc47f6a0a31743");
    /#
        level thread function_66051772();
    #/
    s_cam = struct::get(#"tag_align_zm_lab");
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        level util::delay(0.25, #"laboratory_closed", &scene::play, #"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "exit");
    }
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", "exit");
    level scene::play(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", "exit");
    level flag::clear(#"laboratory_activated");
    level thread function_ce974bbe(localclientnum, 1);
    level thread function_f76d78f5(localclientnum, 1);
    function_9c935526();
    var_fc9cafb5 = gettime();
    if (!level flag::get(#"hash_511b4468376ea105")) {
        waitresult = level waittilltimeout(10, #"hash_511b4468376ea105");
        if (waitresult._notify == #"timeout") {
            function_205528f5(localclientnum);
            level flag::clear(#"hash_4bbc47f6a0a31743");
            return;
        }
    }
    var_68636981 = gettime();
    var_fbd388ca = float(var_68636981 - var_fc9cafb5) / 1000;
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        function_b3efb400(0);
        function_b760318d(3);
        level flag::clear(#"hash_c5112e5b6ad4e15");
        level util::delay(0, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_create");
    } else {
        function_b760318d(1);
        level util::delay(0, array(#"laboratory_closed", #"hash_1d604ddf352ddcca"), &scene::play, #"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "press_no_create");
        level flag::set(#"hash_c5112e5b6ad4e15");
    }
    wait 1.5;
    level thread function_ce974bbe(localclientnum, 0);
    level thread function_f76d78f5(localclientnum, 0);
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_bottle_dof", 500, "", "", s_cam.origin, s_cam.angles);
    function_8192c9cf(localclientnum, 0);
    function_b3efb400(0);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", "enter");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", "enter");
    level flag::wait_till_all(array(#"hash_71fc63117cc5bf06" + 1, #"hash_71fc63117cc5bf06" + 2, #"hash_71fc63117cc5bf06" + 3, #"hash_c5112e5b6ad4e15"));
    function_a8f6e36c(localclientnum, 3);
    function_a8f6e36c(localclientnum, 4);
    waitresult = level waittill(#"mix_again");
    if (isdefined(level.var_49f26c00.var_42c70173)) {
        level scene::stop(level.var_49f26c00.var_42c70173, 1);
    }
    function_a8f6e36c(localclientnum, 5);
    if (isdefined(waitresult.param1) && waitresult.param1 == #"1") {
        level thread function_254a0f6d(localclientnum);
        return;
    }
    level flag::clear(#"hash_4bbc47f6a0a31743");
    function_8ab548f5(localclientnum);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x11c50feb, Offset: 0x8bb0
// Size: 0x274
function function_8ab548f5(localclientnum) {
    level.var_ee871019 = undefined;
    s_cam = struct::get(#"tag_align_zm_lab");
    function_a8f6e36c(localclientnum, 6);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle", "exit");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_bottles_bundle", "exit");
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        level util::delay(0.25, #"laboratory_closed", &scene::play, #"p8_fxanim_core_frontend_zm_lab_talisman_press_bundle", "exit");
    }
    function_9dee7481();
    wait 1;
    level thread function_ce974bbe(localclientnum, 1);
    level thread function_f76d78f5(localclientnum, 1);
    playmaincamxcam(localclientnum, "ui_scene_cam_zm_lab_out", 0, "", "", s_cam.origin, s_cam.angles);
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle", "mixer_idle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle", "mixer_idle");
    level thread scene::play(#"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle", "mixer_idle");
    function_a8f6e36c(localclientnum, 0);
    level flag::clear(#"laboratory_activated");
    function_b760318d(2);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x5 linked
// Checksum 0x8dadefd7, Offset: 0x8e30
// Size: 0x186
function private function_ce974bbe(localclientnum, b_reverse = 0, var_74431a2d = 1, var_bbd5069f = 1) {
    var_8fc81e63 = gettime();
    n_time_end = gettime() + int(var_74431a2d * 1000);
    n_timer = 0;
    while (true) {
        n_timer = gettime();
        if (n_timer >= n_time_end) {
            if (b_reverse) {
                function_92ece6a3(localclientnum, var_bbd5069f, 0);
            } else {
                function_92ece6a3(localclientnum, var_bbd5069f, 1);
            }
            break;
        } else {
            var_c4a2db58 = mapfloat(var_8fc81e63, n_time_end, 0, 1, n_timer);
            if (b_reverse) {
                function_92ece6a3(localclientnum, var_bbd5069f, 1 - var_c4a2db58);
            } else {
                function_92ece6a3(localclientnum, var_bbd5069f, var_c4a2db58);
            }
        }
        waitframe(1);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x5 linked
// Checksum 0x9c687780, Offset: 0x8fc0
// Size: 0x186
function private function_f76d78f5(localclientnum, b_reverse = 0, var_74431a2d = 1, var_5248b6df = 1) {
    var_8fc81e63 = gettime();
    n_time_end = gettime() + int(var_74431a2d * 1000);
    n_timer = 0;
    while (true) {
        n_timer = gettime();
        if (n_timer >= n_time_end) {
            if (b_reverse) {
                function_b5268a2c(localclientnum, var_5248b6df, 0);
            } else {
                function_b5268a2c(localclientnum, var_5248b6df, 1);
            }
            break;
        } else {
            var_9241fd03 = mapfloat(var_8fc81e63, n_time_end, 0, 1, n_timer);
            if (b_reverse) {
                function_b5268a2c(localclientnum, var_5248b6df, 1 - var_9241fd03);
            } else {
                function_b5268a2c(localclientnum, var_5248b6df, var_9241fd03);
            }
        }
        waitframe(1);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x96c3e0e5, Offset: 0x9150
// Size: 0x134
function function_f8d486f8(localclientnum, a_ents) {
    if (!isdefined(a_ents[#"talisman"].var_850f1956)) {
        a_ents[#"talisman"].var_850f1956 = util::spawn_model(localclientnum, #"p8_zm_lab_talisman_press_mould_lid_common", a_ents[#"talisman"] gettagorigin("mould_jnt"), a_ents[#"talisman"] gettagangles("mould_jnt"));
        if (isdefined(a_ents[#"talisman"].var_850f1956)) {
            a_ents[#"talisman"].var_850f1956 linkto(a_ents[#"talisman"], "mould_jnt");
        }
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xeff3c7a9, Offset: 0x9290
// Size: 0x724
function function_d4f9b895(localclientnum, a_ents) {
    level endon(#"laboratory_closed");
    if (isdefined(a_ents[#"talisman"].var_a27a4e60)) {
        a_ents[#"talisman"].var_a27a4e60 unlink();
        a_ents[#"talisman"].var_a27a4e60 delete();
        a_ents[#"talisman"].var_a27a4e60 = undefined;
    }
    if (isdefined(a_ents[#"talisman"].var_26cb3da7)) {
        a_ents[#"talisman"].var_26cb3da7 unlink();
        a_ents[#"talisman"].var_26cb3da7 delete();
        a_ents[#"talisman"].var_26cb3da7 = undefined;
    }
    a_ents[#"talisman"].var_a27a4e60 = util::spawn_model(localclientnum, "tag_origin", a_ents[#"talisman"] gettagorigin("link_talisman_ui_large_jnt"), a_ents[#"talisman"] gettagangles("link_talisman_ui_large_jnt"));
    a_ents[#"talisman"].var_26cb3da7 = util::spawn_model(localclientnum, "tag_origin", a_ents[#"talisman"] gettagorigin("link_talisman_ui_small_jnt"), a_ents[#"talisman"] gettagangles("link_talisman_ui_small_jnt"));
    if (isdefined(a_ents[#"talisman"].var_a27a4e60)) {
        a_ents[#"talisman"].var_a27a4e60 setscale(0.8);
        a_ents[#"talisman"].var_a27a4e60 linkto(a_ents[#"talisman"], "link_talisman_ui_large_jnt");
    }
    if (isdefined(a_ents[#"talisman"].var_26cb3da7)) {
        a_ents[#"talisman"].var_26cb3da7 setscale(0.5);
        a_ents[#"talisman"].var_26cb3da7 linkto(a_ents[#"talisman"], "link_talisman_ui_small_jnt");
    }
    if (isdefined(level.var_49f26c00.var_f6e518bb)) {
        if (isdefined(a_ents[#"talisman"].var_a27a4e60)) {
            a_ents[#"talisman"].var_a27a4e60 setmodel(level.var_49f26c00.var_f6e518bb);
        }
        if (isdefined(a_ents[#"talisman"].var_26cb3da7)) {
            a_ents[#"talisman"].var_26cb3da7 setmodel(level.var_49f26c00.var_f6e518bb);
        }
        level.var_49f26c00.var_ae9da777 = a_ents[#"talisman"].var_a27a4e60;
        var_4deff3fa = function_18d7cd9b(localclientnum, 4);
        if (!isdefined(var_4deff3fa)) {
            var_4deff3fa = -1;
        }
        switch (var_4deff3fa) {
        case 0:
            var_bdf17b70 = #"p8_zm_lab_talisman_press_mould_lid_common";
            var_177f9b93 = #"p8_zm_lab_talisman_press_mould_lid_common_empty";
            break;
        case 1:
            var_bdf17b70 = #"p8_zm_lab_talisman_press_mould_lid_rare";
            var_177f9b93 = #"hash_28a2c4e744e4658c";
            break;
        case 2:
            var_bdf17b70 = #"p8_zm_lab_talisman_press_mould_lid_legendary";
            var_177f9b93 = #"hash_15aeae3ca1622031";
            break;
        case 3:
            var_bdf17b70 = #"p8_zm_lab_talisman_press_mould_lid_epic";
            var_177f9b93 = #"hash_22c3a62824ed796d";
            break;
        case 4:
            var_bdf17b70 = #"hash_21facc9d2f29d94c";
            var_177f9b93 = #"hash_150da5db728463e2";
            break;
        default:
            var_bdf17b70 = #"p8_zm_lab_talisman_press_mould_lid_common";
            var_177f9b93 = #"p8_zm_lab_talisman_press_mould_lid_common_empty";
            break;
        }
        if (isdefined(a_ents[#"talisman"].var_850f1956)) {
            a_ents[#"talisman"].var_850f1956 setmodel(var_bdf17b70);
        }
        level waittill(#"talisman_stamped");
        if (isdefined(a_ents[#"talisman"].var_850f1956)) {
            a_ents[#"talisman"].var_850f1956 setmodel(var_177f9b93);
        }
        level util::delay(1, #"laboratory_closed", &function_b760318d, 2);
    }
}

/#

    // Namespace zm_laboratory/frontend_zm_laboratory
    // Params 1, eflags: 0x0
    // Checksum 0x416caec4, Offset: 0x99c0
    // Size: 0x1ee
    function function_feeedd3d(var_7194cc97) {
        self notify("<dev string:x4b6>");
        self endon("<dev string:x4b6>");
        var_7194cc97 endon(#"death");
        var_7194cc97.var_a27a4e60 endon(#"death");
        while (true) {
            debug2dtext((1300, 80, 0), "<dev string:x4c9>" + var_7194cc97 gettagangles("<dev string:x4ef>"), (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            debug2dtext((1300, 80 + 20, 0), "<dev string:x50c>" + var_7194cc97.var_a27a4e60.angles, (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            debug2dtext((1300, 80 + 40, 0), "<dev string:x526>" + var_7194cc97 gettagangles("<dev string:x4ef>"), (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            debug2dtext((1300, 80 + 60, 0), "<dev string:x53b>" + var_7194cc97.var_850f1956.angles, (1, 1, 1), 1, (0, 0, 0), 1, 1, 1);
            waitframe(1);
        }
    }

#/

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x6a7cc60b, Offset: 0x9bb8
// Size: 0xa4
function function_43d0e81a(localclientnum, a_ents) {
    if (isdefined(a_ents[#"talisman"].var_a27a4e60)) {
        a_ents[#"talisman"].var_a27a4e60 delete();
    }
    if (isdefined(a_ents[#"talisman"].var_26cb3da7)) {
        a_ents[#"talisman"].var_26cb3da7 delete();
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x660617d4, Offset: 0x9c68
// Size: 0x55c
function function_24222bb4(localclientnum, a_ents) {
    if (self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_bottles_bundle") {
        level scene::stop(#"hash_4aaa115910b7d3ec");
        function_4df2b792(localclientnum, a_ents[#"bottle1"], a_ents[#"bottle2"], a_ents[#"bottle3"]);
        var_ed6f73d2 = function_6127ea37(localclientnum, 1);
        var_df3fd74f = function_6127ea37(localclientnum, 2);
        var_ed7a73c4 = function_6127ea37(localclientnum, 3);
        util::playfxontag(localclientnum, var_ed6f73d2, a_ents[#"bottle1"].mdl_bottle, isdefined(a_ents[#"bottle1"].mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world")) ? a_ents[#"bottle1"].mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world") : "tag_origin");
        util::playfxontag(localclientnum, var_df3fd74f, a_ents[#"bottle2"].mdl_bottle, isdefined(a_ents[#"bottle2"].mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world")) ? a_ents[#"bottle2"].mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world") : "tag_origin");
        util::playfxontag(localclientnum, var_ed7a73c4, a_ents[#"bottle3"].mdl_bottle, isdefined(a_ents[#"bottle3"].mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world")) ? a_ents[#"bottle3"].mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world") : "tag_origin");
        a_ents[#"bottle1"].mdl_bottle thread function_b05ea28d(#"hash_772e420e766fbc4e", 0, 0.5, undefined, undefined, &function_bf3a0fbe, 1);
        a_ents[#"bottle2"].mdl_bottle thread function_b05ea28d(#"hash_772e420e766fbc4e", 0, 0.5, undefined, undefined, &function_bf3a0fbe, 2);
        a_ents[#"bottle3"].mdl_bottle thread function_b05ea28d(#"hash_772e420e766fbc4e", 0, 0.5, undefined, undefined, &function_bf3a0fbe, 3);
        return;
    }
    if (self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle") {
        level scene::stop(#"p8_fxanim_core_frontend_zm_lab_bottle_fluids_bundle");
        function_8cd01001(localclientnum, a_ents[#"bottle_fluid_01"], a_ents[#"bottle_fluid_02"], a_ents[#"bottle_fluid_03"]);
        util::playfxontag(localclientnum, level._effect[#"hash_6d42ec7a48079d27"], a_ents[#"bottle_fluid_01"], "bottle_fluid_base_jnt");
        util::playfxontag(localclientnum, level._effect[#"hash_6d42ec7a48079d27"], a_ents[#"bottle_fluid_02"], "bottle_fluid_base_jnt");
        util::playfxontag(localclientnum, level._effect[#"hash_6d42ec7a48079d27"], a_ents[#"bottle_fluid_03"], "bottle_fluid_base_jnt");
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x4daf0d1e, Offset: 0xa1d0
// Size: 0x17c
function function_de0d6843(localclientnum, a_ents) {
    self endon(#"hash_200ae59dc85ae6f");
    function_4df2b792(localclientnum, a_ents[#"bottle1"], a_ents[#"bottle2"], a_ents[#"bottle3"]);
    a_ents[#"bottle1"] thread fill_bottle(localclientnum, #"bottle1_dropped", #"bottle1_start_fill", 0.5, 1);
    a_ents[#"bottle2"] thread fill_bottle(localclientnum, #"bottle2_dropped", #"bottle2_start_fill", 0.6, 2);
    a_ents[#"bottle3"] thread fill_bottle(localclientnum, #"bottle3_dropped", #"bottle3_start_fill", 0.7, 3);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x1 linked
// Checksum 0xf8504865, Offset: 0xa358
// Size: 0x60c
function function_4df2b792(localclientnum, var_56448842, var_cf59fa73, var_bb17d1ef) {
    function_6198ffc(5, 0);
    var_56448842.mdl_bottle = util::spawn_model(localclientnum, "tag_origin", var_56448842 gettagorigin("bottle_01_link_jnt"), var_56448842 gettagangles("bottle_01_link_jnt"));
    var_56448842.mdl_tube = util::spawn_model(localclientnum, level.var_49f26c00.var_13123ed2, var_56448842 gettagorigin("bottle_01_link_jnt"), var_56448842 gettagangles("bottle_01_link_jnt"));
    var_56448842.var_7b57e2cc = util::spawn_model(localclientnum, #"hash_cbaf587ef8564b8", var_56448842 gettagorigin("bottlecap_01_link_jnt"), var_56448842 gettagangles("bottlecap_01_link_jnt"));
    var_cf59fa73.mdl_bottle = util::spawn_model(localclientnum, "tag_origin", var_cf59fa73 gettagorigin("bottle_02_link_jnt"), var_cf59fa73 gettagangles("bottle_02_link_jnt"));
    var_cf59fa73.mdl_tube = util::spawn_model(localclientnum, level.var_49f26c00.var_13123ed2, var_cf59fa73 gettagorigin("bottle_02_link_jnt"), var_cf59fa73 gettagangles("bottle_02_link_jnt"));
    var_cf59fa73.var_7b57e2cc = util::spawn_model(localclientnum, #"hash_cbaf587ef8564b8", var_cf59fa73 gettagorigin("bottlecap_02_link_jnt"), var_cf59fa73 gettagangles("bottlecap_02_link_jnt"));
    var_bb17d1ef.mdl_bottle = util::spawn_model(localclientnum, "tag_origin", var_bb17d1ef gettagorigin("bottle_03_link_jnt"), var_bb17d1ef gettagangles("bottle_03_link_jnt"));
    var_bb17d1ef.mdl_tube = util::spawn_model(localclientnum, level.var_49f26c00.var_13123ed2, var_bb17d1ef gettagorigin("bottle_03_link_jnt"), var_bb17d1ef gettagangles("bottle_03_link_jnt"));
    var_bb17d1ef.var_7b57e2cc = util::spawn_model(localclientnum, #"hash_cbaf587ef8564b8", var_bb17d1ef gettagorigin("bottlecap_03_link_jnt"), var_bb17d1ef gettagangles("bottlecap_03_link_jnt"));
    var_56448842.mdl_bottle linkto(var_56448842, "bottle_01_link_jnt");
    var_cf59fa73.mdl_bottle linkto(var_cf59fa73, "bottle_02_link_jnt");
    var_bb17d1ef.mdl_bottle linkto(var_bb17d1ef, "bottle_03_link_jnt");
    var_56448842.mdl_tube linkto(var_56448842, "bottle_01_link_jnt");
    var_cf59fa73.mdl_tube linkto(var_cf59fa73, "bottle_02_link_jnt");
    var_bb17d1ef.mdl_tube linkto(var_bb17d1ef, "bottle_03_link_jnt");
    var_56448842.var_7b57e2cc linkto(var_56448842, "bottlecap_01_link_jnt");
    var_cf59fa73.var_7b57e2cc linkto(var_cf59fa73, "bottlecap_02_link_jnt");
    var_bb17d1ef.var_7b57e2cc linkto(var_bb17d1ef, "bottlecap_03_link_jnt");
    var_56448842.mdl_bottle setmodel(level.var_49f26c00.var_6138b381);
    var_cf59fa73.mdl_bottle setmodel(level.var_49f26c00.var_887781fe);
    var_bb17d1ef.mdl_bottle setmodel(level.var_49f26c00.var_84c77a9e);
    var_56448842.mdl_tube setmodel(level.var_49f26c00.var_13123ed2);
    var_cf59fa73.mdl_tube setmodel(level.var_49f26c00.var_13123ed2);
    var_bb17d1ef.mdl_tube setmodel(level.var_49f26c00.var_13123ed2);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 5, eflags: 0x1 linked
// Checksum 0x77355d51, Offset: 0xa970
// Size: 0x33c
function fill_bottle(localclientnum, var_1a44a9d9, var_6d1c3912, var_7046a27c, var_6cf17519) {
    self endon(#"death");
    level endon(array(#"laboratory_closed", #"hash_1d604ddf352ddcca"));
    var_92ecfb94 = isdefined(self.mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world")) ? self.mdl_bottle gettagorigin("wpn_t8_zm_elixir_bottle_world") : "tag_origin";
    var_55ae9403 = function_6127ea37(localclientnum, var_6cf17519);
    self.mdl_tube setmodel(level.var_49f26c00.var_13123ed2);
    level waittill(var_1a44a9d9);
    var_4deff3fa = function_18d7cd9b(localclientnum, var_6cf17519);
    var_1467a3fb = function_879fc3ee(var_4deff3fa);
    self.mdl_tube thread function_b05ea28d(undefined, undefined, 1, var_1467a3fb);
    level waittill(var_6d1c3912);
    function_6198ffc(5, 1);
    self.mdl_tube setmodel(level.var_49f26c00.var_13123ed2);
    self.mdl_tube thread function_b05ea28d(undefined, 1, 0.75, var_1467a3fb);
    var_d5db956e = util::playfxontag(localclientnum, var_55ae9403, self.mdl_bottle, var_92ecfb94);
    if (isstring(var_7046a27c) || ishash(var_7046a27c)) {
        level waittill(var_7046a27c);
    } else if (isdefined(var_7046a27c)) {
        wait var_7046a27c;
    }
    util::playfxontag(localclientnum, level._effect[#"hash_3a65d1b462add54a"], self.mdl_bottle, var_92ecfb94);
    wait 0.5;
    self.mdl_bottle thread function_b05ea28d(#"hash_772e420e766fbc4e", 0, 0.5, undefined, undefined, &function_bf3a0fbe, var_6cf17519);
    level thread function_6605d119(localclientnum, var_d5db956e);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x21 linked variadic
// Checksum 0x84a3bbe9, Offset: 0xacb8
// Size: 0xc8
function function_6605d119(localclientnum, ...) {
    s_waitresult = level waittill(#"mix_again", #"laboratory_closed");
    foreach (n_fx_id in vararg) {
        stopfx(localclientnum, n_fx_id);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xae4355e8, Offset: 0xad88
// Size: 0x34
function function_bf3a0fbe(param) {
    level flag::set(#"hash_71fc63117cc5bf06" + param);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xef1ab8f7, Offset: 0xadc8
// Size: 0x34
function function_5e0db3e7(param1, param2) {
    level flag::set(#"hash_c5112e5b6ad4e15");
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x97390234, Offset: 0xae08
// Size: 0x2ac
function function_7c1ef1e1(localclientnum, a_ents) {
    self notify(#"hash_200ae59dc85ae6f");
    if (isdefined(a_ents[#"bottle1"].mdl_bottle)) {
        a_ents[#"bottle1"].mdl_bottle delete();
    }
    if (isdefined(a_ents[#"bottle2"].mdl_bottle)) {
        a_ents[#"bottle2"].mdl_bottle delete();
    }
    if (isdefined(a_ents[#"bottle3"].mdl_bottle)) {
        a_ents[#"bottle3"].mdl_bottle delete();
    }
    if (isdefined(a_ents[#"bottle1"].mdl_tube)) {
        a_ents[#"bottle1"].mdl_tube delete();
    }
    if (isdefined(a_ents[#"bottle2"].mdl_tube)) {
        a_ents[#"bottle2"].mdl_tube delete();
    }
    if (isdefined(a_ents[#"bottle3"].mdl_tube)) {
        a_ents[#"bottle3"].mdl_tube delete();
    }
    if (isdefined(a_ents[#"bottle1"].var_7b57e2cc)) {
        a_ents[#"bottle1"].var_7b57e2cc delete();
    }
    if (isdefined(a_ents[#"bottle2"].var_7b57e2cc)) {
        a_ents[#"bottle2"].var_7b57e2cc delete();
    }
    if (isdefined(a_ents[#"bottle3"].var_7b57e2cc)) {
        a_ents[#"bottle3"].var_7b57e2cc delete();
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x909e3cfb, Offset: 0xb0c0
// Size: 0x5c
function function_7af39f9a(localclientnum, a_ents) {
    function_8cd01001(localclientnum, a_ents[#"bottle_fluid_01"], a_ents[#"bottle_fluid_02"], a_ents[#"bottle_fluid_03"]);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 4, eflags: 0x1 linked
// Checksum 0x25655c14, Offset: 0xb128
// Size: 0x194
function function_8cd01001(localclientnum, var_77a22652, var_bd6d31e7, var_db346d75) {
    var_469e104d = function_18d7cd9b(localclientnum, 1);
    var_7953f5b8 = function_18d7cd9b(localclientnum, 2);
    var_6b14d93a = function_18d7cd9b(localclientnum, 3);
    if (!isdefined(var_469e104d) || !isdefined(var_7953f5b8) || !isdefined(var_6b14d93a)) {
        assertmsg("<dev string:x54e>");
        return;
    }
    var_7ebd7c4f = level.var_49f26c00.var_f538d7d4[var_469e104d];
    var_da26331f = level.var_49f26c00.var_f538d7d4[var_7953f5b8];
    var_ecf558bd = level.var_49f26c00.var_f538d7d4[var_6b14d93a];
    var_77a22652 setmodel(var_7ebd7c4f);
    var_bd6d31e7 setmodel(var_da26331f);
    var_db346d75 setmodel(var_ecf558bd);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xafdd4287, Offset: 0xb2c8
// Size: 0x14
function function_31b459eb(localclientnum, a_ents) {
    
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0x5b951ca7, Offset: 0xb2e8
// Size: 0x1c
function function_989962b9(localclientnum, a_ents, str_current_shot) {
    
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0x40886fa2, Offset: 0xb310
// Size: 0xea
function function_cdd906ed(localclientnum, a_ents) {
    self notify("18138586312830ef");
    self endon("18138586312830ef");
    level endon(#"laboratory_closed");
    a_ents[#"centrifuge_fluid"] thread function_7492cbc7(0.1, #"hash_277fc24714d9ad5b", 1);
    level waittill(#"centrifuge_fluid_drained", #"hash_1d604ddf352ddcca");
    if (isdefined(a_ents[#"centrifuge_fluid"])) {
        a_ents[#"centrifuge_fluid"] notify(#"hash_333aed9939c9fe17");
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0xd6edb472, Offset: 0xb408
// Size: 0x360
function function_94c307e0(localclientnum, a_ents, str_shot) {
    if (!isdefined(level.var_49f26c00.var_53ec42bc) && self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle") {
        level.var_49f26c00.var_53ec42bc = a_ents[#"mixer_fluid"];
    }
    if (self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_01_bundle" && str_shot == "mixer_activate") {
        level.var_49f26c00.var_53ec42bc.var_9270c414 = util::playfxontag(localclientnum, level._effect[#"hash_43b44402af23c93c"], level.var_49f26c00.var_53ec42bc, "mixer_01_bath_fluid_fx_jnt");
    }
    if (!isdefined(level.var_49f26c00.var_1266bfca) && self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle") {
        level.var_49f26c00.var_1266bfca = a_ents[#"mixer_fluid"];
    }
    if (self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_02_bundle" && str_shot == "mixer_activate") {
        level.var_49f26c00.var_1266bfca.var_9270c414 = util::playfxontag(localclientnum, level._effect[#"hash_43b44402af23c93c"], level.var_49f26c00.var_1266bfca, "mixer_02_bath_fluid_fx_jnt");
    }
    if (!isdefined(level.var_49f26c00.var_ffa61a49) && self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle") {
        level.var_49f26c00.var_ffa61a49 = a_ents[#"mixer_fluid"];
    }
    if (self.scriptbundlename === #"p8_fxanim_core_frontend_zm_lab_mixer_fluid_03_bundle" && str_shot == "mixer_activate") {
        level.var_49f26c00.var_ffa61a49.var_9270c414 = util::playfxontag(localclientnum, level._effect[#"hash_43b44402af23c93c"], level.var_49f26c00.var_ffa61a49, "mixer_03_bath_fluid_fx_jnt");
    }
    if (str_shot == "mixer_activate") {
        if (isdefined(a_ents[#"mixer_fluid"])) {
            a_ents[#"mixer_fluid"] thread function_7492cbc7(0.1, undefined, 1);
        }
        return;
    }
    if (str_shot == "mixer_fill_finish") {
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xa7f683ca, Offset: 0xb770
// Size: 0x9e
function function_879fc3ee(var_4deff3fa) {
    if (!isdefined(var_4deff3fa)) {
        return -1;
    }
    switch (var_4deff3fa) {
    case 0:
        return -1;
    case 1:
        return 2;
    case 2:
        return 3;
    case 3:
        return 0;
    case 4:
        return 1;
    }
    return -1;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0x9b2af426, Offset: 0xb818
// Size: 0xe6
function function_a05c4ea5(str_color) {
    switch (str_color) {
    case #"green":
        var_1467a3fb = -1;
        break;
    case #"white":
        var_1467a3fb = -1;
        break;
    case #"orange":
        var_1467a3fb = 0;
        break;
    case #"gold":
        var_1467a3fb = 1;
        break;
    case #"purple":
        var_1467a3fb = 3;
        break;
    case #"blue":
        var_1467a3fb = 2;
        break;
    default:
        var_1467a3fb = -1;
        break;
    }
    return var_1467a3fb;
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 2, eflags: 0x1 linked
// Checksum 0xebb4c3e4, Offset: 0xb908
// Size: 0x1cc
function function_9b8f7969(var_803342ff, var_ee6bcd51 = #"hash_39fc63d10a03dd55") {
    if (!isdefined(self)) {
        return;
    }
    self notify(#"hash_333aed9939c9fe17");
    if (isstring(var_803342ff) || ishash(var_803342ff)) {
        var_1467a3fb = function_a05c4ea5(var_803342ff);
    } else {
        var_1467a3fb = var_803342ff;
    }
    if (isdefined(self.var_40fbce61)) {
        self stoprenderoverridebundle(var_ee6bcd51);
    }
    self playrenderoverridebundle(var_ee6bcd51);
    self.var_40fbce61 = var_ee6bcd51;
    if (var_1467a3fb == -1 || var_1467a3fb == -1) {
        self function_78233d29(var_ee6bcd51, "", "Brightness", 0.1);
    } else {
        self function_78233d29(var_ee6bcd51, "", "Brightness", 1);
    }
    self function_78233d29(var_ee6bcd51, "", "Alpha", 1);
    self function_78233d29(var_ee6bcd51, "", "Tint", var_1467a3fb);
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 3, eflags: 0x1 linked
// Checksum 0xb441de79, Offset: 0xbae0
// Size: 0x398
function function_7492cbc7(var_a82b834c = 0.5, var_ee6bcd51 = #"hash_6f36cd3b18334e2e", var_d2e7cd73 = 0) {
    self notify(#"hash_333aed9939c9fe17");
    self endoncallback(&function_9330010b, #"hash_333aed9939c9fe17", #"death");
    level endon(#"hash_333aed9939c9fe17");
    if (isdefined(self.var_40fbce61)) {
        self stoprenderoverridebundle(self.var_40fbce61);
    }
    self playrenderoverridebundle(var_ee6bcd51);
    self.var_40fbce61 = var_ee6bcd51;
    var_31876922 = array::random(level.var_49f26c00.var_66baa9e8);
    var_ca93c4d5 = array::random(array::exclude(level.var_49f26c00.var_66baa9e8, var_31876922));
    while (true) {
        self function_78233d29(var_ee6bcd51, "", "Alpha", 1);
        if (var_31876922 == -1 || var_ca93c4d5 == -1) {
            self function_78233d29(var_ee6bcd51, "", "Brightness", 1);
        } else {
            self function_78233d29(var_ee6bcd51, "", "Brightness", 1);
        }
        if (var_d2e7cd73) {
            self function_78233d29(var_ee6bcd51, "", "Tint", var_ca93c4d5);
            wait var_a82b834c;
        } else {
            var_8fc81e63 = gettime();
            n_time_end = gettime() + int(var_a82b834c * 1000);
            n_timer = var_8fc81e63;
            while (true) {
                n_timer = gettime();
                if (n_timer >= n_time_end) {
                    self function_78233d29(var_ee6bcd51, "", "Tint", var_ca93c4d5);
                    break;
                } else {
                    var_ae74c01c = mapfloat(var_8fc81e63, n_time_end, var_31876922, var_ca93c4d5, n_timer);
                    self function_78233d29(var_ee6bcd51, "", "Tint", var_ae74c01c);
                }
                waitframe(1);
            }
        }
        var_31876922 = var_ca93c4d5;
        var_ca93c4d5 = array::random(array::exclude(level.var_49f26c00.var_66baa9e8, var_31876922));
        waitframe(1);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 1, eflags: 0x1 linked
// Checksum 0xe1f24c99, Offset: 0xbe80
// Size: 0x3c
function function_9330010b(str_notify) {
    if (isdefined(self) && isdefined(self.var_40fbce61)) {
        self stoprenderoverridebundle(self.var_40fbce61);
    }
}

// Namespace zm_laboratory/frontend_zm_laboratory
// Params 7, eflags: 0x1 linked
// Checksum 0xa6da43a1, Offset: 0xbec8
// Size: 0x3a6
function function_b05ea28d(var_ffea06d7 = #"hash_6f36cd3b18334e2e", b_reverse = 0, n_total_time = 0.5, str_color, var_1145a695, var_c2a69066, params) {
    self notify("5d2a6acdbf8af8e");
    self endon("5d2a6acdbf8af8e");
    self endon(#"death");
    level endon(#"laboratory_closed");
    if (isdefined(self.var_40fbce61)) {
        self stoprenderoverridebundle(self.var_40fbce61);
    }
    self playrenderoverridebundle(var_ffea06d7);
    self.var_40fbce61 = var_ffea06d7;
    if (str_color === #"randomize") {
        self thread function_7492cbc7(var_1145a695, var_ffea06d7);
    } else if (isdefined(str_color)) {
        self function_9b8f7969(str_color, var_ffea06d7);
    }
    n_start_time = gettime();
    n_end_time = gettime() + int(n_total_time * 1000);
    self function_78233d29(var_ffea06d7, "", "Alpha", 1);
    self function_78233d29(var_ffea06d7, "", "Brightness", 1);
    n_timer = gettime();
    while (true) {
        n_timer = gettime();
        if (n_timer >= n_end_time) {
            if (b_reverse) {
                self function_78233d29(var_ffea06d7, "", "Threshold", 0);
                self function_78233d29(var_ffea06d7, "", "Alpha", 0);
                self function_78233d29(var_ffea06d7, "", "Brightness", 0);
                self notify(#"hash_333aed9939c9fe17");
            } else {
                self function_78233d29(var_ffea06d7, "", "Threshold", 1);
            }
            break;
        } else {
            var_c9a12289 = mapfloat(n_start_time, n_end_time, 0, 1, n_timer);
            if (b_reverse) {
                self function_78233d29(var_ffea06d7, "", "Threshold", 1 - var_c9a12289);
            } else {
                self function_78233d29(var_ffea06d7, "", "Threshold", var_c9a12289);
            }
        }
        waitframe(1);
    }
    if (isdefined(var_c2a69066)) {
        self [[ var_c2a69066 ]](params);
    }
}

