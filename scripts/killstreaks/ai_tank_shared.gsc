// Atian COD Tools GSC decompiler test
#include script_46fade957db10c16;
#include scripts/core_common/throttle_shared.gsc;
#include scripts/core_common/weapons_shared.gsc;
#include scripts/core_common/turret_shared.gsc;
#include scripts/core_common/ai/blackboard_vehicle.gsc;
#include scripts/core_common/ai/systems/blackboard.gsc;
#include scripts/core_common/globallogic/globallogic_score.gsc;
#include scripts/core_common/visionset_mgr_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/weapons/heatseekingmissile.gsc;
#include scripts/core_common/targetting_delay.gsc;
#include scripts/core_common/math_shared.gsc;
#include scripts/core_common/lui_shared.gsc;
#include scripts/core_common/gameobjects_shared.gsc;
#include scripts/core_common/vehicle_shared.gsc;
#include scripts/core_common/vehicle_death_shared.gsc;
#include scripts/core_common/vehicle_ai_shared.gsc;
#include scripts/core_common/values_shared.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/player/player_stats.gsc;
#include script_3819e7a1427df6d2;
#include scripts/core_common/ai_shared.gsc;
#include scripts/killstreaks/remote_weapons.gsc;
#include scripts/killstreaks/killstreakrules_shared.gsc;
#include scripts/killstreaks/killstreak_hacking.gsc;
#include scripts/killstreaks/killstreak_bundles.gsc;
#include script_52d2de9b438adc78;
#include scripts/killstreaks/emp_shared.gsc;
#include scripts/killstreaks/airsupport.gsc;
#include scripts/killstreaks/killstreaks_util.gsc;
#include scripts/killstreaks/killstreaks_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/challenges_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/abilities/ability_player.gsc;
#include scripts/core_common/oob.gsc;
#include scripts/core_common/struct.gsc;

#namespace ai_tank;

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x0
// Checksum 0xfc27c278, Offset: 0x7a0
// Size: 0x42c
function init_shared(bundlename) {
    if (!isdefined(level.var_400ded61)) {
        level.var_400ded61 = {};
        ir_strobe::init_shared();
        remote_weapons::init_shared();
        airsupport::init_shared();
        if (!isdefined(bundlename)) {
            bundlename = "killstreak_tank_robot";
        }
        level.var_aca462a0 = [];
        if (!(isdefined(level.var_9f011465) && level.var_9f011465)) {
            for (ti = 0; ti < 5; ti++) {
                level.var_aca462a0[ti] = multi_stage_target_lockon::register("multi_stage_target_lockon" + ti);
            }
        }
        bundle = struct::get_script_bundle("killstreak", bundlename);
        level.var_400ded61.aitankkillstreakbundle = bundle;
        killstreaks::register_bundle(bundle, &usekillstreakaitankdrop);
        killstreaks::register_remote_override_weapon("tank_robot", "killstreak_ai_tank");
        killstreaks::function_e37b061("tank_robot", getweapon(#"tank_robot_launcher_turret"));
        ir_strobe::function_8806675d(#"ai_tank_marker", &spawn_tank_robot);
        level.killstreaks[#"tank_robot"].threatonkill = 1;
        if (function_8b1a219a()) {
            remote_weapons::registerremoteweapon("killstreak_ai_tank", #"hash_3abd55f34c1661ac", &starttankremotecontrol, &endtankremotecontrol, 1);
        } else {
            remote_weapons::registerremoteweapon("killstreak_ai_tank", #"hash_747fc4429380f380", &starttankremotecontrol, &endtankremotecontrol, 1);
        }
        level.var_66e94ad5 = bundle.ksweapon;
        level.ai_tank_damage_fx = "killstreaks/fx8_drone_tank_damage_state";
        level.ai_tank_explode_fx = "killstreaks/fx8_agr_explosion";
        level.ai_tank_crate_explode_fx = "killstreaks/fx8_agr_drop_box";
        if (!isdefined(bundle.ksmainturretrecoilforcezoffset)) {
            bundle.ksmainturretrecoilforcezoffset = 0;
        }
        if (!isdefined(bundle.ksweaponreloadtime)) {
            bundle.ksweaponreloadtime = 0.5;
        }
        visionset_mgr::register_info("visionset", "agr_visionset", 1, 80, 16, 1, &visionset_mgr::ramp_in_out_thread_per_player_death_shutdown, 0);
        callback::on_spawned(&on_player_spawned);
        function_61610d6b();
        thread register();
        if (!isdefined(level.var_950314f5)) {
            level.var_950314f5 = new throttle();
            [[ level.var_950314f5 ]]->initialize(1, 0.5);
        }
    }
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5ee60be7, Offset: 0xbd8
// Size: 0x48
function function_1c601b99() {
    if (isdefined(level.var_a5dacbea)) {
        [[ level.var_a5dacbea ]](getweapon("ai_tank_marker"), &function_127fb8f3);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xcb8c43aa, Offset: 0xc28
// Size: 0x80
function function_1210a3d6(mantis) {
    mantis endon(#"death");
    if (isdefined(level.var_5d492b75)) {
        [[ level.var_5d492b75 ]](mantis, 1);
    }
    wait(3);
    if (!isdefined(mantis)) {
        return;
    }
    if (isdefined(level.var_5d492b75)) {
        [[ level.var_5d492b75 ]](mantis, 0);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x616362be, Offset: 0xcb0
// Size: 0x98
function function_127fb8f3(mantis, attackingplayer) {
    if (isdefined(level.var_1794f85f)) {
        [[ level.var_1794f85f ]](attackingplayer, "disrupted_mantis");
    }
    if (!(isdefined(mantis.isstunned) && mantis.isstunned)) {
        mantis thread tank_stun(3, 1);
        mantis thread function_1210a3d6(mantis);
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa591dcfa, Offset: 0xd50
// Size: 0x12c
function on_player_spawned() {
    if (isdefined(level.var_66e94ad5) && !self hasweapon(level.var_66e94ad5)) {
        self clientfield::set_player_uimodel("hudItems.tankState", 0);
    }
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (self.team == player.team) {
            continue;
        }
        if (isdefined(player.ai_tank_drone)) {
            player.ai_tank_drone respectnottargetedbyaitankperk(self);
        }
    }
    cleanup_targeting(self);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x10be2fb4, Offset: 0xe88
// Size: 0x27e
function function_61610d6b() {
    level.var_51368c39 = struct::get_array("datapad_loc", "targetname");
    foreach (point in level.var_51368c39) {
        point.objectiveid = gameobjects::get_next_obj_id();
        objective_add(point.objectiveid, "invisible", point.origin, #"datapad_location");
        objective_setinvisibletoall(point.objectiveid);
    }
    var_9afbe37 = struct::get_array("datapad_patrol_loc", "targetname");
    foreach (point in var_9afbe37) {
        point.objectiveid = gameobjects::get_next_obj_id();
        objective_add(point.objectiveid, "invisible", point.origin, #"hash_60fb0be7a198b305");
        objective_setinvisibletoall(point.objectiveid);
        if (!isdefined(level.var_51368c39)) {
            level.var_51368c39 = [];
        } else if (!isarray(level.var_51368c39)) {
            level.var_51368c39 = array(level.var_51368c39);
        }
        level.var_51368c39[level.var_51368c39.size] = point;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x57b8bf4d, Offset: 0x1110
// Size: 0x124
function register() {
    clientfield::register("vehicle", "ai_tank_death", 1, 1, "int");
    clientfield::register("vehicle", "ai_tank_immobile", 1, 1, "int");
    clientfield::register("vehicle", "ai_tank_change_control", 1, 1, "int");
    clientfield::register("toplayer", "ai_tank_update_hud", 1, 1, "counter");
    clientfield::register("clientuimodel", "hudItems.tankState", 1, 3, "int");
    clientfield::register("toplayer", "ai_tank_jam_hud", 9000, 1, "int");
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xfdc6a4f6, Offset: 0x1240
// Size: 0x3c
function function_203098f4(waittime) {
    self endon(#"disconnect");
    wait(waittime);
    lui::screen_fade_in(0);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x0
// Checksum 0x4058b223, Offset: 0x1288
// Size: 0xf4
function watchforentervehicle() {
    self endon(#"emp_jammed", #"emp_grenaded", #"disconnect", #"confirm_location", #"cancel_location");
    self waittill(#"enter_vehicle");
    if (self remote_weapons::allowremotestart(1) && isdefined(self.ai_tank_drone)) {
        thread function_203098f4(3);
        lui::screen_fade_out(0.1);
        self thread remote_weapons::useremoteweapon(self.ai_tank_drone, "killstreak_ai_tank", 1, 1, 1);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe5f904e6, Offset: 0x1388
// Size: 0x64
function function_d49c17b9() {
    self clientfield::set_player_uimodel("locSel.snapTo", 1);
    self function_35ad808a("map_directional_selector");
    self.selectinglocation = 1;
    self thread airsupport::endselectionthink();
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x0
// Checksum 0x4b4a0605, Offset: 0x13f8
// Size: 0x3c
function function_3b8d91fd() {
    self function_d49c17b9();
    self clientfield::set_player_uimodel("locSel.commandMode", 0);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x0
// Checksum 0x8106e266, Offset: 0x1440
// Size: 0x3c
function function_c3d60d1c() {
    self function_d49c17b9();
    self clientfield::set_player_uimodel("locSel.commandMode", 1);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x0
// Checksum 0x45aaabd0, Offset: 0x1488
// Size: 0x28
function function_5569aa48() {
    return self clientfield::get_player_uimodel("locSel.commandMode") == 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x17f88e63, Offset: 0x14b8
// Size: 0x26a
function usekillstreakaitankdrop(killstreaktype) {
    team = self.team;
    waterdepth = self depthofplayerinwater();
    if (!self isonground() || self util::isusingremote() || waterdepth > 2) {
        self iprintlnbold(#"hash_ec04d7a9114ba0e");
        return 0;
    }
    if (isdefined(level.var_30264985)) {
        level notify(#"marker_ready");
        waitresult = undefined;
        waitresult = self waittill(#"mantis_deployed", #"death", #"weapon_change", #"weapon_fired");
    }
    context = spawnstruct();
    context.radius = level.killstreakcorebundle.ksairdropsupplydropradius;
    context.dist_from_boundary = 50;
    context.max_dist_from_location = 4;
    context.perform_physics_trace = 1;
    context.islocationgood = &islocationgood;
    context.objective = #"hash_1b5a86007f598bbc";
    context.validlocationsound = level.killstreakcorebundle.ksvalidcarepackagelocationsound;
    context.tracemask = 1 | 4;
    context.droptag = "tag_cargo_attach";
    context.killstreaktype = #"ai_tank_marker";
    context.killstreakref = "tank_robot";
    context.dontdisconnectpaths = 1;
    context.var_655d53ec = 1;
    return self ir_strobe::function_f625256f(undefined, context);
}

// Namespace ai_tank/ai_tank_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x4a5879fc, Offset: 0x1730
// Size: 0x8c
function spawn_tank_robot(owner, context, origin) {
    location = spawnstruct();
    location.origin = origin;
    owner clientfield::set_player_uimodel("hudItems.tankState", 1);
    owner airsupport::function_83904681(location, &function_e1553d5f);
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x6f4a1c9d, Offset: 0x17c8
// Size: 0x266
function function_4c0ed253(location, context) {
    if (!self killstreakrules::iskillstreakallowed("tank_robot", self.team, 1)) {
        return 0;
    }
    foreach (droplocation in level.droplocations) {
        if (distance2dsquared(droplocation, location) < 3600) {
            return 0;
        }
    }
    if (context.perform_physics_trace === 1) {
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = context.radius;
        trace = physicstrace(location + vectorscale((0, 0, 1), 5000), location + vectorscale((0, 0, 1), 30), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        if (trace[#"fraction"] < 1) {
            if (!(isdefined(level.var_66da9c3c) && level.var_66da9c3c)) {
                return 0;
            }
        }
    }
    result = function_9cc082d2(location + vectorscale((0, 0, 1), 100), 170);
    if (!isdefined(result)) {
        return 0;
    }
    if (context.check_same_floor === 1 && abs(location[2] - self.origin[2]) > 96) {
        return 0;
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5f52dcc0, Offset: 0x1a38
// Size: 0x430
function islocationgood(location, context) {
    if (getdvarint(#"hash_458cd0a10d30cedb", 1)) {
        return function_4c0ed253(location, context);
    }
    if (!self killstreakrules::iskillstreakallowed("tank_robot", self.team, 1)) {
        return 0;
    }
    foreach (droplocation in level.droplocations) {
        if (distance2dsquared(droplocation, location) < 3600) {
            return 0;
        }
    }
    if (context.perform_physics_trace === 1) {
        mask = 1;
        if (isdefined(context.tracemask)) {
            mask = context.tracemask;
        }
        radius = context.radius;
        trace = physicstrace(location + vectorscale((0, 0, 1), 5000), location + vectorscale((0, 0, 1), 10), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), undefined, mask);
        if (trace[#"fraction"] < 1) {
            if (!(isdefined(level.var_66da9c3c) && level.var_66da9c3c)) {
                return 0;
            }
        }
    }
    isvalidpoint = 1;
    if (ispointonnavmesh(location, context.dist_from_boundary)) {
        closestpoint = getclosestpointonnavmesh(location, max(context.max_dist_from_location, 24), context.dist_from_boundary);
        isvalidpoint = isdefined(closestpoint);
        if (isvalidpoint && context.check_same_floor === 1 && abs(location[2] - closestpoint[2]) > 96) {
            isvalidpoint = 0;
        }
    } else {
        isvalidpoint = 0;
    }
    /#
        if (getdvarint(#"scr_supply_drop_valid_location_debug", 0)) {
            if (!isvalidpoint) {
                otherclosestpoint = getclosestpointonnavmesh(location, getdvarfloat(#"scr_supply_drop_valid_location_radius_debug", 96), context.dist_from_boundary);
                if (isdefined(otherclosestpoint)) {
                    sphere(otherclosestpoint, context.max_dist_from_location, (1, 0, 0), 0.8, 0, 20, 1);
                }
            } else {
                sphere(closestpoint, context.max_dist_from_location, (0, 1, 0), 0.8, 0, 20, 1);
                util::drawcylinder(closestpoint, context.radius, 8000, 0.0166667, undefined, vectorscale((0, 1, 0), 0.9), 0.7);
            }
        }
    #/
    return isvalidpoint;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x0
// Checksum 0x6c44ac10, Offset: 0x1e70
// Size: 0x9c
function function_5479b133(team, killstreak_id) {
    self endon(#"payload_delivered", #"disconnect", #"joined_team", #"joined_spectators", #"changed_specialist");
    self waittill(#"payload_fail");
    self killstreakrules::killstreakstop("tank_robot", team, killstreak_id);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x0
// Checksum 0x918af27c, Offset: 0x1f18
// Size: 0xdc
function function_b60b8174() {
    self endon(#"death", #"changed_specialist", #"disconnect", #"joined_team", #"joined_spectators");
    killstreakweapon = killstreaks::get_killstreak_weapon("tank_robot");
    while (1) {
        quantity = killstreaks::get_killstreak_quantity(killstreakweapon);
        if (quantity === 0) {
            break;
        }
        waitframe(1);
    }
    killstreaks::change_killstreak_quantity(killstreakweapon, 1);
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3103dce7, Offset: 0x2000
// Size: 0x2f8
function function_e1553d5f(location, killstreak_id) {
    team = self.team;
    killstreak_id = self killstreakrules::killstreakstart("tank_robot", team, 0, 1);
    if (killstreak_id == -1) {
        return 0;
    }
    bundle = level.var_400ded61.aitankkillstreakbundle;
    killstreak = killstreaks::get_killstreak_for_weapon(bundle.ksweapon);
    context = spawnstruct();
    if (!isdefined(context)) {
        killstreak_stop_and_assert(killstreak, team, killstreak_id, "Failed to spawn struct for ai tank.");
        return 0;
    }
    self ability_player::function_c22f319e(bundle.ksweapon);
    context.radius = level.killstreakcorebundle.ksairdropaitankradius;
    context.dist_from_boundary = 50;
    context.max_dist_from_location = 4;
    context.perform_physics_trace = 1;
    context.var_ea9c2360 = location;
    context.islocationgood = &is_location_good;
    context.objective = #"airdrop_aitank";
    context.killstreakref = killstreak;
    context.validlocationsound = level.killstreakcorebundle.ksvalidaitanklocationsound;
    context.vehiclename = #"vehicle_t8_mil_helicopter_transport_mp";
    context.tracemask = 1 | 4;
    context.droptag = "tag_cargo_attach";
    context.var_9fc6cfe9 = 1;
    context.dontdisconnectpaths = 1;
    if (!isdefined(level.var_daa33d93)) {
        return 0;
    }
    result = [[ level.var_daa33d93 ]](killstreak_id, context, team);
    if (!(isdefined(result) && result)) {
        killstreakrules::killstreakstop("tank_robot", team, killstreak_id);
        return 0;
    }
    self thread function_e00df756(team, killstreak_id);
    self stats::function_e24eec31(bundle.ksweapon, #"used", 1);
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xfc967dd8, Offset: 0x2300
// Size: 0xbc
function function_e00df756(team, killstreak_id) {
    self notify("40dbfe8fe71109dc");
    self endon("40dbfe8fe71109dc");
    player = self;
    player endon(#"tank_robot");
    player waittill(#"changed_specialist", #"disconnect", #"joined_team", #"joined_spectators");
    killstreakrules::killstreakstop("tank_robot", team, killstreak_id);
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1d27ad75, Offset: 0x23c8
// Size: 0xcc
function function_b2acf3f2(location, context) {
    if (!ispointonnavmesh(location)) {
        /#
            recordsphere(location + vectorscale((0, 0, 1), 10), 2, (1, 0, 0), "tag_turret");
        #/
        return 0;
    }
    var_8a7edebd = 5;
    depth = getwaterheight(location) - self.origin[2];
    inwater = depth > var_8a7edebd;
    if (inwater) {
        return 0;
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xdfa4009b, Offset: 0x24a0
// Size: 0x334
function crateland(crate, category, owner, team, context) {
    owner notify(#"tank_robot");
    context.perform_physics_trace = 0;
    context.dist_from_boundary = 50;
    context.max_dist_from_location = 96;
    if (!crate function_b2acf3f2(crate.origin, context) || !isdefined(owner) || util::function_fbce7263(team, owner.team) || owner emp::enemyempactive() && !owner hasperk(#"specialty_immuneemp")) {
        killstreakrules::killstreakstop(category, team, crate.package_contents_id);
        wait(10);
        if (isdefined(level.var_30264985)) {
            level.var_cf82598a = 1;
        }
        if (isdefined(crate)) {
            crate delete();
        }
        return;
    }
    origin = crate.origin;
    if (isdefined(level.var_5ef874c8) && level.var_5ef874c8) {
        radius = 5;
        mask = 1 | 4;
        cratebottom = physicstrace(origin + vectorscale((0, 0, 1), 25), origin + vectorscale((0, 0, -1), 50), (radius * -1, radius * -1, 0), (radius, radius, 2 * radius), crate, mask);
    } else {
        cratebottom = bullettrace(origin, origin + vectorscale((0, 0, -1), 50), 0, crate);
    }
    if (isdefined(cratebottom)) {
        origin = cratebottom[#"position"] + (0, 0, 1);
    }
    playfx(level.ai_tank_crate_explode_fx, origin, (1, 0, 0), (0, 0, 1));
    playsoundatposition(#"veh_talon_crate_exp", crate.origin);
    level thread ai_tank_killstreak_start(owner, origin, crate.package_contents_id, category, undefined, context);
    if (!isdefined(context.vehicle)) {
        crate delete();
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3e65189e, Offset: 0x27e0
// Size: 0x18
function is_location_good(location, context) {
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd45d11e5, Offset: 0x2800
// Size: 0x134
function hackedcallbackpre(hacker) {
    drone = self;
    drone clientfield::set("enemyvehicle", 2);
    drone.owner stop_remote();
    drone.owner clientfield::set_to_player("static_postfx", 0);
    if (drone.controlled === 1) {
        visionset_mgr::deactivate("visionset", "agr_visionset", drone.owner);
    }
    drone.owner remote_weapons::removeandassignnewremotecontroltrigger(drone.usetrigger);
    drone remote_weapons::endremotecontrolweaponuse(1);
    drone.owner unlink();
    drone clientfield::set("vehicletransition", 0);
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xaf9a8f07, Offset: 0x2940
// Size: 0x76
function hackedcallbackpost(hacker) {
    drone = self;
    hacker remote_weapons::useremoteweapon(drone, "killstreak_ai_tank", 0);
    drone notify(#"watchremotecontroldeactivate_remoteweapons");
    drone.killstreak_end_time = hacker killstreak_hacking::set_vehicle_drivable_time_starting_now(drone);
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x89ccec0a, Offset: 0x29c0
// Size: 0x34
function configureteampost(owner, ishacked) {
    drone = self;
    drone thread tank_watch_owner_events();
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xaa9e8a80, Offset: 0x2a00
// Size: 0x4dc
function function_9b13ebf(drone) {
    drone useanimtree("generic");
    vehicle::make_targetable(drone);
    blackboard::createblackboardforentity(drone);
    drone blackboard::registervehicleblackboardattributes();
    drone.health = drone.healthdefault;
    drone vehicle::friendly_fire_shield();
    drone enableaimassist();
    drone setneargoalnotifydist(40);
    drone setplayercollision(0);
    drone setavoidancemask("avoid none");
    drone.fovcosine = 0;
    drone.fovcosinebusy = 0.574;
    /#
        assert(isdefined(drone.scriptbundlesettings));
    #/
    drone.settings = struct::get_script_bundle("vehiclecustomsettings", drone.scriptbundlesettings);
    drone.goalheight = 512;
    drone setgoal(drone.origin, 0, drone.goalradius, drone.goalheight);
    drone.delete_on_death = 1;
    drone.no_free_on_death = 1;
    drone.overridevehicledamage = &drone_callback_damage;
    drone thread vehicle_ai::nudge_collision();
    drone.cobra = 0;
    drone asmrequestsubstate(#"locomotion@movement");
    drone.variant = "light_weight";
    drone.var_a8c60b0e = 1;
    drone.var_b4c9d62 = 1;
    drone.var_527f38dc = 0;
    drone util::cooldown("cobra_up", 10);
    drone.var_232915af = 1;
    drone.var_6e9e073d = 1;
    drone vehicle_ai::init_state_machine_for_role("default");
    drone vehicle_ai::get_state_callbacks("combat").enter_func = &state_combat_enter;
    drone.identifier_weapon = getweapon("ai_Tank_marker");
    if (drone.vehicletype == #"archetype_mini_quadtank_ct") {
        drone vehicle_ai::get_state_callbacks("combat").update_func = &function_dd91d091;
    } else {
        drone vehicle_ai::get_state_callbacks("combat").update_func = &state_combat_update;
    }
    drone vehicle_ai::get_state_callbacks("driving").update_func = &state_driving_update;
    drone vehicle_ai::get_state_callbacks("driving").exit_func = &function_481e984f;
    drone vehicle_ai::get_state_callbacks("emped").update_func = &state_emped_update;
    drone vehicle_ai::get_state_callbacks("death").update_func = &state_death_update;
    if (isdefined(level.var_30264985)) {
        drone vehicle_ai::startinitialstate("scripted");
    } else {
        drone vehicle_ai::startinitialstate("combat");
    }
    drone thread targetting_delay::function_7e1a12ce(level.killstreakbundle[#"tank_robot"].var_2aeadfa0);
}

// Namespace ai_tank/ai_tank_shared
// Params 15, eflags: 0x1 linked
// Checksum 0x54cfe24c, Offset: 0x2ee8
// Size: 0xd2
function drone_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    idamage = vehicle_ai::shared_callback_damage(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal);
    return idamage;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x0
// Checksum 0x100e67f3, Offset: 0x2fc8
// Size: 0x88
function function_75c8a0dc(entity, jammer) {
    /#
        print("tank_robot_tacquery_wander");
    #/
    if (!(isdefined(entity.isstunned) && entity.isstunned)) {
        entity function_903fdcc2();
        entity function_4110f8dd(1);
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x0
// Checksum 0x1e87bb78, Offset: 0x3058
// Size: 0x64
function function_3dc3ca04(entity, jammer) {
    /#
        print("rocket");
    #/
    entity function_37b0973();
    entity function_fd91abfb();
}

// Namespace ai_tank/ai_tank_shared
// Params 6, eflags: 0x1 linked
// Checksum 0xdbe4471e, Offset: 0x30c8
// Size: 0x6c0
function ai_tank_killstreak_start(owner, origin, killstreak_id, category, tankarchetype, context) {
    team = owner.team;
    waittillframeend();
    if (level.gameended) {
        return;
    }
    if (!isdefined(tankarchetype)) {
        tankarchetype = #"archetype_mini_quadtank_mp";
    }
    if (isdefined(context) && isdefined(context.vehicle)) {
        drone = context.vehicle;
    } else {
        drone = spawnvehicle(tankarchetype, origin + vectorscale((0, 0, 1), 40), (0, 0, 0), "talon", undefined, 1, owner);
    }
    drone killstreak_bundles::spawned(level.killstreakbundle[#"tank_robot"]);
    if (!isdefined(drone)) {
        killstreak_stop_and_assert(category, team, killstreak_id, "Failed to spawn ai tank vehicle.");
        return;
    }
    function_9b13ebf(drone);
    owner clientfield::set_player_uimodel("hudItems.tankState", 2);
    drone.settings = struct::get_script_bundle("vehiclecustomsettings", drone.scriptbundlesettings);
    drone.isstunned = 0;
    drone.var_b61a6415 = 0;
    aiutility::addaioverridedamagecallback(drone, &function_4f8d11b);
    drone.customdamagemonitor = 1;
    drone.avoid_shooting_owner = 1;
    drone.avoid_shooting_owner_ref_tag = "tag_flash_gunner1";
    drone killstreaks::configure_team("tank_robot", killstreak_id, owner, "small_vehicle", undefined, &configureteampost);
    drone killstreak_hacking::enable_hacking("tank_robot", &hackedcallbackpre, &hackedcallbackpost);
    drone killstreaks::setup_health("tank_robot", 5000, 0);
    drone.original_vehicle_type = drone.vehicletype;
    drone clientfield::set("enemyvehicle", 1);
    drone setvehicleavoidance(1);
    owner clientfield::set_player_uimodel("vehicle.ammoCount", 4);
    drone.killstreak_id = killstreak_id;
    drone.type = "tank_drone";
    drone.dontdisconnectpaths = 1;
    drone.soundmod = "drone_land";
    drone.ignore_vehicle_underneath_splash_scalar = 1;
    drone.treat_owner_damage_as_friendly_fire = 1;
    drone.ignore_team_kills = 1;
    drone.var_b4c9d62 = 1;
    drone.offhand_special = 1;
    drone.var_e9d49a33 = 1;
    drone.goalradius = 250;
    if (isdefined(level.var_1dd2fbe1)) {
        drone [[ level.var_1dd2fbe1 ]]();
    }
    drone.controlled = 0;
    drone makevehicleunusable();
    drone.numberrockets = 4;
    drone.warningshots = 3;
    drone setdrawinfrared(1);
    target_set(drone, vectorscale((0, 0, 1), 20));
    drone vehicle::init_target_group();
    drone vehicle::add_to_target_group(drone);
    drone setneargoalnotifydist(35);
    drone setup_gameplay_think(category);
    drone.killstreak_end_time = gettime() + 90000;
    params = level.killstreakbundle[#"tank_robot"];
    immediate_use = isdefined(params.ksuseimmediately) ? params.ksuseimmediately : 0;
    waitframe(1);
    owner remote_weapons::useremoteweapon(drone, "killstreak_ai_tank", immediate_use);
    owner.var_976238cf = #"tank_robot";
    owner thread function_47e16e28(drone);
    drone thread kill_monitor();
    drone thread tank_rocket_watch_ai();
    drone callback::function_d8abfc3d(#"on_end_game", &on_end_game);
    if (isdefined(level.var_4b38c02b)) {
        drone [[ level.var_4b38c02b ]]();
    }
    drone playloopsound(#"hash_aa65b39680b8d1b");
    owner.ai_tank_drone = drone;
    foreach (player in level.players) {
        drone respectnottargetedbyaitankperk(player);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd5c3473b, Offset: 0x3790
// Size: 0x70
function function_47e16e28(weapon) {
    weapon endon(#"remote_weapon_end", #"death");
    while (self.var_976238cf == #"tank_robot") {
        waitframe(1);
    }
    weapon notify(#"remote_weapon_end");
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xedf98a35, Offset: 0x3808
// Size: 0x7dc
function function_9868e24e(player) {
    self notify(#"hash_3eddb5faa34443ee");
    self endon(#"hash_3eddb5faa34443ee");
    tank = self;
    self endon(#"death");
    fovcosine = cos(15);
    player.var_6b2d5c29 = [];
    player.var_f1470bda = [];
    for (ti = 0; ti < 5; ti++) {
        player.var_6b2d5c29[ti] = spawnstruct();
        player.var_6b2d5c29[ti].state = 0;
        uifield = level.var_aca462a0[ti];
        if (!uifield multi_stage_target_lockon::is_open(player)) {
            uifield multi_stage_target_lockon::open(player, 1);
        }
        uifield multi_stage_target_lockon::set_entnum(player, player.clientid);
        uifield multi_stage_target_lockon::set_targetstate(player, 0);
    }
    enemies = getplayers();
    ti = 0;
    foreach (enemy in enemies) {
        if (isplayer(enemy) && util::function_fbce7263(player.team, enemy.team)) {
            entnum = enemy getentitynumber();
            player.var_f1470bda[entnum] = ti;
            ti++;
            if (ti >= 5) {
                break;
            }
        }
    }
    while (1) {
        origin = player getplayercamerapos();
        angles = player getplayerangles();
        var_5781dbe = anglestoforward(angles);
        fwd = vectorscale(var_5781dbe, 2000);
        locking = player adsbuttonpressed();
        var_5ce6a3c6 = 0;
        enemies = getplayers();
        foreach (target in enemies) {
            if (!isplayer(target) || player.team === target.team) {
                continue;
            }
            if (target hasperk(#"specialty_nokillstreakreticle")) {
                continue;
            }
            var_4ef4e267 = target getentitynumber();
            ti = player.var_f1470bda[var_4ef4e267];
            if (!isdefined(ti)) {
                continue;
            }
            uifield = level.var_aca462a0[ti];
            var_8712c5b8 = player.var_6b2d5c29[ti];
            if (target.ignoreme === 1 || !isalive(target) || self.isjammed === 1) {
                var_8712c5b8.state = 0;
            } else if (!bullettracepassed(origin, target.origin + vectorscale((0, 0, 1), 60), 0, player)) {
                var_8712c5b8.state = 0;
            } else if (var_8712c5b8.state != 4) {
                if (locking) {
                    good = util::within_fov(origin, angles, target.origin, fovcosine);
                    if (isdefined(good) && good && var_5ce6a3c6 < self.numberrockets) {
                        if (var_8712c5b8.state != 3) {
                            if (var_8712c5b8.state == 2) {
                                if (var_8712c5b8.var_8c0f6d2c < gettime()) {
                                    var_8712c5b8.state = 3;
                                    self playsoundtoplayer(#"hash_683ed977cfc2bf2b", player);
                                }
                            } else {
                                var_8712c5b8.state = 2;
                                var_8712c5b8.var_8c0f6d2c = gettime() + 500;
                                self playsoundtoplayer(#"hash_5386a095fd840c2e", player);
                            }
                        }
                        var_5ce6a3c6++;
                    } else {
                        var_8712c5b8.state = 1;
                    }
                } else {
                    var_8712c5b8.state = 1;
                }
            }
            uifield multi_stage_target_lockon::set_entnum(player, var_4ef4e267);
            uifield multi_stage_target_lockon::set_targetstate(player, var_8712c5b8.state);
        }
        foreach (target in enemies) {
            var_4ef4e267 = target getentitynumber();
            ti = player.var_f1470bda[var_4ef4e267];
            if (isdefined(ti)) {
                if (!isdefined(target) || !isalive(target)) {
                    level.var_aca462a0[ti] multi_stage_target_lockon::set_entnum(player, var_4ef4e267);
                    level.var_aca462a0[ti] multi_stage_target_lockon::set_targetstate(player, 0);
                    player.var_6b2d5c29[ti].state = 0;
                }
            }
        }
        waitframe(1);
        waitframe(1);
        waitframe(1);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 15, eflags: 0x1 linked
// Checksum 0x581ce993, Offset: 0x3ff0
// Size: 0xb4
function function_4f8d11b(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    if (isdefined(einflictor) && einflictor == self) {
        return 0;
    }
    if (isdefined(eattacker) && eattacker == self) {
        return 0;
    }
    return idamage;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe7388d47, Offset: 0x40b0
// Size: 0x74
function state_death_update(params) {
    self endon(#"death");
    death_type = vehicle_ai::get_death_type(params);
    if (!isdefined(death_type)) {
        params.death_type = "gibbed";
    }
    self vehicle_ai::defaultstate_death_update(params);
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6ead436e, Offset: 0x4130
// Size: 0xfc
function state_emped_update(params) {
    self endon(#"death", #"change_state");
    angles = self gettagangles("tag_turret");
    self turretsettargetangles(0, (45, angles[1] - self.angles[1], 0));
    angles = self gettagangles("tag_gunner_turret1");
    self turretsettargetangles(1, (45, angles[1] - self.angles[1], 0));
    self vehicle_ai::defaultstate_emped_update(params);
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1626dc47, Offset: 0x4238
// Size: 0xf0
function state_driving_update(params) {
    self endon(#"change_state", #"death");
    if (isdefined(self.var_b4c9d62) && self.var_b4c9d62) {
        return;
    }
    driver = self getseatoccupant(0);
    if (isplayer(driver)) {
        while (1) {
            driver endon(#"disconnect");
            driver util::waittill_vehicle_move_up_button_pressed();
            if (self.cobra === 0) {
                self cobra_raise();
            } else {
                self cobra_retract();
            }
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc76c3ce, Offset: 0x4330
// Size: 0xf2
function function_481e984f(params) {
    if (isalive(self) && isvehicle(self)) {
        self enableaimassist();
        self.turretrotscale = 1;
        vehicle_ai::clearalllookingandtargeting();
        vehicle_ai::clearallmovement();
        if (!ispointonnavmesh(self.origin, self)) {
            newpos = getclosestpointonnavmesh(self.origin, 500, self getpathfindingradius(), self.var_6e9e073d);
            if (isdefined(newpos)) {
                self.origin = newpos;
            }
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xfa22cf77, Offset: 0x4430
// Size: 0xe4
function cobra_raise() {
    if (isdefined(self.var_b4c9d62) && self.var_b4c9d62) {
        return;
    }
    self.cobra = 1;
    if (isdefined(self.settings.cobra_fx_1) && isdefined(self.settings.cobra_tag_1)) {
        playfxontag(self.settings.cobra_fx_1, self, self.settings.cobra_tag_1);
    }
    self asmrequestsubstate(#"hash_3e3fc20d5fcbf6e0");
    self vehicle_ai::waittill_asm_complete(#"hash_3e3fc20d5fcbf6e0", 4);
    self laseron();
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x27bb4892, Offset: 0x4520
// Size: 0x8c
function cobra_retract() {
    if (isdefined(self.var_b4c9d62) && self.var_b4c9d62) {
        return;
    }
    self.cobra = 0;
    self laseroff();
    self notify(#"disable_lens_flare");
    self asmrequestsubstate(#"locomotion@movement");
    self vehicle_ai::waittill_asm_complete("locomotion@movement", 4);
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xed51b82c, Offset: 0x45b8
// Size: 0x1b4
function private state_combat_enter(params) {
    if (!ispointonnavmesh(self.origin) || !ispointonnavmesh(self.origin, 50)) {
        var_8f3583cf = ai::t_cylinder(self.origin, 30, 30);
        goalarray = tacticalquery("ai_tank_wander", self.origin, self, var_8f3583cf);
        goalarray = damage_armor_activati_(self, goalarray);
        if (goalarray.size) {
            goal = arraygetclosest(self.origin, goalarray);
            if (isdefined(goal)) {
                newpos = goal.origin;
            } else {
                goal = array::random(goalarray);
                newpos = goal.origin;
            }
        }
        if (!isdefined(newpos)) {
            newpos = getclosestpointonnavmesh(self.origin, 500, self getpathfindingradius(), self.var_6e9e073d);
        }
        if (isdefined(newpos)) {
            self.origin = newpos;
        }
    }
    self thread function_f358791();
    self thread turretfireupdate();
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x22882b68, Offset: 0x4778
// Size: 0x28c
function function_f358791() {
    self endon(#"death", #"change_state");
    wait(1);
    for (;;) {
        for (;;) {
            if (isdefined(self.isstunned) && self.isstunned) {
                self.favoriteenemy = undefined;
                waitframe(1);
                continue;
            }
            targets = [];
            targetsmissile = [];
            players = level.players;
            foreach (player in players) {
                if (self cantargetplayer(player)) {
                    targets[targets.size] = player;
                }
            }
            tanks = getentarray("talon", "targetname");
            foreach (tank in tanks) {
                if (self cantargettank(tank)) {
                    targets[targets.size] = tank;
                }
            }
            actors = getactorarray();
            foreach (actor in actors) {
                if (self cantargetactor(actor)) {
                    targets[targets.size] = actor;
                }
            }
            self.favoriteenemy = function_b2cc6703(targets);
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x468c8e4b, Offset: 0x4a10
// Size: 0x24c
function function_b2cc6703(targets) {
    entnum = self getentitynumber();
    for (idx = 0; idx < targets.size; idx++) {
        if (!isdefined(targets[idx].var_629a6b13)) {
            targets[idx].var_629a6b13 = [];
        }
        targets[idx].var_629a6b13[entnum] = 0;
        if (isdefined(targets[idx].type) && targets[idx].type == "dog") {
            update_dog_threat(targets[idx]);
        } else if (isactor(targets[idx])) {
            update_actor_threat(targets[idx]);
        } else if (isplayer(targets[idx])) {
            update_player_threat(targets[idx]);
        } else {
            update_non_player_threat(targets[idx]);
        }
    }
    var_8ec7f501 = undefined;
    highest = -1;
    for (idx = 0; idx < targets.size; idx++) {
        /#
            assert(isdefined(targets[idx].var_629a6b13[entnum]), "<unknown string>");
        #/
        if (targets[idx].var_629a6b13[entnum] >= highest) {
            highest = targets[idx].var_629a6b13[entnum];
            var_8ec7f501 = targets[idx];
        }
    }
    return var_8ec7f501;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xc8418abf, Offset: 0x4c68
// Size: 0x2e2
function private update_player_threat(player) {
    entnum = self getentitynumber();
    player.var_629a6b13[entnum] = 0;
    dist = distance(player.origin, self.origin);
    player.var_629a6b13[entnum] = player.var_629a6b13[entnum] - dist;
    if (isdefined(self.attacker) && player == self.attacker) {
        player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + 100;
    }
    if (isdefined(player.carryobject)) {
        player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + 200;
    }
    if (isdefined(player.score)) {
        player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + player.score * 2;
    }
    if (player weapons::has_launcher()) {
        if (player weapons::has_lockon(self)) {
            player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + 1000;
        } else {
            player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + 500;
        }
    }
    if (player weapons::has_heavy_weapon()) {
        player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + 300;
    }
    if (player weapons::has_lmg()) {
        player.var_629a6b13[entnum] = player.var_629a6b13[entnum] + 200;
    }
    if (isdefined(player.antithreat)) {
        player.var_629a6b13[entnum] = player.var_629a6b13[entnum] - player.antithreat;
    }
    if (player.var_629a6b13[entnum] <= 0) {
        player.var_629a6b13[entnum] = 2;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xd646c848, Offset: 0x4f58
// Size: 0xca
function private update_non_player_threat(non_player) {
    entnum = self getentitynumber();
    non_player.var_629a6b13[entnum] = 0;
    dist = distance(non_player.origin, self.origin);
    non_player.var_629a6b13[entnum] = non_player.var_629a6b13[entnum] - dist;
    if (non_player.var_629a6b13[entnum] <= 0) {
        non_player.var_629a6b13[entnum] = 1;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x1dca3ae1, Offset: 0x5030
// Size: 0x21a
function private update_actor_threat(actor) {
    entnum = self getentitynumber();
    actor.var_629a6b13[entnum] = 0;
    dist = distance(actor.origin, self.origin);
    actor.var_629a6b13[entnum] = actor.var_629a6b13[entnum] - dist;
    if (isdefined(actor.owner)) {
        if (isdefined(self.attacker) && actor.owner == self.attacker) {
            actor.var_629a6b13[entnum] = actor.var_629a6b13[entnum] + 100;
        }
        if (isdefined(actor.owner.carryobject)) {
            actor.var_629a6b13[entnum] = actor.var_629a6b13[entnum] + 200;
        }
        if (isdefined(actor.owner.score)) {
            actor.var_629a6b13[entnum] = actor.var_629a6b13[entnum] + actor.owner.score * 4;
        }
        if (isdefined(actor.owner.antithreat)) {
            actor.var_629a6b13[entnum] = actor.var_629a6b13[entnum] - actor.owner.antithreat;
        }
    }
    if (actor.var_629a6b13[entnum] <= 0) {
        actor.var_629a6b13[entnum] = 1;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xff946be3, Offset: 0x5258
// Size: 0x9a
function private update_dog_threat(dog) {
    entnum = self getentitynumber();
    dog.var_629a6b13[entnum] = 0;
    dist = distance(dog.origin, self.origin);
    dog.var_629a6b13[entnum] = dog.var_629a6b13[entnum] - dist;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x633e3783, Offset: 0x5300
// Size: 0x1b0
function cantargetplayer(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isalive(player) || player.sessionstate != "playing") {
        return 0;
    }
    if (player.ignoreme === 1) {
        return 0;
    }
    if (isdefined(self.owner) && player == self.owner) {
        return 0;
    }
    if (!isdefined(player.team)) {
        return 0;
    }
    if (level.teambased && player.team == self.team) {
        return 0;
    }
    if (player.team == #"spectator") {
        return 0;
    }
    var_2910def0 = self targetting_delay::function_1c169b3a(player);
    targetting_delay::function_a4d6d6d8(player, int((isdefined(self.targeting_delay) ? self.targeting_delay : 0.25) * 1000));
    if (!var_2910def0) {
        return 0;
    }
    if (player depthinwater() >= 30 || player isplayerswimming()) {
        return 0;
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbcf94eb7, Offset: 0x54b8
// Size: 0x7a
function cantargettank(tank) {
    if (!isdefined(tank)) {
        return 0;
    }
    if (!isdefined(tank.team)) {
        return 0;
    }
    if (tank.team == self.team) {
        return 0;
    }
    if (isdefined(tank.owner) && self.owner == tank.owner) {
        return 0;
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf64e3819, Offset: 0x5540
// Size: 0x80
function cantargetactor(actor) {
    if (!isdefined(actor)) {
        return 0;
    }
    if (!isactor(actor)) {
        return 0;
    }
    if (!isalive(actor)) {
        return 0;
    }
    if (!isdefined(actor.team)) {
        return 0;
    }
    if (actor.team == self.team) {
        return 0;
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd716561e, Offset: 0x55c8
// Size: 0x350
function turretfireupdate() {
    self endon(#"death", #"change_state");
    if (!isdefined(self) || !isalive(self) || iscorpse(self)) {
        return;
    }
    weapon = self seatgetweapon(0);
    if (weapon.name == "none") {
        return;
    }
    self turretsetontargettolerance(0, 7);
    while (1) {
        if (self.avoid_shooting_owner === 1 && isdefined(self.owner)) {
            if (self vehicle_ai::owner_in_line_of_fire()) {
                wait(0.1);
                continue;
            }
        }
        if (isalive(self) && !(isdefined(self.isstunned) && self.isstunned) && isdefined(self.enemy)) {
            var_f4cf81b8 = self gettagorigin("tag_flash");
            enemyeyepos = self.enemy geteye();
            var_a44b348b = sighttracepassed(var_f4cf81b8, enemyeyepos, 0, self, self.enemy);
            if (var_a44b348b && !function_98a125e6()) {
                self turretsettarget(0, self.enemy);
                self vehlookat(self.enemy);
                waitframe(1);
                if (!self.turretontarget) {
                    wait(0.1);
                }
                if (self.turretontarget && isdefined(self.enemy)) {
                    self vehicle_ai::fire_for_time(randomfloatrange(self.settings.burstfiredurationmin, self.settings.burstfiredurationmax), 0, self.enemy);
                }
                if (isdefined(self.enemy) && isai(self.enemy)) {
                    wait(randomfloatrange(self.settings.burstfireaidelaymin, self.settings.burstfireaidelaymax));
                } else {
                    wait(randomfloatrange(self.settings.burstfiredelaymin, self.settings.burstfiredelaymax));
                }
            }
            wait(1);
        } else {
            wait(1);
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x11adf0e8, Offset: 0x5920
// Size: 0x720
function function_dd91d091(params) {
    self endon(#"change_state", #"death");
    self setspeed(self.settings.defaultmovespeed);
    self setacceleration(isdefined(self.settings.default_move_acceleration) ? self.settings.default_move_acceleration : 10);
    heatseekingmissile::initlockfield(self);
    for (;;) {
        /#
            assert(isdefined(self.ai));
        #/
        if (!isdefined(self.ai.var_88b0fd29)) {
            self.ai.var_88b0fd29 = gettime();
        }
        var_12cb92c6 = 0;
        var_1f2328d0 = self function_4794d6a3();
        newpos = undefined;
        forcedgoal = isdefined(var_1f2328d0.goalforced) && var_1f2328d0.goalforced;
        isatgoal = isdefined(var_1f2328d0.isatgoal) && var_1f2328d0.isatgoal || self isapproachinggoal() && isdefined(self.overridegoalpos);
        itsbeenawhile = isdefined(var_1f2328d0.isatgoal) && var_1f2328d0.isatgoal && gettime() > self.ai.var_88b0fd29;
        var_48ea0381 = 0;
        var_2a8c95a5 = forcedgoal && isdefined(self.overridegoalpos) && distancesquared(self.overridegoalpos, var_1f2328d0.goalpos) < self.radius * self.radius;
        if (isdefined(self.enemy) && !self haspath()) {
            var_48ea0381 = !self seerecently(self.enemy, randomintrange(3, 5));
            if (issentient(self.enemy) || function_ffa5b184(self.enemy)) {
                var_48ea0381 = var_48ea0381 && !self attackedrecently(self.enemy, randomintrange(5, 7));
            }
        }
        var_12cb92c6 = !isatgoal || var_48ea0381 || itsbeenawhile;
        var_12cb92c6 = var_12cb92c6 && !var_2a8c95a5;
        if (var_12cb92c6) {
            if (forcedgoal) {
                newpos = getclosestpointonnavmesh(var_1f2328d0.goalpos, 500, self getpathfindingradius(), self.var_6e9e073d);
            } else {
                goalarray = [];
                if (isdefined(self.enemy)) {
                    goalarray = tacticalquery("ai_tank_combat", var_1f2328d0.goalpos, self, self.enemy);
                    goalarray = damage_armor_activati_(self, goalarray);
                } else {
                    var_8f3583cf = ai::t_cylinder(self.origin, 200, 100);
                    goalarray = tacticalquery("ai_tank_wander", var_1f2328d0.goalpos, self, var_8f3583cf);
                    goalarray = damage_armor_activati_(self, goalarray);
                }
                var_817e8fd0 = [];
                if (isdefined(goalarray) && goalarray.size) {
                    foreach (goal in goalarray) {
                        if (!self isingoal(goal.origin)) {
                            continue;
                        }
                        if (isdefined(self.overridegoalpos) && distancesquared(self.overridegoalpos, goal.origin) < 100 * 100) {
                            continue;
                        }
                        var_817e8fd0[var_817e8fd0.size] = goal;
                    }
                    if (var_817e8fd0.size) {
                        goal = array::random(var_817e8fd0);
                        goalpos = goal.origin;
                    }
                }
            }
            if (!isdefined(goalpos)) {
                goalpos = getclosestpointonnavmesh(var_1f2328d0.goalpos, 500, self getpathfindingradius(), self.var_6e9e073d);
            }
            self.ai.var_88b0fd29 = gettime() + randomintrange(3500, 5000);
        }
        if (isdefined(goalpos)) {
            self function_a57c34b7(goalpos, 1, 1);
            self.current_pathto_pos = goalpos;
        }
        if (self haspath()) {
            self asmrequestsubstate(#"locomotion@movement");
            result = undefined;
            result = self waittill(#"near_goal", #"stunned");
        } else {
            self asmrequestsubstate(#"hash_236f963ae1728eb3");
        }
        wait(randomintrange(2, 5));
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1c42a490, Offset: 0x6048
// Size: 0x94
function function_37cc249f() {
    enemies = util::function_81ccf6d3(self.team);
    alltargets = arraycombine(enemies, getactorarray(), 1, 0);
    alltargets = arraysort(enemies, self.origin, 1);
    if (alltargets.size) {
        return alltargets[0];
    }
    return undefined;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4d0bb7d2, Offset: 0x60e8
// Size: 0xae
function function_d15dd929(radius, origin) {
    result = function_9cc082d2(origin + vectorscale((0, 0, 1), 100), 200);
    if (isdefined(result) && isdefined(result[#"materialflags"]) && result[#"materialflags"] & 2) {
        return 0;
    }
    if (!ispointonnavmesh(origin, radius, 1)) {
        return 0;
    }
    return 1;
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa5bf9519, Offset: 0x61a0
// Size: 0x17c
function damage_armor_activati_(entity, tacpoints) {
    validpoints = [];
    radius = entity getpathfindingradius();
    if (isdefined(tacpoints) && tacpoints.size > 0) {
        foreach (tacpoint in tacpoints) {
            if (function_d15dd929(radius, tacpoint.origin)) {
                array::add(validpoints, tacpoint);
            } else {
                /#
                    record3dtext("<unknown string>", tacpoint.origin + vectorscale((0, 0, 1), 40), (1, 1, 1), "tag_turret");
                #/
                /#
                    recordline(tacpoint.origin + vectorscale((0, 0, 1), 40), tacpoint.origin, (1, 1, 1), "tag_turret");
                #/
            }
        }
    }
    return validpoints;
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6a9f8b03, Offset: 0x6328
// Size: 0x17a
function function_4ae23c85() {
    newpos = undefined;
    searchradius = 1200;
    origin = getclosestpointonnavmesh(self.origin, searchradius, self getpathfindingradius(), self.var_6e9e073d);
    if (isdefined(origin)) {
        cylinder = ai::t_cylinder(origin, searchradius, 200);
        var_8f3583cf = ai::t_cylinder(self.origin, 100, 200);
        tacpoints = tacticalquery("tank_robot_tacquery_wander", origin, cylinder, self, var_8f3583cf);
        tacpoints = damage_armor_activati_(self, tacpoints);
        if (isdefined(tacpoints) && tacpoints.size > 0) {
            tacpoints = array::randomize(tacpoints);
            newpos = getclosestpointonnavmesh(tacpoints[0].origin, self.goalradius, self getpathfindingradius(), self.var_6e9e073d);
        }
    }
    return newpos;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x517cfced, Offset: 0x64b0
// Size: 0x96e
function state_combat_update(params) {
    self endon(#"change_state", #"death");
    if (!isdefined(self) || !isalive(self) || iscorpse(self)) {
        return;
    }
    self setspeed(self.settings.defaultmovespeed);
    self setacceleration(isdefined(self.settings.default_move_acceleration) ? self.settings.default_move_acceleration : 10);
    heatseekingmissile::initlockfield(self);
    iterationlimit = getdvarint(#"hkai_pathfinditerationlimit", 1800);
    for (;;) {
        for (;;) {
            if (isdefined(self.isstunned) && self.isstunned || isdefined(self.var_b61a6415) && self.var_b61a6415) {
                waitframe(1);
                continue;
            }
            newpos = undefined;
            cansee = 0;
            if (isdefined(level.var_6cfbe5a)) {
                [[ level.var_6cfbe5a ]]->waitinqueue(self);
            }
            if (isdefined(self.enemy)) {
                var_f4cf81b8 = self gettagorigin("tag_flash");
                enemyeyepos = self.enemy geteye();
                cansee = sighttracepassed(var_f4cf81b8, enemyeyepos, 0, self, self.enemy);
            }
            if (isdefined(self.enemy) && cansee) {
                var_8f3583cf = ai::t_cylinder(self.origin, 100, 200);
                tacpoints = tacticalquery("tank_robot_tacquery_combat", self.enemy.origin, self, var_8f3583cf);
                tacpoints = damage_armor_activati_(self, tacpoints);
                if (isdefined(tacpoints) && tacpoints.size > 0) {
                    newpos = getclosestpointonnavmesh(tacpoints[0].origin, self.goalradius, self getpathfindingradius(), self.var_6e9e073d);
                }
            } else {
                if (isdefined(self.enemy)) {
                    enemy = self.enemy;
                } else {
                    enemy = self function_37cc249f();
                }
                if (isdefined(enemy)) {
                    var_4e35e079 = getclosestpointonnavmesh(enemy.origin, 500, self getpathfindingradius(), self.var_6e9e073d);
                    var_2a54124d = 0;
                    if (isdefined(var_4e35e079)) {
                        path = generatenavmeshpath(self.origin, var_4e35e079, self, undefined, undefined, iterationlimit);
                        if (isdefined(path) && path.status === "succeeded") {
                            var_2a54124d = 1;
                        }
                    }
                    if (var_2a54124d) {
                        newpos = var_4e35e079;
                    } else {
                        searchradius = 800;
                        var_6dc80cbb = 100;
                        origin = getclosestpointonnavmesh(self.origin, var_6dc80cbb, self.var_6e9e073d);
                        forwardpos = enemy.origin;
                        if (isdefined(origin)) {
                            cylinder = ai::t_cylinder(origin, searchradius, 500);
                            var_8f3583cf = ai::t_cylinder(self.origin, 100, 200);
                            tacpoints = tacticalquery("tank_robot_tacquery_seek", origin, cylinder, self, var_8f3583cf, forwardpos);
                            tacpoints = damage_armor_activati_(self, tacpoints);
                            if (isdefined(tacpoints) && tacpoints.size > 0) {
                                newpos = getclosestpointonnavmesh(tacpoints[0].origin, self.goalradius, self getpathfindingradius(), self.var_6e9e073d);
                            }
                        }
                    }
                } else {
                    newpos = function_4ae23c85();
                }
            }
            foundpath = 0;
            if (isdefined(newpos)) {
                self.var_640af0c9 = newpos;
                if (!ispointonnavmesh(self.origin, self)) {
                    getbackpoint = getclosestpointonnavmesh(self.origin, 500, self getpathfindingradius(), self.var_6e9e073d);
                    if (isdefined(getbackpoint)) {
                        self.origin = getbackpoint;
                    }
                }
                path = generatenavmeshpath(self.origin, newpos, self, undefined, undefined, iterationlimit);
                if (isdefined(path) && path.status === "succeeded") {
                    foundpath = 1;
                }
                if (foundpath) {
                    /#
                        recordsphere(newpos, 3, (0, 1, 0), "tag_turret");
                    #/
                    self function_a57c34b7(newpos, 0, 1);
                    self setbrake(0);
                    self asmrequestsubstate(#"locomotion@movement");
                    result = undefined;
                    result = self waittilltimeout(randomintrange(4, 5), #"near_goal", #"stunned");
                } else {
                    /#
                        recordsphere(newpos, 3, (1, 0, 0), "tag_turret");
                    #/
                }
            }
            if (!foundpath) {
                if (isdefined(level.var_6cfbe5a)) {
                    [[ level.var_6cfbe5a ]]->waitinqueue(self);
                }
                newpos = function_4ae23c85();
                if (isdefined(newpos)) {
                    path = generatenavmeshpath(self.origin, newpos, self, undefined, undefined, iterationlimit);
                    if (isdefined(path) && path.status === "succeeded") {
                        foundpath = 1;
                    }
                    if (foundpath) {
                        /#
                            recordsphere(newpos, 3, (0, 1, 0), "tag_turret");
                        #/
                        self function_a57c34b7(newpos, 0, 1);
                        self setbrake(0);
                        self asmrequestsubstate(#"locomotion@movement");
                        result = undefined;
                        result = self waittilltimeout(randomintrange(4, 5), #"near_goal", #"stunned");
                    }
                }
            }
            if (foundpath) {
                continue;
            };
            self function_d4c687c9();
            self setbrake(1);
            vehicle_ai::clearallmovement(1);
            self asmrequestsubstate(#"hash_236f963ae1728eb3");
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x31611a02, Offset: 0x6e28
// Size: 0xa4
function setup_gameplay_think(category) {
    drone = self;
    drone thread tank_abort_think();
    drone thread tank_team_kill();
    drone thread tank_too_far_from_nav_mesh_abort_think();
    drone thread tank_death_think(category);
    drone thread tank_damage_think();
    drone thread watchwater();
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd01d8555, Offset: 0x6ed8
// Size: 0x4e
function tank_team_kill() {
    if (isdefined(self.owner)) {
        self endon(#"death");
        self.owner waittill(#"teamkillkicked");
        self notify(#"death");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7d647f7f, Offset: 0x6f30
// Size: 0x13e
function kill_monitor() {
    self endon(#"death");
    last_kill_vo = 0;
    kill_vo_spacing = 4000;
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"killed");
        victim = waitresult.victim;
        if (!isdefined(self.owner) || !isdefined(victim)) {
            continue;
        }
        if (self.owner == victim) {
            continue;
        }
        if (level.teambased && self.owner.team == victim.team) {
            continue;
        }
        if (!self.controlled && last_kill_vo + kill_vo_spacing < gettime()) {
            self killstreaks::play_pilot_dialog_on_owner("kill", "tank_robot", self.killstreak_id);
            last_kill_vo = gettime();
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xfc202f85, Offset: 0x7078
// Size: 0x64
function tank_abort_think() {
    if (isdefined(level.var_30264985)) {
        return;
    }
    tank = self;
    tank thread killstreaks::waitfortimeout("tank_robot", 90000, &tank_timeout_callback, "death", "emp_jammed");
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe8fe6169, Offset: 0x70e8
// Size: 0x10c
function cleanup_targeting(player) {
    self notify(#"hash_3eddb5faa34443ee");
    if (isdefined(player)) {
        for (ti = 0; ti < 5; ti++) {
            if (isdefined(level.var_aca462a0[ti])) {
                uifield = level.var_aca462a0[ti];
                uifield multi_stage_target_lockon::set_targetstate(player, 0);
                if (uifield multi_stage_target_lockon::is_open(player)) {
                    uifield multi_stage_target_lockon::close(player);
                }
            }
            if (isdefined(player.var_6b2d5c29) && isdefined(player.var_6b2d5c29[ti])) {
                player.var_6b2d5c29[ti].state = 0;
            }
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4a9787a6, Offset: 0x7200
// Size: 0x12e
function tank_timeout_callback() {
    self killstreaks::play_pilot_dialog_on_owner("timeout", "tank_robot");
    self.timed_out = 1;
    self vehicle_death::death_fx();
    player = self.owner;
    if (isdefined(player) && isalive(player)) {
        player.ai_tank_drone = undefined;
        if (isdefined(self.controlled) && self.controlled) {
            player stop_remote();
            visionset_mgr::deactivate("visionset", "agr_visionset", player);
        }
        player clientfield::set_player_uimodel("hudItems.tankState", 0);
    }
    cleanup_targeting(player);
    wait(0.25);
    self notify(#"death");
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x76d63fec, Offset: 0x7338
// Size: 0x186
function tank_watch_owner_events() {
    self notify(#"tank_watch_owner_events_singleton");
    self endon(#"tank_watch_owner_events_singleton", #"death");
    res = undefined;
    res = self.owner waittill(#"joined_team", #"disconnect", #"joined_spectators");
    self makevehicleusable();
    if (isdefined(self.owner) && isdefined(self.controlled) && self.controlled) {
        visionset_mgr::deactivate("visionset", "agr_visionset", self.owner);
        self.owner stop_remote();
    }
    self.controlled = 0;
    if (isdefined(self.owner)) {
        self.owner unlink();
        self clientfield::set("vehicletransition", 0);
    }
    self makevehicleunusable();
    self.abandoned = 1;
    self notify(#"death");
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x85077ba4, Offset: 0x74c8
// Size: 0x28
function on_end_game(drone) {
    if (isdefined(drone)) {
        drone notify(#"death");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe3ed9c7f, Offset: 0x74f8
// Size: 0x5c
function stop_remote() {
    if (!isdefined(self)) {
        return;
    }
    self killstreaks::clear_using_remote();
    self remote_weapons::destroyremotehud();
    self util::clientnotify("nofutz");
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9946188c, Offset: 0x7560
// Size: 0x7e
function tank_hacked_health_update(hacker) {
    tank = self;
    hackeddamagetaken = tank.defaultmaxhealth - tank.hackedhealth;
    /#
        assert(hackeddamagetaken > 0);
    #/
    if (hackeddamagetaken > tank.damagetaken) {
        tank.damagetaken = hackeddamagetaken;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6c680c46, Offset: 0x75e8
// Size: 0x570
function tank_damage_think() {
    self endon(#"death");
    /#
        assert(isdefined(self.maxhealth));
    #/
    self.defaultmaxhealth = self.maxhealth;
    maxhealth = self.maxhealth;
    self.maxhealth = 999999;
    self.health = self.maxhealth;
    self.isstunned = 0;
    self.var_b61a6415 = 0;
    self.var_cff05bbd = 0;
    self.hackedhealthupdatecallback = &tank_hacked_health_update;
    self.hackedhealth = killstreak_bundles::get_hacked_health("tank_robot");
    low_health = 0;
    self.damagetaken = 0;
    for (;;) {
        waitresult = undefined;
        waitresult = self waittill(#"damage");
        damage = waitresult.amount;
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        mod = waitresult.mod;
        chargelevel = waitresult.charge_level;
        position = waitresult.position;
        flags = waitresult.flags;
        self.maxhealth = 999999;
        self.health = self.maxhealth;
        /#
            self.damage_debug = damage + "<unknown string>" + weapon.name + "<unknown string>";
        #/
        if (weapon.isemp && mod == "MOD_GRENADE_SPLASH") {
            emp_damage_to_apply = killstreak_bundles::get_emp_grenade_damage("tank_robot", maxhealth);
            if (!isdefined(emp_damage_to_apply)) {
                emp_damage_to_apply = maxhealth / 2;
            }
            self.damagetaken = self.damagetaken + emp_damage_to_apply;
            damage = 0;
            if (!self.isstunned && emp_damage_to_apply > 0) {
                self.isstunned = 1;
                challenges::stunnedtankwithempgrenade(attacker);
                self thread tank_stun(1, 0);
            }
        }
        if (!self.isstunned) {
            if (weapon.dostun && (mod == "MOD_GRENADE_SPLASH" || mod == "MOD_GAS")) {
                self.isstunned = 1;
                self thread tank_stun(3, 0);
            }
        }
        weapon_damage = killstreak_bundles::get_weapon_damage("tank_robot", maxhealth, attacker, weapon, mod, damage, flags, chargelevel);
        if (!isdefined(weapon_damage)) {
            weapon_damage = killstreaks::get_old_damage(attacker, weapon, mod, damage, 1);
        }
        if (isdefined(level.var_30264985)) {
            weapon_damage = weapon_damage * 2;
        }
        self.damagetaken = self.damagetaken + weapon_damage;
        if (self.controlled && isdefined(self.owner)) {
            self.owner sendkillstreakdamageevent(int(weapon_damage));
            self.owner vehicle::update_damage_as_occupant(self.damagetaken, maxhealth);
        }
        if (self.damagetaken >= maxhealth) {
            if (isdefined(self.owner)) {
                self.owner.dofutz = 1;
            }
            self.health = 0;
            self notify(#"death", {#weapon:weapon, #mod:mod, #attacker:attacker});
            return;
        }
        self function_aa61ec2b(weapon_damage);
        if (!low_health && self.damagetaken > maxhealth / 1.8) {
            self killstreaks::play_pilot_dialog_on_owner("damaged", "tank_robot", self.killstreak_id);
            self thread tank_low_health_fx();
            low_health = 1;
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc9063dc4, Offset: 0x7b60
// Size: 0xfc
function tank_low_health_fx() {
    self endon(#"death");
    self.damage_fx = spawn("script_model", self gettagorigin("tag_origin") + vectorscale((0, 0, -1), 14));
    if (!isdefined(self.damage_fx)) {
        return;
    }
    self.damage_fx setmodel(#"tag_origin");
    self.damage_fx linkto(self, "tag_turret", vectorscale((0, 0, -1), 14), (0, 0, 0));
    wait(0.1);
    playfxontag(level.ai_tank_damage_fx, self.damage_fx, "tag_origin");
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xaffe373, Offset: 0x7c68
// Size: 0x5c
function function_aa61ec2b(weapon_damage) {
    if (!self.var_b61a6415) {
        self.var_cff05bbd = self.var_cff05bbd + weapon_damage;
        if (self.var_cff05bbd >= 1000) {
            self.var_cff05bbd = 0;
            self thread tank_immobile();
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb5794bfb, Offset: 0x7cd0
// Size: 0x1e4
function tank_immobile() {
    self notify(#"immobile");
    self.var_b61a6415 = 1;
    self cancelaimove();
    self function_d4c687c9();
    controlled = self.controlled;
    owner = self.owner;
    if (controlled && isdefined(owner)) {
        owner val::set(#"tank_immobile", "freezecontrols_allowlook", 1);
    }
    self clientfield::set("ai_tank_immobile", 1);
    if (controlled && isdefined(owner)) {
        owner clientfield::set_to_player("static_postfx", 1);
    }
    self waittilltimeout(1, #"death");
    isalive = isalive(self);
    if (isalive) {
        self clientfield::set("ai_tank_immobile", 0);
        self.var_b61a6415 = 0;
    }
    if (controlled && isdefined(owner)) {
        if (!isalive || !self.isstunned) {
            owner clientfield::set_to_player("static_postfx", 0);
        }
        owner val::reset(#"tank_immobile", "freezecontrols_allowlook");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xcd350410, Offset: 0x7ec0
// Size: 0xd4
function function_903fdcc2() {
    if (isdefined(self.owner) && isdefined(self.controlled) && self.controlled) {
        visionset_mgr::deactivate("visionset", "agr_visionset", self.owner);
        self.owner stop_remote();
    }
    self.controlled = 0;
    if (isdefined(self.owner)) {
        self.owner unlink();
        self clientfield::set("vehicletransition", 0);
    }
    self makevehicleunusable();
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4d06e699, Offset: 0x7fa0
// Size: 0x1c
function function_37b0973() {
    self makevehicleusable();
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc6844f1b, Offset: 0x7fc8
// Size: 0x204
function function_4110f8dd(isjammed) {
    if (!isvehicle(self)) {
        return;
    }
    self cancelaimove();
    self function_d4c687c9();
    forward = anglestoforward(self.angles);
    forward = self.origin + forward * 128;
    forward = forward - vectorscale((0, 0, 1), 64);
    self turretsettarget(0, forward);
    self disablegunnerfiring(0, 1);
    self laseroff();
    controlled = self.controlled;
    owner = self.owner;
    self.isstunned = 1;
    if (controlled) {
        owner val::set(#"tank_stun", "freezecontrols", 1);
        owner.var_c4687024 = 1;
        owner sendkillstreakdamageevent(400);
    }
    self clientfield::set("stun", 1);
    if (controlled && !isjammed) {
        owner clientfield::set_to_player("static_postfx", 1);
    }
    if (controlled && isjammed) {
        owner clientfield::set_to_player("ai_tank_jam_hud", 1);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf0a58ce3, Offset: 0x81d8
// Size: 0x154
function function_fd91abfb() {
    if (!isvehicle(self)) {
        return;
    }
    isalive = isalive(self);
    if (isalive) {
        self clientfield::set("stun", 0);
        self disablegunnerfiring(0, 0);
        self.isstunned = 0;
    }
    controlled = self.controlled;
    owner = self.owner;
    if (controlled) {
        if (!isalive || !self.var_b61a6415) {
            owner clientfield::set_to_player("static_postfx", 0);
        }
    }
    if (owner.var_c4687024 === 1) {
        owner val::reset(#"tank_stun", "freezecontrols");
        owner.var_c4687024 = undefined;
    }
    owner clientfield::set_to_player("ai_tank_jam_hud", 0);
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x97fa7626, Offset: 0x8338
// Size: 0x7c
function tank_stun(duration, isjammed) {
    self notify(#"stunned");
    self notify(#"fire_stop");
    function_4110f8dd(isjammed);
    self waittilltimeout(duration, #"death");
    function_fd91abfb();
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x0
// Checksum 0xe4c2480c, Offset: 0x83c0
// Size: 0x26c
function emp_crazy_death() {
    self clientfield::set("stun", 1);
    self notify(#"death");
    time = 0;
    randomangle = randomint(360);
    while (time < 1.45) {
        if (isdefined(self) && function_3238d10d(self.origin)) {
            self turretsettarget(0, self.origin + anglestoforward((randomintrange(305, 315), int(randomangle + time * 180), 0)) * 100);
            if (time > 0.2) {
                self fireweapon(0);
                if (randomint(100) > 85) {
                    rocket = self fireweapon(0);
                    if (isdefined(rocket)) {
                        rocket.from_ai = 1;
                    }
                }
            }
        }
        time = time + 0.05;
        waitframe(1);
    }
    if (isdefined(self)) {
        self clientfield::set("ai_tank_death", 1);
    }
    if (isdefined(self) && isdefined(level.ai_tank_explode_fx)) {
        if (function_3238d10d(self.origin)) {
            playfx(level.ai_tank_explode_fx, self.origin, (0, 0, 1));
            playsoundatposition(#"exp_mantis", self.origin);
        }
    }
    waitframe(1);
    if (isdefined(self)) {
        self hide();
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf7e234f4, Offset: 0x8638
// Size: 0x48
function function_3bb5ae4() {
    self endon(#"death");
    origin = self.origin;
    while (isdefined(self)) {
        self.origin = origin;
        waitframe(1);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x51f5e47c, Offset: 0x8688
// Size: 0x574
function tank_death_think(hardpointname) {
    team = self.team;
    killstreak_id = self.killstreak_id;
    waitresult = undefined;
    waitresult = self waittill(#"death");
    attacker = waitresult.attacker;
    weapon = waitresult.weapon;
    if (!isdefined(self)) {
        if (isdefined(killstreak_id)) {
            killstreak_stop_and_assert(hardpointname, team, killstreak_id, "Failed to handle death. A.");
        }
        return;
    }
    self.dead = 1;
    self laseroff();
    self function_d4c687c9();
    not_abandoned = !isdefined(self.abandoned) || !self.abandoned;
    if (isdefined(self.controlled) && self.controlled && isdefined(self.owner)) {
        self.owner sendkillstreakdamageevent(600);
        self.owner remote_weapons::destroyremotehud();
    }
    self clientfield::set("ai_tank_death", 1);
    self.isstunned = 0;
    settings = self.settings;
    if (isdefined(settings) && (self.timed_out === 1 || self.abandoned === 1)) {
        playfxontag(level.ai_tank_explode_fx, self, "tag_body");
        playsoundatposition(isdefined(settings.timed_out_death_sound_1) ? settings.timed_out_death_sound_1 : "exp_mantis", self.origin);
    } else {
        playfxontag(level.ai_tank_explode_fx, self, "tag_body");
        playsoundatposition(#"exp_mantis", self.origin);
    }
    if (isdefined(self.owner)) {
        self.owner clientfield::set_player_uimodel("hudItems.tankState", 0);
    }
    if (not_abandoned) {
        util::wait_network_frame();
        if (!isdefined(self)) {
            if (isdefined(killstreak_id)) {
                killstreak_stop_and_assert(hardpointname, team, killstreak_id, "Failed to handle death. B.");
            }
            return;
        }
    }
    if (self.controlled) {
        self ghost();
        if (function_3238d10d(self.origin)) {
            self thread function_3bb5ae4();
        }
    } else {
        self hide();
    }
    if (isdefined(self.damage_fx)) {
        self.damage_fx delete();
    }
    var_d3213f00 = 0;
    if (isdefined(level.aitank_explode)) {
        var_d3213f00 = [[ level.aitank_explode ]](attacker, weapon);
    }
    var_4dd90b81 = 0;
    if (isdefined(var_d3213f00) && var_d3213f00 && isdefined(self.owner)) {
        var_4dd90b81 = 3;
    }
    if (isdefined(self.owner)) {
        self.owner ability_player::function_f2250880(level.var_66e94ad5, var_4dd90b81);
    }
    if (not_abandoned) {
        self waittilltimeout(2, #"remote_weapon_end", #"death");
        if (!isdefined(self)) {
            if (isdefined(killstreak_id)) {
                killstreak_stop_and_assert(hardpointname, team, killstreak_id, "Failed to handle death. C.");
            }
            return;
        }
    }
    if (isdefined(killstreak_id)) {
        killstreakrules::killstreakstop(hardpointname, team, killstreak_id);
    }
    if (isdefined(self.owner) && isalive(self.owner) && isdefined(self.controlled) && self.controlled) {
        self.owner killstreaks::switch_to_last_non_killstreak_weapon();
    }
    if (isdefined(self.aim_entity)) {
        self.aim_entity delete();
    }
    wait(1);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xab6d33e1, Offset: 0x8c08
// Size: 0x44
function killstreak_stop_and_assert(hardpoint_name, team, killstreak_id, assert_msg) {
    killstreakrules::killstreakstop(hardpoint_name, team, killstreak_id);
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x83e214ad, Offset: 0x8c58
// Size: 0x8a
function tank_too_far_from_nav_mesh_abort_think() {
    self endon(#"death");
    not_on_nav_mesh_count = 0;
    for (;;) {
        wait(1);
        not_on_nav_mesh_count = isdefined(getclosestpointonnavmesh(self.origin, 480)) ? 0 : not_on_nav_mesh_count + 1;
        if (not_on_nav_mesh_count >= 4) {
            self notify(#"death");
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x868bc7b1, Offset: 0x8cf0
// Size: 0x74
function respectnottargetedbyaitankperk(player) {
    if (!isplayer(player)) {
        return;
    }
    aitank = self;
    aitank setignoreent(player, player hasperk(#"specialty_nottargetedbyaitank"));
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x71749105, Offset: 0x8d70
// Size: 0x334
function starttankremotecontrol(drone) {
    drone makevehicleusable();
    drone function_d4c687c9();
    drone turretcleartarget(0);
    drone laseroff();
    drone.treat_owner_damage_as_friendly_fire = 0;
    drone.ignore_team_kills = 0;
    if (isdefined(drone.playerdrivenversion)) {
        drone setvehicletype(drone.playerdrivenversion);
    }
    drone usevehicle(self, 0);
    drone clientfield::set("vehicletransition", 1);
    drone thread function_9868e24e(self);
    drone vehicle_ai::set_state("driving");
    drone makevehicleunusable();
    drone setbrake(0);
    if (4 != 0) {
        drone thread tank_rocket_watch(self);
    }
    drone thread vehicle::monitor_missiles_locked_on_to_me(self);
    if (!isdefined(level.var_30264985)) {
        self vehicle::set_vehicle_drivable_time(90000, drone.killstreak_end_time);
    }
    self vehicle::update_damage_as_occupant(isdefined(drone.damagetaken) ? drone.damagetaken : 0, isdefined(drone.defaultmaxhealth) ? drone.defaultmaxhealth : 100);
    drone update_client_ammo(drone.numberrockets, 1);
    self clientfield::set_player_uimodel("hudItems.tankState", 3);
    visionset_mgr::activate("visionset", "agr_visionset", self, 1, 90000, 1);
    if (isdefined(level.var_cffcf4da)) {
        self [[ level.var_cffcf4da ]](drone);
    }
    if (drone.isstunned === 1) {
        self val::set(#"tank_stun", "freezecontrols", 1);
        self.var_c4687024 = 1;
        self clientfield::set_to_player("ai_tank_jam_hud", 1);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x862c6000, Offset: 0x90b0
// Size: 0x374
function endtankremotecontrol(drone, exitrequestedbyowner) {
    not_dead = !(isdefined(drone.dead) && drone.dead);
    if (isdefined(drone.owner)) {
        drone.owner remote_weapons::destroyremotehud();
    }
    drone.treat_owner_damage_as_friendly_fire = 1;
    drone.ignore_team_kills = 1;
    if (drone.classname == "script_vehicle") {
        drone makevehicleunusable();
    }
    if (isdefined(drone.original_vehicle_type) && not_dead) {
        drone.vehicletype = drone.original_vehicle_type;
    }
    if (isdefined(drone.owner)) {
        drone.owner vehicle::stop_monitor_missiles_locked_on_to_me();
    }
    if (exitrequestedbyowner && not_dead) {
        if (isdefined(drone.settings.ai_enabled) && drone.settings.ai_enabled) {
            drone vehicle_ai::set_state("combat");
        } else {
            drone vehicle_ai::set_state("off");
        }
        if (isdefined(drone.owner)) {
            drone.owner clientfield::set_player_uimodel("hudItems.tankState", 2);
        }
    }
    if (drone.cobra === 1 && not_dead) {
        drone thread cobra_retract();
    }
    if (isdefined(drone.owner) && drone.controlled === 1) {
        visionset_mgr::deactivate("visionset", "agr_visionset", drone.owner);
    }
    drone clientfield::set("vehicletransition", 0);
    params = level.killstreakbundle[#"tank_robot"];
    shutdown_on_exit = isdefined(params.ksshutdownonexit) ? params.ksshutdownonexit : 0;
    if (shutdown_on_exit) {
        drone tank_timeout_callback();
    } else {
        drone cleanup_targeting(drone.owner);
    }
    if (isdefined(level.var_7f17a53e)) {
        drone.owner [[ level.var_7f17a53e ]](drone);
    }
    if (isdefined(drone) && isdefined(drone.owner)) {
        drone.owner clientfield::set_to_player("ai_tank_jam_hud", 0);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x62e993b8, Offset: 0x9430
// Size: 0xe4
function perform_recoil_missile_turret(player) {
    bundle = level.killstreakbundle[#"tank_robot"];
    earthquake(0.4, 0.5, self.origin, 200);
    self perform_recoil("tag_barrel", isdefined(self.controlled) && self.controlled ? bundle.ksmainturretrecoilforcecontrolled : bundle.ksmainturretrecoilforce, bundle.ksmainturretrecoilforcezoffset);
    if (self.controlled && isdefined(player)) {
        player playrumbleonentity("sniper_fire");
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x425e002, Offset: 0x9520
// Size: 0x94
function perform_recoil(recoil_tag, force_scale_factor, force_z_offset) {
    angles = self gettagangles(recoil_tag);
    dir = anglestoforward(angles);
    self launchvehicle(dir * force_scale_factor, self.origin + (0, 0, force_z_offset), 0);
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe245683f, Offset: 0x95c0
// Size: 0x54
function update_client_ammo(ammo_count, driver_only_update = 0) {
    if (isdefined(self.owner)) {
        self.owner clientfield::set_player_uimodel("vehicle.ammoCount", ammo_count);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe47491c1, Offset: 0x9620
// Size: 0x8a
function watch_target(owner, target_index) {
    self endon(#"death");
    wait(3);
    if (isalive(self)) {
        level.var_aca462a0[target_index] multi_stage_target_lockon::set_targetstate(owner, 0);
        owner.var_6b2d5c29[target_index].state = 0;
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x42ca04d4, Offset: 0x96b8
// Size: 0x304
function shoot_targets(projectile, max_missiles) {
    var_e3a3ecd3 = 0;
    weapon = getweapon("tank_robot_launcher_turret");
    origin = projectile.origin;
    owner = projectile.owner;
    enemies = getplayers();
    foreach (target in enemies) {
        if (isdefined(target) && isplayer(target) && util::function_fbce7263(owner.team, target.team)) {
            var_4ef4e267 = target getentitynumber();
            ti = owner.var_f1470bda[var_4ef4e267];
            if (!isdefined(ti)) {
                continue;
            }
            var_8712c5b8 = owner.var_6b2d5c29[ti];
            if (var_8712c5b8.state == 3) {
                dir = target.origin + vectorscale((0, 0, 1), 40) - origin;
                dir = vectornormalize(dir);
                rocket = magicbullet(weapon, origin, origin + dir * 1000, owner);
                if (isdefined(rocket) && rocket.classname === "rocket") {
                    rocket missile_settarget(target);
                    level.var_aca462a0[ti] multi_stage_target_lockon::set_targetstate(owner, 4);
                    var_8712c5b8.state = 4;
                    target thread watch_target(owner, ti);
                    var_e3a3ecd3++;
                    if (var_e3a3ecd3 >= max_missiles) {
                        break;
                    }
                }
            }
        }
    }
    if (var_e3a3ecd3 > 0) {
        projectile delete();
    } else {
        var_e3a3ecd3 = 1;
    }
    return var_e3a3ecd3;
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9d121abc, Offset: 0x99c8
// Size: 0x1b0
function tank_rocket_watch(player) {
    self endon(#"death");
    player endon(#"stopped_using_remote");
    if (self.numberrockets <= 0) {
        self reload_rockets(player);
    }
    if (!self.isstunned) {
        self disabledriverfiring(0);
    }
    while (1) {
        waitresult = undefined;
        waitresult = player waittill(#"missile_fire");
        var_e3a3ecd3 = 1;
        if (isdefined(waitresult.projectile)) {
            waitresult.projectile.ignore_team_kills = self.ignore_team_kills;
            if (!(isdefined(level.var_9f011465) && level.var_9f011465)) {
                var_e3a3ecd3 = player shoot_targets(waitresult.projectile, self.numberrockets);
            }
        }
        self.numberrockets = self.numberrockets - var_e3a3ecd3;
        self update_client_ammo(self.numberrockets);
        self perform_recoil_missile_turret(player);
        if (self.numberrockets <= 0) {
            self reload_rockets(player);
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x13e89f73, Offset: 0x9b80
// Size: 0x86
function tank_rocket_watch_ai() {
    self endon(#"death");
    while (1) {
        waitresult = undefined;
        waitresult = self waittill(#"missile_fire");
        if (isdefined(waitresult.projectile)) {
            waitresult.projectile.ignore_team_kills = self.ignore_team_kills;
            waitresult.projectile.killcament = self;
        }
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1305c779, Offset: 0x9c10
// Size: 0x134
function reload_rockets(player) {
    bundle = level.killstreakbundle[#"tank_robot"];
    self disabledriverfiring(1);
    weapon_wait_duration_ms = int(bundle.ksweaponreloadtime * 1000);
    player setvehicleweaponwaitduration(weapon_wait_duration_ms);
    player setvehicleweaponwaitendtime(gettime() + weapon_wait_duration_ms);
    self playsoundtoplayer(#"hash_67ccc430f6e101f3", player);
    wait(bundle.ksweaponreloadtime);
    self.numberrockets = 4;
    self update_client_ammo(self.numberrockets);
    wait(0.4);
    if (!self.isstunned) {
        self disabledriverfiring(0);
    }
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xff190422, Offset: 0x9d50
// Size: 0x5a
function function_98a125e6() {
    var_d4b5931f = 30;
    depth = getwaterheight(self.origin) - self.origin[2];
    if (depth > var_d4b5931f) {
        return 1;
    }
    return 0;
}

// Namespace ai_tank/ai_tank_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xee964b1f, Offset: 0x9db8
// Size: 0x126
function watchwater() {
    self endon(#"death");
    var_8a7edebd = 25;
    var_29ed3475 = 12.5;
    inwater = 0;
    while (!inwater) {
        wait(0.3);
        depth = getwaterheight(self.origin) - self.origin[2];
        inwater = depth > var_8a7edebd;
        if (isdefined(self.owner) && isdefined(self.controlled) && self.controlled) {
            self.owner clientfield::set_to_player("static_postfx", depth < var_29ed3475 ? 1 : 0);
        }
    }
    if (isdefined(self.owner)) {
        self.owner.dofutz = 1;
    }
    self notify(#"death");
}

// Namespace ai_tank/ai_tank_shared
// Params 2, eflags: 0x4
// Checksum 0xad1bda8, Offset: 0x9ee8
// Size: 0x5e
function private function_3c4843e3(tank_robot, timetoadd) {
    player = self;
    tank_robot.var_7b7607df[player.clientid] = gettime() + int(timetoadd * 1000);
}

