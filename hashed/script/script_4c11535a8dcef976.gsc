// Atian COD Tools GSC decompiler test
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace elevators;

// Namespace elevators
// Method(s) 18 Total 18
class class_727456f3 {

    var m_e_trigger;
    var m_s_bundle;
    var var_10b20309;
    var var_2af3d553;
    var var_66a89e93;
    var var_7c4021f5;
    var var_80896a28;
    var var_a2f96f78;
    var var_de7ae77;

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 1, eflags: 0x0
    // Checksum 0x6b39a806, Offset: 0x2ee8
    // Size: 0xa4
    function function_6ff61192(var_c0a091bc) {
        if (!self flag::get("elevator_moving")) {
            if (m_s_bundle.var_46d9acb0 == "auto_up" || m_s_bundle.var_46d9acb0 == "auto_down") {
                function_f81a904b(var_c0a091bc);
                return;
            }
            if (var_de7ae77 > 1) {
                function_f81a904b(var_c0a091bc);
            }
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 1, eflags: 0x0
    // Checksum 0x76c48c1b, Offset: 0x2e30
    // Size: 0xac
    function function_69474136(var_c0a091bc) {
        if (!self flag::get("elevator_moving")) {
            if (m_s_bundle.var_46d9acb0 == "auto_up" || m_s_bundle.var_46d9acb0 == "auto_down") {
                function_b6d6d989(var_c0a091bc);
                return;
            }
            if (var_de7ae77 < m_s_bundle.var_72b13147) {
                function_b6d6d989(var_c0a091bc);
            }
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 2, eflags: 0x0
    // Checksum 0xe44342d0, Offset: 0x2960
    // Size: 0x4c4
    function function_f81a904b(var_c0a091bc, var_d4d7abd5) {
        self flag::set("elevator_moving");
        if (isdefined(var_10b20309) && isdefined(var_10b20309.mdl_gameobject.b_enabled) && var_10b20309.mdl_gameobject.b_enabled) {
            var_10b20309 gameobjects::disable_object();
        }
        if (!(isdefined(var_d4d7abd5) && var_d4d7abd5)) {
            if (isdefined(m_s_bundle.var_7f25e190)) {
                var_2af3d553 playsound(m_s_bundle.var_7f25e190);
            }
            if (isdefined(m_s_bundle.var_b22fe167)) {
                if (!isdefined(var_80896a28)) {
                    var_80896a28 = spawn("script_origin", var_2af3d553.origin);
                    var_80896a28 linkto(var_2af3d553);
                }
                var_80896a28 stoploopsound();
                var_80896a28 playloopsound(m_s_bundle.var_b22fe167);
            }
        }
        if (var_66a89e93[var_de7ae77] === 1) {
            function_3cd190cf(var_de7ae77);
        }
        var_b66bd46e = 0;
        if (var_c0a091bc > var_de7ae77) {
            var_b66bd46e = var_c0a091bc - var_de7ae77;
        } else if (var_c0a091bc < var_de7ae77) {
            var_b66bd46e = var_de7ae77 - var_c0a091bc;
        }
        n_movetime = m_s_bundle.var_db3c84cf * var_b66bd46e;
        n_movetime = math::clamp(n_movetime, 1, 30);
        var_2af3d553 movez(-1 * m_s_bundle.var_a4446fd0 * var_b66bd46e, n_movetime, 0.1, 0.1);
        var_2af3d553 waittill(#"movedone");
        var_de7ae77 = var_c0a091bc;
        if (isdefined(var_80896a28)) {
            var_80896a28 stoploopsound();
        }
        if (isdefined(m_s_bundle.var_adef24b2)) {
            var_2af3d553 playsound(m_s_bundle.var_adef24b2);
        }
        self flag::clear("elevator_moving");
        if (isdefined(var_10b20309)) {
            var_10b20309.mdl_gameobject.interactteam = #"any";
            var_10b20309 gameobjects::enable_object();
        }
        function_a94c7265(var_c0a091bc);
        wait(isdefined(m_s_bundle.var_82e65b20) ? m_s_bundle.var_82e65b20 : 0);
        if (isdefined(m_s_bundle.var_fd4a26f0) && m_s_bundle.var_fd4a26f0 && m_s_bundle.var_46d9acb0 == "auto_down") {
            thread function_69474136(1);
        }
        if (m_s_bundle.var_46d9acb0 == "up_and_down") {
            if (var_7c4021f5.size >= 1) {
                var_c0a091bc = array::pop_front(var_7c4021f5);
                if (var_c0a091bc < var_de7ae77) {
                    thread function_6ff61192(var_c0a091bc);
                }
                if (var_c0a091bc > var_de7ae77) {
                    thread function_69474136(var_c0a091bc);
                }
            }
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 2, eflags: 0x0
    // Checksum 0xd0a1b604, Offset: 0x2498
    // Size: 0x4bc
    function function_b6d6d989(var_c0a091bc, var_d4d7abd5) {
        self flag::set("elevator_moving");
        if (isdefined(var_10b20309) && isdefined(var_10b20309.mdl_gameobject.b_enabled) && var_10b20309.mdl_gameobject.b_enabled) {
            var_10b20309 gameobjects::disable_object();
        }
        if (!(isdefined(var_d4d7abd5) && var_d4d7abd5)) {
            if (isdefined(m_s_bundle.var_7f25e190)) {
                var_2af3d553 playsound(m_s_bundle.var_7f25e190);
            }
            if (isdefined(m_s_bundle.var_b22fe167)) {
                if (!isdefined(var_80896a28)) {
                    var_80896a28 = spawn("script_origin", var_2af3d553.origin);
                    var_80896a28 linkto(var_2af3d553);
                }
                var_80896a28 stoploopsound();
                var_80896a28 playloopsound(m_s_bundle.var_b22fe167);
            }
        }
        if (var_66a89e93[var_de7ae77] === 1) {
            function_3cd190cf(var_de7ae77);
        }
        var_b66bd46e = 0;
        if (var_c0a091bc > var_de7ae77) {
            var_b66bd46e = var_c0a091bc - var_de7ae77;
        } else if (var_c0a091bc < var_de7ae77) {
            var_b66bd46e = var_de7ae77 - var_c0a091bc;
        }
        n_movetime = m_s_bundle.var_db3c84cf * var_b66bd46e;
        n_movetime = math::clamp(n_movetime, 1, 30);
        var_2af3d553 movez(m_s_bundle.var_a4446fd0 * var_b66bd46e, n_movetime, 0.1, 0.1);
        var_2af3d553 waittill(#"movedone");
        var_de7ae77 = var_c0a091bc;
        if (isdefined(var_80896a28)) {
            var_80896a28 stoploopsound();
        }
        if (isdefined(m_s_bundle.var_adef24b2)) {
            var_2af3d553 playsound(m_s_bundle.var_adef24b2);
        }
        self flag::clear("elevator_moving");
        if (isdefined(var_10b20309)) {
            var_10b20309.mdl_gameobject.interactteam = #"any";
            var_10b20309 gameobjects::enable_object();
        }
        function_a94c7265(var_c0a091bc);
        wait(isdefined(m_s_bundle.var_82e65b20) ? m_s_bundle.var_82e65b20 : 0);
        if (isdefined(m_s_bundle.var_fd4a26f0) && m_s_bundle.var_fd4a26f0 && m_s_bundle.var_46d9acb0 == "auto_up") {
            thread function_6ff61192(1);
            return;
        }
        if (m_s_bundle.var_46d9acb0 == "up_and_down") {
            if (var_7c4021f5.size >= 1) {
                var_c0a091bc = array::pop_front(var_7c4021f5);
                if (var_c0a091bc < var_de7ae77) {
                    thread function_6ff61192(var_c0a091bc);
                }
                if (var_c0a091bc > var_de7ae77) {
                    thread function_69474136(var_c0a091bc);
                }
            }
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 1, eflags: 0x0
    // Checksum 0x8df22591, Offset: 0x1f78
    // Size: 0x512
    function function_a94c7265(var_c0a091bc) {
        if (!(var_66a89e93[var_c0a091bc] === 0)) {
            return;
        }
        switch (var_c0a091bc) {
        case 1:
            var_ec059365 = struct::get("elevator_doors_parking_1", "targetname");
            if (isdefined(var_ec059365)) {
                var_ec059365 scene::play("shot 5");
            }
            break;
        case 2:
            var_fdb736c8 = struct::get("elevator_doors_parking_2", "targetname");
            if (isdefined(var_fdb736c8)) {
                var_fdb736c8 scene::play("shot 1");
            }
            break;
        case 3:
            var_fdb736c8 = struct::get("elevator_doors_parking_2", "targetname");
            if (isdefined(var_fdb736c8)) {
                var_fdb736c8 scene::play("shot 3");
            }
            break;
        case 4:
            var_fdb736c8 = struct::get("elevator_doors_parking_2", "targetname");
            if (isdefined(var_fdb736c8)) {
                var_fdb736c8 scene::play("shot 5");
            }
            break;
        case 6:
            var_33141036 = struct::get("elevator_doors_lobby", "targetname");
            if (isdefined(var_33141036)) {
                var_33141036 scene::play("shot 1");
            }
            break;
        case 7:
            var_33141036 = struct::get("elevator_doors_lobby", "targetname");
            if (isdefined(var_33141036)) {
                var_33141036 scene::play("shot 3");
            }
            break;
        case 45:
            var_c21420c2 = struct::get("elevator_doors_mall", "targetname");
            if (isdefined(var_c21420c2)) {
                var_c21420c2 scene::play("shot 1");
            }
            break;
        case 46:
            var_c21420c2 = struct::get("elevator_doors_mall", "targetname");
            if (isdefined(var_c21420c2)) {
                var_c21420c2 scene::play("shot 3");
            }
            break;
        case 57:
            var_f4b63da3 = struct::get("elevator_doors_park", "targetname");
            if (isdefined(var_f4b63da3)) {
                var_f4b63da3 scene::play("shot 1");
            }
            break;
        case 58:
            var_f4b63da3 = struct::get("elevator_doors_park", "targetname");
            if (isdefined(var_f4b63da3)) {
                var_f4b63da3 scene::play("shot 3");
            }
            break;
        case 59:
            var_f4b63da3 = struct::get("elevator_doors_park", "targetname");
            if (isdefined(var_f4b63da3)) {
                var_f4b63da3 scene::play("shot 5");
            }
            break;
        case 97:
            var_b3888c6e = struct::get("elevator_doors_roof", "targetname");
            if (isdefined(var_b3888c6e)) {
                var_b3888c6e scene::play("shot 5", undefined, undefined, undefined, undefined, 0);
            }
            break;
        }
        if (isdefined(var_66a89e93[var_c0a091bc])) {
            var_66a89e93[var_c0a091bc] = 1;
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 1, eflags: 0x0
    // Checksum 0x54eb6d79, Offset: 0x1a60
    // Size: 0x50a
    function function_3cd190cf(var_c0a091bc) {
        if (!(var_66a89e93[var_c0a091bc] === 1)) {
            return;
        }
        switch (var_c0a091bc) {
        case 1:
            var_ec059365 = struct::get("elevator_doors_parking_1", "targetname");
            if (isdefined(var_ec059365)) {
                var_ec059365 scene::play("shot 6");
            }
            break;
        case 2:
            var_fdb736c8 = struct::get("elevator_doors_parking_2", "targetname");
            if (isdefined(var_fdb736c8)) {
                var_fdb736c8 scene::play("shot 2");
            }
            break;
        case 3:
            var_fdb736c8 = struct::get("elevator_doors_parking_2", "targetname");
            if (isdefined(var_fdb736c8)) {
                var_fdb736c8 scene::play("shot 4");
            }
            break;
        case 4:
            var_fdb736c8 = struct::get("elevator_doors_parking_2", "targetname");
            if (isdefined(var_fdb736c8)) {
                var_fdb736c8 scene::play("shot 6");
            }
            break;
        case 6:
            var_33141036 = struct::get("elevator_doors_lobby", "targetname");
            if (isdefined(var_33141036)) {
                var_33141036 scene::play("shot 2");
            }
            break;
        case 7:
            var_33141036 = struct::get("elevator_doors_lobby", "targetname");
            if (isdefined(var_33141036)) {
                var_33141036 scene::play("shot 4");
            }
            break;
        case 45:
            var_c21420c2 = struct::get("elevator_doors_mall", "targetname");
            if (isdefined(var_c21420c2)) {
                var_c21420c2 scene::play("shot 2");
            }
            break;
        case 46:
            var_c21420c2 = struct::get("elevator_doors_mall", "targetname");
            if (isdefined(var_c21420c2)) {
                var_c21420c2 scene::play("shot 4");
            }
            break;
        case 57:
            var_f4b63da3 = struct::get("elevator_doors_park", "targetname");
            if (isdefined(var_f4b63da3)) {
                var_f4b63da3 scene::play("shot 2");
            }
            break;
        case 58:
            var_f4b63da3 = struct::get("elevator_doors_park", "targetname");
            if (isdefined(var_f4b63da3)) {
                var_f4b63da3 scene::play("shot 4");
            }
            break;
        case 59:
            var_f4b63da3 = struct::get("elevator_doors_park", "targetname");
            if (isdefined(var_f4b63da3)) {
                var_f4b63da3 scene::play("shot 6");
            }
            break;
        case 97:
            var_b3888c6e = struct::get("elevator_doors_roof", "targetname");
            if (isdefined(var_b3888c6e)) {
                var_b3888c6e scene::play("shot 6");
            }
            break;
        }
        if (isdefined(var_66a89e93[var_c0a091bc])) {
            var_66a89e93[var_c0a091bc] = 0;
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 2, eflags: 0x0
    // Checksum 0x654e1b8, Offset: 0x1860
    // Size: 0x1f4
    function function_47b06180(var_c0a091bc, b_inside) {
        if (var_c0a091bc != var_de7ae77) {
            var_f73740dd = 0;
            foreach (var_9d23b3fe in var_7c4021f5) {
                if (var_9d23b3fe == var_c0a091bc) {
                    var_f73740dd = 1;
                    break;
                }
            }
            if (!var_f73740dd) {
                array::push(var_7c4021f5, var_c0a091bc);
            }
        } else {
            if (isdefined(var_10b20309) && isdefined(b_inside) && b_inside) {
                var_10b20309.mdl_gameobject.interactteam = #"any";
                var_10b20309 gameobjects::enable_object();
                return;
            }
            if (!(isdefined(b_inside) && b_inside)) {
                function_a94c7265(var_c0a091bc);
            }
            return;
        }
        if (!self flag::get("elevator_moving")) {
            if (var_7c4021f5.size >= 1) {
                var_c0a091bc = array::pop_front(var_7c4021f5);
                if (var_c0a091bc < var_de7ae77) {
                    thread function_6ff61192(var_c0a091bc);
                }
                if (var_c0a091bc > var_de7ae77) {
                    thread function_69474136(var_c0a091bc);
                }
            }
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 3, eflags: 0x0
    // Checksum 0x12deba49, Offset: 0x15a8
    // Size: 0x2ae
    function function_64d6a132(var_20aecb28, var_2605b4dd, b_inside) {
        var_a7a692e3 = isdefined(var_20aecb28.script_int) ? var_20aecb28.script_int : 1;
        if (b_inside) {
            var_2af3d553 endon(#"hash_10ae3aed4e10c4c7");
        }
        while (true) {
            waitresult = var_20aecb28.mdl_gameobject waittill(#"gameobject_end_use_player");
            e_player = waitresult.player;
            if (var_2605b4dd) {
                function_47b06180(var_a7a692e3);
            } else if (b_inside) {
                flag::set("inner_button_menu_active");
                var_10b20309 gameobjects::function_2efe0342();
                thread function_da0405b7(e_player);
                e_player clientfield::set_to_player("elevator_floor_selection", 1);
                waitresult = e_player waittill(#"menuresponse", #"disconnect", #"death");
                flag::clear("inner_button_menu_active");
                if (waitresult._notify == "menuresponse") {
                    menu = waitresult.menu;
                    response = waitresult.response;
                    if (menu == "Elevator" && response == "floor") {
                        floornum = waitresult.intpayload;
                        function_47b06180(floornum, b_inside);
                    } else {
                        var_10b20309.mdl_gameobject.interactteam = #"any";
                        var_10b20309 gameobjects::enable_object();
                    }
                }
                e_player clientfield::set_to_player("elevator_floor_selection", 0);
            }
            waitframe(1);
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 1, eflags: 0x0
    // Checksum 0x6cd835e5, Offset: 0x14c8
    // Size: 0xd6
    function function_789cee92(var_20aecb28) {
        while (true) {
            if (isdefined(var_20aecb28.mdl_gameobject)) {
                waitresult = var_20aecb28.mdl_gameobject waittill(#"gameobject_end_use_player");
                e_player = waitresult.player;
                if (!self flag::get("elevator_moving")) {
                    if (var_de7ae77 == 1) {
                        function_69474136(2);
                    } else {
                        function_6ff61192(1);
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 1, eflags: 0x0
    // Checksum 0x91cd70b3, Offset: 0x1360
    // Size: 0x15a
    function function_da0405b7(e_player) {
        if (!isalive(e_player)) {
            return;
        }
        e_player endon(#"death");
        while (flag::get("inner_button_menu_active")) {
            n_distance = distance(e_player.origin, var_2af3d553.origin);
            if (n_distance > 128) {
                var_2af3d553 notify(#"hash_10ae3aed4e10c4c7");
                e_player clientfield::set_to_player("elevator_floor_selection", 0);
                flag::clear("inner_button_menu_active");
                var_10b20309.mdl_gameobject.interactteam = #"any";
                var_10b20309 gameobjects::enable_object();
                thread function_64d6a132(var_10b20309, 0, 1);
                break;
            }
            waitframe(1);
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 0, eflags: 0x0
    // Checksum 0x89a18863, Offset: 0x1338
    // Size: 0x1c
    function function_d293b2b5() {
        var_10b20309 gameobjects::disable_object();
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 3, eflags: 0x0
    // Checksum 0x74c9bc09, Offset: 0x1288
    // Size: 0xa4
    function function_8986542b(var_20aecb28, var_2605b4dd, b_inside) {
        if (b_inside) {
            var_10b20309 = var_20aecb28;
            var_20aecb28.mdl_gameobject.trigger enablelinkto();
            var_20aecb28.mdl_gameobject.trigger linkto(var_2af3d553);
        }
        thread function_64d6a132(var_20aecb28, var_2605b4dd, b_inside);
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 0, eflags: 0x0
    // Checksum 0xd45cc5b8, Offset: 0x1100
    // Size: 0x17e
    function function_cae3f0e7() {
        while (true) {
            waitresult = m_e_trigger waittill(#"trigger");
            wait(isdefined(m_s_bundle.var_95726484) ? m_s_bundle.var_95726484 : 0);
            e_player = waitresult.activator;
            if (e_player istouching(m_e_trigger)) {
                if (!self flag::get("elevator_moving")) {
                    if (m_s_bundle.var_46d9acb0 == "auto_up") {
                        if (var_de7ae77 == 1) {
                            function_69474136(2);
                        } else {
                            function_6ff61192(1);
                        }
                    }
                    if (m_s_bundle.var_46d9acb0 == "auto_down") {
                        if (var_de7ae77 == 1) {
                            function_6ff61192(2);
                        } else {
                            function_69474136(1);
                        }
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 0, eflags: 0x0
    // Checksum 0x7b936818, Offset: 0xed8
    // Size: 0x21c
    function function_dc171119() {
        v_offset = (isdefined(var_a2f96f78.var_56101e04) ? var_a2f96f78.var_56101e04 : 0, isdefined(var_a2f96f78.var_28d7c390) ? var_a2f96f78.var_28d7c390 : 0, isdefined(var_a2f96f78.var_1b81a8e4) ? var_a2f96f78.var_1b81a8e4 : 0);
        v_pos = var_a2f96f78.origin;
        v_angles = var_a2f96f78.angles;
        if (v_offset[0]) {
            v_side = anglestoforward(v_angles);
            v_pos += v_offset[0] * v_side;
        }
        if (v_offset[1]) {
            v_dir = anglestoright(v_angles);
            v_pos += v_offset[1] * v_dir;
        }
        if (v_offset[2]) {
            v_up = anglestoup(v_angles);
            v_pos += v_offset[2] * v_up;
        }
        m_e_trigger = spawn("trigger_radius", v_pos, 16384 | 4096, var_a2f96f78.var_517fb95d, var_a2f96f78.var_394cdd7c);
        m_e_trigger enablelinkto();
        m_e_trigger linkto(var_2af3d553);
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 0, eflags: 0x0
    // Checksum 0xfa45de71, Offset: 0xde8
    // Size: 0xe4
    function function_d842399a() {
        e_or_str_model = m_s_bundle.model;
        if (isentity(e_or_str_model)) {
            var_2af3d553 = m_s_bundle.model;
        } else if (!isdefined(e_or_str_model) && !isdefined(var_a2f96f78.model)) {
            e_or_str_model = "tag_origin";
        }
        if (!isdefined(var_2af3d553)) {
            var_2af3d553 = util::spawn_model(e_or_str_model, var_a2f96f78.origin, var_a2f96f78.angles);
        }
        var_2af3d553 setmovingplatformenabled(1);
    }

    // Namespace namespace_727456f3/namespace_af00ce90
    // Params 2, eflags: 0x0
    // Checksum 0x1979dc4f, Offset: 0xc08
    // Size: 0x1d6
    function init(var_1ec3151c, s_instance) {
        var_66a89e93 = [];
        var_66a89e93[1] = 0;
        var_66a89e93[2] = 0;
        var_66a89e93[3] = 0;
        var_66a89e93[4] = 0;
        var_66a89e93[6] = 0;
        var_66a89e93[7] = 0;
        var_66a89e93[21] = 0;
        var_66a89e93[22] = 0;
        var_66a89e93[35] = 0;
        var_66a89e93[36] = 0;
        var_66a89e93[37] = 0;
        var_66a89e93[38] = 0;
        var_66a89e93[45] = 0;
        var_66a89e93[46] = 0;
        var_66a89e93[57] = 0;
        var_66a89e93[58] = 0;
        var_66a89e93[59] = 0;
        var_66a89e93[97] = 0;
        m_s_bundle = var_1ec3151c;
        var_a2f96f78 = s_instance;
        var_de7ae77 = isdefined(var_1ec3151c.var_a8a3e2f1) ? var_1ec3151c.var_a8a3e2f1 : 1;
        var_7c4021f5 = [];
    }

}

// Namespace elevators/namespace_af00ce90
// Params 0, eflags: 0x2
// Checksum 0x1c3d2770, Offset: 0x310
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"elevators", &__init__, &__main__, undefined);
}

// Namespace elevators/namespace_af00ce90
// Params 0, eflags: 0x0
// Checksum 0x3a8c7291, Offset: 0x360
// Size: 0x304
function __init__() {
    clientfield::register("toplayer", "elevator_floor_selection", 1, 1, "int");
    var_78f0e5f1 = struct::get_array("scriptbundle_elevators", "classname");
    foreach (s_instance in var_78f0e5f1) {
        var_1313d6ba = s_instance init_elevator();
        if (isdefined(var_1313d6ba)) {
            s_instance.var_1313d6ba = var_1313d6ba;
        }
    }
    var_9ee4aad1 = struct::get("elevator_doors_roof", "targetname");
    if (isdefined(var_9ee4aad1)) {
        level scene::init("elevator_doors_roof", "targetname");
    }
    var_e2d370cc = struct::get("elevator_doors_roof", "targetname");
    if (isdefined(var_e2d370cc)) {
        level scene::init("elevator_doors_park", "targetname");
    }
    var_d3152f23 = struct::get("elevator_doors_roof", "targetname");
    if (isdefined(var_d3152f23)) {
        level scene::init("elevator_doors_mall", "targetname");
    }
    var_4a31f3 = struct::get("elevator_doors_roof", "targetname");
    if (isdefined(var_4a31f3)) {
        level scene::init("elevator_doors_lobby", "targetname");
    }
    var_99d23c9f = struct::get("elevator_doors_parking_1", "targetname");
    var_a718572b = struct::get("elevator_doors_parking_2", "targetname");
    if (isdefined(var_99d23c9f)) {
        level scene::init("elevator_doors_parking_1", "targetname");
    }
    if (isdefined(var_a718572b)) {
        level scene::init("elevator_doors_parking_2", "targetname");
    }
}

// Namespace elevators/namespace_af00ce90
// Params 0, eflags: 0x0
// Checksum 0xc37eb1d7, Offset: 0x670
// Size: 0x250
function init_elevator() {
    if (!isdefined(self.angles)) {
        self.angles = (0, 0, 0);
    }
    var_1ec3151c = struct::get_script_bundle("elevators", isdefined(self.var_e87a94f3) ? self.var_e87a94f3 : self.scriptbundlename);
    var_1313d6ba = new class_727456f3();
    [[ var_1313d6ba ]]->init(var_1ec3151c, self);
    var_1313d6ba flag::init("elevator_moving");
    var_1313d6ba flag::init("floor_reached");
    var_1313d6ba flag::init("inner_button_menu_active");
    [[ var_1313d6ba ]]->function_d842399a();
    if (var_1313d6ba.m_s_bundle.var_46d9acb0 == "auto_up" || var_1313d6ba.m_s_bundle.var_46d9acb0 == "auto_down") {
        [[ var_1313d6ba ]]->function_dc171119();
    } else if (var_1313d6ba.m_s_bundle.var_46d9acb0 == "push_button") {
        a_s_gameobjects = struct::get_array("elevator_push_button", "targetname");
        foreach (var_20aecb28 in a_s_gameobjects) {
            if (isdefined(var_20aecb28.target) && var_20aecb28.target === var_1313d6ba.var_a2f96f78.targetname) {
                thread [[ var_1313d6ba ]]->function_789cee92(var_20aecb28);
            }
        }
    }
    return var_1313d6ba;
}

// Namespace elevators/namespace_af00ce90
// Params 0, eflags: 0x0
// Checksum 0xc7ecf6a7, Offset: 0x8c8
// Size: 0x3c
function __main__() {
    level flagsys::wait_till("radiant_gameobjects_initialized");
    level function_a7d817a6();
}

// Namespace elevators/namespace_af00ce90
// Params 0, eflags: 0x0
// Checksum 0x276e78a3, Offset: 0x910
// Size: 0x2cc
function function_a7d817a6() {
    var_78f0e5f1 = struct::get_array("scriptbundle_elevators", "classname");
    foreach (s_instance in var_78f0e5f1) {
        if (s_instance.var_1313d6ba.m_s_bundle.var_46d9acb0 == "auto_up" || s_instance.var_1313d6ba.m_s_bundle.var_46d9acb0 == "auto_down") {
            thread [[ s_instance.var_1313d6ba ]]->function_cae3f0e7();
            continue;
        }
        if (s_instance.var_1313d6ba.m_s_bundle.var_46d9acb0 == "up_and_down") {
            var_af8a8a63 = struct::get_array("elevator_button_inside", "targetname");
            var_d3c75026 = struct::get_array("elevator_button_call", "targetname");
            foreach (var_20aecb28 in var_af8a8a63) {
                if (isdefined(var_20aecb28.target) && var_20aecb28.target == s_instance.targetname) {
                    [[ s_instance.var_1313d6ba ]]->function_8986542b(var_20aecb28, 0, 1);
                    break;
                }
            }
            foreach (var_20aecb28 in var_d3c75026) {
                if (isdefined(var_20aecb28.target) && var_20aecb28.target == s_instance.targetname) {
                    [[ s_instance.var_1313d6ba ]]->function_8986542b(var_20aecb28, 1, 0);
                }
            }
        }
    }
}

