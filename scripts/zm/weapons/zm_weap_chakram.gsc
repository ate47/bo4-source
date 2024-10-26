#using scripts\zm_common\trials\zm_trial_restrict_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai\systems\gib.gsc;
#using scripts\core_common\throttle_shared.gsc;

#namespace zm_weap_chakram;

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x2
// Checksum 0x8499769d, Offset: 0x288
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_chakram", &__init__, undefined, undefined);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x1 linked
// Checksum 0xe7a5018b, Offset: 0x2d0
// Size: 0xb3c
function __init__() {
    clientfield::register("actor", "" + #"zombie_slice_right", 1, 2, "counter");
    clientfield::register("actor", "" + #"zombie_slice_left", 1, 2, "counter");
    clientfield::register("allplayers", "" + #"hash_aefa3d014b0fa1b", 1, 1, "counter");
    clientfield::register("actor", "" + #"hash_1e22d429435cc148", 1, 1, "int");
    clientfield::register("vehicle", "" + #"hash_1e22d429435cc148", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_2a55372ad04eb0e5", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_302e96545259ba6b", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_56421723ef2ac2fb", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_9d9fb6cf3d5d3a6", 1, 1, "int");
    clientfield::register("actor", "" + #"hash_3c3af9a781191429", 1, 1, "counter");
    clientfield::register("vehicle", "" + #"hash_3c3af9a781191429", 1, 1, "counter");
    clientfield::register("toplayer", "" + #"hash_7287b37a40c4ae6f", 1, 1, "counter");
    clientfield::register("toplayer", "" + #"chakram_rumble", 1, 3, "counter");
    level.hero_weapon[#"chakram"][0] = getweapon(#"hero_chakram_lv1");
    level.hero_weapon[#"chakram"][1] = getweapon(#"hero_chakram_lv2");
    level.hero_weapon[#"chakram"][2] = getweapon(#"hero_chakram_lv3");
    if (!isdefined(level.hero_weapon_stats)) {
        level.hero_weapon_stats = [];
    }
    level.hero_weapon_stats[#"chakram"] = [];
    level.hero_weapon_stats[#"chakram"][#"delay_start"][0] = 0.25;
    level.hero_weapon_stats[#"chakram"][#"delay_start"][1] = 0.15;
    level.hero_weapon_stats[#"chakram"][#"delay_start"][2] = 0.1;
    level.hero_weapon_stats[#"chakram"][#"delay_end"][0] = 0.4;
    level.hero_weapon_stats[#"chakram"][#"delay_end"][1] = 0.25;
    level.hero_weapon_stats[#"chakram"][#"delay_end"][2] = 0.12;
    level.hero_weapon_stats[#"chakram"][#"kill_limit"][0] = 4;
    level.hero_weapon_stats[#"chakram"][#"kill_limit"][1] = 4;
    level.hero_weapon_stats[#"chakram"][#"kill_limit"][2] = 4;
    level.hero_weapon_stats[#"chakram"][#"max_range"][0] = 512;
    level.hero_weapon_stats[#"chakram"][#"max_range"][1] = 756;
    level.hero_weapon_stats[#"chakram"][#"max_range"][2] = 1024;
    level.hero_weapon_stats[#"chakram"][#"seek_range"][0] = 256;
    level.hero_weapon_stats[#"chakram"][#"seek_range"][1] = 384;
    level.hero_weapon_stats[#"chakram"][#"seek_range"][2] = 512;
    level.hero_weapon_stats[#"chakram"][#"travel_time"][0] = 0.4;
    level.hero_weapon_stats[#"chakram"][#"travel_time"][1] = 0.5;
    level.hero_weapon_stats[#"chakram"][#"travel_time"][2] = 0.7;
    level.hero_weapon_stats[#"chakram"][#"throw_model"][0] = "wpn_t8_zm_melee_chakram_lvl1_dw_projectile";
    level.hero_weapon_stats[#"chakram"][#"throw_model"][1] = "wpn_t8_zm_melee_chakram_lvl2_dw_projectile";
    level.hero_weapon_stats[#"chakram"][#"throw_model"][2] = "wpn_t8_zm_melee_chakram_lvl3_dw_projectile";
    zm_loadout::register_hero_weapon_for_level("hero_chakram_lv1");
    zm_loadout::register_hero_weapon_for_level("hero_chakram_lv2");
    zm_loadout::register_hero_weapon_for_level("hero_chakram_lv3");
    level.var_5d31a5ef = [];
    if (!isdefined(level.var_5d31a5ef)) {
        level.var_5d31a5ef = [];
    } else if (!isarray(level.var_5d31a5ef)) {
        level.var_5d31a5ef = array(level.var_5d31a5ef);
    }
    level.var_5d31a5ef[level.var_5d31a5ef.size] = "minigun";
    if (!isdefined(level.var_893eb73f)) {
        level.var_893eb73f = new throttle();
        [[ level.var_893eb73f ]]->initialize(3, 0.1);
    }
    callback::on_connect(&function_1d807685);
    callback::on_disconnect(&on_player_disconnect);
    callback::add_weapon_fired(level.hero_weapon[#"chakram"][0].dualwieldweapon, &function_cec4ebbd);
    callback::add_weapon_fired(level.hero_weapon[#"chakram"][1].dualwieldweapon, &function_cec4ebbd);
    callback::add_weapon_fired(level.hero_weapon[#"chakram"][2].dualwieldweapon, &function_cec4ebbd);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x5 linked
// Checksum 0x38f5f376, Offset: 0xe18
// Size: 0x3e0
function private function_1d807685() {
    self endon(#"disconnect");
    /#
        var_16409102 = 0;
        var_d0ba279f = 0;
        var_cd7ab272 = 0;
    #/
    while (true) {
        waitresult = self waittill(#"weapon_change");
        wpn_cur = waitresult.weapon;
        wpn_prev = waitresult.last_weapon;
        if (isinarray(level.hero_weapon[#"chakram"], wpn_cur)) {
            self notify(#"hero_chakram_activated");
            self thread function_c965a5a9(wpn_cur);
            self thread queue_setrotors(wpn_cur);
        } else if (isinarray(level.hero_weapon[#"chakram"], wpn_prev)) {
            self thread function_7bef3ea0(wpn_prev);
        }
        if (wpn_cur == level.hero_weapon[#"chakram"][0]) {
            self thread chakram_rumble(1);
            if (!self gamepadusedlast()) {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_327e81e6ede21cd5");
            } else {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_52e079a39f348e1b");
            }
            continue;
        }
        if (wpn_cur == level.hero_weapon[#"chakram"][1]) {
            self thread chakram_rumble(1);
            if (!self gamepadusedlast()) {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_327e81e6ede21cd5");
            } else {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_52e079a39f348e1b");
            }
            self thread function_d5e67082(wpn_cur);
            continue;
        }
        if (wpn_cur == level.hero_weapon[#"chakram"][2]) {
            self thread chakram_rumble(1);
            if (!self gamepadusedlast()) {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_3c4637f13f09707");
            } else {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_34a417201bd40701");
            }
            self thread function_d5e67082(wpn_cur);
            self thread function_b475223e(wpn_cur);
            self thread function_f9b883ea();
            self thread function_68ff89f7(wpn_cur);
        }
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0x5e3cd2ba, Offset: 0x1200
// Size: 0xec
function private function_7bef3ea0(w_hero) {
    self endon(#"death");
    s_result = self waittilltimeout(5, #"seeker_done", #"hero_chakram_activated");
    if (s_result._notify !== #"seeker_done") {
        self notify(#"seeker_done");
    }
    if (isdefined(self.e_seeker)) {
        self.e_seeker clientfield::set("" + #"hash_2a55372ad04eb0e5", 0);
        self.e_seeker delete();
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0x8065d920, Offset: 0x12f8
// Size: 0xe8
function private function_c965a5a9(weapon) {
    self endon(#"weapon_change", #"disconnect", #"bled_out");
    while (true) {
        if (weapon == level.hero_weapon[#"chakram"][2]) {
            self waittill(#"weapon_melee_power");
        } else {
            self waittill(#"weapon_melee_power", #"weapon_melee");
        }
        if (!zm_trial_restrict_loadout::function_5fbf572(weapon, 1)) {
            continue;
        }
        weapon thread function_eac789ca(self);
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0xd4a7aa49, Offset: 0x13e8
// Size: 0x8c
function private blood_death_fx(var_14ef0a6c) {
    if (self.archetype === #"zombie") {
        if (var_14ef0a6c) {
            self clientfield::increment("" + #"zombie_slice_left", 1);
            return;
        }
        self clientfield::increment("" + #"zombie_slice_right", 1);
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 3, eflags: 0x1 linked
// Checksum 0x7da73623, Offset: 0x1480
// Size: 0x84
function function_fe3f086c(e_target, leftswing, weapon = level.weaponnone) {
    if (isactor(e_target)) {
        self thread chop_actor(e_target, leftswing, weapon);
        return;
    }
    self thread function_5e2c9b64(e_target, weapon);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 3, eflags: 0x1 linked
// Checksum 0x13399541, Offset: 0x1510
// Size: 0x244
function chop_actor(e_target, leftswing, weapon = level.weaponnone) {
    self endon(#"weapon_change", #"disconnect", #"bled_out");
    e_target endon(#"death");
    if (!isdefined(e_target.var_6f84b820)) {
        return;
    }
    switch (e_target.var_6f84b820) {
    case #"popcorn":
    case #"basic":
    case #"enhanced":
        n_damage = e_target.health;
        break;
    case #"heavy":
        n_damage = int(e_target.maxhealth * 0.2);
        break;
    case #"miniboss":
        n_damage = int(e_target.maxhealth * 0.1);
        break;
    case #"boss":
        n_damage = 2500;
        break;
    }
    if (n_damage >= e_target.health) {
        e_target.ignoremelee = 1;
    }
    self thread function_a5ed760f();
    [[ level.var_893eb73f ]]->waitinqueue(e_target);
    e_target thread zm_hero_weapon::function_acee2761();
    e_target blood_death_fx(leftswing);
    e_target dodamage(n_damage, self.origin, self, self, "none", "MOD_MELEE", 0, weapon);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 2, eflags: 0x1 linked
// Checksum 0xb1d30ef1, Offset: 0x1760
// Size: 0xb4
function function_5e2c9b64(e_target, weapon) {
    e_target endon(#"death");
    self endon(#"weapon_change", #"disconnect");
    [[ level.var_893eb73f ]]->waitinqueue(e_target);
    self thread function_a5ed760f();
    e_target dodamage(2500, self.origin, self, self, "none", "MOD_MELEE", 0, weapon);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x1 linked
// Checksum 0x1d4d4371, Offset: 0x1820
// Size: 0x6c
function function_a5ed760f() {
    self endon(#"weapon_change", #"disconnect", #"bled_out");
    wait 0.1;
    self clientfield::increment("" + #"hash_aefa3d014b0fa1b", 1);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 3, eflags: 0x1 linked
// Checksum 0xc7d34302, Offset: 0x1898
// Size: 0x308
function chop_zombies(first_time = 1, leftswing, weapon = level.weaponnone) {
    view_pos = self getweaponmuzzlepoint();
    forward_view_angles = self getweaponforwarddir();
    var_b9e95436 = zm_hero_weapon::function_7c3681f7();
    a_e_targets = array::get_all_closest(view_pos, var_b9e95436, undefined, undefined, 160);
    foreach (e_target in a_e_targets) {
        if (!isalive(e_target)) {
            continue;
        }
        if (first_time) {
            e_target.chopped = 0;
            first_time = 0;
        } else if (isdefined(e_target.chopped) && e_target.chopped) {
            continue;
        }
        test_origin = e_target getcentroid();
        dist_sq = distancesquared(view_pos, test_origin);
        normal = vectornormalize(test_origin - view_pos);
        dot = vectordot(forward_view_angles, normal);
        if (dot <= 0) {
            continue;
        }
        if (dist_sq <= 1600) {
            if (0 == e_target damageconetrace(view_pos, self, forward_view_angles)) {
                continue;
            }
        } else if (0 == e_target damageconetrace(view_pos, self, forward_view_angles, 25)) {
            continue;
        }
        e_target.chopped = 1;
        if (isdefined(e_target.chop_actor_cb)) {
            self thread [[ e_target.chop_actor_cb ]](e_target, self, weapon);
            continue;
        }
        self thread chakram_rumble(3);
        self thread function_fe3f086c(e_target, leftswing, weapon);
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x1 linked
// Checksum 0x7f04bef4, Offset: 0x1ba8
// Size: 0x44
function function_eac789ca(player) {
    player thread chakram_rumble(4);
    player thread chop_zombies(1, 1, self);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x1 linked
// Checksum 0xd627aa90, Offset: 0x1bf8
// Size: 0x64
function function_cec4ebbd(weapon) {
    player = self;
    if (!zm_trial_restrict_loadout::function_5fbf572(weapon)) {
        return;
    }
    player thread chakram_rumble(5);
    weapon function_dc7f8e67(player);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0x26713d2b, Offset: 0x1c68
// Size: 0x34
function private queue_setrotors(weapon) {
    self setweaponammoclip(weapon.dualwieldweapon, 1);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0x310bbc77, Offset: 0x1ca8
// Size: 0x518
function private function_dc7f8e67(player) {
    player endon(#"death", #"seeker_done");
    player.var_30cbff55 = 1;
    var_e9ada947 = level.hero_weapon_stats[#"chakram"][#"delay_start"][player.var_72d6f15d];
    var_9884ff29 = level.hero_weapon_stats[#"chakram"][#"delay_end"][player.var_72d6f15d];
    var_fc51fa3d = level.hero_weapon_stats[#"chakram"][#"kill_limit"][player.var_72d6f15d];
    var_e68de849 = level.hero_weapon_stats[#"chakram"][#"max_range"][player.var_72d6f15d];
    var_931acaa7 = level.hero_weapon_stats[#"chakram"][#"seek_range"][player.var_72d6f15d];
    wait var_e9ada947;
    n_kills = 0;
    if (!isdefined(player.e_seeker)) {
        e_seeker = util::spawn_model(level.hero_weapon_stats[#"chakram"][#"throw_model"][player.var_72d6f15d], player gettagorigin("tag_weapon_left"));
        player.e_seeker = e_seeker;
        e_seeker.var_fee68611 = [];
        e_seeker.var_8d8b7454 = [];
    } else {
        e_seeker = player.e_seeker;
        e_seeker.var_fee68611 = [];
        e_seeker.var_8d8b7454 = [];
        e_seeker.origin = player gettagorigin("tag_weapon_left");
        e_seeker setmodel(level.hero_weapon_stats[#"chakram"][#"throw_model"][player.var_72d6f15d]);
        e_seeker show();
    }
    player.var_fbe120be = 1;
    e_seeker clientfield::set("" + #"hash_2a55372ad04eb0e5", 1);
    b_zombie_killed = player function_e3ad524a();
    if (isdefined(b_zombie_killed) && b_zombie_killed) {
        n_kills++;
    }
    e_target = e_seeker function_46f125d(e_seeker.origin, var_931acaa7);
    if (isdefined(e_target)) {
        while (n_kills < var_fc51fa3d && isdefined(e_target)) {
            b_zombie_killed = player function_3adb0798(e_target);
            if (isdefined(b_zombie_killed) && b_zombie_killed) {
                n_kills++;
            }
            waitframe(1);
            e_target = e_seeker function_46f125d(e_seeker.origin, var_931acaa7);
        }
    }
    player function_3adb0798(undefined, n_kills);
    player thread chakram_rumble(2);
    e_seeker clientfield::set("" + #"hash_2a55372ad04eb0e5", 0);
    waitframe(1);
    if (isdefined(e_seeker)) {
        e_seeker hide();
    }
    wait var_9884ff29;
    if (isalive(player)) {
        player setweaponammoclip(player.slot_weapons[#"hero_weapon"], 1);
    }
    player.var_fbe120be = 0;
    player.var_30cbff55 = undefined;
    player notify(#"seeker_done");
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x5 linked
// Checksum 0x493fcf5e, Offset: 0x21c8
// Size: 0x736
function private function_e3ad524a() {
    self endon(#"death", #"seeker_done");
    self.e_seeker endon(#"death");
    var_e68de849 = level.hero_weapon_stats[#"chakram"][#"max_range"][self.var_72d6f15d];
    var_931acaa7 = level.hero_weapon_stats[#"chakram"][#"seek_range"][self.var_72d6f15d] / 1.5;
    var_afbf7a56 = level.hero_weapon_stats[#"chakram"][#"travel_time"][self.var_72d6f15d];
    v_start = self geteye();
    v_forward = self getweaponforwarddir();
    v_end = v_start + v_forward * var_e68de849;
    a_trace = bullettrace(v_start, v_end, 0, self);
    if (distancesquared(v_start, v_end) > distancesquared(v_start, a_trace[#"position"])) {
        v_end = a_trace[#"position"];
        n_dist = distance(v_start, v_end);
        var_c5eb6fda = n_dist * var_afbf7a56 / var_e68de849;
        if (var_c5eb6fda <= 0) {
            return 0;
        }
        self.e_seeker.angles = vectortoangles(v_forward);
        self.e_seeker moveto(v_end, var_c5eb6fda);
        var_5b08cfa = gettime() / 1000;
    } else {
        self.e_seeker.angles = vectortoangles(v_forward);
        self.e_seeker moveto(v_end, var_afbf7a56);
    }
    n_time_started = gettime() / 1000;
    var_fcb3d955 = v_start;
    var_28035668 = v_forward;
    do {
        n_time_current = gettime() / 1000;
        n_time_elapsed = n_time_current - n_time_started;
        e_target = self.e_seeker function_46f125d(var_fcb3d955, var_931acaa7, var_28035668);
        if (isdefined(e_target)) {
            if (isdefined(e_target.powerup_name)) {
                e_target.origin = self.e_seeker.origin;
                e_target linkto(self.e_seeker);
                if (!isdefined(self.e_seeker.var_fee68611)) {
                    self.e_seeker.var_fee68611 = [];
                } else if (!isarray(self.e_seeker.var_fee68611)) {
                    self.e_seeker.var_fee68611 = array(self.e_seeker.var_fee68611);
                }
                self.e_seeker.var_fee68611[self.e_seeker.var_fee68611.size] = e_target;
            } else if (isalive(e_target)) {
                b_killed_zombie = self function_3adb0798(e_target);
                self notify(#"hash_146bfa4c4de1779");
                return b_killed_zombie;
            }
        }
        if (isdefined(var_5b08cfa)) {
            var_9cdda9f7 = n_time_current - var_5b08cfa;
            if (var_9cdda9f7 >= var_c5eb6fda) {
                level thread function_8d4b8171(v_end, a_trace[#"normal"]);
                if (isdefined(level.var_2e32e0bb)) {
                    level notify(#"hero_weapon_hit", {#player:self, #e_entity:a_trace[#"entity"], #var_80e17549:self.currentweapon, #v_position:a_trace[#"position"]});
                }
                v_start = v_end;
                v_forward -= 2 * a_trace[#"normal"] * vectordot(v_forward, a_trace[#"normal"]);
                n_dist = var_e68de849 - n_dist;
                v_end = v_start + v_forward * n_dist;
                a_trace = bullettrace(v_start, v_end, 0, self);
                if (distancesquared(v_start, v_end) != distancesquared(v_start, a_trace[#"position"])) {
                    v_end = a_trace[#"position"];
                    n_dist = distance(v_start, v_end);
                    var_5b08cfa = gettime() / 1000;
                } else {
                    var_5b08cfa = undefined;
                }
                var_c5eb6fda = n_dist * var_afbf7a56 / var_e68de849;
                if (var_c5eb6fda <= 0) {
                    return 0;
                }
                self.e_seeker.angles = vectortoangles(v_forward);
                self.e_seeker moveto(v_end, var_c5eb6fda);
            }
        }
        wait 0.1;
        var_fcb3d955 = self.e_seeker.origin;
    } while (n_time_elapsed < var_afbf7a56);
    return 0;
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 3, eflags: 0x5 linked
// Checksum 0x41758343, Offset: 0x2908
// Size: 0x3f2
function private function_46f125d(v_start, var_4d1ea1ad, v_forward) {
    self endon(#"death");
    var_b9e95436 = zm_hero_weapon::function_7c3681f7();
    a_e_targets = array::get_all_closest(v_start, var_b9e95436, undefined, undefined, var_4d1ea1ad);
    if (isdefined(v_forward)) {
        foreach (e_powerup in level.active_powerups) {
            if (!isdefined(e_powerup)) {
                continue;
            }
            if (isinarray(self.var_fee68611, e_powerup)) {
                continue;
            }
            if (isdefined(level.var_5d31a5ef) && isinarray(level.var_5d31a5ef, e_powerup.powerup_name)) {
                continue;
            }
            if (!isdefined(a_e_targets)) {
                a_e_targets = [];
            } else if (!isarray(a_e_targets)) {
                a_e_targets = array(a_e_targets);
            }
            a_e_targets[a_e_targets.size] = e_powerup;
        }
    }
    n_traces = 0;
    foreach (e_target in a_e_targets) {
        if (!isalive(e_target)) {
            continue;
        }
        if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
            continue;
        }
        if (isinarray(self.var_fee68611, e_target)) {
            continue;
        }
        if (isdefined(e_target.var_6f84b820) && (e_target.var_6f84b820 == #"heavy" || e_target.var_6f84b820 == #"miniboss" || e_target.var_6f84b820 == #"boss")) {
            if (isdefined(self.var_8d8b7454) && isinarray(self.var_8d8b7454, e_target)) {
                continue;
            }
        }
        if (isdefined(v_forward)) {
            v_to_target = vectornormalize(e_target.origin - v_start);
            if (vectordot(v_to_target, v_forward) < 0.7) {
                continue;
            }
        }
        if ((isdefined(e_target.powerup_name) || function_ffa5b184(e_target) || isalive(e_target)) && bullettracepassed(v_start, e_target getcentroid(), 0, self, e_target)) {
            return e_target;
        }
        n_traces++;
        if (n_traces > 3) {
            n_traces = 0;
            waitframe(1);
        }
    }
    return undefined;
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 2, eflags: 0x5 linked
// Checksum 0x46642c22, Offset: 0x2d08
// Size: 0x4b0
function private function_3adb0798(e_target, n_kills) {
    self endon(#"death", #"seeker_done");
    self.e_seeker endon(#"death");
    var_ece935b3 = level.hero_weapon_stats[#"chakram"][#"travel_time"][self.var_72d6f15d];
    var_e68de849 = level.hero_weapon_stats[#"chakram"][#"max_range"][self.var_72d6f15d];
    if (!isdefined(e_target)) {
        e_target = self;
        var_fc51fa3d = level.hero_weapon_stats[#"chakram"][#"kill_limit"][self.var_72d6f15d];
        var_ece935b3 /= 2;
    }
    while (true) {
        if (!isdefined(e_target)) {
            return 0;
        }
        if (isplayer(e_target)) {
            var_2f067119 = e_target gettagorigin("tag_weapon_left");
            if (!isdefined(var_2f067119)) {
                var_2f067119 = e_target.origin;
            }
            v_target = var_2f067119 + anglestoforward(e_target.angles) * 24;
            while (isdefined(n_kills) && n_kills < var_fc51fa3d) {
                s_trace = bullettrace(self.e_seeker.origin, v_target, 1, self.e_seeker);
                if (isdefined(s_trace[#"entity"]) && isinarray(getaiteamarray(level.zombie_team), s_trace[#"entity"])) {
                    self thread function_545dcea4(s_trace[#"entity"]);
                    n_kills++;
                    continue;
                }
                break;
            }
        } else {
            v_target = e_target getcentroid();
        }
        if (distancesquared(self.e_seeker.origin, v_target) > 2304) {
            var_81b38250 = distance(self.e_seeker.origin, v_target);
            n_travel_time = var_81b38250 * var_ece935b3 / var_e68de849;
            self.e_seeker moveto(v_target, n_travel_time);
        } else if (isplayer(e_target)) {
            self playsound(#"hash_2c86fd203e33ce7c");
            self.e_seeker.origin = self gettagorigin("tag_weapon_left");
            a_e_powerups = array::remove_undefined(self.e_seeker.var_fee68611);
            foreach (e_powerup in a_e_powerups) {
                e_powerup unlink();
                e_powerup.origin = self.origin;
            }
            return 0;
        } else {
            self thread function_96835348(e_target);
            return 1;
        }
        wait 0.1;
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0xcaf05942, Offset: 0x31c0
// Size: 0xbc
function private function_545dcea4(e_target) {
    self endon(#"death", #"seeker_done");
    self.e_seeker endon(#"death");
    e_target endon(#"death");
    while (distance2d(self.e_seeker.origin, e_target getcentroid()) < 25) {
        waitframe(1);
    }
    self thread function_96835348(e_target);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0xeaf3d1d5, Offset: 0x3288
// Size: 0x43c
function private function_96835348(e_target) {
    if (isalive(e_target)) {
        e_target endon(#"death");
        self endon(#"disconnect");
        if (isdefined(e_target.var_6f84b820)) {
            switch (e_target.var_6f84b820) {
            case #"popcorn":
            case #"basic":
            case #"enhanced":
                gibserverutils::gibhead(e_target);
                e_target clientfield::set("" + #"hash_1e22d429435cc148", 1);
                n_damage = e_target.health;
                break;
            case #"heavy":
            case #"miniboss":
                e_target clientfield::increment("" + #"hash_56421723ef2ac2fb", 1);
                n_damage = 1000;
                if (!isdefined(self.e_seeker.var_8d8b7454)) {
                    self.e_seeker.var_8d8b7454 = [];
                } else if (!isarray(self.e_seeker.var_8d8b7454)) {
                    self.e_seeker.var_8d8b7454 = array(self.e_seeker.var_8d8b7454);
                }
                self.e_seeker.var_8d8b7454[self.e_seeker.var_8d8b7454.size] = e_target;
                break;
            case #"boss":
                n_damage = 1000;
                if (!isdefined(self.e_seeker.var_8d8b7454)) {
                    self.e_seeker.var_8d8b7454 = [];
                } else if (!isarray(self.e_seeker.var_8d8b7454)) {
                    self.e_seeker.var_8d8b7454 = array(self.e_seeker.var_8d8b7454);
                }
                self.e_seeker.var_8d8b7454[self.e_seeker.var_8d8b7454.size] = e_target;
                break;
            case #"inanimate":
                if (!(isdefined(e_target.var_f7f67d2c) && e_target.var_f7f67d2c)) {
                    e_target thread function_20d19d65(0.5);
                }
                n_damage = 1000;
            default:
                n_damage = 1000;
                break;
            }
        } else {
            if (!(isdefined(e_target.var_f7f67d2c) && e_target.var_f7f67d2c)) {
                e_target thread function_20d19d65(0.5);
            }
            n_damage = 1000;
        }
        if (isactor(e_target)) {
            e_target thread zm_hero_weapon::function_acee2761();
            [[ level.var_893eb73f ]]->waitinqueue(e_target);
        }
        weapon = undefined;
        if (isdefined(self)) {
            weapon = self.slot_weapons[#"hero_weapon"];
        }
        e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_PROJECTILE", 0, weapon);
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0xfc95dd66, Offset: 0x36d0
// Size: 0x3e
function private function_20d19d65(n_time) {
    self endon(#"death");
    self.var_f7f67d2c = 1;
    wait n_time;
    self.var_f7f67d2c = 0;
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 2, eflags: 0x5 linked
// Checksum 0xe454561b, Offset: 0x3718
// Size: 0xa4
function private function_8d4b8171(v_position, v_normal) {
    mdl_fx = util::spawn_model("tag_origin", v_position, v_normal);
    mdl_fx endon(#"death");
    mdl_fx clientfield::set("" + #"hash_302e96545259ba6b", 1);
    wait 1.5;
    mdl_fx delete();
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0x92ed3cd4, Offset: 0x37c8
// Size: 0x4c
function private function_d5e67082(weapon) {
    self endon(#"disconnect");
    self clientfield::increment_to_player("" + #"hash_7287b37a40c4ae6f", 1);
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0xdeb6ed95, Offset: 0x3820
// Size: 0x108
function private function_b475223e(weapon) {
    self endon(#"disconnect", #"weapon_change", #"bled_out", #"entering_last_stand");
    level endoncallback(&function_7d1739b8, #"round_reset");
    while (self getcurrentweapon() == weapon) {
        self waittill(#"weapon_melee");
        if (!zm_trial_restrict_loadout::function_5fbf572(weapon)) {
            continue;
        }
        self thread function_f9b883ea();
        self function_481a494b(weapon);
        self function_892bdee2();
        wait 0.5;
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0xfa5445db, Offset: 0x3930
// Size: 0xb0
function private function_7d1739b8(var_201c5b1f) {
    assert(var_201c5b1f == #"round_reset");
    foreach (player in getplayers()) {
        player function_892bdee2();
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x5 linked
// Checksum 0x7157b662, Offset: 0x39e8
// Size: 0x94
function private function_f9b883ea() {
    self endon(#"disconnect");
    self notify("beb94ee3d73772a");
    self endon("beb94ee3d73772a");
    self waittill(#"death", #"weapon_change", #"hash_1c35eb15aa210d6", #"hash_62fb3ab92a1f20cd");
    if (isdefined(self)) {
        self thread function_892bdee2();
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x5 linked
// Checksum 0x9f199e11, Offset: 0x3a88
// Size: 0x64
function private function_892bdee2() {
    self.var_a70d2cfe = undefined;
    if (self clientfield::get("" + #"hash_9d9fb6cf3d5d3a6")) {
        self clientfield::set("" + #"hash_9d9fb6cf3d5d3a6", 0);
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x5 linked
// Checksum 0x10cdb904, Offset: 0x3af8
// Size: 0x41c
function private function_481a494b(var_5f94a2e7) {
    self endon(#"weapon_melee", #"weapon_change", #"disconnect", #"bled_out", #"entering_last_stand");
    self.var_a70d2cfe = 1;
    self clientfield::set("" + #"hash_9d9fb6cf3d5d3a6", 1);
    self playsound(#"hash_6043c078f3675169");
    while (isdefined(self.var_a70d2cfe) && self.var_a70d2cfe) {
        self clientfield::increment_to_player("" + #"chakram_rumble", 6);
        a_e_targets = zm_hero_weapon::function_7c3681f7();
        a_e_targets = arraysortclosest(a_e_targets, self.origin, undefined, undefined, 128);
        foreach (e_target in a_e_targets) {
            if (isalive(e_target) && !zm_utility::is_magic_bullet_shield_enabled(e_target)) {
                var_9a7661ba = 1;
                if (isdefined(e_target.var_6f84b820)) {
                    switch (e_target.var_6f84b820) {
                    case #"popcorn":
                    case #"basic":
                    case #"enhanced":
                        n_damage = 3594;
                        break;
                    case #"heavy":
                    case #"miniboss":
                        n_damage = 1000;
                        break;
                    case #"boss":
                        n_damage = 1000;
                        var_9a7661ba = 0;
                        break;
                    case #"inanimate":
                        n_damage = 3594;
                        var_9a7661ba = 0;
                    default:
                        n_damage = 3594;
                        break;
                    }
                } else {
                    n_damage = 3594;
                }
                if (e_target.health < n_damage && isactor(e_target) && var_9a7661ba) {
                    gibserverutils::gibhead(e_target);
                    e_target clientfield::set("" + #"hash_1e22d429435cc148", 1);
                    e_target playsound(#"hash_4332e54b12b06564");
                    e_target clientfield::increment("" + #"hash_3c3af9a781191429", 1);
                }
                e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, var_5f94a2e7);
                waitframe(1);
            }
        }
        wait 0.2;
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x1 linked
// Checksum 0x6694fa12, Offset: 0x3f20
// Size: 0x162
function chakram_rumble(var_b2e05bae) {
    if (isalive(self) && var_b2e05bae) {
        switch (var_b2e05bae) {
        case 1:
            self playrumbleonentity("zm_weap_special_activate_rumble");
            break;
        case 2:
            self clientfield::increment_to_player("" + #"chakram_rumble", 2);
            break;
        case 3:
            self playrumbleonentity("zm_weap_chakram_melee_hit_rumble");
            break;
        case 4:
            self clientfield::increment_to_player("" + #"chakram_rumble", 4);
            break;
        case 5:
            self clientfield::increment_to_player("" + #"chakram_rumble", 5);
            break;
        }
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 1, eflags: 0x1 linked
// Checksum 0x4b8b9cdc, Offset: 0x4090
// Size: 0xdc
function function_68ff89f7(w_chakram) {
    self endon(#"disconnect", #"weapon_change", #"bled_out", #"entering_last_stand");
    level endoncallback(&function_7d1739b8, #"round_reset");
    s_result = self waittill(#"weapon_melee");
    if (s_result.weapon === w_chakram) {
        self thread zm_audio::create_and_play_dialog(#"hero_level_3", #"chakram");
    }
}

// Namespace zm_weap_chakram/zm_weap_chakram
// Params 0, eflags: 0x1 linked
// Checksum 0xba26aa42, Offset: 0x4178
// Size: 0x2c
function on_player_disconnect() {
    if (isdefined(self.e_seeker)) {
        self.e_seeker delete();
    }
}

