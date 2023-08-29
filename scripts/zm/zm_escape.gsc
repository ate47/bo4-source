// Atian COD Tools GSC decompiler test
#include script_36222395658446f5;
#include script_61ef84ea1a82c001;
#include scripts/zm/zm_escape_vo_hooks.gsc;
#include scripts/zm/zm_escape_gamemodes.gsc;
#include script_22ebc4167e3bcd3f;
#include script_2ba3951675c7ee1c;
#include scripts/zm/zm_escape_weap_quest.gsc;
#include scripts/zm/zm_escape_util.gsc;
#include scripts/zm/zm_escape_magicbox.gsc;
#include scripts/zm/zm_escape_travel.gsc;
#include scripts/zm/zm_escape_traps.gsc;
#include scripts/zm/zm_escape_sq_bg.gsc;
#include scripts/zm/zm_escape_spoon.gsc;
#include scripts/zm/zm_escape_pebble.gsc;
#include script_668c4fbb94671fb4;
#include scripts/zm/zm_escape_paschal.gsc;
#include scripts/zm/zm_escape_pap_quest.gsc;
#include script_46cea9e5d4ef9e21;
#include scripts/zm/zm_escape_fx.gsc;
#include script_602009d88d859543;
#include script_464d52643f5d868f;
#include scripts/zm/zm_escape_achievement.gsc;
#include scripts/zm/weapons/zm_weap_flamethrower.gsc;
#include scripts/zm/weapons/zm_weap_gravityspikes.gsc;
#include scripts/zm/weapons/zm_weap_katana.gsc;
#include scripts/zm/weapons/zm_weap_minigun.gsc;
#include scripts/zm/weapons/zm_weap_cymbal_monkey.gsc;
#include scripts/zm/weapons/zm_weap_spknifeork.gsc;
#include scripts/zm/weapons/zm_weap_golden_knife.gsc;
#include scripts/zm/weapons/zm_weap_spork.gsc;
#include scripts/zm/weapons/zm_weap_spoon.gsc;
#include scripts/zm/weapons/zm_weap_spectral_shield.gsc;
#include scripts/zm/weapons/zm_weap_riotshield.gsc;
#include scripts/zm/weapons/zm_weap_blundergat.gsc;
#include scripts/zm/weapons/zm_weap_claymore.gsc;
#include scripts/zm/powerup/zm_powerup_zombie_blood.gsc;
#include script_7c62f55ce3a557ff;
#include script_ab862743b3070a;
#include scripts/zm_common/zm_pack_a_punch_util.gsc;
#include scripts/zm_common/zm_pack_a_punch.gsc;
#include scripts/zm/zm_escape_trials.gsc;
#include scripts/zm_common/zm_characters.gsc;
#include scripts/zm_common/zm_zonemgr.gsc;
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_wallbuy.gsc;
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_unitrigger.gsc;
#include scripts/zm_common/zm_ui_inventory.gsc;
#include scripts/zm_common/zm_spawner.gsc;
#include scripts/zm_common/zm_round_spawning.gsc;
#include scripts/zm_common/zm_power.gsc;
#include scripts/zm_common/zm_magicbox.gsc;
#include scripts/zm_common/zm_loadout.gsc;
#include scripts/zm_common/zm_hud.gsc;
#include scripts/zm_common/zm_fasttravel.gsc;
#include scripts/zm_common/zm_devgui.gsc;
#include scripts/zm_common/zm_customgame.gsc;
#include scripts/zm_common/zm_audio.gsc;
#include scripts/zm_common/zm.gsc;
#include scripts/zm_common/load.gsc;
#include scripts/core_common/ai/zombie_utility.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/exploder_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/array_shared.gsc;

#namespace zm_escape;

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x2
// Checksum 0xb3d4c3d8, Offset: 0x1458
// Size: 0x104
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
    level.bgb_machine_count = 2;
    level.random_pandora_box_start = 1;
    level.pack_a_punch_camo_index = 156;
    level.pack_a_punch_camo_index_number_variants = 5;
    system::ignore(#"zm_weap_chakram");
    system::ignore(#"zm_weap_hammer");
    system::ignore(#"zm_weap_scepter");
    system::ignore(#"zm_weap_sword_pistol");
    system::ignore(#"zm_weap_homunculus");
}

// Namespace zm_escape/level_init
// Params 1, eflags: 0x40
// Checksum 0x58ca74c9, Offset: 0x1568
// Size: 0xcc6
function event_handler[level_init] main(eventstruct) {
    setclearanceceiling(24);
    level._uses_default_wallbuy_fx = 1;
    level._uses_sticky_grenades = 1;
    level._uses_taser_knuckles = 1;
    zm::init_fx();
    clientfield::register("clientuimodel", "" + #"player_lives", 1, 2, "int");
    clientfield::register("toplayer", "" + #"rumble_gondola", 1, 1, "int");
    clientfield::register("toplayer", "" + #"hash_51b0de5e2b184c28", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_4be2ce4248d80d22", 1, 1, "int");
    clientfield::register("world", "" + #"hash_24deaa9795e06d41", 1, 1, "int");
    clientfield::register("world", "" + #"hash_4a8a7b58bf6cd5d8", 1, 1, "int");
    clientfield::register("world", "" + #"hash_29fea4571b8649a0", 1, 1, "int");
    clientfield::register("world", "" + #"hash_cd028842e18845e", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_500a87b29014ef02", 1, 1, "int");
    clientfield::register("toplayer", "" + #"player_pbg_bank", 1, 1, "int");
    clientfield::register("vehicle", "" + #"gondola_light", 1, 1, "int");
    namespace_f2502da8::init_clientfields();
    namespace_9d58c1cd::init_clientfields();
    zm_escape_util::init_clientfields();
    namespace_1063645::init_clientfields();
    namespace_b99141ed::init_clientfields();
    level._effect[#"headshot"] = #"zombie/fx_bul_flesh_head_fatal_zmb";
    level._effect[#"headshot_nochunks"] = #"zombie/fx_bul_flesh_head_nochunks_zmb";
    level._effect[#"bloodspurt"] = #"zombie/fx_bul_flesh_neck_spurt_zmb";
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = #"blood/fx_blood_gib_limb_trail";
    level.var_c1013f84 = 1;
    level._no_vending_machine_auto_collision = 1;
    level.default_start_location = "prison";
    level.default_game_mode = "zclassic";
    level.disableclassselection = 0;
    level.var_22fda912 = &function_9f50079d;
    level.zombiemode_offhand_weapon_give_override = &offhand_weapon_give_override;
    level.var_d0ab70a2 = #"hash_241c0e86d7b363e9";
    level._allow_melee_weapon_switching = 1;
    level.zombiemode_reusing_pack_a_punch = 1;
    level._effect[#"lght_marker"] = #"hash_2eb17822848d1484";
    level._effect[#"lght_marker_flare"] = #"hash_4d4ecfd7d55314e9";
    level._effect[#"poltergeist"] = #"hash_64ab8440e31c3057";
    level.var_a9c40fde = &function_2d2f3503;
    level.var_1e480ea7 = &function_bcc6a9d8;
    namespace_b99141ed::init();
    paschal::init();
    zm_escape_achievement::init();
    level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"hash_67303f9697bd0645"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"hash_cd17ca22402a02b"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"hash_2764304c155bb1f9"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"hash_25469b9705aa3afa"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"roof_climb"] = &zm_spawner::function_45bb11e4;
    if (zm_utility::is_standard()) {
        var_6811b7e = struct::get_array("perk_vapor_altar");
        foreach (var_5baafbb2 in var_6811b7e) {
            var_5baafbb2.var_21c535b = 2;
        }
    }
    callback::on_spawned(&function_7e67379d);
    load::main();
    zm_fasttravel::function_44a82004("power_on1");
    level.zones = [];
    level.zone_manager_init_func = &function_f8274c62;
    init_zones[0] = "zone_model_industries";
    level thread zm_zonemgr::manage_zones(init_zones);
    level thread zm_escape_travel::init_alcatraz_zipline();
    level.random_pandora_box_start = 1;
    level.start_chest_name = "powerhouse_chest";
    level.var_161cb00c = 1;
    level.open_chest_location = [];
    level.open_chest_location[0] = "warden_office_chest";
    level.open_chest_location[1] = "cafe_chest";
    level.open_chest_location[2] = "dock_chest";
    level.open_chest_location[3] = "recreation_yard_chest";
    level.open_chest_location[4] = "powerhouse_chest";
    level.open_chest_location[5] = "new_industries_chest";
    level.open_chest_location[6] = "warden_house_chest";
    level._zombiemode_custom_box_move_logic = &function_1665f510;
    level thread sndfunctions();
    level.customrandomweaponweights = &function_adac5e49;
    level.custom_magic_box_selection_logic = &function_3511e2af;
    callback::on_spawned(&function_29ec1ad7);
    level thread function_e6797b71();
    level thread namespace_f2502da8::function_4989fd7e();
    level thread function_2141ca97();
    level thread function_8d0c655f();
    level thread function_11794ed8();
    level thread namespace_9d58c1cd::main();
    level thread namespace_1063645::function_fb0bd6b9();
    level.var_6f6cc58 = &zm_escape_util::function_34b291c3;
    if (zm_utility::is_trials()) {
        level.dog_round_track_override = &function_246a0760;
        level.var_539f36cd = &function_2723556b;
        zombie_dog_util::dog_enable_rounds(0);
    } else {
        level.var_539f36cd = &zm_escape_util::function_cd3a65e0;
    }
    level.player_out_of_playable_area_override = &zm_escape_util::function_e270dfe4;
    level thread zm_escape_util::function_a8024c77();
    level thread zm_escape_util::function_d89227a0("power_global", "start_zombie_round_logic");
    level thread zm_escape_util::function_d89227a0("power_building64", "power_on1");
    level thread zm_escape_util::function_d89227a0("power_powerhouse", "power_on2");
    level thread zm_escape_util::function_2def6c82();
    level thread paschal::main();
    level thread function_172ac1b5();
    /#
        level thread function_acb5b0ec();
    #/
    zm_custom::function_a00576dd(&function_7722c6f0, undefined, undefined, &function_e5086229);
    level thread function_30a6ae7c();
    if (zm_utility::is_trials()) {
        level.var_22dfe858 = #"hash_5d69a47fd8c0e9e5";
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x85f5b40f, Offset: 0x2238
// Size: 0x1dc
function function_246a0760() {
    level endon(#"end_game");
    level.dog_round_count = 1;
    level waittill(#"hash_7bf357f5c916ca4e");
    level.next_dog_round = level.round_number + 1;
    if (level.next_dog_round === 9) {
        level.next_dog_round = 11;
    }
    zm_round_spawning::function_b4a8f95a(#"zombie_dog", level.next_dog_round, &zombie_dog_util::dog_round_start, &zombie_dog_util::function_5f1ef789, &zombie_dog_util::function_20aadb5e, &zombie_dog_util::function_d544de30, level.var_dc50acfa);
    zm_round_spawning::function_df803678(&zombie_dog_util::function_ed67c5e7);
    zm_utility::function_fdb0368(level.next_dog_round + 1);
    level.dog_round_count = 3;
    level.next_dog_round = 22;
    zm_round_spawning::function_b4a8f95a(#"zombie_dog", level.next_dog_round, &zombie_dog_util::dog_round_start, &zombie_dog_util::function_5f1ef789, &zombie_dog_util::function_20aadb5e, &zombie_dog_util::function_d544de30, level.var_dc50acfa);
    /#
        level thread zombie_dog_util::function_de0a6ae4();
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x2420
// Size: 0x4
function function_2723556b() {
    
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x6feed007, Offset: 0x2430
// Size: 0x17c
function function_30a6ae7c() {
    if (getdvarint(#"splitscreen_playercount", 1) > 2) {
        wait(1.6);
        level thread scene::stop("p8_fxanim_zm_esc_crumbling_rocks_lavapit_warden_bundle", 1);
        level thread scene::stop("p8_fxanim_zm_esc_power_panel_bldg64_01_bundle", 1);
        level thread scene::stop("p8_fxanim_zm_esc_power_panel_bldg64_02_bundle", 1);
        level thread scene::stop("p8_fxanim_zm_esc_power_panel_phouse_07_bundle", 1);
        level thread scene::stop("p8_fxanim_zm_esc_power_panel_phouse_08_bundle", 1);
        level thread scene::stop("p8_fxanim_zm_esc_power_station_panel_03_bundle", 1);
        level thread scene::stop("p8_fxanim_gp_wire_sparking_xlong_thick_bundle", 1);
        level thread scene::stop("p8_fxanim_gp_wire_sparking_med_thick_bundle", 1);
        level thread scene::stop("p8_fxanim_gp_wire_sparking_ground_01_bundle", 1);
        level thread scene::stop("p8_fxanim_gp_wire_sparking_xsml_bundle", 1);
    }
}

// Namespace zm_escape/zm_escape
// Params 2, eflags: 0x1 linked
// Checksum 0xa4ebfa97, Offset: 0x25b8
// Size: 0xd0
function function_7722c6f0(var_404e4288, var_8dd554ee) {
    level.brutus_do_prologue = undefined;
    ai_brutus = zombie_utility::spawn_zombie(level.var_d668eae7[0]);
    if (isdefined(ai_brutus)) {
        ai_brutus zombie_brutus_util::brutus_spawn();
        if (isalive(ai_brutus)) {
            level.zombie_total--;
            if (!(isdefined(level.var_779eb5f5) && level.var_779eb5f5)) {
                ai_brutus playsound(#"zmb_ai_brutus_spawn_2d");
            }
        }
    }
    return 1;
}

// Namespace zm_escape/zm_escape
// Params 2, eflags: 0x1 linked
// Checksum 0x60c35266, Offset: 0x2690
// Size: 0x50
function function_e5086229(var_404e4288, var_8dd554ee) {
    ai = zombie_dog_util::function_62db7b1c(1);
    if (isdefined(ai)) {
        level.zombie_total--;
    }
    return 1;
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xf025bce7, Offset: 0x26e8
// Size: 0x84
function function_11794ed8() {
    level waittill(#"all_players_spawned");
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2) {
        level flag::set("power_on1");
        level flag::set("power_on2");
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x8b94ae89, Offset: 0x2778
// Size: 0x140
function function_8d0c655f() {
    exploder::exploder("fxexp_power_house_off");
    exploder::stop_exploder("fxexp_power_house_on");
    level flag::wait_till("power_on2");
    exploder::exploder("powerhouse_power_on");
    exploder::exploder("fxexp_power_house_on");
    exploder::stop_exploder("fxexp_power_house_off");
    a_s_generators = struct::get_array("powerhouse_generator", "targetname");
    foreach (s_generator in a_s_generators) {
        s_generator thread scene::play("Shot 2");
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xd2025aed, Offset: 0x28c0
// Size: 0x114
function function_2141ca97() {
    if (zm_custom::function_901b751c(#"zmpowerstate") != 2) {
        level clientfield::set("" + #"hash_4a8a7b58bf6cd5d8", 1);
        level thread function_83c0bb0d();
    }
    level flag::wait_till("power_on1");
    exploder::exploder("lgtexp_building64_power_on");
    level clientfield::set("" + #"hash_4a8a7b58bf6cd5d8", 0);
    level clientfield::set("" + #"hash_29fea4571b8649a0", 0);
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x5 linked
// Checksum 0x100320b4, Offset: 0x29e0
// Size: 0xf0
function private function_83c0bb0d() {
    level endon(#"power_on1");
    var_41ac1ae7 = 0;
    while (1) {
        n_players = zm_zonemgr::get_players_in_zone("zone_studio");
        if (n_players > 0) {
            if (!var_41ac1ae7) {
                level clientfield::set("" + #"hash_29fea4571b8649a0", 1);
                var_41ac1ae7 = 1;
            }
        } else {
            level clientfield::set("" + #"hash_29fea4571b8649a0", 0);
            var_41ac1ae7 = 0;
        }
        wait(2);
    }
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x1 linked
// Checksum 0x71f7f08f, Offset: 0x2ad8
// Size: 0x74
function function_9738dcda(master_switch) {
    if (isdefined(master_switch.model_off)) {
        master_switch setmodel(master_switch.model_off);
    }
    if (isdefined(master_switch.bundle)) {
        master_switch thread scene::play(master_switch.bundle, "FAKE_OFF", master_switch);
    }
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x1 linked
// Checksum 0x2be0b327, Offset: 0x2b58
// Size: 0x74
function function_3fcd201d(master_switch) {
    if (isdefined(master_switch.model_on)) {
        master_switch setmodel(master_switch.model_on);
    }
    if (isdefined(master_switch.bundle)) {
        master_switch thread scene::play(master_switch.bundle, "FAKE_ON", master_switch);
    }
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x1 linked
// Checksum 0xb43a135f, Offset: 0x2bd8
// Size: 0xc6
function offhand_weapon_give_override(str_weapon) {
    self endon(#"death");
    if (zm_loadout::is_tactical_grenade(str_weapon) && isdefined(self zm_loadout::get_player_tactical_grenade()) && !self zm_loadout::is_player_tactical_grenade(str_weapon)) {
        self setweaponammoclip(self zm_loadout::get_player_tactical_grenade(), 0);
        self takeweapon(self zm_loadout::get_player_tactical_grenade());
    }
    return 0;
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x1dbb8653, Offset: 0x2ca8
// Size: 0x1f8
function function_7e67379d() {
    self endon(#"death");
    while (1) {
        str_zone = self zm_zonemgr::get_player_zone();
        if (isdefined(str_zone)) {
            switch (str_zone) {
            case #"zone_powerhouse":
                if (level flag::get("power_on2")) {
                    self clientfield::set_to_player("" + #"player_pbg_bank", 1);
                } else {
                    self clientfield::set_to_player("" + #"player_pbg_bank", 0);
                }
                break;
            case #"zone_studio":
                if (level flag::get("power_on1")) {
                    self clientfield::set_to_player("" + #"player_pbg_bank", 1);
                } else {
                    self clientfield::set_to_player("" + #"player_pbg_bank", 0);
                }
                break;
            default:
                self clientfield::set_to_player("" + #"player_pbg_bank", 0);
                break;
            }
        } else {
            self clientfield::set_to_player("" + #"player_pbg_bank", 0);
        }
        wait(1);
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x997c194f, Offset: 0x2ea8
// Size: 0x147c
function function_f8274c62() {
    level flag::init(#"always_on");
    level flag::set(#"always_on");
    setdvar(#"hash_6ec233a56690f409", 1);
    zm_zonemgr::zone_init("zone_model_industries_upper");
    zm_zonemgr::zone_init("zone_west_side_exterior_upper_03");
    zm_zonemgr::add_adjacent_zone("zone_library", "zone_start", "activate_catwalk", 0);
    zm_zonemgr::add_adjacent_zone("zone_library", "zone_cellblock_west", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_library", "zone_broadway_floor_2", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west", "zone_cellblock_west_barber", "activate_cellblock_ca", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west", "zone_broadway_floor_2", "activate_cellblock_ca", 0);
    zm_zonemgr::add_adjacent_zone("zone_broadway_floor_2", "zone_cellblock_west_barber", "activate_cellblock_ca", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west", "zone_cellblock_west_barber", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west", "zone_broadway_floor_2", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_broadway_floor_2", "zone_cellblock_west_barber", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_cellblock_west_barber", "activate_cellblock_ca", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_cellblock_west_barber", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_cellblock_west_barber", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west", "zone_cellblock_west_gondola", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_broadway_floor_2", "zone_cellblock_west_gondola", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_barber", "zone_cellblock_west_gondola", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_west_barber", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_east", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_infirmary", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_infirmary_roof", "zone_infirmary", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_west_barber", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_west", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_broadway_floor_2", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_entrance", "zone_cellblock_east", "activate_cellblock_ca", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_barber", "zone_cellblock_west_warden", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_barber", "zone_cellblock_east", "activate_cellblock_ca", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_barber", "zone_cellblock_east", "activate_cellblock_library", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_barber", "zone_cellblock_west_warden", "activate_cellblock_east_west", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_sally_port", "activate_warden_office", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_administration", "activate_warden_office", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_warden_office", "activate_warden_office", 0);
    zm_zonemgr::add_adjacent_zone("zone_sally_port", "zone_administration", "activate_warden_office", 0);
    zm_zonemgr::add_adjacent_zone("zone_sally_port", "zone_warden_office", "activate_warden_office", 0);
    zm_zonemgr::add_adjacent_zone("zone_administration", "zone_warden_office", "activate_warden_office", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_citadel_warden", "activate_cellblock_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_cellblock_west_barber", "activate_cellblock_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel", "zone_citadel_warden", "activate_cellblock_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel", "zone_citadel_shower", "activate_cellblock_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_east", "zone_cafeteria", "activate_cafeteria", 0);
    zm_zonemgr::add_adjacent_zone("zone_cafeteria", "zone_cafeteria_end", "activate_cafeteria", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_warden", "zone_sally_port_acid", "activate_sally_port_acid", 0);
    zm_zonemgr::add_adjacent_zone("zone_sally_port", "zone_sally_port_acid", "activate_sally_port_acid", 0);
    zm_zonemgr::add_adjacent_zone("zone_sally_port_acid", "zone_administration", "activate_sally_port_acid", 0);
    zm_zonemgr::add_adjacent_zone("zone_sally_port_acid", "zone_warden_office", "activate_sally_port_acid", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_1", "zone_cellblock_west_gondola", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_1", "zone_cellblock_west", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_1", "zone_broadway_floor_2", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_2", "zone_cellblock_west_gondola", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_2", "zone_cellblock_west", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_2", "zone_broadway_floor_2", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_3", "zone_cellblock_west_gondola", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_3", "zone_cellblock_west", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_3", "zone_broadway_floor_2", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_4", "zone_cellblock_west_gondola", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_4", "zone_cellblock_west", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_jail_4", "zone_broadway_floor_2", "activate_cellblock_jail", 0);
    zm_zonemgr::add_adjacent_zone("zone_in_cr", "zone_infirmary", "activate_infirmury", 0);
    zm_zonemgr::add_adjacent_zone("zone_in_cr", "zone_infirmary_roof", "activate_infirmury", 0);
    zm_zonemgr::add_adjacent_zone("zone_in_cr", "zone_cellblock_west_gondola", "activate_infirmury", 0);
    zm_zonemgr::add_adjacent_zone("zone_sally_port", "zone_warden_house_exterior", "activate_wa_h", 0);
    zm_zonemgr::add_adjacent_zone("zone_administration", "zone_warden_house_exterior", "activate_wa_h", 0);
    zm_zonemgr::add_adjacent_zone("zone_warden_office", "zone_warden_house_exterior", "activate_wa_h", 0);
    zm_zonemgr::add_adjacent_zone("zone_warden_house_exterior", "zone_warden_house", "activate_wa_h", 0);
    zm_zonemgr::add_adjacent_zone("zone_warden_house_exterior", "zone_warden_house", #"hash_6804675ac314efd1", 0);
    zm_zonemgr::add_adjacent_zone("zone_warden_home", "zone_warden_house", #"activate_warden_house_2_attic", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_east", "cellblock_shower", "activate_shower_room", 0);
    zm_zonemgr::add_adjacent_zone("cellblock_shower", "zone_citadel_shower", "activate_shower_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_shower", "zone_citadel", "activate_shower_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel", "zone_citadel_warden", "activate_shower_citadel", 0);
    zm_zonemgr::add_adjacent_zone("zone_cafeteria", "zone_infirmary", "activate_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cafeteria", "zone_cafeteria_end", "activate_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cafeteria", "zone_cafeteria_end", #"hash_6059fbd4a3d1823e", 0);
    zm_zonemgr::add_adjacent_zone("zone_infirmary_roof", "zone_infirmary", "activate_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_infirmary", "zone_infirmary_roof", "power_on1", 0);
    zm_zonemgr::add_adjacent_zone("zone_roof", "zone_roof_infirmary", "activate_roof", 0);
    zm_zonemgr::add_adjacent_zone("zone_roof_infirmary", "zone_infirmary_roof", "activate_roof", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel", "zone_citadel_stairs", "activate_citadel_stair", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel", "zone_citadel_shower", "activate_citadel_stair", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel", "zone_citadel_warden", "activate_citadel_stair", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_stairs", "zone_citadel_basement", "activate_citadel_basement", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_stairs", "zone_citadel_basement", "activate_citadel_stair", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_stairs", "zone_citadel_basement", "activate_basement_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_stairs", "zone_citadel_basement", "activate_basement_building", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement", "zone_citadel_basement_building", "activate_citadel_basement", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement", "zone_citadel_basement_building", "activate_citadel_stair", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement", "zone_citadel_basement_building", "activate_basement_building", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement_building", "zone_studio", "activate_basement_building", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement", "zone_studio", "activate_basement_building", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement_building", "zone_dock_gondola", "activate_basement_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_citadel_basement", "zone_citadel_basement_building", "activate_basement_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_dock", "zone_dock_gondola", "activate_basement_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_studio", "zone_dock", "activate_dock_sally", 0);
    zm_zonemgr::add_adjacent_zone("zone_dock_gondola", "zone_dock", "activate_dock_sally", 0);
    zm_zonemgr::add_adjacent_zone("zone_dock", "zone_dock_gondola", "gondola_roof_to_dock", 0);
    zm_zonemgr::add_adjacent_zone("zone_gondola_ride", "zone_gondola_ride", "gondola_ride_zone_enabled");
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_west_gondola_dock", "activate_cellblock_infirmary", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_west_gondola_dock", "activate_cellblock_gondola", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_west_gondola", "zone_cellblock_west_gondola_dock", "gondola_dock_to_roof", 0);
    zm_zonemgr::add_adjacent_zone("zone_model_industries", "zone_model_industries_upper", #"always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_model_industries_upper", "zone_west_side_exterior_upper", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_model_industries_upper", "zone_west_side_exterior_upper_04", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_model_industries_upper", "zone_west_side_exterior_upper_05", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper", "zone_west_side_exterior_upper_04", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper", "zone_west_side_exterior_upper_05", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_04", "zone_west_side_exterior_upper_05", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_04", "zone_west_side_exterior_upper_02", "activate_west_side_exterior", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_02", "zone_west_side_exterior_upper_05", "activate_west_side_exterior", 1);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_02", "zone_west_side_exterior_lower", "activate_west_side_exterior_lower", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_lower", "zone_powerhouse", "activate_west_side_exterior_lower", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_lower", "zone_powerhouse", "activate_west_side_exterior_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_lower", "zone_west_side_exterior_tunnel", "activate_west_side_exterior_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_tunnel", "zone_new_industries", "activate_west_side_exterior_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_tunnel", "zone_new_industries_transverse_tunnel", "activate_west_side_exterior_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_new_industries", "zone_new_industries_transverse_tunnel", "activate_west_side_exterior_tunnel", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_05", "zone_new_industries", "activate_new_industries", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_05", "zone_new_industries_transverse_tunnel", "activate_new_industries", 0);
    zm_zonemgr::add_adjacent_zone("zone_new_industries", "zone_new_industries_transverse_tunnel", "activate_new_industries", 0);
    zm_zonemgr::add_adjacent_zone("zone_new_industries", "zone_new_industries_transverse_tunnel", #"hash_2873d6b98dfeaf6d", 0);
    zm_zonemgr::add_adjacent_zone("zone_west_side_exterior_upper_02", "zone_catwalk_01", "activate_catwalk");
    zm_zonemgr::add_adjacent_zone("zone_catwalk_01", "zone_catwalk_02", "activate_catwalk", 0);
    zm_zonemgr::add_adjacent_zone("zone_catwalk_02", "zone_catwalk_03", "activate_catwalk", 0);
    zm_zonemgr::add_adjacent_zone("zone_catwalk_03", "zone_catwalk_04", "activate_catwalk", 0);
    zm_zonemgr::add_adjacent_zone("zone_catwalk_04", "zone_cellblock_entrance", "activate_catwalk", 0);
    zm_zonemgr::add_adjacent_zone("zone_cellblock_entrance", "zone_start", "activate_catwalk", 0);
    zm_zonemgr::add_adjacent_zone("zone_fast_travel_west_side_tunnel_to_cafeteria", "zone_fast_travel_west_side_tunnel_to_cafeteria", "power_on1", 0);
    zm_zonemgr::add_adjacent_zone("zone_fast_travel_warden_house_to_shower", "zone_fast_travel_warden_house_to_shower", "power_on1", 0);
    zm_zonemgr::add_adjacent_zone("zone_model_industries", "zone_west_side_exterior_stairs", "activate_west_side_exterior_stairs", 0);
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xb95b6cdb, Offset: 0x4330
// Size: 0x34
function function_29ec1ad7() {
    self thread function_17ac86f7();
    self thread function_8e0b371();
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xf4a1f6d2, Offset: 0x4370
// Size: 0x110
function function_8e0b371() {
    self endon(#"disconnect");
    while (1) {
        if (isalive(self)) {
            str_location = self function_ab7f70b9();
            if (isdefined(level.var_bc410725) && level.var_bc410725 && isdefined(level.var_dcc985c4)) {
                str_location = self function_ab7f70b9(level.var_dcc985c4.script_string);
            }
            self zm_hud::function_29780fb5(isdefined(str_location) ? str_location : #"hash_0");
        } else {
            self zm_hud::function_29780fb5(#"hash_0");
        }
        wait(0.5);
    }
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x1 linked
// Checksum 0x377aa36b, Offset: 0x4488
// Size: 0x776
function function_ab7f70b9(str_location) {
    str_zone = self zm_zonemgr::get_player_zone();
    if (!isdefined(str_zone)) {
        return undefined;
    }
    if (isdefined(self.var_16735873) && self.var_16735873) {
        var_601fee0 = #"hash_4499d5469a09785c";
        return var_601fee0;
    }
    if (isdefined(str_location)) {
        str_zone = str_location;
    }
    switch (str_zone) {
    case #"zone_model_industries":
        var_601fee0 = #"hash_1a8cabe1cd38cf05";
        break;
    case #"zone_model_industries_upper":
        var_601fee0 = #"hash_5d43e6a30d61f2c2";
        break;
    case #"zone_west_side_exterior_upper_05":
    case #"zone_west_side_exterior_upper_04":
    case #"zone_west_side_exterior_upper_02":
    case #"zone_west_side_exterior_upper":
        var_601fee0 = #"hash_1bb116d35c69f7";
        break;
    case #"zone_west_side_exterior_tunnel":
    case #"zone_new_industries_transverse_tunnel":
        var_601fee0 = #"hash_3487be8c75233a0b";
        break;
    case #"zone_west_side_exterior_lower":
    case #"zone_powerhouse":
        var_601fee0 = #"hash_7806b6b51cd2aed2";
        break;
    case #"zone_new_industries":
        var_601fee0 = #"hash_786af67b8225aaf4";
        break;
    case #"zone_catwalk_02":
    case #"zone_catwalk_01":
        var_601fee0 = #"hash_7d83ea134c9fa0e";
        break;
    case #"zone_catwalk_03":
    case #"zone_catwalk_04":
        var_601fee0 = #"hash_5d3ed783f8450d92";
        break;
    case #"zone_cellblock_entrance":
        var_601fee0 = #"hash_9b40009eaa83579";
        break;
    case #"zone_start":
        var_601fee0 = #"hash_3f0a132a9ef3cd11";
        break;
    case #"zone_library":
        var_601fee0 = #"hash_737ac11c81c21f4c";
        break;
    case #"zone_cellblock_east":
        var_601fee0 = #"hash_6578f574dddfb02e";
        break;
    case #"zone_cellblock_west":
        var_601fee0 = #"hash_23dc7787e4d6b8b5";
        break;
    case #"zone_broadway_floor_2":
        var_601fee0 = #"hash_6181016e2d71c94e";
        break;
    case #"zone_cellblock_jail_1":
    case #"zone_cellblock_jail_3":
    case #"zone_cellblock_jail_4":
    case #"zone_cellblock_jail_2":
    case #"zone_cellblock_west_gondola":
        var_601fee0 = #"hash_53208a43bb33987d";
        break;
    case #"zone_cellblock_west_gondola_dock":
        var_601fee0 = #"hash_578cde50a0ed0829";
        break;
    case #"zone_cellblock_west_barber":
    case #"zone_cellblock_west_warden":
        var_601fee0 = #"hash_70fa5ff9f448bc96";
        break;
    case #"zone_sally_port":
    case #"zone_sally_port_acid":
        var_601fee0 = #"hash_68ef83a1a918a522";
        break;
    case #"zone_administration":
        var_601fee0 = #"hash_7b3972c143382703";
        break;
    case #"zone_warden_office":
        var_601fee0 = #"hash_4c183909b38ae649";
        break;
    case #"zone_warden_house_exterior":
        var_601fee0 = #"hash_6ba6b293ed38ed6e";
        break;
    case #"zone_warden_house":
        var_601fee0 = #"hash_3aafbefc77b80ce3";
        break;
    case #"zone_warden_home":
        var_601fee0 = #"hash_5da659405984efa3";
        break;
    case #"zone_cafeteria":
    case #"zone_cafeteria_end":
        var_601fee0 = #"hash_f76546edee4a6a1";
        break;
    case #"zone_infirmary_roof":
    case #"zone_in_cr":
    case #"zone_infirmary":
        var_601fee0 = #"hash_960d3edb9fefcec";
        break;
    case #"zone_roof":
    case #"zone_roof_infirmary":
        var_601fee0 = #"hash_676a058bfe70473";
        break;
    case #"cellblock_shower":
        var_601fee0 = #"hash_8a1754e2c346504";
        break;
    case #"zone_citadel":
    case #"zone_citadel_shower":
    case #"zone_citadel_warden":
        var_601fee0 = #"hash_12fef669980586e7";
        break;
    case #"zone_citadel_stairs":
    case #"zone_citadel_basement":
        var_601fee0 = #"hash_408e00ed0c7af3b3";
        break;
    case #"zone_citadel_basement_building":
        var_601fee0 = #"hash_5e714183f1264faa";
        break;
    case #"zone_studio":
        var_601fee0 = #"hash_68da319819d879ec";
        break;
    case #"zone_dock":
        var_601fee0 = #"hash_4213dc004145588f";
        break;
    case #"zone_dock_gondola":
        var_601fee0 = #"hash_3b3867cba3ae468a";
        break;
    case #"zone_gondola_ride":
        var_601fee0 = #"hash_3be34a9bf8a7da9d";
        break;
    case #"zone_fast_travel_warden_house_to_shower":
    case #"zone_fast_travel_west_side_tunnel_to_cafeteria":
        var_601fee0 = #"hash_4499d5469a09785c";
        break;
    default:
        var_601fee0 = undefined;
        break;
    }
    return var_601fee0;
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x68b12a97, Offset: 0x4c08
// Size: 0x124
function function_17ac86f7() {
    self thread zm_audio::function_713192b1(#"hash_676a058bfe70473", #"roof");
    self thread zm_audio::function_713192b1(#"hash_3aafbefc77b80ce3", #"wardens_house");
    self thread zm_audio::function_713192b1(#"hash_4c183909b38ae649", #"wardens_office");
    self thread zm_audio::function_713192b1(#"hash_f76546edee4a6a1", #"cafeteria");
    self thread zm_audio::function_713192b1(#"hash_8a1754e2c346504", #"showers");
    self thread zm_audio::function_713192b1(#"hash_9b40009eaa83579", #"cell_block");
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x804da50, Offset: 0x4d38
// Size: 0x54
function function_9f50079d() {
    level.var_9d1d502c = 1;
    zm_loadout::register_tactical_grenade_for_level(#"zhield_spectral_dw", 1);
    zm_loadout::register_tactical_grenade_for_level(#"zhield_spectral_dw_upgraded");
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xa11f7012, Offset: 0x4d98
// Size: 0x64
function function_2d2f3503() {
    self.is_on_gondola = undefined;
    if (self clientfield::get_to_player("" + #"rumble_gondola")) {
        self clientfield::set_to_player("" + #"rumble_gondola", 0);
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x28eb8752, Offset: 0x4e08
// Size: 0x64
function function_bcc6a9d8() {
    self.is_on_gondola = undefined;
    if (self clientfield::get_to_player("" + #"rumble_gondola")) {
        self clientfield::set_to_player("" + #"rumble_gondola", 0);
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xbddd03dc, Offset: 0x4e78
// Size: 0x19c
function sndfunctions() {
    zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
    level thread setupmusic();
    level thread custom_add_vox();
    level thread function_217196d7();
    level thread setup_personality_character_exerts();
    if (zm_utility::is_standard()) {
        level.zmannouncerprefix = "rush";
    } else {
        level.zmannouncerprefix = "ward";
    }
    level.var_45b0f2f3 = &function_45b0f2f3;
    level flag::wait_till("power_on2");
    playsoundatposition(#"hash_6d80127a29f6f4e0", (0, 0, 0));
    util::clientnotify("amb_power_on");
    level flag::wait_till("power_on1");
    playsoundatposition(#"hash_6d80157a29f6f9f9", (0, 0, 0));
    util::clientnotify("amb_power_on_2");
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x4df2d3b8, Offset: 0x5020
// Size: 0x6c
function function_217196d7() {
    level waittill(#"end_game");
    if (!isdefined(level.var_b1312d49) || level.var_b1312d49 == "players_lose") {
        playsoundatposition(#"hash_670bdb4d23be75bf", (0, 0, 0));
    }
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x1 linked
// Checksum 0x127bf820, Offset: 0x5098
// Size: 0xfe
function function_45b0f2f3(str_weapon_name) {
    if (!isdefined(str_weapon_name)) {
        return undefined;
    }
    str_weapon = undefined;
    switch (str_weapon_name) {
    case #"ww_blundergat_t8_upgraded":
    case #"ww_blundergat_t8":
        str_weapon = "wonder";
        break;
    case #"ww_blundergat_acid_t8":
    case #"hash_494f5501b3f8e1e9":
    case #"ww_blundergat_acid_t8_upgraded":
        str_weapon = "novox";
        break;
    case #"tomahawk_t8":
        str_weapon = "novox";
        break;
    case #"spork_alcatraz":
    case #"spoon_alcatraz":
        str_weapon = "melee";
        break;
    }
    return str_weapon;
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x5790f1fd, Offset: 0x51a0
// Size: 0xfe
function custom_add_vox() {
    zm_audio::loadplayervoicecategories(#"hash_41c3d60c9fdc1c1a");
    zm_audio::loadplayervoicecategories(#"hash_6d9aadb58948623b");
    zm_audio::loadplayervoicecategories(#"hash_5513a399a5c36320");
    level.sndweaponpickupoverride = array(#"spoon", #"spork", #"spknifeork", #"tomahawk", #"blundergat", #"acidgat", #"magmagat", #"magmagat_unfinished");
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x1dc7a529, Offset: 0x52a8
// Size: 0x374
function setupmusic() {
    zm_audio::musicstate_create("round_start", 3, "escape_roundstart_1", "escape_roundstart_2", "escape_roundstart_3");
    zm_audio::musicstate_create("round_start_short", 3, "escape_roundstart_1", "escape_roundstart_2", "escape_roundstart_3");
    zm_audio::musicstate_create("round_start_first", 3, "escape_roundstart_first");
    zm_audio::musicstate_create("round_end", 3, "escape_roundend_1", "escape_roundend_2", "escape_roundend_3");
    zm_audio::musicstate_create("game_over", 5, "escape_death");
    zm_audio::musicstate_create("round_start_special", 3, "round_start_special");
    zm_audio::musicstate_create("round_end_special", 3, "round_end_special");
    zm_audio::musicstate_create("escape_catwalk", 4, "escape_catwalk");
    zm_audio::musicstate_create("ee_song", 4, "escape_ee_song");
    zm_audio::musicstate_create("ee_song_2", 4, "laundry_day");
    zm_audio::function_3442c81a(#"hash_9b40009eaa83579", "escape_theme", 0, 1, 4);
    zm_audio::function_3442c81a(#"hash_23dc7787e4d6b8b5", "location_cellblock", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_7806b6b51cd2aed2", "location_powerstation", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_408e00ed0c7af3b3", "location_stairwell", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_960d3edb9fefcec", "location_infirmary", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_4213dc004145588f", "location_dock", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_8a1754e2c346504", "location_showers", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_68ef83a1a918a522", "location_wardens_office", 1, undefined, 4);
    zm_audio::function_3442c81a(#"hash_676a058bfe70473", "location_rooftop", 1, 0, 4);
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0x6cad2b66, Offset: 0x5628
// Size: 0x3c8
function setup_personality_character_exerts() {
    level.exert_sounds[5][#"hitmed"] = "vox_plr_5_exert_pain";
    level.exert_sounds[6][#"hitmed"] = "vox_plr_6_exert_pain";
    level.exert_sounds[7][#"hitmed"] = "vox_plr_7_exert_pain";
    level.exert_sounds[8][#"hitmed"] = "vox_plr_8_exert_pain";
    level.exert_sounds[5][#"hitlrg"] = "vox_plr_5_exert_pain";
    level.exert_sounds[6][#"hitlrg"] = "vox_plr_6_exert_pain";
    level.exert_sounds[7][#"hitlrg"] = "vox_plr_6_exert_pain";
    level.exert_sounds[8][#"hitlrg"] = "vox_plr_7_exert_pain";
    level.exert_sounds[5][#"drowning"] = "vox_plr_5_exert_underwater_air_low";
    level.exert_sounds[6][#"drowning"] = "vox_plr_6_exert_underwater_air_low";
    level.exert_sounds[7][#"drowning"] = "vox_plr_7_exert_underwater_air_low";
    level.exert_sounds[8][#"drowning"] = "vox_plr_8_exert_underwater_air_low";
    level.exert_sounds[5][#"cough"] = "vox_plr_5_exert_gas_cough";
    level.exert_sounds[6][#"cough"] = "vox_plr_6_exert_gas_cough";
    level.exert_sounds[7][#"cough"] = "vox_plr_7_exert_gas_cough";
    level.exert_sounds[8][#"cough"] = "vox_plr_8_exert_gas_cough";
    level.exert_sounds[5][#"underwater_emerge"] = "vox_plr_5_exert_underwater_emerge_breath";
    level.exert_sounds[6][#"underwater_emerge"] = "vox_plr_6_exert_underwater_emerge_breath";
    level.exert_sounds[7][#"underwater_emerge"] = "vox_plr_7_exert_underwater_emerge_breath";
    level.exert_sounds[8][#"underwater_emerge"] = "vox_plr_8_exert_underwater_emerge_breath";
    level.exert_sounds[5][#"underwater_gasp"] = "vox_plr_5_exert_underwater_emerge_gasp";
    level.exert_sounds[6][#"underwater_gasp"] = "vox_plr_6_exert_underwater_emerge_gasp";
    level.exert_sounds[7][#"underwater_gasp"] = "vox_plr_7_exert_underwater_emerge_gasp";
    level.exert_sounds[8][#"underwater_gasp"] = "vox_plr_8_exert_underwater_emerge_gasp";
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xb8a9a7fb, Offset: 0x59f8
// Size: 0xe0
function function_1665f510() {
    if (level.chest_moves > 1) {
        zm_magicbox::default_box_move_logic();
    } else {
        level.chests = array::randomize(level.chests);
        for (i = 0; i < level.chests.size; i++) {
            if (level.chests[i].script_noteworthy != "new_industries_chest" && level.chests[i].script_noteworthy != "powerhouse_chest") {
                level.chest_index = i;
                break;
            }
        }
    }
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x1 linked
// Checksum 0xf237cb17, Offset: 0x5ae0
// Size: 0x21a
function function_adac5e49(a_keys) {
    if (!isdefined(self.var_ee09b3bf)) {
        self.var_ee09b3bf = 0;
    }
    if (a_keys[0] === getweapon(#"ww_blundergat_t8")) {
        self.var_ee09b3bf = 0;
        return a_keys;
    }
    n_chance = 0;
    if (zm_weapons::limited_weapon_below_quota(getweapon(#"ww_blundergat_t8"))) {
        self.var_ee09b3bf++;
        if (level.chest_moves == 0) {
            return a_keys;
        }
        if (self.var_ee09b3bf > 2 && self.var_ee09b3bf <= 5) {
            n_chance = 10;
        } else if (self.var_ee09b3bf > 5 && self.var_ee09b3bf <= 8) {
            n_chance = 25;
        } else if (self.var_ee09b3bf > 8) {
            n_chance = 50;
        }
    } else {
        self.var_ee09b3bf = 0;
    }
    if (randomint(100) <= n_chance && zm_magicbox::function_db355791(self, getweapon(#"ww_blundergat_t8")) && !self hasweapon(getweapon(#"ww_blundergat_t8_upgraded"))) {
        arrayinsert(a_keys, getweapon(#"ww_blundergat_t8"), 0);
        self.var_ee09b3bf = 0;
    }
    return a_keys;
}

// Namespace zm_escape/zm_escape
// Params 2, eflags: 0x1 linked
// Checksum 0xe9a509c, Offset: 0x5d08
// Size: 0x218
function function_3511e2af(w_weapon, e_player) {
    if (w_weapon == getweapon(#"ww_blundergat_t8") && (e_player hasweapon(getweapon(#"ww_blundergat_t8")) || e_player hasweapon(getweapon(#"ww_blundergat_t8_upgraded")) || e_player hasweapon(getweapon(#"ww_blundergat_acid_t8")) || e_player hasweapon(getweapon(#"ww_blundergat_acid_t8_upgraded")) || e_player hasweapon(getweapon(#"ww_blundergat_fire_t8")) || e_player hasweapon(getweapon(#"ww_blundergat_fire_t8_upgraded")) || e_player hasweapon(getweapon(#"ww_blundergat_fire_t8_unfinished")))) {
        return 0;
    } else if (w_weapon == getweapon(#"ww_blundergat_t8") && isdefined(e_player.var_22b64976)) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xf4496b36, Offset: 0x5f28
// Size: 0x1bc
function function_e6797b71() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    while (1) {
        a_e_players = getplayers();
        foreach (e_player in level.players) {
            if (isalive(e_player)) {
                str_zone = e_player zm_zonemgr::get_player_zone();
                if (isdefined(str_zone) && str_zone == "zone_model_industries") {
                    e_player clientfield::set("" + #"hash_500a87b29014ef02", 1);
                } else {
                    e_player clientfield::set("" + #"hash_500a87b29014ef02", 0);
                }
            } else {
                e_player clientfield::set("" + #"hash_500a87b29014ef02", 0);
            }
        }
        wait(1);
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x1 linked
// Checksum 0xfbacdcbb, Offset: 0x60f0
// Size: 0x18c
function function_172ac1b5() {
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2) {
        zm_zonemgr::enable_zone("zone_cellblock_jail_1");
        zm_zonemgr::enable_zone("zone_cellblock_jail_2");
        zm_zonemgr::enable_zone("zone_cellblock_jail_3");
        zm_zonemgr::enable_zone("zone_cellblock_jail_4");
        zm_zonemgr::enable_zone("zone_cellblock_west_barber");
        zm_zonemgr::enable_zone("zone_broadway_floor_2");
        zm_zonemgr::enable_zone("zone_cellblock_west");
        zm_zonemgr::enable_zone("zone_start");
        zm_zonemgr::enable_zone("zone_library");
        if (zm_custom::function_901b751c(#"zmpowerdoorstate") == 0) {
            zm_zonemgr::enable_zone("zone_catwalk_01");
            zm_zonemgr::enable_zone("zone_catwalk_02");
            zm_zonemgr::enable_zone("zone_catwalk_03");
            zm_zonemgr::enable_zone("zone_catwalk_04");
        }
    }
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0xd496d1a7, Offset: 0x6288
// Size: 0x144
function function_acb5b0ec() {
    /#
        if (!getdvarint(#"zm_debug_ee", 0)) {
            return;
        }
        zm_devgui::add_custom_devgui_callback(&function_91d91b76);
        adddebugcommand("zone_cellblock_west_warden");
        adddebugcommand("players_lose");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>");
        level thread open_sesame_watcher();
    #/
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x0
// Checksum 0xb0df583d, Offset: 0x63d8
// Size: 0x1d2
function function_91d91b76(cmd) {
    /#
        switch (cmd) {
        case #"hash_50d92ca3c6c7c2a8":
            level thread function_71a6c3ea();
            return 1;
            break;
        case #"hash_19614ce604c9ce92":
            level thread function_2b57b5d6();
            return 1;
            break;
        case #"hash_be933dada1170a":
            level thread function_4a3c0c1c("<unknown string>");
            return 1;
            break;
        case #"hash_52c70e592a1e4183":
            level thread function_4a3c0c1c("<unknown string>");
            return 1;
            break;
        case #"hash_55a34e1b7b9aae2c":
            level thread function_4b511c76();
            return 1;
        case #"hash_5fc934c29edaf827":
            level thread function_215297db();
            return 1;
        case #"hash_1eb585e188d312c2":
            level thread function_6b733771();
            return 1;
            break;
        case #"hash_11b05ce1cac4119e":
            level.var_a929ea7f = 1;
            break;
        case #"hash_1662437f1458600a":
            level.var_6764a35e = 1;
            break;
        }
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0x71acc14c, Offset: 0x65b8
// Size: 0x8e
function function_71a6c3ea() {
    /#
        zm_devgui::zombie_devgui_open_sesame();
        level thread namespace_f2502da8::function_e11ac4f5();
        namespace_9d58c1cd::function_7101d54f();
        var_ccc575d7 = getent("<unknown string>", "<unknown string>");
        var_ccc575d7 notify(#"blast_attack");
        level.var_af325495 = 1;
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0xd292ca13, Offset: 0x6650
// Size: 0x1e2
function function_2b57b5d6() {
    /#
        a_s_respawn_points = struct::get_array("<unknown string>");
        foreach (s_respawn_point in a_s_respawn_points) {
            a_s_points = struct::get_array(s_respawn_point.target);
            for (i = 1; i <= 4; i++) {
                var_5aa20049 = 0;
                foreach (s_point in a_s_points) {
                    if (s_point.script_int == i) {
                        var_5aa20049 = 1;
                    }
                    /#
                        assert(ispointonnavmesh(s_point.origin), "<unknown string>" + s_point.origin);
                    #/
                }
                /#
                    assert(var_5aa20049, "<unknown string>" + i + "<unknown string>" + s_respawn_point.script_noteworthy);
                #/
            }
        }
    #/
}

// Namespace zm_escape/zm_escape
// Params 1, eflags: 0x0
// Checksum 0x9cc78c69, Offset: 0x6840
// Size: 0x13c
function function_4a3c0c1c(var_3a1b23c2) {
    /#
        var_ff9196cc = 1;
        var_6c995818 = struct::get_array(var_3a1b23c2, "<unknown string>");
        foreach (s_point in var_6c995818) {
            if (!ispointonnavmesh(s_point.origin)) {
                var_ff9196cc = 0;
                /#
                    assert(0, "<unknown string>" + var_3a1b23c2 + "<unknown string>" + s_point.origin + "<unknown string>");
                #/
            }
        }
        if (var_ff9196cc) {
            iprintlnbold("<unknown string>" + var_3a1b23c2 + "<unknown string>");
        }
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0x4e0ff1f5, Offset: 0x6988
// Size: 0xec
function function_4b511c76() {
    /#
        foreach (var_46bf10d9 in level.var_4952e1) {
            var_46bf10d9 notify(#"hash_13c5316203561c4f");
            var_46bf10d9 notify(#"fully_charged");
            var_46bf10d9.var_740e1e0e setmodel("<unknown string>");
        }
        level.n_soul_catchers_charged = level.var_4952e1.size;
        level thread zm_escape_weap_quest::function_5fd2c72e();
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0x47f3501a, Offset: 0x6a80
// Size: 0x34
function open_sesame_watcher() {
    /#
        level waittill(#"open_sesame");
        level thread namespace_f2502da8::function_e11ac4f5();
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0xc4321384, Offset: 0x6ac0
// Size: 0x56
function function_215297db() {
    /#
        level notify(#"hash_3c3c6b906f6bbd6");
        if (!isdefined(level.var_6effbeb5)) {
            level.var_6effbeb5 = 1;
        } else {
            level.var_6effbeb5 = !level.var_6effbeb5;
        }
    #/
}

// Namespace zm_escape/zm_escape
// Params 0, eflags: 0x0
// Checksum 0xc04edc8c, Offset: 0x6b20
// Size: 0x38
function function_6b733771() {
    /#
        level notify(#"hash_6a6919e3cb8ef81");
        level notify(#"all_macguffins_acquired");
    #/
}

