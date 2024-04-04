// Atian COD Tools GSC decompiler test
#using script_2affe92664ace48d;
#using script_684097158a90b5c3;
#using scripts\zm\zm_towers_pap_quest.gsc;
#using scripts\zm\zm_towers_crowd.gsc;
#using scripts\zm\zm_towers_special_rounds.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility_zstandard.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_towers_zstandard;

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x9928cc65, Offset: 0x398
// Size: 0x14
function main() {
    init_level_vars();
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xbb4f9b72, Offset: 0x3b8
// Size: 0xfc
function init_level_vars() {
    function_edd5bb1a();
    function_ac904e5e();
    level.var_d5bd7049 = #"hash_17758d1de3b1fe6a";
    level.var_b0ebbc69 = "zblueprint_shield_zhield_zword";
    level.var_3f86fd35 = 15;
    level.var_d7853f35 = 25;
    level.var_ecdf38f = 20;
    level.var_55e562f9 = 20;
    level.zombie_hints[#"default_treasure_chest"] = #"hash_57a34375dddce337";
    callback::function_74872db6(&function_74872db6);
    level thread defend_areas();
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xd36c873b, Offset: 0x4c0
// Size: 0x3e
function function_74872db6() {
    level.var_2e3a6cbe = undefined;
    level.var_d614a8b4 = undefined;
    level.var_11f7a9af = undefined;
    level.var_18d20774 = undefined;
    level.registertheater_fxanim_kill_trigger_centerterminatetraverse = undefined;
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x0
// Checksum 0xb6190624, Offset: 0x508
// Size: 0x144
function function_931e4ab1() {
    /#
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
        zm_zonemgr::enable_zone("<unknown string>");
    #/
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x230ce2b7, Offset: 0x658
// Size: 0x674
function function_84139b27() {
    zm_utility::function_c492c4d6(#"danu", #"hash_692e7036aa28a86e", array(#"zone_danu_top_floor", #"zone_danu_ground_floor"), array(#"temple", #"arena", #"flooded_crypt", #"pit"), #"hash_39a5e0978d0efd73", #"hash_78b1d1196746763d");
    zm_utility::function_c492c4d6(#"ra", #"hash_15c014d044ca67c1", array(#"zone_ra_top_floor", #"zone_ra_ground_floor"), array(#"arena", #"temple", #"flooded_crypt", #"pit"), #"hash_7d572184f439180a", #"hash_298247685ea80656");
    zm_utility::function_c492c4d6(#"odin", #"hash_644b220d0ab22c0c", array(#"zone_odin_top_floor", #"zone_odin_ground_floor"), array(#"temple", #"flooded_crypt", #"pit", #"arena"), #"hash_ed407098b77bc91", #"hash_5e203d11381c57c7");
    zm_utility::function_c492c4d6(#"zeus", #"hash_76fbf2acafa2c1b9", array(#"zone_zeus_ground_floor", #"zone_zeus_top_floor"), array(#"arena", #"flooded_crypt", #"pit", #"temple"), #"hash_417a5feff0cb56ea", #"hash_74941e980968cff6");
    zm_utility::function_c492c4d6(#"temple", #"hash_8117ce3b24d5287", array(#"zone_pap_room", #"zone_pap_room_balcony_flooded_crypt"), array(#"ra", #"danu", #"odin", #"zeus"), #"hash_75add73ac9df6bbc", #"hash_468014d28365550c");
    zm_utility::function_c492c4d6(#"arena", #"hash_67ff9fcb1f12e52d", array(#"zone_starting_area_center"), array(#"ra", #"danu", #"odin", #"zeus"), #"hash_4d59f666d8b7f20c", #"hash_c641ebe32c2d1fc");
    zm_utility::function_c492c4d6(#"pit", #"hash_2db9c4e4d97c7ca9", array(#"zone_body_pit", #"zone_fallen_hero"), array(#"ra", #"danu", #"odin", #"zeus"), #"hash_6880f6ff86cde47e", #"hash_30733dec2e9e228a");
    zm_utility::function_c492c4d6(#"flooded_crypt", #"hash_68baa2a5397d37da", array(#"zone_flooded_crypt", #"zone_cursed_room"), array(#"ra", #"danu", #"odin", #"zeus"), #"hash_107cd70abcec1413", #"hash_3235c0f8ff21201d");
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x6d938f1b, Offset: 0xcd8
// Size: 0x24
function function_69d1ce85(n_round_number) {
    zombie_gladiator_util::function_c9cd31(1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xaeb7b4e1, Offset: 0xd08
// Size: 0x24
function function_af36af51(n_round_number) {
    zombie_gladiator_util::function_2efc00db(1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x3b8aa0bf, Offset: 0xd38
// Size: 0x2c
function intro_blight_father(n_round_number) {
    zm_transform::function_bdd8aba6(#"blight_father");
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xb7c62606, Offset: 0xd70
// Size: 0x41c
function function_b03369f() {
    var_d5d4e4c5 = struct::get(#"p8_fxanim_zm_towers_pap_door_red_bundle", "scriptbundlename");
    var_ef946c5f = struct::get(#"p8_fxanim_zm_towers_pap_door_blue_bundle", "scriptbundlename");
    while (true) {
        var_e43d143e = 0;
        foreach (player in level.players) {
            if (player zm_zonemgr::is_player_in_zone(array(#"zone_danu_ra_tunnel", #"zone_pap_room", #"zone_pap_room_balcony_flooded_crypt")) && player util::is_player_looking_at(var_d5d4e4c5.origin, 0.9, 0) || player zm_zonemgr::is_player_in_zone(array(#"zone_odin_zeus_tunnel", #"zone_pap_room", #"zone_pap_room_balcony_flooded_crypt")) && player util::is_player_looking_at(var_ef946c5f.origin, 0.9, 0)) {
                var_e43d143e = 1;
                break;
            }
        }
        if (var_e43d143e) {
            break;
        }
        waitframe(1);
    }
    level thread scene::play(#"p8_fxanim_zm_towers_pap_door_blue_bundle");
    level thread scene::play(#"p8_fxanim_zm_towers_pap_door_red_bundle");
    a_mdl_pap_room_debris_clip = getentarray("mdl_pap_room_debris_clip", "targetname");
    foreach (mdl_pap_room_debris_clip in a_mdl_pap_room_debris_clip) {
        mdl_pap_room_debris_clip connectpaths();
        mdl_pap_room_debris_clip delete();
    }
    level flag::set(#"connect_pap_room_to_danu_ra_tunnel");
    level flag::set(#"connect_pap_room_to_odin_zeus_tunnel");
    zm_zonemgr::enable_zone(#"zone_flooded_crypt");
    zm_zonemgr::enable_zone(#"zone_pap_room_balcony_flooded_crypt");
    zm_zonemgr::enable_zone(#"zone_body_pit");
    zm_zonemgr::enable_zone(#"zone_odin_tunnel");
    zm_zonemgr::enable_zone(#"zone_zeus_tunnel");
    zm_zonemgr::enable_zone(#"zone_cursed_room");
    function_bbbc20bf();
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x7e009b38, Offset: 0x1198
// Size: 0x13c
function function_bbbc20bf(var_a7bc1cee = 0) {
    a_mdl_heads = getentarray("mdl_pap_quest_head", "targetname");
    foreach (mdl_head in a_mdl_heads) {
        mdl_head show();
        if (var_a7bc1cee) {
            mdl_head playsound(#"hash_3d7066af9c9bf849");
            mdl_head thread zm_towers_pap_quest::function_61cf4d04();
        }
    }
    if (var_a7bc1cee) {
        n_time = scene::function_8582657c(#"p8_fxanim_zm_towers_pap_sarcophagus_blood_01_bundle", "Shot 1");
        wait(n_time);
    }
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x0
// Checksum 0x9c1e924a, Offset: 0x12e0
// Size: 0xea
function function_b9cacd48() {
    /#
        while (true) {
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

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x74860176, Offset: 0x13d8
// Size: 0x1cc
function activate_pap_altar() {
    level thread function_bbbc20bf();
    level clientfield::set("pap_force_stream", 1);
    var_35103e6d = struct::get(#"p8_fxanim_zm_towers_pap_sarcophagus_bundle", "scriptbundlename");
    while (true) {
        var_52eeb37 = 0;
        foreach (player in level.players) {
            if (player zm_zonemgr::is_player_in_zone(array(#"zone_pap_room", #"zone_pap_room_balcony_flooded_crypt")) && player util::is_player_looking_at(var_35103e6d.origin, 0.9, 0)) {
                var_52eeb37 = 1;
                break;
            }
        }
        if (var_52eeb37) {
            break;
        }
        waitframe(1);
    }
    level notify(#"hash_7ca261f468171655");
    level clientfield::set("pap_force_stream", 0);
    level zm_utility::function_7a35b1d7(#"hash_3083207742f405f6");
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xb3865742, Offset: 0x15b0
// Size: 0xf6e
function defend_areas() {
    level endon(#"end_game");
    function_84139b27();
    level flag::wait_till("start_zombie_round_logic");
    level thread function_5dff542c();
    /#
        if (getdvarint(#"hash_b3363e1d25715d7", 0)) {
            level thread function_b03369f();
            level thread activate_pap_altar();
            level notify(#"hash_2ff6268271a25ffa");
            level thread function_b9cacd48();
            return;
        }
    #/
    level.var_77f262b9 = 1;
    zm_utility::function_fdb0368(4);
    str_next_defend = array::random(array(#"danu", #"ra"));
    var_b4476de3 = str_next_defend;
    if (str_next_defend == #"danu") {
        level zm_utility::open_door("door_starting_area_to_danu_hallway", undefined, undefined, 1);
    } else {
        level zm_utility::open_door("door_starting_area_to_ra_hallway", undefined, undefined, 1);
    }
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(25);
    zm_zonemgr::function_8caa21df(array(#"zone_danu_ground_floor", #"zone_ra_ground_floor"));
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 20);
    var_69e6a669 = str_next_defend;
    str_next_defend = array::random(array(#"pit", #"flooded_crypt"));
    var_381c9eeb = str_next_defend;
    var_420e4589 = [];
    if (var_69e6a669 == #"danu") {
        if (str_next_defend == #"pit") {
            var_420e4589 = array("door_danu_basement_to_danu_ra_tunnel", "door_ra_tunnel_to_body_pit");
        } else {
            var_420e4589 = array("door_danu_basement_to_danu_ra_tunnel", "door_zeus_tunnel_to_flooded_crypt");
        }
    } else if (str_next_defend == #"pit") {
        var_420e4589 = array("door_ra_basement_to_danu_ra_tunnel", "door_ra_tunnel_to_body_pit");
    } else {
        var_420e4589 = array("door_ra_basement_to_danu_ra_tunnel", "door_zeus_tunnel_to_flooded_crypt");
    }
    level zm_utility::open_door(var_420e4589, undefined, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(45);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    s_defend_area zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    level thread function_b03369f();
    zm_utility::function_11101458(#"temple");
    level thread activate_pap_altar();
    wait(45);
    zm_zonemgr::zone_wait_till_enabled(#"zone_pap_room");
    zm_round_spawning::function_306ce518(#"gladiator_marauder", &function_69d1ce85);
    s_defend_area = zm_utility::function_a877cd10(#"temple");
    level thread zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    level flag::wait_till("started_defend_area");
    level util::delay(5, "end_game", &zm_round_spawning::function_376e51ef, #"gladiator_marauder");
    level waittill(#"hash_7a04a7fb98fa4e4d");
    zm_utility::function_fef4b36a(#"temple");
    level util::delay(5, "end_game", &zm_round_spawning::function_376e51ef, #"tiger");
    level notify(#"hash_2ff6268271a25ffa");
    str_next_defend = array::random(array(#"odin", #"zeus"));
    var_2803cfda = str_next_defend;
    if (str_next_defend == #"odin") {
        var_420e4589 = array("door_starting_area_to_odin_hallway", "door_odin_basement_to_odin_zeus_tunnel");
    } else {
        var_420e4589 = array("door_starting_area_to_zeus_hallway", "door_zeus_basement_to_odin_zeus_tunnel");
    }
    level zm_utility::open_door(var_420e4589, undefined, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(45);
    level notify(#"hash_6a0d2b5af489c227");
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_round_spawning::function_306ce518(#"gladiator_destroyer", &function_af36af51);
    level util::delay("started_defend_area", "end_game", &zm_round_spawning::function_376e51ef, #"gladiator_destroyer");
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    zm_utility::function_fef4b36a(str_next_defend);
    str_next_defend = #"arena";
    zm_utility::function_11101458(#"arena");
    wait(45);
    s_defend_area = zm_utility::function_a877cd10(#"arena");
    level thread zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    level flag::wait_till("started_defend_area");
    level thread zm_towers_special_rounds::function_93eab559();
    level waittill(#"hash_7a04a7fb98fa4e4d");
    level thread zm_towers_special_rounds::function_417990b9();
    zm_utility::function_fef4b36a(#"arena");
    if (var_b4476de3 == #"danu") {
        str_next_defend = #"ra";
        var_420e4589 = array("door_starting_area_to_ra_hallway", "door_danu_ra_bridge", "door_ra_basement_to_danu_ra_tunnel");
    } else {
        str_next_defend = #"danu";
        var_420e4589 = array("door_starting_area_to_danu_hallway", "door_danu_ra_bridge", "door_danu_basement_to_danu_ra_tunnel");
    }
    level zm_utility::open_door(var_420e4589, undefined, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(45);
    zm_round_spawning::function_306ce518(#"blight_father", &intro_blight_father);
    level util::delay("started_defend_area", "end_game", &zm_round_spawning::function_376e51ef, #"blight_father");
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    if (var_381c9eeb == #"pit") {
        str_next_defend = #"flooded_crypt";
        var_420e4589 = array("door_zeus_tunnel_to_flooded_crypt");
    } else {
        str_next_defend = #"pit";
        var_420e4589 = array("door_ra_tunnel_to_body_pit");
    }
    level zm_utility::open_door(var_420e4589, undefined, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(45);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    if (var_2803cfda == #"odin") {
        str_next_defend = #"zeus";
        var_420e4589 = array("door_starting_area_to_zeus_hallway", "door_zeus_basement_to_odin_zeus_tunnel", "door_odin_zeus_bridge");
    } else {
        str_next_defend = #"odin";
        var_420e4589 = array("door_starting_area_to_odin_hallway", "door_odin_basement_to_odin_zeus_tunnel", "door_odin_zeus_bridge");
    }
    level zm_utility::open_door(var_420e4589, undefined, 8, 1);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(45);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
    str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
    n_wait_time = 45;
    for (var_837cd1b4 = 0; true; var_837cd1b4++) {
        zm_utility::function_11101458(str_next_defend);
        wait(n_wait_time);
        s_defend_area = zm_utility::function_a877cd10(str_next_defend);
        zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
        if (var_837cd1b4 == 3 || str_next_defend == #"arena") {
            level thread zm_towers_special_rounds::function_93eab559();
        }
        zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7);
        if (var_837cd1b4 == 3 || str_next_defend == #"arena") {
            level thread zm_towers_special_rounds::function_417990b9();
            var_837cd1b4 = 0;
        }
        str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
        n_wait_time = n_wait_time - 2.5;
        if (n_wait_time < 30) {
            n_wait_time = 30;
        }
    }
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x4a79668c, Offset: 0x2528
// Size: 0xdc
function function_5dff542c() {
    level endon(#"end_game");
    while (true) {
        level waittill(#"hash_7a04a7fb98fa4e4d");
        foreach (player in level.players) {
            if (isalive(player)) {
                player zm_towers_crowd::function_b8dfa139(#"hash_5986c925a370e137");
            }
        }
    }
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x77c9a273, Offset: 0x2610
// Size: 0x3c
function function_edd5bb1a() {
    if (zm_utility::function_e37823df()) {
        zm_utility::function_6df718d(#"hash_6db3dde314ca084", 0);
    }
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x9d4dbbfa, Offset: 0x2658
// Size: 0x3bc
function function_ac904e5e() {
    zm_utility::function_742f2c18(1, #"zombie", 6, 6);
    zm_utility::function_742f2c18(2, #"zombie", 6, 8);
    zm_utility::function_742f2c18(3, #"zombie", 6, 8);
    zm_utility::function_742f2c18(4, #"zombie", 6, 8);
    zm_utility::function_742f2c18(5, #"zombie", 6, 8);
    zm_utility::function_742f2c18(6, #"zombie", 10, 8);
    zm_utility::function_742f2c18(7, #"zombie", 10, 8);
    zm_utility::function_742f2c18(8, #"zombie", 10, 8);
    zm_utility::function_742f2c18(9, #"zombie", 10, 8);
    zm_utility::function_742f2c18(10, #"zombie", 12, 12);
    zm_utility::function_742f2c18(11, #"zombie", 14, 12);
    zm_utility::function_742f2c18(12, #"zombie", 14, 14);
    zm_utility::function_742f2c18(13, #"zombie", 16, 14);
    zm_utility::function_742f2c18(14, #"zombie", 20, 16);
    var_a535d72c = 16;
    for (n_round = 15; n_round < 255; n_round++) {
        zm_utility::function_742f2c18(n_round, #"zombie", undefined, var_a535d72c);
        var_a535d72c++;
        var_a535d72c = math::clamp(var_a535d72c, 16, 24);
    }
    zm_round_spawning::function_306ce518(#"gladiator_destroyer", &function_e073793e);
    zm_round_spawning::function_306ce518(#"gladiator_marauder", &function_20d7ebbb);
    zm_round_spawning::function_306ce518(#"catalyst", &function_40dfd00b);
    zm_round_spawning::function_306ce518(#"blight_father", &function_dcf7377c);
    zm_round_spawning::function_cc103b38(#"catalyst", 6);
    level thread function_11962516();
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x3917c6fd, Offset: 0x2a20
// Size: 0x114
function function_11962516() {
    level endon(#"end_game");
    level waittill(#"hash_6a0d2b5af489c227");
    var_1a397ef = level.round_number + 1;
    if (var_1a397ef == 3 || var_1a397ef == 6) {
        var_1a397ef++;
    }
    zm_round_spawning::function_b4a8f95a(#"tiger", var_1a397ef, &zm_towers_special_rounds::function_f63225b8, &zm_towers_special_rounds::function_9a74f284, &zm_towers_special_rounds::function_a5dc8595, &zombie_tiger_util::function_ffa01525);
    zm_utility::function_fdb0368(var_1a397ef);
    wait(2);
    zm_utility::function_9b7bc715(#"tiger", 1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x515ac334, Offset: 0x2b40
// Size: 0x34
function function_e073793e(n_round_number) {
    zm_utility::function_9b7bc715(#"gladiator_destroyer", 1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x5832d7bf, Offset: 0x2b80
// Size: 0x34
function function_20d7ebbb(n_round_number) {
    zm_utility::function_9b7bc715(#"gladiator_marauder", 1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x769d9277, Offset: 0x2bc0
// Size: 0x34
function function_40dfd00b(n_round_number) {
    zm_utility::function_9b7bc715(#"catalyst", 1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xeaa12560, Offset: 0x2c00
// Size: 0x34
function function_dcf7377c(n_round_number) {
    zm_utility::function_9b7bc715(#"blight_father", 1);
}

// Namespace zm_towers_zstandard/zm_towers_zstandard
// Params 0, eflags: 0x0
// Checksum 0xa3417a1a, Offset: 0x2c40
// Size: 0x2f8
function function_3747b95() {
    level endon(#"end_game");
    while (true) {
        s_waitresult = level waittill(#"hash_4ffec9c5f552e6fc");
        if (isdefined(s_waitresult.e_door) && isdefined(s_waitresult.e_door.script_flag)) {
            switch (s_waitresult.e_door.script_flag) {
            case #"connect_starting_area_to_danu_hallway":
                var_ff20f7d3 = #"hash_756891f8e9b19c50";
                break;
            case #"connect_starting_area_to_ra_hallway":
                var_ff20f7d3 = #"hash_2bf18201f54178a3";
                break;
            case #"connect_starting_area_to_odin_hallway":
                var_ff20f7d3 = #"hash_51ae58346462e5ea";
                break;
            case #"connect_starting_area_to_zeus_hallway":
                var_ff20f7d3 = #"hash_2a82088dd0b6b42f";
                break;
            case #"connect_danu_ra_bridge":
                var_ff20f7d3 = #"hash_25d85717f971c376";
                break;
            case #"connect_odin_zeus_bridge":
                var_ff20f7d3 = #"hash_634e7ac7c0316c00";
                break;
            case #"connect_danu_basement_to_danu_ra_tunnel":
                var_ff20f7d3 = #"hash_77bd07afdb58abd9";
                break;
            case #"connect_ra_basement_to_danu_ra_tunnel":
                var_ff20f7d3 = #"hash_45d7dc4e4f0b00f4";
                break;
            case #"connect_odin_basement_to_odin_zeus_tunnel":
                var_ff20f7d3 = #"hash_2e9e5b687ffd2e47";
                break;
            case #"connect_zeus_basement_to_odin_zeus_tunnel":
                var_ff20f7d3 = #"hash_1354af92e864254c";
                break;
            case #"connect_zeus_tunnel_to_flooded_crypt":
                var_ff20f7d3 = #"hash_1a0bc9a2403dc1ee";
                break;
            case #"connect_ra_tunnel_to_body_pit":
                var_ff20f7d3 = #"hash_35fd31a4342c9786";
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

