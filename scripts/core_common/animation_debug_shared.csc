#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\animation_shared.csc;

#namespace animation;

/#

    // Namespace animation/animation_debug_shared
    // Params 0, eflags: 0x2
    // Checksum 0x5183a476, Offset: 0x78
    // Size: 0x2c6
    function autoexec function_c3c9d0e5() {
        setdvar(#"anim_debug", 0);
        setdvar(#"anim_debug_pause", 0);
        while (true) {
            b_anim_debug = getdvarint(#"anim_debug", 0) || getdvarint(#"anim_debug_pause", 0);
            if (b_anim_debug && !level flagsys::get("<dev string:x38>")) {
                level flagsys::set("<dev string:x38>");
                a_players = getlocalplayers();
                foreach (player in a_players) {
                    var_16f8cca9 = player getlocalclientnumber();
                    a_ents = getentarray(var_16f8cca9, "<dev string:x45>", "<dev string:x4e>");
                    foreach (ent in a_ents) {
                        ent thread anim_info_render_thread(ent.var_6c4bb19.animation, ent.var_6c4bb19.v_origin_or_ent, ent.var_6c4bb19.v_angles_or_tag);
                    }
                }
            } else if (!b_anim_debug && level flagsys::get("<dev string:x38>")) {
                level notify(#"kill_anim_debug");
                level flagsys::clear("<dev string:x38>");
            }
            waitframe(1);
        }
    }

    // Namespace animation/animation_debug_shared
    // Params 3, eflags: 0x0
    // Checksum 0xbc31e13, Offset: 0x348
    // Size: 0x526
    function anim_info_render_thread(animation, v_origin_or_ent, v_angles_or_tag) {
        self notify(#"_anim_info_render_thread_");
        self endon(#"_anim_info_render_thread_", #"death", #"scriptedanim");
        level endon(#"kill_anim_debug");
        while (true) {
            level flagsys::wait_till("<dev string:x38>");
            _init_frame();
            str_extra_info = "<dev string:x67>";
            color = (0, 1, 1);
            if (flagsys::get(#"firstframe")) {
                str_extra_info += "<dev string:x6a>";
            }
            var_958054e5 = getanimlength(animation);
            var_f667af2f = self getanimtime(animation) * var_958054e5;
            str_extra_info += "<dev string:x7a>" + var_f667af2f + "<dev string:x88>" + var_958054e5 + "<dev string:x8c>";
            s_pos = _get_align_pos(v_origin_or_ent, v_angles_or_tag);
            self anim_origin_render(s_pos.origin, s_pos.angles);
            line(self.origin, s_pos.origin, color, 0.5, 1);
            sphere(s_pos.origin, 2, (0.3, 0.3, 0.3), 0.5, 1);
            if (!isvec(v_origin_or_ent) && v_origin_or_ent != self && v_origin_or_ent != level) {
                str_name = "<dev string:x97>";
                if (isdefined(v_origin_or_ent.animname)) {
                    str_name = v_origin_or_ent.animname;
                } else if (isdefined(v_origin_or_ent.targetname)) {
                    str_name = v_origin_or_ent.targetname;
                }
                print3d(v_origin_or_ent.origin + (0, 0, 5), str_name, (0.3, 0.3, 0.3), 1, 0.15);
            }
            self anim_origin_render(self.origin, self.angles);
            str_name = "<dev string:x97>";
            if (isdefined(self.anim_debug_name)) {
                str_name = self.anim_debug_name;
            } else if (isdefined(self.animname)) {
                str_name = self.animname;
            } else if (isdefined(self.targetname)) {
                str_name = self.targetname;
            }
            print3d(self.origin, self getentnum() + get_ent_type() + "<dev string:xa1>" + str_name, color, 0.8, 0.3);
            print3d(self.origin - (0, 0, 5), "<dev string:xaa>" + function_9e72a96(animation), color, 0.8, 0.3);
            print3d(self.origin - (0, 0, 7), str_extra_info, color, 0.8, 0.15);
            render_tag("<dev string:xc0>", "<dev string:xd3>");
            render_tag("<dev string:xdb>", "<dev string:xed>");
            render_tag("<dev string:xf4>", "<dev string:x101>");
            render_tag("<dev string:x10a>", "<dev string:x117>");
            _reset_frame();
            waitframe(1);
        }
    }

    // Namespace animation/animation_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x9a87f946, Offset: 0x878
    // Size: 0x72
    function get_ent_type() {
        return "<dev string:x120>" + (isdefined(isdefined(self.classname) ? self.classname : self.type) ? "<dev string:x67>" + (isdefined(self.classname) ? self.classname : self.type) : "<dev string:x67>") + "<dev string:x124>";
    }

    // Namespace animation/animation_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x8d2c6ac7, Offset: 0x8f8
    // Size: 0x8
    function _init_frame() {
        
    }

    // Namespace animation/animation_debug_shared
    // Params 0, eflags: 0x0
    // Checksum 0x261ca61d, Offset: 0x908
    // Size: 0x12
    function _reset_frame() {
        self.v_centroid = undefined;
    }

    // Namespace animation/animation_debug_shared
    // Params 2, eflags: 0x0
    // Checksum 0x89257fa2, Offset: 0x928
    // Size: 0xcc
    function render_tag(str_tag, str_label) {
        if (!isdefined(str_label)) {
            str_label = str_tag;
        }
        v_tag_org = self gettagorigin(str_tag);
        if (isdefined(v_tag_org)) {
            v_tag_ang = self gettagangles(str_tag);
            anim_origin_render(v_tag_org, v_tag_ang, 2, str_label);
            if (isdefined(self.v_centroid)) {
                line(self.v_centroid, v_tag_org, (0.3, 0.3, 0.3), 0.5, 1);
            }
        }
    }

    // Namespace animation/animation_debug_shared
    // Params 4, eflags: 0x0
    // Checksum 0x77d3e336, Offset: 0xa00
    // Size: 0x174
    function anim_origin_render(org, angles, line_length, str_label) {
        if (!isdefined(line_length)) {
            line_length = 6;
        }
        if (isdefined(org) && isdefined(angles)) {
            originendpoint = org + vectorscale(anglestoforward(angles), line_length);
            originrightpoint = org + vectorscale(anglestoright(angles), -1 * line_length);
            originuppoint = org + vectorscale(anglestoup(angles), line_length);
            line(org, originendpoint, (1, 0, 0));
            line(org, originrightpoint, (0, 1, 0));
            line(org, originuppoint, (0, 0, 1));
            if (isdefined(str_label)) {
                print3d(org, str_label, (1, 0.752941, 0.796078), 1, 0.05);
            }
        }
    }

#/
