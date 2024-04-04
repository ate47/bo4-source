// Atian COD Tools GSC decompiler test
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\zm_common\zm_round_spawning.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using script_387eab232fe22983;
#using scripts\zm\ai\zm_ai_stoker.gsc;
#using script_ab862743b3070a;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\zm\zm_mansion_util.gsc;
#using scripts\core_common\vehicle_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;

#namespace zm_mansion_special_rounds;

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x861d59e4, Offset: 0x260
// Size: 0x32c
function init() {
    zm_round_spawning::function_2669b95a(#"bat", #"nosferatu");
    level.var_4c350e72 = 0;
    level.var_ce53172d = 30;
    level.dog_spawn_func = &function_e1c262fb;
    level.var_6189feaf = &function_c79d744e;
    level.var_29a8e07 = &function_d075d6e9;
    level.var_d9334d8b = &function_2438d55e;
    level.var_ae4acb3f = &function_18f5f327;
    level.var_b106cd7a = &function_50ec1ddf;
    level.var_7e40409b = &zombie_werewolf_util::function_774f6e70;
    level.var_aab23eac = &function_84c5200d;
    level.var_8a5c1a7a = 1;
    level.custom_dog_target_validity_check = &function_bc0facd3;
    level flag::init("flag_werewolf_set_intro");
    level flag::init("flag_bat_nosferatu_set_intro");
    level flag::init("flag_crimson_nosferatu_set_intro");
    zm_round_spawning::function_2876740e(#"catalyst", &function_2ffc8cca);
    level waittill(#"all_players_spawned");
    if (zm_utility::is_standard()) {
        level thread function_6957c745(#"catalyst", 3);
    } else {
        level thread function_6957c745(#"catalyst", 7);
        level thread function_6957c745(#"werewolf", 30, "flag_werewolf_set_intro");
        level thread function_6957c745(#"bat", 12, "flag_bat_nosferatu_set_intro");
        level thread function_6957c745(#"nosferatu", 12, "flag_bat_nosferatu_set_intro");
        level thread function_6957c745(#"crimson_nosferatu", 35, "flag_crimson_nosferatu_set_intro");
    }
    /#
        callback::on_vehicle_spawned(&function_cfcf2d32);
    #/
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x0
// Checksum 0xb09a457b, Offset: 0x598
// Size: 0x34
function function_cfcf2d32() {
    /#
        if (self.archetype === #"bat") {
            self thread function_2438d55e();
        }
    #/
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x2859a8c5, Offset: 0x5d8
// Size: 0x2a
function function_2ffc8cca(n_max) {
    return int(n_max * 0.4);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 3, eflags: 0x1 linked
// Checksum 0xe0beb622, Offset: 0x610
// Size: 0x9c
function function_6957c745(str_archetype, n_round, var_b2239dab) {
    if (isdefined(var_b2239dab)) {
        level thread function_36c1dcca(n_round, var_b2239dab);
        level flag::wait_till(var_b2239dab);
        level waittill(#"hash_5d3012139f083ccb");
        n_round = level.round_number;
    }
    zm_round_spawning::function_376e51ef(str_archetype, n_round);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 2, eflags: 0x1 linked
// Checksum 0xf9d1d39d, Offset: 0x6b8
// Size: 0x6c
function function_36c1dcca(n_round, var_b2239dab) {
    level endon(var_b2239dab);
    while (level.round_number < n_round) {
        level waittill(#"end_of_round");
    }
    level flag::set(var_b2239dab);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x7992284e, Offset: 0x730
// Size: 0x2c
function function_3dab3302() {
    level notify(#"hash_21672c4f6ccf13d0");
    level thread function_93eab559();
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x15799d76, Offset: 0x768
// Size: 0x84
function function_93eab559() {
    level clientfield::set("" + #"hash_42e03f9ae74a1070", 1);
    if (zm_utility::is_standard()) {
        return;
    }
    level thread p9_wood_lumber_01_1x4_64_01();
    wait(1);
    level thread zm_audio::sndannouncerplayvox("dogstart");
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x0
// Checksum 0x1156ef6d, Offset: 0x7f8
// Size: 0x6c
function function_41509519(var_d25bbdd5) {
    if (var_d25bbdd5) {
        level.var_4c350e72++;
    }
    level notify(#"hash_7b9245ff51f3d4f7");
    level clientfield::set("" + #"hash_42e03f9ae74a1070", 0);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x8211503b, Offset: 0x870
// Size: 0x62
function function_4c350e72() {
    if (getplayers().size < 3) {
        n_max = getplayers().size * 6;
    } else {
        n_max = getplayers().size * 8;
    }
    return n_max;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x35c8ad50, Offset: 0x8e0
// Size: 0xb0
function function_ffa01525() {
    switch (getplayers().size) {
    case 1:
        n_default_wait = 2.25;
        break;
    case 2:
        n_default_wait = 1.75;
        break;
    case 3:
        n_default_wait = 1.25;
        break;
    default:
        n_default_wait = 0.75;
        break;
    }
    wait(n_default_wait);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x17953e9c, Offset: 0x998
// Size: 0x26a
function function_e1c262fb(entity) {
    if (isdefined(level.zm_loc_types[#"dog_location"]) && level.zm_loc_types[#"dog_location"].size >= 1) {
        a_locs = array::randomize(level.zm_loc_types[#"dog_location"]);
    } else {
        a_locs = struct::get_array("dog_location", "script_noteworthy");
        a_locs = array::randomize(a_locs);
    }
    if (isdefined(entity) && isdefined(entity.favoriteenemy) && zm_utility::is_player_valid(entity.favoriteenemy)) {
        var_46d2ec35 = entity.favoriteenemy;
    } else {
        var_46d2ec35 = get_favorite_enemy();
    }
    var_ae51d146 = 400 * 400;
    var_5c124858 = 1200 * 1200;
    for (i = 0; i < a_locs.size; i++) {
        if (isdefined(level.var_445185e3) && level.var_445185e3 == a_locs[i]) {
            continue;
        }
        if (!isalive(var_46d2ec35)) {
            return array::random(a_locs);
        }
        n_dist_squared = distancesquared(a_locs[i].origin, var_46d2ec35.origin);
        if (n_dist_squared > var_ae51d146 && n_dist_squared < var_5c124858) {
            level.var_445185e3 = a_locs[i];
            return a_locs[i];
        }
    }
    return arraygetclosest(var_46d2ec35.origin, a_locs);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xfcbb8ffa, Offset: 0xc10
// Size: 0x164
function function_c79d744e(s_spawn_loc) {
    self endon(#"death");
    if (isdefined(s_spawn_loc.scriptbundlename)) {
        self zm_spawner::function_45bb11e4(s_spawn_loc);
    }
    assert(isdefined(self), "<unknown string>");
    assert(isalive(self), "<unknown string>");
    self zombie_dog_util::zombie_setup_attack_properties_dog();
    wait(0.1);
    self show();
    self setfreecameralockonallowed(1);
    self val::reset(#"dog_spawn", "ignoreme");
    self val::reset(#"dog_spawn", "ignoreall");
    self notify(#"visible");
    self ai::set_behavior_attribute("sprint", 1);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xfb9cbfe4, Offset: 0xd80
// Size: 0xc6
function function_d075d6e9() {
    if (!getdvarint(#"hash_331b448d3ef91baf", 0)) {
        if (isdefined(level.zm_loc_types[#"bat_location"]) && level.zm_loc_types[#"bat_location"].size > 0) {
            a_locs = array::randomize(level.zm_loc_types[#"bat_location"]);
            s_loc = function_5618c56d(a_locs);
            return s_loc;
        }
    }
    return undefined;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x5869e7a1, Offset: 0xe50
// Size: 0xae
function function_2438d55e(s_spawn_loc) {
    self endoncallback(&bat_death, #"death");
    if (isdefined(s_spawn_loc)) {
        if (isdefined(s_spawn_loc.target)) {
            self thread vehicle::get_on_and_go_path(s_spawn_loc.target);
        } else if (isdefined(s_spawn_loc.scriptbundlename)) {
            level scene::play(s_spawn_loc.scriptbundlename, "Shot 1", self);
        }
        return;
    }
    wait(1);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x66e3d77f, Offset: 0xf08
// Size: 0xc
function bat_death(str_notify) {
    
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xdc7c9835, Offset: 0xf20
// Size: 0x8a
function function_18f5f327(s_spawn_loc) {
    if (isdefined(s_spawn_loc.scriptbundlename)) {
        switch (s_spawn_loc.scriptbundlename) {
        case #"aib_t8_zm_mnsn_nfrtu_trvrs_grnd_climbout_01":
            self zm_spawner::function_45bb11e4(s_spawn_loc);
            break;
        case #"aib_t8_zm_mnsn_nfrtu_undercroft_spawn_01":
            self zm_spawner::do_zombie_rise(s_spawn_loc);
            break;
        }
    }
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x95bd1216, Offset: 0xfb8
// Size: 0x138
function get_favorite_enemy() {
    a_targets = getplayers();
    least_hunted = a_targets[0];
    for (i = 0; i < a_targets.size; i++) {
        if (!isdefined(a_targets[i].hunted_by)) {
            a_targets[i].hunted_by = 0;
        }
        if (!zm_utility::is_player_valid(a_targets[i])) {
            continue;
        }
        if (!zm_utility::is_player_valid(least_hunted)) {
            least_hunted = a_targets[i];
        }
        if (a_targets[i].hunted_by < least_hunted.hunted_by) {
            least_hunted = a_targets[i];
        }
    }
    if (!zm_utility::is_player_valid(least_hunted)) {
        return undefined;
    }
    least_hunted.hunted_by = least_hunted.hunted_by + 1;
    return least_hunted;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 3, eflags: 0x0
// Checksum 0xacb7b254, Offset: 0x10f8
// Size: 0x7e
function function_27e8f915(s_loc, e_target, b_invert = 0) {
    str_player_zone = e_target zm_zonemgr::get_player_zone();
    var_23525cb = s_loc.zone_name === str_player_zone;
    if (!b_invert) {
        return var_23525cb;
    }
    return !var_23525cb;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xda44017c, Offset: 0x1180
// Size: 0x122
function function_5618c56d(a_locs) {
    foreach (loc in a_locs) {
        if (loc !== level.var_c4437092) {
            /#
                var_666a9e97 = zm_zonemgr::get_zone_from_position(loc.origin);
            #/
            if (isdefined(loc.script_flag_wait) && loc.script_flag_wait !== "") {
                if (level flag::get(loc.script_flag_wait)) {
                    level.var_c4437092 = loc;
                    return loc;
                }
                continue;
            }
            level.var_c4437092 = loc;
            return loc;
        }
    }
    return undefined;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x0
// Checksum 0x11d7ada, Offset: 0x12b0
// Size: 0x104
function function_38c0c907() {
    var_d3b167fd = self.origin;
    if (isdefined(var_d3b167fd)) {
        v_drop = mansion_util::function_a8176b98(var_d3b167fd);
    }
    if (!isdefined(v_drop)) {
        foreach (player in util::get_active_players()) {
            if (zm_utility::is_player_valid(player)) {
                v_drop = player.origin;
                break;
            }
        }
    }
    if (isdefined(v_drop)) {
        level thread zm_powerups::specific_powerup_drop("full_ammo", v_drop);
    }
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x424b4ce0, Offset: 0x13c0
// Size: 0x74
function p9_wood_lumber_01_1x4_64_01() {
    players = getplayers();
    num = randomintrange(0, players.size);
    players[num] zm_audio::create_and_play_dialog(#"general", #"dog_spawn");
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 3, eflags: 0x1 linked
// Checksum 0x11dd7ffa, Offset: 0x1440
// Size: 0x118
function function_988438a7(sp_spawner = level.var_38f5f109[0], s_spawn, n_round_number) {
    var_e5e48bf4 = zombie_utility::spawn_zombie(sp_spawner, undefined, undefined, n_round_number);
    if (isdefined(var_e5e48bf4)) {
        var_e5e48bf4.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        var_e5e48bf4 thread zombie_utility::round_spawn_failsafe();
        var_e5e48bf4 zm_score::function_82732ced();
    }
    if (isdefined(s_spawn) && isstruct(s_spawn) && isalive(var_e5e48bf4)) {
        var_e5e48bf4 forceteleport(s_spawn.origin, s_spawn.angles);
    }
    return var_e5e48bf4;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x55936cd8, Offset: 0x1560
// Size: 0xb0
function function_f46db405() {
    switch (getplayers().size) {
    case 1:
        n_default_wait = 2.25;
        break;
    case 2:
        n_default_wait = 1.75;
        break;
    case 3:
        n_default_wait = 1.25;
        break;
    default:
        n_default_wait = 0.75;
        break;
    }
    wait(n_default_wait);
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x8b400d39, Offset: 0x1618
// Size: 0x300
function function_50ec1ddf() {
    if (level flag::get(#"boss_fight_started") == 0) {
        a_s_spawn_locs = array::randomize(struct::get_array("werewolf_patrol_location", "script_noteworthy"));
        foreach (s_spawn_loc in a_s_spawn_locs) {
            if (zm_utility::check_point_in_enabled_zone(s_spawn_loc.origin) && !(isdefined(s_spawn_loc function_1a27cc15()) && s_spawn_loc function_1a27cc15()) && !(isdefined(s_spawn_loc function_e91102ad()) && s_spawn_loc function_e91102ad())) {
                return s_spawn_loc;
            }
        }
    }
    a_s_spawn_locs = struct::get_array("werewolf_location", "script_noteworthy");
    var_46d2ec35 = get_favorite_enemy();
    if (isdefined(var_46d2ec35)) {
        a_s_spawn_locs = array::get_all_closest(var_46d2ec35.origin, a_s_spawn_locs);
    } else {
        a_s_spawn_locs = array::randomize(a_s_spawn_locs);
    }
    foreach (s_spawn_loc in a_s_spawn_locs) {
        if (zm_zonemgr::zone_is_enabled(s_spawn_loc.zone_name)) {
            if (!isdefined(s_spawn_loc.var_39512f0e) || level flag::get(s_spawn_loc.var_39512f0e) == 0) {
                return s_spawn_loc;
            }
            if (s_spawn_loc.var_39512f0e === "power_on3" && zm_custom::function_901b751c("zmPowerState") == 2 && zm_custom::function_901b751c(#"zmpowerdoorstate") == 0) {
                return s_spawn_loc;
            }
        }
    }
    return undefined;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xb153a722, Offset: 0x1920
// Size: 0xa2
function function_e91102ad() {
    foreach (player in getplayers()) {
        if (player util::is_player_looking_at(self.origin + (0, 0, 64))) {
            return true;
        }
    }
    return false;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x7bfdeb20, Offset: 0x19d0
// Size: 0x108
function function_1a27cc15() {
    var_c9e3c7bc = arraycombine(getplayers(), getaiarchetypearray(#"werewolf"), 0, 0);
    var_bdf9e3c2 = self zm_utility::get_current_zone();
    foreach (e_entity in var_c9e3c7bc) {
        var_91dfe7f4 = e_entity zm_utility::get_current_zone();
        if (var_91dfe7f4 === var_bdf9e3c2) {
            return true;
        }
    }
    return false;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x91c140b7, Offset: 0x1ae0
// Size: 0x2f4
function function_84c5200d(entity) {
    entity endon(#"death");
    if (!isdefined(level.dog_spawners) || level.dog_spawners.size == 0) {
        /#
            iprintlnbold("<unknown string>");
        #/
        return;
    }
    var_a9e4d1ee = int(max(0, min(5, level.zombie_ai_limit - zombie_utility::get_current_zombie_count())));
    if (!var_a9e4d1ee) {
        a_ai_zombies = getaiarchetypearray(#"zombie");
        foreach (e_player in util::get_active_players(#"allies")) {
            var_77696b51 = array::get_all_closest(e_player.origin, a_ai_zombies, undefined, undefined, 640);
            a_ai_zombies = array::exclude(a_ai_zombies, var_77696b51);
        }
        var_a9e4d1ee = int(max(0, min(5, a_ai_zombies.size)));
        /#
            iprintln("<unknown string>" + var_a9e4d1ee + "<unknown string>");
        #/
        for (i = 0; i < var_a9e4d1ee; i++) {
            a_ai_zombies[i] thread zm_cleanup::cleanup_zombie();
        }
    }
    if (var_a9e4d1ee) {
        /#
            iprintln("<unknown string>" + var_a9e4d1ee + "<unknown string>");
        #/
        entity thread function_d1371239(var_a9e4d1ee);
        return;
    }
    /#
        if (var_a9e4d1ee == 0) {
            iprintlnbold("<unknown string>");
        }
    #/
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0x86fe9a98, Offset: 0x1de0
// Size: 0x104
function function_d1371239(var_a9e4d1ee) {
    self endon(#"death");
    while (var_a9e4d1ee > 0) {
        var_18f8f237 = 5;
        do {
            ai = zombie_dog_util::function_62db7b1c(1, undefined);
            var_18f8f237--;
            waitframe(1);
        } while (!isdefined(ai) && var_18f8f237);
        /#
            if (!var_18f8f237 && !isdefined(ai)) {
                iprintlnbold("<unknown string>");
            }
        #/
        if (isdefined(ai)) {
            ai thread function_acab3515();
            wait(randomfloatrange(1.5, 3.5));
        }
        var_a9e4d1ee--;
        waitframe(1);
    }
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0xbb00b0fa, Offset: 0x1ef0
// Size: 0x6e
function function_acab3515() {
    self endon(#"death");
    self.var_126d7bef = 1;
    self.ignore_round_spawn_failsafe = 1;
    self.ignore_enemy_count = 1;
    self.b_ignore_cleanup = 1;
    self waittill(#"completed_emerging_into_playable_area");
    self.no_powerups = 1;
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 0, eflags: 0x1 linked
// Checksum 0x5f185c3f, Offset: 0x1f68
// Size: 0x142
function function_bc0facd3() {
    self endon(#"death");
    if (!isdefined(self.favoriteenemy)) {
        return;
    }
    foreach (player in getplayers()) {
        if (zm_utility::is_player_valid(player) && player != self.favoriteenemy && distancesquared(player.origin, self.origin) < 300 * 300 && distancesquared(self.favoriteenemy.origin, self.origin) > 150 * 150) {
            self function_f3ce0f2b(player);
            return;
        }
    }
}

// Namespace zm_mansion_special_rounds/zm_mansion_special_rounds
// Params 1, eflags: 0x1 linked
// Checksum 0xf800d3ae, Offset: 0x20b8
// Size: 0x80
function function_f3ce0f2b(player) {
    self endon(#"death");
    player endon(#"disconnect");
    self.favoriteenemy = player;
    for (n_timer = 5; n_timer > 0 && zm_utility::is_player_valid(player); n_timer--) {
        wait(1);
    }
}

