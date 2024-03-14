// Atian COD Tools GSC decompiler test
#using scripts\zm\zm_escape_vo_hooks.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_traps.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\exploder_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_escape_traps;

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x2
// Checksum 0x9e235049, Offset: 0x4e0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_escape_traps", &__init__, &__main__, undefined);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xd190adb5, Offset: 0x530
// Size: 0x1cc
function __init__() {
    clientfield::register("actor", "fan_trap_blood_fx", 1, 1, "int");
    clientfield::register("toplayer", "rumble_fan_trap", 1, 1, "int");
    clientfield::register("actor", "acid_trap_death_fx", 1, 1, "int");
    clientfield::register("scriptmover", "acid_trap_fx", 1, 1, "int");
    clientfield::register("actor", "spinning_trap_blood_fx", 1, 1, "int");
    clientfield::register("actor", "spinning_trap_eye_fx", 1, 1, "int");
    clientfield::register("toplayer", "rumble_spinning_trap", 1, 1, "int");
    clientfield::register("toplayer", "player_acid_trap_post_fx", 1, 1, "int");
    level thread function_6dbbc97();
    level thread init_fan_trap_trigs();
    level thread init_acid_trap_trigs();
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x5aaad9df, Offset: 0x708
// Size: 0x1f8
function __main__() {
    level thread function_8aeee6b8();
    var_e4f517f0 = getentarray("zm_spinning_trap", "script_noteworthy");
    foreach (var_fe861167 in var_e4f517f0) {
        var_fe861167 thread function_dcd775a();
    }
    var_59fe5c9e = getentarray("zm_fan_trap", "script_noteworthy");
    foreach (var_7c68fa38 in var_59fe5c9e) {
        var_7c68fa38 thread function_ea490292();
    }
    var_5c2bef3d = getentarray("zm_acid_trap", "script_noteworthy");
    foreach (var_4d42c97f in var_5c2bef3d) {
        var_4d42c97f thread function_39f2d90f();
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xc6cfa320, Offset: 0x908
// Size: 0x424
function init_fan_trap_trigs() {
    var_59fe5c9e = getentarray("zm_fan_trap", "script_noteworthy");
    foreach (var_7c68fa38 in var_59fe5c9e) {
        var_7c68fa38._trap_cooldown_time = 25;
        var_7c68fa38.var_cd6ebde4 = [];
        a_e_trap = getentarray(var_7c68fa38.target, "targetname");
        for (i = 0; i < a_e_trap.size; i++) {
            if (isdefined(a_e_trap[i].script_string)) {
                if (a_e_trap[i].script_string == "fan_trap_rumble") {
                    var_7c68fa38.t_rumble = a_e_trap[i];
                    continue;
                }
                if (a_e_trap[i].script_string == "fxanim_fan") {
                    var_7c68fa38.mdl_fan = a_e_trap[i];
                    continue;
                }
                if (a_e_trap[i].script_string == "trap_control_panel") {
                    if (!isdefined(var_7c68fa38.var_cd6ebde4)) {
                        var_7c68fa38.var_cd6ebde4 = [];
                    } else if (!isarray(var_7c68fa38.var_cd6ebde4)) {
                        var_7c68fa38.var_cd6ebde4 = array(var_7c68fa38.var_cd6ebde4);
                    }
                    if (!isinarray(var_7c68fa38.var_cd6ebde4, a_e_trap[i])) {
                        var_7c68fa38.var_cd6ebde4[var_7c68fa38.var_cd6ebde4.size] = a_e_trap[i];
                    }
                }
            }
        }
        a_s_trap = struct::get_array(var_7c68fa38.target);
        for (i = 0; i < a_s_trap.size; i++) {
            if (isdefined(a_s_trap[i].script_noteworthy)) {
                if (a_s_trap[i].script_noteworthy == "brutus_trap_finder") {
                    if (!isdefined(var_7c68fa38.var_31004a80)) {
                        var_7c68fa38.var_31004a80 = [];
                    } else if (!isarray(var_7c68fa38.var_31004a80)) {
                        var_7c68fa38.var_31004a80 = array(var_7c68fa38.var_31004a80);
                    }
                    if (!isinarray(var_7c68fa38.var_31004a80, a_s_trap[i])) {
                        var_7c68fa38.var_31004a80[var_7c68fa38.var_31004a80.size] = a_s_trap[i];
                    }
                }
            }
        }
    }
    zm_traps::register_trap_basic_info("zm_fan_trap", &activate_zm_fan_trap, &function_76e0728d);
    zm_traps::register_trap_damage("zm_fan_trap", &function_5758997a, &function_9c2d463d);
    zm_traps::function_60d9e800("zm_fan_trap", &zapper_light_red, &zapper_light_green);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x1ca8b893, Offset: 0xd38
// Size: 0x108
function function_ea490292() {
    level flag::wait_till("start_zombie_round_logic");
    self zapper_light_red();
    if (isdefined(self.script_int)) {
        level flag::wait_till("power_on" + self.script_int);
    } else {
        level flag::wait_till("power_on");
    }
    while (true) {
        s_result = undefined;
        s_result = level waittill(#"trap_activated");
        if (s_result.trap == self) {
            s_result.trap_activator zm_stats::increment_client_stat("prison_fan_trap_used", 0);
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x7994919c, Offset: 0xe48
// Size: 0x1da
function activate_zm_fan_trap() {
    level.trapped_track[#"fan"] = 1;
    self.in_use = 1;
    self thread zm_traps::trap_damage();
    self.mdl_fan thread scene::init(#"p8_fxanim_zm_esc_trap_fan_play", self.mdl_fan);
    self thread fan_trap_timeout();
    self thread fan_trap_rumble_think();
    self waittill(#"trap_finished");
    self.in_use = undefined;
    self.mdl_fan thread scene::play(#"p8_fxanim_zm_esc_trap_fan_play", self.mdl_fan);
    a_players = getplayers();
    foreach (e_player in a_players) {
        if (isdefined(e_player.fan_trap_rumble) && e_player.fan_trap_rumble) {
            e_player clientfield::set_to_player("rumble_fan_trap", 0);
            e_player.fan_trap_rumble = undefined;
        }
    }
    self notify(#"trap_done");
    self waittill(#"available");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xd5445e23, Offset: 0x1030
// Size: 0x5c
function function_76e0728d() {
    self playsound(#"zmb_trap_activate");
    self waittill(#"available");
    self playsound(#"zmb_trap_available");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xd7206e39, Offset: 0x1098
// Size: 0xfc
function function_5758997a(t_damage) {
    self endon(#"death");
    if (zm_utility::is_standard()) {
        self dodamage(25, self.origin, undefined, t_damage);
        return;
    }
    if (!self hasperk(#"specialty_armorvest") || self.health - 100 < 1) {
        radiusdamage(self.origin, 10, self.health + 100, self.health + 100, t_damage);
        return;
    }
    self dodamage(50, self.origin, undefined, t_damage);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x3faaaff8, Offset: 0x11a0
// Size: 0x424
function function_9c2d463d(t_damage) {
    if (isdefined(level.custom_fan_trap_damage_func)) {
        self thread [[ level.custom_fan_trap_damage_func ]](t_damage);
        return;
    }
    if (self.var_6f84b820 == #"miniboss" || self.var_6f84b820 == #"boss") {
        t_damage notify(#"trap_finished");
        return;
    }
    if (isdefined(self.var_238b3806) && self.var_238b3806) {
        return;
    }
    if (level.round_number < 40) {
        self.marked_for_death = 1;
        self clientfield::set("fan_trap_blood_fx", 1);
        level notify(#"hash_528d7b7f7d6c51a1", {#e_player:t_damage.activated_by_player});
        self zombie_utility::gib_random_parts();
        playsoundatposition("zmb_trap_fan_grind", self.origin);
        self thread stop_fan_trap_blood_fx();
        self dodamage(self.health + 1000, t_damage.origin, undefined, t_damage);
        if (isdefined(t_damage.activated_by_player) && isplayer(t_damage.activated_by_player)) {
            t_damage.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
            t_damage.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
        }
        return;
    }
    if (isdefined(self.var_1adc13ad) && self.var_1adc13ad) {
        return;
    }
    self.var_1adc13ad = 1;
    self clientfield::set("fan_trap_blood_fx", 1);
    while (isalive(self) && self istouching(t_damage) && isdefined(t_damage.in_use) && t_damage.in_use) {
        self function_1395e596();
        self dodamage(self.maxhealth * 0.3, t_damage.origin, undefined, t_damage);
        playsoundatposition("zmb_trap_fan_grind", self.origin);
        wait(0.1);
    }
    if (isalive(self)) {
        self clientfield::set("fan_trap_blood_fx", 0);
        self.var_1adc13ad = undefined;
        return;
    }
    level notify(#"hash_528d7b7f7d6c51a1", {#e_player:t_damage.activated_by_player});
    if (isdefined(t_damage.activated_by_player) && isplayer(t_damage.activated_by_player)) {
        t_damage.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        t_damage.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x5 linked
// Checksum 0xf39b18c, Offset: 0x15d0
// Size: 0x12e
function private function_1395e596() {
    if (isdefined(self.no_gib) && self.no_gib) {
        return;
    }
    playsoundatposition(#"zmb_death_gibs", self.origin);
    if (math::cointoss()) {
        if (!gibserverutils::isgibbed(self, 32)) {
            gibserverutils::gibrightarm(self);
            return;
        }
    }
    if (math::cointoss()) {
        if (!gibserverutils::isgibbed(self, 16)) {
            gibserverutils::gibleftarm(self);
            return;
        }
    }
    if (math::cointoss()) {
        gibserverutils::gibrightleg(self);
        return;
    }
    if (math::cointoss()) {
        gibserverutils::gibleftleg(self);
        return;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x665e175f, Offset: 0x1708
// Size: 0x66
function fan_trap_timeout() {
    self endon(#"trap_finished");
    for (n_duration = 0; n_duration < 25; n_duration = n_duration + 0.05) {
        wait(0.05);
    }
    self notify(#"trap_finished");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xa5587e71, Offset: 0x1778
// Size: 0xb8
function fan_trap_rumble_think() {
    self endon(#"trap_finished");
    while (true) {
        s_result = undefined;
        s_result = self.t_rumble waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            if (!(isdefined(s_result.activator.fan_trap_rumble) && s_result.activator.fan_trap_rumble)) {
                self thread fan_trap_rumble(s_result.activator);
            }
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xb9c57abf, Offset: 0x1838
// Size: 0xda
function fan_trap_rumble(e_player) {
    e_player endon(#"death", #"disconnect");
    self endon(#"trap_finished");
    while (true) {
        if (e_player istouching(self.t_rumble)) {
            e_player clientfield::set_to_player("rumble_fan_trap", 1);
            e_player.fan_trap_rumble = 1;
            wait(0.25);
            continue;
        }
        e_player clientfield::set_to_player("rumble_fan_trap", 0);
        e_player.fan_trap_rumble = 0;
        break;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x0
// Checksum 0xbcc6947a, Offset: 0x1920
// Size: 0x158
function fan_trap_damage() {
    if (isdefined(level.custom_fan_trap_damage_func)) {
        self thread [[ level.custom_fan_trap_damage_func ]]();
        return;
    }
    self endon(#"fan_trap_finished");
    while (true) {
        s_result = undefined;
        s_result = self waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            s_result.activator thread player_fan_trap_damage();
            continue;
        }
        if (isdefined(s_result.activator.is_brutus) && s_result.activator.is_brutus) {
            self notify(#"trap_finished");
            return;
        }
        if (isdefined(self.var_238b3806) && self.var_238b3806) {
            return;
        }
        if (!isdefined(s_result.activator.marked_for_death)) {
            s_result.activator.marked_for_death = 1;
            s_result.activator thread zombie_fan_trap_death();
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x4a849144, Offset: 0x1a80
// Size: 0xec
function player_fan_trap_damage() {
    self endon(#"death");
    if (zm_utility::is_standard()) {
        self dodamage(25, self.origin);
        return;
    }
    if (!self hasperk(#"specialty_armorvest") || self.health - 100 < 1) {
        radiusdamage(self.origin, 10, self.health + 100, self.health + 100);
        return;
    }
    self dodamage(50, self.origin);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x669e1a22, Offset: 0x1b78
// Size: 0xac
function zombie_fan_trap_death() {
    self endon(#"death");
    self clientfield::set("fan_trap_blood_fx", 1);
    if (!(isdefined(self.is_brutus) && self.is_brutus)) {
        self zombie_utility::gib_random_parts();
    }
    self thread stop_fan_trap_blood_fx();
    self dodamage(self.health + 1000, self.origin);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xa4c83e5, Offset: 0x1c30
// Size: 0x34
function stop_fan_trap_blood_fx() {
    wait(2);
    if (isdefined(self)) {
        self clientfield::set("fan_trap_blood_fx", 0);
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xbd4cd294, Offset: 0x1c70
// Size: 0x54
function function_8aeee6b8() {
    level flag::wait_till_any(array("activate_cafeteria", "activate_infirmary"));
    level flag::set("acid_trap_available");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xd12fb3e9, Offset: 0x1cd0
// Size: 0x4c4
function init_acid_trap_trigs() {
    var_5c2bef3d = getentarray("zm_acid_trap", "script_noteworthy");
    foreach (var_4d42c97f in var_5c2bef3d) {
        var_4d42c97f._trap_cooldown_time = 25;
        var_4d42c97f.var_28ea1870 = [];
        var_4d42c97f.var_cd6ebde4 = [];
        var_4d42c97f.var_31004a80 = [];
        a_e_trap = getentarray(var_4d42c97f.target, "targetname");
        for (i = 0; i < a_e_trap.size; i++) {
            if (isdefined(a_e_trap[i].script_string)) {
                if (a_e_trap[i].script_string == "trap_control_panel") {
                    if (!isdefined(var_4d42c97f.var_cd6ebde4)) {
                        var_4d42c97f.var_cd6ebde4 = [];
                    } else if (!isarray(var_4d42c97f.var_cd6ebde4)) {
                        var_4d42c97f.var_cd6ebde4 = array(var_4d42c97f.var_cd6ebde4);
                    }
                    if (!isinarray(var_4d42c97f.var_cd6ebde4, a_e_trap[i])) {
                        var_4d42c97f.var_cd6ebde4[var_4d42c97f.var_cd6ebde4.size] = a_e_trap[i];
                    }
                }
            }
        }
        a_s_trap = struct::get_array(var_4d42c97f.target, "targetname");
        for (i = 0; i < a_s_trap.size; i++) {
            if (isdefined(a_s_trap[i].script_string)) {
                if (a_s_trap[i].script_string == "acid_trap_fx") {
                    if (!isdefined(var_4d42c97f.var_28ea1870)) {
                        var_4d42c97f.var_28ea1870 = [];
                    } else if (!isarray(var_4d42c97f.var_28ea1870)) {
                        var_4d42c97f.var_28ea1870 = array(var_4d42c97f.var_28ea1870);
                    }
                    if (!isinarray(var_4d42c97f.var_28ea1870, a_s_trap[i])) {
                        var_4d42c97f.var_28ea1870[var_4d42c97f.var_28ea1870.size] = a_s_trap[i];
                    }
                }
            }
            if (isdefined(a_s_trap[i].script_noteworthy)) {
                if (a_s_trap[i].script_noteworthy == "brutus_trap_finder") {
                    if (!isdefined(var_4d42c97f.var_31004a80)) {
                        var_4d42c97f.var_31004a80 = [];
                    } else if (!isarray(var_4d42c97f.var_31004a80)) {
                        var_4d42c97f.var_31004a80 = array(var_4d42c97f.var_31004a80);
                    }
                    if (!isinarray(var_4d42c97f.var_31004a80, a_s_trap[i])) {
                        var_4d42c97f.var_31004a80[var_4d42c97f.var_31004a80.size] = a_s_trap[i];
                    }
                }
            }
        }
    }
    zm_traps::register_trap_basic_info("zm_acid_trap", &activate_zm_acid_trap, &function_6219e5ab);
    zm_traps::register_trap_damage("zm_acid_trap", &function_efd61793, &function_9699194a);
    zm_traps::function_60d9e800("zm_acid_trap", &zapper_light_red, &zapper_light_green);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xb2a57974, Offset: 0x21a0
// Size: 0xd0
function function_39f2d90f() {
    level flag::wait_till("start_zombie_round_logic");
    self zapper_light_red();
    level flag::wait_till("acid_trap_available");
    while (true) {
        s_result = undefined;
        s_result = level waittill(#"trap_activated");
        if (s_result.trap == self) {
            s_result.trap_activator zm_stats::increment_client_stat("prison_acid_trap_used", 0);
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x193586e3, Offset: 0x2278
// Size: 0xda
function activate_zm_acid_trap() {
    level.trapped_track[#"acid"] = 1;
    for (i = 0; i < self.var_28ea1870.size; i++) {
        self.var_28ea1870[i] thread acid_trap_fx(self);
        waitframe(1);
    }
    self.in_use = 1;
    self thread zm_traps::trap_damage();
    self waittilltimeout(25, #"trap_finished");
    self.in_use = undefined;
    self notify(#"trap_done");
    self waittill(#"available");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xa26f2280, Offset: 0x2360
// Size: 0x74
function function_6219e5ab(trap) {
    playsoundatposition(#"hash_4b93c2d674807e60", self.origin);
    self waittill(#"available");
    playsoundatposition(#"zmb_acid_trap_available", self.origin);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x8dc9fdd8, Offset: 0x23e0
// Size: 0x1ce
function function_efd61793(t_damage) {
    self endon(#"death", #"disconnect");
    if (!(isdefined(self.is_in_acid) && self.is_in_acid) && !self laststand::player_is_in_laststand()) {
        self.is_in_acid = 1;
        self thread function_1a5df584(t_damage);
        while (self istouching(t_damage) && isdefined(t_damage.in_use) && t_damage.in_use && !self laststand::player_is_in_laststand()) {
            if (self.health <= 20) {
                self dodamage(self.health + 100, self.origin, undefined, t_damage);
            } else {
                if (zm_utility::is_standard()) {
                    self dodamage(self.maxhealth / 5.5, self.origin, undefined, t_damage);
                } else {
                    self dodamage(self.maxhealth / 2.75, self.origin, undefined, t_damage);
                }
                self zm_audio::playerexert("cough");
            }
            wait(1);
        }
        self.is_in_acid = undefined;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x9f746edb, Offset: 0x25b8
// Size: 0x464
function function_9699194a(t_damage) {
    if (isdefined(level.custom_acid_trap_damage_func)) {
        t_damage thread [[ level.custom_acid_trap_damage_func ]]();
        return;
    }
    if (self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"boss") {
        return;
    }
    if (isdefined(self.var_238b3806) && self.var_238b3806) {
        return;
    }
    if (isdefined(self.var_1adc13ad) && self.var_1adc13ad) {
        return;
    }
    self.var_1adc13ad = 1;
    if (level.round_number < 40) {
        self.marked_for_death = 1;
        self clientfield::set("acid_trap_death_fx", 1);
        level notify(#"hash_317f58ba0d580c27", {#e_player:t_damage.activated_by_player});
        wait(randomfloatrange(0.25, 2));
        if (isalive(self)) {
            self zombie_utility::gib_random_parts();
            self thread stop_acid_death_fx();
            self.var_12745932 = 1;
            self dodamage(self.health + 1000, t_damage.origin, t_damage.activated_by_player, t_damage);
            if (isdefined(t_damage.activated_by_player) && isplayer(t_damage.activated_by_player)) {
                t_damage.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
                t_damage.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
            }
        }
        return;
    }
    self clientfield::set("acid_trap_death_fx", 1);
    while (isalive(self) && self istouching(t_damage) && isdefined(t_damage.in_use) && t_damage.in_use) {
        self function_1395e596();
        self.var_143964f0 = self.var_12745932;
        self.var_12745932 = 1;
        self dodamage(self.maxhealth * 0.2, t_damage.origin, t_damage.activated_by_player, t_damage);
        wait(0.3);
    }
    if (isalive(self)) {
        self clientfield::set("acid_trap_death_fx", 0);
        self.var_1adc13ad = undefined;
        self.var_12745932 = self.var_143964f0;
        self.var_143964f0 = undefined;
        return;
    }
    level notify(#"hash_317f58ba0d580c27", {#e_player:t_damage.activated_by_player});
    if (isdefined(t_damage.activated_by_player) && isplayer(t_damage.activated_by_player)) {
        t_damage.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
        t_damage.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xefbbb124, Offset: 0x2a28
// Size: 0xac
function acid_trap_fx(e_trap) {
    mdl_fx = util::spawn_model("tag_origin", self.origin, self.angles);
    mdl_fx clientfield::set("acid_trap_fx", 1);
    e_trap waittilltimeout(25, #"trap_finished");
    mdl_fx clientfield::set("acid_trap_fx", 0);
    waitframe(1);
    mdl_fx delete();
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xe5a00ed0, Offset: 0x2ae0
// Size: 0x34
function stop_acid_death_fx() {
    wait(2);
    if (isdefined(self)) {
        self clientfield::set("acid_trap_death_fx", 0);
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0xa6af4529, Offset: 0x2b20
// Size: 0xdc
function function_1a5df584(t_damage) {
    self endon(#"bled_out", #"disconnect");
    if (self clientfield::get_to_player("player_acid_trap_post_fx") === 1) {
        return;
    }
    self clientfield::set_to_player("player_acid_trap_post_fx", 1);
    while (self istouching(t_damage) && isdefined(t_damage.in_use) && t_damage.in_use) {
        waitframe(1);
    }
    self clientfield::set_to_player("player_acid_trap_post_fx", 0);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x9c8d51fb, Offset: 0x2c08
// Size: 0x464
function function_6dbbc97() {
    var_e4f517f0 = getentarray("zm_spinning_trap", "script_noteworthy");
    foreach (var_fe861167 in var_e4f517f0) {
        var_fe861167._trap_cooldown_time = 25;
        a_e_targets = getentarray(var_fe861167.target, "targetname");
        var_fe861167.var_cd6ebde4 = [];
        var_fe861167.var_31004a80 = [];
        for (i = 0; i < a_e_targets.size; i++) {
            if (isdefined(a_e_targets[i].script_string)) {
                if (a_e_targets[i].script_string == "spinning_trap_rumble") {
                    var_fe861167.t_rumble = a_e_targets[i];
                    continue;
                }
                if (a_e_targets[i].script_string == "fxanim_spinning_trap") {
                    var_fe861167.mdl_trap = a_e_targets[i];
                    continue;
                }
                if (a_e_targets[i].script_string == "trap_control_panel") {
                    if (!isdefined(var_fe861167.var_cd6ebde4)) {
                        var_fe861167.var_cd6ebde4 = [];
                    } else if (!isarray(var_fe861167.var_cd6ebde4)) {
                        var_fe861167.var_cd6ebde4 = array(var_fe861167.var_cd6ebde4);
                    }
                    if (!isinarray(var_fe861167.var_cd6ebde4, a_e_targets[i])) {
                        var_fe861167.var_cd6ebde4[var_fe861167.var_cd6ebde4.size] = a_e_targets[i];
                    }
                }
            }
        }
        a_s_trap = struct::get_array(var_fe861167.target);
        for (i = 0; i < a_s_trap.size; i++) {
            if (isdefined(a_s_trap[i].script_noteworthy)) {
                if (a_s_trap[i].script_noteworthy == "brutus_trap_finder") {
                    if (!isdefined(var_fe861167.var_31004a80)) {
                        var_fe861167.var_31004a80 = [];
                    } else if (!isarray(var_fe861167.var_31004a80)) {
                        var_fe861167.var_31004a80 = array(var_fe861167.var_31004a80);
                    }
                    if (!isinarray(var_fe861167.var_31004a80, a_s_trap[i])) {
                        var_fe861167.var_31004a80[var_fe861167.var_31004a80.size] = a_s_trap[i];
                    }
                }
            }
        }
        var_fe861167.mdl_trap thread scene::play(#"p8_fxanim_zm_esc_trap_spinning_bundle", var_fe861167.mdl_trap);
    }
    zm_traps::register_trap_basic_info("zm_spinning_trap", &activate_zm_spinning_trap, &function_ffe09b75);
    zm_traps::register_trap_damage("zm_spinning_trap", &function_7e74aa5, &function_1f7e661f);
    zm_traps::function_60d9e800("zm_spinning_trap", &zapper_light_red, &zapper_light_green);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xe5646260, Offset: 0x3078
// Size: 0x108
function function_dcd775a() {
    level flag::wait_till("start_zombie_round_logic");
    self zapper_light_red();
    if (isdefined(self.script_int)) {
        level flag::wait_till("power_on" + self.script_int);
    } else {
        level flag::wait_till("power_on");
    }
    while (true) {
        s_result = undefined;
        s_result = level waittill(#"trap_activated");
        if (s_result.trap == self) {
            s_result.trap_activator zm_stats::increment_client_stat("prison_spinning_trap_used", 0);
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x31df396a, Offset: 0x3188
// Size: 0x222
function activate_zm_spinning_trap() {
    level.trapped_track[#"fan"] = 1;
    self.in_use = 1;
    self.mdl_trap thread scene::init(#"p8_fxanim_zm_esc_trap_spinning_bundle", self.mdl_trap);
    var_a5fa009d = struct::get("spinning_trap_poi", "targetname");
    self thread function_61791b8b(var_a5fa009d);
    self thread function_4a15e725();
    self thread function_c3ac9950();
    wait(1.2);
    self thread zm_traps::trap_damage();
    self waittill(#"trap_finished");
    self.in_use = undefined;
    self.mdl_trap thread scene::play(#"p8_fxanim_zm_esc_trap_spinning_bundle", self.mdl_trap);
    a_players = getplayers();
    foreach (e_player in a_players) {
        if (isdefined(e_player.b_spinning_trap_rumble) && e_player.b_spinning_trap_rumble) {
            e_player clientfield::set_to_player("rumble_spinning_trap", 0);
            e_player.b_spinning_trap_rumble = undefined;
        }
    }
    self notify(#"trap_done");
    self waittill(#"available");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xba0cd16f, Offset: 0x33b8
// Size: 0x24
function function_ffe09b75() {
    self playsound(#"zmb_trap_activate");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x75ff7fda, Offset: 0x33e8
// Size: 0x10c
function function_7e74aa5(t_damage) {
    self endon(#"death", #"disconnect");
    if (zm_utility::is_standard()) {
        self dodamage(5, self.origin, undefined, t_damage);
        return;
    }
    if (!self hasperk(#"specialty_armorvest") || self.health - 100 < 1) {
        radiusdamage(self.origin, 10, self.health + 100, self.health + 100, t_damage);
        return;
    }
    self dodamage(50, self.origin, undefined, t_damage);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x3c333d34, Offset: 0x3500
// Size: 0x886
function function_1f7e661f(t_damage) {
    if (isdefined(level.var_d36e5ece)) {
        self thread [[ level.var_d36e5ece ]](t_damage);
        return;
    }
    if (self.var_6f84b820 === #"miniboss" || self.var_6f84b820 === #"boss") {
        t_damage notify(#"trap_finished");
        return;
    }
    if (isdefined(self.var_238b3806) && self.var_238b3806 || isdefined(self.var_bd4627e1) && self.var_bd4627e1) {
        return;
    }
    if (isdefined(self.var_1adc13ad) && self.var_1adc13ad) {
        return;
    }
    self.var_1adc13ad = 1;
    if (isai(self) && !isvehicle(self)) {
        self clientfield::set("spinning_trap_blood_fx", 1);
    }
    self playsound(#"hash_42c6cc2204b7fbbd");
    v_hook = t_damage.mdl_trap gettagorigin("tag_weapon_3");
    n_dist = distance2d(self.origin, v_hook);
    if (!(isdefined(t_damage.var_705682df) && t_damage.var_705682df) && self.var_6f84b820 === #"basic" && n_dist <= 128 && self.team != #"allies") {
        t_damage.var_705682df = 1;
        self.var_bd4627e1 = 1;
        self clientfield::set("spinning_trap_eye_fx", 1);
        var_e72c9959 = util::spawn_model("tag_origin", t_damage.mdl_trap gettagorigin("tag_weapon_3"), t_damage.mdl_trap gettagangles("tag_weapon_3"));
        var_e72c9959 linkto(t_damage.mdl_trap, "tag_weapon_3");
        self thread function_864365ef(t_damage, var_e72c9959);
        a_e_players = util::get_array_of_closest(self.origin, getplayers());
        if (isdefined(a_e_players[0]) && distance2dsquared(a_e_players[0].origin, self.origin) < 400 * 400) {
            a_e_players[0] zm_audio::create_and_play_dialog(#"spin_trap", #"hook", undefined, 1);
        }
        return;
    }
    if (isai(self) && !isvehicle(self)) {
        self thread a_a_arms();
    }
    if (self.var_6f84b820 === #"basic" && !isvehicle(self)) {
        str_tag = t_damage.mdl_trap get_closest_tag(self.origin);
        if (str_tag === "tag_weapon_1") {
            self zombie_utility::makezombiecrawler(1);
        } else if (str_tag === "tag_weapon_4") {
            gibserverutils::gibhead(self);
        } else if (str_tag === "tag_weapon_3" && randomint(100) < 75) {
            gibserverutils::annihilate(self);
        } else {
            n_lift_height = randomintrange(8, 64);
            v_away_from_source = vectornormalize(self.origin - t_damage.origin);
            v_away_from_source = v_away_from_source * 128;
            v_away_from_source = (v_away_from_source[0], v_away_from_source[1], n_lift_height);
            a_trace = physicstraceex(self.origin + vectorscale((0, 0, 1), 32), self.origin + v_away_from_source, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), self);
            self setplayercollision(0);
            self startragdoll();
            self launchragdoll(150 * anglestoup(self.angles) + (v_away_from_source[0], v_away_from_source[1], 0));
        }
        level notify(#"hash_148b3ce521088846", {#e_player:t_damage.activated_by_player});
        self dodamage(self.health + 1000, self.origin, undefined, t_damage);
        if (isdefined(t_damage.activated_by_player) && isplayer(t_damage.activated_by_player)) {
            t_damage.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
            t_damage.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
        }
        return;
    }
    if (self.var_6f84b820 === #"popcorn") {
        level notify(#"hash_148b3ce521088846", {#e_player:t_damage.activated_by_player});
        self dodamage(self.health + 1000, self.origin, undefined, t_damage);
        if (isdefined(t_damage.activated_by_player) && isplayer(t_damage.activated_by_player)) {
            t_damage.activated_by_player zm_stats::increment_challenge_stat(#"zombie_hunter_kill_trap");
            t_damage.activated_by_player contracts::increment_zm_contract(#"contract_zm_trap_kills");
        }
        return;
    }
    self dodamage(self.maxhealth * 0.2, self.origin, undefined, t_damage);
    wait(0.25);
    if (isdefined(self)) {
        self.var_1adc13ad = undefined;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x5 linked
// Checksum 0x7e4baa89, Offset: 0x3d90
// Size: 0xfa
function private get_closest_tag(v_pos) {
    if (!isdefined(self.var_e60684da)) {
        self function_c846fd12();
    }
    var_59add9df = undefined;
    for (i = 0; i < self.var_e60684da.size; i++) {
        if (!isdefined(var_59add9df)) {
            var_59add9df = self.var_e60684da[i];
            continue;
        }
        if (distance2dsquared(v_pos, self gettagorigin(self.var_e60684da[i])) < distance2dsquared(v_pos, self gettagorigin(var_59add9df))) {
            var_59add9df = self.var_e60684da[i];
        }
    }
    return tolower(var_59add9df);
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x5 linked
// Checksum 0x7334f5b9, Offset: 0x3e98
// Size: 0x72
function private function_c846fd12() {
    tags = [];
    tags[tags.size] = "tag_weapon_1";
    tags[tags.size] = "tag_weapon_2";
    tags[tags.size] = "tag_weapon_3";
    tags[tags.size] = "tag_weapon_4";
    self.var_e60684da = tags;
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x25ff08f0, Offset: 0x3f18
// Size: 0x66
function function_4a15e725() {
    self endon(#"trap_finished");
    for (n_duration = 0; n_duration < 25; n_duration = n_duration + 0.05) {
        wait(0.05);
    }
    self notify(#"trap_finished");
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x23b49756, Offset: 0x3f88
// Size: 0xb8
function function_c3ac9950() {
    self endon(#"trap_finished");
    while (true) {
        s_result = undefined;
        s_result = self.t_rumble waittill(#"trigger");
        if (isplayer(s_result.activator)) {
            if (!(isdefined(s_result.activator.b_spinning_trap_rumble) && s_result.activator.b_spinning_trap_rumble)) {
                self thread spinning_trap_rumble(s_result.activator);
            }
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x1 linked
// Checksum 0x102e9f16, Offset: 0x4048
// Size: 0xd6
function spinning_trap_rumble(e_player) {
    e_player endon(#"death", #"disconnect");
    self endon(#"trap_finished");
    while (true) {
        if (e_player istouching(self.t_rumble)) {
            e_player clientfield::set_to_player("rumble_spinning_trap", 1);
            e_player.b_spinning_trap_rumble = 1;
            wait(0.25);
            continue;
        }
        e_player clientfield::set_to_player("rumble_spinning_trap", 0);
        e_player.b_spinning_trap_rumble = undefined;
        break;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0x44f41834, Offset: 0x4128
// Size: 0x34
function a_a_arms() {
    wait(2);
    if (isdefined(self)) {
        self clientfield::set("spinning_trap_blood_fx", 0);
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 2, eflags: 0x1 linked
// Checksum 0x75a5ebf0, Offset: 0x4168
// Size: 0x2a6
function function_864365ef(t_damage, var_e72c9959) {
    self val::set("spinning_trap", "ignoreall", 1);
    self val::set("spinning_trap", "allowdeath", 0);
    self.b_ignore_cleanup = 1;
    self.health = 1;
    self notsolid();
    self setteam(util::get_enemy_team(self.team));
    self zombie_utility::makezombiecrawler(1);
    var_e72c9959 thread scene::init(#"aib_vign_zm_mob_hook_trap_zombie", self);
    playsoundatposition(#"hash_42c6cc2204b7fbbd", self.origin);
    t_damage waittill(#"trap_finished");
    var_44342e79 = var_e72c9959 scene::function_8582657c(#"p8_fxanim_zm_esc_trap_fan_play", "Shot 2");
    var_e72c9959 scene::play(#"aib_vign_zm_mob_hook_trap_zombie", self);
    if (isdefined(self)) {
        self val::reset("spinning_trap", "ignoreall");
        self val::reset("spinning_trap", "allowdeath");
        self.b_ignore_cleanup = 0;
        self solid();
        self setteam(level.zombie_team);
        self clientfield::set("spinning_trap_eye_fx", 0);
        self dodamage(self.health + 1000, self.origin);
    }
    var_e72c9959 unlink();
    var_e72c9959 delete();
    t_damage.var_705682df = undefined;
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 1, eflags: 0x5 linked
// Checksum 0xaabf4496, Offset: 0x4418
// Size: 0x214
function private function_61791b8b(s_pos = self) {
    v_point = getclosestpointonnavmesh(s_pos.origin, 128, 16);
    if (!isdefined(v_point)) {
        return;
    }
    var_dd239d21 = spawn("script_origin", v_point);
    if (!(isdefined(var_dd239d21 zm_utility::in_playable_area()) && var_dd239d21 zm_utility::in_playable_area())) {
        var_dd239d21 delete();
        return;
    }
    var_dd239d21 zm_utility::create_zombie_point_of_interest(300, 4, 10000);
    var_dd239d21 zm_utility::create_zombie_point_of_interest_attractor_positions(undefined, undefined, 90);
    a_ai_zombies = getaiteamarray(level.zombie_team);
    foreach (ai_zombie in a_ai_zombies) {
        if (ai_zombie.var_6f84b820 == #"miniboss" || ai_zombie.var_6f84b820 == #"boss") {
            ai_zombie thread zm_utility::add_poi_to_ignore_list(var_dd239d21);
        }
    }
    self waittill(#"trap_finished");
    var_dd239d21 delete();
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x0
// Checksum 0xfcc27986, Offset: 0x4638
// Size: 0x23c
function function_e3f8ed75() {
    self.var_cd6ebde4 = [];
    self.var_e7bb2f7b = [];
    foreach (var_d8a375cc in self.var_5ecb27b7) {
        var_c2a3bbf = getentarray(var_d8a375cc.target, "targetname");
        for (i = 0; i < var_c2a3bbf.size; i++) {
            if (var_c2a3bbf[i].script_string === "trap_handle") {
                if (!isdefined(self.var_e7bb2f7b)) {
                    self.var_e7bb2f7b = [];
                } else if (!isarray(self.var_e7bb2f7b)) {
                    self.var_e7bb2f7b = array(self.var_e7bb2f7b);
                }
                if (!isinarray(self.var_e7bb2f7b, var_c2a3bbf[i])) {
                    self.var_e7bb2f7b[self.var_e7bb2f7b.size] = var_c2a3bbf[i];
                }
                continue;
            }
            if (var_c2a3bbf[i].script_string === "trap_control_panel") {
                if (!isdefined(self.var_cd6ebde4)) {
                    self.var_cd6ebde4 = [];
                } else if (!isarray(self.var_cd6ebde4)) {
                    self.var_cd6ebde4 = array(self.var_cd6ebde4);
                }
                if (!isinarray(self.var_cd6ebde4, var_c2a3bbf[i])) {
                    self.var_cd6ebde4[self.var_cd6ebde4.size] = var_c2a3bbf[i];
                }
            }
        }
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xa1f389e3, Offset: 0x4880
// Size: 0x1ca
function zapper_light_red() {
    for (i = 0; i < self.var_cd6ebde4.size; i++) {
        self.var_cd6ebde4[i] setmodel(#"p7_zm_mob_trap_control_base_red");
        self.var_cd6ebde4[i] playsound(#"hash_6c4aadc21a173f8b");
        self.var_cd6ebde4[i] playsound(#"hash_6c4cdf83585f2851");
    }
    level flag::wait_till("start_zombie_round_logic");
    switch (self.script_noteworthy) {
    case #"zm_spinning_trap":
        exploder::exploder("fxexp_spinning_trap_light_red");
        exploder::kill_exploder("fxexp_spinning_trap_light_green");
        break;
    case #"zm_fan_trap":
        exploder::exploder("fxexp_fan_trap_light_red");
        exploder::kill_exploder("fxexp_fan_trap_light_green");
        break;
    case #"zm_acid_trap":
        exploder::exploder("fxexp_acid_trap_light_red");
        exploder::kill_exploder("fxexp_acid_trap_light_green");
        break;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x1 linked
// Checksum 0xbf143938, Offset: 0x4a58
// Size: 0x1aa
function zapper_light_green() {
    for (i = 0; i < self.var_cd6ebde4.size; i++) {
        self.var_cd6ebde4[i] setmodel(#"p7_zm_mob_trap_control_base");
        self.var_cd6ebde4[i] playsound(#"hash_27343b1084481dcb");
        self.var_cd6ebde4[i] playsound(#"hash_57154349da449cd");
    }
    switch (self.script_noteworthy) {
    case #"zm_spinning_trap":
        exploder::kill_exploder("fxexp_spinning_trap_light_red");
        exploder::exploder("fxexp_spinning_trap_light_green");
        break;
    case #"zm_fan_trap":
        exploder::kill_exploder("fxexp_fan_trap_light_red");
        exploder::exploder("fxexp_fan_trap_light_green");
        break;
    case #"zm_acid_trap":
        exploder::kill_exploder("fxexp_acid_trap_light_red");
        exploder::exploder("fxexp_acid_trap_light_green");
        break;
    }
}

// Namespace zm_escape_traps/zm_escape_traps
// Params 0, eflags: 0x0
// Checksum 0xec372c61, Offset: 0x4c10
// Size: 0x188
function trap_move_switch() {
    self zapper_light_red();
    foreach (mdl_handle in self.var_e7bb2f7b) {
        mdl_handle rotatepitch(-180, 0.5);
        mdl_handle playsound(#"amb_sparks_l_b");
    }
    wait(0.5);
    self notify(#"switch_activated");
    self waittill(#"available");
    self zapper_light_green();
    foreach (mdl_handle in self.var_e7bb2f7b) {
        mdl_handle rotatepitch(180, 0.5);
    }
}

