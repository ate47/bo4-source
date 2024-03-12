// Atian COD Tools GSC decompiler test
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace scene;

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x2
// Checksum 0xcaa30233, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__() {
    /#
        system::register(#"scene_debug", &function_c3c9d0e5, undefined, undefined);
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0xed50bbad, Offset: 0xf0
// Size: 0x19c
function function_c3c9d0e5() {
    /#
        if (getdvarstring(#"scene_menu_mode", "<unknown string>") == "<unknown string>") {
            setdvar(#"scene_menu_mode", "<unknown string>");
        }
        if (!isdefined(level.scene_roots)) {
            level.scene_roots = [];
        }
        setdvar(#"run_client_scene", "<unknown string>");
        setdvar(#"init_client_scene", "<unknown string>");
        setdvar(#"stop_client_scene", "<unknown string>");
        setdvar(#"hash_62cdb8fd35a5a4c3", 0);
        level thread run_scene_tests();
        level thread toggle_scene_menu();
        level thread toggle_postfx_igc_loop();
        level thread debug_display_all();
        level thread function_42edf155();
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x728f3675, Offset: 0x298
// Size: 0x6d6
function run_scene_tests() {
    /#
        level endon(#"run_scene_tests");
        var_cdb63291 = 0;
        while (1) {
            str_run_scene = getdvarstring(#"run_scene");
            a_toks = strtok(str_run_scene, "<unknown string>");
            str_scene = a_toks[0];
            str_shot = a_toks[1];
            str_mode = tolower(getdvarstring(#"scene_menu_mode", "<unknown string>"));
            if (str_mode == "<unknown string>" && isdefined(a_toks[2])) {
                str_mode = a_toks[2];
            }
            if (!isdefined(str_scene)) {
                str_scene = "<unknown string>";
            }
            str_client_scene = getdvarstring(#"run_client_scene");
            b_capture = 0;
            if (b_capture) {
                if (str_scene != "<unknown string>") {
                    setdvar(#"init_scene", str_scene);
                    setdvar(#"run_scene", "<unknown string>");
                }
            } else {
                if (str_client_scene != "<unknown string>") {
                    level util::clientnotify(str_client_scene + "<unknown string>");
                    util::wait_network_frame();
                }
                if (str_scene != "<unknown string>") {
                    setdvar(#"run_scene", "<unknown string>");
                    b_series = str_mode == "<unknown string>";
                    if (str_mode == "<unknown string>" || str_mode == "<unknown string>") {
                        str_mode = str_mode + "<unknown string>" + getdvarstring(#"hash_3018c0b9207d1c", "<unknown string>");
                        str_mode = str_mode + "<unknown string>" + getdvarstring(#"hash_51617678bebb961a", "<unknown string>");
                        str_mode = str_mode + "<unknown string>" + getdvarstring(#"hash_4bf15ae7a6fbf73c", "<unknown string>");
                        str_mode = str_mode + "<unknown string>" + getdvarstring(#"hash_7b946c8966b56a8e", "<unknown string>");
                    }
                    level thread test_play(str_scene, str_shot, str_mode);
                }
            }
            str_scene = getdvarstring(#"init_scene");
            str_client_scene = getdvarstring(#"init_client_scene");
            if (str_client_scene != "<unknown string>") {
                level util::clientnotify(str_client_scene + "<unknown string>");
                util::wait_network_frame();
            }
            if (str_scene != "<unknown string>") {
                setdvar(#"init_scene", "<unknown string>");
                level thread test_play(str_scene, undefined, "<unknown string>");
                if (b_capture) {
                    capture_scene(str_scene, str_mode);
                }
            }
            str_scene = getdvarstring(#"stop_scene");
            str_client_scene = getdvarstring(#"stop_client_scene");
            if (str_client_scene != "<unknown string>") {
                level util::clientnotify(str_client_scene + "<unknown string>");
                util::wait_network_frame();
            }
            if (str_scene != "<unknown string>") {
                setdvar(#"stop_scene", "<unknown string>");
                function_d2785094(level.var_a572f325);
                level stop(str_scene);
            }
            str_scene = getdvarstring(#"clear_scene");
            if (str_scene != "<unknown string>") {
                setdvar(#"clear_scene", "<unknown string>");
                function_d2785094(level.var_a572f325);
                level stop(str_scene);
                level delete_scene_spawned_ents(str_scene);
            }
            if (var_cdb63291 != getdvarint(#"hash_62cdb8fd35a5a4c3", 0)) {
                var_cdb63291 = getdvarint(#"hash_62cdb8fd35a5a4c3", 0);
                if (var_cdb63291 == 1) {
                    adddebugcommand("<unknown string>");
                } else {
                    adddebugcommand("<unknown string>");
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 2, eflags: 0x0
// Checksum 0xac45baa2, Offset: 0x978
// Size: 0x64
function capture_scene(str_scene, str_mode) {
    /#
        setdvar(#"scene_menu", 0);
        level play(str_scene, undefined, undefined, 1, str_mode);
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x56f687a4, Offset: 0x9e8
// Size: 0x24c
function toggle_scene_menu() {
    /#
        setdvar(#"scene_menu", 0);
        n_scene_menu_last = -1;
        while (1) {
            n_scene_menu = getdvarstring(#"scene_menu");
            if (n_scene_menu != "<unknown string>") {
                n_scene_menu = int(n_scene_menu);
                if (n_scene_menu != n_scene_menu_last) {
                    switch (n_scene_menu) {
                    case 1:
                        level thread display_scene_menu("<unknown string>");
                        break;
                    case 2:
                        level thread display_scene_menu("<unknown string>");
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
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0x79ad9439, Offset: 0xc40
// Size: 0xdc
function function_8ee42bf(o_scene) {
    /#
        if (isdefined(o_scene) && isdefined(o_scene._s)) {
            str_type = isdefined(o_scene._s.scenetype) ? o_scene._s.scenetype : "<unknown string>";
            if (level flagsys::get(str_type + "<unknown string>") && level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                level thread display_scene_menu(o_scene._s.scenetype);
            }
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0x9f014702, Offset: 0xd28
// Size: 0x6c
function function_70042fe2(str_scene) {
    /#
        if (!level flagsys::get("<unknown string>")) {
            level flagsys::set("<unknown string>");
            level.var_a97df3b7 = str_scene;
            function_27f5972e(str_scene);
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x676dab2e, Offset: 0xda0
// Size: 0x76
function function_1f93be7b() {
    /#
        if (level flagsys::get("<unknown string>") && isdefined(level.var_a97df3b7)) {
            level flagsys::clear("<unknown string>");
            function_f81475ae(level.var_a97df3b7);
            level.var_a97df3b7 = undefined;
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 2, eflags: 0x0
// Checksum 0x8067f2b5, Offset: 0xe20
// Size: 0x103e
function display_scene_menu(str_type, str_scene) {
    /#
        if (!isdefined(str_type)) {
            str_type = "<unknown string>";
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
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names = arraycombine(names, get_all_shot_names(str_scene), 1, 0);
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            str_title = str_scene;
            b_shot_menu = 1;
            selected = isdefined(level.scene_menu_shot_index) ? level.scene_menu_shot_index : 0;
        } else {
            level flagsys::set(str_type + "<unknown string>");
            if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                println("<unknown string>" + toupper(str_type) + "<unknown string>");
            }
            var_72acc069 = 1;
            foreach (str_scenedef in level.scenedefs) {
                s_scenedef = getscriptbundle(str_scenedef);
                if (s_scenedef.vmtype !== "<unknown string>" && s_scenedef.scenetype === str_type) {
                    if (level flagsys::get(#"hash_5bcd66a9c21f5b2d")) {
                        if (is_scene_active(s_scenedef.name) && function_c0f30783(s_scenedef)) {
                            array::add_sorted(names, s_scenedef.name, 0);
                            println("<unknown string>" + toupper(str_type) + "<unknown string>" + var_72acc069 + "<unknown string>" + s_scenedef.name);
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
                println("<unknown string>" + toupper(str_type) + "<unknown string>");
            }
            foreach (str_scene_name in names) {
                var_69836136 = getsubstr(str_scene_name, 0, 4);
                if (var_69836136 == "<unknown string>") {
                    arrayremovevalue(names, str_scene_name);
                    array::push_front(names, str_scene_name);
                }
            }
            names[names.size] = "<unknown string>";
            names[names.size] = "<unknown string>";
            array::push_front(names, "<unknown string>");
            array::push_front(names, "<unknown string>");
            str_title = str_type + "<unknown string>";
            selected = isdefined(level.scene_menu_index) ? level.scene_menu_index : 0;
        }
        if (selected > names.size - 1) {
            selected = 0;
        }
        if (!b_shot_menu && !level flagsys::get(#"scene_menu_disable")) {
            debug2dtext((150, 410 + 400, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 2);
        }
        up_pressed = 0;
        down_pressed = 0;
        held = 0;
        old_selected = selected;
        while (1) {
            if (b_shot_menu) {
                if (isdefined(level.last_scene_state) && isdefined(level.last_scene_state[str_scene])) {
                    str_title = str_scene + "<unknown string>" + level.last_scene_state[str_scene] + "<unknown string>";
                } else {
                    str_title = str_scene;
                }
                function_70042fe2(str_scene);
            } else {
                function_1f93be7b();
            }
            if (held) {
                scene_list_settext(names, selected, str_title, b_shot_menu, 10);
                wait(0.5);
            } else {
                scene_list_settext(names, selected, str_title, b_shot_menu, 1);
            }
            if (!up_pressed) {
                if (level.host util::up_button_pressed()) {
                    up_pressed = 1;
                    selected--;
                    if (names[selected] === "<unknown string>") {
                        selected--;
                    }
                }
            } else if (level.host util::up_button_held()) {
                held = 1;
                selected = selected - 10;
            } else if (!level.host util::up_button_pressed()) {
                held = 0;
                up_pressed = 0;
            }
            if (!down_pressed) {
                if (level.host util::down_button_pressed()) {
                    down_pressed = 1;
                    selected++;
                    if (names[selected] === "<unknown string>") {
                        selected++;
                    }
                }
            } else if (level.host util::down_button_held()) {
                held = 1;
                selected = selected + 10;
            } else if (!level.host util::down_button_pressed()) {
                held = 0;
                down_pressed = 0;
            }
            if (!down_pressed && !up_pressed) {
                if (names[selected] === "<unknown string>") {
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
            if (level.host buttonpressed("<unknown string>")) {
                if (b_shot_menu) {
                    while (level.host buttonpressed("<unknown string>")) {
                        waitframe(1);
                    }
                    level.scene_menu_shot_index = selected;
                    level thread display_scene_menu(str_type);
                } else {
                    level.scene_menu_index = selected;
                    setdvar(#"scene_menu", 0);
                }
            }
            if (names[selected] != "<unknown string>" && !b_shot_menu) {
                if (level.host buttonpressed("<unknown string>") || level.host buttonpressed("<unknown string>")) {
                    level.host move_to_scene(names[selected]);
                    while (level.host buttonpressed("<unknown string>") || level.host buttonpressed("<unknown string>")) {
                        waitframe(1);
                    }
                } else if (level.host buttonpressed("<unknown string>") || level.host buttonpressed("<unknown string>")) {
                    level.host move_to_scene(names[selected], 1);
                    while (level.host buttonpressed("<unknown string>") || level.host buttonpressed("<unknown string>")) {
                        waitframe(1);
                    }
                }
            }
            if (b_shot_menu && function_940c526f() && isdefined(str_scene) && function_9730988a(str_scene, names[selected])) {
                setdvar(#"run_scene", str_scene + "<unknown string>" + names[selected] + "<unknown string>" + "<unknown string>");
            } else if (function_606f1f21()) {
                if (names[selected] == "<unknown string>") {
                    level flagsys::toggle("<unknown string>");
                    while (function_606f1f21()) {
                        waitframe(1);
                    }
                    level thread display_scene_menu(str_type);
                } else if (names[selected] == "<unknown string>") {
                    setdvar(#"scene_menu", 0);
                } else if (b_shot_menu) {
                    if (names[selected] == "<unknown string>") {
                        level.scene_menu_shot_index = selected;
                        while (function_606f1f21()) {
                            waitframe(1);
                        }
                        level thread display_scene_menu(str_type);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"stop_scene", str_scene);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"clear_scene", str_scene);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"init_scene", str_scene);
                    } else if (names[selected] == "<unknown string>") {
                        setdvar(#"run_scene", str_scene);
                    } else {
                        setdvar(#"run_scene", str_scene + "<unknown string>" + names[selected]);
                    }
                }
                while (function_606f1f21() || function_940c526f()) {
                    waitframe(1);
                }
                if (!b_shot_menu && isdefined(names[selected]) && names[selected] != "<unknown string>") {
                    level.scene_menu_index = selected;
                    level thread display_scene_menu(str_type, names[selected]);
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0x1b828701, Offset: 0x1e68
// Size: 0x84
function function_c0f30783(s_scenedef) {
    /#
        if (!(isdefined(s_scenedef.var_241c5f3c) && s_scenedef.var_241c5f3c) || isdefined(s_scenedef.var_241c5f3c) && s_scenedef.var_241c5f3c && getdvarint(#"zm_debug_ee", 0)) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x80933e4f, Offset: 0x1ef8
// Size: 0x82
function function_606f1f21() {
    /#
        if (level.host buttonpressed("<unknown string>") || level.host buttonpressed("<unknown string>") || level.host buttonpressed("<unknown string>")) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0xb2df31fe, Offset: 0x1f88
// Size: 0x38
function function_940c526f() {
    /#
        if (level.host buttonpressed("<unknown string>")) {
            return 1;
        }
        return 0;
    #/
}

// Namespace scene/scene_debug_shared
// Params 5, eflags: 0x0
// Checksum 0xd19edc7e, Offset: 0x1fc8
// Size: 0x7c
function scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97) {
    /#
        if (!level flagsys::get(#"scene_menu_disable")) {
            thread _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97);
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 5, eflags: 0x4
// Checksum 0xa9684af9, Offset: 0x2050
// Size: 0x444
function private _scene_list_settext(strings, n_selected, str_title, b_shot_menu, var_444abf97) {
    /#
        if (!isdefined(b_shot_menu)) {
            b_shot_menu = 0;
        }
        if (!isdefined(var_444abf97)) {
            var_444abf97 = 1;
        }
        debug2dtext((150, 325, 0), str_title, (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
        str_mode = tolower(getdvarstring(#"scene_menu_mode", "<unknown string>"));
        switch (str_mode) {
        case #"default":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"loop":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_single":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        case #"capture_series":
            debug2dtext((150, 362.5, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            break;
        }
        for (i = 0; i < 16; i++) {
            index = i + n_selected - 5;
            if (isdefined(strings[index])) {
                text = strings[index];
            } else {
                text = "<unknown string>";
            }
            str_scene = text;
            if (isdefined(level.last_scene_state) && isdefined(level.last_scene_state[text])) {
                text = text + "<unknown string>" + level.last_scene_state[text] + "<unknown string>";
            }
            if (i == 5) {
                text = "<unknown string>" + text + "<unknown string>";
                str_color = (0.8, 0.4, 0);
            } else if (is_scene_active(str_scene)) {
                str_color = (0, 1, 0);
            } else {
                str_color = (1, 1, 1);
            }
            debug2dtext((136, 400 + i * 25, 0), text, str_color, 1, (0, 0, 0), 1, 1, var_444abf97);
        }
        if (b_shot_menu) {
            debug2dtext((150, 410 + 400, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
            return;
        }
        debug2dtext((150, 410 + 400, 0), "<unknown string>", (1, 1, 1), 1, (0, 0, 0), 1, 1, var_444abf97);
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0xce4da140, Offset: 0x24a0
// Size: 0x58
function is_scene_active(str_scene) {
    /#
        if (str_scene != "<unknown string>" && str_scene != "<unknown string>") {
            if (level is_active(str_scene)) {
                return 1;
            }
        }
        return 0;
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0x80832eea, Offset: 0x2500
// Size: 0x1aa
function function_3bafd088(var_a572f325) {
    /#
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
                adddebugcommand("<unknown string>");
                wait(1);
            }
        #/
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0xd9d11126, Offset: 0x26b8
// Size: 0x174
function function_d2785094(var_a572f325) {
    /#
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
                adddebugcommand("<unknown string>");
            }
        #/
    #/
}

// Namespace scene/scene_debug_shared
// Params 3, eflags: 0x0
// Checksum 0xc584e523, Offset: 0x2838
// Size: 0x134
function test_play(arg1, arg2, str_mode) {
    /#
        n_skipto = getdvarfloat(#"scr_scene_skipto_time", 0);
        if (n_skipto > 0) {
            str_mode = str_mode + "<unknown string>" + n_skipto;
        }
        var_a572f325 = spawnstruct();
        var_a572f325.name = arg1;
        if (!isdefined(var_a572f325.name)) {
            var_a572f325.name = self.scriptbundlename;
        }
        if (!isdefined(var_a572f325.name)) {
            var_a572f325.name = "<unknown string>";
        }
        function_3bafd088(var_a572f325);
        play(arg1, arg2, undefined, 1, str_mode);
        function_d2785094(var_a572f325);
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x2f61cc79, Offset: 0x2978
// Size: 0x11a
function debug_display_all() {
    /#
        while (1) {
            level flagsys::wait_till("<unknown string>");
            debug_frames = randomintrange(5, 10);
            debug_time = debug_frames / 20;
            if (isdefined(level.scene_roots)) {
                level.scene_roots = array::remove_undefined(level.scene_roots);
                foreach (scene in level.scene_roots) {
                    scene debug_display(debug_frames);
                }
            }
            wait(debug_time);
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0xa4c6738a, Offset: 0x2aa0
// Size: 0x2fc
function debug_display(debug_frames) {
    /#
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
    #/
}

// Namespace scene/scene_debug_shared
// Params 4, eflags: 0x0
// Checksum 0x33a43271, Offset: 0x2da8
// Size: 0x124
function print_scene_debug(debug_frames, i, str_scene, str_state) {
    /#
        v_origin = debug_display_origin();
        n_offset = 15 * (i + 1);
        str_scene = function_9e72a96(str_scene);
        print3d(v_origin - (0, 0, n_offset), str_scene, (0.8, 0.2, 0.8), 1, 0.3, debug_frames);
        print3d(v_origin - (0, 0, n_offset + 5), "<unknown string>" + str_state + "<unknown string>", (0.8, 0.2, 0.8), 1, 0.15, debug_frames);
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0xfcb86cd1, Offset: 0x2ed8
// Size: 0x28
function debug_display_origin() {
    /#
        if (self == level) {
            return (0, 0, 0);
        }
        return self.origin;
    #/
}

// Namespace scene/scene_debug_shared
// Params 2, eflags: 0x0
// Checksum 0x51065c67, Offset: 0x2f08
// Size: 0x254
function move_to_scene(str_scene, b_reverse_dir) {
    /#
        if (!isdefined(b_reverse_dir)) {
            b_reverse_dir = 0;
        }
        if (!(level.debug_current_scene_name === str_scene)) {
            level.debug_current_scene_instances = struct::get_array(str_scene, "<unknown string>");
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
            s_bundle = struct::get_script_bundle("<unknown string>", str_scene);
            if (!isdefined(s_bundle)) {
                error_on_screen("<unknown string>" + str_scene);
            } else if (isdefined(s_bundle.aligntarget)) {
                e_align = get_existing_ent(s_bundle.aligntarget, 0, 1);
                if (isdefined(e_align)) {
                    level.host set_origin(e_align.origin);
                } else {
                    error_on_screen("<unknown string>");
                }
            } else {
                error_on_screen("<unknown string>");
            }
            return;
        }
        s_scene = level.debug_current_scene_instances[level.debug_current_scene_index];
        level.host set_origin(s_scene.origin);
    #/
}

// Namespace scene/scene_debug_shared
// Params 1, eflags: 0x0
// Checksum 0x65f06ee4, Offset: 0x3168
// Size: 0x64
function set_origin(v_origin) {
    /#
        if (!self isinmovemode("<unknown string>", "<unknown string>")) {
            adddebugcommand("<unknown string>");
        }
        self setorigin(v_origin);
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x511d30d2, Offset: 0x31d8
// Size: 0x7c
function toggle_postfx_igc_loop() {
    /#
        while (1) {
            if (getdvarint(#"scr_postfx_igc_loop", 0)) {
                array::run_all(level.activeplayers, &clientfield::increment_to_player, "<unknown string>", 1);
                wait(4);
            }
            wait(1);
        }
    #/
}

// Namespace scene/scene_debug_shared
// Params 0, eflags: 0x0
// Checksum 0x3b950f02, Offset: 0x3260
// Size: 0x2d6
function function_42edf155() {
    /#
        while (1) {
            var_45ec9741 = getdvarint(#"hash_1c68b689a2dac0fa", 0);
            if (var_45ec9741 != 0) {
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
                    if (align_tag != "<unknown string>") {
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
    #/
}

