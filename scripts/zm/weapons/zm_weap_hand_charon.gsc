#using scripts\core_common\throttle_shared.gsc;
#using scripts\zm\zm_lightning_chain.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_transformation.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_hero_weapon.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\zm_armor.gsc;
#using scripts\zm_common\callbacks.gsc;
#using script_24c32478acf44108;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;

#namespace zm_weap_hand_charon;

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x2
// Checksum 0x8653e21c, Offset: 0x1f8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_hand_charon", &__init__, undefined, undefined);
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0x548c0601, Offset: 0x240
// Size: 0x42a
function __init__() {
    clientfield::register("scriptmover", "charon_pool", 16000, 1, "int");
    clientfield::register("scriptmover", "charon_shoot", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"charon_impact", 16000, 2, "int");
    clientfield::register("allplayers", "charon_flash", 16000, 1, "int");
    clientfield::register("actor", "" + #"charon_death", 16000, 1, "counter");
    clientfield::register("actor", "" + #"hash_3681b677c0d46042", 16000, 1, "counter");
    clientfield::register("actor", "" + #"hash_25691c415a4aea4c", 16000, 1, "int");
    level.w_hand_charon = getweapon(#"ww_hand_c");
    level.w_hand_charon_charged = getweapon(#"ww_hand_c_charged");
    level.w_hand_charon_uncharged = getweapon(#"ww_hand_c_uncharged");
    level.w_hand_charon_upgraded = getweapon(#"ww_hand_c_upgraded");
    zm_weapons::include_zombie_weapon(#"ww_hand_c", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_c_charged", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_c_uncharged", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_c_upgraded", 0);
    namespace_9ff9f642::register_slowdown(#"hash_583272dc38f3f8a8", 0.7, 3);
    namespace_9ff9f642::register_slowdown(#"hash_60f12378572cf8e", 0.3, 1);
    if (!isdefined(level.var_844d377c)) {
        level.var_844d377c = new throttle();
        [[ level.var_844d377c ]]->initialize(6, 0.1);
    }
    callback::add_weapon_fired(level.w_hand_charon, &function_10b4d6ac);
    callback::add_weapon_fired(level.w_hand_charon_charged, &function_dd7bc108);
    callback::add_weapon_fired(level.w_hand_charon_uncharged, &function_10b4d6ac);
    callback::add_weapon_fired(level.w_hand_charon_upgraded, &function_10b4d6ac);
    level.var_5cf3f4a2 = [];
    level.var_d260634e = [];
    level.n_dragged = 0;
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x0
// Checksum 0x6c9d8546, Offset: 0x678
// Size: 0x1c
function on_player_connect() {
    self thread function_3f8da82c();
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0x473386f, Offset: 0x6a0
// Size: 0x88
function function_3f8da82c() {
    self endon(#"disconnect");
    while (true) {
        s_notify = self waittill(#"weapon_change");
        if (s_notify.weapon === level.w_hand_charon_uncharged) {
            self zm_hero_weapon::show_hint(level.w_hand_charon, #"hash_3ce2314ad3d39939");
        }
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0xe29c1a31, Offset: 0x730
// Size: 0x336
function function_10b4d6ac(weapon) {
    self endon(#"death");
    if (weapon == level.w_hand_charon_upgraded) {
        n_damage = 8500;
        b_up = 1;
    } else {
        n_damage = 5000;
        b_up = 0;
    }
    self clientfield::set("charon_flash", 1);
    a_e_targets = function_b04434cf(b_up);
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
                self thread function_26819e32(e_projectile, a_e_targets[i], n_damage);
            } else if (i == 1 && isdefined(a_e_targets[i - 1])) {
                self thread function_26819e32(e_projectile, a_e_targets[i - 1], n_damage);
            } else if (i == 2) {
                if (isdefined(a_e_targets[i - 1])) {
                    self thread function_26819e32(e_projectile, a_e_targets[i - 1], n_damage);
                } else if (isdefined(a_e_targets[i - 2])) {
                    self thread function_26819e32(e_projectile, a_e_targets[i - 2], n_damage);
                }
            } else {
                self thread function_26819e32(e_projectile);
            }
        }
        wait(0.1);
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x8bc60653, Offset: 0xa70
// Size: 0x5c4
function function_b04434cf(b_up) {
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
        if (self is_valid_target(e_target, n_range)) {
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
    var_465b9157 = function_b9a3e6f9();
    if (isdefined(var_465b9157)) {
        var_465b9157 = array::remove_undefined(var_465b9157);
        var_465b9157 = arraysortclosest(var_465b9157, self.origin);
        foreach (e_target in var_465b9157) {
            if (!self zm_utility::is_player_looking_at(e_target.origin, 0.9, 1, self)) {
                continue;
            }
            if (distance2dsquared(self.origin, e_target.origin) > n_range * n_range) {
                continue;
            }
            e_target.var_3df1a748 = 1;
            array::push_front(a_e_valid, e_target);
        }
    }
    return a_e_valid;
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 2, eflags: 0x1 linked
// Checksum 0x39121f70, Offset: 0x1040
// Size: 0x2b2
function is_valid_target(e_target, n_range) {
    if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return false;
    }
    if (isdefined(e_target.var_2e4247bc) && e_target.var_2e4247bc || isdefined(e_target.var_f9b38410) && e_target.var_f9b38410) {
        return false;
    }
    if (isdefined(e_target.var_131a4fb0) && e_target.var_131a4fb0) {
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
    return true;
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0xe3f29370, Offset: 0x1300
// Size: 0x54
function set_projectile(n_index) {
    self endon(#"death");
    self.n_index = n_index;
    wait(0.1);
    self clientfield::increment("charon_shoot");
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 3, eflags: 0x1 linked
// Checksum 0x52fedbb6, Offset: 0x1360
// Size: 0x88c
function function_26819e32(e_projectile, ai_zombie, n_damage) {
    e_projectile endon(#"death");
    self endon(#"disconnect");
    if (isdefined(ai_zombie)) {
        ai_zombie.var_131a4fb0 = 1;
    }
    e_projectile thread projectile_timeout();
    v_end = self function_247597a();
    n_dist = distance(e_projectile.origin, v_end);
    n_time = n_dist / 1500;
    if (n_time <= 0.1) {
        n_time = 0.1;
    }
    if (!isdefined(ai_zombie) || isdefined(ai_zombie.var_3df1a748) && ai_zombie.var_3df1a748) {
        e_projectile moveto(v_end, n_time);
        e_projectile waittill(#"movedone");
        e_projectile clientfield::set("" + #"charon_impact", 1);
        waitframe(1);
    } else {
        var_2ed6f142 = self getweaponmuzzlepoint();
        v_forward = self getweaponforwarddir();
        v_end = var_2ed6f142 + v_forward * 200;
        n_dist_sq = distance2dsquared(self.origin, v_end);
        if (isdefined(ai_zombie) && distance2dsquared(e_projectile.origin, ai_zombie.origin) <= n_dist_sq) {
            n_dist = distance(e_projectile.origin, ai_zombie.origin);
            n_time = n_dist / 1500;
            if (n_time <= 0.1) {
                n_time = 0.1;
            }
            if (isdefined(ai_zombie)) {
                e_projectile moveto(ai_zombie getcentroid(), n_time);
                wait(n_time - 0.05);
            }
        } else if (isdefined(ai_zombie)) {
            var_4d8b7233 = 0;
            var_14dcf3ed = 0;
            v_org = function_30239376(ai_zombie);
            n_dist = distance(self.origin, v_org);
            var_7fd007f9 = n_dist * 0.5;
            v_end = var_2ed6f142 + v_forward * 100;
            var_a93a9211 = distance(self.origin, v_end);
            v_right = var_2ed6f142 + anglestoup(self.angles) * 50;
            v_right_end = v_right + v_forward * 100;
            v_left = var_2ed6f142 - anglestoup(self.angles) * 50;
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
            wait(n_time - 0.05);
            if (isdefined(ai_zombie) && ai_zombie.var_6f84b820 === #"boss") {
                if (isdefined(ai_zombie gettagorigin("j_tail_1"))) {
                    n_hit_dist_sq = 2500;
                } else {
                    n_hit_dist_sq = 400;
                }
            } else {
                n_hit_dist_sq = 400;
            }
            while (isdefined(ai_zombie)) {
                v_target = function_30239376(ai_zombie);
                n_dist = distance(e_projectile.origin, v_target);
                if (n_dist > var_7fd007f9) {
                    var_4d8b7233 += 20;
                    if (e_projectile.n_index === 1) {
                        v_horz = v_target + anglestoright(ai_zombie.angles) * 100;
                    } else if (e_projectile.n_index === 2) {
                        v_horz = v_target - anglestoright(ai_zombie.angles) * 100;
                    } else {
                        v_horz = v_target;
                    }
                    if (isdefined(v_horz)) {
                        v_end = v_horz + (0, 0, var_4d8b7233);
                    }
                } else {
                    var_4d8b7233 -= 20;
                    if (isdefined(v_target)) {
                        v_end = v_target + (0, 0, var_4d8b7233);
                        if (v_end[2] < v_target[2] + 8) {
                            v_end = v_target + (0, 0, 8);
                        }
                    }
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
        if (isdefined(ai_zombie gettagorigin("j_spine4"))) {
            v_end = function_30239376(ai_zombie);
        }
    }
    if (isdefined(v_end)) {
        e_projectile moveto(v_end, 0.05);
        e_projectile waittill(#"movedone");
    }
    if (isalive(ai_zombie) || isdefined(ai_zombie) && ai_zombie.var_6f84b820 === #"boss") {
        if (isdefined(level.var_2f926dcc)) {
            self thread [[ level.var_2f926dcc ]](ai_zombie, level.w_hand_charon_uncharged);
        } else {
            self thread function_dced5aef(ai_zombie, level.w_hand_charon_uncharged, undefined, n_damage);
        }
    }
    waitframe(1);
    e_projectile delete();
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x89b8156, Offset: 0x1bf8
// Size: 0x126
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
        v_org = e_target.origin;
    }
    return v_org;
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0xe5c84d79, Offset: 0x1d28
// Size: 0x34
function projectile_timeout() {
    self endon(#"death");
    wait(5);
    self delete();
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 4, eflags: 0x1 linked
// Checksum 0xabfbccdc, Offset: 0x1d68
// Size: 0x484
function function_dced5aef(e_target, weapon = level.weaponnone, v_to_target, n_damage) {
    self endon(#"death");
    e_target endon(#"death");
    if (isactor(e_target) && zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return;
    }
    if (isdefined(e_target) && isdefined(e_target.var_6f84b820)) {
        [[ level.var_844d377c ]]->waitinqueue(e_target);
        switch (e_target.var_6f84b820) {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            if (isdefined(level.var_14f649ad) && level.var_14f649ad) {
                n_damage = e_target.health + 666;
            }
            if (n_damage >= e_target.health) {
                e_target.var_131a4fb0 = 1;
            }
            if (e_target.archetype === #"skeleton") {
                e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
            } else if (isdefined(e_target.var_131a4fb0) && e_target.var_131a4fb0) {
                self thread function_197896ad(e_target, n_damage);
            } else {
                e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
            }
            break;
        case #"heavy":
            e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
            break;
        case #"miniboss":
            e_target clientfield::increment("" + #"hash_3681b677c0d46042");
            n_damage = int(n_damage * 0.3);
            e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
            if (randomint(10) == 0) {
                e_target thread ai::stun();
            }
            if (isdefined(e_target)) {
                e_target.var_131a4fb0 = 0;
            }
            break;
        case #"boss":
            if (!isactor(e_target)) {
                e_target clientfield::set("" + #"charon_impact", 1);
            }
            n_damage = 175;
            e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
            if (isdefined(e_target)) {
                e_target.var_131a4fb0 = 0;
            }
            break;
        }
        return;
    }
    e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x2c6c772d, Offset: 0x21f8
// Size: 0x110
function function_247597a(b_charged) {
    var_2ed6f142 = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = var_2ed6f142 + v_forward * 10000;
    a_trace = bullettrace(var_2ed6f142, v_end, 1, self);
    if (isdefined(level.var_4822b326)) {
        level notify(#"ww_charon_hit", {#player:self, #e_entity:a_trace[#"entity"]});
    }
    if (isdefined(b_charged) && b_charged) {
        return a_trace;
    }
    return a_trace[#"position"];
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0xe6593cbe, Offset: 0x2310
// Size: 0x4cc
function function_dd7bc108(weapon) {
    self endon(#"disconnect", #"weapon_change");
    if (self.currentweapon === level.w_hand_charon_upgraded) {
        n_damage = 8500;
    } else {
        n_damage = 5000;
    }
    self clientfield::set("charon_flash", 1);
    n_inc = 100;
    v_org = self.origin;
    if (self.currentweapon === level.w_hand_charon_upgraded) {
        n_ammo = self getweaponammoclip(level.w_hand_charon_upgraded);
    } else {
        n_ammo = self getweaponammoclip(level.w_hand_charon);
    }
    if (n_ammo >= 2) {
        n_ammo -= 2;
    }
    if (self.currentweapon === level.w_hand_charon_upgraded) {
        self setweaponammoclip(level.w_hand_charon_upgraded, n_ammo);
    } else {
        self setweaponammoclip(level.w_hand_charon, n_ammo);
    }
    a_trace = function_247597a(1);
    if (!isdefined(a_trace[#"position"]) && !isdefined(a_trace[#"entity"])) {
        return;
    }
    if (isdefined(a_trace[#"entity"])) {
        v_on_nav = a_trace[#"entity"].origin;
        if (isdefined(a_trace[#"position"])) {
            v_hit = a_trace[#"position"];
        }
    } else {
        v_on_nav = getclosestpointonnavmesh(a_trace[#"position"], 128, 32);
        if (isdefined(v_on_nav)) {
            v_hit = v_on_nav;
        } else {
            v_hit = a_trace[#"position"];
        }
    }
    e_projectile = util::spawn_model("tag_origin", self gettagorigin("tag_flash"), self gettagangles("tag_flash"));
    if (isdefined(e_projectile)) {
        e_projectile function_39e6dc29(a_trace[#"position"]);
        wait(0.1);
    }
    if (isdefined(v_on_nav)) {
        var_330f37da = v_on_nav;
    } else {
        return;
    }
    if (isdefined(self.var_79e746a9)) {
        self.var_79e746a9 delete();
        self.var_79e746a9 zm_utility::deactivate_zombie_point_of_interest();
    }
    if (isdefined(self.var_b1224954)) {
        self.var_b1224954 delete();
    }
    self.var_79e746a9 = util::spawn_model("tag_origin", var_330f37da, (-90, 0, 0));
    if (isdefined(self.var_79e746a9)) {
        self.var_b1224954 = spawn("trigger_radius_new", var_330f37da, 512 | 1, 100, 60);
        if (isdefined(self.var_b1224954)) {
            self thread charon_pool(n_damage);
        } else {
            self.var_79e746a9 delete();
            self.var_79e746a9 zm_utility::deactivate_zombie_point_of_interest();
        }
    }
    wait(0.1);
    self clientfield::set("charon_flash", 0);
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x6a20df68, Offset: 0x27e8
// Size: 0x104
function function_39e6dc29(v_end) {
    self endon(#"death");
    self thread set_projectile(0);
    n_dist = distance(self.origin, v_end);
    n_time = n_dist / 1500;
    if (n_time <= 0.1) {
        n_time = 0.1;
    }
    self moveto(v_end, n_time);
    self waittill(#"movedone");
    self clientfield::set("" + #"charon_impact", 2);
    wait(0.1);
    self delete();
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x1fd62cd, Offset: 0x28f8
// Size: 0x1a4
function charon_pool(n_damage) {
    if (isdefined(self.var_b1224954)) {
        var_49981df5 = self.var_b1224954;
        var_49981df5 endon(#"death");
    }
    if (isdefined(self) && isdefined(self.var_79e746a9)) {
        var_79e746a9 = self.var_79e746a9;
        var_79e746a9 clientfield::set("charon_pool", 1);
        var_79e746a9 zm_utility::create_zombie_point_of_interest(200, 16, 1000);
        var_79e746a9 zm_utility::create_zombie_point_of_interest_attractor_positions(undefined, undefined, 100, 1);
        var_79e746a9.var_8305fd51 = #"charon_pool";
        self thread function_249b5556(n_damage);
        self notify(#"hash_52d2f17ac6d67de2");
        if (n_damage == 5000) {
            wait(15);
        } else {
            wait(22);
        }
        if (isdefined(var_79e746a9)) {
            var_79e746a9 zm_utility::deactivate_zombie_point_of_interest();
            var_79e746a9 clientfield::set("charon_pool", 0);
            var_79e746a9 delete();
        }
        if (isdefined(var_49981df5)) {
            var_49981df5 delete();
        }
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x9f4f54e9, Offset: 0x2aa8
// Size: 0x322
function function_249b5556(n_damage) {
    self endon(#"death");
    self.var_b1224954 endon(#"death");
    while (true) {
        s_result = self.var_b1224954 waittill(#"trigger");
        if (isdefined(s_result.activator)) {
            if (!isplayer(s_result.activator)) {
                ai_zombie = s_result.activator;
                if (!isalive(ai_zombie)) {
                    continue;
                }
                if (!isdefined(ai_zombie.var_6f84b820)) {
                    continue;
                }
                if (isdefined(ai_zombie.var_2e4247bc) && ai_zombie.var_2e4247bc || isdefined(ai_zombie.var_339655cf) && ai_zombie.var_339655cf) {
                    continue;
                }
                if (isdefined(ai_zombie.var_69a981e6) && ai_zombie.var_69a981e6) {
                    continue;
                }
                if (!(isdefined(ai_zombie.var_47d982a1) && ai_zombie.var_47d982a1) && isalive(ai_zombie)) {
                    zm_transform::function_5db4f2f5(ai_zombie);
                    [[ level.var_844d377c ]]->waitinqueue(ai_zombie);
                    if (!isdefined(ai_zombie)) {
                        continue;
                    }
                    switch (ai_zombie.var_6f84b820) {
                    case #"popcorn":
                    case #"basic":
                    case #"enhanced":
                        ai_zombie.var_47d982a1 = 1;
                        ai_zombie thread function_ccd87945(self);
                        ai_zombie thread namespace_9ff9f642::slowdown(#"hash_583272dc38f3f8a8");
                        break;
                    case #"heavy":
                        ai_zombie.var_47d982a1 = 1;
                        self thread function_2a67ef83(ai_zombie, n_damage);
                        ai_zombie thread function_da454404();
                        break;
                    case #"miniboss":
                        ai_zombie.var_47d982a1 = 1;
                        self thread function_2a67ef83(ai_zombie, n_damage);
                        ai_zombie thread function_da454404();
                        break;
                    }
                }
                continue;
            }
            self notify(#"hash_288cb56263c7b7fa");
        }
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0xe9e8115d, Offset: 0x2dd8
// Size: 0x1ac
function function_ccd87945(e_player) {
    self endon(#"death");
    e_player endon(#"death");
    if (isdefined(e_player.var_b1224954)) {
        if (!isdefined(e_player.var_b1224954.n_dragged)) {
            e_player.var_b1224954.n_dragged = 0;
        }
        e_player.var_b1224954.n_dragged++;
        e_player notify(#"hash_175b1370e662293a", {#var_b1224954:e_player.var_b1224954});
    }
    wait(randomfloatrange(0.5, 1.5));
    self.e_attacker = e_player;
    if (isdefined(level.var_50ce2afd)) {
        e_player thread [[ level.var_50ce2afd ]]();
    }
    if (level.n_dragged < 5) {
        level.n_dragged++;
        self thread function_31d8c58();
        return;
    }
    if (isdefined(e_player) && isalive(self)) {
        self dodamage(self.health + 999, self.origin, e_player, e_player, undefined, "MOD_UNKNOWN", 0, level.w_hand_charon);
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0x951d11d1, Offset: 0x2f90
// Size: 0x434
function function_31d8c58() {
    self endon(#"death");
    self.ignoreall = 1;
    self.ignoreme = 1;
    self.allowdeath = 0;
    self.no_gib = 1;
    self.b_ignore_cleanup = 1;
    self.no_powerups = 1;
    self.var_131a4fb0 = 1;
    self notsolid();
    self clientfield::set("" + #"hash_25691c415a4aea4c", 1);
    var_f9d1df1d = vectornormalize(anglestoforward(self.angles));
    mdl_tag = util::spawn_model("tag_origin", self.origin, self.angles);
    mdl_tag.var_58b95 = util::spawn_model("tag_origin", anglestoright(self.angles) * 8 + self.origin + var_f9d1df1d * 6, self.angles + (0, -90, 0));
    mdl_tag.var_31436e10 = util::spawn_model("tag_origin", anglestoright(self.angles) * -6 + self.origin + var_f9d1df1d * 6, self.angles + (0, 90, 0));
    if (isdefined(mdl_tag)) {
        mdl_tag thread scene::play(#"aib_vign_cust_zm_red_zmb_ww_drggd_dwn_00", self);
        mdl_tag thread function_8a38ce84();
    }
    if (isdefined(mdl_tag.var_58b95)) {
        mdl_tag.var_58b95 thread scene::play(#"hash_1cfca52bdf13d5bf" + randomint(3));
    }
    if (isdefined(mdl_tag.var_31436e10)) {
        mdl_tag.var_31436e10 thread scene::play(#"hash_1cfca52bdf13d5bf" + randomint(3));
    }
    level.n_dragged--;
    if (level.n_dragged < 0) {
        level.n_dragged = 0;
    }
    wait(3);
    if (isdefined(self)) {
        self.allowdeath = 1;
        self.skipdeath = 1;
        self.diedinscriptedanim = 1;
        self ghost();
        if (self.archetype === #"skeleton") {
            self dodamage(self.health + 999, mdl_tag.origin, self.e_attacker, self.e_attacker, undefined, "MOD_UNKNOWN", 0, level.w_hand_charon);
        } else {
            self dodamage(self.health + 100, mdl_tag.origin, self.e_attacker, self.e_attacker, undefined, "MOD_UNKNOWN", 0, level.w_hand_charon);
        }
        wait(0.5);
        if (isalive(self)) {
            self show();
        }
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0xf02cbe26, Offset: 0x33d0
// Size: 0x7c
function function_8a38ce84() {
    wait(3.8);
    if (isdefined(self.var_58b95)) {
        self.var_58b95 delete();
    }
    if (isdefined(self.var_31436e10)) {
        self.var_31436e10 delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 2, eflags: 0x1 linked
// Checksum 0x2b1411af, Offset: 0x3458
// Size: 0x2f4
function function_197896ad(e_target, n_damage) {
    self endon(#"death");
    if (!(isdefined(e_target.var_61768419) && e_target.var_61768419)) {
        e_target.var_61768419 = 1;
        if (e_target.health <= n_damage) {
            e_target clientfield::increment("" + #"charon_death");
            e_target.skipdeath = 1;
            e_target.diedinscriptedanim = 1;
            n_damage = e_target.health + 999;
        } else {
            n_damage = n_damage;
        }
        [[ level.var_844d377c ]]->waitinqueue(e_target);
        e_target clientfield::increment("" + #"hash_3681b677c0d46042");
        e_target ai::stun(3);
        wait(0.8);
        if (isdefined(e_target)) {
            e_target thread namespace_9ff9f642::slowdown(#"hash_583272dc38f3f8a8");
        }
        wait(0.7);
        if (isdefined(e_target)) {
            e_target thread namespace_9ff9f642::slowdown(#"hash_60f12378572cf8e");
        }
        wait(1);
        if (isalive(e_target)) {
            if (isdefined(e_target.skipdeath) && e_target.skipdeath) {
                e_target hide();
            }
            if (e_target.archetype === #"skeleton") {
                e_target dodamage(n_damage, self.origin, self, self, "none", "MOD_UNKNOWN", 0, level.w_hand_charon_uncharged);
            } else {
                e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, level.w_hand_charon_uncharged);
            }
        }
        wait(0.1);
        if (isdefined(e_target)) {
            e_target.var_131a4fb0 = 0;
            e_target.var_61768419 = 0;
        }
        wait(0.5);
        if (isalive(e_target)) {
            e_target show();
        }
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 2, eflags: 0x1 linked
// Checksum 0x985a40b, Offset: 0x3758
// Size: 0x144
function function_2a67ef83(e_target, n_damage) {
    self endon(#"death");
    e_target endon(#"death");
    e_target.var_317b8f00 = 1;
    e_target thread namespace_9ff9f642::slowdown(#"hash_583272dc38f3f8a8");
    while (isdefined(self.var_b1224954) && isdefined(e_target.var_317b8f00) && e_target.var_317b8f00) {
        e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, level.w_hand_charon);
        if (randomint(6) == 0) {
            e_target thread ai::stun(1);
        }
        wait(2);
    }
    e_target thread namespace_9ff9f642::function_520f4da5(#"hash_583272dc38f3f8a8");
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0x7a44e477, Offset: 0x38a8
// Size: 0x5a
function function_da454404() {
    self endon(#"death");
    wait(3);
    if (isdefined(self) && isdefined(self.var_47d982a1) && self.var_47d982a1) {
        self.var_47d982a1 = 0;
        self.var_317b8f00 = 0;
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0xbc70c921, Offset: 0x3910
// Size: 0x2a
function function_3874b38f() {
    var_72714481 = getaiteamarray("axis");
    return var_72714481;
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x895452df, Offset: 0x3948
// Size: 0xb2
function function_5fc81f0a(e_target) {
    if (!isdefined(level.var_5cf3f4a2)) {
        level.var_5cf3f4a2 = [];
    } else if (!isarray(level.var_5cf3f4a2)) {
        level.var_5cf3f4a2 = array(level.var_5cf3f4a2);
    }
    if (!isinarray(level.var_5cf3f4a2, e_target)) {
        level.var_5cf3f4a2[level.var_5cf3f4a2.size] = e_target;
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0xd3a482e2, Offset: 0x3a08
// Size: 0x2c
function function_6d783edd(e_target) {
    arrayremovevalue(level.var_5cf3f4a2, e_target);
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0xccb724e8, Offset: 0x3a40
// Size: 0xe
function function_3ebebb9c() {
    return level.var_5cf3f4a2;
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x207ad903, Offset: 0x3a58
// Size: 0xb2
function function_25513188(e_target) {
    if (!isdefined(level.var_d260634e)) {
        level.var_d260634e = [];
    } else if (!isarray(level.var_d260634e)) {
        level.var_d260634e = array(level.var_d260634e);
    }
    if (!isinarray(level.var_d260634e, e_target)) {
        level.var_d260634e[level.var_d260634e.size] = e_target;
    }
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 1, eflags: 0x1 linked
// Checksum 0x7df1fe53, Offset: 0x3b18
// Size: 0x2c
function function_5760b289(e_target) {
    arrayremovevalue(level.var_d260634e, e_target);
}

// Namespace zm_weap_hand_charon/zm_weap_hand_charon
// Params 0, eflags: 0x1 linked
// Checksum 0x92d5060d, Offset: 0x3b50
// Size: 0xe
function function_b9a3e6f9() {
    return level.var_d260634e;
}

