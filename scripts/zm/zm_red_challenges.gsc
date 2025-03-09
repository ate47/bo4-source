#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_red_challenges_rewards;
#using scripts\zm\zm_red_util;
#using scripts\zm\zm_red_zones;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_red_challenges;

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xdfdf7626, Offset: 0x4a0
// Size: 0xcf2
function init() {
    if (zm_utility::is_standard()) {
        return;
    }
    clientfield::register("scriptmover", "" + #"hash_74fc30de57a0657a", 16000, 3, "int");
    clientfield::register("scriptmover", "" + #"hash_21f5fab6a3d22093", 16000, 3, "int");
    clientfield::register("scriptmover", "" + #"keyline_model", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"pickup_glow", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_8b48433c3fe40e4", 16000, 3, "int");
    clientfield::register("toplayer", "" + #"hash_4bde11d71410ea67", 16000, 3, "int");
    clientfield::register("world", "" + #"cleanup_challenges", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_47490b879090eb55", 16000, 3, "int");
    clientfield::register("allplayers", "" + #"hash_7b1dd5c08e2585c", 16000, 3, "int");
    clientfield::register("scriptmover", "" + #"rob_coals", 16000, 1, "int");
    level flag::init("fl_challenge_phase_1");
    level flag::init("fl_challenge_phase_2");
    level flag::init("fl_challenge_phase_3");
    level.var_c540c875 = struct::get_array("s_challenge_loc_x", "targetname");
    level.var_c540c875 = array::randomize(level.var_c540c875);
    level.var_e3a16c1e = 0;
    level.var_f7c11d3b = [];
    for (i = 0; i < 21; i++) {
        level.var_f7c11d3b[i] = 0;
    }
    level flag::init("fl_challenges_initialized");
    level flag::init("fl_challenges_active");
    level thread function_e3f96252();
    level thread function_756c88b7();
    level thread function_8ff7b0bb();
    callback::on_connecting(&on_player_connect);
    callback::on_ai_killed(&on_ai_killed);
    level.var_857878e6 = &function_857878e6;
    zm::register_actor_damage_callback(&actor_damage_callback);
    level.var_45420301 = [];
    level.var_45420301[level.var_45420301.size] = #"weapon_pistol";
    level.var_45420301[level.var_45420301.size] = #"weapon_cqb";
    level.var_45420301[level.var_45420301.size] = #"weapon_assault";
    level.var_45420301[level.var_45420301.size] = #"weapon_tactical";
    level.var_45420301[level.var_45420301.size] = #"weapon_lmg";
    level.var_45420301[level.var_45420301.size] = #"weapon_sniper";
    level.var_45420301[level.var_45420301.size] = #"weapon_knife";
    level.var_45420301 = array::randomize(level.var_45420301);
    level.var_b95f226e = 0;
    level.var_54800463 = [];
    level.var_54800463[level.var_54800463.size] = #"torso";
    level.var_54800463[level.var_54800463.size] = #"arms";
    level.var_54800463[level.var_54800463.size] = #"hands";
    level.var_54800463[level.var_54800463.size] = #"legs";
    level.var_54800463[level.var_54800463.size] = #"feet";
    level.var_7ccd49a7 = 0;
    level.var_529bdc63 = [];
    level.var_529bdc63[0] = struct::spawn();
    level.var_529bdc63[0].n_zombie_archetype = #"gegenees";
    level.var_529bdc63[0].str_msg = #"hash_7d3a87af11535537";
    level.var_529bdc63[0].var_18f2b3cb = 0.05;
    level.var_529bdc63[0].str_zone = undefined;
    level.var_529bdc63[1] = struct::spawn();
    level.var_529bdc63[1].n_zombie_archetype = #"blight_father";
    level.var_529bdc63[1].str_msg = #"hash_33f17c3034f8da74";
    level.var_529bdc63[1].var_18f2b3cb = 0.08;
    level.var_529bdc63[1].str_zone = undefined;
    level.var_529bdc63[2] = struct::spawn();
    level.var_529bdc63[2].n_zombie_archetype = #"skeleton";
    level.var_529bdc63[2].str_msg = #"hash_2e51dfa0a7d98b5a";
    level.var_529bdc63[2].var_18f2b3cb = 0.07;
    level.var_529bdc63[2].str_zone = undefined;
    level.var_529bdc63[3] = struct::spawn();
    level.var_529bdc63[3].n_zombie_archetype = #"catalyst";
    level.var_529bdc63[3].str_msg = #"hash_30c2fa2ab04f1d99";
    level.var_529bdc63[3].var_18f2b3cb = 0.07;
    level.var_529bdc63[3].str_zone = undefined;
    level.var_529bdc63 = array::randomize(level.var_529bdc63);
    level.var_848df2ac = 0;
    zm_red_challenges_rewards::init();
    level.var_fb3a9df0 = 0;
    level.var_c6ab748f = 0;
    level.var_8b7ab859 = 1000;
    level.var_e8503818 = [];
    level.var_e8503818[1] = #"hash_725802b808e14c76";
    level.var_e8503818[2] = #"hash_725802b808e14c76";
    level.var_e8503818[3] = #"hash_725802b808e14c76";
    level.var_e8503818[4] = #"hash_725802b808e14c76";
    level.var_e8503818[5] = #"hash_725802b808e14c76";
    level.var_e8503818[6] = #"hash_725802b808e14c76";
    level.var_e8503818[7] = #"hash_725802b808e14c76";
    level.var_e8503818[13] = #"hash_6401bc0ff0d3db94";
    level.var_e8503818[10] = #"hash_73d3851d119f51a4";
    level.var_e8503818[11] = #"hash_6b8b6df4e4c161a7";
    level.var_e8503818[14] = #"hash_25b9a3d3430aa158";
    level.var_e8503818[15] = #"hash_59056a7b92714e58";
    level.var_e8503818[16] = #"hash_59056a7b92714e58";
    level.var_e8503818[17] = #"hash_59056a7b92714e58";
    level.var_e8503818[18] = #"hash_59056a7b92714e58";
    level.var_e8503818[19] = #"hash_59056a7b92714e58";
    level.var_e8503818[20] = #"hash_59056a7b92714e58";
    level.var_e8503818[12] = #"hash_5440bf458877a7e2";
    level.var_e8503818[0] = #"hash_1517f0bbb322181e";
    level.var_e8503818[9] = #"hash_3cdcae60e7ea21e7";
    level.var_e8503818[8] = #"hash_62cbc1e881d872fb";
    level.var_edbe6a7f = [];
    level.var_edbe6a7f[0] = 0;
    level.var_edbe6a7f[1] = 0;
    level.var_edbe6a7f[2] = 0;
    level.var_edbe6a7f[3] = 0;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xf87e1ca0, Offset: 0x11a0
// Size: 0x6c
function on_player_connect() {
    if (!isbot(self)) {
        self.s_tribute_bowl = undefined;
        self thread function_fddf3397();
        self thread player_damage_watcher();
        self thread player_death_watcher();
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x2da066c, Offset: 0x1218
// Size: 0x1c
function function_857878e6() {
    self on_player_connect();
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x1101df97, Offset: 0x1240
// Size: 0x18c
function function_fddf3397() {
    self endon(#"death");
    level flag::wait_till("fl_challenges_initialized");
    self.var_9e09931e = 0;
    n_index = self getentitynumber();
    n_tribute = level.var_edbe6a7f[n_index];
    zm_red_challenges_rewards::set_tribute(n_tribute);
    if (n_tribute > 0 || is_active()) {
        util::wait_network_frame();
        if (is_active()) {
            self zm_red_util::function_b4759cf8();
        }
        if (n_tribute > 0) {
            self function_2bb8d916();
        }
    }
    self.var_6b3806e8 = 0;
    level flag::wait_till("fl_challenges_active");
    self.s_tribute_bowl = self function_7e8e23a6();
    zm_red_challenges_rewards::function_ab6fd86c(self, self.s_tribute_bowl.s_interact);
    exploder::exploder("exp_lgt_oracle_offering_bowl");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xd3d0cb1e, Offset: 0x13d8
// Size: 0x34
function function_2bb8d916() {
    self zm_red_challenges_rewards::function_ae2c0ba5();
    self zm_red_challenges_rewards::function_b858f95a();
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x960c7db8, Offset: 0x1418
// Size: 0xa8
function player_damage_watcher() {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"damage");
        n_damage = waitresult.amount;
        self.var_d5e64932 = gettime() / 1000;
        if (is_challenge_active(10)) {
            self thread function_bf582bc8(10, n_damage);
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xa63fe32c, Offset: 0x14c8
// Size: 0x84
function player_death_watcher(a_params) {
    s_bowl = self.s_tribute_bowl;
    self waittill(#"death");
    if (isdefined(s_bowl) && isdefined(s_bowl.var_9d32404)) {
        s_bowl.var_9d32404 clientfield::set("" + #"hash_21f5fab6a3d22093", 0);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 12, eflags: 0x0
// Checksum 0xa5949ff5, Offset: 0x1558
// Size: 0xa8
function actor_damage_callback(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (zm_utility::is_player_valid(attacker, 0, 1)) {
        function_4ca8c034(attacker, weapon, shitloc, meansofdeath);
    }
    return damage;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x9dc55882, Offset: 0x1608
// Size: 0x504
function on_ai_killed(s_params) {
    e_player = s_params.eattacker;
    str_hit_loc = s_params.shitloc;
    weapon = s_params.weapon;
    means_of_death = s_params.smeansofdeath;
    if (isplayer(e_player) && isdefined(weapon) && weapon.name == #"zhield_zpear_turret") {
        if (!isdefined(e_player.var_53ce87a7)) {
            e_player.var_53ce87a7 = 0;
            e_player.var_822346e9 = 0;
        }
        if (e_player.var_822346e9 < 3) {
            if (e_player.var_53ce87a7 != level.round_number) {
                e_player thread zm_audio::create_and_play_dialog(#"spear_throw", #"kill");
                e_player.var_53ce87a7 = level.round_number;
                e_player.var_822346e9++;
            }
        }
    }
    if (isplayer(e_player)) {
        if (is_challenge_active(14) && !(isdefined(self.var_45bfef99) && self.var_45bfef99)) {
            if (isdefined(str_hit_loc)) {
                if (str_hit_loc == #"helmet" || str_hit_loc == #"head") {
                    level notify(#"zombie_challenge_kill", {#e_player:s_params.eattacker});
                }
            }
            return;
        }
        if (is_challenge_active(12)) {
            if (zm_loadout::is_hero_weapon(weapon)) {
                level notify(#"kill_with_hero_weapon", {#e_player:e_player, #weapon:weapon});
            }
            return;
        }
        if (is_challenge_active(8)) {
            if (isdefined(weapon) && zm_weapons::is_wonder_weapon(weapon)) {
                level notify(#"kill_with_god_hand", {#e_player:e_player});
            }
            return;
        }
        if (is_challenge_active(9)) {
            if (isdefined(weapon) && weapon.inventorytype == #"offhand") {
                level notify(#"kill_with_equipment", {#e_player:e_player, #means_of_death:means_of_death});
            }
            return;
        }
        if (is_challenge_active(13)) {
            if (means_of_death == "MOD_MELEE" || isdefined(weapon) && #"zhield_zpear_dw" === weapon.name && "MOD_IMPACT" === means_of_death) {
                level notify(#"player_melees_zombie", {#e_player:e_player});
            }
            return;
        }
        if (is_challenge_active(1) || is_challenge_active(2) || is_challenge_active(3) || is_challenge_active(4) || is_challenge_active(5) || is_challenge_active(6) || is_challenge_active(7)) {
            level thread function_5e882c6f(e_player, self.origin);
            return;
        }
        function_4ca8c034(e_player, weapon, str_hit_loc, means_of_death);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 4, eflags: 0x0
// Checksum 0x8e6132d8, Offset: 0x1b18
// Size: 0x168
function function_4ca8c034(attacker, weapon, hit_loc, means_of_death) {
    if (!isplayer(attacker)) {
        return;
    }
    if (is_challenge_active(13)) {
        if (means_of_death == "MOD_MELEE" || isdefined(weapon) && #"zhield_zpear_dw" === weapon.name && "MOD_IMPACT" === means_of_death) {
            level notify(#"player_melees_zombie", {#e_player:attacker});
        }
        return;
    }
    if (is_challenge_active(0)) {
        if (isdefined(weapon)) {
            if (weapon.name == #"zhield_zpear_dw" || weapon.name == #"zhield_zpear_turret") {
                level notify(#"shield_and_spear_damage", {#e_player:attacker});
            }
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xff545778, Offset: 0x1c88
// Size: 0x7a4
function function_e3f96252() {
    level flag::wait_till("all_players_spawned");
    level.a_s_challenges = [];
    level.a_s_challenges[0] = create_challenge(1, 1, 120, &function_572ece72, "zone_temple_of_apollo");
    level.a_s_challenges[1] = create_challenge(2, 1, 120, &function_572ece72, "zone_amphitheater");
    level.a_s_challenges[2] = create_challenge(3, 2, 120, &function_572ece72, "zone_drakaina_arena");
    level.a_s_challenges[3] = create_challenge(4, 1, 120, &function_572ece72, "zone_spartan_monument_west");
    level.a_s_challenges[4] = create_challenge(5, 1, 120, &function_572ece72, "zone_stoa_of_the_athenians_east");
    level.a_s_challenges[5] = create_challenge(6, 1, 120, &function_572ece72, "zone_offering");
    level.a_s_challenges[6] = create_challenge(7, 2, 120, &function_572ece72, "zone_river_upper");
    level.a_s_challenges[7] = create_challenge(13, 0, 120, &function_2dcc7ade, undefined);
    level.a_s_challenges[8] = create_challenge(10, 0, 120, &function_a987b682, 2);
    level.a_s_challenges[9] = create_challenge(11, 0, 120, &function_2dcc7ade, undefined);
    level.a_s_challenges[10] = create_challenge(14, 0, 120, &function_2dcc7ade, undefined);
    level.a_s_challenges[11] = create_challenge(15, 2, 120, &function_c0539e40, "zone_cliff_tombs_upper");
    level.a_s_challenges[12] = create_challenge(16, 1, 120, &function_c0539e40, "zone_bathhouse_inside");
    level.a_s_challenges[13] = create_challenge(17, 1, 120, &function_c0539e40, "zone_eastern_plaza");
    level.a_s_challenges[14] = create_challenge(18, 2, 120, &function_c0539e40, "zone_serpent_pass_bridge");
    level.a_s_challenges[15] = create_challenge(19, 1, 120, &function_c0539e40, "zone_spartan_monument_west");
    level.a_s_challenges[16] = create_challenge(20, 1, 120, &function_c0539e40, "zone_spartan_monument_west");
    if (zm_custom::function_901b751c(#"zmspecweaponisenabled")) {
        level.a_s_challenges[17] = create_challenge(12, 0, 120, &function_69a721d, 4);
    }
    if (zm_custom::function_901b751c(#"zmshieldisenabled")) {
        level.a_s_challenges[18] = create_challenge(0, 0, 120, &function_40ccb2dc, undefined);
    }
    if (zm_custom::function_901b751c(#"zmequipmentisenabled")) {
        level.a_s_challenges[19] = create_challenge(9, 0, 120, &function_2dcc7ade, undefined);
    }
    if (zm_custom::function_901b751c(#"zmwonderweaponisenabled")) {
        level.a_s_challenges[20] = create_challenge(8, 0, 120, &function_6e07042a, undefined);
    }
    level.a_s_challenges = array::randomize(level.a_s_challenges);
    level.var_2dffd020 = 0;
    level.var_ead4c5d4 = struct::get_array("s_oracle_challenge_interact", "targetname");
    foreach (s_interact in level.var_ead4c5d4) {
        s_interact zm_unitrigger::create(&function_f3059d3b, 64, &function_5804d6ff);
    }
    level flag::wait_till("all_players_connected");
    level thread setup_models();
    wait 1;
    level flag::set("fl_challenges_initialized");
    level flag::wait_till("power_on");
    level flag::set("fl_challenges_active");
    level.var_2dffd020 = 1;
    level thread game_over();
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xfb6ab601, Offset: 0x2438
// Size: 0x2c
function game_over() {
    level waittill(#"end_game");
    function_304fb042();
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 5, eflags: 0x0
// Checksum 0x65da8acd, Offset: 0x2470
// Size: 0xe6
function create_challenge(n_challenge, n_zone, var_6346e7b, var_12af4e08 = &function_2dcc7ade, var_893baaf = undefined) {
    s_challenge = spawnstruct();
    s_challenge.n_id = n_challenge;
    s_challenge.str_msg = level.var_e8503818[n_challenge];
    s_challenge.var_12af4e08 = var_12af4e08;
    s_challenge.var_893baaf = var_893baaf;
    s_challenge.n_count = 0;
    s_challenge.var_6346e7b = var_6346e7b;
    s_challenge.n_zone = n_zone;
    return s_challenge;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x20267144, Offset: 0x2560
// Size: 0x92
function function_49e4f4ca(var_ecffa2a8) {
    foreach (s_challenge in level.a_s_challenges) {
        if (s_challenge.n_id == var_ecffa2a8) {
            return s_challenge.var_893baaf;
        }
    }
    return undefined;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xc95f8e, Offset: 0x2600
// Size: 0x2f8
function function_f3059d3b(e_player) {
    wpn_current = e_player getcurrentweapon();
    if (!e_player zm_red_util::can_see(self.origin, 0, -1)) {
        self sethintstringforplayer(e_player, "");
        return 0;
    }
    if (isdefined(wpn_current.isriotshield) && wpn_current.isriotshield) {
        self sethintstringforplayer(e_player, "");
        return 0;
    }
    if (level.var_2dffd020 == 0) {
        self sethintstringforplayer(e_player, #"hash_4aa00a9bc891ac28");
        return 1;
    }
    if (zm_trial_disable_buys::is_active()) {
        self sethintstringforplayer(e_player, #"hash_55d25caf8f7bbb2f");
        return 1;
    }
    if (level.var_2dffd020 == 1) {
        str_prompt = zm_utility::function_d6046228(#"hash_6219013948376d70", #"hash_27cdd9110057055c");
        self sethintstringforplayer(e_player, str_prompt, level.var_d3a8f03b);
        return 1;
    }
    if (level.var_2dffd020 == 2) {
        if (level.var_c6ab748f < 0) {
            if (e_player zm_score::can_player_purchase(level.var_48442709)) {
                str_prompt = zm_utility::function_d6046228(#"hash_7b3248a20689a28d", #"hash_10f3f07d744bca73");
                self sethintstringforplayer(e_player, str_prompt, level.var_48442709);
            } else {
                self sethintstringforplayer(e_player, #"hash_1631121fed1a7edf", level.var_48442709);
            }
        } else {
            self sethintstringforplayer(e_player, #"hash_21bb55a0a8972155");
        }
        return 1;
    }
    self sethintstringforplayer(e_player, "");
    return 0;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x84ffe54d, Offset: 0x2900
// Size: 0x2ec
function function_5804d6ff() {
    self endon(#"death");
    while (true) {
        waitresult = self waittill(#"trigger");
        e_player = waitresult.activator;
        if (!zm_utility::can_use(e_player, 0)) {
            continue;
        }
        if (!level flag::get("power_on") || zm_trial_disable_buys::is_active()) {
            continue;
        }
        if (!e_player zm_score::can_player_purchase(level.var_d3a8f03b)) {
            if (!isdefined(e_player.var_e41784d5)) {
                e_player.var_e41784d5 = 0;
            }
            n_time = gettime() / 1000;
            dt = n_time - e_player.var_e41784d5;
            if (dt > 12) {
                e_player thread zm_audio::create_and_play_dialog(#"generic", #"nomoney");
                e_player.var_e41784d5 = n_time;
            }
            continue;
        }
        if (level.var_2dffd020 == 1) {
            if (e_player zm_score::can_player_purchase(level.var_d3a8f03b)) {
                e_player playsound(#"hash_73188c838e8d29c7");
                e_player thread zm_score::minus_to_player_score(level.var_d3a8f03b);
                level thread start_challenge();
                level.var_c6ab748f = 0;
                e_player thread zm_audio::create_and_play_dialog(#"tribute", #"initiate");
            }
            continue;
        }
        if (level.var_2dffd020 == 2 && level.var_c6ab748f < 0) {
            if (e_player zm_score::can_player_purchase(level.var_48442709)) {
                e_player playsound(#"hash_73188c838e8d29c7");
                e_player thread zm_score::minus_to_player_score(level.var_48442709);
                level thread start_challenge();
                level.var_c6ab748f++;
            }
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xec4cb0a4, Offset: 0x2bf8
// Size: 0x36e
function setup_models() {
    a_s_bowls = struct::get_array("s_tribute_bowl", "targetname");
    level.var_c37fe7bc = 0;
    level.var_3e72dc3c = [];
    foreach (s_bowl in a_s_bowls) {
        s_info = struct::spawn();
        n_index = level.var_3e72dc3c.size;
        level.var_3e72dc3c[n_index] = s_info;
        s_info.s_interact = s_bowl;
        s_info.var_126ddafe = getent(s_bowl.target, "targetname");
        v_pos = s_bowl.origin;
        if (!(isdefined(s_bowl.var_b4a48463) && s_bowl.var_b4a48463)) {
            v_dir = anglestoforward(s_info.angles);
            v_pos += v_dir * -9;
        }
        s_info.var_9d32404 = util::spawn_model(#"tag_origin", v_pos, s_bowl.angles);
        s_info.var_1a34d8e = level.var_3e72dc3c[n_index].var_9d32404.origin + (0, 0, 35);
        s_info.var_7b63dcba = (0, 0, 0);
        v_dir = anglestoforward(s_info.angles);
        v_pos = s_info.var_1a34d8e + v_dir * 85;
        s_info.var_8f683ef8 = groundtrace(v_pos, v_pos + (0, 0, -400), 0, s_info.mdl_bowl)[#"position"];
    }
    waitframe(1);
    var_e668d197 = 1;
    foreach (s_info in level.var_3e72dc3c) {
        s_info.var_e668d197 = var_e668d197;
        s_info.var_126ddafe clientfield::set("" + #"hash_8b48433c3fe40e4", s_info.var_e668d197);
        var_e668d197++;
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xfc323de9, Offset: 0x2f70
// Size: 0x80
function function_756c88b7() {
    level endon(#"game_ended");
    function_9e7dc4fb();
    function_895a4ebf();
    while (true) {
        level waittill(#"end_of_round");
        function_9e7dc4fb();
        function_895a4ebf();
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x83d640f3, Offset: 0x2ff8
// Size: 0x1b8
function function_895a4ebf() {
    var_4d0cb1b1 = level.var_1044e9e1;
    if (!isdefined(level.round_number)) {
        n_round_number = 1;
    } else {
        n_round_number = level.round_number;
    }
    if (isdefined(level.var_6e5099bb)) {
        switch (level.var_6e5099bb) {
        case 1:
            n_round_number = 10;
            break;
        case 2:
            n_round_number = 20;
            break;
        case 3:
            n_round_number = 21;
            break;
        }
    }
    if (n_round_number <= 10) {
        level.var_1044e9e1 = 1;
        level flag::set("fl_challenge_phase_1");
    } else if (n_round_number <= 20) {
        level.var_1044e9e1 = 2;
        level flag::set("fl_challenge_phase_2");
    } else {
        level.var_1044e9e1 = 3;
        level flag::set("fl_challenge_phase_3");
    }
    if (level.var_1044e9e1 > 1) {
        if (!isdefined(var_4d0cb1b1) || var_4d0cb1b1 != level.var_1044e9e1) {
            level notify(#"hash_58de66439e1aa5a2");
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x58a8fb26, Offset: 0x31b8
// Size: 0xca
function function_9e7dc4fb() {
    if (isdefined(level.round_number) && level.round_number >= 10) {
        if (!isdefined(level.var_572d28a8)) {
            level.var_572d28a8 = 0;
        }
        level.var_572d28a8--;
        if (level.var_572d28a8 <= 0) {
            level.var_d3a8f03b = int(level.var_d3a8f03b + 500);
            level.var_572d28a8 = 5;
        }
    } else {
        level.var_d3a8f03b = 500;
    }
    level.var_48442709 = 500;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xd865674d, Offset: 0x3290
// Size: 0x130
function function_7e8e23a6() {
    if (true) {
        n_index = self getentitynumber();
        s_bowl = level.var_3e72dc3c[n_index];
        self clientfield::set_to_player("" + #"hash_4bde11d71410ea67", s_bowl.var_e668d197);
        return s_bowl;
    } else {
        while (true) {
            s_bowl = level.var_3e72dc3c[level.var_c37fe7bc];
            level.var_c37fe7bc++;
            if (level.var_c37fe7bc >= level.var_3e72dc3c.size) {
                level.var_c37fe7bc = 0;
            }
            if (!maxis_quest_(s_bowl)) {
                self clientfield::set_to_player("" + #"hash_4bde11d71410ea67", s_bowl.var_e668d197);
                return s_bowl;
            }
        }
    }
    return undefined;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x35391e3b, Offset: 0x33c8
// Size: 0xa0
function maxis_quest_(s_bowl) {
    a_players = getplayers();
    foreach (player in a_players) {
        if (player.s_tribute_bowl === s_bowl) {
            return true;
        }
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x74caa931, Offset: 0x3470
// Size: 0x180
function get_challenge() {
    var_99d6574b = undefined;
    if (isdefined(level.var_656c1a37)) {
        foreach (s_challenge in level.a_s_challenges) {
            if (s_challenge.n_id == level.var_656c1a37) {
                var_99d6574b = s_challenge;
                level.var_656c1a37 = undefined;
                break;
            }
        }
    } else {
        var_881d9045 = 1000;
        foreach (s_challenge in level.a_s_challenges) {
            if (s_challenge.n_count < var_881d9045 && s_challenge [[ s_challenge.var_12af4e08 ]](s_challenge.var_893baaf)) {
                var_881d9045 = s_challenge.n_count;
                var_99d6574b = s_challenge;
            }
        }
    }
    var_99d6574b.n_count++;
    return var_99d6574b;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xdaa7515a, Offset: 0x35f8
// Size: 0x1fc
function start_challenge() {
    if (isdefined(level.s_active_challenge)) {
        stop_challenge(0);
        waitframe(1);
    }
    foreach (player in getplayers()) {
        player zm_red_util::function_76f2fea0(1);
    }
    foreach (player in getplayers()) {
        player zm_red_util::function_9ab191d3(0);
    }
    s_challenge = get_challenge();
    if (!isdefined(s_challenge)) {
        return;
    }
    foreach (player in getplayers()) {
        player notify(#"start_challenge");
    }
    waitframe(1);
    level thread function_8f0594cb(s_challenge);
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x5376a866, Offset: 0x3800
// Size: 0x18e
function stop_challenge(var_c91a0fe1) {
    zm_red_util::stop_timer();
    level [[ level.s_active_challenge.var_3e17832 ]]();
    level.var_fb3a9df0++;
    foreach (player in getplayers()) {
        player notify(#"stop_challenge");
    }
    wait 0.1;
    foreach (player in getplayers()) {
        player zm_red_util::function_7e30f24c();
    }
    if (var_c91a0fe1) {
        level thread function_836d2b5b();
    }
    level.var_2dffd020 = 1;
    level.s_active_challenge = undefined;
    level notify(#"hash_61075af70fbd9082");
    waitframe(1);
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x122e1a56, Offset: 0x3998
// Size: 0x5d4
function function_8f0594cb(s_challenge) {
    level endon(#"hash_61075af70fbd9082");
    level.s_active_challenge = s_challenge;
    level.var_2dffd020 = 2;
    level.var_62ecc169 = gettime() / 1000;
    switch (level.s_active_challenge.n_id) {
    case 0:
        level.s_active_challenge.var_c376bcd5 = &function_7f470031;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
        level.s_active_challenge.var_c376bcd5 = &function_f51adffa;
        level.s_active_challenge.var_3e17832 = &function_9742c28f;
        break;
    case 9:
        level.s_active_challenge.var_c376bcd5 = &function_77d6b526;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 10:
        level.s_active_challenge.var_c376bcd5 = &function_1398b789;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 12:
        level.s_active_challenge.var_c376bcd5 = &function_8d1fd2d8;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 11:
        level.s_active_challenge.var_c376bcd5 = &function_4a88eb80;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 13:
        level.s_active_challenge.var_c376bcd5 = &function_727cdea9;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 14:
        level.s_active_challenge.var_c376bcd5 = &function_c106ffd8;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 8:
        level.s_active_challenge.var_c376bcd5 = &function_7d77dbd6;
        level.s_active_challenge.var_3e17832 = &function_1398b789;
        break;
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
        level.s_active_challenge.var_c376bcd5 = &function_1d60215;
        level.s_active_challenge.var_3e17832 = &function_6be352fc;
        break;
    }
    foreach (player in getplayers()) {
        player thread zm_red_util::show_text(level.s_active_challenge.str_msg, 0, "stop_challenge");
        player.var_6b3806e8 = 0;
    }
    level thread [[ level.s_active_challenge.var_c376bcd5 ]]();
    zm_red_util::start_timer(s_challenge.var_6346e7b + 1);
    s_waitresult = level waittilltimeout(s_challenge.var_6346e7b + 1, #"round_reset");
    while (isdefined(level.var_dc6fce4f) && level.var_dc6fce4f) {
        waitframe(1);
    }
    var_c304d266 = s_waitresult._notify === "timeout";
    stop_challenge(var_c304d266);
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xa63c9c1c, Offset: 0x3f78
// Size: 0x24
function function_7f470031() {
    self thread function_9ffc76ea("shield_and_spear_damage");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xb517dc06, Offset: 0x3fa8
// Size: 0x24
function function_8d1fd2d8() {
    self thread function_9ffc76ea("kill_with_hero_weapon");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xbc23559b, Offset: 0x3fd8
// Size: 0x18c
function function_4a88eb80() {
    level endon(#"hash_61075af70fbd9082");
    for (var_53a794b0 = gettime() / 1000; true; var_53a794b0 = n_time) {
        wait 2;
        n_time = gettime() / 1000;
        foreach (player in getplayers()) {
            b_reward = 0;
            if (!isdefined(player.var_d5e64932)) {
                b_reward = 1;
            } else {
                n_time_since_last_damage = n_time - player.var_d5e64932;
                if (n_time_since_last_damage > 15) {
                    b_reward = 1;
                }
            }
            if (b_reward) {
                player zm_red_util::function_9ab191d3(0);
                player zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id);
                continue;
            }
            player zm_red_util::function_9ab191d3(1);
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x9f69ffde, Offset: 0x4170
// Size: 0x290
function function_f51adffa() {
    switch (level.s_active_challenge.n_id) {
    case 1:
        level.var_80ec74ca = #"hash_792c0919250a07e";
        break;
    case 2:
        level.var_80ec74ca = #"hash_4691be55f6b2f7fb";
        break;
    case 3:
        level.var_80ec74ca = #"hash_4ee0858a78847ce8";
        break;
    case 4:
        level.var_80ec74ca = #"hash_19886b94618ff9a4";
        break;
    case 5:
        level.var_80ec74ca = #"hash_474e7ba807dd9646";
        break;
    case 6:
        level.var_80ec74ca = #"hash_395eaaa6ebb3ceb7";
        break;
    case 7:
        level.var_80ec74ca = #"hash_756f97bb7e6ff36d";
        break;
    }
    level.var_be2ff8ca = zm_utility::function_d7db256e(level.var_80ec74ca, undefined, 1);
    level.var_2c5f83d = zm_red_zones::function_27028b8e(level.var_4427ebb1);
    foreach (player in getplayers()) {
        player thread zm_red_util::show_text(level.var_2c5f83d, 0, "stop_challenge", 0);
        player thread function_173c3ce8(level.s_active_challenge.n_id, level.var_2c5f83d, undefined);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xb566ae34, Offset: 0x4408
// Size: 0x24
function function_9742c28f() {
    zm_utility::function_b1f3be5c(level.var_be2ff8ca, level.var_80ec74ca);
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x78558741, Offset: 0x4438
// Size: 0x24
function function_727cdea9() {
    self thread function_9ffc76ea("player_melees_zombie");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xdda316f3, Offset: 0x4468
// Size: 0x24
function function_77d6b526() {
    self thread function_9ffc76ea("kill_with_equipment");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x3f66bce7, Offset: 0x4498
// Size: 0x24
function function_7d77dbd6() {
    self thread function_9ffc76ea("kill_with_god_hand");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x744fcbd7, Offset: 0x44c8
// Size: 0x454
function function_1d60215() {
    level endon(#"hash_61075af70fbd9082");
    switch (level.s_active_challenge.n_id) {
    case 15:
        level.var_c699da9d = #"hash_3ae778d55ad6e8e4";
        var_9862b6f2 = #"hash_787fa78858071ba9";
        break;
    case 16:
        level.var_c699da9d = #"hash_7fce9e20e92e7a3d";
        var_9862b6f2 = #"hash_50663d02f6b02c16";
        break;
    case 17:
        level.var_c699da9d = #"hash_12d624b76e928e2a";
        var_9862b6f2 = #"hash_224b2f96e6aeef3d";
        break;
    case 18:
        level.var_c699da9d = #"hash_503d347bb0f6c1ad";
        var_9862b6f2 = #"hash_365d2b268bbfd068";
        break;
    case 19:
        level.var_c699da9d = #"hash_3221d4665aec6c07";
        var_9862b6f2 = #"hash_5b07fa123f86d7e0";
        break;
    case 20:
        level.var_c699da9d = #"hash_7a9a40ca466c3b4d";
        var_9862b6f2 = #"hash_666d2ebd0b7eb112";
        break;
    default:
        return;
    }
    s_info = struct::get(level.var_c699da9d, "targetname");
    vol_area = getent(s_info.script_noteworthy, "targetname");
    foreach (player in getplayers()) {
        player thread zm_red_util::show_text(var_9862b6f2, 0, "stop_challenge", 0);
        player thread function_173c3ce8(level.s_active_challenge.n_id, undefined, vol_area);
    }
    level.var_ae2ad596 = zm_utility::function_d7db256e(level.var_c699da9d, undefined, 1);
    while (true) {
        n_time = gettime() / 1000;
        foreach (player in getplayers()) {
            if (!isdefined(player.var_f94035ca)) {
                player.var_f94035ca = 0;
            }
            dt = n_time - player.var_f94035ca;
            if (isdefined(player.var_b05f25ad) && player.var_b05f25ad && dt <= 2) {
                player zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id);
                continue;
            }
            player.var_f94035ca = n_time;
        }
        wait 2;
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x72b6031b, Offset: 0x4928
// Size: 0x24
function function_6be352fc() {
    zm_utility::function_b1f3be5c(level.var_acc31847, level.var_c699da9d);
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x5f12c982, Offset: 0x4958
// Size: 0x24
function function_c106ffd8() {
    level thread function_9ffc76ea("zombie_challenge_kill");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xfb959854, Offset: 0x4988
// Size: 0x1e
function function_2dcc7ade(var_893baaf = undefined) {
    return true;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xa62ca36d, Offset: 0x49b0
// Size: 0x40
function function_40ccb2dc(var_893baaf = undefined) {
    if (isdefined(level.var_f9e5f55a) && level.var_f9e5f55a) {
        return true;
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x8e203326, Offset: 0x49f8
// Size: 0xd4
function function_6e07042a(var_893baaf = undefined) {
    foreach (player in getplayers()) {
        if (player flag::exists(#"hash_664c4b8d9b3d0237") && player flag::get(#"hash_664c4b8d9b3d0237")) {
            return true;
        }
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xce3e0e73, Offset: 0x4ad8
// Size: 0x34
function function_69a721d(var_893baaf = undefined) {
    if (level.round_number >= var_893baaf) {
        return true;
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x6b0ff2f9, Offset: 0x4b18
// Size: 0x32
function function_a987b682(var_893baaf = undefined) {
    if (level.gamedifficulty > var_893baaf) {
        return false;
    }
    return true;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xefd3ab0f, Offset: 0x4b58
// Size: 0xc6
function function_572ece72(var_893baaf = undefined) {
    if (!function_863d38d3(self.n_zone)) {
        return 0;
    }
    if (!isdefined(level.var_9376b4fc)) {
        level.var_9376b4fc = 0;
    }
    var_4d94b079 = level.var_fb3a9df0 - level.var_9376b4fc;
    if (var_4d94b079 <= 1) {
        return 0;
    }
    b_available = function_7fcc1087(var_893baaf);
    if (b_available) {
        level.var_9376b4fc = level.var_fb3a9df0;
    }
    return b_available;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xa634711d, Offset: 0x4c28
// Size: 0xbe
function function_863d38d3(n_zone) {
    switch (n_zone) {
    case 1:
        if (function_5c5cb67b() && !function_2d371444()) {
            return false;
        }
        break;
    case 2:
        if (!function_5c5cb67b()) {
            return false;
        }
        break;
    case 0:
    default:
        break;
    }
    return true;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xda91ed3d, Offset: 0x4cf0
// Size: 0xc6
function function_c0539e40(var_893baaf = undefined) {
    if (!function_863d38d3(self.n_zone)) {
        return 0;
    }
    if (!isdefined(level.var_9050c9b4)) {
        level.var_9050c9b4 = 0;
    }
    var_52547a9a = level.var_fb3a9df0 - level.var_9050c9b4;
    if (var_52547a9a <= 1) {
        return 0;
    }
    b_available = function_7fcc1087(var_893baaf);
    if (b_available) {
        level.var_9050c9b4 = level.var_fb3a9df0;
    }
    return b_available;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x3292c0d3, Offset: 0x4dc0
// Size: 0x7a
function function_7fcc1087(var_893baaf = undefined) {
    level.var_4427ebb1 = var_893baaf;
    if (isdefined(level.var_4427ebb1) && isdefined(level.zones[level.var_4427ebb1])) {
        if (level.zones[level.var_4427ebb1].is_enabled) {
            return true;
        }
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xcaff5b3a, Offset: 0x4e48
// Size: 0x46
function function_2d371444(var_893baaf = undefined) {
    if (level flag::get(#"pap_quest_completed")) {
        return true;
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xd3159f6d, Offset: 0x4e98
// Size: 0x42
function is_challenge_active(var_ecffa2a8) {
    if (isdefined(level.s_active_challenge) && level.s_active_challenge.n_id == var_ecffa2a8) {
        return true;
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x3e208b1d, Offset: 0x4ee8
// Size: 0x1c
function is_active() {
    if (isdefined(level.s_active_challenge)) {
        return true;
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 2, eflags: 0x0
// Checksum 0xd65077c, Offset: 0x4f10
// Size: 0x5a
function function_94bdb104(s_struct, ai_killed) {
    n_distance = distance(level.var_cf9c7fdc.origin, ai_killed.origin);
    if (n_distance > 400) {
        return false;
    }
    return true;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 2, eflags: 0x0
// Checksum 0xb0e9c91d, Offset: 0x4f78
// Size: 0x64
function soul_capture(s_struct, ai_killed) {
    if (zm_utility::is_player_valid(ai_killed.attacker, 0, 1)) {
        ai_killed.attacker zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0xe8c6d23b, Offset: 0x4fe8
// Size: 0x100
function function_5ee56208(var_5acfb6d) {
    self endon(#"death");
    level endon(#"hash_61075af70fbd9082");
    while (true) {
        var_bdf9e3c2 = zm_zonemgr::get_zone_from_position(self.origin);
        if (isdefined(var_bdf9e3c2)) {
            var_72192bfa = zm_red_zones::function_27028b8e(var_bdf9e3c2);
            if (isdefined(var_72192bfa)) {
                if (var_72192bfa === var_5acfb6d) {
                    self zm_red_util::function_76f2fea0(1);
                    self zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id);
                } else {
                    self zm_red_util::function_76f2fea0(0);
                }
            }
        }
        wait 2;
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x423bdf8d, Offset: 0x50f0
// Size: 0x100
function function_9ffc76ea(str_notify) {
    level endon(#"hash_61075af70fbd9082");
    while (true) {
        waitresult = level waittill(str_notify);
        e_player = waitresult.e_player;
        var_c4979a70 = 1;
        if (level.s_active_challenge.n_id == 9) {
            means_of_death = waitresult.means_of_death;
            if ("MOD_GRENADE" === means_of_death || "MOD_GRENADE_SPLASH" === means_of_death) {
                var_c4979a70 = 8;
            }
        }
        e_player zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id, undefined, var_c4979a70);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 2, eflags: 0x0
// Checksum 0x4a811d96, Offset: 0x51f8
// Size: 0x164
function function_bf582bc8(var_ecffa2a8, n_damage) {
    self notify("406b5cd97f3e3fe");
    self endon("406b5cd97f3e3fe");
    self endon(#"death");
    level endon(#"hash_61075af70fbd9082");
    n_start_health = self.health;
    while (is_challenge_active(var_ecffa2a8)) {
        if (self laststand::player_is_in_laststand()) {
            break;
        }
        if (self.sessionstate === "spectator") {
            break;
        }
        if (self.health == self.maxhealth) {
            self zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id, undefined, n_damage);
            break;
        } else {
            n_delta = self.health - n_start_health;
            if (n_delta >= 50) {
                self zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id, undefined, n_damage);
                n_start_health += 50;
            }
        }
        waitframe(1);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 2, eflags: 0x0
// Checksum 0x50cd908e, Offset: 0x5368
// Size: 0x94
function function_5e882c6f(e_player, var_2b625b6e) {
    str_zone = zm_zonemgr::get_zone_from_position(var_2b625b6e);
    if (isdefined(str_zone)) {
        var_a24af036 = zm_red_zones::function_27028b8e(str_zone);
        if (level.var_2c5f83d === var_a24af036) {
            e_player zm_red_challenges_rewards::function_53a333a8(level.s_active_challenge.n_id);
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x717184a, Offset: 0x5408
// Size: 0x1b0
function function_836d2b5b() {
    foreach (player in getplayers()) {
        if (!isdefined(player.var_6b3806e8)) {
            player.var_6b3806e8 = 0;
        }
        if (player.var_6b3806e8 == 0) {
            player thread zm_vo::vo_say(#"hash_52ef2f977320c648", 0, 1, 9999, 1, 1, 1);
            continue;
        }
        if (player.var_6b3806e8 <= 0.05) {
            player thread zm_vo::vo_say(#"hash_dc8a9f0c8308e91", 0, 1, 9999, 1, 1, 1);
            continue;
        }
        if (player.var_6b3806e8 <= 0.3) {
            player thread zm_vo::vo_say(#"hash_5cf9d72bd1aa0071", 0, 1, 9999, 1, 1, 1);
            continue;
        }
        player thread zm_vo::vo_say(#"hash_2d2de7c6c02699d2", 0, 1, 9999, 1, 1, 1);
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x55c0
// Size: 0x4
function function_1398b789() {
    
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x57391149, Offset: 0x55d0
// Size: 0x4c
function player_progress_bar() {
    level flag::wait_till("power_on");
    self thread zm_red_util::show_text(#"hash_18137f65a42bc186", 0, "start_challenge");
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xa4c82ea6, Offset: 0x5628
// Size: 0x104
function function_a17a600() {
    level endon(#"hash_61075af70fbd9082");
    while (true) {
        wait 60;
        level.var_c94140cf = level.var_8f94c541[level.var_fe19836];
        level.var_fe19836++;
        if (level.var_fe19836 >= level.var_8f94c541.size) {
            level.var_fe19836 = 0;
        }
        foreach (player in getplayers()) {
            player zm_red_util::function_f0d355fc(level.var_c94140cf);
        }
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xbea87c74, Offset: 0x5738
// Size: 0x46
function function_5c5cb67b() {
    if (level.round_number >= 10) {
        return true;
    }
    if (level flag::get(#"hash_7943879f3be8ccc6")) {
        return true;
    }
    return false;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 3, eflags: 0x0
// Checksum 0x502d2eaa, Offset: 0x5788
// Size: 0x1d6
function function_173c3ce8(var_ecffa2a8, var_2c5f83d, vol_override = undefined) {
    self notify(#"hash_6daf8e8dc22cab08");
    self endon(#"hash_6daf8e8dc22cab08", #"death");
    self.var_95cfa01d = 1;
    self.var_b05f25ad = 0;
    while (is_challenge_active(var_ecffa2a8)) {
        if (isdefined(vol_override)) {
            if (self istouching(vol_override)) {
                self.var_b05f25ad = 1;
            } else {
                self.var_b05f25ad = 0;
            }
        } else {
            str_zone = zm_zonemgr::get_zone_from_position(self.origin);
            var_d56f1604 = zm_red_zones::function_27028b8e(str_zone);
            if (var_2c5f83d === var_d56f1604) {
                self.var_b05f25ad = 1;
            } else {
                self.var_b05f25ad = 0;
            }
        }
        if (isdefined(self.var_95cfa01d) && self.var_95cfa01d && isdefined(self.var_b05f25ad) && self.var_b05f25ad) {
            self zm_red_util::function_76f2fea0(1);
            self.var_f94035ca = gettime() / 1000;
        } else {
            self zm_red_util::function_76f2fea0(0);
        }
        waitframe(1);
    }
    self.var_95cfa01d = 0;
    self.var_b05f25ad = 0;
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 1, eflags: 0x0
// Checksum 0x88a3e0b4, Offset: 0x5968
// Size: 0x1c6
function pause_challenges(b_pause) {
    a_players = getplayers();
    if (b_pause && !(isdefined(level.var_dc6fce4f) && level.var_dc6fce4f)) {
        foreach (player in a_players) {
            if (is_active()) {
                player zm_red_util::function_7e30f24c();
            }
            player zm_red_util::function_7e617e33(0);
        }
        level.var_dc6fce4f = 1;
        return;
    }
    if (isdefined(level.var_dc6fce4f) && level.var_dc6fce4f) {
        foreach (player in a_players) {
            if (is_active()) {
                player zm_red_util::function_b4759cf8();
            }
            player zm_red_util::function_7e617e33(1);
        }
        level.var_dc6fce4f = 0;
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0xc2aedf38, Offset: 0x5b38
// Size: 0x1c6
function function_304fb042() {
    if (!(isdefined(level.var_7aec13aa) && level.var_7aec13aa)) {
        level clientfield::set("" + #"cleanup_challenges", 1);
        level.var_483180c5 clientfield::set("" + #"rob_coals", 0);
        level.var_d5ba7324 clientfield::set("" + #"hash_74fc30de57a0657a", 0);
        foreach (player in getplayers()) {
            player zm_red_util::function_7e30f24c();
            player zm_red_util::function_7e617e33(0);
            s_bowl = player.s_tribute_bowl;
            if (isdefined(s_bowl) && isdefined(s_bowl.var_9d32404)) {
                s_bowl.var_9d32404 clientfield::set("" + #"hash_21f5fab6a3d22093", 0);
            }
        }
        level.var_7aec13aa = 1;
    }
}

// Namespace zm_red_challenges/zm_red_challenges
// Params 0, eflags: 0x0
// Checksum 0x71e240d, Offset: 0x5d08
// Size: 0x200
function function_8ff7b0bb() {
    level flag::wait_till("all_players_connected");
    level flag::wait_till("power_on");
    var_6a5f8169 = struct::get("s_apollo_bowl_vo", "targetname");
    b_play_vo = 0;
    while (!b_play_vo) {
        foreach (player in getplayers()) {
            n_dist = distance(player.origin, var_6a5f8169.origin);
            if (n_dist <= 550) {
                if (player zm_red_util::can_see(var_6a5f8169.origin, 0, 0.5)) {
                    b_play_vo = 1;
                    break;
                }
            }
        }
        wait 0.5;
    }
    foreach (player in getplayers()) {
        player thread zm_vo::vo_say(#"hash_3d7811c8269d75cf", 0, 1, 9999, 1, 1, 1);
    }
}

