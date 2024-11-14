#using scripts\zm\zm_red_util;
#using scripts\zm\ai\zm_ai_catalyst;
#using script_4d00889cf8c807d5;
#using script_3aa54d3cb36ea43f;
#using scripts\zm_common\zm_characters;
#using scripts\zm_common\zm_zonemgr;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_utility_zstandard;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_transformation;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_power;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_items;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_blockers;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm;
#using scripts\zm_common\callbacks;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\util_shared;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace zm_red_zstandard;

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xec888a66, Offset: 0x420
// Size: 0x7cc
function function_84139b27() {
    zm_utility::function_c492c4d6(#"bathhouse", #"hash_25397ad54563b3eb", array(#"zone_bathhouse_outside", #"zone_bathhouse_inside"), array(#"temple", #"spartan", #"serpent", #"forge"), #"hash_51132818e4c5d547", #"hash_5fbf18c7a76fd791", #"hash_797bd344ce29484a", &function_fbb4cc60);
    zm_utility::function_c492c4d6(#"offering", #"hash_6590ecfcc4e560b6", array(#"zone_offering"), array(#"temple", #"spartan", #"serpent", #"forge"), #"hash_64e7a9268225aa04", #"hash_2e6557c6e7a7c024", #"hash_797bd344ce29484a", &function_fbb4cc60);
    zm_utility::function_c492c4d6(#"amphitheater", #"hash_66971554c4e38c0a", array(#"zone_amphitheater"), array(#"bathhouse", #"temple", #"offering", #"center"), #"hash_7726ad6d8b5ad02c", #"hash_c90e11aa231f05c", #"hash_797bd344ce29484a", &function_fbb4cc60);
    zm_utility::function_c492c4d6(#"temple", #"hash_5bb9416e03ac7a05", array(#"zone_temple_of_apollo", #"zone_temple_of_apollo_back", #"zone_temple_of_apollo_right_path", #"zone_temple_of_apollo_left_path"), array(#"amphitheater", #"bathhouse", #"offering", #"center"), #"hash_6284385c7d20f875", #"hash_73fd81875766f7bb", #"hash_797bd344ce29484a", &function_fbb4cc60);
    zm_utility::function_c492c4d6(#"spartan", #"hash_6a904e27e74c5e8b", array(#"zone_spartan_monument_east", #"zone_spartan_monument_west", #"zone_spartan_monument_upper"), array(#"offering", #"bathhouse", #"serpent", #"forge"), #"hash_4cd3593f18ffe83f", #"hash_7a8bc638c30d31d9", #"hash_797bd344ce29484a", &function_fbb4cc60);
    zm_utility::function_c492c4d6(#"serpent", #"hash_191bf5238547dfc7", array(#"zone_serpent_pass_center", #"zone_serpent_pass_upper", #"zone_serpent_pass_lower"), array(#"center", #"amphitheater", #"spartan", #"bathhouse"), #"hash_25760f552752078b", #"hash_315f9683804aa985", #"hash_242a68e3a5256bb2", &function_1716cce9);
    zm_utility::function_c492c4d6(#"forge", #"hash_118577da8f7df38b", array(#"zone_cliff_tombs_forge", #"zone_cliff_tombs_upper", #"zone_cliff_tombs_center", #"zone_cliff_tombs_lower"), array(#"center", #"amphitheater", #"temple", #"offering"), #"hash_145f1e36dfff4c6b", #"hash_dcf5f6182603525", #"hash_242a68e3a5256bb2", &function_1716cce9);
    zm_utility::function_c492c4d6(#"center", #"hash_5c468643139b9445", array(#"zone_drakaina_arena"), array(#"forge", #"serpent", #"amphitheater", #"spartan"), #"hash_1232ccbc481cfd1", #"hash_3d822ba844073707", #"hash_242a68e3a5256bb2", &function_1716cce9);
    /#
        zm_utility::function_1e856719();
    #/
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x5ec9220, Offset: 0xbf8
// Size: 0x42
function function_1716cce9() {
    vol_light_side = getent("vol_light_side", "targetname");
    return self istouching(vol_light_side);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x3b43631d, Offset: 0xc48
// Size: 0x42
function function_fbb4cc60() {
    vol_dark_side = getent("vol_dark_side", "targetname");
    return self istouching(vol_dark_side);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xa5409c77, Offset: 0xc98
// Size: 0x24c
function main() {
    function_edd5bb1a();
    function_ac904e5e();
    callback::function_74872db6(&function_74872db6);
    level.fn_custom_round_ai_spawn = undefined;
    level.var_ef785c4c = 1;
    level.var_81c681aa = 1;
    level.var_3e96c707 = &zm_red_util::function_f0ed2a66;
    level.var_3f86fd35 = 8;
    level.var_d7853f35 = 14;
    level.var_ecdf38f = 13;
    level.var_55e562f9 = 16;
    zm_round_spawning::function_306ce518(#"catalyst", &function_40dfd00b);
    zm_round_spawning::function_306ce518(#"skeleton", &function_9f77f5c8);
    zm_round_spawning::function_306ce518(#"gegenees", &function_41342d7);
    zm_round_spawning::function_306ce518(#"blight_father", &function_d0835d29);
    zm_utility::function_2959a3cb(#"gegenees", &i_zmb_robo_eye_head_lp);
    zm_utility::function_2959a3cb(#"skeleton", &function_a1f61594);
    level.zombie_hints[#"default_treasure_chest"] = #"hash_57a34375dddce337";
    level thread zm_crafting::function_ca244624(#"zblueprint_red_strike");
    level thread defend_areas();
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x9e60af35, Offset: 0xef0
// Size: 0x3e
function function_74872db6() {
    level.var_2e3a6cbe = undefined;
    level.var_d614a8b4 = undefined;
    level.var_11f7a9af = undefined;
    level.var_18d20774 = undefined;
    level.registertheater_fxanim_kill_trigger_centerterminatetraverse = undefined;
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x70a66b23, Offset: 0xf38
// Size: 0x54
function i_zmb_robo_eye_head_lp() {
    level zm_utility::function_e64ac3b6(13, #"hash_adf6cd520ffe986");
    level thread zm_audio::sndannouncerplayvox(#"gegenees", undefined, undefined, undefined, 1);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x1d1750b5, Offset: 0xf98
// Size: 0x54
function function_a1f61594() {
    level zm_utility::function_e64ac3b6(12, #"hash_4815bf04e471dc1d");
    level thread zm_audio::sndannouncerplayvox(#"skeleton", undefined, undefined, undefined, 1);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x0
// Checksum 0xe445116e, Offset: 0xff8
// Size: 0x4c
function registerlast_truck_headshot_() {
    level zm_utility::function_7a35b1d7(#"hash_485fed0457aa5e06");
    level thread zm_audio::sndannouncerplayvox(#"pap_avail", undefined, undefined, undefined, 1);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x4518e648, Offset: 0x1050
// Size: 0x4c
function function_a97f7327() {
    level zm_utility::function_7a35b1d7(#"hash_16f7ba8230a89680");
    level thread zm_audio::sndannouncerplayvox(#"hash_3acd6d72567def3a", undefined, undefined, undefined, 1);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x31ae1c75, Offset: 0x10a8
// Size: 0xb4
function function_40dfd00b(n_round_number) {
    var_c66743a5 = array::random(array(#"catalyst_corrosive", #"catalyst_electric", #"catalyst_plasma", #"catalyst_water"));
    zm_utility::function_9b7bc715(#"catalyst", 1);
    zm_transform::function_bdd8aba6(var_c66743a5);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xeb7ac20b, Offset: 0x1168
// Size: 0x4c
function function_41342d7(n_round) {
    zm_utility::function_9b7bc715(#"gegenees", 1);
    zombie_gegenees_util::spawn_single(1, undefined, n_round);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xd3e62666, Offset: 0x11c0
// Size: 0x4c
function function_9f77f5c8(n_round) {
    zm_utility::function_9b7bc715(#"skeleton", 1);
    zombie_skeleton_util::function_1ea880bd(1, undefined, n_round);
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x5aec7a, Offset: 0x1218
// Size: 0x54
function function_d0835d29(n_round) {
    zm_utility::function_9b7bc715(#"blight_father", 1);
    zm_transform::function_bdd8aba6(#"blight_father");
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x26bae48, Offset: 0x1278
// Size: 0x34
function function_edd5bb1a() {
    if (zm_utility::function_e37823df()) {
        zm_utility::function_6df718d(#"tag_origin");
    }
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x1edee92e, Offset: 0x12b8
// Size: 0x91c
function defend_areas() {
    level endon(#"end_game");
    function_84139b27();
    level flag::wait_till("start_zombie_round_logic");
    /#
        if (getdvarint(#"hash_b3363e1d25715d7", 0)) {
            return;
        }
    #/
    zm_utility::function_fdb0368(3);
    if (math::cointoss()) {
        var_5150f93a = #"west";
        level zm_utility::open_door(array("apollo_temple_to_western_plaza"), undefined, undefined, 1);
    } else {
        var_5150f93a = #"east";
        level zm_utility::open_door(array("apollo_temple_to_eastern_plaza"), undefined, undefined, 1);
    }
    zm_utility::function_fdb0368(4);
    if (var_5150f93a == #"west") {
        zm_utility::open_door(array("western_plaza_to_monument_of_craterus", "amphitheater_backstage"), undefined, undefined, 1);
    } else {
        zm_utility::open_door(array("eastern_plaza_to_upper_road", "amphitheater_backstage"), undefined, undefined, 1);
    }
    str_next_defend = #"amphitheater";
    wait 5;
    zm_utility::function_11101458(str_next_defend);
    wait 10;
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    level notify(#"hash_20632257a91d251a");
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 35, undefined, s_defend_area.var_9fc5eea1);
    zm_utility::function_fef4b36a(str_next_defend);
    level util::delay(15, undefined, &zm_round_spawning::function_376e51ef, #"skeleton");
    if (var_5150f93a == #"east") {
        zm_utility::open_door(array("apollo_temple_to_western_plaza", "western_plaza_to_monument_of_craterus"), undefined, undefined, 1);
    } else {
        zm_utility::open_door(array("apollo_temple_to_eastern_plaza", "eastern_plaza_to_upper_road"), undefined, undefined, 1);
    }
    wait 10;
    str_second_defend = array::random(array(#"bathhouse", #"offering"));
    if (str_second_defend == #"bathhouse") {
        level thread zm_utility::open_door(array("western_plaza_to_bathhouse_upper", "intersection_of_treasuries_to_bathhouse_inner"));
    } else {
        level thread zm_utility::open_door(array("eastern_plaza_to_temple_terrace", "stoa_of_the_athenians_to_intersection_of_treasuries"));
    }
    wait 5;
    zm_utility::function_11101458(str_second_defend);
    wait 15;
    s_defend_area = zm_utility::function_a877cd10(str_second_defend);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45, undefined, s_defend_area.var_9fc5eea1);
    zm_utility::function_fef4b36a(str_second_defend);
    level util::delay(5, undefined, &zm_round_spawning::function_376e51ef, #"catalyst");
    str_next_defend = array::random(array(#"forge", #"serpent"));
    level thread zm_utility::open_door(array("stoa_of_the_athenians_to_spartan_monument", "spartan_monument_to_intersection_of_treasuries", "stoa_of_the_athenians_to_intersection_of_treasuries"));
    level notify(#"hash_36ec7e3beabe7a4");
    if (str_next_defend == #"forge") {
        level thread zm_utility::open_door(array("river_acheron_to_cliff_tombs"));
    } else {
        level thread zm_utility::open_door(array("river_acheron_to_serpents_pass"));
    }
    wait 5;
    zm_utility::function_11101458(str_next_defend);
    wait 15;
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    level thread zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, undefined, undefined, s_defend_area.var_9fc5eea1);
    level flag::wait_till("started_defend_area");
    level waittill(#"hash_7a04a7fb98fa4e4d");
    zm_utility::function_fef4b36a(str_next_defend);
    wait 8;
    level thread function_a97f7327();
    level thread zm_utility::open_door(array("cliff_tombs_to_drakaina_arena", "serpents_pass_to_drakaina_arena", "western_plaza_to_bathhouse_upper", "intersection_of_treasuries_to_bathhouse_inner", "western_plaza_to_bathhouse_upper", "intersection_of_treasuries_to_bathhouse_inner", "river_acheron_to_cliff_tombs", "river_acheron_to_serpents_pass", "apollo_temple_to_western_plaza", "western_plaza_to_monument_of_craterus", "apollo_temple_to_eastern_plaza", "eastern_plaza_to_temple_terrace", "apollo_temple_to_western_plaza", "apollo_temple_to_eastern_plaza"));
    wait 20;
    if (str_second_defend == #"bathhouse") {
        str_next_defend = #"offering";
    } else {
        str_next_defend = #"bathhouse";
    }
    zm_utility::function_11101458(str_next_defend);
    wait 15;
    level util::delay(45, undefined, &zm_round_spawning::function_376e51ef, #"gegenees");
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, undefined, undefined, s_defend_area.var_9fc5eea1);
    zm_utility::function_fef4b36a(str_next_defend);
    level util::delay(65, undefined, &zm_round_spawning::function_376e51ef, #"blight_father");
    level thread util::delay(260, "end_game", &function_cf680b18);
    function_39364bed();
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x0
// Checksum 0xc0b11191, Offset: 0x1be0
// Size: 0xda
function function_bdb9652f() {
    /#
        iprintlnbold("<dev string:x38>");
    #/
    switch (getplayers().size) {
    case 1:
    default:
        level.var_71bc2e8f = 2.5;
        break;
    case 2:
    case 3:
        level.var_71bc2e8f = 3.5;
        break;
    case 4:
        level.var_71bc2e8f = 4.5;
        break;
    }
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xf2221685, Offset: 0x1cc8
// Size: 0xd2
function function_cf680b18() {
    /#
        iprintlnbold("<dev string:x5f>");
    #/
    switch (getplayers().size) {
    case 1:
    default:
        level.var_cd345b49 = 1.5;
        break;
    case 2:
    case 3:
        level.var_cd345b49 = 2;
        break;
    case 4:
        level.var_cd345b49 = 3;
        break;
    }
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xef45a5f5, Offset: 0x1da8
// Size: 0x128
function function_39364bed() {
    str_next_defend = array::random(array(#"center", #"temple", #"spartan"));
    while (true) {
        zm_utility::function_11101458(str_next_defend);
        wait 45;
        s_defend_area = zm_utility::function_a877cd10(str_next_defend);
        zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
        zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, undefined, undefined, s_defend_area.var_9fc5eea1);
        str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
        waitframe(1);
    }
}

// Namespace zm_red_zstandard/zm_red_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x64c903a2, Offset: 0x1ed8
// Size: 0x2f0
function function_ac904e5e() {
    zm_utility::function_742f2c18(1, #"zombie", 8, 4);
    zm_utility::function_742f2c18(2, #"zombie", 8, 4);
    zm_utility::function_742f2c18(3, #"zombie", 8, 6);
    zm_utility::function_742f2c18(4, #"zombie", 10, 6);
    zm_utility::function_742f2c18(5, #"zombie", 10, 8);
    zm_utility::function_742f2c18(6, #"zombie", 10, 8);
    zm_utility::function_742f2c18(7, #"zombie", 12, 8);
    zm_utility::function_742f2c18(8, #"zombie", 12, 8);
    zm_utility::function_742f2c18(9, #"zombie", 12, 8);
    zm_utility::function_742f2c18(10, #"zombie", 14, 10);
    zm_utility::function_742f2c18(11, #"zombie", 14, 10);
    zm_utility::function_742f2c18(12, #"zombie", 14, 10);
    zm_utility::function_742f2c18(13, #"zombie", 16, 12);
    zm_utility::function_742f2c18(14, #"zombie", 20, 12);
    zm_utility::function_742f2c18(15, #"zombie", 30, 12);
    n_zombie_min = 12;
    for (n_round = 10; n_round < 255; n_round++) {
        zm_utility::function_742f2c18(n_round, #"zombie", undefined, n_zombie_min);
        if (math::cointoss()) {
            n_zombie_min++;
        }
        n_zombie_min = math::clamp(n_zombie_min, 8, 24);
    }
}

