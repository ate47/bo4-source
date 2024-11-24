#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_hud;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_red_zones;

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x53d3a3f0, Offset: 0x8d8
// Size: 0x54
function init() {
    callback::on_spawned(&on_player_spawned);
    level.var_6129f460 = &function_a929cb60;
    level thread cliff_forge_vo();
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xdad41f91, Offset: 0x938
// Size: 0xa4
function cliff_forge_vo() {
    level flag::wait_till(#"hash_7943879f3be8ccc6");
    for (a_players = function_6645d04c(); a_players.size == 0; a_players = function_6645d04c()) {
        wait 1.6;
    }
    e_player = array::random(a_players);
    e_player zm_vo::function_a2bd5a0c("vox_cliff_forge_enter");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x9e28879, Offset: 0x9e8
// Size: 0x214
function function_6645d04c() {
    a_players = [];
    a_str_locations = array("bridge", "center", "forge", "lower", "upper");
    foreach (str_location in a_str_locations) {
        var_1a34f5a1 = zm_zonemgr::get_players_in_zone("zone_cliff_tombs_" + str_location, 1);
        a_players = arraycombine(a_players, var_1a34f5a1, 0, 0);
    }
    if (a_players.size > 0) {
        a_players_copy = arraycopy(a_players);
        s_vo = struct::get("cliff_forge_vo");
        foreach (player in a_players) {
            n_dist_sq = distance2dsquared(s_vo.origin, player.origin);
            if (n_dist_sq > 1245456) {
                arrayremovevalue(a_players_copy, player);
            }
        }
        a_players = a_players_copy;
    }
    return a_players;
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xbc94697f, Offset: 0xc08
// Size: 0xb6c
function zone_init() {
    level flag::init(#"hash_4083e9da0ba41dec");
    level flag::init("always_on");
    level flag::set("always_on");
    zm_zonemgr::zone_init("zone_temple_of_apollo");
    zm_zonemgr::enable_zone("zone_temple_of_apollo");
    zm_zonemgr::add_adjacent_zone("zone_temple_of_apollo", "zone_temple_of_apollo_left_path", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_temple_of_apollo", "zone_temple_of_apollo_right_path", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_temple_of_apollo_back", "zone_temple_of_apollo_left_path", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_temple_of_apollo_back", "zone_temple_of_apollo_right_path", "always_on", 0);
    zm_zonemgr::add_adjacent_zone("zone_temple_of_apollo", "zone_eastern_plaza", "connect_apollo_temple_to_eastern_plaza", 0);
    zm_zonemgr::add_adjacent_zone("zone_temple_of_apollo_back", "zone_western_plaza", "connect_apollo_temple_to_western_plaza", 0);
    zm_zonemgr::add_adjacent_zone("zone_western_plaza", "zone_monument_of_craterus_lower", "connect_western_plaza_to_monument_of_craterus", 0);
    zm_zonemgr::add_adjacent_zone("zone_monument_of_craterus_lower", "zone_monument_of_craterus_upper", #"hash_3f18050bb3c7e61", 0);
    zm_zonemgr::add_adjacent_zone("zone_eastern_plaza", "zone_upper_road_east", "connect_eastern_plaza_to_upper_road", 0);
    zm_zonemgr::add_adjacent_zone("zone_upper_road_east", "zone_upper_road_west", #"hash_1a0eac015c92f665", 0);
    zm_zonemgr::add_adjacent_zone("zone_portico", "zone_upper_road_east", #"hash_38ace2856b88126", 0);
    zm_zonemgr::add_adjacent_zone("zone_portico", "zone_upper_road_west", #"hash_38ace2856b88126", 0);
    zm_zonemgr::add_adjacent_zone("zone_portico", "zone_amphitheater_backstage", #"hash_38ace2856b88126", 0);
    zm_zonemgr::add_adjacent_zone("zone_upper_road_west", "zone_amphitheater_backstage", "connect_amphitheater_backstage_to_stage", 0);
    zm_zonemgr::add_adjacent_zone("zone_monument_of_craterus_upper", "zone_amphitheater_backstage", "connect_amphitheater_backstage_to_stage", 0);
    zm_zonemgr::add_adjacent_zone("zone_amphitheater_backstage", "zone_amphitheater", "connect_amphitheater_backstage_to_stage", 0);
    zm_zonemgr::add_adjacent_zone("zone_amphitheater", "zone_amphitheater_house", "connect_amphitheater_backstage_to_stage", 0);
    zm_zonemgr::add_adjacent_zone("zone_eastern_plaza", "zone_offering", "connect_eastern_plaza_to_temple_terrace", 0);
    zm_zonemgr::add_adjacent_zone("zone_offering", "zone_temple_to_stoa_of_the_athenians", #"hash_6d71447c1ac2346a", 0);
    zm_zonemgr::add_adjacent_zone("zone_offering", "zone_temple_to_stoa_of_the_athenians", #"hash_319f89db9006c766", 0);
    zm_zonemgr::add_adjacent_zone("zone_western_plaza", "zone_bathhouse_outside", "connect_western_plaza_to_bathhouse_upper", 0);
    zm_zonemgr::add_adjacent_zone("zone_bathhouse_outside", "zone_bathhouse_inside", #"hash_30a65b6467b61895", 0);
    zm_zonemgr::add_adjacent_zone("zone_intersection_of_treasuries_upper", "zone_bathhouse_inside", #"hash_72cec88da65c292d", 0);
    zm_zonemgr::add_adjacent_zone("zone_intersection_of_treasuries_upper", "zone_bathhouse_inside", #"hash_17525acf356976a1", 0);
    zm_zonemgr::add_adjacent_zone("zone_intersection_of_treasuries_lower", "zone_spartan_east_to_treasuries", "connect_spartan_to_treasuries", 0);
    zm_zonemgr::add_adjacent_zone("zone_intersection_of_treasuries_lower", "zone_stoa_of_the_athenians_west", "connect_stoa_of_athenians_to_treasuries", 0);
    zm_zonemgr::add_adjacent_zone("zone_intersection_of_treasuries_lower", "zone_intersection_of_treasuries_upper", #"connect_treasuries_zones", 0);
    zm_zonemgr::add_adjacent_zone("zone_stoa_of_the_athenians_east", "zone_temple_to_stoa_of_the_athenians", #"hash_6d71447c1ac2346a", 0);
    zm_zonemgr::add_adjacent_zone("zone_stoa_of_the_athenians_east", "zone_temple_to_stoa_of_the_athenians", #"hash_319f89db9006c766", 0);
    zm_zonemgr::add_adjacent_zone("zone_stoa_of_the_athenians_east", "zone_stoa_of_athenians_to_spartan_upper", "connect_stoa_of_athenians_to_spartan", 0);
    zm_zonemgr::add_adjacent_zone("zone_stoa_of_the_athenians_east", "zone_stoa_of_the_athenians_west", #"hash_1aab354ddc20d771", 0);
    zm_zonemgr::add_adjacent_zone("zone_stoa_of_athenians_to_spartan_upper", "zone_spartan_monument_upper", "connect_stoa_of_athenians_to_spartan", 0);
    zm_zonemgr::add_adjacent_zone("zone_spartan_monument_west", "zone_spartan_east_to_treasuries", "connect_spartan_to_treasuries", 0);
    zm_zonemgr::add_adjacent_zone("zone_spartan_monument_east", "zone_spartan_monument_upper", #"hash_cfcbf5509bfbc1b", 0);
    zm_zonemgr::add_adjacent_zone("zone_spartan_monument_east", "zone_spartan_monument_west", #"hash_cfcbf5509bfbc1b", 0);
    zm_zonemgr::add_adjacent_zone("zone_spartan_monument_upper", "zone_spartan_monument_west", #"hash_cfcbf5509bfbc1b", 0);
    zm_zonemgr::add_adjacent_zone("zone_river_upper", "zone_river_lower", #"hash_4083e9da0ba41dec", 0);
    zm_zonemgr::add_adjacent_zone("zone_river_lower", "zone_cliff_tombs_upper", "connect_river_acheron_to_cliff_tombs", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_upper", "zone_cliff_tombs_forge", #"hash_50fc2fecaeb1c1dc", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_upper", "zone_cliff_tombs_center", #"hash_50fc2fecaeb1c1dc", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_center", "zone_cliff_tombs_lower", #"hash_50fc2fecaeb1c1dc", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_forge", "zone_cliff_tombs_center", #"hash_50fc2fecaeb1c1dc", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_center", "zone_cliff_tombs_lower", #"hash_50fc2fecaeb1c1dc", 0);
    zm_zonemgr::add_adjacent_zone("zone_river_lower", "zone_serpent_pass_upper", "connect_river_acheron_to_serpents_pass", 0);
    zm_zonemgr::add_adjacent_zone("zone_serpent_pass_center", "zone_serpent_pass_upper", #"hash_4a15e7198e29ab9", 0);
    zm_zonemgr::add_adjacent_zone("zone_serpent_pass_lower", "zone_serpent_pass_center", #"hash_4a15e7198e29ab9", 0);
    zm_zonemgr::add_adjacent_zone("zone_serpent_pass_lower", "zone_drakaina_arena", "connect_serpents_pass_to_drakaina_arena", 0);
    zm_zonemgr::add_adjacent_zone("zone_serpent_pass_bridge", "zone_drakaina_arena", "connect_serpents_pass_to_drakaina_arena", 0);
    zm_zonemgr::add_adjacent_zone("zone_serpent_pass_lower", "zone_serpent_pass_bridge", "connect_serpents_pass_to_drakaina_arena", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_lower", "zone_drakaina_arena", "connect_cliff_tombs_to_drakaina_arena", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_bridge", "zone_drakaina_arena", "connect_cliff_tombs_to_drakaina_arena", 0);
    zm_zonemgr::add_adjacent_zone("zone_cliff_tombs_bridge", "zone_cliff_tombs_lower", "connect_cliff_tombs_to_drakaina_arena", 0);
    zm_zonemgr::zone_init("zone_ww_quest_earth");
    zm_zonemgr::zone_init("zone_ww_quest_death");
    zm_zonemgr::zone_init("zone_ww_quest_light");
    zm_zonemgr::zone_init("zone_ww_quest_air");
    zm_zonemgr::zone_init("zone_boss_plateau_1");
    zm_zonemgr::zone_init("zone_boss_plateau_2");
    zm_zonemgr::zone_init("zone_boss_plateau_3");
    a_t_doors = getentarray("zombie_door", "targetname");
    level thread function_9391e6d6();
    level thread function_74c5dbb7();
    level thread connect_treasuries_zones();
    level thread function_8b43360c();
    level thread function_8eefbadf();
    level thread function_ca0c498e();
    level thread function_4d9690d7();
    level thread function_d0ace4cc();
    level thread function_918814d();
    level thread function_f313d1de();
    level thread function_3a6d6af1();
    level thread function_3335487f();
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x1feca423, Offset: 0x1780
// Size: 0x84
function function_9391e6d6() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array("connect_eastern_plaza_to_upper_road", "connect_amphitheater_backstage_to_stage"));
    level flag::set(#"hash_1a0eac015c92f665");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xfda7ce7f, Offset: 0x1810
// Size: 0x8c
function function_74c5dbb7() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array(#"hash_72cec88da65c292d", "connect_western_plaza_to_bathhouse_upper"));
    level flag::set(#"hash_30a65b6467b61895");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x495266f9, Offset: 0x18a8
// Size: 0x94
function connect_treasuries_zones() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array("connect_stoa_of_athenians_to_treasuries", "connect_spartan_to_treasuries", #"hash_17525acf356976a1"));
    level flag::set(#"connect_treasuries_zones");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x90876b8b, Offset: 0x1948
// Size: 0x94
function function_8b43360c() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array(#"hash_6d71447c1ac2346a", "connect_stoa_of_athenians_to_treasuries", "connect_stoa_of_athenians_to_spartan"));
    level flag::set(#"hash_1aab354ddc20d771");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x225b59db, Offset: 0x19e8
// Size: 0x84
function function_4d9690d7() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array("connect_stoa_of_athenians_to_spartan", "connect_spartan_to_treasuries"));
    level flag::set(#"hash_cfcbf5509bfbc1b");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xfe66603d, Offset: 0x1a78
// Size: 0x84
function function_8eefbadf() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array("connect_river_acheron_to_cliff_tombs", "connect_cliff_tombs_to_drakaina_arena"));
    level flag::set(#"hash_50fc2fecaeb1c1dc");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x7eaaaa50, Offset: 0x1b08
// Size: 0x84
function function_ca0c498e() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array("connect_serpents_pass_to_drakaina_arena", "connect_river_acheron_to_serpents_pass"));
    level flag::set(#"hash_4a15e7198e29ab9");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xc5c05c13, Offset: 0x1b98
// Size: 0x84
function function_d0ace4cc() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till_any(array("connect_western_plaza_to_monument_of_craterus", "connect_amphitheater_backstage_to_stage"));
    level flag::set(#"hash_3f18050bb3c7e61");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x56a73f2b, Offset: 0x1c28
// Size: 0x94
function function_f313d1de() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till("power_bathhouse_to_treasuries");
    level flag::wait_till("connect_western_plaza_to_bathhouse_upper");
    level flag::set(#"hash_17525acf356976a1");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xafa472e8, Offset: 0x1cc8
// Size: 0xa4
function function_918814d() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till("power_bathhouse_to_treasuries");
    level flag::wait_till_any(array("connect_stoa_of_athenians_to_treasuries", "connect_spartan_to_treasuries"));
    level flag::set(#"hash_72cec88da65c292d");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xd5e424e9, Offset: 0x1d78
// Size: 0x94
function function_3a6d6af1() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till("power_offering_to_stoa");
    level flag::wait_till("connect_eastern_plaza_to_temple_terrace");
    level flag::set(#"hash_6d71447c1ac2346a");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xc53a7e29, Offset: 0x1e18
// Size: 0xa4
function function_3335487f() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till("power_offering_to_stoa");
    level flag::wait_till_any(array("connect_stoa_of_athenians_to_treasuries", "connect_stoa_of_athenians_to_spartan"));
    level flag::set(#"hash_319f89db9006c766");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xd3f4bf8d, Offset: 0x1ec8
// Size: 0x44
function on_player_spawned() {
    self endon(#"death");
    self thread function_8e0b371();
    self thread function_17ac86f7();
}

// Namespace zm_red_zones/zm_red_zones
// Params 1, eflags: 0x1 linked
// Checksum 0xe0f36fde, Offset: 0x1f18
// Size: 0xb4
function function_a929cb60(s_spot) {
    if (isdefined(s_spot.var_4e469313) && s_spot.var_4e469313) {
        self thread hide_pop();
        str_anim = #"ai_t8_zombie_traverse_ground_dugup";
    } else {
        str_anim = #"ai_zombie_base_traverse_ground_climbout_fast";
    }
    self animscripted("rise_anim", self.origin, s_spot.angles, str_anim, "normal");
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x7a092b90, Offset: 0x1fd8
// Size: 0x3c
function hide_pop() {
    self endon(#"death");
    wait 0.1;
    if (isdefined(self)) {
        self show();
    }
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0x80df38eb, Offset: 0x2020
// Size: 0xb8
function function_8e0b371() {
    self endon(#"disconnect");
    while (true) {
        if (isalive(self)) {
            str_location = function_ab7f70b9(self);
            self zm_hud::function_29780fb5(isdefined(str_location) ? str_location : #"");
        } else {
            self zm_hud::function_29780fb5(#"");
        }
        wait 0.5;
    }
}

// Namespace zm_red_zones/zm_red_zones
// Params 1, eflags: 0x1 linked
// Checksum 0x8fae6807, Offset: 0x20e0
// Size: 0x5a
function function_ab7f70b9(e_player) {
    str_zone = e_player zm_zonemgr::get_player_zone();
    if (!isdefined(str_zone)) {
        return undefined;
    }
    str_display = function_27028b8e(str_zone);
    return str_display;
}

// Namespace zm_red_zones/zm_red_zones
// Params 1, eflags: 0x1 linked
// Checksum 0xa297fc94, Offset: 0x2148
// Size: 0x5c8
function function_27028b8e(str_zone) {
    if (!isdefined(str_zone)) {
        return undefined;
    }
    if (!isdefined(level.var_ed58a4e6)) {
        level.var_ed58a4e6 = [];
    }
    switch (str_zone) {
    case #"zone_amphitheater":
        str_display = #"hash_654702bdca18105";
        break;
    case #"zone_amphitheater_backstage":
        str_display = #"hash_10a873392c5d4565";
        break;
    case #"zone_cliff_tombs_lower":
    case #"zone_cliff_tombs_forge":
    case #"zone_cliff_tombs_center":
    case #"zone_cliff_tombs_bridge":
    case #"zone_cliff_tombs_upper":
        str_display = #"hash_50916c74fe22e63b";
        break;
    case #"zone_drakaina_arena":
        str_display = #"hash_78d4c8eb48aabd66";
        break;
    case #"zone_eastern_plaza":
        str_display = #"hash_65a67d1c5af364c7";
        break;
    case #"zone_bathhouse_outside":
    case #"zone_bathhouse_inside":
        str_display = #"hash_27a6b15e094c02f1";
        break;
    case #"zone_spartan_east_to_treasuries":
    case #"zone_intersection_of_treasuries_upper":
    case #"zone_intersection_of_treasuries_lower":
        str_display = #"hash_4785d4d350f36326";
        break;
    case #"zone_monument_of_craterus_lower":
    case #"zone_monument_of_craterus_upper":
        str_display = #"hash_70363674b3e9a47c";
        break;
    case #"zone_river_lower":
    case #"zone_river_upper":
        str_display = #"hash_3a319fea8f608182";
        break;
    case #"zone_serpent_pass_upper":
    case #"zone_serpent_pass_bridge":
    case #"zone_serpent_pass_center":
    case #"zone_serpent_pass_lower":
        str_display = #"hash_4f55839413fe0046";
        break;
    case #"zone_stoa_of_athenians_to_spartan_upper":
    case #"zone_spartan_monument_west":
    case #"zone_spartan_monument_east":
    case #"zone_spartan_monument_upper":
        str_display = #"hash_303ce0aa4cf6a23e";
        break;
    case #"zone_stoa_of_the_athenians_east":
    case #"zone_stoa_of_the_athenians_west":
        str_display = #"hash_12a9743a3b9f2236";
        break;
    case #"zone_temple_to_stoa_of_the_athenians":
        str_display = #"hash_2910970920dd3ee3";
        break;
    case #"zone_temple_of_apollo_left_path":
    case #"zone_temple_of_apollo_right_path":
    case #"zone_temple_of_apollo_back":
    case #"zone_temple_of_apollo":
        str_display = #"hash_106d425e41e8c240";
        break;
    case #"zone_offering":
        str_display = #"hash_6268d50ff53b29d4";
        break;
    case #"zone_upper_road_west":
    case #"zone_upper_road_east":
    case #"zone_portico":
        str_display = #"hash_32a859886bcbfb10";
        break;
    case #"zone_western_plaza":
        str_display = #"hash_187fe3987a160b42";
        break;
    case #"zone_boss_plateau_1":
        str_display = #"hash_63b3c5fb5611240f";
        break;
    case #"zone_boss_plateau_2":
        str_display = #"hash_63b3c4fb5611225c";
        break;
    case #"zone_boss_plateau_3":
        str_display = #"hash_63b3c6fb561125c2";
        break;
    case #"zone_ww_quest_earth":
        str_display = #"hash_4903463b3bfd1f8f";
        break;
    case #"zone_ww_quest_death":
        str_display = #"hash_77ea88b9440ad045";
        break;
    case #"zone_ww_quest_light":
        str_display = #"hash_5e05f18694a561c7";
        break;
    case #"zone_ww_quest_air":
        str_display = #"hash_286cefa4bc6e994f";
        break;
    default:
        str_display = undefined;
        break;
    }
    if (isdefined(str_display) && !array::contains(level.var_ed58a4e6, str_display)) {
        array::add(level.var_ed58a4e6, str_display, 0);
    }
    return str_display;
}

// Namespace zm_red_zones/zm_red_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xc748afd9, Offset: 0x2718
// Size: 0x23c
function function_17ac86f7() {
    self thread zm_audio::function_713192b1(#"hash_187fe3987a160b42", #"market");
    self thread zm_audio::function_713192b1(#"hash_70363674b3e9a47c", #"hash_237b36f7aeb1a896");
    self thread zm_audio::function_713192b1(#"hash_6268d50ff53b29d4", #"hash_4576fb3345db827b");
    self thread zm_audio::function_713192b1(#"hash_27a6b15e094c02f1", #"bathhouse");
    self thread zm_audio::function_713192b1(#"hash_4785d4d350f36326", #"treasur");
    self thread zm_audio::function_713192b1(#"hash_12a9743a3b9f2236", #"hash_2d65510066aca8d");
    self thread zm_audio::function_713192b1(#"hash_303ce0aa4cf6a23e", #"hash_1b3475683eff03ae");
    self thread function_f7a190a8(undefined, 60, #"hash_106d425e41e8c240", #"temp_apollo");
    self thread function_f7a190a8(#"hash_3dba794053dea40e", 60, #"hash_654702bdca18105", #"amphi");
    self thread zm_audio::function_713192b1(#"hash_4f55839413fe0046", #"hash_185c7ca2794dd39");
    self thread function_f7a190a8(#"pap_quest_completed", 30, #"hash_78d4c8eb48aabd66", #"center_world");
}

// Namespace zm_red_zones/zm_red_zones
// Params 4, eflags: 0x1 linked
// Checksum 0x82bbb5a7, Offset: 0x2960
// Size: 0x104
function function_f7a190a8(str_wait_flag, var_ab660f9a, str_location, var_39acfdda) {
    level endon(#"end_game");
    self endon(#"death");
    level flag::wait_till("start_zombie_round_logic");
    if (isdefined(str_wait_flag)) {
        level flag::wait_till(str_wait_flag);
    }
    if (isdefined(var_ab660f9a)) {
        wait var_ab660f9a;
    }
    for (var_33625d75 = function_ab7f70b9(self); var_33625d75 === str_location; var_33625d75 = function_ab7f70b9(self)) {
        wait 0.5;
    }
    self thread zm_audio::function_713192b1(str_location, var_39acfdda);
}

