#using scripts\core_common\system_shared;
#using scripts\core_common\struct;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\oob;
#using scripts\core_common\clientfield_shared;
#using script_84f5590d2ac48f8;
#using script_20813718c06b8e14;
#using script_2e18617cd7d0ba32;
#using script_50b169791779fa9d;
#using script_3d94f5281e33ca0;
#using script_4de1878f8140315a;
#using script_43928ec8431e6b96;
#using script_32ee21fd8fc9be00;
#using script_2037b40c1c1d0268;

#namespace ct_utils;

// Namespace ct_utils/ct_utils
// Params 0, eflags: 0x2
// Checksum 0xf3c2bc28, Offset: 0x338
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ct_utils", &__init__, undefined, undefined);
}

// Namespace ct_utils/ct_utils
// Params 0, eflags: 0x0
// Checksum 0xe295791e, Offset: 0x380
// Size: 0x510
function __init__() {
    clientfield::register("toplayer", "vision_pulse", 1, 1, "int", &vision_pulse, 0, 0);
    clientfield::register("toplayer", "screen_blur", 1, 1, "int", &screen_blur, 0, 0);
    clientfield::register("world", "area_arrows_specialist", 1, 3, "int", &area_arrows_specialist, 0, 0);
    clientfield::register("world", "area_arrows", 1, 3, "int", &area_arrows, 0, 0);
    clientfield::register("scriptmover", "postfx_hitzone", 1, 1, "int", &postfx_hitzone, 0, 0);
    clientfield::register("scriptmover", "collisionbox_render", 1, 1, "int", &collisionbox_render, 0, 0);
    clientfield::register("scriptmover", "highlight_sphere", 1, 1, "int", &highlight_sphere, 0, 0);
    clientfield::register("scriptmover", "highlight_sphere_normal", 1, 1, "int", &highlight_sphere_normal, 0, 0);
    clientfield::register("scriptmover", "highlight_ring", 1, 1, "int", &highlight_ring, 0, 0);
    level.ct_progressbar_status = ct_progressbar_status::register("ct_progressbar_status");
    level.ct_shared_desc = ct_shared_desc::register("ct_shared_desc");
    full_screen_movie::register("full_screen_movie");
    level.ct_shared_button_prompt = ct_shared_button_prompt::register("ct_shared_button_prompt");
    level.ct_shared_ingame_hint = ct_shared_ingame_hint::register("ct_shared_ingame_hint");
    level.ct_shared_ingame_objective = ct_shared_ingame_objective::register("ct_shared_ingame_objective");
    level.ct_shared_warning = ct_shared_warning::register("ct_shared_warning");
    level.ct_shared_objcounter = ct_shared_objcounter::register("ct_shared_objcounter");
    level._effect[#"zoneedgemarker"] = [];
    level._effect[#"zoneedgemarker"][0] = #"hash_1f447aeb1973f7b6";
    level._effect[#"zoneedgemarker"][1] = #"hash_5c2ae9f4f331d4b9";
    level._effect[#"zoneedgemarker"][2] = #"hash_7d1b0f001ea88b82";
    level._effect[#"zoneedgemarker"][3] = #"hash_7981eb245ea536fc";
    level.var_57b466e9 = level._effect[#"zoneedgemarker"][0];
    level.var_84c5e66d = "area_";
    level.a_ct_timer_mod_ticks = [];
    for (i = 0; i < 3; i++) {
        var_8299f344 = "ct_timer_mod_ticks" + i;
        level.a_ct_timer_mod_ticks[i] = ct_timer_mod_ticks::register(var_8299f344);
    }
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0xae005d64, Offset: 0x898
// Size: 0x184
function vision_pulse(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval) {
        self postfx::playpostfxbundle(#"hash_3b4e3282e8a33852");
        self function_116b95e5(#"hash_3b4e3282e8a33852", #"hash_222b3bb254b3295c", 0.4);
        self function_116b95e5(#"hash_3b4e3282e8a33852", #"hash_2efccfad2b32081a", 2500);
        self function_116b95e5(#"hash_3b4e3282e8a33852", #"hash_33856c0e283a93e2", 8);
        self function_116b95e5(#"hash_3b4e3282e8a33852", #"pulse width", 200);
        return;
    }
    self postfx::stoppostfxbundle(#"hash_3b4e3282e8a33852");
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0x7ad1e5d7, Offset: 0xa28
// Size: 0xc4
function screen_blur(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    self endon(#"death");
    if (newval > 0) {
        self postfx::playpostfxbundle(#"pstfx_gaussian_blur");
        return;
    }
    self postfx::stoppostfxbundle(#"pstfx_gaussian_blur");
    self postfx::stoppostfxbundle(#"pstfx_gaussian_blur");
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0x8f15b9ea, Offset: 0xaf8
// Size: 0x322
function area_arrows_specialist(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    switch (newval) {
    case 1:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][1];
        level.var_84c5e66d = "nomad_area_4";
        level.var_8c3d6a40 = 1;
        break;
    case 2:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][1];
        level.var_84c5e66d = "crash_area_";
        break;
    case 3:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][2];
        level.var_84c5e66d = "seraph_area_";
        break;
    case 4:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][1];
        level.var_84c5e66d = "firebreak_tut_finale_arrow";
        level.var_8c3d6a40 = 1;
        break;
    case 5:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][2];
        level.var_84c5e66d = "ajax_enemy_arrows";
        level.var_8c3d6a40 = 1;
        break;
    case 6:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][1];
        level.var_84c5e66d = "torque_tut_finale_arrow";
        level.var_8c3d6a40 = 1;
        break;
    case 7:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][1];
        level.var_84c5e66d = "hardpoint_chevrons";
        level.var_8c3d6a40 = 1;
        break;
    default:
        level.var_57b466e9 = level._effect[#"zoneedgemarker"][0];
        level.var_84c5e66d = "area_";
        break;
    }
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0xfd9f5ee7, Offset: 0xe28
// Size: 0x28e
function area_arrows(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    function_59ace802(localclientnum);
    if (newval) {
        var_b29c151c = level.var_84c5e66d;
        if (!(isdefined(level.var_8c3d6a40) && level.var_8c3d6a40)) {
            var_b29c151c += newval;
        } else if (newval == 4) {
            level.var_57b466e9 = level._effect[#"zoneedgemarker"][3];
        } else if (newval == 3) {
            level.var_57b466e9 = level._effect[#"zoneedgemarker"][2];
        } else if (newval == 2) {
            level.var_57b466e9 = level._effect[#"zoneedgemarker"][1];
        } else {
            level.var_57b466e9 = level._effect[#"zoneedgemarker"][0];
        }
        level.var_6158c164 = [];
        level.var_c39096f2 = struct::get_array(var_b29c151c, "targetname");
        if (level.var_c39096f2.size > 0) {
            foreach (s_arrow in level.var_c39096f2) {
                forward = anglestoforward(s_arrow.angles);
                fxhandle = playfx(localclientnum, level.var_57b466e9, s_arrow.origin, forward);
                level.var_6158c164[level.var_6158c164.size] = fxhandle;
            }
        }
    }
}

// Namespace ct_utils/ct_utils
// Params 1, eflags: 0x0
// Checksum 0x72b3556f, Offset: 0x10c0
// Size: 0xba
function function_59ace802(localclientnum) {
    if (isdefined(level.var_6158c164)) {
        if (level.var_6158c164.size > 0) {
            foreach (var_25a339e5 in level.var_6158c164) {
                stopfx(localclientnum, var_25a339e5);
            }
        }
        return;
    }
    level.var_6158c164 = [];
}

// Namespace ct_utils/ct_utils
// Params 1, eflags: 0x0
// Checksum 0xbe28a423, Offset: 0x1188
// Size: 0xe6
function function_3827fca4(localclientnum) {
    player0 = getlocalplayers()[0];
    time = 0;
    while (true) {
        time += 0.0166667;
        val = distance(player0.origin, self.origin);
        val /= 500;
        if (val > 1) {
            val = 1;
        }
        self mapshaderconstant(localclientnum, 0, "scriptVector4", 1 - val, 0, 0, 0);
        waitframe(1);
    }
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0x806b97ea, Offset: 0x1278
// Size: 0x11c
function collisionbox_render(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval == oldval) {
        return;
    }
    if (newval) {
        self playrenderoverridebundle(#"hash_46b7dcb7342c64a2");
        self mapshaderconstant(localclientnum, 0, "scriptVector3", 1.5, 1, 1, 0.2);
        self mapshaderconstant(localclientnum, 0, "scriptVector4", 0.6, 0, 0, 0);
        self thread function_3827fca4(localclientnum);
        return;
    }
    self stoprenderoverridebundle(#"hash_46b7dcb7342c64a2");
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0x9bb82d17, Offset: 0x13a0
// Size: 0x254
function highlight_sphere(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    n_radius = self.angles[0];
    n_speed = self.angles[1];
    var_ada6226c = self.angles[2];
    if (newval) {
        while (!isdefined(level.var_e8dfdfe5)) {
            waitframe(1);
        }
        e_player thread postfx::playpostfxbundle(#"postfx_hitzone");
        e_player function_116b95e5(#"postfx_hitzone", #"hash_5c3f421a5caa272e", self.origin[0], self.origin[1], self.origin[2]);
        e_player function_116b95e5(#"postfx_hitzone", #"hash_62391b4192aefdd1", n_radius);
        e_player function_116b95e5(#"postfx_hitzone", #"speed", n_speed);
        e_player function_116b95e5(#"postfx_hitzone", #"repeat", var_ada6226c);
        e_player function_116b95e5(#"postfx_hitzone", #"normal", level.var_e8dfdfe5[0], level.var_e8dfdfe5[1], level.var_e8dfdfe5[2]);
        level.var_e8dfdfe5 = undefined;
        return;
    }
    e_player postfx::stoppostfxbundle(#"postfx_hitzone");
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0x9dabe80c, Offset: 0x1600
// Size: 0x66
function highlight_sphere_normal(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval) {
        level.var_e8dfdfe5 = self.origin;
        return;
    }
    level.var_e8dfdfe5 = undefined;
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0xaa2f8ceb, Offset: 0x1670
// Size: 0x116
function highlight_ring(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    e_player endon(#"death");
    if (isdefined(self.var_3caa4293)) {
        stopfx(localclientnum, self.var_3caa4293);
        self.var_3caa4293 = undefined;
    }
    if (newval) {
        self.var_3caa4293 = playfx(localclientnum, #"ui/fx8_ui_ct_marker_team_b90", self.origin, self.angles);
        setfxteam(localclientnum, self.var_3caa4293, #"allies");
        level.var_e304c4aa = undefined;
    }
}

// Namespace ct_utils/ct_utils
// Params 7, eflags: 0x0
// Checksum 0xb17bad61, Offset: 0x1790
// Size: 0x144
function postfx_hitzone(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    e_player = function_5c10bd79(localclientnum);
    if (newval > 0) {
        e_player thread postfx::playpostfxbundle(#"postfx_hitzone");
        e_player function_116b95e5(#"postfx_hitzone", #"hash_5c3f421a5caa272e", self.origin[0], self.origin[1], self.origin[2]);
        e_player function_116b95e5(#"postfx_hitzone", #"hash_62391b4192aefdd1", 64);
        return;
    }
    e_player postfx::stoppostfxbundle(#"postfx_hitzone");
}

