// Atian COD Tools GSC decompiler test
#using scripts\core_common\throttle_shared.gsc;
#using scripts\zm\zm_lightning_chain.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
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
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\ai_shared.gsc;
#using scripts\abilities\ability_player.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\systems\gib.gsc;

#namespace zm_weap_hand_hemera;

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x2
// Checksum 0x75d95d2, Offset: 0x1f0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_weap_hand_hemera", &__init__, undefined, undefined);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0xc6b142f6, Offset: 0x238
// Size: 0x3fe
function __init__() {
    clientfield::register("scriptmover", "hemera_shoot", 16000, 1, "counter");
    clientfield::register("scriptmover", "" + #"hemera_beam", 16000, 1, "int");
    clientfield::register("scriptmover", "" + #"hemera_impact", 16000, 1, "counter");
    clientfield::register("allplayers", "hemera_proj_flash", 16000, 1, "int");
    clientfield::register("allplayers", "hemera_beam_flash", 16000, 1, "int");
    clientfield::register("actor", "hemera_proj_death", 16000, 1, "int");
    clientfield::register("actor", "" + #"hash_5a8f1796382ec694", 16000, 1, "int");
    level.w_hand_hemera = getweapon(#"ww_hand_h");
    level.w_hand_hemera_charged = getweapon(#"ww_hand_h_charged");
    level.w_hand_hemera_uncharged = getweapon(#"ww_hand_h_uncharged");
    level.w_hand_hemera_upgraded = getweapon(#"ww_hand_h_upgraded");
    zm_weapons::include_zombie_weapon(#"ww_hand_h", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_h_charged", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_h_uncharged", 0);
    zm_weapons::include_zombie_weapon(#"ww_hand_h_upgraded", 0);
    callback::on_connect(&on_player_connect);
    if (!isdefined(level.var_ab6fef61)) {
        level.var_ab6fef61 = new throttle();
        [[ level.var_ab6fef61 ]]->initialize(6, 0.1);
    }
    namespace_9ff9f642::register_slowdown(#"hash_7e8287b2e2587da1", 0.6, 3);
    callback::add_weapon_fired(level.w_hand_hemera, &function_10b4d6ac);
    callback::add_weapon_fired(level.w_hand_hemera_charged, &function_dd7bc108);
    callback::add_weapon_fired(level.w_hand_hemera_uncharged, &function_10b4d6ac);
    callback::add_weapon_fired(level.w_hand_hemera_upgraded, &function_10b4d6ac);
    level.var_7148b584 = [];
    level.var_e51fadba = [];
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x2f2cfa14, Offset: 0x640
// Size: 0x1c
function on_player_connect() {
    self thread function_3f8da82c();
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x5651d944, Offset: 0x668
// Size: 0x108
function function_3f8da82c() {
    self endon(#"disconnect");
    while (1) {
        s_notify = undefined;
        s_notify = self waittill(#"weapon_change");
        if (s_notify.weapon === level.w_hand_hemera_uncharged) {
            continue;
        }
        if (s_notify.weapon === level.w_hand_hemera || s_notify.weapon === level.w_hand_hemera_upgraded) {
            self.var_e34577ca = undefined;
            self thread function_54922a21();
        } else if (isdefined(self.mdl_beam)) {
            self.mdl_beam clientfield::set("" + #"hemera_beam", 0);
            self.mdl_beam delete();
        }
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xcaf4c225, Offset: 0x778
// Size: 0x34
function function_10b4d6ac(weapon) {
    self endon(#"death");
    self function_d8a9b5a6(weapon);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0x374923c6, Offset: 0x7b8
// Size: 0x354
function function_d8a9b5a6(weapon) {
    self endon(#"death");
    if (weapon == level.w_hand_hemera_upgraded) {
        n_damage = 8500;
        b_up = 1;
    } else {
        n_damage = 5000;
        b_up = 0;
    }
    self clientfield::set("hemera_proj_flash", 1);
    a_e_targets = function_6880852f(b_up);
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
                self thread function_8e7f5291(e_projectile, a_e_targets[i], n_damage);
            } else if (i == 1 && isdefined(a_e_targets[i - 1])) {
                self thread function_8e7f5291(e_projectile, a_e_targets[i - 1], n_damage);
            } else if (i == 2) {
                if (isdefined(a_e_targets[i - 1])) {
                    self thread function_8e7f5291(e_projectile, a_e_targets[i - 1], n_damage);
                } else if (isdefined(a_e_targets[i - 2])) {
                    self thread function_8e7f5291(e_projectile, a_e_targets[i - 2], n_damage);
                }
            } else {
                self thread function_8e7f5291(e_projectile);
            }
        }
        wait(0.1);
    }
    self clientfield::set("hemera_proj_flash", 0);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0xc86c4a9d, Offset: 0xb18
// Size: 0xf2
function function_54922a21() {
    self endon(#"death", #"weapon_change");
    while (1) {
        while ((self.chargeshotlevel != 2 || !self attackbuttonpressed()) && (self.currentweapon === level.w_hand_hemera || self.currentweapon === level.w_hand_hemera_upgraded)) {
            waitframe(1);
        }
        self thread player_charged_shot(self.currentweapon);
        self waittill(#"weapon_fired", #"stop_beaming");
        while (self.chargeshotlevel >= 2) {
            waitframe(1);
        }
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xff0e9703, Offset: 0xc18
// Size: 0x3c
function function_dd7bc108(weapon) {
    if (!(isdefined(self.var_e34577ca) && self.var_e34577ca)) {
        self function_d8a9b5a6(weapon);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0x112acc00, Offset: 0xc60
// Size: 0x5c4
function function_6880852f(b_up) {
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

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 2, eflags: 0x1 linked
// Checksum 0x904cda37, Offset: 0x1230
// Size: 0x2b2
function is_valid_target(e_target, n_range) {
    if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return 0;
    }
    if (isdefined(e_target.var_aea6e035) && e_target.var_aea6e035 || isdefined(e_target.var_f9b38410) && e_target.var_f9b38410) {
        return 0;
    }
    if (isdefined(e_target.marked_for_death) && e_target.marked_for_death) {
        return 0;
    }
    if (distance2dsquared(self.origin, e_target.origin) <= 64 * 64 && (self zm_utility::is_player_looking_at(e_target getcentroid(), 0.3, 1, self) || self zm_utility::is_player_looking_at(e_target getcentroid() + vectorscale((0, 0, 1), 32), 0.3, 1, self))) {
        return 1;
    }
    if (isdefined(e_target.fake_death) && e_target.fake_death) {
        return 0;
    }
    if (!isalive(e_target)) {
        return 0;
    }
    if (distance2dsquared(self.origin, e_target.origin) > n_range * n_range) {
        return 0;
    }
    var_c060d2c8 = !(isdefined(level.var_58f509b6) && level.var_58f509b6);
    if (!self zm_utility::is_player_looking_at(e_target getcentroid(), 0.9, var_c060d2c8, self) && !self zm_utility::is_player_looking_at(e_target.origin, 0.9, var_c060d2c8, self) && !self zm_utility::is_player_looking_at(e_target getcentroid() + vectorscale((0, 0, 1), 28), 0.9, var_c060d2c8, self)) {
        return 0;
    }
    return 1;
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xaddfca11, Offset: 0x14f0
// Size: 0x54
function set_projectile(n_index) {
    self endon(#"death");
    self.n_index = n_index;
    wait(0.1);
    self clientfield::increment("hemera_shoot");
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 3, eflags: 0x1 linked
// Checksum 0x2b418dc5, Offset: 0x1550
// Size: 0x8cc
function function_8e7f5291(e_projectile, ai_zombie, n_damage) {
    e_projectile endon(#"death");
    self endon(#"disconnect");
    if (isdefined(ai_zombie) && !(isdefined(ai_zombie.marked_for_death) && ai_zombie.marked_for_death)) {
        ai_zombie.marked_for_death = 1;
    }
    e_projectile thread projectile_timeout();
    v_end = self function_3f079da();
    n_dist = distance(e_projectile.origin, v_end);
    n_time = n_dist / 1500;
    if (n_time <= 0.1) {
        n_time = 0.1;
    }
    if (!isdefined(ai_zombie) || isdefined(ai_zombie.var_3df1a748) && ai_zombie.var_3df1a748) {
        e_projectile moveto(v_end, n_time);
        e_projectile waittill(#"movedone");
        e_projectile clientfield::increment("" + #"hemera_impact");
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
            v_right = var_2ed6f142 + anglestoright(self.angles) * 50;
            v_right_end = v_right + v_forward * 100 + vectorscale((0, 0, 1), 24);
            v_left = var_2ed6f142 - anglestoright(self.angles) * 50;
            v_left_end = v_left + v_forward * 100 + vectorscale((0, 0, -1), 24);
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
                    if (var_4d8b7233 <= 100) {
                        var_4d8b7233 = var_4d8b7233 + 20;
                    }
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
                    var_4d8b7233 = var_4d8b7233 - 20;
                    if (isdefined(v_target)) {
                        v_end = v_target + (0, 0, var_4d8b7233);
                        if (v_end[2] < v_target[2] + 8) {
                            v_end = v_target + vectorscale((0, 0, 1), 8);
                        }
                    }
                }
                n_time = n_dist / 1500;
                if (n_time <= 0.1) {
                    n_time = 0.1;
                }
                if (isdefined(v_end) && isdefined(ai_zombie)) {
                    if (distance2dsquared(e_projectile.origin, ai_zombie.origin) <= 400) {
                        v_end = ai_zombie getcentroid();
                    }
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
        self thread function_dced5aef(ai_zombie, level.w_hand_hemera_uncharged, n_damage);
    }
    waitframe(1);
    e_projectile delete();
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0x4588d1fc, Offset: 0x1e28
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

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x86460139, Offset: 0x1f58
// Size: 0x34
function projectile_timeout() {
    self endon(#"death");
    wait(5);
    self delete();
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 4, eflags: 0x1 linked
// Checksum 0x8fcd778d, Offset: 0x1f98
// Size: 0x48c
function function_dced5aef(e_target, weapon = level.weaponnone, n_damage, b_charged) {
    self endon(#"disconnect");
    e_target endon(#"death");
    if (isactor(e_target) && zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return;
    }
    if (isdefined(e_target) && isdefined(e_target.var_6f84b820)) {
        [[ level.var_ab6fef61 ]]->waitinqueue(e_target);
        switch (e_target.var_6f84b820) {
        case #"popcorn":
        case #"basic":
        case #"enhanced":
            if (isdefined(level.var_14f649ad) && level.var_14f649ad) {
                n_damage = e_target.health + 666;
            }
            if (n_damage >= e_target.health) {
                e_target.marked_for_death = 1;
            }
            if (e_target.archetype === #"skeleton") {
                e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
            } else if (isdefined(e_target.marked_for_death) && e_target.marked_for_death) {
                self thread function_e56c350e(e_target, b_charged, n_damage);
            } else {
                e_target dodamage(n_damage, e_target.origin, self, self, "none", "MOD_UNKNOWN", 0, weapon);
            }
            break;
        case #"heavy":
            if (!isdefined(b_charged)) {
                n_damage = n_damage * 0.75;
            }
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
            break;
        case #"miniboss":
            if (isdefined(b_charged)) {
                n_damage = int(n_damage * 0.2);
            } else {
                n_damage = int(n_damage * 0.3);
            }
            if (randomint(10) == 0) {
                e_target thread ai::stun();
            }
            e_target thread function_aa6f2b4();
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
            if (isdefined(e_target)) {
                e_target.marked_for_death = 0;
            }
            break;
        case #"boss":
            if (!isactor(e_target)) {
                e_target clientfield::increment("" + #"hemera_impact");
            }
            n_damage = 175;
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
            if (isdefined(e_target)) {
                e_target.marked_for_death = 0;
            }
            break;
        }
    } else {
        e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, weapon);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x4905fb31, Offset: 0x2430
// Size: 0x6c
function function_aa6f2b4() {
    if (isalive(self)) {
        self clientfield::set("hemera_proj_death", 1);
    }
    wait(1);
    if (isdefined(self)) {
        self clientfield::set("hemera_proj_death", 0);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x8b2f306e, Offset: 0x24a8
// Size: 0x110
function function_3f079da() {
    var_2ed6f142 = self getweaponmuzzlepoint();
    v_forward = self getweaponforwarddir();
    v_end = var_2ed6f142 + v_forward * 3000;
    a_trace = bullettrace(var_2ed6f142, v_end, 1, self);
    if (isdefined(level.var_137b8e71)) {
        level notify(#"ww_hemera_hit", {#v_position:a_trace[#"position"], #e_entity:a_trace[#"entity"], #player:self});
    }
    return a_trace[#"position"];
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0x6331b158, Offset: 0x25c0
// Size: 0x3b6
function player_charged_shot(weapon) {
    self endoncallback(&function_8a56ed15, #"death", #"disconnect", #"weapon_change", #"weapon_fired", #"stop_beaming");
    v_trace = self function_3f079da();
    v_ground = groundtrace(v_trace + vectorscale((0, 0, 1), 200), v_trace + vectorscale((0, 0, -1), 1000), 0, self)[#"position"];
    if (!isdefined(self.mdl_beam)) {
        self.mdl_beam = util::spawn_model("tag_origin", v_ground);
        if (!isdefined(self.mdl_beam)) {
            self notify(#"stop_beaming");
            return;
        }
    } else {
        return;
    }
    self notify(#"hash_4969a839c4e666dc");
    self clientfield::set("hemera_beam_flash", 1);
    self.mdl_beam clientfield::set("" + #"hemera_beam", 1);
    self playsound(#"hash_1f3a25ed02b0fb5f");
    self thread function_1e39fbc5(weapon);
    self thread function_8bf301a6();
    self thread function_a2065170();
    while (zm_utility::is_player_valid(self) && self attackbuttonpressed() && self getweaponammostock(weapon) && self getcurrentweapon() === weapon) {
        waitframe(5);
        self.var_e34577ca = 1;
        waitframe(2);
        v_trace = self function_3f079da();
        if (isdefined(v_trace)) {
            v_ground = groundtrace(v_trace + vectorscale((0, 0, 1), 100), v_trace + vectorscale((0, 0, -1), 1000), 0, self)[#"position"];
        }
        if (isdefined(v_ground) && isdefined(self.mdl_beam)) {
            self.mdl_beam moveto(v_ground, 0.3);
        }
    }
    self clientfield::set("hemera_beam_flash", 0);
    if (isdefined(self.mdl_beam)) {
        self.mdl_beam clientfield::set("" + #"hemera_beam", 0);
        self.mdl_beam delete();
    }
    self notify(#"stop_beaming");
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xe2c1d76a, Offset: 0x2980
// Size: 0xc6
function function_8a56ed15(s_notify) {
    self endon(#"death");
    self clientfield::set("hemera_beam_flash", 0);
    if (isdefined(self.mdl_beam)) {
        self playsound(#"hash_7aeea3d29c1624a");
        self.mdl_beam clientfield::set("" + #"hemera_beam", 0);
        self.mdl_beam delete();
    }
    wait(0.1);
    self.var_e34577ca = undefined;
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x7432e27c, Offset: 0x2a50
// Size: 0x80
function function_a2065170() {
    self endon(#"death", #"weapon_change", #"stop_beaming", #"weapon_fired");
    while (1) {
        if (self meleebuttonpressed()) {
            self notify(#"stop_beaming");
        }
        waitframe(1);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0xeb45ac6c, Offset: 0x2ad8
// Size: 0x214
function function_8bf301a6() {
    self endon(#"death", #"weapon_change", #"stop_beaming");
    self.mdl_beam endon(#"death");
    if (self.currentweapon === level.w_hand_hemera_upgraded) {
        n_damage = 8500;
        n_range = 10000;
    } else {
        n_damage = 5000;
        n_range = 6400;
    }
    wait(0.3);
    while (1) {
        a_e_targets = zm_hero_weapon::function_7c3681f7();
        foreach (e_target in a_e_targets) {
            if (isalive(e_target) && !(isdefined(e_target.var_8ac7cc49) && e_target.var_8ac7cc49) && !(isdefined(e_target.var_339655cf) && e_target.var_339655cf) && !(isdefined(e_target.var_aea6e035) && e_target.var_aea6e035) && distance2dsquared(self.mdl_beam.origin, e_target.origin) <= n_range) {
                self thread function_dced5aef(e_target, level.w_hand_hemera, n_damage, 1);
            }
        }
        wait(0.1);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xbea50d0b, Offset: 0x2cf8
// Size: 0x18c
function function_1e39fbc5(weapon) {
    self endon(#"death", #"stop_beaming", #"weapon_change");
    wait(0.3);
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
        wait(1);
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x6520c681, Offset: 0x2e90
// Size: 0xa6
function function_6e71e724() {
    self notify(#"beaming");
    self endon(#"death", #"beaming", #"stop_beaming", #"weapon_change");
    while (zm_utility::is_player_valid(self) && self attackbuttonpressed()) {
        waitframe(1);
    }
    self notify(#"stop_beaming");
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 3, eflags: 0x1 linked
// Checksum 0xff6d8dd6, Offset: 0x2f40
// Size: 0x2ce
function function_e56c350e(e_target, b_charged, n_damage) {
    self endon(#"death");
    e_target endon(#"death");
    if (zm_utility::is_magic_bullet_shield_enabled(e_target)) {
        return;
    }
    e_target.var_8ac7cc49 = 1;
    e_target.var_61768419 = 1;
    e_target.marked_for_death = 1;
    [[ level.var_ab6fef61 ]]->waitinqueue(e_target);
    w_weapon = level.w_hand_hemera_uncharged;
    if (isdefined(b_charged)) {
        e_target clientfield::set("" + #"hash_5a8f1796382ec694", 1);
        e_target.var_4dcd7a1c = 1;
        n_damage = e_target.health + 999;
        w_weapon = level.w_hand_hemera;
    } else if (e_target.health <= n_damage) {
        e_target.marked_for_death = 1;
        e_target clientfield::set("hemera_proj_death", 1);
        e_target thread ai::stun(2);
        wait(1);
        e_target clientfield::set("hemera_proj_death", 0);
        gibserverutils::annihilate(e_target);
        n_damage = e_target.health + 999;
    } else {
        n_damage = n_damage;
    }
    if (isalive(e_target)) {
        if (e_target.archetype === #"skeleton") {
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, w_weapon);
        } else {
            e_target dodamage(n_damage, self.origin, self, undefined, "none", "MOD_UNKNOWN", 0, w_weapon);
        }
    }
    e_target.var_61768419 = 0;
    e_target.var_8ac7cc49 = 0;
    wait(0.1);
    if (isdefined(e_target)) {
        e_target.marked_for_death = 0;
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0xec54ebea, Offset: 0x3218
// Size: 0x2a
function function_3874b38f() {
    var_72714481 = getaiteamarray("axis");
    return var_72714481;
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0x3cb1c409, Offset: 0x3250
// Size: 0xb2
function function_5fc81f0a(e_target) {
    if (!isdefined(level.var_7148b584)) {
        level.var_7148b584 = [];
    } else if (!isarray(level.var_7148b584)) {
        level.var_7148b584 = array(level.var_7148b584);
    }
    if (!isinarray(level.var_7148b584, e_target)) {
        level.var_7148b584[level.var_7148b584.size] = e_target;
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xa11032c5, Offset: 0x3310
// Size: 0x2c
function function_6d783edd(e_target) {
    arrayremovevalue(level.var_7148b584, e_target);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0xc2c6b0bc, Offset: 0x3348
// Size: 0xe
function function_3ebebb9c() {
    return level.var_7148b584;
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x1 linked
// Checksum 0xc7cb7b79, Offset: 0x3360
// Size: 0xb2
function function_25513188(e_target) {
    if (!isdefined(level.var_e51fadba)) {
        level.var_e51fadba = [];
    } else if (!isarray(level.var_e51fadba)) {
        level.var_e51fadba = array(level.var_e51fadba);
    }
    if (!isinarray(level.var_e51fadba, e_target)) {
        level.var_e51fadba[level.var_e51fadba.size] = e_target;
    }
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 1, eflags: 0x0
// Checksum 0xee4b24cb, Offset: 0x3420
// Size: 0x2c
function function_5760b289(e_target) {
    arrayremovevalue(level.var_e51fadba, e_target);
}

// Namespace zm_weap_hand_hemera/zm_weap_hand_hemera
// Params 0, eflags: 0x1 linked
// Checksum 0x5348a08e, Offset: 0x3458
// Size: 0xe
function function_b9a3e6f9() {
    return level.var_e51fadba;
}

