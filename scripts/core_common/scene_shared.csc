#using scripts\core_common\scene_shared.csc;
#using script_64914218f744517b;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\filter_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scriptbundle_shared.csc;
#using scripts\core_common\scene_debug_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\struct.csc;

#namespace scene;

// Namespace scene
// Method(s) 29 Total 37
class cscene : cscriptbundlebase {

    var _a_active_shots;
    var _a_objects;
    var _e_root;
    var _n_object_id;
    var _s;
    var _str_mode;
    var _str_name;
    var _str_shot;
    var _testing;
    var n_start_time;
    var scene_stopped;
    var skipping_scene;
    var var_2e9fdf35;
    var var_b0ff34ce;

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0xa6f1c335, Offset: 0x5280
    // Size: 0x3a
    constructor() {
        _n_object_id = 0;
        _str_mode = "";
        _a_active_shots = [];
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb30fcd16, Offset: 0x78d0
    // Size: 0x14
    function on_error() {
        stop();
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xc6373601, Offset: 0x77d8
    // Size: 0xf0
    function get_valid_objects() {
        a_obj = [];
        foreach (obj in _a_objects) {
            if (obj._is_valid && ![[ obj ]]->in_a_different_scene()) {
                if (!isdefined(a_obj)) {
                    a_obj = [];
                } else if (!isarray(a_obj)) {
                    a_obj = array(a_obj);
                }
                a_obj[a_obj.size] = obj;
            }
        }
        return a_obj;
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x463e7c49, Offset: 0x77a8
    // Size: 0x24
    function function_6a55f153() {
        array::flagsys_wait(_a_objects, "done");
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xfc5fd6df, Offset: 0x7768
    // Size: 0x34
    function wait_till_shot_ready() {
        if (isdefined(_a_objects)) {
            array::flagsys_wait(_a_objects, "ready");
        }
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xea96ca23, Offset: 0x7718
    // Size: 0x46
    function is_skipping_scene() {
        return isdefined(skipping_scene) && skipping_scene || _str_mode == "skip_scene" || _str_mode == "skip_scene_player";
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5973015d, Offset: 0x76e8
    // Size: 0x28
    function is_looping() {
        return isdefined(_s.looping) && _s.looping;
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3d099d63, Offset: 0x76d8
    // Size: 0x8
    function allows_multiple() {
        return true;
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc14907f2, Offset: 0x7650
    // Size: 0x7a
    function get_align_ent(clientnum) {
        e_align = _e_root;
        if (isdefined(_s.aligntarget)) {
            e_gdt_align = scene::get_existing_ent(clientnum, _s.aligntarget);
            if (isdefined(e_gdt_align)) {
                e_align = e_gdt_align;
            }
        }
        return e_align;
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdcd2fd26, Offset: 0x7638
    // Size: 0xa
    function get_root() {
        return _e_root;
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb2d76d49, Offset: 0x74a8
    // Size: 0x182
    function get_ents() {
        a_ents = [];
        for (clientnum = 0; clientnum < getmaxlocalclients(); clientnum++) {
            if (isdefined(function_5c10bd79(clientnum))) {
                a_ents[clientnum] = [];
                foreach (o_obj in _a_objects) {
                    ent = [[ o_obj ]]->get_ent(clientnum);
                    if (isdefined(o_obj._s.name)) {
                        a_ents[clientnum][o_obj._s.name] = ent;
                        continue;
                    }
                    if (!isdefined(a_ents)) {
                        a_ents = [];
                    } else if (!isarray(a_ents)) {
                        a_ents = array(a_ents);
                    }
                    a_ents[a_ents.size] = ent;
                }
            }
        }
        return a_ents;
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x57e34526, Offset: 0x7090
    // Size: 0x40a
    function _call_state_funcs(str_state) {
        self endon(#"stopped");
        wait_till_shot_ready();
        if (str_state == "play") {
            waittillframeend();
        }
        level notify(_str_name + "_" + str_state);
        if (isdefined(level.scene_funcs) && isdefined(level.scene_funcs[_str_name]) && isdefined(level.scene_funcs[_str_name][str_state])) {
            a_all_ents = get_ents();
            foreach (clientnum, a_ents in a_all_ents) {
                foreach (handler in level.scene_funcs[_str_name][str_state]) {
                    func = handler[0];
                    args = handler[1];
                    switch (args.size) {
                    case 6:
                        _e_root thread [[ func ]](clientnum, a_ents, args[0], args[1], args[2], args[3], args[4], args[5]);
                        break;
                    case 5:
                        _e_root thread [[ func ]](clientnum, a_ents, args[0], args[1], args[2], args[3], args[4]);
                        break;
                    case 4:
                        _e_root thread [[ func ]](clientnum, a_ents, args[0], args[1], args[2], args[3]);
                        break;
                    case 3:
                        _e_root thread [[ func ]](clientnum, a_ents, args[0], args[1], args[2]);
                        break;
                    case 2:
                        _e_root thread [[ func ]](clientnum, a_ents, args[0], args[1]);
                        break;
                    case 1:
                        _e_root thread [[ func ]](clientnum, a_ents, args[0]);
                        break;
                    case 0:
                        _e_root thread [[ func ]](clientnum, a_ents);
                        break;
                    default:
                        assertmsg("<dev string:xee>");
                        break;
                    }
                }
            }
        }
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x135122e7, Offset: 0x6fe8
    // Size: 0x9e
    function has_init_state() {
        b_has_init_state = 0;
        foreach (o_scene_object in _a_objects) {
            if ([[ o_scene_object ]]->has_init_state(_str_name)) {
                b_has_init_state = 1;
                break;
            }
        }
        return b_has_init_state;
    }

    // Namespace cscene/scene_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x42e074bc, Offset: 0x6c90
    // Size: 0x34e
    function stop(b_clear = 0, b_finished = 0) {
        self notify(#"new_state");
        level flagsys::clear(_str_name + "_playing");
        level flagsys::clear(_str_name + "_initialized");
        _str_mode = "";
        thread _call_state_funcs("stop");
        scene_stopped = 1;
        foreach (o_obj in _a_objects) {
            if (isdefined(o_obj) && ![[ o_obj ]]->in_a_different_scene()) {
                thread [[ o_obj ]]->finish(b_clear, b_finished);
            }
        }
        self notify(#"stopped", {#is_finished:b_finished});
        if (isdefined(level.active_scenes[_str_name])) {
            arrayremovevalue(level.active_scenes[_str_name], _e_root);
            if (level.active_scenes[_str_name].size == 0) {
                level.active_scenes[_str_name] = undefined;
            }
        }
        if (isdefined(_e_root) && isdefined(_e_root.scenes)) {
            arrayremovevalue(_e_root.scenes, self);
            if (_e_root.scenes.size == 0) {
                _e_root.scenes = undefined;
            }
            _e_root notify(#"scene_done", {#scenedef:_str_name});
            if (isdefined(_e_root.scene_played)) {
                foreach (var_74f5d118 in _e_root.scene_played) {
                    var_74f5d118 = 1;
                }
            }
        }
        self notify(#"scene_done", {#scenedef:_str_name});
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe30369db, Offset: 0x6b48
    // Size: 0x13c
    function get_next_shot() {
        if (_s.scenetype === "scene") {
            if (isdefined(var_2e9fdf35)) {
                var_1a15e649 = var_2e9fdf35;
                var_2e9fdf35 = undefined;
                return var_1a15e649;
            }
            a_shots = scene::get_all_shot_names(_str_name, _e_root);
            foreach (i, str_shot in a_shots) {
                if (str_shot === _a_active_shots[0] && isdefined(a_shots[i + 1])) {
                    return a_shots[i + 1];
                }
            }
            return;
        }
        if (_s.scenetype === "fxanim") {
        }
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdf32b210, Offset: 0x6b30
    // Size: 0xa
    function function_2ba44cd0() {
        return _str_shot;
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfa272cf, Offset: 0x69b0
    // Size: 0x174
    function function_ea4a6812(str_shot) {
        arrayremovevalue(_a_active_shots, str_shot);
        if (_a_active_shots.size == 0) {
            if (!isdefined(level.inactive_scenes[_str_name])) {
                level.inactive_scenes[_str_name] = [];
            } else if (!isarray(level.inactive_scenes[_str_name])) {
                level.inactive_scenes[_str_name] = array(level.inactive_scenes[_str_name]);
            }
            if (!isinarray(level.inactive_scenes[_str_name], _e_root)) {
                level.inactive_scenes[_str_name][level.inactive_scenes[_str_name].size] = _e_root;
            }
            arrayremovevalue(level.inactive_scenes[_str_name], undefined);
            arrayremovevalue(level.inactive_scenes, undefined, 1);
        }
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb689803d, Offset: 0x6890
    // Size: 0x114
    function function_7a1288f1(str_shot) {
        if (!isdefined(_a_active_shots)) {
            _a_active_shots = [];
        } else if (!isarray(_a_active_shots)) {
            _a_active_shots = array(_a_active_shots);
        }
        if (!isinarray(_a_active_shots, str_shot)) {
            _a_active_shots[_a_active_shots.size] = str_shot;
        }
        if (isarray(level.inactive_scenes[_str_name])) {
            arrayremovevalue(level.inactive_scenes[_str_name], _e_root);
            if (level.inactive_scenes[_str_name].size == 0) {
                level.inactive_scenes[_str_name] = undefined;
            }
        }
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc8ea6287, Offset: 0x6588
    // Size: 0x2fc
    function run_next(str_current_shot) {
        if (isdefined(_s.nextscenebundle) && _s.vmtype !== "both") {
            waitresult = self waittill(#"stopped");
            if (waitresult.is_finished) {
                if (_s.scenetype == "fxanim" && _s.nextscenemode === "init") {
                    if (!cscriptbundlebase::error(!has_init_state(), "Scene can't init next scene '" + _s.nextscenebundle + "' because it doesn't have an init state.")) {
                        if (allows_multiple()) {
                            _e_root thread scene::init(_s.nextscenebundle, get_ents());
                        } else {
                            _e_root thread scene::init(_s.nextscenebundle);
                        }
                    }
                } else if (allows_multiple()) {
                    _e_root thread scene::play(_s.nextscenebundle, get_ents());
                } else {
                    _e_root thread scene::play(_s.nextscenebundle);
                }
            }
            thread stop(0, 1);
            return;
        }
        var_1a15e649 = get_next_shot();
        function_ea4a6812(str_current_shot);
        if (isdefined(var_1a15e649)) {
            switch (_s.scenetype) {
            case #"scene":
                thread play(var_1a15e649, _testing, _str_mode);
                break;
            default:
                thread play(var_1a15e649, _testing, _str_mode);
                break;
            }
            return;
        }
        thread stop(0, 1);
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x3ee4ffef, Offset: 0x6558
    // Size: 0x24
    function play_endon(var_a27f7ab4) {
        function_ea4a6812(_str_shot);
    }

    // Namespace cscene/scene_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0x285c4c7f, Offset: 0x6028
    // Size: 0x524
    function play(str_shot = "play", b_testing = 0, str_mode = "", b_looping = undefined) {
        level endon(#"demo_jump");
        self notify(str_shot + "start");
        self endoncallback(&play_endon, str_shot + "start", #"new_state");
        if (issubstr(str_mode, "play_from_time")) {
            args = strtok(str_mode, ":");
            if (isdefined(args[1])) {
                var_79584e08 = float(args[1]);
            }
        }
        _testing = b_testing;
        _str_mode = str_mode;
        _str_shot = str_shot;
        if (get_valid_objects().size > 0) {
            foreach (o_obj in _a_objects) {
                thread [[ o_obj ]]->play(str_shot, var_79584e08, b_looping);
            }
            n_start_time = undefined;
            level flagsys::set(_str_name + "_playing");
            if (!strendswith(_str_mode, "single")) {
                _str_mode = "play";
            }
            wait_till_shot_ready();
            function_7a1288f1(str_shot);
            thread function_1013fc5b();
            thread _call_state_funcs(str_shot);
            function_6a55f153();
            array::flagsys_wait_any_flag(_a_objects, "done", "main_done");
            if (scene::function_b260bdcc(_str_name, str_shot)) {
                if (isdefined(_e_root)) {
                    _e_root notify(#"scene_done", {#scenedef:_str_name});
                }
                thread _call_state_funcs("done");
                var_b0ff34ce = 1;
            }
            if ((is_looping() || _str_mode == "loop") && isdefined(var_b0ff34ce) && var_b0ff34ce) {
                var_b0ff34ce = undefined;
                if (has_init_state()) {
                    level flagsys::clear(_str_name + "_playing");
                    thread initialize();
                } else {
                    level flagsys::clear(_str_name + "_initialized");
                    var_689ecfec = scene::function_de6a7579(_str_name, str_mode, _e_root);
                    thread play(var_689ecfec, b_testing, str_mode, 1);
                }
            } else if (!strendswith(_str_mode, "single")) {
                thread run_next(str_shot);
            } else {
                thread stop(0, 1);
            }
        } else {
            thread stop(0, 1);
        }
        function_ea4a6812(str_shot);
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe4f5a6b2, Offset: 0x5d58
    // Size: 0x2c8
    function function_1013fc5b() {
        if (isstring(_s.cameraswitcher) || ishash(_s.cameraswitcher)) {
            a_players = getlocalplayers();
            foreach (player in a_players) {
                clientnum = player getlocalclientnumber();
                e_align = get_align_ent(clientnum);
                v_pos = isdefined(e_align.origin) ? e_align.origin : (0, 0, 0);
                v_ang = isdefined(e_align.angles) ? e_align.angles : (0, 0, 0);
                playmaincamxcam(clientnum, _s.cameraswitcher, 0, "", "", v_pos, v_ang);
            }
            if (iscamanimlooping(_s.cameraswitcher)) {
                self waittill(#"new_state");
            } else {
                n_cam_time = getcamanimtime(_s.cameraswitcher);
                self waittilltimeout(float(n_cam_time) / 1000, #"new_state");
            }
            a_players = getlocalplayers();
            foreach (player in a_players) {
                clientnum = player getlocalclientnumber();
                stopmaincamxcam(clientnum);
            }
        }
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x47c2f4b, Offset: 0x5d38
    // Size: 0x16
    function get_object_id() {
        _n_object_id++;
        return _n_object_id;
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1c984faa, Offset: 0x5bf0
    // Size: 0x13c
    function initialize(b_playing = 0) {
        self notify(#"new_state");
        self endon(#"new_state");
        _s scene::function_585fb738();
        if (get_valid_objects().size > 0) {
            level flagsys::set(_str_name + "_initialized");
            _str_mode = "init";
            foreach (o_obj in _a_objects) {
                thread [[ o_obj ]]->initialize();
            }
            if (!b_playing) {
                thread _call_state_funcs("init");
            }
        }
    }

    // Namespace cscene/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x913c37e3, Offset: 0x5a48
    // Size: 0x1a0
    function get_valid_object_defs() {
        a_obj_defs = [];
        foreach (s_obj in _s.objects) {
            if (_s.vmtype === "client" || s_obj.vmtype === "client") {
                if (isdefined(s_obj.name) || isdefined(s_obj.model) || isdefined(s_obj.initanim) || isdefined(s_obj.mainanim)) {
                    if (!(isdefined(s_obj.disabled) && s_obj.disabled) && scene::function_6f382548(s_obj, _s.name)) {
                        if (!isdefined(a_obj_defs)) {
                            a_obj_defs = [];
                        } else if (!isarray(a_obj_defs)) {
                            a_obj_defs = array(a_obj_defs);
                        }
                        a_obj_defs[a_obj_defs.size] = s_obj;
                    }
                }
            }
        }
        return a_obj_defs;
    }

    // Namespace cscene/scene_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xc777889b, Offset: 0x59a0
    // Size: 0xa0
    function assign_ent(o_obj, ent, clientnum) {
        if (!isdefined(_e_root.scene_ents)) {
            _e_root.scene_ents = [];
        }
        if (!isdefined(_e_root.scene_ents[clientnum])) {
            _e_root.scene_ents[clientnum] = [];
        }
        _e_root.scene_ents[clientnum][o_obj._str_name] = ent;
    }

    // Namespace cscene/scene_shared
    // Params 5, eflags: 0x1 linked
    // Checksum 0xb2da5f9f, Offset: 0x54d8
    // Size: 0x4bc
    function init(str_scenedef, s_scenedef, e_align, a_ents, b_test_run) {
        cscriptbundlebase::init(str_scenedef, s_scenedef, b_test_run);
        if (!isdefined(a_ents)) {
            a_ents = [];
        } else if (!isarray(a_ents)) {
            a_ents = array(a_ents);
        }
        if (!cscriptbundlebase::error(a_ents.size > _s.objects.size, "Trying to use more entities than scene supports.")) {
            _e_root = e_align;
            if (!isdefined(level.inactive_scenes)) {
                level.inactive_scenes = [];
            }
            if (!isdefined(level.active_scenes[_str_name])) {
                level.active_scenes[_str_name] = [];
            } else if (!isarray(level.active_scenes[_str_name])) {
                level.active_scenes[_str_name] = array(level.active_scenes[_str_name]);
            }
            level.active_scenes[_str_name][level.active_scenes[_str_name].size] = _e_root;
            if (!isdefined(_e_root.scenes)) {
                _e_root.scenes = [];
            } else if (!isarray(_e_root.scenes)) {
                _e_root.scenes = array(_e_root.scenes);
            }
            _e_root.scenes[_e_root.scenes.size] = self;
            a_objs = get_valid_object_defs();
            foreach (str_name, e_ent in arraycopy(a_ents)) {
                foreach (i, s_obj in arraycopy(a_objs)) {
                    if (s_obj.name === (isdefined(str_name) ? "" + str_name : "")) {
                        cscriptbundlebase::add_object([[ new_object(s_obj.type) ]]->first_init(s_obj, self, e_ent, _e_root.localclientnum));
                        arrayremoveindex(a_ents, str_name);
                        arrayremoveindex(a_objs, i);
                        break;
                    }
                }
            }
            foreach (s_obj in a_objs) {
                cscriptbundlebase::add_object([[ new_object(s_obj.type) ]]->first_init(s_obj, self, array::pop(a_ents), _e_root.localclientnum));
            }
            self thread initialize();
        }
    }

    // Namespace cscene/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x27f43e4a, Offset: 0x52e8
    // Size: 0x1e2
    function new_object(str_type) {
        switch (str_type) {
        case #"prop":
            return new csceneobject();
        case #"model":
            return new csceneobject();
        case #"vehicle":
            return new csceneobject();
        case #"actor":
            return new csceneobject();
        case #"fakeactor":
            return new csceneobject();
        case #"player":
            return new csceneplayer();
        case #"sharedplayer":
            return new csceneplayer();
        case #"fakeplayer":
            return new csceneobject();
        case #"companion":
            return new csceneplayer();
        case #"sharedcompanion":
            return new csceneplayer();
        default:
            cscriptbundlebase::error(0, "Unsupported object type '" + str_type + "'.");
            break;
        }
    }

}

// Namespace scene
// Method(s) 6 Total 46
class csceneplayer : cscriptbundleobjectbase, csceneobject {

    var _e_array;
    var _n_clientnum;
    var _s;
    var var_55b4f21e;

    // Namespace csceneplayer/scene_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xe25cc588, Offset: 0xcc0
    // Size: 0x104
    function wait_for_camera(animation, var_57949b2d = 0) {
        self endon(#"skip_camera_anims");
        flagsys::set(#"camera_playing");
        if (iscamanimlooping(animation)) {
            self waittill(#"new_state");
        } else {
            n_cam_time = getcamanimtime(animation) - var_57949b2d;
            self waittilltimeout(float(n_cam_time) / 1000, #"new_state");
        }
        flagsys::clear(#"camera_playing");
    }

    // Namespace csceneplayer/scene_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xefe5e5b3, Offset: 0xa08
    // Size: 0x2b0
    function _play_camera_anim(clientnum, animation, n_start_time = 0) {
        var_8395d6f1 = isdefined(_s.lerptime) ? _s.lerptime : 0;
        align = csceneobject::get_align_ent(clientnum);
        tag = csceneobject::get_align_tag();
        if (align == level) {
            v_pos = (0, 0, 0);
            v_ang = (0, 0, 0);
        } else if (isstring(tag)) {
            assert(isdefined(align.model), "<dev string:x5e>" + animation + "<dev string:x79>" + tag + "<dev string:x86>");
            v_pos = align gettagorigin(tag);
            v_ang = align gettagangles(tag);
        } else {
            v_pos = align.origin;
            v_ang = align.angles;
        }
        var_380af598 = isdefined(var_55b4f21e.cameraswitchername) ? var_55b4f21e.cameraswitchername : "";
        var_57949b2d = n_start_time * getcamanimtime(animation);
        var_473877de = getservertime(clientnum) - var_57949b2d;
        if (isdefined(var_55b4f21e.var_ffc10b65)) {
            var_94f3822c = getent(clientnum, var_55b4f21e.var_ffc10b65, "targetname");
        }
        playmaincamxcam(clientnum, animation, var_8395d6f1, var_380af598, "", v_pos, v_ang, var_94f3822c, undefined, undefined, int(var_473877de));
        wait_for_camera(animation, var_57949b2d);
    }

    // Namespace csceneplayer/scene_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x9aece918, Offset: 0x990
    // Size: 0x6c
    function _spawn(clientnum, b_hide = 1) {
        _e_array[clientnum] = function_5c10bd79(clientnum);
        flagsys::set(#"ready");
    }

    // Namespace csceneplayer/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x57694af9, Offset: 0x8c0
    // Size: 0xc4
    function initialize() {
        flagsys::clear(#"ready");
        flagsys::clear(#"done");
        flagsys::clear(#"main_done");
        self notify(#"new_state");
        self endon(#"new_state");
        self notify(#"init");
        waittillframeend();
        if (isdefined(_n_clientnum)) {
            _spawn(_n_clientnum);
        }
    }

}

// Namespace scene
// Method(s) 40 Total 44
class csceneobject : cscriptbundleobjectbase {

    var _b_first_frame;
    var _b_spawnonce_used;
    var _e_array;
    var _is_valid;
    var _n_blend;
    var _n_clientnum;
    var _o_scene;
    var _s;
    var _str_name;
    var _str_shot;
    var m_align;
    var m_tag;
    var var_55b4f21e;

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x89663c2e, Offset: 0x1800
    // Size: 0x42
    constructor() {
        _b_spawnonce_used = 0;
        _is_valid = 1;
        _b_first_frame = 0;
        _n_blend = 0;
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb0d66d7f, Offset: 0x48c8
    // Size: 0xda
    function in_a_different_scene() {
        if (isdefined(_n_clientnum)) {
            if (isdefined(_e_array[_n_clientnum]) && isdefined(_e_array[_n_clientnum].current_scene) && _e_array[_n_clientnum].current_scene != _o_scene._str_name) {
                return true;
            }
        } else if (isdefined(_e_array[0]) && isdefined(_e_array[0].current_scene) && _e_array[0].current_scene != _o_scene._str_name) {
            return true;
        }
        return false;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x74c9c19f, Offset: 0x48a0
    // Size: 0x1a
    function is_alive(clientnum) {
        return isdefined(_e_array[clientnum]);
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2a1d27e0, Offset: 0x4870
    // Size: 0x22
    function has_init_state(str_scenedef) {
        return _s scene::_has_init_state(str_scenedef);
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5203ae1a, Offset: 0x4840
    // Size: 0x24
    function wait_till_shot_ready() {
        [[ scene() ]]->wait_till_shot_ready();
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x314e0ac1, Offset: 0x47b0
    // Size: 0x88
    function function_54266b24() {
        foreach (obj in _o_scene._a_objects) {
            obj flagsys::wait_till_clear("camera_playing");
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x32b9b49e, Offset: 0x4738
    // Size: 0x6c
    function get_align_tag() {
        if (isdefined(var_55b4f21e.aligntargettag)) {
            return var_55b4f21e.aligntargettag;
        }
        if (isdefined(_s.aligntargettag)) {
            return _s.aligntargettag;
        }
        return _o_scene._s.aligntargettag;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xd1d958ea, Offset: 0x4150
    // Size: 0x5de
    function update_alignment(clientnum) {
        m_align = get_align_ent(clientnum);
        m_tag = get_align_tag();
        var_cd4673f4 = isdefined(_s.var_132e5621) && _s.var_132e5621;
        var_2dd2901f = (isdefined(_o_scene._s.var_922b4fc5) ? _o_scene._s.var_922b4fc5 : 0, isdefined(_o_scene._s.var_3e692842) ? _o_scene._s.var_3e692842 : 0, isdefined(_o_scene._s.var_be60a82b) ? _o_scene._s.var_be60a82b : 0);
        var_acf1be3a = (isdefined(_o_scene._s.var_16999a5d) ? _o_scene._s.var_16999a5d : 0, isdefined(_o_scene._s.var_29563fd6) ? _o_scene._s.var_29563fd6 : 0, isdefined(_o_scene._s.var_eb00c330) ? _o_scene._s.var_eb00c330 : 0);
        var_24a7cd13 = (isdefined(_s.var_922b4fc5) ? _s.var_922b4fc5 : 0, isdefined(_s.var_3e692842) ? _s.var_3e692842 : 0, isdefined(_s.var_be60a82b) ? _s.var_be60a82b : 0);
        var_75cdf4bd = (isdefined(_s.var_16999a5d) ? _s.var_16999a5d : 0, isdefined(_s.var_29563fd6) ? _s.var_29563fd6 : 0, isdefined(_s.var_eb00c330) ? _s.var_eb00c330 : 0);
        var_2a3b0294 = (isdefined(var_55b4f21e.var_922b4fc5) ? var_55b4f21e.var_922b4fc5 : 0, isdefined(var_55b4f21e.var_3e692842) ? var_55b4f21e.var_3e692842 : 0, isdefined(var_55b4f21e.var_be60a82b) ? var_55b4f21e.var_be60a82b : 0);
        var_f3bd6699 = (isdefined(var_55b4f21e.var_16999a5d) ? var_55b4f21e.var_16999a5d : 0, isdefined(var_55b4f21e.var_29563fd6) ? var_55b4f21e.var_29563fd6 : 0, isdefined(var_55b4f21e.var_eb00c330) ? var_55b4f21e.var_eb00c330 : 0);
        if (var_2a3b0294 != (0, 0, 0)) {
            var_d3c21d73 = var_2a3b0294;
        } else if (var_24a7cd13 != (0, 0, 0)) {
            var_d3c21d73 = var_24a7cd13;
        } else {
            var_d3c21d73 = var_2dd2901f;
        }
        if (var_f3bd6699 != (0, 0, 0)) {
            v_ang_offset = var_f3bd6699;
        } else if (var_75cdf4bd != (0, 0, 0)) {
            v_ang_offset = var_75cdf4bd;
        } else {
            v_ang_offset = var_acf1be3a;
        }
        if (m_align == level) {
            m_align = (0, 0, 0) + var_d3c21d73;
            m_tag = (0, 0, 0) + v_ang_offset;
            return;
        }
        if (var_d3c21d73 != (0, 0, 0) || v_ang_offset != (0, 0, 0)) {
            v_pos = m_align.origin + var_d3c21d73;
            if (var_cd4673f4) {
                v_ang = _e_array[clientnum].angles;
            } else {
                v_ang = m_align.angles + v_ang_offset;
            }
            m_align = {#origin:v_pos, #angles:v_ang};
            return;
        }
        if (var_cd4673f4) {
            v_pos = m_align.origin;
            v_ang = _e_array[clientnum].angles;
            m_align = {#origin:v_pos, #angles:v_ang};
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 7, eflags: 0x1 linked
    // Checksum 0x53717d18, Offset: 0x3e88
    // Size: 0x2ba
    function _play_anim(clientnum, animation, n_rate = 1, n_blend, str_siege_shot, loop, n_start_time) {
        _spawn(clientnum);
        if (is_alive(clientnum)) {
            if (!(isdefined(_e_array[clientnum].var_463f8196) && _e_array[clientnum].var_463f8196)) {
                _e_array[clientnum] show();
            }
            if (isdefined(_s.issiege) && _s.issiege) {
                _e_array[clientnum] animation::play_siege(animation, str_siege_shot, n_rate, loop);
            } else {
                if (isdefined(loop) && loop && isdefined(_s.var_69db1665) && _s.var_69db1665) {
                    n_start_time = undefined;
                }
                util::waitforclient(clientnum);
                if (isdefined(loop) && loop && isdefined(_s.var_9de1f44c) && _s.var_9de1f44c) {
                    _e_array[clientnum] animation::play(animation, _e_array[clientnum], m_tag, n_rate, n_blend, undefined, undefined, undefined, n_start_time);
                } else {
                    update_alignment(clientnum);
                    _e_array[clientnum] animation::play(animation, m_align, m_tag, n_rate, n_blend, undefined, undefined, undefined, n_start_time);
                }
            }
        } else {
            /#
                cscriptbundleobjectbase::log("<dev string:xbb>" + animation + "<dev string:xd7>");
            #/
        }
        _is_valid = is_alive(clientnum);
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbc10d7a1, Offset: 0x3c68
    // Size: 0x214
    function function_fda037ff(clientnum) {
        if (!isdefined(_e_array[clientnum]) || !isdefined(var_55b4f21e)) {
            return;
        }
        if (isdefined(var_55b4f21e.cleanupdelete) && var_55b4f21e.cleanupdelete) {
            _e_array[clientnum] delete();
            return;
        }
        if (isdefined(var_55b4f21e.var_39fd697b)) {
            a_ents = getentarray(clientnum, var_55b4f21e.var_39fd697b, "targetname");
            array::run_all(a_ents, &hide);
        } else if (isdefined(var_55b4f21e.var_4ceff7a6)) {
            a_ents = getentarray(clientnum, var_55b4f21e.var_4ceff7a6, "targetname");
            array::run_all(a_ents, &show);
        }
        if (!(isdefined(_e_array[clientnum].var_463f8196) && _e_array[clientnum].var_463f8196)) {
            if (isdefined(var_55b4f21e.cleanuphide) && var_55b4f21e.cleanuphide) {
                _e_array[clientnum] hide();
                return;
            }
            if (isdefined(var_55b4f21e.cleanupshow) && var_55b4f21e.cleanupshow) {
                _e_array[clientnum] show();
            }
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x2227dc1e, Offset: 0x3ac8
    // Size: 0x196
    function _cleanup(clientnum) {
        if (isdefined(_e_array[clientnum]) && isdefined(_e_array[clientnum].current_scene)) {
            _e_array[clientnum] flagsys::clear(_o_scene._str_name);
            _e_array[clientnum] sethighdetail(0);
            if (_e_array[clientnum].current_scene == _o_scene._str_name) {
                _e_array[clientnum] flagsys::clear(#"scene");
                _e_array[clientnum].finished_scene = _o_scene._str_name;
                _e_array[clientnum].current_scene = undefined;
            }
            function_fda037ff(clientnum);
        }
        if (clientnum === _n_clientnum || clientnum == 0) {
            if (isdefined(_o_scene) && isdefined(_o_scene.scene_stopped) && _o_scene.scene_stopped) {
                _o_scene = undefined;
            }
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x8b152391, Offset: 0x38a8
    // Size: 0x214
    function function_4b3d4226(clientnum) {
        if (!isdefined(_e_array[clientnum]) || !isdefined(var_55b4f21e)) {
            return;
        }
        if (isdefined(var_55b4f21e.preparedelete) && var_55b4f21e.preparedelete) {
            _e_array[clientnum] delete();
            return;
        }
        if (isdefined(var_55b4f21e.var_3cd248f5)) {
            a_ents = getentarray(clientnum, var_55b4f21e.var_3cd248f5, "targetname");
            array::run_all(a_ents, &hide);
        } else if (isdefined(var_55b4f21e.var_b94164e)) {
            a_ents = getentarray(clientnum, var_55b4f21e.var_b94164e, "targetname");
            array::run_all(a_ents, &show);
        }
        if (!(isdefined(_e_array[clientnum].var_463f8196) && _e_array[clientnum].var_463f8196)) {
            if (isdefined(var_55b4f21e.preparehide) && var_55b4f21e.preparehide) {
                _e_array[clientnum] hide();
                return;
            }
            if (isdefined(var_55b4f21e.prepareshow) && var_55b4f21e.prepareshow) {
                _e_array[clientnum] show();
            }
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb424a8a5, Offset: 0x36e0
    // Size: 0x1ba
    function _prepare(clientnum) {
        var_55b4f21e = function_730a4c60(_str_shot);
        if (!(isdefined(_s.issiege) && _s.issiege)) {
            if (!_e_array[clientnum] hasanimtree()) {
                _e_array[clientnum] useanimtree("generic");
            }
        }
        _e_array[clientnum].anim_debug_name = _s.name;
        function_4b3d4226(clientnum);
        if (_o_scene._s scene::is_igc()) {
            _e_array[clientnum] sethighdetail(1);
        }
        _e_array[clientnum] flagsys::set(#"scene");
        _e_array[clientnum] flagsys::set(_o_scene._str_name);
        _e_array[clientnum].current_scene = _o_scene._str_name;
        _e_array[clientnum].finished_scene = undefined;
    }

    // Namespace csceneobject/scene_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3aeef457, Offset: 0x3318
    // Size: 0x3bc
    function _spawn(clientnum, b_hide = 1) {
        restore_saved_ent(clientnum);
        if (!isdefined(_e_array[clientnum])) {
            b_allows_multiple = [[ scene() ]]->allows_multiple();
            _e_array[clientnum] = scene::get_existing_ent(clientnum, _str_name);
            if (!isdefined(_e_array[clientnum]) && isdefined(_s.name) && !b_allows_multiple) {
                _e_array[clientnum] = scene::get_existing_ent(clientnum, _s.name);
            }
            if (!isdefined(_e_array[clientnum]) && !(isdefined(_s.nospawn) && _s.nospawn) && !_b_spawnonce_used && isdefined(_s.model)) {
                _e_align = get_align_ent(clientnum);
                _e_array[clientnum] = util::spawn_anim_model(clientnum, _s.model, _e_align.origin, _e_align.angles);
                cscriptbundleobjectbase::error(!isdefined(_e_array[clientnum]), "util::spawn_anim_model returned undefined");
                if (_s.type === "fakeplayer") {
                    _e_array[clientnum] useanimtree("all_player");
                    _e_array[clientnum].animtree = "all_player";
                }
                if (isdefined(_e_array[clientnum])) {
                    if (b_hide && !(isdefined(_e_array[clientnum].var_463f8196) && _e_array[clientnum].var_463f8196)) {
                        _e_array[clientnum] hide();
                    }
                    _e_array[clientnum].scene_spawned = _o_scene._s.name;
                } else {
                    cscriptbundleobjectbase::error(!(isdefined(_s.nospawn) && _s.nospawn), "No entity exists with matching name of scene object.");
                }
            }
        }
        if (isdefined(_e_array[clientnum])) {
            [[ _o_scene ]]->assign_ent(self, _e_array[clientnum], clientnum);
            _prepare(clientnum);
        }
        flagsys::set(#"ready");
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe6e23fee, Offset: 0x32f8
    // Size: 0x12
    function get_orig_name() {
        return _s.name;
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xcd64227a, Offset: 0x32e0
    // Size: 0xa
    function get_name() {
        return _str_name;
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xbed0ca52, Offset: 0x3260
    // Size: 0x76
    function _assign_unique_name() {
        if (isdefined(_s.name)) {
            _str_name = _s.name;
            return;
        }
        _str_name = _o_scene._str_name + "_noname" + [[ scene() ]]->get_object_id();
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x16748a86, Offset: 0x3248
    // Size: 0xa
    function scene() {
        return _o_scene;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x934fa303, Offset: 0x3068
    // Size: 0x1d2
    function get_align_ent(clientnum) {
        e_align = undefined;
        n_shot = get_shot(_str_shot);
        if (isdefined(n_shot) && isdefined(_s.shots[n_shot].aligntarget)) {
            var_690ec5fb = _s.shots[n_shot].aligntarget;
        } else if (isdefined(_s.aligntarget) && !(_s.aligntarget === _o_scene._s.aligntarget)) {
            var_690ec5fb = _s.aligntarget;
        }
        if (isdefined(var_690ec5fb)) {
            a_scene_ents = [[ _o_scene ]]->get_ents();
            if (isdefined(a_scene_ents[clientnum][var_690ec5fb])) {
                e_align = a_scene_ents[clientnum][var_690ec5fb];
            } else {
                e_align = scene::get_existing_ent(clientnum, var_690ec5fb);
            }
            cscriptbundleobjectbase::error(!isdefined(e_align), "Align target '" + (isdefined(var_690ec5fb) ? "" + var_690ec5fb : "") + "' doesn't exist for scene object.");
        }
        if (!isdefined(e_align)) {
            e_align = [[ scene() ]]->get_align_ent(clientnum);
        }
        return e_align;
    }

    // Namespace csceneobject/scene_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x779932d5, Offset: 0x2d28
    // Size: 0x334
    function finish_per_client(clientnum, b_clear = 0, b_finished = 0) {
        if (!is_alive(clientnum)) {
            _cleanup(clientnum);
            _e_array[clientnum] = undefined;
            _is_valid = 0;
        }
        flagsys::set(#"ready");
        flagsys::set(#"done");
        if (isdefined(_e_array[clientnum])) {
            if (!b_finished) {
                _e_array[clientnum] stopsounds();
            }
            if (isplayer(_e_array[clientnum]) || _s.type === "sharedplayer" || _s.type === "player") {
                if (scene::function_b260bdcc(_o_scene._str_name, _str_shot, _o_scene._e_root) || b_clear) {
                    stopmaincamxcam(clientnum);
                }
            } else if (is_alive(clientnum) && (b_finished && isdefined(_s.deletewhenfinished) && _s.deletewhenfinished || b_clear)) {
                _e_array[clientnum] delete();
            }
        } else if (_s.type === "sharedplayer" || _s.type === "player") {
            result = 0;
            if (isdefined(_o_scene) && isdefined(_o_scene._str_name) && isdefined(_o_scene._e_root) && isdefined(_str_shot)) {
                result = scene::function_b260bdcc(_o_scene._str_name, _str_shot, _o_scene._e_root);
            }
            if (result || b_clear) {
                stopmaincamxcam(clientnum);
            }
        }
        _cleanup(clientnum);
    }

    // Namespace csceneobject/scene_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa90f8e0d, Offset: 0x2c20
    // Size: 0xfc
    function finish(b_clear = 0, b_finished = 0) {
        self notify(#"new_state");
        if (isdefined(_n_clientnum)) {
            finish_per_client(_n_clientnum, b_clear, b_finished);
            return;
        }
        for (clientnum = 1; clientnum < getmaxlocalclients(); clientnum++) {
            if (isdefined(function_5c10bd79(clientnum))) {
                finish_per_client(clientnum, b_clear, b_finished);
            }
        }
        finish_per_client(0, b_clear, b_finished);
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3fa10d0, Offset: 0x2af8
    // Size: 0x11c
    function function_ebbbd00d() {
        if (_b_first_frame) {
            return;
        }
        n_spacer_min = var_55b4f21e.spacermin;
        n_spacer_max = var_55b4f21e.spacermax;
        if (!is_skipping_scene() && (isdefined(n_spacer_min) || isdefined(n_spacer_max))) {
            if (isdefined(n_spacer_min) && isdefined(n_spacer_max)) {
                if (!cscriptbundleobjectbase::error(n_spacer_min >= n_spacer_max, "Spacer Min value must be less than Spacer Max value!")) {
                    run_wait(randomfloatrange(n_spacer_min, n_spacer_max));
                }
                return;
            }
            if (isdefined(n_spacer_min)) {
                run_wait(n_spacer_min);
                return;
            }
            if (isdefined(n_spacer_max)) {
                run_wait(n_spacer_max);
            }
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3704994a, Offset: 0x2ab8
    // Size: 0x36
    function function_587971b6() {
        _n_blend = isdefined(var_55b4f21e.blend) ? var_55b4f21e.blend : 0;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xb0f378a9, Offset: 0x2a28
    // Size: 0x86
    function function_dd4f74e1(clientnum) {
        if (isdefined(_s.firstframe) && _s.firstframe && _o_scene._str_mode == "init" && isdefined(_e_array[clientnum])) {
            _b_first_frame = 1;
            return;
        }
        _b_first_frame = 0;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xae65e076, Offset: 0x29d8
    // Size: 0x44
    function function_ee94f77(clientnum) {
        function_dd4f74e1(clientnum);
        function_587971b6();
        function_ebbbd00d();
    }

    // Namespace csceneobject/scene_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xec6a4008, Offset: 0x26b8
    // Size: 0x314
    function play_per_client(clientnum, n_start_time, b_looping = undefined) {
        self endon(#"new_state");
        util::waitforclient(clientnum);
        _spawn(clientnum);
        n_shot = get_shot(_str_shot);
        var_5e0d27b8 = function_1263065a(n_shot);
        function_ee94f77(clientnum);
        var_3f83c458 = array("blend", "cameraswitcher", "anim");
        foreach (str_entry_type in var_3f83c458) {
            if (!is_alive(clientnum)) {
                break;
            }
            foreach (n_entry in var_5e0d27b8) {
                entry = get_entry(n_shot, n_entry, str_entry_type);
                if (isdefined(entry)) {
                    switch (str_entry_type) {
                    case #"cameraswitcher":
                        thread _play_camera_anim(clientnum, entry, n_start_time);
                        break;
                    case #"anim":
                        _play_anim(clientnum, entry, 1, _n_blend, _s.mainshot, b_looping, n_start_time);
                        break;
                    case #"blend":
                        _n_blend = entry;
                        break;
                    default:
                        cscriptbundleobjectbase::error(1, "Bad timeline entry type '" + str_entry_type + "'.");
                        break;
                    }
                }
            }
        }
        function_54266b24();
        thread finish_per_client(clientnum, 0, 1);
    }

    // Namespace csceneobject/scene_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x57e120e5, Offset: 0x24b0
    // Size: 0x1fc
    function play(str_shot = "play", n_start_time, b_looping = undefined) {
        flagsys::clear(#"ready");
        flagsys::clear(#"done");
        flagsys::clear(#"main_done");
        self notify(#"new_state");
        self endon(#"new_state");
        self notify(#"play");
        waittillframeend();
        [[ _o_scene ]]->function_7a1288f1(str_shot);
        _str_shot = str_shot;
        var_55b4f21e = function_730a4c60(_str_shot);
        cscriptbundleobjectbase::error(!isdefined(var_55b4f21e), "Shot struct is not defined for this object. Check and make sure that \"" + _str_shot + "\" is a valid shot name for this scene bundle");
        if (isdefined(_n_clientnum)) {
            play_per_client(_n_clientnum, n_start_time, b_looping);
            return;
        }
        for (clientnum = 1; clientnum < getmaxlocalclients(); clientnum++) {
            if (isdefined(function_5c10bd79(clientnum))) {
                thread play_per_client(clientnum, n_start_time, b_looping);
            }
        }
        play_per_client(0, n_start_time, b_looping);
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x600b2005, Offset: 0x2238
    // Size: 0x26c
    function initialize_per_client(clientnum) {
        self endon(#"new_state");
        util::waitforclient(clientnum);
        n_shot = get_shot(_str_shot);
        _e_array[clientnum] show();
        function_ee94f77(clientnum);
        if (isdefined(_s.shots) && isdefined(_s.shots[n_shot]) && isarray(_s.shots[n_shot].entry)) {
            foreach (s_entry in _s.shots[n_shot].entry) {
                if (isdefined(s_entry.("anim"))) {
                    var_ad4f5efa = s_entry.("anim");
                    if (_b_first_frame) {
                        _play_anim(clientnum, var_ad4f5efa, 0, undefined, _s.mainshot);
                        break;
                    }
                    if (isanimlooping(clientnum, var_ad4f5efa)) {
                        thread _play_anim(clientnum, var_ad4f5efa, 1, undefined, _s.mainshot);
                        continue;
                    }
                    _play_anim(clientnum, var_ad4f5efa, 1, undefined, _s.mainshot);
                }
            }
        }
        flagsys::set(#"ready");
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9445df53, Offset: 0x2200
    // Size: 0x30
    function is_skipping_scene() {
        return isdefined([[ _o_scene ]]->is_skipping_scene()) && [[ _o_scene ]]->is_skipping_scene();
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xacd90a9b, Offset: 0x2198
    // Size: 0x5e
    function run_wait(wait_time) {
        wait_start_time = 0;
        while (wait_start_time < wait_time && !is_skipping_scene()) {
            wait_start_time += 0.016;
            waitframe(1);
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xfeb224a9, Offset: 0x20d0
    // Size: 0xba
    function function_1263065a(n_shot = 0) {
        var_5e0d27b8 = [];
        if (isdefined(_s.shots[n_shot]) && isdefined(_s.shots[n_shot].entry)) {
            var_5e0d27b8 = getarraykeys(_s.shots[n_shot].entry);
            var_5e0d27b8 = array::sort_by_value(var_5e0d27b8, 1);
        }
        return var_5e0d27b8;
    }

    // Namespace csceneobject/scene_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xb794ea6f, Offset: 0x1fb8
    // Size: 0x10a
    function find_entry(n_shot = 0, str_entry_type) {
        if (isdefined(_s.shots[n_shot]) && isdefined(_s.shots[n_shot].entry)) {
            foreach (s_entry in _s.shots[n_shot].entry) {
                if (isdefined(s_entry.(str_entry_type))) {
                    entry = s_entry.(str_entry_type);
                    break;
                }
            }
        }
        return entry;
    }

    // Namespace csceneobject/scene_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x1ac1aebf, Offset: 0x1eb0
    // Size: 0xfe
    function get_entry(n_shot = 0, n_entry, str_entry_type) {
        if (isdefined(_s.shots[n_shot]) && isdefined(_s.shots[n_shot].entry) && isdefined(_s.shots[n_shot].entry[n_entry])) {
            if (isdefined(_s.shots[n_shot].entry[n_entry].(str_entry_type))) {
                entry = _s.shots[n_shot].entry[n_entry].(str_entry_type);
            }
        }
        return entry;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x95784002, Offset: 0x1e50
    // Size: 0x54
    function function_71b06874(n_shot) {
        if (isdefined(_s.shots[n_shot].disableshot) && _s.shots[n_shot].disableshot) {
            return false;
        }
        return true;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x58381ab5, Offset: 0x1db8
    // Size: 0x90
    function function_730a4c60(str_shot) {
        foreach (s_shot in _s.shots) {
            if (str_shot === s_shot.name) {
                return s_shot;
            }
        }
        return undefined;
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x45cae61a, Offset: 0x1d20
    // Size: 0x90
    function get_shot(str_shot) {
        foreach (n_shot, s_shot in _s.shots) {
            if (str_shot === s_shot.name) {
                return n_shot;
            }
        }
        return undefined;
    }

    // Namespace csceneobject/scene_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x9403942e, Offset: 0x19a0
    // Size: 0x374
    function initialize() {
        flagsys::clear(#"ready");
        flagsys::clear(#"done");
        flagsys::clear(#"main_done");
        self notify(#"new_state");
        self endon(#"new_state");
        self notify(#"init");
        waittillframeend();
        _str_shot = scene::function_de6a7579(_o_scene._str_name, "init", _o_scene._e_root);
        var_55b4f21e = function_730a4c60(_str_shot);
        cscriptbundleobjectbase::error(!isdefined(var_55b4f21e), "Shot struct is not defined for this object. Check and make sure that \"" + _str_shot + "\" is a valid shot name for this scene bundle");
        if (isdefined(_n_clientnum)) {
            _spawn(_n_clientnum, isdefined(_s.firstframe) && _s.firstframe || isdefined(_s.initanim) || isdefined(_s.initanimloop));
        } else {
            _spawn(0, isdefined(_s.firstframe) && _s.firstframe || isdefined(_s.initanim) || isdefined(_s.initanimloop));
            var_2d560016 = getmaxlocalclients();
            for (clientnum = 1; clientnum < var_2d560016; clientnum++) {
                if (isdefined(function_5c10bd79(clientnum))) {
                    _spawn(clientnum, isdefined(_s.firstframe) && _s.firstframe || isdefined(_s.initanim) || isdefined(_s.initanimloop));
                }
            }
        }
        if (isdefined(_n_clientnum)) {
            thread initialize_per_client(_n_clientnum);
            return;
        }
        for (clientnum = 1; clientnum < getmaxlocalclients(); clientnum++) {
            if (isdefined(function_5c10bd79(clientnum))) {
                thread initialize_per_client(clientnum);
            }
        }
        initialize_per_client(0);
    }

    // Namespace csceneobject/scene_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1261ad37, Offset: 0x18d0
    // Size: 0xc6
    function restore_saved_ent(clientnum) {
        if (isdefined(_o_scene._e_root) && isdefined(_o_scene._e_root.scene_ents) && isdefined(_o_scene._e_root.scene_ents[clientnum])) {
            if (isdefined(_o_scene._e_root.scene_ents[clientnum][_str_name])) {
                _e_array[clientnum] = _o_scene._e_root.scene_ents[clientnum][_str_name];
            }
        }
    }

    // Namespace csceneobject/scene_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0xa797c675, Offset: 0x1870
    // Size: 0x56
    function first_init(s_objdef, o_scene, e_ent, localclientnum) {
        cscriptbundleobjectbase::init(s_objdef, o_scene, e_ent, localclientnum);
        _assign_unique_name();
        return self;
    }

}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xcbdeac87, Offset: 0x6f8
// Size: 0x11c
function player_scene_animation_skip(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    anim_name = self getcurrentanimscriptedname();
    if (isdefined(anim_name) && anim_name != "") {
        if (!isanimlooping(localclientnum, anim_name)) {
            /#
                if (getdvarint(#"debug_scene_skip", 0) > 0) {
                    printtoprightln("<dev string:x38>" + anim_name + "<dev string:x58>" + gettime(), (0.6, 0.6, 0.6));
                }
            #/
            self setanimtimebyname(anim_name, 1, 1);
        }
    }
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xe4829cfb, Offset: 0x820
// Size: 0x94
function player_scene_skip_completed(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    flushsubtitles(localclientnum);
    setdvar(#"r_graphiccontentblur", 0);
    setdvar(#"r_makedark_enable", 0);
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb4916ab3, Offset: 0x80d0
// Size: 0xba
function get_existing_ent(clientnum, str_name) {
    e = getent(clientnum, str_name, "animname");
    if (!isdefined(e)) {
        e = getent(clientnum, str_name, "script_animname");
        if (!isdefined(e)) {
            e = getent(clientnum, str_name, "targetname");
            if (!isdefined(e)) {
                e = struct::get(str_name, "targetname");
            }
        }
    }
    return e;
}

// Namespace scene/scene_shared
// Params 0, eflags: 0x2
// Checksum 0x10b23919, Offset: 0x8198
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"scene", &__init__, &__main__, undefined);
}

// Namespace scene/scene_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xb1c9121f, Offset: 0x81e8
// Size: 0x4a4
function __init__() {
    level.scenedefs = getscriptbundlenames("scene");
    level.active_scenes = [];
    level.var_1e798f4c = [];
    cp_skip_scene_menu::register("cp_skip_scene_menu");
    level.server_scenes = [];
    foreach (str_scenename in level.scenedefs) {
        s_scenedef = getscriptbundle(str_scenename);
        if (s_scenedef.vmtype === "server") {
            continue;
        }
        s_scenedef.editaction = undefined;
        s_scenedef.newobject = undefined;
        if (s_scenedef is_igc()) {
            level.server_scenes[s_scenedef.name] = s_scenedef;
            continue;
        }
        if (s_scenedef.vmtype === "both") {
            n_clientbits = getminbitcountfornum(3);
            /#
                n_clientbits = getminbitcountfornum(6);
            #/
            clientfield::register("world", s_scenedef.name, 1, n_clientbits, "int", &cf_server_sync, 0, 0);
        }
    }
    clientfield::register("toplayer", "postfx_igc", 1, 2, "counter", &postfx_igc, 0, 0);
    clientfield::register("world", "in_igc", 1, 4, "int", &in_igc, 0, 0);
    clientfield::register("toplayer", "postfx_cateye", 1, 1, "int", &postfx_cateye, 0, 0);
    clientfield::register("toplayer", "player_scene_skip_completed", 1, 2, "counter", &player_scene_skip_completed, 0, 0);
    clientfield::register("toplayer", "player_pbg_bank_scene_system", 1, getminbitcountfornum(3), "int", &player_pbg_bank_scene_system, 0, 0);
    clientfield::register("allplayers", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
    clientfield::register("actor", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
    clientfield::register("vehicle", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
    clientfield::register("scriptmover", "player_scene_animation_skip", 1, 2, "counter", &player_scene_animation_skip, 0, 0);
    callback::on_localclient_shutdown(&on_localplayer_shutdown);
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xa53137f, Offset: 0x8698
// Size: 0x112
function player_pbg_bank_scene_system(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 0:
        setpbgactivebank(localclientnum, 1);
        break;
    case 1:
        setpbgactivebank(localclientnum, 2);
        break;
    case 2:
        setpbgactivebank(localclientnum, 4);
        break;
    case 3:
        setpbgactivebank(localclientnum, 8);
        break;
    }
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x62309c44, Offset: 0x87b8
// Size: 0x272
function in_igc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    player = function_5c10bd79(localclientnum);
    n_entnum = player getentitynumber();
    b_igc_active = 0;
    if (newval & 1 << n_entnum) {
        b_igc_active = 1;
    }
    if (b_igc_active) {
        setsoundcontext("igc", "on");
        flushsubtitles(localclientnum);
    } else {
        setsoundcontext("igc", "");
    }
    igcactive(localclientnum, b_igc_active);
    level notify(#"igc_activated", {#b_active:b_igc_active});
    if (isarray(level.var_25e5c959)) {
        foreach (var_ed8205c6 in level.var_25e5c959) {
            a_players = getplayers(localclientnum);
            foreach (player in a_players) {
                if (isdefined(player)) {
                    player thread [[ var_ed8205c6 ]](localclientnum, b_igc_active);
                }
            }
        }
    }
    /#
    #/
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0x93e33a87, Offset: 0x8a38
// Size: 0x92
function function_2e58158b(func_igc) {
    if (!isdefined(level.var_25e5c959)) {
        level.var_25e5c959 = [];
    } else if (!isarray(level.var_25e5c959)) {
        level.var_25e5c959 = array(level.var_25e5c959);
    }
    level.var_25e5c959[level.var_25e5c959.size] = func_igc;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0xa7559f14, Offset: 0x8ad8
// Size: 0x2c
function function_e78401d1(func_igc) {
    arrayremovevalue(level.var_25e5c959, func_igc);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x68e80371, Offset: 0x8b10
// Size: 0xac
function function_f9036ea7(b_enable) {
    if (!sessionmodeiscampaigngame()) {
        return;
    }
    if (b_enable) {
        if (!(isdefined(self.var_c7329df1) && self.var_c7329df1)) {
            self.var_c7329df1 = 1;
            self postfx::playpostfxbundle("pstfx_catseye_cinematic");
        }
        return;
    }
    if (isdefined(self.var_c7329df1) && self.var_c7329df1) {
        self.var_c7329df1 = undefined;
        self postfx::stoppostfxbundle("pstfx_catseye_cinematic");
    }
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x6ec55f28, Offset: 0x8bc8
// Size: 0xb4
function postfx_cateye(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    player = function_5c10bd79(localclientnum);
    level notify(#"sndlevelstartduck_shutoff");
    if (newval) {
        player function_f9036ea7(1);
        return;
    }
    player function_f9036ea7(0);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x8542ef33, Offset: 0x8c88
// Size: 0xd2
function private on_localplayer_shutdown(localclientnum) {
    localplayer = self;
    codelocalplayer = function_5c10bd79(localclientnum);
    if (isdefined(localplayer) && isplayer(localplayer)) {
        if (isdefined(codelocalplayer)) {
            if (localplayer == codelocalplayer) {
                filter::disable_filter_base_frame_transition(localplayer, 5);
                filter::disable_filter_sprite_transition(localplayer, 5);
                filter::disable_filter_frame_transition(localplayer, 5);
                localplayer.postfx_igc_on = undefined;
                localplayer.pstfx_world_construction = 0;
            }
        }
    }
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x6eb6fe89, Offset: 0x8d68
// Size: 0x10f6
function postfx_igc(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (isdefined(self.postfx_igc_on) && self.postfx_igc_on) {
        return;
    }
    if (sessionmodeiszombiesgame()) {
        postfx_igc_zombies(localclientnum);
        return;
    }
    if (newval == 3) {
        self thread postfx_igc_short(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump);
        return;
    }
    self.postfx_igc_on = 1;
    codeimagename = "postfx_igc_image" + localclientnum;
    createscenecodeimage(localclientnum, codeimagename);
    captureframe(localclientnum, codeimagename);
    filter::init_filter_base_frame_transition(self);
    filter::init_filter_sprite_transition(self);
    filter::init_filter_frame_transition(self);
    setfilterpasscodetexture(localclientnum, 5, 0, 0, codeimagename);
    setfilterpasscodetexture(localclientnum, 5, 1, 0, codeimagename);
    setfilterpasscodetexture(localclientnum, 5, 2, 0, codeimagename);
    filter::enable_filter_base_frame_transition(self, 5);
    filter::enable_filter_sprite_transition(self, 5);
    filter::enable_filter_frame_transition(self, 5);
    filter::set_filter_base_frame_transition_warp(self, 5, 1);
    filter::set_filter_base_frame_transition_boost(self, 5, 0.5);
    filter::set_filter_base_frame_transition_durden(self, 5, 1);
    filter::set_filter_base_frame_transition_durden_blur(self, 5, 1);
    filter::set_filter_sprite_transition_elapsed(self, 5, 0);
    filter::set_filter_sprite_transition_octogons(self, 5, 1);
    filter::set_filter_sprite_transition_blur(self, 5, 0);
    filter::set_filter_sprite_transition_boost(self, 5, 0);
    filter::set_filter_frame_transition_light_hexagons(self, 5, 0);
    filter::set_filter_frame_transition_heavy_hexagons(self, 5, 0);
    filter::set_filter_frame_transition_flare(self, 5, 0);
    filter::set_filter_frame_transition_blur(self, 5, 0);
    filter::set_filter_frame_transition_iris(self, 5, 0);
    filter::set_filter_frame_transition_saved_frame_reveal(self, 5, 0);
    filter::set_filter_frame_transition_warp(self, 5, 0);
    filter::set_filter_sprite_transition_move_radii(self, 5, 0, 0);
    filter::set_filter_base_frame_transition_warp(self, 5, 1);
    filter::set_filter_base_frame_transition_boost(self, 5, 1);
    n_hex = 0;
    b_streamer_wait = 1;
    for (i = 0; i < 2000; i += int(0.016 * 1000)) {
        st = float(i) / 1000;
        if (b_streamer_wait && st >= 0.65) {
            for (n_streamer_time_total = 0; !isstreamerready() && n_streamer_time_total < 5000; n_streamer_time_total += gettime() - n_streamer_time) {
                n_streamer_time = gettime();
                for (j = int(0.65 * 1000); j < 1150; j += int(0.016 * 1000)) {
                    jt = float(j) / 1000;
                    filter::set_filter_frame_transition_heavy_hexagons(self, 5, mapfloat(0.65, 1.15, 0, 1, jt));
                    waitframe(1);
                }
                for (j = int(1.15 * 1000); j < 650; j -= int(0.016 * 1000)) {
                    jt = float(j) / 1000;
                    filter::set_filter_frame_transition_heavy_hexagons(self, 5, mapfloat(0.65, 1.15, 0, 1, jt));
                    waitframe(1);
                }
            }
            b_streamer_wait = 0;
        }
        if (st <= 0.5) {
            filter::set_filter_frame_transition_iris(self, 5, mapfloat(0, 0.5, 0, 1, st));
        } else if (st > 0.5 && st <= 0.85) {
            filter::set_filter_frame_transition_iris(self, 5, 1 - mapfloat(0.5, 0.85, 0, 1, st));
        } else {
            filter::set_filter_frame_transition_iris(self, 5, 0);
        }
        if (newval == 2) {
            if (st > 1 && !(isdefined(self.pstfx_world_construction) && self.pstfx_world_construction)) {
                self thread postfx::playpostfxbundle(#"pstfx_world_construction");
                self.pstfx_world_construction = 1;
            }
        }
        if (st > 0.5 && st <= 1) {
            n_hex = mapfloat(0.5, 1, 0, 1, st);
            filter::set_filter_frame_transition_light_hexagons(self, 5, n_hex);
            if (st >= 0.8) {
                filter::set_filter_frame_transition_flare(self, 5, mapfloat(0.8, 1, 0, 1, st));
            }
        } else if (st > 1 && st < 1.5) {
            filter::set_filter_frame_transition_light_hexagons(self, 5, 1);
            filter::set_filter_frame_transition_flare(self, 5, 1);
        } else {
            filter::set_filter_frame_transition_light_hexagons(self, 5, 0);
            filter::set_filter_frame_transition_flare(self, 5, 0);
        }
        if (st > 0.65 && st <= 1.15) {
            filter::set_filter_frame_transition_heavy_hexagons(self, 5, mapfloat(0.65, 1.15, 0, 1, st));
        } else if (st > 1.21 && st < 1.5) {
            filter::set_filter_frame_transition_heavy_hexagons(self, 5, 1);
        } else {
            filter::set_filter_frame_transition_heavy_hexagons(self, 5, 0);
        }
        if (st > 1.21 && st <= 1.5) {
            filter::set_filter_frame_transition_blur(self, 5, mapfloat(1, 1.5, 0, 1, st));
            filter::set_filter_sprite_transition_boost(self, 5, mapfloat(1, 1.5, 0, 1, st));
            filter::set_filter_frame_transition_saved_frame_reveal(self, 5, mapfloat(1, 1.5, 0, 1, st));
            filter::set_filter_base_frame_transition_durden_blur(self, 5, 1 - mapfloat(1, 1.5, 0, 1, st));
            filter::set_filter_sprite_transition_blur(self, 5, mapfloat(1, 1.5, 0, 0.1, st));
        } else if (st > 1.5) {
            filter::set_filter_frame_transition_blur(self, 5, 1);
            filter::set_filter_sprite_transition_boost(self, 5, 1);
            filter::set_filter_frame_transition_saved_frame_reveal(self, 5, 1);
            filter::set_filter_base_frame_transition_durden_blur(self, 5, 0);
            filter::set_filter_sprite_transition_blur(self, 5, 0.1);
        }
        if (st > 1 && st <= 1.45) {
            filter::set_filter_base_frame_transition_boost(self, 5, mapfloat(1, 1.45, 0.5, 1, st));
        } else if (st > 1.45 && st < 1.75) {
            filter::set_filter_base_frame_transition_boost(self, 5, 1);
        } else if (st >= 1.75) {
            filter::set_filter_base_frame_transition_boost(self, 5, 1 - mapfloat(1.75, 2, 0, 1, st));
        }
        if (st >= 1.75) {
            val = 1 - mapfloat(1.75, 2, 0, 1, st);
            filter::set_filter_frame_transition_blur(self, 5, val);
            filter::set_filter_base_frame_transition_warp(self, 5, val);
        }
        if (st >= 1.25) {
            val = 1 - mapfloat(1.25, 1.75, 0, 1, st);
            filter::set_filter_sprite_transition_octogons(self, 5, val);
        }
        if (st >= 1.75 && st < 2) {
            filter::set_filter_base_frame_transition_durden(self, 5, 1 - mapfloat(1.75, 2, 0, 1, st));
        }
        if (st > 1) {
            filter::set_filter_sprite_transition_elapsed(self, 5, i - 1000);
            outer_radii = mapfloat(1, 1.5, 0, 2000, st);
            filter::set_filter_sprite_transition_move_radii(self, 5, outer_radii - 256, outer_radii);
        }
        if (st > 1.15 && st < 1.85) {
            filter::set_filter_frame_transition_warp(self, 5, -1 * mapfloat(1.15, 1.85, 0, 1, st));
        } else if (st >= 1.85) {
            filter::set_filter_frame_transition_warp(self, 5, -1 * (1 - mapfloat(1.85, 2, 0, 1, st)));
        }
        waitframe(1);
    }
    filter::disable_filter_base_frame_transition(self, 5);
    filter::disable_filter_sprite_transition(self, 5);
    filter::disable_filter_frame_transition(self, 5);
    self.pstfx_world_construction = 0;
    freecodeimage(localclientnum, codeimagename);
    self.postfx_igc_on = undefined;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x42846844, Offset: 0x9e68
// Size: 0x56
function postfx_igc_zombies(localclientnum) {
    self lui::screen_fade_out(0, "black");
    waitframe(1);
    self lui::screen_fade_in(0.3);
    self.postfx_igc_on = undefined;
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x65b7497a, Offset: 0x9ec8
// Size: 0x396
function postfx_igc_short(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    self.postfx_igc_on = 1;
    codeimagename = "postfx_igc_image" + localclientnum;
    createscenecodeimage(localclientnum, codeimagename);
    captureframe(localclientnum, codeimagename);
    filter::init_filter_base_frame_transition(self);
    filter::init_filter_sprite_transition(self);
    filter::init_filter_frame_transition(self);
    setfilterpasscodetexture(localclientnum, 5, 0, 0, codeimagename);
    setfilterpasscodetexture(localclientnum, 5, 1, 0, codeimagename);
    setfilterpasscodetexture(localclientnum, 5, 2, 0, codeimagename);
    filter::enable_filter_base_frame_transition(self, 5);
    filter::enable_filter_sprite_transition(self, 5);
    filter::enable_filter_frame_transition(self, 5);
    filter::set_filter_frame_transition_iris(self, 5, 0);
    b_streamer_wait = 1;
    for (i = 0; i < 850; i += int(0.016 * 1000)) {
        st = float(i) / 1000;
        if (st <= 0.5) {
            filter::set_filter_frame_transition_iris(self, 5, mapfloat(0, 0.5, 0, 1, st));
        } else if (st > 0.5 && st <= 0.85) {
            filter::set_filter_frame_transition_iris(self, 5, 1 - mapfloat(0.5, 0.85, 0, 1, st));
        } else {
            filter::set_filter_frame_transition_iris(self, 5, 0);
        }
        waitframe(1);
    }
    filter::disable_filter_base_frame_transition(self, 5);
    filter::disable_filter_sprite_transition(self, 5);
    filter::disable_filter_frame_transition(self, 5);
    freecodeimage(localclientnum, codeimagename);
    self.postfx_igc_on = undefined;
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x159eab14, Offset: 0xa268
// Size: 0x1ca
function cf_server_sync(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 0:
        if (is_active(fieldname)) {
            level thread stop(fieldname);
        }
        break;
    case 1:
        level thread init(fieldname);
        break;
    case 2:
        level thread play(fieldname);
        break;
    }
    /#
        switch (newval) {
        case 3:
            if (is_active(fieldname)) {
                level thread stop(fieldname, 1, undefined, undefined, 1);
            }
            break;
        case 4:
            level thread init(fieldname, undefined, undefined, 1);
            break;
        case 5:
            level thread play(fieldname, undefined, undefined, 1);
            break;
        }
    #/
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x54aee2dc, Offset: 0xa440
// Size: 0x15a
function remove_invalid_scene_objects(s_scenedef) {
    a_invalid_object_indexes = [];
    if (isdefined(s_scenedef.objects)) {
        foreach (i, s_object in s_scenedef.objects) {
            if (!isdefined(s_object.name) && !isdefined(s_object.model)) {
                if (!isdefined(a_invalid_object_indexes)) {
                    a_invalid_object_indexes = [];
                } else if (!isarray(a_invalid_object_indexes)) {
                    a_invalid_object_indexes = array(a_invalid_object_indexes);
                }
                a_invalid_object_indexes[a_invalid_object_indexes.size] = i;
            }
        }
    }
    for (i = a_invalid_object_indexes.size - 1; i >= 0; i--) {
        arrayremoveindex(s_scenedef.objects, a_invalid_object_indexes[i]);
    }
    return s_scenedef;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xbc17192b, Offset: 0xa5a8
// Size: 0xca
function function_585fb738(str_scene, var_79fe29db) {
    if (isdefined(str_scene)) {
        s_bundle = getscriptbundle(str_scene);
    } else {
        s_bundle = self;
        str_scene = s_bundle.name;
    }
    if (isdefined(s_bundle.igc) && s_bundle.igc) {
        return;
    }
    if (function_7aa3d2c6(str_scene) || get_player_count(str_scene) || isdefined(var_79fe29db) && var_79fe29db) {
        s_bundle.igc = 1;
    }
}

// Namespace scene/scene_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x2b001936, Offset: 0xa680
// Size: 0x18
function is_igc() {
    return isdefined(self.igc) && self.igc;
}

// Namespace scene/scene_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xa91cc9d4, Offset: 0xa6a0
// Size: 0x4e0
function __main__() {
    waitframe(1);
    if (isdefined(level.disablefxaniminsplitscreencount)) {
        if (isdefined(level.localplayers)) {
            if (level.localplayers.size >= level.disablefxaniminsplitscreencount) {
                return;
            }
        }
    }
    a_instances = arraycombine(struct::get_array("scriptbundle_scene", "classname"), struct::get_array("scriptbundle_fxanim", "classname"), 0, 0);
    foreach (s_instance in a_instances) {
        s_scenedef = getscriptbundle(s_instance.scriptbundlename);
        if (s_scenedef.vmtype !== "client") {
            continue;
        }
        if (isdefined(s_instance.scriptgroup_initscenes)) {
            trigs = getentarray(0, s_instance.scriptgroup_initscenes, "scriptgroup_initscenes");
            if (isdefined(trigs)) {
                foreach (trig in trigs) {
                    s_instance thread _trigger_init(trig);
                }
            }
        }
        if (isdefined(s_instance.scriptgroup_playscenes)) {
            trigs = getentarray(0, s_instance.scriptgroup_playscenes, "scriptgroup_playscenes");
            if (isdefined(trigs)) {
                foreach (trig in trigs) {
                    s_instance thread _trigger_play(trig);
                }
            }
        }
        if (isdefined(s_instance.scriptgroup_stopscenes)) {
            trigs = getentarray(0, s_instance.scriptgroup_stopscenes, "scriptgroup_stopscenes");
            if (isdefined(trigs)) {
                foreach (trig in trigs) {
                    s_instance thread _trigger_stop(trig);
                }
            }
        }
    }
    foreach (s_instance in a_instances) {
        s_scenedef = get_scenedef(s_instance.scriptbundlename);
        assert(isdefined(s_scenedef), "<dev string:x114>" + s_instance.origin + "<dev string:x126>" + s_instance.scriptbundlename + "<dev string:x13d>");
        if (s_scenedef.vmtype === "client") {
            if (isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 2) == 2) {
                s_instance thread play();
                continue;
            }
            if (isdefined(s_instance.spawnflags) && (s_instance.spawnflags & 1) == 1) {
                s_instance thread init();
            }
        }
    }
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x637db7cc, Offset: 0xab88
// Size: 0xbc
function _trigger_init(trig) {
    trig endon(#"death");
    s_waitresult = trig waittill(#"trigger");
    a_ents = [];
    if (get_player_count(self.scriptbundlename) > 0) {
        if (isplayer(s_waitresult.activator)) {
            a_ents[0] = s_waitresult.activator;
        }
    }
    self thread init(a_ents);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1eccec55, Offset: 0xac50
// Size: 0x108
function _trigger_play(trig) {
    trig endon(#"death");
    do {
        s_waitresult = trig waittill(#"trigger");
        a_ents = [];
        if (get_player_count(self.scriptbundlename) > 0) {
            if (isplayer(s_waitresult.activator)) {
                a_ents[0] = s_waitresult.activator;
            }
        }
        self thread play(a_ents);
    } while (isdefined(get_scenedef(self.scriptbundlename).looping) && get_scenedef(self.scriptbundlename).looping);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xbff58968, Offset: 0xad60
// Size: 0x54
function _trigger_stop(trig) {
    trig endon(#"death");
    trig waittill(#"trigger");
    self thread stop();
}

// Namespace scene/scene_shared
// Params 4, eflags: 0x21 linked variadic
// Checksum 0xe27ce2d4, Offset: 0xadc0
// Size: 0x184
function add_scene_func(str_scenedef, func, var_e21c4c4c = "play", ...) {
    assert(isdefined(getscriptbundle(str_scenedef)), "<dev string:x155>" + function_9e72a96(str_scenedef) + "<dev string:x13d>");
    var_e21c4c4c = tolower(var_e21c4c4c);
    if (!isdefined(level.scene_funcs)) {
        level.scene_funcs = [];
    }
    if (!isdefined(level.scene_funcs[str_scenedef])) {
        level.scene_funcs[str_scenedef] = [];
    }
    str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
    if (!isdefined(level.scene_funcs[str_scenedef][str_shot])) {
        level.scene_funcs[str_scenedef][str_shot] = [];
    }
    array::add(level.scene_funcs[str_scenedef][str_shot], array(func, vararg), 0);
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x0
// Checksum 0xfa1e6887, Offset: 0xaf50
// Size: 0x18e
function remove_scene_func(str_scenedef, func, var_e21c4c4c = "play") {
    assert(isdefined(getscriptbundle(str_scenedef)), "<dev string:x182>" + str_scenedef + "<dev string:x13d>");
    var_e21c4c4c = tolower(var_e21c4c4c);
    if (!isdefined(level.scene_funcs)) {
        level.scene_funcs = [];
    }
    str_shot = function_c776e5bd(str_scenedef, var_e21c4c4c);
    if (isdefined(level.scene_funcs[str_scenedef]) && isdefined(level.scene_funcs[str_scenedef][str_shot])) {
        for (i = level.scene_funcs[str_scenedef][str_shot].size - 1; i >= 0; i--) {
            if (level.scene_funcs[str_scenedef][str_shot][i][0] == func) {
                arrayremoveindex(level.scene_funcs[str_scenedef][str_shot], i);
            }
        }
    }
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x5 linked
// Checksum 0x77e4e9e6, Offset: 0xb0e8
// Size: 0x92
function private function_c776e5bd(str_scenedef, str_state) {
    str_shot = str_state;
    if (str_state == "init") {
        str_shot = function_de6a7579(str_scenedef, "init");
    } else if (str_state == "play") {
        str_shot = function_de6a7579(str_scenedef, "play");
    }
    return str_shot;
}

// Namespace scene/scene_shared
// Params 5, eflags: 0x0
// Checksum 0xba1d4990, Offset: 0xb188
// Size: 0x178
function spawn(arg1, arg2, arg3, arg4, b_test_run) {
    str_scenedef = arg1;
    assert(isdefined(str_scenedef), "<dev string:x1b2>");
    if (isvec(arg2)) {
        v_origin = arg2;
        v_angles = arg3;
        a_ents = arg4;
    } else {
        a_ents = arg2;
        v_origin = arg3;
        v_angles = arg4;
    }
    s_instance = spawnstruct();
    s_instance.origin = isdefined(v_origin) ? v_origin : (0, 0, 0);
    s_instance.angles = isdefined(v_angles) ? v_angles : (0, 0, 0);
    s_instance.classname = "scriptbundle_scene";
    s_instance.scriptbundlename = str_scenedef;
    s_instance struct::init();
    s_instance init(str_scenedef, a_ents, undefined, b_test_run);
    return s_instance;
}

// Namespace scene/scene_shared
// Params 4, eflags: 0x1 linked
// Checksum 0x38c9e4f5, Offset: 0xb308
// Size: 0x54
function init(arg1, arg2, arg3, b_test_run) {
    self thread play(arg1, arg2, arg3, b_test_run, "init");
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1eb0311a, Offset: 0xb368
// Size: 0xa2
function get_scenedef(str_scenedef) {
    s_scriptbundle = getscriptbundle(str_scenedef);
    assert(isdefined(s_scriptbundle) && isdefined(s_scriptbundle.objects), "<dev string:x1df>" + function_9e72a96(str_scenedef) + "<dev string:x1ef>");
    s_scriptbundle = fixup_scenedef(s_scriptbundle);
    return s_scriptbundle;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0x93e305a7, Offset: 0xb418
// Size: 0x150
function get_scenedefs(str_type = "scene") {
    a_scenedefs = [];
    foreach (str_scenedef in level.scenedefs) {
        s_scenedef = getscriptbundle(str_scenedef);
        if (s_scenedef.scenetype === str_type && s_scenedef.vmtype === "client") {
            s_scenedef = fixup_scenedef(s_scenedef);
            if (!isdefined(a_scenedefs)) {
                a_scenedefs = [];
            } else if (!isarray(a_scenedefs)) {
                a_scenedefs = array(a_scenedefs);
            }
            a_scenedefs[a_scenedefs.size] = s_scenedef;
        }
    }
    return a_scenedefs;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4b16e107, Offset: 0xb570
// Size: 0x860
function fixup_scenedef(s_scenedef) {
    assert(isdefined(s_scenedef.objects), "<dev string:x25d>");
    if (isdefined(s_scenedef.objects[0]) && isdefined(s_scenedef.objects[0].shots)) {
        return s_scenedef;
    }
    if (!isdefined(s_scenedef.ready_to_use)) {
        s_scenedef.ready_to_use = 1;
    } else {
        return s_scenedef;
    }
    a_invalid_object_indexes = [];
    foreach (i, s_object in s_scenedef.objects) {
        if (!isdefined(s_object.name) && !isdefined(s_object.model) && !(s_object.type === "player")) {
            if (!isdefined(a_invalid_object_indexes)) {
                a_invalid_object_indexes = [];
            } else if (!isarray(a_invalid_object_indexes)) {
                a_invalid_object_indexes = array(a_invalid_object_indexes);
            }
            a_invalid_object_indexes[a_invalid_object_indexes.size] = i;
        }
    }
    for (i = a_invalid_object_indexes.size - 1; i >= 0; i--) {
        arrayremoveindex(s_scenedef.objects, a_invalid_object_indexes[i]);
    }
    s_scenedef.editaction = undefined;
    s_scenedef.newobject = undefined;
    if (isstring(s_scenedef.femalebundle) || ishash(s_scenedef.femalebundle)) {
        s_female_bundle = struct::get_script_bundle("scene", s_scenedef.femalebundle);
        s_female_bundle.malebundle = s_scenedef.name;
        s_scenedef.s_female_bundle = s_female_bundle;
        s_female_bundle.s_male_bundle = s_scenedef;
    }
    if (isdefined(level.scene_sequence_names) && !isdefined(level.scene_sequence_names[s_scenedef.name])) {
        for (s_next_bundle = s_scenedef; isdefined(s_next_bundle); s_next_bundle = undefined) {
            level.scene_sequence_names[s_next_bundle.name] = s_scenedef.name;
            if (isdefined(s_next_bundle.nextscenebundle)) {
                s_next_bundle = getscriptbundle(s_next_bundle.nextscenebundle);
                continue;
            }
        }
    } else {
        level.scene_streamer_ignore[s_scenedef.name] = 1;
    }
    if (isstring(s_scenedef.nextscenebundle) || ishash(s_scenedef.nextscenebundle)) {
        s_next_bundle = s_scenedef;
        while (isdefined(s_next_bundle)) {
            if (isdefined(s_next_bundle.nextscenebundle)) {
                s_next_bundle = getscriptbundle(s_next_bundle.nextscenebundle);
            } else {
                s_next_bundle = undefined;
            }
            if (isdefined(s_next_bundle)) {
                s_scenedef.str_final_bundle = s_next_bundle.name;
            }
        }
        foreach (i, s_object in s_scenedef.objects) {
            if (s_object.type === "player") {
                s_object.disabletransitionout = 1;
            }
        }
        s_next_bundle = struct::get_script_bundle("scene", s_scenedef.nextscenebundle);
        s_scenedef.next_bundle = s_next_bundle;
        s_next_bundle.dontsync = 1;
        s_next_bundle.dontthrottle = 1;
        foreach (i, s_object in s_next_bundle.objects) {
            if (s_object.type === "player") {
                s_object.disabletransitionin = 1;
            }
            s_object.iscutscene = 1;
        }
        if (isdefined(s_next_bundle.femalebundle)) {
            s_next_female_bundle = struct::get_script_bundle("scene", s_next_bundle.femalebundle);
            if (isdefined(s_next_female_bundle)) {
                s_next_female_bundle.dontsync = 1;
                s_next_female_bundle.dontthrottle = 1;
                foreach (i, s_object in s_next_female_bundle.objects) {
                    if (s_object.type === "player") {
                        s_object.disabletransitionin = 1;
                    }
                    s_object.iscutscene = 1;
                }
            }
        }
    }
    foreach (i, s_object in s_scenedef.objects) {
        if (s_object.type === "player") {
            if (!isdefined(s_object.cameratween)) {
                s_object.cameratween = 0;
            }
            s_object.newplayermethod = 1;
            if (isdefined(s_object.sharedigc) && s_object.sharedigc) {
                s_object.type = "sharedplayer";
            }
        }
        if (s_object.type !== "player" && s_object.type !== "sharedplayer") {
            s_object.cameraswitcher = undefined;
        }
        s_object.player = undefined;
        if (s_object.type === "player model") {
            s_object.type = "fakeplayer";
        }
    }
    if (isstring(s_scenedef.cameraswitcher) || isstring(s_scenedef.extracamswitcher1) || isstring(s_scenedef.extracamswitcher2) || isstring(s_scenedef.extracamswitcher3) || isstring(s_scenedef.extracamswitcher4)) {
        s_scenedef.igc = 1;
    }
    convert_to_new_format(s_scenedef);
    return s_scenedef;
}

// Namespace scene/scene_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xa5bd15f6, Offset: 0xbdd8
// Size: 0x1e4
function function_ceb43448(var_5e3936e3, var_651e3856, str_field, var_8e9b7b3d) {
    var_5e3936e3--;
    var_651e3856--;
    if (!isdefined(self.shots)) {
        self.shots = [];
    }
    if (!isdefined(self.shots[0])) {
        self.shots[0] = spawnstruct();
    }
    if (!isdefined(self.shots[0].entry)) {
        self.shots[0].entry = [];
    }
    if (!isdefined(self.shots[0].entry[0])) {
        self.shots[0].entry[0] = spawnstruct();
    }
    if (!isdefined(self.shots[var_5e3936e3])) {
        self.shots[var_5e3936e3] = spawnstruct();
        self.shots[var_5e3936e3].entry = [];
        self.shots[var_5e3936e3].entry[0] = spawnstruct();
    }
    if (!isdefined(self.shots[var_5e3936e3].entry[var_651e3856])) {
        self.shots[var_5e3936e3].entry[var_651e3856] = spawnstruct();
    }
    self.shots[var_5e3936e3].entry[var_651e3856].(str_field) = var_8e9b7b3d;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf414106a, Offset: 0xbfc8
// Size: 0x4a
function function_de24d5c1(n_shot, str_shot_name) {
    n_shot--;
    if (isdefined(self.shots[n_shot])) {
        self.shots[n_shot].name = str_shot_name;
    }
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xd001ba, Offset: 0xc020
// Size: 0xf0
function function_77e159df(var_9b4eba84, str_field, var_8e9b7b3d) {
    if (isstruct(var_9b4eba84)) {
        var_9b4eba84.(str_field) = var_8e9b7b3d;
        return;
    }
    var_9b4eba84--;
    if (!isdefined(self.shots)) {
        self.shots = [];
    }
    if (!isdefined(self.shots[0])) {
        self.shots[0] = spawnstruct();
    }
    if (!isdefined(self.shots[var_9b4eba84])) {
        self.shots[var_9b4eba84] = spawnstruct();
    }
    self.shots[var_9b4eba84].(str_field) = var_8e9b7b3d;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x39057ec4, Offset: 0xc118
// Size: 0x802
function convert_to_new_format(s_scenedef) {
    foreach (s_object in s_scenedef.objects) {
        s_object.old_scene_version = 1;
        b_has_init = 0;
        b_has_main = 0;
        b_has_camera = 0;
        if (isdefined(s_object.firstframe) && s_object.firstframe) {
            b_has_init = 1;
            s_object function_ceb43448(1, 1, "anim", s_object.mainanim);
        } else {
            if (isdefined(s_object.initanim)) {
                b_has_init = 1;
                s_object function_ceb43448(1, 1, "anim", s_object.initanim);
            }
            if (isdefined(s_object.initanimloop)) {
                b_has_init = 1;
                s_object function_ceb43448(1, 2, "anim", s_object.initanimloop);
            }
            if (isdefined(s_object.spawnoninit) && s_object.spawnoninit) {
                b_has_init = 1;
            }
        }
        if (isdefined(s_object.cameraswitcher)) {
            b_has_main = 1;
            b_has_camera = 1;
            s_scenedef.igc = 1;
            if (b_has_init) {
                s_object function_ceb43448(2, 1, "cameraswitcher", s_object.cameraswitcher);
            } else {
                s_object function_ceb43448(1, 1, "cameraswitcher", s_object.cameraswitcher);
            }
        }
        if (!isdefined(s_object.mainblend)) {
            s_object.mainblend = 0.02;
        }
        b_has_main = 1;
        if (b_has_init) {
            if (b_has_camera) {
                s_object function_ceb43448(2, 2, "blend", s_object.mainblend);
            } else {
                s_object function_ceb43448(2, 1, "blend", s_object.mainblend);
            }
        } else if (b_has_camera) {
            s_object function_ceb43448(1, 2, "blend", s_object.mainblend);
        } else {
            s_object function_ceb43448(1, 1, "blend", s_object.mainblend);
        }
        if (isdefined(s_object.mainanim)) {
            b_has_main = 1;
            if (b_has_init) {
                if (b_has_camera) {
                    s_object function_ceb43448(2, 3, "anim", s_object.mainanim);
                } else {
                    s_object function_ceb43448(2, 2, "anim", s_object.mainanim);
                }
            } else if (b_has_camera) {
                s_object function_ceb43448(1, 3, "anim", s_object.mainanim);
            } else {
                s_object function_ceb43448(1, 2, "anim", s_object.mainanim);
            }
        }
        if (isdefined(s_object.endblend)) {
            b_has_main = 1;
            if (b_has_init) {
                s_object function_ceb43448(2, 3, "blend", s_object.endblend);
            } else {
                s_object function_ceb43448(1, 3, "blend", s_object.endblend);
            }
        }
        if (isdefined(s_object.endanim)) {
            b_has_main = 1;
            if (b_has_init) {
                s_object function_ceb43448(2, 4, "anim", s_object.endanim);
            } else {
                s_object function_ceb43448(1, 4, "anim", s_object.endanim);
            }
        }
        if (isdefined(s_object.endanimloop)) {
            b_has_main = 1;
            if (b_has_init) {
                s_object function_ceb43448(2, 5, "anim", s_object.endanimloop);
            } else {
                s_object function_ceb43448(1, 5, "anim", s_object.endanimloop);
            }
        }
        if (b_has_init) {
            s_object function_de24d5c1(1, "init");
            var_88263c0e = s_object.shots[0];
            if (isdefined(s_object.initdelaymin)) {
                s_object function_77e159df(var_88263c0e, "SpacerMin", s_object.initdelaymin);
            }
            if (isdefined(s_object.initdelaymax)) {
                s_object function_77e159df(var_88263c0e, "SpacerMax", s_object.initdelaymax);
            }
        }
        if (b_has_main) {
            if (b_has_init) {
                s_object function_de24d5c1(2, "play");
                var_992efde = s_object.shots[1];
            } else {
                s_object function_de24d5c1(1, "play");
                var_992efde = s_object.shots[0];
            }
            if (isdefined(s_object.maindelaymin)) {
                s_object function_77e159df(var_992efde, "SpacerMin", s_object.maindelaymin);
            }
            if (isdefined(s_object.maindelaymax)) {
                s_object function_77e159df(var_992efde, "SpacerMax", s_object.maindelaymax);
            }
        }
        s_object.initanim = undefined;
        s_object.initanimloop = undefined;
        s_object.mainblend = undefined;
        s_object.mainanim = undefined;
        s_object.endblend = undefined;
        s_object.endanim = undefined;
        s_object.endanimloop = undefined;
        s_object.initdelaymin = undefined;
        s_object.initdelaymax = undefined;
        s_object.maindelaymin = undefined;
        s_object.maindelaymax = undefined;
    }
    s_scenedef.old_scene_version = 1;
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x0
// Checksum 0xc9c8220a, Offset: 0xc928
// Size: 0xb2
function function_8d8ec9b5(str_scenedef, a_str_shot_names, s_instance) {
    if (isdefined(s_instance)) {
        s_instance.a_str_shot_names = a_str_shot_names;
        s_instance.var_418c40ac = a_str_shot_names[a_str_shot_names.size - 1];
        return;
    }
    s_scenedef = get_scenedef(str_scenedef);
    s_scenedef.a_str_shot_names = a_str_shot_names;
    level.var_1e798f4c[str_scenedef] = a_str_shot_names;
    s_scenedef.var_418c40ac = a_str_shot_names[a_str_shot_names.size - 1];
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x7d9c4a94, Offset: 0xc9e8
// Size: 0x330
function get_all_shot_names(str_scenedef, s_instance, var_8c4d2266 = 0) {
    if (isdefined(s_instance) && isdefined(s_instance.a_str_shot_names)) {
        a_shots = s_instance.a_str_shot_names;
        if (var_8c4d2266) {
            arrayremovevalue(a_shots, "init");
        }
        return a_shots;
    }
    if (isdefined(level.var_1e798f4c) && isdefined(level.var_1e798f4c[str_scenedef])) {
        a_shots = level.var_1e798f4c[str_scenedef];
        if (var_8c4d2266) {
            arrayremovevalue(a_shots, "init");
        }
        return a_shots;
    }
    s_scenedef = get_scenedef(str_scenedef);
    if (isdefined(s_scenedef.a_str_shot_names)) {
        a_shots = s_scenedef.a_str_shot_names;
        if (var_8c4d2266) {
            arrayremovevalue(a_shots, "init");
        }
        return s_scenedef.a_str_shot_names;
    }
    a_shots = [];
    foreach (s_object in s_scenedef.objects) {
        if (!(isdefined(s_object.disabled) && s_object.disabled) && isdefined(s_object.shots)) {
            foreach (s_shot in s_object.shots) {
                if (!isdefined(a_shots)) {
                    a_shots = [];
                } else if (!isarray(a_shots)) {
                    a_shots = array(a_shots);
                }
                if (!isinarray(a_shots, s_shot.name)) {
                    a_shots[a_shots.size] = s_shot.name;
                }
            }
        }
    }
    s_scenedef.a_str_shot_names = a_shots;
    s_scenedef.var_418c40ac = a_shots[a_shots.size - 1];
    if (var_8c4d2266) {
        arrayremovevalue(a_shots, "init");
    }
    return a_shots;
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa7182b39, Offset: 0xcd20
// Size: 0xbe
function function_b260bdcc(str_scenedef, str_shot, s_instance) {
    var_418c40ac = function_c9770402(str_scenedef, s_instance);
    s_scenedef = get_scenedef(str_scenedef);
    if (str_shot !== "init" && (str_shot === var_418c40ac || isdefined(s_scenedef.old_scene_version) && s_scenedef.old_scene_version && str_shot === "play")) {
        return true;
    }
    return false;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x8105a530, Offset: 0xcde8
// Size: 0x13c
function function_c9770402(str_scenedef, s_instance) {
    if (isdefined(s_instance) && isdefined(s_instance.var_418c40ac)) {
        return s_instance.var_418c40ac;
    }
    if (isdefined(level.var_1e798f4c) && isdefined(level.var_1e798f4c[str_scenedef])) {
        a_shots = level.var_1e798f4c[str_scenedef];
        return a_shots[a_shots.size - 1];
    }
    s_scenedef = get_scenedef(str_scenedef);
    if (isdefined(s_scenedef.str_final_bundle)) {
        return s_scenedef.str_final_bundle;
    }
    if (isdefined(s_scenedef.var_418c40ac)) {
        return s_scenedef.var_418c40ac;
    }
    a_shots = get_all_shot_names(str_scenedef, s_instance);
    s_scenedef.var_418c40ac = a_shots[a_shots.size - 1];
    return a_shots[a_shots.size - 1];
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xa009fde9, Offset: 0xcf30
// Size: 0x1d8
function _init_instance(str_scenedef = self.scriptbundlename, a_ents, b_test_run = 0) {
    s_bundle = get_scenedef(str_scenedef);
    if (!isdefined(s_bundle) || !function_6f382548(s_bundle, str_scenedef)) {
        return;
    }
    /#
        assert(isdefined(str_scenedef), "<dev string:x2d7>" + (isdefined(self.origin) ? self.origin : "<dev string:x2e4>") + "<dev string:x2ec>");
        assert(isdefined(s_bundle), "<dev string:x2d7>" + (isdefined(self.origin) ? self.origin : "<dev string:x2e4>") + "<dev string:x30a>" + str_scenedef + "<dev string:x13d>");
    #/
    o_scene = get_active_scene(str_scenedef);
    if (isdefined(o_scene)) {
        if (isdefined(self.scriptbundlename) && !b_test_run) {
            return o_scene;
        }
        thread [[ o_scene ]]->initialize(1);
    } else {
        o_scene = new cscene();
        [[ o_scene ]]->init(str_scenedef, s_bundle, self, a_ents, b_test_run);
    }
    return o_scene;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xb1cf6b68, Offset: 0xd110
// Size: 0x1dc
function function_6f382548(struct, str_scene_name) {
    if (!isdefined(struct.disableinsplitscreen) || !(getdvarint(#"splitscreen_playercount", 1) > 1)) {
        return true;
    }
    if (struct.disableinsplitscreen == 2 && getdvarint(#"splitscreen_playercount", 1) > 1 || struct.disableinsplitscreen == 3 && getdvarint(#"splitscreen_playercount", 1) > 2 || struct.disableinsplitscreen == 4 && getdvarint(#"splitscreen_playercount", 1) > 3) {
        /#
            if (struct.type === "<dev string:x326>") {
                str_debug = "<dev string:x32e>" + function_9e72a96(str_scene_name) + "<dev string:x337>";
            } else {
                str_debug = "<dev string:x370>" + function_9e72a96(struct.name) + "<dev string:x380>" + str_scene_name + "<dev string:x38d>";
            }
            println(str_debug);
        #/
        return false;
    }
    return true;
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x73fe8973, Offset: 0xd2f8
// Size: 0x11a
function function_de6a7579(str_scenedef, str_mode, s_instance) {
    a_shots = get_all_shot_names(str_scenedef, s_instance);
    if (a_shots.size == 0) {
        return "play";
    } else if (str_mode !== "init") {
        if (a_shots[0] !== "init") {
            str_shot = a_shots[0];
        } else if (a_shots.size > 1) {
            str_shot = a_shots[1];
        }
    } else if (str_mode === "init") {
        if (isinarray(a_shots, "init")) {
            str_shot = "init";
        } else {
            str_shot = a_shots[0];
        }
    }
    if (!isdefined(str_shot)) {
        str_shot = "play";
    }
    return str_shot;
}

// Namespace scene/scene_shared
// Params 5, eflags: 0x0
// Checksum 0x5b3a8f07, Offset: 0xd420
// Size: 0x8c
function play_from_time(arg1, arg2, arg3, n_time, var_c9d6bbb = 1) {
    if (var_c9d6bbb) {
        str_mode = "play_from_time_normalized";
    } else {
        str_mode = "play_from_time_elapsed";
    }
    play(arg1, arg2, arg3, 0, str_mode, n_time);
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x7094f2a3, Offset: 0xd4b8
// Size: 0xb2
function function_d1abba8b(str_scenedef, str_mode, n_time) {
    if (issubstr(str_mode, "play_from_time_normalized")) {
        var_f3f679dd = float(n_time) * function_12479eba(str_scenedef);
    } else {
        var_f3f679dd = float(n_time);
    }
    var_8b21886e = function_dde5f483(str_scenedef, var_f3f679dd);
    return var_8b21886e;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x4df6b17, Offset: 0xd578
// Size: 0x1f2
function function_1eab8670(obj, str_shot) {
    var_5a162d58 = 0;
    n_anim_length = 0;
    if (isdefined(obj.shots)) {
        foreach (s_shot in obj.shots) {
            if (s_shot.name === str_shot && isdefined(s_shot.entry)) {
                foreach (s_entry in s_shot.entry) {
                    if (isdefined(s_entry.cameraswitcher)) {
                        var_5a162d58 += float(getcamanimtime(s_entry.cameraswitcher)) / 1000;
                        continue;
                    }
                    if (isdefined(s_entry.("anim"))) {
                        n_anim_length += getanimlength(s_entry.("anim"));
                    }
                }
                break;
            }
        }
    }
    n_length = max(var_5a162d58, n_anim_length);
    return n_length;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x90e16776, Offset: 0xd778
// Size: 0x24a
function function_dde5f483(str_scenedef, n_elapsed_time) {
    s_scenedef = get_scenedef(str_scenedef);
    a_shots = get_all_shot_names(str_scenedef, undefined, 1);
    var_7a2504a = 0;
    var_8b21886e = spawnstruct();
    foreach (str_shot in a_shots) {
        var_958bccd3 = 0;
        foreach (obj in s_scenedef.objects) {
            var_657b76cc = function_1eab8670(obj, str_shot);
            if (var_657b76cc > var_958bccd3) {
                var_958bccd3 = var_657b76cc;
            }
        }
        var_219aac3f = var_7a2504a;
        var_68790830 = var_219aac3f + var_958bccd3;
        if (n_elapsed_time >= var_219aac3f && n_elapsed_time < var_68790830) {
            var_8b21886e.var_ef711d04 = str_shot;
            var_8b21886e.var_3486c904 = (n_elapsed_time - var_219aac3f) / var_958bccd3;
            return var_8b21886e;
        }
        var_7a2504a += var_958bccd3;
    }
    var_8b21886e.var_ef711d04 = a_shots[a_shots.size - 1];
    var_8b21886e.var_3486c904 = 0.9;
    return var_8b21886e;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2be270b3, Offset: 0xd9d0
// Size: 0x122
function function_8582657c(var_b9a72490, str_shot) {
    if (isstring(var_b9a72490) || ishash(var_b9a72490)) {
        s_scenedef = get_scenedef(var_b9a72490);
    } else {
        s_scenedef = var_b9a72490;
    }
    var_a0c66830 = 0;
    foreach (obj in s_scenedef.objects) {
        var_657b76cc = function_1eab8670(obj, str_shot);
        if (var_657b76cc > var_a0c66830) {
            var_a0c66830 = var_657b76cc;
        }
    }
    return var_a0c66830;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x93d61814, Offset: 0xdb00
// Size: 0xe8
function function_12479eba(str_scenedef) {
    s_scenedef = get_scenedef(str_scenedef);
    a_shots = get_all_shot_names(str_scenedef, undefined, 1);
    var_9d90ef8b = 0;
    foreach (str_shot in a_shots) {
        var_9d90ef8b += function_8582657c(s_scenedef, str_shot);
    }
    return var_9d90ef8b;
}

// Namespace scene/scene_shared
// Params 5, eflags: 0x1 linked
// Checksum 0x2b445064, Offset: 0xdbf0
// Size: 0xd2
function function_67e52759(str_scenedef, s_instance, var_8c4d2266, startsearch, var_62e8e2f0) {
    a_shots = get_all_shot_names(str_scenedef, s_instance, var_8c4d2266);
    if (isdefined(startsearch) || isdefined(var_62e8e2f0)) {
        a_shots = array::slice(a_shots, isdefined(startsearch) ? startsearch : 0, isdefined(var_62e8e2f0) ? var_62e8e2f0 : 2147483647);
    }
    s_shot = array::random(a_shots);
    return s_shot;
}

// Namespace scene/scene_shared
// Params 6, eflags: 0x1 linked
// Checksum 0xce8587c1, Offset: 0xdcd0
// Size: 0x47c
function play(arg1, arg2, arg3, b_test_run = 0, str_mode = "", n_time) {
    s_tracker = spawnstruct();
    s_tracker.n_scene_count = 1;
    if (self == level) {
        a_instances = [];
        if (isstring(arg1) || ishash(arg1)) {
            if (isstring(arg1) && issubstr(arg1, ",")) {
                a_toks = strtok(arg1, ",");
                str_value = a_toks[0];
                str_key = a_toks[1];
                if (isstring(arg2)) {
                    str_shot = tolower(arg2);
                    a_ents = arg3;
                    var_5b51581a = 1;
                } else {
                    a_ents = arg2;
                }
            } else if (isinarray(level.scenedefs, hash(arg1))) {
                str_scenedef = arg1;
                var_583db6f0 = 1;
            } else {
                str_value = arg1;
                str_key = "targetname";
            }
            if (isstring(arg2)) {
                if (isinarray(array("targetname", "script_noteworthy"), arg2)) {
                    str_key = arg2;
                } else {
                    str_shot = tolower(arg2);
                    var_5b51581a = 1;
                }
                a_ents = arg3;
            } else {
                a_ents = arg2;
            }
            a_instances = _get_scene_instances(str_value, str_key, str_scenedef);
            if (a_instances.size) {
                s_tracker.n_scene_count = a_instances.size;
                foreach (s_instance in a_instances) {
                    if (isdefined(s_instance)) {
                        if (!(isdefined(var_583db6f0) && var_583db6f0)) {
                            str_scenedef = s_instance.scriptbundlename;
                        }
                        if (!(isdefined(var_5b51581a) && var_5b51581a)) {
                            str_shot = function_de6a7579(str_scenedef, str_mode, s_instance);
                        } else if (!issubstr(str_mode, "play_from_time")) {
                            str_mode = "single";
                        }
                        s_instance thread _play_instance(s_tracker, str_scenedef, a_ents, b_test_run, str_shot, str_mode, n_time);
                    }
                }
            } else {
                _play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time);
            }
        }
    } else {
        _play_on_self(s_tracker, arg1, arg2, arg3, b_test_run, str_mode, n_time);
    }
    function_c802b491(s_tracker, str_mode);
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x5 linked
// Checksum 0xb453ae4b, Offset: 0xe158
// Size: 0x8c
function private function_c802b491(s_tracker, str_mode) {
    level endon(#"demo_jump");
    if (s_tracker.n_scene_count > 0 && !(isdefined(s_tracker.var_93ec5dde) && s_tracker.var_93ec5dde) && str_mode !== "init") {
        s_tracker waittill(#"scene_done");
    }
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x22963be0, Offset: 0xe1f0
// Size: 0xba
function function_46546b5c(s_tracker, str_scenedef) {
    if (getdvarint(#"hash_862358d532e674c", 0) === 1) {
        var_41c1a1b7 = getscriptbundle(str_scenedef);
        if (isdefined(var_41c1a1b7.var_2af733c9) && var_41c1a1b7.var_2af733c9) {
            /#
                iprintlnbold("<dev string:x3b5>" + str_scenedef);
            #/
            s_tracker.var_93ec5dde = 1;
            return true;
        }
    }
    return false;
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xfefcd2fe, Offset: 0xe2b8
// Size: 0x22c
function _play_on_self(s_tracker, arg1, arg2, arg3, b_test_run = 0, str_mode = "", n_time) {
    if (isstring(arg1) || ishash(arg1)) {
        if (isinarray(level.scenedefs, hash(arg1))) {
            str_scenedef = arg1;
            if (isstring(arg2)) {
                str_shot = arg2;
                a_ents = arg3;
            } else {
                a_ents = arg2;
            }
        } else {
            str_shot = arg1;
            a_ents = arg2;
        }
    } else if (isarray(arg1)) {
        str_scenedef = self.scriptbundlename;
        a_ents = arg1;
    } else {
        str_scenedef = self.scriptbundlename;
        if (isstring(arg2)) {
            str_shot = arg2;
            a_ents = arg3;
        }
    }
    s_tracker.n_scene_count = 1;
    if (!isdefined(str_shot) && isdefined(str_scenedef)) {
        str_shot = function_de6a7579(str_scenedef, str_mode, self);
    } else if (isdefined(str_shot) && !issubstr(str_mode, "play_from_time")) {
        str_mode = "single";
    }
    self thread _play_instance(s_tracker, str_scenedef, a_ents, b_test_run, str_shot, str_mode, n_time);
}

// Namespace scene/scene_shared
// Params 7, eflags: 0x1 linked
// Checksum 0xe145e3a6, Offset: 0xe4f0
// Size: 0x3f0
function _play_instance(s_tracker, str_scenedef = self.scriptbundlename, a_ents, b_test_run, str_shot = "play", str_mode, n_time) {
    if (isdefined(n_time) && issubstr(str_mode, "play_from_time")) {
        var_8b21886e = function_d1abba8b(str_scenedef, str_mode, n_time);
        str_shot = var_8b21886e.var_ef711d04;
        var_dd2b75b = var_8b21886e.var_3486c904;
        str_mode += ":" + var_dd2b75b;
    }
    if (str_mode === "init") {
        str_shot = function_de6a7579(str_scenedef, str_mode, self);
    }
    if (function_46546b5c(s_tracker, str_scenedef)) {
        waitframe(1);
        self notify(#"scene_done");
        return;
    }
    if (self.scriptbundlename === str_scenedef) {
        str_scenedef = self.scriptbundlename;
        if (!(isdefined(self.script_play_multiple) && self.script_play_multiple)) {
            if (!isdefined(self.scene_played)) {
                self.scene_played = [];
            }
            if (isdefined(self.scene_played[str_shot]) && self.scene_played[str_shot] && !b_test_run) {
                waittillframeend();
                while (is_playing(str_scenedef)) {
                    waitframe(1);
                }
                println("<dev string:x3d3>" + str_scenedef + "<dev string:x3dd>");
                s_tracker notify(#"scene_done");
                return;
            }
        }
        if (str_mode == "init") {
            self.scene_played[str_shot] = 0;
        } else {
            self.scene_played[str_shot] = 1;
        }
    }
    o_scene = _init_instance(str_scenedef, a_ents, b_test_run);
    /#
        function_8ee42bf(o_scene);
    #/
    if (str_mode != "init") {
        if (isdefined(self.script_delay) && self.script_delay > 0) {
            wait self.script_delay;
        }
        if (isdefined(o_scene)) {
            thread [[ o_scene ]]->play(str_shot, b_test_run, str_mode);
            if (isdefined(o_scene._a_objects) && o_scene._a_objects.size) {
                o_scene waittill_instance_scene_done(str_scenedef);
            }
        }
        if (isdefined(self)) {
            if (isdefined(self.scriptbundlename) && isdefined(get_scenedef(self.scriptbundlename).looping) && get_scenedef(self.scriptbundlename).looping) {
                self.scene_played[str_shot] = 0;
            }
        }
    }
    /#
        function_8ee42bf(o_scene);
    #/
    s_tracker.n_scene_count--;
    s_tracker notify(#"scene_done");
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xbb53b49e, Offset: 0xe8e8
// Size: 0x3a
function private waittill_instance_scene_done(str_scenedef) {
    level endon(#"demo_jump");
    self waittill(#"scene_done");
}

// Namespace scene/scene_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xa3c856af, Offset: 0xe930
// Size: 0x2ac
function stop(arg1, arg2, arg3, b_cancel, b_no_assert = 0) {
    if (self == level) {
        if (isstring(arg1) || ishash(arg1)) {
            if (isstring(arg2)) {
                str_value = arg1;
                str_key = arg2;
                b_clear = arg3;
            } else {
                str_value = arg1;
                b_clear = arg2;
            }
            if (isdefined(str_key)) {
                a_instances = struct::get_array(str_value, str_key);
                assert(b_no_assert || a_instances.size, "<dev string:x44f>" + str_key + "<dev string:x46f>" + str_value + "<dev string:x475>");
                str_value = undefined;
            } else {
                a_instances = struct::get_array(str_value, "targetname");
                if (!a_instances.size) {
                    a_instances = get_active_scenes(str_value);
                } else {
                    str_value = undefined;
                }
            }
            foreach (s_instance in arraycopy(a_instances)) {
                if (isdefined(s_instance)) {
                    s_instance _stop_instance(b_clear, str_value, b_cancel);
                }
            }
        }
        return;
    }
    if (isstring(arg1) || ishash(arg1)) {
        _stop_instance(arg2, arg1, b_cancel);
        return;
    }
    _stop_instance(arg1, arg2, b_cancel);
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x1fe9fd3e, Offset: 0xebe8
// Size: 0xfc
function _stop_instance(b_clear = 0, str_scenedef, b_cancel = 0) {
    if (isdefined(self.scenes)) {
        foreach (o_scene in arraycopy(self.scenes)) {
            str_scene_name = o_scene._str_name;
            if (!isdefined(str_scenedef) || str_scene_name == str_scenedef) {
                thread [[ o_scene ]]->stop(b_clear, b_cancel);
            }
        }
    }
}

// Namespace scene/scene_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x9669456c, Offset: 0xecf0
// Size: 0x3c
function cancel(arg1, arg2, arg3) {
    stop(arg1, arg2, arg3, 1);
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xf5f6b25b, Offset: 0xed38
// Size: 0x24c
function delete_scene_spawned_ents(localclientnum, arg1) {
    if (self == level) {
        a_instances = [];
        if (isstring(arg1) || ishash(arg1)) {
            if (isstring(arg1) && issubstr(arg1, ",")) {
                a_toks = strtok(arg1, ",");
                str_value = a_toks[0];
                str_key = a_toks[1];
            } else if (isinarray(level.scenedefs, hash(arg1))) {
                str_scenedef = arg1;
            } else {
                str_value = arg1;
                str_key = "targetname";
            }
            a_instances = _get_scene_instances(str_value, str_key, str_scenedef, 1);
            if (a_instances.size) {
                foreach (instance in a_instances) {
                    instance _delete_scene_spawned_ents(localclientnum, str_scenedef);
                }
            }
        }
        return;
    }
    if (isstring(arg1) || ishash(arg1)) {
        str_scenedef = arg1;
    }
    self _delete_scene_spawned_ents(localclientnum, str_scenedef);
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xe28ac930, Offset: 0xef90
// Size: 0xe8
function _delete_scene_spawned_ents(localclientnum, str_scene) {
    if (isarray(self.scene_ents) && isarray(self.scene_ents[localclientnum])) {
        foreach (ent in self.scene_ents[localclientnum]) {
            if (isdefined(ent) && isdefined(ent.scene_spawned)) {
                ent delete();
            }
        }
    }
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0xed8f6feb, Offset: 0xf080
// Size: 0xdc
function has_init_state(str_scenedef) {
    s_scenedef = get_scenedef(str_scenedef);
    foreach (s_obj in s_scenedef.objects) {
        if (!(isdefined(s_obj.disabled) && s_obj.disabled) && s_obj _has_init_state(str_scenedef)) {
            return true;
        }
    }
    return false;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xdce83b75, Offset: 0xf168
// Size: 0x92
function _has_init_state(str_scenedef) {
    return isinarray(get_all_shot_names(str_scenedef), "init") || isdefined(self.spawnoninit) && self.spawnoninit || isdefined(self.initanim) || isdefined(self.initanimloop) || isdefined(self.firstframe) && self.firstframe;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0xc4b00e09, Offset: 0xf208
// Size: 0x22
function get_prop_count(str_scenedef) {
    return _get_type_count("prop", str_scenedef);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0x50aa0cb, Offset: 0xf238
// Size: 0x22
function get_vehicle_count(str_scenedef) {
    return _get_type_count("vehicle", str_scenedef);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x0
// Checksum 0x2743bc32, Offset: 0xf268
// Size: 0x22
function get_actor_count(str_scenedef) {
    return _get_type_count("actor", str_scenedef);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xd56a337f, Offset: 0xf298
// Size: 0x22
function function_7aa3d2c6(str_scenedef) {
    return _get_type_count("sharedplayer", str_scenedef);
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x26eb2043, Offset: 0xf2c8
// Size: 0x22
function get_player_count(str_scenedef) {
    return _get_type_count("player", str_scenedef);
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x2bc1ffac, Offset: 0xf2f8
// Size: 0x10e
function _get_type_count(str_type, str_scenedef) {
    s_scenedef = isdefined(str_scenedef) ? get_scenedef(str_scenedef) : get_scenedef(self.scriptbundlename);
    n_count = 0;
    foreach (s_obj in s_scenedef.objects) {
        if (isdefined(s_obj.type)) {
            if (tolower(s_obj.type) == tolower(str_type)) {
                n_count++;
            }
        }
    }
    return n_count;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4f1ecb1, Offset: 0xf410
// Size: 0x4e
function is_active(str_scenedef) {
    if (self == level) {
        return (get_active_scenes(str_scenedef).size > 0);
    }
    return isdefined(get_active_scene(str_scenedef));
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4458daf5, Offset: 0xf468
// Size: 0x90
function is_playing(str_scenedef) {
    if (self == level) {
        return level flagsys::get(str_scenedef + "_playing");
    } else {
        if (!isdefined(str_scenedef)) {
            str_scenedef = self.scriptbundlename;
        }
        o_scene = get_active_scene(str_scenedef);
        if (isdefined(o_scene)) {
            return (o_scene._str_mode === "play");
        }
    }
    return 0;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xe667cff5, Offset: 0xf500
// Size: 0xf8
function get_active_scenes(str_scenedef) {
    if (!isdefined(level.active_scenes)) {
        level.active_scenes = [];
    }
    if (isdefined(str_scenedef)) {
        return (isdefined(level.active_scenes[str_scenedef]) ? level.active_scenes[str_scenedef] : []);
    }
    a_active_scenes = [];
    foreach (str_scenedef, _ in level.active_scenes) {
        a_active_scenes = arraycombine(a_active_scenes, level.active_scenes[str_scenedef], 0, 0);
    }
    return a_active_scenes;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xff2e4766, Offset: 0xf600
// Size: 0x9e
function get_active_scene(str_scenedef) {
    if (isdefined(str_scenedef) && isdefined(self.scenes)) {
        foreach (o_scene in self.scenes) {
            if (o_scene._str_name == str_scenedef) {
                return o_scene;
            }
        }
    }
}

// Namespace scene/scene_shared
// Params 0, eflags: 0x0
// Checksum 0x89530f2f, Offset: 0xf6a8
// Size: 0x64
function is_capture_mode() {
    str_mode = getdvarstring(#"scene_menu_mode", "default");
    if (issubstr(str_mode, "capture")) {
        return 1;
    }
    return 0;
}

// Namespace scene/scene_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xb75efa3, Offset: 0xf718
// Size: 0x19a
function _get_scene_instances(str_value, str_key = "targetname", str_scenedef, b_include_inactive = 0) {
    a_instances = [];
    if (isdefined(str_value)) {
        a_instances = struct::get_array(str_value, str_key);
        assert(a_instances.size, "<dev string:x44f>" + str_key + "<dev string:x46f>" + str_value + "<dev string:x475>");
    }
    if (isdefined(str_scenedef)) {
        a_instances_by_scenedef = struct::get_array(str_scenedef, "scriptbundlename");
        a_instances = arraycombine(a_instances_by_scenedef, a_instances, 0, 0);
        a_active_instances = get_active_scenes(str_scenedef);
        a_instances = arraycombine(a_active_instances, a_instances, 0, 0);
        if (b_include_inactive) {
            a_inactive_instances = get_inactive_scenes(str_scenedef);
            a_instances = arraycombine(a_inactive_instances, a_instances, 0, 0);
        }
    }
    return a_instances;
}

// Namespace scene/scene_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x32285a79, Offset: 0xf8c0
// Size: 0xf8
function get_inactive_scenes(str_scenedef) {
    if (!isdefined(level.inactive_scenes)) {
        level.inactive_scenes = [];
    }
    if (isdefined(str_scenedef)) {
        return (isdefined(level.inactive_scenes[str_scenedef]) ? level.inactive_scenes[str_scenedef] : []);
    }
    a_scenes = [];
    foreach (str_scenedef, _ in level.inactive_scenes) {
        a_scenes = arraycombine(a_scenes, level.inactive_scenes[str_scenedef], 0, 0);
    }
    return a_scenes;
}

// Namespace scene/scene_shared
// Params 2, eflags: 0x0
// Checksum 0x258437aa, Offset: 0xf9c0
// Size: 0x3a
function function_9730988a(str_scenedef, str_shotname) {
    return isinarray(get_all_shot_names(str_scenedef), str_shotname);
}

