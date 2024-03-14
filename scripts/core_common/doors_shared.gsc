// Atian COD Tools GSC decompiler test
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\trigger_shared.gsc;
#using scripts\core_common\scene_shared.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace doors;

// Namespace doors
// Method(s) 41 Total 41
class cdoor {

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x81636c7, Offset: 0x3d8
    // Size: 0x5e
    __constructor() {
        self.m_n_trigger_height = 80;
        self.m_door_open_delay_time = 0;
        self.m_e_trigger_player = undefined;
        self.m_str_type = "door";
        self.var_fb8a6fcc = [];
        self.var_e1a5a27e = [];
        self.var_7d28591d = 0;
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x11 linked
    // Checksum 0xa2285d12, Offset: 0x440
    // Size: 0x2c
    __destructor() {
        if (isdefined(self.m_e_trigger)) {
            self.m_e_trigger delete();
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdfb2ac8c, Offset: 0x3fb0
    // Size: 0x80
    function function_670cd4a3() {
        self endon(#"death");
        self.var_19fde5b7 = [];
        while (true) {
            waitresult = undefined;
            waitresult = self waittill(#"grenade_stuck");
            if (isdefined(waitresult.projectile)) {
                array::add(self.var_19fde5b7, waitresult.projectile);
            }
        }
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xad72dfbb, Offset: 0x3f88
    // Size: 0x1a
    function function_ea9e96ca(delay_time) {
        self.m_door_open_delay_time = delay_time;
    }

    // Namespace cdoor/doors_shared
    // Params 5, eflags: 0x1 linked
    // Checksum 0x18745486, Offset: 0x3af0
    // Size: 0x490
    function function_d36318ad(b_malfunction = 0, b_open_door = 1, b_reverse = 0, var_682c0d1c = 0, var_a7fd1c5 = 0) {
        if (b_malfunction) {
            if (b_open_door) {
                var_bf73cb70 = isdefined(self.m_s_bundle.var_ba0e0b07) ? self.m_s_bundle.var_ba0e0b07 : 0;
                var_ad9c43d9 = isdefined(self.m_s_bundle.var_3a2b94e8) ? self.m_s_bundle.var_3a2b94e8 : 0;
            } else {
                var_bf73cb70 = isdefined(self.m_s_bundle.var_cb1b0a1d) ? self.m_s_bundle.var_cb1b0a1d : 0;
                var_ad9c43d9 = isdefined(self.m_s_bundle.var_40c7110b) ? self.m_s_bundle.var_40c7110b : 0;
            }
            if (var_bf73cb70 == 0 && var_ad9c43d9 == 0) {
                var_3880cb10 = 0;
            } else if (var_ad9c43d9 > var_bf73cb70) {
                var_3880cb10 = randomfloatrange(var_bf73cb70, var_ad9c43d9);
            } else {
                /#
                    assertmsg("<unknown string>");
                #/
            }
            if (b_open_door) {
                if (isdefined(self.var_7d28591d) && self.var_7d28591d) {
                    var_2b9a525f = self.m_s_bundle.var_f2943dab + var_3880cb10;
                } else {
                    var_2b9a525f = self.m_s_bundle.door_swing_angle + var_3880cb10;
                }
            } else {
                var_2b9a525f = var_3880cb10;
            }
        } else if (b_open_door) {
            if (isdefined(self.var_7d28591d) && self.var_7d28591d) {
                var_2b9a525f = self.m_s_bundle.var_f2943dab;
            } else {
                var_2b9a525f = self.m_s_bundle.door_swing_angle;
            }
        } else {
            var_2b9a525f = 0;
        }
        if (b_reverse) {
            if (var_682c0d1c) {
                v_angle = (self.var_85f2454d.angles[0], self.var_85f2454d.angles[1], self.var_85f2454d.angles[2] - var_2b9a525f);
            } else if (var_a7fd1c5) {
                v_angle = (self.var_85f2454d.angles[0] - var_2b9a525f, self.var_85f2454d.angles[1], self.var_85f2454d.angles[2]);
            } else {
                v_angle = (self.var_85f2454d.angles[0], self.var_85f2454d.angles[1] - var_2b9a525f, self.var_85f2454d.angles[2]);
            }
            return v_angle;
        }
        if (var_682c0d1c) {
            v_angle = (self.var_85f2454d.angles[0], self.var_85f2454d.angles[1], self.var_85f2454d.angles[2] + var_2b9a525f);
        } else if (var_a7fd1c5) {
            v_angle = (self.var_85f2454d.angles[0] + var_2b9a525f, self.var_85f2454d.angles[1], self.var_85f2454d.angles[2]);
        } else {
            v_angle = (self.var_85f2454d.angles[0], self.var_85f2454d.angles[1] + var_2b9a525f, self.var_85f2454d.angles[2]);
        }
        return v_angle;
    }

    // Namespace cdoor/doors_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xfc07f46a, Offset: 0x39e0
    // Size: 0x104
    function calculate_offset_position(v_origin, v_angles, v_offset) {
        v_pos = v_origin;
        if (v_offset[0]) {
            v_side = anglestoforward(v_angles);
            v_pos = v_pos + v_offset[0] * v_side;
        }
        if (v_offset[1]) {
            v_dir = anglestoright(v_angles);
            v_pos = v_pos + v_offset[1] * v_dir;
        }
        if (v_offset[2]) {
            v_up = anglestoup(v_angles);
            v_pos = v_pos + v_offset[2] * v_up;
        }
        return v_pos;
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x274a2b6, Offset: 0x39b8
    // Size: 0x1a
    function set_door_paths(n_door_connect_paths) {
        self.m_n_door_connect_paths = n_door_connect_paths;
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x4e614c73, Offset: 0x38f0
    // Size: 0xba
    function init_player_spawns() {
        if (isdefined(self.var_a2f96f78.targetname)) {
            a_structs = struct::get_array(self.var_a2f96f78.targetname, "target");
            foreach (struct in a_structs) {
                struct.c_door = self;
            }
        }
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x3d2c2104, Offset: 0x3838
    // Size: 0xaa
    function init_movement(str_slide_dir, n_slide_amount) {
        if (self.m_s_bundle.door_open_method == "slide") {
            v_offset = function_e61944fa(str_slide_dir, n_slide_amount);
            self.m_v_open_pos = calculate_offset_position(self.m_e_door.origin, self.m_e_door.angles, v_offset);
            self.m_v_close_pos = self.m_e_door.origin;
        }
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xc1100c96, Offset: 0x36a0
    // Size: 0x18a
    function function_e4659543(var_9bbee0ba = 1) {
        if (var_9bbee0ba) {
            self.m_v_close_pos = self.m_e_door.origin;
            v_offset = function_e61944fa(undefined, self.m_s_bundle.door_slide_open_units);
            self.m_v_open_pos = calculate_offset_position(self.m_v_close_pos, self.m_e_door.angles, v_offset);
            self.var_85f2454d.origin = self.m_e_door.origin;
            self.var_85f2454d.angles = self.m_e_door.angles;
            return;
        }
        self.m_v_open_pos = self.m_e_door.origin;
        v_offset = function_e61944fa(undefined, self.m_s_bundle.door_slide_open_units * -1);
        self.m_v_close_pos = calculate_offset_position(self.m_v_open_pos, self.m_e_door.angles, v_offset);
        self.var_85f2454d.origin = self.m_v_close_pos;
        self.var_85f2454d.angles = self.m_e_door.angles;
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xc6ee7b59, Offset: 0x3578
    // Size: 0x11e
    function function_e61944fa(var_f770af7e, n_slide_amount) {
        str_slide_dir = isdefined(self.var_3c6838bc) ? self.var_3c6838bc : var_f770af7e;
        switch (str_slide_dir) {
        case #"x":
            v_offset = (n_slide_amount, 0, 0);
            self.var_3c6838bc = "X";
            break;
        case #"y":
            v_offset = (0, n_slide_amount, 0);
            self.var_3c6838bc = "Y";
            break;
        case #"z":
            v_offset = (0, 0, n_slide_amount);
            self.var_3c6838bc = "Z";
            break;
        default:
            v_offset = (0, 0, n_slide_amount);
            self.var_3c6838bc = "Z";
            break;
        }
        return v_offset;
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x5b28e7a6, Offset: 0x3478
    // Size: 0xf8
    function set_script_flags(b_set) {
        if (isdefined(self.var_a2f96f78.script_flag)) {
            a_flags = strtok(self.var_a2f96f78.script_flag, ",");
            foreach (str_flag in a_flags) {
                if (b_set) {
                    level flag::set(str_flag);
                    continue;
                }
                level flag::clear(str_flag);
            }
        }
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x34ddb31e, Offset: 0x30a0
    // Size: 0x3cc
    function init_trigger(v_offset, n_radius) {
        if (isdefined(self.m_s_bundle.var_99c60bd4)) {
            thread function_cde3a4b3();
        } else if (isdefined(self.m_s_bundle.door_interact)) {
            thread function_323b4378();
        } else {
            v_pos = calculate_offset_position(self.m_e_door.origin, self.m_e_door.angles, v_offset);
            v_pos = (v_pos[0], v_pos[1], v_pos[2] + 50);
            if (isdefined(self.m_s_bundle.door_trigger_at_target) && self.m_s_bundle.door_trigger_at_target && isdefined(self.var_a2f96f78.target)) {
                a_e_targets = getentarray(self.var_a2f96f78.target, "targetname");
                e_target = a_e_targets[0];
                if (isdefined(e_target)) {
                    if (e_target trigger::is_trigger_of_type("trigger_multiple", "trigger_radius", "trigger_box", "trigger_multiple_new", "trigger_radius_new", "trigger_box_new")) {
                        t_radius_or_multiple = e_target;
                        v_pos = e_target.origin;
                    } else if (e_target trigger::is_trigger_of_type("trigger_use", "trigger_use_touch")) {
                        t_use = e_target;
                        self.m_s_bundle.door_use_trigger = 1;
                    }
                }
            }
            if (isdefined(self.m_s_bundle.door_use_trigger) && self.m_s_bundle.door_use_trigger) {
                if (isdefined(t_use)) {
                    self.m_e_trigger = t_use;
                } else {
                    self.m_e_trigger = spawn("trigger_radius_use", v_pos, 16384 | 4096, n_radius, self.m_n_trigger_height);
                }
                self.m_e_trigger triggerignoreteam();
                self.m_e_trigger setvisibletoall();
                self.m_e_trigger setteamfortrigger(#"none");
                self.m_e_trigger usetriggerrequirelookat();
                self.m_e_trigger setcursorhint("HINT_NOICON");
            } else if (isdefined(t_radius_or_multiple)) {
                self.m_e_trigger = t_radius_or_multiple;
            } else {
                self.m_e_trigger = spawn("trigger_radius", v_pos, 16384 | 4096 | 16 | 512, n_radius, self.m_n_trigger_height);
            }
        }
        if (isdefined(self.m_s_bundle.var_e182494f) && self.m_s_bundle.var_e182494f) {
            self.m_e_door setcandamage(1);
            thread function_54605e70();
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x68017bbb, Offset: 0x3018
    // Size: 0x7c
    function function_cde3a4b3() {
        self.m_e_door makeusable();
        self.m_e_door setcursorhint("HINT_NOICON");
        self.m_e_door sethintstring(#"hash_1cc0220a2ef3e6d6");
        thread function_2190a0ee(1, 0);
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x5dce930, Offset: 0x2f18
    // Size: 0xf4
    function function_323b4378() {
        level flagsys::wait_till("radiant_gameobjects_initialized");
        self.m_e_door.func_custom_gameobject_position = &function_4fe7d9d5;
        self.m_e_door.v_trigger_offset = self.m_s_bundle.v_trigger_offset;
        self.m_e_door gameobjects::init_game_objects(self.m_s_bundle.door_interact);
        self.m_e_door.mdl_gameobject.t_interact usetriggerrequirelookat();
        thread function_2190a0ee(isdefined(self.m_s_bundle.door_closes) && self.m_s_bundle.door_closes, 1);
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa8612d69, Offset: 0x2d60
    // Size: 0x1ae
    function function_54605e70() {
        self.m_e_trigger endon(#"death");
        while (true) {
            self.m_e_door waittill(#"damage");
            if (!is_open() && !self flag::get("animating")) {
                open();
                flag::wait_till_clear("animating");
                if (isdefined(self.m_s_bundle.var_6270dafc) && self.m_s_bundle.var_6270dafc) {
                    wait(isdefined(self.m_s_bundle.var_be86269a) ? self.m_s_bundle.var_be86269a : 0);
                    if (isdefined(self.m_e_trigger_player)) {
                        var_ceedbc10 = self.m_e_trigger.maxs[0] * self.m_e_trigger.maxs[0];
                        while (isdefined(self.m_e_trigger_player) && self.m_e_trigger_player istouching(self.m_e_trigger)) {
                            waitframe(1);
                        }
                        close();
                    } else {
                        close();
                    }
                }
            }
            waitframe(1);
        }
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x6acd5f88, Offset: 0x29e8
    // Size: 0x36e
    function function_2190a0ee(b_reusable, var_23456fbb) {
        self.m_e_door endon(#"hash_190d72393c0a8869", #"delete", #"gameobject_deleted");
        while (true) {
            if (var_23456fbb) {
                waitresult = undefined;
                waitresult = self.m_e_door.mdl_gameobject waittill(#"gameobject_end_use_player");
                e_player = waitresult.player;
            } else {
                waitresult = undefined;
                waitresult = self.m_e_door waittill(#"trigger");
                e_player = waitresult.activator;
            }
            if (!self flag::get("animating")) {
                if (!b_reusable) {
                    self.m_e_door notify(#"hash_190d72393c0a8869");
                }
                unlock();
                set_player_who_opened(e_player);
                e_player playrumbleonentity("damage_light");
                if (is_open()) {
                    if (isdefined(self.m_s_bundle.var_b8824800)) {
                        var_f40ac45d = float(isdefined(self.m_s_bundle.var_66bbc6d6) ? self.m_s_bundle.var_66bbc6d6 : 0);
                        var_3488a701 = float(isdefined(self.m_s_bundle.var_f5bea36f) ? self.m_s_bundle.var_f5bea36f : 0);
                        thread function_145675ba(e_player, self.m_s_bundle.var_b8824800, var_f40ac45d, var_3488a701);
                    }
                    self.m_e_door notify(#"hash_923096b653062ea");
                    close();
                } else {
                    if (isdefined(self.m_s_bundle.var_a22b716)) {
                        var_f40ac45d = float(isdefined(self.m_s_bundle.var_bbbdcca7) ? self.m_s_bundle.var_bbbdcca7 : 0);
                        var_3488a701 = float(isdefined(self.m_s_bundle.var_52b6e5e9) ? self.m_s_bundle.var_52b6e5e9 : 0);
                        thread function_145675ba(e_player, self.m_s_bundle.var_a22b716, var_f40ac45d, var_3488a701);
                    }
                    self.m_e_door notify(#"hash_7166c13e79b73f9");
                    open();
                }
            }
            waitframe(1);
        }
    }

    // Namespace cdoor/doors_shared
    // Params 4, eflags: 0x1 linked
    // Checksum 0xb5456eff, Offset: 0x2988
    // Size: 0x54
    function function_145675ba(e_player, str_anim, var_f40ac45d, n_start_time) {
        e_player thread animation::play(str_anim, e_player, undefined, var_f40ac45d, 0.2, 0, 0, n_start_time);
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x7de8d414, Offset: 0x2860
    // Size: 0x11c
    function function_4fe7d9d5() {
        v_angles = self.angles;
        v_offset = self.v_trigger_offset;
        v_pos = self.origin;
        if (isdefined(v_offset)) {
            if (v_offset[0]) {
                v_side = anglestoforward(v_angles);
                v_pos = v_pos + v_offset[0] * v_side;
            }
            if (v_offset[1]) {
                v_dir = anglestoright(v_angles);
                v_pos = v_pos + v_offset[1] * v_dir;
            }
            if (v_offset[2]) {
                v_up = anglestoup(v_angles);
                v_pos = v_pos + v_offset[2] * v_up;
            }
        }
        return v_pos;
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x320f0f8c, Offset: 0x2630
    // Size: 0x228
    function run_lock_fx() {
        if (!isdefined(self.m_s_bundle.door_locked_fx) && !isdefined(self.m_s_bundle.door_unlocked_fx)) {
            return;
        }
        e_fx = undefined;
        v_pos = get_hack_pos();
        v_angles = get_hack_angles();
        while (true) {
            self flag::wait_till("locked");
            if (isdefined(e_fx)) {
                e_fx delete();
                e_fx = undefined;
            }
            if (isdefined(self.m_s_bundle.door_locked_fx)) {
                e_fx = spawn("script_model", v_pos);
                e_fx setmodel(#"tag_origin");
                e_fx.angles = v_angles;
                playfxontag(self.m_s_bundle.door_locked_fx, e_fx, "tag_origin");
            }
            self flag::wait_till_clear("locked");
            if (isdefined(e_fx)) {
                e_fx delete();
                e_fx = undefined;
            }
            if (isdefined(self.m_s_bundle.door_unlocked_fx)) {
                e_fx = spawn("script_model", v_pos);
                e_fx setmodel(#"tag_origin");
                e_fx.angles = v_angles;
                playfxontag(self.m_s_bundle.door_unlocked_fx, e_fx, "tag_origin");
            }
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x1682582b, Offset: 0x2518
    // Size: 0x10a
    function update_use_message() {
        if (!(isdefined(self.m_s_bundle.door_use_trigger) && self.m_s_bundle.door_use_trigger)) {
            return;
        }
        if (self flag::get("open")) {
            if (!(isdefined(self.m_s_bundle.door_closes) && self.m_s_bundle.door_closes)) {
            }
            return;
        }
        if (isdefined(self.m_s_bundle.door_open_message) && self.m_s_bundle.door_open_message != "") {
            return;
        }
        if (isdefined(self.m_s_bundle.door_use_hold) && self.m_s_bundle.door_use_hold) {
            return;
        }
        if (self flag::get("locked")) {
        }
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xae139fde, Offset: 0x1ba0
    // Size: 0x96c
    function open_internal(b_malfunction = 0, var_8e2567b1) {
        var_1b13d203 = isdefined(var_8e2567b1) ? var_8e2567b1 : self.m_s_bundle.door_open_time;
        self flag::set("animating");
        if (isdefined(self.var_a2f96f78.groupname)) {
            a_door_structs = struct::get_array(self.var_a2f96f78.groupname, "groupname");
            foreach (s_door_struct in a_door_structs) {
                b_animating = s_door_struct.c_door flag::get("animating");
                if (s_door_struct.c_door.m_e_door != self.m_e_door) {
                    if (![[ s_door_struct.c_door ]]->is_open() && !b_animating) {
                        s_door_struct.c_door.m_e_trigger_player = self.m_e_trigger_player;
                        [[ s_door_struct.c_door ]]->open();
                    }
                }
            }
        }
        self.m_e_door notify(#"door_opening");
        self.m_e_door function_e0954c11();
        self flag::clear("door_fully_closed");
        if (isdefined(self.m_s_bundle.door_start_sound) && self.m_s_bundle.door_start_sound != "") {
            self.m_e_door playsound(self.m_s_bundle.door_start_sound);
        }
        if (isdefined(self.m_s_bundle.b_loop_sound) && self.m_s_bundle.b_loop_sound) {
            sndent = spawn("script_origin", self.m_e_door.origin);
            sndent linkto(self.m_e_door);
            sndent playloopsound(self.m_s_bundle.door_loop_sound, 1);
        }
        if (self.m_s_bundle.door_open_method == "slide") {
            if (!b_malfunction) {
                function_e4659543(1);
            }
            var_7256682e = function_f1a2a15f(b_malfunction, 1);
            self.m_e_door moveto(var_7256682e, var_1b13d203);
            self.m_e_door waittill(#"movedone");
        } else if (self.m_s_bundle.door_open_method == "swing_away_from_player") {
            if (!isdefined(self.m_e_trigger_player)) {
                if (isdefined(self.var_a2f96f78.groupname)) {
                    a_door_structs = struct::get_array(self.var_a2f96f78.groupname, "groupname");
                    foreach (s_door_struct in a_door_structs) {
                        if (s_door_struct.c_door.m_e_door != self.m_e_door) {
                            if (isdefined(s_door_struct.c_door.m_e_trigger_player)) {
                                self.m_e_trigger_player = s_door_struct.c_door.m_e_trigger_player;
                                break;
                            }
                        }
                    }
                }
            }
            v_player_forward = anglestoforward(self.m_e_trigger_player.angles);
            upvec = anglestoup(self.m_e_trigger_player.angles);
            var_7a69da4c = anglestoforward(self.m_e_door.angles);
            var_5461b69e = var_7a69da4c;
            if (isdefined(self.m_s_bundle.var_25fe36af) && self.m_s_bundle.var_25fe36af) {
                var_5461b69e = vectorcross(var_7a69da4c, upvec);
            }
            var_cd167873 = vectordot(var_5461b69e, v_player_forward);
            if (var_cd167873 > 0) {
                v_angle = function_d36318ad(b_malfunction, 1, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
                self.m_e_door rotateto(v_angle, var_1b13d203);
                self.m_e_door waittill(#"rotatedone");
            } else {
                v_angle = function_d36318ad(b_malfunction, 1, 1, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
                self.m_e_door rotateto(v_angle, var_1b13d203);
                self.m_e_door waittill(#"rotatedone");
            }
        } else if (self.m_s_bundle.door_open_method == "swing") {
            v_angle = function_d36318ad(b_malfunction, 1, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
            self.m_e_door rotateto(v_angle, var_1b13d203);
            self.m_e_door waittill(#"rotatedone");
        } else if (self.m_s_bundle.door_open_method == "animated" && isdefined(self.m_s_bundle.door_animated_open_bundle)) {
            if (scene::get_player_count(self.m_s_bundle.door_animated_open_bundle) > 0) {
                self.m_e_door scene::play(self.m_s_bundle.door_animated_open_bundle, array(self.m_e_door, self.m_e_trigger_player));
            } else {
                self.m_e_door scene::play(self.m_s_bundle.door_animated_open_bundle, self.m_e_door);
            }
        }
        if (isdefined(self.m_n_door_connect_paths) && self.m_n_door_connect_paths && self.m_s_bundle.door_open_method !== "swing") {
            if (isdefined(self.m_s_bundle.var_a6324e06) && self.m_s_bundle.var_a6324e06) {
                self.m_e_door function_df3a1348();
            } else {
                self.m_e_door function_fd4aa4b5();
            }
        }
        self.m_e_door notify(#"door_opened");
        if (isdefined(self.m_s_bundle.b_loop_sound) && self.m_s_bundle.b_loop_sound) {
            sndent delete();
        }
        flag::clear("animating");
        set_script_flags(1);
        function_7d2c33c4(1);
        update_use_message();
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xec80bf5f, Offset: 0x1ae8
    // Size: 0xb0
    function function_e0954c11() {
        if (!isdefined(self.var_7c9174d1)) {
            return;
        }
        foreach (var_221be278 in self.var_7c9174d1) {
            if (!isdefined(var_221be278)) {
                continue;
            }
            var_221be278 dodamage(500, self.origin, undefined, undefined, undefined, "MOD_EXPLOSIVE");
        }
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xa4721e9b, Offset: 0x1818
    // Size: 0x2c2
    function function_f1a2a15f(b_malfunction = 0, b_open_door = 1) {
        if (b_malfunction) {
            if (b_open_door) {
                var_27c5527f = isdefined(self.m_s_bundle.var_52a07bbb) ? self.m_s_bundle.var_52a07bbb : 0;
                var_ef3feac9 = isdefined(self.m_s_bundle.var_7ffecd77) ? self.m_s_bundle.var_7ffecd77 : 0;
            } else {
                var_27c5527f = isdefined(self.m_s_bundle.var_afd6d156) ? self.m_s_bundle.var_afd6d156 : 0;
                var_ef3feac9 = isdefined(self.m_s_bundle.var_acfdd537) ? self.m_s_bundle.var_acfdd537 : 0;
            }
            if (var_27c5527f == 0 && var_ef3feac9 == 0) {
                var_42cf6fbd = 0;
            } else if (var_ef3feac9 > var_27c5527f) {
                var_42cf6fbd = randomfloatrange(var_27c5527f, var_ef3feac9);
            } else {
                /#
                    assertmsg("<unknown string>");
                #/
            }
            switch (self.var_3c6838bc) {
            case #"x":
                v_offset = (var_42cf6fbd, 0, 0);
                break;
            case #"y":
                v_offset = (0, var_42cf6fbd, 0);
                break;
            case #"z":
                v_offset = (0, 0, var_42cf6fbd);
                break;
            default:
                v_offset = (0, 0, 0);
                break;
            }
            if (b_open_door) {
                var_58636008 = calculate_offset_position(self.m_v_open_pos, self.var_85f2454d.angles, v_offset);
            } else {
                var_58636008 = calculate_offset_position(self.m_v_close_pos, self.var_85f2454d.angles, v_offset);
            }
        } else if (b_open_door) {
            var_58636008 = self.m_v_open_pos;
        } else {
            var_58636008 = self.m_v_close_pos;
        }
        return var_58636008;
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x1e610d56, Offset: 0x1598
    // Size: 0x274
    function function_f50c09b3(b_enable) {
        self notify(#"hash_50b9293fc24e2756");
        self endon(#"hash_50b9293fc24e2756");
        self.m_e_door endon(#"death");
        if (b_enable) {
            self notify(#"hash_3becf718b3c58ac9");
        }
        n_delay_min = isdefined(self.m_s_bundle.var_b7a623f5) ? self.m_s_bundle.var_b7a623f5 : 0.1;
        n_delay_max = isdefined(self.m_s_bundle.var_5cac6503) ? self.m_s_bundle.var_5cac6503 : 1;
        if (self.m_s_bundle.door_open_method === "slide" || self.m_s_bundle.door_open_method === "swing") {
            if (b_enable) {
                while (true) {
                    open_internal(b_enable, randomfloatrange(n_delay_min, n_delay_max));
                    wait(randomfloatrange(n_delay_min, n_delay_max));
                    close_internal(b_enable, randomfloatrange(n_delay_min, n_delay_max));
                }
            } else {
                close_internal(b_enable);
                level thread doors::door_update(self);
            }
            return;
        }
        if (self.m_s_bundle.door_open_method == "animated" && isdefined(self.m_s_bundle.var_6a0dae54)) {
            if (b_enable) {
                self.var_85f2454d thread scene::play(self.m_s_bundle.var_6a0dae54, self.m_e_door);
                return;
            }
            self.var_85f2454d thread scene::stop(self.m_s_bundle.var_6a0dae54);
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x3ad65deb, Offset: 0x1568
    // Size: 0x24
    function close() {
        self flag::clear("open");
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xa8e70ea2, Offset: 0x14e0
    // Size: 0x80
    function function_cbbcc8ab() {
        self flag::wait_till("door_fully_closed");
        while (isdefined(self.m_e_trigger_player) && distance2d(self.m_e_trigger_player.origin, self.m_e_door.origin) < 16) {
            waitframe(1);
        }
    }

    // Namespace cdoor/doors_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xf6726d99, Offset: 0xd58
    // Size: 0x77c
    function close_internal(b_malfunction = 0, var_8e2567b1) {
        if (self flag::get("door_fully_closed")) {
            return;
        } else {
            self flag::clear("open");
        }
        if (isdefined(self.var_a2f96f78.groupname)) {
            a_door_structs = struct::get_array(self.var_a2f96f78.groupname, "groupname");
            foreach (s_door_struct in a_door_structs) {
                b_animating = s_door_struct.c_door flag::get("animating");
                if (s_door_struct.c_door.m_e_door != self.m_e_door) {
                    if ([[ s_door_struct.c_door ]]->is_open() && !b_animating) {
                        [[ s_door_struct.c_door ]]->close();
                    }
                }
            }
        }
        var_1b13d203 = isdefined(var_8e2567b1) ? var_8e2567b1 : self.m_s_bundle.door_open_time;
        set_script_flags(0);
        self flag::set("animating");
        self.m_e_door notify(#"door_closing");
        self thread function_cbbcc8ab();
        if (isdefined(self.m_s_bundle.b_loop_sound) && self.m_s_bundle.b_loop_sound) {
            self.m_e_door playsound(self.m_s_bundle.door_start_sound);
            sndent = spawn("script_origin", self.m_e_door.origin);
            sndent linkto(self.m_e_door);
            sndent playloopsound(self.m_s_bundle.door_loop_sound, 1);
        } else if (isdefined(self.m_s_bundle.door_stop_sound) && self.m_s_bundle.door_stop_sound != "") {
            self.m_e_door playsound(self.m_s_bundle.door_stop_sound);
        }
        if (self.m_s_bundle.door_open_method == "slide") {
            if (!b_malfunction) {
                function_e4659543(0);
            }
            var_ce02fcb7 = function_f1a2a15f(b_malfunction, 0);
            self.m_e_door moveto(var_ce02fcb7, var_1b13d203);
            self.m_e_door waittill(#"movedone");
        } else if (self.m_s_bundle.door_open_method == "swing_away_from_player") {
            v_angle = function_d36318ad(b_malfunction, 0, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
            self.m_e_door rotateto(v_angle, var_1b13d203);
            self.m_e_door waittill(#"rotatedone");
        } else if (self.m_s_bundle.door_open_method == "swing") {
            v_angle = function_d36318ad(b_malfunction, 0, 0, self.m_s_bundle.var_16a4e229, self.m_s_bundle.var_16e3e29b);
            self.m_e_door rotateto(v_angle, var_1b13d203);
            self.m_e_door waittill(#"rotatedone");
        } else if (self.m_s_bundle.door_open_method == "animated" && isdefined(self.m_s_bundle.door_animated_close_bundle)) {
            if (scene::get_player_count(self.m_s_bundle.door_animated_close_bundle) > 0) {
                self.m_e_door notify(#"hash_3803c0c576f1982b", {#player:self.m_e_trigger_player});
                self.m_e_door scene::play(self.m_s_bundle.door_animated_close_bundle, array(self.m_e_door, self.m_e_trigger_player));
            } else {
                self.m_e_door scene::play(self.m_s_bundle.door_animated_close_bundle, self.m_e_door);
            }
        }
        self.m_e_door notify(#"door_closed");
        self flag::set("door_fully_closed");
        if (isdefined(self.m_n_door_connect_paths) && self.m_n_door_connect_paths) {
            if (isdefined(self.m_s_bundle.var_a6324e06) && self.m_s_bundle.var_a6324e06) {
                self.m_e_door function_fd4aa4b5();
            } else {
                self.m_e_door function_df3a1348();
            }
        }
        if (isdefined(self.m_s_bundle.b_loop_sound) && self.m_s_bundle.b_loop_sound) {
            sndent delete();
            self.m_e_door playsound(self.m_s_bundle.door_stop_sound);
        }
        flag::clear("animating");
        function_7d2c33c4(0);
        update_use_message();
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x86917fa9, Offset: 0xb58
    // Size: 0x1f8
    function function_7d2c33c4(b_opened = 1) {
        if (b_opened) {
            foreach (node in self.var_fb8a6fcc) {
                setenablenode(node, 1);
            }
            foreach (node in self.var_e1a5a27e) {
                setenablenode(node, 0);
            }
            return;
        }
        foreach (node in self.var_fb8a6fcc) {
            setenablenode(node, 0);
        }
        foreach (node in self.var_e1a5a27e) {
            setenablenode(node, 1);
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x8ced6da1, Offset: 0xb20
    // Size: 0x2c
    function remove_door_trigger() {
        if (isdefined(self.m_e_trigger)) {
            self.m_e_trigger delete();
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xebf51daa, Offset: 0xaf0
    // Size: 0x22
    function is_open() {
        return self flag::get("open");
    }

    // Namespace cdoor/doors_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x4bbbb54f, Offset: 0xac8
    // Size: 0x1a
    function set_player_who_opened(e_player) {
        self.m_e_trigger_player = e_player;
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x98a7b69e, Offset: 0xa48
    // Size: 0x74
    function open() {
        if (self.m_str_type === "breach" && !(isdefined(self.var_9bc2acd6) && self.var_9bc2acd6)) {
            self notify(#"hash_722c5466076f75cf");
            self.var_9bc2acd6 = 1;
            return;
        }
        self flag::set("open");
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x58fa915e, Offset: 0x9e8
    // Size: 0x56
    function delete_door() {
        self.m_e_door delete();
        self.m_e_door = undefined;
        if (isdefined(self.m_e_trigger)) {
            self.m_e_trigger delete();
            self.m_e_trigger = undefined;
        }
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x32a7b2f5, Offset: 0x9b8
    // Size: 0x24
    function unlock() {
        self flag::clear("locked");
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xe0adf437, Offset: 0x978
    // Size: 0x34
    function lock() {
        self flag::set("locked");
        update_use_message();
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0x1abdd14f, Offset: 0x868
    // Size: 0x106
    function init_hint_trigger() {
        if (isdefined(self.m_s_bundle.door_interact)) {
            return;
        }
        if (self.m_s_bundle.door_unlock_method === "default" && !(isdefined(self.m_s_bundle.door_trigger_at_target) && self.m_s_bundle.door_trigger_at_target)) {
            return;
        }
        v_offset = self.m_s_bundle.v_trigger_offset;
        n_radius = self.m_s_bundle.door_trigger_radius;
        v_pos = calculate_offset_position(self.m_e_door.origin, self.m_e_door.angles, v_offset);
        v_pos = (v_pos[0], v_pos[1], v_pos[2] + 50);
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xb90f403b, Offset: 0x7e0
    // Size: 0x80
    function get_hack_angles() {
        v_angles = self.m_e_door.angles;
        if (isdefined(self.var_a2f96f78.target)) {
            e_target = getent(self.var_a2f96f78.target, "targetname");
            if (isdefined(e_target)) {
                return e_target.angles;
            }
        }
        return v_angles;
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xd1b13441, Offset: 0x6f0
    // Size: 0xe8
    function get_hack_pos() {
        v_trigger_offset = self.m_s_bundle.v_trigger_offset;
        v_pos = calculate_offset_position(self.m_e_door.origin, self.m_e_door.angles, v_trigger_offset);
        v_pos = (v_pos[0], v_pos[1], v_pos[2] + 50);
        if (isdefined(self.var_a2f96f78.target)) {
            e_target = getent(self.var_a2f96f78.target, "targetname");
            if (isdefined(e_target)) {
                return e_target.origin;
            }
        }
        return v_pos;
    }

    // Namespace cdoor/doors_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0x1c63e81a, Offset: 0x490
    // Size: 0x254
    function init_door_model(e_or_str_model, connect_paths, s_door_instance) {
        if (isentity(e_or_str_model)) {
            self.m_e_door = e_or_str_model;
        } else if (!isdefined(e_or_str_model) && !isdefined(s_door_instance.model)) {
            e_or_str_model = "tag_origin";
        }
        if (!isdefined(self.m_e_door)) {
            self.m_e_door = util::spawn_model(e_or_str_model, s_door_instance.origin, s_door_instance.angles);
        }
        self.m_e_door function_881077b4(33, 1);
        if (connect_paths) {
            self.m_e_door function_df3a1348();
        }
        self.m_e_door.script_objective = s_door_instance.script_objective;
        self.var_85f2454d = {#angles:self.m_e_door.angles, #origin:self.m_e_door.origin};
        self.m_e_door thread doors::function_fa74d5cd(self);
        if (isdefined(s_door_instance.linkname)) {
            self.var_e1477b7c = getentarray(s_door_instance.linkname, "linkto");
            if (isdefined(s_door_instance.script_tag)) {
                array::run_all(self.var_e1477b7c, &linkto, self.m_e_door, s_door_instance.script_tag);
            } else {
                array::run_all(self.var_e1477b7c, &linkto, self.m_e_door);
            }
        }
        self.m_e_door.var_4f564337 = 1;
        self.m_e_door thread function_670cd4a3();
    }

    // Namespace cdoor/doors_shared
    // Params 0, eflags: 0x1 linked
    // Checksum 0xdf016dde, Offset: 0x478
    // Size: 0xa
    function function_61c13b93() {
        return self.m_v_close_pos;
    }

}

// Namespace doors/doors_shared
// Params 0, eflags: 0x2
// Checksum 0x4f5520bf, Offset: 0x4818
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"doors", &__init__, &__main__, undefined);
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x80f724d1, Offset: 0x4868
// Size: 0x4
function __init__() {
    
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xd1e28d2f, Offset: 0x4878
// Size: 0x1bc
function __main__() {
    level flagsys::wait_till("radiant_gameobjects_initialized");
    var_1cde154f = getgametypesetting(#"use_doors");
    var_5a23774b = getdvarint(#"disabledoors", 0);
    if (!(isdefined(var_1cde154f) && var_1cde154f) || isdefined(var_5a23774b) && var_5a23774b) {
        return;
    }
    a_doors = struct::get_array("scriptbundle_doors", "classname");
    a_doors = arraycombine(a_doors, getentarray("smart_object_door", "script_noteworthy"), 0, 0);
    foreach (s_instance in a_doors) {
        c_door = s_instance init();
        if (isdefined(c_door)) {
            s_instance.c_door = c_door;
        }
    }
    level thread init_door_panels();
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x87fc2867, Offset: 0x4a40
// Size: 0x168
function init_door_panels() {
    a_door_panels = struct::get_array("smart_object_door_panel", "script_noteworthy");
    a_door_panels = arraycombine(a_door_panels, getentarray("smart_object_door_panel", "script_noteworthy"), 0, 0);
    a_door_panels = arraycombine(a_door_panels, struct::get_array("scriptbundle_gameobject", "classname"), 0, 0);
    foreach (door_panel in a_door_panels) {
        if (isdefined(door_panel.script_gameobject) || isdefined(door_panel.mdl_gameobject)) {
            if (!isdefined(door_panel.mdl_gameobject)) {
                door_panel gameobjects::init_game_objects(door_panel.script_gameobject);
            }
            door_panel setup_doors_with_panel();
        }
    }
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xf65de57c, Offset: 0x4bb0
// Size: 0x198
function setup_doors_with_panel() {
    var_c1157335 = 0;
    if (isdefined(self.target)) {
        a_e_doors = getentarray(self.target, "targetname");
        a_e_doors = arraycombine(a_e_doors, struct::get_array(self.target, "targetname"), 0, 0);
        foreach (e_door in a_e_doors) {
            if (isdefined(e_door) && isdefined(e_door.c_door)) {
                door = e_door.c_door;
                [[ door ]]->remove_door_trigger();
                if (!var_c1157335) {
                    if (isdefined(door.m_s_bundle.door_closes) && door.m_s_bundle.door_closes) {
                        var_ce2455a3 = 1;
                    } else {
                        var_ce2455a3 = 0;
                    }
                    var_c1157335 = 1;
                    self thread door_panel_interact(var_ce2455a3);
                }
            }
        }
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xcff4ffda, Offset: 0x4d50
// Size: 0x39e
function door_panel_interact(b_is_panel_reusable) {
    self endon(#"death");
    self.mdl_gameobject endon(#"death");
    while (true) {
        waitresult = undefined;
        waitresult = self.mdl_gameobject waittill(#"gameobject_end_use_player");
        e_player = waitresult.player;
        self.mdl_gameobject gameobjects::disable_object(1);
        if (isdefined(self.target)) {
            a_e_doors = getentarray(self.target, "targetname");
            a_e_doors = arraycombine(a_e_doors, struct::get_array(self.target, "targetname"), 0, 0);
            foreach (e_door in a_e_doors) {
                if (isdefined(e_door) && isdefined(e_door.c_door)) {
                    door = e_door.c_door;
                    [[ door ]]->unlock();
                    [[ door ]]->set_player_who_opened(e_player);
                    if ([[ door ]]->is_open()) {
                        [[ door ]]->close();
                        if (!(isdefined(door.m_s_bundle.door_closes) && door.m_s_bundle.door_closes) && isdefined(door.m_s_bundle.var_d37e8f3e) && door.m_s_bundle.var_d37e8f3e) {
                            door notify(#"set_destructible", {#player:e_player});
                        }
                        continue;
                    }
                    [[ door ]]->open();
                }
            }
            waitframe(1);
            if (isdefined(b_is_panel_reusable) && b_is_panel_reusable) {
                while (true) {
                    b_door_animating = 0;
                    foreach (e_door in a_e_doors) {
                        if (isdefined(e_door) && isdefined(e_door.c_door)) {
                            door = e_door.c_door;
                            if (door flag::get("animating")) {
                                b_door_animating = 1;
                                break;
                            }
                        }
                    }
                    if (!b_door_animating) {
                        break;
                    }
                    waitframe(1);
                }
                self.mdl_gameobject gameobjects::enable_object(1);
                continue;
            }
            return;
        }
    }
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x1 linked
// Checksum 0xac1fa319, Offset: 0x50f8
// Size: 0x92
function init() {
    if (!isdefined(self.angles)) {
        self.angles = (0, 0, 0);
    }
    s_door_bundle = struct::get_script_bundle("doors", isdefined(self.var_e87a94f3) ? self.var_e87a94f3 : self.scriptbundlename);
    c_door = new cdoor();
    return setup_door_info(s_door_bundle, self, c_door);
}

// Namespace doors/doors_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xca31279f, Offset: 0x5198
// Size: 0xc30
function setup_door_info(s_door_bundle, s_door_instance, c_door) {
    c_door flag::init("locked");
    c_door flag::init("open");
    c_door flag::init("animating");
    c_door flag::init("door_fully_closed");
    if (!isdefined(s_door_bundle)) {
        s_door_bundle = spawnstruct();
        s_door_bundle.door_open_method = s_door_instance.door_open_method;
        s_door_bundle.var_25fe36af = s_door_instance.var_25fe36af;
        s_door_bundle.door_slide_horizontal = s_door_instance.door_slide_horizontal;
        s_door_bundle.door_slide_horizontal_y = s_door_instance.door_slide_horizontal_y;
        s_door_bundle.door_open_time = s_door_instance.door_open_time;
        s_door_bundle.door_slide_open_units = s_door_instance.door_slide_open_units;
        s_door_bundle.door_swing_angle = s_door_instance.door_swing_angle;
        s_door_bundle.var_f2943dab = s_door_instance.var_f2943dab;
        s_door_bundle.door_closes = s_door_instance.door_closes;
        s_door_bundle.var_d37e8f3e = s_door_instance.var_d37e8f3e;
        s_door_bundle.door_start_open = s_door_instance.door_start_open;
        s_door_bundle.door_triggeroffsetx = s_door_instance.door_triggeroffset[0];
        s_door_bundle.door_triggeroffsety = s_door_instance.door_triggeroffset[1];
        s_door_bundle.door_triggeroffsetz = s_door_instance.door_triggeroffset[2];
        s_door_bundle.door_trigger_radius = s_door_instance.door_trigger_radius;
        s_door_bundle.door_start_sound = s_door_instance.door_start_sound;
        s_door_bundle.door_loop_sound = s_door_instance.door_loop_sound;
        s_door_bundle.door_stop_sound = s_door_instance.door_stop_sound;
        s_door_bundle.door_animated_open_bundle = s_door_instance.door_animated_open_bundle;
        s_door_bundle.door_animated_close_bundle = s_door_instance.door_animated_close_bundle;
        s_door_bundle.var_b24cba18 = s_door_instance.var_b24cba18;
        s_door_bundle.model = s_door_instance;
        s_door_instance.door_open_method = undefined;
        s_door_instance.var_25fe36af = undefined;
        s_door_instance.door_slide_horizontal = undefined;
        s_door_instance.door_slide_horizontal_y = undefined;
        s_door_instance.door_open_time = undefined;
        s_door_instance.door_slide_open_units = undefined;
        s_door_instance.door_swing_angle = undefined;
        s_door_instance.var_f2943dab = undefined;
        s_door_instance.door_closes = undefined;
        s_door_instance.var_d37e8f3e = undefined;
        s_door_instance.door_start_open = undefined;
        s_door_instance.door_triggeroffsetx = undefined;
        s_door_instance.door_triggeroffsety = undefined;
        s_door_instance.door_triggeroffsetz = undefined;
        s_door_instance.door_trigger_radius = undefined;
        s_door_instance.door_start_sound = undefined;
        s_door_instance.door_loop_sound = undefined;
        s_door_instance.door_stop_sound = undefined;
        s_door_instance.door_animated_open_bundle = undefined;
        s_door_instance.door_animated_close_bundle = undefined;
        s_door_instance.var_b24cba18 = undefined;
        s_door_instance.var_ee1b0615 = undefined;
        s_door_instance.var_3b86b7db = undefined;
        s_door_instance.var_16a4e229 = undefined;
        s_door_instance.var_16e3e29b = undefined;
    }
    c_door.m_s_bundle = s_door_bundle;
    c_door.var_a2f96f78 = s_door_instance;
    if (isdefined(s_door_instance.target)) {
        a_target_ents = getentarray(s_door_instance.target, "targetname");
        foreach (ent in a_target_ents) {
            if (ent.objectid === "clip_player_doorway") {
                if (isdefined(ent.script_door_enable_player_clip) && ent.script_door_enable_player_clip) {
                    ent.targetname = undefined;
                    c_door.m_e_player_clip = ent;
                } else {
                    ent delete();
                }
                continue;
            }
            if (ent trigger::is_trigger_of_type()) {
                c_door.m_s_bundle.door_trigger_at_target = 1;
            }
        }
    }
    if (c_door.m_s_bundle.door_unlock_method === "hack" && !(isdefined(level.door_hack_precached) && level.door_hack_precached)) {
        level.door_hack_precached = 1;
    }
    e_or_str_door_model = c_door.m_s_bundle.model;
    if (isdefined(c_door.m_s_bundle.door_triggeroffsetx)) {
        n_xoffset = c_door.m_s_bundle.door_triggeroffsetx;
    } else {
        n_xoffset = 0;
    }
    if (isdefined(c_door.m_s_bundle.door_triggeroffsety)) {
        n_yoffset = c_door.m_s_bundle.door_triggeroffsety;
    } else {
        n_yoffset = 0;
    }
    if (isdefined(c_door.m_s_bundle.door_triggeroffsetz)) {
        n_zoffset = c_door.m_s_bundle.door_triggeroffsetz;
    } else {
        n_zoffset = 0;
    }
    v_trigger_offset = (n_xoffset, n_yoffset, n_zoffset);
    c_door.m_s_bundle.v_trigger_offset = v_trigger_offset;
    n_trigger_radius = c_door.m_s_bundle.door_trigger_radius;
    if (isdefined(c_door.m_s_bundle.door_slide_horizontal) && c_door.m_s_bundle.door_slide_horizontal) {
        if (isdefined(c_door.m_s_bundle.door_slide_horizontal_y) && c_door.m_s_bundle.door_slide_horizontal_y) {
            str_slide_dir = "Y";
        } else {
            str_slide_dir = "X";
        }
    } else {
        str_slide_dir = "Z";
    }
    n_open_time = c_door.m_s_bundle.door_open_time;
    n_slide_amount = c_door.m_s_bundle.door_slide_open_units;
    if (!isdefined(c_door.m_s_bundle.door_swing_angle)) {
        c_door.m_s_bundle.door_swing_angle = 0;
    }
    if (!isdefined(c_door.m_s_bundle.var_f2943dab)) {
        c_door.m_s_bundle.var_f2943dab = 0;
    }
    if (isdefined(c_door.m_s_bundle.door_closes) && c_door.m_s_bundle.door_closes) {
        n_door_closes = 1;
    } else {
        n_door_closes = 0;
    }
    if (isdefined(c_door.m_s_bundle.door_connect_paths) && c_door.m_s_bundle.door_connect_paths) {
        n_door_connect_paths = 1;
    } else {
        n_door_connect_paths = 0;
    }
    if (isdefined(s_door_instance.script_obstruction_cover_open)) {
        c_door.var_fb8a6fcc = getnodearray(s_door_instance.script_obstruction_cover_open, "script_obstruction_cover_open");
    }
    if (isdefined(s_door_instance.script_obstruction_cover_close)) {
        c_door.var_e1a5a27e = getnodearray(s_door_instance.script_obstruction_cover_close, "script_obstruction_cover_close");
    }
    [[ c_door ]]->function_7d2c33c4(0);
    if (isdefined(c_door.m_s_bundle.door_start_open) && c_door.m_s_bundle.door_start_open) {
        c_door flag::set("open");
    }
    if (isdefined(c_door.var_a2f96f78.script_flag)) {
        a_flags = strtok(c_door.var_a2f96f78.script_flag, ",");
        foreach (str_flag in a_flags) {
            level flag::init(str_flag);
        }
    }
    [[ c_door ]]->init_door_model(e_or_str_door_model, n_door_connect_paths, s_door_instance);
    [[ c_door ]]->init_trigger(v_trigger_offset, n_trigger_radius, c_door.m_s_bundle);
    [[ c_door ]]->init_player_spawns();
    [[ c_door ]]->init_hint_trigger();
    thread [[ c_door ]]->run_lock_fx();
    [[ c_door ]]->init_movement(str_slide_dir, n_slide_amount);
    if (!isdefined(c_door.m_s_bundle.door_open_time)) {
        c_door.m_s_bundle.door_open_time = 0.4;
    }
    [[ c_door ]]->set_door_paths(n_door_connect_paths);
    if (isdefined(s_door_instance.script_delay)) {
        [[ c_door ]]->function_ea9e96ca(s_door_instance.script_delay);
    }
    c_door.m_s_bundle.b_loop_sound = isdefined(c_door.m_s_bundle.door_loop_sound) && c_door.m_s_bundle.door_loop_sound != "";
    if (isdefined(s_door_instance.var_d7532565) && s_door_instance.var_d7532565) {
        c_door thread function_83929c65(1);
    } else {
        level thread door_update(c_door);
    }
    if (isdefined(c_door.m_s_bundle.var_d37e8f3e) && c_door.m_s_bundle.var_d37e8f3e) {
        level thread function_dc98f943(c_door);
    }
    return c_door;
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x459e28f, Offset: 0x5dd0
// Size: 0x400
function door_open_update(c_door) {
    if (!isdefined(c_door.m_e_trigger)) {
        return;
    }
    c_door.m_e_trigger endon(#"death");
    str_unlock_method = "default";
    if (isdefined(c_door.m_s_bundle.door_unlock_method)) {
        str_unlock_method = c_door.m_s_bundle.door_unlock_method;
    }
    b_auto_close = isdefined(c_door.m_s_bundle.door_closes) && c_door.m_s_bundle.door_closes && !(isdefined(c_door.m_s_bundle.door_use_trigger) && c_door.m_s_bundle.door_use_trigger);
    b_hold_open = isdefined(c_door.m_s_bundle.door_use_hold) && c_door.m_s_bundle.door_use_hold;
    b_manual_close = isdefined(c_door.m_s_bundle.door_use_trigger) && c_door.m_s_bundle.door_use_trigger && isdefined(c_door.m_s_bundle.door_closes) && c_door.m_s_bundle.door_closes;
    while (true) {
        waitresult = undefined;
        waitresult = c_door.m_e_trigger waittill(#"trigger");
        e_who = waitresult.activator;
        c_door.m_e_trigger_player = e_who;
        if (c_door.var_a2f96f78.script_team !== #"any" && !c_door.m_e_trigger_player util::is_on_side(c_door.var_a2f96f78.script_team)) {
            continue;
        }
        if (!c_door flag::get("open")) {
            if (!c_door flag::get("locked")) {
                if (b_hold_open || b_auto_close) {
                    [[ c_door ]]->open();
                    if (b_hold_open) {
                        if (isplayer(e_who)) {
                            e_who player_freeze_in_place(1);
                            e_who disableweapons();
                            e_who disableoffhandweapons();
                        }
                    }
                    door_wait_until_clear(c_door, e_who);
                    [[ c_door ]]->close();
                    if (b_hold_open) {
                        waitframe(1);
                        c_door flag::wait_till_clear("animating");
                        if (isplayer(e_who)) {
                            e_who player_freeze_in_place(0);
                            e_who enableweapons();
                            e_who enableoffhandweapons();
                        }
                    }
                } else {
                    [[ c_door ]]->open();
                }
            }
            continue;
        }
        if (b_manual_close) {
            [[ c_door ]]->close();
        }
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x78b97f9d, Offset: 0x61d8
// Size: 0x2f6
function door_update(c_door) {
    c_door notify(#"hash_3becf718b3c58ac9");
    c_door endon(#"hash_3becf718b3c58ac9");
    str_unlock_method = "default";
    if (isdefined(c_door.m_s_bundle.door_unlock_method)) {
        str_unlock_method = c_door.m_s_bundle.door_unlock_method;
    }
    if (isdefined(c_door.m_s_bundle.door_locked) && c_door.m_s_bundle.door_locked) {
        c_door flag::set("locked");
        if (isdefined(c_door.var_a2f96f78.targetname)) {
            thread door_update_lock_scripted(c_door);
        }
    }
    thread door_open_update(c_door);
    [[ c_door ]]->update_use_message();
    while (true) {
        if (c_door flag::get("locked")) {
            c_door flag::wait_till_clear("locked");
        }
        c_door flag::wait_till("open");
        if (c_door.m_door_open_delay_time > 0) {
            c_door.m_e_door notify(#"door_waiting_to_open", {#player:c_door.m_e_trigger_player});
            wait(c_door.m_door_open_delay_time);
        }
        [[ c_door ]]->open_internal();
        c_door flag::wait_till_clear("open");
        [[ c_door ]]->close_internal();
        if (!(isdefined(c_door.m_s_bundle.door_closes) && c_door.m_s_bundle.door_closes)) {
            if (isdefined(c_door.m_s_bundle.var_d37e8f3e) && c_door.m_s_bundle.var_d37e8f3e) {
                c_door notify(#"set_destructible", {#player:c_door.m_e_trigger_player});
            }
            break;
        }
        waitframe(1);
    }
    if (isdefined(c_door.m_e_trigger)) {
        c_door.m_e_trigger delete();
        c_door.m_e_trigger = undefined;
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x1fcecbc4, Offset: 0x64d8
// Size: 0xa8
function door_update_lock_scripted(c_door) {
    door_str = c_door.var_a2f96f78.targetname;
    c_door.m_e_trigger.targetname = door_str + "_trig";
    c_door.m_e_trigger endon(#"death");
    while (true) {
        c_door.m_e_trigger waittill(#"unlocked");
        [[ c_door ]]->unlock();
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x63d4ebfd, Offset: 0x6588
// Size: 0x4a0
function function_dc98f943(c_door) {
    e_door = c_door.m_e_door;
    e_door endon(#"door_cleared", #"delete");
    /#
        assert(isdefined(e_door), "<unknown string>");
    #/
    e_door setcandamage(0);
    waitresult = undefined;
    waitresult = c_door waittill(#"set_destructible");
    e_door waittill(#"door_closed");
    e_door setcandamage(1);
    e_door setteam(waitresult.player.team);
    if (isdefined(c_door.var_a2f96f78) && isdefined(c_door.var_a2f96f78.script_make_full_sentient) && c_door.var_a2f96f78.script_make_full_sentient) {
        e_door makesentient();
        e_door.canbemeleed = 0;
    } else {
        e_door util::function_5d36c37a();
    }
    target_set(e_door);
    level notify(#"hash_9db88375ef038b", {#player:waitresult.player, #c_door:c_door});
    e_door val::set(#"hash_25bedd86747e41e1", "takedamage", 1);
    e_door val::set(#"hash_25bedd86747e41e1", "allowdeath", 1);
    if (isdefined(c_door.m_s_bundle.registersidestepshouldstun)) {
        e_door.health = c_door.m_s_bundle.registersidestepshouldstun;
    } else {
        e_door.health = 10000;
    }
    if (isdefined(c_door.m_s_bundle.var_8bed02db)) {
        e_door.script_health = e_door.health;
        e_door thread scene::init(c_door.m_s_bundle.var_8bed02db, e_door);
        e_door waittill(#"hash_18be12558bc58fe");
    } else {
        while (e_door.health > 0) {
            e_door waittill(#"damage");
        }
        e_door ghost();
    }
    target_remove(e_door);
    if (issentient(e_door)) {
        e_door function_60d50ea4();
    } else if (function_ffa5b184(e_door)) {
        e_door function_dfee3dec();
    }
    e_door val::reset(#"hash_25bedd86747e41e1", "takedamage");
    e_door val::reset(#"hash_25bedd86747e41e1", "allowdeath");
    e_door.health = 0;
    if (isdefined(c_door.m_s_bundle.var_ffb77aca)) {
        playfxontag(c_door.m_s_bundle.var_ffb77aca, e_door, "tag_origin");
    }
    e_door notsolid();
    e_door function_fd4aa4b5();
    e_door notify(#"door_cleared");
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x3d1036c1, Offset: 0x6a30
// Size: 0x11c
function player_freeze_in_place(b_do_freeze) {
    if (!b_do_freeze) {
        if (isdefined(self.freeze_origin)) {
            self unlink();
            self.freeze_origin delete();
            self.freeze_origin = undefined;
        }
        return;
    }
    if (!isdefined(self.freeze_origin)) {
        self.freeze_origin = spawn("script_model", self.origin);
        self.freeze_origin setmodel(#"tag_origin");
        self.freeze_origin.angles = self.angles;
        self playerlinktodelta(self.freeze_origin, "tag_origin", 1, 45, 45, 45, 45);
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb4411906, Offset: 0x6b58
// Size: 0x12e
function function_4fb146e4(c_door) {
    allentities = getentitiesinradius([[ c_door ]]->function_61c13b93(), 30);
    entcount = 0;
    foreach (entity in allentities) {
        if (isplayer(entity)) {
            continue;
        }
        if (iscorpse(entity) && isdefined(level.var_a348230f) && level.var_a348230f) {
            entity delete();
            continue;
        }
        if (!isdefined(entity.weapon)) {
            continue;
        }
        entcount++;
    }
    return entcount == 0;
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x167961c3, Offset: 0x6c90
// Size: 0x126
function trigger_wait_until_clear(c_door) {
    self endon(#"death");
    last_trigger_time = gettime();
    self.ents_in_trigger = 1;
    str_kill_trigger_notify = "trigger_now_clear";
    self thread trigger_check_for_ents_touching(str_kill_trigger_notify);
    while (true) {
        time = gettime();
        if (self.ents_in_trigger == 1) {
            self.ents_in_trigger = 0;
            last_trigger_time = time;
        }
        var_39533c4 = 0;
        dt = float(time - last_trigger_time) / 1000;
        if (dt >= 0.3) {
            var_39533c4 = 1;
        }
        if (var_39533c4 && function_4fb146e4(c_door)) {
            break;
        }
        waitframe(1);
    }
    self notify(str_kill_trigger_notify);
}

// Namespace doors/doors_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x551d8c4f, Offset: 0x6dc0
// Size: 0xee
function door_wait_until_user_release(c_door, e_triggerer, str_kill_on_door_notify) {
    if (isdefined(str_kill_on_door_notify)) {
        c_door endon(str_kill_on_door_notify);
    }
    wait(0.25);
    max_dist_sq = c_door.m_s_bundle.door_trigger_radius * c_door.m_s_bundle.door_trigger_radius;
    b_pressed = 1;
    n_dist = 0;
    do {
        waitframe(1);
        b_pressed = e_triggerer usebuttonpressed();
        n_dist = distancesquared(e_triggerer.origin, self.origin);
    } while (b_pressed && n_dist < max_dist_sq);
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x1d08f939, Offset: 0x6eb8
// Size: 0xac
function door_wait_until_clear(c_door, e_triggerer) {
    e_trigger = c_door.m_e_trigger;
    if (isplayer(e_triggerer) && isdefined(c_door.m_s_bundle.door_use_hold) && c_door.m_s_bundle.door_use_hold) {
        c_door.m_e_trigger door_wait_until_user_release(c_door, e_triggerer);
    }
    e_trigger trigger_wait_until_clear(c_door);
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x4515f6d3, Offset: 0x6f70
// Size: 0x4a
function trigger_check_for_ents_touching(str_kill_trigger_notify) {
    self endon(#"death", str_kill_trigger_notify);
    while (true) {
        self waittill(#"trigger");
        self.ents_in_trigger = 1;
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x0
// Checksum 0xfcfc5b45, Offset: 0x6fc8
// Size: 0x98
function door_debug_line(v_origin) {
    self endon(#"death");
    while (true) {
        v_start = v_origin;
        v_end = v_start + vectorscale((0, 0, 1), 1000);
        v_col = (0, 0, 1);
        /#
            line(v_start, v_end, (0, 0, 1));
        #/
        wait(0.1);
    }
}

// Namespace doors/doors_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x25601650, Offset: 0x7068
// Size: 0x144
function unlock(str_value, str_key = "targetname", b_do_open = 1) {
    if (isdefined(self.c_door)) {
        [[ self.c_door ]]->unlock();
        if (b_do_open) {
            [[ self.c_door ]]->open();
        }
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    foreach (e_door in a_e_doors) {
        if (isdefined(e_door.c_door)) {
            [[ e_door.c_door ]]->unlock();
            if (b_do_open) {
                [[ e_door.c_door ]]->open();
            }
        }
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x0
// Checksum 0x4a471a80, Offset: 0x71b8
// Size: 0x34
function unlock_all(b_do_open = 1) {
    unlock(undefined, undefined, b_do_open);
}

// Namespace doors/doors_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x42cbb618, Offset: 0x71f8
// Size: 0x144
function lock(str_value, str_key = "targetname", b_do_close = 1) {
    if (isdefined(self.c_door)) {
        if (b_do_close) {
            [[ self.c_door ]]->close();
        }
        [[ self.c_door ]]->lock();
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    foreach (e_door in a_e_doors) {
        if (isdefined(e_door.c_door)) {
            if (b_do_close) {
                [[ e_door.c_door ]]->close();
            }
            [[ e_door.c_door ]]->lock();
        }
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x0
// Checksum 0x2456fad0, Offset: 0x7348
// Size: 0x34
function lock_all(b_do_close = 1) {
    lock(undefined, undefined, b_do_close);
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xca293afe, Offset: 0x7388
// Size: 0xf0
function open(str_value, str_key = "targetname") {
    if (isdefined(self.c_door)) {
        [[ self.c_door ]]->open();
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    foreach (e_door in a_e_doors) {
        if (isdefined(e_door.c_door)) {
            [[ e_door.c_door ]]->open();
        }
    }
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x0
// Checksum 0x2ac761f8, Offset: 0x7480
// Size: 0x14
function open_all() {
    open();
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x54a69c82, Offset: 0x74a0
// Size: 0xf0
function close(str_value, str_key = "targetname") {
    if (isdefined(self.c_door)) {
        [[ self.c_door ]]->open();
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    foreach (e_door in a_e_doors) {
        if (isdefined(e_door.c_door)) {
            [[ e_door.c_door ]]->close();
        }
    }
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x0
// Checksum 0x644edca8, Offset: 0x7598
// Size: 0x14
function close_all() {
    close();
}

// Namespace doors/doors_shared
// Params 0, eflags: 0x0
// Checksum 0x358200ab, Offset: 0x75b8
// Size: 0x22
function is_open() {
    return self.c_door flag::get("open");
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x0
// Checksum 0x7edc58c7, Offset: 0x75e8
// Size: 0x138
function waittill_door_opened(str_value, str_key = "targetname") {
    if (isdefined(self.c_door)) {
        self.c_door flag::wait_till("open");
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    while (true) {
        var_8c4538df = 1;
        foreach (e_door in a_e_doors) {
            if (!e_door.c_door flag::get("open")) {
                var_8c4538df = 0;
                break;
            }
        }
        if (var_8c4538df) {
            return;
        }
        waitframe(1);
    }
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x0
// Checksum 0xd37e3915, Offset: 0x7728
// Size: 0x182
function waittill_door_closed(str_value, str_key = "targetname") {
    if (isdefined(self.c_door)) {
        self.c_door flag::wait_till_clear("open");
        self.c_door flag::wait_till_clear("animating");
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    while (true) {
        var_a644cd9e = 1;
        foreach (e_door in a_e_doors) {
            if (e_door.c_door flag::get("open") || e_door.c_door flag::get("animating")) {
                var_a644cd9e = 0;
                break;
            }
        }
        if (var_a644cd9e) {
            return;
        }
        waitframe(1);
    }
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc67a9945, Offset: 0x78b8
// Size: 0x11a
function get_doors(str_value, str_key = "targetname") {
    if (isdefined(str_value)) {
        a_e_doors = struct::get_array(str_value, str_key);
        a_e_doors = arraycombine(a_e_doors, getentarray(str_value, str_key), 0, 0);
    } else {
        a_e_doors = struct::get_array("scriptbundle_doors", "classname");
        a_e_doors = arraycombine(a_e_doors, struct::get_array("scriptbundle_obstructions", "classname"), 0, 0);
        a_e_doors = arraycombine(a_e_doors, getentarray("smart_object_door", "script_noteworthy"), 0, 0);
    }
    return a_e_doors;
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x0
// Checksum 0x2afb29d3, Offset: 0x79e0
// Size: 0xe0
function function_3353d645(str_value, str_key = "targetname") {
    if (isdefined(self.c_door)) {
        [[ self.c_door ]]->delete_door();
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    foreach (e_door in a_e_doors) {
        [[ e_door.c_door ]]->delete_door();
    }
}

// Namespace doors/doors_shared
// Params 3, eflags: 0x1 linked
// Checksum 0x2d22eb58, Offset: 0x7ac8
// Size: 0x138
function function_83929c65(b_enable, str_value, str_key = "targetname") {
    if (isclass(self)) {
        self thread function_fcadd390(b_enable);
        return;
    }
    if (isdefined(self.c_door)) {
        self.c_door thread function_fcadd390(b_enable);
        return;
    }
    a_e_doors = get_doors(str_value, str_key);
    foreach (e_door in a_e_doors) {
        if (isdefined(e_door.c_door)) {
            e_door.c_door thread function_fcadd390(b_enable);
        }
    }
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x5 linked
// Checksum 0x30186c61, Offset: 0x7c08
// Size: 0x68
function private function_fcadd390(b_enable) {
    self.m_e_door endon(#"death");
    self notify(#"hash_50b9293fc24e2756");
    self endon(#"hash_50b9293fc24e2756");
    [[ self ]]->close_internal();
    thread [[ self ]]->function_f50c09b3(b_enable);
}

// Namespace doors/doors_shared
// Params 1, eflags: 0x5 linked
// Checksum 0xe64a167d, Offset: 0x7c78
// Size: 0x28
function private function_fa74d5cd(c_door) {
    self waittill(#"death");
    c_door = undefined;
}

// Namespace doors/doors_shared
// Params 2, eflags: 0x0
// Checksum 0xb92cc150, Offset: 0x7ca8
// Size: 0x88
function function_73f09315(str_value, str_key = "targetname") {
    if (isdefined(self.c_door)) {
        return self.c_door.m_e_door;
    }
    a_e_doors = get_doors(str_value, str_key);
    return a_e_doors[0].c_door.m_e_door;
}

