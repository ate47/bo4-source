#using scripts\core_common\util_shared.gsc;
#using scripts\mp_common\item_supply_drop.gsc;
#using scripts\core_common\player_insertion.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace namespace_795feefe;

// Namespace namespace_795feefe/namespace_795feefe
// Params 0, eflags: 0x2
// Checksum 0x489852f, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"hash_53d8c22399769679", &__init__, undefined, undefined);
}

// Namespace namespace_795feefe/namespace_795feefe
// Params 0, eflags: 0x1 linked
// Checksum 0x5c26f55c, Offset: 0x140
// Size: 0x16c
function __init__() {
    level.var_5c9e1f9 = (isdefined(getgametypesetting(#"hash_701bac755292fab2")) ? getgametypesetting(#"hash_701bac755292fab2") : 0) || (isdefined(getgametypesetting(#"hash_697d65a68cc6c6f1")) ? getgametypesetting(#"hash_697d65a68cc6c6f1") : 0);
    if (level.var_5c9e1f9) {
        level.var_f5ea5804 = 0;
        level callback::add_callback(#"hash_3057417db7f8acdd", &function_d53a8c5b);
        level callback::add_callback(#"hash_405e46788e83af41", &function_d53a8c5b);
        level callback::add_callback(#"hash_7912e21750e4010d", &function_d53a8c5b);
    }
    /#
        level thread function_fc45523f();
    #/
}

// Namespace namespace_795feefe/namespace_795feefe
// Params 0, eflags: 0x1 linked
// Checksum 0xacedc74, Offset: 0x2b8
// Size: 0x13c
function function_d53a8c5b() {
    if (!(isdefined(level.var_f5ea5804) && level.var_f5ea5804)) {
        zombie_plane = function_9dc0fa01();
        if (isdefined(zombie_plane)) {
            zombie_plane player_insertion::function_723d686d();
            zombie_plane_flight_goal = struct::get("zombie_plane_flight_goal", "targetname");
            if (isdefined(zombie_plane_flight_goal)) {
                zombie_plane thread function_3e59cbbb(zombie_plane_flight_goal);
            }
        }
        return;
    }
    level callback::remove_callback(#"hash_3057417db7f8acdd", &function_d53a8c5b);
    level callback::remove_callback(#"hash_405e46788e83af41", &function_d53a8c5b);
    level callback::remove_callback(#"hash_7912e21750e4010d", &function_d53a8c5b);
}

// Namespace namespace_795feefe/namespace_795feefe
// Params 1, eflags: 0x1 linked
// Checksum 0xd5b9d5e6, Offset: 0x400
// Size: 0xcc
function function_3e59cbbb(goal) {
    level endon(#"game_ended");
    self endon(#"death");
    self function_a57c34b7(goal.origin, 0, 0);
    self waittill(#"goal", #"near_goal");
    self player_insertion::function_723d686d();
    waitframe(1);
    self ghost();
    wait(1);
    self delete();
}

// Namespace namespace_795feefe/namespace_795feefe
// Params 15, eflags: 0x1 linked
// Checksum 0xe58d2aaf, Offset: 0x4d8
// Size: 0x12e
function function_f3dbfe8d(einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, vdamageorigin, psoffsettime, damagefromunderneath, modelindex, partname, vsurfacenormal) {
    newhealth = max(self.health - idamage, 0);
    if (newhealth <= 0) {
        level.var_f5ea5804 = 1;
        self ghost();
        if (!(isdefined(level.var_f2ea2755) && level.var_f2ea2755)) {
            item_supply_drop::spawn_supply_drop(self.origin, #"zombie_supply_stash_parent");
            level.var_f2ea2755 = 1;
        }
    }
    return idamage;
}

// Namespace namespace_795feefe/namespace_795feefe
// Params 0, eflags: 0x1 linked
// Checksum 0xfa432509, Offset: 0x610
// Size: 0x2c2
function function_9dc0fa01() {
    var_7206c0ef = getent("motd_plane_ee", "targetname");
    zombie_plane_flight_goal = struct::get("zombie_plane_flight_goal", "targetname");
    if (isdefined(level.deathcircle) && isdefined(var_7206c0ef) && isdefined(zombie_plane_flight_goal)) {
        center = level.deathcircle.origin;
        radius = level.deathcircle.radius;
        angle = randomint(360);
        x_pos = center[0] + radius * cos(angle);
        y_pos = center[1] + radius * sin(angle);
        var_7206c0ef.origin = (x_pos, y_pos, 10000);
        var_e3b87be8 = center[0] + radius * cos(angle + 180);
        var_8e6c495b = center[1] + radius * sin(angle + 180);
        zombie_plane_flight_goal.origin = (var_e3b87be8, var_8e6c495b, 10000);
        zombie_plane = spawnvehicle("vehicle_zmb_air_alcatraz_plane", var_7206c0ef.origin, vectortoangles(vectornormalize(zombie_plane_flight_goal.origin - var_7206c0ef.origin)));
        if (!isdefined(zombie_plane)) {
            return;
        }
        zombie_plane.overridevehicledamage = &function_f3dbfe8d;
        zombie_plane setforcenocull();
        zombie_plane setneargoalnotifydist(128);
        zombie_plane.maxhealth = 1;
        zombie_plane setspeed(50);
        return zombie_plane;
    }
}

/#

    // Namespace namespace_795feefe/namespace_795feefe
    // Params 0, eflags: 0x0
    // Checksum 0xb8378902, Offset: 0x8e0
    // Size: 0x84
    function function_fc45523f() {
        while (!canadddebugcommand()) {
            waitframe(1);
        }
        mapname = util::get_map_name();
        adddebugcommand("<dev string:x38>" + mapname + "<dev string:x48>");
        level thread function_37401a52();
    }

    // Namespace namespace_795feefe/namespace_795feefe
    // Params 0, eflags: 0x0
    // Checksum 0x8a5db91b, Offset: 0x970
    // Size: 0x116
    function function_37401a52() {
        self notify("<dev string:x8c>");
        self endon("<dev string:x8c>");
        level endon(#"game_ended");
        while (true) {
            if (getdvarint(#"hash_533e1b9932a65628", 0)) {
                zombie_plane = function_de4b0705();
                if (isdefined(zombie_plane)) {
                    zombie_plane player_insertion::function_723d686d();
                    zombie_plane_flight_goal = struct::get("<dev string:x9e>", "<dev string:xb9>");
                    if (isdefined(zombie_plane_flight_goal)) {
                        zombie_plane thread function_3e59cbbb(zombie_plane_flight_goal);
                    }
                }
                setdvar(#"hash_533e1b9932a65628", 0);
            }
            waitframe(1);
        }
    }

    // Namespace namespace_795feefe/namespace_795feefe
    // Params 0, eflags: 0x0
    // Checksum 0xb636d881, Offset: 0xa90
    // Size: 0x304
    function function_de4b0705() {
        var_7206c0ef = getent("<dev string:xc6>", "<dev string:xb9>");
        zombie_plane_flight_goal = struct::get("<dev string:x9e>", "<dev string:xb9>");
        if (!isdefined(level.deathcircle) && isdefined(var_7206c0ef) && isdefined(zombie_plane_flight_goal)) {
            var_8a2c40d0 = struct::get("<dev string:xd6>", "<dev string:xb9>");
            if (isdefined(var_8a2c40d0)) {
                center = var_8a2c40d0.origin;
                radius = 9000;
                angle = randomint(360);
                x_pos = center[0] + radius * cos(angle);
                y_pos = center[1] + radius * sin(angle);
                var_7206c0ef.origin = (x_pos, y_pos, 10000);
                var_e3b87be8 = center[0] + radius * cos(angle + 180);
                var_8e6c495b = center[1] + radius * sin(angle + 180);
                zombie_plane_flight_goal.origin = (var_e3b87be8, var_8e6c495b, 10000);
                zombie_plane = spawnvehicle("<dev string:xea>", var_7206c0ef.origin, vectortoangles(vectornormalize(zombie_plane_flight_goal.origin - var_7206c0ef.origin)));
                if (!isdefined(zombie_plane)) {
                    return;
                }
                zombie_plane.overridevehicledamage = &function_f3dbfe8d;
                zombie_plane setforcenocull();
                zombie_plane setneargoalnotifydist(128);
                zombie_plane.maxhealth = 1;
                zombie_plane setspeed(50);
                return zombie_plane;
            }
            return;
        }
        function_9dc0fa01();
    }

#/
