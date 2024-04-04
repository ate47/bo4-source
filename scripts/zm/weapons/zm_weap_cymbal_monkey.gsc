// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_laststand.gsc;
#using scripts\zm_common\zm_equipment.gsc;
#using scripts\zm_common\zm_clone.gsc;
#using scripts\zm_common\zm.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_weap_cymbal_monkey;

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x2
// Checksum 0x42675efe, Offset: 0x198
// Size: 0x54
function autoexec __init__system__() {
    system::register(#"zm_weap_cymbal_monkey", &__init__, &__main__, #"zm_weapons");
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0xfcd31b99, Offset: 0x1f8
// Size: 0xe4
function __init__() {
    level.weaponzmcymbalmonkey = getweapon(#"cymbal_monkey");
    zm_weapons::register_zombie_weapon_callback(level.weaponzmcymbalmonkey, &player_give_cymbal_monkey);
    zm_loadout::register_lethal_grenade_for_level(#"cymbal_monkey");
    clientfield::register("scriptmover", "" + #"hash_60a7e5b79e8064a5", 1, 1, "int");
    zm::function_84d343d(#"cymbal_monkey", &function_3681e2bc);
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0x61a48dda, Offset: 0x2e8
// Size: 0x182
function __main__() {
    if (!cymbal_monkey_exists()) {
        return;
    }
    /#
        level.zombiemode_devgui_cymbal_monkey_give = &player_give_cymbal_monkey;
    #/
    if (isdefined(level.legacy_cymbal_monkey) && level.legacy_cymbal_monkey) {
        level.cymbal_monkey_model = "weapon_zombie_monkey_bomb";
    } else {
        level.cymbal_monkey_model = "wpn_t7_zmb_monkey_bomb_world";
    }
    level._effect[#"monkey_glow"] = #"zm_weapons/fx8_cymbal_monkey_light";
    level._effect[#"grenade_samantha_steal"] = #"hash_7965ec9e0938553f";
    level.cymbal_monkeys = [];
    level.var_2f2478f2 = 1;
    if (!isdefined(level.valid_poi_max_radius)) {
        level.valid_poi_max_radius = 150;
    }
    if (!isdefined(level.valid_poi_half_height)) {
        level.valid_poi_half_height = 100;
    }
    if (!isdefined(level.valid_poi_inner_spacing)) {
        level.valid_poi_inner_spacing = 2;
    }
    if (!isdefined(level.valid_poi_radius_from_edges)) {
        level.valid_poi_radius_from_edges = 16;
    }
    if (!isdefined(level.valid_poi_height)) {
        level.valid_poi_height = 36;
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 12, eflags: 0x1 linked
// Checksum 0xa7ee9af3, Offset: 0x478
// Size: 0xea
function function_3681e2bc(inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype) {
    if (meansofdeath === "MOD_IMPACT") {
        return 0;
    }
    var_b1c1c5cf = zm_equipment::function_7d948481(0.1, 0.25, 1, 1);
    var_5d7b4163 = zm_equipment::function_379f6b5d(damage, var_b1c1c5cf, 1, 4, 50);
    return var_5d7b4163;
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0xc5822134, Offset: 0x570
// Size: 0x64
function player_give_cymbal_monkey() {
    w_weapon = level.weaponzmcymbalmonkey;
    if (!self hasweapon(w_weapon)) {
        self giveweapon(w_weapon);
    }
    self thread player_handle_cymbal_monkey();
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0xac0c740e, Offset: 0x5e0
// Size: 0xfe
function player_handle_cymbal_monkey() {
    self notify(#"starting_monkey_watch");
    self endon(#"starting_monkey_watch", #"disconnect");
    attract_dist_diff = level.monkey_attract_dist_diff;
    if (!isdefined(attract_dist_diff)) {
        attract_dist_diff = 16;
    }
    num_attractors = level.num_monkey_attractors;
    if (!isdefined(num_attractors)) {
        num_attractors = 32;
    }
    max_attract_dist = level.monkey_attract_dist;
    if (!isdefined(max_attract_dist)) {
        max_attract_dist = 3000;
    }
    while (true) {
        grenade = get_thrown_monkey();
        self player_throw_cymbal_monkey(grenade, num_attractors, max_attract_dist, attract_dist_diff);
        waitframe(1);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x8bb8dbb0, Offset: 0x6e8
// Size: 0x104
function watch_for_dud(actor) {
    self endon(#"death");
    self waittill(#"grenade_dud");
    self.mdl_monkey.dud = 1;
    self playsound(#"zmb_vox_monkey_scream");
    self.monk_scream_vox = 1;
    wait(3);
    if (isdefined(self.mdl_monkey)) {
        self.mdl_monkey delete();
    }
    if (isdefined(actor)) {
        actor delete();
    }
    if (isdefined(self.damagearea)) {
        self.damagearea delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x8d2069c1, Offset: 0x7f8
// Size: 0x1ec
function watch_for_emp(actor) {
    self endon(#"death");
    if (!zm_utility::should_watch_for_emp()) {
        return;
    }
    while (true) {
        waitresult = level waittill(#"emp_detonate");
        if (distancesquared(waitresult.position, self.origin) < waitresult.radius * waitresult.radius) {
            break;
        }
    }
    self.stun_fx = 1;
    if (isdefined(level._equipment_emp_destroy_fx)) {
        playfx(level._equipment_emp_destroy_fx, self.origin + (0, 0, 5), (0, randomfloat(360), 0));
    }
    wait(0.15);
    self.attract_to_origin = 0;
    self zm_utility::deactivate_zombie_point_of_interest();
    wait(1);
    self detonate();
    wait(1);
    if (isdefined(self.mdl_monkey)) {
        self.mdl_monkey delete();
    }
    if (isdefined(actor)) {
        actor delete();
    }
    if (isdefined(self.damagearea)) {
        self.damagearea delete();
    }
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x60f0a34d, Offset: 0x9f0
// Size: 0x58
function clone_player_angles(owner) {
    self endon(#"death");
    owner endon(#"death");
    while (isdefined(self)) {
        self.angles = owner.angles;
        waitframe(1);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x18e7eb92, Offset: 0xa50
// Size: 0xb6
function show_briefly(showtime) {
    self endon(#"show_owner");
    if (isdefined(self.show_for_time)) {
        self.show_for_time = showtime;
        return;
    }
    self.show_for_time = showtime;
    self setvisibletoall();
    while (self.show_for_time > 0) {
        self.show_for_time = self.show_for_time - 0.05;
        waitframe(1);
    }
    self setvisibletoallexceptteam(level.zombie_team);
    self.show_for_time = undefined;
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0xf359d543, Offset: 0xb10
// Size: 0xb0
function show_owner_on_attack(owner) {
    owner endon(#"hide_owner", #"show_owner");
    self endon(#"explode", #"death", #"grenade_dud");
    owner.show_for_time = undefined;
    for (;;) {
        owner waittill(#"weapon_fired");
        owner thread show_briefly(0.5);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x1185cdde, Offset: 0xbc8
// Size: 0x23c
function hide_owner(owner) {
    owner notify(#"hide_owner");
    owner endon(#"hide_owner");
    owner setperk("specialty_immunemms");
    owner.no_burning_sfx = 1;
    owner notify(#"stop_flame_sounds");
    owner setvisibletoallexceptteam(level.zombie_team);
    owner.hide_owner = 1;
    if (isdefined(level._effect[#"human_disappears"])) {
        playfx(level._effect[#"human_disappears"], owner.origin);
    }
    self thread show_owner_on_attack(owner);
    evt = self waittill(#"explode", #"death", #"grenade_dud");
    println("<unknown string>" + evt._notify);
    owner notify(#"show_owner");
    owner unsetperk("specialty_immunemms");
    if (isdefined(level._effect[#"human_disappears"])) {
        playfx(level._effect[#"human_disappears"], owner.origin);
    }
    owner.no_burning_sfx = undefined;
    owner setvisibletoall();
    owner.hide_owner = undefined;
    owner show();
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0xd1334175, Offset: 0xe10
// Size: 0x27c
function proximity_detonate(owner) {
    wait(1.5);
    if (!isdefined(self)) {
        return;
    }
    detonateradius = 96;
    explosionradius = detonateradius * 2;
    damagearea = spawn("trigger_radius", self.origin + (0, 0, 0 - detonateradius), 512 | 4, detonateradius, detonateradius * 1.5);
    damagearea setexcludeteamfortrigger(owner.team);
    damagearea enablelinkto();
    damagearea linkto(self);
    self.damagearea = damagearea;
    while (isdefined(self)) {
        waitresult = damagearea waittill(#"trigger");
        ent = waitresult.activator;
        if (isdefined(owner) && ent == owner) {
            continue;
        }
        if (isdefined(ent.team) && ent.team == owner.team) {
            continue;
        }
        self playsound(#"wpn_claymore_alert");
        dist = distance(self.origin, ent.origin);
        radiusdamage(self.origin + (0, 0, 12), explosionradius, 1, 1, owner, "MOD_GRENADE_SPLASH", level.weaponzmcymbalmonkey);
        if (isdefined(owner)) {
            self detonate(owner);
        } else {
            self detonate(undefined);
        }
        break;
    }
    if (isdefined(damagearea)) {
        damagearea delete();
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 4, eflags: 0x1 linked
// Checksum 0x23c53732, Offset: 0x1098
// Size: 0x5a4
function player_throw_cymbal_monkey(e_grenade, num_attractors, max_attract_dist, attract_dist_diff) {
    self endon(#"starting_monkey_watch", #"disconnect");
    if (isdefined(e_grenade)) {
        e_grenade endon(#"death");
        if (self laststand::player_is_in_laststand()) {
            if (isdefined(e_grenade.damagearea)) {
                e_grenade.damagearea delete();
            }
            e_grenade delete();
            return;
        }
        e_grenade ghost();
        e_grenade.angles = self.angles;
        e_grenade.mdl_monkey = util::spawn_model(e_grenade.model, e_grenade.origin, e_grenade.angles);
        e_grenade.mdl_monkey linkto(e_grenade);
        e_grenade.mdl_monkey thread monkey_cleanup(e_grenade);
        e_grenade.mdl_monkey playsound(#"hash_68402c92c838b7f7");
        clone = undefined;
        if (isdefined(level.cymbal_monkey_dual_view) && level.cymbal_monkey_dual_view) {
            e_grenade.mdl_monkey setvisibletoallexceptteam(level.zombie_team);
            clone = zm_clone::spawn_player_clone(self, (0, 0, -999), level.cymbal_monkey_clone_weapon, undefined);
            e_grenade.mdl_monkey.simulacrum = clone;
            clone zm_clone::clone_animate("idle");
            clone thread clone_player_angles(self);
            clone notsolid();
            clone ghost();
        }
        e_grenade thread watch_for_dud(clone);
        e_grenade thread watch_for_emp(clone);
        info = spawnstruct();
        info.sound_attractors = [];
        e_grenade waittill(#"stationary");
        if (isdefined(level.grenade_planted)) {
            self thread [[ level.grenade_planted ]](e_grenade, e_grenade.mdl_monkey);
        }
        if (isdefined(e_grenade)) {
            if (isdefined(clone)) {
                clone forceteleport(e_grenade.origin, e_grenade.angles);
                clone thread hide_owner(self);
                e_grenade thread proximity_detonate(self);
                clone show();
                clone setinvisibletoall();
                clone setvisibletoteam(level.zombie_team);
            }
            e_grenade resetmissiledetonationtime();
            playfxontag(level._effect[#"monkey_glow"], e_grenade.mdl_monkey, "tag_weapon");
            valid_poi = e_grenade is_on_navmesh(self);
            if (valid_poi && isdefined(e_grenade.var_45eaa114) && e_grenade.var_45eaa114) {
                wait(0.1);
                e_grenade zm_utility::create_zombie_point_of_interest(max_attract_dist, num_attractors, 10000);
                valid_poi = e_grenade zm_utility::create_zombie_point_of_interest_attractor_positions(attract_dist_diff, undefined, level.valid_poi_max_radius, 1);
                if (valid_poi) {
                    e_grenade thread do_monkey_sound(info);
                    e_grenade thread function_875fd1df();
                    level.cymbal_monkeys[level.cymbal_monkeys.size] = e_grenade;
                } else {
                    e_grenade zm_utility::deactivate_zombie_point_of_interest();
                }
            }
            if (!valid_poi) {
                e_grenade.script_noteworthy = undefined;
                level thread grenade_stolen_by_sam(e_grenade, clone);
            }
            return;
        }
        e_grenade.script_noteworthy = undefined;
        level thread grenade_stolen_by_sam(e_grenade, clone);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x4
// Checksum 0x39897d1c, Offset: 0x1648
// Size: 0xae
function private function_ab9a9770() {
    s_trace = groundtrace(self.origin + (0, 0, 70), self.origin + (0, 0, -100), 0, self);
    if (isdefined(s_trace[#"entity"])) {
        entity = s_trace[#"entity"];
        if (entity ismovingplatform()) {
            return true;
        }
    }
    return false;
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x0
// Checksum 0xb1411c12, Offset: 0x1700
// Size: 0x1ae
function function_2f2478f2() {
    v_orig = self.origin;
    queryresult = positionquery_source_navigation(self.origin, 0, level.valid_poi_max_radius, level.valid_poi_half_height, level.valid_poi_inner_spacing, level.valid_poi_radius_from_edges);
    if (queryresult.data.size) {
        foreach (point in queryresult.data) {
            height_offset = abs(self.origin[2] - point.origin[2]);
            if (height_offset > level.valid_poi_height) {
                continue;
            }
            if (zm_utility::check_point_in_enabled_zone(point.origin) && bullettracepassed(point.origin + (0, 0, 20), v_orig + (0, 0, 20), 0, self, undefined, 0, 0)) {
                self.origin = point.origin;
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 2, eflags: 0x1 linked
// Checksum 0x45de44dd, Offset: 0x18b8
// Size: 0x2d4
function grenade_stolen_by_sam(e_grenade, e_actor) {
    if (!isdefined(e_grenade.mdl_monkey)) {
        return;
    }
    direction = e_grenade.mdl_monkey.origin;
    direction = (direction[1], direction[0], 0);
    if (direction[1] < 0 || direction[0] > 0 && direction[1] > 0) {
        direction = (direction[0], direction[1] * -1, 0);
    } else if (direction[0] < 0) {
        direction = (direction[0] * -1, direction[1], 0);
    }
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (isalive(players[i])) {
            players[i] playlocalsound(level.zmb_laugh_alias);
        }
    }
    playfxontag(level._effect[#"grenade_samantha_steal"], e_grenade.mdl_monkey, "tag_origin");
    e_grenade.mdl_monkey unlink();
    e_grenade.mdl_monkey movez(60, 1, 0.25, 0.25);
    e_grenade.mdl_monkey vibrate(direction, 1.5, 2.5, 1);
    e_grenade.mdl_monkey waittill(#"movedone");
    e_grenade.mdl_monkey delete();
    if (isdefined(e_actor)) {
        e_actor delete();
    }
    if (isdefined(e_grenade)) {
        if (isdefined(e_grenade.damagearea)) {
            e_grenade.damagearea delete();
        }
        e_grenade delete();
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x13c27ac5, Offset: 0x1b98
// Size: 0x90
function monkey_cleanup(e_grenade) {
    self endon(#"death");
    while (true) {
        if (!isdefined(e_grenade)) {
            if (isdefined(self.dud) && self.dud) {
                wait(6);
            }
            if (isdefined(self.simulacrum)) {
                self.simulacrum delete();
            }
            zm_utility::self_delete();
            return;
        }
        waitframe(1);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x1935fa7c, Offset: 0x1c30
// Size: 0x260
function do_monkey_sound(info) {
    self endon(#"death");
    self.monk_scream_vox = 0;
    if (isdefined(level.grenade_safe_to_bounce)) {
        if (![[ level.grenade_safe_to_bounce ]](self.owner, level.weaponzmcymbalmonkey)) {
            self playsound(#"zmb_vox_monkey_scream");
            self.monk_scream_vox = 1;
        }
    }
    if (!self.monk_scream_vox && level.musicsystem.currentplaytype < 4) {
        self playsound(#"hash_4509539f9e7954e2");
    }
    self playloopsound(#"hash_4ac1d6c76c698e02");
    if (!self.monk_scream_vox) {
        self thread play_delayed_explode_vox();
    }
    waitresult = self waittill(#"explode");
    level notify(#"grenade_exploded", waitresult.position);
    self stoploopsound();
    monkey_index = -1;
    for (i = 0; i < level.cymbal_monkeys.size; i++) {
        if (!isdefined(level.cymbal_monkeys[i])) {
            monkey_index = i;
            break;
        }
    }
    if (monkey_index >= 0) {
        arrayremoveindex(level.cymbal_monkeys, monkey_index);
    }
    for (i = 0; i < info.sound_attractors.size; i++) {
        if (isdefined(info.sound_attractors[i])) {
            info.sound_attractors[i] notify(#"monkey_blown_up");
        }
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0xa65f7a3e, Offset: 0x1e98
// Size: 0x6c
function function_875fd1df() {
    mdl_monkey = self.mdl_monkey;
    mdl_monkey thread scene::play(#"cin_t8_monkeybomb_dance", mdl_monkey);
    while (isdefined(self)) {
        waitframe(1);
    }
    if (isdefined(mdl_monkey)) {
        mdl_monkey thread scene::stop();
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0x39a5b6a5, Offset: 0x1f10
// Size: 0x34
function play_delayed_explode_vox() {
    wait(6.5);
    if (isdefined(self)) {
        self playsound(#"zmb_vox_monkey_explode");
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0x77e4f217, Offset: 0x1f50
// Size: 0xd2
function get_thrown_monkey() {
    self endon(#"starting_monkey_watch", #"disconnect");
    while (true) {
        waitresult = self waittill(#"grenade_fire");
        grenade = waitresult.projectile;
        weapon = waitresult.weapon;
        if (weapon == level.weaponzmcymbalmonkey) {
            grenade.use_grenade_special_long_bookmark = 1;
            grenade.grenade_multiattack_bookmark_count = 1;
            grenade.weapon = weapon;
            return grenade;
        }
        waitframe(1);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x0
// Checksum 0xe6a62cba, Offset: 0x2030
// Size: 0x1b0
function monitor_zombie_groans(info) {
    self endon(#"explode");
    while (true) {
        if (!isdefined(self)) {
            return;
        }
        if (!isdefined(self.attractor_array)) {
            waitframe(1);
            continue;
        }
        for (i = 0; i < self.attractor_array.size; i++) {
            if (!isinarray(info.sound_attractors, self.attractor_array[i])) {
                if (isdefined(self.origin) && isdefined(self.attractor_array[i].origin)) {
                    if (distancesquared(self.origin, self.attractor_array[i].origin) < 250000) {
                        if (!isdefined(info.sound_attractors)) {
                            info.sound_attractors = [];
                        } else if (!isarray(info.sound_attractors)) {
                            info.sound_attractors = array(info.sound_attractors);
                        }
                        info.sound_attractors[info.sound_attractors.size] = self.attractor_array[i];
                        self.attractor_array[i] thread play_zombie_groans();
                    }
                }
            }
        }
        waitframe(1);
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0xafa87b6c, Offset: 0x21e8
// Size: 0x7e
function play_zombie_groans() {
    self endon(#"monkey_blown_up", #"death");
    while (true) {
        if (isdefined(self)) {
            self playsound(#"zmb_vox_zombie_groan");
            wait(randomfloatrange(2, 3));
            continue;
        }
        return;
    }
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 0, eflags: 0x1 linked
// Checksum 0x2abaff38, Offset: 0x2270
// Size: 0x1a
function cymbal_monkey_exists() {
    return zm_weapons::is_weapon_included(level.weaponzmcymbalmonkey);
}

// Namespace zm_weap_cymbal_monkey/zm_weap_cymbal_monkey
// Params 1, eflags: 0x1 linked
// Checksum 0x66b36b46, Offset: 0x2298
// Size: 0x24c
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
        self.origin = v_valid_point;
        if (isdefined(self.mdl_monkey)) {
            self.mdl_monkey.origin = self.origin;
            self.mdl_monkey clientfield::set("" + #"hash_60a7e5b79e8064a5", 1);
        }
        self.var_45eaa114 = 1;
        return true;
    }
    self.var_45eaa114 = 0;
    return false;
}

