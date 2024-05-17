// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_shared.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_weap_thundergun;

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x2
// Checksum 0x8622c7b7, Offset: 0x2b0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_weap_thundergun", &__init__, &__main__, undefined);
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0x31247f50, Offset: 0x300
// Size: 0x94
function __init__() {
    level.w_thundergun = getweapon(#"thundergun");
    level.w_thundergun_upgraded = getweapon(#"thundergun_upgraded");
    clientfield::register("actor", "" + #"hash_7549405bcfcbcfb", 24000, 1, "counter");
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0x32b5a5c6, Offset: 0x3a0
// Size: 0x204
function __main__() {
    level._effect[#"thundergun_knockdown_ground"] = "tools/fx_null";
    level._effect[#"thundergun_smoke_cloud"] = "tools/fx_null";
    zombie_utility::set_zombie_var(#"thundergun_cylinder_radius", 180);
    zombie_utility::set_zombie_var(#"thundergun_fling_range", 480);
    zombie_utility::set_zombie_var(#"thundergun_gib_range", 900);
    zombie_utility::set_zombie_var(#"thundergun_gib_damage", 75);
    zombie_utility::set_zombie_var(#"thundergun_knockdown_range", 1200);
    zombie_utility::set_zombie_var(#"thundergun_knockdown_damage", 15);
    level.thundergun_gib_refs = [];
    level.thundergun_gib_refs[level.thundergun_gib_refs.size] = "guts";
    level.thundergun_gib_refs[level.thundergun_gib_refs.size] = "right_arm";
    level.thundergun_gib_refs[level.thundergun_gib_refs.size] = "left_arm";
    level.basic_zombie_thundergun_knockdown = &zombie_knockdown;
    /#
        level thread thundergun_devgui_dvar_think();
    #/
    callback::on_connect(&thundergun_on_player_connect);
}

/#

    // Namespace zm_weap_thundergun/zm_weap_thundergun
    // Params 0, eflags: 0x0
    // Checksum 0x7932e017, Offset: 0x5b0
    // Size: 0x368
    function thundergun_devgui_dvar_think() {
        if (!zm_weapons::is_weapon_included(level.w_thundergun)) {
            return;
        }
        setdvar(#"scr_thundergun_cylinder_radius", zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius"));
        setdvar(#"scr_thundergun_fling_range", zombie_utility::function_d2dfacfd(#"thundergun_fling_range"));
        setdvar(#"scr_thundergun_gib_range", zombie_utility::function_d2dfacfd(#"thundergun_gib_range"));
        setdvar(#"scr_thundergun_gib_damage", zombie_utility::function_d2dfacfd(#"thundergun_gib_damage"));
        setdvar(#"scr_thundergun_knockdown_range", zombie_utility::function_d2dfacfd(#"thundergun_knockdown_range"));
        setdvar(#"scr_thundergun_knockdown_damage", zombie_utility::function_d2dfacfd(#"thundergun_knockdown_damage"));
        for (;;) {
            zombie_utility::set_zombie_var(#"thundergun_cylinder_radius", getdvarint(#"scr_thundergun_cylinder_radius", 0));
            zombie_utility::set_zombie_var(#"thundergun_fling_range", getdvarint(#"scr_thundergun_fling_range", 0));
            zombie_utility::set_zombie_var(#"thundergun_gib_range", getdvarint(#"scr_thundergun_gib_range", 0));
            zombie_utility::set_zombie_var(#"thundergun_gib_damage", getdvarint(#"scr_thundergun_gib_damage", 0));
            zombie_utility::set_zombie_var(#"thundergun_knockdown_range", getdvarint(#"scr_thundergun_knockdown_range", 0));
            zombie_utility::set_zombie_var(#"thundergun_knockdown_damage", getdvarint(#"scr_thundergun_knockdown_damage", 0));
            wait(0.5);
        }
    }

#/

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0x1cca2754, Offset: 0x920
// Size: 0x1c
function thundergun_on_player_connect() {
    self thread wait_for_thundergun_fired();
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0x9cd50703, Offset: 0x948
// Size: 0x150
function wait_for_thundergun_fired() {
    self endon(#"disconnect");
    self waittill(#"spawned_player");
    for (;;) {
        self waittill(#"weapon_fired");
        currentweapon = self getcurrentweapon();
        if (currentweapon == level.w_thundergun || currentweapon == level.w_thundergun_upgraded) {
            self thread thundergun_fired();
            view_pos = self gettagorigin("tag_flash") - self getplayerviewheight();
            view_angles = self gettagangles("tag_flash");
            playfx(level._effect[#"thundergun_smoke_cloud"], view_pos, anglestoforward(view_angles), anglestoup(view_angles));
        }
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x0
// Checksum 0xc810c5f4, Offset: 0xaa0
// Size: 0x54
function thundergun_network_choke() {
    level.thundergun_network_choke_count++;
    if (!(level.thundergun_network_choke_count % 10)) {
        util::wait_network_frame();
        util::wait_network_frame();
        util::wait_network_frame();
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0xcd7141b6, Offset: 0xb00
// Size: 0x5c
function thundergun_fired() {
    physicsexplosioncylinder(self.origin, 600, 240, 1);
    self thread function_742cb66e();
    self thread thundergun_affect_ais();
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0xc5015e85, Offset: 0xb68
// Size: 0x156
function thundergun_affect_ais() {
    if (!isdefined(level.thundergun_knockdown_enemies)) {
        level.thundergun_fling_enemies = [];
        level.thundergun_fling_vecs = [];
        level.thundergun_knockdown_enemies = [];
        level.thundergun_knockdown_gib = [];
    }
    self thundergun_get_enemies_in_range();
    level.thundergun_network_choke_count = 0;
    for (i = 0; i < level.thundergun_fling_enemies.size; i++) {
        level.thundergun_fling_enemies[i] thread thundergun_fling_zombie(self, level.thundergun_fling_vecs[i], i);
    }
    for (i = 0; i < level.thundergun_knockdown_enemies.size; i++) {
        level.thundergun_knockdown_enemies[i] thread thundergun_knockdown_zombie(self, level.thundergun_knockdown_gib[i]);
    }
    level.thundergun_knockdown_enemies = [];
    level.thundergun_knockdown_gib = [];
    level.thundergun_fling_enemies = [];
    level.thundergun_fling_vecs = [];
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0x9d2f02e9, Offset: 0xcc8
// Size: 0x756
function thundergun_get_enemies_in_range() {
    view_pos = self getweaponmuzzlepoint();
    zombies = array::get_all_closest(view_pos, getaiteamarray(level.zombie_team), undefined, undefined, zombie_utility::function_d2dfacfd(#"thundergun_knockdown_range"));
    if (!isdefined(zombies)) {
        return;
    }
    knockdown_range_squared = zombie_utility::function_d2dfacfd(#"thundergun_knockdown_range") * zombie_utility::function_d2dfacfd(#"thundergun_knockdown_range");
    gib_range_squared = zombie_utility::function_d2dfacfd(#"thundergun_gib_range") * zombie_utility::function_d2dfacfd(#"thundergun_gib_range");
    fling_range_squared = zombie_utility::function_d2dfacfd(#"thundergun_fling_range") * zombie_utility::function_d2dfacfd(#"thundergun_fling_range");
    cylinder_radius_squared = zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius") * zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius");
    forward_view_angles = self getweaponforwarddir();
    end_pos = view_pos + vectorscale(forward_view_angles, zombie_utility::function_d2dfacfd(#"thundergun_knockdown_range"));
    /#
        if (2 == getdvarint(#"scr_thundergun_debug", 0)) {
            near_circle_pos = view_pos + vectorscale(forward_view_angles, 2);
            circle(near_circle_pos, zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius"), (1, 0, 0), 0, 0, 100);
            line(near_circle_pos, end_pos, (0, 0, 1), 1, 0, 100);
            circle(end_pos, zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius"), (1, 0, 0), 0, 0, 100);
        }
    #/
    for (i = 0; i < zombies.size; i++) {
        if (!isdefined(zombies[i]) || !isalive(zombies[i])) {
            continue;
        }
        test_origin = zombies[i] getcentroid();
        test_range_squared = distancesquared(view_pos, test_origin);
        if (test_range_squared > knockdown_range_squared) {
            zombies[i] thundergun_debug_print("range", (1, 0, 0));
            return;
        }
        normal = vectornormalize(test_origin - view_pos);
        dot = vectordot(forward_view_angles, normal);
        if (0 > dot) {
            zombies[i] thundergun_debug_print("dot", (1, 0, 0));
            continue;
        }
        radial_origin = pointonsegmentnearesttopoint(view_pos, end_pos, test_origin);
        if (distancesquared(test_origin, radial_origin) > cylinder_radius_squared) {
            zombies[i] thundergun_debug_print("cylinder", (1, 0, 0));
            continue;
        }
        if (0 == zombies[i] damageconetrace(view_pos, self)) {
            zombies[i] thundergun_debug_print("cone", (1, 0, 0));
            continue;
        }
        if (test_range_squared < fling_range_squared) {
            level.thundergun_fling_enemies[level.thundergun_fling_enemies.size] = zombies[i];
            dist_mult = (fling_range_squared - test_range_squared) / fling_range_squared;
            fling_vec = vectornormalize(test_origin - view_pos);
            if (5000 < test_range_squared) {
                fling_vec += vectornormalize(test_origin - radial_origin);
            }
            fling_vec = (fling_vec[0], fling_vec[1], abs(fling_vec[2]));
            fling_vec = vectorscale(fling_vec, 100 + 100 * dist_mult);
            level.thundergun_fling_vecs[level.thundergun_fling_vecs.size] = fling_vec;
            zombies[i] thread setup_thundergun_vox(self, 1, 0, 0);
            continue;
        }
        if (test_range_squared < gib_range_squared) {
            level.thundergun_knockdown_enemies[level.thundergun_knockdown_enemies.size] = zombies[i];
            level.thundergun_knockdown_gib[level.thundergun_knockdown_gib.size] = 1;
            zombies[i] thread setup_thundergun_vox(self, 0, 1, 0);
            continue;
        }
        level.thundergun_knockdown_enemies[level.thundergun_knockdown_enemies.size] = zombies[i];
        level.thundergun_knockdown_gib[level.thundergun_knockdown_gib.size] = 0;
        zombies[i] thread setup_thundergun_vox(self, 0, 0, 1);
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0x7dcfb438, Offset: 0x1428
// Size: 0x390
function function_742cb66e() {
    view_pos = self getweaponmuzzlepoint();
    forward_view_angles = self getweaponforwarddir();
    end_pos = view_pos + vectorscale(forward_view_angles, zombie_utility::function_d2dfacfd(#"thundergun_fling_range"));
    fling_range_squared = zombie_utility::function_d2dfacfd(#"thundergun_fling_range") * zombie_utility::function_d2dfacfd(#"thundergun_fling_range");
    cylinder_radius_squared = zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius") * zombie_utility::function_d2dfacfd(#"thundergun_cylinder_radius");
    var_566b3847 = getentitiesinradius(view_pos, zombie_utility::function_d2dfacfd(#"thundergun_fling_range"));
    var_d87c5b04 = array::get_all_closest(view_pos, trigger::get_all(), undefined, undefined, zombie_utility::function_d2dfacfd(#"thundergun_fling_range"));
    var_550c20e0 = arraycombine(var_566b3847, var_d87c5b04, 0, 0);
    foreach (var_c006f5e9 in var_550c20e0) {
        if (!isactor(var_c006f5e9) && !isvehicle(var_c006f5e9)) {
            test_origin = var_c006f5e9 getcentroid();
            test_range_squared = distancesquared(view_pos, test_origin);
            normal = vectornormalize(test_origin - view_pos);
            dot = vectordot(forward_view_angles, normal);
            if (0 > dot) {
                continue;
            }
            radial_origin = pointonsegmentnearesttopoint(view_pos, end_pos, test_origin);
            if (distancesquared(test_origin, radial_origin) > cylinder_radius_squared) {
                continue;
            }
            if (0 == var_c006f5e9 damageconetrace(view_pos, self)) {
                continue;
            }
            var_c006f5e9 dodamage(level.zombie_health, var_c006f5e9.origin, self);
        }
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 2, eflags: 0x1 linked
// Checksum 0x33bdabfd, Offset: 0x17c0
// Size: 0x8c
function thundergun_debug_print(msg, color) {
    /#
        if (!getdvarint(#"scr_thundergun_debug", 0)) {
            return;
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        print3d(self.origin + (0, 0, 60), msg, color, 1, 1, 40);
    #/
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 3, eflags: 0x1 linked
// Checksum 0xf2f9d413, Offset: 0x1858
// Size: 0x14c
function thundergun_fling_zombie(player, fling_vec, index) {
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (isdefined(self.var_4462c95e)) {
        self [[ self.var_4462c95e ]](player);
        return;
    }
    self.deathpoints_already_given = 1;
    self dodamage(self.health + 666, player.origin, player);
    if (self.health <= 0) {
        if (isdefined(player) && isdefined(level.hero_power_update)) {
            level thread [[ level.hero_power_update ]](player, self);
        }
        self startragdoll();
        self launchragdoll(fling_vec);
        self.thundergun_death = 1;
    }
    self clientfield::increment("" + #"hash_7549405bcfcbcfb", 1);
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 2, eflags: 0x1 linked
// Checksum 0xa9c46e17, Offset: 0x19b0
// Size: 0x154
function zombie_knockdown(player, gib) {
    if (gib && !self.gibbed) {
        self.a.gib_ref = array::random(level.thundergun_gib_refs);
        self thread zombie_death::do_gib();
    }
    if (isdefined(level.override_thundergun_damage_func)) {
        self [[ level.override_thundergun_damage_func ]](player, gib);
        return;
    }
    damage = zombie_utility::function_d2dfacfd(#"thundergun_knockdown_damage");
    self playsound(#"fly_thundergun_forcehit");
    self.thundergun_handle_pain_notetracks = &handle_thundergun_pain_notetracks;
    self dodamage(damage, player.origin, player);
    self animcustom(&playthundergunpainanim);
    self zombie_utility::setup_zombie_knockdown(player);
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x1 linked
// Checksum 0xd776e2d8, Offset: 0x1b10
// Size: 0x25c
function playthundergunpainanim() {
    self notify(#"end_play_thundergun_pain_anim");
    self endon(#"killanimscript", #"death", #"end_play_thundergun_pain_anim");
    if (isdefined(self.marked_for_death) && self.marked_for_death) {
        return;
    }
    if (self.damageyaw <= -135 || self.damageyaw >= 135) {
        if (self.missinglegs) {
            fallanim = "zm_thundergun_fall_front_crawl";
        } else {
            fallanim = "zm_thundergun_fall_front";
        }
        getupanim = "zm_thundergun_getup_belly_early";
    } else if (self.damageyaw > -135 && self.damageyaw < -45) {
        fallanim = "zm_thundergun_fall_left";
        getupanim = "zm_thundergun_getup_belly_early";
    } else if (self.damageyaw > 45 && self.damageyaw < 135) {
        fallanim = "zm_thundergun_fall_right";
        getupanim = "zm_thundergun_getup_belly_early";
    } else {
        fallanim = "zm_thundergun_fall_back";
        if (randomint(100) < 50) {
            getupanim = "zm_thundergun_getup_back_early";
        } else {
            getupanim = "zm_thundergun_getup_back_late";
        }
    }
    self setanimstatefromasd(fallanim);
    self zombie_shared::donotetracks("thundergun_fall_anim", self.thundergun_handle_pain_notetracks);
    if (!isdefined(self) || !isalive(self) || self.missinglegs || isdefined(self.marked_for_death) && self.marked_for_death) {
        return;
    }
    self setanimstatefromasd(getupanim);
    self zombie_shared::donotetracks("thundergun_getup_anim");
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 2, eflags: 0x1 linked
// Checksum 0xa4ba2236, Offset: 0x1d78
// Size: 0xcc
function thundergun_knockdown_zombie(player, gib) {
    self endon(#"death");
    playsoundatposition(#"wpn_thundergun_proj_impact", self.origin);
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (isdefined(self.thundergun_knockdown_func)) {
        self [[ self.thundergun_knockdown_func ]](player, gib);
        self clientfield::increment("" + #"hash_7549405bcfcbcfb", 1);
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 1, eflags: 0x1 linked
// Checksum 0x907e4674, Offset: 0x1e50
// Size: 0x9c
function handle_thundergun_pain_notetracks(note) {
    if (note == "zombie_knockdown_ground_impact") {
        playfx(level._effect[#"thundergun_knockdown_ground"], self.origin, anglestoforward(self.angles), anglestoup(self.angles));
        self playsound(#"fly_thundergun_forcehit");
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x0
// Checksum 0x91c638e7, Offset: 0x1ef8
// Size: 0x58
function is_thundergun_damage() {
    return (self.damageweapon == level.w_thundergun || self.damageweapon == level.w_thundergun_upgraded) && self.damagemod != "MOD_GRENADE" && self.damagemod != "MOD_GRENADE_SPLASH";
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x0
// Checksum 0x91443321, Offset: 0x1f58
// Size: 0x18
function enemy_killed_by_thundergun() {
    return isdefined(self.thundergun_death) && self.thundergun_death;
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 0, eflags: 0x0
// Checksum 0x3eeab44d, Offset: 0x1f78
// Size: 0x158
function thundergun_sound_thread() {
    self endon(#"disconnect");
    self waittill(#"spawned_player");
    for (;;) {
        result = self waittill(#"grenade_fire", #"death", #"player_downed", #"weapon_change", #"grenade_pullback", #"disconnect");
        if ((result._notify == "weapon_change" || result._notify == "grenade_fire") && self getcurrentweapon() == level.w_thundergun) {
            self playloopsound(#"tesla_idle", 0.25);
            continue;
        }
        self notify(#"weap_away");
        self stoploopsound(0.25);
    }
}

// Namespace zm_weap_thundergun/zm_weap_thundergun
// Params 4, eflags: 0x1 linked
// Checksum 0x326a1c73, Offset: 0x20d8
// Size: 0xe4
function setup_thundergun_vox(player, fling, gib, knockdown) {
    if (!isdefined(self) || !isalive(self)) {
        return;
    }
    if (!fling && (gib || knockdown)) {
        if (25 < randomintrange(1, 100)) {
        }
    }
    if (fling) {
        if (30 > randomintrange(1, 100)) {
            player zm_audio::create_and_play_dialog(#"kill", #"thundergun");
        }
    }
}

