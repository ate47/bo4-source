// Atian COD Tools GSC decompiler test
#using scripts\weapons\heatseekingmissile.gsc;
#using scripts\core_common\turret_shared.gsc;
#using scripts\core_common\targetting_delay.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scoreevents_shared.gsc;
#using scripts\core_common\player\player_stats.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\killstreaks\killstreakrules_shared.gsc;
#using scripts\killstreaks\killstreak_hacking.gsc;
#using scripts\killstreaks\killstreak_bundles.gsc;
#using scripts\killstreaks\flak_drone.gsc;
#using scripts\killstreaks\airsupport.gsc;
#using scripts\killstreaks\killstreaks_util.gsc;
#using scripts\killstreaks\killstreaks_shared.gsc;
#using scripts\core_common\influencers_shared.gsc;
#using scripts\core_common\hostmigration_shared.gsc;
#using scripts\core_common\damage.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace helicopter;

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x49f5ea8b, Offset: 0x760
// Size: 0x5cc
function init_shared(bundle_name) {
    if (!isdefined(level.helicopter_shared)) {
        level.helicopter_shared = {};
        airsupport::init_shared();
        flak_drone::init_shared();
        path_start = getentarray("heli_start", "targetname");
        loop_start = getentarray("heli_loop_start", "targetname");
        /#
            debug_refresh = 1;
        #/
        thread heli_update_global_dvars(debug_refresh);
        level.chaff_offset[#"attack"] = (-130, 0, -140);
        level.choppercomlinkfriendly = #"veh_t7_drone_hunter";
        level.choppercomlinkenemy = #"hash_7948c5263c738621";
        level.chopperregular = #"hash_7948c5263c738621";
        precachehelicopter(level.chopperregular);
        clientfield::register("vehicle", "heli_comlink_bootup_anim", 1, 1, "int");
        clientfield::register("vehicle", "heli_warn_targeted", 1, 1, "int");
        clientfield::register("vehicle", "heli_warn_locked", 1, 1, "int");
        clientfield::register("vehicle", "heli_warn_fired", 1, 1, "int");
        clientfield::register("vehicle", "active_camo", 1, 3, "int");
        level.heli_paths = [];
        level.heli_loop_paths = [];
        level.heli_startnodes = [];
        level.heli_leavenodes = [];
        level.heli_crash_paths = [];
        level.last_start_node_index = 0;
        level.chopper_fx[#"explode"][#"death"] = "destruct/fx8_atk_chppr_exp_lg";
        level.chopper_fx[#"explode"][#"guard"] = "killstreaks/fx_heli_exp_md";
        level.chopper_fx[#"explode"][#"gunner"] = "killstreaks/fx_vtol_exp";
        level.chopper_fx[#"explode"][#"large"] = "killstreaks/fx_heli_exp_sm";
        level.chopper_fx[#"damage"][#"light_smoke"] = "destruct/fx8_atk_chppr_smk_trail";
        level.chopper_fx[#"damage"][#"heavy_smoke"] = "destruct/fx8_atk_chppr_exp_trail";
        level.chopper_fx[#"smoke"][#"trail"] = "destruct/fx8_atk_chppr_exp_trail";
        level.chopper_fx[#"fire"][#"trail"][#"large"] = "killstreaks/fx_heli_smk_trail_engine";
        level._effect[#"heli_comlink_light"][#"friendly"] = #"hash_33eb8912b6c63ecd";
        level._effect[#"heli_comlink_light"][#"enemy"] = #"hash_33eb8912b6c63ecd";
        bundle = struct::get_script_bundle("killstreak", bundle_name);
        killstreaks::register_bundle(bundle, &usekillstreakhelicopter);
        killstreaks::set_team_kill_penalty_scale("helicopter_comlink", 0);
        level.killstreakbundle[#"helicopter_comlink"] = bundle;
        level.killstreaks[#"helicopter_comlink"].threatonkill = 1;
        if (!path_start.size && !loop_start.size) {
            return;
        }
        heli_path_graph();
    }
    callback::on_finalize_initialization(&function_1c601b99);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xe25aaa38, Offset: 0xd38
// Size: 0x50
function function_1c601b99() {
    if (isdefined(level.var_1b900c1d)) {
        [[ level.var_1b900c1d ]](getweapon(#"cobra_20mm_comlink"), &function_bff5c062);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x8ee4938d, Offset: 0xd90
// Size: 0x1ac
function function_bff5c062(helicopter, attackingplayer) {
    helicopter killstreaks::configure_team_internal(attackingplayer, 1);
    helicopter.team = attackingplayer.team;
    helicopter setteam(attackingplayer.team);
    helicopter setowner(attackingplayer);
    helicopter.owner = attackingplayer;
    hackedcallbackpost(attackingplayer);
    helicopter.loopcount = 0;
    if (isdefined(level.var_f1edf93f)) {
        helicopter notify(#"cancel_timeout");
        var_eb79e7c3 = [[ level.var_f1edf93f ]]();
        starttime = gettime();
        duration = int(var_eb79e7c3 * 1000);
        helicopter.halftime = starttime + duration * 0.5;
        helicopter.killstreakendtime = starttime + duration;
        helicopter.endtime = starttime + duration;
        helicopter.var_478039e8 = 0;
        helicopter notify(#"abort_goal");
    }
    attackingplayer thread watchforearlyleave(helicopter);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xb9bb7098, Offset: 0xf48
// Size: 0x172
function precachehelicopter(model) {
    level.vehicle_deathmodel[model] = model;
    level.heli_sound[#"hit"] = #"evt_helicopter_hit";
    level.heli_sound[#"hitsecondary"] = #"evt_helicopter_hit";
    level.heli_sound[#"damaged"] = #"null";
    level.heli_sound[#"spinloop"] = #"evt_helicopter_spin_loop";
    level.heli_sound[#"spinstart"] = #"evt_helicopter_spin_start";
    level.heli_sound[#"crash"] = #"evt_helicopter_midair_exp";
    level.heli_sound[#"missilefire"] = #"wpn_hellfire_fire_npc";
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x5733cc09, Offset: 0x10c8
// Size: 0x24
function function_7da89497() {
    self beginlocationcomlinkselection("map_mortar_selector");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xcd0985ab, Offset: 0x10f8
// Size: 0x2d0
function usekillstreakhelicopter(hardpointtype) {
    if (self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0) {
        return false;
    }
    if (!isdefined(level.heli_paths) || !level.heli_paths.size) {
        /#
            iprintlnbold("care_package_shutdown");
        #/
        return false;
    }
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        level.helilocation = self.origin;
    }
    destination = 0;
    missilesenabled = 0;
    if (hardpointtype == "helicopter_x2") {
        missilesenabled = 1;
    }
    assert(level.heli_paths.size > 0, "<unknown string>");
    random_path = randomint(level.heli_paths[destination].size);
    startnode = level.heli_paths[destination][random_path];
    protectlocation = undefined;
    armored = 0;
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        protectlocation = (level.helilocation[0], level.helilocation[1], int(airsupport::getminimumflyheight()));
        armored = 0;
        startnode = getvalidprotectlocationstart(random_path, protectlocation, destination);
    }
    killstreak_id = self killstreakrules::killstreakstart(hardpointtype, self.team);
    if (killstreak_id == -1) {
        return false;
    }
    if (isdefined(level.var_34f03cda)) {
        self [[ level.var_34f03cda ]](hardpointtype);
    }
    self killstreaks::play_killstreak_start_dialog(hardpointtype, self.team, killstreak_id);
    self thread announcehelicopterinbound(hardpointtype);
    thread heli_think(self, startnode, self.team, missilesenabled, protectlocation, hardpointtype, armored, killstreak_id);
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x60f0755, Offset: 0x13d0
// Size: 0x54
function announcehelicopterinbound(hardpointtype) {
    team = self.team;
    self stats::function_e24eec31(killstreaks::get_killstreak_weapon(hardpointtype), #"used", 1);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x1a4ea6cb, Offset: 0x1430
// Size: 0x714
function heli_path_graph() {
    path_start = getentarray("heli_start", "targetname");
    path_dest = getentarray("heli_dest", "targetname");
    loop_start = getentarray("heli_loop_start", "targetname");
    gunner_loop_start = getentarray("heli_gunner_loop_start", "targetname");
    leave_nodes = getentarray("heli_leave", "targetname");
    crash_start = getentarray("heli_crash_start", "targetname");
    assert(isdefined(path_start) && isdefined(path_dest), "<unknown string>");
    for (i = 0; i < path_dest.size; i++) {
        startnode_array = [];
        isprimarydest = 0;
        destnode_pointer = path_dest[i];
        destnode = getent(destnode_pointer.target, "targetname");
        for (j = 0; j < path_start.size; j++) {
            todest = 0;
            for (currentnode = path_start[j]; isdefined(currentnode.target); currentnode = nextnode) {
                nextnode = getent(currentnode.target, "targetname");
                if (nextnode.origin == destnode.origin) {
                    todest = 1;
                    break;
                }
                /#
                    airsupport::debug_print3d_simple("<unknown string>", currentnode, (0, 0, -10));
                    if (isdefined(nextnode.target)) {
                        airsupport::debug_line(nextnode.origin, getent(nextnode.target, "<unknown string>").origin, (0.25, 0.5, 0.25), 5);
                    }
                    if (isdefined(currentnode.script_delay)) {
                        airsupport::debug_print3d_simple("<unknown string>" + currentnode.script_delay, currentnode, (0, 0, 10));
                    }
                #/
            }
            if (todest) {
                startnode_array[startnode_array.size] = getent(path_start[j].target, "targetname");
                if (isdefined(path_start[j].script_noteworthy) && path_start[j].script_noteworthy == "primary") {
                    isprimarydest = 1;
                }
            }
        }
        assert(isdefined(startnode_array) && startnode_array.size > 0, "<unknown string>");
        if (isprimarydest) {
            level.heli_primary_path = startnode_array;
            continue;
        }
        level.heli_paths[level.heli_paths.size] = startnode_array;
    }
    for (i = 0; i < loop_start.size; i++) {
        startnode = getent(loop_start[i].target, "targetname");
        level.heli_loop_paths[level.heli_loop_paths.size] = startnode;
    }
    assert(isdefined(level.heli_loop_paths[0]), "<unknown string>");
    for (i = 0; i < gunner_loop_start.size; i++) {
        startnode = getent(gunner_loop_start[i].target, "targetname");
        startnode.isgunnerpath = 1;
        level.heli_loop_paths[level.heli_loop_paths.size] = startnode;
    }
    for (i = 0; i < path_start.size; i++) {
        if (isdefined(path_start[i].script_noteworthy) && path_start[i].script_noteworthy == "primary") {
            continue;
        }
        level.heli_startnodes[level.heli_startnodes.size] = path_start[i];
    }
    assert(isdefined(level.heli_startnodes[0]), "<unknown string>");
    for (i = 0; i < leave_nodes.size; i++) {
        level.heli_leavenodes[level.heli_leavenodes.size] = leave_nodes[i];
    }
    assert(isdefined(level.heli_leavenodes[0]), "<unknown string>");
    for (i = 0; i < crash_start.size; i++) {
        crash_start_node = getent(crash_start[i].target, "targetname");
        level.heli_crash_paths[level.heli_crash_paths.size] = crash_start_node;
    }
    assert(isdefined(level.heli_crash_paths[0]), "<unknown string>");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf3a10946, Offset: 0x1b50
// Size: 0x834
function heli_update_global_dvars(debug_refresh) {
    do {
        level.heli_loopmax = getdvar(#"scr_heli_loopmax", 2);
        level.heli_missile_rof = getdvar(#"scr_heli_missile_rof", 2);
        level.heli_armor = getdvar(#"scr_heli_armor", 500);
        level.heli_maxhealth = getdvar(#"scr_heli_maxhealth", 2000);
        level.heli_amored_maxhealth = getdvar(#"scr_heli_armored_maxhealth", 1500);
        level.heli_missile_max = getdvar(#"scr_heli_missile_max", 20);
        level.heli_dest_wait = getdvar(#"scr_heli_dest_wait", 8);
        level.heli_debug = getdvar(#"scr_heli_debug", 0);
        level.heli_debug_crash = getdvar(#"scr_heli_debug_crash", 0);
        level.heli_targeting_delay = getdvar(#"scr_heli_targeting_delay", 0.1);
        level.heli_turretreloadtime = getdvar(#"scr_heli_turretreloadtime", 0.5);
        level.heli_turretclipsize = getdvar(#"scr_heli_turretclipsize", 60);
        level.heli_visual_range = isdefined(level.heli_visual_range_override) ? level.heli_visual_range_override : getdvar(#"scr_heli_visual_range", 3500);
        level.heli_missile_range = getdvar(#"scr_heli_missile_range", 100000);
        level.heli_health_degrade = getdvar(#"scr_heli_health_degrade", 0);
        level.heli_turret_target_cone = getdvar(#"scr_heli_turret_target_cone", 0.6);
        level.heli_target_spawnprotection = getdvar(#"scr_heli_target_spawnprotection", 5);
        level.heli_missile_regen_time = getdvar(#"scr_heli_missile_regen_time", 10);
        level.heli_turret_spinup_delay = getdvar(#"scr_heli_turret_spinup_delay", 0.1);
        level.heli_target_recognition = getdvar(#"scr_heli_target_recognition", 0.2);
        level.heli_missile_friendlycare = getdvar(#"scr_heli_missile_friendlycare", 512);
        level.heli_missile_target_cone = getdvar(#"scr_heli_missile_target_cone", 0.6);
        level.heli_valid_target_cone = getdvar(#"scr_heli_missile_valid_target_cone", 0.7);
        level.heli_armor_bulletdamage = getdvar(#"scr_heli_armor_bulletdamage", 0.5);
        level.heli_attract_strength = getdvar(#"scr_heli_attract_strength", 1000);
        level.heli_attract_range = getdvar(#"scr_heli_attract_range", 20000);
        level.helicopterturretmaxangle = getdvar(#"scr_helicopterturretmaxangle", 50);
        level.var_e071ed64 = isdefined(getgametypesetting(#"hash_5f76e2d55ad861ed")) && getgametypesetting(#"hash_5f76e2d55ad861ed") && getdvar(#"hash_3910a4196fe6b62e", 1);
        if (level.var_e071ed64) {
            level.heli_protect_time = getdvarint(#"scr_heli_protect_time", 75);
            level.heli_protect_pos_time = getdvarint(#"scr_heli_protect_pos_time", 8);
            level.var_a41ff83e = getdvarint(#"hash_26f6fa23a134bc05", 6);
            level.var_78bf9902 = getdvarint(#"hash_27120423a14b94bb", 8);
            level.heli_protect_radius = getdvarint(#"scr_heli_protect_radius", 1500);
            level.var_17076139 = getdvarint(#"hash_5681be4514516b7a", 1400);
            level.var_c2bbc18f = getdvarint(#"hash_569da8451469c0d0", 1600);
            level.var_d9c77d70 = getdvarint(#"hash_7e0189d9c55ba919", 350);
        } else {
            level.heli_protect_time = getdvar(#"scr_heli_protect_time", 75);
            level.heli_protect_pos_time = getdvar(#"scr_heli_protect_pos_time", 8);
            level.heli_protect_radius = getdvar(#"scr_heli_protect_radius", 2000);
        }
        level.heli_missile_reload_time = getdvar(#"scr_heli_missile_reload_time", 5);
        level.heli_warning_distance = getdvar(#"scr_heli_warning_distance", 500);
        wait(1);
    } while (isdefined(debug_refresh));
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xef17aac, Offset: 0x2390
// Size: 0xe4
function set_goal_pos(goalpos, stop) {
    if (!isdefined(self)) {
        return;
    }
    self.heligoalpos = goalpos;
    if (level.var_e071ed64) {
        if (issentient(self) && ispathfinder(self)) {
            self setgoal(goalpos, stop);
            self function_a57c34b7(goalpos, stop, 1);
        } else {
            self function_a57c34b7(goalpos, stop, 0);
        }
        return;
    }
    self setgoal(goalpos, stop);
}

// Namespace helicopter/helicopter_shared
// Params 8, eflags: 0x0
// Checksum 0x64c990e, Offset: 0x2480
// Size: 0x270
function spawn_helicopter(owner, origin, angles, vehicledef, targetname, target_offset, hardpointtype, killstreak_id) {
    chopper = spawnvehicle(vehicledef, origin, angles);
    chopper setowner(owner);
    chopper.owner = owner;
    chopper clientfield::set("enemyvehicle", 1);
    chopper.attackers = [];
    chopper.attackerdata = [];
    chopper.attackerdamage = [];
    chopper.flareattackerdamage = [];
    chopper.destroyfunc = &destroyhelicopter;
    chopper.hardpointtype = hardpointtype;
    chopper.killstreak_id = killstreak_id;
    chopper.pilotistalking = 0;
    chopper setdrawinfrared(1);
    chopper.allowcontinuedlockonafterinvis = 1;
    chopper.soundmod = "heli";
    chopper.targetname = "chopper";
    chopper.team = owner.team;
    chopper setteam(owner.team);
    if (!isdefined(target_offset)) {
        target_offset = (0, 0, 0);
    }
    chopper.target_offset = target_offset;
    target_set(chopper, target_offset);
    chopper.var_54b19f55 = 1;
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        chopper killstreaks::function_2b6aa9e8(hardpointtype);
        chopper.overridevehicledamage = &function_11038a4a;
    }
    chopper setrotorspeed(1);
    return chopper;
}

// Namespace helicopter/helicopter_shared
// Params 15, eflags: 0x0
// Checksum 0xb0f280d3, Offset: 0x26f8
// Size: 0xfa
function function_11038a4a(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    helicopter = self;
    if (smeansofdeath == "MOD_TRIGGER_HURT") {
        return 0;
    }
    idamage = self killstreaks::ondamageperweapon("helicopter_comlink", eattacker, idamage, idflags, smeansofdeath, weapon, self.maxhealth, undefined, self.lowhealth, undefined, 0, undefined, 1, 1);
    return idamage;
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x5db57e19, Offset: 0x2800
// Size: 0x84
function onflakdronedestroyed() {
    chopper = self;
    if (!isdefined(chopper)) {
        return;
    }
    chopper.numflares = 0;
    chopper killstreaks::play_pilot_dialog_on_owner("weaponDestroyed", "helicopter_comlink", chopper.killstreak_id);
    chopper thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("crashing", "death");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x3cb3abc0, Offset: 0x2890
// Size: 0x50
function explodeoncontact(hardpointtype) {
    self endon(#"death");
    wait(10);
    for (;;) {
        self waittill(#"touch");
        self thread heli_explode();
    }
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0xd47d0ba6, Offset: 0x28e8
// Size: 0x19a
function getvalidprotectlocationstart(random_path, protectlocation, destination, var_aea79ccc = 0) {
    startnode = level.heli_paths[destination][random_path];
    path_index = (random_path + 1) % level.heli_paths[destination].size;
    if (var_aea79ccc) {
        innofly = airsupport::crossesnoflyzone(protectlocation + (0, 0, 1), protectlocation);
        if (isdefined(innofly)) {
            protectlocation = (protectlocation[0], protectlocation[1], level.noflyzones[innofly].origin[2] + level.noflyzones[innofly].height);
        }
        noflyzone = airsupport::crossesnoflyzone(startnode.origin, protectlocation);
        while (isdefined(noflyzone) && path_index != random_path) {
            startnode = level.heli_paths[destination][path_index];
            if (isdefined(noflyzone)) {
                path_index = (path_index + 1) % level.heli_paths[destination].size;
            }
        }
    }
    return level.heli_paths[destination][path_index];
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xb884652b, Offset: 0x2a90
// Size: 0x21c
function getvalidrandomleavenode(start, var_aea79ccc = 1) {
    if (self === level.vtol) {
        foreach (node in level.heli_leavenodes) {
            if (isdefined(node.script_noteworthy) && node.script_noteworthy == "primary") {
                return node;
            }
        }
    }
    random_leave_node = randomint(level.heli_leavenodes.size);
    leavenode = level.heli_leavenodes[random_leave_node];
    path_index = (random_leave_node + 1) % level.heli_leavenodes.size;
    if (var_aea79ccc) {
        noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
        isprimary = leavenode.script_noteworthy === "primary";
        while ((isdefined(noflyzone) || isprimary) && path_index != random_leave_node) {
            leavenode = level.heli_leavenodes[path_index];
            noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
            isprimary = leavenode.script_noteworthy === "primary";
            path_index = (path_index + 1) % level.heli_leavenodes.size;
        }
    }
    return level.heli_leavenodes[path_index];
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x5f176ce6, Offset: 0x2cb8
// Size: 0x164
function getvalidrandomstartnode(dest, var_aea79ccc = 1) {
    if (!isdefined(level.heli_startnodes) || !level.heli_startnodes.size) {
        return undefined;
    }
    path_index = randomint(level.heli_startnodes.size);
    best_index = path_index;
    if (var_aea79ccc) {
        count = 0;
        for (i = 0; i < level.heli_startnodes.size; i++) {
            startnode = level.heli_startnodes[path_index];
            noflyzone = airsupport::crossesnoflyzone(startnode.origin, dest);
            if (!isdefined(noflyzone)) {
                best_index = path_index;
                if (path_index != level.last_start_node_index) {
                    break;
                }
            }
            path_index = (path_index + 1) % level.heli_startnodes.size;
        }
    }
    level.last_start_node_index = best_index;
    return level.heli_startnodes[best_index];
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x410bdc26, Offset: 0x2e28
// Size: 0x114
function getvalidrandomcrashnode(start) {
    random_leave_node = randomint(level.heli_crash_paths.size);
    leavenode = level.heli_crash_paths[random_leave_node];
    path_index = (random_leave_node + 1) % level.heli_crash_paths.size;
    noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
    while (isdefined(noflyzone) && path_index != random_leave_node) {
        leavenode = level.heli_crash_paths[path_index];
        noflyzone = airsupport::crossesnoflyzone(leavenode.origin, start);
        path_index = (path_index + 1) % level.heli_crash_paths.size;
    }
    return level.heli_crash_paths[path_index];
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x952aa20e, Offset: 0x2f48
// Size: 0x3c
function configureteampost(owner, ishacked) {
    chopper = self;
    owner thread watchforearlyleave(chopper);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xab767e59, Offset: 0x2f90
// Size: 0x54
function hackedcallbackpost(hacker) {
    heli = self;
    if (isdefined(heli.flak_drone)) {
        heli.flak_drone flak_drone::configureteam(heli, 1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 8, eflags: 0x0
// Checksum 0xe05b53c6, Offset: 0x2ff0
// Size: 0x6f4
function heli_think(owner, startnode, heli_team, missilesenabled, protectlocation, hardpointtype, armored, killstreak_id) {
    heliorigin = startnode.origin;
    heliangles = startnode.angles;
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        choppermodelfriendly = level.choppercomlinkfriendly;
        choppermodelenemy = level.choppercomlinkenemy;
    } else {
        choppermodelfriendly = level.chopperregular;
        choppermodelenemy = level.chopperregular;
    }
    chopper = spawn_helicopter(owner, heliorigin, heliangles, "veh_t8_helicopter_gunship_mp", choppermodelfriendly, (0, 0, 100), hardpointtype, killstreak_id);
    chopper.harpointtype = hardpointtype;
    chopper killstreaks::configure_team(hardpointtype, killstreak_id, owner, "helicopter", undefined, &configureteampost);
    level.vehicle_death_thread[chopper.vehicletype] = level.var_6af968ce;
    if (isdefined(chopper.flak_drone)) {
        chopper.flak_drone flak_drone::configureteam(chopper, 0);
    }
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        chopper killstreak_hacking::enable_hacking("helicopter_comlink", undefined, &hackedcallbackpost);
    }
    chopper thread watchforemp();
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        chopper.defaultweapon = getweapon(#"cobra_20mm_comlink");
    } else {
        chopper.defaultweapon = getweapon(#"cobra_20mm");
    }
    chopper.requireddeathcount = owner.deathcount;
    chopper.chaff_offset = level.chaff_offset[#"attack"];
    minigun_snd_ent = spawn("script_origin", chopper gettagorigin("tag_flash"));
    minigun_snd_ent linkto(chopper, "tag_flash", (0, 0, 0), (0, 0, 0));
    chopper.minigun_snd_ent = minigun_snd_ent;
    minigun_snd_ent thread autostopsound();
    chopper thread heli_existance();
    level.chopper = chopper;
    chopper.reached_dest = 0;
    if (hardpointtype != "helicopter_comlink" && hardpointtype != "inventory_helicopter_comlink") {
        if (armored) {
            chopper.maxhealth = level.heli_amored_maxhealth;
        } else {
            chopper.maxhealth = level.heli_maxhealth;
        }
    }
    if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        chopper.numflares = 1;
    } else if (hardpointtype == "helicopter_guard") {
        chopper.numflares = 1;
    } else {
        chopper.numflares = 2;
    }
    chopper.flareoffset = (0, 0, -256);
    chopper.waittime = level.heli_dest_wait;
    chopper.loopcount = 0;
    chopper.evasive = 0;
    chopper.health_bulletdamageble = level.heli_armor;
    chopper.health_evasive = level.heli_armor;
    chopper.targeting_delay = level.heli_targeting_delay;
    chopper.primarytarget = undefined;
    chopper.secondarytarget = undefined;
    chopper.attacker = undefined;
    chopper.missile_ammo = level.heli_missile_max;
    chopper.currentstate = "ok";
    chopper.lastrocketfiretime = -1;
    if (isdefined(protectlocation)) {
        chopper thread heli_protect(startnode, protectlocation, hardpointtype, heli_team);
        chopper clientfield::set("heli_comlink_bootup_anim", 1);
    } else {
        chopper thread heli_fly(startnode, 2, hardpointtype);
    }
    if (hardpointtype != "helicopter_comlink") {
        chopper thread heli_damage_monitor(hardpointtype);
    }
    chopper killstreaks::play_pilot_dialog_on_owner("arrive", "helicopter_comlink", killstreak_id);
    chopper thread wait_for_killed();
    chopper thread heli_health(hardpointtype);
    chopper thread attack_targets(missilesenabled, hardpointtype);
    chopper thread heli_targeting(missilesenabled, hardpointtype);
    chopper thread heli_missile_regen();
    chopper thread targetting_delay::function_7e1a12ce(level.killstreakbundle[#"helicopter_comlink"].var_2aeadfa0);
    chopper thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile("crashing", "death");
    chopper thread create_flare_ent((0, 0, -150));
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x2efcf4bc, Offset: 0x36f0
// Size: 0x44
function autostopsound() {
    self endon(#"death");
    level waittill(#"game_ended");
    self stoploopsound();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x3fa41e5f, Offset: 0x3740
// Size: 0x3c
function heli_existance() {
    self endon(#"death");
    self waittill(#"leaving");
    self influencers::remove_influencers();
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xa982cde8, Offset: 0x3788
// Size: 0x94
function create_flare_ent(offset) {
    self.flare_ent = spawn("script_model", self gettagorigin("tag_origin"));
    self.flare_ent setmodel(#"tag_origin");
    self.flare_ent linkto(self, "tag_origin", offset);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x2e585ec0, Offset: 0x3828
// Size: 0x130
function heli_missile_regen() {
    self endon(#"death", #"crashing", #"leaving");
    for (;;) {
        /#
            airsupport::debug_print3d("<unknown string>" + self.missile_ammo, (0.5, 0.5, 1), self, (0, 0, -100), 0);
        #/
        if (self.missile_ammo >= level.heli_missile_max) {
            self waittill(#"missile fired");
        } else if (self.currentstate == "heavy smoke") {
            wait(level.heli_missile_regen_time / 4);
        } else if (self.currentstate == "light smoke") {
            wait(level.heli_missile_regen_time / 2);
        } else {
            wait(level.heli_missile_regen_time);
        }
        if (self.missile_ammo < level.heli_missile_max) {
            self.missile_ammo++;
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x3ae4a804, Offset: 0x3960
// Size: 0x5a0
function heli_targeting(missilesenabled, hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    for (;;) {
        targets = [];
        targetsmissile = [];
        players = level.players;
        for (i = 0; i < players.size; i++) {
            player = players[i];
            if (self cantargetplayer_turret(player, hardpointtype)) {
                if (isdefined(player)) {
                    targets[targets.size] = player;
                }
            }
            if (missilesenabled && self cantargetplayer_missile(player, hardpointtype)) {
                if (isdefined(player)) {
                    targetsmissile[targetsmissile.size] = player;
                }
                continue;
            }
        }
        tanks = getentarray("talon", "targetname");
        foreach (tank in tanks) {
            if (self cantargettank_turret(tank)) {
                targets[targets.size] = tank;
            }
        }
        actors = getactorarray();
        foreach (actor in actors) {
            if (isdefined(actor) && isactor(actor) && isalive(actor)) {
                if (self cantargetactor_turret(actor, hardpointtype)) {
                    targets[targets.size] = actor;
                }
            }
        }
        if (targets.size == 0 && targetsmissile.size == 0) {
            self.primarytarget = undefined;
            self.secondarytarget = undefined;
            /#
                debug_print_target();
            #/
            wait(self.targeting_delay);
            continue;
        }
        if (targets.size == 1) {
            if (isdefined(targets[0].type) && (targets[0].type == "dog" || targets[0].type == "tank_drone")) {
                killstreaks::update_dog_threat(targets[0]);
            } else if (isactor(targets[0])) {
                killstreaks::update_actor_threat(targets[0]);
            } else {
                killstreaks::update_player_threat(targets[0]);
            }
            self.primarytarget = targets[0];
            self notify(#"primary acquired");
            self.secondarytarget = undefined;
            /#
                debug_print_target();
            #/
        } else if (targets.size > 1) {
            assignprimarytargets(targets);
        }
        if (targetsmissile.size == 1) {
            if (!isdefined(targetsmissile[0].type) || targetsmissile[0].type != "dog" || targets[0].type == "tank_drone") {
                self killstreaks::update_missile_player_threat(targetsmissile[0]);
            } else if (targetsmissile[0].type == "dog") {
                self killstreaks::update_missile_dog_threat(targetsmissile[0]);
            }
            self.secondarytarget = targetsmissile[0];
            self notify(#"secondary acquired");
            /#
                debug_print_target();
            #/
        } else if (targetsmissile.size > 1) {
            assignsecondarytargets(targetsmissile);
        }
        wait(self.targeting_delay);
        /#
            debug_print_target();
        #/
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x88ac05a2, Offset: 0x3f08
// Size: 0x2ac
function cantargetplayer_turret(player, hardpointtype) {
    if (!isalive(player) || player.sessionstate != "playing") {
        return false;
    }
    if (player.ignoreme === 1) {
        return false;
    }
    if (player == self.owner) {
        self check_owner(hardpointtype);
        return false;
    }
    if (player airsupport::cantargetplayerwithspecialty() == 0) {
        return false;
    }
    if (distance(player.origin, self.origin) > level.heli_visual_range) {
        return false;
    }
    if (!isdefined(player.team)) {
        return false;
    }
    if (!util::function_fbce7263(player.team, self.team)) {
        return false;
    }
    if (player.team == #"spectator") {
        return false;
    }
    if (isdefined(player.spawntime) && float(gettime() - player.spawntime) / 1000 <= level.heli_target_spawnprotection) {
        return false;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    visible_amount = player sightconetrace(heli_turret_point, self);
    if (visible_amount < level.heli_target_recognition) {
        return false;
    }
    var_2910def0 = self targetting_delay::function_1c169b3a(player);
    targetting_delay::function_a4d6d6d8(player, int((isdefined(self.targeting_delay) ? self.targeting_delay : 0.25) * 1000));
    if (!var_2910def0) {
        return false;
    }
    return true;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x5e5d1a5d, Offset: 0x41c0
// Size: 0x16e
function cantargetactor_turret(actor, hardpointtype) {
    helicopter = self;
    cantarget = 1;
    if (!isalive(actor)) {
        return actor;
    }
    if (!isdefined(actor.team)) {
        return 0;
    }
    if (!util::function_fbce7263(actor.team, helicopter.team)) {
        return 0;
    }
    if (distancesquared(actor.origin, helicopter.origin) > level.heli_visual_range * level.heli_visual_range) {
        return 0;
    }
    heli_centroid = helicopter.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(helicopter.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    visible_amount = actor sightconetrace(heli_turret_point, helicopter);
    if (visible_amount < level.heli_target_recognition) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x950c1e5e, Offset: 0x4338
// Size: 0xd4
function getverticaltan(startorigin, endorigin) {
    vector = endorigin - startorigin;
    opposite = startorigin[2] - endorigin[2];
    if (opposite < 0) {
        opposite *= 1;
    }
    adjacent = distance2d(startorigin, endorigin);
    if (adjacent < 0) {
        adjacent *= 1;
    }
    if (adjacent < 0.01) {
        adjacent = 0.01;
    }
    tangent = opposite / adjacent;
    return tangent;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x12f97021, Offset: 0x4418
// Size: 0x2da
function cantargetplayer_missile(player, hardpointtype) {
    cantarget = 1;
    if (!isalive(player) || player.sessionstate != "playing") {
        return 0;
    }
    if (player.ignoreme === 1) {
        return 0;
    }
    if (player == self.owner) {
        self check_owner(hardpointtype);
        return 0;
    }
    if (player airsupport::cantargetplayerwithspecialty() == 0) {
        return 0;
    }
    if (distance(player.origin, self.origin) > level.heli_missile_range) {
        return 0;
    }
    if (!isdefined(player.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(player.team, self.team)) {
        return 0;
    }
    if (player.team == #"spectator") {
        return 0;
    }
    if (isdefined(player.spawntime) && float(gettime() - player.spawntime) / 1000 <= level.heli_target_spawnprotection) {
        return 0;
    }
    if (self target_cone_check(player, level.heli_missile_target_cone) == 0) {
        return 0;
    }
    if (self targetting_delay::function_1c169b3a(player) == 0) {
        return 0;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (!isdefined(player.lasthit)) {
        player.lasthit = 0;
    }
    player.lasthit = self heliturretsighttrace(heli_turret_point, player, player.lasthit);
    if (player.lasthit != 0) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xa22bd614, Offset: 0x4700
// Size: 0x1b2
function cantargetdog_turret(dog) {
    cantarget = 1;
    if (!isdefined(dog)) {
        return 0;
    }
    if (distance(dog.origin, self.origin) > level.heli_visual_range) {
        return 0;
    }
    if (!isdefined(dog.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(dog.team, self.team)) {
        return 0;
    }
    if (isdefined(dog.script_owner) && self.owner == dog.script_owner) {
        return 0;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (!isdefined(dog.lasthit)) {
        dog.lasthit = 0;
    }
    dog.lasthit = self heliturretdogtrace(heli_turret_point, dog, dog.lasthit);
    if (dog.lasthit != 0) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xa25aede7, Offset: 0x48c0
// Size: 0x1b2
function cantargetdog_missile(dog) {
    cantarget = 1;
    if (!isdefined(dog)) {
        return 0;
    }
    if (distance(dog.origin, self.origin) > level.heli_missile_range) {
        return 0;
    }
    if (!isdefined(dog.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(dog.team, self.team)) {
        return 0;
    }
    if (isdefined(dog.script_owner) && self.owner == dog.script_owner) {
        return 0;
    }
    heli_centroid = self.origin + (0, 0, -160);
    heli_forward_norm = anglestoforward(self.angles);
    heli_turret_point = heli_centroid + 144 * heli_forward_norm;
    if (!isdefined(dog.lasthit)) {
        dog.lasthit = 0;
    }
    dog.lasthit = self heliturretdogtrace(heli_turret_point, dog, dog.lasthit);
    if (dog.lasthit != 0) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xb9d5713, Offset: 0x4a80
// Size: 0xe2
function cantargettank_turret(tank) {
    cantarget = 1;
    if (!isdefined(tank)) {
        return 0;
    }
    if (distance(tank.origin, self.origin) > level.heli_visual_range) {
        return 0;
    }
    if (!isdefined(tank.team)) {
        return 0;
    }
    if (level.teambased && !util::function_fbce7263(tank.team, self.team)) {
        return 0;
    }
    if (isdefined(tank.owner) && self.owner == tank.owner) {
        return 0;
    }
    return cantarget;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x646310bb, Offset: 0x4b70
// Size: 0x246
function assignprimarytargets(targets) {
    for (idx = 0; idx < targets.size; idx++) {
        if (isdefined(targets[idx].type) && targets[idx].type == "dog") {
            killstreaks::update_dog_threat(targets[idx]);
            continue;
        }
        if (isactor(targets[idx])) {
            killstreaks::update_actor_threat(targets[idx]);
            continue;
        }
        if (isplayer(targets[idx])) {
            killstreaks::update_player_threat(targets[idx]);
            continue;
        }
        killstreaks::update_non_player_threat(targets[idx]);
    }
    assert(targets.size >= 2, "<unknown string>");
    highest = 0;
    second_highest = 0;
    primarytarget = undefined;
    for (idx = 0; idx < targets.size; idx++) {
        assert(isdefined(targets[idx].threatlevel), "<unknown string>");
        if (targets[idx].threatlevel >= highest) {
            highest = targets[idx].threatlevel;
            primarytarget = targets[idx];
        }
    }
    assert(isdefined(primarytarget), "<unknown string>");
    self.primarytarget = primarytarget;
    self notify(#"primary acquired");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf2ba2c08, Offset: 0x4dc0
// Size: 0x216
function assignsecondarytargets(targets) {
    for (idx = 0; idx < targets.size; idx++) {
        if (!isdefined(targets[idx].type) || targets[idx].type != "dog") {
            self killstreaks::update_missile_player_threat(targets[idx]);
            continue;
        }
        if (targets[idx].type == "dog" || targets[0].type == "tank_drone") {
            killstreaks::update_missile_dog_threat(targets[idx]);
        }
    }
    assert(targets.size >= 2, "<unknown string>");
    highest = 0;
    second_highest = 0;
    primarytarget = undefined;
    secondarytarget = undefined;
    for (idx = 0; idx < targets.size; idx++) {
        assert(isdefined(targets[idx].missilethreatlevel), "<unknown string>");
        if (targets[idx].missilethreatlevel >= highest) {
            highest = targets[idx].missilethreatlevel;
            secondarytarget = targets[idx];
        }
    }
    assert(isdefined(secondarytarget), "<unknown string>");
    self.secondarytarget = secondarytarget;
    self notify(#"secondary acquired");
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x71aea4f8, Offset: 0x4fe0
// Size: 0x8c
function heli_reset() {
    self cleartargetyaw();
    self cleargoalyaw();
    self setyawspeed(75, 45, 45);
    self setmaxpitchroll(30, 30);
    self setneargoalnotifydist(256);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x14616472, Offset: 0x5078
// Size: 0x7e
function heli_wait(waittime) {
    self endon(#"death", #"crashing", #"evasive");
    self thread heli_hover();
    wait(waittime);
    heli_reset();
    self notify(#"stop hover");
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x59ddfa0, Offset: 0x5100
// Size: 0x9c
function heli_hover() {
    self endon(#"death", #"stop hover", #"evasive", #"leaving", #"crashing");
    randint = randomint(360);
    self setgoalyaw(self.angles[1] + randint);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x6296784a, Offset: 0x51a8
// Size: 0x118
function wait_for_killed() {
    self endon(#"death", #"crashing", #"leaving");
    self.bda = 0;
    while (true) {
        waitresult = self waittill(#"killed");
        victim = waitresult.victim;
        if (!isdefined(self.owner) || !isdefined(victim)) {
            continue;
        }
        if (self.owner == victim) {
            continue;
        }
        if (level.teambased && !util::function_fbce7263(self.owner.team, victim.team)) {
            continue;
        }
        self thread wait_for_bda_timeout();
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x1a261a2c, Offset: 0x52c8
// Size: 0x3c
function wait_for_bda_timeout() {
    self endon(#"killed");
    wait(2.5);
    if (!isdefined(self)) {
        return;
    }
    self play_bda_dialog();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x14ab0a80, Offset: 0x5310
// Size: 0xe2
function play_bda_dialog() {
    if (self.bda == 1) {
        bdadialog = "kill1";
    } else if (self.bda == 2) {
        bdadialog = "kill2";
    } else if (self.bda == 3) {
        bdadialog = "kill3";
    } else if (self.bda > 3) {
        bdadialog = "killMultiple";
    }
    self killstreaks::play_pilot_dialog_on_owner(bdadialog, self.killstreaktype, self.killstreak_id);
    self notify(#"bda_dialog", {#dialog_key:bdadialog});
    self.bda = 0;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x36e46d6d, Offset: 0x5400
// Size: 0x7e
function heli_hacked_health_update(hacker) {
    helicopter = self;
    hackeddamagetaken = helicopter.maxhealth - helicopter.hackedhealth;
    assert(hackeddamagetaken > 0);
    if (hackeddamagetaken > helicopter.damagetaken) {
        helicopter.damagetaken = hackeddamagetaken;
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x59faec96, Offset: 0x5488
// Size: 0x98a
function heli_damage_monitor(hardpointtype) {
    helicopter = self;
    self endon(#"death", #"crashing");
    self.damagetaken = 0;
    last_hit_vo = 0;
    hit_vo_spacing = 6000;
    helicopter.hackedhealthupdatecallback = &heli_hacked_health_update;
    helicopter.hackedhealth = killstreak_bundles::get_hacked_health(hardpointtype);
    if (!isdefined(self.attackerdata)) {
        self.attackers = [];
        self.attackerdata = [];
        self.attackerdamage = [];
        self.flareattackerdamage = [];
    }
    for (;;) {
        waitresult = self waittill(#"damage");
        attacker = waitresult.attacker;
        weapon = waitresult.weapon;
        damage = waitresult.amount;
        type = waitresult.mod;
        flags = waitresult.flags;
        chargelevel = waitresult.chargelevel;
        if (!isdefined(attacker) || !isplayer(attacker)) {
            continue;
        }
        heli_friendlyfire = damage::friendlyfirecheck(self.owner, attacker);
        if (!heli_friendlyfire) {
            continue;
        }
        if (!level.hardcoremode) {
            if (isdefined(self.owner) && attacker == self.owner) {
                continue;
            }
            if (level.teambased) {
                isvalidattacker = isdefined(attacker.team) && util::function_fbce7263(attacker.team, self.team);
            } else {
                isvalidattacker = 1;
            }
            if (!isvalidattacker) {
                continue;
            }
        }
        weapon_damage = killstreak_bundles::get_weapon_damage(hardpointtype, self.maxhealth, attacker, weapon, type, damage, flags, chargelevel);
        if (!isdefined(weapon_damage)) {
            weapon_damage = killstreaks::get_old_damage(attacker, weapon, type, damage, 1, level.var_926d9f1);
        }
        self.damagetaken += weapon_damage;
        playercontrolled = 0;
        if (self.damagetaken > self.maxhealth && !isdefined(self.xpgiven)) {
            self.xpgiven = 1;
            switch (hardpointtype) {
            case #"helicopter_comlink":
            case #"inventory_helicopter_comlink":
                event = "attack_chopper_shutdown";
                if (self.leaving !== 1) {
                    self killstreaks::play_destroyed_dialog_on_owner(self.killstreaktype, self.killstreak_id);
                }
                break;
            case #"supply_drop":
            case #"supply_drop_combat_robot":
                if (isdefined(helicopter.killstreakweaponname)) {
                    switch (helicopter.killstreakweaponname) {
                    case #"tank_robot":
                    case #"ai_tank_drop_marker":
                    case #"inventory_ai_tank_marker":
                    case #"inventory_tank_robot":
                    case #"ai_tank_marker":
                        event = "destroyed_helicopter_agr_drop";
                        break;
                    case #"combat_robot_marker":
                    case #"inventory_combat_robot_marker":
                    case #"combat_robot_drop":
                    case #"inventory_combat_robot_drop":
                        event = "destroyed_helicopter_giunit_drop";
                        break;
                    default:
                        event = "care_package_shutdown";
                        break;
                    }
                } else {
                    event = "care_package_shutdown";
                }
                break;
            }
            if (isdefined(level.var_4d5e1035)) {
                self [[ level.var_4d5e1035 ]](attacker, weapon, type, weapon_damage, event, playercontrolled, hardpointtype);
            }
            weaponstatname = #"destroyed";
            switch (weapon.name) {
            case #"tow_turret":
            case #"tow_turret_drop":
            case #"auto_tow":
                weaponstatname = #"kills";
                break;
            }
            attacker stats::function_e24eec31(weapon, weaponstatname, 1);
            notifystring = undefined;
            killstreakreference = undefined;
            switch (hardpointtype) {
            case #"helicopter_player_firstperson":
                killstreakreference = "killstreak_helicopter_player_firstperson";
                break;
            case #"helicopter_x2":
            case #"helicopter_comlink":
            case #"helicopter":
            case #"inventory_helicopter_comlink":
                notifystring = #"hash_286f843fea185e5";
                killstreakreference = "killstreak_helicopter_comlink";
                break;
            case #"supply_drop":
                notifystring = #"hash_3267fdfd0c2b7fdc";
                killstreakreference = "killstreak_supply_drop";
                break;
            case #"helicopter_guard":
                killstreakreference = "killstreak_helicopter_guard";
                break;
            }
            if (isdefined(killstreakreference)) {
                level.globalkillstreaksdestroyed++;
                attacker stats::function_e24eec31(getweapon(hardpointtype), #"destroyed", 1);
            }
            if (hardpointtype == "helicopter_player_gunner") {
                self.owner sendkillstreakdamageevent(600);
            }
            if (isdefined(notifystring)) {
                luinotifyevent(#"player_callout", 2, notifystring, attacker.entnum);
            }
            if (isdefined(self.attackers)) {
                for (j = 0; j < self.attackers.size; j++) {
                    player = self.attackers[j];
                    if (!isdefined(player)) {
                        continue;
                    }
                    if (player == attacker) {
                        continue;
                    }
                    flare_done = self.flareattackerdamage[player.clientid];
                    if (isdefined(flare_done) && flare_done == 1) {
                        scoreevents::processscoreevent(#"aircraft_flare_assist", player, undefined, undefined);
                        continue;
                    }
                    damage_done = self.attackerdamage[player.clientid];
                    player thread processcopterassist(self, damage_done);
                }
                self.attackers = [];
            }
            attacker notify(#"destroyed_helicopter");
            if (target_istarget(self)) {
                target_remove(self);
            }
        } else if (isdefined(self.owner) && isplayer(self.owner)) {
            if (last_hit_vo + hit_vo_spacing < gettime()) {
                if (type == "MOD_PROJECTILE" || randomintrange(0, 3) == 0) {
                    last_hit_vo = gettime();
                }
            }
        }
        if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x75caa6b7, Offset: 0x5e20
// Size: 0x7c
function init_active_camo() {
    heli = self;
    heli.active_camo_damage = 0;
    heli.active_camo_disabled = 0;
    heli.camo_state = 0;
    heli_set_active_camo_state(1);
    if (isdefined(heli.flak_drone)) {
        heli.flak_drone flak_drone::setcamostate(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xa73986e3, Offset: 0x5ea8
// Size: 0x24c
function heli_set_active_camo_state(state) {
    heli = self;
    if (!isdefined(heli.active_camo_supported)) {
        return;
    }
    if (state == 0) {
        heli clientfield::set("toggle_lights", 1);
        if (heli.camo_state == 1) {
            heli playsound(#"veh_hind_cloak_off");
        }
        heli.camo_state = 0;
        heli.camo_state_switch_time = gettime();
    } else if (state == 1) {
        if (heli.active_camo_disabled) {
            return;
        }
        heli clientfield::set("toggle_lights", 0);
        if (heli.camo_state == 0) {
            heli playsound(#"veh_hind_cloak_on");
        }
        heli.camo_state = 1;
        heli.camo_state_switch_time = gettime();
        if (isdefined(heli.owner)) {
            if (isdefined(heli.play_camo_dialog) && heli.play_camo_dialog) {
                heli killstreaks::play_pilot_dialog_on_owner("activateCounter", "helicopter_comlink", self.killstreak_id);
                heli.play_camo_dialog = 0;
            } else if (!isdefined(heli.play_camo_dialog)) {
                heli.play_camo_dialog = 1;
            }
        }
    } else if (state == 2) {
        heli clientfield::set("toggle_lights", 1);
    }
    if (isdefined(heli.flak_drone)) {
        heli.flak_drone flak_drone::setcamostate(state);
    }
    heli clientfield::set("active_camo", state);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x1b402f78, Offset: 0x6100
// Size: 0xd4
function heli_active_camo_damage_update(damage) {
    self endon(#"death", #"crashing");
    heli = self;
    heli.active_camo_damage += damage;
    if (heli.active_camo_damage > 100) {
        heli.active_camo_disabled = 1;
        heli thread heli_active_camo_damage_disable();
        return;
    }
    heli heli_set_active_camo_state(2);
    wait(1);
    heli heli_set_active_camo_state(1);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x11cf99de, Offset: 0x61e0
// Size: 0xac
function heli_active_camo_damage_disable() {
    self endon(#"death", #"crashing");
    heli = self;
    heli notify(#"heli_active_camo_damage_disable");
    heli endon(#"heli_active_camo_damage_disable");
    heli heli_set_active_camo_state(0);
    wait(10);
    heli.active_camo_damage = 0;
    heli.active_camo_disabled = 0;
    heli heli_set_active_camo_state(1);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x4fac767, Offset: 0x6298
// Size: 0x392
function heli_health(hardpointtype, playernotify) {
    self endon(#"death", #"crashing");
    self.currentstate = "ok";
    self.laststate = "ok";
    damagestate = 3;
    for (;;) {
        self waittill(#"damage");
        waitframe(1);
        if (!isdefined(self.damagetaken)) {
            waitframe(1);
            continue;
        }
        if (!(isdefined(self.var_5b3f091f) && self.var_5b3f091f) && self.damagetaken >= self.maxhealth * 0.5) {
            self killstreaks::play_pilot_dialog_on_owner("damaged", "helicopter_comlink", self.killstreak_id);
            self.var_5b3f091f = 1;
        }
        if (self.damagetaken > self.maxhealth) {
            damagestate = 0;
            self heli_set_active_camo_state(0);
            self thread heli_crash(hardpointtype, self.owner, playernotify);
            continue;
        }
        if (self.damagetaken >= self.maxhealth * 0.66 && damagestate >= 2) {
            if (isdefined(self.vehicletype) && self.vehicletype == #"heli_player_gunner_mp") {
                playfxontag(level.chopper_fx[#"damage"][#"heavy_smoke"], self, "tag_origin");
            } else {
                playfxontag(level.chopper_fx[#"damage"][#"heavy_smoke"], self, "tag_engine_left");
            }
            damagestate = 1;
            self.currentstate = "heavy smoke";
            self.evasive = 1;
            self notify(#"damage state");
            continue;
        }
        if (self.damagetaken >= self.maxhealth * 0.33 && damagestate == 3) {
            if (isdefined(self.vehicletype) && self.vehicletype == #"heli_player_gunner_mp") {
                playfxontag(level.chopper_fx[#"damage"][#"light_smoke"], self, "tag_origin");
            } else {
                playfxontag(level.chopper_fx[#"damage"][#"light_smoke"], self, "tag_main_rotor");
            }
            damagestate = 2;
            self.currentstate = "light smoke";
            self notify(#"damage state");
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xbd7f0d1b, Offset: 0x6638
// Size: 0x94
function heli_evasive(hardpointtype) {
    self notify(#"evasive");
    self.evasive = 1;
    loop_startnode = level.heli_loop_paths[0];
    startwait = 2;
    if (isdefined(self.donotstop) && self.donotstop) {
        startwait = 0;
    }
    self thread heli_fly(loop_startnode, startwait, hardpointtype);
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x0
// Checksum 0xe1695cc9, Offset: 0x66d8
// Size: 0x5a
function notify_player(player, playernotify, delay) {
    if (!isdefined(player)) {
        return;
    }
    if (!isdefined(playernotify)) {
        return;
    }
    player endon(#"disconnect", playernotify);
    wait(delay);
    player notify(playernotify);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xa774d9bf, Offset: 0x6740
// Size: 0x3e
function play_going_down_vo(delay) {
    self.owner endon(#"disconnect");
    self endon(#"death");
    wait(delay);
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x0
// Checksum 0x98866d0d, Offset: 0x6788
// Size: 0x4e4
function heli_crash(hardpointtype, player, playernotify) {
    self endon(#"death");
    self notify(#"crashing");
    self influencers::remove_influencers();
    self stoploopsound(0);
    if (isdefined(self.minigun_snd_ent)) {
        self.minigun_snd_ent stoploopsound();
    }
    if (isdefined(self.alarm_snd_ent)) {
        self.alarm_snd_ent stoploopsound();
    }
    crashtypes = [];
    crashtypes[0] = "crashOnPath";
    crashtypes[1] = "spinOut";
    crashtype = crashtypes[randomint(2)];
    if (isdefined(self.crashtype)) {
        crashtype = self.crashtype;
    }
    /#
        if (level.heli_debug_crash) {
            switch (level.heli_debug_crash) {
            case 1:
                crashtype = "<unknown string>";
                break;
            case 2:
                crashtype = "<unknown string>";
                break;
            case 3:
                crashtype = "<unknown string>";
                break;
            default:
                break;
            }
        }
    #/
    switch (crashtype) {
    case #"explode":
        thread notify_player(player, playernotify, 0);
        self thread heli_explode();
        break;
    case #"crashonpath":
        if (isdefined(player)) {
            self thread play_going_down_vo(0.5);
        }
        thread notify_player(player, playernotify, 4);
        self clear_client_flags();
        self thread crashonnearestcrashpath(hardpointtype);
        break;
    case #"spinout":
        if (isdefined(player)) {
            self thread play_going_down_vo(0.5);
        }
        thread notify_player(player, playernotify, 4);
        self clear_client_flags();
        heli_reset();
        heli_speed = 30 + randomint(50);
        heli_accel = 10 + randomint(25);
        leavenode = getvalidrandomcrashnode(self.origin);
        self setspeed(heli_speed, heli_accel);
        self set_goal_pos(leavenode.origin, 0);
        rateofspin = 45 + randomint(90);
        thread heli_secondary_explosions();
        self thread heli_spin(rateofspin);
        self waittilltimeout(randomintrange(4, 6), #"near_goal");
        if (isdefined(player) && isdefined(playernotify)) {
            player notify(playernotify);
        }
        self thread heli_explode();
        break;
    }
    self thread explodeoncontact(hardpointtype);
    time = randomintrange(4, 6);
    self thread waitthenexplode(time);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xc624d42c, Offset: 0x6c78
// Size: 0x34
function damagedrotorfx() {
    self endon(#"death");
    self setrotorspeed(0.6);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x6402f8a, Offset: 0x6cb8
// Size: 0x3c
function waitthenexplode(time) {
    self endon(#"death");
    wait(time);
    self thread heli_explode();
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x7125f558, Offset: 0x6d00
// Size: 0x1fc
function crashonnearestcrashpath(hardpointtype) {
    crashpathdistance = -1;
    crashpath = level.heli_crash_paths[0];
    for (i = 0; i < level.heli_crash_paths.size; i++) {
        currentdistance = distance(self.origin, level.heli_crash_paths[i].origin);
        if (crashpathdistance == -1 || crashpathdistance > currentdistance) {
            crashpathdistance = currentdistance;
            crashpath = level.heli_crash_paths[i];
        }
    }
    heli_speed = 30 + randomint(50);
    heli_accel = 10 + randomint(25);
    self setspeed(heli_speed, heli_accel);
    thread heli_secondary_explosions();
    self thread heli_fly(crashpath, 0, hardpointtype);
    rateofspin = 45 + randomint(90);
    self thread heli_spin(rateofspin);
    self endon(#"death");
    self waittill(#"path start");
    self waittilltimeout(5, #"destination reached");
    self thread heli_explode();
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf3e5eaa5, Offset: 0x6f08
// Size: 0x9e
function checkhelicoptertag(tagname) {
    if (isdefined(self.model)) {
        if (self.model == "veh_t8_drone_hunter_mp_light") {
            switch (tagname) {
            case #"tag_engine_left":
                return "tag_fx_exhaust2";
            case #"tag_engine_right":
                return "tag_fx_exhaust1";
            case #"tail_rotor_jnt":
                return "tag_fx_tail";
            default:
                break;
            }
        }
    }
    return tagname;
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x6d38ae84, Offset: 0x6fb0
// Size: 0x28c
function heli_secondary_explosions() {
    self endon(#"death");
    playfxontag(level.chopper_fx[#"explode"][#"large"], self, self checkhelicoptertag("tag_engine_left"));
    self playsound(level.heli_sound[#"hit"]);
    if (isdefined(self.vehicletype) && self.vehicletype == #"heli_player_gunner_mp") {
        self thread trail_fx(level.chopper_fx[#"smoke"][#"trail"], self checkhelicoptertag("tag_engine_right"), "stop tail smoke");
    } else {
        self thread trail_fx(level.chopper_fx[#"smoke"][#"trail"], self checkhelicoptertag("tail_rotor_jnt"), "stop tail smoke");
    }
    self thread trail_fx(level.chopper_fx[#"fire"][#"trail"][#"large"], self checkhelicoptertag("tag_engine_left"), "stop body fire");
    wait(3);
    if (!isdefined(self)) {
        return;
    }
    playfxontag(level.chopper_fx[#"explode"][#"large"], self, self checkhelicoptertag("tag_engine_left"));
    self playsound(level.heli_sound[#"hitsecondary"]);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x41c9955e, Offset: 0x7248
// Size: 0x9e
function heli_spin(speed) {
    self endon(#"death");
    self thread spinsoundshortly();
    self setyawspeed(speed, speed / 3, speed / 3);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.9);
        wait(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x5b4b4d5d, Offset: 0x72f0
// Size: 0x94
function spinsoundshortly() {
    self endon(#"death");
    wait(0.25);
    self stoploopsound();
    waitframe(1);
    self playloopsound(level.heli_sound[#"spinloop"]);
    waitframe(1);
    self playsound(level.heli_sound[#"spinstart"]);
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x0
// Checksum 0x6e08d4b9, Offset: 0x7390
// Size: 0x1c
function trail_fx(trail_fx, trail_tag, stop_notify) {
    
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf4f4ecf1, Offset: 0x73b8
// Size: 0x1a4
function destroyhelicopter(var_fec7078b) {
    team = self.originalteam;
    if (target_istarget(self)) {
        target_remove(self);
    }
    self influencers::remove_influencers();
    if (isdefined(self.interior_model)) {
        self.interior_model delete();
        self.interior_model = undefined;
    }
    if (isdefined(self.minigun_snd_ent)) {
        self.minigun_snd_ent stoploopsound();
        self.minigun_snd_ent delete();
        self.minigun_snd_ent = undefined;
    }
    if (isdefined(self.alarm_snd_ent)) {
        self.alarm_snd_ent delete();
        self.alarm_snd_ent = undefined;
    }
    if (isdefined(self.flare_ent)) {
        self.flare_ent delete();
        self.flare_ent = undefined;
    }
    killstreakrules::killstreakstop(self.hardpointtype, team, self.killstreak_id);
    if (isdefined(var_fec7078b) && var_fec7078b) {
        self function_e1058a3e();
    }
    self delete();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x2b0d3e4d, Offset: 0x7568
// Size: 0x23c
function function_e1058a3e() {
    if (!isdefined(self)) {
        return;
    }
    forward = self.origin + (0, 0, 100) - self.origin;
    if (isdefined(self.helitype) && self.helitype == "littlebird") {
        playfx(level.chopper_fx[#"explode"][#"guard"], self.origin, forward);
    } else if (isdefined(self.vehicletype) && self.vehicletype == #"heli_player_gunner_mp") {
        playfx(level.chopper_fx[#"explode"][#"gunner"], self.origin, forward);
    } else if (isdefined(self.vehicletype) && self.vehicletype == #"vehicle_t8_mil_helicopter_swat_transport") {
        fxpos = self gettagorigin("tag_deathfx");
        if (!isdefined(fxpos)) {
            fxpos = self.origin;
        }
        playfx(level.chopper_fx[#"explode"][#"large"], fxpos, forward);
    } else {
        fxpos = self gettagorigin("tag_deathfx");
        if (!isdefined(fxpos)) {
            fxpos = self.origin;
        }
        playfx("destruct/fx8_trans_heli_exp_lg", fxpos, forward);
    }
    self playsound(level.heli_sound[#"crash"]);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xde2ca399, Offset: 0x77b0
// Size: 0x64
function heli_explode() {
    self endon(#"death");
    self function_e1058a3e();
    wait(0.1);
    assert(isdefined(self.destroyfunc));
    self [[ self.destroyfunc ]]();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x61329550, Offset: 0x7820
// Size: 0x64
function clear_client_flags() {
    self clientfield::set("heli_warn_fired", 0);
    self clientfield::set("heli_warn_targeted", 0);
    self clientfield::set("heli_warn_locked", 0);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x7f457982, Offset: 0x7890
// Size: 0xdc
function function_86012f82(goalpos, stop) {
    if (!isdefined(self)) {
        return;
    }
    self.heligoalpos = goalpos;
    if (issentient(self) && ispathfinder(self) && ispointinnavvolume(self.origin, "navvolume_big")) {
        self setgoal(goalpos, stop);
        self function_a57c34b7(goalpos, stop, 1);
        return;
    }
    self function_a57c34b7(goalpos, stop, 0);
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x4
// Checksum 0x8c6efdb4, Offset: 0x7978
// Size: 0x186
function private function_8de67419(var_b4c35bb7) {
    self endon(#"death");
    radius = distance(self.origin, var_b4c35bb7);
    var_a9a839e2 = getclosestpointonnavvolume(var_b4c35bb7, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        self function_86012f82(var_a9a839e2, 0);
        while (true) {
            /#
                recordsphere(var_a9a839e2, 8, (0, 0, 1), "<unknown string>");
            #/
            var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
            if (!var_baa92af9) {
                if (issentient(self)) {
                    self function_60d50ea4();
                }
                self notify(#"hash_2bf34763927dd61b");
                break;
            }
            waitframe(1);
        }
        return;
    }
    if (issentient(self)) {
        self function_60d50ea4();
    }
    self notify(#"hash_2bf34763927dd61b");
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x5b451b77, Offset: 0x7b08
// Size: 0x304
function function_62eb6272(var_70031e7b) {
    self notify(#"destintation reached");
    self notify(#"leaving");
    hardpointtype = self.hardpointtype;
    self.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](self, 0);
    }
    if (!(self.destroyscoreeventgiven === 1)) {
        self killstreaks::play_pilot_dialog_on_owner("timeout", hardpointtype);
        self killstreaks::play_taacom_dialog_response_on_owner("timeoutConfirmed", hardpointtype);
    }
    leavenode = getvalidrandomleavenode(self.origin);
    var_b4c35bb7 = leavenode.origin;
    if (isdefined(var_70031e7b)) {
        var_b4c35bb7 = var_70031e7b;
    }
    heli_reset();
    self vehclearlookat();
    exitangles = vectortoangles(var_b4c35bb7 - self.origin);
    self setgoalyaw(exitangles[1]);
    wait(1.5);
    if (!isdefined(self)) {
        return;
    }
    /#
        self util::debug_slow_heli_speed();
    #/
    self set_goal_pos(self.origin + (var_b4c35bb7 - self.origin) / 2 + (0, 0, 1000), 0);
    self waittill(#"near_goal", #"death");
    if (isdefined(self)) {
        self set_goal_pos(var_b4c35bb7, 1);
        self waittill(#"goal", #"death");
        if (isdefined(self)) {
            self stoploopsound(1);
            self util::death_notify_wrapper();
            if (isdefined(self.alarm_snd_ent)) {
                self.alarm_snd_ent stoploopsound();
                self.alarm_snd_ent delete();
                self.alarm_snd_ent = undefined;
            }
            assert(isdefined(self.destroyfunc));
            self [[ self.destroyfunc ]]();
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x1e270537, Offset: 0x7e18
// Size: 0xcc
function function_fabf8bc5(var_b4c35bb7) {
    self endon(#"death", #"near_goal");
    while (true) {
        distsq = distancesquared(self.origin, var_b4c35bb7);
        if (distsq <= 10000) {
            self notify(#"fallback_goal");
            break;
        }
        if (!ispointinnavvolume(self.origin, "navvolume_big")) {
            self notify(#"fallback_goal");
            break;
        }
        waitframe(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xad44098b, Offset: 0x7ef0
// Size: 0x42c
function heli_leave(var_70031e7b = undefined, var_1caffd41 = 0) {
    if (!level.var_e071ed64 || var_1caffd41) {
        self thread function_62eb6272(var_70031e7b);
        return;
    }
    self notify(#"destintation reached");
    self notify(#"leaving");
    hardpointtype = self.hardpointtype;
    self.leaving = 1;
    if (isdefined(level.var_14151f16)) {
        [[ level.var_14151f16 ]](self, 0);
    }
    if (!(isdefined(self.destroyscoreeventgiven) && self.destroyscoreeventgiven)) {
        self killstreaks::play_pilot_dialog_on_owner("timeout", hardpointtype);
        self killstreaks::play_taacom_dialog_response_on_owner("timeoutConfirmed", hardpointtype);
    }
    leavenode = getvalidrandomleavenode(self.origin);
    var_b4c35bb7 = leavenode.origin;
    if (isdefined(var_70031e7b)) {
        var_b4c35bb7 = var_70031e7b;
    }
    heli_reset();
    self thread function_fabf8bc5(var_b4c35bb7);
    self vehclearlookat();
    exitangles = vectortoangles(var_b4c35bb7 - self.origin);
    self setgoalyaw(exitangles[1]);
    if (!ispointinnavvolume(var_b4c35bb7, "navvolume_big")) {
        self thread function_8de67419(var_b4c35bb7);
        if (isdefined(level.var_65f7e97e)) {
            self waittilltimeout(level.var_65f7e97e, #"fallback_goal", #"hash_2bf34763927dd61b", #"death");
        } else {
            self waittill(#"fallback_goal", #"hash_2bf34763927dd61b", #"death");
        }
    }
    /#
        self util::debug_slow_heli_speed();
    #/
    if (!isdefined(self)) {
        return;
    }
    self function_86012f82(var_b4c35bb7, 1);
    if (isdefined(level.var_65f7e97e)) {
        self waittilltimeout(level.var_65f7e97e, #"fallback_goal", #"near_goal", #"death");
    } else {
        self waittill(#"fallback_goal", #"near_goal", #"death");
    }
    if (isdefined(self)) {
        self stoploopsound(1);
        self util::death_notify_wrapper();
        if (isdefined(self.alarm_snd_ent)) {
            self.alarm_snd_ent stoploopsound();
            self.alarm_snd_ent delete();
            self.alarm_snd_ent = undefined;
        }
        assert(isdefined(self.destroyfunc));
        self [[ self.destroyfunc ]]();
    }
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x0
// Checksum 0x2d6780f0, Offset: 0x8328
// Size: 0x52c
function heli_fly(currentnode, startwait, hardpointtype) {
    self endon(#"death", #"leaving");
    self notify(#"flying");
    self endon(#"flying", #"abandoned");
    self.reached_dest = 0;
    heli_reset();
    pos = self.origin;
    wait(startwait);
    while (isdefined(currentnode.target)) {
        var_6cfa3712 = getentarray(currentnode.target, "targetname");
        assert(isdefined(var_6cfa3712), "<unknown string>");
        nextnode = var_6cfa3712[0];
        pos = nextnode.origin + (0, 0, 30);
        if (isdefined(currentnode.script_airspeed) && isdefined(currentnode.script_accel)) {
            heli_speed = currentnode.script_airspeed;
            heli_accel = currentnode.script_accel;
        } else {
            heli_speed = 30 + randomint(20);
            heli_accel = 10 + randomint(5);
        }
        if (isdefined(self.pathspeedscale)) {
            heli_speed *= self.pathspeedscale;
            heli_accel *= self.pathspeedscale;
        }
        if (!isdefined(nextnode.target)) {
            stop = 1;
        } else {
            stop = 0;
        }
        /#
            airsupport::debug_line(currentnode.origin, nextnode.origin, (1, 0.5, 0.5), 200);
        #/
        if (self.currentstate == "heavy smoke" || self.currentstate == "light smoke") {
            self setspeed(heli_speed, heli_accel);
            self set_goal_pos(pos, stop);
            self waittill(#"near_goal");
            self notify(#"path start");
        } else {
            if (isdefined(nextnode.script_delay) && !isdefined(self.donotstop)) {
                stop = 1;
            }
            self setspeed(heli_speed, heli_accel);
            self set_goal_pos(pos, stop);
            if (!isdefined(nextnode.script_delay) || isdefined(self.donotstop)) {
                self waittill(#"near_goal");
                self notify(#"path start");
            } else {
                self setgoalyaw(nextnode.angles[1]);
                self waittill(#"goal");
                heli_wait(nextnode.script_delay);
            }
        }
        for (index = 0; index < level.heli_loop_paths.size; index++) {
            if (level.heli_loop_paths[index].origin == nextnode.origin) {
                self.loopcount++;
            }
        }
        if (self.loopcount >= level.heli_loopmax) {
            self thread heli_leave();
            return;
        }
        currentnode = nextnode;
    }
    self setgoalyaw(currentnode.angles[1]);
    self.reached_dest = 1;
    self notify(#"destination reached");
    if (isdefined(self.waittime) && self.waittime > 0) {
        heli_wait(self.waittime);
    }
    if (isdefined(self)) {
        self thread heli_evasive(hardpointtype);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xf76ae92, Offset: 0x8860
// Size: 0xac
function set_heli_speed_normal() {
    self setmaxpitchroll(30, 30);
    heli_speed = 30 + randomint(20);
    heli_accel = 10 + randomint(5);
    self setspeed(heli_speed, heli_accel);
    self setyawspeed(75, 45, 45);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x94655095, Offset: 0x8918
// Size: 0xac
function set_heli_speed_evasive() {
    self setmaxpitchroll(30, 90);
    heli_speed = 50 + randomint(20);
    heli_accel = 30 + randomint(5);
    self setspeed(heli_speed, heli_accel);
    self setyawspeed(100, 75, 75);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xe0f9a692, Offset: 0x89d0
// Size: 0x5c
function set_heli_speed_hover() {
    self setmaxpitchroll(0, 90);
    self setspeed(20, 10);
    self setyawspeed(55, 25, 25);
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x8093bf97, Offset: 0x8a38
// Size: 0x64
function is_targeted() {
    if (isdefined(self.locking_on) && self.locking_on) {
        return true;
    }
    if (isdefined(self.locked_on) && self.locked_on) {
        return true;
    }
    if (isdefined(self.locking_on_hacking) && self.locking_on_hacking) {
        return true;
    }
    return false;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xe544a0e5, Offset: 0x8aa8
// Size: 0x144
function heli_mobilespawn(protectdest) {
    self endon(#"death");
    self notify(#"flying");
    self endon(#"flying", #"abandoned");
    /#
        iprintlnbold("<unknown string>" + protectdest[0] + "<unknown string>" + protectdest[1] + "<unknown string>" + protectdest[2] + "<unknown string>");
    #/
    heli_reset();
    self sethoverparams(50, 100, 50);
    wait(2);
    set_heli_speed_normal();
    self set_goal_pos(protectdest, 1);
    self waittill(#"near_goal");
    set_heli_speed_hover();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xad2d79e2, Offset: 0x8bf8
// Size: 0x124
function function_656691ab() {
    self endon(#"death", #"abandoned");
    while (true) {
        var_baa92af9 = ispointinnavvolume(self.origin, "navvolume_big");
        if (var_baa92af9) {
            heli_reset();
            if (!ispathfinder(self)) {
                self makepathfinder();
            }
            self util::make_sentient();
            self.ignoreme = 1;
            if (isdefined(self.heligoalpos)) {
                self set_goal_pos(self.heligoalpos, 1);
            }
            self notify(#"hash_340ab3c2b94ff86a");
            break;
        }
        wait(2);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xd78555a8, Offset: 0x8d28
// Size: 0x22e
function function_81cba63() {
    self endon(#"death", #"abandoned");
    while (true) {
        if (isdefined(self.protectdest)) {
            /#
                recordsphere(self.protectdest, 8, (0, 0, 1), "<unknown string>");
            #/
        }
        if (isdefined(self.var_6c63b409)) {
            /#
                recordline(self.protectdest, self.var_6c63b409, (0, 1, 0), "<unknown string>");
                recordsphere(self.var_6c63b409, 8, (0, 1, 0), "<unknown string>");
            #/
        }
        if (isdefined(self.goalpos)) {
            /#
                recordsphere(self.goalpos, 8, (0, 1, 1), "<unknown string>");
                recordline(self.origin, self.goalpos, (0, 1, 1), "<unknown string>");
            #/
        }
        if (isdefined(self.var_2c1a38eb) && isdefined(self.var_f9d38924)) {
            /#
                recordsphere(self.var_f9d38924, 8, (0, 1, 0), "<unknown string>");
                recordline(self.var_2c1a38eb, self.var_f9d38924, (0, 1, 0), "<unknown string>");
                record3dtext("<unknown string>" + distance(self.var_2c1a38eb, self.var_f9d38924), self.var_f9d38924 + (0, 0, 20), (0, 1, 0), "<unknown string>");
            #/
        }
        waitframe(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x0
// Checksum 0xa3aa0c22, Offset: 0x8f60
// Size: 0x41e
function heli_get_protect_spot(protectdest, var_551cf1b9, heli_team) {
    assert(isdefined(level.heli_protect_radius));
    if (!isdefined(var_551cf1b9)) {
        var_551cf1b9 = level.heli_protect_radius;
    }
    min_radius = int(var_551cf1b9 * 0.4);
    max_radius = var_551cf1b9;
    groundpos = getclosestpointonnavmesh(protectdest, 10000);
    assert(isdefined(level.var_17076139) && isdefined(level.var_c2bbc18f));
    assert(isdefined(level.var_c2bbc18f >= level.var_17076139));
    heightmin = level.var_17076139;
    heightmax = level.var_c2bbc18f;
    if (heli_team == #"axis") {
        assert(isdefined(level.var_d9c77d70));
        heightmin += level.var_d9c77d70;
        heightmax += level.var_d9c77d70;
    }
    hoverheight = heightmin + (heightmax - heightmin) / 2;
    radius = 10000;
    if (isdefined(groundpos)) {
        var_9ff2f344 = undefined;
        if (isdefined(self.primarytarget)) {
            var_9ff2f344 = getclosestpointonnavmesh(self.primarytarget.origin, 10000);
        }
        if (isdefined(var_9ff2f344)) {
            groundpos = var_9ff2f344;
        }
        protectdest = (groundpos[0], groundpos[1], groundpos[2] + hoverheight);
        protectdest = getclosestpointonnavvolume(protectdest, "navvolume_big", radius);
        if (isdefined(protectdest)) {
            self.var_2c1a38eb = groundpos;
            self.var_f9d38924 = protectdest;
            halfheight = (heightmax - heightmin) / 2;
            queryresult = positionquery_source_navigation(protectdest, min_radius, max_radius, halfheight, 50, self);
            if (isdefined(queryresult.data) && queryresult.data.size) {
                validpoints = [];
                var_7f378b0 = randomintrange(heightmin, heightmax);
                foreach (point in queryresult.data) {
                    distsq = distancesquared(self.origin, point.origin);
                    if (distsq >= var_7f378b0 * var_7f378b0) {
                        array::add(validpoints, point);
                    }
                }
                if (validpoints.size) {
                    return array::random(validpoints);
                }
            }
        }
    }
    return undefined;
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0x8580dae9, Offset: 0x9388
// Size: 0x57c
function function_438e7b44(startnode, protectdest, hardpointtype, heli_team) {
    self endon(#"death");
    self notify(#"flying");
    self endon(#"flying", #"abandoned");
    self.reached_dest = 0;
    heli_reset();
    wait(2);
    currentdest = protectdest;
    nodeheight = protectdest[2];
    nextnode = startnode;
    heightoffset = 0;
    if (heli_team == #"axis") {
        heightoffset = 400;
    }
    protectdest = (protectdest[0], protectdest[1], nodeheight);
    noflyzoneheight = airsupport::getnoflyzoneheight(protectdest);
    protectdest = (protectdest[0], protectdest[1], noflyzoneheight + heightoffset);
    currentdest = protectdest;
    starttime = gettime();
    self.endtime = starttime + int(level.heli_protect_time * 1000);
    self.halftime = starttime + int(level.heli_protect_time * 0.5 * 1000);
    self.killstreakendtime = int(self.endtime);
    /#
        self util::debug_slow_heli_speed();
    #/
    self set_goal_pos(self.origin + (currentdest - self.origin) / 3 + (0, 0, 1000), 0);
    self waittill(#"near_goal");
    self killstreaks::play_pilot_dialog_on_owner("arrive", hardpointtype, self.killstreak_id);
    self thread updatetargetyaw();
    mapenter = 1;
    var_2ca2e589 = 1;
    while (gettime() < self.endtime) {
        if (!(isdefined(self.var_478039e8) && self.var_478039e8) && gettime() >= self.halftime) {
            self killstreaks::play_pilot_dialog_on_owner("timecheck", hardpointtype);
            self.var_478039e8 = 1;
        }
        self set_goal_pos(currentdest, 1);
        self thread updatespeedonlock();
        self waittill(#"near_goal");
        hostmigration::waittillhostmigrationdone();
        self notify(#"path start");
        if (self is_targeted()) {
            if (isdefined(var_2ca2e589) && var_2ca2e589) {
                var_2ca2e589 = 0;
            } else {
                wait(5);
            }
        } else {
            waittillframeend();
            time = level.heli_protect_pos_time;
            if (self.evasive == 1) {
                time = 2;
            }
            if (isdefined(var_2ca2e589) && var_2ca2e589) {
                waitresult = self waittilltimeout(time, #"locking on", #"locking on hacking", #"damage state");
                if (waitresult._notify != "timeout") {
                    var_2ca2e589 = 0;
                }
            } else {
                wait(time);
            }
        }
        prevdest = currentdest;
        currentdest = function_d5de7cb1(protectdest, nodeheight);
        noflyzoneheight = airsupport::getnoflyzoneheight(currentdest);
        currentdest = (currentdest[0], currentdest[1], noflyzoneheight + heightoffset);
        noflyzones = airsupport::crossesnoflyzones(prevdest, currentdest);
        if (isdefined(noflyzones) && noflyzones.size > 0) {
            currentdest = prevdest;
        }
    }
    self heli_set_active_camo_state(1);
    self thread heli_leave();
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x70a102ba, Offset: 0x9910
// Size: 0x10e
function heli_random_point_in_radius(protectdest, nodeheight) {
    min_distance = int(level.heli_protect_radius * 0.2);
    direction = randomintrange(0, 360);
    distance = randomintrange(min_distance, level.heli_protect_radius);
    x = cos(direction);
    y = sin(direction);
    x *= distance;
    y *= distance;
    return (protectdest[0] + x, protectdest[1] + y, nodeheight);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x3f810f54, Offset: 0x9a28
// Size: 0xf6
function function_d5de7cb1(protectdest, nodeheight) {
    protect_spot = heli_random_point_in_radius(protectdest, nodeheight);
    tries = 10;
    for (noflyzone = airsupport::crossesnoflyzone(protectdest, protect_spot); tries != 0 && isdefined(noflyzone); noflyzone = airsupport::crossesnoflyzone(protectdest, protect_spot)) {
        protect_spot = heli_random_point_in_radius(protectdest, nodeheight);
        tries--;
    }
    noflyzoneheight = airsupport::getnoflyzoneheightcrossed(protectdest, protect_spot, nodeheight);
    return (protect_spot[0], protect_spot[1], noflyzoneheight);
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0xafdc8c21, Offset: 0x9b28
// Size: 0x5c4
function heli_protect(startnode, protectdest, hardpointtype, heli_team) {
    if (!(isdefined(level.var_e071ed64) && level.var_e071ed64)) {
        self thread function_438e7b44(startnode, protectdest, hardpointtype, heli_team);
        return;
    }
    self endon(#"death", #"abandoned");
    self notify(#"flying");
    self endon(#"flying");
    heli_reset();
    self setneargoalnotifydist(400);
    self.reached_dest = 0;
    self.goalradius = 30;
    starttime = gettime();
    self.halftime = starttime + int(level.heli_protect_time * 0.5 * 1000);
    self.killstreakendtime = starttime + int(level.heli_protect_time * 1000);
    self.endtime = starttime + int(level.heli_protect_time * 1000);
    self thread function_656691ab();
    self thread function_81cba63();
    self.protectdest = protectdest;
    self.var_6c63b409 = protectdest;
    radius = 10000;
    if (isdefined(self.owner)) {
        radius = distance(protectdest, self.origin);
    }
    var_a9a839e2 = getclosestpointonnavvolume(protectdest, "navvolume_big", radius);
    if (isdefined(var_a9a839e2)) {
        protectdest = var_a9a839e2;
        self.var_6c63b409 = protectdest;
        var_b140bc48 = heli_get_protect_spot(protectdest, 300, heli_team);
        if (isdefined(var_b140bc48)) {
            self function_86012f82(var_b140bc48.origin, 1);
            protectdest = var_b140bc48.origin;
            self.var_6c63b409 = var_b140bc48.origin;
        } else {
            self function_86012f82(protectdest, 1);
        }
    }
    /#
        self util::debug_slow_heli_speed();
    #/
    self thread updatetargetyaw();
    self thread updatespeedonlock();
    self function_86012f82(protectdest, 1);
    self waittilltimeout(30, #"near_goal", #"primary acquired");
    self setneargoalnotifydist(256);
    var_520e3459 = level.heli_protect_pos_time;
    var_2ca2e589 = 1;
    while (gettime() < self.killstreakendtime) {
        if (!(isdefined(self.var_478039e8) && self.var_478039e8) && gettime() >= self.halftime) {
            self killstreaks::play_pilot_dialog_on_owner("timecheck", hardpointtype);
            self.var_478039e8 = 1;
        }
        var_520e3459 = randomintrange(level.var_a41ff83e, level.var_78bf9902);
        if (!isdefined(self)) {
            return;
        }
        newdest = heli_get_protect_spot(protectdest, undefined, heli_team);
        if (isdefined(newdest)) {
            self function_86012f82(newdest.origin, 1);
            self waittilltimeout(10, #"near_goal", #"abort_goal");
        } else {
            self waittilltimeout(var_520e3459, #"abort_goal");
        }
        if (!ispointinnavvolume(self.origin, "navvolume_big")) {
            var_a9a839e2 = getclosestpointonnavvolume(self.origin, "navvolume_big", 3000);
            if (isdefined(var_a9a839e2)) {
                self.origin = var_a9a839e2;
            }
        }
        hostmigration::waittillhostmigrationdone();
        self notify(#"path start");
    }
    self heli_set_active_camo_state(1);
    self thread heli_leave();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x1cfe81e7, Offset: 0xa0f8
// Size: 0x7e
function updatespeedonlock() {
    self endon(#"death", #"crashing", #"leaving");
    while (true) {
        self waittill(#"locking on", #"locking on hacking");
        self updatespeed();
        wait(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x20c29ba1, Offset: 0xa180
// Size: 0x64
function updatespeed() {
    if (self is_targeted() || isdefined(self.evasive) && self.evasive) {
        set_heli_speed_evasive();
        return;
    }
    set_heli_speed_normal();
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xb7677090, Offset: 0xa1f0
// Size: 0xfe
function updatetargetyaw() {
    self notify(#"endtargetyawupdate");
    self endon(#"death", #"crashing", #"leaving", #"endtargetyawupdate");
    for (;;) {
        if (isdefined(self.primarytarget)) {
            yaw = math::get_2d_yaw(self.origin, self.primarytarget.origin);
            self settargetyaw(yaw);
        } else if (isdefined(self.var_6c63b409)) {
            yaw = math::get_2d_yaw(self.origin, self.var_6c63b409);
            self settargetyaw(yaw);
        }
        wait(1);
    }
}

// Namespace helicopter/helicopter_shared
// Params 3, eflags: 0x0
// Checksum 0x8ac2a60f, Offset: 0xa2f8
// Size: 0x228
function fire_missile(smissiletype, ishots = 1, etarget) {
    assert(self.health > 0);
    weapon = undefined;
    weaponshoottime = undefined;
    tags = [];
    switch (smissiletype) {
    case #"ffar":
        weapon = getweapon(#"hind_ffar");
        tags[0] = "tag_store_r_2";
        break;
    default:
        assertmsg("<unknown string>");
        break;
    }
    assert(isdefined(weapon));
    assert(tags.size > 0);
    weaponshoottime = weapon.firetime;
    assert(isdefined(weaponshoottime));
    self setvehweapon(weapon);
    nextmissiletag = -1;
    for (i = 0; i < ishots; i++) {
        nextmissiletag++;
        if (nextmissiletag >= tags.size) {
            nextmissiletag = 0;
        }
        emissile = self fireweapon(0, etarget);
        emissile.killcament = self;
        self.lastrocketfiretime = gettime();
        if (i < ishots - 1) {
            wait(weaponshoottime);
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x870a3094, Offset: 0xa528
// Size: 0x7c
function check_owner(hardpointtype) {
    if (!isdefined(self.owner) || !isdefined(self.owner.team) || self.owner.team != self.team) {
        self notify(#"abandoned");
        self thread heli_leave();
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xa699cf08, Offset: 0xa5b0
// Size: 0x4c
function attack_targets(missilesenabled, hardpointtype) {
    self thread attack_primary(hardpointtype);
    if (missilesenabled) {
        self thread attack_secondary(hardpointtype);
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf64866db, Offset: 0xa608
// Size: 0x1b0
function attack_secondary(hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    for (;;) {
        if (isdefined(self.secondarytarget)) {
            self.secondarytarget.antithreat = undefined;
            self.missiletarget = self.secondarytarget;
            antithreat = 0;
            while (isdefined(self.missiletarget) && isalive(self.missiletarget)) {
                if (self target_cone_check(self.missiletarget, level.heli_missile_target_cone)) {
                    self thread missile_support(self.missiletarget, level.heli_missile_rof, 1, undefined);
                } else {
                    break;
                }
                antithreat += 100;
                self.missiletarget.antithreat = antithreat;
                wait(level.heli_missile_rof);
                if (!isdefined(self.secondarytarget) || isdefined(self.secondarytarget) && self.missiletarget != self.secondarytarget) {
                    break;
                }
            }
            if (isdefined(self.missiletarget)) {
                self.missiletarget.antithreat = undefined;
            }
        }
        self waittill(#"secondary acquired");
        self check_owner(hardpointtype);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xb6f388af, Offset: 0xa7c0
// Size: 0x102
function turret_target_check(turrettarget, attackangle) {
    targetyaw = math::get_2d_yaw(self.origin, turrettarget.origin);
    chopperyaw = self.angles[1];
    if (targetyaw < 0) {
        targetyaw *= -1;
    }
    targetyaw = int(targetyaw) % 360;
    if (chopperyaw < 0) {
        chopperyaw *= -1;
    }
    chopperyaw = int(chopperyaw) % 360;
    if (chopperyaw > targetyaw) {
        difference = chopperyaw - targetyaw;
    } else {
        difference = targetyaw - chopperyaw;
    }
    return difference <= attackangle;
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0x96687ab, Offset: 0xa8d0
// Size: 0xf4
function target_cone_check(target, conecosine) {
    heli2target_normal = vectornormalize(target.origin - self.origin);
    heli2forward = anglestoforward(self.angles);
    heli2forward_normal = vectornormalize(heli2forward);
    heli_dot_target = vectordot(heli2target_normal, heli2forward_normal);
    if (heli_dot_target >= conecosine) {
        /#
            airsupport::debug_print3d_simple("<unknown string>" + heli_dot_target, self, (0, 0, -40), 40);
        #/
        return true;
    }
    return false;
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0xfada7e6a, Offset: 0xa9d0
// Size: 0x316
function missile_support(target_player, rof, instantfire, endon_notify) {
    self endon(#"death", #"crashing", #"leaving");
    if (isdefined(endon_notify)) {
        self endon(endon_notify);
    }
    self.turret_giveup = 0;
    if (!instantfire) {
        wait(rof);
        self.turret_giveup = 1;
        self notify(#"give up");
    }
    if (isdefined(target_player)) {
        if (level.teambased) {
            for (i = 0; i < level.players.size; i++) {
                player = level.players[i];
                if (isdefined(player.team) && !util::function_fbce7263(player.team, self.team) && distance(player.origin, target_player.origin) <= level.heli_missile_friendlycare) {
                    /#
                        airsupport::debug_print3d_simple("<unknown string>", self, (0, 0, -80), 40);
                    #/
                    self notify(#"missile ready");
                    return;
                }
            }
        } else {
            player = self.owner;
            if (isdefined(player) && isdefined(player.team) && !util::function_fbce7263(player.team, self.team) && distance(player.origin, target_player.origin) <= level.heli_missile_friendlycare) {
                /#
                    airsupport::debug_print3d_simple("<unknown string>", self, (0, 0, -80), 40);
                #/
                self notify(#"missile ready");
                return;
            }
        }
    }
    if (self.missile_ammo > 0 && isdefined(target_player)) {
        self fire_missile("ffar", 1, target_player);
        self.missile_ammo--;
        self notify(#"missile fired");
    } else {
        return;
    }
    if (instantfire) {
        wait(rof);
        self notify(#"missile ready");
    }
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xc44ca869, Offset: 0xacf0
// Size: 0x478
function attack_primary(hardpointtype) {
    self endon(#"death", #"crashing", #"leaving");
    level endon(#"game_ended");
    self turretsetontargettolerance(0, 5);
    for (;;) {
        if (isdefined(self.primarytarget)) {
            self.primarytarget.antithreat = undefined;
            self.turrettarget = self.primarytarget;
            antithreat = 0;
            last_pos = undefined;
            while (isdefined(self.turrettarget) && isalive(self.turrettarget)) {
                if (hardpointtype == "helicopter_comlink" || hardpointtype == "inventory_helicopter_comlink") {
                    self vehlookat(self.turrettarget);
                }
                if (!isdefined(self.turrettarget) || !isalive(self.turrettarget)) {
                    break;
                }
                self turret::set_target(self.turrettarget, undefined, 0);
                self setvehweapon(self.defaultweapon);
                while (!self.turretontarget) {
                    waitframe(1);
                }
                self notify(#"turret_on_target");
                self heli_set_active_camo_state(0);
                wait(level.heli_turret_spinup_delay);
                weaponshoottime = self.defaultweapon.firetime;
                self setvehweapon(self.defaultweapon);
                for (i = 0; i < level.heli_turretclipsize; i++) {
                    if (isdefined(self.turrettarget) && isdefined(self.primarytarget)) {
                        if (self.primarytarget != self.turrettarget) {
                            self turret::set_target(self.primarytarget, (0, 0, 10), 0);
                            while (!self.turretontarget) {
                                waitframe(1);
                            }
                        }
                    }
                    if (gettime() != self.lastrocketfiretime) {
                        if (isdefined(self.primarytarget)) {
                            self turret::set_target(self.primarytarget, (0, 0, 10), 0);
                            s_turret = self turret::_get_turret_data(0);
                            minigun = self fireweapon(0, self.primarytarget, s_turret.v_offset);
                        } else {
                            minigun = self fireweapon();
                        }
                    }
                    waitframe(1);
                }
                self notify(#"turret reloading");
                wait(level.heli_turretreloadtime);
                self heli_set_active_camo_state(1);
                if (isdefined(self.turrettarget) && isalive(self.turrettarget)) {
                    antithreat += 100;
                    self.turrettarget.antithreat = antithreat;
                }
                if (!isdefined(self.primarytarget) || isdefined(self.turrettarget) && isdefined(self.primarytarget) && self.primarytarget != self.turrettarget) {
                    break;
                }
            }
            if (isdefined(self.turrettarget)) {
                self.turrettarget.antithreat = undefined;
            }
        }
        self waittill(#"primary acquired");
        self check_owner(hardpointtype);
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x38914d90, Offset: 0xb170
// Size: 0x25c
function debug_print_target() {
    /#
        if (isdefined(level.heli_debug) && level.heli_debug == 1) {
            if (isdefined(self.primarytarget) && isdefined(self.primarytarget.threatlevel)) {
                if (isdefined(self.primarytarget.type) && self.primarytarget.type == "<unknown string>") {
                    name = "<unknown string>";
                } else {
                    name = self.primarytarget.name;
                }
                primary_msg = "<unknown string>" + name + "<unknown string>" + self.primarytarget.threatlevel;
            } else {
                primary_msg = "<unknown string>";
            }
            if (isdefined(self.secondarytarget) && isdefined(self.secondarytarget.threatlevel)) {
                if (isdefined(self.secondarytarget.type) && self.secondarytarget.type == "<unknown string>") {
                    name = "<unknown string>";
                } else {
                    name = self.secondarytarget.name;
                }
                secondary_msg = "<unknown string>" + name + "<unknown string>" + self.secondarytarget.threatlevel;
            } else {
                secondary_msg = "<unknown string>";
            }
            frames = int(self.targeting_delay * 20) + 1;
            thread airsupport::draw_text(primary_msg, (1, 0.6, 0.6), self, (0, 0, 40), frames);
            thread airsupport::draw_text(secondary_msg, (1, 0.6, 0.6), self, (0, 0, 0), frames);
        }
    #/
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0xe03023d, Offset: 0xb3d8
// Size: 0x56
function waittill_confirm_location() {
    self endon(#"emp_jammed", #"emp_grenaded");
    waitresult = self waittill(#"confirm_location");
    return waitresult.position;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0x55a2f5e0, Offset: 0xb438
// Size: 0xba
function selecthelicopterlocation(hardpointtype) {
    self airsupport::function_9e2054b0(&function_7da89497);
    location = self airsupport::waitforlocationselection();
    if (!isdefined(location)) {
        return 0;
    }
    if (self killstreakrules::iskillstreakallowed(hardpointtype, self.team) == 0) {
        return 0;
    }
    level.helilocation = location.origin;
    return airsupport::function_83904681(location.origin);
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xbeef709b, Offset: 0xb500
// Size: 0x13c
function processcopterassist(destroyedcopter, damagedone) {
    self endon(#"disconnect");
    destroyedcopter endon(#"disconnect");
    waitframe(1);
    if (!isdefined(level.teams[self.team])) {
        return;
    }
    if (!isdefined(destroyedcopter)) {
        return;
    }
    if (!util::function_fbce7263(self.team, destroyedcopter.team)) {
        return;
    }
    assist_level = "aircraft_destruction_assist";
    assist_level_value = int(ceil(damagedone.damage / destroyedcopter.maxhealth * 4));
    if (assist_level_value > 0) {
        if (assist_level_value > 3) {
            assist_level_value = 3;
        }
        assist_level = assist_level + "_" + assist_level_value * 25;
    }
    scoreevents::processscoreevent(assist_level, self, undefined, undefined);
}

// Namespace helicopter/helicopter_shared
// Params 4, eflags: 0x0
// Checksum 0xe22c6b3a, Offset: 0xb648
// Size: 0xf4
function playpilotdialog(dialog, time, voice, shouldwait) {
    self endon(#"death");
    level endon(#"remote_end");
    if (isdefined(time)) {
        wait(time);
    }
    if (!isdefined(self.pilotvoicenumber)) {
        self.pilotvoicenumber = 0;
    }
    if (isdefined(voice)) {
        voicenumber = voice;
    } else {
        voicenumber = self.pilotvoicenumber;
    }
    soundalias = level.teamprefix[self.team] + voicenumber + "_" + dialog;
    if (isdefined(self.owner)) {
        self.owner playpilottalking(shouldwait, soundalias);
    }
}

// Namespace helicopter/helicopter_shared
// Params 2, eflags: 0x0
// Checksum 0xbf3afcac, Offset: 0xb748
// Size: 0xde
function playpilottalking(shouldwait, soundalias) {
    self endon(#"disconnect", #"joined_team", #"joined_spectators");
    for (trycounter = 0; isdefined(self.pilottalking) && self.pilottalking && trycounter < 10; trycounter++) {
        if (isdefined(shouldwait) && !shouldwait) {
            return;
        }
        wait(1);
    }
    self.pilottalking = 1;
    self playlocalsound(soundalias);
    wait(3);
    self.pilottalking = 0;
}

// Namespace helicopter/helicopter_shared
// Params 1, eflags: 0x0
// Checksum 0xf38dd0c6, Offset: 0xb830
// Size: 0xbe
function watchforearlyleave(chopper) {
    chopper notify(#"watchforearlyleave_helicopter");
    chopper endon(#"watchforearlyleave_helicopter", #"death");
    self endon(#"heli_timeup");
    self waittill(#"disconnect", #"joined_team", #"joined_spectator");
    if (isdefined(chopper)) {
        chopper thread heli_leave();
    }
    if (isdefined(self)) {
        self notify(#"heli_timeup");
    }
}

// Namespace helicopter/helicopter_shared
// Params 0, eflags: 0x0
// Checksum 0x6ff829df, Offset: 0xb8f8
// Size: 0xc4
function watchforemp() {
    heli = self;
    heli endon(#"death", #"heli_timeup");
    heli.owner endon(#"disconnect", #"joined_team", #"joined_spectator", #"changed_specialist");
    heli.owner waittill(#"emp_jammed");
    heli thread heli_explode();
}

