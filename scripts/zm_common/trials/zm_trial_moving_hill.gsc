#using script_2595527427ea71eb;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace zm_trial_moving_hill;

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x2
// Checksum 0xd92ea9f7, Offset: 0x130
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_moving_hill", &__init__, undefined, undefined);
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x0
// Checksum 0xfe6264e9, Offset: 0x178
// Size: 0x5c
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    zm_trial::register_challenge(#"moving_hill", &on_begin, &on_end);
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 5, eflags: 0x4
// Checksum 0x960c771b, Offset: 0x1e0
// Size: 0x124
function private on_begin(var_ed49e96e, var_ea5e88ac, str_return, var_c728f1dd, var_aed178c2) {
    callback::add_callback(#"on_host_migration_end", &function_ff66b979);
    level flag::set(#"infinite_round_spawning");
    level flag::set(#"pause_round_timeout");
    level.var_2bb6b2ba = [];
    level.var_9fc7133d = zm_trial::function_5769f26a(var_c728f1dd);
    self.n_defend_time = zm_trial::function_5769f26a(var_aed178c2);
    self.var_a7d4f51b = var_ea5e88ac;
    self.str_return = str_return;
    self.var_247c8132 = struct::get(var_ed49e96e);
    self thread function_452ec7b3();
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 1, eflags: 0x4
// Checksum 0x13734a31, Offset: 0x310
// Size: 0x12a
function private on_end(round_reset) {
    callback::remove_callback(#"on_host_migration_end", &function_ff66b979);
    arrayremovevalue(level.var_2bb6b2ba, undefined);
    array::delete_all(level.var_2bb6b2ba);
    level.var_2bb6b2ba = undefined;
    zm_utility::function_75fd65f9(self.var_f7f308cd, 0);
    foreach (player in getplayers()) {
        player zm_utility::function_ba39d198(self.var_df62490a, 0);
        player.var_356935bb = undefined;
    }
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x4
// Checksum 0x381326a7, Offset: 0x448
// Size: 0xca8
function private function_452ec7b3() {
    level endon(#"end_of_round");
    wait(12);
    var_2fe28f97 = 1;
    while (isdefined(self.var_247c8132)) {
        level.var_c8b84806 = [];
        s_hill = self.var_247c8132;
        a_str_zones = strtok(s_hill.script_string, ",");
        foreach (str_zone in a_str_zones) {
            level.var_c8b84806[str_zone] = 1;
        }
        self.var_df62490a = zm_utility::function_d7db256e(s_hill.targetname, #"hash_28d5f57c2309090", 0);
        self.var_f7f308cd = s_hill.targetname;
        self thread function_492f4c79();
        foreach (player in getplayers()) {
            player thread zone_watcher(self, self.var_a7d4f51b, self.str_return, level.var_9fc7133d);
            player thread damage_watcher();
        }
        arrayremovevalue(level.var_2bb6b2ba, undefined);
        arrayremovevalue(level.active_powerups, undefined);
        var_5579e5fa = function_c30f9a6e(s_hill.origin);
        switch (getplayers().size) {
        case 1:
        case 2:
            switch (var_2fe28f97) {
            case 1:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", isdefined(var_5579e5fa[1]) ? var_5579e5fa[1] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 2:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 3:
                break;
            case 4:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 5:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", isdefined(var_5579e5fa[1]) ? var_5579e5fa[1] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 6:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 7:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 8:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 9:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            }
            break;
        case 3:
        case 4:
            switch (var_2fe28f97) {
            case 1:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 5:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("insta_kill", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 6:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 7:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("full_ammo", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            case 9:
                level.var_2bb6b2ba[level.var_2bb6b2ba.size] = zm_powerups::specific_powerup_drop("hero_weapon_power", isdefined(var_5579e5fa[0]) ? var_5579e5fa[0] : s_hill.origin, undefined, undefined, undefined, 1, 1);
                break;
            }
            break;
        }
        do {
            var_5630b1e = 1;
            foreach (player in getplayers()) {
                if (isalive(player) && !(isdefined(player.var_4cb0b91f) && player.var_4cb0b91f)) {
                    var_5630b1e = 0;
                }
            }
            waitframe(1);
        } while (!var_5630b1e);
        wait(self.n_defend_time);
        if (isdefined(s_hill.script_noteworthy)) {
            self.var_247c8132 = struct::get(s_hill.script_noteworthy);
        } else {
            self.var_247c8132 = undefined;
        }
        level notify(#"hill_moving");
        var_2fe28f97++;
        zm_utility::function_75fd65f9(self.var_f7f308cd, 0);
        foreach (player in getplayers()) {
            player zm_utility::function_ba39d198(self.var_df62490a, 0);
        }
        wait(1);
    }
    level flag::clear(#"spawn_zombies");
    level zm_utility::function_9ad5aeb1(0, 1, 1);
    wait(3);
    level flag::clear(#"infinite_round_spawning");
    level flag::clear(#"pause_round_timeout");
    level.zombie_total = 0;
    level thread zm_utility::function_9ad5aeb1(0, 1);
    level notify(#"kill_round");
    level notify(#"kill_round_wait");
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x4
// Checksum 0xd9731b25, Offset: 0x10f8
// Size: 0x44
function private function_492f4c79() {
    level endon(#"hash_7646638df88a3656", #"hill_moving");
    zm_utility::function_75fd65f9(self.var_f7f308cd, 1);
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 2, eflags: 0x4
// Checksum 0x170d2982, Offset: 0x1148
// Size: 0xcc
function private start_timer(n_timeout, str_return) {
    if (!level.var_f995ece6 zm_trial_timer::is_open(self)) {
        level.var_f995ece6 zm_trial_timer::open(self);
        level.var_f995ece6 zm_trial_timer::set_timer_text(self, str_return);
        level.var_f995ece6 zm_trial_timer::set_under_round_rules(self, 1);
        self zm_trial_util::start_timer(n_timeout);
        self playsoundtoplayer(#"hash_18aab7ffde259877", self);
    }
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x4
// Checksum 0x9d50a31e, Offset: 0x1220
// Size: 0x5c
function private stop_timer() {
    if (level.var_f995ece6 zm_trial_timer::is_open(self)) {
        level.var_f995ece6 zm_trial_timer::close(self);
        self zm_trial_util::stop_timer();
    }
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x4
// Checksum 0xa64dcc69, Offset: 0x1288
// Size: 0x7c
function private function_2191cc5d() {
    zone = self zm_zonemgr::get_player_zone();
    assert(isdefined(level.var_c8b84806));
    return isdefined(zone) && isdefined(level.var_c8b84806[zone]) && level.var_c8b84806[zone];
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 4, eflags: 0x4
// Checksum 0xe48cf965, Offset: 0x1310
// Size: 0x2fe
function private zone_watcher(challenge, var_2d5ebf67, var_530e040f, timeout) {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"hill_moving", #"host_migration_begin");
    self.var_356935bb = {#start_time:level.time, #timeout:timeout, #challenge:challenge, #var_2d5ebf67:var_2d5ebf67, #var_530e040f:var_530e040f};
    self.var_4cb0b91f = 0;
    self zm_utility::function_ba39d198(challenge.var_df62490a, 1);
    self thread start_timer(timeout, var_2d5ebf67);
    var_60fa6139 = level.time + timeout * 1000;
    while (true) {
        zone_valid = self function_2191cc5d();
        if (zone_valid) {
            self.var_4cb0b91f = 1;
            self stop_timer();
            self zm_utility::function_ba39d198(challenge.var_df62490a, 0);
            var_60fa6139 = level.time + 0;
        } else if (level.time > var_60fa6139) {
            self stop_timer();
        } else if (!level.var_f995ece6 zm_trial_timer::is_open(self)) {
            self thread start_timer(0, var_530e040f);
            self zm_utility::function_ba39d198(challenge.var_df62490a, 1);
        }
        if (isdefined(self.var_4cb0b91f) && self.var_4cb0b91f && !zone_valid && isalive(self) && !self laststand::player_is_in_laststand() && !(isdefined(level.intermission) && level.intermission)) {
            self clientfield::set_to_player("zm_zone_out_of_bounds", 1);
        } else {
            self clientfield::set_to_player("zm_zone_out_of_bounds", 0);
        }
        waitframe(1);
    }
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x4
// Checksum 0x34b389d9, Offset: 0x1618
// Size: 0x216
function private damage_watcher() {
    self endon(#"disconnect");
    level endon(#"hash_7646638df88a3656", #"hill_moving", #"host_migration_begin");
    while (true) {
        /#
            if (isgodmode(self) || self isinmovemode("<dev string:x38>", "<dev string:x41>")) {
                waitframe(1);
                continue;
            }
        #/
        if (!self function_2191cc5d() && !level.var_f995ece6 zm_trial_timer::is_open(self) && self.sessionstate != "spectator" && !self laststand::player_is_in_laststand() && !(isdefined(self.var_eb319d10) && self.var_eb319d10) && !(isdefined(level.intermission) && level.intermission)) {
            var_16e6b8ea = self zm_utility::function_7618c8ef(0.0667);
            if (self.health <= var_16e6b8ea) {
                if (zm_utility::is_magic_bullet_shield_enabled(self)) {
                    self util::stop_magic_bullet_shield();
                }
                self dodamage(self.health + 1000, self.origin);
            } else {
                self dodamage(var_16e6b8ea, self.origin);
            }
        }
        wait(1);
    }
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 2, eflags: 0x0
// Checksum 0xc28ab9cb, Offset: 0x1838
// Size: 0x21a
function function_c30f9a6e(v_start_pos, n_radius = 500) {
    var_5579e5fa = [];
    v_origin = getclosestpointonnavmesh(v_start_pos, n_radius);
    if (isdefined(v_origin)) {
        s_result = positionquery_source_navigation(v_origin, 32, n_radius, 4, 16, 1, 32);
        if (isdefined(s_result) && isarray(s_result.data)) {
            foreach (var_c310df8c in s_result.data) {
                if (zm_utility::function_25e3484e(var_c310df8c.origin, 24, var_5579e5fa)) {
                    var_7a4cb7eb = var_c310df8c.origin;
                    n_height_diff = abs(var_7a4cb7eb[2] - var_c310df8c.origin[2]);
                    if (n_height_diff > 60) {
                        continue;
                    }
                    if (!isdefined(var_5579e5fa)) {
                        var_5579e5fa = [];
                    } else if (!isarray(var_5579e5fa)) {
                        var_5579e5fa = array(var_5579e5fa);
                    }
                    var_5579e5fa[var_5579e5fa.size] = var_7a4cb7eb;
                }
            }
            var_5579e5fa = arraysortclosest(var_5579e5fa, v_start_pos);
        }
    }
    return var_5579e5fa;
}

// Namespace zm_trial_moving_hill/zm_trial_moving_hill
// Params 0, eflags: 0x4
// Checksum 0xa87fc40b, Offset: 0x1a60
// Size: 0x240
function private function_ff66b979() {
    level endon(#"end_of_round");
    foreach (player in getplayers()) {
        if (!isdefined(player.var_356935bb)) {
            continue;
        }
        player stop_timer();
    }
    var_a0328dd5 = gettime();
    wait(5);
    foreach (player in getplayers()) {
        if (!isdefined(player.var_356935bb)) {
            player thread damage_watcher();
            continue;
        }
        timer_delta = var_a0328dd5 - player.var_356935bb.start_time;
        timeout = int(max(player.var_356935bb.timeout - float(timer_delta) / 1000, 0));
        player thread zone_watcher(player.var_356935bb.challenge, player.var_356935bb.var_2d5ebf67, player.var_356935bb.var_530e040f, timeout);
        player thread damage_watcher();
    }
}

