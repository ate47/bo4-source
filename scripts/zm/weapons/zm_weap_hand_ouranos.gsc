#using scripts\core_common\throttle_shared;
#using scripts\zm\zm_lightning_chain;
#using scripts\zm\zm_red_ww_quests;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_net;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_hero_weapon;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_armor;
#using scripts\zm_common\callbacks;
#using script_24c32478acf44108;
#using scripts\core_common\serverfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\struct;
#using scripts\core_common\flag_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\ai_shared;
#using scripts\abilities\ability_player;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai\systems\gib;

#namespace zm_weap_hand_ouranos;

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x2
// Checksum 0x9320a169, Offset: 0x200
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_hand_ouranos", &__init__, undefined, undefined);
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x1e3670af, Offset: 0x248
// Size: 0x42a
function __init__() {
    clientfield::register("scriptmover", "ouranos_shoot", 16000, 1, "counter");
    clientfield::register("scriptmover", "ouranos_impact", 16000, 1, "counter");
    clientfield::register("allplayers", "" + #"hash_494799612e85ee2f", 16000, 1, "int");
    clientfield::register("allplayers", "" + #"hash_4fb73e88d45af0ef", 16000, 1, "int");
    clientfield::register("actor", "" + #"hash_c5b1d12b0fd3651", 16000, getminbitcountfornum(3), "int");
    clientfield::register("actor", "" + #"hash_28af05433c1d1a2e", 16000, 1, "counter");
    serverfield::register("ouranos_feather_hit", 16000, getminbitcountfornum(3), "int", &ouranos_feather_hit);
    level.w_hand_ouranos = getweapon(#"ww_hand_o");
    level.w_hand_ouranos_charged = getweapon(#"ww_hand_o_charged");
    level.w_hand_ouranos_uncharged = getweapon(#"ww_hand_o_uncharged");
    level.w_hand_ouranos_upgraded = getweapon(#"ww_hand_o_upgraded");
    zm_weapons::include_zombie_weapon(#"ww_hand_o", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_o_charged", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_o_uncharged", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_o_upgraded", 0);
    callback::on_connect(&on_player_connect);
    if (!isdefined(level.var_3aa60558)) {
        level.var_3aa60558 = new throttle();
        [[ level.var_3aa60558 ]]->initialize(6, 0.1);
    }
    namespace_9ff9f642::register_slowdown(#"hash_1e38c032f8b8621c", 0.7, 3);
    callback::add_weapon_fired(level.w_hand_ouranos, &function_10b4d6ac);
    callback::add_weapon_fired(level.w_hand_ouranos_charged, &function_dd7bc108);
    callback::add_weapon_fired(level.w_hand_ouranos_uncharged, &function_10b4d6ac);
    callback::add_weapon_fired(level.w_hand_ouranos_upgraded, &function_10b4d6ac);
    level.var_7d0d4a80 = [];
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x7dadb0b3, Offset: 0x680
// Size: 0x1c
function on_player_connect() {
    self thread function_3f8da82c();
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0xb59b919b, Offset: 0x6a8
// Size: 0x108
function function_3f8da82c() {
    self endon(#"disconnect");
    while (true) {
        s_notify = self waittill(#"weapon_change");
        if (s_notify.weapon === level.w_hand_ouranos_uncharged) {
            continue;
        }
        if (s_notify.weapon === level.w_hand_ouranos || s_notify.weapon === level.w_hand_ouranos_upgraded) {
            self.var_e34577ca = undefined;
            self thread function_54922a21();
            continue;
        }
        self clientfield::set("" + #"hash_4fb73e88d45af0ef", 0);
        self clientfield::set("" + #"hash_494799612e85ee2f", 0);
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0xec1a5e6b, Offset: 0x7b8
// Size: 0x34
function function_10b4d6ac(weapon) {
    self endon(#"death");
    self function_7e141cb5(weapon);
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x9adac435, Offset: 0x7f8
// Size: 0x316
function function_7e141cb5(weapon) {
    self endon(#"death");
    if (weapon == level.w_hand_ouranos_upgraded) {
        n_damage = 8500;
        b_up = 1;
    } else {
        n_damage = 5000;
        b_up = 0;
    }
    a_e_targets = function_56a040a5(b_up);
    if (isdefined(a_e_targets)) {
        if (isdefined(a_e_targets[0]) && a_e_targets[0].var_6f84b820 === #"boss") {
            n_proj = 3;
        } else if (!a_e_targets.size || a_e_targets.size === 1 && !isactor(a_e_targets[0])) {
            n_proj = 1;
        } else {
            n_proj = 3;
        }
    }
    for (i = 0; i < n_proj; i++) {
        e_projectile = util::spawn_model("tag_origin", self gettagorigin("tag_flash"), self gettagangles("tag_flash"));
        if (isdefined(e_projectile)) {
            e_projectile thread set_projectile(i);
            if (isdefined(a_e_targets) && isdefined(a_e_targets[i])) {
                self thread function_1fc2378f(e_projectile, a_e_targets[i], n_damage);
            } else if (i == 1 && isdefined(a_e_targets[i - 1])) {
                self thread function_1fc2378f(e_projectile, a_e_targets[i - 1], n_damage);
            } else if (i == 2) {
                if (isdefined(a_e_targets[i - 1])) {
                    self thread function_1fc2378f(e_projectile, a_e_targets[i - 1], n_damage);
                } else if (isdefined(a_e_targets[i - 2])) {
                    self thread function_1fc2378f(e_projectile, a_e_targets[i - 2], n_damage);
                }
            } else {
                self thread function_1fc2378f(e_projectile);
            }
        }
        wait 0.1;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x706ea7d2, Offset: 0xb18
// Size: 0xf2
function function_54922a21() {
    self endon(#"death", #"weapon_change");
    while (true) {
        while ((self.chargeshotlevel != 2 || !self attackbuttonpressed()) && (self.currentweapon === level.w_hand_ouranos || self.currentweapon === level.w_hand_ouranos_upgraded)) {
            waitframe(1);
        }
        self thread player_charged_shot(self.currentweapon);
        self waittill(#"weapon_fired", #"stop_beaming");
        while (self.chargeshotlevel >= 2) {
            waitframe(1);
        }
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x3cfb751, Offset: 0xc18
// Size: 0x3c
function function_dd7bc108(weapon) {
    if (!(isdefined(self.var_e34577ca) && self.var_e34577ca)) {
        self function_7e141cb5(weapon);
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x398e2644, Offset: 0xc60
// Size: 0x4ac
function function_56a040a5(b_up) {
    if (b_up) {
        n_range = 3000;
    } else {
        n_range = 2150;
    }
    view_pos = self geteye();
    forward_view_angles = anglestoforward(self getplayerangles());
    if (forward_view_angles[2] < -0.7) {
        var_ccb70dad = vectornormalize((forward_view_angles[0], forward_view_angles[1], -0.25));
    } else {
        var_ccb70dad = vectornormalize(forward_view_angles);
    }
    a_e_targets = function_3874b38f();
    a_e_valid = [];
    foreach (e_target in a_e_targets) {
        if (self is_valid_target(e_target, n_range) && !(isdefined(e_target.var_f9b38410) && e_target.var_f9b38410)) {
            a_e_valid[a_e_valid.size] = e_target;
        }
    }
    a_e_valid = array::get_all_closest(self.origin, a_e_valid);
    a_e_priority = [];
    foreach (e_target in a_e_valid) {
        if (isdefined(e_target.var_564012c4) && e_target.var_564012c4) {
            if (!isdefined(a_e_priority)) {
                a_e_priority = [];
            } else if (!isarray(a_e_priority)) {
                a_e_priority = array(a_e_priority);
            }
            a_e_priority[a_e_priority.size] = e_target;
        }
    }
    foreach (e_target in a_e_priority) {
        arrayremovevalue(a_e_valid, e_target);
        array::push_front(a_e_valid, e_target);
    }
    var_99588c0f = function_3ebebb9c();
    if (isdefined(var_99588c0f)) {
        var_99588c0f = array::remove_undefined(var_99588c0f);
        var_99588c0f = arraysortclosest(var_99588c0f, self.origin);
        foreach (e_target in var_99588c0f) {
            if (!self zm_utility::is_player_looking_at(e_target getcentroid(), 0.9, 0, self) && !self zm_utility::is_player_looking_at(e_target.origin, 0.9, 0, self)) {
                continue;
            }
            if (distance2dsquared(self.origin, e_target.origin) > n_range * n_range) {
                continue;
            }
            array::push_front(a_e_valid, e_target);
        }
    }
    return a_e_valid;
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 2, eflags: 0x1 linked
// Checksum 0x45210a36, Offset: 0x1118
// Size: 0x2ea
function is_valid_target(e_target, n_range) {
    if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return false;
    }
    if (isdefined(e_target.var_827f6f4a) && e_target.var_827f6f4a) {
        return false;
    }
    if (isdefined(e_target.marked_for_death) && e_target.marked_for_death) {
        return false;
    }
    if (distance2dsquared(self.origin, e_target.origin) <= 64 * 64 && (self zm_utility::is_player_looking_at(e_target getcentroid(), 0.3, 1, self) || self zm_utility::is_player_looking_at(e_target getcentroid() + (0, 0, 32), 0.3, 1, self))) {
        return true;
    }
    if (isdefined(e_target.fake_death) && e_target.fake_death) {
        return false;
    }
    if (!isalive(e_target)) {
        return false;
    }
    if (distance2dsquared(self.origin, e_target.origin) > n_range * n_range) {
        return false;
    }
    var_c060d2c8 = !(isdefined(level.var_58f509b6) && level.var_58f509b6);
    if (!self zm_utility::is_player_looking_at(e_target getcentroid(), 0.9, var_c060d2c8, self) && !self zm_utility::is_player_looking_at(e_target.origin, 0.9, var_c060d2c8, self) && !self zm_utility::is_player_looking_at(e_target getcentroid() + (0, 0, 28), 0.9, var_c060d2c8, self)) {
        return false;
    }
    v_org = self gettagorigin("j_head");
    if (isdefined(v_org) && self zm_utility::is_player_looking_at(v_org, 0.9, 1, self)) {
        return true;
    }
    return true;
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0xfee8c20d, Offset: 0x1410
// Size: 0x74
function set_projectile(n_index) {
    self endon(#"death");
    self.n_index = n_index;
    self setscale(0.05);
    wait 0.1;
    self clientfield::increment("ouranos_shoot");
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 3, eflags: 0x1 linked
// Checksum 0x25078bd9, Offset: 0x1490
// Size: 0x874
function function_1fc2378f(e_projectile, ai_zombie, n_damage) {
    e_projectile endon(#"death");
    self endon(#"disconnect");
    e_projectile thread projectile_timeout();
    v_end = self function_180bae11();
    n_dist = distance(e_projectile.origin, v_end);
    n_time = n_dist / 1500;
    if (n_time <= 0.1) {
        n_time = 0.1;
    }
    if (!isdefined(ai_zombie)) {
        e_projectile moveto(v_end, n_time);
        e_projectile waittill(#"movedone");
        e_projectile clientfield::increment("ouranos_impact");
        waitframe(1);
    } else {
        var_2ed6f142 = self getweaponmuzzlepoint();
        v_forward = self getweaponforwarddir();
        v_end = var_2ed6f142 + v_forward * 200;
        n_dist_sq = distance2dsquared(self.origin, v_end);
        if (isdefined(ai_zombie) && distance2dsquared(e_projectile.origin, ai_zombie.origin) <= n_dist_sq) {
            ai_zombie.is_close = 1;
            n_dist = distance(e_projectile.origin, ai_zombie.origin);
            n_time = n_dist / 1500;
            if (n_time <= 0.1) {
                n_time = 0.1;
            }
            if (isdefined(ai_zombie)) {
                e_projectile moveto(ai_zombie getcentroid(), n_time);
                wait n_time - 0.05;
            }
        } else if (isdefined(ai_zombie)) {
            var_4d8b7233 = 0;
            var_14dcf3ed = 0;
            v_org = function_30239376(ai_zombie);
            n_dist = distance(self.origin, v_org);
            var_7fd007f9 = n_dist * 0.8;
            var_4c92ff0e = n_dist * 0.4;
            v_end = var_2ed6f142 + v_forward * 100;
            var_a93a9211 = distance(self.origin, v_end);
            v_right = var_2ed6f142 + anglestoright(self.angles) * 50;
            v_right_end = v_right + v_forward * 100;
            v_left = var_2ed6f142 - anglestoright(self.angles) * 50;
            v_left_end = v_left + v_forward * 100;
            n_time = var_a93a9211 / 1500;
            if (n_time <= 0.1) {
                n_time = 0.1;
            }
            if (e_projectile.n_index === 1) {
                e_projectile moveto(v_right_end, n_time);
            } else if (e_projectile.n_index === 2) {
                e_projectile moveto(v_left_end, n_time);
            } else {
                e_projectile moveto(v_end, n_time);
            }
            wait n_time - 0.05;
            if (isdefined(ai_zombie) && ai_zombie.var_6f84b820 === #"boss") {
                if (isdefined(ai_zombie gettagorigin("j_tail_1"))) {
                    n_hit_dist_sq = 2500;
                } else {
                    n_hit_dist_sq = 900;
                }
            } else {
                n_hit_dist_sq = 900;
            }
            while (isdefined(ai_zombie)) {
                v_target = function_30239376(ai_zombie);
                n_dist = distance(e_projectile.origin, ai_zombie.origin);
                if (n_dist > var_7fd007f9) {
                    var_4d8b7233 -= 10;
                    if (e_projectile.n_index === 1) {
                        v_horz = v_target + anglestoright(ai_zombie.angles) * 100;
                    } else if (e_projectile.n_index === 2) {
                        v_horz = v_target - anglestoright(ai_zombie.angles) * 100;
                    } else {
                        v_horz = v_target;
                    }
                    if (isdefined(v_horz)) {
                        v_end = v_horz + (0, 0, var_4d8b7233);
                        if (v_end[2] < v_target[2] + 4) {
                            v_end = v_target + (0, 0, -24);
                        }
                    }
                } else if (n_dist <= var_7fd007f9 && n_dist > var_4c92ff0e) {
                    v_end = v_target + (0, 0, -24);
                } else {
                    v_end = v_target + (0, 0, 28);
                }
                n_time = n_dist / 1500;
                if (n_time <= 0.1) {
                    n_time = 0.1;
                }
                if (isdefined(v_end) && isdefined(ai_zombie)) {
                    e_projectile moveto(v_end, n_time);
                }
                waitframe(1);
                var_dc65d1c = distance2dsquared(e_projectile.origin, v_end);
                if (var_dc65d1c <= n_hit_dist_sq) {
                    break;
                }
            }
        }
    }
    if (isdefined(ai_zombie)) {
        v_end = function_30239376(ai_zombie);
    }
    if (isdefined(v_end)) {
        e_projectile moveto(v_end, 0.05);
        e_projectile waittill(#"movedone");
    }
    if (isalive(ai_zombie) || isdefined(ai_zombie) && ai_zombie.var_6f84b820 === #"boss") {
        if (isdefined(level.var_3804f7bd)) {
            self thread [[ level.var_3804f7bd ]](ai_zombie, level.w_hand_ouranos_uncharged, n_damage);
        } else {
            self thread function_dced5aef(ai_zombie, level.w_hand_ouranos_uncharged, n_damage);
        }
    }
    waitframe(1);
    e_projectile delete();
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0xf1367620, Offset: 0x1d10
// Size: 0x12a
function function_30239376(e_target) {
    if (isdefined(e_target) && e_target.var_6f84b820 === #"boss") {
        if (isdefined(e_target gettagorigin("j_tail_1"))) {
            v_org = e_target gettagorigin("j_tail_1");
        } else if (isdefined(e_target gettagorigin("j_spine4"))) {
            v_org = e_target gettagorigin("j_spine4");
        } else {
            v_org = e_target getcentroid();
        }
    } else if (isdefined(e_target gettagorigin("j_spine4"))) {
        v_org = e_target gettagorigin("j_spine4");
    } else {
        v_org = e_target getcentroid();
    }
    return v_org;
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x450fdc05, Offset: 0x1e48
// Size: 0x34
function projectile_timeout() {
    self endon(#"death");
    wait 5;
    self delete();
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 5, eflags: 0x1 linked
// Checksum 0xa1936a20, Offset: 0x1e88
// Size: 0x672
function function_dced5aef(e_target, weapon = level.weaponnone, n_damage, v_to_target, b_charged) {
    self endon(#"disconnect");
    n_random_x = randomfloatrange(-3, 3);
    n_random_y = randomfloatrange(-3, 3);
    var_61906722 = randomfloatrange(250, 300);
    if (!isdefined(v_to_target)) {
        v_to_target = vectornormalize(e_target.origin - self.origin + (n_random_x, n_random_y, var_61906722));
    }
    if (isactor(e_target) && zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return;
    }
    if (isdefined(e_target) && isdefined(e_target.var_6f84b820)) {
        [[ level.var_3aa60558 ]]->waitinqueue(e_target);
        switch (e_target.var_6f84b820) {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            if (isdefined(b_charged) || isdefined(level.var_14f649ad) && level.var_14f649ad) {
                n_damage = e_target.health + 999;
            }
            break;
        case #"heavy":
            if (isdefined(b_charged)) {
                self thread function_7a1456c5(e_target);
            } else {
                n_damage *= 0.75;
            }
            break;
        case #"miniboss":
            if (isdefined(b_charged)) {
                n_damage = int(n_damage * 0.2);
                self thread function_7a1456c5(e_target);
            } else {
                n_damage = int(n_damage * 0.3);
                e_target clientfield::increment("" + #"hash_28af05433c1d1a2e");
            }
            if (randomint(10) == 0) {
                e_target thread ai::stun();
            }
            break;
        case #"boss":
            if (!isactor(e_target)) {
                e_target clientfield::increment("ouranos_impact");
            }
            n_damage = 175;
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
            break;
        }
        if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
            return;
        }
        e_target.no_gib = 1;
        if (e_target.archetype === #"skeleton") {
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
        } else {
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
        }
        if (e_target.health <= 0) {
            e_target.ignoremelee = 1;
            e_target.marked_for_death = 1;
            if (isdefined(e_target.is_close) && e_target.is_close) {
                v_fling = anglestoforward(self.angles) * 250 + (0, 0, 100);
            } else {
                v_fling = v_to_target * 250;
            }
            if (isdefined(e_target.var_acca05a0) && e_target.var_acca05a0) {
                e_target clientfield::set("" + #"hash_c5b1d12b0fd3651", 3);
            } else if (isdefined(b_charged)) {
                e_target clientfield::set("" + #"hash_c5b1d12b0fd3651", 2);
            } else {
                e_target clientfield::set("" + #"hash_c5b1d12b0fd3651", 1);
            }
            e_target zm_utility::function_ffc279(v_fling, self, undefined, weapon);
            self playrumbleonentity("damage_heavy");
        }
    } else {
        e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
    }
    if (isdefined(e_target)) {
        e_target.var_8ac7cc49 = 0;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 2, eflags: 0x1 linked
// Checksum 0x4bc3a08d, Offset: 0x2508
// Size: 0x102
function ouranos_feather_hit(oldval, newval) {
    if (self hasweapon(level.w_hand_ouranos_uncharged) && isdefined(level.var_3804f7bd)) {
        switch (newval) {
        case 1:
            self thread zm_red_ww_quests::function_759247cd(#"hash_2ffae388c1cf246e");
            break;
        case 2:
            self thread zm_red_ww_quests::function_759247cd(#"hash_4634a6e71b6a75e7");
            break;
        case 3:
            self thread zm_red_ww_quests::function_759247cd(#"hash_3a4532026857cf6");
            break;
        }
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x781273c9, Offset: 0x2618
// Size: 0x120
function function_180bae11() {
    var_2ed6f142 = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = var_2ed6f142 + v_forward * 10000;
    a_trace = bullettrace(var_2ed6f142, v_end, 0, self);
    if (isdefined(level.var_21343c57)) {
        var_ec8dc708 = bullettrace(var_2ed6f142, v_end, 0, self);
        level notify(#"ww_ouranos_hit", {#player:self, #e_entity:var_ec8dc708[#"entity"]});
    }
    return a_trace[#"position"];
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x2dde16a6, Offset: 0x2740
// Size: 0x2d6
function player_charged_shot(weapon) {
    self endon(#"death", #"weapon_change");
    self thread function_c7732ae7(weapon);
    self thread function_1e39fbc5(weapon);
    self thread function_a2065170();
    self thread function_cf3b7cef();
    self notify(#"start_beaming");
    self clientfield::set("" + #"hash_4fb73e88d45af0ef", 1);
    self clientfield::set("" + #"hash_494799612e85ee2f", 1);
    while (zm_utility::is_player_valid(self) && self attackbuttonpressed() && self getweaponammostock(weapon) && self getcurrentweapon() === weapon && !self meleebuttonpressed()) {
        waitframe(5);
        self.var_e34577ca = 1;
        waitframe(2);
    }
    self clientfield::set("" + #"hash_4fb73e88d45af0ef", 0);
    self clientfield::set("" + #"hash_494799612e85ee2f", 0);
    a_e_targets = zm_hero_weapon::function_7c3681f7();
    foreach (e_target in a_e_targets) {
        if (isalive(e_target) && isdefined(e_target.var_6cec0263) && e_target.var_6cec0263) {
            e_target.var_6cec0263 = undefined;
            e_target notify(#"starting_slowdown_ai");
        }
    }
    self notify(#"stop_beaming");
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0xd68fc9ea, Offset: 0x2a20
// Size: 0x5e
function function_cf3b7cef() {
    self endon(#"death");
    self waittill(#"weapon_change", #"stop_beaming", #"weapon_fired");
    wait 0.1;
    self.var_e34577ca = undefined;
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0xfeeb85b9, Offset: 0x2a88
// Size: 0x80
function function_a2065170() {
    self endon(#"death", #"weapon_change", #"stop_beaming", #"weapon_fired");
    while (true) {
        if (self meleebuttonpressed()) {
            self notify(#"stop_beaming");
        }
        waitframe(1);
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x508ac59c, Offset: 0x2b10
// Size: 0x18c
function function_1e39fbc5(weapon) {
    self endon(#"death", #"stop_beaming", #"weapon_change");
    wait 0.3;
    while (zm_utility::is_player_valid(self) && self attackbuttonpressed()) {
        self thread function_6e71e724();
        n_ammo = self getweaponammoclip(weapon);
        if (n_ammo) {
            n_ammo--;
            self notify(#"ammo_reduction", {#weapon:weapon});
        }
        w_hand = self getcurrentweapon();
        if (w_hand != weapon) {
            break;
        }
        self setweaponammoclip(weapon, n_ammo);
        if (n_ammo < 1) {
            if (self weaponcyclingenabled()) {
                self switchtoweapon();
            }
            self notify(#"stop_beaming");
        }
        wait 1;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0xf7fcadd5, Offset: 0x2ca8
// Size: 0xa6
function function_6e71e724() {
    self notify(#"beaming");
    self endon(#"death", #"beaming", #"stop_beaming", #"weapon_change");
    while (zm_utility::is_player_valid(self) && self attackbuttonpressed()) {
        waitframe(1);
    }
    self notify(#"stop_beaming");
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x518ad19d, Offset: 0x2d58
// Size: 0x220
function function_c7732ae7(w_curr) {
    self endon(#"death", #"stop_beaming", #"weapon_change");
    if (self.currentweapon == level.w_hand_ouranos_upgraded) {
        n_range = 3000;
    } else {
        n_range = 2150;
    }
    wait 0.3;
    while (true) {
        a_e_targets = zm_hero_weapon::function_7c3681f7();
        foreach (e_target in a_e_targets) {
            if (isalive(e_target) && self is_valid_target(e_target, n_range) && !(isdefined(e_target.var_8ac7cc49) && e_target.var_8ac7cc49)) {
                self thread function_3719a295(e_target);
                waitframe(1);
                continue;
            }
            if (isdefined(e_target) && isdefined(e_target.var_6cec0263) && e_target.var_6cec0263 && isalive(e_target) && !self util::is_player_looking_at(e_target getcentroid(), 0.9, 0, self)) {
                e_target.var_6cec0263 = undefined;
                e_target notify(#"hash_62a477d53a6bbad");
            }
        }
        wait 0.2;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x858ebd95, Offset: 0x2f80
// Size: 0x1a0
function function_3719a295(e_target) {
    self notify(#"beaming");
    self endon(#"death", #"beaming");
    e_target endon(#"death");
    if (isdefined(e_target.var_827f6f4a) && e_target.var_827f6f4a || isdefined(e_target.var_339655cf) && e_target.var_339655cf) {
        return;
    }
    if (self.currentweapon === level.w_hand_ouranos_upgraded) {
        var_ea0a902e = 750;
        var_d756924a = 1000;
    } else {
        var_ea0a902e = 450;
        var_d756924a = 800;
    }
    if (distance2dsquared(self.origin, e_target.origin) <= var_ea0a902e * var_ea0a902e) {
        self thread function_24f525c1(e_target);
        return;
    }
    if (distance2dsquared(self.origin, e_target.origin) <= var_d756924a * var_d756924a) {
        self thread function_7a1456c5(e_target);
        return;
    }
    e_target.var_6cec0263 = undefined;
    e_target notify(#"starting_slowdown_ai");
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x9d1db7d, Offset: 0x3128
// Size: 0x11c
function function_24f525c1(e_target) {
    self endon(#"death");
    e_target endon(#"death");
    if (self.currentweapon === level.w_hand_ouranos_upgraded) {
        n_damage = 8500;
    } else {
        n_damage = 5000;
    }
    if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return;
    }
    e_target.var_8ac7cc49 = 1;
    if (isactor(e_target)) {
        e_target clientfield::increment("" + #"hash_28af05433c1d1a2e");
    } else {
        e_target clientfield::increment("ouranos_impact");
    }
    self thread function_dced5aef(e_target, self.currentweapon, n_damage, undefined, 1);
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x57601603, Offset: 0x3250
// Size: 0xc2
function function_7a1456c5(e_target) {
    self endon(#"death");
    e_target endon(#"death");
    if (!isdefined(e_target.var_6cec0263)) {
        e_target.var_6cec0263 = 1;
        if (isactor(e_target)) {
            e_target thread function_d54becbd();
            e_target thread namespace_9ff9f642::slowdown(#"hash_1e38c032f8b8621c");
        }
        wait 3;
        e_target notify(#"stop_slow");
        e_target.var_6cec0263 = undefined;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0xbf2712c4, Offset: 0x3320
// Size: 0x138
function function_d54becbd() {
    self endon(#"death", #"stop_slow");
    while (true) {
        wait randomfloatrange(1, 2.5);
        n_rand = randomint(3);
        if (n_rand == 2 && self.archetype !== #"catalyst") {
            self zombie_utility::function_df5afb5e(1);
            continue;
        }
        if (n_rand == 1) {
            if (!gibserverutils::isgibbed(self, 32)) {
                gibserverutils::gibleftarm(self);
            }
            continue;
        }
        if (!gibserverutils::isgibbed(self, 16)) {
            gibserverutils::gibrightarm(self);
        }
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x865484c3, Offset: 0x3460
// Size: 0x2a
function function_3874b38f() {
    var_72714481 = getaiteamarray("axis");
    return var_72714481;
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x9f96d67e, Offset: 0x3498
// Size: 0xb2
function function_5fc81f0a(e_target) {
    if (!isdefined(level.var_7d0d4a80)) {
        level.var_7d0d4a80 = [];
    } else if (!isarray(level.var_7d0d4a80)) {
        level.var_7d0d4a80 = array(level.var_7d0d4a80);
    }
    if (!isinarray(level.var_7d0d4a80, e_target)) {
        level.var_7d0d4a80[level.var_7d0d4a80.size] = e_target;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1, eflags: 0x1 linked
// Checksum 0x23029158, Offset: 0x3558
// Size: 0x2c
function function_6d783edd(e_target) {
    arrayremovevalue(level.var_7d0d4a80, e_target);
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x1 linked
// Checksum 0x8bc2b23c, Offset: 0x3590
// Size: 0xe
function function_3ebebb9c() {
    return level.var_7d0d4a80;
}

