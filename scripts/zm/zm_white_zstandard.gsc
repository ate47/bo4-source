#using script_2595527427ea71eb;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_white_portals;
#using scripts\zm\zm_white_special_rounds;
#using scripts\zm\zm_white_util;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_blockers;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_utility_zstandard;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_white_zstandard;

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x6b168b1c, Offset: 0x970
// Size: 0x2c
function main() {
    init_level_vars();
    level thread function_43240e81();
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xd7587046, Offset: 0x9a8
// Size: 0x34
function register_clientfields() {
    clientfield::register("world", "portal_maps_init", 1, 1, "int");
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xe9106af8, Offset: 0x9e8
// Size: 0x2ac
function init_level_vars() {
    function_ac904e5e();
    function_7f933d39();
    level.fn_custom_round_ai_spawn = &function_a39e7a56;
    level flag::init("quarantine_points");
    level flag::init("apd_points");
    level flag::init("operations_points");
    level flag::init("diner_points");
    level flag::init("lounge_points");
    level flag::init("storage_points");
    level flag::init("solitary_points");
    level.var_3f86fd35 = 9;
    level.var_d7853f35 = 18;
    level.var_ecdf38f = 12;
    level.var_55e562f9 = 18;
    level.zombie_hints[#"default_treasure_chest"] = #"hash_57a34375dddce337";
    level thread defend_areas();
    level thread function_9217567c();
    level thread init_traps();
    level thread function_f436d901();
    zm_round_spawning::function_2876740e(#"zombie_dog", &function_c7e2bbe2);
    zm_round_spawning::function_2876740e(#"nova_crawler", &function_aee9d1fb);
    zm_utility::function_2959a3cb(#"zombie_dog", &function_bf7015a8);
    zm_utility::function_2959a3cb(#"nova_crawler", &function_8daf4de5);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x5bfd3318, Offset: 0xca0
// Size: 0x2c
function function_43240e81() {
    wait 1;
    clientfield::set("portal_maps_init", 1);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x3bba3a3a, Offset: 0xcd8
// Size: 0xf0c
function defend_areas() {
    level endon(#"end_game");
    function_84139b27();
    level flag::init(#"hash_1643995c3d7501b0");
    level flag::init(#"hash_40856b65dff0f6eb");
    level flag::init(#"hash_50990d5b9376f50d");
    level flag::init(#"hash_3bb140702c2b1323");
    level.defend_spawns = 0;
    level flag::wait_till("start_zombie_round_logic");
    zm_white_util::function_985c08e7();
    zm_utility::enable_power_switch(0);
    /#
        if (getdvarint(#"hash_b3363e1d25715d7", 0)) {
            zm_utility::enable_power_switch(1, 1);
            level function_1dcc39ae();
            return;
        }
    #/
    str_next_defend = #"culdesac";
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    var_420e4589 = [];
    var_49f2dcca = [];
    var_dca419c2 = [];
    zm_utility::function_fdb0368(3);
    var_73ca1ee9 = "";
    if (math::cointoss()) {
        var_73ca1ee9 = "apd";
        var_420e4589 = array("street_start_to_reinsel_debris");
        var_49f2dcca = array("street2_to_obrien_debris");
        level flag::set("apd_points");
    } else {
        var_73ca1ee9 = "operations";
        var_420e4589 = array("street2_to_obrien_debris");
        var_49f2dcca = array("street_start_to_reinsel_debris");
        level flag::set("operations_points");
    }
    level zm_utility::open_door(var_420e4589, undefined, undefined, 1);
    zm_utility::function_fdb0368(5);
    if (var_73ca1ee9 == "apd") {
        var_420e4589 = array("hoggatt_house_garage_debris", "street_mid_to_hoggat_door");
        var_49f2dcca = arraycombine(var_49f2dcca, array("hammond_to_obrien_door", "street_mid_to_hammond_debris"), 0, 0);
    } else {
        var_420e4589 = array("hammond_to_obrien_door", "street_mid_to_hammond_debris");
        var_49f2dcca = arraycombine(var_49f2dcca, array("hoggatt_house_garage_debris", "street_mid_to_hoggat_door"), 0, 0);
    }
    level zm_utility::open_door(var_420e4589, undefined, undefined, 1);
    level flag::set("quarantine_points");
    zm_utility::function_fdb0368(7);
    var_420e4589 = array("culdesac_to_street1_debris");
    level zm_utility::open_door(var_420e4589, undefined, undefined, 1);
    zm_round_spawning::function_306ce518(#"zombie_dog", &intro_zombie_dog);
    level thread function_b4cae8b9();
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    wait 25;
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    level flag::set(#"hash_50990d5b9376f50d");
    level flag::set(#"power_on1");
    zm_white_util::function_6f635c39("bunker_power_event_storage");
    zm_white_util::function_6f635c39("bunker_power_event_solitary");
    zm_utility::function_fef4b36a(str_next_defend);
    var_4aa70779 = "";
    if (math::cointoss()) {
        str_next_defend = #"lounge";
        var_4aa70779 = "lounge";
        var_420e4589 = array("culdesac_to_yellow_house_f1_door", "yellow_backyard_to_yellow_house_door", "green_backyard_to_bunker_door", "yellow_backyard_to_bunker_door", "street_start_to_street_mid_door");
        var_dca419c2 = array("culdesac_to_green_house_door", "green_backyard_to_green_house_door");
        level flag::set("lounge_points");
    } else {
        str_next_defend = #"diner";
        var_4aa70779 = "diner";
        var_420e4589 = array("culdesac_to_green_house_door", "green_backyard_to_green_house_door", "green_backyard_to_bunker_door", "yellow_backyard_to_bunker_door", "street_start_to_street_mid_door");
        var_dca419c2 = array("culdesac_to_yellow_house_f1_door", "yellow_backyard_to_yellow_house_door");
        level flag::set("diner_points");
    }
    level zm_utility::open_door(var_420e4589, undefined, undefined, 1);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    wait 25;
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    level flag::set(#"pap_power_ready");
    level registerlast_truck_headshot_();
    zm_utility::function_fef4b36a(str_next_defend);
    str_next_defend = #"power_room";
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    wait 10;
    var_420e4589 = array("bunker_beds_to_bunker_power_debris");
    level zm_utility::open_door(var_420e4589, undefined, undefined, 1);
    zm_round_spawning::function_306ce518(#"nova_crawler", &intro_nova_crawler);
    level thread function_bee94926();
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    wait 25;
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    level flag::set("power_on3");
    level flag::set("bunker_power_event");
    level flag::set(#"hash_40856b65dff0f6eb");
    level flag::set(#"hash_1643995c3d7501b0");
    level.var_bcaf8591 = 3;
    zm_utility::function_fef4b36a(str_next_defend);
    if (var_73ca1ee9 == "apd") {
        str_next_defend = #"operations";
        level thread zm_white_util::function_364cd8c0("bunker_power_event_storage");
        level thread zm_white_util::function_612918d9("bunker_door_storage_blocker");
        level thread zm_white_util::function_bf25aeb1("bunker_door_storage_lockdown");
        level flag::set("storage_points");
        level flag::set("operations_points");
    } else {
        str_next_defend = #"apd";
        level thread zm_white_util::function_364cd8c0("bunker_power_event_solitary");
        level thread zm_white_util::function_612918d9("bunker_door_solitary_blocker");
        level thread zm_white_util::function_bf25aeb1("bunker_door_solitary_lockdown");
        level flag::set("solitary_points");
        level flag::set("apd_points");
    }
    var_49f2dcca = arraycombine(var_49f2dcca, array("yellow_backyard_to_holding_door", "holding_to_yellow_backyard_door", "green_backyard_to_hoggatt_door", "hoggat_to_green_backyard_door"), 0, 0);
    level zm_utility::open_door(var_49f2dcca, undefined, undefined, 1);
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    var_c39fcc2 = getentarray("lockdown_trigger", "targetname");
    foreach (var_77ccde7f in var_c39fcc2) {
        var_77ccde7f delete();
    }
    level thread function_5554ed4b();
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    wait 25;
    zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    level flag::set(#"hash_3bb140702c2b1323");
    zm_utility::function_fef4b36a(str_next_defend);
    level.s_portal_power thread zm_white_portals::reenable_teleporter();
    level.s_portal_street_mid thread zm_white_portals::reenable_teleporter();
    level function_a97f7327();
    var_dca419c2 = arraycombine(var_dca419c2, array("truck_blocker"), 0, 0);
    level zm_utility::open_door(var_dca419c2, undefined, undefined, 0);
    if (var_73ca1ee9 == "apd") {
        level thread zm_white_util::function_364cd8c0("bunker_power_event_solitary");
        level thread zm_white_util::function_612918d9("bunker_door_solitary_blocker");
        level thread zm_white_util::function_bf25aeb1("bunker_door_solitary_lockdown");
    } else {
        level thread zm_white_util::function_364cd8c0("bunker_power_event_storage");
        level thread zm_white_util::function_612918d9("bunker_door_storage_blocker");
        level thread zm_white_util::function_bf25aeb1("bunker_door_storage_lockdown");
    }
    zm_white_util::function_f2fa71ce();
    zm_white_util::function_364cd8c0("apd_lockdown");
    zm_zonemgr::enable_zone("zone_bunker_apd");
    level thread function_466fb0ff(str_next_defend);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x6bd695b6, Offset: 0x1bf0
// Size: 0x1c6
function function_7f933d39() {
    level.s_portal_street_mid = struct::get("PORTAL_STREET_MID", "script_noteworthy");
    level.s_portal_power = struct::get("PORTAL_POWER", "script_noteworthy");
    a_s_portals = struct::get_array("white_portal");
    foreach (s_portal in a_s_portals) {
        s_portal zm_white_portals::portal_init();
    }
    level.s_portal_power.b_active = 1;
    level.s_portal_street_mid.b_active = 1;
    level.s_portal_power.e_model show();
    level.s_portal_street_mid.e_model show();
    level.s_portal_power thread zm_white_portals::portal_activate();
    level.s_portal_street_mid thread zm_white_portals::portal_activate();
    level.s_portal_power.n_dest = level.s_portal_street_mid.var_7b89ada3;
    level.s_portal_street_mid.n_dest = level.s_portal_power.var_7b89ada3;
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x45dd5c91, Offset: 0x1dc0
// Size: 0xc4
function function_c87db3f7(str_next_defend) {
    level waittill(#"creating_zone_defend_area");
    level flag::wait_till("started_defend_area");
    level.s_portal_power thread zm_white_portals::disable_teleporter();
    level.s_portal_street_mid thread zm_white_portals::disable_teleporter();
    level waittill(#"hash_7a04a7fb98fa4e4d");
    wait 2;
    level.s_portal_power thread zm_white_portals::reenable_teleporter();
    level.s_portal_street_mid thread zm_white_portals::reenable_teleporter();
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x9bb6ade1, Offset: 0x1e90
// Size: 0x1c
function function_c7e2bbe2(n_max) {
    return getplayers().size;
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xe59c2240, Offset: 0x1eb8
// Size: 0x1c
function function_aee9d1fb(n_max) {
    return getplayers().size;
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x0
// Checksum 0xd20d8902, Offset: 0x1ee0
// Size: 0x86
function function_74872db6() {
    if (level.round_number <= 7) {
        level.var_11f7a9af = 1;
        level.var_18d20774 = 62500;
        level.registertheater_fxanim_kill_trigger_centerterminatetraverse = 62500;
        return;
    }
    level.var_2e3a6cbe = undefined;
    level.var_d614a8b4 = undefined;
    level.var_11f7a9af = undefined;
    level.var_18d20774 = undefined;
    level.registertheater_fxanim_kill_trigger_centerterminatetraverse = undefined;
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xad17fa04, Offset: 0x1f70
// Size: 0x54
function function_bf7015a8() {
    level zm_utility::function_e64ac3b6(14, #"hash_49f589580684d1b6");
    level thread zm_audio::sndannouncerplayvox(#"lightning_hounds", undefined, undefined, undefined, 1);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xa2ea97b, Offset: 0x1fd0
// Size: 0x54
function function_8daf4de5() {
    level zm_utility::function_e64ac3b6(15, #"hash_7dc876068950e355");
    level thread zm_audio::sndannouncerplayvox(#"bombers", undefined, undefined, undefined, 1);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x26d201a7, Offset: 0x2030
// Size: 0x54
function function_54b015d9() {
    level zm_utility::function_e64ac3b6(16, #"hash_1de54db35ad2c33a");
    level thread zm_audio::sndannouncerplayvox(#"hash_6acb03a0373891c1", undefined, undefined, undefined, 1);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xbd6306e7, Offset: 0x2090
// Size: 0x9c
function intro_zombie_dog(n_round_number) {
    level endon(#"hash_7a04a7fb98fa4e4d");
    n_spawn_count = 0;
    while (n_spawn_count < 3) {
        e_nova_crawler = zombie_dog_util::function_62db7b1c(1, undefined);
        if (isdefined(e_nova_crawler)) {
            n_spawn_count++;
        }
        waitframe(1);
    }
    zm_utility::function_9b7bc715(#"zombie_dog", 1);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x3ee5e020, Offset: 0x2138
// Size: 0x5c
function function_b4cae8b9() {
    level flag::wait_till("started_defend_area");
    util::delay(15, "end_game", &zm_round_spawning::function_376e51ef, #"zombie_dog");
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xb6477826, Offset: 0x21a0
// Size: 0xa4
function intro_nova_crawler(n_round_number) {
    level endon(#"hash_7a04a7fb98fa4e4d");
    n_spawn_count = 0;
    while (n_spawn_count < 3) {
        e_nova_crawler = zm_white_special_rounds::function_dd836251();
        if (isdefined(e_nova_crawler)) {
            n_spawn_count++;
        }
        waitframe(1);
    }
    level notify(#"crawlers_spawned");
    zm_utility::function_9b7bc715(#"nova_crawler", 0);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xfe19240, Offset: 0x2250
// Size: 0x64
function function_bee94926() {
    level flag::wait_till("started_defend_area");
    level util::delay(20, "end_game", &zm_round_spawning::function_376e51ef, #"nova_crawler");
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x8f6b9512, Offset: 0x22c0
// Size: 0xb4
function function_5554ed4b() {
    level.var_819e7dfd[#"nova_crawler"].var_74f6178a = 0;
    zm_utility::function_2959a3cb(#"nova_crawler", &function_54b015d9);
    level flag::wait_till("started_defend_area");
    level util::delay(20, "end_game", &zm_round_spawning::function_376e51ef, #"nova_crawler");
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x487f2616, Offset: 0x2380
// Size: 0x1f2
function function_a39e7a56() {
    if (level flag::get(#"infinite_round_spawning")) {
        if (level flag::get(#"hash_3bb140702c2b1323") && level.defend_spawns == 4) {
            ai = zm_white_special_rounds::function_dd836251();
            if (isdefined(ai)) {
                return true;
            }
        }
        if (level.defend_spawns > 8) {
            level.defend_spawns = 0;
            if (level flag::get(#"hash_50990d5b9376f50d")) {
                ai = zombie_dog_util::function_62db7b1c(0);
                if (isdefined(ai)) {
                    return true;
                }
            }
        } else {
            s_spawn_point = array::random(level.zm_loc_types[#"zombie_location"]);
            ai = zombie_utility::spawn_zombie(getentarray("zombie_spawner", "script_noteworthy")[0], undefined, s_spawn_point);
            if (isdefined(ai)) {
                n_delay = isdefined(zombie_utility::get_zombie_var(#"zombie_spawn_delay")) ? zombie_utility::get_zombie_var(#"zombie_spawn_delay") : zombie_utility::get_zombie_var(#"hash_7d5a25e2463f7fc5");
                level.defend_spawns++;
            }
            wait n_delay;
            return true;
        }
    }
    return false;
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xb6278941, Offset: 0x2580
// Size: 0x9ec
function function_84139b27() {
    zm_utility::function_c492c4d6("entrance", "s_destination_site_entrance", array("zone_street_start"), array(#"culdesac", #"yellow_backyard", #"green_backyard", #"apd_control"), #"hash_205e609da892b2d2", #"hash_5e083adaa2cc330e");
    zm_utility::function_c492c4d6("operations", "s_destination_operations", array("zone_obrien_house"), array(#"green_backyard", #"apd_control", #"power_room", #"lounge"), #"hash_6fd37a805e3137fe", #"hash_7beee9fea50190a");
    zm_utility::function_c492c4d6("apd", "s_destination_apd", array("zone_reinsel_house"), array(#"green_backyard", #"yellow_backyard", #"power_room", #"diner"), #"hash_4a50459d19896ff5", #"hash_2fb176e305167a3b");
    zm_utility::function_c492c4d6("holding", "s_destination_holding", array("zone_hammond_house"), array(#"green_backyard", #"entrance", #"culdesac", #"lounge"), #"hash_3c61bc28df1dd51", #"hash_1b13f0782c49ab87");
    zm_utility::function_c492c4d6("transfusion", "s_destination_transfusion", array("zone_hoggatt_house"), array(#"yellow_backyard", #"entrance", #"culdesac", #"diner"), #"hash_6d3eb3674d99ca86", #"hash_73a50a71d5726422");
    zm_utility::function_c492c4d6("culdesac", "s_destination_culdesac", array("zone_culdesac_green", "zone_culdesac_yellow", "zone_angled_house"), array(#"operations", #"apd", #"holding", #"transfusion"), #"hash_516f9bc77bc9ef44", #"hash_7e7143f972f73264");
    zm_utility::function_c492c4d6("green_backyard", "s_destination_green_backyard", array("zone_green_backyard"), array(#"apd", #"apd_control", #"beds", #"power_room"), #"hash_6d852577912f7e9d", #"hash_43f1d033be044ed3");
    zm_utility::function_c492c4d6("yellow_backyard", "s_destination_yellow_backyard", array("zone_yellow_backyard"), array(#"operations", #"transfusion", #"beds", #"power_room"), #"hash_4811820ea0fe509e", #"hash_7473609f57236a6a");
    zm_utility::function_c492c4d6("diner", "s_destination_diner", array("zone_bunker_diner"), array(#"beds", #"culdesac", #"holding", #"transfusion"), #"hash_73242c859b850294", #"hash_216fb8f215328314");
    zm_utility::function_c492c4d6("lounge", "s_destination_lounge", array("zone_bunker_lounge"), array(#"operations", #"entrance", #"holding", #"diner"), #"hash_1cc24c9fd1233b2a", #"hash_5b005aa1fe5cd936");
    zm_utility::function_c492c4d6("beds", "s_destination_beds", array("zone_bunker_beds_1", "zone_bunker_beds_2"), array(#"apd_control", #"transfusion", #"entrance", #"apd"), #"hash_1b2c80095746520", #"hash_23056ec7ef2980d0");
    zm_utility::function_c492c4d6("power_room", "s_destination_power", array("zone_bunker_power_1", "zone_bunker_power_2"), array(#"operations", #"apd", #"lounge", #"beds"), #"hash_6d1bafbffaf5eea3", #"hash_735edac51c5c590d");
    zm_utility::function_c492c4d6("apd_control", "s_destination_apd_control", array("zone_bunker_apd"), array(#"diner", #"lounge", #"holding", #"yellow_backyard"), #"hash_1e1724de3db625e7", #"hash_73afea47172727f1");
    a_str_keys = getarraykeys(level.a_s_defend_areas);
    foreach (s_defend_area in level.a_s_defend_areas) {
        foreach (str_index in s_defend_area.a_str_next_defend) {
            str_index = hash(str_index);
            assert(isinarray(a_str_keys, str_index), str_index + "<dev string:x38>");
        }
    }
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x908012b3, Offset: 0x2f78
// Size: 0x11a
function function_466fb0ff(str_last_defend) {
    level endon(#"end_game");
    str_next_defend = zm_utility::function_40ef77ab(str_last_defend);
    for (var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend); true; var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend)) {
        util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
        wait 25;
        level thread function_c87db3f7();
        zm_utility::function_33798535(var_679cd7a8.var_39c44288, var_679cd7a8.a_str_zones, var_679cd7a8.var_ed1db1a7);
        str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
    }
}

/#

    // Namespace zm_white_zstandard/zm_white_zstandard
    // Params 0, eflags: 0x0
    // Checksum 0xd08ba7a7, Offset: 0x30a0
    // Size: 0x112
    function function_1dcc39ae() {
        wait 5;
        str_next_defend = zm_utility::function_40ef77ab("<dev string:x5f>");
        var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend);
        zm_utility::enable_power_switch(1, 1);
        while (true) {
            zm_utility::function_11101458(str_next_defend);
            wait 5;
            zm_utility::function_33798535(var_679cd7a8.var_39c44288, var_679cd7a8.a_str_zones, var_679cd7a8.var_ed1db1a7, undefined, undefined, 3);
            str_previous_defend = str_next_defend;
            str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
            var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend);
        }
    }

#/

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xe7fca953, Offset: 0x31c0
// Size: 0x9e
function init_traps() {
    a_e_traps = getentarray("zombie_trap", "targetname");
    foreach (e_trap in a_e_traps) {
        e_trap.script_string = "disable_wait_for_power";
    }
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xaa07a799, Offset: 0x3268
// Size: 0x19a
function function_9217567c() {
    level waittill(#"all_players_spawned");
    foreach (a_s_crafting in level.var_4fe2f84d) {
        foreach (s_crafting in a_s_crafting) {
            if (isarray(s_crafting.craftfoundry.blueprints)) {
                foreach (s_blueprint in s_crafting.craftfoundry.blueprints) {
                    if (s_blueprint.name === "zblueprint_zhield_white") {
                        s_crafting.blueprint = s_blueprint;
                    }
                }
            }
        }
    }
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xc46daac, Offset: 0x3410
// Size: 0x330
function function_ac904e5e() {
    zm_utility::function_742f2c18(1, #"zombie", 8, 6);
    zm_utility::function_742f2c18(2, #"zombie", 10, 6);
    zm_utility::function_742f2c18(3, #"zombie", 10, 6);
    zm_utility::function_742f2c18(4, #"zombie", 10, 6);
    zm_utility::function_742f2c18(5, #"zombie", 12, 6);
    zm_utility::function_742f2c18(6, #"zombie", 12, 6);
    zm_utility::function_742f2c18(7, #"zombie", 12, 8);
    zm_utility::function_742f2c18(8, #"zombie", 14, 8);
    zm_utility::function_742f2c18(9, #"zombie", 14, 8);
    zm_utility::function_742f2c18(10, #"zombie", 14, 10);
    zm_utility::function_742f2c18(11, #"zombie", 16, 10);
    zm_utility::function_742f2c18(12, #"zombie", 16, 10);
    zm_utility::function_742f2c18(13, #"zombie", 16, 12);
    zm_utility::function_742f2c18(14, #"zombie", 16, 12);
    zm_utility::function_742f2c18(15, #"zombie", 16, 14);
    zm_utility::function_742f2c18(16, #"zombie", 20, 14);
    zm_utility::function_742f2c18(17, #"zombie", 24, 14);
    n_zombie_min = 16;
    for (n_round = 18; n_round < 255; n_round++) {
        zm_utility::function_742f2c18(n_round, #"zombie", undefined, n_zombie_min);
        n_zombie_min++;
        n_zombie_min = math::clamp(n_zombie_min, 16, 24);
    }
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x14b6fa1c, Offset: 0x3748
// Size: 0x44
function function_f436d901() {
    var_5180bf9a = getent("use_elec_switch", "targetname");
    var_5180bf9a hide();
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xac236467, Offset: 0x3798
// Size: 0x4c
function registerlast_truck_headshot_() {
    level zm_utility::function_7a35b1d7(#"hash_56917185158b9df4");
    level thread zm_audio::sndannouncerplayvox(#"pap_avail", undefined, undefined, undefined, 1);
}

// Namespace zm_white_zstandard/zm_white_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x7ccff65b, Offset: 0x37f0
// Size: 0x4c
function function_a97f7327() {
    level zm_utility::function_7a35b1d7(#"hash_299d0a3534135476");
    level thread zm_audio::sndannouncerplayvox(#"hash_3acd6d72567def3a", undefined, undefined, undefined, 1);
}

