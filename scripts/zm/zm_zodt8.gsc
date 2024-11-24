#using scripts\zm\zm_zodt8_trials;
#using script_7893277eec698972;
#using scripts\zm\zm_zodt8_tutorial;
#using scripts\zm\zm_zodt8_side_quests;
#using scripts\zm\zm_zodt8_sentinel_trial;
#using scripts\zm\zm_zodt8_pap_quest;
#using scripts\zm\zm_zodt8_narrative;
#using scripts\zm\zm_zodt8_eye;
#using scripts\zm\zm_zodt8_achievements;
#using scripts\zm\zm_zodt8_sound;
#using scripts\zm\powerup\zm_powerup_free_perk;
#using scripts\zm_common\zm_pack_a_punch_util;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here;
#using scripts\zm\ai\zm_ai_stoker;
#using scripts\zm\zm_zodt8_devgui;
#using scripts\zm\zm_zodt8_gamemodes;
#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_weapons;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm\weapons\zm_weap_bowie;
#using scripts\zm_common\zm_characters;
#using script_444bc5b4fa0fe14f;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_power;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_hud;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_audio_sq;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm;
#using scripts\zm_common\load;
#using scripts\zm_common\callbacks;
#using scripts\core_common\scene_shared;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\ai_shared;
#using scripts\core_common\struct;

#namespace zm_zodt8;

// Namespace zm_zodt8/level_init
// Params 1, eflags: 0x40
// Checksum 0x9873bac, Offset: 0x1808
// Size: 0x974
function event_handler[level_init] main(eventstruct) {
    setclearanceceiling(24);
    init_level_vars();
    clientfield::register("clientuimodel", "player_lives", 1, 2, "int");
    clientfield::register("vehicle", "pap_projectile_fx", 1, 1, "int");
    clientfield::register("vehicle", "pap_projectile_end_fx", 1, 1, "counter");
    clientfield::register("world", "narrative_trigger", 1, 1, "int");
    clientfield::register("world", "sfx_waterdrain_fore", 1, 1, "int");
    clientfield::register("world", "sfx_waterdrain_aft", 1, 1, "int");
    clientfield::register("world", "" + #"hash_2994a957c49bf321", 1, 1, "int");
    clientfield::register("world", "" + #"hash_7e91637e80ad93", 1, 1, "int");
    clientfield::register("world", "" + #"hash_16cc25b3f87f06ad", 1, 1, "int");
    clientfield::register("world", "" + #"hash_7f2f74f05d1f1b75", 1, 2, "int");
    clientfield::register("scriptmover", "tilt", 1, 1, "int");
    clientfield::register("scriptmover", "change_wave_water_height", 1, 1, "int");
    clientfield::register("scriptmover", "update_wave_water_height", 1, 1, "counter");
    clientfield::register("scriptmover", "activate_sentinel_artifact", 1, 2, "int");
    clientfield::register("scriptmover", "ocean_water", 1, 1, "int");
    clientfield::register("toplayer", "water_splashies", 1, 1, "counter");
    clientfield::register("toplayer", "water_drippies", 1, 1, "int");
    clientfield::register("actor", "sndActorUnderwater", 1, 1, "int");
    setdvar(#"player_shallowwaterwadescale", 1);
    setdvar(#"player_waistwaterwadescale", 1);
    setdvar(#"player_deepwaterwadescale", 1);
    scene::add_scene_func("p8_fxanim_zm_zod_skybox_bundle", &function_5988b12, "init");
    scene::add_scene_func(#"p8_fxanim_zm_zod_tentacle_bundle", &function_42cfb9f0);
    level scene::init("p8_fxanim_zm_zod_skybox_bundle");
    zm::init_fx();
    zodt8_pap_quest::init();
    zodt8_sentinel::init();
    namespace_4a807bff::init();
    namespace_b45e3f05::init();
    zodt8_achievements::init();
    zodt8_narrative::init();
    zm_audio_sq::init();
    zodt8_sound::main();
    level thread function_86a8adbe();
    level thread zm::_outro_slow(&function_dc8b6da);
    callback::on_spawned(&on_player_spawned);
    callback::on_ai_spawned(&function_8c000d3b);
    zm_cleanup::function_cdf5a512(#"blight_father", &function_994c6ce1);
    load::main();
    function_2c7766d0();
    level thread sndfunctions();
    level thread zm_zonemgr::manage_zones("zone_forecastle_upper");
    /#
        level thread zm_zodt8_devgui::function_5d346946();
    #/
    level thread lore_room_door();
    level thread function_704f6133();
    level thread function_ef155de5();
    if (util::get_game_type() != "ztutorial") {
        level thread function_3ad6764f();
    }
    level clientfield::set("" + #"hash_3c58464f16d8a1be", 0);
    level clientfield::set("" + #"hash_2994a957c49bf321", 1);
    level clientfield::set("" + #"hash_7e91637e80ad93", 1);
    e_clip = getent("e_clip_lifeboat", "targetname");
    if (isdefined(e_clip)) {
        e_clip disconnectpaths();
    }
    level flag::wait_till("all_players_spawned");
    zm_ui_inventory::function_7df6bb60(#"zm_zodt8_sentinel_artifact", 0);
    if (!zm_utility::is_ee_enabled()) {
        zm_ui_inventory::function_7df6bb60(#"zm_zodt8_sentinel_trial", 0);
    }
    var_8090ebe4 = getnodearray("traversal_unlink_at_start", "targetname");
    array::thread_all(var_8090ebe4, &function_183a6d46);
    level thread function_4d4e4de();
    level thread function_d515e5e7();
    level thread function_a987d50f();
    level thread function_96c0d840();
    level thread function_255747bd();
    level thread function_172ac1b5();
    zm_custom::function_a00576dd(&function_7722c6f0, &function_389e7c22, &function_c8ce0a17);
    water_init();
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0xa704e060, Offset: 0x2188
// Size: 0x80
function function_7722c6f0(var_404e4288, var_8dd554ee) {
    var_6095c0b6 = zm_round_logic::function_4e8157cd(var_404e4288, var_8dd554ee);
    if (isalive(var_6095c0b6.ai_spawned)) {
        zm_transform::function_d2374144(var_6095c0b6.ai_spawned, #"blight_father");
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0xe3e395b, Offset: 0x2210
// Size: 0x32
function function_389e7c22(var_404e4288, var_8dd554ee) {
    ai = zm_ai_stoker::round_spawn();
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0x3a748cda, Offset: 0x2250
// Size: 0xd8
function function_c8ce0a17(var_404e4288, var_8dd554ee) {
    var_6095c0b6 = zm_round_logic::function_4e8157cd(var_404e4288, var_8dd554ee);
    if (isalive(var_6095c0b6.ai_spawned)) {
        zm_transform::function_d2374144(var_6095c0b6.ai_spawned, array::random(array(#"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water")));
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x5e712e48, Offset: 0x2330
// Size: 0x74
function function_dc8b6da() {
    self endon(#"disconnect");
    self forcestreambundle("p8_fxanim_zm_zod_iceberg_bundle");
    level flag::wait_till(#"start_zombie_round_logic");
    wait 20;
    self function_66b6e720("p8_fxanim_zm_zod_iceberg_bundle");
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x1b8c76cc, Offset: 0x23b0
// Size: 0x3c
function function_42cfb9f0(a_ents) {
    wait 0.65;
    playrumbleonposition(#"hash_7b580995b5562bfc", self.origin);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x59d52355, Offset: 0x23f8
// Size: 0x244
function function_5988b12(a_ents) {
    util::wait_network_frame(5);
    level.e_sway = a_ents[#"skybox_water"];
    level.e_sway clientfield::set("tilt", 1);
    var_492eb620 = getentarray("ocean_water", "targetname");
    foreach (var_f6fecb88 in var_492eb620) {
        var_f6fecb88 linkto(level.e_sway);
        var_f6fecb88 clientfield::set("ocean_water", 1);
    }
    callback::on_spawned(&function_6beeab1d);
    foreach (player in getplayers()) {
        player function_6beeab1d();
    }
    scene::remove_scene_func("p8_fxanim_zm_zod_skybox_bundle", &function_5988b12, "init");
    level thread scene::play("p8_fxanim_zm_zod_skybox_bundle", "idle");
    level flag::set(#"hash_6d96664f656363a1");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xb991efb0, Offset: 0x2648
// Size: 0x24
function function_6beeab1d() {
    self playersetgroundreferenceent(level.e_sway);
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x5ea23fe8, Offset: 0x2678
// Size: 0x426
function init_level_vars() {
    level.var_cc984236 = &function_18f12f69;
    level.var_c9bb3e4a = 1;
    level.default_start_location = "zone_forecastle_upper";
    level.default_game_mode = "zclassic";
    level.var_22fda912 = &offhand_weapon_overrride;
    level.zombiemode_offhand_weapon_give_override = &offhand_weapon_give_override;
    level.var_d0ab70a2 = #"gamedata/weapons/zm/zm_zodt8_weapons.csv";
    level._allow_melee_weapon_switching = 1;
    level.zombiemode_reusing_pack_a_punch = 1;
    level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
    level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
    level.var_2358785f = &function_26d54397;
    level.var_cb30f17e = getweapon(#"ww_tricannon_t8");
    level.var_618201fe = getweapon(#"ww_tricannon_t8_upgraded");
    level._no_vending_machine_auto_collision = 1;
    level.var_ef785c4c = 0;
    zm_pap_util::function_11fdb083(32);
    level.var_aaeee81e = array(#"ww_tricannon_t8");
    level.var_370b1a3d = &function_d2ba8baa;
    level.var_d975e8e6 = &function_807f41e9;
    level.zombie_init_done = &function_32d2bdc8;
    level.zones = [];
    level.zone_manager_init_func = &zone_init;
    level.chest_joker_model = "p8_fxanim_zm_zod_magic_box_skull_mod";
    level.chest_joker_custom_movement = &zm_magicbox::function_f5503c41;
    if (util::get_game_type() != "ztutorial") {
        level.random_pandora_box_start = 1;
        level.var_2f57e2d2 = &function_5716ed83;
        level.custom_magic_box_timer_til_despawn = &function_d4fea86c;
    }
    level.open_chest_location = [];
    level.magic_box_zbarrier_state_func = &zm_magicbox::function_35c66b27;
    level.var_d5bd7049 = #"hash_3dc033ef1e67a5c0";
    a_s_boxes = struct::get_array(#"treasure_chest_use");
    for (i = 0; i < a_s_boxes.size; i++) {
        level.open_chest_location[i] = a_s_boxes[i].script_noteworthy;
    }
    level flag::init(#"hash_1daec0e8f3d0444");
    if (zm_trial::is_trial_mode()) {
        level.var_adca35c8 = &function_8ceb4377;
        level.var_a975ca2c = &function_f0d86074;
        level.var_2d96b859 = &function_4aaab486;
    }
    level.var_562c8f67 = 200;
    level.zm_bgb_anywhere_but_here_validation_override = &function_3910bef9;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x5 linked
// Checksum 0x7593e59, Offset: 0x2aa8
// Size: 0xb4
function private function_8ceb4377() {
    assert(isdefined(level.var_d77a6967));
    if (level.var_d77a6967.name == #"waterlogged") {
        level flag::set(#"hash_1daec0e8f3d0444");
        self.var_f3d1d53a = isdefined(level.water_drained_fore) && level.water_drained_fore;
        if (self.var_f3d1d53a) {
            level thread change_water_height_fore(0);
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x5 linked
// Checksum 0xdccfbed5, Offset: 0x2b68
// Size: 0x94
function private function_f0d86074() {
    assert(isdefined(level.var_d77a6967));
    if (level.var_d77a6967.name == #"waterlogged") {
        level flag::clear(#"hash_1daec0e8f3d0444");
        if (self.var_f3d1d53a) {
            level thread change_water_height_fore(1);
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x5 linked
// Checksum 0x9a601ab5, Offset: 0x2c08
// Size: 0x3c
function private function_4aaab486(b_show) {
    if (b_show) {
        zodt8_pap_quest::function_9e015223();
        return;
    }
    zodt8_pap_quest::function_ef3c219a();
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x2
// Checksum 0x3a6ff880, Offset: 0x2c50
// Size: 0x1bc
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
    level.bgb_machine_count = 2;
    level.random_pandora_box_start = 1;
    level.clientfieldaicheck = 1;
    level.var_5bfd847e = #"hash_7bef4c44b5d916bc";
    level.pack_a_punch_camo_index = 146;
    level.pack_a_punch_camo_index_number_variants = 5;
    setdvar(#"hash_558e57dbb6559778", 1);
    setdvar(#"r_lightingsunshadowcachedynamicsiegedistance", 3000);
    level flag::init("forecastle_cargo_hatch_destroyed");
    level flag::init("water_drained_fore");
    level flag::init("water_drained_aft");
    level flag::init(#"water_initialized");
    level flag::init(level.var_5bfd847e);
    level flag::init(#"hash_7060183fc29995b4");
    level flag::init(#"hash_6d96664f656363a1");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x5 linked
// Checksum 0x4d84a214, Offset: 0x2e18
// Size: 0x1ec
function private function_4d4e4de() {
    if (zm_utility::is_standard()) {
        return;
    }
    if (level.players.size == 1) {
        var_ddf9ad37 = zombie_utility::get_zombie_var(#"hash_376905ad360fc2e8");
        var_424eb3ee = randomintrange(zombie_utility::get_zombie_var(#"hash_2374f3ef775ac2c3"), zombie_utility::get_zombie_var(#"hash_2374f3ef775ac2c3") + 2);
    } else {
        var_ddf9ad37 = zombie_utility::get_zombie_var(#"hash_6eb9b2d60babd5aa");
        var_424eb3ee = randomintrange(zombie_utility::get_zombie_var(#"hash_3b4ad7449c039d1b"), zombie_utility::get_zombie_var(#"hash_3b4ad7449c039d1b") + 2);
    }
    var_80a62d86 = var_424eb3ee + randomintrange(3, 5);
    zm_round_spawning::function_376e51ef(#"catalyst", var_ddf9ad37);
    zm_round_spawning::function_cc103b38(#"stoker", var_424eb3ee);
    zm_round_spawning::function_cc103b38(#"blight_father", var_80a62d86);
    level thread function_34d1e89a(var_424eb3ee);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x5 linked
// Checksum 0x9768cea7, Offset: 0x3010
// Size: 0x104
function private function_34d1e89a(var_424eb3ee) {
    level endon(#"end_game");
    while (true) {
        level waittill(#"end_of_round");
        if (level.round_number >= var_424eb3ee) {
            break;
        }
    }
    if (level flag::exists(#"hash_1562cc6d96b2bc4")) {
        zm_round_spawning::function_2876740e(#"stoker", &function_1a43f284);
        level flag::wait_till(#"hash_1562cc6d96b2bc4");
        zm_round_spawning::function_9bf14a10(#"stoker", &function_1a43f284);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x7870006b, Offset: 0x3120
// Size: 0x22
function function_1a43f284(n_max) {
    if (n_max < 1) {
        return 1;
    }
    return n_max;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x8ff4e843, Offset: 0x3150
// Size: 0x64
function function_183a6d46() {
    level endon(#"end_game");
    unlinktraversal(self);
    level flag::wait_till(self.script_flag);
    linktraversal(self);
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x8d2a4655, Offset: 0x31c0
// Size: 0x51e
function function_86a8adbe() {
    level.var_f0e198fa = getentarray("magic_box_map", "targetname");
    while (true) {
        s_result = level waittill(#"hash_e39eca74fa250b4");
        foreach (mdl_map in level.var_f0e198fa) {
            if (zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) {
                mdl_map showpart("j_bridge");
                mdl_map showpart("j_cargo");
                mdl_map showpart("j_dining_hall");
                mdl_map showpart("j_engine_room");
                mdl_map showpart("j_grand_stair_lower");
                mdl_map showpart("j_grand_stair_upper");
                mdl_map showpart("j_lounge");
                mdl_map showpart("j_promenade");
                continue;
            }
            mdl_map hidepart("j_bridge");
            mdl_map hidepart("j_cargo");
            mdl_map hidepart("j_dining_hall");
            mdl_map hidepart("j_engine_room");
            mdl_map hidepart("j_grand_stair_lower");
            mdl_map hidepart("j_grand_stair_upper");
            mdl_map hidepart("j_lounge");
            mdl_map hidepart("j_promenade");
            foreach (s_magic_box in level.chests) {
                if (!(isdefined(s_magic_box.hidden) && s_magic_box.hidden) && isdefined(s_magic_box.script_noteworthy)) {
                    switch (s_magic_box.script_noteworthy) {
                    case #"promenade_chest":
                        mdl_map showpart("j_promenade");
                        break;
                    case #"cargo_chest":
                        mdl_map showpart("j_cargo");
                        break;
                    case #"hash_1cb95429bf87e1dd":
                        mdl_map showpart("j_engine_room");
                        break;
                    case #"grand_stair_lower_chest":
                        mdl_map showpart("j_grand_stair_lower");
                        break;
                    case #"lounge_chest":
                        mdl_map showpart("j_lounge");
                        break;
                    case #"hash_23cfa652ecaa206e":
                        mdl_map showpart("j_grand_stair_upper");
                        break;
                    case #"bridge_chest":
                        mdl_map showpart("j_bridge");
                        break;
                    case #"hash_51c31615840ad554":
                        mdl_map showpart("j_dining_hall");
                        break;
                    }
                }
            }
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0xb072cf92, Offset: 0x36e8
// Size: 0x1da
function function_5716ed83(e_player) {
    if (isdefined(self.stub.trigger_target.weapon_out) && self.stub.trigger_target.weapon_out) {
        if (self.stub.trigger_target.zbarrier.weapon == level.var_cb30f17e) {
            if (e_player hasweapon(level.var_cb30f17e, 1)) {
                return false;
            }
            var_9811a74b = array(#"ww_tricannon_t8_upgraded", #"ww_tricannon_air_t8", #"ww_tricannon_air_t8_upgraded", #"ww_tricannon_earth_t8", #"ww_tricannon_earth_t8_upgraded", #"ww_tricannon_fire_t8", #"ww_tricannon_fire_t8_upgraded", #"ww_tricannon_water_t8", #"ww_tricannon_water_t8_upgraded");
            foreach (var_88c3457d in var_9811a74b) {
                if (e_player hasweapon(getweapon(var_88c3457d), 1)) {
                    return false;
                }
            }
        }
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x1afb7574, Offset: 0x38d0
// Size: 0xbc
function function_d4fea86c(zbarrier_magicbox) {
    if (zbarrier_magicbox.weapon === level.w_tricannon_base) {
        v_offset = vectornormalize(anglestoforward(zbarrier_magicbox.angles)) * 16;
        self.origin += v_offset;
    }
    v_float = anglestoup(self.angles) * 40;
    self thread zm_magicbox::timer_til_despawn(v_float);
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x86e8997b, Offset: 0x3998
// Size: 0x150
function lore_room_door() {
    level endon(#"end_game");
    level flag::init(#"open_lore_room");
    var_48e9f58e = getent("baphomets_entry", "targetname");
    var_61bca073 = getent("baphomets_entry" + "_clip", "targetname");
    var_61bca073 solid();
    var_61bca073 disconnectpaths();
    while (true) {
        level flag::wait_till(#"open_lore_room");
        function_2c0f0869(1, var_48e9f58e, var_61bca073);
        level flag::wait_till_clear(#"open_lore_room");
        function_2c0f0869(0, var_48e9f58e, var_61bca073);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 3, eflags: 0x1 linked
// Checksum 0x796b23a4, Offset: 0x3af0
// Size: 0x1d4
function function_2c0f0869(b_open, e_door, var_a34c7e62) {
    var_e077e352 = (0, 270, 0);
    var_3f3938b6 = (0, 35, 0);
    if (!isdefined(e_door)) {
        e_door = getent("baphomets_entry", "targetname");
    }
    if (!isdefined(var_a34c7e62)) {
        var_a34c7e62 = getent("baphomets_entry" + "_clip", "targetname");
    }
    if (isdefined(b_open) && b_open) {
        level clientfield::set("narrative_trigger", 1);
        e_door rotateto(var_3f3938b6, 1, 0, 0);
        var_a34c7e62 connectpaths();
        var_a34c7e62 notsolid();
        e_door waittill(#"rotatedone");
        e_door solid();
        e_door disconnectpaths();
        return;
    }
    var_a34c7e62 solid();
    var_a34c7e62 disconnectpaths();
    e_door rotateto(var_e077e352, 1, 0, 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x5 linked
// Checksum 0x2f23a55a, Offset: 0x3cd0
// Size: 0x1d8
function private function_a987d50f() {
    level endon(#"end_game");
    var_40d9ad40 = 0;
    var_3f2d17a4 = 0;
    var_69083fb0 = array("zone_grand_stairs_b_deck", "zone_grand_stairs_c_deck", "zone_grand_stairs_d_deck", "zone_dining_hall_fore", "zone_dining_hall_aft", "zone_galley");
    var_58686f84 = getent("moonlight_on_volume", "targetname");
    while (true) {
        var_40d9ad40 = 0;
        for (i = 0; i < level.players.size && !var_40d9ad40; i++) {
            e_player = level.players[i];
            if (isinarray(var_69083fb0, e_player.zone_name)) {
                var_40d9ad40 = 1;
                break;
            }
            if (e_player.zone_name === "zone_promenade_deck" && e_player istouching(var_58686f84)) {
                var_40d9ad40 = 1;
                break;
            }
        }
        if (var_3f2d17a4) {
            if (!var_40d9ad40) {
                exploder::exploder("exp_lgt_fakemoon_c_deck");
                var_3f2d17a4 = 0;
            }
        } else if (var_40d9ad40) {
            exploder::stop_exploder("exp_lgt_fakemoon_c_deck");
            var_3f2d17a4 = 1;
        }
        wait 0.1;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xf0448ef5, Offset: 0x3eb0
// Size: 0x128
function function_96c0d840() {
    while (true) {
        hidemiscmodels("coal_warm");
        hidemiscmodels("coal_hot");
        level waittill(#"hash_47ecba5609d2b603");
        hidemiscmodels("coal_cold");
        if (level flag::get(#"hash_65e37079e0d22d47") && !level flag::get(#"planet_step_completed")) {
            showmiscmodels("coal_hot");
        } else {
            showmiscmodels("coal_warm");
        }
        level waittill(#"hash_74a58a7760ce1b5c");
        wait 12;
        showmiscmodels("coal_cold");
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x35f22219, Offset: 0x3fe0
// Size: 0xb0
function function_d515e5e7() {
    while (true) {
        var_f2c45ac3 = level.round_number + randomintrangeinclusive(3, 6);
        while (var_f2c45ac3 > level.round_number) {
            level waittill(#"end_of_round");
        }
        wait randomint(10);
        exploder::exploder("fx_exp_flare_vista_white");
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xa74ae2a9, Offset: 0x4098
// Size: 0xe6
function function_ef155de5() {
    level flag::wait_till("start_zombie_round_logic");
    wait 25;
    while (true) {
        exploder::exploder("exp_lgt_sos");
        wait randomintrange(5, 55);
        exploder::exploder_stop("exp_lgt_sos");
        wait 5;
        exploder::exploder("exp_lgt_cqd");
        wait randomintrange(5, 55);
        exploder::exploder_stop("exp_lgt_cqd");
        wait 5;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x7fe07e49, Offset: 0x4188
// Size: 0xbc
function function_ed8a8823() {
    do {
        t_trigger = trigger::wait_till("trigger_sentinel_los", "targetname");
        b_played = t_trigger.who zm_audio::create_and_play_dialog(#"sentinel", #"los_first");
        waitframe(1);
    } while (b_played !== 1 && !level flag::get(level.var_5bfd847e));
    t_trigger delete();
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xdb0b7af2, Offset: 0x4250
// Size: 0x624
function function_704f6133() {
    level thread function_ed8a8823();
    mdl_artifact = getent("artifact_mind", "script_noteworthy");
    mdl_artifact clientfield::set("activate_sentinel_artifact", 1);
    mdl_artifact bobbing((0, 0, 1), 0.5, 5);
    level thread scene::play("p8_fxanim_zm_zod_sent_trail1_boat_bundle", "boat_idle");
    var_198b4e5c = getentarray("fc_hatch_cover", "targetname");
    foreach (e_blocker in var_198b4e5c) {
        e_blocker disconnectpaths();
    }
    s_result = level waittill(#"hash_3e80d503318a5674");
    if (!zm_custom::function_3f3752ab()) {
        zm_utility::giveachievement_wrapper("ZM_ZODT8_TRIAL_STEP_1", 1);
        changeadvertisedstatus(0);
    }
    array::run_all(util::get_active_players(), &forcestreambundle, "p8_fxanim_zm_zod_smokestack_01_bundle", 3);
    mdl_artifact clientfield::set("activate_sentinel_artifact", 2);
    var_7b8000e5 = (0, 18, -32);
    mdl_artifact moveto(mdl_artifact.origin + var_7b8000e5, 5, 1, 3);
    mdl_artifact waittill(#"movedone");
    mdl_artifact setmodel(#"hash_2c0078538e398b4f");
    wait 2.5;
    mdl_artifact clientfield::set("activate_sentinel_artifact", 0);
    foreach (player in util::get_active_players()) {
        player playrumbleonentity("zm_power_on_rumble");
    }
    exploder::exploder("fxexp_power_artifact_burst");
    level thread scene::play("p8_fxanim_zm_zod_sentinel_chaos_bundle");
    level flag::set(level.var_5bfd847e);
    earthquake(0.3, 3, mdl_artifact.origin, 1024);
    level thread zm_audio::sndmusicsystem_playstate("sentinel_artifact_activated");
    var_5314bd63 = getent("veh_fasttravel_cam", "targetname");
    for (i = 1; i <= 4; i++) {
        var_a11e6097[i] = spawner::simple_spawn_single(var_5314bd63);
    }
    level thread pap_projectile_fx("pap_projectile_path_1", var_a11e6097[1], 30, 75);
    level thread pap_projectile_fx("pap_projectile_path_2", var_a11e6097[2], 30, 75);
    level thread pap_projectile_fx("pap_projectile_path_3", var_a11e6097[3], 30, 75);
    level thread pap_projectile_fx("pap_projectile_path_4", var_a11e6097[4], 7.5, 18.75);
    level thread function_377b1d6d();
    level thread function_6058ef28();
    level thread function_531fd4b6();
    wait 0.1;
    mdl_artifact delete();
    wait 7.5;
    if (isalive(s_result.player)) {
        s_result.player zm_audio::create_and_play_dialog(#"sentinel", #"key");
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 4, eflags: 0x1 linked
// Checksum 0xdbdccfed, Offset: 0x4880
// Size: 0x15c
function pap_projectile_fx(var_da44938b, var_62c4256, n_acceleration, n_speed) {
    if (!isdefined(var_62c4256)) {
        return;
    }
    var_62c4256 endon(#"death");
    nd_spline = getvehiclenode(var_da44938b, "targetname");
    var_62c4256.origin = nd_spline.origin;
    var_62c4256.angles = nd_spline.angles;
    var_62c4256 setacceleration(n_acceleration);
    var_62c4256 setspeed(n_speed);
    var_62c4256 clientfield::set("pap_projectile_fx", 1);
    var_62c4256 vehicle::get_on_and_go_path(nd_spline);
    var_62c4256 clientfield::set("pap_projectile_fx", 0);
    waitframe(1);
    var_62c4256 clientfield::increment("pap_projectile_end_fx", 1);
    waitframe(1);
    var_62c4256 delete();
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xccb290ad, Offset: 0x49e8
// Size: 0x8c
function function_377b1d6d() {
    level waittill(#"hash_41c098a05040b314");
    level flag::set("flag_open_sun_deck_power_doors");
    level thread function_aa7ff2d9();
    level waittill(#"hash_609a3944e7a7d4c3");
    level flag::set("flag_open_grand_staircase_lower_power_doors");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x755d9757, Offset: 0x4a80
// Size: 0xa4
function function_aa7ff2d9() {
    level thread scene::play("p8_fxanim_zm_zod_sent_trail1_boat_bundle", "boat_break");
    level waittill(#"hash_5ca90be035a1c92b");
    e_clip = getent("e_clip_lifeboat", "targetname");
    if (isdefined(e_clip)) {
        e_clip connectpaths();
        e_clip notsolid();
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x532c4eb2, Offset: 0x4b30
// Size: 0x4dc
function function_6058ef28() {
    level waittill(#"hash_5ae5281126d5236f");
    level thread scene::play("p8_fxanim_zm_zod_smokestack_01_bundle", "Shot 2");
    level waittill(#"hash_393ef28eb68b1cb");
    array::run_all(util::get_active_players(), &function_66b6e720, "p8_fxanim_zm_zod_smokestack_01_bundle");
    level flag::set("flag_open_grand_staircase_upper_power_doors");
    level thread scene::play("p8_fxanim_zm_zod_sent_trail2_skylight_bundle");
    level waittill(#"hash_35bd56ac05bd31c9");
    level flag::set("flag_open_cargo_hold_power_door");
    level exploder::exploder("fxexp_power_trail_burst_iceberg");
    level thread scene::play("p8_fxanim_zm_zod_sent_trail2_cargo_hatch_bundle");
    var_198b4e5c = getentarray("fc_hatch_cover", "targetname");
    foreach (e_blocker in var_198b4e5c) {
        e_blocker connectpaths();
        e_blocker delete();
    }
    a_e_players = getplayers();
    nd_cargo_hatch = getvehiclenode("nd_cargo_hatch", "targetname");
    var_91e8678a = 312 * 312;
    foreach (e_player in a_e_players) {
        if (distance2dsquared(e_player.origin, nd_cargo_hatch.origin) <= var_91e8678a) {
            e_player playerknockback(1);
            e_player applyknockback(100, e_player.origin - (nd_cargo_hatch.origin[0], nd_cargo_hatch.origin[1], e_player.origin[2]));
            e_player playerknockback(0);
            e_player playrumbleonentity("damage_heavy");
        }
    }
    if (isdefined(level.ai[#"axis"]) && level.ai[#"axis"].size) {
        var_dce7716b = array::get_all_closest(nd_cargo_hatch.origin, level.ai[#"axis"], undefined, undefined, 312);
        var_cd02461b = array::filter(var_dce7716b, 0, &zm_fasttravel::function_6c856fde);
        foreach (e_zombie in var_cd02461b) {
            e_zombie zombie_utility::setup_zombie_knockdown(nd_cargo_hatch);
        }
    }
    level flag::set("forecastle_cargo_hatch_destroyed");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x711d591e, Offset: 0x5018
// Size: 0xb4
function function_531fd4b6() {
    level waittill(#"hash_703c6b32242cc333");
    level flag::set("flag_open_midship_power_doors");
    level exploder::exploder("fxexp_power_trail_burst_midship");
    level thread scene::play("p8_fxanim_zm_zod_sent_trail3_grate_bundle");
    level waittill(#"hash_5b1017b8dcf55c09");
    level thread scene::play("p8_fxanim_zm_zod_sent_trail3_fan_bundle");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x9313e56d, Offset: 0x50d8
// Size: 0x304
function water_init() {
    level.e_clip_water_fore = getent("e_clip_water_fore", "targetname");
    level.var_af197ec = struct::get("s_water_height_flooded_fore").origin[2];
    level.var_1b85943e = struct::get("s_water_height_drained_fore").origin[2];
    level.e_clip_water_aft = getent("e_clip_water_aft", "targetname");
    level.var_d47c96d5 = struct::get("s_water_height_flooded_aft").origin[2];
    level.var_7836c664 = struct::get("s_water_height_drained_aft").origin[2];
    level.e_clip_water_fore.origin = (level.e_clip_water_fore.origin[0], level.e_clip_water_fore.origin[1], level.var_af197ec);
    level.e_clip_water_fore.angles = (level.e_clip_water_fore.angles[0], level.e_clip_water_fore.angles[1], 0);
    level.forewater = function_d3786e2e(level.e_clip_water_fore getentitynumber());
    level.e_clip_water_aft.origin = (level.e_clip_water_aft.origin[0], level.e_clip_water_aft.origin[1], level.var_d47c96d5);
    level.e_clip_water_aft.angles = (level.e_clip_water_aft.angles[0], level.e_clip_water_aft.angles[1], 0);
    level.aftwater = function_d3786e2e(level.e_clip_water_aft getentitynumber());
    level.e_clip_water_fore clientfield::increment("update_wave_water_height", 1);
    level.e_clip_water_aft clientfield::increment("update_wave_water_height", 1);
    level flag::set(#"water_initialized");
    function_ea9f953();
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0x8683d2d0, Offset: 0x53e8
// Size: 0x224
function function_ea9f953(b_fore = 1, b_aft = 1) {
    if (b_fore) {
        t_use_water_pump_fore = getent("t_use_water_pump_fore", "targetname");
        var_52a797c0 = struct::get("water_pump_fore", "targetname");
        var_52a797c0 scene::play(#"p8_fxanim_zm_zod_water_pump_bundle", "end");
        level thread function_b0a7ca7(t_use_water_pump_fore, var_52a797c0, level.e_clip_water_fore, "water_drained_fore", 40, level.var_1b85943e, -1.5, "fxexp_ambient_drain_cargo", "exp_lgt_underwater_cargo", "sfx_waterdrain_fore");
        level exploder::exploder("exp_lgt_underwater_cargo");
    }
    if (b_aft) {
        t_use_water_pump_aft = getent("t_use_water_pump_aft", "targetname");
        var_a3423419 = struct::get("water_pump_aft", "targetname");
        var_a3423419 scene::play(#"p8_fxanim_zm_zod_water_pump_bundle", "end");
        level thread function_b0a7ca7(t_use_water_pump_aft, var_a3423419, level.e_clip_water_aft, "water_drained_aft", 30, level.var_7836c664, -0.75, "fxexp_ambient_drain_boilers", "exp_lgt_underwater_engine", "sfx_waterdrain_aft");
        level exploder::exploder("exp_lgt_underwater_engine");
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 10, eflags: 0x5 linked
// Checksum 0x127412d0, Offset: 0x5618
// Size: 0x29c
function private function_b0a7ca7(var_32be30af, var_4c2f2156, var_eb6a4856, var_bbaf1a87, n_time, var_65feb6ff, var_c6653d4, var_ff884319, var_90c00a3d, var_4cdff787) {
    self notify(var_bbaf1a87 + "_water_pump");
    self endon(var_bbaf1a87 + "_water_pump");
    if (function_8b1a219a()) {
        var_32be30af sethintstring(#"hash_674fd03e212ed707");
    } else {
        var_32be30af sethintstring(#"hash_200f613f8001b6b9");
    }
    var_32be30af setvisibletoall();
    var_a33249cf = var_4c2f2156.scene_ents[#"prop 1"];
    waitresult = var_32be30af waittill(#"trigger");
    var_32be30af setinvisibletoall();
    if (isdefined(waitresult.activator)) {
        waitresult.activator notify(#"hash_361427de75870cde");
    }
    var_a33249cf playsound(#"hash_7dbe54dbc8709530");
    var_a33249cf playloopsound(#"hash_5f1c2aeb92331d60");
    level clientfield::set(var_4cdff787, 1);
    var_4c2f2156 thread function_1d8df872(1);
    function_b40f577b(var_eb6a4856, var_bbaf1a87, n_time, var_65feb6ff, var_c6653d4, var_ff884319, var_90c00a3d, 1);
    var_4c2f2156 thread function_1d8df872(0);
    var_a33249cf playsound(#"hash_1fc479499a911511");
    var_a33249cf stoploopsound();
    level clientfield::set(var_4cdff787, 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x835efcc5, Offset: 0x58c0
// Size: 0xb4
function function_1d8df872(b_on) {
    self notify("3a5c7f6a88fea3f9");
    self endon("3a5c7f6a88fea3f9");
    if (b_on) {
        self scene::play(#"p8_fxanim_zm_zod_water_pump_bundle", "start");
        self scene::play(#"p8_fxanim_zm_zod_water_pump_bundle", "on");
        return;
    }
    self scene::play(#"p8_fxanim_zm_zod_water_pump_bundle", "end");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xc7d9c6e4, Offset: 0x5980
// Size: 0x4c
function function_39dfeedc() {
    level flag::clear(#"hash_7060183fc29995b4");
    wait 150;
    level flag::set(#"hash_7060183fc29995b4");
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x9f6b682d, Offset: 0x59d8
// Size: 0xa4
function change_water_height_fore(b_drain) {
    if (b_drain) {
        function_b40f577b(level.e_clip_water_fore, "water_drained_fore", 40, level.var_1b85943e, -1.5, "fxexp_ambient_drain_cargo", "exp_lgt_underwater_cargo", 1);
        return;
    }
    function_b40f577b(level.e_clip_water_fore, "water_drained_fore", 40, level.var_af197ec, 0, "fxexp_ambient_drain_cargo", "exp_lgt_underwater_cargo", 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0xf57be20b, Offset: 0x5a88
// Size: 0xa4
function change_water_height_aft(b_drain) {
    if (b_drain) {
        function_b40f577b(level.e_clip_water_aft, "water_drained_aft", 30, level.var_7836c664, -0.75, "fxexp_ambient_drain_boilers", "exp_lgt_underwater_engine", 1);
        return;
    }
    function_b40f577b(level.e_clip_water_aft, "water_drained_aft", 30, level.var_d47c96d5, 0, "fxexp_ambient_drain_boilers", "exp_lgt_underwater_engine", 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 8, eflags: 0x5 linked
// Checksum 0xb2eb080b, Offset: 0x5b38
// Size: 0x3d6
function private function_b40f577b(var_eb6a4856, var_bbaf1a87, n_time, var_65feb6ff, var_c6653d4, var_ff884319, var_90c00a3d, b_drain) {
    level notify(var_bbaf1a87 + "_end");
    level endon(var_bbaf1a87 + "_end");
    level.(var_bbaf1a87) = b_drain;
    if (b_drain) {
        if (var_bbaf1a87 == "water_drained_fore") {
            level clientfield::set("" + #"hash_7f2f74f05d1f1b75", 2);
            level thread scene::play("p8_fxanim_zm_zod_cargo_hold_net_02_bundle", "Shot 2");
            level thread function_94040dcd(1, var_eb6a4856, "" + #"hash_2994a957c49bf321", 570);
            level thread function_39dfeedc();
        } else {
            level thread function_94040dcd(1, var_eb6a4856, "" + #"hash_7e91637e80ad93", 200);
        }
        level notify(var_bbaf1a87 + "_drain_start");
        level exploder::exploder(var_ff884319);
        level exploder::exploder(var_ff884319 + "2");
        level exploder::stop_exploder(var_90c00a3d);
        var_eb6a4856 function_8faf37bb(n_time, var_65feb6ff, var_c6653d4);
        level flag::set(var_bbaf1a87);
        level notify(var_bbaf1a87 + "_drain_finish");
        return;
    }
    if (var_bbaf1a87 == "water_drained_fore") {
        level clientfield::set("" + #"hash_7f2f74f05d1f1b75", 3);
        level thread scene::play("p8_fxanim_zm_zod_cargo_hold_net_02_bundle", "Shot 3");
        level thread function_94040dcd(0, var_eb6a4856, "" + #"hash_7e91637e80ad93", 570);
    } else {
        level thread function_94040dcd(0, var_eb6a4856, "" + #"hash_7e91637e80ad93", 200);
    }
    level notify(var_bbaf1a87 + "_refill_start");
    level exploder::stop_exploder(var_ff884319);
    level exploder::stop_exploder(var_ff884319 + "2");
    level exploder::exploder(var_90c00a3d);
    var_eb6a4856 function_8faf37bb(n_time, var_65feb6ff, var_c6653d4);
    level flag::clear(var_bbaf1a87);
    level notify(var_bbaf1a87 + "_refill_finish");
}

// Namespace zm_zodt8/zm_zodt8
// Params 3, eflags: 0x5 linked
// Checksum 0xecfd4942, Offset: 0x5f18
// Size: 0x124
function private function_8faf37bb(n_time, var_65feb6ff, var_c6653d4) {
    self clientfield::set("change_wave_water_height", 1);
    self moveto((self.origin[0], self.origin[1], var_65feb6ff), n_time);
    self rotateroll(var_c6653d4, n_time);
    self waittill(#"movedone");
    self.origin = (self.origin[0], self.origin[1], var_65feb6ff);
    self.angles = (self.angles[0], self.angles[1], var_c6653d4);
    util::wait_network_frame();
    self clientfield::set("change_wave_water_height", 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 4, eflags: 0x1 linked
// Checksum 0xc063e124, Offset: 0x6048
// Size: 0xa4
function function_94040dcd(b_on, var_eb6a4856, str_clientfield, var_ff4a7150) {
    if (b_on) {
        while (var_eb6a4856.origin[2] > var_ff4a7150) {
            waitframe(1);
        }
        clientfield::set(str_clientfield, 0);
        return;
    }
    while (var_eb6a4856.origin[2] < var_ff4a7150) {
        waitframe(1);
    }
    clientfield::set(str_clientfield, 1);
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x76b86c91, Offset: 0x60f8
// Size: 0x21c
function function_3ad6764f() {
    exploder::exploder("exp_lgt_start_iceberg_spotlights");
    exploder::exploder("exp_lgt_forecastle_gamplay");
    exploder::exploder("exp_lgt_forecastle_pre_clean");
    level flag::wait_till("start_zombie_round_logic");
    util::delay("smokestack01", undefined, &scene::play, "p8_fxanim_zm_zod_smokestack_01_bundle", "Shot 1");
    util::delay("smokestack02", undefined, &scene::play, "p8_fxanim_zm_zod_smokestack_02_bundle", "Shot 1");
    util::delay("wire_snaps", undefined, &scene::play, "p8_fxanim_zm_zod_smokestack_wire_snap_bundle");
    scene::add_scene_func("p8_fxanim_zm_zod_iceberg_bundle", &function_4b17dd44, "iceberg_impact");
    a_ents = getentarray("iceberg_fxanim_objects", "script_noteworthy");
    level thread scene::play("p8_fxanim_zm_zod_iceberg_bundle", "iceberg_impact", a_ents);
    level thread function_b8378fa9("boat_break", "iceberg_boat_break_lookat_trigger");
    level flag::wait_till(#"hash_6d96664f656363a1");
    level scene::stop("p8_fxanim_zm_zod_skybox_bundle");
    level thread scene::play("p8_fxanim_zm_zod_skybox_bundle", "impact");
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0x1561ba89, Offset: 0x6320
// Size: 0x9c
function function_b8378fa9(str_shot, str_trigger) {
    trigger::wait_till(str_trigger, "targetname");
    level thread scene::play("p8_fxanim_zm_zod_iceberg_bundle", str_shot);
    t_trigger = getent(str_trigger, "targetname");
    if (isdefined(t_trigger)) {
        t_trigger delete();
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x7939ce39, Offset: 0x63c8
// Size: 0x13c
function function_4b17dd44(a_ents) {
    level flag::wait_till_any(array("connect_forecastle_to_bridge", "connect_forecastle_to_state_rooms"));
    while (zm_zonemgr::any_player_in_zone("zone_forecastle_upper") || zm_zonemgr::any_player_in_zone("zone_forecastle_lower") || zm_zonemgr::any_player_in_zone("zone_bridge") || zm_zonemgr::any_player_in_zone("zone_state_rooms_front")) {
        wait 1;
    }
    if (isdefined(a_ents[#"p8_fxanim_zm_zod_iceberg_forecastle_damage_ice_chunks_mod"])) {
        a_ents[#"p8_fxanim_zm_zod_iceberg_forecastle_damage_ice_chunks_mod"] delete();
    }
    if (isdefined(a_ents[#"p8_fxanim_zm_zod_iceberg_forecastle_avalanche_mod"])) {
        a_ents[#"p8_fxanim_zm_zod_iceberg_forecastle_avalanche_mod"] delete();
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xcbbcea4e, Offset: 0x6510
// Size: 0x24
function player_out_of_playable_area_monitor_callback() {
    if (isdefined(self.var_f22c83f5) && self.var_f22c83f5) {
        return false;
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x86c1a9ce, Offset: 0x6540
// Size: 0x76
function offhand_weapon_overrride() {
    zm_loadout::register_tactical_grenade_for_level(#"zhield_dw", 1);
    zm_loadout::register_tactical_grenade_for_level(#"zhield_frost_dw");
    level.var_70f7eb75 = getweapon(#"zhield_frost_dw");
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0xa89237e5, Offset: 0x65c0
// Size: 0xc6
function offhand_weapon_give_override(str_weapon) {
    self endon(#"death");
    if (zm_loadout::is_tactical_grenade(str_weapon) && isdefined(self zm_loadout::get_player_tactical_grenade()) && !self zm_loadout::is_player_tactical_grenade(str_weapon)) {
        self setweaponammoclip(self zm_loadout::get_player_tactical_grenade(), 0);
        self takeweapon(self zm_loadout::get_player_tactical_grenade());
    }
    return false;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xc67a361e, Offset: 0x6690
// Size: 0x1244
function zone_init() {
    level flag::init("always_on");
    level flag::set("always_on");
    setdvar(#"hash_6ec233a56690f409", 1);
    zm_zonemgr::zone_init("zone_forecastle_upper");
    level.disable_kill_thread = 1;
    zm_zonemgr::add_adjacent_zone("zone_forecastle_upper", "zone_forecastle_lower", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_forecastle_lower", "zone_state_rooms_front", "connect_forecastle_to_state_rooms");
    zm_zonemgr::add_adjacent_zone("zone_forecastle_lower", "zone_mail_room", "connect_forecastle_to_mail");
    zm_zonemgr::add_adjacent_zone("zone_forecastle_lower", "zone_bridge", "connect_forecastle_to_bridge");
    zm_zonemgr::add_adjacent_zone("zone_zipline_fore", "zone_forecastle_lower", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_zipline_fore", "zone_forecastle_upper", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_zipline_fore", "zone_fore_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_zipline_aft", "zone_poop_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_zipline_aft", "zone_poop_deck_lower", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_zipline_aft", "zone_fore_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_state_rooms_front", "zone_forecastle_lower", "connect_forecastle_to_state_rooms");
    zm_zonemgr::add_adjacent_zone("zone_state_rooms_front", "zone_state_rooms_rear", "connect_forecastle_to_state_rooms");
    zm_zonemgr::add_adjacent_zone("zone_state_rooms_rear", "zone_state_rooms_front", "connect_forecastle_to_state_rooms");
    zm_zonemgr::add_adjacent_zone("zone_state_rooms_rear", "millionaire_suite_zone", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_state_rooms_front", "zone_state_rooms_rear", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_state_rooms_rear", "zone_state_rooms_front", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_c_deck", "zone_grand_stairs_b_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_c_deck", "zone_grand_stairs_d_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_c_deck", "zone_grand_stairs_d_deck", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_c_deck", "zone_grand_stairs_d_deck", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_c_deck", "zone_dining_hall_fore", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "millionaire_suite_zone", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "millionaire_suite_zone", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "millionaire_suite_zone", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "zone_grand_stairs_c_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "zone_grand_stairs_c_deck", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "zone_grand_stairs_c_deck", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_bottom", "zone_grand_stairs_d_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_d_deck", "zone_grand_stairs_bottom", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_dining_hall_fore", "zone_grand_stairs_c_deck", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_dining_hall_fore", "zone_dining_hall_aft", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_dining_hall_aft", "zone_dining_hall_fore", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_dining_hall_aft", "zone_dining_hall_fore", "connect_dining_to_promenade");
    zm_zonemgr::add_adjacent_zone("zone_dining_hall_aft", "zone_galley", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_dining_hall_aft", "zone_galley", "connect_dining_to_promenade");
    zm_zonemgr::add_adjacent_zone("zone_galley", "zone_dining_hall_aft", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("zone_galley", "zone_dining_hall_aft", "connect_dining_to_promenade");
    zm_zonemgr::add_adjacent_zone("zone_galley", "zone_promenade_deck", "connect_dining_to_promenade");
    zm_zonemgr::add_adjacent_zone("millionaire_suite_zone", "zone_grand_stairs_d_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("millionaire_suite_zone", "zone_grand_stairs_d_deck", "connect_grand_stair_lower_to_dining");
    zm_zonemgr::add_adjacent_zone("millionaire_suite_zone", "zone_grand_stairs_d_deck", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("millionaire_suite_zone", "zone_state_rooms_rear", "connect_state_rooms_to_millionaire");
    zm_zonemgr::add_adjacent_zone("zone_bridge", "zone_grand_stairs_a_deck", "connect_bridge_to_grand_stairs");
    zm_zonemgr::add_adjacent_zone("zone_bridge", "zone_forecastle_lower", "connect_forecastle_to_bridge");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_a_deck", "zone_bridge", "connect_bridge_to_grand_stairs");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_a_deck", "zone_grand_stairs_b_deck", "connect_bridge_to_grand_stairs");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_a_deck", "zone_grand_stairs_b_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_a_deck", "zone_fore_deck", "connect_grand_stairs_to_boat_deck");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_a_deck", "zone_grand_stairs_b_deck", "connect_grand_stairs_to_lounge");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_b_deck", "zone_grand_stairs_a_deck", "connect_bridge_to_grand_stairs");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_b_deck", "zone_grand_stairs_a_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_b_deck", "zone_grand_stairs_c_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_b_deck", "zone_lounge", "connect_grand_stairs_to_lounge");
    zm_zonemgr::add_adjacent_zone("zone_grand_stairs_b_deck", "zone_grand_stairs_a_deck", "connect_grand_stairs_to_lounge");
    zm_zonemgr::add_adjacent_zone("zone_lounge", "zone_grand_stairs_b_deck", "connect_grand_stairs_to_lounge");
    zm_zonemgr::add_adjacent_zone("zone_lounge", "zone_lounge_aft_deck", "connect_suites_to_aft");
    zm_zonemgr::add_adjacent_zone("zone_fore_deck", "zone_grand_stairs_a_deck", "connect_grand_stairs_to_boat_deck");
    zm_zonemgr::add_adjacent_zone("zone_fore_deck", "zone_mid_deck", "connect_grand_stairs_to_boat_deck");
    zm_zonemgr::add_adjacent_zone("zone_fore_deck", "zone_mid_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_mid_deck", "zone_fore_deck", "connect_grand_stairs_to_boat_deck");
    zm_zonemgr::add_adjacent_zone("zone_mid_deck", "zone_fore_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_mid_deck", "zone_promenade_deck", "connect_foredeck_promenade");
    zm_zonemgr::add_adjacent_zone("zone_mid_deck", "zone_sun_deck_stbd", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_mid_deck", "zone_sun_deck_port", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_mid_deck", "zone_lounge_aft_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_sun_deck_stbd", "zone_mid_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_sun_deck_stbd", "zone_aft_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_sun_deck_port", "zone_mid_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_sun_deck_port", "zone_lounge_aft_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_sun_deck_port", "zone_promenade_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck", "zone_sun_deck_stbd", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck", "zone_lounge_aft_deck", "connect_suites_to_aft");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck", "zone_lounge_aft_deck", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck", "zone_lounge_aft_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck", "zone_aft_deck_lower", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_lounge_aft_deck", "zone_mid_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_lounge_aft_deck", "zone_lounge", "connect_suites_to_aft");
    zm_zonemgr::add_adjacent_zone("zone_lounge_aft_deck", "zone_aft_deck", "connect_suites_to_aft");
    zm_zonemgr::add_adjacent_zone("zone_lounge_aft_deck", "zone_aft_deck", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_lounge_aft_deck", "zone_aft_deck", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_lounge_aft_deck", "zone_sun_deck_port", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_promenade_deck", "zone_aft_deck_lower", "connect_promenade_to_poop");
    zm_zonemgr::add_adjacent_zone("zone_promenade_deck", "zone_mid_deck", "connect_foredeck_promenade");
    zm_zonemgr::add_adjacent_zone("zone_promenade_deck", "zone_galley", "connect_dining_to_promenade");
    zm_zonemgr::add_adjacent_zone("zone_promenade_deck", "zone_sun_deck_port", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck_lower", "zone_promenade_deck", "connect_promenade_to_poop");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck_lower", "zone_poop_deck_lower", "connect_promenade_to_poop");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck_lower", "zone_aft_deck", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck_lower", "zone_poop_deck_lower", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_aft_deck_lower", "zone_poop_deck_lower", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck", "zone_poop_deck_lower", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck", "zone_poop_deck_lower", "connect_promenade_to_poop");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck_lower", "zone_poop_deck", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck_lower", "zone_poop_deck", "connect_promenade_to_poop");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck_lower", "zone_aft_deck_lower", "connect_aft_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck_lower", "zone_aft_deck_lower", "connect_promenade_to_poop");
    zm_zonemgr::add_adjacent_zone("zone_poop_deck_lower", "zone_berths", "connect_berths_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_cargo", "zone_mail_room", "connect_mail_rooms_to_cargo");
    zm_zonemgr::add_adjacent_zone("zone_mail_room", "zone_forecastle_lower", "connect_forecastle_to_mail");
    zm_zonemgr::add_adjacent_zone("zone_mail_room", "zone_cargo", "connect_mail_rooms_to_cargo");
    zm_zonemgr::add_adjacent_zone("zone_berths", "zone_poop_deck_lower", "connect_berths_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_berths", "zone_berths_subdeck", "connect_berths_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_berths_subdeck", "zone_berths", "connect_berths_to_poop_deck");
    zm_zonemgr::add_adjacent_zone("zone_berths_subdeck", "zone_provisions", "connect_berths_provisions");
    zm_zonemgr::add_zone_flags("connect_berths_to_poop_deck", "connect_berths_provisions");
    zm_zonemgr::add_adjacent_zone("zone_provisions", "zone_berths_subdeck", "connect_berths_provisions");
    zm_zonemgr::add_adjacent_zone("zone_provisions", "zone_upper_engine_room", "connect_provisions_to_engine_room");
    zm_zonemgr::add_zone_flags("connect_grand_stairs_to_boat_deck", "power_on");
    zm_zonemgr::add_zone_flags("connect_cargo_to_mail_room", "power_on");
    zm_zonemgr::add_zone_flags("connect_engine", "power_on");
    zm_zonemgr::add_adjacent_zone("zone_upper_engine_room", "zone_provisions", "connect_provisions_to_engine_room");
    zm_zonemgr::add_adjacent_zone("zone_engine", "zone_upper_engine_room", "connect_provisions_to_engine_room", 0);
    zm_zonemgr::add_adjacent_zone("zone_engine", "zone_boiler_room", "connect_provisions_to_engine_room", 0);
    zm_zonemgr::add_adjacent_zone("zone_engine", "zone_turbine_room", "connect_provisions_to_engine_room", 0);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0xe320fa, Offset: 0x78e0
// Size: 0x172
function function_18f12f69(str_zone_name) {
    switch (str_zone_name) {
    case #"zone_zipline_fore":
    case #"zone_zipline_aft":
        foreach (e_player in getplayers()) {
            if (isdefined(e_player.var_16735873) && e_player.var_16735873) {
                if (e_player.var_5817f611 === "aft_to_fore" && str_zone_name == "zone_zipline_fore") {
                    return 1;
                }
                if (e_player.var_5817f611 === "fore_to_aft" && str_zone_name == "zone_zipline_aft") {
                    return 1;
                }
            }
        }
        return zm_zonemgr::any_player_in_zone(str_zone_name);
    default:
        return zm_zonemgr::any_player_in_zone(str_zone_name);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xeead41b8, Offset: 0x7a60
// Size: 0x874
function function_32d2bdc8() {
    if (self.archetype !== #"zombie") {
        return;
    }
    if (!isdefined(self.zone_name)) {
        return;
    }
    if (randomint(100) < 15) {
        return;
    }
    var_1c65f0a = array("zone_berths", "zone_berths_subdeck", "zone_provisions");
    var_c9c43b66 = array("zone_upper_engine_room", "zone_engine", "zone_boiler_room", "zone_turbine_room", "zone_cargo", "zone_mail_room");
    var_dd90adf6 = array("zone_poop_deck", "zone_poop_deck_lower", "zone_fore_deck", "zone_mid_deck", "zone_sun_deck_stbd", "zone_sun_deck_port", "zone_aft_deck", "zone_aft_deck_lower", "zone_forecastle_upper", "zone_forecastle_lower");
    var_a1310885 = array("zone_state_rooms_front", "zone_state_rooms_rear", "millionaire_suite_zone", "zone_grand_stairs_a_deck", "zone_grand_stairs_b_deck", "zone_grand_stairs_c_deck", "zone_grand_stairs_d_deck", "zone_grand_stairs_bottom", "zone_lounge", "zone_lounge_aft_deck", "zone_promenade_deck", "zone_dining_hall_fore", "zone_dining_hall_aft");
    if (isinarray(var_1c65f0a, self.zone_name)) {
        a_models = array(#"hash_636abbe1a523130e", #"hash_5c0ea5a6a5ed7e85", #"hash_b78331fbec32771", #"hash_b78321fbec325be", #"hash_7acfc598beff0154", #"hash_7fc6151633627760", #"hash_7fc6161633627913", #"hash_2037bec607c2dd03", #"hash_75df996f8f4f5df", #"hash_527359033a0fec16", #"hash_75dfa96f8f4f792", #"hash_7887f7fa61198709", #"hash_75dfb96f8f4f945", #"hash_7befa3e8cd85887a", #"hash_2d534835676d4bf0", #"hash_2d534b35676d5109", #"hash_2d534a35676d4f56", #"hash_4e3ccf7051cc76f8", #"hash_4e3cd07051cc78ab", #"hash_2d534d35676d546f", #"hash_17bfc1b5e3c3e731", #"hash_17bfc0b5e3c3e57e", #"hash_2400eb2938a774e4", #"hash_57e57fa51c3077eb", #"hash_2400eb2938a774e4");
    } else if (isinarray(var_c9c43b66, self.zone_name)) {
        a_models = array(#"hash_70f7ce06d71221d1", #"hash_490bb2c56163df6", #"hash_57e57fa51c3077eb", #"hash_2400eb2938a774e4", #"hash_2d534835676d4bf0", #"hash_2d534b35676d5109", #"hash_2d534a35676d4f56", #"hash_2400eb2938a774e4", #"hash_2d534d35676d546f", #"hash_17bfc1b5e3c3e731", #"hash_17bfc0b5e3c3e57e");
    } else if (isinarray(var_dd90adf6, self.zone_name)) {
        if (randomint(100) < 33) {
            a_models = array(#"hash_70f7ce06d71221d1", #"hash_490bb2c56163df6", #"hash_57e57fa51c3077eb", #"hash_2400eb2938a774e4", #"hash_57e580a51c30799e", #"hash_57e580a51c30799e", #"hash_7ba2b528997fa55", #"hash_7ba2b528997fa55");
        }
    } else if (isinarray(var_a1310885, self.zone_name)) {
        a_models = array(#"hash_490bb2c56163df6", #"hash_182b1a4c65e73801", #"hash_182b174c65e732e8", #"hash_182b184c65e7349b", #"hash_2f441451d3b56959", #"hash_cecf5a5c3d66868", #"hash_70f7ce06d71221d1", #"hash_7d45b54d5e3cd677", #"hash_182b174c65e732e8", #"hash_182b184c65e7349b", #"hash_7d45b44d5e3cd4c4", #"hash_cecf5a5c3d66868", #"hash_14c00dedfd2de36a", #"hash_5e3cb12fa50e229c", #"hash_5e3cb22fa50e244f", #"hash_5e3caf2fa50e1f36", #"hash_5e3cb02fa50e20e9", #"hash_5e3cad2fa50e1bd0", #"hash_5e43ac8e88cc1d41", #"hash_1bc5c2590cdbe137", #"hash_1bc5c1590cdbdf84", #"hash_1bc5c0590cdbddd1", #"hash_1bc5bf590cdbdc1e", #"hash_1bc5be590cdbda6b", #"hash_636abbe1a523130e", #"hash_5c0ea5a6a5ed7e85");
    } else if (self.zone_name == "zone_bridge") {
        a_models = array(#"hash_70f7ce06d71221d1", #"hash_490bb2c56163df6", #"hash_57e57fa51c3077eb", #"hash_2400eb2938a774e4", #"hash_2400eb2938a774e4", #"hash_57e580a51c30799e", #"hash_7ba2b528997fa55", #"hash_7ba2b528997fa55");
    } else if (self.zone_name == "zone_galley") {
        a_models = array(#"hash_490bb2c56163df6", #"hash_636abbe1a523130e", #"hash_5c0ea5a6a5ed7e85", #"hash_2d534835676d4bf0", #"hash_2d534b35676d5109", #"hash_182b174c65e732e8");
    }
    if (isdefined(a_models)) {
        self setmodel(a_models[randomint(a_models.size)]);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xe9e7988b, Offset: 0x82e0
// Size: 0x64
function custom_add_vox() {
    zm_audio::loadplayervoicecategories(#"hash_41c3d60c9fdc1c1a");
    zm_audio::loadplayervoicecategories(#"hash_5963a3db3032ab46");
    zm_audio::loadplayervoicecategories(#"hash_34c18561cc19c360");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x75b2f29d, Offset: 0x8350
// Size: 0x87e
function function_d2ba8baa() {
    var_a10acf3c = getplayers();
    var_a10acf3c = function_5ad4b9b0(var_a10acf3c);
    foreach (e_target in var_a10acf3c) {
        if (!isdefined(e_target.var_4e0075f0)) {
            e_target.var_4e0075f0 = 0;
        }
    }
    var_a10acf3c = function_9ed4c915(var_a10acf3c);
    var_aab9fdf2 = function_db31e30b();
    var_7660d5e7 = [];
    foreach (e_player in var_a10acf3c) {
        if (isdefined(e_player.zone_name)) {
            if (!isinarray(var_aab9fdf2, e_player.zone_name) && !isinarray(var_aab9fdf2, hash(e_player.zone_name))) {
                if (!isdefined(var_7660d5e7)) {
                    var_7660d5e7 = [];
                } else if (!isarray(var_7660d5e7)) {
                    var_7660d5e7 = array(var_7660d5e7);
                }
                var_7660d5e7[var_7660d5e7.size] = e_player;
            }
        }
    }
    if (var_7660d5e7.size) {
        var_93dbf0bc = var_7660d5e7[0];
    } else if (var_a10acf3c.size) {
        var_93dbf0bc = var_a10acf3c[0];
    }
    if (!isdefined(var_93dbf0bc)) {
        return undefined;
    }
    var_93dbf0bc.var_4e0075f0++;
    str_player_zone = isdefined(var_93dbf0bc.zone_name) ? var_93dbf0bc.zone_name : var_93dbf0bc zm_utility::get_current_zone();
    a_s_spawn_locs = [];
    if (isdefined(str_player_zone)) {
        if (isdefined(level.zm_loc_types[#"stoker_location"]) && level.zm_loc_types[#"stoker_location"].size > 0) {
            foreach (s_loc in level.zm_loc_types[#"stoker_location"]) {
                if (s_loc.zone_name === str_player_zone) {
                    /#
                        if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                            iprintlnbold("<dev string:x38>" + s_loc.zone_name + "<dev string:x55>");
                        }
                    #/
                    if (!isdefined(a_s_spawn_locs)) {
                        a_s_spawn_locs = [];
                    } else if (!isarray(a_s_spawn_locs)) {
                        a_s_spawn_locs = array(a_s_spawn_locs);
                    }
                    a_s_spawn_locs[a_s_spawn_locs.size] = s_loc;
                }
            }
        }
        if (!a_s_spawn_locs.size) {
            var_fc5b2270 = getnodearray(str_player_zone, "targetname");
            var_7d53907e = var_fc5b2270[0];
            if (isdefined(var_7d53907e.target)) {
                var_2e23111a = struct::get_array(var_7d53907e.target, "targetname");
                foreach (var_504a6ed6 in var_2e23111a) {
                    if (var_504a6ed6.script_noteworthy === "stoker_location") {
                        /#
                            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                                iprintlnbold("<dev string:x6d>");
                            }
                        #/
                        if (!isdefined(a_s_spawn_locs)) {
                            a_s_spawn_locs = [];
                        } else if (!isarray(a_s_spawn_locs)) {
                            a_s_spawn_locs = array(a_s_spawn_locs);
                        }
                        a_s_spawn_locs[a_s_spawn_locs.size] = var_504a6ed6;
                    }
                }
            }
        }
        if (!a_s_spawn_locs.size) {
            var_a35ec363 = zm_cleanup::get_adjacencies_to_zone(str_player_zone);
            var_a35ec363 = array::randomize(var_a35ec363);
            foreach (var_c92978fa in var_a35ec363) {
                var_fc5b2270 = getnodearray(level.zones[var_c92978fa].name, "targetname");
                var_7d53907e = var_fc5b2270[0];
                if (isdefined(var_7d53907e.target)) {
                    var_2e23111a = struct::get_array(var_7d53907e.target, "targetname");
                    foreach (var_504a6ed6 in var_2e23111a) {
                        if (var_504a6ed6.script_noteworthy === "stoker_location") {
                            /#
                                if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                                    iprintlnbold("<dev string:x38>" + s_loc.zone_name + "<dev string:xb5>");
                                }
                            #/
                            if (!isdefined(a_s_spawn_locs)) {
                                a_s_spawn_locs = [];
                            } else if (!isarray(a_s_spawn_locs)) {
                                a_s_spawn_locs = array(a_s_spawn_locs);
                            }
                            a_s_spawn_locs[a_s_spawn_locs.size] = var_504a6ed6;
                        }
                    }
                }
            }
        }
    } else {
        /#
            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                iprintlnbold("<dev string:xd6>");
            }
        #/
    }
    if (a_s_spawn_locs.size) {
        return array::random(a_s_spawn_locs);
    }
    /#
        if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
            iprintlnbold("<dev string:x102>");
        }
    #/
    return undefined;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x5e74f740, Offset: 0x8bd8
// Size: 0x1a0
function function_807f41e9() {
    var_aab9fdf2 = function_db31e30b();
    var_a1d863b2 = isdefined(self.zone_name) ? self.zone_name : zm_zonemgr::get_zone_from_position(self.origin);
    if (!isinarray(var_aab9fdf2, var_a1d863b2)) {
        /#
            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                iprintlnbold("<dev string:x129>" + (isdefined(var_a1d863b2) ? var_a1d863b2 : "<dev string:x153>"));
            }
        #/
        return true;
    }
    if (!isdefined(self.var_3410b290)) {
        self.var_3410b290 = gettime() - 5000;
    }
    n_time = gettime();
    if (gettime() - self.var_3410b290 <= 200) {
        /#
            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                iprintlnbold("<dev string:x164>" + (ishash(var_a1d863b2) ? function_9e72a96(var_a1d863b2) : var_a1d863b2));
            }
        #/
        return true;
    }
    self.var_3410b290 = gettime();
    return false;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xd9bb4bdd, Offset: 0x8d80
// Size: 0x8e0
function function_994c6ce1() {
    if (!isdefined(level.var_801efcc7)) {
        level.var_801efcc7 = struct::get_array("blight_father_location", "script_noteworthy");
    }
    if (level.var_801efcc7.size < 1) {
        self.b_ignore_cleanup = 1;
        return true;
    }
    var_31f7011a = arraycopy(level.players);
    var_31f7011a = function_5ad4b9b0(var_31f7011a);
    var_aab9fdf2 = function_db31e30b();
    var_f7f9223f = [];
    foreach (e_player in var_31f7011a) {
        str_player_zone = isdefined(e_player.zone_name) ? e_player.zone_name : e_player zm_utility::get_current_zone();
        if (isdefined(str_player_zone)) {
            if (!isdefined(var_f7f9223f)) {
                var_f7f9223f = [];
            } else if (!isarray(var_f7f9223f)) {
                var_f7f9223f = array(var_f7f9223f);
            }
            var_f7f9223f[var_f7f9223f.size] = str_player_zone;
        }
    }
    var_255ae8a5 = 0;
    var_dd51f7f0 = [];
    if (var_f7f9223f.size) {
        for (var_5f1d1229 = 0; var_5f1d1229 < 2; var_5f1d1229++) {
            if (!var_255ae8a5) {
                foreach (var_d7eff26a in level.var_801efcc7) {
                    if (isdefined(level.zm_loc_types[#"blight_father_location"]) && level.zm_loc_types[#"blight_father_location"].size > 0) {
                        foreach (s_loc in level.zm_loc_types[#"blight_father_location"]) {
                            if (isinarray(var_f7f9223f, s_loc.zone_name)) {
                                if (!var_5f1d1229) {
                                    if (!isinarray(var_aab9fdf2, s_loc.zone_name)) {
                                        if (!isdefined(var_dd51f7f0)) {
                                            var_dd51f7f0 = [];
                                        } else if (!isarray(var_dd51f7f0)) {
                                            var_dd51f7f0 = array(var_dd51f7f0);
                                        }
                                        var_dd51f7f0[var_dd51f7f0.size] = s_loc;
                                        var_255ae8a5 = 1;
                                    }
                                    continue;
                                }
                                if (!isdefined(var_dd51f7f0)) {
                                    var_dd51f7f0 = [];
                                } else if (!isarray(var_dd51f7f0)) {
                                    var_dd51f7f0 = array(var_dd51f7f0);
                                }
                                var_dd51f7f0[var_dd51f7f0.size] = s_loc;
                                var_255ae8a5 = 1;
                            }
                        }
                    }
                }
            }
            if (!var_255ae8a5) {
                foreach (str_player_zone in var_f7f9223f) {
                    if (!var_5f1d1229) {
                        if (isinarray(var_aab9fdf2, str_player_zone)) {
                            continue;
                        }
                    }
                    var_fc5b2270 = getnodearray(str_player_zone, "targetname");
                    var_7d53907e = var_fc5b2270[0];
                    if (isdefined(var_7d53907e) && isdefined(var_7d53907e.target)) {
                        var_2e23111a = struct::get_array(var_7d53907e.target, "targetname");
                        foreach (var_504a6ed6 in var_2e23111a) {
                            if (var_504a6ed6.script_noteworthy === "blight_father_location") {
                                if (!isdefined(var_dd51f7f0)) {
                                    var_dd51f7f0 = [];
                                } else if (!isarray(var_dd51f7f0)) {
                                    var_dd51f7f0 = array(var_dd51f7f0);
                                }
                                var_dd51f7f0[var_dd51f7f0.size] = var_504a6ed6;
                                var_255ae8a5 = 1;
                            }
                        }
                    }
                }
            }
            if (!var_255ae8a5) {
                foreach (str_player_zone in var_f7f9223f) {
                    if (!var_5f1d1229) {
                        if (isinarray(var_aab9fdf2, str_player_zone)) {
                            continue;
                        }
                    }
                    var_a35ec363 = zm_cleanup::get_adjacencies_to_zone(str_player_zone);
                    var_a35ec363 = array::randomize(var_a35ec363);
                    foreach (var_c92978fa in var_a35ec363) {
                        var_fc5b2270 = getnodearray(level.zones[var_c92978fa].name, "targetname");
                        var_7d53907e = var_fc5b2270[0];
                        if (isdefined(var_7d53907e.target)) {
                            var_2e23111a = struct::get_array(var_7d53907e.target, "targetname");
                            foreach (var_504a6ed6 in var_2e23111a) {
                                if (var_504a6ed6.script_noteworthy === "blight_father_location") {
                                    if (!isdefined(var_dd51f7f0)) {
                                        var_dd51f7f0 = [];
                                    } else if (!isarray(var_dd51f7f0)) {
                                        var_dd51f7f0 = array(var_dd51f7f0);
                                    }
                                    var_dd51f7f0[var_dd51f7f0.size] = var_504a6ed6;
                                    var_255ae8a5 = 1;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    if (var_dd51f7f0.size) {
        var_b2aa54a9 = array::random(var_dd51f7f0);
        self zm_ai_utility::function_a8dc3363(var_b2aa54a9);
    } else {
        /#
            if (getdvarint(#"hash_1f8efa579fee787c", 0)) {
                iprintlnbold("<dev string:x196>");
            }
        #/
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x5a8134b3, Offset: 0x9668
// Size: 0x32
function function_5ad4b9b0(&array) {
    return array::filter(array, 0, &function_fe38c9ac);
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x39f3ce2e, Offset: 0x96a8
// Size: 0x28
function function_fe38c9ac(e_player) {
    return isdefined(e_player.am_i_valid) && e_player.am_i_valid;
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x67f8b542, Offset: 0x96d8
// Size: 0x32
function function_9ed4c915(&a_ents) {
    return array::merge_sort(a_ents, &function_21b9c7c6, 1);
}

// Namespace zm_zodt8/zm_zodt8
// Params 3, eflags: 0x1 linked
// Checksum 0xaec5bada, Offset: 0x9718
// Size: 0x34
function function_21b9c7c6(e1, e2, b_lowest_first) {
    return e1.var_4e0075f0 <= e2.var_4e0075f0;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xdb696f18, Offset: 0x9758
// Size: 0x156
function function_db31e30b() {
    var_aab9fdf2 = [];
    var_3bb04aab = [];
    var_3bb04aab = getaiarchetypearray(#"stoker");
    var_3bb04aab = arraycombine(var_3bb04aab, getaiarchetypearray(#"blight_father"), 0, 0);
    for (i = 0; i < var_3bb04aab.size; i++) {
        var_1c1d0dc7 = isdefined(var_3bb04aab[i].zone_name) ? var_3bb04aab[i].zone_name : zm_zonemgr::get_zone_from_position(var_3bb04aab[i].origin);
        if (isdefined(var_1c1d0dc7)) {
            if (!isdefined(var_aab9fdf2)) {
                var_aab9fdf2 = [];
            } else if (!isarray(var_aab9fdf2)) {
                var_aab9fdf2 = array(var_aab9fdf2);
            }
            var_aab9fdf2[var_aab9fdf2.size] = var_1c1d0dc7;
        }
    }
    return var_aab9fdf2;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xe57e474e, Offset: 0x98b8
// Size: 0xac
function sndfunctions() {
    if (zm_utility::is_standard()) {
        level.zmannouncerprefix = "rush";
    } else {
        level.zmannouncerprefix = "prst";
    }
    zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
    level thread setupmusic();
    level thread custom_add_vox();
    level thread setup_personality_character_exerts();
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x3919ca16, Offset: 0x9970
// Size: 0x1d4
function setupmusic() {
    zm_audio::musicstate_create("round_start", 3, "zodt8_roundstart_1", "zodt8_roundstart_2");
    zm_audio::musicstate_create("round_start_first", 3, "zodt8_roundstart_first_1");
    zm_audio::musicstate_create("round_end", 3, "zodt8_roundend_1", "zodt8_roundend_2", "zodt8_roundend_3");
    zm_audio::musicstate_create("game_over", 5, "zodt8_death");
    zm_audio::musicstate_create("sentinel_artifact_activated", 4, "zodt8_sentinel_artifact");
    zm_audio::musicstate_create("ee_song", 4, "zodt8_ee_song");
    level thread zm_audio::function_3442c81a(#"hash_69ebb1abe1e2d695", "location_staterooms");
    level thread zm_audio::function_3442c81a(#"hash_4254e25038a56598", "location_stairwell");
    level thread zm_audio::function_3442c81a(#"hash_1f322078edfcfba3", "location_bowels");
    level thread zm_audio::function_3442c81a(#"hash_3325f6b80c910400", "location_dining_room");
    level thread zm_audio::function_3442c81a(#"hash_64c435d9bd0cdd9e", "location_aft_deck");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xeb5b5cba, Offset: 0x9b50
// Size: 0x3c8
function setup_personality_character_exerts() {
    level.exert_sounds[1][#"hitmed"] = "vox_plr_1_exert_pain";
    level.exert_sounds[2][#"hitmed"] = "vox_plr_2_exert_pain";
    level.exert_sounds[3][#"hitmed"] = "vox_plr_3_exert_pain";
    level.exert_sounds[4][#"hitmed"] = "vox_plr_4_exert_pain";
    level.exert_sounds[1][#"hitlrg"] = "vox_plr_1_exert_pain";
    level.exert_sounds[2][#"hitlrg"] = "vox_plr_2_exert_pain";
    level.exert_sounds[3][#"hitlrg"] = "vox_plr_2_exert_pain";
    level.exert_sounds[4][#"hitlrg"] = "vox_plr_3_exert_pain";
    level.exert_sounds[1][#"drowning"] = "vox_plr_1_exert_underwater_air_low";
    level.exert_sounds[2][#"drowning"] = "vox_plr_2_exert_underwater_air_low";
    level.exert_sounds[3][#"drowning"] = "vox_plr_3_exert_underwater_air_low";
    level.exert_sounds[4][#"drowning"] = "vox_plr_4_exert_underwater_air_low";
    level.exert_sounds[1][#"cough"] = "vox_plr_1_exert_gas_cough";
    level.exert_sounds[2][#"cough"] = "vox_plr_2_exert_gas_cough";
    level.exert_sounds[3][#"cough"] = "vox_plr_3_exert_gas_cough";
    level.exert_sounds[4][#"cough"] = "vox_plr_4_exert_gas_cough";
    level.exert_sounds[1][#"underwater_emerge"] = "vox_plr_1_exert_underwater_emerge_breath";
    level.exert_sounds[2][#"underwater_emerge"] = "vox_plr_2_exert_underwater_emerge_breath";
    level.exert_sounds[3][#"underwater_emerge"] = "vox_plr_3_exert_underwater_emerge_breath";
    level.exert_sounds[4][#"underwater_emerge"] = "vox_plr_4_exert_underwater_emerge_breath";
    level.exert_sounds[1][#"underwater_gasp"] = "vox_plr_1_exert_underwater_emerge_gasp";
    level.exert_sounds[2][#"underwater_gasp"] = "vox_plr_2_exert_underwater_emerge_gasp";
    level.exert_sounds[3][#"underwater_gasp"] = "vox_plr_3_exert_underwater_emerge_gasp";
    level.exert_sounds[4][#"underwater_gasp"] = "vox_plr_4_exert_underwater_emerge_gasp";
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xe06bdd86, Offset: 0x9f20
// Size: 0x13c
function on_player_spawned() {
    self thread function_17ac86f7();
    self thread function_8e0b371();
    level flag::wait_till(#"start_zombie_round_logic");
    level flag::wait_till(#"water_initialized");
    if (isalive(self) && isplayer(self)) {
        self thread function_5ef52c07();
        self thread function_4ec55dd();
        self thread function_51581a6c();
    }
    level.e_clip_water_fore clientfield::increment("update_wave_water_height", 1);
    level.e_clip_water_aft clientfield::increment("update_wave_water_height", 1);
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xcc40ecfa, Offset: 0xa068
// Size: 0x180
function function_51581a6c() {
    self endon(#"death");
    level endon(#"hash_25d8c88ff3f91ee5");
    level flag::wait_till("power_on");
    self thread function_f1a16811();
    while (true) {
        t_result = trigger::wait_till("trigger_water_drippies", "targetname", self);
        if (self isplayerunderwater()) {
            wait 0.5;
            continue;
        }
        self clientfield::set_to_player("water_drippies", 1);
        while (!self isplayerunderwater() && self istouching(t_result)) {
            wait 0.5;
        }
        if (!level flag::get(#"hash_7060183fc29995b4") && self zm_zonemgr::is_player_in_zone("zone_cargo")) {
            continue;
        }
        self clientfield::set_to_player("water_drippies", 0);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x71749f65, Offset: 0xa1f0
// Size: 0x170
function function_f1a16811() {
    self endon(#"death");
    level endon(#"hash_25d8c88ff3f91ee5");
    while (true) {
        t_result = trigger::wait_till("trigger_water_drippies_fore", "targetname", self);
        if (!(isdefined(level.water_drained_fore) && level.water_drained_fore) || level flag::get(#"hash_7060183fc29995b4") || self isplayerunderwater()) {
            wait 0.5;
            continue;
        }
        self clientfield::set_to_player("water_drippies", 1);
        while (!level flag::get(#"hash_7060183fc29995b4") && !self isplayerunderwater() && self istouching(t_result)) {
            wait 0.25;
        }
        self clientfield::set_to_player("water_drippies", 0);
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xdbb9b6f1, Offset: 0xa368
// Size: 0xb8
function function_4ec55dd() {
    level endon(#"hash_25d8c88ff3f91ee5");
    while (true) {
        wait randomintrange(10, 20);
        if (isalive(self) && self zm_zonemgr::is_player_in_zone(array("zone_forecastle_upper", "zone_forecastle_lower"))) {
            self clientfield::increment_to_player("water_splashies", 1);
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x340cc3aa, Offset: 0xa428
// Size: 0x1e0
function function_5ef52c07() {
    self endon(#"death", #"disconnect");
    e_water = getent("ocean_water_hidden", "script_noteworthy");
    var_67382c0b = array("zone_mail_room", "zone_cargo", "zone_upper_engine_room", "zone_engine", "zone_boiler_room", "zone_turbine_room");
    self thread function_e9642771(e_water);
    while (isalive(self)) {
        s_result = self waittill(#"zone_change", #"hash_20a44fff6b27cb96");
        if (isalive(self) && s_result._notify === #"zone_change") {
            if (!(isdefined(self.var_14dd80fb) && self.var_14dd80fb) && isdefined(s_result.zone_name) && isinarray(var_67382c0b, s_result.zone_name)) {
                e_water setinvisibletoplayer(self, 1);
            } else {
                e_water setinvisibletoplayer(self, 0);
            }
            continue;
        }
        break;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x251855c1, Offset: 0xa610
// Size: 0x148
function function_e9642771(e_water) {
    self endon(#"death", #"disconnect");
    e_trigger = getent("water_vis_trigger", "targetname");
    while (true) {
        self.var_14dd80fb = 0;
        trigger::wait_till("water_vis_trigger", "targetname", self);
        self.var_14dd80fb = 1;
        if (self.cached_zone_name === "zone_mail_room") {
            e_water setinvisibletoplayer(self, 0);
        }
        while (self istouching(e_trigger)) {
            waitframe(1);
        }
        if (self zm_zonemgr::is_player_in_zone(array("zone_mail_room"))) {
            e_water setinvisibletoplayer(self, 1);
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xfe429681, Offset: 0xa760
// Size: 0xe0
function function_8e0b371() {
    self endon(#"disconnect");
    while (true) {
        str_location = function_ab7f70b9(self);
        str_location = isdefined(str_location) ? str_location : #"";
        if (isalive(self) && !(isdefined(self.var_16735873) && self.var_16735873)) {
            self zm_hud::function_29780fb5(str_location);
        } else {
            self zm_hud::function_29780fb5(#"");
        }
        wait 0.5;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 1, eflags: 0x1 linked
// Checksum 0x12da761a, Offset: 0xa848
// Size: 0x4fe
function function_ab7f70b9(e_player) {
    str_zone = e_player zm_zonemgr::get_player_zone();
    if (!isdefined(str_zone)) {
        if (e_player.var_16735873 !== 1 && level flag::get(#"hash_280d10a2ac060edb")) {
            return #"hash_51b7577e1fe8e0da";
        }
        return undefined;
    }
    switch (str_zone) {
    case #"zone_forecastle_upper":
    case #"zone_forecastle_lower":
        str_display = #"hash_4800ed4f22425bbb";
        break;
    case #"zone_state_rooms_front":
    case #"zone_state_rooms_rear":
        str_display = #"hash_69ebb1abe1e2d695";
        break;
    case #"millionaire_suite_zone":
        str_display = #"hash_302fc7a8b597825c";
        break;
    case #"zone_bridge":
        str_display = #"hash_6e14395e9fafcfb8";
        break;
    case #"zone_grand_stairs_c_deck":
    case #"zone_grand_stairs_d_deck":
    case #"zone_grand_stairs_bottom":
        str_display = #"hash_40db3f8450c1cdd1";
        break;
    case #"zone_grand_stairs_a_deck":
    case #"zone_grand_stairs_b_deck":
        str_display = #"hash_23a9baa5b7fb1b8";
        break;
    case #"zone_lounge":
        str_display = #"hash_21aaa58eff63ee6f";
        break;
    case #"zone_dining_hall_aft":
    case #"zone_dining_hall_fore":
        str_display = #"hash_3325f6b80c910400";
        break;
    case #"zone_galley":
        str_display = #"hash_1b6d24a149bb4863";
        break;
    case #"zone_promenade_deck":
        str_display = #"hash_4254e25038a56598";
        break;
    case #"zone_lounge_aft_deck":
        str_display = #"hash_577acc33401ccf26";
        break;
    case #"zone_aft_deck_lower":
    case #"zone_aft_deck":
        str_display = #"hash_64c435d9bd0cdd9e";
        break;
    case #"zone_sun_deck_stbd":
        str_display = #"hash_38887942b83c8cbb";
        break;
    case #"zone_fore_deck":
        str_display = #"hash_5c9be164190cf031";
        break;
    case #"zone_sun_deck_port":
    case #"zone_mid_deck":
        str_display = #"hash_7361752642f5d7cf";
        break;
    case #"zone_poop_deck":
    case #"zone_poop_deck_lower":
        str_display = #"hash_788531c390c09f9";
        break;
    case #"zone_berths":
    case #"zone_berths_subdeck":
        str_display = #"hash_1f322078edfcfba3";
        break;
    case #"zone_provisions":
        str_display = #"hash_4e21f45a939d9031";
        break;
    case #"zone_upper_engine_room":
    case #"zone_engine":
        str_display = #"hash_118b4d5763e21783";
        break;
    case #"zone_boiler_room":
        str_display = #"hash_21f25d50ac7b1ae0";
        break;
    case #"zone_turbine_room":
        str_display = #"hash_5479cc9d545c2adc";
        break;
    case #"zone_cargo":
        str_display = #"hash_35000bfda3024a1f";
        break;
    case #"zone_mail_room":
        str_display = #"hash_79da5cb2d068ceb6";
        break;
    default:
        str_display = undefined;
        break;
    }
    return str_display;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xe83a518b, Offset: 0xad50
// Size: 0x134
function function_17ac86f7() {
    self thread zm_audio::function_713192b1(#"hash_23a9baa5b7fb1b8", #"grandstairs");
    self thread zm_audio::function_713192b1(#"hash_3325f6b80c910400", #"dininghall");
    self thread zm_audio::function_713192b1(#"hash_1f322078edfcfba3", #"berths");
    self thread zm_audio::function_713192b1(#"hash_118b4d5763e21783", #"engineroom");
    self thread zm_audio::function_713192b1(#"hash_35000bfda3024a1f", #"cargohold");
    if (!zm_utility::is_tutorial()) {
        self thread function_b5f302d5();
        self thread function_2021b5df();
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x11863d1a, Offset: 0xae90
// Size: 0x94
function function_b5f302d5() {
    self endon(#"death", #"disconnect");
    while (!self isplayerunderwater()) {
        waitframe(1);
    }
    if (level.musicsystem.currentplaytype == 0) {
        music::setmusicstate("location_underwater", self);
    }
    self function_e4aee0bb();
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xcc7eecec, Offset: 0xaf30
// Size: 0x16c
function function_e4aee0bb() {
    if ((!(isdefined(level.water_drained_fore) && level.water_drained_fore) || !(isdefined(level.water_drained_aft) && level.water_drained_aft)) && !level flag::get(#"catalyst_encounters_completed")) {
        while (self isplayerunderwater()) {
            waitframe(1);
        }
        if (!(isdefined(level.water_drained_fore) && level.water_drained_fore) && self zm_zonemgr::is_player_in_zone("zone_cargo") || !(isdefined(level.water_drained_aft) && level.water_drained_aft) && self zm_zonemgr::is_player_in_zone(array("zone_engine", "zone_upper_engine_room", "zone_boiler_room", "zone_turbine_room"))) {
            zm_audio::create_and_play_dialog(#"water", #"exit");
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x1b1efe66, Offset: 0xb0a8
// Size: 0xc4
function function_255747bd() {
    b_played = 0;
    while (true) {
        trigger = trigger::wait_till("trig_lounge_vo", "targetname");
        player = trigger.who;
        if (isplayer(player)) {
            b_played = player zm_audio::create_and_play_dialog(#"location_enter", #"lounge");
            if (isdefined(b_played) && b_played) {
                return;
            }
        }
        wait 1;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xb06b9e7a, Offset: 0xb178
// Size: 0x98
function function_2021b5df() {
    self endon(#"death", #"disconnect");
    level endon(#"hash_361427de75870cde");
    self waittill(#"hash_361427de75870cde");
    if (level.musicsystem.currentplaytype == 0) {
        music::setmusicstate("zodt8_underwater_switch", self);
    }
    level notify(#"hash_361427de75870cde");
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x9a1d2c0a, Offset: 0xb218
// Size: 0x16a
function function_3910bef9() {
    s_point = zm_bgb_anywhere_but_here::function_91a62549();
    if (!isdefined(s_point)) {
        return false;
    }
    a_s_respawn_points = struct::get_array("player_respawn_point", "targetname");
    a_s_valid_respawn_points = [];
    foreach (s_respawn_point in a_s_respawn_points) {
        if (zm_utility::is_point_inside_enabled_zone(s_respawn_point.origin)) {
            if (!isdefined(a_s_valid_respawn_points)) {
                a_s_valid_respawn_points = [];
            } else if (!isarray(a_s_valid_respawn_points)) {
                a_s_valid_respawn_points = array(a_s_valid_respawn_points);
            }
            a_s_valid_respawn_points[a_s_valid_respawn_points.size] = s_respawn_point;
        }
    }
    if (a_s_valid_respawn_points.size == 1 && a_s_valid_respawn_points[0].script_noteworthy == "zone_forecastle_upper") {
        return false;
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x98bd4889, Offset: 0xb390
// Size: 0x62
function function_26d54397() {
    if (isdefined(self.var_16735873) && self.var_16735873 || !self isonground() || !ispointonnavmesh(self.origin, self)) {
        return false;
    }
    return true;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x20dd1685, Offset: 0xb400
// Size: 0x1e8
function function_8c000d3b() {
    if (self ai::has_behavior_attribute("gravity")) {
        while (isalive(self)) {
            if (level flag::get(#"activate_sea_walkers") && !level flag::get(#"boss_fight_started")) {
                self ai::set_behavior_attribute("gravity", "low");
            } else {
                depth = getwaterheight(self.origin) - self.origin[2];
                if (depth > 48) {
                    self ai::set_behavior_attribute("gravity", "low");
                    if (!self clientfield::get("sndActorUnderwater")) {
                        self clientfield::set("sndActorUnderwater", 1);
                    }
                } else if (self ai::get_behavior_attribute("gravity") != "normal") {
                    self ai::set_behavior_attribute("gravity", "normal");
                    if (self clientfield::get("sndActorUnderwater")) {
                        self clientfield::set("sndActorUnderwater", 0);
                    }
                }
            }
            wait 0.5;
        }
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x4f932e98, Offset: 0xb5f0
// Size: 0x36
function function_2c7766d0() {
    level.var_e9737821 = &function_c52e8ba;
    level.var_829d6a97 = &function_ae5d684b;
}

// Namespace zm_zodt8/zm_zodt8
// Params 2, eflags: 0x1 linked
// Checksum 0xc9fde906, Offset: 0xb630
// Size: 0x9c6
function function_c52e8ba(player, var_8d5d092c) {
    b_result = 0;
    if (isdefined(self.stub)) {
        str_loc = self.stub.script_string;
    }
    if (!isdefined(self.hint_string)) {
        self.hint_string = [];
    }
    n_player_index = player getentitynumber();
    if (zm_trial_disable_buys::is_active()) {
        self.hint_string[n_player_index] = #"";
        return 0;
    }
    if (!self zm_fasttravel::function_d06e636b(player)) {
        self.hint_string[n_player_index] = #"";
    } else if (isdefined(self.stub.var_a4134e51) && !level flag::get(self.stub.var_a4134e51)) {
        switch (self.stub.var_a4134e51) {
        case #"connect_provisions_to_engine_room":
            self.hint_string[n_player_index] = #"hash_6134f96bfd8584b9";
            break;
        case #"connect_mail_rooms_to_cargo":
            self.hint_string[n_player_index] = #"hash_2bdcee65a214c377";
            break;
        default:
            self.hint_string[n_player_index] = #"";
            break;
        }
        b_result = 1;
    } else if (isdefined(player.var_9c7b96ed[var_8d5d092c]) && player.var_9c7b96ed[var_8d5d092c]) {
        self.hint_string[n_player_index] = #"hash_7667bd0f83307360";
        b_result = 1;
    } else if (isdefined(self.stub.delay) && !self.stub flag::get("delayed")) {
        self.hint_string[n_player_index] = #"zombie/fasttravel_delay";
        b_result = 1;
    } else {
        switch (str_loc) {
        case #"aft_to_fore":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_7593a2ebe8fc0b3";
                } else {
                    self.hint_string[n_player_index] = #"hash_4b2858f776c52ccd";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_e3d1690d7d7f44e";
            } else {
                self.hint_string[n_player_index] = #"hash_700c960774ba5e4a";
            }
            break;
        case #"fore_to_aft":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_12fc562d9ab4bf38";
                } else {
                    self.hint_string[n_player_index] = #"hash_62ae1c4f8ac4e714";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_12a32751e97a4bb3";
            } else {
                self.hint_string[n_player_index] = #"hash_3a81aa36cd6dd5cd";
            }
            break;
        case #"hash_6976e0f87940fc21":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_6ccb25e6c862372d";
                } else {
                    self.hint_string[n_player_index] = #"hash_562ff3387984d58f";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_3f33b51b5bbb2128";
            } else {
                self.hint_string[n_player_index] = #"hash_1dc8421f2e165fc4";
            }
            break;
        case #"hash_b20cb95c337f16d":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_781dafec4ac0550f";
                } else {
                    self.hint_string[n_player_index] = #"hash_6208942bcbbe4e11";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_7573295a792d2292";
            } else {
                self.hint_string[n_player_index] = #"hash_5b6a4c36df9369b6";
            }
            break;
        case #"cargo":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_d7db45a21cdc530";
                } else {
                    self.hint_string[n_player_index] = #"hash_4ab3571c0c7854bc";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_301dd750af5c65eb";
            } else {
                self.hint_string[n_player_index] = #"hash_133d9515d811aa75";
            }
            break;
        case #"engine_room":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_30a5377271b52fa1";
                } else {
                    self.hint_string[n_player_index] = #"hash_7a287075190064ab";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_4d2905316e1e4044";
            } else {
                self.hint_string[n_player_index] = #"hash_87c8f2dc2aee648";
            }
            break;
        case #"boiler_room":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_3a812772e47fb401";
                } else {
                    self.hint_string[n_player_index] = #"hash_7ad135e043cefb4b";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_9d7c35cc8011fe4";
            } else {
                self.hint_string[n_player_index] = #"hash_4e6660ce01be0ca8";
            }
            break;
        case #"suites":
            if (zm_utility::is_standard()) {
                if (function_8b1a219a()) {
                    self.hint_string[n_player_index] = #"hash_224468183fc02d71";
                } else {
                    self.hint_string[n_player_index] = #"hash_3f66eedf08d403bb";
                }
            } else if (function_8b1a219a()) {
                self.hint_string[n_player_index] = #"hash_6ad026339f075034";
            } else {
                self.hint_string[n_player_index] = #"hash_59f561a519beb2f8";
            }
            break;
        default:
            self.hint_string[n_player_index] = #"hash_2731cc5c1208e2e4";
            break;
        }
        b_result = 1;
    }
    return b_result;
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0xfb88e077, Offset: 0xc000
// Size: 0x112
function function_ae5d684b() {
    switch (self.unitrigger_stub.script_string) {
    case #"hash_b20cb95c337f16d":
    case #"hash_6976e0f87940fc21":
        self.unitrigger_stub.var_8d5d092c = "smoke_stack";
        break;
    case #"engine_room":
    case #"cargo":
        self.unitrigger_stub.var_8d5d092c = "engine_room";
        break;
    case #"fore_to_aft":
    case #"aft_to_fore":
        self.unitrigger_stub.var_8d5d092c = "top_deck";
        break;
    case #"boiler_room":
    case #"suites":
        self.unitrigger_stub.var_8d5d092c = "mid_ship";
        break;
    }
}

// Namespace zm_zodt8/zm_zodt8
// Params 0, eflags: 0x1 linked
// Checksum 0x2094e5a6, Offset: 0xc120
// Size: 0x10c
function function_172ac1b5() {
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2) {
        zm_zonemgr::enable_zone("zone_poop_deck");
        zm_zonemgr::enable_zone("zone_aft_deck");
        zm_zonemgr::enable_zone("zone_mail_room");
        zm_zonemgr::enable_zone("zone_forecastle_lower");
        if (zm_custom::function_901b751c(#"zmdoorstate") == 2 && zm_custom::function_901b751c(#"zmpowerdoorstate") == 0) {
            zm_zonemgr::enable_zone("zone_berths");
            zm_zonemgr::enable_zone("zone_berths_subdeck");
        }
    }
}

