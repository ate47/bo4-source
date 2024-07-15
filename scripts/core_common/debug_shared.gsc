#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace debug;

/#

    // Namespace debug/debug_shared
    // Params 0, eflags: 0x2
    // Checksum 0x60a229c1, Offset: 0x80
    // Size: 0x3c
    function autoexec __init__system__() {
        system::register(#"debug", &__init__, undefined, undefined);
    }

    // Namespace debug/debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x15cb2699, Offset: 0xc8
    // Size: 0x34
    function __init__() {
        level thread debug_draw_tuning_sphere();
        level thread devgui_debug_key_value();
    }

    // Namespace debug/debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xc5f29cb2, Offset: 0x108
    // Size: 0x3d8
    function devgui_debug_key_value() {
        a_keys = array("<dev string:x38>", "<dev string:x41>", "<dev string:x4c>", "<dev string:x58>", "<dev string:x6c>", "<dev string:x79>", "<dev string:x89>", "<dev string:x96>", "<dev string:x9f>");
        setdvar(#"debug_key_value", 0);
        setdvar(#"debug_key_value_dist", 2000);
        adddebugcommand("<dev string:xa6>");
        adddebugcommand("<dev string:xf8>");
        foreach (str_key in a_keys) {
            adddebugcommand("<dev string:x144>" + str_key + "<dev string:x176>" + str_key + "<dev string:x190>");
        }
        while (!flag::exists("<dev string:x195>")) {
            util::wait_network_frame();
        }
        level flag::wait_till("<dev string:x195>");
        while (true) {
            debug_key_value = getdvar(#"debug_key_value", 0);
            if (debug_key_value != 0) {
                a_ents = getentarray();
                foreach (ent in a_ents) {
                    n_draw_dist = getdvarint(#"debug_key_value_dist", 0);
                    n_draw_dist_sq = n_draw_dist * n_draw_dist;
                    n_dist_sq = distancesquared(ent.origin, level.players[0].origin);
                    if (n_dist_sq <= n_draw_dist_sq) {
                        n_scale = mapfloat(0, 6250000, 0.5, 5, n_dist_sq);
                        ent thread debug_key_value(string(debug_key_value), undefined, n_scale);
                        continue;
                    }
                    ent notify(#"debug_key_value");
                }
            } else {
                level notify(#"debug_key_value");
            }
            wait(randomfloatrange(0.133333, 0.266667));
        }
    }

    // Namespace debug/debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x5ba307ad, Offset: 0x4e8
    // Size: 0x240
    function debug_draw_tuning_sphere() {
        n_sphere_radius = 0;
        v_text_position = (0, 0, 0);
        n_text_scale = 1;
        while (true) {
            n_sphere_radius = getdvarfloat(#"debug_measure_sphere_radius", 0);
            while (n_sphere_radius >= 1) {
                players = getplayers();
                if (isdefined(players[0])) {
                    n_sphere_radius = getdvarfloat(#"debug_measure_sphere_radius", 0);
                    circle(players[0].origin, n_sphere_radius, (1, 0, 0), 0, 1, 16);
                    n_text_scale = sqrt(n_sphere_radius * 2.5) / 2;
                    vforward = anglestoforward(players[0].angles);
                    v_text_position = players[0].origin + vforward * n_sphere_radius;
                    sides = int(10 * (1 + int(n_text_scale) % 100));
                    sphere(v_text_position, n_text_scale, (1, 0, 0), 1, 1, sides, 16);
                    print3d(v_text_position + (0, 0, 20), n_sphere_radius, (1, 0, 0), 1, n_text_scale / 14, 16);
                }
                waitframe(1);
            }
            wait(1);
        }
    }

    // Namespace debug/debug_shared
    // Params 3, eflags: 0x0
    // Checksum 0x6eb09c52, Offset: 0x730
    // Size: 0x156
    function debug_key_value(str_key, n_time, n_scale) {
        if (!isdefined(n_scale)) {
            n_scale = 1;
        }
        level endon(#"debug_key_value");
        self notify(#"debug_key_value");
        self endon(#"debug_key_value", #"death");
        if (isdefined(str_key)) {
            if (isdefined(n_time)) {
                __s = spawnstruct();
                __s endon(#"timeout");
                __s util::delay_notify(n_time, "<dev string:x1ac>");
            }
            while (true) {
                value = self.(str_key);
                if (isdefined(value)) {
                    print3d(self.origin, isdefined(value) ? "<dev string:x1b6>" + value : "<dev string:x1b6>", (0, 0, 1), 1, n_scale, 1);
                }
                waitframe(1);
            }
        }
    }

    // Namespace debug/debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x450483dc, Offset: 0x890
    // Size: 0x6c
    function drawdebuglineinternal(frompoint, topoint, color, durationframes) {
        for (i = 0; i < durationframes; i++) {
            line(frompoint, topoint, color);
            waitframe(1);
        }
    }

    // Namespace debug/debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x8e46c2b0, Offset: 0x908
    // Size: 0x94
    function drawdebugenttoentinternal(ent1, ent2, color, durationframes) {
        for (i = 0; i < durationframes; i++) {
            if (!isdefined(ent1) || !isdefined(ent2)) {
                return;
            }
            line(ent1.origin, ent2.origin, color);
            waitframe(1);
        }
    }

    // Namespace debug/debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0xcaf01b01, Offset: 0x9a8
    // Size: 0x4c
    function drawdebugline(frompoint, topoint, color, durationframes) {
        thread drawdebuglineinternal(frompoint, topoint, color, durationframes);
    }

    // Namespace debug/debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0xa987ecbb, Offset: 0xa00
    // Size: 0x4c
    function drawdebuglineenttoent(ent1, ent2, color, durationframes) {
        thread drawdebugenttoentinternal(ent1, ent2, color, durationframes);
    }

#/
