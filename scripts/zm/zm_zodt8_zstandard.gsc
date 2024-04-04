// Atian COD Tools GSC decompiler test
#using scripts\zm\ai\zm_ai_stoker.gsc;
#using scripts\zm\zm_zodt8.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm\zm_zodt8_pap_quest.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_utility_zstandard.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_fasttravel.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_crafting.gsc;
#using scripts\zm_common\zm_challenges.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\callbacks.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_zodt8_zstandard;

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x7902ba29, Offset: 0x3c0
// Size: 0x14
function main() {
    init_level_vars();
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x546c555e, Offset: 0x3e0
// Size: 0x234
function init_level_vars() {
    function_edd5bb1a();
    function_ac904e5e();
    level thread init_pack_a_punch();
    level.fn_custom_round_ai_spawn = undefined;
    level callback::function_74872db6(&function_74872db6);
    level.var_3f86fd35 = 13;
    level.var_d7853f35 = 23;
    level.var_ecdf38f = 15;
    level.var_55e562f9 = 12;
    level.zombie_hints[#"default_treasure_chest"] = #"hash_57a34375dddce337";
    level thread zm_blockers::function_6f01c3cf("forecastle_window_l", "script_string", 0);
    level thread zm_blockers::function_6f01c3cf("forecastle_window_r", "script_string", 0);
    level thread zm_blockers::function_6f01c3cf("forecastle_window_front", "script_string", 0);
    level thread defend_areas();
    zm_round_spawning::function_2876740e(#"stoker", &function_c3b9a076);
    zm_round_spawning::function_2876740e(#"blight_father", &function_30cd3df);
    zm_round_spawning::function_2876740e(#"catalyst", &function_dbf2f421);
    level thread zm_crafting::function_ca244624(#"hash_6f259b259997271a");
    callback::on_spawned(&function_944ac830);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xd0e3687a, Offset: 0x620
// Size: 0xa0
function function_944ac830() {
    self endon(#"death");
    level endon(#"end_game");
    while (true) {
        level waittill(#"started_defend_area");
        level waittill(#"hash_7a04a7fb98fa4e4d");
        if (isalive(self)) {
            self zm_challenges::function_979f4cc0(#"hash_7a406e363a7db141");
        }
    }
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x60891a84, Offset: 0x6c8
// Size: 0x10
function function_dbf2f421(n_max) {
    return n_max;
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x306d42f3, Offset: 0x6e0
// Size: 0x10
function function_30cd3df(n_max) {
    return 3;
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x540c6ac5, Offset: 0x6f8
// Size: 0x34
function function_c3b9a076(n_max) {
    if (!(isdefined(level.var_531d5f99) && level.var_531d5f99)) {
        return 0;
    }
    return 3;
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x64278d01, Offset: 0x738
// Size: 0x8e
function init_pack_a_punch() {
    level flag::wait_till("start_zombie_round_logic");
    for (var_f6f7a368 = 0; var_f6f7a368 < level.s_pap_quest.a_s_locations.size; var_f6f7a368++) {
        level.s_pap_quest.var_4ee2e2ab = var_f6f7a368;
        zodt8_pap_quest::function_9e015223();
    }
    level.var_fea7bdae = 1;
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xb3882964, Offset: 0x7d0
// Size: 0x7e
function function_74872db6() {
    if (level.round_number <= 7) {
        level.var_18d20774 = 250000;
        level.registertheater_fxanim_kill_trigger_centerterminatetraverse = 250000;
        return;
    }
    level.var_2e3a6cbe = undefined;
    level.var_d614a8b4 = undefined;
    level.var_11f7a9af = undefined;
    level.var_18d20774 = undefined;
    level.registertheater_fxanim_kill_trigger_centerterminatetraverse = undefined;
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x27da1dde, Offset: 0x858
// Size: 0x24
function function_cb0be2c5(n_round_number) {
    zm_ai_stoker::spawn_single(1);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xabbc6dde, Offset: 0x888
// Size: 0x2c
function intro_blight_father(n_round_number) {
    zm_transform::function_bdd8aba6(#"blight_father");
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x638c486f, Offset: 0x8c0
// Size: 0x8c
function function_52498131(var_edb0b1c5 = 5) {
    level notify(#"stop_pap_force_stream_0");
    level clientfield::set("pap_force_stream", 1);
    level util::delay(var_edb0b1c5, "stop_pap_force_stream_0", &clientfield::set, "pap_force_stream", 0);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xeffc792e, Offset: 0x958
// Size: 0x744
function defend_areas() {
    level endon(#"end_game");
    function_84139b27();
    level flag::wait_till("start_zombie_round_logic");
    zm_utility::enable_power_switch(0);
    /#
        if (getdvarint(#"hash_b3363e1d25715d7", 0)) {
            function_52498131();
            zm_utility::enable_power_switch(1, 1);
            level function_1dcc39ae();
            return;
        }
    #/
    zm_utility::function_fdb0368(3);
    str_next_defend = array::random(array(#"lounge", #"dining_hall"));
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    str_first_defend = str_next_defend;
    if (str_next_defend == #"dining_hall") {
        level zm_utility::open_door("forecastle_state_rooms_door", undefined, undefined, 1);
        zm_utility::function_fdb0368(5);
        level zm_utility::open_door("state_rooms_to_lower_stairs_door", undefined, undefined, 1);
        zm_utility::function_fdb0368(7);
        level zm_utility::open_door("grand_stair_lower_to_dining", undefined, undefined, 1);
    } else {
        level zm_utility::open_door("state_rooms_bridge_door", undefined, undefined, 1);
        zm_utility::function_fdb0368(5);
        level zm_utility::open_door("bridge_to_upper_stairs_door", undefined, undefined, 1);
        zm_utility::function_fdb0368(7);
        level zm_utility::open_door("grand_stairs_suites_door", undefined, undefined, 1);
    }
    util::delay(4, undefined, &zm_utility::function_11101458, str_next_defend);
    wait(15);
    zm_zonemgr::function_8caa21df(s_defend_area.a_str_zones);
    zm_round_spawning::function_306ce518(#"stoker", &function_cb0be2c5);
    var_cec10eb3 = 20;
    level thread zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, var_cec10eb3);
    level flag::wait_till("started_defend_area");
    level util::delay(var_cec10eb3 / 4, "end_game", &zm_round_spawning::function_376e51ef, #"stoker");
    level waittill(#"hash_7a04a7fb98fa4e4d");
    zm_utility::function_fef4b36a(str_next_defend);
    if (str_next_defend == #"dining_hall") {
        level zm_utility::open_door(array("dining_to_promenade_door", "promenade_aft_door"), undefined, 15, 1);
    } else {
        level zm_utility::open_door(array("suites_promenade_door", "library_boat_deck_door"), undefined, 15, 1);
    }
    function_52498131("started_defend_area");
    str_next_defend = #"poop_deck";
    s_defend_area = zm_utility::function_a877cd10(str_next_defend);
    util::delay(4, undefined, &zm_utility::function_11101458, #"poop_deck");
    zm_zonemgr::zone_wait_till_enabled("zone_poop_deck");
    level waittill(#"end_of_round");
    zm_round_spawning::function_306ce518(#"blight_father", &intro_blight_father);
    level thread zm_utility::function_33798535(s_defend_area.var_39c44288, s_defend_area.a_str_zones, s_defend_area.var_ed1db1a7, undefined, undefined, 45);
    level flag::wait_till("started_defend_area");
    level util::delay(4, "end_game", &zm_round_spawning::function_376e51ef, #"blight_father");
    level waittill(#"hash_7a04a7fb98fa4e4d");
    level.var_531d5f99 = 1;
    zm_utility::enable_power_switch(1, 1);
    if (str_first_defend == #"dining_hall") {
        var_420e4589 = array("suites_promenade_door", "library_boat_deck_door", "state_rooms_bridge_door", "bridge_to_upper_stairs_door", "grand_stairs_suites_door");
    } else {
        var_420e4589 = array("dining_to_promenade_door", "promenade_aft_door", "forecastle_state_rooms_door", "state_rooms_to_lower_stairs_door", "grand_stair_lower_to_dining");
    }
    level zm_utility::open_door(var_420e4589, undefined, 15, 1);
    function_466fb0ff();
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xaea96384, Offset: 0x10a8
// Size: 0x774
function function_84139b27() {
    zm_utility::function_c492c4d6(#"poop_deck", #"hash_82cab1897c803b8", array(#"zone_poop_deck"), array(#"engine_room", #"lounge", #"dining_hall", #"boat_deck"), #"hash_419e018f0a0f07fe", #"hash_5f80d9ba2fc090a");
    zm_utility::function_c492c4d6(#"lounge", #"hash_18944a1360325a74", array(#"zone_lounge"), array(#"engine_room", #"poop_deck", #"cargo_hold", #"bridge"), #"hash_40ba277929e49516", #"hash_2bed1c6d7afa4192");
    zm_utility::function_c492c4d6(#"dining_hall", #"hash_7ab52512f34acbe3", array(#"zone_dining_hall_fore", #"zone_dining_hall_aft"), array(#"poop_deck", #"engine_room", #"cargo_hold", #"forecastle"), #"hash_8a9d3480015e78b", #"hash_6bdaac7090cd4985");
    zm_utility::function_c492c4d6(#"boat_deck", #"hash_3d0f15229df3eca2", array(#"zone_fore_deck"), array(#"bridge", #"engine_room", #"poop_deck", #"forecastle"), #"hash_7ed3d98c25f1502a", #"hash_4b2d803f03300036");
    zm_utility::function_c492c4d6(#"forecastle", #"hash_4ceaaaca5eeb762e", array(#"zone_forecastle_lower", #"zone_forecastle_upper"), array(#"cargo_hold", #"bridge", #"boat_deck", #"dining_hall"), #"hash_27ad030950415bce", #"hash_fc714290197baba");
    zm_utility::function_c492c4d6(#"engine_room", #"hash_1c2b2651f9ae026e", array(#"zone_upper_engine_room", #"zone_engine"), array(#"poop_deck", #"boat_deck", #"lounge", #"dining_hall"), #"hash_1f86bdff7abc4240", #"hash_7b8e9ff889f16cb0");
    zm_utility::function_c492c4d6(#"cargo_hold", #"hash_59db20fe9332d7f8", array(#"zone_cargo"), array(#"forecastle", #"lounge", #"dining_hall", #"bridge"), #"hash_380fd44f5294766c", #"hash_49f3092df33c779c");
    zm_utility::function_c492c4d6(#"bridge", #"hash_69b6ed066e710bd1", array(#"zone_bridge"), array(#"forecastle", #"cargo_hold", #"boat_deck", #"lounge"), #"hash_a3060fdfbbfdadb", #"hash_705b2c8817bf3775");
    a_str_keys = getarraykeys(level.a_s_defend_areas);
    foreach (s_defend_area in level.a_s_defend_areas) {
        foreach (str_index in s_defend_area.a_str_next_defend) {
            str_index = hash(str_index);
            assert(isinarray(a_str_keys, str_index), str_index + "<unknown string>");
        }
    }
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x750f9c86, Offset: 0x1828
// Size: 0x1ba
function function_466fb0ff() {
    level endon(#"end_game");
    str_next_defend = zm_utility::function_40ef77ab(#"poop_deck");
    var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend);
    var_55a36349 = 1;
    while (true) {
        zm_utility::function_11101458(str_next_defend);
        if (str_next_defend == #"engine_room") {
            level thread zm_utility::open_door(array("engine_room_door", "engine_room_dropdown"), undefined, 10);
        } else if (str_next_defend == #"cargo_hold") {
            level thread zm_utility::open_door("cargo_hold_door", undefined, 10);
        }
        wait(45);
        zm_zonemgr::function_8caa21df(var_679cd7a8.a_str_zones);
        zm_utility::function_33798535(var_679cd7a8.var_39c44288, var_679cd7a8.a_str_zones, var_679cd7a8.var_ed1db1a7);
        var_55a36349 = 0;
        str_previous_defend = str_next_defend;
        str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
        var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend);
    }
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x0
// Checksum 0x64b29b4, Offset: 0x19f0
// Size: 0x114
function function_aba6e63f() {
    /#
        level flag::wait_till("<unknown string>");
        player = util::gethostplayer();
        player util::waittill_stance_button_pressed();
        zm_utility::function_92162963("<unknown string>");
        wait(0.5);
        player util::waittill_stance_button_pressed();
        zm_utility::function_92162963("<unknown string>");
        wait(0.5);
        player util::waittill_stance_button_pressed();
        zm_utility::function_92162963("<unknown string>");
        wait(0.5);
        player util::waittill_stance_button_pressed();
        zm_utility::function_92162963("<unknown string>");
    #/
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x0
// Checksum 0x24039e20, Offset: 0x1b10
// Size: 0x112
function function_1dcc39ae() {
    /#
        wait(5);
        str_next_defend = zm_utility::function_40ef77ab("<unknown string>");
        var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend);
        zm_utility::enable_power_switch(1, 1);
        while (true) {
            zm_utility::function_11101458(str_next_defend);
            wait(5);
            zm_utility::function_33798535(var_679cd7a8.var_39c44288, var_679cd7a8.a_str_zones, var_679cd7a8.var_ed1db1a7, undefined, undefined, 3);
            str_previous_defend = str_next_defend;
            str_next_defend = zm_utility::function_40ef77ab(str_next_defend);
            var_679cd7a8 = zm_utility::function_a877cd10(str_next_defend);
        }
    #/
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 2, eflags: 0x0
// Checksum 0x79e4a39d, Offset: 0x1c30
// Size: 0x376
function function_c52e8ba(player, var_8d5d092c) {
    b_result = 0;
    if (isdefined(self.stub)) {
        str_loc = self.stub.script_string;
    }
    if (!isdefined(self.hint_string)) {
        self.hint_string = [];
    }
    n_player_index = player getentitynumber();
    if (level flag::get(#"disable_fast_travel")) {
        self.hint_string[n_player_index] = #"hash_91829275c00db24";
    } else if (!(isdefined(player zombie_utility::is_player_valid(player)) && player zombie_utility::is_player_valid(player))) {
        self.hint_string[n_player_index] = #"";
    } else if (isdefined(player.var_564dec14) && player.var_564dec14) {
        self.hint_string[n_player_index] = #"";
    } else if (!level flag::get("power_on")) {
        self.hint_string[n_player_index] = #"";
    } else if (isdefined(player.var_16735873) && player.var_16735873 && str_loc != "dropout") {
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
    } else {
        self.hint_string[n_player_index] = #"hash_204ec88c63b3436b";
        b_result = 1;
    }
    return b_result;
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0xca554966, Offset: 0x1fb0
// Size: 0x3c
function function_edd5bb1a() {
    if (zm_utility::function_e37823df()) {
        zm_utility::function_6df718d(#"hash_6db3dde314ca084", 0);
    }
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x1 linked
// Checksum 0x1f1c8dff, Offset: 0x1ff8
// Size: 0x3ec
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
    var_a535d72c = 16;
    for (n_round = 18; n_round < 255; n_round++) {
        zm_utility::function_742f2c18(n_round, #"zombie", undefined, var_a535d72c);
        var_a535d72c++;
        var_a535d72c = math::clamp(var_a535d72c, 16, 24);
    }
    zm_round_spawning::function_306ce518(#"stoker", &function_e361bbf7);
    zm_round_spawning::function_306ce518(#"catalyst", &function_40dfd00b);
    zm_round_spawning::function_306ce518(#"blight_father", &function_dcf7377c);
    zm_round_spawning::function_cc103b38(#"catalyst", 4);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x8f548f06, Offset: 0x23f0
// Size: 0x34
function function_e361bbf7(n_round_number) {
    zm_utility::function_9b7bc715(#"stoker", 1);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0xb6c5a7fb, Offset: 0x2430
// Size: 0x34
function function_40dfd00b(n_round_number) {
    zm_utility::function_9b7bc715(#"catalyst", 1);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 1, eflags: 0x1 linked
// Checksum 0x82428c08, Offset: 0x2470
// Size: 0x34
function function_dcf7377c(n_round_number) {
    zm_utility::function_9b7bc715(#"blight_father", 1);
}

// Namespace zm_zodt8_zstandard/zm_zodt8_zstandard
// Params 0, eflags: 0x0
// Checksum 0x4ab4095f, Offset: 0x24b0
// Size: 0x2f8
function function_a18a0aba() {
    level endon(#"end_game");
    while (true) {
        s_waitresult = level waittill(#"hash_4ffec9c5f552e6fc");
        if (isdefined(s_waitresult.e_door) && isdefined(s_waitresult.e_door.script_flag)) {
            switch (s_waitresult.e_door.script_flag) {
            case #"connect_forecastle_to_state_rooms":
                var_ff20f7d3 = #"hash_2b0a7eea7d5837b2";
                break;
            case #"connect_forecastle_to_bridge":
                var_ff20f7d3 = #"hash_1164f7d8857e245";
                break;
            case #"connect_state_rooms_to_millionaire":
                var_ff20f7d3 = #"hash_655f56d5efd95945";
                break;
            case #"connect_grand_stair_lower_to_dining":
                var_ff20f7d3 = #"hash_aea2910160f712a";
                break;
            case #"connect_dining_to_promenade":
                var_ff20f7d3 = #"hash_7e2ebfe7b5099a2e";
                break;
            case #"connect_promenade_to_poop":
                var_ff20f7d3 = #"hash_34b52b88e2ff0049";
                break;
            case #"connect_aft_to_poop_deck":
                var_ff20f7d3 = #"hash_1970bc2b9acd5bf5";
                break;
            case #"connect_suites_to_aft":
                var_ff20f7d3 = #"hash_2bc3fbaefaa3b764";
                break;
            case #"connect_grand_stairs_to_lounge":
                var_ff20f7d3 = #"hash_334ff5daed081f31";
                break;
            case #"connect_bridge_to_grand_stairs":
                var_ff20f7d3 = #"hash_7f462ab50be41252";
                break;
            case #"connect_mail_rooms_to_cargo":
                var_ff20f7d3 = #"hash_25929136eae0e6ae";
                break;
            case #"connect_provisions_to_engine_room":
                var_ff20f7d3 = #"hash_a8d366608b42172";
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

