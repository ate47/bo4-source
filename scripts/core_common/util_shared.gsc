#using script_51e19a6cd0b4d30f;
#using scripts\core_common\weapons_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace util;

// Namespace util/util_shared
// Params 0, eflags: 0x2
// Checksum 0xb5685b56, Offset: 0x388
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"util_shared", &__init__, &__main__, undefined);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x10e87e90, Offset: 0x3d8
// Size: 0x64
function __init__() {
    level.var_9fee970c = function_60d95f53();
    function_73fab74d();
    function_f9ce1d49();
    register_clientfields();
    namespace_1e38a8f6::init();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x89e66f76, Offset: 0x448
// Size: 0x2c
function __main__() {
    system::wait_till("all");
    function_3cb7a62d();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xfa57294b, Offset: 0x480
// Size: 0xc4
function register_clientfields() {
    clientfield::register("world", "cf_team_mapping", 1, 1, "int");
    clientfield::register("world", "preload_frontend", 1, 1, "int");
    clientfield::register("allplayers", "ClearStreamerLoadingHints", 1, 1, "int");
    clientfield::register("allplayers", "StreamerSetSpawnHintIndex", 1, 4, "int");
}

/#

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0x36d3bf10, Offset: 0x550
    // Size: 0xa4
    function error(msg) {
        println("<dev string:x38>", msg);
        if (!sessionmodeismultiplayergame() && !sessionmodeiswarzonegame()) {
            waitframe(1);
        }
        if (getdvar(#"debug", 0)) {
            assertmsg("<dev string:x45>");
        }
    }

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0xe52b1d96, Offset: 0x600
    // Size: 0x34
    function warning(msg) {
        println("<dev string:x74>" + msg);
    }

#/

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xdcb06e22, Offset: 0x640
// Size: 0x2c
function empty(a, b, c, d, e) {
    
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xdd67fe99, Offset: 0x678
// Size: 0xf6
function wait_network_frame(n_count = 1) {
    if (numremoteclients()) {
        for (i = 0; i < n_count; i++) {
            snapshot_ids = getsnapshotindexarray();
            acked = undefined;
            for (n_tries = 0; !isdefined(acked) && n_tries < 5; n_tries++) {
                level waittill(#"snapacknowledged");
                acked = snapshotacknowledged(snapshot_ids);
            }
        }
        return;
    }
    wait(0.1 * n_count);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe48faa31, Offset: 0x778
// Size: 0x54
function preload_frontend() {
    level clientfield::set("preload_frontend", 1);
    wait_network_frame();
    level clientfield::set("preload_frontend", 0);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x89ec692d, Offset: 0x7d8
// Size: 0x46
function clear_streamer_hint() {
    if (isdefined(self.streamer_hint)) {
        self.streamer_hint delete();
        self.streamer_hint = undefined;
    }
    self notify(#"wait_clear_streamer_hint");
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xc21b581b, Offset: 0x828
// Size: 0x44
function wait_clear_streamer_hint(lifetime) {
    self endon(#"wait_clear_streamer_hint");
    wait(lifetime);
    if (isdefined(self)) {
        self clear_streamer_hint();
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xd3576cd, Offset: 0x878
// Size: 0x19c
function create_streamer_hint(origin, angles, value, lifetime) {
    if (self == level) {
        foreach (player in getplayers()) {
            player clear_streamer_hint();
        }
    }
    self clear_streamer_hint();
    self.streamer_hint = createstreamerhint(origin, value);
    if (isdefined(angles)) {
        self.streamer_hint.angles = angles;
    }
    if (self != level) {
        self.streamer_hint setinvisibletoall();
        self.streamer_hint setvisibletoplayer(self);
    }
    self.streamer_hint setincludemeshes(1);
    self notify(#"wait_clear_streamer_hint");
    if (isdefined(lifetime) && lifetime > 0) {
        self thread wait_clear_streamer_hint(lifetime);
    }
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x59fc3fdb, Offset: 0xa20
// Size: 0x3a0
function streamer_wait(n_stream_request_id, n_wait_frames = 0, n_timeout = 15, str_team, str_scenedef) {
    /#
        if (getdvarint(#"cg_drawfps", 1) != 0) {
            n_timeout = 1;
        }
    #/
    if (n_wait_frames > 0) {
        wait_network_frame(n_wait_frames);
    }
    timeout = gettime() + int(n_timeout * 1000);
    if (self == level) {
        n_num_streamers_ready = 0;
        do {
            wait_network_frame();
            n_num_streamers_ready = 0;
            if (isdefined(str_team)) {
                a_players = get_players(str_team);
            } else {
                a_players = getplayers();
            }
            foreach (player in a_players) {
                if (isdefined(str_scenedef) && isarray(player.var_16672042) && isdefined(player.var_16672042[str_scenedef])) {
                    var_5a2f2554 = player.var_16672042[str_scenedef];
                } else {
                    var_5a2f2554 = isdefined(n_stream_request_id) ? n_stream_request_id : player.var_ecd30af1;
                }
                if (isdefined(var_5a2f2554) ? player isstreamerready(var_5a2f2554) : player isstreamerready()) {
                    n_num_streamers_ready++;
                }
            }
            if (n_timeout > 0 && gettime() > timeout) {
                /#
                    if (n_timeout > 5) {
                        iprintln("<dev string:x82>");
                        debug2dtext((50, 50, 0), "<dev string:xd9>", (1, 0, 0), 1, (0, 0, 0), 0, 2, 40);
                    }
                #/
                break;
            }
        } while (n_num_streamers_ready < max(1, a_players.size));
        return;
    }
    self endon(#"disconnect");
    var_5a2f2554 = isdefined(n_stream_request_id) ? n_stream_request_id : self.var_ecd30af1;
    do {
        wait_network_frame();
        if (n_timeout > 0 && gettime() > timeout) {
            break;
        }
    } while (!(isdefined(var_5a2f2554) ? self isstreamerready(var_5a2f2554) : self isstreamerready()));
}

/#

    // Namespace util/util_shared
    // Params 3, eflags: 0x0
    // Checksum 0xa5b2541a, Offset: 0xdc8
    // Size: 0x7c
    function draw_debug_line(start, end, timer) {
                for (i = 0; i < timer * 20; i++) {
            line(start, end, (1, 1, 0.5));
            waitframe(1);
        }
    }

    // Namespace util/util_shared
    // Params 6, eflags: 0x0
    // Checksum 0xc317c8f5, Offset: 0xe50
    // Size: 0x9c
    function debug_line(start, end, color, alpha, depthtest, duration) {
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        if (!isdefined(duration)) {
            duration = 100;
        }
        line(start, end, color, alpha, depthtest, duration);
    }

    // Namespace util/util_shared
    // Params 8, eflags: 0x0
    // Checksum 0x5f676fb9, Offset: 0xef8
    // Size: 0xc4
    function debug_spherical_cone(origin, domeapex, angle, slices, color, alpha, depthtest, duration) {
        if (!isdefined(slices)) {
            slices = 10;
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        if (!isdefined(depthtest)) {
            depthtest = 0;
        }
        if (!isdefined(duration)) {
            duration = 100;
        }
        sphericalcone(origin, domeapex, angle, slices, color, alpha, depthtest, duration);
    }

    // Namespace util/util_shared
    // Params 5, eflags: 0x0
    // Checksum 0x845c1db6, Offset: 0xfc8
    // Size: 0xbc
    function debug_sphere(origin, radius, color, alpha, time) {
        if (!isdefined(time)) {
            time = 1000;
        }
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        sides = int(10 * (1 + int(radius) % 100));
        sphere(origin, radius, color, alpha, 1, sides, time);
    }

    // Namespace util/util_shared
    // Params 5, eflags: 0x0
    // Checksum 0x6e817f1b, Offset: 0x1090
    // Size: 0xec
    function plot_points(plotpoints, r, g, b, timer) {
        lastpoint = plotpoints[0];
        if (!isdefined(r)) {
            r = 1;
        }
        if (!isdefined(g)) {
            g = 1;
        }
        if (!isdefined(b)) {
            b = 1;
        }
        if (!isdefined(timer)) {
            timer = 0.05;
        }
        for (i = 1; i < plotpoints.size; i++) {
            thread draw_line_for_time(lastpoint, plotpoints[i], r, g, b, timer);
            lastpoint = plotpoints[i];
        }
    }

    // Namespace util/util_shared
    // Params 4, eflags: 0x0
    // Checksum 0xf331a43f, Offset: 0x1188
    // Size: 0x2ac
    function draw_arrow_time(start, end, color, timer) {
        level endon(#"newpath");
        pts = [];
        angles = vectortoangles(start - end);
        right = anglestoright(angles);
        forward = anglestoforward(angles);
        up = anglestoup(angles);
        dist = distance(start, end);
        arrow = [];
        arrow[0] = start;
        arrow[1] = start + vectorscale(right, dist * 0.1) + vectorscale(forward, dist * -0.1);
        arrow[2] = end;
        arrow[3] = start + vectorscale(right, dist * -1 * 0.1) + vectorscale(forward, dist * -0.1);
        arrow[4] = start;
        arrow[5] = start + vectorscale(up, dist * 0.1) + vectorscale(forward, dist * -0.1);
        arrow[6] = end;
        arrow[7] = start + vectorscale(up, dist * -1 * 0.1) + vectorscale(forward, dist * -0.1);
        arrow[8] = start;
        r = color[0];
        g = color[1];
        b = color[2];
        plot_points(arrow, r, g, b, timer);
    }

    // Namespace util/util_shared
    // Params 3, eflags: 0x0
    // Checksum 0xf13ec0e1, Offset: 0x1440
    // Size: 0x1f6
    function draw_arrow(start, end, color) {
        level endon(#"newpath");
        pts = [];
        angles = vectortoangles(start - end);
        right = anglestoright(angles);
        forward = anglestoforward(angles);
        dist = distance(start, end);
        arrow = [];
        arrow[0] = start;
        arrow[1] = start + vectorscale(right, dist * 0.05) + vectorscale(forward, dist * -0.2);
        arrow[2] = end;
        arrow[3] = start + vectorscale(right, dist * -1 * 0.05) + vectorscale(forward, dist * -0.2);
        for (p = 0; p < 4; p++) {
            nextpoint = p + 1;
            if (nextpoint >= 4) {
                nextpoint = 0;
            }
            line(arrow[p], arrow[nextpoint], color, 1);
        }
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0xaaae4242, Offset: 0x1640
    // Size: 0x1d6
    function debugorigin() {
        self notify(#"debug origin");
        self endon(#"debug origin", #"death");
        for (;;) {
            forward = anglestoforward(self.angles);
            forwardfar = vectorscale(forward, 30);
            forwardclose = vectorscale(forward, 20);
            right = anglestoright(self.angles);
            left = vectorscale(right, -10);
            right = vectorscale(right, 10);
            line(self.origin, self.origin + forwardfar, (0.9, 0.7, 0.6), 0.9);
            line(self.origin + forwardfar, self.origin + forwardclose + right, (0.9, 0.7, 0.6), 0.9);
            line(self.origin + forwardfar, self.origin + forwardclose + left, (0.9, 0.7, 0.6), 0.9);
            waitframe(1);
        }
    }

    // Namespace util/util_shared
    // Params 6, eflags: 0x0
    // Checksum 0x9df32ec, Offset: 0x1820
    // Size: 0xb6
    function draw_line_for_time(org1, org2, r, g, b, timer) {
        timer = gettime() + timer * 1000;
        while (gettime() < timer) {
            line(org1, org2, (r, g, b), 1);
            recordline(org1, org2, (1, 1, 1), "<dev string:xec>");
            waitframe(1);
        }
    }

    // Namespace util/util_shared
    // Params 6, eflags: 0x0
    // Checksum 0xd8f32e0e, Offset: 0x18e0
    // Size: 0x16c
    function function_6844bea4(radius1, radius2, time, color, origin, normal) {
        if (!isdefined(color)) {
            color = (0, 1, 0);
        }
        circleres = 6;
        circleinc = 360 / circleres;
        circleres++;
        plotpoints = [];
        rad = 0;
        radius = radius2;
        angletoplayer = vectortoangles(normal);
        for (i = 0; i < circleres; i++) {
            plotpoints[plotpoints.size] = origin + vectorscale(anglestoforward(angletoplayer + (rad, 90, 0)), radius);
            rad += circleinc;
        }
        plot_points(plotpoints, color[0], color[1], color[2], time);
    }

#/

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xca70f14f, Offset: 0x1a58
// Size: 0x36
function track(spot_to_track) {
    if (isdefined(self.current_target)) {
        if (spot_to_track == self.current_target) {
            return;
        }
    }
    self.current_target = spot_to_track;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4ebe8e7a, Offset: 0x1a98
// Size: 0x80
function waittill_string(msg, ent) {
    if (msg != "death") {
        self endon(#"death");
    }
    ent endon(#"die");
    self waittill(msg);
    ent notify(#"returned", {#msg:msg});
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2dcd7395, Offset: 0x1b20
// Size: 0x80
function waittill_level_string(msg, ent, otherent) {
    otherent endon(#"death");
    ent endon(#"die");
    level waittill(msg);
    ent notify(#"returned", {#msg:msg});
}

// Namespace util/util_shared
// Params 1, eflags: 0x20
// Checksum 0x55aadb9b, Offset: 0x1ba8
// Size: 0x9c
function waittill_multiple(...) {
    s_tracker = spawnstruct();
    s_tracker._wait_count = 0;
    for (i = 0; i < vararg.size; i++) {
        self thread _waitlogic(s_tracker, vararg[i]);
    }
    if (s_tracker._wait_count > 0) {
        s_tracker waittill(#"waitlogic_finished");
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5aa31e5b, Offset: 0x1c50
// Size: 0x2a
function waittill_either(msg1, msg2) {
    self endon(msg1);
    self waittill(msg2);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x718edf26, Offset: 0x1c88
// Size: 0xac
function break_glass(n_radius = 50) {
    n_radius = float(n_radius);
    if (n_radius == -1) {
        v_origin_offset = (0, 0, 0);
        n_radius = 100;
    } else {
        v_origin_offset = (0, 0, 40);
    }
    glassradiusdamage(self.origin + v_origin_offset, n_radius, 500, 500);
}

// Namespace util/util_shared
// Params 1, eflags: 0x20
// Checksum 0x36f0c65a, Offset: 0x1d40
// Size: 0x1c4
function waittill_multiple_ents(...) {
    a_ents = [];
    a_notifies = [];
    for (i = 0; i < vararg.size; i++) {
        if (i % 2) {
            if (!isdefined(a_notifies)) {
                a_notifies = [];
            } else if (!isarray(a_notifies)) {
                a_notifies = array(a_notifies);
            }
            a_notifies[a_notifies.size] = vararg[i];
            continue;
        }
        if (!isdefined(a_ents)) {
            a_ents = [];
        } else if (!isarray(a_ents)) {
            a_ents = array(a_ents);
        }
        a_ents[a_ents.size] = vararg[i];
    }
    s_tracker = spawnstruct();
    s_tracker._wait_count = 0;
    for (i = 0; i < a_ents.size; i++) {
        ent = a_ents[i];
        if (isdefined(ent)) {
            ent thread _waitlogic(s_tracker, a_notifies[i]);
        }
    }
    if (s_tracker._wait_count > 0) {
        s_tracker waittill(#"waitlogic_finished");
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd1e299ea, Offset: 0x1f10
// Size: 0xb0
function _waitlogic(s_tracker, notifies) {
    s_tracker._wait_count++;
    if (!isdefined(notifies)) {
        notifies = [];
    } else if (!isarray(notifies)) {
        notifies = array(notifies);
    }
    notifies[notifies.size] = "death";
    self waittill(notifies);
    s_tracker._wait_count--;
    if (s_tracker._wait_count == 0) {
        s_tracker notify(#"waitlogic_finished");
    }
}

// Namespace util/util_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xa4092a3a, Offset: 0x1fc8
// Size: 0x1ba
function waittill_level_any_timeout(n_timeout, otherent, string1, string2, string3, string4, string5) {
    otherent endon(#"death");
    ent = spawnstruct();
    if (isdefined(string1)) {
        level thread waittill_level_string(string1, ent, otherent);
    }
    if (isdefined(string2)) {
        level thread waittill_level_string(string2, ent, otherent);
    }
    if (isdefined(string3)) {
        level thread waittill_level_string(string3, ent, otherent);
    }
    if (isdefined(string4)) {
        level thread waittill_level_string(string4, ent, otherent);
    }
    if (isdefined(string5)) {
        level thread waittill_level_string(string5, ent, otherent);
    }
    if (isdefined(otherent)) {
        otherent thread waittill_string("death", ent);
    }
    ent thread _timeout(n_timeout);
    waitresult = ent waittill(#"returned");
    ent notify(#"die");
    return waitresult.msg;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x52da7f7b, Offset: 0x2190
// Size: 0x56
function _timeout(delay) {
    self endon(#"die");
    wait(delay);
    self notify(#"returned", {#msg:"timeout"});
}

// Namespace util/util_shared
// Params 14, eflags: 0x1 linked
// Checksum 0xe30d0275, Offset: 0x21f0
// Size: 0x166
function waittill_any_ents(ent1, string1, ent2, string2, ent3, string3, ent4, string4, ent5, string5, ent6, string6, ent7, string7) {
    assert(isdefined(ent1));
    assert(isdefined(string1));
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    if (isdefined(ent3) && isdefined(string3)) {
        ent3 endon(string3);
    }
    if (isdefined(ent4) && isdefined(string4)) {
        ent4 endon(string4);
    }
    if (isdefined(ent5) && isdefined(string5)) {
        ent5 endon(string5);
    }
    if (isdefined(ent6) && isdefined(string6)) {
        ent6 endon(string6);
    }
    if (isdefined(ent7) && isdefined(string7)) {
        ent7 endon(string7);
    }
    ent1 waittill(string1);
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x76bc9fc2, Offset: 0x2360
// Size: 0x80
function waittill_any_ents_two(ent1, string1, ent2, string2) {
    assert(isdefined(ent1));
    assert(isdefined(string1));
    if (isdefined(ent2) && isdefined(string2)) {
        ent2 endon(string2);
    }
    ent1 waittill(string1);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc477395e, Offset: 0x23e8
// Size: 0x20
function isflashed() {
    if (!isdefined(self.flashendtime)) {
        return false;
    }
    return gettime() < self.flashendtime;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x70cb79c9, Offset: 0x2410
// Size: 0x20
function isstunned() {
    if (!isdefined(self.flashendtime)) {
        return false;
    }
    return gettime() < self.flashendtime;
}

// Namespace util/util_shared
// Params 3, eflags: 0x21 linked
// Checksum 0x8837140, Offset: 0x2438
// Size: 0x3a
function single_func(entity, func, ...) {
    return _single_func(entity, func, vararg);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2ae185ef, Offset: 0x2480
// Size: 0x3a
function single_func_argarray(entity, func, a_vars) {
    return _single_func(entity, func, a_vars);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x40c0bdab, Offset: 0x24c8
// Size: 0x53a
function _single_func(entity, func, a_vars) {
    _clean_up_arg_array(a_vars);
    switch (a_vars.size) {
    case 8:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        }
        break;
    case 7:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        }
        break;
    case 6:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        }
        break;
    case 5:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        }
        break;
    case 4:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        }
        break;
    case 3:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        }
        break;
    case 2:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0], a_vars[1]);
        } else {
            return [[ func ]](a_vars[0], a_vars[1]);
        }
        break;
    case 1:
        if (isdefined(entity)) {
            return entity [[ func ]](a_vars[0]);
        } else {
            return [[ func ]](a_vars[0]);
        }
        break;
    case 0:
        if (isdefined(entity)) {
            return entity [[ func ]]();
        } else {
            return [[ func ]]();
        }
        break;
    default:
        assertmsg("<dev string:xf5>");
        break;
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xaa0d02bd, Offset: 0x2a10
// Size: 0x6e
function _clean_up_arg_array(&a_vars) {
    for (i = a_vars.size - 1; i >= 0; i--) {
        if (a_vars[i] === undefined) {
            arrayremoveindex(a_vars, i, 0);
            continue;
        }
        break;
    }
}

// Namespace util/util_shared
// Params 7, eflags: 0x0
// Checksum 0xeb1fbb0d, Offset: 0x2a88
// Size: 0xca
function new_func(func, arg1, arg2, arg3, arg4, arg5, arg6) {
    s_func = spawnstruct();
    s_func.func = func;
    s_func.arg1 = arg1;
    s_func.arg2 = arg2;
    s_func.arg3 = arg3;
    s_func.arg4 = arg4;
    s_func.arg5 = arg5;
    s_func.arg6 = arg6;
    return s_func;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xe0efe409, Offset: 0x2b60
// Size: 0x72
function call_func(s_func) {
    return single_func(self, s_func.func, s_func.arg1, s_func.arg2, s_func.arg3, s_func.arg4, s_func.arg5, s_func.arg6);
}

// Namespace util/util_shared
// Params 3, eflags: 0x21 linked
// Checksum 0xbeab1519, Offset: 0x2be0
// Size: 0x3c
function single_thread(entity, func, ...) {
    _single_thread(entity, func, undefined, undefined, vararg);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x12b5ad14, Offset: 0x2c28
// Size: 0x3c
function single_thread_argarray(entity, func, &a_vars) {
    _single_thread(entity, func, undefined, undefined, a_vars);
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x87d7a87c, Offset: 0x2c70
// Size: 0x44
function function_50f54b6f(entity, func, arg1, &a_vars) {
    _single_thread(entity, func, arg1, undefined, a_vars);
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x5adaccc9, Offset: 0x2cc0
// Size: 0x54
function function_cf55c866(entity, func, arg1, arg2, &a_vars) {
    _single_thread(entity, func, arg1, arg2, a_vars);
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x723955af, Offset: 0x2d20
// Size: 0x9b2
function _single_thread(entity, func, arg1, arg2, &a_vars) {
    _clean_up_arg_array(a_vars);
    assert(isfunctionptr(func), "<dev string:x106>" + "<dev string:x11d>");
    if (!isfunctionptr(func)) {
        return;
    }
    if (isdefined(arg2)) {
        switch (a_vars.size) {
        case 8:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
            break;
        case 7:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
            break;
        case 6:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
            break;
        case 5:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
            break;
        case 4:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
            break;
        case 3:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1], a_vars[2]);
            break;
        case 2:
            entity thread [[ func ]](arg1, arg2, a_vars[0], a_vars[1]);
            break;
        case 1:
            entity thread [[ func ]](arg1, arg2, a_vars[0]);
            break;
        case 0:
            entity thread [[ func ]](arg1, arg2);
            break;
        default:
            assertmsg("<dev string:xf5>");
            break;
        }
        return;
    }
    if (isdefined(arg1)) {
        switch (a_vars.size) {
        case 8:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
            break;
        case 7:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
            break;
        case 6:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
            break;
        case 5:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
            break;
        case 4:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
            break;
        case 3:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1], a_vars[2]);
            break;
        case 2:
            entity thread [[ func ]](arg1, a_vars[0], a_vars[1]);
            break;
        case 1:
            entity thread [[ func ]](arg1, a_vars[0]);
            break;
        case 0:
            entity thread [[ func ]](arg1);
            break;
        default:
            assertmsg("<dev string:xf5>");
            break;
        }
        return;
    }
    switch (a_vars.size) {
    case 8:
        entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6], a_vars[7]);
        break;
    case 7:
        entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5], a_vars[6]);
        break;
    case 6:
        entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4], a_vars[5]);
        break;
    case 5:
        entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3], a_vars[4]);
        break;
    case 4:
        entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2], a_vars[3]);
        break;
    case 3:
        entity thread [[ func ]](a_vars[0], a_vars[1], a_vars[2]);
        break;
    case 2:
        entity thread [[ func ]](a_vars[0], a_vars[1]);
        break;
    case 1:
        entity thread [[ func ]](a_vars[0]);
        break;
    case 0:
        entity thread [[ func ]]();
        break;
    default:
        assertmsg("<dev string:xf5>");
        break;
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa6018118, Offset: 0x36e0
// Size: 0xca
function script_delay() {
    n_time = gettime();
    self.var_653e059d = 1;
    if (isdefined(self.script_delay)) {
        wait(self.script_delay);
    }
    n_min_delay = isdefined(self.script_delay_min) ? self.script_delay_min : 0;
    n_max_delay = isdefined(self.script_delay_max) ? self.script_delay_max : 0;
    if (n_max_delay > n_min_delay) {
        wait(randomfloatrange(n_min_delay, n_max_delay));
    } else if (n_min_delay > 0) {
        wait(n_min_delay);
    }
    self.var_653e059d = undefined;
    return gettime() - n_time;
}

// Namespace util/util_shared
// Params 8, eflags: 0x1 linked
// Checksum 0xf8c7931, Offset: 0x37b8
// Size: 0xcc
function timeout(n_time, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    if (isdefined(n_time)) {
        __s = spawnstruct();
        __s endon(#"timeout");
        __s delay_notify(n_time, "timeout");
    }
    single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb20ca97f, Offset: 0x3890
// Size: 0x82
function create_flags_and_return_tokens(flags) {
    tokens = strtok(flags, " ");
    for (i = 0; i < tokens.size; i++) {
        level trigger::function_ac2f203a(tokens[i]);
    }
    return tokens;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe7331fa2, Offset: 0x3920
// Size: 0xb0
function function_aebdb74f(str_flags) {
    a_str_flags = strtok(str_flags, " ");
    foreach (str_flag in a_str_flags) {
        level flag::set(str_flag);
    }
}

/#

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0x543d85ce, Offset: 0x39d8
    // Size: 0x6a
    function fileprint_start(file) {
        filename = file;
        file = openfile(filename, "<dev string:x139>");
        level.fileprint = file;
        level.fileprintlinecount = 0;
        level.fileprint_filename = filename;
    }

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0xbc7e917d, Offset: 0x3a50
    // Size: 0x64
    function fileprint_map_start(file) {
        file = "<dev string:x141>" + file + "<dev string:x14f>";
        fileprint_start(file);
        level.fileprint_mapentcount = 0;
        fileprint_map_header(1);
    }

    // Namespace util/util_shared
    // Params 2, eflags: 0x0
    // Checksum 0x61438d4d, Offset: 0x3ac0
    // Size: 0x6c
    function fileprint_chk(file, str) {
        level.fileprintlinecount++;
        if (level.fileprintlinecount > 400) {
            waitframe(1);
            level.fileprintlinecount++;
            level.fileprintlinecount = 0;
        }
        fprintln(file, str);
    }

#/

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x1372da2b, Offset: 0x3b38
// Size: 0xf4
function fileprint_map_header(binclude_blank_worldspawn = 0) {
    assert(isdefined(level.fileprint));
    /#
        fileprint_chk(level.fileprint, "<dev string:x156>");
        fileprint_chk(level.fileprint, "<dev string:x160>");
        fileprint_chk(level.fileprint, "<dev string:x17d>");
        if (!binclude_blank_worldspawn) {
            return;
        }
        fileprint_map_entity_start();
        fileprint_map_keypairprint("<dev string:x18f>", "<dev string:x19b>");
        fileprint_map_entity_end();
    #/
}

/#

    // Namespace util/util_shared
    // Params 2, eflags: 0x0
    // Checksum 0xcce64bc0, Offset: 0x3c38
    // Size: 0x7c
    function fileprint_map_keypairprint(key1, key2) {
        assert(isdefined(level.fileprint));
        fileprint_chk(level.fileprint, "<dev string:x1a8>" + key1 + "<dev string:x1ac>" + key2 + "<dev string:x1a8>");
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0xc9fd7db8, Offset: 0x3cc0
    // Size: 0xb8
    function fileprint_map_entity_start() {
        assert(!isdefined(level.fileprint_entitystart));
        level.fileprint_entitystart = 1;
        assert(isdefined(level.fileprint));
        fileprint_chk(level.fileprint, "<dev string:x1b2>" + level.fileprint_mapentcount);
        fileprint_chk(level.fileprint, "<dev string:x1bf>");
        level.fileprint_mapentcount++;
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x966ea15f, Offset: 0x3d80
    // Size: 0x74
    function fileprint_map_entity_end() {
        assert(isdefined(level.fileprint_entitystart));
        assert(isdefined(level.fileprint));
        level.fileprint_entitystart = undefined;
        fileprint_chk(level.fileprint, "<dev string:x1c3>");
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0xea3fe3ed, Offset: 0x3e00
    // Size: 0x262
    function fileprint_end() {
        assert(!isdefined(level.fileprint_entitystart));
        saved = closefile(level.fileprint);
        if (saved != 1) {
            println("<dev string:x1c7>");
            println("<dev string:x1ed>");
            println("<dev string:x1f1>");
            println("<dev string:x206>" + level.fileprint_filename);
            println("<dev string:x219>");
            println("<dev string:x252>");
            println("<dev string:x290>");
            println("<dev string:x2ce>");
            println("<dev string:x316>");
            println("<dev string:x1ed>");
            println("<dev string:x332>");
            println("<dev string:x377>");
            println("<dev string:x3bd>");
            println("<dev string:x3fb>");
            println("<dev string:x441>");
            println("<dev string:x480>");
            println("<dev string:x4c1>");
            println("<dev string:x1ed>");
            println("<dev string:x1c7>");
            println("<dev string:x506>");
        }
        level.fileprint = undefined;
        level.fileprint_filename = undefined;
    }

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0xd93e79e0, Offset: 0x4070
    // Size: 0x62
    function fileprint_radiant_vec(vector) {
        string = "<dev string:x534>" + vector[0] + "<dev string:x1ed>" + vector[1] + "<dev string:x1ed>" + vector[2] + "<dev string:x534>";
        return string;
    }

#/

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1465048b, Offset: 0x40e0
// Size: 0x8e
function death_notify_wrapper(attacker, damagetype) {
    level notify(#"face", {#face_notify:"death", #entity:self});
    self notify(#"death", {#attacker:attacker, #mod:damagetype});
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0xf38f6f89, Offset: 0x4178
// Size: 0x136
function damage_notify_wrapper(damage, attacker, direction_vec, point, type, modelname, tagname, partname, idflags) {
    level notify(#"face", {#face_notify:"damage", #entity:self});
    self notify(#"damage", {#amount:damage, #attacker:attacker, #direction:direction_vec, #position:point, #mod:type, #model_name:modelname, #tag_name:tagname, #part_name:partname, #flags:idflags});
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa8042e8b, Offset: 0x42b8
// Size: 0x5e
function explode_notify_wrapper() {
    level notify(#"face", {#face_notify:"explode", #entity:self});
    self notify(#"explode");
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x2ba8ee71, Offset: 0x4320
// Size: 0x5e
function alert_notify_wrapper() {
    level notify(#"face", {#face_notify:"alert", #entity:self});
    self notify(#"alert");
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xb2d14886, Offset: 0x4388
// Size: 0x5e
function shoot_notify_wrapper() {
    level notify(#"face", {#face_notify:"shoot", #entity:self});
    self notify(#"shoot");
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xb876721f, Offset: 0x43f0
// Size: 0x5e
function melee_notify_wrapper() {
    level notify(#"face", {#face_notify:"melee", #entity:self});
    self notify(#"melee");
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xd6c35662, Offset: 0x4458
// Size: 0xc
function isusabilityenabled() {
    return !self.disabledusability;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xf4bc5262, Offset: 0x4470
// Size: 0x24
function _disableusability() {
    self.disabledusability++;
    self disableusability();
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x397e01f4, Offset: 0x44a0
// Size: 0x54
function _enableusability() {
    self.disabledusability--;
    assert(self.disabledusability >= 0);
    if (!self.disabledusability) {
        self enableusability();
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3fdd20d5, Offset: 0x4500
// Size: 0x24
function resetusability() {
    self.disabledusability = 0;
    self enableusability();
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xa0fd9ac7, Offset: 0x4530
// Size: 0xea
function orient_to_normal(normal) {
    hor_normal = (normal[0], normal[1], 0);
    hor_length = length(hor_normal);
    if (!hor_length) {
        return (0, 0, 0);
    }
    hor_dir = vectornormalize(hor_normal);
    neg_height = normal[2] * -1;
    tangent = (hor_dir[0] * neg_height, hor_dir[1] * neg_height, hor_length);
    plant_angle = vectortoangles(tangent);
    return plant_angle;
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0x63edaefe, Offset: 0x4628
// Size: 0x84
function delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self thread _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0xfcc7cd76, Offset: 0x46b8
// Size: 0xe4
function _delay(time_or_notify, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self endon(#"death");
    if (isdefined(str_endon)) {
        self endon(str_endon);
    }
    if (ishash(time_or_notify) || isstring(time_or_notify)) {
        self waittill(time_or_notify);
    } else {
        wait(time_or_notify);
    }
    single_thread(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0x5e0805b, Offset: 0x47a8
// Size: 0x84
function delay_network_frames(n_frames, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self thread _delay_network_frames(n_frames, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 9, eflags: 0x1 linked
// Checksum 0xe26e5dd4, Offset: 0x4838
// Size: 0xb4
function _delay_network_frames(n_frames, str_endon, func, arg1, arg2, arg3, arg4, arg5, arg6) {
    self endon(#"death");
    if (isdefined(str_endon)) {
        self endon(str_endon);
    }
    wait_network_frame(n_frames);
    single_func(self, func, arg1, arg2, arg3, arg4, arg5, arg6);
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xf5180d3d, Offset: 0x48f8
// Size: 0x44
function delay_notify(time_or_notify, str_notify, str_endon, arg1) {
    self thread _delay_notify(time_or_notify, str_notify, str_endon, arg1);
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xbea35957, Offset: 0x4948
// Size: 0x9a
function _delay_notify(time_or_notify, str_notify, str_endon, arg1) {
    self endon(#"death");
    if (isdefined(str_endon)) {
        self endon(str_endon);
    }
    if (ishash(time_or_notify) || isstring(time_or_notify)) {
        self waittill(time_or_notify);
    } else {
        wait(time_or_notify);
    }
    self notify(str_notify, arg1);
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x5dcad765, Offset: 0x49f0
// Size: 0x74
function get_closest_player(org, team) {
    team = get_team_mapping(team);
    players = getplayers(team);
    return arraysort(players, org, 1, 1)[0];
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1f1864e1, Offset: 0x4a70
// Size: 0xf2
function registerclientsys(ssysname) {
    if (!isdefined(level._clientsys)) {
        level._clientsys = [];
    }
    if (level._clientsys.size >= 32) {
        assertmsg("<dev string:x537>");
        return;
    }
    if (isdefined(level._clientsys[ssysname])) {
        assertmsg("<dev string:x55a>" + ssysname);
        return;
    }
    level._clientsys[ssysname] = spawnstruct();
    level._clientsys[ssysname].sysid = clientsysregister(ssysname);
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd1790927, Offset: 0x4b70
// Size: 0x112
function setclientsysstate(ssysname, ssysstate, player) {
    if (!isdefined(level._clientsys)) {
        assertmsg("<dev string:x584>");
        return;
    }
    if (!isdefined(level._clientsys[ssysname])) {
        assertmsg("<dev string:x5c3>" + ssysname);
        return;
    }
    if (isdefined(player)) {
        player clientsyssetstate(level._clientsys[ssysname].sysid, ssysstate);
        return;
    }
    clientsyssetstate(level._clientsys[ssysname].sysid, ssysstate);
    level._clientsys[ssysname].sysstate = ssysstate;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x302c4ae4, Offset: 0x4c90
// Size: 0xce
function getclientsysstate(ssysname) {
    if (!isdefined(level._clientsys)) {
        assertmsg("<dev string:x5f6>");
        return "";
    }
    if (!isdefined(level._clientsys[ssysname])) {
        assertmsg("<dev string:x638>" + ssysname + "<dev string:x649>");
        return "";
    }
    if (isdefined(level._clientsys[ssysname].sysstate)) {
        return level._clientsys[ssysname].sysstate;
    }
    return "";
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x19f2d543, Offset: 0x4d68
// Size: 0x6c
function clientnotify(event) {
    if (level.clientscripts) {
        if (isplayer(self)) {
            setclientsysstate("levelNotify", event, self);
            return;
        }
        setclientsysstate("levelNotify", event);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x733da9cf, Offset: 0x4de0
// Size: 0x46
function coopgame() {
    return sessionmodeissystemlink() || sessionmodeisonlinegame() || issplitscreen();
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xd8e8350a, Offset: 0x4e30
// Size: 0x1a6
function is_looking_at(ent_or_org, n_dot_range = 0.9, do_trace = 0, v_offset) {
    assert(isdefined(ent_or_org), "<dev string:x678>");
    v_point = isvec(ent_or_org) ? ent_or_org : ent_or_org.origin;
    if (isvec(v_offset)) {
        v_point += v_offset;
    }
    b_can_see = 0;
    b_use_tag_eye = 0;
    if (isplayer(self) || isai(self)) {
        b_use_tag_eye = 1;
    }
    n_dot = self math::get_dot_direction(v_point, 0, 1, "forward", b_use_tag_eye);
    if (n_dot > n_dot_range) {
        if (do_trace) {
            v_eye = self get_eye();
            b_can_see = sighttracepassed(v_eye, v_point, 0, ent_or_org);
        } else {
            b_can_see = 1;
        }
    }
    return b_can_see;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x32aa74a8, Offset: 0x4fe0
// Size: 0x4c
function get_eye() {
    if (isplayer(self)) {
        return self getplayercamerapos();
    }
    return self geteye();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc8894abd, Offset: 0x5038
// Size: 0x24
function is_ads() {
    return self playerads() > 0.5;
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xb4dc3176, Offset: 0x5068
// Size: 0x146
function spawn_model(model_name, origin = (0, 0, 0), angles = (0, 0, 0), n_spawnflags = 0, b_throttle = 0) {
    while (true) {
        if (b_throttle) {
            spawner::global_spawn_throttle(4);
        }
        model = spawn("script_model", origin, n_spawnflags);
        if (isdefined(model)) {
            break;
        } else {
            println("<dev string:x6b2>" + "<dev string:x6c6>" + model_name + "<dev string:x6e1>" + origin + "<dev string:x6ef>" + angles);
        }
        waitframe(1);
    }
    model setmodel(model_name);
    model.angles = angles;
    return model;
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x2c9e71a9, Offset: 0x51b8
// Size: 0x9a
function spawn_anim_model(model_name, origin, angles, n_spawnflags = 0, b_throttle) {
    model = spawn_model(model_name, origin, angles, n_spawnflags, b_throttle);
    model useanimtree("generic");
    model.animtree = "generic";
    return model;
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x326c59c6, Offset: 0x5260
// Size: 0x9a
function spawn_anim_player_model(model_name, origin, angles, n_spawnflags = 0, b_throttle) {
    model = spawn_model(model_name, origin, angles, n_spawnflags, b_throttle);
    model useanimtree("all_player");
    model.animtree = "all_player";
    return model;
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xdcaa352, Offset: 0x5308
// Size: 0xb0
function waittill_player_looking_at(origin, arc_angle_degrees = 90, do_trace, e_ignore) {
    self endon(#"death");
    arc_angle_degrees = absangleclamp360(arc_angle_degrees);
    dot = cos(arc_angle_degrees * 0.5);
    while (!is_player_looking_at(origin, dot, do_trace, e_ignore)) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xb9067342, Offset: 0x53c0
// Size: 0x58
function waittill_player_not_looking_at(origin, dot, do_trace) {
    self endon(#"death");
    while (is_player_looking_at(origin, dot, do_trace)) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x34365b1f, Offset: 0x5420
// Size: 0x1b8
function is_player_looking_at(v_origin, n_dot = 0.7, b_do_trace = 1, e_ignore) {
    assert(isplayer(self), "<dev string:x6fc>");
    if (isdefined(self.hijacked_vehicle_entity)) {
        v_eye = self.hijacked_vehicle_entity gettagorigin("tag_driver");
        v_view = anglestoforward(self.hijacked_vehicle_entity gettagangles("tag_driver"));
    } else {
        v_eye = self get_eye();
        v_view = anglestoforward(self getplayerangles());
    }
    v_delta = vectornormalize(v_origin - v_eye);
    n_new_dot = vectordot(v_delta, v_view);
    if (n_new_dot >= n_dot) {
        if (b_do_trace) {
            return bullettracepassed(v_origin, v_eye, 0, e_ignore);
        } else {
            return 1;
        }
    }
    return 0;
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x747efd76, Offset: 0x55e0
// Size: 0x76
function wait_endon(waittime, endonstring, endonstring2, endonstring3, endonstring4) {
    self endon(endonstring);
    if (isdefined(endonstring2)) {
        self endon(endonstring2);
    }
    if (isdefined(endonstring3)) {
        self endon(endonstring3);
    }
    if (isdefined(endonstring4)) {
        self endon(endonstring4);
    }
    wait(waittime);
    return true;
}

// Namespace util/util_shared
// Params 5, eflags: 0x0
// Checksum 0x3669590a, Offset: 0x5660
// Size: 0x84
function waittillendonthreaded(waitcondition, callback, endcondition1, endcondition2, endcondition3) {
    if (isdefined(endcondition1)) {
        self endon(endcondition1);
    }
    if (isdefined(endcondition2)) {
        self endon(endcondition2);
    }
    if (isdefined(endcondition3)) {
        self endon(endcondition3);
    }
    self waittill(waitcondition);
    if (isdefined(callback)) {
        [[ callback ]](waitcondition);
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x1f3296ba, Offset: 0x56f0
// Size: 0x46
function new_timer(n_timer_length) {
    s_timer = spawnstruct();
    s_timer.n_time_created = gettime();
    s_timer.n_length = n_timer_length;
    return s_timer;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xcc40363f, Offset: 0x5740
// Size: 0x20
function get_time() {
    t_now = gettime();
    return t_now - self.n_time_created;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2ee85389, Offset: 0x5768
// Size: 0x34
function get_time_in_seconds() {
    return float(get_time()) / 1000;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xb521935f, Offset: 0x57a8
// Size: 0x4a
function get_time_frac(n_end_time = self.n_length) {
    return lerpfloat(0, 1, get_time_in_seconds() / n_end_time);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x404d6128, Offset: 0x5800
// Size: 0x58
function get_time_left() {
    if (isdefined(self.n_length)) {
        n_current_time = get_time_in_seconds();
        return max(self.n_length - n_current_time, 0);
    }
    return -1;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x58f052f1, Offset: 0x5860
// Size: 0x16
function is_time_left() {
    return get_time_left() != 0;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x715e567e, Offset: 0x5880
// Size: 0x62
function timer_wait(n_wait) {
    if (isdefined(self.n_length)) {
        n_wait = min(n_wait, get_time_left());
    }
    wait(n_wait);
    n_current_time = get_time_in_seconds();
    return n_current_time;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xffdccfb6, Offset: 0x58f0
// Size: 0x36
function is_primary_damage(meansofdeath) {
    if (meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET") {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x48d9bf8d, Offset: 0x5930
// Size: 0x54
function delete_on_death(ent) {
    ent endon(#"death");
    self waittill(#"death");
    if (isdefined(ent)) {
        ent delete();
    }
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0xf59a97a8, Offset: 0x5990
// Size: 0xb4
function delete_on_death_or_notify(e_to_delete, str_notify, str_clientfield = undefined) {
    e_to_delete endon(#"death");
    self waittill_either("death", str_notify);
    if (isdefined(e_to_delete)) {
        if (isdefined(str_clientfield)) {
            e_to_delete clientfield::set(str_clientfield, 0);
            wait(0.1);
        }
        e_to_delete delete();
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x783cb389, Offset: 0x5a50
// Size: 0xa8
function wait_till_not_touching(e_to_check, e_to_touch) {
    assert(isdefined(e_to_check), "<dev string:x72c>");
    assert(isdefined(e_to_touch), "<dev string:x76c>");
    e_to_check endon(#"death");
    e_to_touch endon(#"death");
    while (e_to_check istouching(e_to_touch)) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0x3e25d602, Offset: 0x5b00
// Size: 0xd4
function any_player_is_touching(ent, team) {
    team = get_team_mapping(team);
    foreach (player in getplayers(team)) {
        if (isalive(player) && player istouching(ent)) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xb3659573, Offset: 0x5be0
// Size: 0x124
function set_console_status() {
    if (!isdefined(level.console)) {
        level.console = getdvarstring(#"consolegame") == "true";
    } else {
        assert(level.console == getdvarstring(#"consolegame") == "<dev string:x7ac>", "<dev string:x7b3>");
    }
    if (!isdefined(level.consolexenon)) {
        level.xenon = getdvarstring(#"xenongame") == "true";
        return;
    }
    assert(level.xenon == getdvarstring(#"xenongame") == "<dev string:x7ac>", "<dev string:x7d8>");
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x66fec324, Offset: 0x5d10
// Size: 0x14
function waittill_asset_loaded(str_type, str_name) {
    
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x77b0ab0b, Offset: 0x5d30
// Size: 0x15a
function script_wait() {
    n_time = gettime();
    if (isdefined(self.script_wait)) {
        wait(self.script_wait);
        if (isdefined(self.script_wait_add)) {
            self.script_wait += self.script_wait_add;
        }
    }
    n_min = isdefined(self.script_wait_min) ? self.script_wait_min : 0;
    n_max = isdefined(self.script_wait_max) ? self.script_wait_max : 0;
    if (n_max > n_min) {
        wait(randomfloatrange(n_min, n_max));
        self.script_wait_min += isdefined(self.script_wait_add) ? self.script_wait_add : 0;
        self.script_wait_max += isdefined(self.script_wait_add) ? self.script_wait_add : 0;
    } else if (n_min > 0) {
        wait(n_min);
        self.script_wait_min += isdefined(self.script_wait_add) ? self.script_wait_add : 0;
    }
    return gettime() - n_time;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5f5878cd, Offset: 0x5e98
// Size: 0x20
function is_killstreaks_enabled() {
    return isdefined(level.killstreaksenabled) && level.killstreaksenabled;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xc78be403, Offset: 0x5ec0
// Size: 0x1e
function is_flashbanged() {
    return isdefined(self.flashendtime) && gettime() < self.flashendtime;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbf29a377, Offset: 0x5ee8
// Size: 0x116
function magic_bullet_shield(ent = self) {
    ent val::set(#"magic_bullet_shield", "allowdeath", 0);
    ent.magic_bullet_shield = 1;
    /#
        ent notify(#"_stop_magic_bullet_shield_debug");
        level thread debug_magic_bullet_shield_death(ent);
    #/
    assert(isalive(ent), "<dev string:x7fb>");
    if (isai(ent)) {
        if (isactor(ent)) {
            ent bloodimpact("hero");
        }
        ent.attackeraccuracy = 0.1;
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x432f9394, Offset: 0x6008
// Size: 0xa4
function debug_magic_bullet_shield_death(guy) {
    targetname = "none";
    if (isdefined(guy.targetname)) {
        targetname = guy.targetname;
    }
    guy endon(#"stop_magic_bullet_shield", #"_stop_magic_bullet_shield_debug");
    guy waittill(#"death");
    assert(!isdefined(guy), "<dev string:x839>" + targetname);
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xa95c8dd2, Offset: 0x60b8
// Size: 0x328
function spawn_player_clone(player, animname, s_align, var_df23b31f = 0) {
    playerclone = spawn("script_model", player.origin);
    playerclone.angles = player.angles;
    if (player function_390cb543()) {
        var_1749f1e8 = player function_92ea4100();
        if (isdefined(var_1749f1e8)) {
            playerclone setmodel(var_1749f1e8);
        }
        headmodel = player startquantity();
        if (isdefined(headmodel)) {
            playerclone attach(headmodel);
        }
    } else {
        var_41206ae3 = player function_5d23af5b();
        if (isdefined(var_41206ae3)) {
            playerclone setmodel(var_41206ae3);
        }
        headmodel = player startquantity();
        if (isdefined(headmodel)) {
            playerclone attach(headmodel);
        }
        var_b4d88433 = player function_cde23658();
        if (isdefined(var_b4d88433)) {
            playerclone attach(var_b4d88433);
        }
        var_1749f1e8 = player function_92ea4100();
        if (isdefined(var_1749f1e8)) {
            playerclone attach(var_1749f1e8);
        }
    }
    playerclone setbodyrenderoptionspacked(player getcharacterbodyrenderoptions());
    if (var_df23b31f) {
        playerclone animation::attach_weapon(player getcurrentweapon());
    }
    playerclone useanimtree("all_player");
    if (isdefined(animname)) {
        if (isdefined(s_align)) {
            playerclone thread animation::play(animname, s_align);
        } else {
            playerclone thread animation::play(animname, playerclone.origin, playerclone.angles);
        }
    }
    playerclone.health = 100;
    playerclone setowner(player);
    playerclone.team = player.team;
    playerclone solid();
    return playerclone;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xafa619db, Offset: 0x63e8
// Size: 0xc0
function stop_magic_bullet_shield(ent = self) {
    ent val::reset(#"magic_bullet_shield", "allowdeath");
    ent.magic_bullet_shield = undefined;
    if (isai(ent)) {
        if (isactor(ent)) {
            ent bloodimpact("normal");
        }
        ent.attackeraccuracy = 1;
    }
    ent notify(#"stop_magic_bullet_shield");
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xf92f10b9, Offset: 0x64b0
// Size: 0x46
function get_rounds_won(team) {
    team = get_team_mapping(team);
    return game.stat[#"roundswon"][team];
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x8d0adc34, Offset: 0x6500
// Size: 0x90
function within_fov(start_origin, start_angles, end_origin, fov) {
    normal = vectornormalize(end_origin - start_origin);
    forward = anglestoforward(start_angles);
    dot = vectordot(forward, normal);
    return dot >= fov;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1d759826, Offset: 0x6598
// Size: 0x16a
function button_held_think(which_button) {
    self endon(#"disconnect");
    if (!isdefined(self._holding_button)) {
        self._holding_button = [];
    }
    self._holding_button[which_button] = 0;
    time_started = 0;
    while (true) {
        usinggamepad = self gamepadusedlast();
        use_time = ispc() && !usinggamepad ? 0 : 250;
        if (self._holding_button[which_button]) {
            if (!self [[ level._button_funcs[which_button] ]]()) {
                self._holding_button[which_button] = 0;
            }
        } else if (self [[ level._button_funcs[which_button] ]]()) {
            if (time_started == 0) {
                time_started = gettime();
            }
            if (gettime() - time_started > use_time) {
                self._holding_button[which_button] = 1;
            }
        } else if (time_started != 0) {
            time_started = 0;
        }
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdaab5f8d, Offset: 0x6710
// Size: 0x4c
function use_button_held() {
    init_button_wrappers();
    if (!isdefined(self._use_button_think_threaded)) {
        self thread button_held_think(0);
        self._use_button_think_threaded = 1;
    }
    return self._holding_button[0];
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x80a27a11, Offset: 0x6768
// Size: 0x58
function stance_button_held() {
    init_button_wrappers();
    if (!isdefined(self._stance_button_think_threaded)) {
        self thread button_held_think(1);
        self._stance_button_think_threaded = 1;
    }
    return self._holding_button[1];
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xba46aaac, Offset: 0x67c8
// Size: 0x58
function ads_button_held() {
    init_button_wrappers();
    if (!isdefined(self._ads_button_think_threaded)) {
        self thread button_held_think(2);
        self._ads_button_think_threaded = 1;
    }
    return self._holding_button[2];
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xa019f0fa, Offset: 0x6828
// Size: 0x58
function attack_button_held() {
    init_button_wrappers();
    if (!isdefined(self._attack_button_think_threaded)) {
        self thread button_held_think(3);
        self._attack_button_think_threaded = 1;
    }
    return self._holding_button[3];
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xf69d1998, Offset: 0x6888
// Size: 0x58
function button_right_held() {
    init_button_wrappers();
    if (!isdefined(self._dpad_right_button_think_threaded)) {
        self thread button_held_think(6);
        self._dpad_right_button_think_threaded = 1;
    }
    return self._holding_button[6];
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x23a80c1, Offset: 0x68e8
// Size: 0x28
function waittill_use_button_pressed() {
    while (!self usebuttonpressed()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xc3e52c97, Offset: 0x6918
// Size: 0x28
function waittill_use_button_held() {
    while (!self use_button_held()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xbeaa68d9, Offset: 0x6948
// Size: 0x28
function waittill_stance_button_pressed() {
    while (!self stancebuttonpressed()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x5b352957, Offset: 0x6978
// Size: 0x28
function waittill_stance_button_held() {
    while (!self stance_button_held()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb436bd44, Offset: 0x69a8
// Size: 0x28
function waittill_attack_button_pressed() {
    while (!self attackbuttonpressed()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xdd0a70af, Offset: 0x69d8
// Size: 0x28
function waittill_ads_button_pressed() {
    while (!self adsbuttonpressed()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x81662e75, Offset: 0x6a08
// Size: 0x28
function waittill_vehicle_move_up_button_pressed() {
    while (!self vehiclemoveupbuttonpressed()) {
        waitframe(1);
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9d0f27aa, Offset: 0x6a38
// Size: 0xfe
function init_button_wrappers() {
    if (!isdefined(level._button_funcs)) {
        level._button_funcs[0] = &usebuttonpressed;
        level._button_funcs[2] = &adsbuttonpressed;
        level._button_funcs[3] = &attackbuttonpressed;
        level._button_funcs[1] = &stancebuttonpressed;
        level._button_funcs[6] = &actionslotfourbuttonpressed;
        /#
            level._button_funcs[4] = &up_button_pressed;
            level._button_funcs[5] = &down_button_pressed;
        #/
    }
}

/#

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x4302bd4d, Offset: 0x6b40
    // Size: 0x62
    function up_button_held() {
        init_button_wrappers();
        if (!isdefined(self._up_button_think_threaded)) {
            self thread button_held_think(4);
            self._up_button_think_threaded = 1;
        }
        return self._holding_button[4];
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x4beca614, Offset: 0x6bb0
    // Size: 0x62
    function down_button_held() {
        init_button_wrappers();
        if (!isdefined(self._down_button_think_threaded)) {
            self thread button_held_think(5);
            self._down_button_think_threaded = 1;
        }
        return self._holding_button[5];
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x324bf539, Offset: 0x6c20
    // Size: 0x46
    function up_button_pressed() {
        return self buttonpressed("<dev string:x872>") || self buttonpressed("<dev string:x87c>");
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0xbb89cfd2, Offset: 0x6c70
    // Size: 0x28
    function waittill_up_button_pressed() {
        while (!self up_button_pressed()) {
            waitframe(1);
        }
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x876a4b32, Offset: 0x6ca0
    // Size: 0x46
    function down_button_pressed() {
        return self buttonpressed("<dev string:x886>") || self buttonpressed("<dev string:x892>");
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x54296540, Offset: 0x6cf0
    // Size: 0x28
    function waittill_down_button_pressed() {
        while (!self down_button_pressed()) {
            waitframe(1);
        }
    }

#/

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7e5a6d, Offset: 0x6d20
// Size: 0x32
function ishacked() {
    return isdefined(self.hacked) && self.hacked || isdefined(self.ishacked) && self.ishacked;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x25a8f070, Offset: 0x6d60
// Size: 0x86
function function_fbce7263(team_a, team_b) {
    if (team_a === team_b || function_9b7092ef(team_a, team_b)) {
        return false;
    }
    if (!isdefined(team_a) || !isdefined(team_b)) {
        return true;
    }
    if (function_b37afded(team_a, team_b)) {
        return false;
    }
    return true;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x52bf3698, Offset: 0x6df0
// Size: 0x4a
function isenemyteam(team) {
    assert(isdefined(team));
    if (!isdefined(self)) {
        return 0;
    }
    return function_fbce7263(team, self.team);
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x96b06490, Offset: 0x6e48
// Size: 0x80
function isfriendlyplayer(player) {
    if (!isplayer(player) || !isdefined(self)) {
        return false;
    }
    if (level.teambased) {
        return !isenemyteam(player.team);
    } else if (player == self) {
        return true;
    }
    return true;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb97107a8, Offset: 0x6ed0
// Size: 0x7c
function isenemyplayer(player) {
    if (!isplayer(player) || !isdefined(self)) {
        return 0;
    }
    if (level.teambased) {
        return isenemyteam(player.team);
    } else if (player == self) {
        return 0;
    }
    return 1;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe67c5223, Offset: 0x6f58
// Size: 0x2e
function waittillslowprocessallowed() {
    while (level.lastslowprocessframe == gettime()) {
        waitframe(1);
    }
    level.lastslowprocessframe = gettime();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb17824e9, Offset: 0x6f90
// Size: 0x12
function function_1ea0b2ce() {
    level.lastslowprocessframe = gettime();
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x52922ed5, Offset: 0x6fb0
// Size: 0x12
function get_start_time() {
    return getmicrosecondsraw();
}

/#

    // Namespace util/util_shared
    // Params 2, eflags: 0x0
    // Checksum 0x558e6465, Offset: 0x6fd0
    // Size: 0xec
    function note_elapsed_time(start_time, label = "unspecified") {
        elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
        if (!isdefined(start_time)) {
            return;
        }
        elapsed_time *= 0.001;
        if (!level.orbis) {
            elapsed_time = int(elapsed_time);
        }
        msg = label + "<dev string:x89e>" + elapsed_time + "<dev string:x8b0>";
        profileprintln(msg);
        iprintln(msg);
    }

#/

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x77d0181f, Offset: 0x70c8
// Size: 0x98
function record_elapsed_time(start_time, &elapsed_time_array) {
    elapsed_time = get_elapsed_time(start_time, getmicrosecondsraw());
    if (!isdefined(elapsed_time_array)) {
        elapsed_time_array = [];
    } else if (!isarray(elapsed_time_array)) {
        elapsed_time_array = array(elapsed_time_array);
    }
    elapsed_time_array[elapsed_time_array.size] = elapsed_time;
}

/#

    // Namespace util/util_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x1afa6021, Offset: 0x7168
    // Size: 0x284
    function note_elapsed_times(&elapsed_time_array, label = "unspecified") {
        if (!isarray(elapsed_time_array)) {
            return;
        }
        msg = label + "<dev string:x8b6>" + elapsed_time_array.size;
        profileprintln(msg);
        if (elapsed_time_array.size == 0) {
            return;
        }
        total_elapsed_time = 0;
        smallest_elapsed_time = 2147483647;
        largest_elapsed_time = 0;
        foreach (elapsed_time in elapsed_time_array) {
            elapsed_time *= 0.001;
            total_elapsed_time += elapsed_time;
            if (elapsed_time < smallest_elapsed_time) {
                smallest_elapsed_time = elapsed_time;
            }
            if (elapsed_time > largest_elapsed_time) {
                largest_elapsed_time = elapsed_time;
            }
            if (!level.orbis) {
                elapsed_time = int(elapsed_time);
            }
            msg = label + "<dev string:x89e>" + elapsed_time + "<dev string:x8b0>";
            profileprintln(msg);
        }
        average_elapsed_time = total_elapsed_time / elapsed_time_array.size;
        msg = label + "<dev string:x8c3>" + average_elapsed_time + "<dev string:x8b0>";
        profileprintln(msg);
        iprintln(msg);
        msg = label + "<dev string:x8dd>" + largest_elapsed_time + "<dev string:x8b0>";
        profileprintln(msg);
        msg = label + "<dev string:x8f7>" + smallest_elapsed_time + "<dev string:x8b0>";
        profileprintln(msg);
    }

#/

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe1b1e4f6, Offset: 0x73f8
// Size: 0x70
function get_elapsed_time(start_time, end_time = getmicrosecondsraw()) {
    if (!isdefined(start_time)) {
        return undefined;
    }
    elapsed_time = end_time - start_time;
    if (elapsed_time < 0) {
        elapsed_time += -2147483648;
    }
    return elapsed_time;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xfacd12e2, Offset: 0x7470
// Size: 0x7c
function note_raw_time(label = "unspecified") {
    now = getmicrosecondsraw();
    msg = "us = " + now + " -- " + label;
    profileprintln(msg);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x41cc99ed, Offset: 0x74f8
// Size: 0x4e
function mayapplyscreeneffect() {
    assert(isdefined(self));
    assert(isplayer(self));
    return !isdefined(self.viewlockedentity);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x6640ded3, Offset: 0x7550
// Size: 0x9e
function waittillnotmoving() {
    if (self ishacked()) {
        waitframe(1);
        return;
    }
    if (self.classname == "grenade") {
        self waittill(#"stationary");
        return;
    }
    for (prevorigin = self.origin; true; prevorigin = self.origin) {
        wait(0.15);
        if (self.origin == prevorigin) {
            break;
        }
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x75a31a7e, Offset: 0x75f8
// Size: 0x6e
function waittillrollingornotmoving() {
    if (self ishacked()) {
        waitframe(1);
        return "stationary";
    }
    movestate = self waittill(#"stationary", #"rolling");
    return movestate._notify;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x240b1c74, Offset: 0x7670
// Size: 0x142
function getweaponclass(weapon) {
    if (weapon == level.weaponnone) {
        return undefined;
    }
    if (!weapon.isvalid) {
        return undefined;
    }
    if (!isdefined(level.weaponclassarray)) {
        level.weaponclassarray = [];
    }
    if (isdefined(level.weaponclassarray[weapon.name])) {
        return level.weaponclassarray[weapon.name];
    }
    baseweaponparam = weapons::getbaseweapon(weapon);
    baseweaponindex = getbaseweaponitemindex(baseweaponparam);
    weaponclass = #"";
    weaponinfo = getunlockableiteminfofromindex(baseweaponindex, 1);
    if (isdefined(weaponinfo)) {
        weaponclass = weaponinfo.itemgroupname;
    }
    level.weaponclassarray[weapon.name] = weaponclass;
    return weaponclass;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x810b89ec, Offset: 0x77c0
// Size: 0x56
function function_56353fe9(weaponname) {
    weapon = getweapon(weaponname);
    if (!isdefined(weapon) || weapon == level.weaponnone) {
        return undefined;
    }
    return weapon;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1f603c12, Offset: 0x7820
// Size: 0xc
function isusingremote() {
    return isdefined(self.usingremote);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9060ec7d, Offset: 0x7838
// Size: 0x18
function function_63d27d4e(remotename) {
    return self.usingremote === remotename;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x22bd76d8, Offset: 0x7858
// Size: 0xc6
function setusingremote(remotename, set_killstreak_delay_killcam = !sessionmodeiszombiesgame()) {
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 0;
    }
    assert(!self isusingremote());
    self.usingremote = remotename;
    if (set_killstreak_delay_killcam) {
        self.killstreak_delay_killcam = remotename;
    }
    self disableoffhandweapons();
    self notify(#"using_remote");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x84d579c3, Offset: 0x7928
// Size: 0x56
function function_9a39538a() {
    if (isdefined(self.carryicon)) {
        self.carryicon.alpha = 1;
    }
    self.usingremote = undefined;
    self enableoffhandweapons();
    self.killstreak_delay_killcam = undefined;
    self notify(#"stopped_using_remote");
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7282d442, Offset: 0x7988
// Size: 0x74
function deleteaftertime(time) {
    assert(isdefined(self));
    assert(isdefined(time));
    assert(time >= 0.05);
    self thread deleteaftertimethread(time);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa1232a4d, Offset: 0x7a08
// Size: 0x3c
function deleteaftertimethread(time) {
    self endon(#"death");
    wait(time);
    self delete();
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x63a81d70, Offset: 0x7a50
// Size: 0x34
function waitfortime(time = 0) {
    if (time > 0) {
        wait(time);
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x9223b43f, Offset: 0x7a90
// Size: 0x7e
function waitfortimeandnetworkframe(time = 0) {
    start_time_ms = gettime();
    wait_network_frame();
    elapsed_time = (gettime() - start_time_ms) * 0.001;
    remaining_time = time - elapsed_time;
    if (remaining_time > 0) {
        wait(remaining_time);
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xe309ef26, Offset: 0x7b18
// Size: 0x54
function deleteaftertimeandnetworkframe(time) {
    assert(isdefined(self));
    waitfortimeandnetworkframe(time);
    self delete();
}

/#

    // Namespace util/util_shared
    // Params 7, eflags: 0x1 linked
    // Checksum 0x2ffd2f4e, Offset: 0x7b78
    // Size: 0x7c
    function drawcylinder(pos, rad, height, duration, stop_notify, color, alpha) {
        if (!isdefined(duration)) {
            duration = 0;
        }
        level thread drawcylinder_think(pos, rad, height, duration, stop_notify, color, alpha);
    }

    // Namespace util/util_shared
    // Params 7, eflags: 0x0
    // Checksum 0xbf72d5b8, Offset: 0x7c00
    // Size: 0x2f8
    function drawcylinder_think(pos, rad, height, seconds, stop_notify, color, alpha) {
        if (isdefined(stop_notify)) {
            level endon(stop_notify);
        }
        stop_time = gettime() + int(seconds * 1000);
        currad = rad;
        curheight = height;
        if (!isdefined(color)) {
            color = (1, 1, 1);
        }
        if (!isdefined(alpha)) {
            alpha = 1;
        }
        for (;;) {
            if (seconds > 0 && stop_time <= gettime()) {
                return;
            }
            for (r = 0; r < 20; r++) {
                theta = r / 20 * 360;
                theta2 = (r + 1) / 20 * 360;
                line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta2) * currad, sin(theta2) * currad, 0), color, alpha);
                line(pos + (cos(theta) * currad, sin(theta) * currad, curheight), pos + (cos(theta2) * currad, sin(theta2) * currad, curheight), color, alpha);
                line(pos + (cos(theta) * currad, sin(theta) * currad, 0), pos + (cos(theta) * currad, sin(theta) * currad, curheight), color, alpha);
            }
            waitframe(1);
        }
    }

#/

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xb56a42d1, Offset: 0x7f00
// Size: 0x2e
function spawn_array_struct() {
    s = spawnstruct();
    s.a = [];
    return s;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf768bfb4, Offset: 0x7f38
// Size: 0x98
function gethostplayer() {
    players = getplayers();
    foreach (player in players) {
        if (player ishost()) {
            return player;
        }
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x52754edc, Offset: 0x7fd8
// Size: 0x6c
function gethostplayerforbots() {
    players = getplayers();
    for (index = 0; index < players.size; index++) {
        if (players[index] ishostforbots()) {
            return players[index];
        }
    }
}

// Namespace util/util_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x139f8e62, Offset: 0x8050
// Size: 0x2f0
function get_array_of_closest(org, array, excluders = [], max = array.size, maxdist) {
    maxdists2rd = undefined;
    if (isdefined(maxdist)) {
        maxdists2rd = maxdist * maxdist;
    }
    dist = [];
    index = [];
    for (i = 0; i < array.size; i++) {
        if (!isdefined(array[i])) {
            continue;
        }
        if (isinarray(excluders, array[i])) {
            continue;
        }
        if (isvec(array[i])) {
            length = distancesquared(org, array[i]);
        } else {
            length = distancesquared(org, array[i].origin);
        }
        if (isdefined(maxdists2rd) && maxdists2rd < length) {
            continue;
        }
        dist[dist.size] = length;
        index[index.size] = i;
    }
    for (;;) {
        change = 0;
        for (i = 0; i < dist.size - 1; i++) {
            if (dist[i] <= dist[i + 1]) {
                continue;
            }
            change = 1;
            temp = dist[i];
            dist[i] = dist[i + 1];
            dist[i + 1] = temp;
            temp = index[i];
            index[i] = index[i + 1];
            index[i + 1] = temp;
        }
        if (!change) {
            break;
        }
    }
    newarray = [];
    if (max > dist.size) {
        max = dist.size;
    }
    for (i = 0; i < max; i++) {
        newarray[i] = array[index[i]];
    }
    return newarray;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6cdaed58, Offset: 0x8348
// Size: 0x13c
function set_lighting_state(n_state) {
    if (isdefined(n_state)) {
        self.lighting_state = n_state;
    } else {
        self.lighting_state = level.lighting_state;
    }
    if (isdefined(self.lighting_state)) {
        if (self == level) {
            if (isdefined(level.activeplayers)) {
                foreach (player in level.activeplayers) {
                    player set_lighting_state(level.lighting_state);
                }
            }
            return;
        }
        if (isplayer(self)) {
            self setlightingstate(self.lighting_state);
            return;
        }
        assertmsg("<dev string:x912>");
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb14a3819, Offset: 0x8490
// Size: 0x13c
function set_sun_shadow_split_distance(f_distance) {
    if (isdefined(f_distance)) {
        self.sun_shadow_split_distance = f_distance;
    } else {
        self.sun_shadow_split_distance = level.sun_shadow_split_distance;
    }
    if (isdefined(self.sun_shadow_split_distance)) {
        if (self == level) {
            if (isdefined(level.activeplayers)) {
                foreach (player in level.activeplayers) {
                    player set_sun_shadow_split_distance(level.sun_shadow_split_distance);
                }
            }
            return;
        }
        if (isplayer(self)) {
            self setsunshadowsplitdistance(self.sun_shadow_split_distance);
            return;
        }
        assertmsg("<dev string:x946>");
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4d1d4fb4, Offset: 0x85d8
// Size: 0x15c
function function_7f49ffb7(var_bf01552a) {
    if (!isdefined(level.var_bf01552a)) {
        level.var_bf01552a = -1;
    }
    if (isdefined(var_bf01552a)) {
        self.var_bf01552a = var_bf01552a;
    } else {
        self.var_bf01552a = level.var_bf01552a;
    }
    if (isdefined(self.var_bf01552a)) {
        if (self == level) {
            if (isdefined(level.activeplayers)) {
                foreach (player in level.activeplayers) {
                    player function_7f49ffb7(level.var_bf01552a);
                }
            }
            return;
        }
        if (isplayer(self)) {
            self function_61471b4a(self.var_bf01552a);
            return;
        }
        assertmsg("<dev string:x985>");
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x4335c58e, Offset: 0x8740
// Size: 0x52a
function auto_delete(n_mode = 1, n_min_time_alive = 0, n_dist_horizontal = 0, n_dist_vertical = 0) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death", #"hash_375a9d48dd6a9427");
    self notify(#"__auto_delete__");
    self endon(#"__auto_delete__");
    level flag::wait_till("all_players_spawned");
    if (isdefined(level.heroes) && isinarray(level.heroes, self)) {
        return;
    }
    if (isplayer(self)) {
        return;
    }
    if (n_mode & 16 || n_mode == 1 || n_mode == 8) {
        n_mode |= 2;
        n_mode |= 4;
    }
    n_think_time = 1;
    n_tests_to_do = 2;
    n_dot_check = 0;
    if (n_mode & 16) {
        n_think_time = 0.2;
        n_tests_to_do = 1;
        n_dot_check = 0.4;
    }
    n_test_count = 0;
    n_dist_horizontal_sq = n_dist_horizontal * n_dist_horizontal;
    while (true) {
        do {
            wait(randomfloatrange(n_think_time - n_think_time / 3, n_think_time + n_think_time / 3));
        } while (isdefined(self.birthtime) && float(gettime() - self.birthtime) / 1000 < n_min_time_alive);
        n_tests_passed = 0;
        foreach (player in level.players) {
            if (isbot(player)) {
                n_tests_passed++;
                continue;
            }
            if (n_dist_horizontal && distance2dsquared(self.origin, player.origin) < n_dist_horizontal_sq) {
                continue;
            }
            if (n_dist_vertical && abs(self.origin[2] - player.origin[2]) < n_dist_vertical) {
                continue;
            }
            v_eye = player getplayercamerapos();
            b_behind = 0;
            if (n_mode & 2) {
                v_facing = anglestoforward(player getplayerangles());
                v_to_ent = vectornormalize(self.origin - v_eye);
                n_dot = vectordot(v_facing, v_to_ent);
                if (n_dot < n_dot_check) {
                    b_behind = 1;
                    if (!(n_mode & 1)) {
                        n_tests_passed++;
                        continue;
                    }
                }
            }
            if (n_mode & 4) {
                if (!self sightconetrace(v_eye, isdefined(player getvehicleoccupied()) ? player getvehicleoccupied() : player)) {
                    if (b_behind || !(n_mode & 1)) {
                        n_tests_passed++;
                    }
                }
            }
        }
        if (n_tests_passed == level.players.size) {
            n_test_count++;
            if (n_test_count < n_tests_to_do) {
                continue;
            }
            self notify(#"_disable_reinforcement");
            self delete();
            continue;
        }
        n_test_count = 0;
    }
}

// Namespace util/util_shared
// Params 5, eflags: 0x0
// Checksum 0xcb1c1338, Offset: 0x8c78
// Size: 0x436
function query_ents(&a_kvps_match, b_match_all = 1, &a_kvps_ingnore, b_ignore_spawners = 0, b_match_substrings = 0) {
    a_ret = [];
    if (b_match_substrings) {
        a_all_ents = arraycombine(getentarray(), level.struct, 0, 0);
        b_first = 1;
        foreach (v in a_kvps_match) {
            a_ents = _query_ents_by_substring_helper(a_all_ents, v.value, v.key, b_ignore_spawners);
            if (b_first) {
                a_ret = a_ents;
                b_first = 0;
                continue;
            }
            if (b_match_all) {
                a_ret = arrayintersect(a_ret, a_ents);
                continue;
            }
            a_ret = arraycombine(a_ret, a_ents, 0, 0);
        }
        if (isdefined(a_kvps_ingnore)) {
            foreach (k, v in a_kvps_ingnore) {
                a_ents = _query_ents_by_substring_helper(a_all_ents, v, k, b_ignore_spawners);
                a_ret = array::exclude(a_ret, a_ents);
            }
        }
    } else {
        b_first = 1;
        foreach (v in a_kvps_match) {
            a_ents = arraycombine(getentarray(v.value, v.key, b_ignore_spawners), struct::get_array(v.value, v.key), 0, 0);
            if (b_first) {
                a_ret = a_ents;
                b_first = 0;
                continue;
            }
            if (b_match_all) {
                a_ret = arrayintersect(a_ret, a_ents);
                continue;
            }
            a_ret = arraycombine(a_ret, a_ents, 0, 0);
        }
        if (isdefined(a_kvps_ingnore)) {
            foreach (k, v in a_kvps_ingnore) {
                a_ents = arraycombine(getentarray(v, k, b_ignore_spawners), struct::get_array(v, k), 0, 0);
                a_ret = array::exclude(a_ret, a_ents);
            }
        }
    }
    return a_ret;
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xcd1467e0, Offset: 0x90b8
// Size: 0x170
function _query_ents_by_substring_helper(&a_ents, str_value, str_key = "targetname", b_ignore_spawners = 0) {
    a_ret = [];
    foreach (ent in a_ents) {
        if (b_ignore_spawners && isspawner(ent)) {
            continue;
        }
        if (isstring(ent.(str_key)) && issubstr(ent.(str_key), str_value)) {
            if (!isdefined(a_ret)) {
                a_ret = [];
            } else if (!isarray(a_ret)) {
                a_ret = array(a_ret);
            }
            a_ret[a_ret.size] = ent;
        }
    }
    return a_ret;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xae7c1ef9, Offset: 0x9230
// Size: 0xa2
function get_weapon_by_name(weapon_name, var_2f3a032e) {
    split = [];
    if ("" != var_2f3a032e) {
        split = strtok(var_2f3a032e, "+");
    }
    if (split.size) {
        weapon = getweapon(weapon_name, split);
    } else {
        weapon = getweapon(weapon_name);
    }
    return weapon;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x44ed928, Offset: 0x92e0
// Size: 0x80
function function_2146bd83(weapon) {
    var_2f3a032e = "";
    for (i = 0; i < weapon.attachments.size; i++) {
        if (!i) {
            var_2f3a032e += "+";
        }
        var_2f3a032e += weapon.attachments[i];
    }
    return var_2f3a032e;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x9191d7a9, Offset: 0x9368
// Size: 0x6c
function function_4c1656d5() {
    if (sessionmodeiswarzonegame()) {
        return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
    }
    return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1cc41b54, Offset: 0x93e0
// Size: 0x124
function function_16fb0a3b() {
    if (sessionmodeiswarzonegame()) {
        if (getdvarint(#"hash_23a1d3a9139af42b", 0) > 0) {
            return getdvarfloat(#"hash_608e7bb0e9517884", 250);
        } else {
            return getdvarfloat(#"hash_4e7a02edee964bf9", 250);
        }
        return;
    }
    if (getdvarint(#"hash_23fac9a913e70c03", 0) > 0) {
        return getdvarfloat(#"hash_606c79b0e9348eb8", 250);
    }
    return getdvarfloat(#"hash_4ec50cedeed64871", 250);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1af84d4e, Offset: 0x9510
// Size: 0x6a
function is_female() {
    gender = self getplayergendertype(currentsessionmode());
    b_female = 0;
    if (isdefined(gender) && gender == "female") {
        b_female = 1;
    }
    return b_female;
}

// Namespace util/util_shared
// Params 6, eflags: 0x1 linked
// Checksum 0x4c15ee15, Offset: 0x9588
// Size: 0x168
function positionquery_pointarray(origin, minsearchradius, maxsearchradius, halfheight, innerspacing, reachableby_ent) {
    if (isdefined(reachableby_ent)) {
        queryresult = positionquery_source_navigation(origin, minsearchradius, maxsearchradius, halfheight, innerspacing, reachableby_ent);
    } else {
        queryresult = positionquery_source_navigation(origin, minsearchradius, maxsearchradius, halfheight, innerspacing);
    }
    pointarray = [];
    foreach (pointstruct in queryresult.data) {
        if (!isdefined(pointarray)) {
            pointarray = [];
        } else if (!isarray(pointarray)) {
            pointarray = array(pointarray);
        }
        pointarray[pointarray.size] = pointstruct.origin;
    }
    return pointarray;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe6d59c51, Offset: 0x96f8
// Size: 0x92
function totalplayercount() {
    count = 0;
    foreach (team, _ in level.teams) {
        count += level.playercount[team];
    }
    return count;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x1c3014d1, Offset: 0x9798
// Size: 0x20
function isrankenabled() {
    return isdefined(level.rankenabled) && level.rankenabled;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe1d9d4a2, Offset: 0x97c0
// Size: 0x20
function isoneround() {
    if (level.roundlimit == 1) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x47c1916c, Offset: 0x97e8
// Size: 0x1e
function isfirstround() {
    if (game.roundsplayed == 0) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xae4a5d5d, Offset: 0x9810
// Size: 0x40
function islastround() {
    if (level.roundlimit > 1 && game.roundsplayed >= level.roundlimit - 1) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x3cfac104, Offset: 0x9858
// Size: 0xc8
function waslastround() {
    if (level.forcedend) {
        return true;
    }
    if (isdefined(level.nextroundisovertime)) {
        if (level.nextroundisovertime) {
            level.nextroundisovertime = 1;
            return false;
        } else if (isdefined(game.overtime_round) && game.overtime_round > 0) {
            return true;
        }
    }
    if (hitroundlimit() || hitscorelimit() || hitroundwinlimit()) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x4d3e5c6c, Offset: 0x9928
// Size: 0x34
function hitroundlimit() {
    if (level.roundlimit <= 0) {
        return false;
    }
    return getroundsplayed() >= level.roundlimit;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa89bdf4, Offset: 0x9968
// Size: 0x94
function anyteamhitroundwinlimit() {
    foreach (team, _ in level.teams) {
        if (getroundswon(team) >= level.roundwinlimit) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc8443772, Offset: 0x9a08
// Size: 0xcc
function anyteamhitroundlimitwithdraws() {
    tie_wins = game.stat[#"roundswon"][#"tie"];
    foreach (team, _ in level.teams) {
        if (getroundswon(team) + tie_wins >= level.roundwinlimit) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf8a8a217, Offset: 0x9ae0
// Size: 0xbc
function function_385658da() {
    count = 0;
    foreach (team, _ in level.teams) {
        wins = getroundswon(team);
        if (!isdefined(count)) {
            count = wins;
            continue;
        }
        if (wins != count) {
            return false;
        }
    }
    return true;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x318680c4, Offset: 0x9ba8
// Size: 0x76
function hitroundwinlimit() {
    if (!isdefined(level.roundwinlimit) || level.roundwinlimit <= 0) {
        return false;
    }
    if (anyteamhitroundwinlimit()) {
        return true;
    }
    if (anyteamhitroundlimitwithdraws()) {
        if (!function_385658da()) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb8efb131, Offset: 0x9c28
// Size: 0x98
function any_team_hit_score_limit() {
    foreach (team, _ in level.teams) {
        if (game.stat[#"teamscores"][team] >= level.scorelimit) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xef52d445, Offset: 0x9cc8
// Size: 0xd0
function hitscorelimit() {
    if (level.scoreroundwinbased) {
        return false;
    }
    if (level.scorelimit <= 0) {
        return false;
    }
    if (level.teambased) {
        if (any_team_hit_score_limit()) {
            return true;
        }
    } else {
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (isdefined(player.pointstowin) && player.pointstowin >= level.scorelimit) {
                return true;
            }
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb7a18709, Offset: 0x9da0
// Size: 0x1e
function get_current_round_score_limit() {
    return level.roundscorelimit * (game.roundsplayed + 1);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x12aa06c7, Offset: 0x9dc8
// Size: 0xac
function any_team_hit_round_score_limit() {
    round_score_limit = get_current_round_score_limit();
    foreach (team, _ in level.teams) {
        if (game.stat[#"teamscores"][team] >= round_score_limit) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x76ef19b1, Offset: 0x9e80
// Size: 0xdc
function hitroundscorelimit() {
    if (level.roundscorelimit <= 0) {
        return false;
    }
    if (level.teambased) {
        if (any_team_hit_round_score_limit()) {
            return true;
        }
    } else {
        roundscorelimit = get_current_round_score_limit();
        for (i = 0; i < level.players.size; i++) {
            player = level.players[i];
            if (isdefined(player.pointstowin) && player.pointstowin >= roundscorelimit) {
                return true;
            }
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5f55d3ff, Offset: 0x9f68
// Size: 0x46
function getroundswon(team) {
    team = get_team_mapping(team);
    return game.stat[#"roundswon"][team];
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xc38bbe93, Offset: 0x9fb8
// Size: 0xe4
function getotherteamsroundswon(str_skip_team) {
    str_skip_team = get_team_mapping(str_skip_team);
    roundswon = 0;
    if (!isdefined(str_skip_team)) {
        return roundswon;
    }
    foreach (team, _ in level.teams) {
        if (team === str_skip_team) {
            continue;
        }
        roundswon += game.stat[#"roundswon"][team];
    }
    return roundswon;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x8b24cb58, Offset: 0xa0a8
// Size: 0xe
function getroundsplayed() {
    return game.roundsplayed;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x8454631, Offset: 0xa0c0
// Size: 0x36
function isroundbased() {
    if (level.roundlimit != 1 && level.roundwinlimit != 1) {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xe1817448, Offset: 0xa100
// Size: 0x2e
function getcurrentgamemode() {
    if (gamemodeismode(6)) {
        return "leaguematch";
    }
    return "publicmatch";
}

// Namespace util/util_shared
// Params 6, eflags: 0x1 linked
// Checksum 0x38ab7ca0, Offset: 0xa138
// Size: 0x196
function function_97cf7eb0(v_start, n_max_dist = 5000, n_ground_offset = 0, e_ignore, b_ignore_water = 0, b_ignore_glass = 0) {
    v_trace_start = v_start + (0, 0, 5);
    v_trace_end = v_trace_start + (0, 0, (n_max_dist + 5) * -1);
    a_trace = groundtrace(v_trace_start, v_trace_end, 0, e_ignore, b_ignore_water, b_ignore_glass);
    if (a_trace[#"surfacetype"] != "none") {
        return {#position:a_trace[#"position"] + (0, 0, n_ground_offset), #entity:a_trace[#"entity"]};
    }
    return {#position:v_start, #entity:a_trace[#"entity"]};
}

// Namespace util/util_shared
// Params 6, eflags: 0x0
// Checksum 0x222a5a8d, Offset: 0xa2d8
// Size: 0x9a
function ground_position(v_start, n_max_dist = 5000, n_ground_offset = 0, e_ignore, b_ignore_water = 0, b_ignore_glass = 0) {
    return function_97cf7eb0(v_start, n_max_dist, n_ground_offset, e_ignore, b_ignore_water, b_ignore_glass).position;
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0xd2c7ea75, Offset: 0xa380
// Size: 0x2a
function delayed_notify(str_notify, f_delay_seconds) {
    wait(f_delay_seconds);
    if (isdefined(self)) {
        self notify(str_notify);
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xca5c24dc, Offset: 0xa3b8
// Size: 0x6c
function delayed_delete(f_delay_seconds) {
    assert(isentity(self));
    wait(f_delay_seconds);
    if (isdefined(self) && isentity(self)) {
        self delete();
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x8eaa75df, Offset: 0xa430
// Size: 0x20
function is_safehouse() {
    mapname = get_map_name();
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x4e0aade, Offset: 0xa458
// Size: 0x2c
function is_new_cp_map() {
    mapname = get_map_name();
    switch (mapname) {
    default:
        return false;
    }
}

/#

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0xed1bb8a2, Offset: 0xa4b0
    // Size: 0x64
    function add_queued_debug_command(cmd) {
        if (!isdefined(level.dbg_cmd_queue)) {
            level thread queued_debug_commands();
        }
        if (isdefined(level.dbg_cmd_queue)) {
            array::push(level.dbg_cmd_queue, cmd);
        }
    }

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0x55430c35, Offset: 0xa520
    // Size: 0x17a
    function queued_debug_commands() {
        self notify(#"queued_debug_commands");
        self endon(#"queued_debug_commands");
        if (!isdefined(level.dbg_cmd_queue)) {
            level.dbg_cmd_queue = [];
        }
        while (true) {
            waitframe(1);
            if (!isdefined(game.state)) {
                continue;
            }
            if (game.state == "<dev string:x9be>") {
                continue;
            }
            if (level.dbg_cmd_queue.size == 0) {
                level.dbg_cmd_queue = undefined;
                return;
            }
            trickle = 0;
            if (level.players.size > 1) {
                trickle = 1;
            }
            for (var_1085858 = 12; (!trickle || var_1085858 > 0) && canadddebugcommand() && level.dbg_cmd_queue.size > 0; var_1085858--) {
                cmd = array::pop_front(level.dbg_cmd_queue, 0);
                adddebugcommand(cmd);
                if (trickle) {
                }
            }
        }
    }

#/

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5a23bfc6, Offset: 0xa6a8
// Size: 0x42
function array_copy_if_array(any_var) {
    return isarray(any_var) ? arraycopy(any_var) : any_var;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf46be649, Offset: 0xa6f8
// Size: 0x62
function is_item_purchased(ref) {
    itemindex = getitemindexfromref(ref);
    return itemindex < 0 || itemindex >= 256 ? 0 : self isitempurchased(itemindex);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3c5eda80, Offset: 0xa768
// Size: 0x3c
function has_purchased_perk_equipped(ref) {
    return self hasperk(ref) && self is_item_purchased(ref);
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb47b25b9, Offset: 0xa7b0
// Size: 0x66
function has_purchased_perk_equipped_with_specific_stat(single_perk_ref, stats_table_ref) {
    if (isplayer(self)) {
        return (self hasperk(single_perk_ref) && self is_item_purchased(stats_table_ref));
    }
    return 0;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xd8750ed, Offset: 0xa820
// Size: 0x22
function has_flak_jacket_perk_purchased_and_equipped() {
    return has_purchased_perk_equipped(#"specialty_flakjacket");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x804998cb, Offset: 0xa850
// Size: 0x32
function has_blind_eye_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_nottargetedbyairsupport", #"specialty_nottargetedbyairsupport|specialty_nokillstreakreticle");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc56f893a, Offset: 0xa890
// Size: 0x22
function has_ghost_perk_purchased_and_equipped() {
    return has_purchased_perk_equipped(#"specialty_gpsjammer");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5f9006, Offset: 0xa8c0
// Size: 0x32
function has_tactical_mask_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_stunprotection", #"specialty_stunprotection|specialty_flashprotection|specialty_proximityprotection");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x68f03ed9, Offset: 0xa900
// Size: 0x32
function has_hacker_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_showenemyequipment", #"specialty_showenemyequipment|specialty_showscorestreakicons|specialty_showenemyvehicles");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc92f8e5b, Offset: 0xa940
// Size: 0x32
function has_cold_blooded_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_nottargetedbyaitank", #"specialty_nottargetedbyaitank|specialty_nottargetedbyraps|specialty_nottargetedbysentry|specialty_nottargetedbyrobot|specialty_immunenvthermal");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x97725a72, Offset: 0xa980
// Size: 0x32
function has_hard_wired_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_immunecounteruav", #"specialty_immunecounteruav|specialty_immuneemp|specialty_immunetriggerc4|specialty_immunetriggershock|specialty_immunetriggerbetty|specialty_sixthsensejammer|specialty_trackerjammer|specialty_immunesmoke");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x89a832f5, Offset: 0xa9c0
// Size: 0x32
function has_gung_ho_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_sprintfire", #"specialty_sprintfire|specialty_sprintgrenadelethal|specialty_sprintgrenadetactical|specialty_sprintequipment");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x492640e5, Offset: 0xaa00
// Size: 0x32
function has_fast_hands_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_fastweaponswitch", #"specialty_fastweaponswitch|specialty_sprintrecovery|specialty_sprintfirerecovery");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x5a4ba19e, Offset: 0xaa40
// Size: 0x22
function has_scavenger_perk_purchased_and_equipped() {
    return has_purchased_perk_equipped(#"specialty_scavenger");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x19bc9c60, Offset: 0xaa70
// Size: 0x32
function has_jetquiet_perk_purchased_and_equipped() {
    return self has_purchased_perk_equipped_with_specific_stat(#"specialty_jetquiet", #"specialty_jetnoradar|specialty_jetquiet");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdce34be5, Offset: 0xaab0
// Size: 0x22
function has_awareness_perk_purchased_and_equipped() {
    return has_purchased_perk_equipped(#"specialty_loudenemies");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x584f2ccb, Offset: 0xaae0
// Size: 0x22
function has_ninja_perk_purchased_and_equipped() {
    return has_purchased_perk_equipped(#"specialty_quieter");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x991e30a, Offset: 0xab10
// Size: 0x22
function has_toughness_perk_purchased_and_equipped() {
    return has_purchased_perk_equipped(#"specialty_bulletflinch");
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x7085ac4b, Offset: 0xab40
// Size: 0x58
function str_strip_lh(str) {
    if (strendswith(str, "_lh")) {
        return getsubstr(str, 0, str.size - 3);
    }
    return str;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x86f0054a, Offset: 0xaba0
// Size: 0x176
function trackwallrunningdistance() {
    self endon(#"disconnect");
    self.movementtracking.wallrunning = spawnstruct();
    self.movementtracking.wallrunning.distance = 0;
    self.movementtracking.wallrunning.count = 0;
    self.movementtracking.wallrunning.time = 0;
    while (true) {
        self waittill(#"wallrun_begin");
        startpos = self.origin;
        starttime = gettime();
        self.movementtracking.wallrunning.count++;
        self waittill(#"wallrun_end");
        self.movementtracking.wallrunning.distance += distance(startpos, self.origin);
        self.movementtracking.wallrunning.time += gettime() - starttime;
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x1c23f2b8, Offset: 0xad20
// Size: 0x176
function tracksprintdistance() {
    self endon(#"disconnect");
    self.movementtracking.sprinting = spawnstruct();
    self.movementtracking.sprinting.distance = 0;
    self.movementtracking.sprinting.count = 0;
    self.movementtracking.sprinting.time = 0;
    while (true) {
        self waittill(#"sprint_begin");
        startpos = self.origin;
        starttime = gettime();
        self.movementtracking.sprinting.count++;
        self waittill(#"sprint_end");
        self.movementtracking.sprinting.distance += distance(startpos, self.origin);
        self.movementtracking.sprinting.time += gettime() - starttime;
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0xb822e56c, Offset: 0xaea0
// Size: 0x176
function trackdoublejumpdistance() {
    self endon(#"disconnect");
    self.movementtracking.doublejump = spawnstruct();
    self.movementtracking.doublejump.distance = 0;
    self.movementtracking.doublejump.count = 0;
    self.movementtracking.doublejump.time = 0;
    while (true) {
        self waittill(#"doublejump_begin");
        startpos = self.origin;
        starttime = gettime();
        self.movementtracking.doublejump.count++;
        self waittill(#"doublejump_end");
        self.movementtracking.doublejump.distance += distance(startpos, self.origin);
        self.movementtracking.doublejump.time += gettime() - starttime;
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf55c0c98, Offset: 0xb020
// Size: 0x70
function getplayspacecenter() {
    minimaporigins = getentarray("minimap_corner", "targetname");
    if (minimaporigins.size) {
        return math::find_box_center(minimaporigins[0].origin, minimaporigins[1].origin);
    }
    return (0, 0, 0);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf800ffed, Offset: 0xb098
// Size: 0xde
function getplayspacemaxwidth() {
    minimaporigins = getentarray("minimap_corner", "targetname");
    if (minimaporigins.size) {
        x = abs(minimaporigins[0].origin[0] - minimaporigins[1].origin[0]);
        y = abs(minimaporigins[0].origin[1] - minimaporigins[1].origin[1]);
        return max(x, y);
    }
    return 0;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe0b0c314, Offset: 0xb180
// Size: 0x8c
function getteammask(team) {
    team = get_team_mapping(team);
    if (!level.teambased || !isdefined(team) || !isdefined(level.spawnsystem.ispawn_teammask[team])) {
        return level.spawnsystem.ispawn_teammask_free;
    }
    return level.spawnsystem.ispawn_teammask[team];
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xf2d564dc, Offset: 0xb218
// Size: 0xac
function getotherteam(team) {
    team = get_team_mapping(team);
    if (team == #"allies") {
        return #"axis";
    } else if (team == #"axis") {
        return #"allies";
    } else {
        return #"allies";
    }
    assertmsg("<dev string:x9c8>" + team);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5426e16e, Offset: 0xb2d0
// Size: 0xd8
function getotherteamsmask(str_skip_team) {
    str_skip_team = get_team_mapping(str_skip_team);
    mask = 0;
    if (!isdefined(str_skip_team)) {
        return mask;
    }
    foreach (team, _ in level.teams) {
        if (team === str_skip_team) {
            continue;
        }
        mask |= getteammask(team);
    }
    return mask;
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x82b29c1d, Offset: 0xb3b0
// Size: 0x20
function waittill_can_add_debug_command() {
    while (!canadddebugcommand()) {
        waitframe(1);
    }
}

/#

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0x67794aa5, Offset: 0xb3d8
    // Size: 0x3c
    function add_debug_command(cmd) {
        waittill_can_add_debug_command();
        adddebugcommand(cmd);
    }

#/

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x55487da5, Offset: 0xb420
// Size: 0x162
function get_players(team = #"any") {
    arrayremovevalue(level.players, undefined, 0);
    if (team == #"any") {
        return arraycopy(level.players);
    }
    assert(isdefined(level.teams[team]), "<dev string:x9e6>" + function_9e72a96(team) + "<dev string:x9ea>");
    players = [];
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.team === team) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x126e3dfb, Offset: 0xb590
// Size: 0x17c
function get_active_players(team = #"any") {
    /#
        if (team != #"any") {
            assert(isdefined(level.teams[team]), "<dev string:x9e6>" + function_9e72a96(team) + "<dev string:x9ea>");
        }
    #/
    arrayremovevalue(level.activeplayers, undefined, 0);
    players = [];
    foreach (player in level.activeplayers) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(team) || team == #"any" || player.team === team) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x7db6923c, Offset: 0xb718
// Size: 0x16a
function function_81ccf6d3(team = #"any") {
    players = get_active_players();
    if (team == #"any") {
        return players;
    }
    assert(isdefined(level.teams[team]), "<dev string:x9e6>" + function_9e72a96(team) + "<dev string:x9ea>");
    enemies = [];
    foreach (player in players) {
        if (isdefined(player) && isdefined(player.team) && function_fbce7263(player.team, team)) {
            enemies[enemies.size] = player;
        }
    }
    return enemies;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x26f6da1, Offset: 0xb890
// Size: 0xe0
function get_human_players(team = #"any") {
    players = getplayers(team);
    humanplayers = [];
    foreach (player in players) {
        if (!isbot(player)) {
            humanplayers[humanplayers.size] = player;
        }
    }
    return humanplayers;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa17abd63, Offset: 0xb978
// Size: 0x4c
function function_8e89351(player) {
    return isdefined(player) && !isbot(player) && isinarray(level.players, player);
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xb26a013e, Offset: 0xb9d0
// Size: 0xe0
function get_bot_players(team = #"any") {
    players = get_players(team);
    botplayers = [];
    foreach (player in players) {
        if (isbot(player)) {
            botplayers[botplayers.size] = player;
        }
    }
    return botplayers;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x699cd60, Offset: 0xbab8
// Size: 0x52
function is_game_solo(team = #"any") {
    humanplayers = get_human_players(team);
    return humanplayers.size == 1;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xa7e55e21, Offset: 0xbb18
// Size: 0x52
function is_game_coop(team = #"any") {
    humanplayers = get_human_players(team);
    return humanplayers.size > 1;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x473c7614, Offset: 0xbb78
// Size: 0x38
function function_cfa8b8df(team) {
    players = get_players(team);
    return players.size > 0;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x25024f7f, Offset: 0xbbb8
// Size: 0x38
function function_cda17472(team) {
    players = get_human_players(team);
    return players.size > 0;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x417fd4aa, Offset: 0xbbf8
// Size: 0x1c
function timesince(starttimeinmilliseconds) {
    return (gettime() - starttimeinmilliseconds) * 0.001;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x53d62fbd, Offset: 0xbc20
// Size: 0x1a
function cooldowninit() {
    if (!isdefined(self._cooldown)) {
        self._cooldown = [];
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x29225004, Offset: 0xbc48
// Size: 0x56
function cooldown(name, time_seconds) {
    cooldowninit();
    self._cooldown[name] = gettime() + int(time_seconds * 1000);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x69692d6, Offset: 0xbca8
// Size: 0x54
function getcooldowntimeraw(name) {
    cooldowninit();
    if (!isdefined(self._cooldown[name])) {
        self._cooldown[name] = gettime() - 1;
    }
    return self._cooldown[name];
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x6c0ee957, Offset: 0xbd08
// Size: 0x40
function getcooldownleft(name) {
    cooldowninit();
    return (getcooldowntimeraw(name) - gettime()) * 0.001;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2c480c49, Offset: 0xbd50
// Size: 0x7c
function iscooldownready(name, timeforward_seconds) {
    cooldowninit();
    if (!isdefined(timeforward_seconds)) {
        timeforward_seconds = 0;
    }
    cooldownreadytime = self._cooldown[name];
    return !isdefined(cooldownreadytime) || gettime() + int(timeforward_seconds * 1000) > cooldownreadytime;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x8ee1ae32, Offset: 0xbdd8
// Size: 0x36
function clearcooldown(name) {
    cooldowninit();
    self._cooldown[name] = gettime() - 1;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xa092a62b, Offset: 0xbe18
// Size: 0x6e
function addcooldowntime(name, time_seconds) {
    cooldowninit();
    self._cooldown[name] = getcooldowntimeraw(name) + int(time_seconds * 1000);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x28cad00a, Offset: 0xbe90
// Size: 0x8a
function clearallcooldowns() {
    if (isdefined(self._cooldown)) {
        foreach (str_name, cooldown in self._cooldown) {
            self._cooldown[str_name] = gettime() - 1;
        }
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xdf498b69, Offset: 0xbf28
// Size: 0x64
function private function_4627b63d(alias) {
    assert(isdefined(level.team_mapping_alias));
    assert(isdefined(level.team_mapping_alias[alias]));
    return level.team_mapping_alias[alias];
}

// Namespace util/util_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xc948931d, Offset: 0xbf98
// Size: 0xc4
function private function_3cb7a62d() {
    assert(isdefined(level.team_mapping));
    if (get_team_mapping("sidea") == #"allies" && get_team_mapping("sideb") == #"axis") {
        level clientfield::set("cf_team_mapping", 1);
        return;
    }
    level clientfield::set("cf_team_mapping", 0);
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x1ef68a5a, Offset: 0xc068
// Size: 0x22c
function function_73fab74d() {
    if (isdefined(level.var_1bbf77be)) {
        return;
    }
    level.var_1bbf77be = 1;
    function_9db3109f(#"allies", #"allies");
    function_9db3109f(#"axis", #"axis");
    function_9db3109f(#"allies", "wun");
    function_9db3109f(#"axis", "fpa");
    function_9db3109f(#"team3", "side3");
    function_d3e0802c("sidea", "sideb");
    function_d3e0802c("teama", "teamb");
    function_d3e0802c("attacker", "defender");
    function_d3e0802c("attackers", "defenders");
    function_d3e0802c("wun", "fpa");
    function_c16f65a3(#"allies", #"axis");
    function_c16f65a3(#"team3", #"any");
    set_team_mapping(#"allies", #"axis");
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc434ec16, Offset: 0xc2a0
// Size: 0x36
function function_f9ce1d49() {
    if (isdefined(level.var_fdf974de)) {
        return;
    }
    level.var_fdf974de = array();
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x8d538b6d, Offset: 0xc2e0
// Size: 0x2c
function function_d7e70327(var_23866d2) {
    array::add(level.var_fdf974de, var_23866d2);
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x247da173, Offset: 0xc318
// Size: 0xa0
function function_3d66774c(var_23866d2) {
    foreach (i, v in level.var_fdf974de) {
        if (array::function_460f3c24(v, var_23866d2)) {
            array::remove_index(i);
        }
    }
}

// Namespace util/util_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x5b9ad59f, Offset: 0xc3c0
// Size: 0x12c
function function_9b7092ef(team1, team2, team3, team4) {
    if (!isdefined(team1) || !isdefined(team2)) {
        return false;
    }
    foreach (var_ef54b214 in level.var_fdf974de) {
        if (array::contains(var_ef54b214, team1)) {
            if (array::contains(var_ef54b214, team2)) {
                if (!isdefined(team3) || array::contains(var_ef54b214, team3)) {
                    if (!isdefined(team4) || array::contains(var_ef54b214, team4)) {
                        return true;
                    }
                }
            }
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb12f6105, Offset: 0xc4f8
// Size: 0x104
function set_team_mapping(var_b0dd114d, var_54495823) {
    var_b0dd114d = function_4627b63d(var_b0dd114d);
    var_54495823 = function_4627b63d(var_54495823);
    assert(var_b0dd114d != var_54495823, "<dev string:xa07>");
    level.team_mapping[0] = var_b0dd114d;
    level.team_mapping[1] = var_54495823;
    flagsys::set(#"team_mapping_set");
    game.attackers = var_b0dd114d;
    game.defenders = var_54495823;
    if (clientfield::can_set()) {
        function_3cb7a62d();
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xca4f0fc8, Offset: 0xc608
// Size: 0x6a
function function_d3e0802c(var_1dc5879e, var_128bf12b) {
    assert(var_1dc5879e != var_128bf12b, "<dev string:xa54>");
    level.var_af68e94e[var_1dc5879e] = 0;
    level.var_af68e94e[var_128bf12b] = 1;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x48595d94, Offset: 0xc680
// Size: 0x6a
function function_c16f65a3(enemy_a, enemy_b) {
    assert(enemy_a != enemy_b, "<dev string:xa9e>");
    level.team_enemy_mapping[enemy_a] = enemy_b;
    level.team_enemy_mapping[enemy_b] = enemy_a;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x3f9904c2, Offset: 0xc6f8
// Size: 0x82
function function_9db3109f(team, alias) {
    assert(team == #"allies" || team == #"axis" || team == #"team3");
    level.team_mapping_alias[alias] = team;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xa0e696d6, Offset: 0xc788
// Size: 0xb2
function get_team_mapping(team) {
    assert(isdefined(level.team_mapping));
    assert(isdefined(level.var_af68e94e));
    if (isdefined(team)) {
        if (isdefined(level.var_af68e94e[team])) {
            return level.team_mapping[level.var_af68e94e[team]];
        } else if (isdefined(level.team_mapping_alias[team])) {
            return level.team_mapping_alias[team];
        }
    }
    return team;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xa810279f, Offset: 0xc848
// Size: 0xc4
function function_310d70e2(team) {
    assert(isdefined(level.team_mapping));
    assert(isdefined(level.var_af68e94e));
    if (isdefined(team)) {
        if (team === level.team_mapping[level.var_af68e94e[#"sidea"]]) {
            return "sidea";
        } else if (team === level.team_mapping[level.var_af68e94e[#"sideb"]]) {
            return "sideb";
        }
    }
    return team;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb70c9684, Offset: 0xc918
// Size: 0x34
function is_on_side(team) {
    return self getteam() === get_team_mapping(team);
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5fe6b512, Offset: 0xc958
// Size: 0x62
function get_enemy_team(team) {
    team = get_team_mapping(team);
    if (!isdefined(team)) {
        return undefined;
    }
    if (isdefined(level.team_enemy_mapping[team])) {
        return level.team_enemy_mapping[team];
    }
    return #"none";
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2747df82, Offset: 0xc9c8
// Size: 0x32
function get_game_type() {
    return tolower(getdvarstring(#"g_gametype"));
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x24aa524, Offset: 0xca08
// Size: 0x32
function get_map_name() {
    return tolower(getdvarstring(#"sv_mapname"));
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc8a51926, Offset: 0xca48
// Size: 0x1c
function is_frontend_map() {
    return get_map_name() === "core_frontend";
}

/#

    // Namespace util/util_shared
    // Params 2, eflags: 0x0
    // Checksum 0xbf4797fd, Offset: 0xca70
    // Size: 0x54
    function add_devgui(menu_path, commands) {
        add_queued_debug_command("<dev string:xae1>" + menu_path + "<dev string:x1ac>" + commands + "<dev string:xaf0>");
    }

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0x5050044e, Offset: 0xcad0
    // Size: 0x3c
    function remove_devgui(menu_path) {
        add_queued_debug_command("<dev string:xaf5>" + menu_path + "<dev string:xaf0>");
    }

    // Namespace util/util_shared
    // Params 2, eflags: 0x0
    // Checksum 0x797bedf4, Offset: 0xcb18
    // Size: 0x54
    function function_3f749abc(menu_path, commands) {
        add_debug_command("<dev string:xae1>" + menu_path + "<dev string:x1ac>" + commands + "<dev string:xaf0>");
    }

    // Namespace util/util_shared
    // Params 1, eflags: 0x0
    // Checksum 0xc8e07183, Offset: 0xcb78
    // Size: 0x3c
    function function_85c62761(menu_path) {
        add_debug_command("<dev string:xaf5>" + menu_path + "<dev string:xaf0>");
    }

#/

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd4096d09, Offset: 0xcbc0
// Size: 0xba
function gadget_is_in_use(slot) {
    if (isdefined(self._gadgets_player) && isdefined(self._gadgets_player[slot])) {
        if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type])) {
            if (isdefined(level._gadgets_level[self._gadgets_player[slot].gadget_type].isinuse)) {
                return self [[ level._gadgets_level[self._gadgets_player[slot].gadget_type].isinuse ]](slot);
            }
        }
    }
    return self gadgetisactive(slot);
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xd580bb3c, Offset: 0xcc88
// Size: 0xa2
function function_72cbea07(player, weapon) {
    if (!isdefined(player.var_9c4683a0)) {
        return false;
    }
    foreach (var_e64f4a4a in player.var_9c4683a0) {
        if (var_e64f4a4a == weapon) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb377f93f, Offset: 0xcd38
// Size: 0x5c
function ghost_wait_show(wait_time = 0.1) {
    self endon(#"death");
    self ghost();
    wait(wait_time);
    self show();
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x6d21f529, Offset: 0xcda0
// Size: 0x124
function ghost_wait_show_to_player(player, wait_time = 0.1, self_endon_string1) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self.abort_ghost_wait_show_to_player = undefined;
    if (isdefined(player)) {
        player endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    }
    if (isdefined(self_endon_string1)) {
        self endon(self_endon_string1);
    }
    self ghost();
    self setinvisibletoall();
    self setvisibletoplayer(player);
    wait(wait_time);
    if (!isdefined(self.abort_ghost_wait_show_to_player)) {
        self showtoplayer(player);
    }
}

// Namespace util/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x57d71788, Offset: 0xced0
// Size: 0x124
function ghost_wait_show_to_others(player, wait_time = 0.1, self_endon_string1) {
    if (!isdefined(self)) {
        return;
    }
    self endon(#"death");
    self.abort_ghost_wait_show_to_others = undefined;
    if (isdefined(player)) {
        player endon(#"death", #"disconnect", #"joined_team", #"joined_spectators");
    }
    if (isdefined(self_endon_string1)) {
        self endon(self_endon_string1);
    }
    self ghost();
    self setinvisibletoplayer(player);
    wait(wait_time);
    if (!isdefined(self.abort_ghost_wait_show_to_others)) {
        self show();
        self setinvisibletoplayer(player);
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x5310ed87, Offset: 0xd000
// Size: 0x1f4
function show_hit_marker(var_554cb812 = 0, var_1ed250ec = 0) {
    if (isplayer(self)) {
        if (isdefined(self) && isdefined(self.hud_damagefeedback)) {
            /#
                currenttime = gettime();
                if ((isdefined(self.hud_damagefeedback.time) ? self.hud_damagefeedback.time : 0) != currenttime || !(isdefined(self.hud_damagefeedback.feedback_dead) && self.hud_damagefeedback.feedback_dead)) {
                    if (var_554cb812) {
                        self.hud_damagefeedback setshader(#"damage_feedback_glow_orange", 24, 48);
                        self.hud_damagefeedback.feedback_dead = 1;
                    } else {
                        self.hud_damagefeedback setshader(#"damage_feedback", 24, 48);
                        self.hud_damagefeedback.feedback_dead = 0;
                    }
                    self.hud_damagefeedback.alpha = 1;
                    self.hud_damagefeedback fadeovertime(1);
                    self.hud_damagefeedback.alpha = 0;
                    self.hud_damagefeedback.time = currenttime;
                }
            #/
            return;
        }
        if (isdefined(self) && !isdefined(self.hud_damagefeedback)) {
            self thread _show_hit_marker(var_554cb812, var_1ed250ec);
        }
    }
}

// Namespace util/util_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xe0355944, Offset: 0xd200
// Size: 0xa0
function private _show_hit_marker(var_554cb812, var_1ed250ec) {
    self endon(#"death");
    if (!isdefined(self.var_9a94bf1)) {
        self.var_9a94bf1 = 0;
    }
    if (self.var_9a94bf1 < 5) {
        self.var_9a94bf1++;
        self playhitmarker(undefined, 5, undefined, var_554cb812, var_1ed250ec);
        wait_network_frame();
        self.var_9a94bf1--;
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xfed4ef57, Offset: 0xd2a8
// Size: 0x9c
function function_5d36c37a(str_tag = "tag_aim_target") {
    if (!issentient(self) && !function_ffa5b184(self)) {
        if (isdefined(self gettagorigin(str_tag))) {
            self function_2baad8fc(str_tag);
            return;
        }
        self function_2baad8fc();
    }
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x41ba823e, Offset: 0xd350
// Size: 0x34
function make_sentient() {
    if (!issentient(self)) {
        self makesentient();
    }
}

// Namespace util/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xdaf00cac, Offset: 0xd390
// Size: 0x3c
function function_f9af3d43(time) {
    self endon(#"death");
    wait(time);
    self delete();
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x96257a3a, Offset: 0xd3d8
// Size: 0x6c
function is_party_gamemode() {
    switch (level.gametype) {
    case #"sas":
    case #"oic":
    case #"shrp":
    case #"gun":
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x8ee82209, Offset: 0xd450
// Size: 0xe
function get_gametype_name() {
    return level.gametype;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xdc4a8b6, Offset: 0xd468
// Size: 0x9c
function cleanup_fancycam() {
    self endon(#"disconnect");
    if (isplayer(self) && !isbot(self)) {
        wait_network_frame();
        self function_eb0dd56(0);
        wait_network_frame();
        self function_eb0dd56(0);
    }
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0x5ff26e46, Offset: 0xd510
// Size: 0x82
function set_dvar_if_unset(dvar, value, reset = 0) {
    if (reset || getdvarstring(dvar) == "") {
        setdvar(dvar, value);
        return value;
    }
    return getdvarstring(dvar);
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0xb462e86, Offset: 0xd5a0
// Size: 0x82
function set_dvar_float_if_unset(dvar, value, reset = 0) {
    if (reset || getdvarstring(dvar) == "") {
        setdvar(dvar, value);
    }
    return getdvarfloat(dvar, 0);
}

// Namespace util/util_shared
// Params 3, eflags: 0x0
// Checksum 0x1ef4dd7a, Offset: 0xd630
// Size: 0x9a
function set_dvar_int_if_unset(dvar, value, reset = 0) {
    if (reset || getdvarstring(dvar) == "") {
        setdvar(dvar, value);
        return int(value);
    }
    return getdvarint(dvar, 0);
}

/#

    // Namespace util/util_shared
    // Params 0, eflags: 0x0
    // Checksum 0xf049f02, Offset: 0xd6d8
    // Size: 0x64
    function debug_slow_heli_speed() {
        if (getdvarint(#"scr_slow_heli", 0) > 0) {
            self setspeed(getdvarint(#"scr_slow_heli", 0));
        }
    }

#/

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x7929dafd, Offset: 0xd748
// Size: 0x94
function function_fb80e9ca() {
    n_timeout = 0;
    self flagsys::set(#"hash_157310a25dd4e508");
    if (isdefined(self.var_68d6a816)) {
        n_timeout = self.var_68d6a816;
    }
    flag::function_5f02becb(n_timeout);
    self script_delay();
    self flagsys::clear(#"hash_157310a25dd4e508");
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x94b17095, Offset: 0xd7e8
// Size: 0x7a
function function_74f2b2e9() {
    return isdefined(self.script_flag_true) || isdefined(self.script_flag_false) || isdefined(self.script_delay) && self.script_delay > 0 || isdefined(self.script_delay_min) && self.script_delay_min > 0 || isdefined(self.script_delay_max) && self.script_delay_max > 0;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1aa35c9b, Offset: 0xd870
// Size: 0x126
function function_d2dd4134(str_value, str_key) {
    a_targets = [];
    if (!isdefined(str_key)) {
        str_key = "targetname";
    }
    if (isdefined(str_value)) {
        var_c747e345 = strtok(str_value, " ");
        foreach (var_2fd77a2f in var_c747e345) {
            a_targets = arraycombine(a_targets, getentarray(var_2fd77a2f, str_key), 0, 0);
            a_targets = arraycombine(a_targets, struct::get_array(var_2fd77a2f, str_key), 0, 0);
        }
    }
    return a_targets;
}

// Namespace util/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf57932a, Offset: 0xd9a0
// Size: 0x136
function get_array(str_value, str_key = "targetname") {
    a_targets = function_d2dd4134(str_value, str_key);
    if (isdefined(str_value)) {
        var_c747e345 = strtok(str_value, " ");
        foreach (var_2fd77a2f in var_c747e345) {
            a_targets = arraycombine(a_targets, getvehiclenodearray(var_2fd77a2f, str_key), 0, 0);
            a_targets = arraycombine(a_targets, getnodearray(var_2fd77a2f, str_key), 0, 0);
        }
    }
    return a_targets;
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0x990a4183, Offset: 0xdae0
// Size: 0x52
function function_a1281365(radius) {
    if (!isdefined(radius) || radius <= 0) {
        return 0;
    }
    return randomfloatrange(radius * -1, radius);
}

// Namespace util/util_shared
// Params 1, eflags: 0x0
// Checksum 0xae5d6042, Offset: 0xdb40
// Size: 0x42
function function_8eb53136(radius) {
    if (!isdefined(radius) || radius <= 0) {
        return 0;
    }
    return randomintrangeinclusive(radius * -1, radius);
}

// Namespace util/util_shared
// Params 0, eflags: 0x0
// Checksum 0x43a25827, Offset: 0xdb90
// Size: 0x28
function is_spectating() {
    if (self.sessionstate == #"spectator") {
        return true;
    }
    return false;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x8a8de992, Offset: 0xdbc0
// Size: 0x7c
function function_8570168d() {
    /#
        if (getdvar(#"hash_49e94b7aefac4f49", 0)) {
            return true;
        }
    #/
    if (sessionmodeismultiplayergame()) {
        mode = function_bea73b01();
        if (mode == 4) {
            return true;
        }
    }
    return false;
}

// Namespace util/util_shared
// Params 2, eflags: 0x0
// Checksum 0xd6d48c0c, Offset: 0xdc48
// Size: 0x13a
function function_88c74107(var_2cd16289 = "ufo", var_e7245730 = "noclip") {
    var_bf8813f9 = 0;
    if (self == level) {
        a_players = getplayers();
        var_bf8813f9 = 0;
        foreach (player in a_players) {
            if (player isinmovemode("ufo", "noclip")) {
                var_bf8813f9 = 1;
                break;
            }
        }
    } else if (self isinmovemode("ufo", "noclip")) {
        var_bf8813f9 = 1;
    }
    return var_bf8813f9;
}

// Namespace util/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xc5399f8b, Offset: 0xdd90
// Size: 0x134
function function_22bf0a4a() {
    profilestart();
    player = self;
    if (level.var_e6f2a0c9 === 1) {
        profilestop();
        return;
    }
    if (getdvarstring(#"loot_special_contract_bundle", "") != "community_galil_achievement") {
        profilestop();
        return;
    }
    if (!gamemodeismode(0) && !gamemodeismode(6)) {
        profilestop();
        return;
    }
    if (level.var_903e2252 === 1) {
        profilestop();
        return;
    }
    if (!isdefined(player)) {
        profilestop();
        return;
    }
    if (!isplayer(player)) {
        profilestop();
        return;
    }
    player function_cce105c8(#"hash_243e425916855df3", 1, getdvarint(#"hash_4f52cc2f30dbbb9", 1));
    level.var_e6f2a0c9 = 1;
    profilestop();
}

#namespace namespace_2e6206f9;

// Namespace namespace_2e6206f9/util_shared
// Params 3, eflags: 0x21 linked
// Checksum 0x5d00a5e6, Offset: 0xded0
// Size: 0x2dc
function register_callback(str_kvp, func, ...) {
    var_a12e87bd = hash(str_kvp);
    var_bcb861f = self.(str_kvp + "_target");
    if (isdefined(var_bcb861f)) {
        if (!isdefined(mission.var_232d57d8)) {
            mission.var_232d57d8 = [];
        }
        if (!isdefined(mission.var_232d57d8[var_a12e87bd])) {
            mission.var_232d57d8[var_a12e87bd] = [];
        }
        if (!isdefined(self.var_c18fbf49)) {
            self.var_c18fbf49 = [];
        }
        s_callback = {#func:func, #params:vararg};
        self.var_c18fbf49[var_a12e87bd] = s_callback;
        var_c747e345 = strtok(var_bcb861f, " ");
        foreach (var_5afcf8a3 in var_c747e345) {
            if (!isdefined(mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)])) {
                mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)] = [];
            } else if (!isarray(mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)])) {
                mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)] = array(mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)]);
            }
            mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)][mission.var_232d57d8[var_a12e87bd][hash(var_5afcf8a3)].size] = self;
        }
        self thread function_d608a743();
    }
}

// Namespace namespace_2e6206f9/util_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xdc25dbd2, Offset: 0xe1b8
// Size: 0x2cc
function register_custom_callback(str_name, str_kvp, func) {
    var_ce100229 = hash(str_name);
    var_bcb861f = self.(str_kvp + "_target");
    if (isdefined(var_bcb861f)) {
        if (!isdefined(mission.var_232d57d8)) {
            mission.var_232d57d8 = [];
        }
        if (!isdefined(mission.var_232d57d8[var_ce100229])) {
            mission.var_232d57d8[var_ce100229] = [];
        }
        if (!isdefined(self.var_c18fbf49)) {
            self.var_c18fbf49 = [];
        }
        s_callback = {#func:func};
        self.var_c18fbf49[var_ce100229] = s_callback;
        var_c747e345 = strtok(var_bcb861f, " ");
        foreach (var_5afcf8a3 in var_c747e345) {
            if (!isdefined(mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)])) {
                mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)] = [];
            } else if (!isarray(mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)])) {
                mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)] = array(mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)]);
            }
            mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)][mission.var_232d57d8[var_ce100229][hash(var_5afcf8a3)].size] = self;
        }
        self thread function_d608a743();
    }
}

// Namespace namespace_2e6206f9/util_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd643da5a, Offset: 0xe490
// Size: 0x150
function function_d608a743() {
    self notify(#"hash_29bf696e43d4a08b");
    self endon(#"hash_29bf696e43d4a08b", #"death");
    a_str_notifies = getarraykeys(self.var_c18fbf49);
    while (true) {
        s_result = self waittill(a_str_notifies);
        s_callback = self.var_c18fbf49[hash(s_result._notify)];
        if (isdefined(s_callback.params)) {
            util::single_thread_argarray(self, s_callback.func, s_callback.params);
            continue;
        }
        if (isdefined(s_result.params)) {
            util::single_thread_argarray(self, s_callback.func, s_result.params);
            continue;
        }
        util::single_thread_argarray(self, s_callback.func);
    }
}

// Namespace namespace_2e6206f9/util_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbbd1002, Offset: 0xe5e8
// Size: 0x20c
function function_7ed1d198(str_kvp, str_name) {
    a_s_result = [];
    if (isdefined(mission.var_232d57d8)) {
        var_ce100229 = hash(isdefined(str_name) ? str_name : str_kvp);
        var_7ac3e82f = mission.var_232d57d8[var_ce100229];
        if (isdefined(var_7ac3e82f)) {
            var_bcb861f = self.(str_kvp + "_src");
            if (isdefined(var_bcb861f)) {
                var_c747e345 = strtok(var_bcb861f, " ");
                foreach (var_5afcf8a3 in var_c747e345) {
                    var_85c1bb33 = var_7ac3e82f[hash(var_5afcf8a3)];
                    if (isdefined(var_85c1bb33)) {
                        foreach (var_8507e893 in var_85c1bb33) {
                            if (!isdefined(a_s_result)) {
                                a_s_result = [];
                            } else if (!isarray(a_s_result)) {
                                a_s_result = array(a_s_result);
                            }
                            a_s_result[a_s_result.size] = var_8507e893;
                        }
                    }
                }
            }
        }
    }
    return a_s_result;
}

// Namespace namespace_2e6206f9/util_shared
// Params 1, eflags: 0x0
// Checksum 0x52954944, Offset: 0xe800
// Size: 0xa0
function callback(str_kvp) {
    var_e028d750 = function_7ed1d198(str_kvp);
    if (var_e028d750.size) {
        foreach (var_8507e893 in var_e028d750) {
            var_8507e893 notify(str_kvp);
        }
    }
}

// Namespace namespace_2e6206f9/util_shared
// Params 3, eflags: 0x20
// Checksum 0xe9a80f99, Offset: 0xe8a8
// Size: 0xca
function custom_callback(str_name, str_kvp, ...) {
    var_e028d750 = function_7ed1d198(str_kvp, str_name);
    if (var_e028d750.size) {
        foreach (var_8507e893 in var_e028d750) {
            var_8507e893 notify(str_name, {#params:vararg});
        }
    }
}

// Namespace namespace_2e6206f9/util_shared
// Params 0, eflags: 0x0
// Checksum 0x99a32d78, Offset: 0xe980
// Size: 0x1e
function function_4da758bf() {
    self.var_c18fbf49 = undefined;
    self notify(#"hash_29bf696e43d4a08b");
}

// Namespace namespace_2e6206f9/util_shared
// Params 1, eflags: 0x0
// Checksum 0x639998f2, Offset: 0xe9a8
// Size: 0x3a
function function_61e8e3c8(str_kvp) {
    return util::get_array(self.(str_kvp + "_target"), str_kvp + "_src");
}

// Namespace namespace_2e6206f9/util_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x8b6d639a, Offset: 0xe9f0
// Size: 0x3a
function get_target_structs(str_kvp) {
    return util::get_array(self.(str_kvp + "_src"), str_kvp + "_target");
}

