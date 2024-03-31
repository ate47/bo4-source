// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_server_throttle.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_round_logic.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_power.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_maptable.gsc;
#using scripts\zm_common\zm_magicbox.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_cleanup_mgr.gsc;
#using scripts\zm_common\zm_characters.gsc;
#using scripts\zm_common\zm_camos.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_ai_faller.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\zm_common\util.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\abilities\ability_util.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\player\player_shared.gsc;
#using scripts\core_common\lui_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_message_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_utility;

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x2
// Checksum 0x805f5f09, Offset: 0x748
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_utility", &__init__, &__main__, undefined);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xa3f7096, Offset: 0x798
// Size: 0xd4
function __init__() {
    clientfield::register("scriptmover", "zm_zone_edge_marker_count", 1, getminbitcountfornum(15), "int");
    clientfield::register("toplayer", "zm_zone_out_of_bounds", 1, 1, "int");
    clientfield::register("actor", "flame_corpse_fx", 1, 1, "int");
    clientfield::register("actor", "zombie_eye_glow", 1, 1, "int");
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x878
// Size: 0x4
function __main__() {
    
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x7d2c2644, Offset: 0x888
// Size: 0x1c
function init_utility() {
    level thread check_solo_status();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xc4dbd1e0, Offset: 0x8b0
// Size: 0x40
function is_classic() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"zclassic") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x31e21890, Offset: 0x8f8
// Size: 0x40
function is_standard() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"zstandard") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x7d06d9c, Offset: 0x940
// Size: 0x68
function is_trials() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"ztrials" || level flag::exists(#"ztrial")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x3b1bd0c6, Offset: 0x9b0
// Size: 0x40
function is_tutorial() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"ztutorial") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x26c56425, Offset: 0x9f8
// Size: 0x40
function is_grief() {
    str_gametype = util::get_game_type();
    if (str_gametype == #"zgrief") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x1 linked
// Checksum 0xa99d7c79, Offset: 0xa40
// Size: 0xfa
function function_d6046228(var_67441581, var_756ee4e5, var_bcb9de3e, var_299ea954, str_trials, var_1e31f083) {
    if (is_trials()) {
        if (function_8b1a219a() && isdefined(var_1e31f083)) {
            return var_1e31f083;
        } else if (isdefined(str_trials)) {
            return str_trials;
        }
    } else if (is_standard()) {
        if (function_8b1a219a() && isdefined(var_299ea954)) {
            return var_299ea954;
        } else if (isdefined(var_bcb9de3e)) {
            return var_bcb9de3e;
        }
    }
    if (function_8b1a219a() && isdefined(var_756ee4e5)) {
        return var_756ee4e5;
    }
    return var_67441581;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x40edf07c, Offset: 0xb48
// Size: 0x12
function get_cast() {
    return zm_maptable::get_cast();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x26aba9d4, Offset: 0xb68
// Size: 0x12
function get_story() {
    return zm_maptable::get_story();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x15e2a6f5, Offset: 0xb88
// Size: 0x82
function check_solo_status() {
    if (getnumexpectedplayers() == 1 && (!sessionmodeisonlinegame() || !sessionmodeisprivate() || zm_trial::is_trial_mode())) {
        level.is_forever_solo_game = 1;
        return;
    }
    level.is_forever_solo_game = 0;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xab9376d3, Offset: 0xc18
// Size: 0x1bc
function init_zombie_run_cycle() {
    if (isdefined(level.speed_change_round)) {
        if (!isdefined(self._starting_round_number)) {
            self._starting_round_number = level.round_number;
        }
        if (self._starting_round_number >= level.speed_change_round) {
            speed_percent = 0.2 + (self._starting_round_number - level.speed_change_round) * 0.2;
            speed_percent = min(speed_percent, 1);
            change_round_max = int(level.speed_change_max * speed_percent);
            change_left = change_round_max - level.speed_change_num;
            if (change_left == 0) {
                self zombie_utility::set_zombie_run_cycle();
                return;
            }
            change_speed = randomint(100);
            if (change_speed > 80) {
                self change_zombie_run_cycle();
                return;
            }
            zombie_count = zombie_utility::get_current_zombie_count();
            zombie_left = level.zombie_ai_limit - zombie_count;
            if (zombie_left == change_left) {
                self change_zombie_run_cycle();
                return;
            }
        }
    }
    self zombie_utility::set_zombie_run_cycle();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x704eb5d9, Offset: 0xde0
// Size: 0x74
function change_zombie_run_cycle() {
    level.speed_change_num++;
    if (level.gamedifficulty == 0) {
        self zombie_utility::set_zombie_run_cycle("sprint");
    } else {
        self zombie_utility::set_zombie_run_cycle("run");
    }
    self thread speed_change_watcher();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x40f17096, Offset: 0xe60
// Size: 0x24
function make_supersprinter() {
    self zombie_utility::set_zombie_run_cycle("super_sprint");
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xe61398f1, Offset: 0xe90
// Size: 0x34
function speed_change_watcher() {
    self waittill(#"death");
    if (level.speed_change_num > 0) {
        level.speed_change_num--;
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x57acea2c, Offset: 0xed0
// Size: 0x522
function move_zombie_spawn_location(spot) {
    self endon(#"death");
    if (isdefined(self.spawn_pos)) {
        self notify(#"risen", {#find_flesh_struct_string:self.spawn_pos.script_string});
        return;
    }
    self.spawn_pos = spot;
    if (isdefined(spot.target)) {
        self.target = spot.target;
    }
    if (isdefined(spot.zone_name)) {
        self.zone_name = spot.zone_name;
        self.previous_zone_name = spot.zone_name;
    }
    if (isdefined(spot.script_parameters)) {
        self.script_parameters = spot.script_parameters;
    }
    if (!isdefined(spot.script_noteworthy)) {
        spot.script_noteworthy = "spawn_location";
    }
    tokens = strtok(spot.script_noteworthy, " ");
    foreach (index, token in tokens) {
        if (isdefined(self.spawn_point_override)) {
            spot = self.spawn_point_override;
            token = spot.script_noteworthy;
        }
        if (token == "custom_spawner_entry") {
            next_token = index + 1;
            if (isdefined(tokens[next_token])) {
                str_spawn_entry = tokens[next_token];
                if (isdefined(level.custom_spawner_entry) && isdefined(level.custom_spawner_entry[str_spawn_entry])) {
                    self thread [[ level.custom_spawner_entry[str_spawn_entry] ]](spot);
                    continue;
                }
            }
        }
        if (token == "riser_location") {
            self thread zm_spawner::do_zombie_rise(spot);
            continue;
        }
        if (token == "faller_location") {
            self thread zm_ai_faller::do_zombie_fall(spot);
            continue;
        }
        if (token == "spawn_location") {
            if (isdefined(self.anchor)) {
                return;
            }
            self.anchor = spawn("script_origin", self.origin);
            self.anchor.angles = self.angles;
            self linkto(self.anchor);
            self.anchor thread anchor_delete_failsafe(self);
            if (!isdefined(spot.angles)) {
                spot.angles = (0, 0, 0);
            }
            self ghost();
            self.anchor moveto(spot.origin, 0.05);
            self.anchor waittill(#"movedone");
            target_org = zombie_utility::get_desired_origin();
            if (isdefined(target_org)) {
                anim_ang = vectortoangles(target_org - self.origin);
                self.anchor rotateto((0, anim_ang[1], 0), 0.05);
                self.anchor waittill(#"rotatedone");
            }
            if (isdefined(level.zombie_spawn_fx)) {
                playfx(level.zombie_spawn_fx, spot.origin);
            }
            self unlink();
            if (isdefined(self.anchor)) {
                self.anchor delete();
            }
            if (!(isdefined(self.dontshow) && self.dontshow)) {
                self show();
            }
            self notify(#"risen", {#find_flesh_struct_string:spot.script_string});
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x29003f28, Offset: 0x1400
// Size: 0x5c
function anchor_delete_failsafe(ai_zombie) {
    ai_zombie endon(#"risen");
    ai_zombie waittill(#"death");
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xb35eaaef, Offset: 0x1468
// Size: 0xd2
function all_chunks_intact(barrier, barrier_chunks) {
    if (isdefined(barrier.zbarrier)) {
        pieces = barrier.zbarrier getzbarrierpieceindicesinstate("closed");
        if (pieces.size != barrier.zbarrier getnumzbarrierpieces()) {
            return false;
        }
    } else {
        for (i = 0; i < barrier_chunks.size; i++) {
            if (barrier_chunks[i] get_chunk_state() != "repaired") {
                return false;
            }
        }
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xac911452, Offset: 0x1548
// Size: 0xba
function no_valid_repairable_boards(barrier, barrier_chunks) {
    if (isdefined(barrier.zbarrier)) {
        pieces = barrier.zbarrier getzbarrierpieceindicesinstate("open");
        if (pieces.size) {
            return false;
        }
    } else {
        for (i = 0; i < barrier_chunks.size; i++) {
            if (barrier_chunks[i] get_chunk_state() == "destroyed") {
                return false;
            }
        }
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x23a38c27, Offset: 0x1610
// Size: 0x6
function is_survival() {
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x23a38c27, Offset: 0x1620
// Size: 0x6
function is_encounter() {
    return false;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xdd740c33, Offset: 0x1630
// Size: 0x13a
function all_chunks_destroyed(barrier, barrier_chunks) {
    if (isdefined(barrier.zbarrier)) {
        pieces = arraycombine(barrier.zbarrier getzbarrierpieceindicesinstate("open"), barrier.zbarrier getzbarrierpieceindicesinstate("opening"), 1, 0);
        if (pieces.size != barrier.zbarrier getnumzbarrierpieces()) {
            return false;
        }
    } else if (isdefined(barrier_chunks)) {
        /#
            assert(isdefined(barrier_chunks), "sound_done");
        #/
        for (i = 0; i < barrier_chunks.size; i++) {
            if (barrier_chunks[i] get_chunk_state() != "destroyed") {
                return false;
            }
        }
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x9bd0a4cb, Offset: 0x1778
// Size: 0x210
function check_point_in_playable_area(origin) {
    if (function_21f4ac36() && !isdefined(level.var_a2a9b2de)) {
        level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
    }
    if (function_c85ebbbc() && !isdefined(level.playable_area)) {
        level.playable_area = getentarray("player_volume", "script_noteworthy");
    }
    valid_point = 0;
    if (isdefined(level.var_a2a9b2de)) {
        node = function_52c1730(origin + vectorscale((0, 0, 1), 40), level.var_a2a9b2de, 500);
        if (isdefined(node)) {
            valid_point = 1;
        }
    }
    if (isdefined(level.playable_area) && !valid_point) {
        if (!isdefined(level.check_model)) {
            level.check_model = spawn("script_model", origin + vectorscale((0, 0, 1), 40));
        } else {
            level.check_model.origin = origin + vectorscale((0, 0, 1), 40);
        }
        for (i = 0; i < level.playable_area.size; i++) {
            if (level.check_model istouching(level.playable_area[i])) {
                valid_point = 1;
                break;
            }
        }
    }
    return valid_point;
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x714f0ea0, Offset: 0x1990
// Size: 0x398
function check_point_in_enabled_zone(origin, zone_is_active, player_zones, player_regions) {
    if (isdefined(level.var_304d38af) && ![[ level.var_304d38af ]](origin)) {
        return 0;
    }
    if (function_c85ebbbc() && !isdefined(level.playable_area)) {
        level.playable_area = getentarray("player_volume", "script_noteworthy");
    }
    if (!isdefined(player_zones)) {
        player_zones = level.playable_area;
    }
    if (function_21f4ac36() && !isdefined(level.player_regions)) {
        level.player_regions = getnodearray("player_region", "script_noteworthy");
    }
    if (!isdefined(player_regions)) {
        player_regions = level.player_regions;
    }
    if (!isdefined(level.zones) || !isdefined(player_zones) && !isdefined(player_regions)) {
        return 1;
    }
    one_valid_zone = 0;
    if (isdefined(player_regions)) {
        node = function_52c1730(origin + vectorscale((0, 0, 1), 40), player_regions, 500);
        if (isdefined(node)) {
            zone = level.zones[node.targetname];
            if (isdefined(zone) && isdefined(zone.is_enabled) && zone.is_enabled) {
                if (zone_is_active === 1 && !(isdefined(zone.is_active) && zone.is_active)) {
                    one_valid_zone = 0;
                } else {
                    one_valid_zone = 1;
                }
            }
        }
    }
    if (isdefined(player_zones) && !one_valid_zone) {
        if (!isdefined(level.e_check_point)) {
            level.e_check_point = spawn("script_origin", origin + vectorscale((0, 0, 1), 40));
        } else {
            level.e_check_point.origin = origin + vectorscale((0, 0, 1), 40);
        }
        for (i = 0; i < player_zones.size; i++) {
            zone = level.zones[player_zones[i].targetname];
            if (isdefined(zone) && isdefined(zone.is_enabled) && zone.is_enabled) {
                if (isdefined(zone_is_active) && zone_is_active == 1 && !(isdefined(zone.is_active) && zone.is_active)) {
                    continue;
                }
                if (level.e_check_point istouching(player_zones[i])) {
                    one_valid_zone = 1;
                    break;
                }
            }
        }
    }
    return one_valid_zone;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xd4a7ac74, Offset: 0x1d30
// Size: 0x46
function round_up_to_ten(score) {
    new_score = score - score % 10;
    if (new_score < score) {
        new_score = new_score + 10;
    }
    return new_score;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x255514b9, Offset: 0x1d80
// Size: 0x68
function round_up_score(score, value) {
    score = int(score);
    new_score = score - score % value;
    if (new_score < score) {
        new_score = new_score + value;
    }
    return new_score;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xd738ce77, Offset: 0x1df0
// Size: 0x3a
function halve_score(n_score) {
    n_score = n_score / 2;
    n_score = round_up_score(n_score, 10);
    return n_score;
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x1 linked
// Checksum 0xc3b0e056, Offset: 0x1e38
// Size: 0x1ec
function create_zombie_point_of_interest(attract_dist, num_attractors, added_poi_value, start_turned_on, initial_attract_func, arrival_attract_func, poi_team) {
    if (!is_point_inside_enabled_zone(self.origin)) {
        return;
    }
    if (!isdefined(added_poi_value)) {
        self.added_poi_value = 0;
    } else {
        self.added_poi_value = added_poi_value;
    }
    if (!isdefined(start_turned_on)) {
        start_turned_on = 1;
    }
    if (!isdefined(attract_dist)) {
        attract_dist = 1536;
    }
    self.script_noteworthy = "zombie_poi";
    self.poi_active = start_turned_on;
    if (isdefined(attract_dist)) {
        self.max_attractor_dist = attract_dist;
        self.poi_radius = attract_dist * attract_dist;
    } else {
        self.poi_radius = undefined;
    }
    self.num_poi_attracts = num_attractors;
    self.attract_to_origin = 1;
    self.attractor_array = [];
    self.initial_attract_func = undefined;
    self.arrival_attract_func = undefined;
    if (isdefined(poi_team)) {
        self._team = poi_team;
    }
    if (isdefined(initial_attract_func)) {
        self.initial_attract_func = initial_attract_func;
    }
    if (isdefined(arrival_attract_func)) {
        self.arrival_attract_func = arrival_attract_func;
    }
    if (!isdefined(level.zombie_poi_array)) {
        level.zombie_poi_array = [];
    } else if (!isarray(level.zombie_poi_array)) {
        level.zombie_poi_array = array(level.zombie_poi_array);
    }
    level.zombie_poi_array[level.zombie_poi_array.size] = self;
    self thread watch_for_poi_death();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x6e822c2f, Offset: 0x2030
// Size: 0x54
function watch_for_poi_death() {
    self waittill(#"death");
    if (isinarray(level.zombie_poi_array, self)) {
        arrayremovevalue(level.zombie_poi_array, self);
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x2925c5fb, Offset: 0x2090
// Size: 0x132
function debug_draw_new_attractor_positions() {
    self endon(#"death");
    while (true) {
        foreach (attract in self.attractor_positions) {
            passed = bullettracepassed(attract[0] + vectorscale((0, 0, 1), 24), self.origin + vectorscale((0, 0, 1), 24), 0, self);
            if (passed) {
                /#
                    debugstar(attract[0], 6, (1, 1, 1));
                #/
                continue;
            }
            /#
                debugstar(attract[0], 6, (1, 0, 0));
            #/
        }
        waitframe(1);
    }
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0xc212fa7b, Offset: 0x21d0
// Size: 0x564
function create_zombie_point_of_interest_attractor_positions(var_b09c2334 = 15, n_height = 60, var_6b5dd73c, var_7262d151 = 0) {
    self endon(#"death");
    if (!isdefined(self.num_poi_attracts) || isdefined(self.script_noteworthy) && self.script_noteworthy != "zombie_poi") {
        return false;
    }
    queryresult = positionquery_source_navigation(self.origin, var_b09c2334 / 2, isdefined(var_6b5dd73c) ? var_6b5dd73c : self.max_attractor_dist, n_height / 2, var_b09c2334 / 2, 1, var_b09c2334 / 2);
    if (var_7262d151) {
        var_7162cf15 = getclosestpointonnavmesh(self.origin, var_6b5dd73c);
    } else {
        var_7162cf15 = getclosestpointonnavmesh(self.origin);
    }
    if (!isdefined(var_7162cf15)) {
        return false;
    }
    if (queryresult.data.size < self.num_poi_attracts) {
        self.num_poi_attracts = queryresult.data.size;
    }
    position_index = 0;
    for (i = 0; i < queryresult.data.size; i++) {
        if (!tracepassedonnavmesh(var_7162cf15, queryresult.data[i].origin, 15)) {
            /#
                if (isdefined(level.var_565d6ce0) && level.var_565d6ce0) {
                    recordstar(queryresult.data[i].origin, (1, 0, 0));
                    record3dtext("<unknown string>", queryresult.data[i].origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
                }
            #/
            continue;
        }
        if (isdefined(level.validate_poi_attractors) && level.validate_poi_attractors) {
            passed = bullettracepassed(queryresult.data[i].origin + vectorscale((0, 0, 1), 24), self.origin + vectorscale((0, 0, 1), 24), 0, self);
            if (passed) {
                self.attractor_positions[position_index] = queryresult.data[i].origin;
                position_index++;
            } else {
                /#
                    if (isdefined(level.var_565d6ce0) && level.var_565d6ce0) {
                        recordstar(queryresult.data[i].origin, (1, 0, 0));
                        record3dtext("<unknown string>", queryresult.data[i].origin + vectorscale((0, 0, 1), 8), (1, 0, 0));
                    }
                #/
            }
        } else if (isdefined(self.var_abfcb0d9) && self.var_abfcb0d9) {
            if (check_point_in_enabled_zone(queryresult.data[i].origin) && check_point_in_playable_area(queryresult.data[i].origin)) {
                self.attractor_positions[position_index] = queryresult.data[i].origin;
                position_index++;
            }
        } else {
            self.attractor_positions[position_index] = queryresult.data[i].origin;
            position_index++;
            /#
                if (isdefined(level.var_565d6ce0) && level.var_565d6ce0) {
                    recordstar(queryresult.data[i].origin, (0, 1, 0));
                }
            #/
        }
        if (self.num_poi_attracts == position_index) {
            break;
        }
    }
    if (!isdefined(self.attractor_positions)) {
        self.attractor_positions = [];
    }
    self.attract_to_origin = 0;
    self notify(#"attractor_positions_generated");
    level notify(#"attractor_positions_generated");
    return true;
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x0
// Checksum 0xa9b99a52, Offset: 0x2740
// Size: 0x416
function generated_radius_attract_positions(forward, offset, num_positions, attract_radius) {
    self endon(#"death");
    failed = 0;
    degs_per_pos = 360 / num_positions;
    for (i = offset; i < 360 + offset; i = i + degs_per_pos) {
        altforward = forward * attract_radius;
        rotated_forward = (cos(i) * altforward[0] - sin(i) * altforward[1], sin(i) * altforward[0] + cos(i) * altforward[1], altforward[2]);
        if (isdefined(level.poi_positioning_func)) {
            pos = [[ level.poi_positioning_func ]](self.origin, rotated_forward);
        } else if (isdefined(level.use_alternate_poi_positioning) && level.use_alternate_poi_positioning) {
            pos = zm_server_throttle::server_safe_ground_trace("poi_trace", 10, self.origin + rotated_forward + vectorscale((0, 0, 1), 10));
        } else {
            pos = zm_server_throttle::server_safe_ground_trace("poi_trace", 10, self.origin + rotated_forward + vectorscale((0, 0, 1), 100));
        }
        if (!isdefined(pos)) {
            failed++;
            continue;
        }
        if (isdefined(level.use_alternate_poi_positioning) && level.use_alternate_poi_positioning) {
            if (isdefined(self) && isdefined(self.origin)) {
                if (self.origin[2] >= pos[2] - 1 && self.origin[2] - pos[2] <= 150) {
                    pos_array = [];
                    pos_array[0] = pos;
                    pos_array[1] = self;
                    if (!isdefined(self.attractor_positions)) {
                        self.attractor_positions = [];
                    } else if (!isarray(self.attractor_positions)) {
                        self.attractor_positions = array(self.attractor_positions);
                    }
                    self.attractor_positions[self.attractor_positions.size] = pos_array;
                }
            } else {
                failed++;
            }
            continue;
        }
        if (abs(pos[2] - self.origin[2]) < 60) {
            pos_array = [];
            pos_array[0] = pos;
            pos_array[1] = self;
            if (!isdefined(self.attractor_positions)) {
                self.attractor_positions = [];
            } else if (!isarray(self.attractor_positions)) {
                self.attractor_positions = array(self.attractor_positions);
            }
            self.attractor_positions[self.attractor_positions.size] = pos_array;
            continue;
        }
        failed++;
    }
    return failed;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x193ea125, Offset: 0x2b60
// Size: 0x9a
function debug_draw_attractor_positions() {
    /#
        while (true) {
            while (!isdefined(self.attractor_positions)) {
                waitframe(1);
                continue;
            }
            for (i = 0; i < self.attractor_positions.size; i++) {
                line(self.origin, self.attractor_positions[i][0], (1, 0, 0), 1, 1);
            }
            waitframe(1);
            if (!isdefined(self)) {
                return;
            }
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x3bedd196, Offset: 0x2c08
// Size: 0x9a
function debug_draw_claimed_attractor_positions() {
    /#
        while (true) {
            while (!isdefined(self.claimed_attractor_positions)) {
                waitframe(1);
                continue;
            }
            for (i = 0; i < self.claimed_attractor_positions.size; i++) {
                line(self.origin, self.claimed_attractor_positions[i][0], (0, 1, 0), 1, 1);
            }
            waitframe(1);
            if (!isdefined(self)) {
                return;
            }
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x24c31711, Offset: 0x2cb0
// Size: 0x458
function get_zombie_point_of_interest(origin, poi_array) {
    aiprofile_beginentry("get_zombie_point_of_interest");
    if (isdefined(self.ignore_all_poi) && self.ignore_all_poi) {
        aiprofile_endentry();
        return undefined;
    }
    curr_radius = undefined;
    if (isdefined(poi_array)) {
        ent_array = poi_array;
    } else {
        ent_array = level.zombie_poi_array;
    }
    best_poi = undefined;
    position = undefined;
    best_dist = 100000000;
    for (i = 0; i < ent_array.size; i++) {
        if (!isdefined(ent_array[i]) || !isdefined(ent_array[i].poi_active) || !ent_array[i].poi_active) {
            continue;
        }
        if (isdefined(self.ignore_poi_targetname) && self.ignore_poi_targetname.size > 0 && isinarray(self.ignore_poi_targetname, ent_array[i].targetname)) {
            continue;
        }
        if (isdefined(self.ignore_poi) && self.ignore_poi.size > 0 && isinarray(self.ignore_poi, ent_array[i])) {
            continue;
        }
        dist = distancesquared(origin, ent_array[i].origin);
        dist = dist - ent_array[i].added_poi_value;
        if (isdefined(ent_array[i].poi_radius)) {
            curr_radius = ent_array[i].poi_radius;
        }
        if ((!isdefined(curr_radius) || dist < curr_radius) && dist < best_dist && ent_array[i] can_attract(self)) {
            best_poi = ent_array[i];
            best_dist = dist;
        }
    }
    if (isdefined(best_poi)) {
        if (isdefined(best_poi._team)) {
            if (isdefined(self._race_team) && self._race_team != best_poi._team) {
                aiprofile_endentry();
                return undefined;
            }
        }
        if (isdefined(best_poi._new_ground_trace) && best_poi._new_ground_trace) {
            position = [];
            position[0] = groundpos_ignore_water_new(best_poi.origin + vectorscale((0, 0, 1), 100));
            position[1] = self;
        } else if (isdefined(best_poi.attract_to_origin) && best_poi.attract_to_origin) {
            position = [];
            position[0] = groundpos(best_poi.origin + vectorscale((0, 0, 1), 100));
            position[1] = self;
        } else {
            position = self add_poi_attractor(best_poi);
        }
        if (isdefined(best_poi.initial_attract_func)) {
            self thread [[ best_poi.initial_attract_func ]](best_poi);
        }
        if (isdefined(best_poi.arrival_attract_func)) {
            self thread [[ best_poi.arrival_attract_func ]](best_poi);
        }
    }
    aiprofile_endentry();
    return position;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x55df110c, Offset: 0x3110
// Size: 0x26
function activate_zombie_point_of_interest() {
    if (self.script_noteworthy != "zombie_poi") {
        return;
    }
    self.poi_active = 1;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x4630ab98, Offset: 0x3140
// Size: 0x124
function deactivate_zombie_point_of_interest(dont_remove) {
    if (!isdefined(self.script_noteworthy) || self.script_noteworthy != "zombie_poi") {
        return;
    }
    self.attractor_array = array::remove_undefined(self.attractor_array);
    for (i = 0; i < self.attractor_array.size; i++) {
        self.attractor_array[i] notify(#"kill_poi");
    }
    self.attractor_array = [];
    self.claimed_attractor_positions = [];
    self.attractor_positions = [];
    self.poi_active = 0;
    if (isdefined(dont_remove) && dont_remove) {
        return;
    }
    if (isdefined(self)) {
        if (isinarray(level.zombie_poi_array, self)) {
            arrayremovevalue(level.zombie_poi_array, self);
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0x78e3e978, Offset: 0x3270
// Size: 0x110
function assign_zombie_point_of_interest(origin, poi) {
    position = undefined;
    doremovalthread = 0;
    if (isdefined(poi) && poi can_attract(self)) {
        if (!isdefined(poi.attractor_array) || isdefined(poi.attractor_array) && !isinarray(poi.attractor_array, self)) {
            doremovalthread = 1;
        }
        position = self add_poi_attractor(poi);
        if (isdefined(position) && doremovalthread && isinarray(poi.attractor_array, self)) {
            self thread update_on_poi_removal(poi);
        }
    }
    return position;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdbec1419, Offset: 0x3388
// Size: 0xe0
function remove_poi_attractor(zombie_poi) {
    if (!isdefined(zombie_poi) || !isdefined(zombie_poi.attractor_array)) {
        return;
    }
    for (i = 0; i < zombie_poi.attractor_array.size; i++) {
        if (zombie_poi.attractor_array[i] == self) {
            arrayremovevalue(zombie_poi.attractor_array, zombie_poi.attractor_array[i]);
            arrayremovevalue(zombie_poi.claimed_attractor_positions, zombie_poi.claimed_attractor_positions[i]);
            if (isdefined(self)) {
                self notify(#"kill_poi");
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x3c3314a9, Offset: 0x3470
// Size: 0x64
function array_check_for_dupes_using_compare(array, single, is_equal_fn) {
    for (i = 0; i < array.size; i++) {
        if ([[ is_equal_fn ]](array[i], single)) {
            return false;
        }
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xfb5ba1c6, Offset: 0x34e0
// Size: 0x26
function poi_locations_equal(loc1, loc2) {
    return loc1[0] == loc2[0];
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xff6864ee, Offset: 0x3510
// Size: 0x410
function add_poi_attractor(zombie_poi) {
    if (!isdefined(zombie_poi)) {
        return;
    }
    if (!isdefined(zombie_poi.attractor_array)) {
        zombie_poi.attractor_array = [];
    }
    if (!isinarray(zombie_poi.attractor_array, self)) {
        if (!isdefined(zombie_poi.claimed_attractor_positions)) {
            zombie_poi.claimed_attractor_positions = [];
        }
        if (!isdefined(zombie_poi.attractor_positions) || zombie_poi.attractor_positions.size <= 0) {
            return undefined;
        }
        best_dist = 100000000;
        best_pos = undefined;
        for (i = 0; i <= zombie_poi.attractor_positions.size; i++) {
            if (!isdefined(zombie_poi.attractor_positions[i])) {
                continue;
            }
            if (!isinarray(zombie_poi.claimed_attractor_positions, zombie_poi.attractor_positions[i])) {
                if (isdefined(zombie_poi.attractor_positions[i]) && isdefined(self.origin)) {
                    dist = distancesquared(zombie_poi.attractor_positions[i], zombie_poi.origin);
                    if (dist < best_dist || !isdefined(best_pos)) {
                        best_dist = dist;
                        best_pos = zombie_poi.attractor_positions[i];
                    }
                }
            }
        }
        if (!isdefined(best_pos)) {
            if (isdefined(level.validate_poi_attractors) && level.validate_poi_attractors) {
                valid_pos = [];
                valid_pos[0] = zombie_poi.origin;
                valid_pos[1] = zombie_poi;
                return valid_pos;
            }
            return undefined;
        }
        if (!isdefined(zombie_poi.attractor_array)) {
            zombie_poi.attractor_array = [];
        } else if (!isarray(zombie_poi.attractor_array)) {
            zombie_poi.attractor_array = array(zombie_poi.attractor_array);
        }
        zombie_poi.attractor_array[zombie_poi.attractor_array.size] = self;
        self thread update_poi_on_death(zombie_poi);
        if (!isdefined(zombie_poi.claimed_attractor_positions)) {
            zombie_poi.claimed_attractor_positions = [];
        } else if (!isarray(zombie_poi.claimed_attractor_positions)) {
            zombie_poi.claimed_attractor_positions = array(zombie_poi.claimed_attractor_positions);
        }
        zombie_poi.claimed_attractor_positions[zombie_poi.claimed_attractor_positions.size] = best_pos;
        return array(best_pos, zombie_poi);
    } else {
        for (i = 0; i < zombie_poi.attractor_array.size; i++) {
            if (zombie_poi.attractor_array[i] == self) {
                if (isdefined(zombie_poi.claimed_attractor_positions) && isdefined(zombie_poi.claimed_attractor_positions[i])) {
                    return array(zombie_poi.claimed_attractor_positions[i], zombie_poi);
                }
            }
        }
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xed4452cb, Offset: 0x3928
// Size: 0xa6
function can_attract(attractor) {
    if (!isdefined(self.attractor_array)) {
        self.attractor_array = [];
    }
    if (isdefined(self.attracted_array) && !isinarray(self.attracted_array, attractor)) {
        return false;
    }
    if (isinarray(self.attractor_array, attractor)) {
        return true;
    }
    if (isdefined(self.num_poi_attracts) && self.attractor_array.size >= self.num_poi_attracts) {
        return false;
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xd1c1ead0, Offset: 0x39d8
// Size: 0x4c
function update_poi_on_death(zombie_poi) {
    self endon(#"kill_poi");
    self waittill(#"death");
    self remove_poi_attractor(zombie_poi);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x1d38274b, Offset: 0x3a30
// Size: 0xb6
function update_on_poi_removal(zombie_poi) {
    zombie_poi waittill(#"death");
    if (!isdefined(zombie_poi.attractor_array)) {
        return;
    }
    for (i = 0; i < zombie_poi.attractor_array.size; i++) {
        if (zombie_poi.attractor_array[i] == self) {
            arrayremoveindex(zombie_poi.attractor_array, i);
            arrayremoveindex(zombie_poi.claimed_attractor_positions, i);
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0x75639a67, Offset: 0x3af0
// Size: 0x192
function invalidate_attractor_pos(attractor_pos, zombie) {
    if (!isdefined(self) || !isdefined(attractor_pos)) {
        wait(0.1);
        return undefined;
    }
    if (isdefined(self.attractor_positions) && !array_check_for_dupes_using_compare(self.attractor_positions, attractor_pos, &poi_locations_equal)) {
        index = 0;
        for (i = 0; i < self.attractor_positions.size; i++) {
            if (poi_locations_equal(self.attractor_positions[i], attractor_pos)) {
                index = i;
            }
        }
        arrayremovevalue(self.attractor_array, zombie);
        arrayremovevalue(self.attractor_positions, attractor_pos);
        for (i = 0; i < self.claimed_attractor_positions.size; i++) {
            if (self.claimed_attractor_positions[i][0] == attractor_pos[0]) {
                arrayremovevalue(self.claimed_attractor_positions, self.claimed_attractor_positions[i]);
            }
        }
    } else {
        wait(0.1);
    }
    return get_zombie_point_of_interest(zombie.origin);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xbb470f99, Offset: 0x3c90
// Size: 0x90
function remove_poi_from_ignore_list(poi) {
    if (isdefined(self.ignore_poi) && self.ignore_poi.size > 0) {
        for (i = 0; i < self.ignore_poi.size; i++) {
            if (self.ignore_poi[i] == poi) {
                arrayremovevalue(self.ignore_poi, self.ignore_poi[i]);
                return;
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x62e8bc7b, Offset: 0x3d28
// Size: 0xae
function add_poi_to_ignore_list(poi) {
    if (!isdefined(self.ignore_poi)) {
        self.ignore_poi = [];
    }
    add_poi = 1;
    if (self.ignore_poi.size > 0) {
        for (i = 0; i < self.ignore_poi.size; i++) {
            if (self.ignore_poi[i] == poi) {
                add_poi = 0;
                break;
            }
        }
    }
    if (add_poi) {
        self.ignore_poi[self.ignore_poi.size] = poi;
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa706070, Offset: 0x3de0
// Size: 0x54
function default_validate_enemy_path_length(player) {
    d = distancesquared(self.origin, player.origin);
    if (d <= 1296) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x132e9f10, Offset: 0x3e40
// Size: 0xca
function function_d0f02e71(archetype) {
    if (!isdefined(level.var_58903b1f)) {
        level.var_58903b1f = [];
    }
    if (!isdefined(level.var_58903b1f)) {
        level.var_58903b1f = [];
    } else if (!isarray(level.var_58903b1f)) {
        level.var_58903b1f = array(level.var_58903b1f);
    }
    if (!isinarray(level.var_58903b1f, archetype)) {
        level.var_58903b1f[level.var_58903b1f.size] = archetype;
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xaee9611, Offset: 0x3f18
// Size: 0x238
function function_55295a16() {
    level waittill(#"start_of_round");
    while (true) {
        reset_closest_player = 1;
        zombies = [];
        if (isdefined(level.var_58903b1f)) {
            foreach (archetype in level.var_58903b1f) {
                ai = getaiarchetypearray(archetype, level.zombie_team);
                if (ai.size) {
                    zombies = arraycombine(zombies, ai, 0, 0);
                }
            }
        }
        foreach (zombie in zombies) {
            if (isdefined(zombie.need_closest_player) && zombie.need_closest_player) {
                reset_closest_player = 0;
                zombie.var_3a610ea4 = undefined;
                break;
            }
            zombie.var_3a610ea4 = undefined;
        }
        if (reset_closest_player) {
            foreach (zombie in zombies) {
                if (isdefined(zombie.need_closest_player)) {
                    zombie.need_closest_player = 1;
                    /#
                        zombie.var_26f25576 = undefined;
                    #/
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x5 linked
// Checksum 0x7925afa7, Offset: 0x4158
// Size: 0xea
function private function_5dcc54a8(players) {
    if (isdefined(self.last_closest_player) && isdefined(self.last_closest_player.am_i_valid) && self.last_closest_player.am_i_valid) {
        return;
    }
    self.need_closest_player = 1;
    foreach (player in players) {
        if (isdefined(player.am_i_valid) && player.am_i_valid) {
            self.last_closest_player = player;
            return;
        }
    }
    self.last_closest_player = undefined;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xd6f46295, Offset: 0x4250
// Size: 0x74a
function function_c52e1749(origin, players) {
    if (players.size == 0) {
        return undefined;
    }
    if (isdefined(self.zombie_poi)) {
        return undefined;
    }
    if (players.size == 1) {
        self.last_closest_player = players[0];
        self.var_c6e0686b = distancesquared(players[0].origin, origin);
        return self.last_closest_player;
    }
    if (!isdefined(self.last_closest_player)) {
        self.last_closest_player = players[0];
    }
    if (!isdefined(self.need_closest_player)) {
        self.need_closest_player = 1;
    }
    level.last_closest_time = level.time;
    self.need_closest_player = 0;
    var_88e86621 = spawnstruct();
    var_88e86621.height = self function_6a9ae71();
    var_88e86621.radius = self getpathfindingradius();
    var_88e86621.origin = origin;
    if (isdefined(self.var_6392b6c4)) {
        var_448ee423 = self [[ self.var_6392b6c4 ]](origin, players);
        playerpositions = [];
        if (isdefined(var_448ee423)) {
            foreach (var_5063dbdc in var_448ee423) {
                if (isdefined(var_5063dbdc.origin)) {
                    if (!isdefined(playerpositions)) {
                        playerpositions = [];
                    } else if (!isarray(playerpositions)) {
                        playerpositions = array(playerpositions);
                    }
                    playerpositions[playerpositions.size] = var_5063dbdc.origin;
                }
            }
        } else {
            var_448ee423 = [];
        }
    } else {
        playerpositions = [];
        var_448ee423 = [];
        foreach (player in players) {
            player_pos = player.last_valid_position;
            if (!isdefined(player_pos)) {
                player_pos = getclosestpointonnavmesh(player.origin, 100, var_88e86621.radius);
                if (!isdefined(player_pos)) {
                    continue;
                }
            }
            if (var_88e86621.radius > player getpathfindingradius()) {
                player_pos = getclosestpointonnavmesh(player.origin, 100, var_88e86621.radius);
            }
            pos = isdefined(player_pos) ? player_pos : player.origin;
            if (!isdefined(playerpositions)) {
                playerpositions = [];
            } else if (!isarray(playerpositions)) {
                playerpositions = array(playerpositions);
            }
            playerpositions[playerpositions.size] = pos;
            if (getdvarint(#"hash_4477ab37a00b1492", 1) == 1) {
                position_info = {#origin:pos, #player:player};
                if (!isdefined(var_448ee423)) {
                    var_448ee423 = [];
                } else if (!isarray(var_448ee423)) {
                    var_448ee423 = array(var_448ee423);
                }
                var_448ee423[var_448ee423.size] = position_info;
            }
        }
    }
    closestplayer = undefined;
    self.var_c6e0686b = undefined;
    if (ispointonnavmesh(var_88e86621.origin, self)) {
        pathdata = generatenavmeshpath(var_88e86621.origin, playerpositions, self);
        if (isdefined(pathdata) && pathdata.status === "succeeded") {
            goalpos = pathdata.pathpoints[pathdata.pathpoints.size - 1];
            if (getdvarint(#"hash_4477ab37a00b1492", 1) == 1) {
                position_info = arraygetclosest(goalpos, var_448ee423);
                if (isdefined(position_info)) {
                    closestplayer = position_info.player;
                }
            } else {
                foreach (index, position in playerpositions) {
                    if (isdefined(level.var_cd24b30)) {
                        if (distance2dsquared(position, goalpos) < 16 * 16 && abs(position[2] - goalpos[2]) <= level.var_cd24b30) {
                            closestplayer = players[index];
                        }
                        continue;
                    }
                    if (distancesquared(position, goalpos) < 16 * 16) {
                        closestplayer = players[index];
                        break;
                    }
                }
            }
        }
    }
    /#
        self.var_26f25576 = gettime();
    #/
    self.last_closest_player = closestplayer;
    if (isdefined(closestplayer)) {
        self.var_c6e0686b = pathdata.pathdistance * pathdata.pathdistance;
    }
    self function_5dcc54a8(players);
    return self.last_closest_player;
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x7b0186e7, Offset: 0x49a8
// Size: 0x490
function get_closest_valid_player(origin, ignore_player = array(), var_b106b254 = 0) {
    aiprofile_beginentry("get_closest_valid_player");
    players = getplayers();
    if (isdefined(level.zombie_targets) && level.zombie_targets.size > 0) {
        function_1eaaceab(level.zombie_targets);
        arrayremovevalue(level.zombie_targets, undefined);
        players = arraycombine(players, level.zombie_targets, 0, 0);
    }
    b_designated_target_exists = 0;
    foreach (player in players) {
        if (!(isdefined(player.am_i_valid) && player.am_i_valid)) {
            continue;
        }
        if (isdefined(level.var_63707e9c)) {
            if (![[ level.var_63707e9c ]](player)) {
                array::add(ignore_player, player);
            }
        }
        if (isdefined(player.b_is_designated_target) && player.b_is_designated_target) {
            b_designated_target_exists = 1;
        }
        if (isdefined(level.var_6f6cc58)) {
            if (![[ level.var_6f6cc58 ]](player)) {
                array::add(ignore_player, player);
            }
        }
    }
    if (isdefined(ignore_player)) {
        foreach (ignored_player in ignore_player) {
            arrayremovevalue(players, ignored_player);
        }
    }
    done = 0;
    while (players.size && !done) {
        done = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!(isdefined(player.am_i_valid) && player.am_i_valid)) {
                arrayremovevalue(players, player);
                done = 0;
                break;
            }
            if (b_designated_target_exists && !(isdefined(player.b_is_designated_target) && player.b_is_designated_target)) {
                arrayremovevalue(players, player);
                done = 0;
                break;
            }
        }
    }
    if (players.size == 0) {
        aiprofile_endentry();
        return undefined;
    }
    if (!var_b106b254 && isdefined(self.closest_player_override)) {
        player = [[ self.closest_player_override ]](origin, players);
    } else if (!var_b106b254 && isdefined(level.closest_player_override)) {
        player = [[ level.closest_player_override ]](origin, players);
    } else {
        player = arraygetclosest(origin, players);
    }
    if (!isdefined(player)) {
        aiprofile_endentry();
        return undefined;
    }
    aiprofile_endentry();
    return player;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xcd49339d, Offset: 0x4e40
// Size: 0x36c
function update_valid_players(origin, ignore_player) {
    aiprofile_beginentry("update_valid_players");
    players = arraycopy(level.players);
    foreach (player in players) {
        self setignoreent(player, 1);
    }
    b_designated_target_exists = 0;
    for (i = 0; i < players.size; i++) {
        player = players[i];
        if (!(isdefined(player.am_i_valid) && player.am_i_valid)) {
            continue;
        }
        if (isdefined(level.var_63707e9c)) {
            if (![[ level.var_63707e9c ]](player)) {
                array::add(ignore_player, player);
            }
        }
        if (isdefined(player.b_is_designated_target) && player.b_is_designated_target) {
            b_designated_target_exists = 1;
        }
    }
    if (isdefined(ignore_player)) {
        for (i = 0; i < ignore_player.size; i++) {
            arrayremovevalue(players, ignore_player[i]);
        }
    }
    done = 0;
    while (players.size && !done) {
        done = 1;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (!(isdefined(player.am_i_valid) && player.am_i_valid)) {
                arrayremovevalue(players, player);
                done = 0;
                break;
            }
            if (b_designated_target_exists && !(isdefined(player.b_is_designated_target) && player.b_is_designated_target)) {
                arrayremovevalue(players, player);
                done = 0;
                break;
            }
        }
    }
    foreach (player in players) {
        self setignoreent(player, 0);
        self getperfectinfo(player);
    }
    aiprofile_endentry();
}

// Namespace zm_utility/zm_utility
// Params 5, eflags: 0x1 linked
// Checksum 0x1f829c87, Offset: 0x51b8
// Size: 0x20c
function is_player_valid(e_player, var_11e899f9 = 0, var_67fee570 = 0, var_6eefd462 = 1, var_da861165 = 1) {
    if (!isdefined(e_player)) {
        return 0;
    }
    if (!isentity(e_player)) {
        return 0;
    }
    if (!isplayer(e_player)) {
        return 0;
    }
    if (!isalive(e_player)) {
        return 0;
    }
    if (isdefined(e_player.is_zombie) && e_player.is_zombie) {
        return 0;
    }
    if (e_player.sessionstate == "spectator" || e_player.sessionstate == "intermission") {
        return 0;
    }
    if (isdefined(level.intermission) && level.intermission) {
        return 0;
    }
    if (!var_67fee570) {
        if (e_player laststand::player_is_in_laststand()) {
            return 0;
        }
    }
    if (var_11e899f9) {
        if (e_player.ignoreme || e_player isnotarget()) {
            return 0;
        }
    }
    if (!var_6eefd462) {
        if (e_player isplayerunderwater()) {
            return 0;
        }
    }
    if (!var_da861165 && e_player scene::is_igc_active()) {
        return 0;
    }
    if (isdefined(level.is_player_valid_override)) {
        return [[ level.is_player_valid_override ]](e_player);
    }
    return 1;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xc2db8244, Offset: 0x53d0
// Size: 0x82
function get_number_of_valid_players() {
    players = getplayers();
    num_player_valid = 0;
    for (i = 0; i < players.size; i++) {
        if (is_player_valid(players[i])) {
            num_player_valid = num_player_valid + 1;
        }
    }
    return num_player_valid;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x5cb6072e, Offset: 0x5460
// Size: 0xf8
function in_revive_trigger() {
    if (isdefined(self.rt_time) && self.rt_time + 100 >= gettime()) {
        return self.in_rt_cached;
    }
    self.rt_time = gettime();
    players = level.players;
    for (i = 0; i < players.size; i++) {
        current_player = players[i];
        if (isdefined(current_player) && isdefined(current_player.revivetrigger) && isalive(current_player)) {
            if (self istouching(current_player.revivetrigger)) {
                self.in_rt_cached = 1;
                return 1;
            }
        }
    }
    self.in_rt_cached = 0;
    return 0;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xd8832cc5, Offset: 0x5560
// Size: 0x506
function non_destroyed_bar_board_order(origin, chunks) {
    first_bars = [];
    first_bars1 = [];
    first_bars2 = [];
    for (i = 0; i < chunks.size; i++) {
        if (isdefined(chunks[i].script_team) && chunks[i].script_team == "classic_boards") {
            if (isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "board") {
                return get_closest_2d(origin, chunks);
            } else if (isdefined(chunks[i].script_team) && chunks[i].script_team == "bar_board_variant1" || chunks[i].script_team == "bar_board_variant2" || chunks[i].script_team == "bar_board_variant4" || chunks[i].script_team == "bar_board_variant5") {
                return undefined;
            }
            continue;
        }
        if (isdefined(chunks[i].script_team) && chunks[i].script_team == "new_barricade") {
            if (isdefined(chunks[i].script_parameters) && (chunks[i].script_parameters == "repair_board" || chunks[i].script_parameters == "barricade_vents")) {
                return get_closest_2d(origin, chunks);
            }
        }
    }
    for (i = 0; i < chunks.size; i++) {
        if (isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine") {
            if (isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar") {
                if (isdefined(chunks[i].script_noteworthy)) {
                    if (chunks[i].script_noteworthy == "4" || chunks[i].script_noteworthy == "6") {
                        first_bars[first_bars.size] = chunks[i];
                    }
                }
            }
        }
    }
    for (i = 0; i < first_bars.size; i++) {
        if (isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine") {
            if (isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar") {
                if (!first_bars[i].destroyed) {
                    return first_bars[i];
                }
            }
        }
    }
    for (i = 0; i < chunks.size; i++) {
        if (isdefined(chunks[i].script_team) && chunks[i].script_team == "6_bars_bent" || chunks[i].script_team == "6_bars_prestine") {
            if (isdefined(chunks[i].script_parameters) && chunks[i].script_parameters == "bar") {
                if (!chunks[i].destroyed) {
                    return get_closest_2d(origin, chunks);
                }
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x7fed0252, Offset: 0x5a70
// Size: 0x532
function non_destroyed_grate_order(origin, chunks_grate) {
    grate_order = [];
    grate_order1 = [];
    grate_order2 = [];
    grate_order3 = [];
    grate_order4 = [];
    grate_order5 = [];
    grate_order6 = [];
    if (isdefined(chunks_grate)) {
        for (i = 0; i < chunks_grate.size; i++) {
            if (isdefined(chunks_grate[i].script_parameters) && chunks_grate[i].script_parameters == "grate") {
                if (isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "1") {
                    grate_order1[grate_order1.size] = chunks_grate[i];
                }
                if (isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "2") {
                    grate_order2[grate_order2.size] = chunks_grate[i];
                }
                if (isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "3") {
                    grate_order3[grate_order3.size] = chunks_grate[i];
                }
                if (isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "4") {
                    grate_order4[grate_order4.size] = chunks_grate[i];
                }
                if (isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "5") {
                    grate_order5[grate_order5.size] = chunks_grate[i];
                }
                if (isdefined(chunks_grate[i].script_noteworthy) && chunks_grate[i].script_noteworthy == "6") {
                    grate_order6[grate_order6.size] = chunks_grate[i];
                }
            }
        }
        for (i = 0; i < chunks_grate.size; i++) {
            if (isdefined(chunks_grate[i].script_parameters) && chunks_grate[i].script_parameters == "grate") {
                if (isdefined(grate_order1[i])) {
                    if (grate_order1[i].state == "repaired") {
                        grate_order2[i] thread show_grate_pull();
                        return grate_order1[i];
                    }
                    if (grate_order2[i].state == "repaired") {
                        /#
                            iprintlnbold("<unknown string>");
                        #/
                        grate_order3[i] thread show_grate_pull();
                        return grate_order2[i];
                    }
                    if (grate_order3[i].state == "repaired") {
                        /#
                            iprintlnbold("<unknown string>");
                        #/
                        grate_order4[i] thread show_grate_pull();
                        return grate_order3[i];
                    }
                    if (grate_order4[i].state == "repaired") {
                        /#
                            iprintlnbold("<unknown string>");
                        #/
                        grate_order5[i] thread show_grate_pull();
                        return grate_order4[i];
                    }
                    if (grate_order5[i].state == "repaired") {
                        /#
                            iprintlnbold("<unknown string>");
                        #/
                        grate_order6[i] thread show_grate_pull();
                        return grate_order5[i];
                    }
                    if (grate_order6[i].state == "repaired") {
                        return grate_order6[i];
                    }
                }
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x29897792, Offset: 0x5fb0
// Size: 0x5c
function show_grate_pull() {
    wait(0.53);
    self show();
    self vibrate(vectorscale((0, 1, 0), 270), 0.2, 0.4, 0.4);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xf575c3d4, Offset: 0x6018
// Size: 0x1f0
function get_closest_2d(origin, ents) {
    if (!isdefined(ents)) {
        return undefined;
    }
    dist = distance2d(origin, ents[0].origin);
    index = 0;
    temp_array = [];
    for (i = 1; i < ents.size; i++) {
        if (isdefined(ents[i].unbroken) && ents[i].unbroken == 1) {
            ents[i].index = i;
            if (!isdefined(temp_array)) {
                temp_array = [];
            } else if (!isarray(temp_array)) {
                temp_array = array(temp_array);
            }
            temp_array[temp_array.size] = ents[i];
        }
    }
    if (temp_array.size > 0) {
        index = temp_array[randomintrange(0, temp_array.size)].index;
        return ents[index];
    }
    for (i = 1; i < ents.size; i++) {
        temp_dist = distance2d(origin, ents[i].origin);
        if (temp_dist < dist) {
            dist = temp_dist;
            index = i;
        }
    }
    return ents[index];
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xabd88b82, Offset: 0x6210
// Size: 0x1a0
function in_playable_area() {
    if (function_21f4ac36() && !isdefined(level.var_a2a9b2de)) {
        level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
    }
    if (function_c85ebbbc() && !isdefined(level.playable_area)) {
        level.playable_area = getentarray("player_volume", "script_noteworthy");
    }
    if (!isdefined(level.playable_area) && !isdefined(level.var_a2a9b2de)) {
        /#
            println("<unknown string>");
        #/
        return true;
    }
    if (isdefined(level.var_a2a9b2de)) {
        node = function_52c1730(self.origin, level.var_a2a9b2de, 500);
        if (isdefined(node)) {
            return true;
        }
    }
    if (isdefined(level.playable_area)) {
        for (i = 0; i < level.playable_area.size; i++) {
            if (self istouching(level.playable_area[i])) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x1581fb39, Offset: 0x63b8
// Size: 0x10e
function get_closest_non_destroyed_chunk(origin, barrier, barrier_chunks) {
    chunks = undefined;
    chunks_grate = undefined;
    chunks_grate = get_non_destroyed_chunks_grate(barrier, barrier_chunks);
    chunks = get_non_destroyed_chunks(barrier, barrier_chunks);
    if (isdefined(barrier.zbarrier)) {
        if (isdefined(chunks)) {
            return array::randomize(chunks)[0];
        }
        if (isdefined(chunks_grate)) {
            return array::randomize(chunks_grate)[0];
        }
    } else if (isdefined(chunks)) {
        return non_destroyed_bar_board_order(origin, chunks);
    } else if (isdefined(chunks_grate)) {
        return non_destroyed_grate_order(origin, chunks_grate);
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xff6efa76, Offset: 0x64d0
// Size: 0x118
function get_random_destroyed_chunk(barrier, barrier_chunks) {
    if (isdefined(barrier.zbarrier)) {
        ret = undefined;
        pieces = barrier.zbarrier getzbarrierpieceindicesinstate("open");
        if (pieces.size) {
            ret = array::randomize(pieces)[0];
        }
        return ret;
    }
    chunks_repair_grate = undefined;
    chunks = get_destroyed_chunks(barrier_chunks);
    chunks_repair_grate = get_destroyed_repair_grates(barrier_chunks);
    if (isdefined(chunks)) {
        return chunks[randomint(chunks.size)];
    } else if (isdefined(chunks_repair_grate)) {
        return grate_order_destroyed(chunks_repair_grate);
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x3c6d7b04, Offset: 0x65f0
// Size: 0xb6
function get_destroyed_repair_grates(barrier_chunks) {
    array = [];
    for (i = 0; i < barrier_chunks.size; i++) {
        if (isdefined(barrier_chunks[i])) {
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate") {
                array[array.size] = barrier_chunks[i];
            }
        }
    }
    if (array.size == 0) {
        return undefined;
    }
    return array;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x3702a6cf, Offset: 0x66b0
// Size: 0x42a
function get_non_destroyed_chunks(barrier, barrier_chunks) {
    if (isdefined(barrier.zbarrier)) {
        return barrier.zbarrier getzbarrierpieceindicesinstate("closed");
    }
    array = [];
    for (i = 0; i < barrier_chunks.size; i++) {
        if (isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "classic_boards") {
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "board") {
                if (barrier_chunks[i] get_chunk_state() == "repaired") {
                    if (barrier_chunks[i].origin == barrier_chunks[i].og_origin) {
                        array[array.size] = barrier_chunks[i];
                    }
                }
            }
        }
        if (isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "new_barricade") {
            if (isdefined(barrier_chunks[i].script_parameters) && (barrier_chunks[i].script_parameters == "repair_board" || barrier_chunks[i].script_parameters == "barricade_vents")) {
                if (barrier_chunks[i] get_chunk_state() == "repaired") {
                    if (barrier_chunks[i].origin == barrier_chunks[i].og_origin) {
                        array[array.size] = barrier_chunks[i];
                    }
                }
            }
            continue;
        }
        if (isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "6_bars_bent") {
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar") {
                if (barrier_chunks[i] get_chunk_state() == "repaired") {
                    if (barrier_chunks[i].origin == barrier_chunks[i].og_origin) {
                        array[array.size] = barrier_chunks[i];
                    }
                }
            }
            continue;
        }
        if (isdefined(barrier_chunks[i].script_team) && barrier_chunks[i].script_team == "6_bars_prestine") {
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar") {
                if (barrier_chunks[i] get_chunk_state() == "repaired") {
                    if (barrier_chunks[i].origin == barrier_chunks[i].og_origin) {
                        array[array.size] = barrier_chunks[i];
                    }
                }
            }
        }
    }
    if (array.size == 0) {
        return undefined;
    }
    return array;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xcbc66c07, Offset: 0x6ae8
// Size: 0xfc
function get_non_destroyed_chunks_grate(barrier, barrier_chunks) {
    if (isdefined(barrier.zbarrier)) {
        return barrier.zbarrier getzbarrierpieceindicesinstate("closed");
    }
    array = [];
    for (i = 0; i < barrier_chunks.size; i++) {
        if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate") {
            if (isdefined(barrier_chunks[i])) {
                array[array.size] = barrier_chunks[i];
            }
        }
    }
    if (array.size == 0) {
        return undefined;
    }
    return array;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x650f9d75, Offset: 0x6bf0
// Size: 0x1da
function get_destroyed_chunks(barrier_chunks) {
    array = [];
    for (i = 0; i < barrier_chunks.size; i++) {
        if (barrier_chunks[i] get_chunk_state() == "destroyed") {
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "board") {
                array[array.size] = barrier_chunks[i];
                continue;
            }
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "repair_board" || barrier_chunks[i].script_parameters == "barricade_vents") {
                array[array.size] = barrier_chunks[i];
                continue;
            }
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "bar") {
                array[array.size] = barrier_chunks[i];
                continue;
            }
            if (isdefined(barrier_chunks[i].script_parameters) && barrier_chunks[i].script_parameters == "grate") {
                return undefined;
            }
        }
    }
    if (array.size == 0) {
        return undefined;
    }
    return array;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xef5b8974, Offset: 0x6dd8
// Size: 0x55a
function grate_order_destroyed(chunks_repair_grate) {
    grate_repair_order = [];
    grate_repair_order1 = [];
    grate_repair_order2 = [];
    grate_repair_order3 = [];
    grate_repair_order4 = [];
    grate_repair_order5 = [];
    grate_repair_order6 = [];
    for (i = 0; i < chunks_repair_grate.size; i++) {
        if (isdefined(chunks_repair_grate[i].script_parameters) && chunks_repair_grate[i].script_parameters == "grate") {
            if (isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "1") {
                grate_repair_order1[grate_repair_order1.size] = chunks_repair_grate[i];
            }
            if (isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "2") {
                grate_repair_order2[grate_repair_order2.size] = chunks_repair_grate[i];
            }
            if (isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "3") {
                grate_repair_order3[grate_repair_order3.size] = chunks_repair_grate[i];
            }
            if (isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "4") {
                grate_repair_order4[grate_repair_order4.size] = chunks_repair_grate[i];
            }
            if (isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "5") {
                grate_repair_order5[grate_repair_order5.size] = chunks_repair_grate[i];
            }
            if (isdefined(chunks_repair_grate[i].script_noteworthy) && chunks_repair_grate[i].script_noteworthy == "6") {
                grate_repair_order6[grate_repair_order6.size] = chunks_repair_grate[i];
            }
        }
    }
    for (i = 0; i < chunks_repair_grate.size; i++) {
        if (isdefined(chunks_repair_grate[i].script_parameters) && chunks_repair_grate[i].script_parameters == "grate") {
            if (isdefined(grate_repair_order1[i])) {
                if (grate_repair_order6[i].state == "destroyed") {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                    return grate_repair_order6[i];
                }
                if (grate_repair_order5[i].state == "destroyed") {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                    grate_repair_order6[i] thread show_grate_repair();
                    return grate_repair_order5[i];
                }
                if (grate_repair_order4[i].state == "destroyed") {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                    grate_repair_order5[i] thread show_grate_repair();
                    return grate_repair_order4[i];
                }
                if (grate_repair_order3[i].state == "destroyed") {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                    grate_repair_order4[i] thread show_grate_repair();
                    return grate_repair_order3[i];
                }
                if (grate_repair_order2[i].state == "destroyed") {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                    grate_repair_order3[i] thread show_grate_repair();
                    return grate_repair_order2[i];
                }
                if (grate_repair_order1[i].state == "destroyed") {
                    /#
                        iprintlnbold("<unknown string>");
                    #/
                    grate_repair_order2[i] thread show_grate_repair();
                    return grate_repair_order1[i];
                }
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x468fdeef, Offset: 0x7340
// Size: 0x24
function show_grate_repair() {
    wait(0.34);
    self hide();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x11f97833, Offset: 0x7370
// Size: 0x2a
function get_chunk_state() {
    /#
        assert(isdefined(self.state));
    #/
    return self.state;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x2853a8c9, Offset: 0x73a8
// Size: 0x150
function fake_physicslaunch(target_pos, power) {
    start_pos = self.origin;
    gravity = getdvarint(#"bg_gravity", 0) * -1;
    dist = distance(start_pos, target_pos);
    time = dist / power;
    delta = target_pos - start_pos;
    drop = 0.5 * gravity * time * time;
    velocity = (delta[0] / time, delta[1] / time, (delta[2] - drop) / time);
    /#
        level thread draw_line_ent_to_pos(self, target_pos);
    #/
    self movegravity(velocity, time);
    return time;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x89a6c3dd, Offset: 0x7500
// Size: 0x4a
function add_zombie_hint(ref, text) {
    if (!isdefined(level.zombie_hints)) {
        level.zombie_hints = [];
    }
    level.zombie_hints[ref] = text;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x4419ba01, Offset: 0x7558
// Size: 0x6c
function get_zombie_hint(ref) {
    if (isdefined(level.zombie_hints[ref])) {
        return level.zombie_hints[ref];
    }
    /#
        println("<unknown string>" + ref);
    #/
    return level.zombie_hints[#"undefined"];
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x4a52df34, Offset: 0x75d0
// Size: 0xa4
function set_hint_string(ent, default_ref, cost) {
    ref = default_ref;
    if (isdefined(ent.script_hint)) {
        ref = ent.script_hint;
    }
    hint = get_zombie_hint(ref);
    if (isdefined(cost)) {
        self sethintstring(hint, cost);
        return;
    }
    self sethintstring(hint);
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x9f0a2bc0, Offset: 0x7680
// Size: 0x5a
function get_hint_string(ent, default_ref, cost) {
    ref = default_ref;
    if (isdefined(ent.script_hint)) {
        ref = ent.script_hint;
    }
    return get_zombie_hint(ref);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xc483efd2, Offset: 0x76e8
// Size: 0x4a
function add_sound(ref, alias) {
    if (!isdefined(level.zombie_sounds)) {
        level.zombie_sounds = [];
    }
    level.zombie_sounds[ref] = alias;
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x35471287, Offset: 0x7740
// Size: 0xec
function play_sound_at_pos(ref, pos, ent) {
    if (isdefined(ent)) {
        if (isdefined(ent.script_soundalias)) {
            playsoundatposition(ent.script_soundalias, pos);
            return;
        }
        if (isdefined(self.script_sound)) {
            ref = self.script_sound;
        }
    }
    if (ref == "none") {
        return;
    }
    if (!isdefined(level.zombie_sounds[ref])) {
        /#
            assertmsg("<unknown string>" + ref + "<unknown string>");
        #/
        return;
    }
    playsoundatposition(level.zombie_sounds[ref], pos);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x78bc2657, Offset: 0x7838
// Size: 0xc4
function play_sound_on_ent(ref) {
    if (isdefined(self.script_soundalias)) {
        self playsound(self.script_soundalias);
        return;
    }
    if (isdefined(self.script_sound)) {
        ref = self.script_sound;
    }
    if (ref == "none") {
        return;
    }
    if (!isdefined(level.zombie_sounds[ref])) {
        /#
            assertmsg("<unknown string>" + ref + "<unknown string>");
        #/
        return;
    }
    self playsound(level.zombie_sounds[ref]);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xd71f438d, Offset: 0x7908
// Size: 0x94
function play_loopsound_on_ent(ref) {
    if (isdefined(self.script_firefxsound)) {
        ref = self.script_firefxsound;
    }
    if (ref == "none") {
        return;
    }
    if (!isdefined(level.zombie_sounds[ref])) {
        /#
            assertmsg("<unknown string>" + ref + "<unknown string>");
        #/
        return;
    }
    self playsound(level.zombie_sounds[ref]);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0xd80bf1dd, Offset: 0x79a8
// Size: 0xae
function draw_line_ent_to_ent(ent1, ent2) {
    /#
        if (getdvarint(#"zombie_debug", 0) != 1) {
            return;
        }
        ent1 endon(#"death");
        ent2 endon(#"death");
        while (true) {
            line(ent1.origin, ent2.origin);
            waitframe(1);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0x4fccc1c5, Offset: 0x7a60
// Size: 0xc6
function draw_line_ent_to_pos(ent, pos, end_on) {
    /#
        if (getdvarint(#"zombie_debug", 0) != 1) {
            return;
        }
        ent notify(#"stop_draw_line_ent_to_pos");
        ent endon(#"stop_draw_line_ent_to_pos", #"death");
        if (isdefined(end_on)) {
            ent endon(end_on);
        }
        while (true) {
            line(ent.origin, pos);
            waitframe(1);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x632639d, Offset: 0x7b30
// Size: 0x5c
function debug_print(msg) {
    /#
        if (getdvarint(#"zombie_debug", 0) > 0) {
            println("<unknown string>" + msg);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0xc2df078b, Offset: 0x7b98
// Size: 0xa0
function debug_blocker(pos, rad, height) {
    /#
        self notify(#"stop_debug_blocker");
        self endon(#"stop_debug_blocker");
        for (;;) {
            if (getdvarint(#"zombie_debug", 0) != 1) {
                return;
            }
            waitframe(1);
            drawcylinder(pos, rad, height);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0xa1b10edc, Offset: 0x7c40
// Size: 0x23e
function drawcylinder(pos, rad, height) {
    /#
        currad = rad;
        curheight = height;
        for (r = 0; r < 20; r++) {
            theta = r / 20 * 360;
            theta2 = (r + 1) / 20 * 360;
            line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0));
            line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight));
            line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight));
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x3731145, Offset: 0x7e88
// Size: 0x178
function debug_attack_spots_taken() {
    /#
        self notify(#"stop_debug_breadcrumbs");
        self endon(#"stop_debug_breadcrumbs");
        while (true) {
            if (getdvarint(#"zombie_debug", 0) != 2) {
                wait(1);
                continue;
            }
            waitframe(1);
            count = 0;
            for (i = 0; i < self.attack_spots_taken.size; i++) {
                if (self.attack_spots_taken[i]) {
                    count++;
                    circle(self.attack_spots[i], 12, (1, 0, 0), 0, 1, 1);
                    continue;
                }
                circle(self.attack_spots[i], 12, (0, 1, 0), 0, 1, 1);
            }
            msg = "<unknown string>" + count + "<unknown string>" + self.attack_spots_taken.size;
            print3d(self.origin, msg);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0x21c9816e, Offset: 0x8008
// Size: 0xa6
function float_print3d(msg, time) {
    /#
        self endon(#"death");
        time = gettime() + time * 1000;
        offset = vectorscale((0, 0, 1), 72);
        while (gettime() < time) {
            offset = offset + vectorscale((0, 0, 1), 2);
            print3d(self.origin + offset, msg, (1, 1, 1));
            waitframe(1);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x2da67f23, Offset: 0x80b8
// Size: 0x116
function do_player_vo(snd, variation_count) {
    index = get_player_index(self);
    sound = "zmb_vox_plr_" + index + "_" + snd;
    if (isdefined(variation_count)) {
        sound = sound + "_" + randomintrange(0, variation_count);
    }
    if (!isdefined(level.player_is_speaking)) {
        level.player_is_speaking = 0;
    }
    if (level.player_is_speaking == 0) {
        level.player_is_speaking = 1;
        self playsoundwithnotify(sound, "sound_done");
        self waittill(#"sound_done");
        wait(2);
        level.player_is_speaking = 0;
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xb2004c9c, Offset: 0x81d8
// Size: 0x36
function is_magic_bullet_shield_enabled(ent) {
    if (!isdefined(ent)) {
        return false;
    }
    return !(isdefined(ent.allowdeath) && ent.allowdeath);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xbeb3cf9, Offset: 0x8218
// Size: 0x8c
function play_sound_2d(sound) {
    temp_ent = spawn("script_origin", (0, 0, 0));
    temp_ent playsoundwithnotify(sound, sound + "wait");
    temp_ent waittill(sound + "wait");
    waitframe(1);
    temp_ent delete();
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x200bd6f8, Offset: 0x82b0
// Size: 0x6c
function include_weapon(weapon_name, in_box) {
    /#
        println("<unknown string>" + function_9e72a96(weapon_name));
    #/
    if (!isdefined(in_box)) {
        in_box = 1;
    }
    zm_weapons::include_zombie_weapon(weapon_name, in_box);
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x0
// Checksum 0xf1ea4c34, Offset: 0x8328
// Size: 0x146
function print3d_ent(text, color, scale, offset, end_msg, overwrite) {
    self endon(#"death");
    if (isdefined(overwrite) && overwrite && isdefined(self._debug_print3d_msg)) {
        self notify(#"end_print3d");
        waitframe(1);
    }
    self endon(#"end_print3d");
    if (!isdefined(color)) {
        color = (1, 1, 1);
    }
    if (!isdefined(scale)) {
        scale = 1;
    }
    if (!isdefined(offset)) {
        offset = (0, 0, 0);
    }
    if (isdefined(end_msg)) {
        self endon(end_msg);
    }
    self._debug_print3d_msg = text;
    /#
        while (!(isdefined(level.disable_print3d_ent) && level.disable_print3d_ent)) {
            print3d(self.origin + offset, self._debug_print3d_msg, color, scale);
            waitframe(1);
        }
    #/
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xaa64c172, Offset: 0x8478
// Size: 0x30
function function_21f4ac36() {
    return getdvarint(#"hash_42c75b39576494a5", 1) == 1;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x82a87c07, Offset: 0x84b0
// Size: 0x30
function function_c85ebbbc() {
    return getdvarint(#"hash_6ec233a56690f409", 1) == 1;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xa1d70da8, Offset: 0x84e8
// Size: 0x3a
function function_b0eeaada(location, max_drop_distance = 500) {
    return function_9cc082d2(location, max_drop_distance);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0x48c3c6de, Offset: 0x8530
// Size: 0x46
function function_a1055d95(location, node) {
    return isdefined(location) && location[#"region"] === getnoderegion(node);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xdf0281ed, Offset: 0x8580
// Size: 0x3cc
function get_current_zone(return_zone = 0) {
    if (!isdefined(self)) {
        return undefined;
    }
    self endon(#"death");
    level flag::wait_till("zones_initialized");
    if (function_21f4ac36()) {
        node = self.var_3b65cdd7;
        var_3e5dca65 = self.origin;
        if (isplayer(self)) {
            if (isdefined(self.last_valid_position) && distancesquared(self.origin, self.last_valid_position) < 32 * 32) {
                var_3e5dca65 = self.last_valid_position;
            }
        }
        self.var_3b65cdd7 = function_52c1730(var_3e5dca65, level.zone_nodes, 500);
        if (isdefined(self.var_3b65cdd7)) {
            if (node !== self.var_3b65cdd7 || isdefined(node) && node.targetname !== self.var_3b65cdd7.targetname) {
                self.cached_zone = level.zones[self.var_3b65cdd7.targetname];
                self.cached_zone_name = self.cached_zone.name;
                self.cached_zone_volume = undefined;
                self notify(#"zone_change", {#zone_name:self.cached_zone_name, #zone:self.cached_zone});
            }
            if (return_zone) {
                return level.zones[self.var_3b65cdd7.targetname];
            } else {
                return self.var_3b65cdd7.targetname;
            }
        }
    }
    if (function_c85ebbbc()) {
        foreach (zone in level.zones) {
            for (i = 0; i < zone.volumes.size; i++) {
                if (self istouching(zone.volumes[i])) {
                    if (zone !== self.cached_zone) {
                        self.cached_zone = zone;
                        self.cached_zone_name = zone.name;
                        self.cached_zone_volume = i;
                        self.var_3b65cdd7 = undefined;
                        self notify(#"zone_change", {#zone_name:zone.name, #zone:zone});
                    }
                    if (isdefined(return_zone) && return_zone) {
                        return zone;
                    }
                    return zone.name;
                }
            }
        }
    }
    self.cached_zone = undefined;
    self.cached_zone_name = undefined;
    self.cached_zone_volume = undefined;
    self.var_3b65cdd7 = undefined;
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xbdb23668, Offset: 0x8958
// Size: 0xc8
function update_zone_name() {
    self notify("91efb2e47638985");
    self endon("91efb2e47638985");
    self endon(#"death");
    self.zone_name = get_current_zone();
    if (isdefined(self.zone_name)) {
        self.previous_zone_name = self.zone_name;
    }
    while (isdefined(self)) {
        if (isdefined(self.zone_name)) {
            self.previous_zone_name = self.zone_name;
        }
        self.zone_name = get_current_zone();
        wait(randomfloatrange(0.5, 1));
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x285f6bf3, Offset: 0x8a28
// Size: 0x318
function shock_onpain() {
    self notify(#"stop_shock_onpain");
    self endon(#"stop_shock_onpain", #"death");
    if (getdvarstring(#"blurpain") == "") {
        setdvar(#"blurpain", "on");
    }
    while (true) {
        oldhealth = self.health;
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        mod = waitresult.mod;
        damage = waitresult.amount;
        attacker = waitresult.attacker;
        direction_vec = waitresult.direction;
        point = waitresult.position;
        if (isdefined(level.shock_onpain) && !level.shock_onpain) {
            continue;
        }
        if (isdefined(self.shock_onpain) && !self.shock_onpain) {
            continue;
        }
        if (self.health < 1) {
            continue;
        }
        if (isdefined(attacker) && isdefined(attacker.custom_player_shellshock)) {
            self [[ attacker.custom_player_shellshock ]](damage, attacker, direction_vec, point, mod);
            continue;
        }
        if (mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH") {
            continue;
        }
        if (mod == "MOD_GRENADE_SPLASH" || mod == "MOD_GRENADE" || mod == "MOD_EXPLOSIVE") {
            shocktype = undefined;
            shocklight = undefined;
            if (isdefined(self.is_burning) && self.is_burning) {
                shocktype = "lava";
                shocklight = "lava_small";
            }
            self shock_onexplosion(damage, shocktype, shocklight);
            continue;
        }
        if (getdvarstring(#"blurpain") == "on") {
            self shellshock(#"pain_zm", 0.5);
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0xad3197df, Offset: 0x8d48
// Size: 0x10c
function shock_onexplosion(damage, shocktype, shocklight) {
    time = 0;
    scaled_damage = 100 * damage / self.maxhealth;
    if (scaled_damage >= 90) {
        time = 4;
    } else if (scaled_damage >= 50) {
        time = 3;
    } else if (scaled_damage >= 25) {
        time = 2;
    } else if (scaled_damage > 10) {
        time = 1;
    }
    if (time) {
        if (!isdefined(shocktype)) {
            shocktype = "explosion_zm";
        }
        self shellshock(shocktype, time);
        return;
    }
    if (isdefined(shocklight)) {
        self shellshock(shocklight, time);
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xc21cf7e5, Offset: 0x8e60
// Size: 0xb0
function increment_is_drinking(var_12d2689b = 0) {
    /#
        if (isdefined(level.devgui_dpad_watch) && level.devgui_dpad_watch) {
            self.is_drinking++;
            return;
        }
    #/
    if (!isdefined(self.is_drinking)) {
        self.is_drinking = 0;
    }
    if (self.is_drinking == 0) {
        if (!var_12d2689b) {
            self disableoffhandweapons();
        }
        self disableweaponcycling();
    }
    self.is_drinking++;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xac2641b0, Offset: 0x8f18
// Size: 0x4e
function is_drinking() {
    return isdefined(self.is_drinking) && self.is_drinking > 0 || isplayer(self) && self function_55acff10();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x3a6cece0, Offset: 0x8f70
// Size: 0x1e
function is_multiple_drinking() {
    return isdefined(self.is_drinking) && self.is_drinking > 1;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xe158fa58, Offset: 0x8f98
// Size: 0x74
function decrement_is_drinking() {
    if (self.is_drinking > 0) {
        self.is_drinking--;
    } else {
        /#
            assertmsg("<unknown string>");
        #/
    }
    if (self.is_drinking == 0) {
        self enableoffhandweapons();
        self enableweaponcycling();
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xd0f7c836, Offset: 0x9018
// Size: 0x3c
function clear_is_drinking() {
    self.is_drinking = 0;
    self enableoffhandweapons();
    self enableweaponcycling();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xc80e437f, Offset: 0x9060
// Size: 0x2e
function function_91403f47() {
    if (!isdefined(level.var_1d72fbba)) {
        level.var_1d72fbba = 0;
    }
    return level.var_1d72fbba > 0;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xd309a11, Offset: 0x9098
// Size: 0x30
function function_3e549e65() {
    if (!isdefined(level.var_1d72fbba)) {
        level.var_1d72fbba = 0;
    }
    level.var_1d72fbba++;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x71424b85, Offset: 0x90d0
// Size: 0x74
function function_b7e5029f() {
    if (!isdefined(level.var_1d72fbba)) {
        level.var_1d72fbba = 0;
    }
    if (level.var_1d72fbba > 0) {
        level.var_1d72fbba--;
    } else {
        /#
            assertmsg("<unknown string>");
        #/
    }
    level zm_player::function_8ef51109();
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0xa4228a43, Offset: 0x9150
// Size: 0x178
function can_use(e_player, b_is_weapon = 0, var_67fee570 = 0) {
    if (!is_player_valid(e_player, 0, var_67fee570) || e_player in_revive_trigger() || e_player isthrowinggrenade() || e_player isswitchingweapons() || e_player is_drinking()) {
        return false;
    }
    if (b_is_weapon) {
        w_current = e_player getcurrentweapon();
        if (!e_player zm_magicbox::can_buy_weapon(0) || e_player bgb::is_enabled(#"zm_bgb_disorderly_combat") || zm_loadout::is_placeable_mine(w_current) || zm_equipment::is_equipment(w_current) || ability_util::is_weapon_gadget(w_current)) {
            return false;
        }
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xcbfa4493, Offset: 0x92d0
// Size: 0x10c
function getweaponclasszm(weapon) {
    /#
        assert(isdefined(weapon));
    #/
    if (!isdefined(weapon)) {
        return undefined;
    }
    if (!isdefined(level.weaponclassarray)) {
        level.weaponclassarray = [];
    }
    if (isdefined(level.weaponclassarray[weapon])) {
        return level.weaponclassarray[weapon];
    }
    baseweaponindex = getbaseweaponitemindex(weapon);
    weaponinfo = getunlockableiteminfofromindex(baseweaponindex, 1);
    if (isdefined(weaponinfo)) {
        level.weaponclassarray[weapon] = weaponinfo.itemgroupname;
    } else {
        level.weaponclassarray[weapon] = "";
    }
    return level.weaponclassarray[weapon];
}

// Namespace zm_utility/zm_utility
// Params 5, eflags: 0x1 linked
// Checksum 0x5f382ade, Offset: 0x93e8
// Size: 0xc8
function spawn_weapon_model(weapon, model = weapon.worldmodel, origin, angles, options) {
    weapon_model = spawn("script_model", origin);
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    if (isdefined(options)) {
        weapon_model useweaponmodel(weapon, model, options);
    } else {
        weapon_model useweaponmodel(weapon, model);
    }
    return weapon_model;
}

// Namespace zm_utility/zm_utility
// Params 5, eflags: 0x1 linked
// Checksum 0xcf316f86, Offset: 0x94b8
// Size: 0xe8
function spawn_buildkit_weapon_model(player, weapon, var_3ded6a21, origin, angles) {
    weapon_model = spawn("script_model", origin);
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    upgraded = zm_weapons::is_weapon_upgraded(weapon);
    if (upgraded && (!isdefined(var_3ded6a21) || 0 > var_3ded6a21)) {
        var_3ded6a21 = player zm_camos::function_4f727cf5(weapon);
    }
    weapon_model usebuildkitweaponmodel(player, weapon, var_3ded6a21);
    return weapon_model;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa2743fb0, Offset: 0x95a8
// Size: 0x3a
function is_player_revive_tool(weapon) {
    if (weapon == level.weaponrevivetool || weapon === self.weaponrevivetool) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xc1b1fd79, Offset: 0x95f0
// Size: 0x3c
function is_limited_weapon(weapon) {
    if (isdefined(level.limited_weapons) && isdefined(level.limited_weapons[weapon])) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xdfc4c7d0, Offset: 0x9638
// Size: 0x20
function should_watch_for_emp() {
    return isdefined(level.should_watch_for_emp) && level.should_watch_for_emp;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x71e46a67, Offset: 0x9660
// Size: 0x44
function groundpos(origin) {
    return bullettrace(origin, origin + vectorscale((0, 0, -1), 100000), 0, self)[#"position"];
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x608c12c1, Offset: 0x96b0
// Size: 0x4c
function groundpos_ignore_water(origin) {
    return bullettrace(origin, origin + vectorscale((0, 0, -1), 100000), 0, self, 1)[#"position"];
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x69ec20c9, Offset: 0x9708
// Size: 0x4c
function groundpos_ignore_water_new(origin) {
    return groundtrace(origin, origin + vectorscale((0, 0, -1), 100000), 0, self, 1)[#"position"];
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x23caeba, Offset: 0x9760
// Size: 0x24
function self_delete() {
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xb862745a, Offset: 0x9790
// Size: 0x5a
function ignore_triggers(timer) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self.ignoretriggers = 1;
    if (isdefined(timer)) {
        wait(timer);
    } else {
        wait(0.5);
    }
    self.ignoretriggers = 0;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x720b7749, Offset: 0x97f8
// Size: 0x204
function giveachievement_wrapper(achievement, all_players) {
    if (achievement == "") {
        return;
    }
    if (isdefined(level.zm_disable_recording_stats) && level.zm_disable_recording_stats) {
        return;
    }
    achievement_lower = tolower(achievement);
    global_counter = 0;
    if (isdefined(all_players) && all_players) {
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            players[i] giveachievement(achievement);
            has_achievement = 0;
            if (!(isdefined(has_achievement) && has_achievement)) {
                global_counter++;
            }
            if (issplitscreen() && i == 0 || !issplitscreen()) {
                if (isdefined(level.achievement_sound_func)) {
                    players[i] thread [[ level.achievement_sound_func ]](achievement_lower);
                }
            }
        }
        return;
    }
    if (!isplayer(self)) {
        /#
            println("<unknown string>");
        #/
        return;
    }
    self giveachievement(achievement);
    has_achievement = 0;
    if (!(isdefined(has_achievement) && has_achievement)) {
        global_counter++;
    }
    if (isdefined(level.achievement_sound_func)) {
        self thread [[ level.achievement_sound_func ]](achievement_lower);
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xeefcf7fd, Offset: 0x9a08
// Size: 0x40
function getyaw(org) {
    angles = vectortoangles(org - self.origin);
    return angles[1];
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x1ff6f920, Offset: 0x9a50
// Size: 0x62
function getyawtospot(spot) {
    pos = spot;
    yaw = self.angles[1] - getyaw(pos);
    yaw = angleclamp180(yaw);
    return yaw;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xb872a98b, Offset: 0x9ac0
// Size: 0x3e
function disable_react() {
    /#
        assert(isalive(self), "<unknown string>");
    #/
    self.allowreact = 0;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x9c33689, Offset: 0x9b08
// Size: 0x42
function enable_react() {
    /#
        assert(isalive(self), "<unknown string>");
    #/
    self.allowreact = 1;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x54ebdf86, Offset: 0x9b58
// Size: 0x92
function is_ee_enabled() {
    if (isdefined(level.var_73d1e054) && level.var_73d1e054) {
        return false;
    }
    if (!getdvarint(#"zm_ee_enabled", 0)) {
        return false;
    }
    if (!zm_custom::function_901b751c(#"hash_3c5363541b97ca3e")) {
        return false;
    }
    if (level.gamedifficulty === 0) {
        return false;
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x7c8896d7, Offset: 0x9bf8
// Size: 0x30
function bullet_attack(type) {
    if (type == "MOD_PISTOL_BULLET") {
        return true;
    }
    return type == "MOD_RIFLE_BULLET";
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xf2a08e72, Offset: 0x9c30
// Size: 0xa4
function pick_up() {
    player = self.owner;
    self delete();
    clip_ammo = player getweaponammoclip(self.weapon);
    clip_max_ammo = self.weapon.clipsize;
    if (clip_ammo < clip_max_ammo) {
        clip_ammo++;
    }
    player setweaponammoclip(self.weapon, clip_ammo);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xd68034cf, Offset: 0x9ce0
// Size: 0xa0
function function_ab9a9770() {
    s_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + vectorscale((0, 0, -1), 100), 0, self);
    if (isdefined(s_trace[#"entity"]) && s_trace[#"entity"] ismovingplatform()) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x3e45d87a, Offset: 0x9d88
// Size: 0x84
function function_52046128() {
    s_trace = groundtrace(self.origin + vectorscale((0, 0, 1), 70), self.origin + vectorscale((0, 0, -1), 100), 0, self);
    if (isdefined(s_trace[#"entity"])) {
        return s_trace[#"entity"];
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x91922904, Offset: 0x9e18
// Size: 0xae
function waittill_not_moving() {
    self endon(#"death", #"detonated");
    level endon(#"game_ended");
    if (self.classname == "grenade") {
        self waittill(#"stationary");
        return;
    }
    for (prevorigin = self.origin; true; prevorigin = self.origin) {
        wait(0.15);
        if (self.origin == prevorigin) {
            break;
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa5773cff, Offset: 0x9ed0
// Size: 0x7a
function get_closest_player(org) {
    players = [];
    players = getplayers();
    if (players.size) {
        if (players.size > 1 && isdefined(org)) {
            return arraygetclosest(org, players);
        }
        return players[0];
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x947a7b62, Offset: 0x9f58
// Size: 0x9e
function ent_flag_init_ai_standards() {
    message_array = [];
    message_array[message_array.size] = "goal";
    message_array[message_array.size] = "damage";
    for (i = 0; i < message_array.size; i++) {
        self flag::init(message_array[i]);
        self thread ent_flag_wait_ai_standards(message_array[i]);
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x9cde3b0b, Offset: 0xa000
// Size: 0x42
function ent_flag_wait_ai_standards(message) {
    self endon(#"death");
    self waittill(message);
    self.ent_flag[message] = 1;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xc6843bfb, Offset: 0xa050
// Size: 0x2c
function flat_angle(angle) {
    rangle = (0, angle[1], 0);
    return rangle;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x8b5827f, Offset: 0xa088
// Size: 0x42
function clear_run_anim() {
    self.alwaysrunforward = undefined;
    self.a.combatrunanim = undefined;
    self.run_noncombatanim = undefined;
    self.walk_combatanim = undefined;
    self.walk_noncombatanim = undefined;
    self.precombatrunenabled = 1;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xa2c1ca93, Offset: 0xa0d8
// Size: 0x99e
function track_players_intersection_tracker() {
    level endon(#"end_game");
    wait(5);
    var_76013453 = [];
    /#
        if (!isdefined(level.var_9db63456)) {
            level.var_9db63456 = 0;
        }
    #/
    if (!isdefined(level.var_9db63456)) {
        level.var_9db63456 = 1;
    }
    while (true) {
        var_1a1f860b = 0;
        players = getplayers();
        /#
            foreach (player in players) {
                if (!isdefined(player.var_ab8c5e97)) {
                    player.var_ab8c5e97 = [];
                }
                if (!isdefined(player.var_d28c72e5)) {
                    player.var_d28c72e5 = 1000;
                }
            }
        #/
        var_93bba48c = [];
        for (i = 0; i < players.size; i++) {
            if (isdefined(players[i].var_f4e33249) && players[i].var_f4e33249 || players[i] isplayerswimming() || players[i] laststand::player_is_in_laststand() || "playing" != players[i].sessionstate) {
                continue;
            }
            if (isbot(players[i])) {
                continue;
            }
            if (lengthsquared(players[i] getvelocity()) > 15625) {
                continue;
            }
            if (isdefined(players[i].var_c5e36086) && players[i].var_c5e36086) {
                continue;
            }
            for (j = 0; j < players.size; j++) {
                if (i == j || isdefined(players[j].var_f4e33249) && players[j].var_f4e33249 || players[j] isplayerswimming() || players[j] laststand::player_is_in_laststand() || "playing" != players[j].sessionstate) {
                    continue;
                }
                if (isbot(players[j])) {
                    continue;
                }
                if (lengthsquared(players[j] getvelocity()) > 15625) {
                    continue;
                }
                if (isdefined(players[j].var_c5e36086) && players[j].var_c5e36086) {
                    continue;
                }
                if (isdefined(level.player_intersection_tracker_override)) {
                    if (players[i] [[ level.player_intersection_tracker_override ]](players[j])) {
                        continue;
                    }
                }
                playeri_origin = players[i].origin;
                playerj_origin = players[j].origin;
                if (abs(playeri_origin[2] - playerj_origin[2]) > 60) {
                    continue;
                }
                distance_apart = distance2d(playeri_origin, playerj_origin);
                /#
                    if (!isdefined(players[i].var_ab8c5e97[j])) {
                        players[i].var_ab8c5e97[j] = 1000;
                    }
                    players[i].var_ab8c5e97[j] = min(players[i].var_ab8c5e97[j], distance_apart);
                    players[i].var_d28c72e5 = min(players[i].var_d28c72e5, distance_apart);
                    if (abs(distance_apart) > 30) {
                        if (players[i].var_ab8c5e97[j] === players[i].var_d28c72e5) {
                            players[i].var_d28c72e5 = 1000;
                        }
                        players[i].var_ab8c5e97[j] = 1000;
                    }
                #/
                if (abs(distance_apart) > 9) {
                    continue;
                }
                if (!isdefined(var_93bba48c)) {
                    var_93bba48c = [];
                } else if (!isarray(var_93bba48c)) {
                    var_93bba48c = array(var_93bba48c);
                }
                if (!isinarray(var_93bba48c, players[i])) {
                    var_93bba48c[var_93bba48c.size] = players[i];
                }
                if (!isdefined(var_93bba48c)) {
                    var_93bba48c = [];
                } else if (!isarray(var_93bba48c)) {
                    var_93bba48c = array(var_93bba48c);
                }
                if (!isinarray(var_93bba48c, players[j])) {
                    var_93bba48c[var_93bba48c.size] = players[j];
                }
            }
        }
        foreach (var_e42ab7b4 in var_93bba48c) {
            /#
                if (!level.var_9db63456) {
                    iprintlnbold("<unknown string>" + var_e42ab7b4.var_d28c72e5);
                    continue;
                }
            #/
            if (isinarray(var_76013453, var_e42ab7b4)) {
                if (isdefined(var_e42ab7b4.maxhealth) && var_e42ab7b4.maxhealth > 0) {
                    n_damage = var_e42ab7b4.maxhealth / 3 + 1;
                } else {
                    n_damage = 51;
                }
                if (isdefined(var_e42ab7b4) && isvec(var_e42ab7b4.origin)) {
                    self.var_dad8bef6 = 1;
                    var_e42ab7b4 dodamage(n_damage, var_e42ab7b4.origin);
                    self.var_dad8bef6 = undefined;
                    var_e42ab7b4 zm_stats::increment_map_cheat_stat("cheat_too_friendly");
                    var_e42ab7b4 zm_stats::increment_client_stat("cheat_too_friendly", 0);
                    var_e42ab7b4 zm_stats::increment_client_stat("cheat_total", 0);
                }
            }
            if (!var_1a1f860b) {
                /#
                    iprintlnbold("<unknown string>" + var_e42ab7b4.var_d28c72e5);
                #/
                foreach (e_player in level.players) {
                    e_player playlocalsound(level.zmb_laugh_alias);
                }
                var_1a1f860b = 1;
            }
        }
        var_76013453 = var_93bba48c;
        wait(1);
    }
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0xa623e8a8, Offset: 0xaa80
// Size: 0x160
function is_player_looking_at(origin, dot, do_trace, ignore_ent) {
    /#
        assert(isplayer(self), "<unknown string>");
    #/
    if (!isdefined(dot)) {
        dot = 0.7;
    }
    if (!isdefined(do_trace)) {
        do_trace = 1;
    }
    eye = self util::get_eye();
    delta_vec = anglestoforward(vectortoangles(origin - eye));
    view_vec = anglestoforward(self getplayerangles());
    new_dot = vectordot(delta_vec, view_vec);
    if (new_dot >= dot) {
        if (do_trace) {
            return bullettracepassed(origin, eye, 0, ignore_ent);
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x0
// Checksum 0xdc01db86, Offset: 0xabe8
// Size: 0x24
function add_gametype(gt, dummy1, name, dummy2) {
    
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x0
// Checksum 0xfb8a6b1c, Offset: 0xac18
// Size: 0x24
function add_gameloc(gl, dummy1, name, dummy2) {
    
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0x633a103d, Offset: 0xac48
// Size: 0xde
function get_closest_index(org, array, dist = 9999999) {
    distsq = dist * dist;
    if (array.size < 1) {
        return;
    }
    index = undefined;
    for (i = 0; i < array.size; i++) {
        newdistsq = distancesquared(array[i].origin, org);
        if (newdistsq >= distsq) {
            continue;
        }
        distsq = newdistsq;
        index = i;
    }
    return index;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xa61f925, Offset: 0xad30
// Size: 0xde
function is_valid_zombie_spawn_point(point) {
    liftedorigin = point.origin + vectorscale((0, 0, 1), 5);
    size = 48;
    height = 64;
    mins = (-1 * size, -1 * size, 0);
    maxs = (size, size, height);
    absmins = liftedorigin + mins;
    absmaxs = liftedorigin + maxs;
    if (boundswouldtelefrag(absmins, absmaxs)) {
        return false;
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x0
// Checksum 0x76532b85, Offset: 0xae18
// Size: 0x126
function get_closest_index_to_entity(entity, array, dist, extra_check) {
    org = entity.origin;
    if (!isdefined(dist)) {
        dist = 9999999;
    }
    distsq = dist * dist;
    if (array.size < 1) {
        return;
    }
    index = undefined;
    for (i = 0; i < array.size; i++) {
        if (isdefined(extra_check) && ![[ extra_check ]](entity, array[i])) {
            continue;
        }
        newdistsq = distancesquared(array[i].origin, org);
        if (newdistsq >= distsq) {
            continue;
        }
        distsq = newdistsq;
        index = i;
    }
    return index;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x78bd68bd, Offset: 0xaf48
// Size: 0x4a
function set_gamemode_var(gvar, val) {
    if (!isdefined(game.gamemode_match)) {
        game.gamemode_match = [];
    }
    game.gamemode_match[gvar] = val;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x24a99e2e, Offset: 0xafa0
// Size: 0x5e
function set_gamemode_var_once(gvar, val) {
    if (!isdefined(game.gamemode_match)) {
        game.gamemode_match = [];
    }
    if (!isdefined(game.gamemode_match[gvar])) {
        game.gamemode_match[gvar] = val;
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xfc646a17, Offset: 0xb008
// Size: 0x48
function get_gamemode_var(gvar) {
    if (isdefined(game.gamemode_match) && isdefined(game.gamemode_match[gvar])) {
        return game.gamemode_match[gvar];
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x0
// Checksum 0xd9271947, Offset: 0xb058
// Size: 0x1d0
function waittill_subset(min_num, string1, string2, string3, string4, string5) {
    self endon(#"death");
    ent = spawnstruct();
    ent.threads = 0;
    returned_threads = 0;
    if (isdefined(string1)) {
        self thread util::waittill_string(string1, ent);
        ent.threads++;
    }
    if (isdefined(string2)) {
        self thread util::waittill_string(string2, ent);
        ent.threads++;
    }
    if (isdefined(string3)) {
        self thread util::waittill_string(string3, ent);
        ent.threads++;
    }
    if (isdefined(string4)) {
        self thread util::waittill_string(string4, ent);
        ent.threads++;
    }
    if (isdefined(string5)) {
        self thread util::waittill_string(string5, ent);
        ent.threads++;
    }
    while (ent.threads) {
        ent waittill(#"returned");
        ent.threads--;
        returned_threads++;
        if (returned_threads >= min_num) {
            break;
        }
    }
    ent notify(#"die");
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x3c0b3f38, Offset: 0xb230
// Size: 0x18a
function is_headshot(weapon, shitloc, smeansofdeath, var_f8c15d58 = 1) {
    if (smeansofdeath == "MOD_MELEE" || smeansofdeath == "MOD_UNKNOWN") {
        return false;
    }
    if (var_f8c15d58 && isdefined(self.var_e6675d2d) && (smeansofdeath == "MOD_PROJECTILE" || smeansofdeath == "MOD_PROJECTILE_SPLASH" || smeansofdeath == "MOD_GRENADE" || smeansofdeath == "MOD_GRENADE_SPLASH")) {
        v_head = self gettagorigin("j_head");
        if (!isdefined(v_head)) {
            return false;
        }
        n_distance_squared = distancesquared(self.var_e6675d2d, v_head);
        if (n_distance_squared < 80) {
            return true;
        }
    }
    if (!isdefined(shitloc) || shitloc == "none") {
        return false;
    }
    if (shitloc != "head" && shitloc != "helmet" && shitloc != "neck") {
        return false;
    }
    return true;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x8d03d647, Offset: 0xb3c8
// Size: 0x7e
function is_explosive_damage(mod) {
    if (!isdefined(mod)) {
        return false;
    }
    if (mod == "MOD_GRENADE" || mod == "MOD_GRENADE_SPLASH" || mod == "MOD_PROJECTILE" || mod == "MOD_PROJECTILE_SPLASH" || mod == "MOD_EXPLOSIVE") {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xe9d1e753, Offset: 0xb450
// Size: 0x8c
function function_7a35b1d7(var_c857a96d) {
    if (isplayer(self)) {
        self luinotifyevent(#"zombie_notification", 2, var_c857a96d, self getentitynumber());
        return;
    }
    luinotifyevent(#"zombie_notification", 1, var_c857a96d);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0xc456bbc3, Offset: 0xb4e8
// Size: 0x84
function function_846eb7dd(type_id, var_c857a96d) {
    if (isplayer(self)) {
        self luinotifyevent(type_id, 2, var_c857a96d, self getentitynumber());
        return;
    }
    luinotifyevent(type_id, 1, var_c857a96d);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xcef29882, Offset: 0xb578
// Size: 0x9c
function function_e64ac3b6(type_id, var_c857a96d) {
    if (isplayer(self)) {
        self luinotifyevent(#"zombie_special_notification", 3, type_id, var_c857a96d, self getentitynumber());
        return;
    }
    luinotifyevent(#"zombie_special_notification", 2, type_id, var_c857a96d);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x2e8a9613, Offset: 0xb620
// Size: 0x7a
function sndswitchannouncervox(who) {
    switch (who) {
    case #"sam":
        game.var_85e678a1[#"prefix"] = "vox_zmba_sam";
        level.zmb_laugh_alias = "zmb_player_outofbounds";
        level.sndannouncerisrich = 0;
        break;
    }
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x5961aceb, Offset: 0xb6a8
// Size: 0xc4
function do_player_general_vox(category, type, timer, chance) {
    if (isdefined(timer) && isdefined(level.votimer[type]) && level.votimer[type] > 0) {
        return;
    }
    self thread zm_audio::create_and_play_dialog(category, type);
    if (isdefined(timer)) {
        level.votimer[type] = timer;
        level thread general_vox_timer(level.votimer[type], type);
    }
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x4826b282, Offset: 0xb778
// Size: 0xd4
function general_vox_timer(timer, type) {
    level endon(#"end_game");
    /#
        println("<unknown string>" + type + "<unknown string>" + timer + "<unknown string>");
    #/
    while (timer > 0) {
        wait(1);
        timer--;
    }
    level.votimer[type] = timer;
    /#
        println("<unknown string>" + type + "<unknown string>" + timer + "<unknown string>");
    #/
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0xc18c6adc, Offset: 0xb858
// Size: 0x1c
function play_vox_to_player(category, type, force_variant) {
    
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x6228eddc, Offset: 0xb880
// Size: 0x92
function is_favorite_weapon(weapon_to_check) {
    if (!isdefined(self.favorite_wall_weapons_list)) {
        return false;
    }
    foreach (weapon in self.favorite_wall_weapons_list) {
        if (weapon_to_check == weapon) {
            return true;
        }
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x6e4940e, Offset: 0xb920
// Size: 0x1ec
function set_demo_intermission_point() {
    spawnpoints = getentarray("mp_global_intermission", "classname");
    if (!spawnpoints.size) {
        return;
    }
    spawnpoint = spawnpoints[0];
    match_string = "";
    location = level.scr_zm_map_start_location;
    if ((location == "default" || location == "") && isdefined(level.default_start_location)) {
        location = level.default_start_location;
    }
    match_string = level.scr_zm_ui_gametype + "_" + location;
    for (i = 0; i < spawnpoints.size; i++) {
        if (isdefined(spawnpoints[i].script_string)) {
            tokens = strtok(spawnpoints[i].script_string, " ");
            foreach (token in tokens) {
                if (token == match_string) {
                    spawnpoint = spawnpoints[i];
                    i = spawnpoints.size;
                    break;
                }
            }
        }
    }
    setdemointermissionpoint(spawnpoint.origin, spawnpoint.angles);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0x1fdb3e85, Offset: 0xbb18
// Size: 0x32
function register_map_navcard(navcard_on_map, navcard_needed_for_computer) {
    level.navcard_needed = navcard_needed_for_computer;
    level.map_navcard = navcard_on_map;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xe767ad81, Offset: 0xbb58
// Size: 0x2a
function does_player_have_map_navcard(player) {
    return player zm_stats::get_global_stat(level.map_navcard);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x124a058b, Offset: 0xbb90
// Size: 0x3a
function does_player_have_correct_navcard(player) {
    if (!isdefined(level.navcard_needed)) {
        return 0;
    }
    return player zm_stats::get_global_stat(level.navcard_needed);
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x11a4465f, Offset: 0xbbd8
// Size: 0xd4
function disable_player_move_states(forcestancechange) {
    self allowcrouch(1);
    self allowads(0);
    self allowsprint(0);
    self allowprone(0);
    self allowmelee(0);
    if (isdefined(forcestancechange) && forcestancechange) {
        if (self getstance() == "prone") {
            self setstance("crouch");
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xbc20a93f, Offset: 0xbcb8
// Size: 0x10c
function enable_player_move_states() {
    if (!isdefined(self)) {
        return;
    }
    if (!isplayer(self)) {
        return;
    }
    if (!isdefined(self._allow_ads) || self._allow_ads == 1) {
        self allowads(1);
    }
    if (!isdefined(self._allow_sprint) || self._allow_sprint == 1) {
        self allowsprint(1);
    }
    if (!isdefined(self._allow_prone) || self._allow_prone == 1) {
        self allowprone(1);
    }
    if (!isdefined(self._allow_melee) || self._allow_melee == 1) {
        self allowmelee(1);
    }
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x0
// Checksum 0x3eb02cd0, Offset: 0xbdd0
// Size: 0x126
function spawn_path_node(origin, angles, k1, v1, k2, v2) {
    if (!isdefined(level._spawned_path_nodes)) {
        level._spawned_path_nodes = [];
    }
    node = spawnstruct();
    node.origin = origin;
    node.angles = angles;
    node.k1 = k1;
    node.v1 = v1;
    node.k2 = k2;
    node.v2 = v2;
    node.node = spawn_path_node_internal(origin, angles, k1, v1, k2, v2);
    level._spawned_path_nodes[level._spawned_path_nodes.size] = node;
    return node.node;
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x1 linked
// Checksum 0xb3f1c8dc, Offset: 0xbf00
// Size: 0xbe
function spawn_path_node_internal(origin, angles, k1, v1, k2, v2) {
    if (isdefined(k2)) {
        return spawnpathnode("node_pathnode", origin, angles, k1, v1, k2, v2);
    } else if (isdefined(k1)) {
        return spawnpathnode("node_pathnode", origin, angles, k1, v1);
    } else {
        return spawnpathnode("node_pathnode", origin, angles);
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0xbfc8
// Size: 0x4
function delete_spawned_path_nodes() {
    
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xaeea5ae2, Offset: 0xbfd8
// Size: 0xf0
function respawn_path_nodes() {
    if (!isdefined(level._spawned_path_nodes)) {
        return;
    }
    for (i = 0; i < level._spawned_path_nodes.size; i++) {
        node_struct = level._spawned_path_nodes[i];
        /#
            println("<unknown string>" + node_struct.origin);
        #/
        node_struct.node = spawn_path_node_internal(node_struct.origin, node_struct.angles, node_struct.k1, node_struct.v1, node_struct.k2, node_struct.v2);
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x1b3d1e3b, Offset: 0xc0d0
// Size: 0x64
function undo_link_changes() {
    /#
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>");
    #/
    delete_spawned_path_nodes();
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x99e90e46, Offset: 0xc140
// Size: 0x64
function redo_link_changes() {
    /#
        println("<unknown string>");
        println("<unknown string>");
        println("<unknown string>");
    #/
    respawn_path_nodes();
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xe4ca16c6, Offset: 0xc1b0
// Size: 0x98
function is_gametype_active(a_gametypes) {
    b_is_gametype_active = 0;
    if (!isarray(a_gametypes)) {
        a_gametypes = array(a_gametypes);
    }
    for (i = 0; i < a_gametypes.size; i++) {
        if (util::get_game_type() == a_gametypes[i]) {
            b_is_gametype_active = 1;
        }
    }
    return b_is_gametype_active;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x0
// Checksum 0x482d0219, Offset: 0xc250
// Size: 0x4a
function register_custom_spawner_entry(spot_noteworthy, func) {
    if (!isdefined(level.custom_spawner_entry)) {
        level.custom_spawner_entry = [];
    }
    level.custom_spawner_entry[spot_noteworthy] = func;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xcbd78b35, Offset: 0xc2a8
// Size: 0x8e
function get_player_weapon_limit(player) {
    if (isdefined(self.get_player_weapon_limit)) {
        return [[ self.get_player_weapon_limit ]](player);
    }
    if (isdefined(level.get_player_weapon_limit)) {
        return [[ level.get_player_weapon_limit ]](player);
    }
    weapon_limit = 2;
    if (player hasperk(#"specialty_additionalprimaryweapon")) {
        weapon_limit = level.additionalprimaryweapon_limit;
    }
    return weapon_limit;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x2ed2b726, Offset: 0xc340
// Size: 0x62
function function_e05ac4ad(e_player, n_cost) {
    if (isdefined(level.var_236b9f7a) && [[ level.var_236b9f7a ]](e_player, self.clientfieldname)) {
        return 0;
    }
    return e_player zm_score::can_player_purchase(n_cost);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xa8290d0f, Offset: 0xc3b0
// Size: 0x42
function get_player_perk_purchase_limit() {
    n_perk_purchase_limit_override = level.perk_purchase_limit;
    if (isdefined(level.get_player_perk_purchase_limit)) {
        n_perk_purchase_limit_override = self [[ level.get_player_perk_purchase_limit ]]();
    }
    return n_perk_purchase_limit_override;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x8d10ea22, Offset: 0xc400
// Size: 0x70
function can_player_purchase_perk() {
    if (self.num_perks < self get_player_perk_purchase_limit()) {
        return true;
    }
    if (self bgb::is_enabled(#"zm_bgb_unquenchable") || self bgb::is_enabled(#"zm_bgb_soda_fountain")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0xc5cadf3, Offset: 0xc478
// Size: 0x36
function wait_for_attractor_positions_complete() {
    self endon(#"death");
    self waittill(#"attractor_positions_generated");
    self.attract_to_origin = 0;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xbb2bf46, Offset: 0xc4b8
// Size: 0xd6
function get_player_index(player) {
    /#
        assert(isplayer(player));
    #/
    /#
        assert(isdefined(player.characterindex));
    #/
    /#
        if (player.entity_num == 0 && getdvarstring(#"zombie_player_vo_overwrite") != "<unknown string>") {
            new_vo_index = getdvarint(#"zombie_player_vo_overwrite", 0);
            return new_vo_index;
        }
    #/
    return player.characterindex;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x508afbba, Offset: 0xc598
// Size: 0x98
function function_828bac1(n_character_index) {
    foreach (character in level.players) {
        if (character zm_characters::function_dc232a80() === n_character_index) {
            return character;
        }
    }
    return undefined;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xa60ad3f7, Offset: 0xc638
// Size: 0xfc
function zombie_goto_round(n_target_round) {
    level notify(#"restart_round");
    if (n_target_round < 1) {
        n_target_round = 1;
    }
    level.zombie_total = 0;
    level.zombie_health = zombie_utility::ai_calculate_health(zombie_utility::function_d2dfacfd(#"zombie_health_start"), n_target_round);
    zm_round_logic::set_round_number(n_target_round);
    zombies = zombie_utility::get_round_enemy_array();
    if (isdefined(zombies)) {
        array::run_all(zombies, &kill);
    }
    level.sndgotoroundoccurred = 1;
    level waittill(#"between_round_over");
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xc63304a, Offset: 0xc740
// Size: 0x226
function is_point_inside_enabled_zone(v_origin, ignore_zone) {
    if (function_21f4ac36()) {
        node = function_52c1730(v_origin, level.zone_nodes, 500);
        if (isdefined(node)) {
            zone = level.zones[node.targetname];
            if (isdefined(zone) && zone.is_enabled && zone !== ignore_zone) {
                return true;
            }
        }
    }
    if (function_c85ebbbc()) {
        temp_ent = spawn("script_origin", v_origin);
        foreach (zone in level.zones) {
            if (!zone.is_enabled) {
                continue;
            }
            if (isdefined(ignore_zone) && zone == ignore_zone) {
                continue;
            }
            foreach (e_volume in zone.volumes) {
                if (temp_ent istouching(e_volume)) {
                    temp_ent delete();
                    return true;
                }
            }
        }
        temp_ent delete();
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x317c0a19, Offset: 0xc970
// Size: 0x46
function clear_streamer_hint() {
    if (isdefined(self.streamer_hint)) {
        self.streamer_hint delete();
        self.streamer_hint = undefined;
    }
    self notify(#"wait_clear_streamer_hint");
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xa8a2e47d, Offset: 0xc9c0
// Size: 0x44
function wait_clear_streamer_hint(lifetime) {
    self endon(#"wait_clear_streamer_hint");
    wait(lifetime);
    if (isdefined(self)) {
        self clear_streamer_hint();
    }
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x3950f982, Offset: 0xca10
// Size: 0x19c
function create_streamer_hint(origin, angles, value, lifetime) {
    if (self == level) {
        foreach (player in getplayers()) {
            player clear_streamer_hint();
        }
    }
    self clear_streamer_hint();
    self.streamer_hint = createstreamerhint(origin, value);
    if (isdefined(angles)) {
        self.streamer_hint.angles = angles;
    }
    if (self != level) {
        self.streamer_hint setinvisibletoall();
        self.streamer_hint setvisibletoplayer(self);
    }
    self.streamer_hint setincludemeshes(1);
    self notify(#"wait_clear_streamer_hint");
    if (isdefined(lifetime) && lifetime > 0) {
        self thread wait_clear_streamer_hint(lifetime);
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xaabb2e7, Offset: 0xcbb8
// Size: 0x138
function approximate_path_dist(player) {
    aiprofile_beginentry("approximate_path_dist");
    goal_pos = player.origin;
    if (isdefined(player.last_valid_position)) {
        goal_pos = player.last_valid_position;
    }
    if (isdefined(player.b_teleporting) && player.b_teleporting) {
        if (isdefined(player.teleport_location)) {
            goal_pos = player.teleport_location;
            if (!ispointonnavmesh(goal_pos, self)) {
                position = getclosestpointonnavmesh(goal_pos, 100, 15);
                if (isdefined(position)) {
                    goal_pos = position;
                }
            }
        }
    }
    approx_dist = pathdistance(self.origin, goal_pos, 1, self);
    aiprofile_endentry();
    return approx_dist;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0x3788fbce, Offset: 0xccf8
// Size: 0x72
function get_player_closest_to(e_target) {
    a_players = arraycopy(level.activeplayers);
    arrayremovevalue(a_players, e_target);
    e_closest_player = arraygetclosest(e_target.origin, a_players);
    return e_closest_player;
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0x88c02733, Offset: 0xcd78
// Size: 0x168
function is_facing(facee, requireddot = 0.5, b_2d = 1) {
    orientation = self getplayerangles();
    v_forward = anglestoforward(orientation);
    v_to_facee = facee.origin - self.origin;
    if (b_2d) {
        v_forward_computed = (v_forward[0], v_forward[1], 0);
        v_to_facee_computed = (v_to_facee[0], v_to_facee[1], 0);
    } else {
        v_forward_computed = v_forward;
        v_to_facee_computed = v_to_facee;
    }
    v_unit_forward_computed = vectornormalize(v_forward_computed);
    v_unit_to_facee_computed = vectornormalize(v_to_facee_computed);
    dotproduct = vectordot(v_unit_forward_computed, v_unit_to_facee_computed);
    return dotproduct > requireddot;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0xd33f8261, Offset: 0xcee8
// Size: 0x3c
function is_solo_ranked_game() {
    return level.players.size == 1 && getdvarint(#"zm_private_rankedmatch", 0);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0xba970260, Offset: 0xcf30
// Size: 0x34
function function_e63cdbef() {
    return level.rankedmatch || getdvarint(#"zm_private_rankedmatch", 0);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x4d2b4581, Offset: 0xcf70
// Size: 0x4c
function function_a3648315() {
    if (!isdefined(level.var_b03a2fc8)) {
        level.var_b03a2fc8 = new throttle();
        [[ level.var_b03a2fc8 ]]->initialize(1, 0.1);
    }
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x168c3e7b, Offset: 0xcfc8
// Size: 0x44
function function_ffc279(v_magnitude, e_attacker, n_damage, weapon) {
    self thread function_315c8e4(v_magnitude, e_attacker, n_damage, weapon);
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x5 linked
// Checksum 0x266314e2, Offset: 0xd018
// Size: 0x104
function private function_315c8e4(v_magnitude, e_attacker, n_damage = self.health, weapon) {
    self endon(#"death");
    if (!isdefined(weapon)) {
        weapon = level.weaponnone;
    }
    self.var_bfffc79e = 1;
    [[ level.var_b03a2fc8 ]]->waitinqueue(self);
    self startragdoll();
    self launchragdoll(v_magnitude);
    util::wait_network_frame();
    if (isdefined(self)) {
        self.var_bfffc79e = undefined;
        self dodamage(n_damage, self.origin, e_attacker, undefined, "none", "MOD_UNKNOWN", 0, weapon);
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x979485c9, Offset: 0xd128
// Size: 0x6a
function set_max_health(var_54cb21f6 = 0) {
    if (self.health < self.var_66cb03ad) {
        self.health = self.var_66cb03ad;
    }
    if (var_54cb21f6) {
        if (self.health > self.var_66cb03ad) {
            self.health = self.var_66cb03ad;
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x5e87941b, Offset: 0xd1a0
// Size: 0xfe
function function_13cc9756() {
    self endon(#"death");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"zone_change");
        if (isdefined(waitresult.zone)) {
            self.inner_zigzag_radius = waitresult.zone.inner_zigzag_radius;
            self.outer_zigzag_radius = waitresult.zone.outer_zigzag_radius;
            self.zigzag_distance_min = waitresult.zone.zigzag_distance_min;
            self.zigzag_distance_max = waitresult.zone.zigzag_distance_max;
            self.zigzag_activation_distance = waitresult.zone.zigzag_activation_distance;
            self.var_592a8227 = waitresult.zone.zigzag_enabled;
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x2884681a, Offset: 0xd2a8
// Size: 0x88
function function_45492cc4(var_cf5e7324 = 1) {
    if (!isdefined(self)) {
        return 0;
    }
    if (!isdefined(self.owner)) {
        return 0;
    }
    if (!(self.classname === "script_vehicle")) {
        return 0;
    }
    if (var_cf5e7324 && isplayer(self.owner)) {
        return 1;
    }
    return isdefined(self.owner);
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x33724c5, Offset: 0xd338
// Size: 0x9e
function function_1a4d2910() {
    if (isdefined(level.var_2456c78a)) {
        foreach (var_92254a2f in level.var_2456c78a) {
            if (distancesquared(self.origin, var_92254a2f) < 10000) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x265e9cd0, Offset: 0xd3e0
// Size: 0x9e
function function_64259898(position, search_radius = 128) {
    goal_pos = getclosestpointonnavmesh(position, search_radius, self getpathfindingradius());
    if (isdefined(goal_pos)) {
        self setgoal(goal_pos);
        return true;
    }
    self setgoal(self.origin);
    return false;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x3d8df225, Offset: 0xd488
// Size: 0xfa
function function_372a1e12() {
    a_e_players = getplayers();
    e_least_hunted = undefined;
    foreach (e_player in a_e_players) {
        if (!isdefined(e_player.hunted_by)) {
            e_player.hunted_by = 0;
        }
        if (!is_player_valid(e_player)) {
            continue;
        }
        if (!isdefined(e_least_hunted) || e_player.hunted_by < e_least_hunted.hunted_by) {
            e_least_hunted = e_player;
        }
    }
    return e_least_hunted;
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0x247b318a, Offset: 0xd590
// Size: 0xc0
function function_d7db256e(var_eaf129a0, var_6cc77d4e, var_888cf948 = 1, var_b96be97f = undefined) {
    if (isdefined(var_6cc77d4e)) {
        s_objective_loc = struct::get(var_eaf129a0);
        n_obj_id = function_f5a222a8(var_6cc77d4e, s_objective_loc.origin, var_b96be97f);
    }
    if (var_888cf948) {
        level thread function_75fd65f9(var_eaf129a0, 1);
    }
    return n_obj_id;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x4689d050, Offset: 0xd658
// Size: 0x54
function function_b1f3be5c(n_obj_id, var_eaf129a0) {
    if (isdefined(n_obj_id)) {
        gameobjects::release_obj_id(n_obj_id);
    }
    level thread function_75fd65f9(var_eaf129a0, 0);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x917ad62a, Offset: 0xd6b8
// Size: 0x6c
function function_ba39d198(n_obj_id, b_show = 1) {
    if (isdefined(n_obj_id)) {
        if (b_show) {
            objective_setvisibletoplayer(n_obj_id, self);
            return;
        }
        objective_setinvisibletoplayer(n_obj_id, self);
    }
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x2587c329, Offset: 0xd730
// Size: 0x114
function function_f5a222a8(var_6cc77d4e, v_origin_or_ent, var_b96be97f = undefined) {
    n_obj_id = gameobjects::get_next_obj_id();
    objective_add(n_obj_id, "active", v_origin_or_ent, var_6cc77d4e);
    function_da7940a3(n_obj_id, 1);
    if (isdefined(var_b96be97f)) {
        foreach (player in getplayers()) {
            player thread function_71071944(n_obj_id, var_b96be97f);
        }
    }
    return n_obj_id;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xedb08f39, Offset: 0xd850
// Size: 0x184
function function_71071944(n_obj_id, var_b96be97f) {
    level endon(#"game_ended", #"hash_1dabaf25a56177a1");
    self endon(#"disconnect");
    self.var_fbb52104 = n_obj_id;
    self.var_d4778e21 = var_b96be97f;
    while ([[ var_b96be97f ]]()) {
        objective_setinvisibletoplayer(n_obj_id, self);
        waitframe(1);
    }
    objective_setvisibletoplayer(n_obj_id, self);
    if (isdefined(level.var_81c681aa) && level.var_81c681aa) {
        var_880caa89 = 1;
        foreach (e_player in getplayers()) {
            if (e_player [[ var_b96be97f ]]()) {
                var_880caa89 = 0;
            }
        }
        if (var_880caa89) {
            level flag::set(#"disable_fast_travel");
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x0
// Checksum 0xaf557c6, Offset: 0xd9e0
// Size: 0x24
function function_bc5a54a8(n_obj_id) {
    gameobjects::release_obj_id(n_obj_id);
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x6c8853f7, Offset: 0xda10
// Size: 0x220
function function_75fd65f9(str_targetname, b_enable = 1) {
    if (!isdefined(str_targetname)) {
        return;
    }
    var_f8f0b389 = struct::get(str_targetname);
    var_2a7c782 = struct::get_array(var_f8f0b389.target);
    foreach (var_bf20477f in var_2a7c782) {
        if (b_enable) {
            if (isdefined(var_bf20477f.var_8e8faeba)) {
                var_bf20477f.var_8e8faeba clientfield::set("zm_zone_edge_marker_count", 0);
                util::wait_network_frame();
            } else {
                var_bf20477f.var_8e8faeba = util::spawn_model("tag_origin", var_bf20477f.origin, var_bf20477f.angles);
            }
            var_eb0f1280 = 3;
            if (isdefined(var_bf20477f.var_d229e574) && var_bf20477f.var_d229e574 > 0) {
                var_eb0f1280 = var_bf20477f.var_d229e574;
            }
            var_bf20477f.var_8e8faeba clientfield::set("zm_zone_edge_marker_count", var_eb0f1280);
            continue;
        }
        if (isdefined(var_bf20477f.var_8e8faeba)) {
            var_bf20477f.var_8e8faeba clientfield::set("zm_zone_edge_marker_count", 0);
            var_bf20477f.var_8e8faeba thread util::delayed_delete(1);
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0x850bfd20, Offset: 0xdc38
// Size: 0x178
function function_ebb2f490() {
    a_w_list = self getweaponslistprimaries();
    var_dc69b88b = [];
    foreach (w_list_weapon in a_w_list) {
        if (!isdefined(var_dc69b88b)) {
            var_dc69b88b = [];
        } else if (!isarray(var_dc69b88b)) {
            var_dc69b88b = array(var_dc69b88b);
        }
        var_dc69b88b[var_dc69b88b.size] = zm_weapons::function_93cd8e76(w_list_weapon);
        if (w_list_weapon.splitweapon != level.weaponnone) {
            if (!isdefined(var_dc69b88b)) {
                var_dc69b88b = [];
            } else if (!isarray(var_dc69b88b)) {
                var_dc69b88b = array(var_dc69b88b);
            }
            var_dc69b88b[var_dc69b88b.size] = zm_weapons::function_93cd8e76(w_list_weapon.splitweapon);
        }
    }
    return var_dc69b88b;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x95ae81c4, Offset: 0xddb8
// Size: 0xce
function function_aa45670f(weapon, var_3a36e0dc) {
    root_weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(self.var_f6d3c3[var_3a36e0dc]) && isinarray(self.var_f6d3c3[var_3a36e0dc], root_weapon)) {
        var_dc69b88b = function_ebb2f490();
        if (isinarray(var_dc69b88b, root_weapon) || zm_weapons::function_93cd8e76(self.currentweapon) === root_weapon) {
            return true;
        }
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0x7d19bd4b, Offset: 0xde90
// Size: 0x26c
function function_28ee38f4(weapon, var_3a36e0dc, var_87f6ae5) {
    root_weapon = zm_weapons::function_93cd8e76(weapon);
    if (isdefined(self.var_f6d3c3[var_3a36e0dc]) && isinarray(self.var_f6d3c3[var_3a36e0dc], root_weapon)) {
        return false;
    }
    var_dc69b88b = function_ebb2f490();
    if (isinarray(var_dc69b88b, root_weapon) || zm_weapons::function_93cd8e76(self.currentweapon) === root_weapon) {
        if (!isdefined(self.var_f6d3c3[var_3a36e0dc])) {
            self.var_f6d3c3[var_3a36e0dc] = [];
        } else if (!isarray(self.var_f6d3c3[var_3a36e0dc])) {
            self.var_f6d3c3[var_3a36e0dc] = array(self.var_f6d3c3[var_3a36e0dc]);
        }
        self.var_f6d3c3[var_3a36e0dc][self.var_f6d3c3[var_3a36e0dc].size] = root_weapon;
        if (root_weapon.splitweapon !== level.weaponnone) {
            if (!isdefined(self.var_f6d3c3[var_3a36e0dc])) {
                self.var_f6d3c3[var_3a36e0dc] = [];
            } else if (!isarray(self.var_f6d3c3[var_3a36e0dc])) {
                self.var_f6d3c3[var_3a36e0dc] = array(self.var_f6d3c3[var_3a36e0dc]);
            }
            self.var_f6d3c3[var_3a36e0dc][self.var_f6d3c3[var_3a36e0dc].size] = root_weapon.splitweapon;
        }
        self thread function_13f40482();
        if (var_87f6ae5) {
            self zm_weapons::ammo_give(weapon);
        }
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x353fb833, Offset: 0xe108
// Size: 0xf2
function function_18ce0c8(weapon, var_3a36e0dc) {
    root_weapon = zm_weapons::function_93cd8e76(weapon);
    if (!isdefined(self.var_f6d3c3[var_3a36e0dc]) || !isinarray(self.var_f6d3c3[var_3a36e0dc], root_weapon)) {
        return;
    }
    self.var_f6d3c3[var_3a36e0dc] = array::exclude(self.var_f6d3c3[var_3a36e0dc], root_weapon);
    if (root_weapon.splitweapon != level.weaponnone) {
        self.var_f6d3c3[var_3a36e0dc] = array::exclude(self.var_f6d3c3[var_3a36e0dc], root_weapon.splitweapon);
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xd4f88335, Offset: 0xe208
// Size: 0x166
function function_13f40482() {
    self notify("680d457051e93357");
    self endon("680d457051e93357");
    self endon(#"disconnect");
    while (true) {
        self waittill(#"weapon_change");
        if (self scene::function_c935c42() || level flag::get("round_reset")) {
            continue;
        }
        var_dc69b88b = function_ebb2f490();
        for (i = 0; i < 1; i++) {
            foreach (var_406a430d in self.var_f6d3c3[i]) {
                if (!isinarray(var_dc69b88b, var_406a430d)) {
                    self function_18ce0c8(var_406a430d, i);
                }
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x2c90127c, Offset: 0xe378
// Size: 0x92
function function_fdb0368(n_round_number, str_endon) {
    if (isdefined(str_endon)) {
        self endon(str_endon);
    }
    if (!isdefined(level.round_number) || level.round_number < n_round_number) {
        while (true) {
            s_waitresult = undefined;
            s_waitresult = level waittill(#"start_of_round");
            if (s_waitresult.n_round_number >= n_round_number) {
                return;
            }
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 6, eflags: 0x1 linked
// Checksum 0x46e61e57, Offset: 0xe418
// Size: 0x600
function function_9ad5aeb1(var_a8d0b313 = 1, var_82ea43f2 = 1, b_hide_body = 0, var_b0e62e21 = 1, var_814b69d3 = 1, var_87c98387 = "white") {
    var_4b9821e4 = 0;
    a_players = util::get_active_players();
    foreach (player in a_players) {
        player val::set(#"hash_2f1b514922b9901e", "takedamage", 0);
    }
    if (!isarray(var_b0e62e21)) {
        if (var_b0e62e21) {
            if (var_814b69d3) {
                level thread lui::screen_flash(1, 1, 0.5, 1, var_87c98387);
            } else {
                level thread lui::screen_flash(0.2, 0.5, 1, 0.8, var_87c98387);
            }
        }
    } else {
        var_72487f42 = var_b0e62e21[0];
        n_hold = var_b0e62e21[1];
        var_7012f1e9 = var_b0e62e21[2];
        n_alpha = array(0.8, 1)[var_814b69d3];
        level thread lui::screen_flash(var_72487f42, n_hold, var_7012f1e9, n_alpha, var_87c98387);
    }
    foreach (ai in getaiteamarray(level.zombie_team)) {
        if (isalive(ai) && !(isdefined(ai.var_d45ca662) && ai.var_d45ca662) && !(isdefined(ai.marked_for_death) && ai.marked_for_death)) {
            if (var_a8d0b313) {
                ai zm_cleanup::function_23621259(0);
            }
            if (var_82ea43f2 || ai.var_6f84b820 !== #"basic" && ai.var_6f84b820 !== #"popcorn" && ai.var_6f84b820 !== #"enhanced") {
                if (is_magic_bullet_shield_enabled(ai)) {
                    ai util::stop_magic_bullet_shield();
                }
                ai.allowdeath = 1;
                ai.no_powerups = 1;
                ai.deathpoints_already_given = 1;
                ai.marked_for_death = 1;
                if (!b_hide_body && (ai.var_6f84b820 === #"basic" || ai.var_6f84b820 === #"enhanced") && var_4b9821e4 < 6) {
                    var_4b9821e4++;
                    ai thread zombie_death::flame_death_fx();
                    if (!(isdefined(ai.no_gib) && ai.no_gib)) {
                        ai zombie_utility::zombie_head_gib();
                    }
                }
                ai dodamage(ai.health + 666, ai.origin);
                if (b_hide_body) {
                    ai hide();
                    ai notsolid();
                }
            } else {
                ai delete();
            }
        }
        waitframe(1);
    }
    foreach (player in a_players) {
        if (isdefined(player)) {
            player val::reset(#"hash_2f1b514922b9901e", "takedamage");
        }
    }
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x0
// Checksum 0x9da602c7, Offset: 0xea20
// Size: 0x2c
function function_508f636d() {
    level function_9ad5aeb1(0, 1, 0, 1, "black");
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0x63d64f22, Offset: 0xea58
// Size: 0xb2
function function_850e7499(weapon, var_20c27a34 = 0) {
    if (weapon === getweapon(#"eq_wraith_fire") || weapon === getweapon(#"eq_wraith_fire_extra")) {
        return true;
    }
    if (var_20c27a34 && weapon === getweapon(#"wraith_fire_fire")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0xd435a88d, Offset: 0xeb18
// Size: 0x6a
function is_claymore(weapon) {
    if (weapon === getweapon(#"claymore") || weapon === getweapon(#"claymore_extra")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x60b67f1, Offset: 0xeb90
// Size: 0x6a
function function_b797694c(weapon) {
    if (weapon === getweapon(#"eq_acid_bomb") || weapon === getweapon(#"eq_acid_bomb_extra")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x4a2e483d, Offset: 0xec08
// Size: 0x6a
function is_frag_grenade(weapon) {
    if (weapon === getweapon(#"eq_frag_grenade") || weapon === getweapon(#"eq_frag_grenade_extra")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 2, eflags: 0x1 linked
// Checksum 0xcb1408fe, Offset: 0xec80
// Size: 0x8a
function is_mini_turret(weapon, var_b69165c7 = 0) {
    if (weapon === getweapon(#"mini_turret")) {
        return true;
    }
    if (var_b69165c7 && weapon === getweapon(#"gun_mini_turret")) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x3336efe7, Offset: 0xed18
// Size: 0x2e
function function_a2541519(var_da4af4df) {
    if (is_standard()) {
        var_da4af4df = level.var_aaf21bbb;
    }
    return var_da4af4df;
}

// Namespace zm_utility/zm_utility
// Params 7, eflags: 0x1 linked
// Checksum 0xeef9a565, Offset: 0xed50
// Size: 0x55e
function function_4a25b584(v_start_pos, var_487ba56d, n_radius = 512, b_randomize = 1, var_79ced64 = 0.2, n_half_height = 4, var_21aae2c6 = undefined) {
    level endon(#"end_game");
    var_bf08dccd = [];
    v_start_pos = groundtrace(v_start_pos + vectorscale((0, 0, 1), 8), v_start_pos + vectorscale((0, 0, -1), 100000), 0, undefined)[#"position"];
    if (isdefined(var_21aae2c6)) {
        s_result = positionquery_source_navigation(var_21aae2c6, 32, n_radius, n_half_height, 16, 1, 32);
    } else {
        s_result = positionquery_source_navigation(v_start_pos, 32, n_radius, n_half_height, 16, 1, 32);
    }
    if (isdefined(s_result) && isarray(s_result.data)) {
        if (b_randomize) {
            s_result.data = array::randomize(s_result.data);
        }
        foreach (var_c310df8c in s_result.data) {
            if (function_25e3484e(var_c310df8c.origin, 24, var_bf08dccd)) {
                var_7a4cb7eb = var_c310df8c.origin;
                n_height_diff = abs(var_7a4cb7eb[2] - v_start_pos[2]);
                if (n_height_diff > 60) {
                    continue;
                }
                if (!isdefined(var_bf08dccd)) {
                    var_bf08dccd = [];
                } else if (!isarray(var_bf08dccd)) {
                    var_bf08dccd = array(var_bf08dccd);
                }
                var_bf08dccd[var_bf08dccd.size] = var_7a4cb7eb;
                if (var_bf08dccd.size > var_487ba56d + 20) {
                    break;
                }
            }
        }
    }
    if (b_randomize) {
        var_bf08dccd = array::randomize(var_bf08dccd);
    }
    level.var_ec45f213 = 0;
    switch (level.players.size) {
    case 1:
        var_487ba56d = int(var_487ba56d * 0.5);
        break;
    case 2:
        var_487ba56d = int(var_487ba56d * 0.75);
        break;
    }
    if (var_487ba56d > var_bf08dccd.size) {
        var_487ba56d = var_bf08dccd.size;
    }
    var_487ba56d = int(max(var_487ba56d, 1));
    for (i = 0; i < var_487ba56d; i++) {
        e_powerup = function_ce46d95e(v_start_pos, 0, 0, 1);
        if (!isdefined(e_powerup)) {
            continue;
        }
        if (isdefined(var_bf08dccd[i])) {
            var_96bdce8a = length(v_start_pos - var_bf08dccd[i]);
            n_move_time = e_powerup fake_physicslaunch(var_bf08dccd[i] + vectorscale((0, 0, 1), 35), var_96bdce8a);
        } else {
            n_move_time = e_powerup fake_physicslaunch(v_start_pos + vectorscale((0, 0, 1), 35), n_radius / 3.5);
        }
        if (isdefined(level.var_b4ff4ec)) {
            e_powerup thread [[ level.var_b4ff4ec ]](n_move_time);
        }
        wait(var_79ced64);
    }
    if (is_standard()) {
        level.var_ec45f213 = 1;
    }
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x1 linked
// Checksum 0x3768600e, Offset: 0xf2b8
// Size: 0x158
function function_25e3484e(v_pos, n_spacing = 400, var_3e807a14) {
    var_91890e6 = zm_powerups::get_powerups(v_pos, n_spacing);
    if (var_91890e6.size > 0) {
        return false;
    }
    if (isarray(var_3e807a14)) {
        foreach (var_a8f85c02 in var_3e807a14) {
            if (distance(v_pos, var_a8f85c02) < n_spacing) {
                return false;
            }
        }
    }
    if (isdefined(level.var_3e96c707)) {
        if (![[ level.var_3e96c707 ]](v_pos)) {
            return false;
        }
    }
    if (check_point_in_playable_area(v_pos) && check_point_in_enabled_zone(v_pos)) {
        return true;
    }
    return false;
}

// Namespace zm_utility/zm_utility
// Params 4, eflags: 0x1 linked
// Checksum 0xfa651124, Offset: 0xf418
// Size: 0x116
function function_ce46d95e(v_origin, b_permanent = 1, var_4ecce348 = 1, var_9a5654a5) {
    if (var_4ecce348) {
        while (level.active_powerups.size >= 75) {
            waitframe(1);
        }
    }
    if (level.active_powerups.size < 75) {
        e_powerup = zm_powerups::specific_powerup_drop("bonus_points_player", v_origin, undefined, var_9a5654a5, undefined, b_permanent, 1);
        if (isdefined(e_powerup)) {
            if (isdefined(level.var_48e2ab90)) {
                e_powerup setscale(level.var_48e2ab90);
            }
            if (isdefined(level.var_6463d67c)) {
                e_powerup.var_258c5fbc = level.var_6463d67c;
            }
        }
    }
    return e_powerup;
}

// Namespace zm_utility/zm_utility
// Params 0, eflags: 0x1 linked
// Checksum 0xe573feb, Offset: 0xf538
// Size: 0x2c
function is_jumping() {
    ground_ent = self getgroundent();
    return !isdefined(ground_ent);
}

// Namespace zm_utility/zm_utility
// Params 3, eflags: 0x0
// Checksum 0x66d87381, Offset: 0xf570
// Size: 0x262
function function_9f7fd525(var_c61df77f = "zombie_location", a_str_zones, var_a6f0ec9f = 1) {
    a_s_locs = [];
    if (isdefined(a_str_zones)) {
        if (!isdefined(a_str_zones)) {
            a_str_zones = [];
        } else if (!isarray(a_str_zones)) {
            a_str_zones = array(a_str_zones);
        }
        if (var_a6f0ec9f) {
            var_5386ca1d = level.zm_loc_types[var_c61df77f];
        } else {
            var_5386ca1d = struct::get_array("spawn_location", "script_noteworthy");
        }
        foreach (str_zone in a_str_zones) {
            foreach (s_loc in var_5386ca1d) {
                if (str_zone === s_loc.zone_name) {
                    if (!isdefined(a_s_locs)) {
                        a_s_locs = [];
                    } else if (!isarray(a_s_locs)) {
                        a_s_locs = array(a_s_locs);
                    }
                    if (!isinarray(a_s_locs, s_loc)) {
                        a_s_locs[a_s_locs.size] = s_loc;
                    }
                }
            }
        }
    } else if (var_a6f0ec9f) {
        var_5386ca1d = level.zm_loc_types[var_c61df77f];
    } else {
        var_5386ca1d = struct::get_array("spawn_location", "script_noteworthy");
    }
    return a_s_locs;
}

// Namespace zm_utility/zm_utility
// Params 1, eflags: 0x1 linked
// Checksum 0x9905d0f0, Offset: 0xf7e0
// Size: 0xc2
function function_7618c8ef(var_6e4c63cc = 0.0667) {
    n_damage_multiplier = 1;
    if (isdefined(self.ignore_health_regen_delay) && self.ignore_health_regen_delay) {
        n_damage_multiplier = n_damage_multiplier + 1.25;
        if (self hasperk(#"specialty_quickrevive")) {
            n_damage_multiplier = n_damage_multiplier + 0.75;
        }
    }
    var_16e6b8ea = int(self.maxhealth * var_6e4c63cc * n_damage_multiplier);
    return var_16e6b8ea;
}

