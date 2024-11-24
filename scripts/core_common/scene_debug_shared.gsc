#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace scene;

/#

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x2
    // Checksum 0xcaa30233, Offset: 0xa8
    // Size: 0x3c
    function autoexec __init__system__() {
        system::register(#"scene_debug", &function_c3c9d0e5, undefined, undefined);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xed50bbad, Offset: 0xf0
    // Size: 0x19c
    function function_c3c9d0e5() {
        if (getdvarstring(#"scene_menu_mode", "<dev string:x38>") == "<dev string:x38>") {
            setdvar(#"scene_menu_mode", "<dev string:x3b>");
        }
        if (!isdefined(level.scene_roots)) {
            level.scene_roots = [];
        }
        setdvar(#"run_client_scene", "<dev string:x38>");
        setdvar(#"init_client_scene", "<dev string:x38>");
        setdvar(#"stop_client_scene", "<dev string:x38>");
        setdvar(#"hash_62cdb8fd35a5a4c3", 0);
        level thread run_scene_tests();
        level thread toggle_scene_menu();
        level thread toggle_postfx_igc_loop();
        level thread debug_display_all();
        level thread function_42edf155();
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x728f3675, Offset: 0x298
    // Size: 0x6d6
    function run_scene_tests() {
        level endon(#"run_scene_tests");
        var_cdb63291 = 0;
        while (true) {
            str_run_scene = getdvarstring(#"run_scene");
            a_toks = strtok(str_run_scene, "<dev string:x45>");
            str_scene = a_toks[0];
            str_shot = a_toks[1];
            str_mode = tolower(getdvarstring(#"scene_menu_mode", "<dev string:x3b>"));
            if (str_mode == "<dev string:x3b>" && isdefined(a_toks[2])) {
                str_mode = a_toks[2];
            }
            if (!isdefined(str_scene)) {
                str_scene = "<dev string:x38>";
            }
            str_client_scene = getdvarstring(#"run_client_scene");
            b_capture = 0;
            if (b_capture) {
                if (str_scene != "<dev string:x38>") {
                    setdvar(#"init_scene", str_scene);
                    setdvar(#"run_scene", "<dev string:x38>");
                }
            } else {
                if (str_client_scene != "<dev string:x38>") {
                    level util::clientnotify(str_client_scene + "<dev string:x49>");
                    util::wait_network_frame();
                }
                if (str_scene != "<dev string:x38>") {
                    setdvar(#"run_scene", "<dev string:x38>");
                    b_series = str_mode == "<dev string:x54>";
                    if (str_mode == "<dev string:x65>" || str_mode == "<dev string:x54>") {
                        str_mode += "<dev string:x76>" + getdvarstring(#"hash_3018c0b9207d1c", "<dev string:x80>");
                        str_mode += "<dev string:x84>" + getdvarstring(#"hash_51617678bebb961a", "<dev string:x8c>");
                        str_mode += "<dev string:x91>" + getdvarstring(#"hash_4bf15ae7a6fbf73c", "<dev string:x99>");
                        str_mode += "<dev string:x9f>" + getdvarstring(#"hash_7b946c8966b56a8e", "<dev string:x80>");
                    }
                    level thread test_play(str_scene, str_shot, str_mode);
                }
            }
            str_scene = getdvarstring(#"init_scene");
            str_client_scene = getdvarstring(#"init_client_scene");
            if (str_client_scene != "<dev string:x38>") {
                level util::clientnotify(str_client_scene + "<dev string:xa8>");
                util::wait_network_frame();
            }
            if (str_scene != "<dev string:x38>") {
                setdvar(#"init_scene", "<dev string:x38>");
                level thread test_play(str_scene, undefined, "<dev string:xb3>");
                if (b_capture) {
                    capture_scene(str_scene, str_mode);
                }
            }
            str_scene = getdvarstring(#"stop_scene");
            str_client_scene = getdvarstring(#"stop_client_scene");
            if (str_client_scene != "<dev string:x38>") {
                level util::clientnotify(str_client_scene + "<dev string:xba>");
                util::wait_network_frame();
            }
            if (str_scene != "<dev string:x38>") {
                setdvar(#"stop_scene", "<dev string:x38>");
                function_d2785094(level.var_a572f325);
                level stop(str_scene);
            }
            str_scene = getdvarstring(#"clear_scene");
            if (str_scene != "<dev string:x38>") {
                setdvar(#"clear_scene", "<dev string:x38>");
                function_d2785094(level.var_a572f325);
                level stop(str_scene);
                level delete_scene_spawned_ents(str_scene);
            }
            if (var_cdb63291 != getdvarint(#"hash_62cdb8fd35a5a4c3", 0)) {
                var_cdb63291 = getdvarint(#"hash_62cdb8fd35a5a4c3", 0);
                if (var_cdb63291 == 1) {
                    adddebugcommand("<dev string:xc5>");
                } else {
                    adddebugcommand("<dev string:xfa>");
                }
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 2, eflags: 0x0
    // Checksum 0xac45baa2, Offset: 0x978
    // Size: 0x64
    function capture_scene(str_scene, str_mode) {
        setdvar(#"scene_menu", 0);
        level play(str_scene, undefined, undefined, 1, str_mode);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x56f687a4, Offset: 0x9e8
    // Size: 0x24c
    function toggle_scene_menu() {
        setdvar(#"scene_menu", 0);
        n_scene_menu_last = -1;
        while (true) {
            n_scene_menu = getdvarstring(#"scene_menu");
            if (n_scene_menu != "<dev string:x38>") {
                n_scene_menu = int(n_scene_menu);
                if (n_scene_menu != n_scene_menu_last) {
                    switch (n_scene_menu) {
                    case 1:
                        level thread display_scene_menu("<dev string:x119>");
                        break;
                    case 2:
                        level thread display_scene_menu("<dev string:x121>");
                        break;
                    default:
                        function_1f93be7b();
                        level flagsys::clear(#"menu_open");
                        level flagsys::clear(#"menu_open");
                        level flagsys::clear(#"hash_4035a6aa4a6ba08d");
                        level flagsys::clear(#"hash_7b50fddf7a4b9e2e");
                        level flagsys::clear(#"hash_5bcd66a9c21f5b2d");
                        level notify(#"scene_menu_cleanup");
                        setdvar(#"bgcache_disablewarninghints", 0);
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
    // Checksum 0x79ad9439, Offset: 0xc40
    // Size: 0xdc
    function function_8ee42bf(o_scene) {
        if (isdefined(o_scene) && isdefined(o_scene._s)) {
            str_type = isdefined(o_scene._s.scenetype) ? o_scene._s.scenetype : "<dev string:x119>";
            if (level flagsys::get(str_type + "<dev string:x12a>") && level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                level thread display_scene_menu(o_scene._s.scenetype);
            }
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x9f014702, Offset: 0xd28
    // Size: 0x6c
    function function_70042fe2(str_scene) {
        if (!level flagsys::get("<dev string:x13e>")) {
            level flagsys::set("<dev string:x13e>");
            level.var_a97df3b7 = str_scene;
            function_27f5972e(str_scene);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x676dab2e, Offset: 0xda0
    // Size: 0x76
    function function_1f93be7b() {
        if (level flagsys::get("<dev string:x13e>") && isdefined(level.var_a97df3b7)) {
            level flagsys::clear("<dev string:x13e>");
            function_f81475ae(level.var_a97df3b7);
            level.var_a97df3b7 = undefined;
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 2, eflags: 0x0
    // Checksum 0x8067f2b5, Offset: 0xe20
    // Size: 0x103e
    function display_scene_menu(str_type, str_scene) {
        if (!isdefined(str_type)) {
            str_type = "<dev string:x119>";
        }
        level flagsys::clear(#"hash_4035a6aa4a6ba08d");
        level flagsys::clear(#"hash_7b50fddf7a4b9e2e");
        level notify(#"scene_menu_cleanup");
        level endon(#"scene_menu_cleanup");
        waittillframeend();
        level flagsys::set(#"menu_open");
        setdvar(#"bgcache_disablewarninghints", 1);
        setdvar(#"cl_tacticalhud", 0);
        names = [];
        b_shot_menu = 0;
        if (isstring(str_scene)) {
            names[names.size] = "<dev string:x158>";
            names[names.size] = "<dev string:x15f>";
            names[names.size] = "<dev string:x38>";
            names = arraycombine(names, get_all_shot_names(str_scene), 1, 0);
            names[names.size] = "<dev string:x38>";
            names[names.size] = "<dev string:x166>";
            names[names.size] = "<dev string:x16d>";
            names[names.size] = "<dev string:x38>";
            names[names.size] = "<dev string:x175>";
            str_title = str_scene;
            b_shot_menu = 1;
            selected = isdefined(level.scene_menu_shot_index) ? level.scene_menu_shot_index : 0;
        } else {
            level flagsys::set(str_type + "<dev string:x12a>");
            if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                println("<dev string:x17c>" + toupper(str_type) + "<dev string:x190>");
            }
            var_72acc069 = 1;
            foreach (str_scenedef in level.scenedefs) {
                s_scenedef = getscriptbundle(str_scenedef);
                if (s_scenedef.vmtype !== "<dev string:x1a1>" && s_scenedef.scenetype === str_type) {
                    if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                        if (is_scene_active(s_scenedef.name) && function_c0f30783(s_scenedef)) {
                            array::add_sorted(names, s_scenedef.name, 0);
                            println("<dev string:x17c>" + toupper(str_type) + "<dev string:x1aa>" + var_72acc069 + "<dev string:x1ae>" + s_scenedef.name);
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
                println("<dev string:x17c>" + toupper(str_type) + "<dev string:x1b7>");
            }
            foreach (str_scene_name in names) {
                str_prefix = getsubstr(str_scene_name, 0, 4);
                if (str_prefix == "<dev string:x1c6>") {
                    arrayremovevalue(names, str_scene_name);
                    array::push_front(names, str_scene_name);
                }
            }
            names[names.size] = "<dev string:x38>";
            names[names.size] = "<dev string:x1cd>";
            array::push_front(names, "<dev string:x38>");
            array::push_front(names, "<dev string:x1d4>");
            str_title = str_type + "<dev string:x1f5>";
            selected = isdefined(level.scene_menu_index) ? level.scene_menu_index : 0;
        }
        if (selected > names.size - 1) {
            selected = 0;
        }
        if (!b_shot_menu && !level flagsys::get(#"scene_menu_disable")) {
            debug2dtext((150, 410 + 400, 0), "<dev string:x1f9>", (1, 1, 1), 1, (0, 0, 0), 1, 2);
        }
        up_pressed = 0;
        down_pressed = 0;
        held = 0;
        old_selected = selected;
        while (true) {
            if (b_shot_menu) {
                if (isdefined(level.last_scene_state) && isdefined(level.last_scene_state[str_scene])) {
                    str_title = str_scene + "<dev string:x21d>" + level.last_scene_state[str_scene] + "<dev string:x222>";
                } else {
                    str_title = str_scene;
                }
                function_70042fe2(str_scene);
            } else {
                function_1f93be7b();
            }
            if (held) {
                scene_list_settext(names, selected, str_title, b_shot_menu, 10);
                wait 0.5;
            } else {
                scene_list_settext(names, selected, str_title, b_shot_menu, 1);
            }
            if (!up_pressed) {
                if (level.host util::up_button_pressed()) {
                    up_pressed = 1;
                    selected--;
                    if (names[selected] === "<dev string:x38>") {
                        selected--;
                    }
                }
            } else if (level.host util::up_button_held()) {
                held = 1;
                selected -= 10;
            } else if (!level.host util::up_button_pressed()) {
                held = 0;
                up_pressed = 0;
            }
            if (!down_pressed) {
                if (level.host util::down_button_pressed()) {
                    down_pressed = 1;
                    selected++;
                    if (names[selected] === "<dev string:x38>") {
                        selected++;
                    }
                }
            } else if (level.host util::down_button_held()) {
                held = 1;
                selected += 10;
            } else if (!level.host util::down_button_pressed()) {
                held = 0;
                down_pressed = 0;
            }
            if (!down_pressed && !up_pressed) {
                if (names[selected] === "<dev string:x38>") {
                    selected++;
                }
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
            if (level.host buttonpressed("<dev string:x226>")) {
                if (b_shot_menu) {
                    while (level.host buttonpressed("<dev string:x226>")) {
                        waitframe(1);
                    }
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu(str_type);
                } else {
                    level.scene_menu_index = selected;
                    setdvar(#"scene_menu", 0);
                }
            }
            if (names[selected] != "<dev string:x1cd>" && !b_shot_menu) {
                if (level.host buttonpressed("<dev string:x231>") || level.host buttonpressed("<dev string:x23e>")) {
                    level.host move_to_scene(names[selected]);
                    while (level.host buttonpressed("<dev string:x231>") || level.host buttonpressed("<dev string:x23e>")) {
                        waitframe(1);
                    }
                } else if (level.host buttonpressed("<dev string:x24b>") || level.host buttonpressed("<dev string:x257>")) {
                    level.host move_to_scene(names[selected], 1);
                    while (level.host buttonpressed("<dev string:x24b>") || level.host buttonpressed("<dev string:x257>")) {
                        waitframe(1);
                    }
                }
            }
            if (b_shot_menu && function_940c526f() && isdefined(str_scene) && function_9730988a(str_scene, names[selected])) {
                setdvar(#"run_scene", str_scene + "<dev string:x45>" + names[selected] + "<dev string:x45>" + "<dev string:x263>");
            } else if (function_606f1f21()) {
                if (names[selected] == "<dev string:x1d4>") {
                    level flagsys::toggle("<dev string:x274>");
                    while (function_606f1f21()) {
                        waitframe(1);
                    }
                    level thread display_scene_menu(str_type);
                } else if (names[selected] == "<dev string:x1cd>") {
                    setdvar(#"scene_menu", 0);
                } else if (b_shot_menu) {
                    if (names[selected] == "<dev string:x175>") {
                        level.scene_menu_shot_index = selected;
                        while (function_606f1f21()) {
                            waitframe(1);
                        }
                        level thread display_scene_menu(str_type);
                    } else if (names[selected] == "<dev string:x166>") {
                        setdvar(#"stop_scene", str_scene);
                    } else if (names[selected] == "<dev string:x16d>") {
                        setdvar(#"clear_scene", str_scene);
                    } else if (names[selected] == "<dev string:x158>") {
                        setdvar(#"init_scene", str_scene);
                    } else if (names[selected] == "<dev string:x15f>") {
                        setdvar(#"run_scene", str_scene);
                    } else {
                        setdvar(#"run_scene", str_scene + "<dev string:x45>" + names[selected]);
                    }
                }
                while (function_606f1f21() || function_940c526f()) {
                    waitframe(1);
                }
                if (!b_shot_menu && isdefined(names[selected]) && names[selected] != "<dev string:x38>") {
                    level.scene_menu_index = selected;
                    level thread display_scene_menu(str_type, names[selected]);
                }
            }
            waitframe(1);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x1b828701, Offset: 0x1e68
    // Size: 0x84
    function function_c0f30783(s_scenedef) {
        if (!(isdefined(s_scenedef.var_241c5f3c) && s_scenedef.var_241c5f3c) || isdefined(s_scenedef.var_241c5f3c) && s_scenedef.var_241c5f3c && getdvarint(#"zm_debug_ee", 0)) {
            return 1;
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x80933e4f, Offset: 0x1ef8
    // Size: 0x82
    function function_606f1f21() {
        if (level.host buttonpressed("<dev string:x28d>") || level.host buttonpressed("<dev string:x298>") || level.host buttonpressed("<dev string:x2a3>")) {
            return 1;
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xb2df31fe, Offset: 0x1f88
    // Size: 0x38
    function function_940c526f() {
        if (level.host buttonpressed("<dev string:x2ab>")) {
            return 1;
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 5, eflags: 0x0
    // Checksum 0xd19edc7e, Offset: 0x1fc8
    // Size: 0x7c
    function scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97) {
        if (!level flagsys::get(#"scene_menu_disable")) {
            thread _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 5, eflags: 0x4
    // Checksum 0xa9684af9, Offset: 0x2050
    // Size: 0x444
    function private _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97) {
        if (!isdefined(b_shot_menu)) {
            b_shot_menu = 0;
        }
        if (!isdefined(var_444abf97)) {
            var_444abf97 = 1;
        }
        debug2dtext((150, 325, 0), str_title, (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
        str_mode = tolower(getdvarstring(#"scene_menu_mode", "<dev string:x3b>"));
        switch (str_mode) {
        case #"default":
            debug2dtext((150, 362.5, 0), "<dev string:x2b6>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"loop":
            debug2dtext((150, 362.5, 0), "<dev string:x2c6>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_single":
            debug2dtext((150, 362.5, 0), "<dev string:x2d3>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_series":
            debug2dtext((150, 362.5, 0), "<dev string:x2f0>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        }
        for (i = 0; i < 16; i++) {
            index = i + n_selected - 5;
            if (isdefined(strings[index])) {
                text = strings[index];
            } else {
                text = "<dev string:x38>";
            }
            str_scene = text;
            if (isdefined(level.last_scene_state) && isdefined(level.last_scene_state[text])) {
                text += "<dev string:x21d>" + level.last_scene_state[text] + "<dev string:x222>";
            }
            if (i == 5) {
                text = "<dev string:x306>" + text + "<dev string:x30b>";
                str_color = (0.8, 0.4, 0);
            } else if (is_scene_active(str_scene)) {
                str_color = (0, 1, 0);
            } else {
                str_color = (1, 1, 1);
            }
            debug2dtext((136, 400 + i * 25, 0), text, str_color, 1, (0, 0, 0), 1, 1, var_444abf97);
        }
        if (b_shot_menu) {
            debug2dtext((150, 410 + 400, 0), "<dev string:x30f>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            return;
        }
        debug2dtext((150, 410 + 400, 0), "<dev string:x1f9>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xce4da140, Offset: 0x24a0
    // Size: 0x58
    function is_scene_active(str_scene) {
        if (str_scene != "<dev string:x38>" && str_scene != "<dev string:x1cd>") {
            if (level is_active(str_scene)) {
                return 1;
            }
        }
        return 0;
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x80832eea, Offset: 0x2500
    // Size: 0x1aa
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
                adddebugcommand("<dev string:x355>");
                wait 1;
            }
        #/
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xd9d11126, Offset: 0x26b8
    // Size: 0x174
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
                adddebugcommand("<dev string:x363>");
            }
        #/
    }

    // Namespace scene/scene_debug_shared
    // Params 3, eflags: 0x0
    // Checksum 0xc584e523, Offset: 0x2838
    // Size: 0x134
    function test_play(arg1, arg2, str_mode) {
        n_skipto = getdvarfloat(#"scr_scene_skipto_time", 0);
        if (n_skipto > 0) {
            str_mode += "<dev string:x36f>" + n_skipto;
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
    // Checksum 0x2f61cc79, Offset: 0x2978
    // Size: 0x11a
    function debug_display_all() {
        while (true) {
            level flagsys::wait_till("<dev string:x37a>");
            debug_frames = randomintrange(5, 10);
            debug_time = debug_frames / 20;
            if (isdefined(level.scene_roots)) {
                level.scene_roots = array::remove_undefined(level.scene_roots);
                foreach (scene in level.scene_roots) {
                    scene debug_display(debug_frames);
                }
            }
            wait debug_time;
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0xa4c6738a, Offset: 0x2aa0
    // Size: 0x2fc
    function debug_display(debug_frames) {
        sphere(debug_display_origin(), 1, (1, 1, 0), 1, 1, 8, debug_frames);
        i = 0;
        if (self == level) {
            b_found = 0;
            if (isdefined(self.scene_ents)) {
                foreach (k, scene in self.scene_ents) {
                    if (isarray(scene)) {
                        foreach (ent in scene) {
                            if (isdefined(ent)) {
                                b_found = 1;
                                print_scene_debug(debug_frames, i, k, self.last_scene_state_instance[k]);
                                i++;
                                break;
                            }
                        }
                    }
                }
            }
            if (!b_found) {
                return;
            }
            return;
        }
        if (isdefined(self.last_scene_state_instance)) {
            foreach (str_scene, str_state in self.last_scene_state_instance) {
                print_scene_debug(debug_frames, i, str_scene, str_state);
                i++;
            }
            return;
        }
        if (isdefined(self.scriptbundlename)) {
            if (ishash(self.scriptbundlename)) {
                str_scene = function_9e72a96(self.scriptbundlename);
            } else {
                str_scene = self.scriptbundlename;
            }
            n_offset = 15;
            print3d(debug_display_origin() - (0, 0, n_offset), str_scene, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x33a43271, Offset: 0x2da8
    // Size: 0x124
    function print_scene_debug(debug_frames, i, str_scene, str_state) {
        v_origin = debug_display_origin();
        n_offset = 15 * (i + 1);
        str_scene = function_9e72a96(str_scene);
        print3d(v_origin - (0, 0, n_offset), str_scene, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
        print3d(v_origin - (0, 0, n_offset + 5), "<dev string:x387>" + str_state + "<dev string:x38b>", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0xfcb86cd1, Offset: 0x2ed8
    // Size: 0x28
    function debug_display_origin() {
        if (self == level) {
            return (0, 0, 0);
        }
        return self.origin;
    }

    // Namespace scene/scene_debug_shared
    // Params 2, eflags: 0x0
    // Checksum 0x51065c67, Offset: 0x2f08
    // Size: 0x254
    function move_to_scene(str_scene, b_reverse_dir) {
        if (!isdefined(b_reverse_dir)) {
            b_reverse_dir = 0;
        }
        if (!(level.debug_current_scene_name === str_scene)) {
            level.debug_current_scene_instances = struct::get_array(str_scene, "<dev string:x38f>");
            level.debug_current_scene_index = 0;
            level.debug_current_scene_name = str_scene;
        } else if (b_reverse_dir) {
            level.debug_current_scene_index--;
            if (level.debug_current_scene_index == -1) {
                level.debug_current_scene_index = level.debug_current_scene_instances.size - 1;
            }
        } else {
            level.debug_current_scene_index++;
            if (level.debug_current_scene_index == level.debug_current_scene_instances.size) {
                level.debug_current_scene_index = 0;
            }
        }
        if (level.debug_current_scene_instances.size == 0) {
            s_bundle = struct::get_script_bundle("<dev string:x119>", str_scene);
            if (!isdefined(s_bundle)) {
                error_on_screen("<dev string:x3a2>" + str_scene);
            } else if (isdefined(s_bundle.aligntarget)) {
                e_align = get_existing_ent(s_bundle.aligntarget, 0, 1);
                if (isdefined(e_align)) {
                    level.host set_origin(e_align.origin);
                } else {
                    error_on_screen("<dev string:x3c8>");
                }
            } else {
                error_on_screen("<dev string:x3fa>");
            }
            return;
        }
        s_scene = level.debug_current_scene_instances[level.debug_current_scene_index];
        level.host set_origin(s_scene.origin);
    }

    // Namespace scene/scene_debug_shared
    // Params 1, eflags: 0x0
    // Checksum 0x65f06ee4, Offset: 0x3168
    // Size: 0x64
    function set_origin(v_origin) {
        if (!self isinmovemode("<dev string:x42b>", "<dev string:x431>")) {
            adddebugcommand("<dev string:x431>");
        }
        self setorigin(v_origin);
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x511d30d2, Offset: 0x31d8
    // Size: 0x7c
    function toggle_postfx_igc_loop() {
        while (true) {
            if (getdvarint(#"scr_postfx_igc_loop", 0)) {
                array::run_all(level.activeplayers, &clientfield::increment_to_player, "<dev string:x43a>", 1);
                wait 4;
            }
            wait 1;
        }
    }

    // Namespace scene/scene_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x3b950f02, Offset: 0x3260
    // Size: 0x2d6
    function function_42edf155() {
        while (true) {
            requestflag = getdvarint(#"hash_1c68b689a2dac0fa", 0);
            if (requestflag != 0) {
                position_x = 0;
                position_y = 0;
                position_z = 0;
                angle_x = 0;
                angle_y = 0;
                angle_z = 0;
                align_target = getdvarstring(#"hash_442538f50d245600");
                align_tag = getdvarstring(#"hash_2004f1dddc83a63b");
                s = get_existing_ent(align_target, 0, 1);
                if (isdefined(s)) {
                    if (align_tag != "<dev string:x38>") {
                        s = animation::_get_align_pos(s, align_tag);
                    }
                    position_x = s.origin[0];
                    position_y = s.origin[1];
                    position_z = s.origin[2];
                    angle_x = s.angles[0];
                    angle_y = s.angles[1];
                    angle_z = s.angles[2];
                }
                setdvar(#"hash_6c03d4e558bf8abd", position_x);
                setdvar(#"hash_6c03d3e558bf890a", position_y);
                setdvar(#"hash_6c03d2e558bf8757", position_z);
                setdvar(#"hash_277ac0be2726df0f", angle_x);
                setdvar(#"hash_277abfbe2726dd5c", angle_y);
                setdvar(#"hash_277ac2be2726e275", angle_z);
                setdvar(#"hash_1c68b689a2dac0fa", 0);
            }
            waitframe(1);
        }
    }

#/
