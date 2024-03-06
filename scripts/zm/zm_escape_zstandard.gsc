// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial_util.gsc;
#using script_2595527427ea71eb;
#using scripts\zm\zm_escape_pap_quest.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_utility_zstandard.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_escape_zstandard;

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xa9e8cf18, Offset: 0x5a0
// Size: 0x14
function main() {
    init_level_vars();
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xfe35f7f7, Offset: 0x5c0
// Size: 0x1d4
function init_level_vars() {
    function_edd5bb1a();
    function_ac904e5e();
    level thread init_pack_a_punch();
    level.fn_custom_round_ai_spawn = undefined;
    level callback::function_74872db6(&function_74872db6);
    level.var_3f86fd35 = 15;
    level.var_d7853f35 = 25;
    level.var_ecdf38f = 13;
    level.var_55e562f9 = 16;
    level thread function_ba269c78();
    level thread function_6e1201a8();
    level thread zm_blockers::function_6f01c3cf("model_industries_a", "script_string", 0);
    level thread zm_blockers::function_6f01c3cf("model_industries_b", "script_string", 0);
    level thread zm_blockers::function_6f01c3cf("model_industries_d", "script_string", 0);
    level thread zm_blockers::function_6f01c3cf("model_industries_e", "script_string", 0);
    level.zombie_hints[#"default_treasure_chest"] = #"hash_57a34375dddce337";
    level thread defend_areas();
    level thread function_9217567c();
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x68562d87, Offset: 0x7a0
// Size: 0x20a
function function_9217567c() {
    level waittill(#"all_players_spawned");
    w_item = zm_crafting::get_component(#"hash_1e5657f6a6f09389");
    e_player = array::random(level.players);
    zm_items::player_pick_up(e_player, w_item);
    foreach (a_s_crafting in level.var_4fe2f84d) {
        foreach (s_crafting in a_s_crafting) {
            if (isarray(s_crafting.craftfoundry.blueprints)) {
                foreach (s_blueprint in s_crafting.craftfoundry.blueprints) {
                    if (s_blueprint.name === #"zblueprint_shield_spectral_shield") {
                        s_crafting.blueprint = s_blueprint;
                    }
                }
            }
        }
    }
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x54890c34, Offset: 0x9b8
// Size: 0x314
function init_pack_a_punch() {
    level flag::wait_till(#"pap_quest_completed");
    wait(1);
    var_4d8e32c8 = getentarray("zm_pack_a_punch", "targetname");
    foreach (var_5e879929 in var_4d8e32c8) {
        if (var_5e879929.script_string === "power_house" || var_5e879929.script_string === "cd_street") {
            var_5e879929 zm_pack_a_punch::function_bb629351(0);
            var_5e879929 zm_pack_a_punch::set_state_initial();
            var_5e879929 zm_pack_a_punch::set_state_hidden();
            pap_quest::pap_debris(1, var_5e879929.script_string);
            var_5e879929 notify(#"hash_168e8f0e18a79cf8");
        } else {
            pap_quest::pap_debris(0, var_5e879929.script_string);
        }
    }
    level waittill(#"hash_6c660debf41d6362", #"open_sesame");
    var_4d8e32c8 = getentarray("zm_pack_a_punch", "targetname");
    foreach (var_5e879929 in var_4d8e32c8) {
        if (var_5e879929.script_string === "cd_street") {
            continue;
        }
        if (var_5e879929.script_string === "power_house") {
            exploder::exploder("lgtexp_pap_powerhouse_on");
        } else if (var_5e879929.script_string === "roof") {
            exploder::exploder("lgtexp_pap_rooftops_on");
        } else {
            exploder::exploder("lgtexp_pap_b64_on");
        }
        var_5e879929 zm_pack_a_punch::function_bb629351(1);
        pap_quest::pap_debris(0, var_5e879929.script_string);
        var_5e879929 notify(#"hash_168e8f0e18a79cf8");
    }
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xcd8
// Size: 0x4
function function_74872db6() {
    
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xfdc6ef5e, Offset: 0xce8
// Size: 0x6c
function function_ba269c78(n_round) {
    level endon(#"end_game");
    level waittill(#"spawn_brutus");
    wait(1.5);
    zm_utility::function_9b7bc715(#"brutus", 1);
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xcdcd0fce, Offset: 0xd60
// Size: 0x64
function function_6e1201a8(n_round) {
    level endon(#"end_game");
    level waittill(#"hash_744c6105bcd18f3a");
    zm_utility::function_9b7bc715(#"zombie_dog", 1);
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x1d2a519f, Offset: 0xdd0
// Size: 0x3c
function function_edd5bb1a() {
    if (zm_utility::function_e37823df()) {
        zm_utility::function_6df718d(#"hash_6db3dde314ca084", 0);
    }
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xb4af4db7, Offset: 0xe18
// Size: 0xd60
function defend_areas() {
    level endon(#"end_game");
    function_84139b27();
    level flag::wait_till("start_zombie_round_logic");
    var_40762d8a = getent("t_catwalk_door_open", "targetname");
    var_40762d8a sethintstring(#"hash_1228aacbdf256d7e");
    t_door_catwalk = getent("door_model_west_side_exterior_to_catwalk", "target");
    t_door_catwalk sethintstring(#"hash_1228aacbdf256d7e");
    var_40762d8a setinvisibletoall();
    t_door_catwalk setinvisibletoall();
    zm_utility::enable_power_switch(0, 0, "power_house_power_switch", "script_noteworthy", #"hash_58ad53dcf0f18a1");
    zm_utility::enable_power_switch(0, 0, "building_64_switches", "script_noteworthy", #"hash_40e952a5e8c4e1f5");
    enable_gondola_at_docks(0);
    /#
        if (getdvarint(#"hash_b3363e1d25715d7", 0)) {
            level notify(#"hash_417b024aa81e3cb8");
            level thread function_c3ad6d4a();
            level thread enable_gondola_at_docks(1);
            level thread function_b9cacd48();
            return;
        }
    #/
    level waittill(#"end_of_round");
    level zm_utility::open_door("door_model_industries_to_west_side_exterior", undefined, undefined, 1);
    str_next_defend = array::random(array(#"powerhouse", #"new_industries"));
    level waittill(#"end_of_round");
    if (str_next_defend == #"powerhouse") {
        level zm_utility::open_door("door_model_west_side_exterior_upper_to_west_side_exterior_upper", undefined, undefined, 1);
    } else {
        level zm_utility::open_door("door_model_west_side_exterior_to_new_industries", undefined, undefined, 1);
    }
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    zm_zonemgr::function_8caa21df(array("zone_powerhouse", "zone_new_industries"));
    wait(3);
    zm_utility::enable_power_switch(1, 1, "power_house_power_switch", "script_noteworthy");
    level notify(#"hash_417b024aa81e3cb8");
    if (str_next_defend == #"new_industries") {
        str_first_defend = #"new_industries";
        str_second_defend = #"powerhouse";
    } else {
        str_first_defend = #"powerhouse";
        str_second_defend = #"new_industries";
    }
    wait(5);
    s_defend_area = zm_utility::function_a877cd10(str_first_defend);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 20);
    zm_utility::function_fef4b36a(str_first_defend);
    level zm_utility::open_door(array("door_model_west_side_exterior_upper_to_west_side_exterior_upper", "door_model_west_side_exterior_to_new_industries", "west_side_exterior_lower_to_tunnel"), 0, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_second_defend);
    wait(20);
    s_defend_area = zm_utility::function_a877cd10(str_second_defend);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    zm_utility::function_fef4b36a(str_second_defend);
    level notify(#"hash_545d84d6e7f5c7a6");
    str_next_defend = array::random(array(#"cd_street", #"times_square", #"michigan_avenue", #"cafeteria"));
    switch (str_next_defend) {
    case #"cd_street":
    case #"michigan_avenue":
    case #"times_square":
        var_420e4589 = array("cellblock_east_door", "cellblock_start_door");
        break;
    case #"cafeteria":
        var_420e4589 = array("cellblock_east_door", "cellblock_start_door", "door_cafeteria_to_times_square");
        break;
    }
    level zm_utility::open_door(var_420e4589, 0, 8, 1);
    if (isdefined(var_40762d8a)) {
        var_40762d8a setvisibletoall();
        t_door_catwalk setvisibletoall();
        var_40762d8a sethintstring(#"hash_52803ee9fe3f2ea5");
        var_40762d8a notify(#"trigger");
    }
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    wait(45);
    level flag::wait_till(#"catwalk_event_completed");
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    zm_utility::function_fef4b36a(str_next_defend);
    level zm_utility::open_door("door_michigan_ave_to_citadel", 0, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, #"citadel");
    s_defend_area = zm_utility::function_a877cd10(#"citadel");
    wait(45);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    zm_utility::function_fef4b36a(#"citadel");
    level thread function_c3ad6d4a(1);
    str_next_defend = array::random(array(#"building_64", #"docks"));
    if (str_next_defend == #"building_64") {
        var_420e4589 = array("door_citadel_to_tunnels", "sally_door");
    } else {
        var_420e4589 = array("door_citadel_to_tunnels", "door_alley_to_docks_bridge");
    }
    level zm_utility::open_door(var_420e4589, 0, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(45);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    zm_utility::function_fef4b36a(str_next_defend);
    if (str_next_defend == #"building_64") {
        str_next_defend = #"docks";
        var_420e4589 = array("door_alley_to_docks_bridge", "door_sally_to_docks");
    } else {
        str_next_defend = #"building_64";
        var_420e4589 = array("sally_door", "door_sally_to_docks");
    }
    level zm_utility::open_door(var_420e4589, 0, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    wait(10);
    level thread zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    level waittill(#"hash_7a04a7fb98fa4e4d");
    zm_utility::function_fef4b36a(str_next_defend);
    level enable_gondola_at_docks(1);
    zm_utility::open_door(array("door_cafeteria_to_times_square", "door_cell_block_floor_3", "door_cafeteria_to_infirmary", "door_shower_to_citadel", "door_model_warden_office_to_warden_house"), undefined, undefined, 1);
    wait(4);
    str_next_defend = array::random(array(#"roof", #"warden_house", #"cafeteria", #"showers"));
    while (1) {
        zm_utility::function_11101458(str_next_defend);
        wait(45);
        s_defend_area = zm_utility::function_a877cd10(str_next_defend);
        zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
        zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
        str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
        waitframe(1);
    }
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x3838b5c5, Offset: 0x1b80
// Size: 0x57c
function enable_gondola_at_docks(b_enable) {
    var_57ba058f = getentarray("gondola_call_trigger", "targetname");
    var_9ce0aba1 = getentarray("gondola_move_trigger", "targetname");
    var_b8a0c0a = arraycombine(var_57ba058f, var_9ce0aba1, 0, 0);
    if (b_enable) {
        level flag::wait_till("gondola_initialized");
        wait(0.5);
        foreach (t_trigger in var_57ba058f) {
            t_trigger setvisibletoall();
            if (t_trigger.script_string === "docks") {
                t_trigger notify(#"trigger", {#b_forced:1});
            }
        }
        n_obj_id = zm_utility::function_f5a222a8(#"hash_2650ecc82f8b279c", level.e_gondola);
        level flag::wait_till("gondola_at_docks");
        waitframe(1);
        array::run_all(var_b8a0c0a, &setinvisibletoall);
        foreach (player in level.players) {
            player zm_trial_util::stop_timer();
            if (!level.var_f995ece6 zm_trial_timer::is_open(player)) {
                level.var_f995ece6 zm_trial_timer::open(player);
            }
            level.var_f995ece6 zm_trial_timer::set_timer_text(player, #"hash_4de08152dbb1681f");
            player zm_trial_util::start_timer(45);
        }
        for (n_time = 45; n_time > 0; n_time--) {
            wait(1);
            var_a78da539 = 1;
            foreach (player in level.activeplayers) {
                if (!player istouching(level.e_gondola.t_ride)) {
                    var_a78da539 = 0;
                    break;
                }
            }
            if (var_a78da539) {
                break;
            }
        }
        foreach (player in level.players) {
            if (level.var_f995ece6 zm_trial_timer::is_open(player)) {
                level.var_f995ece6 zm_trial_timer::close(player);
            }
            player zm_trial_util::stop_timer();
        }
        zm_utility::function_bc5a54a8(n_obj_id);
        foreach (t_trigger in var_9ce0aba1) {
            t_trigger setvisibletoall();
            if (t_trigger.script_string === "docks") {
                t_trigger notify(#"trigger", {#b_forced:1});
            }
        }
        array::run_all(var_b8a0c0a, &setvisibletoall);
        level.var_42cd50b3 = 1;
    } else {
        array::run_all(var_b8a0c0a, &setinvisibletoall);
    }
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xc79b881, Offset: 0x2108
// Size: 0x924
function function_84139b27() {
    zm_utility::function_c492c4d6(#"powerhouse", #"hash_3ba02a24d6f7086b", array(#"zone_powerhouse"), undefined, #"hash_5ca408aafa5fddf8", #"hash_6a3b160b4d946718");
    zm_utility::function_c492c4d6(#"new_industries", #"hash_7e3b2316f6e262e1", array(#"zone_new_industries"), undefined, #"hash_432017d6aa7988ed", #"hash_273ce801ad0cb483");
    zm_utility::function_c492c4d6(#"infirmary", #"hash_172bbfcfa72fefdb", array(#"zone_infirmary", #"zone_infirmary_roof"), array(#"roof", #"cafeteria", #"cd_street", #"michigan_avenue"), #"hash_354f9e364d7a69fb", #"hash_365c0402f060c7d5");
    zm_utility::function_c492c4d6(#"citadel", #"hash_2857c7fc5ecb8d5c", array(#"zone_citadel_shower", #"zone_citadel", #"zone_citadel_warden"), array(#"warden_house", #"showers", #"michigan_avenue", #"times_square"), #"hash_2fe5a7985e8825e6", #"hash_7ebaa16cf92b78c2");
    zm_utility::function_c492c4d6(#"cd_street", #"hash_29336180c57eb188", array(#"zone_library", #"zone_cellblock_west", #"zone_broadway_floor_2"), array(#"citadel", #"infirmary", #"cafeteria", #"showers"), #"hash_14700e7ff43a0782", #"hash_8e08c6f6759009e");
    zm_utility::function_c492c4d6(#"michigan_avenue", #"hash_4f13d455c1b0ecc9", array(#"zone_cellblock_west_barber", #"zone_cellblock_west_warden"), array(#"warden_house", #"showers", #"infirmary", #"cafeteria"), #"hash_705c102d1924f0dd", #"hash_6837df2367ad7713");
    zm_utility::function_c492c4d6(#"times_square", #"hash_1ea6cd0ac2c8866a", array(#"zone_cellblock_east"), array(#"citadel", #"roof", #"warden_house", #"infirmary"), #"hash_3f444c87fe7834fc", #"hash_3f7e50e6a57f764c");
    zm_utility::function_c492c4d6(#"cafeteria", #"hash_7e27b77c809a76a", array(#"zone_cafeteria", #"zone_cafeteria_end"), array(#"roof", #"michigan_avenue", #"cd_street", #"warden_house"), #"hash_492da84cdf727cb8", #"hash_694e547781b620d8");
    zm_utility::function_c492c4d6(#"roof", #"hash_218cfbef3166e972", array(#"zone_roof", #"zone_roof_infirmary"), array(#"cafeteria", #"times_square", #"infirmary", #"michigan_avenue"), #"hash_5e20d087e1e88e10", #"hash_606e86c2e28d9fa0");
    zm_utility::function_c492c4d6(#"showers", #"hash_56095721b91ef81f", array(#"cellblock_shower"), array(#"citadel", #"cd_street", #"roof", #"times_square"), #"hash_c1918d583361503", #"hash_3f95fb31de34752d");
    zm_utility::function_c492c4d6(#"building_64", #"hash_15a013048749503b", array(#"zone_studio"), undefined, #"hash_1feef237a0bc79f", #"hash_69300f7b6a0380f9");
    zm_utility::function_c492c4d6(#"docks", #"hash_5a800036a297a5eb", array(#"zone_dock", #"zone_dock_gondola"), undefined, #"hash_63491ae91f2492a6", #"hash_59ffc5ba5f91082");
    zm_utility::function_c492c4d6(#"warden_house", #"hash_6a595abeab660c6e", array(#"zone_warden_house", #"zone_warden_home"), array(#"citadel", #"cd_street", #"times_square", #"showers"), #"hash_7aedc433d6fa560c", #"hash_162e6d4e0e721dfc");
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xba2ae457, Offset: 0x2a38
// Size: 0x168
function function_c3ad6d4a(b_wait_for_player = 0) {
    level endon(#"end_game");
    if (b_wait_for_player) {
        while (1) {
            var_c75ebefb = 0;
            foreach (player in level.activeplayers) {
                if (player zm_zonemgr::is_player_in_zone(#"zone_studio")) {
                    var_c75ebefb = 1;
                    break;
                }
            }
            if (var_c75ebefb) {
                break;
            }
            wait(0.5);
        }
    } else {
        zm_zonemgr::zone_wait_till_enabled(#"zone_studio");
    }
    level thread zm_utility::enable_power_switch(1, 1, "building_64_switches", "script_noteworthy");
    level notify(#"hash_6c660debf41d6362");
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x0
// Checksum 0x1e1398b8, Offset: 0x2ba8
// Size: 0x1e2
function function_b9cacd48() {
    /#
        while (1) {
            zm_utility::function_11101458("<unknown string>");
            wait(10);
            s_defend_area = zm_utility::function_a877cd10("<unknown string>");
            zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 10, 2);
            zm_utility::function_11101458("<unknown string>");
            wait(10);
            s_defend_area = zm_utility::function_a877cd10("<unknown string>");
            zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 10, 2);
            foreach (str_index, s_defend_area in level.a_s_defend_areas) {
                s_defend_area = zm_utility::function_a877cd10(str_index);
                zm_utility::function_11101458(str_index);
                wait(10);
                zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 5);
            }
            waitframe(1);
        }
    #/
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x65bbe470, Offset: 0x2d98
// Size: 0x2e0
function function_ac904e5e() {
    zm_utility::function_742f2c18(1, #"zombie", 8, 6);
    zm_utility::function_742f2c18(2, #"zombie", 10, 6);
    zm_utility::function_742f2c18(3, #"zombie", 10, 6);
    zm_utility::function_742f2c18(4, #"zombie", 10, 6);
    zm_utility::function_742f2c18(5, #"zombie", 12, 6);
    zm_utility::function_742f2c18(6, #"zombie", 12, 6);
    zm_utility::function_742f2c18(7, #"zombie", 12, 8);
    zm_utility::function_742f2c18(8, #"zombie", 14, 8);
    zm_utility::function_742f2c18(9, #"zombie", 20, 8);
    zm_utility::function_742f2c18(10, #"zombie", 20, 10);
    zm_utility::function_742f2c18(11, #"zombie", 20, 12);
    zm_utility::function_742f2c18(12, #"zombie", 20, 14);
    zm_utility::function_742f2c18(13, #"zombie", 20, 16);
    zm_utility::function_742f2c18(14, #"zombie", 30, 16);
    zm_utility::function_742f2c18(15, #"zombie", 40, 16);
    var_a535d72c = 16;
    for (n_round = 16; n_round < 255; n_round++) {
        zm_utility::function_742f2c18(n_round, #"zombie", undefined, var_a535d72c);
        var_a535d72c++;
        var_a535d72c = math::clamp(var_a535d72c, 16, 24);
    }
}

// Namespace zm_escape_zstandard/zm_escape_zstandard
// Params 0, eflags: 0x0
// Checksum 0xefb124fb, Offset: 0x3080
// Size: 0x3c0
function function_b356f6ae() {
    level endon(#"end_game");
    while (1) {
        s_waitresult = undefined;
        s_waitresult = level waittill(#"hash_4ffec9c5f552e6fc");
        if (isdefined(s_waitresult.e_door) && isdefined(s_waitresult.e_door.script_flag)) {
            switch (s_waitresult.e_door.script_flag) {
            case #"activate_west_side_exterior":
                var_ff20f7d3 = #"hash_48b098165e01518e";
                break;
            case #"activate_new_industries":
                var_ff20f7d3 = #"hash_50e05912992c7bc3";
                break;
            case #"activate_west_side_exterior_lower":
                var_ff20f7d3 = #"hash_4ddad8473f8f44cd";
                break;
            case #"activate_west_side_exterior_tunnel":
                var_ff20f7d3 = #"hash_3f684b6336ac27e7";
                break;
            case #"activate_cellblock_ca":
                var_ff20f7d3 = #"hash_4766f082bbf2cbf0";
                break;
            case #"activate_cafeteria":
                var_ff20f7d3 = #"hash_4f024ba2f12a1e8";
                break;
            case #"activate_infirmary":
                var_ff20f7d3 = #"hash_2525f49ae61a9065";
                break;
            case #"activate_cellblock_infirmary":
                var_ff20f7d3 = #"hash_18077f7c3b49f099";
                break;
            case #"activate_wa_h":
                var_ff20f7d3 = #"hash_a15209027c6a477";
                break;
            case #"activate_cellblock_library":
                var_ff20f7d3 = #"hash_2d2fbe4505249056";
                break;
            case #"activate_cellblock_gondola":
                var_ff20f7d3 = #"hash_7a8ad982bdebf31";
                break;
            case #"activate_basement_gondola":
                var_ff20f7d3 = #"hash_50679632c0929ef5";
                break;
            case #"activate_basement_building":
                var_ff20f7d3 = #"hash_7b6541d8fb121048";
                break;
            case #"activate_dock_sally":
                var_ff20f7d3 = #"hash_22b9577531ef397d";
                break;
            case #"activate_citadel_stair":
                var_ff20f7d3 = #"hash_4febfe746d3a53b1";
                break;
            case #"activate_cellblock_citadel":
                var_ff20f7d3 = #"hash_11d4351c92a0261";
                break;
            case #"activate_shower_citadel":
                var_ff20f7d3 = #"hash_41102abe52b5027";
                break;
            default:
                if (s_waitresult.e_door.targetname === "zombie_debris") {
                    var_ff20f7d3 = #"hash_782714d88bdaa1b6";
                } else {
                    var_ff20f7d3 = #"hash_7203281c0385cddd";
                }
                break;
            }
            level zm_utility::function_7a35b1d7(var_ff20f7d3);
        }
    }
}

