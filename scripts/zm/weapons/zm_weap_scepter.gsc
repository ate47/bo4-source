// Atian COD Tools GSC decompiler test
#using scripts\abilities\ability_player.gsc;
#using script_24c32478acf44108;
#using scripts\zm_common\trials\zm_trial_restrict_loadout.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_unitrigger.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_player.gsc;
#using scripts\zm_common\zm_perks.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\throttle_shared.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;

#namespace zm_weap_scepter;

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x2
// Checksum 0x25a1c890, Offset: 0x2f8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_scepter", &__init__, undefined, undefined);
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x4c63d089, Offset: 0x340
// Size: 0x61c
function __init__() {
    clientfield::register("allplayers", "" + #"hash_70c8a5d240e431ec", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"zombie_scepter_melee", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"zombie_scepter_heal", 1, 1, "counter");
    clientfield::register("actor", "" + #"zombie_scepter_stun", 1, 1, "int");
    clientfield::register("vehicle", "" + #"zombie_scepter_stun", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"beacon_fx", 1, 1, "int");
    clientfield::register("allplayers", "" + #"skull_turret_beam_fire", 1, 2, "int");
    clientfield::register("allplayers", "" + #"hash_6635e6da6fcfe594", 1, 2, "int");
    clientfield::register("toplayer", "" + #"hash_2964d1cb7c4bd175", 1, 1, "counter");
    clientfield::register("allplayers", "" + #"zombie_scepter_revive", 1, 1, "int");
    clientfield::register("toplayer", "" + #"scepter_rumble", 1, 3, "counter");
    level.hero_weapon[#"scepter"][0] = getweapon(#"hero_scepter_lv1");
    level.hero_weapon[#"scepter"][1] = getweapon(#"hero_scepter_lv2");
    level.hero_weapon[#"scepter"][2] = getweapon(#"hero_scepter_lv3");
    zm_loadout::register_hero_weapon_for_level(#"hero_scepter_lv1");
    zm_loadout::register_hero_weapon_for_level(#"hero_scepter_lv2");
    zm_loadout::register_hero_weapon_for_level(#"hero_scepter_lv3");
    zm_hero_weapon::function_7a394ec4("scepter", 0, 4000, 7000);
    zm_spawner::register_zombie_death_event_callback(&function_cc91b3fe);
    zm_perks::register_lost_perk_override(&function_3a00c0a6);
    callback::on_connect(&on_connect);
    callback::on_disconnect(&on_player_disconnect);
    callback::on_bleedout(&reset_override);
    callback::on_revived(&reset_override);
    callback::on_bleedout(&function_37946a1d);
    namespace_9ff9f642::register_slowdown(#"hash_6c580993aa401a5b", 0.6, 3);
    namespace_9ff9f642::register_slowdown(#"hash_449bc314b0c3da73", 0.4, 3);
    namespace_9ff9f642::register_slowdown(#"hash_6c580f93aa40248d", 0.6, 5);
    namespace_9ff9f642::register_slowdown(#"hash_1cc2b03094ad09bd", 0.4, 5);
    namespace_9ff9f642::register_slowdown(#"hash_59b633ea4aeff841", 0.6, 0.5);
    if (!isdefined(level.var_cfeea502)) {
        level.var_cfeea502 = new throttle();
        [[ level.var_cfeea502 ]]->initialize(3, 0.1);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x8935dadc, Offset: 0x968
// Size: 0x4c
function on_connect() {
    self thread function_fa0a1b19();
    self thread function_717a1af2();
    self thread function_63e57124();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x5 linked
// Checksum 0x306e1fdb, Offset: 0x9c0
// Size: 0x4d0
function private function_63e57124() {
    self endon(#"disconnect");
    while (true) {
        waitresult = undefined;
        waitresult = self waittill(#"hero_weapon_change");
        wpn_cur = waitresult.weapon;
        wpn_prev = waitresult.last_weapon;
        if (wpn_prev == level.hero_weapon[#"scepter"][0] || wpn_prev == level.hero_weapon[#"scepter"][1] || wpn_prev == level.hero_weapon[#"scepter"][2]) {
            self thread scepter_rumble(1);
            self clientfield::set("" + #"skull_turret_beam_fire", 0);
            self clientfield::set("" + #"hash_6635e6da6fcfe594", 0);
            self notify(#"stop_damage");
            if (wpn_prev == level.hero_weapon[#"scepter"][1]) {
                self thread function_89fc5431();
            } else if (wpn_prev == level.hero_weapon[#"scepter"][2]) {
                self thread function_89fc5431();
                level scene::function_f81475ae(#"p8_fxanim_zm_zod_staff_ra_bundle");
            }
        }
        if (wpn_cur == level.hero_weapon[#"scepter"][0]) {
            zm_hero_weapon::show_hint(wpn_cur, #"hash_7ebea2becf0c1aee");
            self thread function_4521ac7e(wpn_cur, 1);
            self thread function_4493c71b(wpn_cur, 1);
            playrumbleonposition("grenade_rumble", self.origin);
            continue;
        }
        if (wpn_cur == level.hero_weapon[#"scepter"][1]) {
            zm_hero_weapon::show_hint(wpn_cur, #"hash_7ebea2becf0c1aee");
            self thread function_4521ac7e(wpn_cur, 2);
            self thread function_4493c71b(wpn_cur, 2);
            playrumbleonposition("grenade_rumble", self.origin);
            self thread function_eae0296b(#"hero_scepter_lv2", 1);
            continue;
        }
        if (wpn_cur == level.hero_weapon[#"scepter"][2]) {
            if (!self gamepadusedlast()) {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_5ba4f6bd62a74330");
            } else {
                self zm_hero_weapon::show_hint(wpn_cur, #"hash_57c3251d6df56d4");
            }
            self.var_7e973e30 = wpn_prev;
            self thread function_4521ac7e(wpn_cur, 3);
            self thread function_4493c71b(wpn_cur, 3);
            self thread function_e874c3e1(wpn_cur);
            playrumbleonposition("grenade_rumble", self.origin);
            self thread function_68ff89f7(wpn_cur);
            self thread function_eae0296b(#"hero_scepter_lv3", 1);
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x5 linked
// Checksum 0x69561edd, Offset: 0xe98
// Size: 0x9e
function private function_304a3c9b(var_c34665fc) {
    if (var_c34665fc === "hero_weapon_power_off" || var_c34665fc === "player_downed") {
        self clientfield::set("" + #"skull_turret_beam_fire", 0);
        self clientfield::set("" + #"hash_6635e6da6fcfe594", 0);
        self.var_1de56cc8 = undefined;
        self notify(#"stop_damage");
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x5 linked
// Checksum 0xa37c7f88, Offset: 0xf40
// Size: 0x352
function private function_4521ac7e(w_curr, n_lvl) {
    self endoncallback(&function_304a3c9b, #"hero_weapon_change", #"player_downed", #"disconnect", #"hero_weapon_power_off");
    while (true) {
        s_result = undefined;
        s_result = self waittill(#"weapon_melee_power");
        if (s_result.weapon !== w_curr) {
            continue;
        }
        if (!zm_trial_restrict_loadout::function_5fbf572(w_curr)) {
            continue;
        }
        v_flash_pos = self gettagorigin("tag_flash");
        if (!isdefined(v_flash_pos) || !(isdefined(bullettracepassed(self geteye(), v_flash_pos, 0, self)) && bullettracepassed(self geteye(), v_flash_pos, 0, self))) {
            continue;
        }
        self clientfield::set("" + #"skull_turret_beam_fire", n_lvl);
        self clientfield::set("" + #"hash_6635e6da6fcfe594", n_lvl);
        self.var_1de56cc8 = 1;
        self thread function_be8ae52f(w_curr);
        self notify(#"ammo_reduction", {#weapon:w_curr});
        wait(0.1);
        var_43b42a60 = 1;
        do {
            waitframe(1);
            var_43b42a60 = var_43b42a60 - float(function_60d95f53()) / 1000;
            if (var_43b42a60 <= 0) {
                self notify(#"ammo_reduction", {#weapon:w_curr});
                var_43b42a60 = 1;
            }
        } while (zm_utility::is_player_valid(self) && self attackbuttonpressed() && !self fragbuttonpressed());
        self clientfield::set("" + #"skull_turret_beam_fire", 0);
        self clientfield::set("" + #"hash_6635e6da6fcfe594", 0);
        self.var_1de56cc8 = undefined;
        self notify(#"stop_damage");
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x5 linked
// Checksum 0x69b35f8a, Offset: 0x12a0
// Size: 0xe8
function private function_4493c71b(weapon, n_lvl = 1) {
    self endon(#"hero_weapon_change", #"bled_out", #"disconnect");
    while (true) {
        if (n_lvl < 3) {
            self waittill(#"weapon_melee_power_left", #"weapon_melee");
        } else {
            self waittill(#"weapon_melee_power_left");
        }
        if (!zm_trial_restrict_loadout::function_5fbf572(weapon, 1)) {
            continue;
        }
        weapon thread scepter_melee(self);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x5 linked
// Checksum 0x6bfdc1e6, Offset: 0x1390
// Size: 0xca
function private function_eae0296b(str_level, b_postfx = 0) {
    if (b_postfx) {
        self clientfield::increment_to_player("" + #"hash_2964d1cb7c4bd175");
    }
    self.var_a0a1475c = 1;
    self notify(#"hash_11d4cfae418fcfe1");
    switch (str_level) {
    case #"hero_scepter_lv3":
        self.var_5762241e = 35;
        break;
    default:
        self.var_5762241e = 30;
        break;
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x5 linked
// Checksum 0x6ba7e555, Offset: 0x1468
// Size: 0x16
function private function_89fc5431() {
    self.var_5762241e = undefined;
    self.var_a0a1475c = undefined;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x5 linked
// Checksum 0x891611d3, Offset: 0x1488
// Size: 0xa8
function private function_e874c3e1(weapon) {
    self endon(#"hero_weapon_change", #"death");
    while (true) {
        s_result = undefined;
        s_result = self waittill(#"weapon_melee");
        if (!zm_trial_restrict_loadout::function_5fbf572(weapon)) {
            continue;
        }
        if (s_result.weapon == weapon) {
            self thread function_b603ab34(weapon);
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x5 linked
// Checksum 0xd53b807a, Offset: 0x1538
// Size: 0x20
function private blood_death_fx(var_14ef0a6c) {
    if (self.archetype == "zombie") {
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0x5eb9500f, Offset: 0x1560
// Size: 0x7c
function function_fe3f086c(e_target, weapon = level.weaponnone) {
    if (isactor(e_target)) {
        self chop_actor(e_target, weapon);
        return;
    }
    self function_5e2c9b64(e_target, weapon);
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0x2376f3af, Offset: 0x15e8
// Size: 0x254
function chop_actor(e_target, weapon = level.weaponnone) {
    self endon(#"hero_weapon_change", #"bled_out", #"disconnect");
    if (!isalive(e_target)) {
        return;
    }
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
        n_damage = int(e_target.maxhealth * 0.25);
        break;
    case #"miniboss":
        n_damage = int(e_target.maxhealth * 0.15);
        break;
    case #"boss":
        n_damage = 3000;
        break;
    }
    if (n_damage >= e_target.health) {
        e_target.ignoremelee = 1;
    }
    e_target thread zm_hero_weapon::function_acee2761();
    [[ level.var_cfeea502 ]]->waitinqueue(e_target);
    if (isalive(e_target)) {
        e_target dodamage(n_damage, self.origin, self, self, "none", "MOD_MELEE", 0, weapon);
        e_target blood_death_fx();
    }
    util::wait_network_frame();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0x9e69287, Offset: 0x1848
// Size: 0x7c
function function_5e2c9b64(e_target, weapon) {
    e_target endon(#"death");
    [[ level.var_cfeea502 ]]->waitinqueue(e_target);
    e_target dodamage(3000, self.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xd965bf7b, Offset: 0x18d0
// Size: 0x2e6
function melee_zombies(weapon = level.weaponnone) {
    view_pos = self getweaponmuzzlepoint();
    forward_view_angles = self getweaponforwarddir();
    var_537e767d = 130 * 130;
    self clientfield::increment("" + #"zombie_scepter_melee");
    a_e_targets = zm_hero_weapon::function_7c3681f7();
    var_f3edb3a6 = 0;
    foreach (e_target in a_e_targets) {
        if (!isdefined(e_target) || !isalive(e_target)) {
            continue;
        }
        test_origin = e_target getcentroid();
        dist_sq = distancesquared(view_pos, test_origin);
        dist_to_check = var_537e767d;
        if (dist_sq > dist_to_check) {
            continue;
        }
        normal = vectornormalize(test_origin - view_pos);
        dot = vectordot(forward_view_angles, normal);
        if (dot <= 0) {
            continue;
        }
        if (0 == e_target damageconetrace(view_pos, self)) {
            continue;
        }
        e_target.chopped = 1;
        if (!var_f3edb3a6) {
            self clientfield::increment("" + #"hash_70c8a5d240e431ec");
            var_f3edb3a6 = 1;
        }
        if (isdefined(e_target.var_73973410)) {
            self thread [[ e_target.var_73973410 ]](e_target, self, weapon);
        } else {
            self thread scepter_rumble(3);
            self thread function_fe3f086c(e_target, weapon);
        }
        waitframe(1);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x7335183, Offset: 0x1bc0
// Size: 0x3c
function scepter_melee(player) {
    player thread scepter_rumble(2);
    player thread melee_zombies(self);
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x0
// Checksum 0x1a6ee741, Offset: 0x1c08
// Size: 0x60
function reflect_shot(d, n) {
    perp = 2 * vectordot(d, n);
    var_50ffa80c = d - perp * n;
    return var_50ffa80c;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x31dd69bd, Offset: 0x1c70
// Size: 0x6b4
function function_be8ae52f(w_curr) {
    self endon(#"death", #"stop_damage");
    switch (w_curr.name) {
    case #"hero_scepter_lv2":
        n_base_damage = 150;
        var_c4d00e65 = 0.07;
        break;
    case #"hero_scepter_lv3":
        n_base_damage = 200;
        var_c4d00e65 = 0.1;
        break;
    default:
        n_base_damage = 100;
        var_c4d00e65 = 0.05;
        break;
    }
    self thread function_254a7556();
    while (true) {
        var_24bae834 = 0;
        v_position = self getweaponmuzzlepoint();
        v_forward = self getweaponforwarddir();
        if (isdefined(level.var_1f1de1ef) && level.var_1f1de1ef) {
            a_trace = bullettrace(v_position, v_position + v_forward * 20000, 1, self);
        } else {
            a_trace = beamtrace(v_position, v_position + v_forward * 20000, 1, self);
        }
        var_1c218ece = a_trace[#"position"];
        /#
            function_7067b673(v_position, var_1c218ece, (1, 1, 0));
            render_debug_sphere(v_position, (1, 1, 0));
            render_debug_sphere(var_1c218ece, (1, 0, 0));
        #/
        if (isdefined(a_trace[#"entity"])) {
            e_last_target = a_trace[#"entity"];
            if (isdefined(e_last_target.var_6f84b820) && e_last_target.team !== #"allies") {
                if (zm_trial_restrict_loadout::is_active(1)) {
                    self zm_trial_util::function_97444b02();
                    return;
                }
                if (!isdefined(e_last_target.maxhealth)) {
                    e_last_target.maxhealth = e_last_target.health;
                }
                switch (e_last_target.var_6f84b820) {
                case #"heavy":
                case #"miniboss":
                    if (isalive(e_last_target) & !(isdefined(e_last_target.var_25cb9682) && e_last_target.var_25cb9682)) {
                        if (!isdefined(e_last_target.var_1b6dab30)) {
                            e_last_target.var_1b6dab30 = self;
                        }
                        e_last_target thread function_97429d68(3);
                    }
                    n_damage = e_last_target.maxhealth * 0.02;
                    break;
                case #"boss":
                    n_damage = 100;
                    break;
                case #"popcorn":
                    n_damage = e_last_target.health + 100;
                    break;
                default:
                    n_percent_health = var_c4d00e65 * e_last_target.health;
                    n_damage = max(n_percent_health, n_base_damage);
                    if (isactor(e_last_target) && !(isdefined(e_last_target.var_61435d9) && e_last_target.var_61435d9) && !zm_trial_restrict_loadout::is_active(1)) {
                        e_last_target.var_4857363e = 1;
                        e_last_target thread function_75e6e51c(5, self);
                    }
                    break;
                }
                self scepter_rumble(6);
                self thread function_b67b2aff(e_last_target, n_damage, var_1c218ece, w_curr);
            } else if (isplayer(e_last_target)) {
                e_last_target thread function_1f6199f0(self);
            }
        } else {
            var_24bae834 = 0;
            switch (a_trace[#"surfacetype"]) {
            case #"glasscar":
            case #"rock":
            case #"metal":
            case #"metalcar":
            case #"glass":
                var_24bae834 = 1;
                var_7a585212 = "reflective_geo";
                break;
            }
        }
        level notify(#"hash_3e0895cd0cc16d2d", {#player:self});
        self notify(#"hash_3e0895cd0cc16d2d");
        e_last_target = undefined;
        waitframe(1);
        if (isdefined(level.var_2e32e0bb)) {
            level notify(#"hero_weapon_hit", {#player:self, #e_entity:a_trace[#"entity"], #var_80e17549:self.currentweapon, #v_position:a_trace[#"position"]});
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 6, eflags: 0x5 linked
// Checksum 0xe0aefd1c, Offset: 0x2330
// Size: 0x29c
function private function_b67b2aff(e_target, n_damage, v_target_pos, w_hero, b_launched = 0, var_9a119ceb = 0) {
    e_target endon(#"death");
    self endon(#"disconnect");
    if (!var_9a119ceb) {
        [[ level.var_cfeea502 ]]->waitinqueue(e_target);
    }
    if (e_target.archetype === #"zombie") {
        str_hitloc = "torso_lower";
        str_tag = e_target get_closest_tag(v_target_pos);
        if (str_tag === "j_head") {
            str_hitloc = "head";
        }
    } else {
        str_hitloc = "head";
    }
    if (isdefined(level.headshots_only) && level.headshots_only && str_hitloc !== "head") {
        return;
    }
    if (isalive(e_target)) {
        e_target dodamage(int(n_damage), v_target_pos, self, self, str_hitloc, "MOD_BURNED", 0, w_hero);
    }
    if (b_launched && (e_target.var_6f84b820 === #"basic" || e_target.var_6f84b820 === #"enhanced")) {
        n_random_x = randomfloatrange(-3, 3);
        n_random_y = randomfloatrange(-3, 3);
        v_fling = 200 * vectornormalize(e_target.origin - v_target_pos + (n_random_x, n_random_y, 100));
        e_target zm_utility::function_ffc279(v_fling, self, undefined, w_hero);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x5 linked
// Checksum 0x32a43911, Offset: 0x25d8
// Size: 0x1ca
function private get_closest_tag(v_pos) {
    if (!isdefined(level.gib_tags)) {
        zombie_utility::init_gib_tags();
    }
    tag_closest = undefined;
    var_9aabd9de = arraycopy(level.gib_tags);
    if (!isdefined(var_9aabd9de)) {
        var_9aabd9de = [];
    } else if (!isarray(var_9aabd9de)) {
        var_9aabd9de = array(var_9aabd9de);
    }
    if (!isinarray(var_9aabd9de, "j_head")) {
        var_9aabd9de[var_9aabd9de.size] = "j_head";
    }
    for (i = 0; i < var_9aabd9de.size; i++) {
        if (!isdefined(tag_closest)) {
            tag_closest = var_9aabd9de[i];
            continue;
        }
        var_abe265db = self gettagorigin(var_9aabd9de[i]);
        var_2cd7818f = self gettagorigin(tag_closest);
        if (!isdefined(var_abe265db) || !isdefined(var_2cd7818f)) {
            continue;
        }
        if (distancesquared(v_pos, var_abe265db) < distancesquared(v_pos, var_2cd7818f)) {
            tag_closest = var_9aabd9de[i];
        }
    }
    return tolower(tag_closest);
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0xef3ee162, Offset: 0x27b0
// Size: 0x68
function function_254a7556() {
    self endon(#"disconnect", #"laststand", #"stop_damage");
    while (true) {
        self thread scepter_rumble(5);
        wait(0.5);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x9e2ad778, Offset: 0x2820
// Size: 0xb6
function function_fa0a1b19() {
    if (!isdefined(self.var_84f67244)) {
        self.var_84f67244 = [];
    }
    s_revive_override = self zm_laststand::register_revive_override(&function_d5c9a81);
    if (!isdefined(self.var_84f67244)) {
        self.var_84f67244 = [];
    } else if (!isarray(self.var_84f67244)) {
        self.var_84f67244 = array(self.var_84f67244);
    }
    self.var_84f67244[self.var_84f67244.size] = s_revive_override;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x65b5539, Offset: 0x28e0
// Size: 0x124
function reset_override(s_params) {
    if (self != level) {
        if (isdefined(s_params)) {
            e_revivee = s_params.e_revivee;
        } else {
            e_revivee = self;
        }
        e_revivee endon(#"death");
        e_revivee.get_revive_time = undefined;
        e_revivee.var_84280a99 = undefined;
        val::reset(#"zm_weap_scepter", "disable_health_regen_delay");
        e_revivee.var_4fc8bf2a = undefined;
        wait(0.2);
        e_revivee.var_fbc66a96 = undefined;
        if (e_revivee clientfield::get("" + #"zombie_scepter_revive")) {
            if (isdefined(e_revivee)) {
                e_revivee clientfield::set("" + #"zombie_scepter_revive", 0);
            }
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x47ec3c0f, Offset: 0x2a10
// Size: 0x1f0
function function_37946a1d(s_params) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player.n_level = player clientfield::get("" + #"hash_6635e6da6fcfe594");
        if (player.n_level) {
            player clientfield::set("" + #"hash_6635e6da6fcfe594", 0);
        }
    }
    waitframe(1);
    foreach (player in level.players) {
        if (zm_utility::is_player_valid(player) && isdefined(player.var_1de56cc8) && player.var_1de56cc8 && isdefined(player.n_level)) {
            player clientfield::set("" + #"hash_6635e6da6fcfe594", player.n_level);
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xf8fad3f3, Offset: 0x2c08
// Size: 0x1b8
function function_d5c9a81(e_revivee) {
    if (!isdefined(e_revivee.revivetrigger)) {
        return false;
    }
    if (!isalive(self)) {
        return false;
    }
    if (isdefined(e_revivee.var_4fc8bf2a) && e_revivee.var_4fc8bf2a) {
        return true;
    }
    if (self laststand::player_is_in_laststand() && !isdefined(self.var_6d772cb)) {
        return false;
    }
    if (self.team != e_revivee.team) {
        return false;
    }
    if (isdefined(self.is_zombie) && self.is_zombie) {
        return false;
    }
    if (isdefined(self.var_7b2f6755) && self.var_7b2f6755) {
        return false;
    }
    if (isdefined(level.can_revive_use_depthinwater_test) && level.can_revive_use_depthinwater_test && e_revivee depthinwater() > 10) {
        return true;
    }
    if (isdefined(level.can_revive) && ![[ level.can_revive ]](e_revivee)) {
        return false;
    }
    if (isdefined(level.var_1461fd14) && ![[ level.var_1461fd14 ]](e_revivee)) {
        return false;
    }
    if (e_revivee zm_player::in_kill_brush() || !e_revivee zm_player::in_enabled_playable_area()) {
        return false;
    }
    return false;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x99021d5e, Offset: 0x2dc8
// Size: 0x18c
function function_1f6199f0(e_reviver) {
    self endon(#"disconnect");
    self notify("7e2848503b1eac4d");
    self endon("7e2848503b1eac4d");
    if (self laststand::player_is_in_laststand() && !(isdefined(self.var_ea7ea155) && self.var_ea7ea155)) {
        self function_fa095da6(e_reviver);
    } else {
        val::set(#"zm_weap_scepter", "disable_health_regen_delay", 1);
        if (self.health < self.var_66cb03ad) {
            n_health_regen = int(self.health + 5);
            self.health = math::clamp(n_health_regen, 1, self.var_66cb03ad);
            self clientfield::increment("" + #"zombie_scepter_heal", 1);
            e_reviver.var_ec334996 = e_reviver.var_ec334996 + 1;
        }
    }
    waitframe(1);
    val::reset(#"zm_weap_scepter", "disable_health_regen_delay");
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xbff9b49e, Offset: 0x2f60
// Size: 0xfc
function function_fa095da6(e_reviver) {
    if (!(isdefined(self.var_4fc8bf2a) && self.var_4fc8bf2a) && !(isdefined(self.var_7b2f6755) && self.var_7b2f6755)) {
        if (self != e_reviver) {
            e_reviver.var_ec334996 = e_reviver.var_ec334996 + 100;
            e_reviver zm_stats::increment_challenge_stat(#"scepter_revives", undefined, 1);
        }
        self.get_revive_time = &override_revive_time;
        self.var_84280a99 = e_reviver;
        self.var_4fc8bf2a = 1;
        self.var_fbc66a96 = 1;
        self clientfield::set("" + #"zombie_scepter_revive", 1);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x2d73e606, Offset: 0x3068
// Size: 0x62
function override_revive_time(e_revivee) {
    n_time = 3;
    if (self hasperk(#"specialty_quickrevive")) {
        n_time = n_time / 4;
    } else {
        n_time = n_time / 2;
    }
    return n_time;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xfcbeca49, Offset: 0x30d8
// Size: 0x206
function function_97429d68(n_time = 5) {
    self endon(#"death");
    self notify("67db915a1a3257ee");
    self endon("67db915a1a3257ee");
    if (isdefined(self.aat_turned) && self.aat_turned) {
        return;
    }
    self.var_25cb9682 = 1;
    if (n_time == 5) {
        if (self.var_6f84b820 === #"heavy" || self.var_6f84b820 === #"miniboss") {
            self thread namespace_9ff9f642::slowdown(#"hash_1cc2b03094ad09bd");
        } else {
            self thread namespace_9ff9f642::slowdown(#"hash_6c580f93aa40248d");
        }
    } else if (self.var_6f84b820 === #"heavy" || self.var_6f84b820 === #"miniboss") {
        self thread namespace_9ff9f642::slowdown(#"hash_449bc314b0c3da73");
    } else {
        self thread namespace_9ff9f642::slowdown(#"hash_6c580993aa401a5b");
    }
    self clientfield::set("" + #"zombie_scepter_stun", 1);
    wait(n_time);
    if (!(isdefined(self.var_693f4e69) && self.var_693f4e69)) {
        self clientfield::set("" + #"zombie_scepter_stun", 0);
    }
    self.var_25cb9682 = 0;
    self.var_1b6dab30 = undefined;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0x11e3f58d, Offset: 0x32e8
// Size: 0x1fe
function function_75e6e51c(n_time = 5, e_attacker) {
    self endon(#"hash_6b85fa3a80afb815", #"death");
    if (isdefined(self.aat_turned) && self.aat_turned) {
        return;
    }
    if (isdefined(self.var_61435d9) && self.var_61435d9) {
        return;
    }
    n_damage = ceil(self.maxhealth / n_time * 2 / 0.5);
    self.var_61435d9 = 1;
    if (n_time == 5) {
        self thread namespace_9ff9f642::slowdown(#"hash_6c580f93aa40248d");
    } else {
        self thread namespace_9ff9f642::slowdown(#"hash_6c580993aa401a5b");
    }
    self clientfield::set("" + #"zombie_scepter_stun", 1);
    for (x = 0; x < n_time / 0.5; x++) {
        wait(0.5);
        [[ level.var_cfeea502 ]]->waitinqueue(self);
        self dodamage(n_damage, self.origin, e_attacker, e_attacker);
    }
    self clientfield::set("" + #"zombie_scepter_stun", 0);
    self.var_61435d9 = 0;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x5 linked
// Checksum 0x52fa7b70, Offset: 0x34f0
// Size: 0x19c
function private function_717a1af2() {
    self endon(#"bled_out", #"death", #"beacon_expired");
    w_beacon = getweapon(#"hero_scepter_lv3");
    self function_1728db6f(0);
    self.var_d6fe2916 = 0;
    self.disable_hero_power_charging = 0;
    self.var_d8eb19f5 = 0;
    self thread reset_after_bleeding_out();
    do {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"hash_4078956b159dd0f3");
    } while (s_waitresult.weapon != w_beacon);
    if (isdefined(self.var_165b5fce)) {
        self gadgetpowerset(self gadgetgetslot(w_beacon), self.var_165b5fce);
        self.saved_spike_power = undefined;
    } else {
        self gadgetpowerset(self gadgetgetslot(w_beacon), 100);
    }
    self.var_b4e3db6c = undefined;
    self thread weapon_drop_watcher();
    self thread weapon_change_watcher();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x17c911e4, Offset: 0x3698
// Size: 0x88
function weapon_drop_watcher() {
    self endon(#"disconnect");
    while (true) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"weapon_switch_started");
        if (zm_loadout::is_hero_weapon(s_waitresult.w_current)) {
            self setweaponammoclip(s_waitresult.w_current, 0);
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x59b0c26d, Offset: 0x3728
// Size: 0x86
function weapon_change_watcher() {
    self endon(#"disconnect");
    while (true) {
        s_waitresult = undefined;
        s_waitresult = self waittill(#"hero_weapon_change");
        if (isdefined(s_waitresult.w_previous) && zm_loadout::is_hero_weapon(s_waitresult.w_current)) {
            self.var_7e973e30 = s_waitresult.w_previous;
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x84dc9735, Offset: 0x37b8
// Size: 0x1bc
function reset_after_bleeding_out() {
    self endon(#"disconnect");
    w_beacon = getweapon(#"hero_scepter_lv3");
    if (isdefined(self.var_8a5094fe) && self.var_8a5094fe) {
        util::wait_network_frame();
        self zm_weapons::weapon_give(w_beacon, 0, 1);
        self function_1728db6f(2);
    }
    self waittill(#"bled_out");
    if (self hasweapon(w_beacon)) {
        self.var_8a5094fe = 1;
        self.var_3d89e839 = self gadgetpowerget(self gadgetgetslot(w_beacon));
        if (self.var_3d89e839 >= 100) {
            self.var_3d89e839 = undefined;
        }
        self.var_4831c9c9[#"hero_scepter_lv3"] = self getweaponammoclip(w_beacon);
    }
    if (isdefined(self.var_b4e3db6c)) {
        zm_unitrigger::unregister_unitrigger(self.var_b4e3db6c);
        self.var_b4e3db6c = undefined;
    }
    self waittill(#"spawned_player");
    self thread function_717a1af2();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x4df6b3c1, Offset: 0x3980
// Size: 0x4e
function function_22bebb6b() {
    if (isdefined(level.var_2358785f)) {
        return self [[ level.var_2358785f ]]();
    } else if (ispointonnavmesh(self.origin, self)) {
        return 1;
    }
    return 0;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xe90289c7, Offset: 0x39d8
// Size: 0x38e
function function_b603ab34(w_beacon) {
    self endoncallback(&function_d14a3750, #"disconnect");
    level scene::function_27f5972e(#"p8_fxanim_zm_zod_staff_ra_bundle");
    waitframe(14);
    self thread scepter_rumble(4);
    waitframe(1);
    if (!isdefined(self)) {
        level scene::function_f81475ae(#"p8_fxanim_zm_zod_staff_ra_bundle");
        return;
    }
    if (self function_22bebb6b()) {
        v_forward = anglestoforward(self.angles);
        v_spawn_pos = self.origin + vectorscale((0, 0, 1), 32);
        a_trace = physicstraceex(v_spawn_pos, v_spawn_pos + v_forward * 24, vectorscale((-1, -1, -1), 16), vectorscale((1, 1, 1), 16), self);
        v_spawn_pos = v_spawn_pos + v_forward * a_trace[#"fraction"] * 24;
        var_4eaa1f4c = util::ground_position(v_spawn_pos, 1000, 12);
    } else {
        var_4eaa1f4c = self.origin + vectorscale((0, 0, 1), 12);
    }
    playrumbleonposition("grenade_rumble", self.origin);
    self function_f67f53a7(var_4eaa1f4c);
    self thread beacon_fx_on();
    self thread zm_hero_weapon::function_4e984e83(w_beacon, 0.13);
    self thread beacon_loop(w_beacon, var_4eaa1f4c);
    self.var_6d772cb = self.var_6afa034c;
    self.var_d6fe2916 = 1;
    var_1c136516 = self gadgetpowerget(level.var_a53a05b5);
    if (var_1c136516 > 5) {
        self thread function_d3dc001e(w_beacon);
        zm_utility::function_3e549e65();
        self waittill(#"beacon_off", #"beacon_retrieved", #"death", #"destroy_beacon");
        zm_utility::function_b7e5029f();
    }
    if (isdefined(self)) {
        self thread function_f168b337();
        self notify(#"beacon_retrieved");
        self ability_player::function_f2250880(w_beacon);
        self.var_6d772cb = undefined;
        self.var_d6fe2916 = 0;
        self.disable_hero_power_charging = 0;
        self notify(#"destroy_beacon");
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xfd6d4bbe, Offset: 0x3d70
// Size: 0x34
function function_d14a3750(var_c34665fc) {
    if (isdefined(self.var_d6fe2916) && self.var_d6fe2916) {
        zm_utility::function_b7e5029f();
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x88aaa125, Offset: 0x3db0
// Size: 0xd2
function function_d3dc001e(w_beacon) {
    self endoncallback(&function_e7e5d6f5, #"beacon_retrieved", #"death");
    self.var_80612bea = 1;
    while (true) {
        slot = self gadgetgetslot(w_beacon);
        n_power = self gadgetpowerget(slot);
        if (n_power <= 0) {
            break;
        }
        waitframe(1);
    }
    self notify(#"beacon_off");
    self.var_80612bea = 0;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xc1206199, Offset: 0x3e90
// Size: 0x32
function function_e7e5d6f5(_hash) {
    if (isdefined(self)) {
        self notify(#"beacon_off");
        self.var_80612bea = 0;
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x1c8a3526, Offset: 0x3ed0
// Size: 0x12c
function function_f67f53a7(var_4eaa1f4c) {
    if (!isdefined(self.var_6afa034c)) {
        self.var_6afa034c = util::spawn_model(#"p8_fxanim_zm_zod_staff_ra_mod", var_4eaa1f4c);
    }
    self playsound(#"hash_178614dae860a551");
    self.var_6afa034c notsolid();
    self.var_6afa034c show();
    waitframe(1);
    if (!zm_trial_restrict_loadout::is_active(1)) {
        self.var_6afa034c thread beacon_smash(self);
    }
    self.var_6afa034c thread scene::play(#"p8_fxanim_zm_zod_staff_ra_bundle", self.var_6afa034c);
    if (isdefined(level.var_64ee6f9)) {
        [[ level.var_64ee6f9 ]](self.var_6afa034c);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x23ee0d9e, Offset: 0x4008
// Size: 0x246
function beacon_smash(player) {
    a_ai_zombies = array::get_all_closest(self.origin, getaiteamarray(level.zombie_team), undefined, undefined, 240);
    a_ai_zombies = array::filter(a_ai_zombies, 0, &function_39c07);
    foreach (zombie in a_ai_zombies) {
        launch = isdefined(zombie.var_2f68be48) && zombie.var_2f68be48;
        if (isdefined(zombie.var_6f84b820)) {
            switch (zombie.var_6f84b820) {
            case #"popcorn":
            case #"basic":
            case #"enhanced":
                player thread function_b67b2aff(zombie, zombie.health, self.origin, level.hero_weapon[#"scepter"][2], launch);
                break;
            case #"heavy":
            case #"miniboss":
                if (isalive(zombie) & !(isdefined(zombie.var_25cb9682) && zombie.var_25cb9682)) {
                    if (!isdefined(zombie.var_1b6dab30)) {
                        zombie.var_1b6dab30 = player;
                    }
                    zombie thread function_97429d68(3);
                }
                break;
            }
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0xc2285efe, Offset: 0x4258
// Size: 0x54
function beacon_fx_on() {
    self.var_6afa034c clientfield::set("" + #"beacon_fx", 1);
    self thread beacon_rumble();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x2cce6b4f, Offset: 0x42b8
// Size: 0x34
function beacon_fx_off() {
    if (isdefined(self)) {
        self clientfield::set("" + #"beacon_fx", 0);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x28da2205, Offset: 0x42f8
// Size: 0x68
function beacon_rumble() {
    self endon(#"disconnect", #"beacon_fx_off");
    while (isdefined(self.var_6afa034c)) {
        self.var_6afa034c playrumbleonentity(#"hash_2bdce8ff08474d57");
        wait(0.5);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x829ede99, Offset: 0x4368
// Size: 0x164
function function_f168b337() {
    if (isdefined(self.var_6afa034c)) {
        var_6afa034c = self.var_6afa034c;
    } else {
        return;
    }
    foreach (e_player in level.players) {
        if (isdefined(e_player.var_bbff3b76)) {
            arrayremovevalue(e_player.var_bbff3b76, var_6afa034c);
        }
    }
    var_6afa034c endon(#"death");
    var_6afa034c beacon_fx_off();
    var_6afa034c thread scene::stop(#"p8_fxanim_zm_zod_staff_ra_bundle");
    waitframe(1);
    var_6afa034c delete();
    if (!isdefined(self)) {
        return;
    }
    self notify(#"beacon_fx_off");
    self function_1728db6f(4);
    self function_eae0296b(#"hero_scepter_lv3");
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0xe92ef4f8, Offset: 0x44d8
// Size: 0x180
function beacon_loop(w_beacon, var_4eaa1f4c) {
    self endon(#"beacon_retrieved", #"death", #"bled_out", #"disconnect");
    while (true) {
        slot = self gadgetgetslot(w_beacon);
        if (self gadgetpowerget(slot) > 0) {
            array::thread_all(level.players, &function_888d5bd9, self);
            if (!zm_trial_restrict_loadout::is_active(1)) {
                n_frame = self function_15c2525e(var_4eaa1f4c, 0.25);
                var_adaf2ccb = math::clamp(0.25 - n_frame * 0.05, 0.05, 0.25);
            }
        } else if (true) {
            return;
        }
        if (!isdefined(var_adaf2ccb)) {
            var_adaf2ccb = 0.25;
        }
        wait(var_adaf2ccb);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xcdd0382b, Offset: 0x4660
// Size: 0x46
function function_39c07(ai_enemy) {
    b_callback_result = 1;
    if (isdefined(level.var_93b9a0db)) {
        b_callback_result = [[ level.var_93b9a0db ]](ai_enemy);
    }
    return b_callback_result;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0x270e7342, Offset: 0x46b0
// Size: 0x15a
function function_15c2525e(var_a7e57ef9, n_loop_time) {
    self endon(#"disconnect");
    a_ai_zombies = zm_hero_weapon::function_7c3681f7();
    a_ai_zombies = array::get_all_closest(var_a7e57ef9, a_ai_zombies, undefined, undefined, 240);
    a_ai_zombies = array::filter(a_ai_zombies, 0, &function_39c07);
    n_count = 0;
    n_frames = 0;
    foreach (zombie in a_ai_zombies) {
        zombie beacon_check(self, var_a7e57ef9, n_loop_time);
        n_count++;
        if (n_count == 4) {
            waitframe(1);
            n_count = 0;
            n_frames++;
        }
    }
    return n_frames;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 3, eflags: 0x1 linked
// Checksum 0xc933c4b4, Offset: 0x4818
// Size: 0x2bc
function beacon_check(e_player, var_a7e57ef9, n_loop_time) {
    e_player endon(#"beacon_retrieved", #"bled_out", #"death", #"disconnect");
    if (isalive(self) && isdefined(self.var_6f84b820)) {
        switch (self.var_6f84b820) {
        case #"heavy":
        case #"miniboss":
            n_damage = self.maxhealth * 0.08 * n_loop_time;
            break;
        case #"boss":
            n_damage = 100;
            break;
        case #"popcorn":
            n_damage = self.health + 100;
            break;
        default:
            n_max_health = isdefined(self.maxhealth) ? self.maxhealth : level.zombie_health;
            n_damage = ceil(n_max_health / 10 / n_loop_time);
            break;
        }
        if (!isdefined(self.var_1b6dab30) || self.var_1b6dab30 == e_player) {
            e_player thread function_b67b2aff(self, n_damage, var_a7e57ef9, level.hero_weapon[#"scepter"][2]);
        }
        if ((self.var_6f84b820 === #"basic" || self.var_6f84b820 === #"enhanced") && isalive(self) && isactor(self) && !(isdefined(self.var_25cb9682) && self.var_25cb9682) && !self function_dd070839()) {
            if (!isdefined(self.var_1b6dab30)) {
                self.var_1b6dab30 = e_player;
            }
            self thread function_97429d68();
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 3, eflags: 0x1 linked
// Checksum 0xe710bc21, Offset: 0x4ae0
// Size: 0xb2
function check_for_range_and_los(v_attack_source, n_allowed_z_diff, n_radius_sq) {
    if (isalive(self)) {
        n_z_diff = self.origin[2] - v_attack_source[2];
        if (!isdefined(n_allowed_z_diff) || abs(n_z_diff) < n_allowed_z_diff) {
            if (distancesquared(self.origin, v_attack_source) < n_radius_sq) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x54760f69, Offset: 0x4ba0
// Size: 0x224
function function_888d5bd9(e_player) {
    e_player endon(#"beacon_retrieved", #"bled_out", #"death");
    /#
        assert(isdefined(e_player));
    #/
    var_2a0066d5 = 57600;
    var_a7e57ef9 = e_player.var_6afa034c.origin;
    if (!isalive(self)) {
        return;
    }
    if (self check_for_range_and_los(var_a7e57ef9, undefined, var_2a0066d5)) {
        self thread function_4451b45f();
        if (self laststand::player_is_in_laststand()) {
            self function_fa095da6(e_player);
        }
        if (!isdefined(self.var_bbff3b76)) {
            self.var_bbff3b76 = [];
        } else if (!isarray(self.var_bbff3b76)) {
            self.var_bbff3b76 = array(self.var_bbff3b76);
        }
        if (!isinarray(self.var_bbff3b76, e_player.var_6afa034c)) {
            self.var_bbff3b76[self.var_bbff3b76.size] = e_player.var_6afa034c;
        }
        return;
    }
    if (isdefined(self.var_bbff3b76) && isinarray(self.var_bbff3b76, e_player.var_6afa034c)) {
        arrayremovevalue(self.var_bbff3b76, e_player.var_6afa034c);
        self reset_override();
        self function_89fc5431();
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xff951297, Offset: 0x4dd0
// Size: 0x36
function function_3a00c0a6(perk) {
    self thread zm_perks::function_b2dfd295(perk, &function_cd010531);
    return false;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x1 linked
// Checksum 0x51d2cd5d, Offset: 0x4e10
// Size: 0x72
function function_cd010531(e_reviver, var_84280a99) {
    if (isdefined(self.var_fbc66a96) && self.var_fbc66a96) {
        return 1;
    }
    if (self clientfield::get("" + #"zombie_scepter_revive")) {
        return 1;
    }
    return function_6dfa3b7a();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x6929d3f2, Offset: 0x4e90
// Size: 0x74
function function_4451b45f() {
    self endon(#"disconnect");
    self notify("50c5b852bd6ed496");
    self endon("50c5b852bd6ed496");
    self function_eae0296b(#"hero_scepter_lv2");
    wait(0.3);
    self function_89fc5431();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xfc58df02, Offset: 0x4f10
// Size: 0x9c
function function_cc91b3fe(e_attacker) {
    if (!isactor(self) || !isvehicle(self)) {
        return;
    }
    if (self clientfield::get("" + #"zombie_scepter_stun")) {
        self clientfield::set("" + #"zombie_scepter_stun", 0);
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x277fbb1a, Offset: 0x4fb8
// Size: 0x1c
function on_player_disconnect() {
    self thread function_f168b337();
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x8255b649, Offset: 0x4fe0
// Size: 0x1a
function function_1728db6f(var_6554d141) {
    self.var_6adb7c8f = var_6554d141;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 0, eflags: 0x1 linked
// Checksum 0x443399, Offset: 0x5008
// Size: 0x1a
function function_6dfa3b7a() {
    return isdefined(self.var_bbff3b76) && self.var_bbff3b76.size;
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 2, eflags: 0x0
// Checksum 0x7a0a6b81, Offset: 0x5030
// Size: 0x6c
function render_debug_sphere(origin, color) {
    if (getdvarint(#"turret_debug_server", 0)) {
        /#
            sphere(origin, 2, color, 0.75, 1, 10, 100);
        #/
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 3, eflags: 0x0
// Checksum 0xd69286e9, Offset: 0x50a8
// Size: 0x6c
function function_7067b673(origin1, origin2, color) {
    if (getdvarint(#"turret_debug_server", 0)) {
        /#
            line(origin1, origin2, color, 0.75, 1, 100);
        #/
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0x26799781, Offset: 0x5120
// Size: 0x182
function scepter_rumble(var_b2e05bae) {
    if (var_b2e05bae) {
        switch (var_b2e05bae) {
        case 1:
            self playrumbleonentity("zm_weap_special_activate_rumble");
            break;
        case 2:
            self clientfield::increment_to_player("" + #"scepter_rumble", 2);
            break;
        case 3:
            self playrumbleonentity("zm_weap_scepter_melee_hit_rumble");
            break;
        case 4:
            playrumbleonposition("zm_weap_scepter_plant_rumble", self.origin);
            break;
        case 5:
            self clientfield::increment_to_player("" + #"scepter_rumble", 5);
            break;
        case 6:
            self clientfield::increment_to_player("" + #"scepter_rumble", 6);
            break;
        }
    }
}

// Namespace zm_weap_scepter/zm_weap_scepter
// Params 1, eflags: 0x1 linked
// Checksum 0xd00820f4, Offset: 0x52b0
// Size: 0xac
function function_68ff89f7(w_scepter) {
    self endon(#"hero_weapon_change", #"disconnect", #"bled_out");
    s_result = undefined;
    s_result = self waittill(#"weapon_melee");
    if (s_result.weapon == w_scepter) {
        self thread zm_audio::create_and_play_dialog(#"hero_level_3", #"scepter");
    }
}

