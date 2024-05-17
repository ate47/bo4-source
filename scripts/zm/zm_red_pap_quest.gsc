// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_red_util.gsc;
#using scripts\zm\zm_red_power_quest.gsc;
#using scripts\zm\zm_red_challenges.gsc;
#using scripts\zm\zm_red.gsc;
#using scripts\zm\ai\zm_ai_gegenees.gsc;
#using script_4d00889cf8c807d5;
#using script_3aa54d3cb36ea43f;
#using scripts\zm_common\bgbs\zm_bgb_anywhere_but_here.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_vo.gsc;
#using scripts\zm_common\zm_ui_inventory.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_pack_a_punch.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_items.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\fx_shared.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_red_pap_quest;

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2ea396cf, Offset: 0xb30
// Size: 0x46c
function init() {
    clientfield::register("scriptmover", "" + #"hash_38dbf4f346c0b609", -15000, 1, "counter");
    clientfield::register("scriptmover", "" + #"hash_9055852bfeb9f00", -15000, 1, "counter");
    clientfield::register("scriptmover", "" + #"crystal_explosion", 16000, 1, "counter");
    clientfield::register("vehicle", "" + #"spartoi_charge", 16000, 1, "counter");
    clientfield::register("toplayer", "" + #"hash_687fbbd292ea6be0", 16000, 1, "int");
    clientfield::register("toplayer", "" + #"pegasus_shellshock", 16000, 1, "int");
    clientfield::register("toplayer", "" + #"waterfall_passthrough", 16000, 1, "int");
    clientfield::register("world", "" + #"hash_28eb5e403f599ce2", 17000, 1, "int");
    level zm_audio::function_6191af93(#"location_enter", #"hash_4576fb3345db827b", "", "");
    level.var_2e32e0bb = 1;
    callback::on_spawned(&on_player_spawned);
    level thread function_5ad3e281();
    if (!zm_utility::is_standard()) {
        level thread function_5c803daa(0);
        level thread function_33267c8c(0);
        level thread function_1545931a();
        level thread function_52d5c4ed();
        hidemiscmodels("forge_assembled");
    }
    n_pap_enabled = zm_custom::function_901b751c(#"zmpapenabled");
    switch (n_pap_enabled) {
    case 2:
        level thread function_a7faeaaf();
        break;
    case 0:
        var_3c674f8c = getentarray("zm_pack_a_punch", "targetname");
        array::thread_all(var_3c674f8c, &function_e41cbf43);
        if (zm_utility::is_standard()) {
            level flag::set(#"pap_disabled");
            mdl_blocker = getent("pap_arena_blocker", "targetname");
            mdl_blocker delete();
            return;
        }
        break;
    }
    level thread pap_quest_init();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x5 linked
// Checksum 0x55b08185, Offset: 0xfa8
// Size: 0x3c
function private function_e41cbf43() {
    level flag::wait_till("all_players_spawned");
    self zm_pack_a_punch::set_state_hidden();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa0db37c1, Offset: 0xff0
// Size: 0x3c
function function_5ad3e281() {
    level flag::wait_till(#"hash_dc34ebe02d09532");
    changeadvertisedstatus(0);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x553bb0, Offset: 0x1038
// Size: 0x24
function function_a7faeaaf() {
    level flag::wait_till("all_players_spawned");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6dee2cb3, Offset: 0x1068
// Size: 0x4a4
function function_90a833e2() {
    if (!level flag::exists(#"pap_quest_completed")) {
        level flag::init(#"pap_quest_completed");
    }
    level flag::init(#"zm_red_fasttravel_open");
    level flag::init(#"hash_635cb5542c95ee5e");
    level flag::init(#"hash_dc34ebe02d09532");
    level flag::init(#"hash_70efff113b745513");
    level flag::init(#"hash_4d8091aa6a26d815");
    level flag::init(#"hash_3dba794053dea40e");
    level flag::init(#"hash_420b070435236eab");
    level flag::init(#"spartoi_dead");
    level flag::init(#"pegasus_entry");
    level flag::init(#"pegasus_ready");
    level flag::init(#"pegasus_rescue");
    level flag::init(#"perseus_exits");
    level flag::init(#"gegenees_spotted");
    level flag::init(#"hash_7943879f3be8ccc6");
    level flag::init(#"hash_61de3b8fe6f6a35");
    level flag::init(#"hash_3764b0cb106568ec");
    level flag::init(#"hash_1b6616e730b1235b");
    level flag::init(#"hash_ec641f342e0d032");
    level flag::init(#"pap_disabled");
    level flag::init(#"hash_2a7d461c7eff8179");
    level flag::init(#"hash_148f48be55e871df");
    level flag::init(#"hash_32ff7a456732ef09");
    level flag::init(#"pegasus_ride");
    level flag::init(#"hash_517afb4f86e5037b");
    level flag::init(#"hash_1981012de509765d");
    level flag::init(#"pegasus_takeoff");
    level flag::init(#"hash_67695ee69c57c0b2");
    level flag::init(#"cage_dropped");
    level flag::init(#"hash_3f6b3af99d456313");
    level flag::init(#"hash_19b70a45ebda2642");
    level flag::init(#"egg_free");
    level flag::init(#"eagle_attack");
    level flag::init(#"defend_arena");
    level flag::init(#"pap_defend");
    level flag::init(#"defend_cage");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x86ff75ed, Offset: 0x1518
// Size: 0x40c
function pap_quest_init() {
    level endon(#"end_game");
    level.var_10e70c82 = 10000;
    level.n_attacks = 16;
    level.player_out_of_playable_area_override = &function_9af8bfc8;
    level.player_out_of_playable_area_monitor_callback = &player_out_of_playable_area_monitor_callback;
    scene::init(#"p8_fxanim_zm_red_geg_bundle");
    level scene::init(#"p8_fxanim_zm_red_drakaina_bundle");
    w_component = zm_crafting::get_component(#"hash_fb7df72cfdf8492");
    zm_items::function_4d230236(w_component, &function_86531922);
    mdl_blocker = getent("pap_arena_blocker", "targetname");
    mdl_blocker setinvisibletoall();
    mdl_weapon_clip = getent("pap_arena_weapon_clip", "targetname");
    mdl_weapon_clip notsolid();
    var_740e1e0e = getent("pegasus_ride_rune", "targetname");
    var_740e1e0e hide();
    if (zm_utility::is_standard()) {
        level waittill(#"hash_36ec7e3beabe7a4");
        level flag::set("power_on");
        level flag::set(#"pap_quest_completed");
        level flag::set(#"zm_red_fasttravel_open");
        level flag::set(#"hash_4083e9da0ba41dec");
        var_6800d950 = getent("pap_chaos_clip", "targetname");
        if (isdefined(var_6800d950)) {
            var_6800d950 delete();
        }
        var_71da3f5a = getentarray("cage_defender", "targetname");
        foreach (var_3e9d57b3 in var_71da3f5a) {
            if (isdefined(var_3e9d57b3.target)) {
                mdl_clip = getent(var_3e9d57b3.target, "targetname");
                mdl_clip delete();
            }
            var_3e9d57b3 delete();
        }
        scene::init(#"p8_fxanim_zm_red_eagle_cage_bundle");
        scene::init(#"hash_a460f13d4076e71");
        return;
    }
    function_ce84849b(0);
    function_52411f5e(0);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xbbecd5b2, Offset: 0x1930
// Size: 0xfc
function function_9b917fd5(is_powered) {
    if (!level flag::exists(#"pap_quest_completed")) {
        level flag::init(#"pap_quest_completed");
    }
    a_flags = array(#"pap_quest_completed", "power_on");
    self zm_pack_a_punch::set_state_hidden();
    level flag::wait_till_all(a_flags);
    if (zm_custom::function_901b751c(#"zmpapenabled") != 0) {
        self zm_pack_a_punch::function_bb629351(1, "arriving", "arrive_anim_done");
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x46b26e08, Offset: 0x1a38
// Size: 0x15c
function function_ce84849b(var_5ea5c94d) {
    level waittill(#"start_of_round");
    if (zm_custom::function_901b751c(#"zmpapenabled") == 2) {
        level thread function_5a4d8124(0);
    } else {
        level scene::init(#"hash_6c19cacedbc244f");
        level scene::init(#"p8_fxanim_zm_red_omphalos_crystal_front_bundle");
        level scene::init(#"p8_fxanim_zm_red_omphalos_crystal_right_bundle");
        level function_5a4d8124(0);
        level function_23f28dd1(0);
    }
    var_6800d950 = getent("pap_chaos_clip", "targetname");
    if (isdefined(var_6800d950)) {
        var_6800d950 delete();
    }
    level function_6e57d6c6(0);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb02dc67f, Offset: 0x1ba0
// Size: 0xbc
function function_2e4c26ff() {
    level endon(#"end_game", #"hash_635cb5542c95ee5e");
    self endon(#"death");
    while (true) {
        if (self zm_zonemgr::is_player_in_zone(array("zone_offering"))) {
            self thread function_ff356649();
            level flag::set(#"hash_635cb5542c95ee5e");
            break;
        }
        wait(0.1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x8411690, Offset: 0x1c68
// Size: 0x314
function function_ff356649() {
    self notify("e3af97150979316");
    self endon("e3af97150979316");
    a_str_vo = [];
    if (self zm_characters::is_character(array(#"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6"))) {
        a_str_vo[a_str_vo.size] = #"hash_3f6bf8f6cd5e63ff";
        a_str_vo[a_str_vo.size] = #"hash_3f6bf7f6cd5e624c";
        var_5fe18b90 = #"hash_43376c821d8f3cef";
        str_vo = array::random(a_str_vo);
        self zm_vo::vo_say(str_vo, 0.5, 1, 9999, 1);
        if (str_vo == a_str_vo[1]) {
            self zm_vo::vo_say(var_5fe18b90, 0.5, 1, 9999, 1, 1);
        }
        return;
    }
    if (self zm_characters::is_character(array(#"hash_68255d9ce2a09382", #"hash_1a427f842f175b3c"))) {
        a_str_vo[a_str_vo.size] = #"hash_57e4fdf6dacd37be";
        a_str_vo[a_str_vo.size] = #"hash_57e4fef6dacd3971";
        a_str_vo[a_str_vo.size] = #"hash_57e4fbf6dacd3458";
    } else if (self zm_characters::is_character(array(#"hash_f531a8c2df891cc", #"hash_26072a3b34719d22"))) {
        a_str_vo[a_str_vo.size] = #"hash_45e1aff6d067b934";
        a_str_vo[a_str_vo.size] = #"hash_45e1b0f6d067bae7";
        a_str_vo[a_str_vo.size] = #"hash_45e1b1f6d067bc9a";
    } else {
        a_str_vo[a_str_vo.size] = #"hash_713782f6e8f4d5bd";
        a_str_vo[a_str_vo.size] = #"hash_713781f6e8f4d40a";
        a_str_vo[a_str_vo.size] = #"hash_713780f6e8f4d257";
    }
    str_vo = array::random(a_str_vo);
    if (isdefined(str_vo)) {
        self zm_vo::vo_say(str_vo, 1, 1, 9999, 1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe5920a2a, Offset: 0x1f88
// Size: 0x1fa
function function_5c803daa(var_5ea5c94d) {
    var_51321244 = struct::get_array("zm_red_g_b_l");
    if (zm_utility::is_trials()) {
        zm_zonemgr::function_8caa21df(array(#"zone_offering", #"zone_bathhouse_inside"));
        if (zm_zonemgr::zone_is_enabled(#"zone_bathhouse_inside")) {
            level.var_51e9c177 = struct::get("zm_red_g_b_l_treasury", "script_noteworthy");
        } else {
            level.var_51e9c177 = struct::get("zm_red_g_b_l_stoa", "script_noteworthy");
        }
    } else {
        level.var_51e9c177 = array::random(var_51321244);
    }
    level.var_c89378af = util::spawn_model(level.var_51e9c177.model, level.var_51e9c177.origin, level.var_51e9c177.angles);
    wait(0.1);
    level clientfield::set("" + #"hash_28eb5e403f599ce2", 1);
    level.var_51e9c177.var_303cab7f = level.var_51e9c177 zm_unitrigger::create(&function_64e44dd, 96, &function_dfd958e5);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5de2bf82, Offset: 0x2190
// Size: 0xb0
function function_64e44dd(e_player) {
    if (!level flag::get(#"hash_3764b0cb106568ec")) {
        str_prompt = zm_utility::function_d6046228(#"hash_6cc43e140b155820", #"hash_2a7106eb608a748c");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xcd8230d, Offset: 0x2248
// Size: 0x9c
function function_dfd958e5() {
    self endon(#"death");
    level endon(#"flag_gegenees_set_intro");
    while (true) {
        s_result = self waittill(#"trigger");
        e_player = s_result.activator;
        if (zm_utility::is_player_valid(e_player)) {
            level thread function_5a06e111(e_player);
            break;
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa39ee74c, Offset: 0x22f0
// Size: 0x20c
function function_5a06e111(player) {
    level flag::set(#"flag_gegenees_set_intro");
    level clientfield::set("" + #"hash_28eb5e403f599ce2", 0);
    if (isdefined(level.var_c89378af)) {
        level.var_c89378af delete();
    }
    level thread function_b2d4de9a(player);
    level flag::set(#"hash_3764b0cb106568ec");
    player playsound(#"hash_149efe131d76d3e");
    zm_ui_inventory::function_7df6bb60(#"hash_3b7a4acbf51a22e8", 1);
    wait(0.5);
    if (isdefined(level.var_153e9058) && level.var_153e9058) {
        level thread function_fd16ebb0();
    } else {
        level thread function_9e285681(level.round_number);
    }
    foreach (player in getplayers()) {
        player forcestreambundle(#"cin_zm_red_pegasus_ride");
    }
    zm_unitrigger::unregister_unitrigger(level.var_51e9c177.var_303cab7f);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xfb3d2a22, Offset: 0x2508
// Size: 0x198
function function_9e285681(var_bc66d64b) {
    var_6d1fdaf7 = struct::get_array("s_zm_red_g_b_s_l", "targetname");
    var_6d1fdaf7 = array::filter(var_6d1fdaf7, 0, &function_6449c41f);
    var_46bfea0 = array::random(var_6d1fdaf7);
    callback::on_ai_killed(&function_20a1e095);
    var_c068053b = 0;
    while (!var_c068053b) {
        while (true) {
            ai_gegenees = zombie_utility::spawn_zombie(level.var_b3d6ef3b[0], "gegenees", var_46bfea0, var_bc66d64b);
            if (isdefined(ai_gegenees)) {
                break;
            }
            waitframe(1);
        }
        ai_gegenees.var_126d7bef = 1;
        ai_gegenees.ignore_round_spawn_failsafe = 1;
        ai_gegenees.b_ignore_cleanup = 1;
        ai_gegenees.ignore_enemy_count = 1;
        wait(0.1);
        if (isalive(ai_gegenees)) {
            ai_gegenees thread function_62cca067(var_46bfea0);
            var_c068053b = 1;
        }
        wait(0.1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x173d91d, Offset: 0x26a8
// Size: 0x280
function function_62cca067(var_46bfea0) {
    self endon(#"death");
    level endon(#"gegenees_spotted");
    level zm_audio::function_6191af93(#"gegenees", #"react", "", "");
    if (var_46bfea0.script_int === 2) {
        s_scene = struct::get("tag_align_red_gegenees_treasury");
        str_scene = "aib_vign_cust_zm_red_gegn_treasury_intro";
        str_fxanim = "p8_fxanim_zm_red_geg_bundle";
        self thread function_ed6e29a3();
    } else {
        s_scene = struct::get("tag_align_red_stoa");
        str_scene = "aib_vign_cust_zm_red_gegn_spear_intro";
    }
    if (isdefined(str_fxanim)) {
        level thread scene::play(#"p8_fxanim_zm_red_geg_bundle");
    }
    s_scene thread scene::play(str_scene, self);
    wait(2);
    while (true) {
        a_players = util::get_active_players();
        if (isdefined(a_players)) {
            for (i = 0; i < a_players.size; i++) {
                if (isdefined(a_players[i])) {
                    if (zombie_utility::is_player_valid(a_players[i]) && a_players[i] util::is_player_looking_at(self.origin)) {
                        a_players[i] thread zm_vo::function_a2bd5a0c(#"hash_594153ac5ecbee27", 0, 1, 9999, 1);
                        level flag::set(#"gegenees_spotted");
                        break;
                    }
                }
                wait(0.1);
            }
        }
        wait(0.1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe6578b36, Offset: 0x2930
// Size: 0x44
function function_ed6e29a3() {
    self endon(#"death");
    self waittill(#"spear_impact");
    self playrumbleonentity("zm_red_gegenees_land_rumble");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa81fc8a9, Offset: 0x2980
// Size: 0x10c
function function_b2d4de9a(player) {
    level flag::wait_till(#"hash_1b6616e730b1235b");
    wait(3);
    if (isdefined(player) && zombie_utility::is_player_valid(player)) {
        player thread zm_vo::function_a2bd5a0c(#"hash_3de081aae6176905", 0.5, 1, 9999, 1);
        return;
    }
    player = array::random(util::get_active_players());
    if (isdefined(player) && zombie_utility::is_player_valid(player)) {
        player thread zm_vo::function_a2bd5a0c(#"hash_3de081aae6176905", 0.5, 1, 9999, 1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xd5071ea3, Offset: 0x2a98
// Size: 0x76
function function_6449c41f(s_spawn_loc) {
    if (level.var_51e9c177.script_noteworthy == "zm_red_g_b_l_stoa") {
        if (s_spawn_loc.script_int == 1) {
            return 1;
        } else {
            return 0;
        }
        return;
    }
    if (s_spawn_loc.script_int == 2) {
        return 1;
    }
    return 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xd7ac509e, Offset: 0x2b18
// Size: 0x180
function function_20a1e095(s_params) {
    if (!level flag::get(#"hash_3764b0cb106568ec")) {
        return;
    }
    if (self.archetype === #"gegenees" && level flag::get("round_reset")) {
        level thread function_689a0862();
        return;
    }
    if (self.archetype === #"gegenees" && !level flag::get(#"hash_1b6616e730b1235b")) {
        level thread function_fd16ebb0(self);
        foreach (player in util::get_active_players()) {
            player thread zm_vo::vo_say(#"hash_402d4a87b58810d5", 0.5, 1, 9999, 1, 1);
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x5 linked
// Checksum 0xec4007c1, Offset: 0x2ca0
// Size: 0x4c
function private function_689a0862() {
    callback::remove_on_ai_killed(&function_20a1e095);
    zm_trial::function_ae725d63();
    level thread function_9e285681();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe0a81d74, Offset: 0x2cf8
// Size: 0x174
function function_fd16ebb0(ai) {
    var_91a451a1 = 0;
    a_s_blueprints = zm_crafting::function_31d883d7();
    foreach (s_blueprint in a_s_blueprints) {
        if (s_blueprint.var_54a97edd == getweapon(#"zhield_zpear_dw")) {
            var_91a451a1 = 1;
            break;
        }
    }
    if (isdefined(level.crafting_components[#"hash_fb7df72cfdf8492"]) && !(isdefined(var_91a451a1) && var_91a451a1)) {
        w_component = zm_crafting::get_component(#"hash_fb7df72cfdf8492");
        if (!zm_items::player_has(level.players[0], w_component)) {
            level thread function_38a41b56(w_component, ai);
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x5fffa15b, Offset: 0x2e78
// Size: 0x294
function function_38a41b56(w_component, ai) {
    var_19383ecc = undefined;
    if (isdefined(ai)) {
        var_5a0fa917 = ai.angles;
        var_4821fd63 = ai.origin + (randomintrange(32, 64), randomintrange(32, 64), 0);
    } else {
        var_5a0fa917 = (0, 0, 0);
        var_4821fd63 = struct::get("default_shield_pos").origin;
    }
    while (!isdefined(var_19383ecc)) {
        v_offset = (randomintrange(-64, 64), randomintrange(-64, 64), 0);
        v_org = var_4821fd63 + v_offset;
        if (isdefined(v_org) && zm_utility::check_point_in_enabled_zone(v_org) && zm_utility::check_point_in_playable_area(v_org)) {
            var_19383ecc = v_org;
        }
        waitframe(1);
    }
    w_item = undefined;
    while (!isdefined(w_item)) {
        w_item = zm_items::spawn_item(w_component, var_19383ecc + (0, 0, 32), var_5a0fa917, 1);
        waitframe(1);
    }
    w_item.e_linkto = util::spawn_model("tag_origin", w_item.origin);
    if (isdefined(w_item.e_linkto)) {
        w_item linkto(w_item.e_linkto);
    }
    w_item.e_linkto thread function_e56c27aa();
    level flag::set(#"hash_1b6616e730b1235b");
    if (!(isdefined(level.var_153e9058) && level.var_153e9058)) {
        callback::remove_on_ai_killed(&function_20a1e095);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xb003487b, Offset: 0x3118
// Size: 0xb4
function function_e56c27aa() {
    self endon(#"death");
    self thread function_d02f7723();
    while (true) {
        self movez(8, 2);
        self waittill(#"movedone");
        waitframe(1);
        self movez(-8, 2);
        self waittill(#"movedone");
        waitframe(1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x715aaf3c, Offset: 0x31d8
// Size: 0x84
function function_d02f7723() {
    self endon(#"death");
    self clientfield::set("" + #"pegasus_ambient", 1);
    level flag::wait_till(#"hash_ec641f342e0d032");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x0
// Checksum 0x5fb6c54b, Offset: 0x3268
// Size: 0x168
function function_8a6324d(w_item) {
    self endon(#"death");
    self clientfield::set("powerup_fx", 2);
    while (isdefined(w_item)) {
        waittime = randomfloatrange(2.5, 5);
        yaw = math::clamp(randomint(360), 60, 300);
        yaw = self.angles[1] + yaw;
        new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
        self rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        wait(randomfloat(waittime - 0.1));
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x8efe887c, Offset: 0x33d8
// Size: 0x34
function function_86531922(e_holder, w_item) {
    level flag::set(#"hash_ec641f342e0d032");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0xb68dcfe1, Offset: 0x3418
// Size: 0x64
function function_caee6d89() {
    self notify("2a707fa56e5574d");
    self endon("2a707fa56e5574d");
    level flag::wait_till(#"hash_1b6616e730b1235b");
    zm_spawner::deregister_zombie_death_event_callback(&function_20a1e095);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb7af583, Offset: 0x3488
// Size: 0x18c
function function_33267c8c(var_5ea5c94d) {
    if (zm_custom::function_901b751c(#"zmpowerstate") == 2) {
        level flag::wait_till(#"hash_3764b0cb106568ec");
    } else if (zm_custom::function_901b751c(#"zmpowerstate") != 0) {
        level flag::wait_till(#"pegasus_exited");
    }
    if (isdefined(level.b_skip) || zm_utility::is_standard()) {
        return;
    }
    level.var_7dab4a52 = level function_47c8324c();
    var_10d4f67d = spawn_pegasus();
    level.var_7dab4a52.var_10d4f67d = var_10d4f67d;
    level.var_7dab4a52.var_10d4f67d setteam(#"allies");
    level flag::wait_till(#"hash_1b6616e730b1235b");
    level thread function_9878a5b8();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe359a61a, Offset: 0x3620
// Size: 0x4a
function function_47c8324c() {
    var_76d78c94 = struct::get_array("zm_red_p_l_l");
    var_7dab4a52 = array::random(var_76d78c94);
    return var_7dab4a52;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0x95f5c0c1, Offset: 0x3678
// Size: 0x90
function function_5c833a16() {
    level endon(#"hash_3a69eb760c3b12e7", #"hash_32ff7a456732ef09");
    self val::set("pegasus", "takedamage", 1);
    self.health = 99999;
    self waittill(#"damage");
    level notify(#"hash_3a69eb760c3b12e7");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0xe695491a, Offset: 0x3710
// Size: 0x118
function function_4710f794() {
    level endon(#"hash_3a69eb760c3b12e7", #"hash_32ff7a456732ef09");
    while (true) {
        foreach (player in getplayers()) {
            if (distance2dsquared(self.origin, player.origin) <= 200 * 200 && !level flag::get(#"hash_3764b0cb106568ec")) {
                level notify(#"hash_3a69eb760c3b12e7");
            }
        }
        wait(0.5);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x4c2c9c5d, Offset: 0x3830
// Size: 0x2e0
function spawn_pegasus() {
    nd_entry = getvehiclenode("entry_start", "targetname");
    level.var_cb0e9f8e = undefined;
    var_10d4f67d = undefined;
    while (!isdefined(level.var_cb0e9f8e)) {
        level.var_cb0e9f8e = spawner::simple_spawn_single("cam_vehicle");
        waitframe(1);
    }
    level.var_cb0e9f8e setteam(#"allies");
    level.var_cb0e9f8e.origin = nd_entry.origin;
    level.var_cb0e9f8e.angles = nd_entry.angles;
    while (!isdefined(var_10d4f67d)) {
        var_10d4f67d = util::spawn_model(level.var_7dab4a52.model, level.var_cb0e9f8e.origin, level.var_cb0e9f8e.angles);
        waitframe(1);
    }
    var_10d4f67d linkto(level.var_cb0e9f8e);
    var_10d4f67d thread function_79c0fdf3();
    var_10d4f67d thread function_551b832a();
    var_10d4f67d clientfield::set("" + #"pegasus_teleport", 1);
    level.var_cb0e9f8e thread scene::play("aib_zm_red_vign_peg_inair_flight_cycle_01", "loop", var_10d4f67d);
    while (!level flag::get(#"hash_1b6616e730b1235b")) {
        level.var_cb0e9f8e vehicle::get_on_and_go_path(nd_entry);
    }
    nd_start = getvehiclenode("spartan_monument_start", "targetname");
    level.var_cb0e9f8e vehicle::get_on_and_go_path(nd_start);
    level.var_cb0e9f8e scene::stop("aib_zm_red_vign_peg_inair_flight_cycle_01");
    var_10d4f67d unlink();
    waitframe(1);
    level flag::set(#"hash_148f48be55e871df");
    return var_10d4f67d;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa0dfcee0, Offset: 0x3b18
// Size: 0x14c
function function_79c0fdf3() {
    self endon(#"death");
    level endon(#"end_game", #"pegasus_spotted", #"pegasus_ride");
    wait(20);
    while (true) {
        a_players = getplayers();
        if (isdefined(a_players)) {
            for (i = 0; i < a_players.size; i++) {
                if (zm_utility::is_player_valid(a_players[i]) && a_players[i] util::is_looking_at(self, 0.9, 1)) {
                    a_players[i] zm_vo::function_a2bd5a0c(#"hash_2c93f0b3c3d6f320", 0, 1, 9999, 1);
                    level notify(#"pegasus_spotted");
                    break;
                }
                wait(0.1);
            }
        }
        wait(0.5);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x49714fc4, Offset: 0x3c70
// Size: 0x80
function function_551b832a() {
    self endon(#"death");
    level endon(#"end_game", #"pegasus_ride");
    while (true) {
        self playsound(#"hash_737ff3246a85fd0e");
        wait(randomintrange(2, 10));
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x0
// Checksum 0x60019f07, Offset: 0x3cf8
// Size: 0x17c
function function_22d235ee(var_10d4f67d) {
    level endon(#"hash_3a69eb760c3b12e7", #"hash_32ff7a456732ef09");
    while (true) {
        var_21ed631 = 0;
        foreach (player in level.activeplayers) {
            if (distance(var_10d4f67d.origin, player.origin) < level.var_940a2111) {
                if (player isfiring() || player getstance() != "crouch") {
                    var_21ed631 = 1;
                }
            }
        }
        if (var_21ed631) {
            level thread function_9cb4723(var_10d4f67d, player);
            iprintlnbold("Pegasus was spooked...");
            level notify(#"hash_3a69eb760c3b12e7");
        }
        wait(0.1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x15f6f9f2, Offset: 0x3e80
// Size: 0x1dc
function function_9cb4723(var_10d4f67d, e_player) {
    if (isdefined(level.var_7dab4a52.var_4ee9f69c)) {
        zm_unitrigger::unregister_unitrigger(level.var_7dab4a52.var_4ee9f69c);
    }
    if (isdefined(var_10d4f67d.e_linkto)) {
        var_10d4f67d.e_linkto scene::stop("aib_zm_red_vign_pgs_wng_fld_idle");
        var_10d4f67d.e_linkto delete();
        waitframe(1);
    }
    if (isdefined(e_player)) {
        v_to_player = e_player.origin - var_10d4f67d.origin;
        v_angles = vectortoangles(v_to_player);
        var_10d4f67d rotateto(v_angles, 0.5);
        var_10d4f67d waittill(#"rotatedone");
    }
    wait(0.5);
    var_10d4f67d rotateyaw(-180, 0.75);
    var_10d4f67d waittill(#"rotatedone");
    var_10d4f67d movez(600, 3);
    var_10d4f67d waittill(#"movedone");
    if (isdefined(var_10d4f67d)) {
        var_10d4f67d delete();
    }
    level flag::clear(#"hash_148f48be55e871df");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0x1b76d109, Offset: 0x4068
// Size: 0x9a
function function_fc4357b9() {
    level endon(#"hash_3a69eb760c3b12e7", #"hash_32ff7a456732ef09");
    level flag::wait_till(#"hash_148f48be55e871df");
    level.var_7dab4a52.var_10d4f67d = self;
    level.var_7dab4a52.var_4ee9f69c = self thread zm_unitrigger::create(&function_99fbe723, 96, &function_2bcbbab7);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x22b16769, Offset: 0x4110
// Size: 0xe2
function function_99fbe723(e_player) {
    if (level flag::get(#"hash_148f48be55e871df") && !level flag::get(#"hash_32ff7a456732ef09") && level flag::get(#"hash_3764b0cb106568ec")) {
        str_prompt = zm_utility::function_d6046228(#"hash_643d8edfae23fd77", #"hash_248c775f6ad7c8e5");
        self sethintstringforplayer(e_player, str_prompt);
        return 1;
    }
    return 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x6c6a2f8, Offset: 0x4200
// Size: 0xe0
function function_2bcbbab7() {
    level endon(#"hash_3a69eb760c3b12e7");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (level flag::get(#"hash_148f48be55e871df") && !level flag::get(#"hash_32ff7a456732ef09") && level flag::get(#"hash_3764b0cb106568ec")) {
            level thread function_9878a5b8();
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x3b78d356, Offset: 0x42e8
// Size: 0xe4
function function_9878a5b8() {
    level flag::clear(#"hash_148f48be55e871df");
    level flag::set(#"hash_32ff7a456732ef09");
    level.var_7dab4a52.var_10d4f67d unlink();
    s_ride = struct::get("zm_red_p_t_l_l_s_m");
    level.var_7dab4a52.var_10d4f67d thread function_3ca8556b(s_ride);
    if (isdefined(level.var_7dab4a52.var_4ee9f69c)) {
        zm_unitrigger::unregister_unitrigger(level.var_7dab4a52.var_4ee9f69c);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb1f71572, Offset: 0x43d8
// Size: 0x17c
function function_3ca8556b(s_ride) {
    self thread scene::play("aib_zm_red_vign_peg_inair_flapattack_01", "loop", self);
    self thread function_810c4f44(s_ride);
    var_740e1e0e = getent("pegasus_ride_rune", "targetname");
    var_740e1e0e show();
    level thread function_fd484520();
    level.var_7dab4a52.var_1d920c6c = s_ride thread zm_unitrigger::create(&function_852915f8, 200, &function_e11818f4);
    level flag::wait_till(#"pegasus_takeoff");
    level flag::wait_till(#"pegasus_ride");
    zm_bgb_anywhere_but_here::function_886fce8f(0);
    var_740e1e0e delete();
    level.var_90b150cb = self;
    level thread function_fe0a763c();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x48d99726, Offset: 0x4560
// Size: 0xb8
function function_810c4f44(s_ride) {
    self endon(#"death");
    level endon(#"pegasus_takeoff");
    self.var_f58528f4 = util::spawn_model("tag_origin", s_ride.origin, s_ride.angles);
    waitframe(1);
    while (true) {
        self.var_f58528f4 clientfield::increment("" + #"hash_43cf6c236d2e9ba");
        wait(1.5);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0xe8788aee, Offset: 0x4620
// Size: 0x17c
function function_d851273d() {
    level endon(#"pegasus_takeoff");
    while (true) {
        a_players = getplayers();
        if (isdefined(a_players) && a_players.size === 1) {
            return;
        }
        wait(1);
        foreach (player in a_players) {
            player thread zm_equipment::show_hint_text(#"hash_2635b6ade6ebd4", 10);
            wait(0.1);
            if (!player clientfield::get_to_player("" + #"hash_687fbbd292ea6be0") && zm_utility::is_player_valid(player)) {
                player clientfield::set_to_player("" + #"hash_687fbbd292ea6be0", 1);
            }
        }
        wait(1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0x7c92bf08, Offset: 0x47a8
// Size: 0x88
function function_41fbdcd5() {
    level endon(#"pegasus_takeoff");
    while (true) {
        a_players = getplayers();
        if (zm_zonemgr::get_players_in_zone("zone_spartan_monument_east") == a_players.size) {
            level flag::set(#"pegasus_takeoff");
        }
        wait(0.5);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0x79af37c0, Offset: 0x4838
// Size: 0x44
function function_362b8118() {
    level endon(#"pegasus_takeoff");
    wait(10);
    level flag::set(#"pegasus_takeoff");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x0
// Checksum 0xef726544, Offset: 0x4888
// Size: 0x120
function function_8130f776() {
    self endon(#"death");
    level endon(#"pegasus_takeoff");
    while (true) {
        foreach (ai_zombie in util::get_array_of_closest(self.origin, getaiteamarray(level.zombie_team), undefined, 8, 600)) {
            if (isalive(ai_zombie)) {
                self thread pegasus_strike(ai_zombie);
            }
        }
        wait(randomfloatrange(1, 1.5));
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc41928b6, Offset: 0x49b0
// Size: 0xd4
function pegasus_strike(ai_target) {
    level endon(#"pegasus_takeoff");
    ai_target endon(#"death");
    if (zm_utility::is_magic_bullet_shield_enabled(ai_target)) {
        return;
    }
    ai_target clientfield::set("" + #"hash_51b05e5d116438a9", 5);
    wait(2);
    waitframe(1);
    if (zm_utility::is_magic_bullet_shield_enabled(ai_target)) {
        return;
    }
    gibserverutils::annihilate(ai_target);
    ai_target kill();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc737466b, Offset: 0x4a90
// Size: 0x124
function function_fd484520() {
    level endon(#"pegasus_ride");
    var_cfb8558b = getent("trigger_pegasus_takeoff", "targetname");
    while (true) {
        foreach (player in util::get_human_players(#"allies")) {
            if (zombie_utility::is_player_valid(player) && player istouching(var_cfb8558b)) {
                level.var_9ab86086 = 1;
                continue;
            }
            level.var_9ab86086 = 0;
            break;
        }
        wait(0.1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xd78c9167, Offset: 0x4bc0
// Size: 0x16a
function function_852915f8(e_player) {
    var_cfb8558b = getent("trigger_pegasus_takeoff", "targetname");
    if (level flag::get(#"hash_32ff7a456732ef09")) {
        if (level.var_9ab86086 && isdefined(self) && isdefined(e_player)) {
            str_prompt = zm_utility::function_d6046228(#"hash_1bda4036c638cd3e", #"hash_3255047731d03c2a");
            self sethintstringforplayer(e_player, str_prompt);
        } else if (getplayers().size > 1 && e_player istouching(var_cfb8558b)) {
            self sethintstringforplayer(e_player, #"hash_60a3e7841c86cad1");
        } else {
            self sethintstringforplayer(e_player, "");
        }
        return 1;
    }
    return 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x62e3c6c1, Offset: 0x4d38
// Size: 0x1dc
function function_e11818f4() {
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (level flag::get(#"hash_32ff7a456732ef09") && level.var_9ab86086) {
            level thread function_3a3018b6(e_player);
            level flag::set(#"pegasus_ride");
            break;
        }
    }
    zm_vo::function_3c173d37();
    if (!level flag::get(#"hash_1981012de509765d")) {
        foreach (player in util::get_active_players()) {
            player thread zm_vo::vo_say(#"hash_6fbde56e825c38e3", 1, 1, 9999, 1, 1);
        }
    }
    level flag::set(#"pegasus_takeoff");
    zm_unitrigger::unregister_unitrigger(level.var_7dab4a52.var_1d920c6c);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x8144b70f, Offset: 0x4f20
// Size: 0x4c
function function_3a3018b6(player) {
    if (isdefined(player)) {
        player thread zm_vo::function_a2bd5a0c(#"hash_40a95c5ebcd5dc1b", 6, 1, 9999, 1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x953f7f63, Offset: 0x4f78
// Size: 0xb0a
function function_fe0a763c() {
    zm_red_challenges::pause_challenges(1);
    level.disable_nuke_delay_spawning = 1;
    level flag::clear("spawn_zombies");
    level flag::set("pause_round_timeout");
    level flag::set("hold_round_end");
    a_players = util::get_active_players();
    foreach (player in a_players) {
        player val::set(#"pegasus_ride", "takedamage", 0);
    }
    level thread lui::screen_fade_out(0.5, "black");
    wait(1);
    foreach (ai_zombie in getaiteamarray(level.zombie_team)) {
        if (isdefined(ai_zombie)) {
            ai_zombie thread zm_red_power_quest::despawn_zombie();
        }
    }
    level flag::set(#"hash_4083e9da0ba41dec");
    var_cb5f57f5 = [];
    a_players = getplayers();
    foreach (player in a_players) {
        if (zm_utility::is_player_valid(player)) {
            player.var_f4e33249 = 1;
            player thread zm_equipment::function_57fbff5c();
            if (player clientfield::get_to_player("" + #"hash_687fbbd292ea6be0")) {
                player clientfield::set_to_player("" + #"hash_687fbbd292ea6be0", 0);
            }
            if (player laststand::player_is_in_laststand() && !(isdefined(player.var_c6a6f334) && player.var_c6a6f334)) {
                player zm_laststand::auto_revive(player);
            }
            if (isdefined(player.var_fd05e363)) {
                player.n_slot = player gadgetgetslot(player.var_fd05e363);
                if (player gadgetisactive(player.n_slot) || player function_36dfc05f(player.n_slot)) {
                    player.n_charge = player gadgetpowerget(player.n_slot);
                    player zm_hero_weapon::hero_weapon_off(player.n_slot, player.var_fd05e363);
                }
            }
            player val::set("pegasus_ride", "takedamage", 0);
            player disableweapons();
            player allowedstances("stand");
            player setstance("stand");
            player.var_f43d8eba = 1;
            player.var_f22c83f5 = 1;
            player forcestreambundle(#"p8_fxanim_zm_red_drakaina_bundle");
            player forcestreambundle(#"hash_6c19cacedbc244f");
            player forcestreambundle(#"p8_fxanim_zm_red_omphalos_crystal_front_bundle");
            player forcestreambundle(#"p8_fxanim_zm_red_omphalos_crystal_right_bundle");
        }
    }
    mdl_perseus = getent("perseus_scene", "targetname");
    mdl_sword = getent("perseus_sword", "targetname");
    if (!isdefined(var_cb5f57f5)) {
        var_cb5f57f5 = [];
    } else if (!isarray(var_cb5f57f5)) {
        var_cb5f57f5 = array(var_cb5f57f5);
    }
    var_cb5f57f5[var_cb5f57f5.size] = mdl_perseus;
    if (!isdefined(var_cb5f57f5)) {
        var_cb5f57f5 = [];
    } else if (!isarray(var_cb5f57f5)) {
        var_cb5f57f5 = array(var_cb5f57f5);
    }
    var_cb5f57f5[var_cb5f57f5.size] = mdl_sword;
    if (!isdefined(var_cb5f57f5)) {
        var_cb5f57f5 = [];
    } else if (!isarray(var_cb5f57f5)) {
        var_cb5f57f5 = array(var_cb5f57f5);
    }
    var_cb5f57f5[var_cb5f57f5.size] = level.var_90b150cb;
    level.var_90b150cb thread function_ac395ad7();
    level thread function_8c5f16dd();
    scene::add_scene_func(#"cin_zm_red_pegasus_ride", &function_a965580a, "play");
    scene::add_scene_func(#"cin_zm_red_pegasus_ride", &function_e45ae8f4, "skip_started");
    scene::add_scene_func(#"cin_zm_red_pegasus_ride", &function_366b0011, "done");
    level thread zm_audio::sndmusicsystem_playstate("the_ride");
    level thread lui::screen_fade_in(0.5);
    var_ff91be3a = struct::get_array("s_zm_red_p_t_d_s", "targetname");
    var_a10268d3 = getplayers();
    for (i = 0; i < var_a10268d3.size; i++) {
        if (zm_utility::is_player_valid(var_a10268d3[i])) {
            var_a10268d3[i] thread function_db68db95(var_ff91be3a[i]);
        }
    }
    s_scene = struct::get("tag_align_red_spartan");
    s_scene scene::play(#"cin_zm_red_pegasus_ride", var_cb5f57f5);
    wait(0.1);
    zm_bgb_anywhere_but_here::function_886fce8f(1);
    level.var_e120ae98 = &function_5cfbc408;
    level notify(#"dark_side");
    level flag::set(#"hash_7943879f3be8ccc6");
    zm_red_challenges::pause_challenges(0);
    level thread function_6a7cfd6();
    wait(3);
    level flag::clear(#"pegasus_takeoff");
    if (!level flag::get(#"hash_1981012de509765d")) {
        player = array::random(util::get_active_players());
        player zm_vo::function_a2bd5a0c(#"hash_122bed9c58a18e5e", 0, 1, 9999, 1);
    }
    level notify(#"crash_landed");
    if (!level flag::get(#"hash_1981012de509765d")) {
        player = array::random(util::get_active_players());
        player zm_vo::function_a2bd5a0c(#"hash_22c5c877fe18a2a8", 1, 1, 9999, 1);
    }
    level flag::set("spawn_zombies");
    level flag::clear("pause_round_timeout");
    level flag::clear("hold_round_end");
    level.disable_nuke_delay_spawning = 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xba27d8d4, Offset: 0x5a90
// Size: 0xbc
function function_ac395ad7() {
    self endon(#"death");
    while (true) {
        self waittill(#"wing_flap");
        foreach (player in getplayers()) {
            player playrumbleonentity("damage_heavy");
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1835af53, Offset: 0x5b58
// Size: 0x328
function function_6a7cfd6() {
    level endon(#"end_game");
    if (zm_custom::function_901b751c(#"zmmysteryboxstate") != 2) {
        return;
    }
    if (isdefined(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) && zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) {
        level waittill(#"fire_sale_off");
    }
    foreach (chest in level.chests) {
        chest zm_magicbox::hide_chest();
    }
    level.chests = struct::get_array("treasure_chest_use");
    level.chests = array::filter(level.chests, 0, &zm_red::registermp_vehicles_agr_prespawn);
    level.chests = array::randomize(level.chests);
    if (isdefined(level.chests[0])) {
        level.chest_index = 0;
        level.chests[level.chest_index] zm_magicbox::function_2db086bf();
        level.chests[level.chest_index] thread zm_magicbox::show_chest();
    }
    level flag::wait_till(#"zm_red_fasttravel_open");
    if (isdefined(zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) && zombie_utility::get_zombie_var(#"zombie_powerup_fire_sale_on")) {
        level waittill(#"fire_sale_off");
    }
    var_4c502980 = level.chests[level.chest_index];
    level.chests = struct::get_array("treasure_chest_use");
    for (i = 0; i < level.chests.size; i++) {
        if (level.chests[i] === var_4c502980) {
            level.chest_index = i;
            break;
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x329af141, Offset: 0x5e88
// Size: 0xbc
function function_e45ae8f4(a_ents) {
    level lui::screen_fade_out(0, "black");
    playsoundatposition("bik_zm_red_pegride_kill_audio", (0, 0, 0));
    level flag::set(#"hash_1981012de509765d");
    s_result = level waittilltimeout(2.5, #"crash_land");
    level lui::screen_fade_in(0.5);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf9dca68e, Offset: 0x5f50
// Size: 0x2c
function function_366b0011(a_ents) {
    level flag::set(#"hash_517afb4f86e5037b");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xe8b690ab, Offset: 0x5f88
// Size: 0x1a4
function function_a965580a(a_ents) {
    level endoncallback(&function_9a6c8f2b, #"hash_1981012de509765d");
    wait(13.5);
    a_players = util::get_active_players();
    a_players = array::randomize(a_players);
    for (i = 0; i < 2; i++) {
        if (isdefined(a_players[i])) {
            if (!level flag::get(#"hash_1981012de509765d")) {
                a_players[i] zm_vo::function_a2bd5a0c(#"hash_7c7b6f1e2af646b3", 0, 1, 9999, 1);
            }
        }
        wait(0.5);
    }
    level waittill(#"approach");
    a_players = util::get_active_players();
    player = array::random(a_players);
    if (isdefined(player)) {
        if (!level flag::get(#"hash_1981012de509765d")) {
            player zm_vo::function_a2bd5a0c(#"hash_cee28f993ae4965", 0, 1, 9999, 1);
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x5 linked
// Checksum 0xd7b57986, Offset: 0x6138
// Size: 0x1c
function private function_9a6c8f2b(var_c34665fc) {
    zm_vo::function_3c173d37();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xc8543900, Offset: 0x6160
// Size: 0x240
function function_8c5f16dd() {
    level waittill(#"waterfall");
    a_players = getplayers();
    foreach (player in a_players) {
        player clientfield::set_to_player("" + #"waterfall_passthrough", 1);
    }
    wait(2.5);
    a_players = getplayers();
    a_players = array::randomize(a_players);
    for (i = 0; i < 2; i++) {
        if (isdefined(a_players[i])) {
            if (!level flag::get(#"hash_1981012de509765d")) {
                a_players[i] zm_vo::function_a2bd5a0c(#"hash_2e113992e6d1dc21", 0, 1, 9999, 1);
            }
        }
        wait(0.5);
    }
    wait(2);
    a_players = getplayers();
    foreach (player in a_players) {
        player clientfield::set_to_player("" + #"waterfall_passthrough", 0);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x91b2d066, Offset: 0x63a8
// Size: 0xb6
function function_52d5c4ed() {
    level flag::wait_till(#"hash_7943879f3be8ccc6");
    var_55592d5a = struct::get_array("dark_side_intermission");
    foreach (var_a5c966d0 in var_55592d5a) {
        var_a5c966d0.targetname = "intermission";
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x37b6ea0, Offset: 0x6468
// Size: 0x2fc
function function_db68db95(s_pos) {
    self endon(#"death");
    self val::set(#"pegasus_prep", "freezecontrols", 1);
    level waittill(#"crash_land");
    if (!level flag::get(#"hash_1981012de509765d")) {
        level lui::screen_fade_out(0.5, "black");
        wait(1);
        level lui::screen_fade_in(0.5);
    }
    self clientfield::set_to_player("" + #"pegasus_shellshock", 1);
    self val::reset(#"pegasus_ride", "takedamage");
    self val::reset(#"pegasus_prep", "freezecontrols");
    self unlink();
    waitframe(1);
    self setorigin(s_pos.origin);
    self setplayerangles(s_pos.angles);
    self enableweapons();
    self.var_f4e33249 = 1;
    self setvisibletoall();
    self allowedstances("stand", "crouch", "prone");
    self val::reset("pegasus_ride", "takedamage");
    self.var_f43d8eba = 0;
    self.var_f22c83f5 = undefined;
    wait(1.5);
    self clientfield::set_to_player("" + #"pegasus_shellshock", 0);
    wait(5);
    self.ignoreme = 0;
    wait(6);
    self zm_vo::vo_say(#"hash_31995b2656971de0", 0, 1, 9999, 1, 1);
    self function_66b6e720(#"p8_fxanim_zm_red_drakaina_bundle");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x3d005947, Offset: 0x6770
// Size: 0x22
function function_9af8bfc8() {
    if (isdefined(self.var_f43d8eba) && self.var_f43d8eba) {
        return 0;
    }
    return undefined;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xcf21abb1, Offset: 0x67a0
// Size: 0x24
function player_out_of_playable_area_monitor_callback() {
    if (isdefined(self.var_f22c83f5) && self.var_f22c83f5) {
        return false;
    }
    return true;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x0
// Checksum 0xe91806d9, Offset: 0x67d0
// Size: 0x84
function function_29573f1e(e_player) {
    var_a10268d3 = level.activeplayers;
    str_zone = zm_zonemgr::function_49d8d29f(level.var_7dab4a52.origin, 1);
    if (zm_zonemgr::get_players_in_zone(str_zone) == var_a10268d3.size) {
        return 1;
    }
    return 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x41553806, Offset: 0x6860
// Size: 0x21e
function function_5a4d8124(var_5ea5c94d) {
    level flag::wait_till(#"hash_1b6616e730b1235b");
    level thread function_41d05cb0();
    level thread function_d1f0f2db();
    level thread rock_fall();
    level thread function_d8db57f6();
    level.var_8aa0830e = 1;
    var_af2013df = array(#"hash_67695ee69c57c0b2", #"hash_61de3b8fe6f6a35");
    scene::add_scene_func(#"p8_fxanim_zm_red_eagle_cage_bundle", &function_bc27738a, "init");
    scene::add_scene_func(#"hash_a460f13d4076e71", &function_5a557985, "init");
    scene::init(#"p8_fxanim_zm_red_eagle_cage_bundle");
    scene::init(#"hash_a460f13d4076e71");
    s_scene = struct::get("tag_align_red_eagles");
    scene::add_scene_func("aib_vign_cust_zm_red_eagle_2", &function_c3bbdc48, "init");
    s_scene thread scene::play("aib_vign_cust_zm_red_eagle_2", "init");
    level flag::wait_till_all(var_af2013df);
    level.var_8aa0830e = undefined;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x60e920f9, Offset: 0x6a88
// Size: 0x2a
function function_c3bbdc48(a_ents) {
    level.var_ba012aad = a_ents[#"eagle_2"];
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x67acd617, Offset: 0x6ac0
// Size: 0x4c
function function_bc27738a(a_ents) {
    mdl_door = a_ents[#"prop 2"];
    if (isdefined(mdl_door)) {
        mdl_door thread function_f41b632f();
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x9768e1a5, Offset: 0x6b18
// Size: 0xcc
function function_5a557985(a_ents) {
    mdl_door = a_ents[#"prop 2"];
    mdl_cage = a_ents[#"prop 1"];
    if (isdefined(mdl_cage)) {
        mdl_cage thread function_bb898a46();
    }
    if (isdefined(mdl_door)) {
        mdl_door thread function_697a602a(mdl_cage);
    }
    mdl_chain = getent("clip_cage_chain", "targetname");
    mdl_chain thread function_bb898a46();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xa51b647, Offset: 0x6bf0
// Size: 0x238
function function_c20c157a(str_loc) {
    if (str_loc == "serpent_pass") {
        str_flag = #"hash_67695ee69c57c0b2";
    } else {
        str_flag = #"hash_61de3b8fe6f6a35";
    }
    level endon(str_flag);
    self endon(#"death");
    self val::set("cage_lock", "takedamage", 1);
    self.health = 99999;
    self thread function_8be22ba8(str_flag);
    self thread function_ffabd9dd(str_flag);
    while (true) {
        s_notify = self waittill(#"damage");
        if (isdefined(s_notify.weapon) && s_notify.weapon.isheroweapon === 1) {
            level notify(#"hash_4fb1eb2c137a7955", {#e_player:s_notify.attacker});
            if (str_flag == #"hash_61de3b8fe6f6a35") {
                level flag::set(#"defend_cage");
                s_notify.attacker thread zm_vo::function_a2bd5a0c(#"hash_172d8c7cc7123557", 0, 1, 9999, 1);
            } else {
                s_notify.attacker thread zm_vo::function_a2bd5a0c(#"hash_7d5dcd4efa48be79", 0, 1, 9999, 1);
            }
            level flag::set(str_flag);
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xff97ee75, Offset: 0x6e30
// Size: 0x64
function function_ffabd9dd(str_flag) {
    self endon(#"death");
    level flag::wait_till(str_flag);
    wait(0.1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x5eac49c2, Offset: 0x6ea0
// Size: 0x170
function function_8be22ba8(str_flag) {
    self endon(#"death");
    level endon(str_flag);
    while (true) {
        s_result = level waittill(#"hero_weapon_hit");
        if (s_result.e_entity === self) {
            if (str_flag == #"hash_61de3b8fe6f6a35") {
                level flag::set(#"defend_cage");
                s_result.player thread zm_vo::function_a2bd5a0c(#"hash_172d8c7cc7123557", 0, 1, 9999, 1);
            } else {
                s_result.player thread zm_vo::function_a2bd5a0c(#"hash_7d5dcd4efa48be79", 0, 1, 9999, 1);
            }
            level notify(#"hash_4fb1eb2c137a7955", {#e_player:s_result.player});
            level flag::set(str_flag);
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xd06ca45e, Offset: 0x7018
// Size: 0x128
function function_bb898a46() {
    level endon(#"cage_dropped");
    self thread function_7d85e8ea();
    self val::set("cage", "takedamage", 1);
    self.health = 99999;
    while (true) {
        s_notify = self waittill(#"damage");
        if (isplayer(s_notify.attacker)) {
            level.var_10e70c82 -= s_notify.amount;
            if (level.var_10e70c82 < 9500 || s_notify.weapon === getweapon("shotgun_trenchgun_t8_upgraded")) {
                level flag::set(#"cage_dropped");
            }
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x7a53e085, Offset: 0x7148
// Size: 0x80
function function_7d85e8ea() {
    level endon(#"cage_dropped");
    while (true) {
        s_result = level waittill(#"hero_weapon_hit");
        if (s_result.e_entity === self) {
            level flag::set(#"cage_dropped");
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf535ae26, Offset: 0x71d0
// Size: 0x12c
function function_f41b632f() {
    self thread function_c20c157a("cliff_tombs");
    self clientfield::set("" + #"special_target", 1);
    level flag::wait_till(#"hash_61de3b8fe6f6a35");
    level thread scene::play(#"p8_fxanim_zm_red_eagle_cage_bundle", "open");
    s_scene = struct::get("tag_align_red_eagles");
    s_scene scene::play(#"aib_vign_cust_zm_red_eagle_2", "fly_to_hover");
    level thread function_e39d6ea2(#"eagle_2");
    wait(0.5);
    level flag::set(#"hash_19b70a45ebda2642");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb181545d, Offset: 0x7308
// Size: 0x334
function function_697a602a(mdl_cage) {
    s_scene = struct::get("tag_align_red_eagles");
    var_c6c0744e = mdl_cage gettagorigin("eagle_link_jnt");
    if (isdefined(var_c6c0744e)) {
        mdl_scene = util::spawn_model("tag_origin", var_c6c0744e, mdl_cage.angles);
    }
    if (isdefined(mdl_scene)) {
        mdl_scene linkto(mdl_cage, "eagle_link_jnt");
        scene::add_scene_func(#"hash_517a07eb7f4f647e", &function_1dceae50, "init");
        mdl_scene thread scene::play(#"hash_517a07eb7f4f647e", "init");
    }
    level flag::wait_till(#"cage_dropped");
    level thread scene::play(#"hash_a460f13d4076e71", "open");
    if (isdefined(mdl_scene)) {
        mdl_scene scene::play(#"hash_517a07eb7f4f647e", "cage_drop");
        mdl_scene thread scene::play(#"hash_517a07eb7f4f647e", "ground_waiting");
    }
    if (isdefined(self)) {
        self clientfield::set("" + #"special_target", 1);
        self thread function_c20c157a("serpent_pass");
    }
    level flag::wait_till(#"hash_67695ee69c57c0b2");
    level thread scene::play(#"hash_a460f13d4076e71", "Shot 1");
    wait(0.5);
    level notify(#"eagle_gone");
    scene::add_scene_func(#"aib_vign_cust_zm_red_eagle_1", &function_5297c54, "fly_to_hover");
    s_scene scene::play(#"aib_vign_cust_zm_red_eagle_1", "fly_to_hover");
    level thread function_e39d6ea2(#"eagle_1");
    wait(0.5);
    level flag::set(#"hash_3f6b3af99d456313");
    mdl_scene delete();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb3ef1afa, Offset: 0x7648
// Size: 0x2a
function function_5297c54(a_ents) {
    level.var_6aec40b = a_ents[#"eagle_1"];
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xde2d9e10, Offset: 0x7680
// Size: 0x6c
function function_1dceae50(a_ents) {
    mdl_eagle = a_ents[#"prop 1"];
    if (isdefined(mdl_eagle)) {
        level waittill(#"eagle_gone");
        if (isdefined(mdl_eagle)) {
            mdl_eagle delete();
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc81d9cbe, Offset: 0x76f8
// Size: 0x8c
function function_e39d6ea2(var_b40c658f) {
    s_scene = struct::get("tag_align_red_eagles");
    if (var_b40c658f == #"eagle_1") {
        str_scene = "aib_vign_cust_zm_red_eagle_1";
    } else {
        str_scene = "aib_vign_cust_zm_red_eagle_2";
    }
    s_scene thread scene::play(str_scene, "hover_idle");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe6be9b09, Offset: 0x7790
// Size: 0x64
function function_41d05cb0() {
    level endon(#"egg_free", #"defend_cage");
    trigger::wait_till("trigger_cliff_cage_defenders");
    level flag::set(#"defend_cage");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xfda43f0d, Offset: 0x7800
// Size: 0x114
function function_d1f0f2db() {
    level endon(#"egg_free");
    level flag::wait_till(#"cage_dropped");
    ai_gegenees = zombie_gegenees_util::function_2ce6dcd4(level.var_b3d6ef3b[0], struct::get("serpent_cage_defender"), level.round_number);
    if (isalive(ai_gegenees)) {
        ai_gegenees.var_126d7bef = 1;
        ai_gegenees.ignore_round_spawn_failsafe = 1;
        ai_gegenees.b_ignore_cleanup = 1;
        ai_gegenees.ignore_enemy_count = 1;
        wait(0.25);
        if (isalive(ai_gegenees)) {
            ai_gegenees thread function_ce178733();
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x93e0b332, Offset: 0x7920
// Size: 0x5c
function function_ce178733() {
    self endon(#"death");
    s_scene = struct::get("tag_align_gegenes_snake_jump");
    s_scene scene::play("aib_vign_cust_red_gegn_snake_jump", self);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x2e63fd0e, Offset: 0x7988
// Size: 0x298
function function_d8db57f6() {
    level flag::wait_till(#"defend_cage");
    wait(1);
    var_71da3f5a = getentarray("cage_defender", "targetname");
    foreach (var_3e9d57b3 in var_71da3f5a) {
        if (isdefined(var_3e9d57b3)) {
            v_origin = var_3e9d57b3.origin;
            v_angles = var_3e9d57b3.angles;
            a_info = zm_utility::function_b0eeaada(v_origin + (0, 0, 64));
            if (isdefined(a_info) && isdefined(a_info[#"point"])) {
                v_origin = a_info[#"point"];
            }
            s_spawn = struct::spawn(v_origin, v_angles);
            while (true) {
                var_862206ea = zombie_skeleton_util::function_1ea880bd(1, s_spawn, level.round_number);
                if (isdefined(var_862206ea)) {
                    break;
                }
                waitframe(1);
            }
            if (isdefined(var_862206ea)) {
                var_862206ea thread function_f95a14a0();
            }
            if (isdefined(var_3e9d57b3.target)) {
                mdl_clip = getent(var_3e9d57b3.target, "targetname");
                mdl_clip delete();
            }
            if (isdefined(s_spawn)) {
                s_spawn struct::delete();
            }
            if (isdefined(var_3e9d57b3)) {
                var_3e9d57b3 delete();
            }
            wait(randomfloatrange(0.1, 0.5));
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x49499c6, Offset: 0x7c28
// Size: 0xac
function function_f95a14a0() {
    self endon(#"death");
    self.var_126d7bef = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    self.no_powerups = 1;
    self.var_ae4569d5 = 1;
    self thread scene::play(#"hash_76b23acbc4e7803f", self);
    self clientfield::increment("" + #"hash_6d5686b05e69fcb0");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa9e84a79, Offset: 0x7ce0
// Size: 0x2ca
function rock_fall() {
    level endon(#"hash_4d110cc2383265e3");
    level flag::wait_till(#"hash_7943879f3be8ccc6");
    a_str_rocks = array("p8_col_rock_large_04", "p8_zm_red_dks_rock_shale_boulder_lrg_01", "p8_zm_red_dks_rock_shale_boulder_med_01");
    var_378fd0b1 = struct::get_array("rock_fall");
    while (true) {
        wait(randomfloatrange(2, 6));
        str_rock = array::random(a_str_rocks);
        s_spawnpt = array::random(var_378fd0b1);
        s_goal = struct::get(s_spawnpt.target);
        n_time = distance(s_spawnpt.origin, s_goal.origin) / 900;
        for (i = 0; i < randomint(6); i++) {
            v_offset = (randomintrange(s_spawnpt.radius * -1, s_spawnpt.radius), randomintrange(s_spawnpt.radius * -1, s_spawnpt.radius), 0);
            mdl_rock = util::spawn_model(str_rock, s_spawnpt.origin + v_offset, s_spawnpt.angles + (randomint(90), randomint(90), randomint(90)));
            if (isdefined(mdl_rock)) {
                mdl_rock thread function_c67711a8(s_goal, n_time);
            }
            wait(randomfloatrange(0.2, 1));
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xe53ad860, Offset: 0x7fb8
// Size: 0x8c
function function_c67711a8(s_goal, n_time) {
    self setscale(randomfloatrange(0.25, 0.6));
    self moveto(s_goal.origin, n_time);
    self waittill(#"movedone");
    self delete();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xc9bc240b, Offset: 0x8050
// Size: 0x45c
function function_23f28dd1(var_5ea5c94d) {
    level.zm_bgb_anywhere_but_here_validation_override = &function_d420d273;
    level thread function_a2b76316();
    level thread function_951bdb49();
    level thread function_20bd10b1();
    level thread function_c395d209();
    level thread function_da5ce34c();
    level.var_7906c5af = 0;
    level.var_57daa86c = struct::get_array("arena_spartoi_spawnpt");
    foreach (var_ae696aa0 in level.var_57daa86c) {
        var_ae696aa0.mdl_bones = util::spawn_model("tag_origin", var_ae696aa0.origin);
        var_ae696aa0.s_pt = struct::get(var_ae696aa0.target);
    }
    level.var_c7e9961f = 1;
    level flag::wait_till(#"eagle_attack");
    a_players = util::get_active_players();
    var_c096d4d1 = getent("trigger_pap_arena", "targetname");
    for (i = 0; i < a_players.size; i++) {
        if (isalive(a_players[i]) && a_players[i] istouching(var_c096d4d1)) {
            a_players[i] thread zm_vo::function_a2bd5a0c(#"hash_41371e6903720ece", 1.5, 1, 9999, 1);
            break;
        }
    }
    foreach (player in util::get_active_players()) {
        player thread zm_vo::vo_say(#"hash_76c659bb664b357e", 0.5, 1, 9999, 1, 1);
    }
    zm_trial::function_ae725d63();
    level flag::wait_till(#"egg_free");
    level.var_c7e9961f = undefined;
    exploder::exploder("exp_lgt_back_chaos");
    exploder::stop_exploder("Fxexp_barrier_pap");
    getent("trigger_pap_defend", "targetname") delete();
    getent("pap_arena_blocker", "targetname") delete();
    getent("pap_arena_weapon_clip", "targetname") delete();
    level.zm_bgb_anywhere_but_here_validation_override = undefined;
    level thread function_5f5ee5ed();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x75004549, Offset: 0x84b8
// Size: 0x7a
function function_da5ce34c() {
    level flag::wait_till(#"pap_defend");
    level.var_b2b15659 = 1;
    level flag::wait_till(#"egg_free");
    level waittill(#"start_of_round");
    level.var_b2b15659 = 0;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe12cacd6, Offset: 0x8540
// Size: 0x27c
function function_5f5ee5ed() {
    a_players = util::get_active_players();
    var_c096d4d1 = getent("trigger_pap_arena", "targetname");
    for (i = 0; i < a_players.size; i++) {
        if (isalive(a_players[i]) && a_players[i] istouching(var_c096d4d1)) {
            a_players[i] thread zm_vo::function_a2bd5a0c(#"hash_52c3e2e48f113a34", 1, 1, 9999, 1);
            break;
        }
    }
    wait(2);
    level waittill(#"end_of_round");
    wait(2);
    a_players = util::get_active_players();
    for (i = 0; i < a_players.size; i++) {
        if (isalive(a_players[i]) && a_players[i] istouching(var_c096d4d1)) {
            a_players[i] zm_vo::function_a2bd5a0c(#"hash_1159fae4c9d493f5", 1, 1, 9999, 1);
            break;
        }
    }
    foreach (player in util::get_active_players()) {
        player thread zm_vo::vo_say(#"hash_26efdad6a0045d6d", 0.5, 1, 9999, 1, 1);
    }
    level thread function_1707def1();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xe7501153, Offset: 0x87c8
// Size: 0x168
function function_1707def1() {
    level endon(#"vo_fasttravel");
    a_s_fasttravel = struct::get_array("fasttravel_trigger");
    while (true) {
        foreach (s_fasttravel in a_s_fasttravel) {
            a_players = array::get_all_closest(s_fasttravel.origin, util::get_active_players(), undefined, 4, 300);
            if (isdefined(a_players) && isalive(a_players[0])) {
                a_players[0] zm_vo::function_a2bd5a0c(#"hash_c12560526404585", 0.5, 1, 9999, 1);
                level notify(#"vo_fasttravel");
            }
        }
        wait(0.1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x5a12bbe3, Offset: 0x8938
// Size: 0x194
function function_20bd10b1() {
    level endon(#"egg_free");
    level flag::wait_till(#"pap_defend");
    exploder::exploder("Fxexp_barrier_pap");
    mdl_weapon_clip = getent("pap_arena_weapon_clip", "targetname");
    mdl_weapon_clip solid();
    mdl_weapon_clip thread zm_red_util::barrier_impact();
    for (i = 1; i < 5; i++) {
        vh_trail = spawner::simple_spawn_single("pap_defend_trail");
        if (isdefined(vh_trail)) {
            vh_trail thread function_1984219e(getvehiclenode("nd_start_defend_" + i, "targetname"));
        }
        wait(0.1);
    }
    wait(0.5);
    level flag::set(#"defend_arena");
    function_76678dd2();
    function_b896f640();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x23e3e26b, Offset: 0x8ad8
// Size: 0x54
function function_b896f640() {
    callback::on_ai_killed(&function_8bdbbbf7);
    level thread function_2db78acd();
    level thread function_30bf90f0();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x1c402f1f, Offset: 0x8b38
// Size: 0x138
function function_76678dd2() {
    foreach (var_ae696aa0 in level.var_57daa86c) {
        var_ae696aa0 thread function_c97fc55b();
        wait(randomfloatrange(0.2, 0.5));
    }
    wait(8);
    foreach (var_ae696aa0 in level.var_57daa86c) {
        var_ae696aa0.s_pt struct::delete();
        var_ae696aa0 struct::delete();
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x15f936fd, Offset: 0x8c78
// Size: 0x17c
function function_c97fc55b() {
    self.mdl_bones clientfield::set("" + #"spartoi_reassemble_clientfield", 1);
    self.mdl_bones moveto(self.s_pt.origin, 1);
    self.mdl_bones waittill(#"movedone");
    ai_zombie = zombie_skeleton_util::function_1ea880bd(1, self.s_pt, level.round_number);
    if (isdefined(ai_zombie)) {
        ai_zombie thread function_7793ffc1();
        if (ai_zombie.aitype === "spawner_zm_skeleton_spear") {
            ai_zombie thread scene::play(#"aib_vign_cust_zm_red_spar_spear_build_01", ai_zombie);
        } else {
            ai_zombie thread scene::play(#"hash_76b23acbc4e7803f", ai_zombie);
        }
        ai_zombie clientfield::increment("" + #"hash_6d5686b05e69fcb0");
    }
    self.mdl_bones delete();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa1b6bf78, Offset: 0x8e00
// Size: 0x21c
function function_2db78acd() {
    if (getplayers().size > 2) {
        n_max_zombies = 6;
    } else if (getplayers().size > 1) {
        n_max_zombies = 4;
    } else {
        n_max_zombies = 3;
    }
    a_spawners = struct::get_array("pap_defend_spawnpt");
    s_pos = array::random(a_spawners);
    var_ad728f = undefined;
    n_time = 3;
    wait(3);
    while (!level flag::get(#"egg_free")) {
        level flag::wait_till(#"eagle_attack");
        if (level flag::get("round_reset")) {
            zm_trial::function_ae725d63();
            level.var_7906c5af = 0;
        }
        while (level.var_7906c5af >= n_max_zombies) {
            wait(0.5);
        }
        while (var_ad728f === s_pos) {
            s_pos = array::random(a_spawners);
            waitframe(1);
        }
        var_ad728f = s_pos;
        level thread function_8ef5055b(s_pos);
        wait(n_time);
        n_time -= 0.5;
        if (n_time <= 0) {
            n_time = 0.25;
        }
    }
    callback::remove_on_ai_killed(&function_8bdbbbf7);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x83e3325b, Offset: 0x9028
// Size: 0x74
function function_8ef5055b(s_pos) {
    if (!isdefined(s_pos)) {
        return;
    }
    ai_zombie = zombie_skeleton_util::function_1ea880bd(1, s_pos, level.round_number);
    if (isalive(ai_zombie)) {
        ai_zombie thread function_7793ffc1();
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x143c0714, Offset: 0x90a8
// Size: 0x84
function function_7793ffc1() {
    self endon(#"death");
    level.var_7906c5af++;
    self.var_799d54ae = 1;
    self.script_string = "find_flesh";
    self.var_126d7bef = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.ignore_enemy_count = 1;
    self.b_ignore_cleanup = 1;
    self zm_score::function_acaab828();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x42f5439f, Offset: 0x9138
// Size: 0xdc
function function_8bdbbbf7(params) {
    if (isdefined(self.var_799d54ae) && self.var_799d54ae) {
        level.var_7906c5af--;
        if (isdefined(params.eattacker) && isplayer(params.eattacker)) {
            if (zombie_utility::get_zombie_var_team(#"zombie_powerup_double_points_on", #"allies")) {
                n_points = 20;
            } else {
                n_points = 10;
            }
            params.eattacker thread zm_score::add_to_player_score(n_points, 1, "");
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x72b4233e, Offset: 0x9220
// Size: 0x198
function function_30bf90f0() {
    level endon(#"egg_free");
    level flag::wait_till(#"eagle_attack");
    while (true) {
        level flag::wait_till_clear(#"eagle_attack");
        zm_trial::function_ae725d63();
        a_ai_zombies = getaiteamarray(level.zombie_team);
        if (isdefined(a_ai_zombies)) {
            for (i = 0; i < a_ai_zombies.size; i++) {
                if (isalive(a_ai_zombies[i]) && isdefined(a_ai_zombies[i].var_799d54ae) && a_ai_zombies[i].var_799d54ae) {
                    a_ai_zombies[i] dodamage(a_ai_zombies[i].health, a_ai_zombies[i].origin, undefined, undefined, undefined, "MOD_UNKNOWN");
                }
            }
        }
        wait(0.1);
        level.var_7906c5af = 0;
        level flag::wait_till(#"eagle_attack");
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x1e0b9806, Offset: 0x93c0
// Size: 0xf4
function function_1984219e(nd_start) {
    self endon(#"death");
    self clientfield::set("" + #"perseus_energy", 1);
    self vehicle::get_on_and_go_path(nd_start);
    self playsound(#"hash_7c51534a91103a32");
    self clientfield::set("" + #"perseus_energy", 0);
    self clientfield::increment("" + #"spartoi_charge");
    wait(0.1);
    self delete();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x48873a8b, Offset: 0x94c0
// Size: 0x1b0
function function_a2b76316() {
    level endon(#"egg_free");
    var_c096d4d1 = getent("trigger_pap_arena", "targetname");
    while (true) {
        var_65449625 = 0;
        if (level flag::get("round_reset")) {
            level flag::clear(#"eagle_attack");
            zm_trial::function_ae725d63();
        }
        a_players = getplayers();
        if (isdefined(a_players) && a_players.size > 0) {
            for (i = 0; i < a_players.size; i++) {
                if (zm_utility::is_player_valid(a_players[i]) && a_players[i] istouching(var_c096d4d1)) {
                    var_65449625 = 1;
                }
                waitframe(1);
            }
        }
        if (var_65449625) {
            level flag::set(#"eagle_attack");
        } else {
            level flag::clear(#"eagle_attack");
        }
        wait(1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x62cc99f2, Offset: 0x9678
// Size: 0x84
function function_c395d209() {
    level flag::wait_till_all(array(#"eagle_attack", #"hash_3f6b3af99d456313", #"hash_19b70a45ebda2642"));
    level.var_6aec40b thread function_a8f9c9c4();
    level.var_ba012aad thread function_a8f9c9c4();
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x139aef9c, Offset: 0x9708
// Size: 0x25c
function function_a8f9c9c4() {
    self endon(#"death");
    s_scene = struct::get("tag_align_red_eagles");
    if (self == level.var_6aec40b) {
        var_b40c658f = #"eagle_1";
        str_scene = "aib_vign_cust_zm_red_eagle_1";
    } else {
        var_b40c658f = #"eagle_2";
        str_scene = "aib_vign_cust_zm_red_eagle_2";
    }
    level flag::wait_till(#"defend_arena");
    while (isdefined(self) && !level flag::get(#"egg_free")) {
        zm_trial::function_ae725d63();
        if (!level flag::get(#"eagle_attack")) {
            level thread function_e39d6ea2(var_b40c658f);
        } else {
            s_scene thread scene::play(str_scene, "hover_attack", self);
            self waittill(#"impact");
            self clientfield::increment("" + #"crystal_explosion");
            self playrumbleonentity("zm_red_eagle_impact_rumble");
            if (level.n_attacks) {
                level.n_attacks--;
                level thread function_96442f27(level.n_attacks);
                if (level.n_attacks <= 0) {
                    level flag::set(#"egg_free");
                }
                level thread function_15e37b0a(var_b40c658f);
            }
        }
        wait(4);
    }
    function_deb1409b(var_b40c658f);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x1e935fd9, Offset: 0x9970
// Size: 0x25a
function function_96442f27(n_attacks) {
    switch (n_attacks) {
    case 12:
        level scene::play(#"hash_6c19cacedbc244f", "break01");
        break;
    case 11:
        level scene::play(#"p8_fxanim_zm_red_omphalos_crystal_front_bundle", "break01");
        break;
    case 10:
        level scene::play(#"p8_fxanim_zm_red_omphalos_crystal_right_bundle", "break01");
        break;
    case 7:
        level scene::play(#"hash_6c19cacedbc244f", "break02");
        break;
    case 6:
        level scene::play(#"p8_fxanim_zm_red_omphalos_crystal_front_bundle", "break02");
        break;
    case 5:
        level scene::play(#"p8_fxanim_zm_red_omphalos_crystal_right_bundle", "break02");
        break;
    case 2:
        level scene::play(#"hash_6c19cacedbc244f", "destroy");
        break;
    case 1:
        level scene::play(#"p8_fxanim_zm_red_omphalos_crystal_front_bundle", "destroy");
        break;
    case 0:
        level scene::play(#"p8_fxanim_zm_red_omphalos_crystal_right_bundle", "destroy");
        break;
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x9cde0d06, Offset: 0x9bd8
// Size: 0xbc
function function_15e37b0a(var_b40c658f) {
    s_scene = struct::get("tag_align_red_eagles");
    if (var_b40c658f == #"eagle_1") {
        str_scene = "aib_vign_cust_zm_red_eagle_1";
        s_scene thread scene::play(str_scene, "hover_idle", level.var_6aec40b);
        return;
    }
    str_scene = "aib_vign_cust_zm_red_eagle_2";
    s_scene thread scene::play(str_scene, "hover_idle", level.var_ba012aad);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xee65010f, Offset: 0x9ca0
// Size: 0x14c
function function_deb1409b(var_b40c658f) {
    s_scene = struct::get("tag_align_red_eagles");
    if (var_b40c658f == #"eagle_1") {
        str_scene = "aib_vign_cust_zm_red_eagle_1";
        if (isdefined(level.var_6aec40b)) {
            s_scene scene::play(str_scene, "hover_exit", level.var_6aec40b);
        }
    } else {
        str_scene = "aib_vign_cust_zm_red_eagle_2";
        if (isdefined(level.var_ba012aad)) {
            s_scene scene::play(str_scene, "hover_exit", level.var_ba012aad);
        }
    }
    if (var_b40c658f == #"eagle_1") {
        if (isdefined(level.var_6aec40b)) {
            level.var_6aec40b delete();
        }
        return;
    }
    if (isdefined(level.var_6aec40b)) {
        level.var_ba012aad delete();
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xa5e93d68, Offset: 0x9df8
// Size: 0x120
function function_951bdb49() {
    level endon(#"egg_free");
    t_pap = getent("trigger_pap_defend", "targetname");
    mdl_blocker = getent("pap_arena_blocker", "targetname");
    while (true) {
        s_result = t_pap waittill(#"trigger");
        if (isdefined(s_result.activator) && isplayer(s_result.activator)) {
            player = s_result.activator;
            mdl_blocker setvisibletoplayer(player);
            level flag::set(#"pap_defend");
        }
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x7d4853f0, Offset: 0x9f20
// Size: 0x7c
function function_d420d273() {
    s_point = zm_bgb_anywhere_but_here::function_91a62549();
    if (!isdefined(s_point)) {
        return 0;
    }
    var_a44eef3a = getent("trigger_pap_arena", "targetname");
    if (self istouching(var_a44eef3a)) {
        return 0;
    }
    return 1;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xb4d4ba6b, Offset: 0x9fa8
// Size: 0x16e
function function_6e57d6c6(var_5ea5c94d) {
    var_e47d1e33 = getent("trigger_pap_arena", "targetname");
    var_e47d1e33 endon(#"death");
    var_e47d1e33 waittill(#"trigger");
    level flag::set(#"pap_quest_completed");
    if (zm_custom::function_901b751c(#"zmpapenabled") == 2) {
        var_af2013df = array(#"hash_67695ee69c57c0b2", #"hash_61de3b8fe6f6a35");
        level flag::wait_till_all(var_af2013df);
        wait(3);
        function_deb1409b(#"eagle_1");
        function_deb1409b(#"eagle_2");
    }
    level flag::set(#"zm_red_fasttravel_open");
    level.var_e120ae98 = undefined;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x310b5ce6, Offset: 0xa120
// Size: 0x2c
function function_52411f5e(var_5ea5c94d) {
    if (var_5ea5c94d) {
    }
    function_156669dd(0, 0);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x326713d6, Offset: 0xa158
// Size: 0xcc
function function_156669dd(var_5ea5c94d, ended_early) {
    if (var_5ea5c94d || ended_early) {
        return;
    }
    /#
        iprintlnbold("black");
    #/
    if (zm_utility::is_standard()) {
        level waittill(#"hash_7ca261f468171655");
        return;
    }
    level flag::set("power_on");
    level flag::set(#"pap_quest_completed");
    level flag::set(#"zm_red_fasttravel_open");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x52330620, Offset: 0xa230
// Size: 0x190
function function_5cfbc408(a_s_valid_respawn_points) {
    var_e9b059c7 = [];
    foreach (s_respawn_point in a_s_valid_respawn_points) {
        if (s_respawn_point.script_noteworthy == "zone_river_lower" || s_respawn_point.script_noteworthy == "zone_river_upper" || s_respawn_point.script_noteworthy == "zone_cliff_tombs_upper" || s_respawn_point.script_noteworthy == "zone_cliff_tombs_forge" || s_respawn_point.script_noteworthy == "zone_serpent_pass_upper" || s_respawn_point.script_noteworthy == "zone_serpent_pass_center" || s_respawn_point.script_noteworthy == "zone_drakaina_arena") {
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

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x82ec2bf2, Offset: 0xa3c8
// Size: 0x1cc
function on_player_spawned() {
    self thread function_2e4c26ff();
    if (self zm_characters::is_character(array(#"hash_7180c6cf382f6010", #"hash_14e91ceb9a7b3eb6"))) {
        self.a_str_vo = [];
        self.a_str_vo[self.a_str_vo.size] = #"hash_5fb45a950319ba97";
        self.a_str_vo[self.a_str_vo.size] = #"hash_5fb459950319b8e4";
        self.a_str_vo[self.a_str_vo.size] = #"hash_5fb45c950319bdfd";
        self.a_str_vo[self.a_str_vo.size] = #"hash_5fb45b950319bc4a";
        self zm_audio::function_87714659(&function_e432aeb6, #"pap", #"wait");
        self zm_audio::function_87714659(&function_118e5303, #"powerup", #"insta_kill");
        self zm_audio::function_87714659(&function_e7e0d76b, #"kill", #"streak_dieg");
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x88d2967a, Offset: 0xa5a0
// Size: 0x70
function function_e432aeb6(str_category, var_39acfdda) {
    str_vo = array::random(self.a_str_vo);
    if (isdefined(str_vo)) {
        self thread function_9bc19458(str_vo);
    } else {
        self thread function_229fd7e9();
    }
    return true;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0xf39bcdba, Offset: 0xa618
// Size: 0xc4
function function_9bc19458(str_vo) {
    self endon(#"death");
    arrayremovevalue(self.a_str_vo, str_vo);
    self zm_vo::vo_say(str_vo, 0.5, 1, 9999, 1);
    if (str_vo == #"hash_5fb45b950319bc4a") {
        var_5fe18b90 = #"hash_4a6c02ebb0aaef31";
        self zm_vo::vo_say(var_5fe18b90, 0.5, 1, 9999, 1, 1);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0xf9edb395, Offset: 0xa6e8
// Size: 0x2c
function function_229fd7e9() {
    self zm_vo::function_a2bd5a0c(#"vox_pap_pickup", 0, 1);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x7977277e, Offset: 0xa720
// Size: 0x118
function function_118e5303(str_category, var_39acfdda) {
    a_str_vo = array(#"hash_fb4780da8c3e82e", #"hash_fb4790da8c3e9e1", #"hash_fb4760da8c3e4c8", #"hash_fb4770da8c3e67b", #"hash_fb47c0da8c3eefa");
    str_vo = array::random(a_str_vo);
    if (str_vo == #"hash_fb47c0da8c3eefa") {
        self thread function_278687dd(str_vo, #"hash_4cd2ae6c8be71e9e");
    } else {
        self thread zm_vo::vo_say(str_vo, 0.5, 1, 9999, 1);
    }
    return true;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x633381cd, Offset: 0xa840
// Size: 0x118
function function_e7e0d76b(str_category, var_39acfdda) {
    a_str_vo = array(#"hash_45f33af562e8c0c3", #"hash_45f339f562e8bf10", #"hash_45f33cf562e8c429", #"hash_45f33bf562e8c276", #"hash_45f33ef562e8c78f");
    str_vo = array::random(a_str_vo);
    if (str_vo == #"hash_45f33ef562e8c78f") {
        self thread function_278687dd(str_vo, #"hash_5e93b1a6cba0fb35");
    } else {
        self thread zm_vo::vo_say(str_vo, 0.5, 1, 9999, 1);
    }
    return true;
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0xdfdad237, Offset: 0xa960
// Size: 0x84
function function_278687dd(var_3d0af5d4, var_24f3d84e) {
    self endon(#"death");
    self zm_vo::vo_say(var_3d0af5d4, 0.5, 1, 9999, 1);
    self zm_vo::vo_say(var_24f3d84e, 0.5, 1, 9999, 1, 1);
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 0, eflags: 0x1 linked
// Checksum 0x13349db4, Offset: 0xa9f0
// Size: 0xe4
function function_1545931a() {
    if (zm_custom::function_901b751c(#"zmequipmentisenabled")) {
        zm_items::function_4d230236(zm_crafting::get_component(#"hash_5b9dc0415a4521f3"), &function_3e5c42f5);
        zm_items::function_4d230236(zm_crafting::get_component(#"hash_5b9dc1415a4523a6"), &function_3e5c42f5);
        zm_items::function_4d230236(zm_crafting::get_component(#"hash_5b9dc2415a452559"), &function_3e5c42f5);
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 2, eflags: 0x1 linked
// Checksum 0x84742959, Offset: 0xaae0
// Size: 0x132
function function_3e5c42f5(e_holder, w_item) {
    if (!zm_custom::function_901b751c(#"zmequipmentisenabled")) {
        return;
    }
    zm_crafting::function_d1f16587(#"zblueprint_red_strike", &function_7250e6b9);
    switch (w_item.name) {
    case #"hash_5b9dc0415a4521f3":
        zm_ui_inventory::function_7df6bb60(#"hash_770d4d2226eb79", 1);
        break;
    case #"hash_5b9dc1415a4523a6":
        zm_ui_inventory::function_7df6bb60(#"hash_770a4d2226e660", 1);
        break;
    case #"hash_5b9dc2415a452559":
        zm_ui_inventory::function_7df6bb60(#"hash_770b4d2226e813", 1);
        break;
    }
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x1 linked
// Checksum 0x82a58f3f, Offset: 0xac20
// Size: 0x24
function function_7250e6b9(var_838aa9c4) {
    showmiscmodels("forge_assembled");
}

// Namespace zm_red_pap_quest/zm_red_pap_quest
// Params 1, eflags: 0x0
// Checksum 0xe1ef7e9d, Offset: 0xac50
// Size: 0x120
function function_df55fcc8(e_player) {
    self endon(#"death");
    can_use = zm_utility::can_use(e_player);
    can_use &= !e_player hasweapon(level.w_thunderstorm);
    if (can_use) {
        str = self.stub.blueprint.var_391591d0;
        var_e7ed2264 = self.stub.blueprint.var_391591d0 + "_KEYBOARD";
        hint_str = zm_utility::function_d6046228(str, var_e7ed2264);
        self sethintstring(hint_str);
    } else {
        self sethintstring("");
    }
    return can_use;
}

