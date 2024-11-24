#using script_190d6b82bcca0908;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\fx_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\ai\zm_ai_bat;
#using scripts\zm\ai\zm_ai_nosferatu;
#using scripts\zm\weapons\zm_weap_bowie;
#using scripts\zm\weapons\zm_weap_random_ray_gun;
#using scripts\zm\weapons\zm_weap_riotshield;
#using scripts\zm\zm_mansion_a_skeet_fink;
#using scripts\zm\zm_mansion_achievements;
#using scripts\zm\zm_mansion_boss_ww;
#using scripts\zm\zm_mansion_gamemodes;
#using scripts\zm\zm_mansion_impaler;
#using scripts\zm\zm_mansion_jordans;
#using scripts\zm\zm_mansion_ley_line;
#using scripts\zm\zm_mansion_pap_quest;
#using scripts\zm\zm_mansion_silver_bullet;
#using scripts\zm\zm_mansion_sound;
#using scripts\zm\zm_mansion_special_rounds;
#using scripts\zm\zm_mansion_stick_man;
#using scripts\zm\zm_mansion_storage;
#using scripts\zm\zm_mansion_trap_buy_buttons;
#using scripts\zm\zm_mansion_trap_werewolfer;
#using scripts\zm\zm_mansion_traps_firegates;
#using scripts\zm\zm_mansion_triad;
#using scripts\zm\zm_mansion_trials;
#using scripts\zm\zm_mansion_util;
#using scripts\zm\zm_mansion_ww_lvl1_quest;
#using scripts\zm\zm_mansion_ww_lvl2_quest;
#using scripts\zm\zm_mansion_ww_lvl3_quest;
#using scripts\zm\zm_mansion_zones;
#using scripts\zm\zm_trap_electric;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\load;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\util\ai_werewolf_util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_audio_sq;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_melee_weapon;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_pack_a_punch_util;
#using scripts\zm_common\zm_power;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_mansion;

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x2
// Checksum 0xb2684d09, Offset: 0xf68
// Size: 0x306
function autoexec opt_in() {
    level.aat_in_use = 1;
    level.bgb_in_use = 1;
    level.bgb_machine_count = 2;
    level.random_pandora_box_start = 1;
    level.custom_magic_box_selection_logic = &function_745370d2;
    level.var_2f57e2d2 = &function_d0a9da98;
    level flag::init("power_on2");
    level flag::init("power_on3");
    level flag::init("power_on666");
    level flag::init("first_werewolf_spawned");
    level flag::init("allow_normal_werewolf_spawns");
    level flag::init("open_pap");
    level flag::init("open_pap_dev");
    level flag::init("ww_obtained");
    level flag::init("ww3_obtained");
    level flag::init("guano_drop");
    level flag::init("gazed_main_hall");
    level flag::init("gazed_library");
    level flag::init("gazed_greenhouse");
    level flag::init(#"hash_29b12646045186fa");
    level flag::init(#"hash_2daf5bdda85cc660");
    /#
        level flag::init("<dev string:x38>");
        level flag::init("<dev string:x51>");
        level flag::init("<dev string:x6b>");
    #/
    level.var_6eac23d4 = 0;
    level.var_8442091f = 0;
    level.var_6930d2fd = 0;
    level.var_f1028094 = [];
    level.pack_a_punch_camo_index = 280;
    level.pack_a_punch_camo_index_number_variants = 5;
}

// Namespace zm_mansion/level_init
// Params 1, eflags: 0x40
// Checksum 0xc3d98fba, Offset: 0x1278
// Size: 0x13ac
function event_handler[level_init] main(eventstruct) {
    setclearanceceiling(131);
    level.var_e1d82d33 = 1500;
    level.var_cd24b30 = 32;
    level._uses_default_wallbuy_fx = 1;
    level._uses_sticky_grenades = 1;
    level._uses_taser_knuckles = 1;
    level.w_knife = getweapon(#"knife");
    level.w_bowie_knife = getweapon(#"bowie_knife");
    zm::init_fx();
    mansion_storage::init();
    mansion_pap::init_clientfields();
    mansion_pap::function_7255025f();
    namespace_a8113e97::init();
    namespace_b6ca3ccc::init();
    mansion_triad::init();
    mansion_impaler::init();
    mansion_a_skeet_fink::init();
    mansion_jordans::init();
    mansion_achievements::init();
    zm_audio_sq::init();
    clientfield::register("clientuimodel", "player_lives", 8000, 2, "int");
    clientfield::register("clientuimodel", "zmhud.ammoModifierActive", 8000, 1, "int");
    clientfield::register("world", "" + #"hash_42e03f9ae74a1070", 8000, 1, "int");
    clientfield::register("vehicle", "" + #"hash_602ae5683c010563", 8000, 1, "int");
    clientfield::register("vehicle", "" + #"hash_4bd91c5285da0899", 8000, 1, "counter");
    clientfield::register("scriptmover", "" + #"soul_fx", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"stone_pickup", 8000, 1, "int");
    clientfield::register("actor", "" + #"clock_zombie", 8000, 1, "int");
    clientfield::register("actor", "" + #"wisp_kill", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"blocker_fx", 8000, 1, "int");
    clientfield::register("item", "" + #"ww_pickup_part", 8000, 1, "int");
    clientfield::register("item", "" + #"hash_35ce4034ca7e543c", 8000, 3, "int");
    clientfield::register("scriptmover", "" + #"hash_487e544e29aa8e45", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"activate_mansion_artifact", 8000, getminbitcountfornum(3), "int");
    clientfield::register("scriptmover", "" + #"hash_44ee99a6591fe600", 8000, 1, "int");
    clientfield::register("toplayer", "" + #"hash_6a4f537da00ae3f9", 8000, 1, "int");
    clientfield::register("world", "" + #"hash_7fcdc47572bdbafa", 8000, 1, "int");
    clientfield::register("scriptmover", "" + #"force_stream_model", 8000, 1, "int");
    clientfield::register("world", "" + #"hash_458d10e70473adfd", 8000, 1, "int");
    zm_sq::register(#"zm_mansion_pap_quest", #"hash_12a37f2c621d1245", #"capture_souls", &mansion_pap::init, &mansion_pap::cleanup);
    zm_sq::register(#"zm_mansion_silver_bullet", #"collect_silver", #"silver_bullet", &mansion_silver_bullet::init, &mansion_silver_bullet::cleanup);
    level._effect[#"headshot"] = #"zombie/fx_bul_flesh_head_fatal_zmb";
    level._effect[#"headshot_nochunks"] = #"zombie/fx_bul_flesh_head_nochunks_zmb";
    level._effect[#"bloodspurt"] = #"zombie/fx_bul_flesh_neck_spurt_zmb";
    level._effect[#"animscript_gib_fx"] = #"zombie/fx_blood_torso_explo_zmb";
    level._effect[#"animscript_gibtrail_fx"] = #"blood/fx_blood_gib_limb_trail";
    level._effect[#"switch_sparks"] = #"electric/fx8_sparks_burst_dir_sm_orange_os";
    level._effect[#"zombie_jump_in_glass_burst"] = #"hash_336284821ea3902e";
    level._effect[#"power_on_impact"] = #"hash_6e44fde5d49cfc9b";
    level._effect[#"zmb_marker"] = #"hash_6714ad8af406b4ee";
    level._no_vending_machine_auto_collision = 1;
    level.default_start_location = "start_room";
    level.default_game_mode = "zclassic";
    level.round_wait_func = &function_802dde1f;
    level.pack_a_punch.custom_power_think = &mansion_pap::function_124362b5;
    level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
    level thread zm_mansion_special_rounds::init();
    level.var_22fda912 = &offhand_weapon_overrride;
    level.zombiemode_offhand_weapon_give_override = &offhand_weapon_give_override;
    level.var_ee565b3f = &ww_random_ray_gun::function_1998c3ac;
    level.var_bb2323e4 = &ww_random_ray_gun::function_912c1a28;
    level.var_d0ab70a2 = #"gamedata/weapons/zm/zm_mansion_weapons.csv";
    level._allow_melee_weapon_switching = 1;
    level.zombiemode_reusing_pack_a_punch = 1;
    level.custom_spawner_entry[#"crawl"] = &zm_spawner::function_45bb11e4;
    level.custom_spawner_entry[#"zombie_jump_in"] = &function_4b4b59ed;
    level.custom_spawner_entry[#"zombie_wallcrack"] = &function_d05b12f;
    level thread function_fc9d7a1f();
    callback::on_spawned(&on_player_spawned);
    callback::on_ai_killed(&mansion_util::function_9e147e0c);
    /#
        callback::on_bleedout(&on_player_bleedout);
    #/
    spawner::add_archetype_spawn_function(#"zombie", &function_d7bc28f1);
    callback::on_spawned(&zm_mansion_sound::function_a3a92098);
    if (util::get_game_type() == #"zstandard") {
        level.var_c032ff64 = &function_3bc4f1b5;
    }
    load::main();
    level.zones = [];
    level.zone_manager_init_func = &zm_mansion_zones::zone_init;
    init_zones[0] = "zone_start_east";
    init_zones[1] = "zone_start_west";
    level thread zm_mansion_zones::init();
    level thread zm_zonemgr::manage_zones(init_zones);
    level.random_pandora_box_start = 1;
    level.open_chest_location = [];
    level.magic_box_zbarrier_state_func = &zm_magicbox::function_35c66b27;
    level.chest_joker_model = "p8_fxanim_zm_zod_magic_box_skull_mod";
    level.chest_joker_custom_movement = &zm_magicbox::function_f5503c41;
    a_s_boxes = struct::get_array("treasure_chest_use");
    for (i = 0; i < a_s_boxes.size; i++) {
        level.open_chest_location[i] = a_s_boxes[i].script_noteworthy;
    }
    level._zombiemode_custom_box_move_logic = &function_c8ac6f35;
    level.customrandomweaponweights = &function_adac5e49;
    level.var_d5bd7049 = #"hash_d113c0c2602fb97";
    level thread sndfunctions();
    getweapon(#"zitem_silver_bullet_part_1").var_62a98b13 = #"charcoal";
    getweapon(#"zitem_silver_bullet_part_2").var_62a98b13 = #"guano";
    getweapon(#"zitem_silver_bullet_part_3").var_62a98b13 = #"sulfur";
    getweapon(#"zitem_silver_molten_part_1").var_25bb96cc = #"hash_70ba93e662197328";
    getweapon(#"zitem_silver_molten_part_2").var_25bb96cc = #"hash_70ba93e662197328";
    getweapon(#"zitem_silver_molten_part_3").var_25bb96cc = #"hash_70ba93e662197328";
    getweapon(#"zitem_silver_bullet_part_1").var_25bb96cc = #"hash_69e071a8eb1f216e";
    getweapon(#"zitem_silver_bullet_part_2").var_25bb96cc = #"hash_b94435b24bcdaf7";
    getweapon(#"zitem_silver_bullet_part_3").var_25bb96cc = #"hash_7b5b4849016125ac";
    zm_sq::start(#"zm_mansion_pap_quest", 1);
    zm_sq::start(#"zm_mansion_silver_bullet", 1);
    level thread function_2d164b86();
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") == 2 && zm_custom::function_901b751c(#"zmpowerstate") != 2) {
        level flag::set(#"hash_2daf5bdda85cc660");
        level notify(#"hash_2daf5bdda85cc660");
        function_e764a14b();
    }
    /#
        level thread devgui_setup();
    #/
    function_2c7766d0();
    function_7abcb565();
    function_38c64c43();
    level thread function_fa17b8da();
    level thread function_4972130a();
    level thread mansion_util::function_7b248ec9();
    if (!zm_utility::is_standard()) {
        level.var_932a1afb = &function_ae29ba0f;
        level.var_f7d93c4e = &function_cda69f5e;
    }
    level thread zm_mansion_sound::main();
    zm_custom::function_a00576dd(undefined, &function_389e7c22, &function_c8ce0a17, undefined);
    level flag::wait_till("all_players_spawned");
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2 || zm_custom::function_901b751c(#"zmpowerdoorstate") == 2) {
        level thread function_ff767eac();
    }
    level thread function_df9d5ef();
    hidemiscmodels("sentinel_artifact_destruction");
    if (!(isdefined(level.var_6d1e18b9) && level.var_6d1e18b9)) {
        hidemiscmodels("damaged_chandelier");
    }
    scene::add_scene_func("p_zm_seer_stone_s_in_female", &function_4db79562, "play");
    scene::add_scene_func("p_zm_seer_stone_s_in_female", &function_78276077, "done");
    scene::add_scene_func("p_zm_seer_stone_s_out_female", &function_48276a5e, "play");
    scene::add_scene_func("p_zm_seer_stone_s_in_male", &function_4db79562, "play");
    scene::add_scene_func("p_zm_seer_stone_s_in_male", &function_78276077, "done");
    scene::add_scene_func("p_zm_seer_stone_s_out_male", &function_48276a5e, "play");
    /#
        t_kill_ai = getent("<dev string:x84>", "<dev string:x90>");
        t_kill_ai callback::on_trigger(&function_d4ff1dd6);
    #/
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x5 linked
// Checksum 0xab75216c, Offset: 0x2630
// Size: 0x7c
function private function_fc9d7a1f() {
    level flag::wait_till("all_players_connected");
    level flag::wait_till_any(array(#"power_on1", #"hash_2daf5bdda85cc660"));
    changeadvertisedstatus(0);
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x1d033378, Offset: 0x26b8
// Size: 0x334
function on_player_spawned() {
    self.var_d049df11 = 0;
    self.var_c09a076a = 0;
    self.is_blue = 0;
    self clientfield::set_to_player("" + #"hash_6a4f537da00ae3f9", 0);
    self thread function_3bd89e18();
    self thread function_3cdddd34();
    self.var_aed1893c = [];
    if (self zm_characters::is_character(array(#"hash_5ebf024e1559c04a"))) {
        self zm_audio::function_87714659(&zm_mansion_sound::function_c8d42aba, #"revive", #"down");
        self zm_audio::function_87714659(&zm_mansion_sound::function_e432aeb6, #"pap", #"wait");
        self zm_audio::function_87714659(&zm_mansion_sound::function_658ce256, #"hero_activate", #"sword_pistol");
        self zm_audio::function_87714659(&zm_mansion_sound::function_edae33b5, #"kill", #"sword");
        self zm_audio::function_87714659(&zm_mansion_sound::function_fe8cce7a, #"hero_level_3", #"hammer");
        self zm_audio::function_87714659(&zm_mansion_sound::function_bb1888fe, #"hero_ready", #"scepter");
        self zm_audio::function_87714659(&zm_mansion_sound::function_f26d178f, #"hero_activate", #"scepter");
        self zm_audio::function_87714659(&zm_mansion_sound::function_1f4ab5ec, #"perk", #"generic");
        self.var_ab7bf755 = &zm_mansion_sound::function_df8a01f3;
    } else {
        self zm_audio::function_87714659(&zm_mansion_sound::function_4928382a, #"revive", #"down");
    }
    /#
        self thread function_60a2e5e1();
    #/
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x28ffc4cb, Offset: 0x29f8
// Size: 0x12
function function_d7bc28f1() {
    self.var_fad2bca9 = 1;
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xbada274e, Offset: 0x2a18
// Size: 0xcc
function function_4db79562(a_ents) {
    if (isplayer(a_ents[#"player 1"])) {
        a_ents[#"player 1"] waittill(#"fade_out", #"disconnect");
        if (isplayer(a_ents[#"player 1"])) {
            a_ents[#"player 1"] thread lui::screen_fade_out(0.5, "black");
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x3e203625, Offset: 0x2af0
// Size: 0x10c
function function_78276077(a_ents) {
    if (isplayer(a_ents[#"player 1"])) {
        a_ents[#"player 1"] thread lui::screen_fade_in(0.1, "black");
        a_ents[#"player 1"] waittill(#"hash_30795d8b5cd79089", #"hide_equipment_hint_text", #"disconnect");
        if (isplayer(a_ents[#"player 1"])) {
            a_ents[#"player 1"] thread lui::screen_fade_out(0, "black");
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x46a3387f, Offset: 0x2c08
// Size: 0xcc
function function_48276a5e(a_ents) {
    if (isplayer(a_ents[#"player 1"])) {
        a_ents[#"player 1"] waittill(#"fade_in", #"disconnect");
        if (isplayer(a_ents[#"player 1"])) {
            a_ents[#"player 1"] thread lui::screen_fade_in(0.3, "black");
        }
    }
}

/#

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0xeeb4d6bd, Offset: 0x2ce0
    // Size: 0x9a
    function function_60a2e5e1() {
        self endon(#"disconnect");
        if (isdefined(self.hud_ww)) {
            self.hud_ww destroy();
        }
        level waittill(#"start_of_round");
        if (!level flag::get("<dev string:x9d>")) {
            self.hud_ww = mansion_util::create_hudelem(20, 120);
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0x1ac55741, Offset: 0x2d88
    // Size: 0x2c
    function on_player_bleedout() {
        if (isdefined(self.hud_ww)) {
            self.hud_ww destroy();
        }
    }

#/

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x974e7598, Offset: 0x2dc0
// Size: 0x158
function function_3cdddd34() {
    self endon(#"death");
    if (!isdefined(self.var_15ba8367)) {
        self.var_15ba8367 = 0;
    }
    if (!isdefined(self.var_714f6ae6)) {
        self.var_714f6ae6 = 0;
    }
    while (!self.var_15ba8367 || !self.var_714f6ae6) {
        s_waitresult = self waittill(#"weapon_change");
        w_new = s_waitresult.weapon;
        if (!self.var_15ba8367 && w_new === level.var_6fe89212) {
            self thread zm_equipment::show_hint_text(#"hash_495dc239b32c6400", 7);
            self.var_15ba8367 = 1;
            continue;
        }
        if (!self.var_714f6ae6 && w_new === level.var_7b9ca97a) {
            self thread zm_equipment::show_hint_text(#"hash_5a27ab1680f0b8e5", 7);
            self.var_714f6ae6 = 1;
            return;
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xf1cef93c, Offset: 0x2f20
// Size: 0xce
function function_3bd89e18() {
    self notify(#"noshield");
    self endon(#"disconnect", #"noshield", #"bled_out");
    while (true) {
        s_notify = self waittill(#"weapon_change", #"hash_459246e5bfcc3713", #"destroy_riotshield");
        if (mansion_util::is_shield(s_notify.weapon)) {
            self.var_c09a076a = 1;
            continue;
        }
        self.var_c09a076a = 0;
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xb484a599, Offset: 0x2ff8
// Size: 0x28c
function function_fa17b8da() {
    var_8ef8659 = zm_crafting::get_component(#"zitem_silver_bullet_part_2");
    var_2631c53e = zm_crafting::get_component(#"zitem_silver_bullet_part_3");
    var_602e9ffa = zm_crafting::get_component(#"zitem_silver_molten_part_1");
    var_725ec45a = zm_crafting::get_component(#"zitem_silver_molten_part_2");
    var_c970f275 = zm_crafting::get_component(#"zitem_silver_molten_part_3");
    foreach (a_item_spawns in level.item_spawns) {
        foreach (var_d1f8412f in a_item_spawns) {
            var_dae71351 = 0;
            if (!isdefined(var_d1f8412f) || !isdefined(var_d1f8412f.item)) {
                continue;
            }
            if (var_d1f8412f.item === var_8ef8659) {
                var_dae71351 = 1;
            } else if (var_d1f8412f.item === var_2631c53e) {
                var_dae71351 = 2;
            } else if (var_d1f8412f.item === var_602e9ffa || var_d1f8412f.item === var_725ec45a) {
                var_dae71351 = 3;
            } else if (var_d1f8412f.item === var_c970f275) {
                var_dae71351 = 4;
            }
            if (var_dae71351) {
                var_d1f8412f clientfield::set("" + #"hash_35ce4034ca7e543c", var_dae71351);
            }
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xe0145951, Offset: 0x3290
// Size: 0x23e
function function_4972130a() {
    while (true) {
        waitresult = level waittill(#"component_collected");
        if (isdefined(waitresult.component.e_fx)) {
            waitresult.component.e_fx delete();
        }
        switch (waitresult.component.name) {
        case #"hash_5dba840c6ed3ea3b":
        case #"hash_5dba850c6ed3ebee":
            level.var_8442091f++;
            level notify(#"hash_879562bd9e764a4");
            if (level.var_8442091f > 1) {
                level thread function_91430bcc("ww2");
            }
            if (level flag::get("ww_obtained")) {
                level thread update_player_hud("ww2");
            }
            break;
        case #"zitem_chaos_lvl3_part_1":
        case #"zitem_chaos_lvl3_part_2":
        case #"zitem_chaos_lvl3_part_3":
            level.var_6930d2fd++;
            if (level.var_6930d2fd > 2) {
                level thread function_91430bcc("ww3");
            }
            level thread update_player_hud("ww3");
            break;
        case #"zitem_silver_bullet_part_4":
        case #"zitem_silver_bullet_part_2":
        case #"zitem_silver_bullet_part_3":
        case #"zitem_silver_bullet_part_1":
            level thread update_player_hud("bullet");
            break;
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x145cea0c, Offset: 0x34d8
// Size: 0x1aa
function update_player_hud(str_type) {
    switch (str_type) {
    case #"ww2":
        foreach (player in getplayers()) {
            if (isdefined(player.hud_ww)) {
                /#
                    player.hud_ww settext("<dev string:xac>" + level.var_8442091f + "<dev string:xba>");
                #/
            }
        }
        break;
    case #"ww3":
        foreach (player in getplayers()) {
            if (isdefined(player.hud_ww)) {
                /#
                    player.hud_ww settext("<dev string:xc2>" + level.var_6930d2fd + "<dev string:xd0>");
                #/
            }
        }
        break;
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x86868d2c, Offset: 0x3690
// Size: 0x1ac
function function_91430bcc(str_weapon) {
    b_ww_obtained = 0;
    if (str_weapon == "ww2") {
        w_ww = level.var_6fe89212;
        var_7a2b6ba8 = level.var_74cf08b1;
    } else {
        w_ww = level.var_7b9ca97a;
        var_7a2b6ba8 = level.var_4b14202f;
    }
    while (!b_ww_obtained) {
        foreach (player in getplayers()) {
            a_weapons = player getweaponslistprimaries();
            foreach (weapon in a_weapons) {
                if (weapon == var_7a2b6ba8 || weapon == w_ww) {
                    level thread function_ea36bce3(str_weapon);
                    b_ww_obtained = 1;
                    break;
                }
            }
        }
        wait 0.1;
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xca6a7dfc, Offset: 0x3848
// Size: 0x180
function function_ea36bce3(str_weapon) {
    if (str_weapon == "ww2") {
        foreach (player in getplayers()) {
            if (isdefined(player.hud_ww)) {
                /#
                    player.hud_ww settext("<dev string:xc2>" + level.var_6930d2fd + "<dev string:xd0>");
                #/
            }
        }
        return;
    }
    level flag::set("ww3_obtained");
    foreach (player in getplayers()) {
        if (isdefined(player.hud_ww)) {
            /#
                player.hud_ww destroy();
            #/
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x608d1d35, Offset: 0x39d0
// Size: 0x24
function player_out_of_playable_area_monitor_callback() {
    if (isdefined(self.var_f22c83f5) && self.var_f22c83f5) {
        return false;
    }
    return true;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x9db60655, Offset: 0x3a00
// Size: 0x24
function offhand_weapon_overrride() {
    zm_loadout::register_tactical_grenade_for_level("zhield_dw", 1);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x88db7f6c, Offset: 0x3a30
// Size: 0xc6
function offhand_weapon_give_override(str_weapon) {
    self endon(#"death");
    if (zm_loadout::is_tactical_grenade(str_weapon) && isdefined(self zm_loadout::get_player_tactical_grenade()) && !self zm_loadout::is_player_tactical_grenade(str_weapon)) {
        self setweaponammoclip(self zm_loadout::get_player_tactical_grenade(), 0);
        self takeweapon(self zm_loadout::get_player_tactical_grenade());
    }
    return false;
}

// Namespace zm_mansion/zm_mansion
// Params 12, eflags: 0x1 linked
// Checksum 0xb3ba0330, Offset: 0x3b00
// Size: 0x1a6
function function_78f60fd5(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (isplayer(attacker) && isdefined(self.archetype) && (self.archetype == #"nosferatu" || self.archetype == #"crimson_nosferatu") && attacker hasweapon(level.w_stake_knife)) {
        if (!(isdefined(attacker.var_594a3318) && attacker.var_594a3318)) {
            attacker thread zm_vo::function_a2bd5a0c(#"hash_682afe734ec44af", 3);
            attacker.var_594a3318 = 1;
        }
        self clientfield::set("" + #"hash_7a260c02e8c345c2", 1);
        self zombie_utility::gib_random_parts();
        gibserverutils::annihilate(self);
        return (self.health + 666);
    }
    return damage;
}

// Namespace zm_mansion/zm_mansion
// Params 15, eflags: 0x1 linked
// Checksum 0x34a95ae4, Offset: 0x3cb0
// Size: 0x10e
function function_293e7d89(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (isplayer(eattacker) && smeansofdeath === "MOD_MELEE" && eattacker hasweapon(level.w_stake_knife)) {
        self clientfield::set("" + #"hash_7a260c02e8c345c2", 1);
        return (self.health + 666);
    }
    return idamage;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x0
// Checksum 0x8a4ce288, Offset: 0x3dc8
// Size: 0x7c
function function_d515f923() {
    level flag::init("always_on");
    level flag::set("always_on");
    level.disable_kill_thread = 1;
    zm_zonemgr::add_adjacent_zone("start_zone", "corner_zone", "corner_zone_on", 0);
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xdadbee90, Offset: 0x3e50
// Size: 0x114
function function_c8ac6f35() {
    if (level flag::get("open_pap")) {
        zm_magicbox::default_box_move_logic();
        return;
    }
    var_15612e55 = level.chests[level.chest_index].script_noteworthy;
    level.chests = array::randomize(level.chests);
    for (i = 0; i < level.chests.size; i++) {
        if (level.chests[i].script_noteworthy != "pap_zone_chest" && level.chests[i].script_noteworthy != var_15612e55) {
            level.chest_index = i;
            break;
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xb0b42a6, Offset: 0x3f70
// Size: 0x21c
function function_adac5e49(a_keys) {
    if (!isdefined(level.var_ee09b3bf)) {
        level.var_ee09b3bf = 0;
    }
    if (!isdefined(level.var_6481a9af)) {
        level.var_6481a9af = 0;
    }
    if (!zm_weapons::get_is_in_box(level.var_f086136b)) {
        return a_keys;
    }
    if (a_keys[0] === level.var_f086136b) {
        level.var_ee09b3bf = 0;
        return a_keys;
    }
    n_chance = 0;
    if (!self hasweapon(level.var_f086136b) && !self hasweapon(level.var_6fe89212) && !self hasweapon(level.var_7b9ca97a)) {
        if (level.chest_moves == level.var_6481a9af) {
            return a_keys;
        }
        level.var_ee09b3bf++;
        if (level.var_ee09b3bf > 2 && level.var_ee09b3bf <= 5) {
            n_chance = 10;
        } else if (level.var_ee09b3bf > 5 && level.var_ee09b3bf <= 8) {
            n_chance = 25;
        } else if (level.var_ee09b3bf > 8) {
            n_chance = 50;
        }
        if (randomint(100) <= n_chance) {
            arrayinsert(a_keys, level.var_f086136b, 0);
            level.var_ee09b3bf = 0;
            level.var_6481a9af++;
        }
    }
    return a_keys;
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x14218f18, Offset: 0x4198
// Size: 0xf0
function function_d0a9da98(e_player) {
    if (isdefined(self.stub.trigger_target.weapon_out) && self.stub.trigger_target.weapon_out) {
        if (self.stub.trigger_target.zbarrier.weapon == level.var_f086136b) {
            if (e_player hasweapon(level.var_f086136b, 1) || e_player hasweapon(level.var_6fe89212, 1) || e_player hasweapon(level.var_7b9ca97a, 1)) {
                return false;
            }
        }
    }
    return true;
}

// Namespace zm_mansion/zm_mansion
// Params 2, eflags: 0x1 linked
// Checksum 0x1039f8ea, Offset: 0x4290
// Size: 0x78
function function_745370d2(w_weapon, e_player) {
    if (w_weapon == level.var_f086136b && (e_player hasweapon(level.var_6fe89212) || e_player hasweapon(level.var_7b9ca97a))) {
        return 0;
    }
    return 1;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x8d8515ec, Offset: 0x4310
// Size: 0x1fa
function function_802dde1f() {
    level endon(#"restart_round");
    /#
        level endon(#"kill_round");
        if (getdvarint(#"zombie_rise_test", 0)) {
            level waittill(#"forever");
        }
        if (zm::cheat_enabled(2)) {
            level waittill(#"forever");
        }
        if (getdvarint(#"zombie_default_max", 0) == 0) {
            level waittill(#"forever");
        }
        level thread zm_round_logic::print_zombie_counts();
        level thread zm_round_logic::sndmusiconkillround();
    #/
    level.var_4b5a684c = zm_round_logic::get_zombie_count_for_round(level.round_number, level.players.size);
    while (true) {
        var_7e5b8365 = zombie_utility::get_current_zombie_count() > 0 || level.zombie_total > 0 || level.intermission;
        if (!var_7e5b8365 || level flag::get("end_round_wait")) {
            break;
        }
        if (level flag::get("round_reset")) {
            break;
        }
        wait 1;
    }
    level.var_13473346 = 0;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xc91ae49c, Offset: 0x4518
// Size: 0x94
function sndfunctions() {
    if (zm_utility::is_standard()) {
        level.zmannouncerprefix = "rush";
    } else {
        level.zmannouncerprefix = "prst";
    }
    zm_utility::add_sound("zmb_heavy_door_open", "zmb_heavy_door_open");
    level thread setupmusic();
    level thread custom_add_vox();
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x17984081, Offset: 0x45b8
// Size: 0x64
function custom_add_vox() {
    zm_audio::loadplayervoicecategories(#"hash_41c3d60c9fdc1c1a");
    zm_audio::loadplayervoicecategories(#"hash_c79aaf74e007b22");
    zm_audio::loadplayervoicecategories(#"hash_74c49b8d4f407798");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xb9b74576, Offset: 0x4628
// Size: 0x22c
function setupmusic() {
    zm_audio::musicstate_create("round_start", 3, "mansion_roundstart_1", "mansion_roundstart_2", "mansion_roundstart_3");
    zm_audio::musicstate_create("round_start_first", 3, "mansion_roundstart_first");
    zm_audio::musicstate_create("round_end", 3, "mansion_roundend_1", "mansion_roundend_2", "mansion_roundend_3");
    zm_audio::musicstate_create("round_start_special", 3, "mansion_roundstart_special_1");
    zm_audio::musicstate_create("round_end_special", 3, "mansion_roundend_special_1");
    zm_audio::musicstate_create("game_over", 5, "mansion_death");
    zm_audio::musicstate_create("ee_song", 4, "ee_song");
    zm_audio::musicstate_create("quest_1", 4, "quest_1");
    zm_audio::musicstate_create("quest_2", 4, "quest_2");
    zm_audio::musicstate_create("quest_3", 4, "quest_3");
    level thread zm_audio::function_3442c81a(#"hash_2b19c9a3e37c977c", "location_music_room");
    level thread zm_audio::function_3442c81a(#"hash_4cfb09573e278f6a", "location_dining_room");
    level thread zm_audio::function_3442c81a(#"hash_4fa0217a1bf4ccdc", "location_greenhouse");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xfff339aa, Offset: 0x4860
// Size: 0x13c
function function_7abcb565() {
    if (util::get_game_type() == #"zstandard") {
        s_loc = struct::get("rush_perk_altar_cellar", "targetname");
    } else {
        s_loc = struct::get("random_perk_vapor_altar", "script_noteworthy");
    }
    if (isdefined(s_loc)) {
        a_s_mansion_random_statue_loc = struct::get_array("s_mansion_random_statue_loc");
        level.var_8104ec1b = arraygetclosest(s_loc.origin, a_s_mansion_random_statue_loc);
        if (isstring(s_loc.target2)) {
            a_col = getentarray(s_loc.target2, "targetname");
            array::run_all(a_col, &disconnectpaths);
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xabfa606a, Offset: 0x49a8
// Size: 0x72
function function_3bc4f1b5() {
    s_loc = struct::get("rush_perk_altar_cellar", "targetname");
    a_s_mansion_random_statue_loc = struct::get_array("random_perk_vapor_altar", "script_noteworthy");
    return arraygetclosest(s_loc.origin, a_s_mansion_random_statue_loc);
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x8cdc0b1d, Offset: 0x4a28
// Size: 0x1de
function function_38c64c43() {
    foreach (var_454e1877 in struct::get_array("perk_sigil")) {
        foreach (var_839c3bf7 in struct::get_array(var_454e1877.script_noteworthy, "prefabname")) {
            if (isdefined(var_839c3bf7.script_int)) {
                switch (var_839c3bf7.script_int) {
                case 0:
                    var_e09cfdd5 = "p8_zm_man_tea_room_door_frame_top_earth";
                    break;
                case 1:
                    var_e09cfdd5 = "p8_zm_man_tea_room_door_frame_top_fire";
                    break;
                case 2:
                    var_e09cfdd5 = "p8_zm_man_tea_room_door_frame_top_air";
                    break;
                case 3:
                    var_e09cfdd5 = "p8_zm_man_tea_room_door_frame_top_water";
                    break;
                }
                if (isdefined(var_e09cfdd5)) {
                    var_454e1877.var_e09cfdd5 = util::spawn_model(var_e09cfdd5, var_454e1877.origin, var_454e1877.angles);
                }
            }
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xa50c7f59, Offset: 0x4c10
// Size: 0x38e
function function_df9d5ef() {
    foreach (s_altar in struct::get_array("perk_vapor_altar")) {
        switch (s_altar.prefabname) {
        case #"graveyard":
            if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_zeus_mod") {
                exploder::exploder("exp_lgt_cemeter_alter_zeus");
            } else if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_odin_mod") {
                exploder::exploder("exp_lgt_cemeter_alter_odin");
            } else {
                exploder::exploder("exp_lgt_cemeter_alter_ra");
            }
            break;
        case #"gardens":
            if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_zeus_mod") {
                exploder::exploder("exp_lgt_garden_alter_zeus");
            } else if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_odin_mod") {
                exploder::exploder("exp_lgt_garden_alter_odin");
            } else {
                exploder::exploder("exp_lgt_garden_alter_ra");
            }
            break;
        case #"cellar":
            if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_zeus_mod") {
                exploder::exploder("exp_lgt_cellar_alter_zeus");
            } else if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_odin_mod") {
                exploder::exploder("exp_lgt_cellar_alter_odin");
            } else {
                exploder::exploder("exp_lgt_cellar_alter_ra");
            }
            break;
        case #"forest_entrance":
            if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_zeus_mod") {
                exploder::exploder("exp_lgt_forest_alter_zeus");
            } else if (s_altar.mdl_altar.model === #"p8_fxanim_zm_vapor_altar_odin_mod") {
                exploder::exploder("exp_lgt_forest_alter_odin");
            } else {
                exploder::exploder("exp_lgt_forest_alter_ra");
            }
            break;
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xf9c7ce93, Offset: 0x4fa8
// Size: 0x3c
function function_4b4b59ed(spot) {
    self thread zm_spawner::function_45bb11e4(spot);
    self thread function_5734f4d9();
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x5922b31b, Offset: 0x4ff0
// Size: 0x9c
function function_5734f4d9() {
    self endon(#"death");
    wait 0.3;
    self fx::play("zombie_jump_in_glass_burst", self.origin, self.angles, 7);
    glassradiusdamage(self.origin, 128, 128, 64);
    playrumbleonposition("damage_heavy", self.origin);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xf73c62c, Offset: 0x5098
// Size: 0x54
function function_d05b12f(spot) {
    if (randomint(100) > 50) {
        spot.scriptbundlename = "aib_vign_tplt_zm_ent_wall_crack_sngl_base_zombie_03";
    }
    self zm_spawner::function_45bb11e4(spot);
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x455ecacd, Offset: 0x50f8
// Size: 0xb4c
function function_2d164b86() {
    if (zm_custom::function_901b751c(#"zmpapenabled") != 2) {
        level.var_f3a008f = &function_db3037c7;
    }
    if (zm_custom::function_901b751c(#"zmdoorstate") == 2) {
        level.var_229f30cd = &function_d9848d71;
    }
    mdl_artifact = getent("artifact_mind", "script_noteworthy");
    var_3f772556 = getent("artifact_mind_card", "targetname");
    var_3f772556 linkto(mdl_artifact);
    mdl_artifact clientfield::set("" + #"activate_mansion_artifact", 1);
    var_3f772556 clientfield::set("" + #"hash_44ee99a6591fe600", 1);
    mdl_artifact notsolid();
    mdl_artifact bobbing((0, 0, 1), 0.5, 5);
    fx_holder = util::spawn_model("tag_origin", mdl_artifact.origin, mdl_artifact.angles);
    if (zm_utility::is_standard()) {
        var_6152b664 = getent("use_elec_switch", "targetname");
        var_6152b664 triggerenable(0);
    }
    var_fdbbb780 = 0;
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") == 2) {
        level waittill(#"all_players_spawned");
        level thread debris_scene("debris_to_dining_room_upper_scene", "connect_bedroom_to_dining_room", "Shot 1", "Shot 2");
        level thread debris_scene("debris_cemetery_entrance_scene", "connect_library_to_cemetery_entrance", "Shot 1", "Shot 2");
        level thread debris_scene("debris_cemetery_scene", "connect_cemetery_entrance_to_cemetery_graveyard", "Shot 1", "Shot 2");
        level thread scene::play("entrance_hall_exploding_door", "targetname");
        var_fdbbb780 = 1;
    }
    s_result = level waittill(#"hash_3e80d503318a5674");
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2) {
        level flag::set("power_on1");
        level flag::set("power_on2");
        level flag::set("power_on3");
    }
    if (isplayer(s_result.player)) {
        var_d11a4648 = s_result.player;
    }
    if (!var_fdbbb780) {
        level thread debris_scene("debris_to_dining_room_upper_scene", "connect_bedroom_to_dining_room", "Shot 1", "Shot 2");
        level thread debris_scene("debris_cemetery_entrance_scene", "connect_library_to_cemetery_entrance", "Shot 1", "Shot 2");
        level thread debris_scene("debris_cemetery_scene", "connect_cemetery_entrance_to_cemetery_graveyard", "Shot 1", "Shot 2");
    }
    mdl_artifact playsound(#"hash_75b9c9ad6ebe8af2");
    if (isalive(var_d11a4648)) {
        var_d11a4648 val::set("artifact_pickup", "takedamage", 0);
        var_d11a4648 val::set("artifact_pickup", "ignoreme", 1);
    }
    mdl_artifact clientfield::set("" + #"activate_mansion_artifact", 2);
    var_3f772556 clientfield::set("" + #"hash_44ee99a6591fe600", 0);
    wait 3;
    var_3f772556 delete();
    mdl_artifact setmodel(#"hash_57d5802b9383f9c7");
    mdl_artifact clientfield::set("" + #"activate_mansion_artifact", 3);
    var_8a281f69 = getvehiclenode("power_on_projectile_path_1", "targetname");
    v_pos = var_8a281f69.origin + (0, 0, -16);
    mdl_artifact moveto(v_pos, 1.5, 1, 0.5);
    mdl_artifact waittill(#"movedone");
    if (isalive(var_d11a4648)) {
        var_d11a4648 val::reset("artifact_pickup", "takedamage");
        var_d11a4648 val::reset("artifact_pickup", "ignoreme");
    }
    exploder::exploder("fxexp_power_artifact_burst");
    mdl_artifact clientfield::set("" + #"activate_mansion_artifact", 0);
    mdl_artifact delete();
    foreach (e_active_player in util::get_active_players()) {
        e_active_player playrumbleonentity("zm_power_on_rumble");
    }
    fx_holder notify(#"stop_glow");
    fx_holder delete();
    playsoundatposition(#"hash_3d8fef5997663b17", (0, 0, 0));
    var_5314bd63 = getent("veh_power_on_projectile", "targetname");
    for (i = 0; i < 4; i++) {
        var_a11e6097[i] = spawner::simple_spawn_single(var_5314bd63);
    }
    level thread function_94cf8d37("power_on_projectile_path_1", var_a11e6097[0], 30, 88);
    var_a11e6097[0] thread function_3e1f5f39(1);
    level thread function_94cf8d37("power_on_projectile_path_2", var_a11e6097[1], 30, 88);
    var_a11e6097[1] thread function_3e1f5f39(2);
    level thread function_94cf8d37("power_on_projectile_path_3", var_a11e6097[2], 30, 88);
    var_a11e6097[2] thread function_3e1f5f39(3);
    level thread function_94cf8d37("power_on_projectile_path_4", var_a11e6097[3], 30, 88);
    var_a11e6097[3] thread function_3e1f5f39(4);
    zm_power::turn_power_on_and_open_doors(2);
    if (!zm_utility::is_standard() && zm_custom::function_901b751c(#"zmpowerdoorstate") == 1) {
        level thread scene::play("entrance_hall_exploding_door", "targetname");
    }
    if (isalive(var_d11a4648)) {
        var_d11a4648 util::delay(6, "death", &zm_audio::create_and_play_dialog, #"sentinel", #"key");
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xbb65abf5, Offset: 0x5c50
// Size: 0x34
function function_db3037c7() {
    if (self.script_int === 666) {
        self thread function_ba054e47();
        return true;
    }
    return false;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x66e6a7a7, Offset: 0x5c90
// Size: 0x52
function function_ba054e47() {
    level endon(#"end_game");
    self.script_noteworthy = undefined;
    level flag::wait_till("gameplay_started");
    if (isdefined(self)) {
        self.script_noteworthy = "local_electric_door";
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x5efa9388, Offset: 0x5cf0
// Size: 0x33e
function function_d9848d71(a_zombie_doors) {
    level endon(#"end_game");
    a_zombie_debris = getentarray("zombie_debris", "targetname");
    var_38a6b7d0 = getentarray("zombie_airlock_buy", "targetname");
    foreach (door in a_zombie_doors) {
        if (door.target === "door_start_to_hall" || door.target === "door_hallend_to_grand_staircase") {
            if (!(isdefined(door.has_been_opened) && door.has_been_opened)) {
                door notify(#"trigger", {#is_forced:1});
            }
            waitframe(1);
        }
    }
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") == 0) {
        a_zombie_doors = [];
        a_zombie_debris = [];
        var_38a6b7d0 = [];
    }
    level flag::wait_till_any(array(#"power_on", #"power_on1", #"hash_2daf5bdda85cc660"));
    for (i = 0; i < a_zombie_doors.size; i++) {
        if (!(isdefined(a_zombie_doors[i].has_been_opened) && a_zombie_doors[i].has_been_opened)) {
            a_zombie_doors[i] notify(#"trigger", {#is_forced:1});
        }
        waitframe(1);
    }
    for (i = 0; i < var_38a6b7d0.size; i++) {
        if (isdefined(var_38a6b7d0[i])) {
            var_38a6b7d0[i] notify(#"trigger", {#is_forced:1});
        }
        waitframe(1);
    }
    for (i = 0; i < a_zombie_debris.size; i++) {
        if (isdefined(a_zombie_debris[i])) {
            a_zombie_debris[i] notify(#"trigger", {#is_forced:1});
        }
        waitframe(1);
    }
}

// Namespace zm_mansion/zm_mansion
// Params 4, eflags: 0x1 linked
// Checksum 0x9b80b604, Offset: 0x6038
// Size: 0x18c
function function_94cf8d37(var_62406c, var_62c4256, n_acceleration, n_speed) {
    nd_spline = getvehiclenode(var_62406c, "targetname");
    var_62c4256.origin = nd_spline.origin;
    var_62c4256.angles = nd_spline.angles;
    var_62c4256 setacceleration(n_acceleration);
    if (isdefined(n_speed)) {
        var_62c4256 setspeed(n_speed);
    }
    var_62c4256 clientfield::set("" + #"hash_602ae5683c010563", 1);
    var_62c4256 vehicle::get_on_and_go_path(nd_spline);
    var_62c4256 clientfield::set("" + #"hash_602ae5683c010563", 0);
    var_62c4256 clientfield::increment("" + #"hash_4bd91c5285da0899", 1);
    wait 0.1;
    var_62c4256 delete();
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xce5f2f1f, Offset: 0x61d0
// Size: 0x10c
function function_3e1f5f39(n_trail) {
    level endon(#"end_game");
    self endoncallback(&function_3ffb36f6, #"death");
    if (n_trail === 4) {
        level waittill(#"chandelier_fall");
        self thread power_on_impact();
        level thread function_de344348();
        level thread function_2ef77fbf();
    }
    level waittill("ceiling_break_" + n_trail);
    self thread power_on_impact();
    level scene::play("ceiling_break_" + n_trail, "targetname");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xcf9a6336, Offset: 0x62e8
// Size: 0x174
function function_de344348() {
    level endon(#"end_game");
    if (isdefined(level.var_6d1e18b9) && level.var_6d1e18b9) {
        return;
    }
    level thread function_c72fed9e();
    level scene::play("chandelier_fall", "targetname");
    showmiscmodels("sentinel_artifact_destruction");
    if (zm_custom::function_901b751c(#"zmpowerdoorstate") != 0) {
        level scene::delete_scene_spawned_ents("entrance_hall_exploding_door");
    }
    level scene::delete_scene_spawned_ents("ceiling_break_1");
    level scene::delete_scene_spawned_ents("ceiling_break_2");
    level scene::delete_scene_spawned_ents("ceiling_break_3");
    level scene::delete_scene_spawned_ents("ceiling_break_4");
    level scene::delete_scene_spawned_ents("chandelier_fall");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x7a3b2bc0, Offset: 0x6468
// Size: 0x4c
function function_c72fed9e() {
    level endon(#"end_game");
    level waittill(#"hash_2f2d88b84e2b0e4e");
    showmiscmodels("damaged_chandelier");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x7f5b8be4, Offset: 0x64c0
// Size: 0x74
function function_e764a14b() {
    level scene::play("chandelier_fall", "targetname");
    level scene::delete_scene_spawned_ents("chandelier_fall");
    level.var_6d1e18b9 = 1;
    showmiscmodels("damaged_chandelier");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x472ddd6b, Offset: 0x6540
// Size: 0x3c
function function_2ef77fbf() {
    level endon(#"end_game");
    wait 3;
    zm_power::turn_power_on_and_open_doors(3);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x78949a69, Offset: 0x6588
// Size: 0x20
function function_3ffb36f6(_hash) {
    level notify(#"hash_8b10a9a92b1a162");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xea01ddb, Offset: 0x65b0
// Size: 0x54
function power_on_impact() {
    self fx::play("power_on_impact", self.origin);
    playsoundatposition(#"zmb_sq_souls_release", self.origin);
}

// Namespace zm_mansion/zm_mansion
// Params 4, eflags: 0x1 linked
// Checksum 0xe25a330d, Offset: 0x6610
// Size: 0x94
function debris_scene(str_targetname, str_script_flag, var_d46cd47, var_d6d5180b) {
    level thread scene::play(str_targetname, var_d46cd47);
    level flag::wait_till(str_script_flag);
    level scene::play(str_targetname, var_d6d5180b);
    level scene::delete_scene_spawned_ents(str_targetname);
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xecb98938, Offset: 0x66b0
// Size: 0x66
function function_2c7766d0() {
    zm_fasttravel::function_44a82004("power_on1");
    level.var_5bfd847e = #"power_on1";
    level.var_e9737821 = &function_c52e8ba;
    level.var_352c9e03 = &function_af65fe93;
}

// Namespace zm_mansion/zm_mansion
// Params 2, eflags: 0x1 linked
// Checksum 0xff954dfe, Offset: 0x6720
// Size: 0x406
function function_c52e8ba(player, var_8d5d092c) {
    b_result = 0;
    if (!isdefined(self.hint_string)) {
        self.hint_string = [];
    }
    n_player_index = player getentitynumber();
    if (!self zm_fasttravel::function_d06e636b(player)) {
        self.hint_string[n_player_index] = #"";
    } else if (isdefined(self.stub.var_a4134e51) && !level flag::get(self.stub.var_a4134e51)) {
        switch (self.stub.var_a4134e51) {
        case #"open_pap":
            self.hint_string[n_player_index] = #"hash_6dcacaabbe757952";
            break;
        default:
            self.hint_string[n_player_index] = #"zombie/fasttravel_locked";
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
        switch (self.stub.script_string) {
        case #"greenhouse":
        case #"cemetery":
            self.hint_string[n_player_index] = zm_utility::function_d6046228(#"hash_34f259136740edfd", #"hash_58e6e210eddbebe3", #"hash_6de5ca8f5e14be4", #"hash_109ff9cf832cd388");
            break;
        case #"forest":
            self.hint_string[n_player_index] = zm_utility::function_d6046228(#"hash_3662e0cf1e9f6351", #"hash_54a78a5bd72eed4f", #"hash_18afd9a5deaedfe0", #"hash_538a37b473f5834c");
            break;
        case #"entrance_hall":
            self.hint_string[n_player_index] = zm_utility::function_d6046228(#"hash_65cbaa6146c8a85", #"hash_aed57a705546ebb", #"hash_471da16d5cb1956c", #"hash_276bed61279c11e0");
            break;
        default:
            self.hint_string[n_player_index] = zm_utility::function_d6046228(#"hash_2731cc5c1208e2e4", #"hash_47b20f457b370888");
            break;
        }
        b_result = 1;
    }
    return b_result;
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0xdd839b81, Offset: 0x6b30
// Size: 0xf4
function function_af65fe93(var_79bf62e6) {
    if (!isplayer(self) || !isdefined(var_79bf62e6)) {
        return;
    }
    str_loc = var_79bf62e6.stub.script_string;
    s_loc = struct::get(str_loc + "_end_" + mansion_util::get_player_index(self));
    self util::create_streamer_hint(s_loc.origin, s_loc.angles, 1);
    self util::delay("fasttravel_over", "disconnect", &util::clear_streamer_hint);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x6b7604c6, Offset: 0x6c30
// Size: 0xb2
function function_ae29ba0f(player) {
    switch (self.blueprint.name) {
    case #"zblueprint_chaos_lvl3":
    case #"zblueprint_mansion_ww_lvl2":
        if (!player hasweapon(self.blueprint.components[0]) && isdefined(self.bought) && self.bought) {
            self.hint_string = #"hash_64cb545dd18c607";
        }
        break;
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x3cf11de6, Offset: 0x6cf0
// Size: 0xbe
function function_cda69f5e(player) {
    switch (self.stub.blueprint.name) {
    case #"zblueprint_chaos_lvl3":
    case #"zblueprint_mansion_ww_lvl2":
        if (!player hasweapon(self.stub.blueprint.components[0]) && isdefined(self.stub.bought) && self.stub.bought) {
            return false;
        }
        break;
    }
    return true;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0x8197dea0, Offset: 0x6db8
// Size: 0x588
function play_outro_igc() {
    setdvar(#"hash_44340be18f159be3", 0);
    level.var_ea32773 = &function_7f493481;
    level thread scene::init_streamer(#"cin_zm_mansion_outro_butler", #"allies", 0, 0);
    scene::add_scene_func(#"cin_zm_mansion_outro_butler", &function_8b76623, "play");
    scene::add_scene_func(#"cin_zm_mansion_outro_butler", &function_9419b975, "sh195");
    scene::add_scene_func(#"cin_zm_mansion_outro_butler", &function_4e94caa8, "sh240");
    scene::add_scene_func(#"cin_zm_mansion_outro_exit_mansion", &function_34273b53, "play");
    scene::add_scene_func(#"cin_zm_mansion_outro_car_chase", &function_f996845d, "play");
    foreach (e_player in util::get_active_players()) {
        e_player freezecontrols(1);
        e_player.var_16735873 = 1;
        if (e_player laststand::player_is_in_laststand()) {
            e_player thread zm_laststand::auto_revive(e_player, 0, 0);
        }
        e_player val::set(#"outro", "takedamage", 0);
        e_player val::set(#"outro", "ignoreme", 1);
        e_player notify(#"bgb_update");
    }
    function_b7f33afa();
    level flag::clear("spawn_zombies");
    level flag::set(#"pause_round_timeout");
    level lui::screen_fade_out(1.6, "white");
    level util::delay(1.6, "end_game", &zm_utility::function_9ad5aeb1, 0, 0, 1, 0, 0);
    wait 1.6;
    level thread function_5bfd87e9();
    if (!isdefined(level.e_scarlett)) {
        level.e_scarlett = util::spawn_anim_model(#"hash_68e43aaeda249da8");
    }
    level.e_scarlett.targetname = "mansion_hero";
    level.e_scarlett hide();
    level zm_vo::function_3c173d37((0, 0, 0), 2147483647);
    level zm_audio::sndvoxoverride(1);
    clientfield::set("" + #"hash_7fcdc47572bdbafa", 1);
    hidemiscmodels("end_igc");
    zombie_utility::clear_all_corpses();
    util::set_lighting_state(0);
    level zm_utility::create_streamer_hint((-100, -26800, -5550), (12, -39, 0), 1, 180);
    scene::play(#"cin_zm_mansion_outro_butler");
    scene::play(#"cin_zm_mansion_outro_exit_mansion");
    scene::play(#"cin_zm_mansion_outro_car_chase");
    scene::play(#"cin_zm_mansion_outro_aftermath");
    level notify(#"end_game");
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xfc5d27e1, Offset: 0x7348
// Size: 0x2c
function function_7f493481() {
    setdvar(#"hash_44340be18f159be3", 1);
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xaaea0b84, Offset: 0x7380
// Size: 0x170
function function_5bfd87e9() {
    foreach (e_player in util::get_active_players()) {
        var_c97f5c44 = e_player getentitynumber();
        switch (var_c97f5c44) {
        case 0:
            v_position = (-893, -603, 4);
            break;
        case 1:
            v_position = (-857, -547, 4);
            break;
        case 2:
            v_position = (-775, -547, 4);
            break;
        case 3:
            v_position = (-736, -604, 4);
            break;
        }
        if (isdefined(v_position)) {
            e_player dontinterpolate();
            e_player setorigin(v_position);
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xb7264f2e, Offset: 0x74f8
// Size: 0x96
function function_b7f33afa() {
    if (isdefined(level.chests)) {
        zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", 0);
        level notify(#"fire_sale_off");
        for (i = 0; i < level.chests.size; i++) {
            level.chests[i] zm_magicbox::hide_chest(0);
        }
    }
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x79c45919, Offset: 0x7598
// Size: 0xec
function function_8b76623(a_ents) {
    level lui::screen_fade_in(0.15, "white");
    foreach (e_player in util::get_active_players()) {
        e_player freezecontrols(0);
    }
    level thread scene::init_streamer(#"cin_zm_mansion_outro_exit_mansion", #"allies", 0, 0);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x6f154b44, Offset: 0x7690
// Size: 0x44
function function_9419b975(a_ents) {
    level clientfield::set("" + #"hash_458d10e70473adfd", 1);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x740c2e4c, Offset: 0x76e0
// Size: 0x54
function function_4e94caa8(a_ents) {
    level.e_scarlett show();
    level clientfield::set("" + #"hash_458d10e70473adfd", 0);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x424ab0f, Offset: 0x7740
// Size: 0x44
function function_34273b53(a_ents) {
    level thread scene::init_streamer(#"cin_zm_mansion_outro_car_chase", #"allies", 0, 0);
}

// Namespace zm_mansion/zm_mansion
// Params 1, eflags: 0x1 linked
// Checksum 0x9f32e6f4, Offset: 0x7790
// Size: 0x44
function function_f996845d(a_ents) {
    level thread scene::init_streamer(#"cin_zm_mansion_outro_aftermath", #"allies", 0, 0);
}

// Namespace zm_mansion/zm_mansion
// Params 2, eflags: 0x1 linked
// Checksum 0x4e3e8e2c, Offset: 0x77e0
// Size: 0x5c
function function_389e7c22(var_404e4288, var_8dd554ee) {
    ai = zombie_werewolf_util::function_47a88a0c(1, undefined, 1);
    if (isdefined(ai)) {
        level.zombie_total--;
        return true;
    }
    return false;
}

// Namespace zm_mansion/zm_mansion
// Params 2, eflags: 0x1 linked
// Checksum 0x8086155b, Offset: 0x7848
// Size: 0x15a
function function_c8ce0a17(var_404e4288, var_8dd554ee) {
    if (math::cointoss()) {
        var_6095c0b6 = zm_round_logic::function_4e8157cd(var_404e4288, var_8dd554ee);
        if (isalive(var_6095c0b6.ai_spawned)) {
            zm_transform::function_d2374144(var_6095c0b6.ai_spawned, array::random(array(#"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water")));
        }
        return 1;
    }
    b_crimson = 0;
    if (math::cointoss(20)) {
        b_crimson = 1;
    }
    ai = zm_ai_nosferatu::function_74f25f8a(0, undefined, b_crimson);
    if (isdefined(ai)) {
        level.zombie_total--;
    }
    return 1;
}

// Namespace zm_mansion/zm_mansion
// Params 0, eflags: 0x1 linked
// Checksum 0xcea50082, Offset: 0x79b0
// Size: 0x74
function function_ff767eac() {
    level endon(#"end_game");
    level flag::wait_till("connect_foyer_end_to_grand_staircase");
    level flag::set("connect_start_east_to_foyer_floor2_east");
    level flag::set("connect_start_west_to_foyer_floor2_west");
}

/#

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0x11e9bde3, Offset: 0x7a30
    // Size: 0x5c
    function function_d4ff1dd6(waitresult) {
        if (waitresult.activator.health <= 0) {
            iprintlnbold("<dev string:xd8>" + waitresult.activator.origin);
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0xdf93ce42, Offset: 0x7a98
    // Size: 0xe4c
    function devgui_setup() {
        zm_devgui::add_custom_devgui_callback(&function_3f147b12);
        if (zm_utility::is_ee_enabled()) {
            adddebugcommand("<dev string:xee>");
            adddebugcommand("<dev string:x132>");
        }
        adddebugcommand("<dev string:x184>");
        adddebugcommand("<dev string:x1dd>");
        adddebugcommand("<dev string:x221>");
        adddebugcommand("<dev string:x275>");
        adddebugcommand("<dev string:x2d8>");
        adddebugcommand("<dev string:x337>");
        adddebugcommand("<dev string:x39c>");
        adddebugcommand("<dev string:x400>");
        adddebugcommand("<dev string:x46f>");
        adddebugcommand("<dev string:x4cf>");
        adddebugcommand("<dev string:x539>");
        adddebugcommand("<dev string:x5a3>");
        adddebugcommand("<dev string:x60d>");
        adddebugcommand("<dev string:x681>");
        adddebugcommand("<dev string:x6ed>");
        adddebugcommand("<dev string:x757>");
        adddebugcommand("<dev string:x7b7>");
        wait 0.5;
        adddebugcommand("<dev string:x813>");
        adddebugcommand("<dev string:x87f>");
        adddebugcommand("<dev string:x8ed>");
        adddebugcommand("<dev string:x959>");
        adddebugcommand("<dev string:x9d5>");
        adddebugcommand("<dev string:xa53>");
        adddebugcommand("<dev string:xacf>");
        adddebugcommand("<dev string:xb2d>");
        adddebugcommand("<dev string:xb91>");
        adddebugcommand("<dev string:xbf4>");
        adddebugcommand("<dev string:xc5a>");
        adddebugcommand("<dev string:xcb8>");
        adddebugcommand("<dev string:xd13>");
        adddebugcommand("<dev string:xd6c>");
        adddebugcommand("<dev string:xdc9>");
        adddebugcommand("<dev string:xe17>");
        adddebugcommand("<dev string:xe6f>");
        adddebugcommand("<dev string:xed5>");
        adddebugcommand("<dev string:xf25>");
        adddebugcommand("<dev string:xf7f>");
        wait 0.5;
        adddebugcommand("<dev string:xfe9>");
        adddebugcommand("<dev string:x103b>");
        adddebugcommand("<dev string:x108f>");
        adddebugcommand("<dev string:x10e1>");
        adddebugcommand("<dev string:x1110>");
        adddebugcommand("<dev string:x1167>");
        adddebugcommand("<dev string:x11cf>");
        adddebugcommand("<dev string:x122c>");
        adddebugcommand("<dev string:x128a>");
        adddebugcommand("<dev string:x12fd>");
        adddebugcommand("<dev string:x1369>");
        adddebugcommand("<dev string:x13ed>");
        adddebugcommand("<dev string:x146b>");
        adddebugcommand("<dev string:x14ef>");
        adddebugcommand("<dev string:x155a>");
        adddebugcommand("<dev string:x15dd>");
        adddebugcommand("<dev string:x1660>");
        adddebugcommand("<dev string:x16e1>");
        adddebugcommand("<dev string:x174e>");
        adddebugcommand("<dev string:x17d9>");
        adddebugcommand("<dev string:x185e>");
        adddebugcommand("<dev string:x18db>");
        adddebugcommand("<dev string:x1943>");
        adddebugcommand("<dev string:x19c5>");
        adddebugcommand("<dev string:x1a41>");
        adddebugcommand("<dev string:x1ac3>");
        adddebugcommand("<dev string:x1b2a>");
        adddebugcommand("<dev string:x1bab>");
        adddebugcommand("<dev string:x1c2c>");
        adddebugcommand("<dev string:x1cab>");
        adddebugcommand("<dev string:x1d14>");
        adddebugcommand("<dev string:x1d9d>");
        adddebugcommand("<dev string:x1e20>");
        adddebugcommand("<dev string:x1e9b>");
        adddebugcommand("<dev string:x1f01>");
        adddebugcommand("<dev string:x1f82>");
        adddebugcommand("<dev string:x1ffd>");
        adddebugcommand("<dev string:x207e>");
        adddebugcommand("<dev string:x20e3>");
        adddebugcommand("<dev string:x2163>");
        adddebugcommand("<dev string:x21e3>");
        adddebugcommand("<dev string:x2261>");
        adddebugcommand("<dev string:x22c8>");
        adddebugcommand("<dev string:x2350>");
        adddebugcommand("<dev string:x23d2>");
        adddebugcommand("<dev string:x244c>");
        adddebugcommand("<dev string:x24ae>");
        adddebugcommand("<dev string:x251a>");
        wait 0.5;
        adddebugcommand("<dev string:x257c>");
        adddebugcommand("<dev string:x25da>");
        adddebugcommand("<dev string:x2642>");
        adddebugcommand("<dev string:x26a0>");
        adddebugcommand("<dev string:x26fc>");
        adddebugcommand("<dev string:x2762>");
        adddebugcommand("<dev string:x27be>");
        adddebugcommand("<dev string:x27e6>");
        adddebugcommand("<dev string:x2836>");
        adddebugcommand("<dev string:x2882>");
        adddebugcommand("<dev string:x28e9>");
        adddebugcommand("<dev string:x2954>");
        adddebugcommand("<dev string:x29bf>");
        adddebugcommand("<dev string:x2a28>");
        adddebugcommand("<dev string:x2a8b>");
        adddebugcommand("<dev string:x2af2>");
        adddebugcommand("<dev string:x2b59>");
        adddebugcommand("<dev string:x2bbe>");
        adddebugcommand("<dev string:x2c1f>");
        adddebugcommand("<dev string:x2c84>");
        adddebugcommand("<dev string:x2ce9>");
        adddebugcommand("<dev string:x2d4c>");
        adddebugcommand("<dev string:x2dbc>");
        adddebugcommand("<dev string:x2e28>");
        adddebugcommand("<dev string:x2e94>");
        adddebugcommand("<dev string:x2efc>");
        adddebugcommand("<dev string:x2f66>");
        adddebugcommand("<dev string:x2fcc>");
        adddebugcommand("<dev string:x2ff9>");
        adddebugcommand("<dev string:x3056>");
        adddebugcommand("<dev string:x3081>");
        adddebugcommand("<dev string:x30d8>");
        adddebugcommand("<dev string:x3104>");
        adddebugcommand("<dev string:x3158>");
        adddebugcommand("<dev string:x31b4>");
        adddebugcommand("<dev string:x321c>");
        adddebugcommand("<dev string:x324b>");
        adddebugcommand("<dev string:x32a7>");
        adddebugcommand("<dev string:x32dc>");
        adddebugcommand("<dev string:x3336>");
        adddebugcommand("<dev string:x3365>");
        adddebugcommand("<dev string:x33c5>");
        adddebugcommand("<dev string:x3429>");
        adddebugcommand("<dev string:x348f>");
        adddebugcommand("<dev string:x34ee>");
        adddebugcommand("<dev string:x354f>");
        wait 0.5;
        if (zm_utility::is_ee_enabled()) {
            adddebugcommand("<dev string:x35a7>");
            adddebugcommand("<dev string:x3619>");
            adddebugcommand("<dev string:x3687>");
        }
        adddebugcommand("<dev string:x36f5>");
        adddebugcommand("<dev string:x376e>");
        adddebugcommand("<dev string:x379a>");
        adddebugcommand("<dev string:x37fc>");
        adddebugcommand("<dev string:x384a>");
        adddebugcommand("<dev string:x3897>");
        adddebugcommand("<dev string:x3900>");
        adddebugcommand("<dev string:x396b>");
        adddebugcommand("<dev string:x39ca>");
        adddebugcommand("<dev string:x3a16>");
        adddebugcommand("<dev string:x3a70>");
        adddebugcommand("<dev string:x3ac3>");
    }

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0xe0dd620a, Offset: 0x88f0
    // Size: 0x2572
    function function_3f147b12(cmd) {
        switch (cmd) {
        case #"hash_3f7ea542adb3e296":
            level thread open_sesame();
            return 1;
        case #"hash_50d92ca3c6c7c2a8":
            level open_sesame();
            function_1aba9a64();
            level notify(#"hash_2588983e2be22ca5");
            level thread mansion_impaler::open_crypt();
            level thread zm_sq::function_f2dd8601(#"hash_4c0e5e4b34877996", 1);
            level thread zm_sq::function_f2dd8601(#"hash_65636bbec86da22c", 1);
            level thread zm_sq::function_f2dd8601(#"zm_storage_billiards", 1);
            break;
        case #"open_crypt":
            level thread mansion_impaler::open_crypt();
            break;
        case #"open_pap":
            function_1aba9a64();
            return 1;
        case #"hash_4b566bfdbd45465e":
        case #"hash_41301a1e09c42bf":
        case #"hash_3ba92f19a63db88a":
        case #"hash_5c799ac70a138764":
            function_a8dfebca(cmd);
            break;
        case #"hash_66c794063cfbe16b":
            level.var_573d960c = undefined;
            break;
        case #"hash_7010e0191ddfd71e":
            level.players[0] giveweapon(level.var_f086136b);
            break;
        case #"hash_7010df191ddfd56b":
            level.players[0] giveweapon(level.var_6fe89212);
            level notify(#"ww_lvl2_crafted");
            break;
        case #"hash_7010de191ddfd3b8":
            level.players[0] giveweapon(level.var_7b9ca97a);
            level notify(#"ww_lvl3_crafted");
            break;
        case #"hash_7defe9dc837ecdb7":
            level.var_573d960c = 0;
            break;
        case #"hash_49ae48ac61695b43":
            level.var_573d960c = 3;
            break;
        case #"hash_3c30825a658c87fd":
            level.var_573d960c = 2;
            break;
        case #"spin_cycle":
            level.var_573d960c = 1;
            break;
        case #"hash_61784dca9e1bb496":
            level flag::set("<dev string:x38>");
            break;
        case #"hash_265294215e19c2c1":
            level flag::set("<dev string:x51>");
            break;
        case #"hash_64431ba102b7be4c":
            level flag::set("<dev string:x6b>");
            break;
        case #"hash_1e2d878115c34df1":
            level flag::set("<dev string:x3b23>");
            break;
        case #"hash_7143ffe29e3ae202":
            level flag::set("<dev string:x3b31>");
            break;
        case #"hash_50721510760870d3":
            level flag::set("<dev string:x3b3f>");
            break;
        case #"hash_38316c2c32e062e1":
            zm_devgui::zombie_devgui_goto_round(level.var_abe2c289);
            break;
        case #"hash_bb64387472f6f70":
            zm_devgui::zombie_devgui_goto_round(level.var_5657e981);
            break;
        case #"hash_32a1dfdaac71530":
            zm_devgui::zombie_devgui_goto_round(level.var_83b4d39);
            break;
        case #"hash_4d26340ade7eef62":
            foreach (player in level.players) {
                player mansion_silver_bullet::function_4e849ab();
            }
            break;
        case #"hash_7555d593aa74da8a":
            var_1dfad0cc = zm_crafting::get_component("<dev string:x3b4e>");
            var_627759fc = zm_crafting::get_component("<dev string:x3b6b>");
            var_66ba6282 = zm_crafting::get_component("<dev string:x3b88>");
            var_38f98701 = zm_crafting::get_component("<dev string:x3ba5>");
            level.players[0] giveweapon(var_1dfad0cc);
            level.players[0] giveweapon(var_627759fc);
            level.players[0] giveweapon(var_66ba6282);
            level.players[0] giveweapon(var_38f98701);
            break;
        case #"hash_b5647815560c6c6":
            level.var_940ee624 = 100;
            level zm_ui_inventory::function_7df6bb60(#"hash_379a0cb8e272c259", 1);
            level zm_ui_inventory::function_7df6bb60(#"hash_379a09b8e272bd40", 1);
            level zm_ui_inventory::function_7df6bb60(#"hash_379a0ab8e272bef3", 1);
            break;
        case #"hash_5a3bd6ce89f5f995":
            if (level flag::exists("<dev string:x3bc2>")) {
                level flag::set("<dev string:x3bc2>");
            }
            break;
        case #"hash_7af3cd7329aacc60":
            level.var_14a33fde = 1;
            break;
        case #"reset_werewolfer":
            level flag::clear(#"hash_2287cf5d6310237e");
            break;
        case #"hash_682ea0da80525b64":
            level flag::set("<dev string:x3bdb>");
            break;
        case #"hash_5e5988c329d7cffe":
            level notify(#"hash_348748d248801d6b");
            break;
        case #"hash_692c555ad0747a7c":
            bat::function_2e37549f(1, undefined);
            break;
        case #"hash_627749f1d7a46328":
            if (isdefined(level.zm_loc_types[#"werewolf_location"]) && level.zm_loc_types[#"werewolf_location"].size > 0) {
                s_spawn = array::random(level.zm_loc_types[#"werewolf_location"]);
                zombie_werewolf_util::function_47a88a0c(1, undefined, 1, s_spawn);
            }
            break;
        case #"hash_5bf31fb6caf6eac5":
            zombie_werewolf_util::function_47a88a0c(1, undefined, 1);
            break;
        case #"hash_141442e4fca71a1d":
            zombie_dog_util::function_62db7b1c(1, undefined);
            break;
        case #"hash_50f5df2c61fab9c0":
            zm_ai_nosferatu::function_74f25f8a(1, undefined);
            break;
        case #"hash_737d2d8656f8cee":
            zm_ai_nosferatu::function_74f25f8a(1, undefined, 1);
            break;
        case #"reset_rings":
            level.mdl_ring_outer rotateto(level.mdl_ring_outer.v_start, 1);
            level.mdl_ring_outer waittill(#"rotatedone");
            level.mdl_ring_middle.angles rotateto(level.mdl_ring_middle.v_start, 1);
            level.mdl_ring_middle waittill(#"rotatedone");
            level.mdl_ring_inner.angles rotateto(level.mdl_ring_inner.v_start, 1);
            level.mdl_ring_inner waittill(#"rotatedone");
            break;
        case #"hash_314962c418b83370":
            level flag::set("<dev string:x3bec>");
            break;
        case #"hash_9d9c5e54ae57d6":
            level.players[0] giveweapon(level.w_crossbow);
            break;
        case #"hash_77792be9b7f894df":
            foreach (player in level.players) {
                player giveweapon(level.w_crossbow);
            }
            break;
        case #"hash_2b311f89b1f9483a":
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            break;
        case #"hash_51d8ec3895703755":
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
        case #"hash_7b299dd5674009bb":
            var_99a245 = getent("<dev string:x3bf9>", "<dev string:x90>");
            var_d8f56b29 = getent("<dev string:x3c12>", "<dev string:x90>");
            var_aa527474 = getent("<dev string:x3c28>", "<dev string:x90>");
            var_99a245 magicgrenadetype(getweapon(#"eq_frag_grenade"), var_99a245.origin + (0, 0, 24), (0, 0, 1), 0.1);
            var_d8f56b29 magicgrenadetype(getweapon(#"eq_frag_grenade"), var_d8f56b29.origin + (0, 0, 24), (0, 0, 1), 0.1);
            var_aa527474 magicgrenadetype(getweapon(#"eq_frag_grenade"), var_aa527474.origin + (0, 0, 24), (0, 0, 1), 0.1);
            if (cmd !== "<dev string:x3c3f>") {
                break;
            }
            wait 1;
        case #"hash_369a377d29f023e4":
            a_stones = [];
            if (!isdefined(a_stones)) {
                a_stones = [];
            } else if (!isarray(a_stones)) {
                a_stones = array(a_stones);
            }
            a_stones[a_stones.size] = getent("<dev string:x3bf9>", "<dev string:x90>");
            if (!isdefined(a_stones)) {
                a_stones = [];
            } else if (!isarray(a_stones)) {
                a_stones = array(a_stones);
            }
            a_stones[a_stones.size] = getent("<dev string:x3c12>", "<dev string:x90>");
            if (!isdefined(a_stones)) {
                a_stones = [];
            } else if (!isarray(a_stones)) {
                a_stones = array(a_stones);
            }
            a_stones[a_stones.size] = getent("<dev string:x3c28>", "<dev string:x90>");
            spawners = getspawnerarray("<dev string:x3c62>", "<dev string:x90>");
            foreach (stone in a_stones) {
                spawner = array::random(spawners);
                spawner.script_forcespawn = 1;
                ai = zombie_utility::spawn_zombie(spawner);
                if (isai(ai)) {
                    ai forceteleport(stone.origin, stone.angles);
                    waitframe(1);
                    ai kill(ai.origin, level.players[0]);
                }
            }
            break;
        case #"hash_36298237b468465":
            level.var_426fec.var_1ed09409 = "<dev string:x3c76>";
            level.var_426fec.str_hint = "<dev string:x3c7f>";
            break;
        case #"hash_22d9fdee453c7ffd":
            level.var_426fec.var_1ed09409 = "<dev string:x3c76>";
            level.var_426fec.str_hint = "<dev string:x3c8a>";
            break;
        case #"hash_9b8b2bde7077b5d":
            level.var_426fec.var_1ed09409 = "<dev string:x3c76>";
            level.var_426fec.str_hint = "<dev string:x3c93>";
            break;
        case #"hash_114557ff111b0d23":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3c76>";
            level.var_2ff50a.str_hint = "<dev string:x3c7f>";
            break;
        case #"hash_701981ede51fb6a3":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3c76>";
            level.var_2ff50a.str_hint = "<dev string:x3c8a>";
            break;
        case #"hash_59233024a82f6a3":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3c76>";
            level.var_2ff50a.str_hint = "<dev string:x3c93>";
            break;
        case #"hash_1d2f70e6617bd429":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c7f>";
            break;
        case #"hash_4819b6f7db3eb7d9":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c8a>";
            break;
        case #"hash_68a7b05b1e1aabd9":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c93>";
            break;
        case #"hash_413d5b18f5751f8a":
            level.var_426fec.var_1ed09409 = "<dev string:x3ca0>";
            level.var_426fec.str_hint = "<dev string:x3ca8>";
            break;
        case #"hash_6018399b26a3112c":
            level.var_426fec.var_1ed09409 = "<dev string:x3ca0>";
            level.var_426fec.str_hint = "<dev string:x3cb5>";
            break;
        case #"hash_4485a0ddf8eb649d":
            level.var_426fec.var_1ed09409 = "<dev string:x3ca0>";
            level.var_426fec.str_hint = "<dev string:x3cc7>";
            break;
        case #"hash_13c626edcb44fdf0":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3ca0>";
            level.var_2ff50a.str_hint = "<dev string:x3ca8>";
            break;
        case #"hash_22e2f365e2153202":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3ca0>";
            level.var_2ff50a.str_hint = "<dev string:x3cb5>";
            break;
        case #"hash_3d1b999a9efe068f":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3ca0>";
            level.var_2ff50a.str_hint = "<dev string:x3cc7>";
            break;
        case #"hash_3c7ca5099e1d1256":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3ca0>";
            level.var_7ccd6341.str_hint = "<dev string:x3ca8>";
            break;
        case #"hash_15abb94c74e59368":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3ca0>";
            level.var_7ccd6341.str_hint = "<dev string:x3cb5>";
            break;
        case #"hash_1df86acdb45b3a61":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3ca0>";
            level.var_7ccd6341.str_hint = "<dev string:x3cc7>";
            break;
        case #"hash_c73cd1cb76ef466":
            level thread function_cdb82bab();
            break;
        case #"hash_67005c00c89e63c9":
            level.var_426fec.var_1ed09409 = "<dev string:x3cd4>";
            level.var_426fec.str_hint = "<dev string:x3cdf>";
            break;
        case #"hash_67005900c89e5eb0":
            level.var_426fec.var_1ed09409 = "<dev string:x3cd4>";
            level.var_426fec.str_hint = "<dev string:x3cec>";
            break;
        case #"hash_67005a00c89e6063":
            level.var_426fec.var_1ed09409 = "<dev string:x3cd4>";
            level.var_426fec.str_hint = "<dev string:x3cf9>";
            break;
        case #"hash_67005f00c89e68e2":
            level.var_426fec.var_1ed09409 = "<dev string:x3cd4>";
            level.var_426fec.str_hint = "<dev string:x3d06>";
            break;
        case #"hash_62d142021a0c6a13":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3cd4>";
            level.var_2ff50a.str_hint = "<dev string:x3cdf>";
            break;
        case #"hash_62d143021a0c6bc6":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3cd4>";
            level.var_2ff50a.str_hint = "<dev string:x3cec>";
            break;
        case #"hash_62d144021a0c6d79":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3cd4>";
            level.var_2ff50a.str_hint = "<dev string:x3cf9>";
            break;
        case #"hash_62d145021a0c6f2c":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3cd4>";
            level.var_2ff50a.str_hint = "<dev string:x3d06>";
            break;
        case #"hash_6154a32fbbcf2a8d":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3cd4>";
            level.var_7ccd6341.str_hint = "<dev string:x3cdf>";
            break;
        case #"hash_6154a02fbbcf2574":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3cd4>";
            level.var_7ccd6341.str_hint = "<dev string:x3cec>";
            break;
        case #"hash_6154a12fbbcf2727":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3cd4>";
            level.var_7ccd6341.str_hint = "<dev string:x3cf9>";
            break;
        case #"hash_61549e2fbbcf220e":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3cd4>";
            level.var_7ccd6341.str_hint = "<dev string:x3d06>";
            break;
        case #"hash_5b857bd9fbf0f6d9":
            level.var_426fec.var_1ed09409 = "<dev string:x3d13>";
            level.var_426fec.str_hint = "<dev string:x3d19>";
            break;
        case #"hash_6f622b829db8e60c":
            level.var_426fec.var_1ed09409 = "<dev string:x3d13>";
            level.var_426fec.str_hint = "<dev string:x3d24>";
            break;
        case #"hash_e3411c7ce19a133":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3d13>";
            level.var_2ff50a.str_hint = "<dev string:x3d19>";
            break;
        case #"hash_720c2222cca24e72":
            level.var_2ff50a.var_1ed09409 = "<dev string:x3d13>";
            level.var_2ff50a.str_hint = "<dev string:x3d24>";
            break;
        case #"hash_32551178b04964b5":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3d13>";
            level.var_7ccd6341.str_hint = "<dev string:x3d19>";
            break;
        case #"hash_af8eded21ec9f40":
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3d13>";
            level.var_7ccd6341.str_hint = "<dev string:x3d24>";
            break;
        case #"hash_4014ef26303c0251":
            level flag::set("<dev string:x3d2d>");
            break;
        case #"hash_79839f0e8f87465":
            if (isdefined(level.var_5c086e54)) {
                level.var_5c086e54[0] = level.var_d181080c[0].script_int;
                level.var_5c086e54[1] = level.var_d181080c[1].script_int;
                level.var_5c086e54[2] = level.var_d181080c[2].script_int;
                level flag::set("<dev string:x3d3c>");
            }
            break;
        case #"hash_558fa735338f60d9":
            level flag::set(#"forest_open");
            level flag::set(#"cemetery_open");
            level flag::set(#"greenhouse_open");
            break;
        case #"hash_158be57bab31a1fd":
            level.var_584c4114 = getvehiclenode("<dev string:x3d4b>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c7f>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_15125cf53616f2ab":
            level.var_584c4114 = getvehiclenode("<dev string:x3d6a>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c7f>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_63a191ef9ddff6a1":
            level.var_584c4114 = getvehiclenode("<dev string:x3d71>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c7f>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_4cae1f6081a88091":
            level.var_584c4114 = getvehiclenode("<dev string:x3d7b>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c93>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_39764bcce49b936d":
            level.var_584c4114 = getvehiclenode("<dev string:x3d89>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c93>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_68da4019022ea82a":
            level.var_584c4114 = getvehiclenode("<dev string:x3d94>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c93>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_519759be1fb9f671":
            level.var_584c4114 = getvehiclenode("<dev string:x3d9b>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c8a>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_392566928f90f17":
            level.var_584c4114 = getvehiclenode("<dev string:x3da5>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c8a>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_1ed2c1cfc4d8f32":
            level.var_584c4114 = getvehiclenode("<dev string:x3d24>", "<dev string:x3d55>");
            level.var_7ccd6341.var_1ed09409 = "<dev string:x3c76>";
            level.var_7ccd6341.str_hint = "<dev string:x3c8a>";
            level.var_bc07224f = 1;
            level.var_d4fada4a = 1;
            level.var_71561996 = 1;
            level thread open_sesame();
            break;
        case #"hash_575338253fb36c2":
            function_a72077f8();
            break;
        case #"hash_6c540109ff20f86d":
            level.var_d698a430 = 1;
            break;
        case #"hash_1fd93602bc1b246d":
            level thread function_2527ee2d();
            break;
        case #"hash_5838dc9777787d3d":
            function_ed41e7ca();
            break;
        case #"hash_4cb3ec4adfa4a708":
            level thread function_6802b9c8();
            break;
        case #"hash_42f5013f7892233e":
            level thread function_7a1bd36c();
            break;
        case #"hash_18e5378066aedefa":
        case #"hash_7c40bb2e7b0d29cc":
            level thread function_e907bb3d(cmd);
            break;
        case #"hash_2bf9bc30e54a1470":
            level thread function_ae21a5ee();
            break;
        case #"hash_59e2caf7a91feffb":
            level flag::set("<dev string:x3daf>");
            break;
        case #"hash_54603db1db9f5ec5":
            level flag::set("<dev string:x3dd7>");
            break;
        case #"hash_2540786a5e16c895":
            level flag::set("<dev string:x3e00>");
            break;
        case #"igc_play_outro":
            level scene::init_streamer(#"cin_zm_mansion_outro_butler", #"allies", 0, 0);
            level thread play_outro_igc();
            break;
        case #"hash_2b5e2a1e2bb301d1":
        case #"special_round_fog":
            function_d7bc714e(cmd);
            break;
        case #"hash_3dcf262f16faced0":
            var_cbd5530c = getdvarint(#"hash_3dcf262f16faced0", 0);
            setdvar(#"hash_3dcf262f16faced0", !var_cbd5530c);
            break;
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0xf15effa, Offset: 0xae70
    // Size: 0x13c
    function open_sesame() {
        zm_devgui::zombie_devgui_open_sesame();
        level thread scene::play("<dev string:x3e28>", "<dev string:x90>");
        level thread scene::play("<dev string:x3e47>", "<dev string:x90>");
        level thread scene::play("<dev string:x3e59>", "<dev string:x90>");
        level thread scene::play("<dev string:x3e6b>", "<dev string:x90>");
        level thread scene::play("<dev string:x3e7d>", "<dev string:x90>");
        level thread function_de344348();
        level flag::set("<dev string:x3e8f>");
        level flag::set("<dev string:x3e9b>");
    }

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0xcd693062, Offset: 0xafb8
    // Size: 0x20a
    function function_a8dfebca(cmd) {
        switch (cmd) {
        case #"hash_5c799ac70a138764":
            level flag::set("<dev string:x3ea7>");
            level zm_ui_inventory::function_7df6bb60(#"pap_1", 1);
            break;
        case #"hash_4b566bfdbd45465e":
            level flag::set("<dev string:x3ebb>");
            level zm_ui_inventory::function_7df6bb60(#"pap_2", 1);
            break;
        case #"hash_3ba92f19a63db88a":
            level flag::set("<dev string:x3ecd>");
            level zm_ui_inventory::function_7df6bb60(#"pap_3", 1);
            break;
        default:
            level flag::set("<dev string:x3ea7>");
            level flag::set("<dev string:x3ebb>");
            level flag::set("<dev string:x3ecd>");
            level zm_ui_inventory::function_7df6bb60(#"pap_1", 1);
            level zm_ui_inventory::function_7df6bb60(#"pap_2", 1);
            level zm_ui_inventory::function_7df6bb60(#"pap_3", 1);
            break;
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0x43d4b23d, Offset: 0xb1d0
    // Size: 0x134
    function function_1aba9a64() {
        s_pap_gate_loc = struct::get("<dev string:x3ee2>");
        function_a8dfebca("<dev string:x3ef1>");
        level thread scene::play(#"p8_fxanim_zm_man_ooze_clump_bundle", "<dev string:x3f01>");
        level thread scene::play(#"p8_fxanim_zm_man_ooze_clump_bundle", "<dev string:x3f10>");
        level thread scene::play(#"p8_fxanim_zm_man_ooze_clump_bundle", "<dev string:x3f1f>");
        level flag::set("<dev string:x3f2e>");
        level flag::set("<dev string:x3f40>");
        level flag::set("<dev string:x3f4f>");
        zm_unitrigger::unregister_unitrigger(s_pap_gate_loc.var_47323b73);
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0xc8700295, Offset: 0xb310
    // Size: 0x166
    function function_a72077f8() {
        foreach (ai_zombie in getaiteamarray(#"axis")) {
            if (!isdefined(ai_zombie.var_3f5addd0)) {
                if (isalive(ai_zombie) && isdefined(ai_zombie.archetype) && (ai_zombie.archetype == #"zombie" || ai_zombie.archetype == #"nosferatu" || ai_zombie.archetype == #"zombie_dog")) {
                    ai_zombie clientfield::set("<dev string:x3f5a>" + #"wisp_kill", 1);
                    ai_zombie.var_3f5addd0 = 1;
                }
            }
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0xbe35bc3f, Offset: 0xb480
    // Size: 0xae
    function function_2527ee2d() {
        level endon(#"end_game", #"hash_59a4398b145082a");
        level flag::wait_till("<dev string:x3f5d>");
        if (isdefined(level.players[0].var_88c7d6c3) && level.players[0].var_88c7d6c3) {
            return;
        }
        mansion_pap::function_9e7129d2(level.players[0]);
        level.players[0].var_88c7d6c3 = 0;
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0x2b369fa5, Offset: 0xb538
    // Size: 0xf4
    function function_ed41e7ca() {
        if (isdefined(level.var_956b1da3) && isdefined(level.var_ad214ed0)) {
            level.var_956b1da3.origin = level.var_ad214ed0.origin;
            return;
        }
        level.var_ad214ed0 = util::spawn_model("<dev string:x3f74>", level.players[0].origin);
        level.var_956b1da3 = util::spawn_model("<dev string:x3f74>", (100000, 100000, 100000));
        level.var_ad214ed0 thread mansion_pap::function_d409a74f(level.var_956b1da3);
        level.var_ad214ed0 thread mansion_pap::function_c9c7a593();
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0x180c2d2c, Offset: 0xb638
    // Size: 0x218
    function function_cdb82bab() {
        level notify(#"hash_48ee29312bd2ad06");
        level endon(#"hash_48ee29312bd2ad06");
        var_8f129c8e = [];
        if (!isdefined(var_8f129c8e)) {
            var_8f129c8e = [];
        } else if (!isarray(var_8f129c8e)) {
            var_8f129c8e = array(var_8f129c8e);
        }
        var_8f129c8e[var_8f129c8e.size] = getent("<dev string:x3f81>", "<dev string:x90>");
        if (!isdefined(var_8f129c8e)) {
            var_8f129c8e = [];
        } else if (!isarray(var_8f129c8e)) {
            var_8f129c8e = array(var_8f129c8e);
        }
        var_8f129c8e[var_8f129c8e.size] = getent("<dev string:x3f90>", "<dev string:x90>");
        if (!isdefined(var_8f129c8e)) {
            var_8f129c8e = [];
        } else if (!isarray(var_8f129c8e)) {
            var_8f129c8e = array(var_8f129c8e);
        }
        var_8f129c8e[var_8f129c8e.size] = getent("<dev string:x3fa4>", "<dev string:x90>");
        level thread function_89244213(var_8f129c8e);
        do {
            array::thread_all(var_8f129c8e, &mansion_pap::function_1a82ca71, undefined, 0);
            array::wait_till(var_8f129c8e, "<dev string:x3fb3>");
            wait 1.5;
        } while (getdvarint(#"hash_2340f8cb271f85fd", 0));
        level notify(#"hash_48ee29312bd2ad06");
    }

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0x5b1b4851, Offset: 0xb858
    // Size: 0xd0
    function function_89244213(var_8f129c8e) {
        level endon(#"hash_48ee29312bd2ad06");
        while (isdefined(1)) {
            wait 2;
            array::thread_all(var_8f129c8e, &clientfield::set, "<dev string:x3f5a>" + #"hash_47b8db8cde2c4291", 13);
            wait 2;
            level notify(#"hash_5a23f461b8ae05a4");
            wait 2;
            array::thread_all(var_8f129c8e, &clientfield::set, "<dev string:x3f5a>" + #"hash_47b8db8cde2c4291", 0);
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0x231ac081, Offset: 0xb930
    // Size: 0x1f4
    function function_6802b9c8() {
        a_paintings = [];
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3cdf>", "<dev string:x90>");
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3cec>", "<dev string:x90>");
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3cf9>", "<dev string:x90>");
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3d06>", "<dev string:x90>");
        array::thread_all(a_paintings, &clientfield::set, "<dev string:x3f5a>" + #"hash_11eb6b7dc7db71ad", 1);
    }

    // Namespace zm_mansion/zm_mansion
    // Params 0, eflags: 0x0
    // Checksum 0x3c63bf26, Offset: 0xbb30
    // Size: 0x1f4
    function function_7a1bd36c() {
        a_paintings = [];
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3cdf>", "<dev string:x90>");
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3cec>", "<dev string:x90>");
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3cf9>", "<dev string:x90>");
        if (!isdefined(a_paintings)) {
            a_paintings = [];
        } else if (!isarray(a_paintings)) {
            a_paintings = array(a_paintings);
        }
        a_paintings[a_paintings.size] = getent("<dev string:x3d06>", "<dev string:x90>");
        array::thread_all(a_paintings, &clientfield::set, "<dev string:x3f5a>" + #"hash_11eb6b7dc7db71ad", 0);
    }

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0x6e6bf797, Offset: 0xbd30
    // Size: 0xac
    function function_e907bb3d(cmd) {
        if (cmd == "<dev string:x3fc5>") {
            array::thread_all(level.activeplayers, &clientfield::set, "<dev string:x3f5a>" + #"hash_49de76d6c4f95e5d", 0);
            return;
        }
        array::thread_all(level.activeplayers, &clientfield::set, "<dev string:x3f5a>" + #"hash_49de76d6c4f95e5d", 1);
    }

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0x58274cad, Offset: 0xbde8
    // Size: 0xf8
    function function_ae21a5ee(cmd) {
        foreach (ai in getaiteamarray(#"axis")) {
            if (isalive(ai) && ai.archetype === #"zombie") {
                ai clientfield::set("<dev string:x3f5a>" + #"clock_zombie", 1);
            }
        }
    }

    // Namespace zm_mansion/zm_mansion
    // Params 1, eflags: 0x0
    // Checksum 0x79437c8e, Offset: 0xbee8
    // Size: 0x6c
    function function_d7bc714e(cmd) {
        if (cmd == "<dev string:x3fdf>") {
            level thread zm_mansion_special_rounds::function_93eab559();
            return;
        }
        level clientfield::set("<dev string:x3f5a>" + #"hash_42e03f9ae74a1070", 0);
    }

#/
