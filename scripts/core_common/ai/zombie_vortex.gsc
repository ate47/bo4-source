// Atian COD Tools GSC decompiler test
#include scripts/core_common/vehicle_ai_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/visionset_mgr_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace zombie_vortex;

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x2
// Checksum 0xf631501, Offset: 0x1b8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"vortex_shared", &__init__, &__main__, undefined);
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x1 linked
// Checksum 0x304d1c41, Offset: 0x208
// Size: 0x1b4
function __init__() {
    if (!isdefined(level.vsmgr_prio_visionset_zombie_vortex)) {
        level.vsmgr_prio_visionset_zombie_vortex = 23;
    }
    if (!isdefined(level.vsmgr_prio_overlay_zombie_vortex)) {
        level.vsmgr_prio_overlay_zombie_vortex = 23;
    }
    visionset_mgr::register_info("visionset", "zm_idgun_vortex" + "_visionset", 1, level.vsmgr_prio_visionset_zombie_vortex, 30, 1, &visionset_mgr::ramp_in_out_thread_per_player, 0);
    visionset_mgr::register_info("overlay", "zm_idgun_vortex" + "_blur", 1, level.vsmgr_prio_overlay_zombie_vortex, 1, 1, &visionset_mgr::ramp_in_out_thread_per_player, 1);
    clientfield::register("scriptmover", "vortex_start", 1, 2, "counter");
    clientfield::register("allplayers", "vision_blur", 1, 1, "int");
    level.vortex_manager = spawnstruct();
    level.vortex_manager.count = 0;
    level.vortex_manager.a_vorticies = [];
    level.vortex_manager.a_active_vorticies = [];
    level.vortex_id = 0;
    init_vortices();
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x1 linked
// Checksum 0xe703e6ac, Offset: 0x3c8
// Size: 0x24
function __main__() {
    level vehicle_ai::register_custom_add_state_callback(&idgun_add_vehicle_death_state);
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x1 linked
// Checksum 0x77bd8e4, Offset: 0x3f8
// Size: 0x100
function init_vortices() {
    for (i = 0; i < 8; i++) {
        svortex = spawn("script_model", (0, 0, 0));
        if (!isdefined(level.vortex_manager.a_vorticies)) {
            level.vortex_manager.a_vorticies = [];
        } else if (!isarray(level.vortex_manager.a_vorticies)) {
            level.vortex_manager.a_vorticies = array(level.vortex_manager.a_vorticies);
        }
        level.vortex_manager.a_vorticies[level.vortex_manager.a_vorticies.size] = svortex;
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x1 linked
// Checksum 0x8c627ea8, Offset: 0x500
// Size: 0xac
function get_unused_vortex() {
    foreach (vortex in level.vortex_manager.a_vorticies) {
        if (!(isdefined(vortex.in_use) && vortex.in_use)) {
            return vortex;
        }
    }
    return level.vortex_manager.a_vorticies[0];
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x0
// Checksum 0xf1886664, Offset: 0x5b8
// Size: 0xa6
function get_active_vortex_count() {
    count = 0;
    foreach (vortex in level.vortex_manager.a_vorticies) {
        if (isdefined(vortex.in_use) && vortex.in_use) {
            count++;
        }
    }
    return count;
}

// Namespace zombie_vortex/zombie_vortex
// Params 4, eflags: 0x4
// Checksum 0xd6f46b18, Offset: 0x668
// Size: 0x68
function private stop_vortex_fx_after_time(vortex_fx_handle, vortex_position, vortex_explosion_fx, n_vortex_time) {
    n_starttime = gettime();
    n_curtime = gettime() - n_starttime;
    while (n_curtime < n_vortex_time) {
        waitframe(1);
        n_curtime = gettime() - n_starttime;
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 8, eflags: 0x0
// Checksum 0x2bb74a95, Offset: 0x6d8
// Size: 0x79c
function start_timed_vortex(effect_version, v_vortex_origin, n_vortex_radius, n_vortex_explosion_radius, eattacker = undefined, weapon = undefined, should_shellshock_player = undefined, should_shield = undefined) {
    self endon(#"death", #"disconnect");
    n_starttime = gettime();
    n_currtime = gettime() - n_starttime;
    a_e_players = getplayers();
    if (!isdefined(n_vortex_explosion_radius)) {
        n_vortex_explosion_radius = n_vortex_radius * 1.5;
    }
    if (!isdefined(should_shellshock_player)) {
        should_shellshock_player = 0;
    }
    if (!isdefined(should_shield)) {
        should_shield = 0;
    }
    svortex = get_unused_vortex();
    svortex.in_use = 1;
    svortex.attacker = eattacker;
    svortex.weapon = weapon;
    svortex.angles = (0, 0, 0);
    svortex.origin = v_vortex_origin;
    svortex dontinterpolate();
    svortex clientfield::increment("vortex_start", effect_version);
    s_active_vortex = struct::spawn(v_vortex_origin);
    s_active_vortex.weapon = weapon;
    s_active_vortex.attacker = eattacker;
    if (!isdefined(level.vortex_manager.a_active_vorticies)) {
        level.vortex_manager.a_active_vorticies = [];
    } else if (!isarray(level.vortex_manager.a_active_vorticies)) {
        level.vortex_manager.a_active_vorticies = array(level.vortex_manager.a_active_vorticies);
    }
    level.vortex_manager.a_active_vorticies[level.vortex_manager.a_active_vorticies.size] = s_active_vortex;
    if (effect_version == 2) {
        n_vortex_time_sv = 9;
        n_vortex_time_cl = 10;
    } else {
        n_vortex_time_sv = 4;
        n_vortex_time_cl = 5;
    }
    n_vortex_time = int(n_vortex_time_sv * 1000);
    team = #"axis";
    if (isdefined(level.zombie_team)) {
        team = level.zombie_team;
    }
    while (n_currtime <= n_vortex_time) {
        a_ai_zombies = array::get_all_closest(v_vortex_origin, getaiteamarray(team), undefined, undefined, n_vortex_radius);
        a_ai_zombies = arraycombine(a_ai_zombies, vortex_z_extension(a_ai_zombies, v_vortex_origin, n_vortex_radius), 0, 0);
        svortex.zombies = a_ai_zombies;
        if (isdefined(level.idgun_draw_debug) && level.idgun_draw_debug) {
            /#
                circle(v_vortex_origin, n_vortex_radius, (0, 0, 1), 0, 1, 1);
            #/
        }
        foreach (ai_zombie in a_ai_zombies) {
            if (isvehicle(ai_zombie)) {
                if (isalive(ai_zombie) && isdefined(ai_zombie vehicle_ai::get_state_callbacks("idgun_death")) && ai_zombie vehicle_ai::get_current_state() != "idgun_death" && !ai_zombie.ignorevortices) {
                    params = spawnstruct();
                    params.vpoint = v_vortex_origin;
                    params.attacker = eattacker;
                    params.weapon = weapon;
                    ai_zombie vehicle_ai::set_state("idgun_death", params);
                }
            } else if (!(isdefined(ai_zombie.interdimensional_gun_kill) && ai_zombie.interdimensional_gun_kill) && !ai_zombie.ignorevortices) {
                ai_zombie.damageorigin = v_vortex_origin;
                if (isdefined(should_shield) && should_shield) {
                    ai_zombie.allowdeath = 0;
                    ai_zombie.magic_bullet_shield = 1;
                }
                ai_zombie.interdimensional_gun_kill = 1;
                ai_zombie.interdimensional_gun_attacker = eattacker;
                ai_zombie.interdimensional_gun_inflictor = eattacker;
                ai_zombie.interdimensional_gun_weapon = weapon;
            }
        }
        if (should_shellshock_player) {
            foreach (e_player in a_e_players) {
                if (isdefined(e_player) && !(isdefined(e_player.idgun_vision_on) && e_player.idgun_vision_on)) {
                    if (distance(e_player.origin, v_vortex_origin) < float(n_vortex_radius / 2)) {
                        e_player thread player_vortex_visionset("zm_idgun_vortex");
                    }
                }
            }
        }
        waitframe(1);
        n_currtime = gettime() - n_starttime;
    }
    n_time_to_wait_for_explosion = n_vortex_time_cl - n_vortex_time_sv + 0.35;
    wait(n_time_to_wait_for_explosion);
    svortex.in_use = 0;
    arrayremovevalue(level.vortex_manager.a_active_vorticies, s_active_vortex);
    vortex_explosion(v_vortex_origin, eattacker, n_vortex_explosion_radius);
}

// Namespace zombie_vortex/zombie_vortex
// Params 3, eflags: 0x1 linked
// Checksum 0xd1375acb, Offset: 0xe80
// Size: 0x14c
function vortex_z_extension(a_ai_zombies, v_vortex_origin, n_vortex_radius) {
    a_ai_zombies_extended = array::get_all_closest(v_vortex_origin, getaiteamarray(#"axis"), undefined, undefined, n_vortex_radius + 72);
    a_ai_zombies_extended_filtered = array::exclude(a_ai_zombies_extended, a_ai_zombies);
    i = 0;
    while (i < a_ai_zombies_extended_filtered.size) {
        if (a_ai_zombies_extended_filtered[i].origin[2] < v_vortex_origin[2] && bullettracepassed(a_ai_zombies_extended_filtered[i].origin + vectorscale((0, 0, 1), 5), v_vortex_origin + vectorscale((0, 0, 1), 20), 0, self, undefined, 0, 0)) {
            i++;
        } else {
            arrayremovevalue(a_ai_zombies_extended_filtered, a_ai_zombies_extended_filtered[i]);
        }
    }
    return a_ai_zombies_extended_filtered;
}

// Namespace zombie_vortex/zombie_vortex
// Params 3, eflags: 0x5 linked
// Checksum 0x4614f45f, Offset: 0xfd8
// Size: 0x338
function private vortex_explosion(v_vortex_explosion_origin, eattacker, n_vortex_radius) {
    team = #"axis";
    if (isdefined(level.zombie_team)) {
        team = level.zombie_team;
    }
    a_ai_zombies = array::get_all_closest(v_vortex_explosion_origin, getaiteamarray(team), undefined, undefined, n_vortex_radius);
    if (isdefined(level.idgun_draw_debug) && level.idgun_draw_debug) {
        /#
            circle(v_vortex_explosion_origin, n_vortex_radius, (1, 0, 0), 0, 1, 1000);
        #/
    }
    foreach (ai_zombie in a_ai_zombies) {
        if (!ai_zombie.ignorevortices) {
            if (isdefined(ai_zombie.interdimensional_gun_kill) && ai_zombie.interdimensional_gun_kill) {
                ai_zombie hide();
            } else {
                ai_zombie.interdimensional_gun_kill = undefined;
                ai_zombie.interdimensional_gun_kill_vortex_explosion = 1;
                ai_zombie.veh_idgun_allow_damage = 1;
                if (isdefined(eattacker)) {
                    ai_zombie dodamage(ai_zombie.health + 10000, ai_zombie.origin, eattacker, undefined, undefined, "MOD_EXPLOSIVE");
                } else {
                    ai_zombie dodamage(ai_zombie.health + 10000, ai_zombie.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
                }
                n_radius_sqr = n_vortex_radius * n_vortex_radius;
                n_distance_sqr = distancesquared(ai_zombie.origin, v_vortex_explosion_origin);
                n_dist_mult = n_distance_sqr / n_radius_sqr;
                v_fling = vectornormalize(ai_zombie.origin - v_vortex_explosion_origin);
                v_fling = (v_fling[0], v_fling[1], abs(v_fling[2]));
                v_fling = vectorscale(v_fling, 100 + 100 * n_dist_mult);
                ai_zombie startragdoll();
                ai_zombie launchragdoll(v_fling);
            }
        }
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0xc8022cc6, Offset: 0x1318
// Size: 0xbe
function player_vortex_visionset(name) {
    self endon(#"death");
    thread visionset_mgr::activate("visionset", name + "_visionset", self, 0.25, 2, 0.25);
    thread visionset_mgr::activate("overlay", name + "_blur", self, 0.25, 2, 0.25);
    self.idgun_vision_on = 1;
    wait(2.5);
    self.idgun_vision_on = 0;
}

// Namespace zombie_vortex/zombie_vortex
// Params 0, eflags: 0x1 linked
// Checksum 0x825d9fde, Offset: 0x13e0
// Size: 0x9c
function idgun_add_vehicle_death_state() {
    if (isairborne(self)) {
        self vehicle_ai::add_state("idgun_death", &state_idgun_flying_crush_enter, &state_idgun_flying_crush_update, undefined);
    } else {
        self vehicle_ai::add_state("idgun_death", &state_idgun_crush_enter, &state_idgun_crush_update, undefined);
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0xb62b3990, Offset: 0x1488
// Size: 0x54
function state_idgun_crush_enter(params) {
    self vehicle_ai::clearalllookingandtargeting();
    self vehicle_ai::clearallmovement();
    self cancelaimove();
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0x54cc9253, Offset: 0x14e8
// Size: 0x4c
function flyentdelete(enttowatch) {
    self endon(#"death");
    enttowatch waittill(#"death");
    self delete();
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0x45712afa, Offset: 0x1540
// Size: 0x270
function state_idgun_crush_update(params) {
    self endon(#"death");
    black_hole_center = params.vpoint;
    attacker = params.attacker;
    weapon = params.weapon;
    if (self.archetype == #"raps") {
        crush_anim = "ai_zombie_zod_raps_dth_f_id_gun_crush";
    }
    veh_to_black_hole_vec = vectornormalize(black_hole_center - self.origin);
    fly_ent = spawn("script_origin", self.origin);
    fly_ent thread flyentdelete(self);
    self linkto(fly_ent);
    while (1) {
        veh_to_black_hole_dist_sqr = distancesquared(self.origin, black_hole_center);
        if (veh_to_black_hole_dist_sqr < 144) {
            self.veh_idgun_allow_damage = 1;
            self dodamage(self.health + 666, self.origin, attacker, undefined, "none", "MOD_UNKNOWN", 0, weapon);
            return;
        } else if (!(isdefined(self.crush_anim_started) && self.crush_anim_started) && veh_to_black_hole_dist_sqr < 1600) {
            if (isdefined(crush_anim)) {
                self animscripted("anim_notify", self.origin, self.angles, crush_anim, "normal", undefined, undefined, 0.2);
            }
            self.crush_anim_started = 1;
        }
        fly_ent.origin = fly_ent.origin + veh_to_black_hole_vec * 8;
        wait(0.1);
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0x918cbc1c, Offset: 0x17b8
// Size: 0x5e
function state_idgun_flying_crush_enter(params) {
    self vehicle_ai::clearallmovement();
    self cancelaimove();
    self setneargoalnotifydist(4);
    self.vehaircraftcollisionenabled = 0;
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0xdb962d61, Offset: 0x1820
// Size: 0x164
function state_idgun_flying_crush_update(params) {
    self endon(#"death");
    black_hole_center = params.vpoint;
    attacker = params.attacker;
    weapon = params.weapon;
    self setspeed(2);
    self asmrequestsubstate(#"hash_605a76518deb2c5f");
    self thread switch_to_crush_asm(black_hole_center);
    self function_a57c34b7(black_hole_center, 0, 0);
    self waittill(#"near_goal");
    self vehicle_ai::get_state_callbacks("death").update_func = &state_idgun_flying_death_update;
    self.veh_idgun_allow_damage = 1;
    self dodamage(self.health + 666, self.origin, attacker, undefined, "none", "MOD_UNKNOWN", 0, weapon);
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0x37d0e033, Offset: 0x1990
// Size: 0x84
function switch_to_crush_asm(black_hole_center) {
    self endon(#"death");
    while (1) {
        if (distancesquared(self.origin, black_hole_center) < 900) {
            self asmrequestsubstate(#"hash_1d57c7f1617da95b");
            return;
        }
        wait(0.1);
    }
}

// Namespace zombie_vortex/zombie_vortex
// Params 1, eflags: 0x1 linked
// Checksum 0x7131a9c4, Offset: 0x1a20
// Size: 0x94
function state_idgun_flying_death_update(params) {
    self endon(#"death");
    if (isdefined(self.parasiteenemy) && isdefined(self.parasiteenemy.hunted_by)) {
        self.parasiteenemy.hunted_by--;
    }
    self playsound(#"zmb_parasite_explo");
    wait(0.2);
    self delete();
}

