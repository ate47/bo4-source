#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\struct;

#namespace scene;

/#

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x2
    // Checksum 0x5c7c18f4, Offset: 0x98
    // Size: 0x3c
    function autoexec __init__system__() {
        system::register(#"scene_debug", &function_c3c9d0e5, undefined, undefined);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x93be10d2, Offset: 0xe0
    // Size: 0x9c
    function function_c3c9d0e5() {
        if (getdvarstring(#"scene_menu_mode", "<dev string:x38>") == "<dev string:x38>") {
            setdvar(#"scene_menu_mode", "<dev string:x3b>");
        }
        level thread run_scene_tests();
        level thread toggle_scene_menu();
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x29628726, Offset: 0x188
    // Size: 0x4fe
    function run_scene_tests() {
        level endon(#"run_scene_tests");
        level.scene_test_struct = spawnstruct();
        level.scene_test_struct.origin = (0, 0, 0);
        level.scene_test_struct.angles = (0, 0, 0);
        while (true) {
            str_scene = getdvarstring(#"run_client_scene");
            str_mode = tolower(getdvarstring(#"scene_menu_mode", "<dev string:x3b>"));
            a_toks = strtok(str_scene, "<dev string:x45>");
            str_scene = a_toks[0];
            str_shot = a_toks[1];
            if (!isdefined(str_scene)) {
                str_scene = "<dev string:x38>";
            }
            if (str_scene != "<dev string:x38>") {
                setdvar(#"run_client_scene", "<dev string:x38>");
                clear_old_ents(str_scene);
                b_found = 0;
                a_scenes = struct::get_array(str_scene, "<dev string:x49>");
                foreach (s_instance in a_scenes) {
                    if (isdefined(s_instance)) {
                        b_found = 1;
                        s_instance thread test_play(undefined, str_shot, str_mode);
                    }
                }
                if (isdefined(level.active_scenes[str_scene])) {
                    foreach (s_instance in level.active_scenes[str_scene]) {
                        if (!isinarray(a_scenes, s_instance)) {
                            b_found = 1;
                            s_instance thread test_play(str_scene, str_shot, str_mode);
                        }
                    }
                }
                if (!b_found) {
                    level.scene_test_struct thread test_play(str_scene, str_shot, str_mode);
                }
            }
            str_scene = getdvarstring(#"init_client_scene");
            if (str_scene != "<dev string:x38>") {
                setdvar(#"init_client_scene", "<dev string:x38>");
                clear_old_ents(str_scene);
                b_found = 0;
                a_scenes = struct::get_array(str_scene, "<dev string:x49>");
                foreach (s_instance in a_scenes) {
                    if (isdefined(s_instance)) {
                        b_found = 1;
                        s_instance thread test_init();
                    }
                }
                if (!b_found) {
                    level.scene_test_struct thread test_init(str_scene);
                }
            }
            str_scene = getdvarstring(#"stop_client_scene");
            if (str_scene != "<dev string:x38>") {
                setdvar(#"stop_client_scene", "<dev string:x38>");
                function_d2785094(level.var_a572f325);
                level stop(str_scene, 1);
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x4c18b26b, Offset: 0x690
    // Size: 0xb8
    function clear_old_ents(str_scene) {
        foreach (ent in getentarray(0)) {
            if (ent.scene_spawned === str_scene && ent.finished_scene === str_scene) {
                ent delete();
            }
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x6053d32, Offset: 0x750
    // Size: 0x1f4
    function toggle_scene_menu() {
        setdvar(#"client_scene_menu", 0);
        n_scene_menu_last = -1;
        while (true) {
            n_scene_menu = getdvarstring(#"client_scene_menu");
            if (n_scene_menu != "<dev string:x38>") {
                n_scene_menu = int(n_scene_menu);
                if (n_scene_menu != n_scene_menu_last) {
                    switch (n_scene_menu) {
                    case 1:
                        level thread display_scene_menu("<dev string:x5c>");
                        break;
                    case 2:
                        level thread display_scene_menu("<dev string:x64>");
                        break;
                    default:
                        level flagsys::clear(#"menu_open");
                        level flagsys::clear(#"hash_4035a6aa4a6ba08d");
                        level flagsys::clear(#"hash_7b50fddf7a4b9e2e");
                        level flagsys::clear(#"hash_5bcd66a9c21f5b2d");
                        level notify(#"scene_menu_cleanup");
                        setdvar(#"cl_tacticalhud", 1);
                        break;
                    }
                    n_scene_menu_last = n_scene_menu;
                }
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x14a20196, Offset: 0x950
    // Size: 0xdc
    function function_8ee42bf(o_scene) {
        if (isdefined(o_scene) && isdefined(o_scene._s)) {
            str_type = isdefined(o_scene._s.scenetype) ? o_scene._s.scenetype : "<dev string:x5c>";
            if (level flagsys::get(str_type + "<dev string:x6d>") && level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                level thread display_scene_menu(o_scene._s.scenetype);
            }
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 2, eflags: 0x0
    // Checksum 0xeb655b9c, Offset: 0xa38
    // Size: 0xd26
    function display_scene_menu(str_type, str_scene) {
        if (!isdefined(str_type)) {
            str_type = "<dev string:x5c>";
        }
        level flagsys::clear(#"hash_4035a6aa4a6ba08d");
        level flagsys::clear(#"hash_7b50fddf7a4b9e2e");
        level notify(#"scene_menu_cleanup");
        level endon(#"scene_menu_cleanup");
        waittillframeend();
        level flagsys::set(#"menu_open");
        setdvar(#"cl_tacticalhud", 0);
        b_shot_menu = 0;
        a_scenedefs = get_scenedefs(str_type);
        if (str_type == "<dev string:x5c>") {
            a_scenedefs = arraycombine(a_scenedefs, get_scenedefs("<dev string:x81>"), 0, 1);
        }
        names = [];
        if (isstring(str_scene)) {
            names[names.size] = "<dev string:x8d>";
            names[names.size] = "<dev string:x94>";
            names[names.size] = "<dev string:x38>";
            names = arraycombine(names, get_all_shot_names(str_scene), 1, 0);
            names[names.size] = "<dev string:x38>";
            names[names.size] = "<dev string:x9b>";
            names[names.size] = "<dev string:x38>";
            names[names.size] = "<dev string:xa2>";
            str_title = str_scene;
            b_shot_menu = 1;
            selected = isdefined(level.scene_menu_shot_index) ? level.scene_menu_shot_index : 0;
        } else {
            level flagsys::set(str_type + "<dev string:x6d>");
            names[0] = "<dev string:xa9>";
            names[1] = "<dev string:x38>";
            if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                println("<dev string:xca>" + toupper(str_type) + "<dev string:xde>");
            }
            var_72acc069 = 1;
            foreach (s_scenedef in a_scenedefs) {
                if (s_scenedef.vmtype === "<dev string:xef>" && s_scenedef.scenetype === str_type) {
                    if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                        if (is_active(s_scenedef.name) && function_c0f30783(s_scenedef)) {
                            array::add_sorted(names, s_scenedef.name, 0);
                            println("<dev string:xf8>" + toupper(str_type) + "<dev string:x10c>" + var_72acc069 + "<dev string:x110>" + s_scenedef.name);
                            var_72acc069++;
                        }
                        continue;
                    }
                    if (function_c0f30783(s_scenedef)) {
                        array::add_sorted(names, s_scenedef.name, 0);
                    }
                }
            }
            if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                println("<dev string:xca>" + toupper(str_type) + "<dev string:x119>");
            }
            names[names.size] = "<dev string:x128>";
            str_title = str_type + "<dev string:x12f>";
        }
        selected = 0;
        up_pressed = 0;
        down_pressed = 0;
        held = 0;
        old_selected = selected;
        while (true) {
            if (held) {
                scene_list_settext(names, selected, str_title, 30);
                wait 0.5;
            } else {
                scene_list_settext(names, selected, str_title, 1);
            }
            if (!up_pressed) {
                if (level.localplayers[0] util::up_button_pressed()) {
                    up_pressed = 1;
                    selected--;
                    if (names[selected] === "<dev string:x38>") {
                        selected--;
                    }
                }
            } else if (level.localplayers[0] util::up_button_held()) {
                held = 1;
                selected -= 10;
            } else if (!level.localplayers[0] util::up_button_pressed()) {
                held = 0;
                up_pressed = 0;
            }
            if (!down_pressed) {
                if (level.localplayers[0] util::down_button_pressed()) {
                    down_pressed = 1;
                    selected++;
                    if (names[selected] === "<dev string:x38>") {
                        selected++;
                    }
                }
            } else if (level.localplayers[0] util::down_button_held()) {
                held = 1;
                selected += 10;
            } else if (!level.localplayers[0] util::down_button_pressed()) {
                held = 0;
                down_pressed = 0;
            }
            if (held) {
                if (selected < 0) {
                    selected = 0;
                } else if (selected >= names.size) {
                    selected = names.size - 1;
                }
            } else if (selected < 0) {
                selected = names.size - 1;
            } else if (selected >= names.size) {
                selected = 0;
            }
            if (level.localplayers[0] buttonpressed("<dev string:x134>")) {
                if (b_shot_menu) {
                    while (level.localplayers[0] buttonpressed("<dev string:x134>")) {
                        waitframe(1);
                    }
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu(str_type);
                } else {
                    level.scene_menu_shot_index = selected;
                    setdvar(#"client_scene_menu", 0);
                }
            }
            if (level.localplayers[0] buttonpressed("<dev string:x13f>") || level.localplayers[0] buttonpressed("<dev string:x14a>") || level.localplayers[0] buttonpressed("<dev string:x155>")) {
                if (names[selected] == "<dev string:xa9>") {
                    level flagsys::toggle("<dev string:x15d>");
                    while (level.localplayers[0] buttonpressed("<dev string:x13f>") || level.localplayers[0] buttonpressed("<dev string:x14a>") || level.localplayers[0] buttonpressed("<dev string:x155>")) {
                        waitframe(1);
                    }
                    level thread display_scene_menu(str_type);
                } else if (names[selected] == "<dev string:x128>") {
                    setdvar(#"client_scene_menu", 0);
                } else if (b_shot_menu) {
                    if (names[selected] == "<dev string:xa2>") {
                        level.scene_menu_shot_index = selected;
                        while (level.localplayers[0] buttonpressed("<dev string:x13f>") || level.localplayers[0] buttonpressed("<dev string:x14a>") || level.localplayers[0] buttonpressed("<dev string:x155>")) {
                            waitframe(1);
                        }
                        level thread display_scene_menu(str_type);
                    } else if (names[selected] == "<dev string:x9b>") {
                        setdvar(#"stop_client_scene", str_scene);
                    } else if (names[selected] == "<dev string:x8d>") {
                        setdvar(#"init_client_scene", str_scene);
                    } else if (names[selected] == "<dev string:x94>") {
                        setdvar(#"run_client_scene", str_scene);
                    } else {
                        setdvar(#"run_client_scene", str_scene + "<dev string:x45>" + names[selected]);
                    }
                }
                while (level.localplayers[0] buttonpressed("<dev string:x13f>") || level.localplayers[0] buttonpressed("<dev string:x14a>") || level.localplayers[0] buttonpressed("<dev string:x155>")) {
                    waitframe(1);
                }
                if (!b_shot_menu && isdefined(names[selected]) && names[selected] != "<dev string:x38>") {
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu(str_type, names[selected]);
                }
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x8499f58f, Offset: 0x1768
    // Size: 0x84
    function function_c0f30783(s_scenedef) {
        if (!(isdefined(s_scenedef.var_241c5f3c) && s_scenedef.var_241c5f3c) || isdefined(s_scenedef.var_241c5f3c) && s_scenedef.var_241c5f3c && getdvarint(#"zm_debug_ee", 0)) {
            return 1;
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x330c57d8, Offset: 0x17f8
    // Size: 0x4c
    function scene_list_settext(strings, n_selected, str_title, var_444abf97) {
        level thread _scene_list_settext(strings, n_selected, str_title, var_444abf97);
    }

    // Namespace scene/scene_debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x6dc296d5, Offset: 0x1850
    // Size: 0x38e
    function _scene_list_settext(strings, n_selected, str_title, var_444abf97) {
        if (!isdefined(var_444abf97)) {
            var_444abf97 = 1;
        }
        debug2dtext((150, 325, 0), str_title, (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
        str_mode = tolower(getdvarstring(#"scene_menu_mode", "<dev string:x3b>"));
        switch (str_mode) {
        case #"default":
            debug2dtext((150, 362.5, 0), "<dev string:x176>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"loop":
            debug2dtext((150, 362.5, 0), "<dev string:x186>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_single":
            debug2dtext((150, 362.5, 0), "<dev string:x193>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_series":
            debug2dtext((150, 362.5, 0), "<dev string:x1aa>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        }
        for (i = 0; i < 16; i++) {
            index = i + n_selected - 5;
            if (isdefined(strings[index])) {
                text = strings[index];
            } else {
                text = "<dev string:x38>";
            }
            if (is_scene_playing(text)) {
                text += "<dev string:x1c1>";
                str_color = (0, 1, 0);
            } else if (is_scene_initialized(text)) {
                text += "<dev string:x1ce>";
                str_color = (0, 1, 0);
            } else {
                str_color = (1, 1, 1);
            }
            if (i == 5) {
                text = "<dev string:x1df>" + text + "<dev string:x1e3>";
                str_color = (0.8, 0.4, 0);
            }
            debug2dtext((136, 400 + i * 25, 0), text, str_color, 1, (0, 0, 0), 1, 1, var_444abf97);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x25efd135, Offset: 0x1be8
    // Size: 0x60
    function is_scene_playing(str_scene) {
        if (str_scene != "<dev string:x38>" && str_scene != "<dev string:x1e7>") {
            if (level flagsys::get(str_scene + "<dev string:x1ee>")) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x4ff50359, Offset: 0x1c50
    // Size: 0x60
    function is_scene_initialized(str_scene) {
        if (str_scene != "<dev string:x38>" && str_scene != "<dev string:x1e7>") {
            if (level flagsys::get(str_scene + "<dev string:x1f9>")) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x33e3312f, Offset: 0x1cb8
    // Size: 0x2c
    function test_init(arg1) {
        init(arg1, undefined, undefined, 1);
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x7466226a, Offset: 0x1cf0
    // Size: 0x1b2
    function function_3bafd088(var_a572f325) {
        /#
            if (getdvarint(#"dvr_enable", 0) > 0 && getdvarint(#"scr_scene_dvr", 0) > 0) {
                if (!isdefined(var_a572f325)) {
                    var_a572f325 = spawnstruct();
                }
                var_a572f325.drawbig = getdvarint(#"hash_13d62f4d290ef671", 0);
                var_a572f325.var_2640d68e = getdvarint(#"scr_show_shot_info_for_igcs", 0);
                var_a572f325.drawfps = getdvarint(#"cg_drawfps", 1);
                level.var_a572f325 = var_a572f325;
                setdvar(#"hash_13d62f4d290ef671", 1);
                setdvar(#"scr_show_shot_info_for_igcs", 1);
                setdvar(#"cg_drawfps", 0);
                adddebugcommand(0, "<dev string:x208>");
                wait 1;
            }
        #/
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x9aa5bcd6, Offset: 0x1eb0
    // Size: 0x17c
    function function_d2785094(var_a572f325) {
        /#
            if (getdvarint(#"dvr_enable", 0) > 0 && getdvarint(#"scr_scene_dvr", 0) > 0) {
                drawbig = 0;
                var_2640d68e = 0;
                drawfps = 1;
                if (isdefined(var_a572f325)) {
                    if (isdefined(var_a572f325.drawbig)) {
                        drawbig = var_a572f325.drawbig;
                    }
                    if (isdefined(var_a572f325.var_2640d68e)) {
                        var_2640d68e = var_a572f325.var_2640d68e;
                    }
                    if (isdefined(var_a572f325.drawfps)) {
                        drawfps = var_a572f325.drawfps;
                    }
                }
                setdvar(#"hash_13d62f4d290ef671", drawbig);
                setdvar(#"scr_show_shot_info_for_igcs", var_2640d68e);
                setdvar(#"cg_drawfps", drawfps);
                adddebugcommand(0, "<dev string:x216>");
            }
        #/
    }

    // Namespace scene/scene_debug_shared
    // Params 3, eflags: 0x0
    // Checksum 0xa61876b9, Offset: 0x2038
    // Size: 0x114
    function test_play(arg1, arg2, str_mode) {
        if (!isdefined(level.var_a572f325)) {
            level.var_a572f325 = spawnstruct();
        }
        var_a572f325 = spawnstruct();
        var_a572f325.name = arg1;
        if (!isdefined(var_a572f325.name)) {
            var_a572f325.name = self.scriptbundlename;
        }
        if (!isdefined(var_a572f325.name)) {
            var_a572f325.name = "<dev string:x3b>";
        }
        function_3bafd088(var_a572f325);
        play(arg1, arg2, undefined, 1, str_mode);
        function_d2785094(var_a572f325);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x8970ecf, Offset: 0x2158
    // Size: 0x380
    function debug_display() {
        self endon(#"death");
        if (!(isdefined(self.debug_display) && self.debug_display) && self != level) {
            self.debug_display = 1;
            while (true) {
                level flagsys::wait_till("<dev string:x222>");
                debug_frames = randomintrange(5, 15);
                debug_time = debug_frames / 60;
                sphere(self.origin, 1, (0, 1, 1), 1, 1, 8, debug_frames);
                if (isdefined(self.scenes)) {
                    foreach (i, o_scene in self.scenes) {
                        n_offset = 15 * (i + 1);
                        print3d(self.origin - (0, 0, n_offset), o_scene._str_name, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
                        print3d(self.origin - (0, 0, n_offset + 5), "<dev string:x22f>" + (isdefined([[ o_scene ]]->function_2ba44cd0()) ? "<dev string:x38>" + [[ o_scene ]]->function_2ba44cd0() : "<dev string:x38>") + "<dev string:x241>", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
                        print3d(self.origin - (0, 0, n_offset + 10), "<dev string:x245>" + (isdefined(function_12479eba(o_scene._str_name)) ? "<dev string:x38>" + function_12479eba(o_scene._str_name) : "<dev string:x38>") + "<dev string:x257>", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
                    }
                } else if (isdefined(self.scriptbundlename)) {
                    print3d(self.origin - (0, 0, 15), self.scriptbundlename, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
                } else {
                    self.debug_display = 0;
                    break;
                }
                wait debug_time;
            }
        }
    }

#/
