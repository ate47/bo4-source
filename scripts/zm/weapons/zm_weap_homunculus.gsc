#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_ai_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_clone;
#using scripts\zm_common\zm_equipment;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_weap_homunculus;

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x2
// Checksum 0x3b3555d6, Offset: 0x170
// Size: 0x54
function autoexec __init__system__() {
    system::register(#"zm_weap_homunculus", &__init__, &__main__, #"zm_weapons");
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0x99e60e20, Offset: 0x1d0
// Size: 0xa4
function __init__() {
    clientfield::register("scriptmover", "" + #"hash_2d49d2cf3d339e18", 1, 1, "int");
    clientfield::register("scriptmover", "" + #"hash_32c5838be960cfee", 1, 1, "int");
    zm_loadout::register_lethal_grenade_for_level(#"homunculus");
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0xb1d022b8, Offset: 0x280
// Size: 0x284
function __main__() {
    level.w_homunculus = getweapon(#"homunculus");
    level.w_homunculus_upgraded = getweapon(#"homunculus_upgraded");
    if (!function_67a145e5()) {
        return;
    }
    level._effect[#"grenade_samantha_steal"] = #"zombie/fx_monkey_lightning_zmb";
    if (!isdefined(level.var_fe96a4c4)) {
        level.var_fe96a4c4 = [];
    } else if (!isarray(level.var_fe96a4c4)) {
        level.var_fe96a4c4 = array(level.var_fe96a4c4);
    }
    if (!isinarray(level.var_fe96a4c4, level.w_homunculus)) {
        level.var_fe96a4c4[level.var_fe96a4c4.size] = level.w_homunculus;
    }
    if (!isdefined(level.var_fe96a4c4)) {
        level.var_fe96a4c4 = [];
    } else if (!isarray(level.var_fe96a4c4)) {
        level.var_fe96a4c4 = array(level.var_fe96a4c4);
    }
    if (!isinarray(level.var_fe96a4c4, level.w_homunculus_upgraded)) {
        level.var_fe96a4c4[level.var_fe96a4c4.size] = level.w_homunculus_upgraded;
    }
    zm_weapons::register_zombie_weapon_callback(level.w_homunculus, &function_91b8863c);
    zm_weapons::register_zombie_weapon_callback(level.w_homunculus_upgraded, &function_91b8863c);
    level.a_homunculus = [];
    level scene::add_scene_func(#"aib_t8_zm_zod_homunculus_jump_up_01", &function_c6551b38);
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0x94e08c1e, Offset: 0x510
// Size: 0x138
function function_91b8863c() {
    self notify("32d793e4f25fe28f");
    self endon("32d793e4f25fe28f");
    self endon(#"disconnect");
    var_2f916462 = level.var_780d6344;
    if (!isdefined(var_2f916462)) {
        var_2f916462 = 16;
    }
    num_attractors = level.num_monkey_attractors;
    if (!isdefined(num_attractors)) {
        var_bbab4f84 = 32;
    }
    max_attract_dist = level.monkey_attract_dist;
    if (!isdefined(max_attract_dist)) {
        var_c4a5788c = 3000;
    }
    while (true) {
        s_result = self waittill(#"grenade_fire");
        e_grenade = s_result.projectile;
        if (self function_7b1ec82e(s_result)) {
            self thread function_dcaa7a4a(e_grenade, var_bbab4f84, var_c4a5788c, var_2f916462);
        }
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0x1590a37, Offset: 0x650
// Size: 0xd2
function function_7b1ec82e(s_result) {
    if (s_result.weapon == level.w_homunculus || s_result.weapon == level.w_homunculus_upgraded || isdefined(level.w_homunculus_leprechaun) && s_result.weapon == level.w_homunculus_leprechaun) {
        s_result.projectile.use_grenade_special_long_bookmark = 1;
        s_result.projectile.grenade_multiattack_bookmark_count = 1;
        s_result.projectile.weapon = s_result.weapon;
        s_result.projectile.thrower = self;
        return true;
    }
    return false;
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 4, eflags: 0x0
// Checksum 0xfc26f304, Offset: 0x730
// Size: 0x6cc
function function_dcaa7a4a(e_grenade, var_bbab4f84, var_c4a5788c, var_2f916462) {
    e_grenade endoncallback(&function_5e056d93, #"death");
    e_grenade flag::init(#"hash_5e780b1a8f2d1e3b");
    if (self laststand::player_is_in_laststand()) {
        if (isdefined(e_grenade.damagearea)) {
            e_grenade.damagearea delete();
        }
        e_grenade delete();
        return;
    }
    var_515e20e6 = e_grenade.weapon == level.w_homunculus_upgraded;
    if (e_grenade.weapon == getweapon(#"homunculus_leprechaun")) {
        var_9ddf478 = #"hash_5e7f95fc402bc5f8";
    } else {
        var_9ddf478 = #"c_t8_zmb_homunculus_fb1";
    }
    e_grenade ghost();
    e_grenade.angles = self.angles;
    e_grenade.mdl_anchor = util::spawn_model(var_9ddf478, e_grenade.origin, e_grenade.angles);
    e_grenade.mdl_anchor linkto(e_grenade);
    e_grenade.var_53ba8670 = 0;
    level notify(#"homunculus_thrown", {#e_homunculus:e_grenade, #e_player:self});
    if (math::cointoss() && math::cointoss()) {
        e_grenade thread function_4d71ac38(#"hash_8d020e5460f4a95");
        e_grenade.var_53ba8670 = 1;
    } else {
        e_grenade thread function_4d71ac38(#"hash_689f11fd8983d1a6");
    }
    e_grenade thread scene::play(#"aib_t8_zm_zod_homunculus_throw_loop_01", e_grenade.mdl_anchor);
    waitresult = e_grenade waittill(#"stationary");
    e_grenade.var_255a121f = 0;
    e_grenade.mdl_anchor clientfield::set("" + #"hash_32c5838be960cfee", 1);
    e_grenade resetmissiledetonationtime(30);
    var_3fb36683 = e_grenade is_on_navmesh(self);
    if (var_3fb36683 && isdefined(e_grenade.var_45eaa114) && e_grenade.var_45eaa114) {
        if (math::cointoss() && math::cointoss() && !e_grenade.var_53ba8670) {
            e_grenade thread function_4d71ac38(#"hash_6b4fa8bf14690e0c");
            e_grenade.var_255a121f = 1;
        } else {
            e_grenade thread function_4d71ac38(#"hash_1d6e8d28eabdb1fb");
        }
        e_grenade.mdl_anchor unlink();
        e_grenade thread function_6a1f299b(e_grenade.mdl_anchor);
        wait 0.1;
        e_grenade zm_utility::create_zombie_point_of_interest(var_c4a5788c, var_bbab4f84, 10000);
        var_3fb36683 = e_grenade zm_utility::create_zombie_point_of_interest_attractor_positions(undefined, undefined, 128, 1);
        if (var_3fb36683) {
            e_grenade.var_69e642c7 = util::spawn_model("tag_origin", e_grenade.mdl_anchor.origin, e_grenade.mdl_anchor.angles);
            e_grenade.mdl_anchor linkto(e_grenade.var_69e642c7);
            e_grenade thread sndattackvox();
            e_grenade thread function_e383ca2f();
            level.a_homunculus[level.a_homunculus.size] = e_grenade;
            if (!(isdefined(e_grenade.var_255a121f) && e_grenade.var_255a121f)) {
                e_grenade thread function_1dba4a2();
            }
            e_grenade function_f33bde5c(1);
            e_grenade scene::stop();
            e_grenade.var_69e642c7 scene::play(#"aib_t8_zm_zod_homunculus_deploy_01", e_grenade.mdl_anchor);
            e_grenade.var_69e642c7 scene::stop();
            e_grenade notify(#"hash_3e410dbcd9e66000");
            e_grenade thread function_cc9535d0(var_c4a5788c, var_bbab4f84, var_2f916462);
        } else {
            e_grenade zm_utility::deactivate_zombie_point_of_interest();
            e_grenade.script_noteworthy = undefined;
            level thread grenade_stolen_by_sam(e_grenade);
        }
        return;
    }
    e_grenade.script_noteworthy = undefined;
    e_grenade function_4d71ac38(#"hash_51a9b856a9474bab");
    level thread grenade_stolen_by_sam(e_grenade);
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0xd8cc95b8, Offset: 0xe08
// Size: 0xb8
function function_1dba4a2() {
    self endon(#"death", #"hash_3e410dbcd9e66000");
    self.mdl_anchor endon(#"death");
    while (true) {
        waitresult = self.mdl_anchor waittill(#"snddeployvox");
        if (isdefined(waitresult.str_alias)) {
            self.mdl_anchor playsoundontag(waitresult.str_alias, "j_head");
        }
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0x25d5333b, Offset: 0xec8
// Size: 0x9c
function function_5e056d93(str_notify) {
    if (isdefined(self.mdl_anchor)) {
        self.mdl_anchor scene::stop();
        self.mdl_anchor thread util::delayed_delete(0.1);
    }
    if (isdefined(self.var_69e642c7)) {
        self.var_69e642c7 scene::stop();
        self.var_69e642c7 thread util::delayed_delete(0.1);
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0xad90e017, Offset: 0xf70
// Size: 0x166
function function_60b99c5a(grenade) {
    mdl_anchor = grenade.mdl_anchor;
    while (!grenade flag::get(#"hash_5e780b1a8f2d1e3b")) {
        a_zombies = zombie_utility::get_zombie_array();
        foreach (zombie in a_zombies) {
            zombie.n_zombie_custom_goal_radius = 8;
            zombie.v_zombie_custom_goal_pos = mdl_anchor.origin;
        }
        waitframe(1);
    }
    a_zombies = zombie_utility::get_zombie_array();
    foreach (zombie in a_zombies) {
        zombie.v_zombie_custom_goal_pos = undefined;
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0x2c50ae93, Offset: 0x10e0
// Size: 0x140
function get_zombie_targets() {
    self endon(#"death");
    a_ai_zombies = array::get_all_closest(self.origin, getaispeciesarray(level.zombie_team, "all"), undefined, 32, 175);
    var_45a4e11d = [];
    foreach (ai_zombie in a_ai_zombies) {
        if (self function_32b5113(ai_zombie)) {
            if (!isdefined(var_45a4e11d)) {
                var_45a4e11d = [];
            } else if (!isarray(var_45a4e11d)) {
                var_45a4e11d = array(var_45a4e11d);
            }
            var_45a4e11d[var_45a4e11d.size] = ai_zombie;
        }
    }
    return var_45a4e11d;
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0xece56d6e, Offset: 0x1228
// Size: 0x18e
function function_32b5113(ai_zombie) {
    self endon(#"death");
    ai_zombie endon(#"death");
    if (!zm_utility::check_point_in_playable_area(ai_zombie.origin) || isdefined(ai_zombie.var_8ea10940) && ai_zombie.var_8ea10940 || isdefined(ai_zombie.var_68139d12) && ai_zombie.var_68139d12) {
        return false;
    }
    if (!isdefined(ai_zombie.zm_ai_category)) {
        /#
            if (isdefined(ai_zombie.archetype)) {
                println("<dev string:x38>" + ai_zombie.archetype + "<dev string:x5d>");
            }
        #/
        return false;
    }
    n_dist_sq = distancesquared(self.origin, ai_zombie.origin);
    if (n_dist_sq <= 30625) {
        if (bullettracepassed(self.mdl_anchor.origin + (0, 0, 16), ai_zombie getcentroid(), 0, self.mdl_anchor, ai_zombie)) {
            return true;
        }
    }
    return false;
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 3, eflags: 0x0
// Checksum 0x5ca52bac, Offset: 0x13c0
// Size: 0x396
function function_cc9535d0(var_c4a5788c, var_bbab4f84, var_2f916462) {
    self endon(#"death", #"explode");
    b_first_loop = 1;
    while (true) {
        b_attacked = 0;
        while (true) {
            a_ai_zombies = self get_zombie_targets();
            if (!a_ai_zombies.size) {
                if (b_attacked) {
                    b_first_loop = undefined;
                    wait 0.1;
                    self function_f33bde5c();
                    break;
                } else if (isdefined(b_first_loop) && b_first_loop) {
                    b_first_loop = undefined;
                    break;
                } else {
                    wait 0.1;
                    continue;
                }
            }
            for (i = 0; i < a_ai_zombies.size; i++) {
                if (isalive(a_ai_zombies[i]) && self function_32b5113(a_ai_zombies[i])) {
                    self function_bfb923d5(a_ai_zombies[i]);
                    if (!b_attacked) {
                        b_attacked = 1;
                        self.var_69e642c7 scene::stop();
                        if (math::cointoss() && math::cointoss()) {
                            self thread function_4d71ac38(#"hash_22c88cff01a4691b");
                        }
                        self.var_69e642c7 scene::play(#"aib_t8_zm_zod_homunculus_jump_up_01", self.mdl_anchor);
                        self.var_69e642c7 thread scene::play(#"aib_t8_zm_zod_homunculus_attack_01", self.mdl_anchor);
                    }
                    if (isalive(a_ai_zombies[i])) {
                        n_dist = distancesquared(self.origin, a_ai_zombies[i].origin);
                        n_time = n_dist / 48400;
                        n_time *= 0.5;
                        self.var_69e642c7 function_9ef23dc0(a_ai_zombies[i], n_time, self.thrower, self);
                    }
                }
                waitframe(1);
            }
        }
        self.var_69e642c7 thread scene::play(#"aib_t8_zm_zod_homunculus_idle_01", self.mdl_anchor);
        self zm_utility::deactivate_zombie_point_of_interest();
        wait 0.1;
        self zm_utility::create_zombie_point_of_interest(var_c4a5788c, var_bbab4f84, 10000);
        self zm_utility::create_zombie_point_of_interest_attractor_positions(undefined, undefined, 128);
        waitframe(1);
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0xe3c7af19, Offset: 0x1760
// Size: 0x9c
function function_bfb923d5(ai_zombie) {
    v_dir = vectornormalize(ai_zombie.origin - self.origin);
    v_dir = (v_dir[0], v_dir[1], 0);
    v_angles = vectortoangles(v_dir);
    self.var_69e642c7 rotateto(v_angles, 0.15);
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0x8638cd6b, Offset: 0x1808
// Size: 0xac
function function_c6551b38(var_dd74d130) {
    var_dd74d130[#"homunculus"] endon(#"death");
    var_dd74d130[#"homunculus"] waittill(#"jumped");
    var_69e642c7 = var_dd74d130[#"homunculus"] getlinkedent();
    var_69e642c7 movez(40, 0.35);
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 2, eflags: 0x0
// Checksum 0x5f078bdf, Offset: 0x18c0
// Size: 0x25a
function function_2c022ba8(e_player, e_grenade) {
    var_b1c1c5cf = zm_equipment::function_7d948481(0.1, 0.25, 0.25, 1);
    var_5d7b4163 = zm_equipment::function_379f6b5d(500, var_b1c1c5cf, 1, 4, 50);
    switch (self.zm_ai_category) {
    case #"popcorn":
    case #"basic":
    case #"enhanced":
        self playsound(#"hash_3a99f739009a77fa");
        if (math::cointoss() && math::cointoss()) {
            e_grenade thread function_4d71ac38(#"hash_ba5815eb0dc4d97");
        }
        self dodamage(var_5d7b4163, self.origin, e_player, undefined, undefined, "MOD_UNKNOWN", 0, level.w_homunculus, undefined, 1);
        if (self.health <= 0 && self.archetype == #"zombie") {
            gibserverutils::gibhead(self);
        }
        break;
    case #"heavy":
    case #"miniboss":
        self playsound(#"hash_3a99f739009a77fa");
        self dodamage(var_5d7b4163, self.origin, e_player, undefined, undefined, "MOD_UNKNOWN", 0, level.w_homunculus);
        self ai::stun(1.5);
        break;
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 4, eflags: 0x0
// Checksum 0xf4f63ea8, Offset: 0x1b28
// Size: 0x13c
function function_9ef23dc0(ai_zombie, n_time, e_player, e_grenade) {
    self movez(16, n_time);
    self waittill(#"movedone");
    if (isalive(ai_zombie)) {
        ai_zombie thread function_45eb4c80();
        v_target = ai_zombie gettagorigin("j_head");
        if (!isdefined(v_target)) {
            v_target = ai_zombie getcentroid() + (0, 0, 16);
        }
        self moveto(v_target, n_time);
        self waittill(#"movedone");
        if (isalive(ai_zombie)) {
            ai_zombie function_2c022ba8(e_player, e_grenade);
        }
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x4
// Checksum 0x9f7736de, Offset: 0x1c70
// Size: 0xc2
function private function_45eb4c80() {
    self endon(#"death");
    self.var_8ea10940 = 1;
    switch (self.zm_ai_category) {
    case #"heavy":
        n_cooldown_time = 3;
        break;
    case #"miniboss":
        n_cooldown_time = 6;
        break;
    case #"boss":
        n_cooldown_time = 10;
        break;
    default:
        n_cooldown_time = 3;
        break;
    }
    wait n_cooldown_time;
    self.var_8ea10940 = undefined;
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0xc189257c, Offset: 0x1d40
// Size: 0x12a
function debug_draw_new_attractor_positions() {
    self endon(#"death");
    while (true) {
        foreach (attract in self.attractor_positions) {
            passed = bullettracepassed(attract + (0, 0, 24), self.origin + (0, 0, 24), 0, self);
            if (passed) {
                /#
                    debugstar(attract, 6, (0, 1, 0));
                #/
                continue;
            }
            /#
                debugstar(attract, 6, (1, 0, 0));
            #/
        }
        waitframe(1);
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0xa35d0403, Offset: 0x1e78
// Size: 0x78
function function_6a1f299b(e_parent) {
    self notify(#"fakelinkto");
    self endon(#"fakelinkto", #"death");
    while (true) {
        self.origin = e_parent.origin;
        self.angles = e_parent.angles;
        waitframe(1);
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0x1f90d3a6, Offset: 0x1ef8
// Size: 0x68
function sndattackvox() {
    self endon(#"explode");
    while (true) {
        self waittill(#"sndkillvox");
        wait 0.25;
        self playsound(#"wpn_octobomb_attack_vox");
        wait 2.5;
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0x7f5d991a, Offset: 0x1f68
// Size: 0x1a
function function_67a145e5() {
    return zm_weapons::is_weapon_included(level.w_homunculus);
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0xc124c45, Offset: 0x1f90
// Size: 0x270
function is_on_navmesh(e_player) {
    self endon(#"death");
    if (isdefined(e_player)) {
        e_player endon(#"death");
        e_origin = e_player.origin;
    } else {
        e_origin = self.origin;
    }
    if (ispointonnavmesh(self.origin, 60) == 1) {
        self.var_45eaa114 = 1;
        return true;
    }
    v_valid_point = getclosestpointonnavmesh(self.origin, 150, 12);
    if (isdefined(v_valid_point)) {
        var_3fb36683 = zm_utility::check_point_in_enabled_zone(v_valid_point, undefined, undefined);
        if (!(isdefined(var_3fb36683) && var_3fb36683)) {
            v_dir = vectornormalize(e_origin - self.origin);
            v_pos = self.origin + v_dir * 24;
            v_valid_point = getclosestpointonnavmesh(v_pos, 150, 12);
            if (isdefined(v_valid_point)) {
                var_3fb36683 = zm_utility::check_point_in_enabled_zone(v_valid_point, undefined, undefined);
                if (!(isdefined(var_3fb36683) && var_3fb36683)) {
                    v_valid_point = undefined;
                }
            }
        }
    }
    if (isdefined(v_valid_point)) {
        n_z_correct = 0;
        if (self.origin[2] > v_valid_point[2]) {
            n_z_correct = self.origin[2] - v_valid_point[2];
        }
        self.origin = v_valid_point + (0, 0, n_z_correct);
        if (isdefined(self.mdl_anchor)) {
            self.mdl_anchor.origin = self.origin;
        }
        self.var_45eaa114 = 1;
        return true;
    }
    self.var_45eaa114 = 0;
    return false;
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0x413d7f5c, Offset: 0x2208
// Size: 0x2dc
function grenade_stolen_by_sam(e_grenade) {
    if (!isdefined(e_grenade)) {
        return;
    }
    direction = e_grenade.origin;
    direction = (direction[1], direction[0], 0);
    if (direction[1] < 0 || direction[0] > 0 && direction[1] > 0) {
        direction = (direction[0], direction[1] * -1, 0);
    } else if (direction[0] < 0) {
        direction = (direction[0] * -1, direction[1], 0);
    }
    if (!(isdefined(e_grenade.sndnosamlaugh) && e_grenade.sndnosamlaugh)) {
        players = getplayers();
        for (i = 0; i < players.size; i++) {
            if (isalive(players[i])) {
                players[i] playlocalsound(level.zmb_laugh_alias);
            }
        }
    }
    playfxontag(level._effect[#"grenade_samantha_steal"], e_grenade, "tag_origin");
    e_grenade scene::stop();
    e_grenade.mdl_anchor scene::stop();
    e_grenade.mdl_anchor unlink();
    e_grenade.mdl_anchor movez(60, 1);
    e_grenade.mdl_anchor vibrate(direction, 1.5, 2.5, 1);
    e_grenade.mdl_anchor waittilltimeout(5, #"movedone");
    e_grenade.mdl_anchor delete();
    if (isdefined(e_grenade)) {
        if (isdefined(e_grenade.damagearea)) {
            e_grenade.damagearea delete();
        }
        e_grenade delete();
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x0
// Checksum 0x1234e898, Offset: 0x24f0
// Size: 0x1ec
function function_e383ca2f() {
    self endoncallback(&function_5e056d93, #"death");
    self waittilltimeout(15, #"hash_90cfd38343f41f2");
    self function_4d71ac38(#"hash_6e471fde121d0263", 1);
    self notify(#"explode");
    self function_f33bde5c();
    self.var_69e642c7 scene::stop();
    self.var_69e642c7 scene::play(#"aib_t8_zm_zod_homunculus_dth_01", self.mdl_anchor);
    mdl_anchor = self.mdl_anchor;
    mdl_anchor clientfield::set("" + #"hash_2d49d2cf3d339e18", 1);
    self flag::set(#"hash_5e780b1a8f2d1e3b");
    wait 0.2;
    mdl_anchor delete();
    for (i = 0; i < level.a_homunculus.size; i++) {
        if (!isdefined(level.a_homunculus[i])) {
            arrayremoveindex(level.a_homunculus, i);
            break;
        }
    }
    self.var_69e642c7 delete();
    self delete();
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 1, eflags: 0x0
// Checksum 0x4fbb1a68, Offset: 0x26e8
// Size: 0x224
function function_f33bde5c(b_immediate = 0) {
    self endon(#"death", #"explode");
    s_trace = groundtrace(self.mdl_anchor.origin + (0, 0, 16), self.mdl_anchor.origin + (0, 0, -1000), 0, self.mdl_anchor);
    var_a75fe4be = s_trace[#"position"];
    if (isdefined(s_trace[#"entity"])) {
        var_a75fe4be = (var_a75fe4be[0], var_a75fe4be[1], s_trace[#"entity"].origin[2]);
    }
    if (b_immediate) {
        self.var_69e642c7 moveto(var_a75fe4be, 0.01);
        self.var_69e642c7 waittill(#"movedone");
        return;
    }
    if (abs(self.var_69e642c7.origin[2] - var_a75fe4be[2]) > 1) {
        n_time = 0.25;
        self.var_69e642c7 scene::stop();
        self.var_69e642c7 moveto(var_a75fe4be, 0.25);
        self.var_69e642c7 scene::play(#"aib_t8_zm_zod_homunculus_jump_down_01", self.mdl_anchor);
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 2, eflags: 0x0
// Checksum 0x9c8fa7fd, Offset: 0x2918
// Size: 0x8c
function function_4d71ac38(str_alias, var_f2aa64f7 = 0) {
    if (var_f2aa64f7) {
        self.mdl_anchor zm_vo::vo_stop();
    }
    if (self depthinwater() < 6) {
        self.mdl_anchor zm_vo::vo_say(str_alias, undefined, undefined, undefined, 1, undefined, 1);
    }
}

