#using script_174ebb9642933bf7;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\ai\zm_ai_white_nova_crawler;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_white_main_quest;
#using scripts\zm\zm_white_portals;
#using scripts\zm\zm_white_util;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\trials\zm_trial_special_enemy;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_perks;
#using scripts\zm_common\zm_power;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_white_special_rounds;

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x8e70ba4a, Offset: 0xd28
// Size: 0x4cc
function init() {
    var_75b393f9 = level.var_819e7dfd[#"nova_crawler"];
    var_376db024 = var_75b393f9.var_f6a3b5b0;
    arrayremovevalue(level.var_33e85fa1[var_376db024], var_75b393f9);
    var_376db024 = 20;
    var_75b393f9.var_f6a3b5b0 = var_376db024;
    if (!isdefined(level.var_33e85fa1[var_376db024])) {
        level.var_33e85fa1[var_376db024] = [];
    } else if (!isarray(level.var_33e85fa1[var_376db024])) {
        level.var_33e85fa1[var_376db024] = array(level.var_33e85fa1[var_376db024]);
    }
    if (!isinarray(level.var_33e85fa1[var_376db024], var_75b393f9)) {
        level.var_33e85fa1[var_376db024][level.var_33e85fa1[var_376db024].size] = var_75b393f9;
    }
    level.var_819e7dfd[#"nova_crawler"].var_ef500cb7 = &crawler_round_spawn;
    level.var_819e7dfd[#"nova_crawler"].var_87ed2709 = &function_dd836251;
    zm_round_spawning::function_2876740e(#"nova_crawler", &function_f3f325cb);
    zm_cleanup::function_cdf5a512(#"nova_crawler", &function_b448360c);
    level.ranged_nova_crawler_spawner = getent("ranged_nova_crawler_spawner", "script_noteworthy");
    assert(isdefined(level.ranged_nova_crawler_spawner), "<dev string:x38>");
    if (zm_utility::is_classic()) {
        level thread function_2791c411();
        level thread function_5daa45ac();
        level thread enable_dog_rounds();
        level thread function_3fc75ca6();
    }
    if (zm_utility::is_standard()) {
        var_8b762855 = struct::get_array("malaria", "targetname");
        foreach (turn_location_hit in var_8b762855) {
            turn_location_hit thread function_ff5c24a8();
        }
        s_generator = struct::get("main_generator", "targetname");
        s_generator thread scene::play("shot 1");
    }
    if (zm_utility::is_trials()) {
        level thread function_2791c411();
        level thread function_5daa45ac();
        level thread function_3fc75ca6();
        zm_trial_special_enemy::function_95c1dd81(#"nova_crawler", &function_75309b09);
        zm_round_spawning::function_376e51ef(#"zombie_dog", 15);
    }
    level thread function_2790a022();
    level thread function_8a965a96();
    level thread function_cb3e8fb9();
    level thread function_2ae2045c();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x85e76b79, Offset: 0x1200
// Size: 0x2b4
function register_clientfields() {
    clientfield::register("scriptmover", "white_event_gas_lg_clientfield", 1, 1, "int");
    clientfield::register("scriptmover", "white_event_gas_MD_clientfield", 1, 1, "int");
    clientfield::register("scriptmover", "white_event_gas_lg_vent_clientfield", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicators_init", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_green_house", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_hammond_house", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_hoggatt_house", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_obrien_house", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_reinsel_house", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_yellow_house", 1, 1, "int");
    clientfield::register("world", "portal_map_gas_indicator_generators", 1, 1, "int");
    clientfield::register("world", "generator_sound_sweetner", 1, 1, "int");
    clientfield::register("world", "" + #"hash_1c11f70bb8445095", 1, 3, "int");
    clientfield::register("toplayer", "vent_interact_feedback", 20000, 1, "counter");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x14111264, Offset: 0x14c0
// Size: 0xd2
function function_2ae2045c() {
    level endon(#"end_game");
    if (zm_utility::is_classic()) {
        b_played = 0;
        do {
            waitresult = level waittill(#"buffed");
            if (zm_audio::function_63f85f39(#"nova_effect", #"react")) {
                b_played = waitresult.ai zm_audio::function_ef9ba49c(#"nova_effect");
            }
        } while (!(isdefined(b_played) && b_played));
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x1ddd2d41, Offset: 0x15a0
// Size: 0x194
function enable_dog_rounds() {
    level.var_973488a5 = randomintrangeinclusive(5, 7);
    if (zm_utility::is_classic()) {
        level.var_2f14be05 = level.round_number + 1;
        if (level.round_number < 15) {
            level.var_2f14be05 = 15;
        }
        zm_round_spawning::function_376e51ef(#"zombie_dog", level.var_2f14be05);
    } else if (zm_utility::is_trials()) {
        level.var_2f14be05 = level.round_number + 1;
        if (level.round_number < 10) {
            level.var_2f14be05 = 10;
        }
        zm_round_spawning::function_376e51ef(#"zombie_dog", level.var_2f14be05);
        level.dog_round_track_override = &zombie_dog_util::function_246a0760;
    } else if (zm_utility::is_standard()) {
        level.var_2f14be05 = 10;
    }
    zombie_dog_util::dog_enable_rounds(0);
    level thread function_dc9c5c32();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xb2c31fff, Offset: 0x1740
// Size: 0x220
function function_2790a022() {
    level flag::init(#"hash_16b68e037e570465");
    zm_white_util::function_ca4ee4d1("bunker_door");
    var_c247a965 = zm_custom::function_901b751c(#"zmpowerdoorstate");
    if (var_c247a965 === 1) {
        var_c39fcc2 = getentarray("lockdown_trigger", "targetname");
        foreach (var_77ccde7f in var_c39fcc2) {
            var_77ccde7f sethintstring(#"hash_42a58f21fe6769a4");
        }
        level flag::wait_till(#"power_on1");
        zm_white_util::function_bf25aeb1("bunker_door_electric");
        level flag::wait_till(#"hash_16b68e037e570465");
        zm_white_util::function_bf25aeb1("bunker_door_solitary_lockdown");
        zm_white_util::function_bf25aeb1("bunker_door_storage_lockdown");
        foreach (var_77ccde7f in var_c39fcc2) {
            if (isdefined(var_77ccde7f)) {
                var_77ccde7f delete();
            }
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x9dd421f9, Offset: 0x1968
// Size: 0xe4
function function_61753e3() {
    level clientfield::set("portal_map_gas_indicators_init", 1);
    level clientfield::set("portal_map_gas_indicator_green_house", 0);
    level clientfield::set("portal_map_gas_indicator_hammond_house", 0);
    level clientfield::set("portal_map_gas_indicator_hoggatt_house", 0);
    level clientfield::set("portal_map_gas_indicator_obrien_house", 0);
    level clientfield::set("portal_map_gas_indicator_reinsel_house", 0);
    level clientfield::set("portal_map_gas_indicator_yellow_house", 0);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xde9d39b2, Offset: 0x1a58
// Size: 0xf8
function function_10f8273e() {
    level clientfield::set("portal_map_gas_indicators_init", 0);
    wait 1;
    foreach (var_ab611263 in level.var_d4a0b9f4) {
        if (var_ab611263[#"goo_state"] == #"active") {
            str_identifier = var_ab611263[#"group"];
            clientfield::set("portal_map_gas_indicator_" + str_identifier, 1);
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x4a5eab, Offset: 0x1b58
// Size: 0xc4
function function_8a965a96() {
    level clientfield::set("portal_map_gas_indicators_init", 1);
    level flag::wait_till(#"power_on1");
    level clientfield::set("portal_map_gas_indicators_init", 0);
    level clientfield::set("portal_map_gas_indicator_generators", 1);
    level flag::wait_till(#"hash_16b68e037e570465");
    level clientfield::set("portal_map_gas_indicator_generators", 0);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xf60ebf8a, Offset: 0x1c28
// Size: 0x294
function function_dc9c5c32() {
    level endon(#"end_game");
    level waittill(#"start_of_round");
    power_trig = getent("use_elec_switch", "targetname");
    if (isdefined(power_trig)) {
        waitresult = power_trig waittill(#"trigger");
        user = waitresult.activator;
        wait 1.5;
        while (isdefined(user) && isdefined(user.isspeaking) && user.isspeaking) {
            waitframe(1);
        }
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_38a4d1f9d149b97b", 0, 0);
        if (!(isdefined(level.var_15747fb1) && level.var_15747fb1 || isdefined(level.var_4a03b294) && level.var_4a03b294 || !(zm_custom::function_901b751c(#"zmpowerstate") == 1))) {
            var_a9e4d1ee = zm_utility::get_number_of_valid_players() + 2;
            while (isdefined(level.intermission) && level.intermission) {
                wait 1;
            }
            for (i = 0; i < var_a9e4d1ee; i++) {
                ai = zombie_dog_util::function_62db7b1c(0);
                if (isdefined(ai)) {
                    level.zombie_total += 1;
                }
                wait 0.5;
            }
        }
        playsoundatposition(#"hash_3fc59a2ac3e3a5b9", (0, 0, 0));
        wait 1.5;
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_38a4d0f9d149b7c8", 0, 0);
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xdbc255bb, Offset: 0x1ec8
// Size: 0x420
function function_5daa45ac() {
    a_e_goo = getentarray("c_blockage", "targetname");
    var_6fd4a6e = getentarray("c_blockage_trigger", "targetname");
    level.var_d372355e = struct::get_array("powered_spray", "targetname");
    var_f7ce8af6 = struct::get_array("fluffy_dust", "targetname");
    level.var_7af8330f = getentarray("goo_vol", "targetname");
    var_d4a0b9f4 = [];
    var_8b762855 = struct::get_array("malaria", "targetname");
    level.var_35f057f6 = 0;
    level.var_bcaf8591 = 0;
    level.var_48ff1185 = 0;
    level.var_c3ee1c6e = 0;
    level flag::init(#"hash_68ac76bb578976f1");
    level flag::init(#"hash_1643995c3d7501b0");
    if (var_f7ce8af6.size > 0) {
        foreach (s_gas_cloud in var_f7ce8af6) {
            var_9449a4d2 = [];
            var_9449a4d2[#"gas_cloud"] = s_gas_cloud;
            var_f1c779a7 = s_gas_cloud.script_string + "_" + s_gas_cloud.script_int;
            var_9449a4d2[#"group"] = s_gas_cloud.script_string;
            var_9449a4d2[#"spawns_remaining"] = 0;
            var_9449a4d2[#"goo_count"] = 0;
            var_9449a4d2[#"goo_state"] = #"waiting";
            foreach (turn_location_hit in var_8b762855) {
                if (var_f1c779a7 == turn_location_hit.script_string) {
                    var_9449a4d2[#"animated_fan"] = turn_location_hit;
                    turn_location_hit thread function_ff5c24a8();
                }
            }
            var_d4a0b9f4[var_f1c779a7] = var_9449a4d2;
        }
    }
    level.var_d4a0b9f4 = var_d4a0b9f4;
    foreach (var_ab611263 in level.var_d4a0b9f4) {
        var_f1c779a7 = var_ab611263[#"gas_cloud"].script_string + "_" + var_ab611263[#"gas_cloud"].script_int;
        level function_503db3da(var_f1c779a7);
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xd6ba320, Offset: 0x22f0
// Size: 0x188
function function_fb32496a(str_identifier) {
    foreach (var_efb22590 in level.var_d372355e) {
        if (var_efb22590.script_string == str_identifier) {
            var_efb22590.var_43428f = util::spawn_model("tag_origin", var_efb22590.origin);
            var_efb22590.var_43428f.angles = var_efb22590.angles;
            var_efb22590.var_43428f clientfield::set("white_event_gas_lg_vent_clientfield", 1);
        }
    }
    foreach (var_6c0fa827 in level.var_7af8330f) {
        if (var_6c0fa827.script_string == str_identifier) {
            var_6c0fa827 thread function_78d01716();
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x25221e16, Offset: 0x2480
// Size: 0x148
function function_1d0bb4d1(str_identifier) {
    foreach (var_efb22590 in level.var_d372355e) {
        if (var_efb22590.script_string == str_identifier && isdefined(var_efb22590.var_43428f)) {
            var_efb22590.var_43428f delete();
            var_efb22590.var_43428f = undefined;
        }
    }
    foreach (var_6c0fa827 in level.var_7af8330f) {
        if (var_6c0fa827.script_string == str_identifier) {
            var_6c0fa827 thread function_d16d4153();
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xc7e280ef, Offset: 0x25d0
// Size: 0x182
function function_10671c7e(var_22a056cf) {
    var_18a839cc = [];
    foreach (var_ab611263 in level.var_d4a0b9f4) {
        if ((var_22a056cf || var_ab611263[#"goo_state"] == #"disabled") && var_ab611263[#"goo_state"] != #"waiting" && var_ab611263[#"goo_state"] != #"active") {
            if (!isdefined(var_18a839cc)) {
                var_18a839cc = [];
            } else if (!isarray(var_18a839cc)) {
                var_18a839cc = array(var_18a839cc);
            }
            var_18a839cc[var_18a839cc.size] = var_ab611263;
        }
    }
    s_return = undefined;
    if (var_18a839cc.size > 0) {
        s_return = array::random(var_18a839cc);
    }
    return s_return;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xdf50444c, Offset: 0x2760
// Size: 0x184
function function_7b706d1d(str_identifier) {
    level.var_d4a0b9f4[str_identifier][#"goo_count"] = 4;
    level.var_d4a0b9f4[str_identifier][#"goo_state"] = #"waiting";
    level.var_d4a0b9f4[str_identifier][#"total_waves"] = 0;
    level.var_d4a0b9f4[str_identifier][#"animated_fan"] thread function_470af002();
    level function_a5b37c69(level.var_d4a0b9f4[str_identifier][#"group"]);
    level.var_d4a0b9f4[str_identifier][#"goo_state"] = #"active";
    level.var_d4a0b9f4[str_identifier][#"gas_cloud"] function_802c4c74();
    level.var_d4a0b9f4[str_identifier][#"gas_cloud"] function_5bb49d44();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x5b5076c, Offset: 0x28f0
// Size: 0x194
function function_a5b37c69(str_identifier) {
    switch (str_identifier) {
    case #"green_house":
        exploder::exploder("fxexp_toxic_gas_house_green");
        wait 0.1;
        break;
    case #"yellow_house":
        exploder::exploder("fxexp_toxic_gas_house_yellow");
        wait 0.1;
        break;
    case #"obrien_house":
        exploder::exploder("fxexp_toxic_gas_house_obrien");
        wait 0.1;
        break;
    case #"reinsel_house":
        exploder::exploder("fxexp_toxic_gas_house_reinsel");
        wait 0.1;
        break;
    case #"hammond_house":
        exploder::exploder("fxexp_toxic_gas_house_hammond");
        wait 0.1;
        break;
    case #"hoggatt_house":
        exploder::exploder("fxexp_toxic_gas_house_hoggatt");
        wait 0.1;
        break;
    }
    clientfield::set("portal_map_gas_indicator_" + str_identifier, 1);
    wait 0.1;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xa10c61b9, Offset: 0x2a90
// Size: 0x15a
function function_3be5a506(str_identifier) {
    clientfield::set("portal_map_gas_indicator_" + str_identifier, 0);
    switch (str_identifier) {
    case #"green_house":
        exploder::stop_exploder("fxexp_toxic_gas_house_green");
        break;
    case #"yellow_house":
        exploder::stop_exploder("fxexp_toxic_gas_house_yellow");
        break;
    case #"obrien_house":
        exploder::stop_exploder("fxexp_toxic_gas_house_obrien");
        break;
    case #"reinsel_house":
        exploder::stop_exploder("fxexp_toxic_gas_house_reinsel");
        break;
    case #"hammond_house":
        exploder::stop_exploder("fxexp_toxic_gas_house_hammond");
        break;
    case #"hoggatt_house":
        exploder::stop_exploder("fxexp_toxic_gas_house_hoggatt");
        break;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xb0a88a0c, Offset: 0x2bf8
// Size: 0x112
function function_2fc11fb8() {
    switch (level.var_bcaf8591) {
    case 0:
        /#
            iprintlnbold("<dev string:x6f>");
        #/
        break;
    case 1:
        /#
            iprintlnbold("<dev string:x89>");
        #/
        break;
    case 2:
        /#
            iprintlnbold("<dev string:xa0>");
        #/
        break;
    case 3:
        /#
            iprintlnbold("<dev string:xc3>");
        #/
        break;
    case 4:
        /#
            iprintlnbold("<dev string:xe1>");
        #/
        break;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x1c13698e, Offset: 0x2d18
// Size: 0x70
function function_503db3da(str_identifier) {
    if (level.var_d4a0b9f4[str_identifier][#"goo_state"] != #"active") {
        level.var_d4a0b9f4[str_identifier][#"goo_state"] = #"disabled";
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x8b1f5da7, Offset: 0x2d90
// Size: 0xa8
function function_5c4d70d4(e_player) {
    if (!level flag::get(#"hash_1478cafcd626c361") || level flag::get(#"circuit_step_complete")) {
        self sethintstring(#"hash_25ac72d1e45049ef");
    } else {
        self sethintstring(#"zombie/need_power");
    }
    return true;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xa5b0e47d, Offset: 0x2e40
// Size: 0x4c
function function_802c4c74() {
    s_unitrigger = self zm_unitrigger::create(&function_5c4d70d4, 64);
    self thread function_778aec95();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x78bdd2cc, Offset: 0x2e98
// Size: 0x290
function function_53ffbb2e(var_cf2bbe1e) {
    a_s_result = [];
    a_s_result[#"zombie_location"] = [];
    a_s_result[#"dog_location"] = [];
    var_b72ab239 = var_cf2bbe1e + "_spawn";
    a_s_result[#"zombie_location"] = struct::get_array(var_b72ab239, "targetname");
    foreach (var_ab611263 in level.var_d4a0b9f4) {
        if (var_ab611263[#"gas_cloud"].script_string == var_cf2bbe1e) {
            var_3e91e4d2 = var_ab611263[#"gas_cloud"].script_noteworthy;
            foreach (s_loc in level.zm_loc_types[#"dog_location"]) {
                if (s_loc.zone_name == var_3e91e4d2) {
                    if (!isdefined(a_s_result[#"dog_location"])) {
                        a_s_result[#"dog_location"] = [];
                    } else if (!isarray(a_s_result[#"dog_location"])) {
                        a_s_result[#"dog_location"] = array(a_s_result[#"dog_location"]);
                    }
                    a_s_result[#"dog_location"][a_s_result[#"dog_location"].size] = s_loc;
                }
            }
        }
    }
    return a_s_result;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x6ac67be8, Offset: 0x3130
// Size: 0x3b6
function function_778aec95() {
    self.var_a1edb69e = 0;
    while (self.var_a1edb69e < 10) {
        s_activation = self waittill(#"trigger_activated");
        e_who = s_activation.e_who;
        b_using = 1;
        var_f1c779a7 = self.script_string + "_" + self.script_int;
        while (b_using && (!level flag::get(#"hash_1478cafcd626c361") || level flag::get(#"circuit_step_complete"))) {
            if (isdefined(e_who)) {
                e_who clientfield::increment_to_player("vent_interact_feedback", 1);
            }
            b_using = 1;
            if (!e_who usebuttonpressed() || !zm_utility::can_use(e_who) || !isdefined(self.s_unitrigger) || !isdefined(self.s_unitrigger.trigger) || !e_who istouching(self.s_unitrigger.trigger)) {
                b_using = 0;
                break;
            }
            if (self.var_a1edb69e == 0) {
                self function_8a3b2065(var_f1c779a7);
            }
            self.var_a1edb69e += 1;
            level.var_d4a0b9f4[var_f1c779a7][#"animated_fan"] thread function_c5552e49(self.var_a1edb69e);
            playsoundatposition(#"hash_49d9da44ea86bf03", self.origin);
            /#
                var_847964c = floor(self.var_a1edb69e / 10 * 100);
                str_house = level function_b822e13(self.script_string);
                iprintlnbold(str_house + "<dev string:xf6>" + var_847964c + "<dev string:x101>");
            #/
            wait 1;
            if (self.var_a1edb69e >= 10) {
                if (level.var_bcaf8591 == 0 && !level flag::get(#"hash_1643995c3d7501b0")) {
                    e_who zm_hms_util::function_51b752a9("vox_generic_responses_positive");
                }
                self function_27a8604b(level.var_d4a0b9f4[var_f1c779a7][#"group"]);
                /#
                    iprintlnbold(str_house + "<dev string:x10e>");
                #/
                b_using = 0;
                break;
            }
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x6796291f, Offset: 0x34f0
// Size: 0xca
function function_b822e13(str_identifier) {
    switch (str_identifier) {
    case #"yellow_house":
        return "Yellow House";
    case #"green_house":
        return "Green House";
    case #"hoggatt_house":
        return "Transfusion Facility";
    case #"hammond_house":
        return "Prisoner Holding";
    case #"reinsel_house":
        return "APD Interrogation";
    case #"obrien_house":
        return "Broken Arrow Operations";
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xd5eac936, Offset: 0x35c8
// Size: 0x19a
function function_c5552e49(n_step) {
    if (n_step >= 10) {
        self function_38fa21c2();
        return 1;
    }
    if (n_step >= 9) {
        self function_f8f62327();
        return 1;
    }
    if (n_step >= 8) {
        self function_9c8e6a55();
        return 1;
    }
    if (n_step >= 7) {
        self function_8b5047d9();
        return 1;
    }
    if (n_step >= 6) {
        self function_d20c5554();
        return 1;
    }
    if (n_step >= 5) {
        self function_aecd0ed6();
        return 1;
    }
    if (n_step >= 4) {
        self function_6374f823();
        return 1;
    }
    if (n_step >= 3) {
        self function_523ad5af();
        return 1;
    }
    if (n_step >= 2) {
        self function_791ea376();
        return 1;
    }
    if (n_step >= 1) {
        self function_75c79cc8();
        return 1;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x743d8d1a, Offset: 0x3770
// Size: 0x94
function function_7103a97e() {
    playsoundatposition(#"hash_3fc59a2ac3e3a5b9", (0, 0, 0));
    wait 0.5;
    level zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d("vox_air_vent_repair", 0, 0);
    thread zm_hms_util::function_fd24e47f("vox_air_vent_repair_react", -1, 0, 1);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xfa4351b0, Offset: 0x3810
// Size: 0x2ac
function function_d81c4786() {
    level thread function_7103a97e();
    for (i = 0; i < 4; i++) {
        var_cde7175c = level function_10671c7e(0);
        if (isdefined(var_cde7175c)) {
            var_e09dd0ac = var_cde7175c[#"gas_cloud"].script_string + "_" + var_cde7175c[#"gas_cloud"].script_int;
            level function_7b706d1d(var_e09dd0ac);
            foreach (var_ab611263 in level.var_d4a0b9f4) {
                if (var_ab611263[#"group"] == var_cde7175c[#"group"] && var_ab611263[#"goo_state"] == #"disabled") {
                    var_ab611263[#"goo_state"] = #"complete";
                }
            }
            continue;
        }
        i -= 1;
    }
    foreach (var_ab611263 in level.var_d4a0b9f4) {
        if (var_ab611263[#"goo_state"] != #"active") {
            var_ab611263[#"animated_fan"] function_c58562f9();
            var_ab611263[#"animated_fan"] function_38fa21c2();
        }
    }
    level thread function_993de6f7();
    level function_2fc11fb8();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x4
// Checksum 0xc5462e2c, Offset: 0x3ac8
// Size: 0x16
function private function_d16d4153() {
    self notify(#"stop_status_effect");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x4
// Checksum 0xd5d83f7f, Offset: 0x3ae8
// Size: 0xf4
function private function_78d01716() {
    self endon(#"death", #"stop_status_effect");
    while (true) {
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (players[i] istouching(self)) {
                players[i] status_effect::status_effect_apply(getstatuseffect(#"zm_white_nova_gas"), undefined, players[i], 1);
            }
        }
        wait 0.15;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x1c6212bd, Offset: 0x3be8
// Size: 0xfa
function function_2b6db5eb() {
    n_players = zm_utility::get_number_of_valid_players();
    var_111a6185 = 2;
    if (n_players == 2) {
        var_111a6185 = 3;
    } else if (n_players > 2) {
        var_111a6185 = 5;
    }
    n_round = zm_round_logic::get_round_number();
    var_453a5b46 = 0;
    if (n_round > 50) {
        var_453a5b46 = 2;
    } else if (n_round > 25) {
        var_453a5b46 = 1.5;
    } else if (n_round > 15) {
        var_453a5b46 = 1;
    }
    n_spawn_count = floor(var_111a6185 + var_453a5b46 * n_players);
    return n_spawn_count;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x9e55a8e, Offset: 0x3cf0
// Size: 0x64
function function_8a3b2065(var_f1c779a7) {
    level.var_d4a0b9f4[var_f1c779a7][#"spawn_points"] = function_53ffbb2e(self.script_string);
    level thread function_2dfe81a1(var_f1c779a7);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x7c253696, Offset: 0x3d60
// Size: 0x3c
function function_5bb49d44() {
    self notify(#"goo_cleared");
    var_f1c779a7 = self.script_string + "_" + self.script_int;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x4b088b92, Offset: 0x3da8
// Size: 0x4dc
function function_27a8604b(str_identifier) {
    foreach (var_ab611263 in level.var_d4a0b9f4) {
        if (var_ab611263[#"group"] == str_identifier) {
            var_ab611263[#"goo_state"] = #"complete";
        }
    }
    level.var_bcaf8591 += 1;
    level thread function_2fc11fb8();
    playsoundatposition(#"hash_4a67e67e0a9d6df9", (0, 0, 0));
    if (level.var_bcaf8591 >= 4) {
        n_current_round = zm_round_logic::get_round_number();
        level.var_154aee78 = n_current_round + randomintrange(3, 5);
        if (level.var_154aee78 === level.next_dog_round) {
            level.var_154aee78 += 1;
        }
        /#
            iprintln("<dev string:x124>" + level.var_154aee78);
        #/
        level.var_7a86ba58 function_ccc74648("string_06");
    }
    if (!level flag::get(#"hash_1643995c3d7501b0")) {
        if (level.var_bcaf8591 >= 4) {
            if (level.var_154aee78 < 16) {
                level.var_154aee78 = 13 + randomintrange(3, 5);
                if (level.var_154aee78 === level.next_dog_round) {
                    level.var_154aee78 += 1;
                }
            }
            level thread function_751e9580();
            level flag::set(#"hash_1643995c3d7501b0");
            level thread function_1fef0f43();
            level.var_7a86ba58 function_ccc74648("string_06");
            level thread function_bd2bb73a();
            level.var_39984142 = zm_round_logic::get_round_number() + 1;
            level thread function_b990c084();
        }
        level thread function_5be4c9e4(4 - level.var_bcaf8591);
    } else {
        switch (level.var_bcaf8591) {
        case 1:
            level thread function_5be4c9e4(3);
            break;
        case 2:
            level thread function_5be4c9e4(2);
            break;
        case 3:
            level thread function_5be4c9e4(1);
            break;
        case 4:
            level thread function_1fef0f43();
            level thread function_5be4c9e4(0);
            level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_7305313894f05e93", 0, 0);
            break;
        }
    }
    level thread function_1d0bb4d1(self.script_string);
    level thread function_3be5a506(self.script_string);
    level zm_unitrigger::unregister_unitrigger(self.s_unitrigger);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x2649277e, Offset: 0x4290
// Size: 0x54
function function_b990c084() {
    while (level.var_39984142 > zm_round_logic::get_round_number()) {
        wait 1;
    }
    zm_sq::start(#"zm_white_main_quest");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x4522763e, Offset: 0x42f0
// Size: 0xbc
function function_bd2bb73a() {
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_66d4e14752453ba5", 0, 0);
    level zm_hms_util::function_3c173d37();
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_66d4e047524539f2", 0, 0, 1);
    level zm_hms_util::function_3c173d37();
    level zm_hms_util::function_fd24e47f("vox_air_vent_repaired_react", -1, 0, 1);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xcc8d1bcd, Offset: 0x43b8
// Size: 0x2dc
function function_993de6f7() {
    if (isdefined(level.var_2b94ce72) && level.var_2b94ce72 || isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return;
    }
    if (getplayers().size > 2) {
        n_to_spawn = 12;
    } else if (getplayers().size > 1) {
        n_to_spawn = 9;
    } else {
        n_to_spawn = 6;
    }
    n_spawned = 0;
    exploder::exploder("fxexp_jolting_jack_fx");
    wait 3;
    while (level.var_bcaf8591 < 4 && n_spawned < n_to_spawn) {
        s_spawn_loc = undefined;
        var_63cf6c7b = 0;
        while (isdefined(level.intermission) && level.intermission) {
            var_63cf6c7b = 1;
            wait 1;
        }
        if (var_63cf6c7b) {
            level waittill(#"zombie_total_set");
        }
        s_spawn_locs = level.zm_loc_types[#"sniper_location"];
        if (isdefined(s_spawn_loc)) {
            arrayremovevalue(s_spawn_locs, s_spawn_loc);
        }
        if (s_spawn_locs.size > 0) {
            s_spawn_loc = array::random(s_spawn_locs);
        }
        if (isdefined(s_spawn_loc) && !level flag::get("mee_round")) {
            ai = zombie_utility::spawn_zombie(level.ranged_nova_crawler_spawner);
            if (isdefined(ai)) {
                n_spawned += 1;
                level.zombie_total += 1;
                ai playsound(#"hash_27b6a39054ad63ec");
                ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
                ai zm_ai_white_nova_crawler::function_dc0238e4();
                wait 6;
            }
        }
        wait 1;
    }
    exploder::stop_exploder("fxexp_jolting_jack_fx");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x5d467e1, Offset: 0x46a0
// Size: 0x11c
function function_ba63b9ed(s_params) {
    if (self.archetype === #"zombie" && self.var_a0baa27d === 1 && level.var_c3ee1c6e > level.var_48ff1185) {
        if (zm_round_spawning::function_40229072(zm_round_logic::get_round_number())) {
            level.zombie_total -= 1;
        }
        level.var_48ff1185 += 1;
        if (level.var_48ff1185 >= level.var_c3ee1c6e) {
            level callback::remove_on_ai_spawned(&function_3e2137a4);
            level callback::remove_on_ai_killed(&function_ba63b9ed);
            level flag::clear(#"hash_68ac76bb578976f1");
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xfea5505, Offset: 0x47c8
// Size: 0x1aa
function function_2dfe81a1(var_f1c779a7) {
    if (!level flag::get(#"hash_68ac76bb578976f1")) {
        level flag::set(#"hash_68ac76bb578976f1");
        level callback::on_ai_spawned(&function_3e2137a4);
        level callback::on_ai_killed(&function_ba63b9ed);
    }
    n_to_spawn = level function_2b6db5eb();
    for (i = 0; i < n_to_spawn; i++) {
        s_spawn_point = level function_9c35a6e7(var_f1c779a7);
        ai = zombie_utility::spawn_zombie(getentarray("zombie_spawner", "script_noteworthy")[0], undefined, s_spawn_point);
        if (isdefined(ai)) {
            level.var_c3ee1c6e += 1;
            level.zombie_total += 1;
            ai.var_a0baa27d = 1;
            ai.ignore_enemy_count = 1;
            ai.exclude_cleanup_adding_to_total = 1;
        }
        wait 0.1;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x2f48db7a, Offset: 0x4980
// Size: 0x4c
function function_3e2137a4() {
    waitframe(2);
    if (self.archetype == #"zombie" && self.var_a0baa27d === 1) {
        self zm_ai_white_nova_crawler::function_850768d1();
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x5da5f1ea, Offset: 0x49d8
// Size: 0x4a
function function_9c35a6e7(var_f1c779a7) {
    return array::random(level.var_d4a0b9f4[var_f1c779a7][#"spawn_points"][#"zombie_location"]);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x1b13b440, Offset: 0x4a30
// Size: 0x5c4
function function_751e9580() {
    level endon(#"hash_48039f3a4c1a3248");
    while (level.var_154aee78 > zm_round_logic::get_round_number() || isdefined(level.intermission) && level.intermission) {
        wait 1;
    }
    level waittill(#"zombie_total_set");
    if (level.var_154aee78 <= zm_round_logic::get_round_number() && level.var_bcaf8591 > 0 && (!level flag::get(#"hash_1478cafcd626c361") || level flag::get(#"circuit_step_complete"))) {
        n_zombie_count = level.var_38b15968;
        var_26d4dd52 = floor(randomfloatrange(floor(n_zombie_count / 5), floor(n_zombie_count * 2 / 3)));
        while (level.var_9427911d > var_26d4dd52) {
            wait 1;
        }
        if (level.var_154aee78 <= zm_round_logic::get_round_number()) {
            n_current_round = zm_round_logic::get_round_number();
            var_d62bc957 = 1;
            playsoundatposition(#"hash_3fc59a2ac3e3a5b9", (0, 0, 0));
            waitframe(1);
            var_cde7175c = level function_10671c7e(1);
            var_e09dd0ac = var_cde7175c[#"gas_cloud"].script_string + "_" + var_cde7175c[#"gas_cloud"].script_int;
            level.var_bcaf8591 -= 1;
            level function_7b706d1d(var_e09dd0ac);
            level.var_7a86ba58 function_ccc74648("string_05");
            waitframe(1);
            level zm_white_util::function_2389bb7a("zmb_goop_repair_fail");
            switch (level.var_bcaf8591) {
            case 0:
                level thread function_5be4c9e4(4);
                level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_3ed78c28756a66f", 0, 0);
                zm_hms_util::function_fd24e47f("vox_air_vent_repair", -1, 1);
                break;
            case 1:
                level thread function_5be4c9e4(3);
                level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_3ed78c28756a66f", 0, 0);
                zm_hms_util::function_fd24e47f("vox_air_vent_repair", -1, 1);
                break;
            case 2:
                level thread function_5be4c9e4(2);
                level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_3ed78c28756a66f", 0, 0);
                zm_hms_util::function_fd24e47f("vox_air_vent_repair", -1, 1);
                break;
            case 3:
                level thread function_85644731();
                level thread function_5be4c9e4(1);
                level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_48d01436dc5c21bb", 0, 0);
                n_variant = randomintrangeinclusive(1, 2);
                zm_hms_util::function_fd24e47f("vox_air_vent_repair", n_variant, 1);
                level thread zm_white_util::function_2389bb7a("zmb_goop_pap_locked");
                break;
            }
        }
        n_current_round = zm_round_logic::get_round_number();
        level.var_154aee78 = n_current_round + 1;
    } else {
        level.var_154aee78 = zm_round_logic::get_round_number() + 1;
    }
    level thread function_751e9580();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xf2f2cd5d, Offset: 0x5000
// Size: 0x8c
function function_85644731() {
    /#
        iprintlnbold("<dev string:x13d>");
    #/
    if (isdefined(level.pack_a_punch)) {
        level.pack_a_punch.trigger_stubs[0].pap_machine flag::wait_till("pap_waiting_for_user");
    }
    level flag::clear("pap_power_ready");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xa0367d04, Offset: 0x5098
// Size: 0xac
function function_1fef0f43() {
    if (!level flag::get(#"hash_1478cafcd626c361") || level flag::get(#"circuit_step_complete")) {
        level thread zm_white_util::function_2389bb7a("zmb_goop_pap_unlocked");
        /#
            iprintlnbold("<dev string:x16c>");
        #/
        level flag::set(#"pap_power_ready");
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xa50f7e5d, Offset: 0x5150
// Size: 0xa0
function function_1605f69a() {
    /#
        iprintlnbold("<dev string:x18b>");
    #/
    foreach (var_5baafbb2 in level.var_76a7ad28) {
        var_5baafbb2 function_d12682c5();
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x5dac472d, Offset: 0x51f8
// Size: 0xe8
function function_94cdb242() {
    if (!level flag::get(#"hash_1478cafcd626c361") || level flag::get(#"circuit_step_complete")) {
        /#
            iprintlnbold("<dev string:x1be>");
        #/
        foreach (var_5baafbb2 in level.var_76a7ad28) {
            var_5baafbb2 function_f6ac524d();
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xec31f535, Offset: 0x52e8
// Size: 0xf8
function function_cd39be3() {
    /#
        iprintlnbold("<dev string:x1e7>");
        iprintlnbold("<dev string:x20e>");
    #/
    var_c718a93c = level zm_white_portals::function_688df525();
    foreach (s_portal in var_c718a93c) {
        s_portal thread zm_white_portals::disable_teleporter();
        s_portal.b_active = 0;
        waitframe(1);
        s_portal thread zm_white_portals::reenable_teleporter();
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x5a9c67e5, Offset: 0x53e8
// Size: 0x118
function function_ab8edf2c() {
    if (!level flag::get(#"hash_1478cafcd626c361") || level flag::get(#"circuit_step_complete")) {
        /#
            iprintlnbold("<dev string:x231>");
        #/
        var_c718a93c = level zm_white_portals::function_688df525();
        foreach (s_portal in var_c718a93c) {
            s_portal.b_active = 1;
            waitframe(1);
            s_portal thread zm_white_portals::reenable_teleporter();
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xb1f0d7af, Offset: 0x5508
// Size: 0x64
function function_8f9249e9() {
    /#
        iprintlnbold("<dev string:x263>");
    #/
    level zm_white_util::function_6f635c39("bunker_power_event_storage");
    level zm_white_util::function_6f635c39("bunker_power_event_solitary");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x13d25a27, Offset: 0x5578
// Size: 0x64
function function_19e428bc() {
    /#
        iprintlnbold("<dev string:x298>");
    #/
    level zm_white_util::function_364cd8c0("bunker_power_event_storage");
    level zm_white_util::function_364cd8c0("bunker_power_event_solitary");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x121906d8, Offset: 0x55e8
// Size: 0x7c
function function_f6ac524d() {
    self zm_perks::function_a30c73b9("on");
    if (isdefined(self.var_a0fc37f6)) {
        self.prompt_and_visibility_func = self.var_a0fc37f6;
        self.var_a0fc37f6 = undefined;
    }
    if (isdefined(self.var_492080a5)) {
        self.trigger_func = self.var_492080a5;
        self.var_492080a5 = undefined;
    }
    zm_unitrigger::reregister_unitrigger(self);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xe84ccb47, Offset: 0x5670
// Size: 0x94
function function_d12682c5() {
    self zm_perks::function_a30c73b9("off");
    if (!isdefined(self.var_a0fc37f6)) {
        self.var_a0fc37f6 = self.prompt_and_visibility_func;
    }
    self.prompt_and_visibility_func = &function_c03c3007;
    if (!isdefined(self.var_492080a5)) {
        self.var_492080a5 = self.trigger_func;
    }
    self.trigger_func = &function_713b8131;
    zm_unitrigger::reregister_unitrigger(self);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x84b16666, Offset: 0x5710
// Size: 0x30
function function_c03c3007(e_player) {
    self sethintstring(#"hash_5f2758a66286e12f");
    return true;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x5969b8f1, Offset: 0x5748
// Size: 0x1e
function function_713b8131(e_player) {
    while (true) {
        waitframe(1);
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x95b9981e, Offset: 0x5770
// Size: 0x2f8
function function_2791c411() {
    level flag::init(#"hash_40856b65dff0f6eb");
    level flag::init(#"hash_639e8274a1b57729");
    level flag::init(#"hash_5cdee936ef283689");
    level.var_ddcd74c6 = &function_f79e10f9;
    s_switch = struct::get("crawler_switch", "targetname");
    wait 1;
    level.var_9c82c58d = 0.2;
    level.var_dc337f29 = getentarray("mask_chamber", "targetname");
    level zm_white_util::function_6f635c39("bunker_power_event_storage");
    level zm_white_util::function_6f635c39("bunker_power_event_solitary");
    level flag::wait_till(#"power_on1");
    level thread function_feab1e8a();
    callback::on_ai_spawned(&function_96c2cbb3);
    var_4aad2831 = getentarray("pre_power_gas", "targetname");
    level thread function_c70d673e(var_4aad2831);
    level exploder::exploder("fxexp_toxic_gas_corridor");
    var_48c6775f = getentarray("green_gas_lg", "targetname");
    level exploder::exploder("fxexp_toxic_gas_bunker");
    if (!(zm_custom::function_901b751c(#"zmpowerdoorstate") == 2 || zm_custom::function_901b751c(#"zmpowerstate") == 2)) {
        level flag::wait_till(#"bunker_beds_to_bunker_power");
    }
    level.var_9808f4d = zombie_utility::get_zombie_var(#"hash_7d5a25e2463f7fc5");
    while (!level flag::get(#"hash_40856b65dff0f6eb")) {
        level function_2330b278();
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x7ea5c85e, Offset: 0x5a70
// Size: 0x5c
function function_feab1e8a() {
    level clientfield::set("" + #"hash_1c11f70bb8445095", 4);
    level.var_7a86ba58 function_ccc74648("string_01");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xd81b0345, Offset: 0x5ad8
// Size: 0x3c
function function_5be4c9e4(var_49c1a8cf) {
    level clientfield::set("" + #"hash_1c11f70bb8445095", var_49c1a8cf);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xd6d6e5de, Offset: 0x5b20
// Size: 0x6c
function function_f79e10f9(e_door) {
    if (e_door.script_flag === "bunker_power_event") {
        e_door sethintstring(#"hash_42a58f21fe6769a4");
        return;
    }
    e_door sethintstring(#"zombie/need_power");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x1e9ea504, Offset: 0x5b98
// Size: 0x5c
function function_71753169(a_s_valid_respawn_points) {
    str_zone = self zm_zonemgr::get_player_zone();
    if (str_zone == "zone_bunker_power_1" || str_zone == "zone_bunker_power_2") {
        a_s_valid_respawn_points = [];
    }
    return a_s_valid_respawn_points;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x88fbab50, Offset: 0x5c00
// Size: 0x5c
function function_8d7b02b0() {
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_4e0bf2b29c38452f", 0, 0);
    level thread zm_hms_util::function_fd24e47f("vox_generator_defend", -1, 1);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 5, eflags: 0x0
// Checksum 0xf3458b1d, Offset: 0x5c68
// Size: 0x2e
function function_75cb64de(event, mod, hit_location, zombie_team, damage_weapon) {
    return false;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 5, eflags: 0x0
// Checksum 0x4d281c65, Offset: 0x5ca0
// Size: 0x30
function function_dba114b7(event, mod, hit_location, zombie_team, damage_weapon) {
    return 10;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x3035cba1, Offset: 0x5cd8
// Size: 0xe7c
function function_2330b278() {
    level endon(#"hash_7ae5a07827985e98");
    s_switch = struct::get("crawler_switch", "targetname");
    s_unitrigger = s_switch zm_unitrigger::create(&function_d4e24379, 64);
    s_switch thread function_748fcb3c();
    level flag::wait_till(#"hash_639e8274a1b57729");
    level.var_72581f75 = [];
    foreach (s_loc in level.zm_loc_types[#"zombie_location"]) {
        if (s_loc.zone_name == #"zone_bunker_power_1" || s_loc.zone_name == #"zone_bunker_power_2") {
            if (!isdefined(level.var_72581f75)) {
                level.var_72581f75 = [];
            } else if (!isarray(level.var_72581f75)) {
                level.var_72581f75 = array(level.var_72581f75);
            }
            level.var_72581f75[level.var_72581f75.size] = s_loc;
        }
    }
    level.var_58eee1ff = [];
    foreach (s_loc in level.zm_loc_types[#"zombie_location"]) {
        if (s_loc.zone_name == #"zone_bunker_power_1" || s_loc.zone_name == #"zone_bunker_power_2") {
            if (s_loc.var_683460c9 === 1) {
                if (!isdefined(level.var_58eee1ff)) {
                    level.var_58eee1ff = [];
                } else if (!isarray(level.var_58eee1ff)) {
                    level.var_58eee1ff = array(level.var_58eee1ff);
                }
                level.var_58eee1ff[level.var_58eee1ff.size] = s_loc;
            }
        }
    }
    level.var_6e616641 = [];
    foreach (s_loc in level.zm_loc_types[#"dog_location"]) {
        if (s_loc.zone_name == #"zone_bunker_power_1" || s_loc.zone_name == #"zone_bunker_power_2") {
            if (!isdefined(level.var_6e616641)) {
                level.var_6e616641 = [];
            } else if (!isarray(level.var_6e616641)) {
                level.var_6e616641 = array(level.var_6e616641);
            }
            level.var_6e616641[level.var_6e616641.size] = s_loc;
        }
    }
    s_switch.s_unitrigger zm_unitrigger::unregister_unitrigger(s_unitrigger);
    while (isdefined(level.intermission) && level.intermission) {
        wait 1;
    }
    exploder::exploder("fxexp_script_power_room_gas_event");
    exploder::exploder("fxexp_script_power_room_gas_event_intermediate");
    level.var_14eba0b3 = 2;
    var_5341234e = getentarray("event_green_gas_lg", "targetname");
    if (var_5341234e.size > 0) {
        foreach (var_530a0f2e in var_5341234e) {
            var_530a0f2e.fx_handle = util::spawn_model("tag_origin", var_530a0f2e.origin);
            var_530a0f2e.fx_handle.angles = var_530a0f2e.angles;
            var_530a0f2e.fx_handle clientfield::set("white_event_gas_lg_vent_clientfield", 1);
        }
    }
    var_cc5e1906 = getentarray("event_green_gas_md", "targetname");
    if (var_cc5e1906.size > 0) {
        foreach (var_530a0f2e in var_cc5e1906) {
            var_530a0f2e.fx_handle = util::spawn_model("tag_origin", var_530a0f2e.origin);
            var_530a0f2e.fx_handle.angles = var_530a0f2e.angles;
            var_530a0f2e.fx_handle clientfield::set("white_event_gas_MD_clientfield", 1);
        }
    }
    level.old_dog_spawn = level.var_819e7dfd[#"zombie_dog"].var_87ed2709;
    level.var_ce4d36df = level.zombie_total;
    level.var_9291cfb3 = #"zombie_dog";
    level.var_819e7dfd[#"zombie_dog"].var_87ed2709 = &function_e2260632;
    level.var_dc22f98 = level.fn_custom_round_ai_spawn;
    level.fn_custom_round_ai_spawn = &function_cc062056;
    level flag::set(#"infinite_round_spawning");
    level flag::set(#"pause_round_timeout");
    level.var_382a24b0 = 1;
    /#
        iprintlnbold("<dev string:x2c9>");
    #/
    playsoundatposition(#"hash_22f33ce72be33eab", (0, -334, -337));
    wait 6;
    exploder::stop_exploder("fxexp_script_power_room_gas_event_intermediate");
    player_is_touching = 0;
    n_touching = 0;
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        foreach (var_7b52a014 in level.var_dc337f29) {
            if (players[i] istouching(var_7b52a014) && !players[i] laststand::player_is_in_laststand()) {
                player_is_touching = 1;
                n_touching += 1;
            }
        }
    }
    if (n_touching < players.size) {
        level function_6acd363d(0);
    }
    level zm_white_util::function_6f635c39("bunker_power_event_beds");
    level zm_white_util::function_6f635c39("bunker_power_event_storage");
    level zm_white_util::function_6f635c39("bunker_power_event_solitary");
    level.var_7a86ba58 function_ccc74648("string_03");
    level.a_func_score_events[#"damage_points"] = &function_75cb64de;
    level.a_func_score_events[#"death"] = &function_dba114b7;
    level thread function_8d7b02b0();
    level.var_e120ae98 = &function_71753169;
    level.var_eeb98313 = &function_71753169;
    level.a_s_portals[#"portal_power"] thread zm_white_portals::disable_teleporter();
    level.a_s_portals[#"portal_power"].b_active = 0;
    waitframe(1);
    level.a_s_portals[#"portal_power"] thread zm_white_portals::reenable_teleporter(0);
    zm_unitrigger::unregister_unitrigger(level.a_s_portals[#"portal_power"].s_unitrigger);
    wait 5;
    if (!(isdefined(level.var_5e45f817) && level.var_5e45f817 || isdefined(level.var_2b94ce72) && level.var_2b94ce72)) {
        foreach (s_spawn in level.var_58eee1ff) {
            level zombie_utility::spawn_zombie(level.nova_crawler_spawner, undefined, s_spawn);
            wait 0.1;
        }
    }
    level.zones[#"zone_bunker_power_1"].adjacent_zones[#"zone_bunker_beds_1"].is_connected = 0;
    level.zones[#"zone_bunker_power_2"].adjacent_zones[#"zone_bunker_beds_2"].is_connected = 0;
    level.var_4a31d48a = 0;
    level.var_f9c3678e = 0;
    zombie_utility::set_zombie_var(#"hash_7d5a25e2463f7fc5", level.var_9808f4d * 0.75);
    /#
        iprintlnbold("<dev string:x2ea>");
    #/
    level thread function_4ea7c90a();
    var_4aad2831 = getentarray("power_room_gas", "targetname");
    level thread function_ec9a1827(var_4aad2831);
    wait 15;
    level.var_9c82c58d = 0.5;
    wait 15;
    /#
        iprintlnbold("<dev string:x303>");
    #/
    level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_56c42fa94656e07b", 0, 0);
    zombie_utility::set_zombie_var(#"hash_7d5a25e2463f7fc5", level.var_9808f4d * 0.5);
    level.var_9c82c58d = 0.8;
    wait 30;
    /#
        iprintlnbold("<dev string:x31a>");
    #/
    level function_6acd363d(1);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x53fe4646, Offset: 0x6b60
// Size: 0x21a
function function_748fcb3c() {
    is_complete = 0;
    while (!is_complete) {
        s_waitresult = self waittill(#"trigger_activated");
        var_5a9db060 = 1;
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            is_touching = 0;
            foreach (var_7b52a014 in level.var_dc337f29) {
                if (players[i] istouching(var_7b52a014) && !players[i] laststand::player_is_in_laststand()) {
                    is_touching = 1;
                }
            }
            if (!is_touching) {
                var_5a9db060 = 0;
            }
        }
        if (var_5a9db060) {
            is_complete = 1;
            level.var_7a86ba58 function_ccc74648("string_02");
            playsoundatposition("evt_gen_terminal_interact", self.origin);
            level.musicsystemoverride = 1;
            music::setmusicstate("generator_defend");
            level flag::set(#"hash_639e8274a1b57729");
            s_switch = struct::get("crawler_switch", "targetname");
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x819b1174, Offset: 0x6d88
// Size: 0x1ba
function function_d4e24379(e_player) {
    var_5a9db060 = 1;
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        is_touching = 0;
        foreach (var_7b52a014 in level.var_dc337f29) {
            if (players[i] istouching(var_7b52a014) && !players[i] laststand::player_is_in_laststand()) {
                is_touching = 1;
            }
        }
        if (!is_touching) {
            var_5a9db060 = 0;
        }
    }
    if (var_5a9db060) {
        if (function_8b1a219a()) {
            self sethintstring(#"hash_276fd5b98fead0c4");
            return 1;
        } else {
            self sethintstring(#"hash_544ec9f3ae2423c8");
            return 1;
        }
        return;
    }
    self sethintstring(#"hash_2101bfc49f49de46");
    return 1;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x4b293f56, Offset: 0x6f50
// Size: 0x96c
function function_6acd363d(is_completed) {
    /#
        if (!is_completed) {
            iprintlnbold("<dev string:x332>");
        }
    #/
    level.var_e120ae98 = undefined;
    level.var_eeb98313 = undefined;
    level.a_s_portals[#"portal_power"] zm_white_portals::function_97d4ad50();
    if (level.a_s_portals[#"portal_power"].b_placed === 1) {
        level.a_s_portals[#"portal_power"].b_active = 1;
        waitframe(1);
        if (level.var_868c98df === 0) {
            level.a_s_portals[#"portal_power"] zm_white_portals::reenable_teleporter();
        }
    }
    level callback::remove_on_ai_spawned(&function_96c2cbb3);
    level flag::clear(#"infinite_round_spawning");
    level flag::clear(#"pause_round_timeout");
    level.var_382a24b0 = undefined;
    level.a_func_score_events[#"damage_points"] = undefined;
    level.a_func_score_events[#"death"] = undefined;
    a_e_enemies = getaiteamarray(level.zombie_team);
    if (a_e_enemies.size > 0) {
        foreach (e_enemy in a_e_enemies) {
            e_enemy zm_score::function_acaab828(1);
        }
    }
    level.fn_custom_round_ai_spawn = level.var_dc22f98;
    level.var_dc22f98 = undefined;
    level.var_819e7dfd[#"zombie_dog"].var_87ed2709 = level.old_dog_spawn;
    zombie_utility::set_zombie_var(#"hash_7d5a25e2463f7fc5", level.var_9808f4d);
    music::setmusicstate("none");
    level.musicsystemoverride = 0;
    level.zombie_total = 0;
    var_5341234e = getentarray("event_green_gas_lg", "targetname");
    foreach (var_530a0f2e in var_5341234e) {
        if (isdefined(var_530a0f2e.fx_handle)) {
            var_530a0f2e.fx_handle delete();
        }
    }
    if (is_completed) {
        level thread zm_white_main_quest::init_clocks();
        level.var_bf802299 = 0;
        level thread callback::on_actor_killed(&function_7ca1064d);
        zm_round_spawning::function_376e51ef(#"nova_crawler", zm_round_logic::get_round_number());
        playsoundatposition(#"hash_70c11b6f27e8119e", (0, -334, -337));
        level.var_7a86ba58 function_ccc74648("string_05");
        level exploder::stop_exploder("fxexp_toxic_gas_corridor");
        var_cc5e1906 = getentarray("event_green_gas_md", "targetname");
        foreach (var_530a0f2e in var_cc5e1906) {
            if (isdefined(var_530a0f2e.fx_handle)) {
                var_530a0f2e.fx_handle delete();
            }
        }
        level flag::set(#"hash_40856b65dff0f6eb");
        exploder::stop_exploder("fxexp_toxic_gas_power_vent");
        wait 1.5;
        level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_45611e2b5750e320", 0, 0);
        wait 1;
        exploder::stop_exploder("fxexp_script_power_room_gas_event");
        level zm_white_util::function_364cd8c0("bunker_power_event_beds");
        zm_zonemgr::enable_zone("zone_bunker_storage");
        zm_zonemgr::enable_zone("zone_bunker_solitary");
        level zm_white_util::function_364cd8c0("bunker_power_event_storage");
        level zm_white_util::function_364cd8c0("bunker_power_event_solitary");
        level flag::set(#"hash_16b68e037e570465");
        level zm_power::turn_power_on_and_open_doors(3);
        level zm_white_util::function_612918d9("bunker_door_solitary_blocker");
        level zm_white_util::function_612918d9("bunker_door_storage_blocker");
        zm_white_util::function_364cd8c0("apd_lockdown");
        zm_white_util::function_f2fa71ce();
        zm_zonemgr::enable_zone("zone_bunker_apd");
        level function_d81c4786();
        level exploder::stop_exploder("fxexp_toxic_gas_bunker");
        return;
    }
    exploder::stop_exploder("fxexp_script_power_room_gas_event");
    level zm_white_util::function_364cd8c0("bunker_power_event_beds");
    zm_zonemgr::enable_zone("zone_bunker_storage");
    zm_zonemgr::enable_zone("zone_bunker_solitary");
    var_4aad2831 = getentarray("power_room_gas", "targetname");
    foreach (var_677ba5c4 in var_4aad2831) {
        var_677ba5c4 notify(#"stop_status_effect");
    }
    level thread function_79f7d595();
    playsoundatposition(#"hash_409e21a8cc122b1f", (0, -334, -337));
    wait 2;
    level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_213e287fc814959d", 0, 0);
    level flag::clear(#"hash_639e8274a1b57729");
    level notify(#"hash_7ae5a07827985e98");
    s_switch = struct::get("crawler_switch", "targetname");
    waitframe(1);
    level.var_7a86ba58 function_ccc74648("string_01");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xdd4d667f, Offset: 0x78c8
// Size: 0xa4
function function_7ca1064d(s_params) {
    if (isplayer(s_params.eattacker) && level.var_bf802299 === 0) {
        level thread zm_powerups::specific_powerup_drop("full_ammo", self.origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        level.var_bf802299 = 1;
        wait 5;
        callback::remove_on_actor_killed(&function_7ca1064d);
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x5773183b, Offset: 0x7978
// Size: 0x3ce
function function_696a0eca() {
    var_e6da0a39 = 0;
    while (level flag::get(#"hash_639e8274a1b57729") && !level flag::get(#"hash_40856b65dff0f6eb")) {
        player_is_touching = 0;
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            foreach (var_7b52a014 in level.var_dc337f29) {
                if (players[i] istouching(var_7b52a014) && !players[i] laststand::player_is_in_laststand()) {
                    player_is_touching = 1;
                    if (var_e6da0a39 > 0) {
                        level.var_7a86ba58 function_ccc74648("string_03");
                    }
                    var_e6da0a39 = 0;
                }
            }
        }
        if (!player_is_touching) {
            switch (var_e6da0a39) {
            case 0:
                level.var_8200dc81 zm_hms_util::function_6a0d675d(#"hash_737e2502279778f5", 0, 0);
                level.var_7a86ba58 function_ccc74648("strong_04");
                break;
            case 1:
                level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_737e23022797758f", 0, 0);
                break;
            case 2:
                level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_737e2202279773dc", 0, 0);
                break;
            case 3:
                level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_737e210227977229", 0, 0);
                break;
            case 4:
                level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_737e200227977076", 0, 0);
                break;
            case 5:
                level.var_8200dc81 thread zm_hms_util::function_6a0d675d(#"hash_737e1f0227976ec3", 0, 0);
                break;
            }
            var_e6da0a39 += 1;
            if (var_e6da0a39 > 5) {
                level function_6acd363d(0);
            }
            /#
                if (var_e6da0a39 < 5) {
                    n_time_remaining = 5 - var_e6da0a39;
                    iprintlnbold("<dev string:x350>" + n_time_remaining + "<dev string:x36f>");
                }
            #/
        }
        wait 1;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xcace608f, Offset: 0x7d50
// Size: 0x2d2
function function_d39f2f3e() {
    var_619e4cd6 = zm_zonemgr::get_players_in_zone(#"zone_bunker_power_1");
    var_619e4cd6 += zm_zonemgr::get_players_in_zone(#"zone_bunker_power_2");
    var_6bfcea24 = level.activeplayers.size - var_619e4cd6;
    var_619e4cd6 *= 2;
    var_fdf44034 = var_619e4cd6 + var_6bfcea24;
    var_29c6d263 = var_619e4cd6 / var_fdf44034;
    s_spawn_loc = array::random(level.zm_loc_types[#"dog_location"]);
    if (var_6bfcea24 > 0) {
        a_s_spawns = [];
        foreach (s_spawn in level.zm_loc_types[#"dog_location"]) {
            if (s_spawn.zone_name != #"zone_bunker_power_1" && s_spawn.zone_name != #"zone_bunker_power_2") {
                if (!isdefined(a_s_spawns)) {
                    a_s_spawns = [];
                } else if (!isarray(a_s_spawns)) {
                    a_s_spawns = array(a_s_spawns);
                }
                if (!isinarray(a_s_spawns, s_spawn)) {
                    a_s_spawns[a_s_spawns.size] = s_spawn;
                }
            }
        }
        if (a_s_spawns.size > 0) {
            s_spawn_loc = array::random(a_s_spawns);
        } else {
            s_spawn_loc = array::random(level.zm_loc_types[#"dog_location"]);
        }
    }
    n_chance = randomfloat(1);
    if (n_chance <= var_29c6d263 && level.var_6e616641.size > 0) {
        s_spawn_loc = array::random(level.var_6e616641);
    }
    return s_spawn_loc;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x91635083, Offset: 0x8030
// Size: 0x36a
function function_cc0dec67() {
    var_619e4cd6 = 0;
    foreach (e_player in level.players) {
        if (e_player.zone_name === #"zone_bunker_power_1" || e_player.zone_name === #"zone_bunker_power_2") {
            var_619e4cd6 += 1;
        }
    }
    var_6bfcea24 = level.activeplayers.size - var_619e4cd6;
    var_619e4cd6 *= 2;
    var_fdf44034 = var_619e4cd6 + var_6bfcea24;
    var_29c6d263 = var_619e4cd6 / var_fdf44034;
    s_spawn_loc = array::random(level.zm_loc_types[#"zombie_location"]);
    if (var_6bfcea24 > 0) {
        a_s_spawns = [];
        foreach (s_spawn in level.zm_loc_types[#"zombie_location"]) {
            if (s_spawn.zone_name != #"zone_bunker_power_1" && s_spawn.zone_name != #"zone_bunker_power_2") {
                if (!isdefined(a_s_spawns)) {
                    a_s_spawns = [];
                } else if (!isarray(a_s_spawns)) {
                    a_s_spawns = array(a_s_spawns);
                }
                if (!isinarray(a_s_spawns, s_spawn)) {
                    a_s_spawns[a_s_spawns.size] = s_spawn;
                }
            }
        }
        if (a_s_spawns.size > 0) {
            s_spawn_loc = array::random(a_s_spawns);
        } else {
            s_spawn_loc = array::random(level.zm_loc_types[#"zombie_location"]);
        }
    }
    s_spawn_loc.in_power = 0;
    n_chance = randomfloat(1);
    if (n_chance <= var_29c6d263 && level.var_72581f75.size > 0 || level.var_14eba0b3 > 0) {
        s_spawn_loc = array::random(level.var_72581f75);
        s_spawn_loc.in_power = 1;
    }
    return s_spawn_loc;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x9037c48d, Offset: 0x83a8
// Size: 0x1ea
function function_428035a() {
    s_spawn_point = level function_cc0dec67();
    var_3b8ab239 = randomfloat(1);
    if (level.var_14eba0b3 > 0) {
        var_3b8ab239 = 0;
    }
    if (var_3b8ab239 < 0.33 && s_spawn_point.in_power === 1 && !(isdefined(level.var_5e45f817) && level.var_5e45f817 || isdefined(level.var_2b94ce72) && level.var_2b94ce72)) {
        var_b912d513 = arraycombine(zm_zonemgr::get_players_in_zone(#"zone_bunker_power_1", 1), zm_zonemgr::get_players_in_zone(#"zone_bunker_power_2", 1), 0, 0);
        target_player = array::random(var_b912d513);
        if (isdefined(target_player)) {
            ai = function_ff73da7f(target_player);
            if (isdefined(ai) && level.var_14eba0b3 > 0) {
                level.var_14eba0b3 -= 1;
            }
        }
    } else {
        ai = zombie_utility::spawn_zombie(getentarray("zombie_spawner", "script_noteworthy")[0], undefined, s_spawn_point);
    }
    return ai;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xeafe1933, Offset: 0x85a0
// Size: 0x5c
function function_cc062056() {
    ai = level function_428035a();
    wait zm_round_logic::get_zombie_spawn_delay(zm_round_logic::get_round_number());
    if (isdefined(ai)) {
        return true;
    }
    return false;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xd54ad6e6, Offset: 0x8608
// Size: 0xfa
function function_e2260632() {
    if (level.var_9291cfb3 === #"zombie_dog" || level.var_ce4d36df <= 0) {
        level.var_9291cfb3 = #"zombie";
        ai = level function_428035a();
    } else {
        ai = zombie_dog_util::function_62db7b1c(0, level function_d39f2f3e());
        level.var_9291cfb3 = #"zombie_dog";
        if (isdefined(ai)) {
            level.var_ce4d36df -= 1;
        }
    }
    if (isdefined(ai)) {
        level.zombie_total += 1;
    }
    return ai;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x5c1a6f06, Offset: 0x8710
// Size: 0xc4
function function_96c2cbb3() {
    waitframe(2);
    if (self.archetype === #"zombie" && level flag::get(#"hash_639e8274a1b57729") && !level flag::get(#"hash_40856b65dff0f6eb") && level.var_14eba0b3 <= 0) {
        if (randomfloat(1) > level.var_9c82c58d) {
            self zm_ai_white_nova_crawler::function_850768d1();
        }
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x9aedbe4d, Offset: 0x87e0
// Size: 0x130
function function_c70d673e(var_4aad2831) {
    foreach (var_677ba5c4 in var_4aad2831) {
        var_677ba5c4 thread function_130bfe4();
    }
    level flag::wait_till(#"hash_40856b65dff0f6eb");
    foreach (var_677ba5c4 in var_4aad2831) {
        if (isdefined(var_677ba5c4)) {
            var_677ba5c4 delete();
        }
        exploder::exploder("fxexp_ground_fog_bunker_on");
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xe0195027, Offset: 0x8918
// Size: 0x140
function function_ec9a1827(var_4aad2831) {
    self notify("138d9059508423a7");
    self endon("138d9059508423a7");
    foreach (var_677ba5c4 in var_4aad2831) {
        var_677ba5c4 thread function_130bfe4();
    }
    level flag::wait_till(#"hash_40856b65dff0f6eb");
    foreach (var_677ba5c4 in var_4aad2831) {
        var_677ba5c4 delete();
        exploder::exploder("fxexp_ground_fog_bunker_on");
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x4
// Checksum 0x94b6184e, Offset: 0x8a60
// Size: 0x140
function private function_130bfe4() {
    self endon(#"death", #"stop_status_effect");
    while (true) {
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (players[i] istouching(self)) {
                players[i] status_effect::status_effect_apply(getstatuseffect(#"zm_white_nova_gas"), undefined, players[i], 1);
                if (!isdefined(level.var_8a15167f)) {
                    players[i] thread zm_hms_util::function_51b752a9("vox_nova_gas_encounter", -1, 1);
                    level.var_8a15167f = 1;
                }
            }
        }
        wait 0.15;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x8073e858, Offset: 0x8ba8
// Size: 0xd8
function function_4ea7c90a() {
    var_936b6ed5 = getentarray("power_room_fan", "targetname");
    exploder::exploder("fxexp_toxic_gas_power_vent");
    level flag::set(#"hash_5cdee936ef283689");
    foreach (var_e6ad66ce in var_936b6ed5) {
        var_e6ad66ce thread power_room_fan_control();
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xb11ff6f5, Offset: 0x8c88
// Size: 0x64
function function_79f7d595() {
    var_936b6ed5 = getentarray("power_room_fan", "targetname");
    exploder::stop_exploder("fxexp_toxic_gas_power_vent");
    level flag::clear(#"hash_5cdee936ef283689");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xfb92756, Offset: 0x8cf8
// Size: 0x24
function function_217e3c0f() {
    level flag::clear(#"hash_5cdee936ef283689");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xa7ea8c80, Offset: 0x8d28
// Size: 0x24
function function_4b72fed8() {
    level flag::set(#"hash_5cdee936ef283689");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x5536f31, Offset: 0x8d58
// Size: 0xb4
function function_3fc75ca6() {
    s_generator = struct::get("main_generator", "targetname");
    s_generator thread scene::play("shot 1");
    level flag::wait_till(#"hash_639e8274a1b57729");
    wait 5;
    s_generator thread scene::play("shot 2");
    level clientfield::set("generator_sound_sweetner", 1);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x7f7093e9, Offset: 0x8e18
// Size: 0x164
function power_room_fan_control() {
    self endon(#"death");
    var_8ada9d = -720;
    var_f63ac386 = 2;
    var_e03da92 = 10;
    level flag::wait_till(#"hash_5cdee936ef283689");
    self rotatevelocity((0, 0, var_8ada9d), var_f63ac386, var_f63ac386, 0);
    self playloopsound(#"hash_3c2abf1f67d713e4");
    wait var_f63ac386;
    while (level flag::get(#"hash_5cdee936ef283689")) {
        self rotatevelocity((0, 0, var_8ada9d), 1);
        wait 1;
    }
    self rotatevelocity((0, 0, var_8ada9d), var_e03da92, 0, var_e03da92);
    self stoploopsound();
    self power_room_fan_control();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x2eae45ee, Offset: 0x8f88
// Size: 0x52
function function_f3f325cb(var_148cc603) {
    if (isdefined(level.var_5e45f817) && level.var_5e45f817) {
        return 0;
    }
    return int(0.1 * level.var_38b15968);
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x853afc55, Offset: 0x8fe8
// Size: 0x32e
function function_b448360c() {
    a_s_spawn_locs = level.zm_loc_types[#"dog_location"];
    if (!isdefined(a_s_spawn_locs) || a_s_spawn_locs.size < 1) {
        return false;
    }
    var_905a9429 = [];
    var_51fb0ec7 = [];
    e_target = zm_hms_util::function_3815943c();
    if (isplayer(self.last_closest_player)) {
        e_target = self.last_closest_player;
    }
    if (!isdefined(e_target)) {
        return false;
    }
    foreach (loc in a_s_spawn_locs) {
        sqr_dist = distancesquared(loc.origin, e_target.origin);
        if (sqr_dist < 9000000) {
            if (sqr_dist > 250000) {
                if (!isdefined(var_51fb0ec7)) {
                    var_51fb0ec7 = [];
                } else if (!isarray(var_51fb0ec7)) {
                    var_51fb0ec7 = array(var_51fb0ec7);
                }
                var_51fb0ec7[var_51fb0ec7.size] = loc;
                continue;
            }
            if (sqr_dist > 10000) {
                if (!isdefined(var_905a9429)) {
                    var_905a9429 = [];
                } else if (!isarray(var_905a9429)) {
                    var_905a9429 = array(var_905a9429);
                }
                var_905a9429[var_905a9429.size] = loc;
            }
        }
    }
    if (var_905a9429.size < 3) {
        var_905a9429 = arraycombine(var_905a9429, var_51fb0ec7, 0, 0);
    }
    s_spawn_loc = array::random(var_905a9429);
    if (!isdefined(s_spawn_loc)) {
        return false;
    }
    if (isentity(self)) {
        self zm_ai_utility::function_a8dc3363(s_spawn_loc);
        self ghost();
        b_teleported = s_spawn_loc function_13f107c4(self, s_spawn_loc);
        if (isdefined(b_teleported) && !b_teleported) {
            return false;
        }
    }
    if (isdefined(self.var_b421bafe) && self.var_b421bafe) {
        function_c33d4387();
        self.var_b421bafe = 0;
        self.no_powerups = 0;
    }
    return true;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x4
// Checksum 0x14a01c82, Offset: 0x9320
// Size: 0x36
function private function_c33d4387() {
    if (isdefined(self.var_3fc4c097)) {
        self.var_3fc4c097 thread function_46aa5dda();
        self.var_3fc4c097 = undefined;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x4
// Checksum 0xae06b06f, Offset: 0x9360
// Size: 0x26
function private function_46aa5dda() {
    wait randomfloatrange(4, 5);
    self.is_claimed = undefined;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x93dfd97f, Offset: 0x9390
// Size: 0x4be
function function_a409c2a7(e_target) {
    if (namespace_df88241c::function_4748fb49() >= namespace_df88241c::function_59257d57()) {
        return undefined;
    }
    if (isdefined(level.zm_loc_types[#"dog_location"]) && level.zm_loc_types[#"dog_location"].size > 0) {
        var_d45dac2a = e_target zm_zonemgr::get_player_zone();
        if (!isdefined(var_d45dac2a)) {
            return undefined;
        }
        target_zone = level.zones[var_d45dac2a];
        adj_zone_names = getarraykeys(target_zone.adjacent_zones);
        var_2057a8c1 = array(target_zone.name);
        foreach (zone_name in adj_zone_names) {
            if (target_zone.adjacent_zones[zone_name].is_connected) {
                if (!isdefined(var_2057a8c1)) {
                    var_2057a8c1 = [];
                } else if (!isarray(var_2057a8c1)) {
                    var_2057a8c1 = array(var_2057a8c1);
                }
                var_2057a8c1[var_2057a8c1.size] = level.zones[zone_name].name;
            }
        }
        var_905a9429 = [];
        var_51fb0ec7 = [];
        foreach (loc in level.zm_loc_types[#"dog_location"]) {
            if (array::contains(var_2057a8c1, loc.zone_name)) {
                sqr_dist = distancesquared(loc.origin, e_target.origin);
                if (sqr_dist < 9000000) {
                    if (sqr_dist > 250000) {
                        if (!isdefined(var_905a9429)) {
                            var_905a9429 = [];
                        } else if (!isarray(var_905a9429)) {
                            var_905a9429 = array(var_905a9429);
                        }
                        var_905a9429[var_905a9429.size] = loc;
                        continue;
                    }
                    if (sqr_dist > 10000) {
                        if (!isdefined(var_51fb0ec7)) {
                            var_51fb0ec7 = [];
                        } else if (!isarray(var_51fb0ec7)) {
                            var_51fb0ec7 = array(var_51fb0ec7);
                        }
                        var_51fb0ec7[var_51fb0ec7.size] = loc;
                    }
                }
            }
        }
        if (var_905a9429.size < 3) {
            var_905a9429 = arraycombine(var_905a9429, var_51fb0ec7, 0, 0);
        }
        s_spawn_loc = array::random(var_905a9429);
    }
    if (!isdefined(s_spawn_loc)) {
        return undefined;
    }
    ai = zombie_utility::spawn_zombie(level.ranged_nova_crawler_spawner);
    if (isdefined(ai)) {
        ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai thread zombie_utility::round_spawn_failsafe();
        ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
        ai ghost();
        s_spawn_loc thread function_13f107c4(ai, s_spawn_loc);
        ai.favoriteenemy = e_target;
    }
    return ai;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0xe4e57420, Offset: 0x9858
// Size: 0x444
function function_45bb11e4(spot) {
    self endoncallback(&zm_spawner::function_fe3cb19a, #"death");
    self.var_5535a47d = 1;
    self zm_spawner::function_fe3cb19a();
    self.mdl_anchor = util::spawn_model("tag_origin", self.origin, self.angles);
    self ghost();
    if (!isdefined(spot.angles)) {
        spot.angles = (0, 0, 0);
    }
    self.mdl_anchor moveto(spot.origin, 0.05);
    self.mdl_anchor rotateto(spot.angles, 0.05);
    self.mdl_anchor waittill(#"movedone", #"death");
    waitframe(1);
    self.create_eyes = 1;
    self show();
    if (!isdefined(self.var_9ed3cc11)) {
        self.var_9ed3cc11 = self function_e827fc0e();
    }
    self pushplayer(1);
    e_align = isdefined(self.mdl_anchor) ? self.mdl_anchor : spot;
    if (self.archetype == #"nova_crawler") {
        if (isinarray(scene::get_all_shot_names(spot.scriptbundlename), "nova_crawler")) {
            e_align scene::play(spot.scriptbundlename, "nova_crawler", self);
        } else {
            e_align scene::play(spot.scriptbundlename, self);
        }
    } else if (isdefined(self.has_legs) && !self.has_legs || isdefined(self.missing_legs) && self.missing_legs) {
        if (isinarray(scene::get_all_shot_names(spot.scriptbundlename), "crawler")) {
            e_align scene::play(spot.scriptbundlename, "crawler", self);
        } else {
            e_align scene::play(spot.scriptbundlename, self);
        }
    } else if (isinarray(scene::get_all_shot_names(spot.scriptbundlename), "default")) {
        e_align scene::play(spot.scriptbundlename, "default", self);
    } else {
        e_align scene::play(spot.scriptbundlename, self);
    }
    if (isdefined(self.var_9ed3cc11)) {
        self pushplayer(self.var_9ed3cc11);
        self.var_9ed3cc11 = undefined;
    }
    self.var_5535a47d = 0;
    self thread zm_spawner::function_2d97cae1();
    self notify(#"risen", spot.script_string);
    self zm_spawner::zombie_complete_emerging_into_playable_area();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x57dbf0e7, Offset: 0x9ca8
// Size: 0x5c0
function function_ff73da7f(e_target) {
    if (namespace_df88241c::function_4748fb49() >= namespace_df88241c::function_59257d57()) {
        return undefined;
    }
    var_a887d6e1 = [];
    if (isdefined(level.zm_loc_types[#"crawl"]) && isdefined(level.zm_loc_types[#"sniper_location"])) {
        a_locs = arraycombine(level.zm_loc_types[#"crawl"], level.zm_loc_types[#"sniper_location"], 0, 0);
        foreach (loc in a_locs) {
            if (loc.var_683460c9) {
                if (!isdefined(var_a887d6e1)) {
                    var_a887d6e1 = [];
                } else if (!isarray(var_a887d6e1)) {
                    var_a887d6e1 = array(var_a887d6e1);
                }
                var_a887d6e1[var_a887d6e1.size] = loc;
            }
        }
    }
    if (var_a887d6e1.size > 0) {
        var_d45dac2a = e_target zm_zonemgr::get_player_zone();
        if (!isdefined(var_d45dac2a)) {
            return undefined;
        }
        target_zone = level.zones[var_d45dac2a];
        adj_zone_names = getarraykeys(target_zone.adjacent_zones);
        var_2057a8c1 = array(target_zone.name);
        foreach (zone_name in adj_zone_names) {
            if (target_zone.adjacent_zones[zone_name].is_connected) {
                if (!isdefined(var_2057a8c1)) {
                    var_2057a8c1 = [];
                } else if (!isarray(var_2057a8c1)) {
                    var_2057a8c1 = array(var_2057a8c1);
                }
                var_2057a8c1[var_2057a8c1.size] = level.zones[zone_name].name;
            }
        }
        var_905a9429 = [];
        var_51fb0ec7 = [];
        foreach (loc in var_a887d6e1) {
            if (array::contains(var_2057a8c1, loc.zone_name)) {
                if (!isdefined(var_905a9429)) {
                    var_905a9429 = [];
                } else if (!isarray(var_905a9429)) {
                    var_905a9429 = array(var_905a9429);
                }
                var_905a9429[var_905a9429.size] = loc;
            }
        }
        s_spawn_loc = array::random(var_905a9429);
    }
    if (!isdefined(s_spawn_loc) || isdefined(s_spawn_loc.var_2901f207) && s_spawn_loc.var_2901f207 && !level flag::get(#"hash_1643995c3d7501b0")) {
        return undefined;
    }
    if (isdefined(s_spawn_loc.var_2901f207) && s_spawn_loc.var_2901f207) {
        ai = zombie_utility::spawn_zombie(level.ranged_nova_crawler_spawner);
    } else {
        ai = zombie_utility::spawn_zombie(level.nova_crawler_spawner);
    }
    if (isdefined(ai)) {
        ai.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai thread zombie_utility::round_spawn_failsafe();
        if (isdefined(s_spawn_loc.var_11ef3e6e) && s_spawn_loc.var_11ef3e6e) {
            ai forceteleport(s_spawn_loc.origin, s_spawn_loc.angles);
        } else {
            ai thread function_45bb11e4(s_spawn_loc);
        }
        ai.favoriteenemy = e_target;
        if (isdefined(s_spawn_loc.var_11ef3e6e) && s_spawn_loc.var_11ef3e6e) {
            ai zm_ai_white_nova_crawler::function_dc0238e4();
        }
    }
    return ai;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 2, eflags: 0x0
// Checksum 0x43b1644b, Offset: 0xa270
// Size: 0x260
function function_13f107c4(ai, ent) {
    ai endon(#"death");
    ai val::set(#"crawler_spawn", "allowdeath", 0);
    ai setfreecameralockonallowed(0);
    waitframe(1);
    ai clientfield::increment("crawler_portal_spawn_fx");
    playsoundatposition(#"evt_teleporter_go", ent.origin);
    if (isdefined(ai.favoriteenemy)) {
        angle = vectortoangles(ai.favoriteenemy.origin - ent.origin);
        angles = (ai.angles[0], angle[1], ai.angles[2]);
    } else {
        angles = ent.angles;
    }
    ai dontinterpolate();
    ai forceteleport(ent.origin, angles);
    if (isdefined(ai) && isalive(ai)) {
        ai val::reset(#"crawler_spawn", "allowdeath");
        wait 0.1;
        ai show();
        ai setfreecameralockonallowed(1);
        ai val::reset(#"crawler_spawn", "ignoreme");
        ai notify(#"spawn_complete");
        ai notify(#"visible");
        return true;
    }
    return false;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xd536bfc5, Offset: 0xa4d8
// Size: 0x110
function function_dd836251() {
    e_target = namespace_df88241c::function_a5abd591();
    if (!isdefined(e_target)) {
        return undefined;
    }
    ai = function_ff73da7f(e_target);
    if (isdefined(ai)) {
        if (level.round_number < 10) {
            ai zombie_utility::set_zombie_run_cycle("run");
        } else if (level.round_number < 15) {
            if (math::cointoss(66)) {
                ai zombie_utility::set_zombie_run_cycle("run");
            } else {
                ai zombie_utility::set_zombie_run_cycle("sprint");
            }
        } else {
            ai zombie_utility::set_zombie_run_cycle("sprint");
        }
    }
    return ai;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x2b11f79a, Offset: 0xa5f0
// Size: 0x3c
function crawler_round_spawn() {
    ai = function_dd836251();
    if (isdefined(ai)) {
        level.zombie_total--;
        return true;
    }
    return false;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xd834d02e, Offset: 0xa638
// Size: 0x16c
function function_75309b09() {
    ai = undefined;
    e_target = namespace_df88241c::function_a5abd591();
    sniper_location = zm_ai_white_nova_crawler::function_51e81aba(level.white_nova_crawler_sniper_locations);
    if (math::cointoss(33) && isdefined(sniper_location)) {
        n_to_spawn = level.zm_loc_types[#"sniper_location"].size;
        s_loc = array::random(level.zm_loc_types[#"sniper_location"]);
        ai = zombie_utility::spawn_zombie(level.ranged_nova_crawler_spawner);
        if (isdefined(ai)) {
            ai zm_ai_white_nova_crawler::function_dc0238e4();
            ai forceteleport(s_loc.origin, s_loc.angles);
        }
    } else if (isdefined(e_target)) {
        ai = function_a409c2a7(e_target);
    }
    if (isdefined(ai)) {
        return 1;
    }
    return 0;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x54db0acb, Offset: 0xa7b0
// Size: 0xca
function function_39caf8c7() {
    var_52f17dc9 = getentarray("soul_goo", "targetname");
    if (level.var_b085d90f < 28) {
        foreach (cannister in var_52f17dc9) {
            cannister function_dd7cd488();
        }
        level.var_b085d90f += 1;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xec11328, Offset: 0xa888
// Size: 0x42
function function_dd7cd488() {
    var_a573a0b5 = self.origin[2];
    self movez(1, 1);
    wait 1;
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xcd1bcb95, Offset: 0xa8d8
// Size: 0xe4
function function_14121764() {
    self.scene_ents[#"gas_vent_machine"].fx_tag = util::spawn_model("tag_origin", self.scene_ents[#"gas_vent_machine"].origin);
    self.scene_ents[#"gas_vent_machine"].fx_tag.angles = self.scene_ents[#"gas_vent_machine"].angles;
    playfxontag("maps/zm_white/fx8_toxic_gas_vent_machine", self.scene_ents[#"gas_vent_machine"].fx_tag, "tag_origin");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xec072cf8, Offset: 0xa9c8
// Size: 0x8c
function function_dddf8a79() {
    if (!isdefined(self.scene_ents[#"gas_vent_machine"])) {
        return undefined;
    }
    if (!isdefined(self.scene_ents[#"gas_vent_machine"].fx_tag)) {
        return undefined;
    }
    self.scene_ents[#"gas_vent_machine"].fx_tag delete();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xd8269f60, Offset: 0xaa60
// Size: 0x84
function function_c58562f9() {
    self scene::play("init");
    self.scene_ents[#"gas_vent_machine"] hidepart("tag_light_red");
    self.scene_ents[#"gas_vent_machine"] showpart("tag_light_green");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xe6612391, Offset: 0xaaf0
// Size: 0x9c
function function_b21c0682() {
    self thread scene::play("start_goop");
    self.scene_ents[#"gas_vent_machine"] showpart("tag_light_red");
    self.scene_ents[#"gas_vent_machine"] hidepart("tag_light_green");
    self function_14121764();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xe0acf32d, Offset: 0xab98
// Size: 0x3c
function function_d225557a() {
    self thread scene::play("gauge_00");
    self function_14121764();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xc5788c1d, Offset: 0xabe0
// Size: 0x44
function function_75c79cc8() {
    self scene::stop("gauge_00");
    self thread scene::play("gauge_01");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x2f0e154f, Offset: 0xac30
// Size: 0x44
function function_791ea376() {
    self scene::stop("gauge_01");
    self thread scene::play("gauge_02");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x9178de8f, Offset: 0xac80
// Size: 0x44
function function_523ad5af() {
    self scene::stop("gauge_02");
    self thread scene::play("gauge_03");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x9d7063f2, Offset: 0xacd0
// Size: 0x44
function function_6374f823() {
    self scene::stop("gauge_03");
    self thread scene::play("gauge_04");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x54ed1f08, Offset: 0xad20
// Size: 0x44
function function_aecd0ed6() {
    self scene::stop("gauge_04");
    self thread scene::play("gauge_05");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x469ffaf8, Offset: 0xad70
// Size: 0x44
function function_d20c5554() {
    self scene::stop("gauge_05");
    self thread scene::play("gauge_06");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x35f48a8f, Offset: 0xadc0
// Size: 0x44
function function_8b5047d9() {
    self scene::stop("gauge_06");
    self thread scene::play("gauge_07");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x151eb040, Offset: 0xae10
// Size: 0x44
function function_9c8e6a55() {
    self scene::stop("gauge_07");
    self thread scene::play("gauge_08");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x14f9fb04, Offset: 0xae60
// Size: 0x44
function function_f8f62327() {
    self scene::stop("gauge_08");
    self thread scene::play("gauge_09");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xfc8e0ae8, Offset: 0xaeb0
// Size: 0xbc
function function_38fa21c2() {
    self scene::stop("gauge_09");
    self thread scene::play("gauge_10");
    self.scene_ents[#"gas_vent_machine"] hidepart("tag_light_red");
    self.scene_ents[#"gas_vent_machine"] showpart("tag_light_green");
    self function_dddf8a79();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x44a1236d, Offset: 0xaf78
// Size: 0xb4
function function_470af002() {
    self scene::stop();
    self thread scene::play("regoop");
    self.scene_ents[#"gas_vent_machine"] showpart("tag_light_red");
    self.scene_ents[#"gas_vent_machine"] hidepart("tag_light_green");
    self function_14121764();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x7072a7fe, Offset: 0xb038
// Size: 0xb4
function function_ff5c24a8() {
    self scene::stop();
    self scene::play("stopped");
    self.scene_ents[#"gas_vent_machine"] hidepart("tag_light_red");
    self.scene_ents[#"gas_vent_machine"] hidepart("tag_light_green");
    self function_dddf8a79();
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x3c25b783, Offset: 0xb0f8
// Size: 0x262
function function_ccc74648(var_f9dc3b9d) {
    switch (var_f9dc3b9d) {
    case #"string_01":
        self function_1bce0fd();
        self showpart("tag_string_01");
        exploder::exploder("fxexp_script_power_room_monitor_red");
        break;
    case #"string_02":
        self function_1bce0fd();
        self showpart("tag_string_02");
        exploder::exploder("fxexp_script_power_room_monitor_yellow");
        break;
    case #"string_03":
        self function_1bce0fd();
        self showpart("tag_string_03");
        exploder::exploder("fxexp_script_power_room_monitor_white");
        break;
    case #"string_04":
        self function_1bce0fd();
        self showpart("tag_string_04");
        exploder::exploder("fxexp_script_power_room_monitor_red");
        break;
    case #"string_05":
        self function_1bce0fd();
        self showpart("tag_string_05");
        exploder::exploder("fxexp_script_power_room_monitor_yellow");
        break;
    case #"string_06":
        self function_1bce0fd();
        self showpart("tag_string_06");
        exploder::exploder("fxexp_script_power_room_monitor_green");
        break;
    }
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x11655225, Offset: 0xb368
// Size: 0x124
function function_1bce0fd() {
    self hidepart("tag_string_01");
    self hidepart("tag_string_02");
    self hidepart("tag_string_03");
    self hidepart("tag_string_04");
    self hidepart("tag_string_05");
    self hidepart("tag_string_06");
    exploder::stop_exploder("fxexp_script_power_room_monitor_red");
    exploder::stop_exploder("fxexp_script_power_room_monitor_white");
    exploder::stop_exploder("fxexp_script_power_room_monitor_yellow");
    exploder::stop_exploder("fxexp_script_power_room_monitor_green");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x18d36701, Offset: 0xb498
// Size: 0x2e
function function_cb3e8fb9() {
    level.var_7a86ba58 = getent("vent_screen", "targetname");
}

// Namespace zm_white_special_rounds/zm_white_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x4b670847, Offset: 0xb4d0
// Size: 0xfe
function function_3698d819() {
    while (true) {
        level.var_7a86ba58 function_ccc74648("string_01");
        wait 10;
        level.var_7a86ba58 function_ccc74648("string_02");
        wait 10;
        level.var_7a86ba58 function_ccc74648("string_03");
        wait 10;
        level.var_7a86ba58 function_ccc74648("string_04");
        wait 10;
        level.var_7a86ba58 function_ccc74648("string_05");
        wait 10;
        level.var_7a86ba58 function_ccc74648("string_06");
        wait 10;
    }
}

