// Atian COD Tools GSC decompiler test
#using scripts\zm_common\trials\zm_trial_damage_drains_points.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\rank_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_score;

// Namespace zm_score/zm_score
// Params 0, eflags: 0x2
// Checksum 0x3a6d8772, Offset: 0x298
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_score", &__init__, &__main__, undefined);
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0x59e79b4a, Offset: 0x2e8
// Size: 0x1ca
function __init__() {
    level.var_697c8943 = array(90, 80, 70, 60, 50, 40, 30, 20, 10);
    foreach (subdivision in level.var_697c8943) {
        score_cf_register_info("damage" + subdivision, 1, 7);
    }
    score_cf_register_info("death_head", 1, 3);
    score_cf_register_info("death_melee", 1, 3);
    score_cf_register_info("transform_kill", 1, 3);
    clientfield::register("clientuimodel", "hudItems.doublePointsActive", 1, 1, "int");
    callback::on_spawned(&player_on_spawned);
    level callback::on_ai_killed(&function_a3d16ee5);
    level.score_total = 0;
    level.a_func_score_events = [];
    level.var_c44113ca = [];
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0xa054fce0, Offset: 0x4c0
// Size: 0x1e
function __main__() {
    level.scoreongiveplayerscore = &function_610e9242;
}

// Namespace zm_score/zm_score
// Params 6, eflags: 0x1 linked
// Checksum 0xf7e3bf90, Offset: 0x4e8
// Size: 0xda
function function_610e9242(event, player, victim, descvalue, weapon, var_36f23f1f) {
    score = player rank::getscoreinfovalue(event);
    /#
        assert(isdefined(score));
    #/
    xp = player rank::getscoreinfoxp(event);
    /#
        assert(isdefined(xp));
    #/
    label = rank::getscoreinfolabel(event);
    return score;
}

// Namespace zm_score/zm_score
// Params 2, eflags: 0x0
// Checksum 0x7da70bb4, Offset: 0x5d0
// Size: 0x2a
function register_score_event(str_event, func_callback) {
    level.a_func_score_events[str_event] = func_callback;
}

// Namespace zm_score/zm_score
// Params 2, eflags: 0x1 linked
// Checksum 0xa5e72a53, Offset: 0x608
// Size: 0x2a
function function_e5d6e6dd(str_archetype, n_score) {
    level.var_c44113ca[str_archetype] = n_score;
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x1 linked
// Checksum 0xb0a5564e, Offset: 0x640
// Size: 0x40
function function_e5ca5733(str_archetype) {
    if (isdefined(str_archetype) && isdefined(level.var_c44113ca[str_archetype])) {
        return level.var_c44113ca[str_archetype];
    }
    return 0;
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x1 linked
// Checksum 0x2d8fbf74, Offset: 0x688
// Size: 0x64
function function_a3d16ee5(s_params) {
    if (isdefined(self.score_event) && isplayer(s_params.eattacker)) {
        scoreevents::processscoreevent(self.score_event, s_params.eattacker, undefined, s_params.weapon);
    }
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0x5955782e, Offset: 0x6f8
// Size: 0x2a
function player_on_spawned() {
    util::wait_network_frame();
    if (isdefined(self)) {
        self.ready_for_score_events = 1;
    }
}

// Namespace zm_score/zm_score
// Params 3, eflags: 0x1 linked
// Checksum 0x33e5d866, Offset: 0x730
// Size: 0x96
function score_cf_register_info(name, version, max_count) {
    for (i = 0; i < 4; i++) {
        clientfield::register("worlduimodel", "PlayerList.client" + i + ".score_cf_" + name, version, getminbitcountfornum(max_count), "counter");
    }
}

// Namespace zm_score/zm_score
// Params 2, eflags: 0x1 linked
// Checksum 0xcc42b126, Offset: 0x7d0
// Size: 0x7c
function score_cf_increment_info(name, var_ce49f2dd = 0) {
    if (!var_ce49f2dd && self bgb::function_69b88b5()) {
        clientfield::increment_world_uimodel("PlayerList.client" + self.entity_num + ".score_cf_" + name);
    }
}

// Namespace zm_score/zm_score
// Params 8, eflags: 0x1 linked
// Checksum 0xaf9f1451, Offset: 0x858
// Size: 0x7d8
function player_add_points(event, mod, hit_location, e_target, zombie_team, damage_weapon, var_96054e3, var_e6e61503 = 0) {
    if (level.intermission) {
        return;
    }
    if (!zm_utility::is_player_valid(self, 0, var_96054e3)) {
        return;
    }
    player_points = 0;
    multiplier = get_points_multiplier(self);
    if (isdefined(level.a_func_score_events[event])) {
        player_points = [[ level.a_func_score_events[event] ]](event, mod, hit_location, zombie_team, damage_weapon);
    } else {
        switch (event) {
        case #"rebuild_board":
        case #"carpenter_powerup":
        case #"nuke_powerup":
        case #"reviver":
        case #"oracle_boon":
        case #"bonus_points_powerup":
            player_points = mod;
            break;
        case #"bonus_points_powerup_shared":
            player_points = mod;
            multiplier = 1;
            break;
        case #"damage_points":
            switch (mod) {
            case 10:
            case 20:
            case 30:
            case 40:
            case 50:
            case 60:
            case 70:
            case 80:
            case 90:
            case 100:
            case 110:
            case 120:
            case 130:
            case 140:
            case 150:
            case 160:
            case 170:
            case 180:
            case 190:
            case 200:
                player_points = mod;
                if (!function_e31cf9d5(event)) {
                    if (mod > 90) {
                        self score_cf_increment_info("damage" + 90, var_e6e61503);
                    } else {
                        self score_cf_increment_info("damage" + mod, var_e6e61503);
                    }
                }
                break;
            }
            break;
        case #"death":
            player_points = e_target.var_f256a4d9;
            if (!isdefined(player_points)) {
                player_points = 0;
            }
            var_dd71ee3e = player_points;
            var_dc75a3a1 = 0;
            while (var_dd71ee3e > 0) {
                while (var_dd71ee3e < level.var_697c8943[var_dc75a3a1] && var_dc75a3a1 < level.var_697c8943.size) {
                    var_dc75a3a1++;
                }
                if (var_dc75a3a1 == level.var_697c8943.size) {
                    break;
                }
                var_dd71ee3e = var_dd71ee3e - level.var_697c8943[var_dc75a3a1];
                if (!function_e31cf9d5(event)) {
                    self score_cf_increment_info("damage" + level.var_697c8943[var_dc75a3a1], var_e6e61503);
                }
            }
            if (!function_e31cf9d5(event)) {
                player_points = self player_add_points_kill_bonus(mod, hit_location, damage_weapon, player_points, var_e6e61503);
            }
            if (mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH") {
                self zm_stats::increment_client_stat("grenade_kills");
                self zm_stats::increment_player_stat("grenade_kills");
            }
            break;
        case #"riotshield_fling":
            player_points = mod;
            if (!var_e6e61503) {
                scoreevents::processscoreevent("kill", self, undefined, damage_weapon);
            }
            break;
        case #"transform_kill":
            self score_cf_increment_info("transform_kill", var_e6e61503);
            if (!var_e6e61503) {
                scoreevents::processscoreevent("transform_kill", self, undefined, damage_weapon);
            }
            player_points = zombie_utility::function_d2dfacfd(#"hash_68aa9b4c8de33261");
            break;
        default:
            /#
                assert(0, "<unknown string>");
            #/
            break;
        }
    }
    if (isdefined(level.player_score_override)) {
        player_points = self [[ level.player_score_override ]](damage_weapon, player_points);
    }
    player_points = multiplier * zm_utility::round_up_score(player_points, 10);
    if (isdefined(self.point_split_receiver) && event == "death") {
        split_player_points = player_points - zm_utility::round_up_score(player_points * self.point_split_keep_percent, 10);
        self.point_split_receiver add_to_player_score(split_player_points);
        player_points = player_points - split_player_points;
    }
    if (event === "rebuild_board") {
        level notify(#"rebuild_board", {#points:player_points, #player:self});
    }
    self add_to_player_score(player_points, 1, event, var_e6e61503);
    if (var_e6e61503 || isdefined(level.var_894a83d8) && level.var_894a83d8 || function_e31cf9d5(event)) {
        return;
    }
    self.pers[#"score"] = self.score;
    if (isdefined(level._game_module_point_adjustment)) {
        level [[ level._game_module_point_adjustment ]](self, zombie_team, player_points);
    }
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x5 linked
// Checksum 0x791ca589, Offset: 0x1038
// Size: 0x54
function private function_e31cf9d5(str_score_event) {
    if (zm_trial_damage_drains_points::is_active(1) && (str_score_event === "death" || str_score_event === "damage_points")) {
        return 1;
    }
    return 0;
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x1 linked
// Checksum 0x4defc801, Offset: 0x1098
// Size: 0xf2
function get_points_multiplier(player) {
    multiplier = isdefined(player zombie_utility::function_73061b82(#"zombie_point_scalar")) ? player zombie_utility::function_73061b82(#"zombie_point_scalar") : zombie_utility::function_6403cf83(#"zombie_point_scalar", player.team);
    if (isdefined(level.current_game_module) && level.current_game_module == 2) {
        if (isdefined(level._race_team_double_points) && level._race_team_double_points == player._race_team) {
            return multiplier;
        } else {
            return 1;
        }
    }
    return multiplier;
}

// Namespace zm_score/zm_score
// Params 5, eflags: 0x1 linked
// Checksum 0x1c27b026, Offset: 0x1198
// Size: 0x29e
function player_add_points_kill_bonus(mod, hit_location, weapon, player_points = undefined, var_e6e61503 = 0) {
    if (mod != "MOD_MELEE") {
        if ("head" == hit_location || "helmet" == hit_location || "neck" == hit_location) {
            scoreevents::processscoreevent("headshot", self, undefined, weapon);
        } else {
            scoreevents::processscoreevent("kill", self, undefined, weapon);
        }
    }
    if (isdefined(level.player_score_override)) {
        new_points = self [[ level.player_score_override ]](weapon, player_points);
        if (new_points > 0 && new_points != player_points) {
            return new_points;
        }
    }
    if (mod == "MOD_MELEE" && (!isdefined(weapon) || !weapon.isriotshield && !zm_loadout::is_hero_weapon(weapon))) {
        self score_cf_increment_info("death_melee", var_e6e61503);
        scoreevents::processscoreevent("melee_kill", self, undefined, weapon);
        return zombie_utility::function_d2dfacfd(#"zombie_score_bonus_melee");
    }
    if (isdefined(player_points)) {
        score = player_points;
    } else {
        score = 0;
    }
    if (isdefined(hit_location)) {
        switch (hit_location) {
        case #"head":
        case #"helmet":
        case #"neck":
            self score_cf_increment_info("death_head", var_e6e61503);
            score = zombie_utility::function_d2dfacfd(#"zombie_score_bonus_head");
            break;
        default:
            break;
        }
    }
    return score;
}

// Namespace zm_score/zm_score
// Params 2, eflags: 0x1 linked
// Checksum 0xfbb70c6, Offset: 0x1440
// Size: 0x4e6
function player_reduce_points(event, n_amount) {
    if (level.intermission || zm_utility::is_standard()) {
        return;
    }
    points = 0;
    switch (event) {
    case #"take_all":
        points = self.score;
        break;
    case #"take_half":
        points = int(self.score / 2);
        break;
    case #"take_specified":
        points = n_amount;
        break;
    case #"no_revive_penalty":
        if (zm_custom::function_901b751c(#"zmpointlossonteammatedeath")) {
            percent = zm_custom::function_901b751c(#"zmpointlossonteammatedeath") / 100;
            points = self.score * percent;
        } else if (level.round_number >= 50) {
            percent = zombie_utility::function_d2dfacfd(#"penalty_no_revive");
            points = self.score * percent;
        }
        break;
    case #"died":
        if (zm_custom::function_901b751c(#"zmpointlossondeath")) {
            percent = zm_custom::function_901b751c(#"zmpointlossondeath") / 100;
            points = self.score * percent;
        } else if (level.round_number >= 50) {
            percent = zombie_utility::function_d2dfacfd(#"penalty_died");
            points = self.score * percent;
        }
        break;
    case #"downed":
        if (level.round_number < 50 && !zm_custom::function_901b751c(#"zmpointlossondown")) {
            percent = 0;
        } else if (zm_custom::function_901b751c(#"zmpointlossondown")) {
            percent = zm_custom::function_901b751c(#"zmpointlossondown") / 100;
        } else {
            percent = zombie_utility::function_d2dfacfd(#"penalty_downed");
            step = zombie_utility::function_d2dfacfd(#"hash_3037a1f286b662e6");
            if (step > 0) {
                percent = percent * int(self.score / step);
            }
            if (percent > 0.5) {
                percent = 0.5;
            }
        }
        self notify(#"i_am_down");
        points = self.score * percent;
        self.score_lost_when_downed = zm_utility::round_up_to_ten(int(points));
        break;
    case #"points_lost_on_hit_percent":
        points = self.score * n_amount;
        break;
    case #"points_lost_on_hit_value":
        points = n_amount;
        break;
    default:
        /#
            assert(0, "<unknown string>");
        #/
        break;
    }
    points = self.score - zm_utility::round_up_to_ten(int(points));
    if (points < 0) {
        points = 0;
    }
    if (points > 4000000) {
        points = 4000000;
    }
    self.score = points;
    self notify(#"reduced_points", {#str_reason:event});
}

// Namespace zm_score/zm_score
// Params 4, eflags: 0x1 linked
// Checksum 0xd607740b, Offset: 0x1930
// Size: 0x336
function add_to_player_score(points, b_add_to_total = 1, str_awarded_by = "", var_e6e61503 = 0) {
    if (!isdefined(points) || level.intermission) {
        return;
    }
    /#
        assert(isplayer(self), "<unknown string>");
    #/
    points = zm_utility::round_up_score(points, 10);
    if (isdefined(level.var_894a83d8) && level.var_894a83d8 || var_e6e61503 || function_e31cf9d5(str_awarded_by)) {
        level thread zm_hero_weapon::function_3fe4a02e(self, points, str_awarded_by);
    } else {
        n_points_to_add_to_currency = bgb::add_to_player_score_override(points, str_awarded_by);
        self.score = self.score + n_points_to_add_to_currency;
        if (self.score > 4000000) {
            self.score = 4000000;
        }
        self.pers[#"score"] = self.score;
        self incrementplayerstat("scoreEarned", n_points_to_add_to_currency);
        self zm_stats::function_301c4be2("boas_scoreEarned", n_points_to_add_to_currency);
        self zm_stats::function_c0c6ab19(#"zearned", n_points_to_add_to_currency, 1);
        level notify(#"earned_points", {#points:points, #player:self});
        level thread zm_hero_weapon::function_3fe4a02e(self, points, str_awarded_by);
        self contracts::increment_zm_contract(#"contract_zm_points", n_points_to_add_to_currency, #"zstandard");
        if (zm_utility::is_standard()) {
            self zm_stats::function_c0c6ab19(#"rush_points", n_points_to_add_to_currency);
        }
        if (b_add_to_total) {
            self.score_total = self.score_total + points;
            level.score_total = level.score_total + points;
        }
        self notify(#"earned_points", {#str_awarded_by:str_awarded_by, #n_points:points});
    }
}

// Namespace zm_score/zm_score
// Params 2, eflags: 0x1 linked
// Checksum 0x12cde234, Offset: 0x1c70
// Size: 0x1de
function minus_to_player_score(points, b_forced = 0) {
    if (!isdefined(points) || level.intermission) {
        return;
    }
    if (self bgb::is_enabled(#"zm_bgb_shopping_free") && !b_forced) {
        self notify(#"hash_14b0ad44336160bc");
        self bgb::do_one_shot_use();
        self playsoundtoplayer(#"zmb_bgb_shoppingfree_coinreturn", self);
        return;
    }
    if (zm_utility::is_standard() && !b_forced) {
        return;
    }
    if (!b_forced) {
        self contracts::increment_zm_contract(#"contract_zm_points_spent", points);
    }
    self.score = self.score - points;
    self.pers[#"score"] = self.score;
    self incrementplayerstat("scoreSpent", points);
    self zm_stats::function_301c4be2("boas_scoreSpent", points);
    level notify(#"spent_points", {#points:points, #player:self});
    self notify(#"spent_points", {#points:points});
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x0
// Checksum 0x565673ac, Offset: 0x1e58
// Size: 0xc
function add_to_team_score(points) {
    
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x0
// Checksum 0x32da4d7c, Offset: 0x1e70
// Size: 0xc
function minus_to_team_score(points) {
    
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0x1b920a20, Offset: 0x1e88
// Size: 0xe0
function player_died_penalty() {
    players = getplayers(self.team);
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player == self) {
            continue;
        }
        if (isdefined(player.is_zombie) && player.is_zombie) {
            continue;
        }
        player player_reduce_points("no_revive_penalty");
    }
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0xee1e0c60, Offset: 0x1f70
// Size: 0x44
function player_downed_penalty() {
    /#
        println("<unknown string>");
    #/
    self player_reduce_points("downed");
}

// Namespace zm_score/zm_score
// Params 2, eflags: 0x1 linked
// Checksum 0x7b31b8ed, Offset: 0x1fc0
// Size: 0x8a
function can_player_purchase(n_cost, var_1c65f833 = 0) {
    if (self.score >= n_cost) {
        return 1;
    }
    if (self bgb::is_enabled(#"zm_bgb_shopping_free")) {
        return 1;
    }
    if (zm_utility::is_standard() && !var_1c65f833) {
        return 1;
    }
    return 0;
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0x390fefeb, Offset: 0x2058
// Size: 0xde
function function_82732ced() {
    if (isdefined(self.var_17a22c08)) {
        var_7afe66bc = self.var_17a22c08;
    } else {
        var_7afe66bc = function_e5ca5733(self.archetype);
        /#
            assert(var_7afe66bc, "<unknown string>" + function_9e72a96(self.archetype) + "<unknown string>");
        #/
    }
    self.var_f256a4d9 = var_7afe66bc;
    self.var_d8caf335 = max(1, int(self.maxhealth / var_7afe66bc * 0.1));
    self.var_8d5c706f = [];
}

// Namespace zm_score/zm_score
// Params 3, eflags: 0x1 linked
// Checksum 0x6e77d77b, Offset: 0x2140
// Size: 0x2f6
function function_89db94b3(e_attacker, n_damage, e_inflictor) {
    if (!isplayer(e_attacker) || !isdefined(self.var_8d5c706f) || isdefined(self.marked_for_death) && self.marked_for_death) {
        return;
    }
    n_index = e_attacker.entity_num;
    if (!isdefined(n_index)) {
        return;
    }
    if (!isdefined(self.var_8d5c706f[n_index])) {
        self.var_8d5c706f[n_index] = 0;
    }
    var_20701980 = self.var_8d5c706f[n_index];
    var_810a69da = var_20701980 + n_damage;
    var_86e74a5c = int(var_20701980 / self.var_d8caf335);
    var_6fb77dc8 = int(var_810a69da / self.var_d8caf335);
    n_points = (var_6fb77dc8 - var_86e74a5c) * 10;
    if (n_points > self.var_f256a4d9) {
        n_points = self.var_f256a4d9;
    }
    if (isdefined(e_attacker zombie_utility::function_73061b82(#"zombie_insta_kill")) && e_attacker zombie_utility::function_73061b82(#"zombie_insta_kill") || isdefined(zombie_utility::function_6403cf83(#"zombie_insta_kill", e_attacker.team)) && zombie_utility::function_6403cf83(#"zombie_insta_kill", e_attacker.team)) {
        n_points = self.var_f256a4d9;
    }
    if (n_points) {
        if (isdefined(e_inflictor) && e_inflictor.var_9fde8624 === #"zombie_wolf_ally") {
            e_attacker player_add_points("damage_points", 70, undefined, undefined, undefined, undefined, undefined, self.var_12745932);
            self.var_f256a4d9 = self.var_f256a4d9 - n_points;
        } else {
            e_attacker player_add_points("damage_points", n_points, undefined, undefined, undefined, undefined, undefined, self.var_12745932);
            self.var_f256a4d9 = self.var_f256a4d9 - n_points;
        }
    }
    self.var_8d5c706f[n_index] = var_810a69da;
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x1 linked
// Checksum 0x84b04a7d, Offset: 0x2440
// Size: 0x32
function function_acaab828(b_disabled = 1) {
    if (isdefined(self)) {
        self.var_12745932 = b_disabled;
    }
}

// Namespace zm_score/zm_score
// Params 0, eflags: 0x1 linked
// Checksum 0xe23813da, Offset: 0x2480
// Size: 0x1c
function function_ffc2d0bc() {
    return self.pers[#"score"];
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x1 linked
// Checksum 0xea9fdbcc, Offset: 0x24a8
// Size: 0x32
function function_c1f146ff(score) {
    self.pers[#"score"] = score;
    self.score = score;
}

// Namespace zm_score/zm_score
// Params 1, eflags: 0x1 linked
// Checksum 0xa40a939b, Offset: 0x24e8
// Size: 0x2be
function function_bc9de425(b_lowest_first = 0) {
    var_5e8a44f9 = [];
    var_e8d2685c = 0;
    foreach (player in getplayers()) {
        if (!isdefined(player.var_9fc3ee66)) {
            player.var_9fc3ee66 = -1;
        }
        if (!isdefined(player.var_a8da9faf)) {
            player.var_a8da9faf = -1;
        }
        if (!isdefined(var_5e8a44f9)) {
            var_5e8a44f9 = [];
        } else if (!isarray(var_5e8a44f9)) {
            var_5e8a44f9 = array(var_5e8a44f9);
        }
        var_5e8a44f9[var_5e8a44f9.size] = player.score;
        if (player.score > 0) {
            var_e8d2685c = 1;
        }
    }
    var_5e8a44f9 = array::sort_by_value(var_5e8a44f9, b_lowest_first);
    var_51639 = 0;
    var_694faff0 = -1;
    foreach (var_f0c1d3c2 in var_5e8a44f9) {
        if (var_e8d2685c && var_f0c1d3c2 != var_694faff0) {
            var_694faff0 = var_f0c1d3c2;
            var_51639++;
        } else {
            continue;
        }
        foreach (player in getplayers()) {
            if (player.score == var_f0c1d3c2) {
                player.var_a8da9faf = player.var_9fc3ee66;
                player.var_9fc3ee66 = var_51639;
            } else {
                continue;
            }
        }
    }
    return var_5e8a44f9;
}

