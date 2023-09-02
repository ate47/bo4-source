// Atian COD Tools GSC decompiler test
#using script_1da833573eb80e61;
#using script_2feaeed9ab01d6f7;
#using scripts\core_common\multi_extracam.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\struct.csc;

#namespace lui;

// Namespace lui
// Method(s) 12 Total 12
class cluielem {

    // Namespace cluielem/lui_shared
    // Params 0, eflags: 0x9 linked
    // Checksum 0x80f724d1, Offset: 0x2640
    // Size: 0x4
    __constructor() {
        
    }

    // Namespace cluielem/lui_shared
    // Params 0, eflags: 0x91 linked class_linked
    // Checksum 0x80f724d1, Offset: 0x2a28
    // Size: 0x4
    __destructor() {
        
    }

    // Namespace cluielem/lui_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0xbbfcd106, Offset: 0x29c0
    // Size: 0x5a
    function get_data(localclientnum, field) {
        /#
            assert(self.var_47d8642e, "<unknown string>");
        #/
        return function_88759655(localclientnum, self.var_47e79fc, field);
    }

    // Namespace cluielem/lui_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xdfd2cdb7, Offset: 0x2950
    // Size: 0x64
    function set_data(localclientnum, field, value) {
        /#
            assert(self.var_47d8642e, "<unknown string>");
        #/
        function_bcc2134a(localclientnum, self.var_47e79fc, field, value);
    }

    // Namespace cluielem/lui_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x34de8d6, Offset: 0x28f0
    // Size: 0x54
    function close(localclientnum) {
        /#
            assert(self.var_47d8642e, "<unknown string>");
        #/
        closeluielem(localclientnum, self.var_47e79fc);
    }

    // Namespace cluielem/lui_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0x885ea434, Offset: 0x2890
    // Size: 0x52
    function is_open(localclientnum) {
        /#
            assert(self.var_47d8642e, "<unknown string>");
        #/
        return isluielemopen(localclientnum, self.var_47e79fc);
    }

    // Namespace cluielem/lui_shared
    // Params 2, eflags: 0x1 linked
    // Checksum 0x237b563f, Offset: 0x2818
    // Size: 0x6c
    function open(localclientnum, menu_name) {
        /#
            assert(self.var_47d8642e, "<unknown string>");
        #/
        openluielem(localclientnum, menu_name, self.var_47e79fc);
        [[ self ]]->function_fa582112(localclientnum);
    }

    // Namespace cluielem/lui_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xbecc2060, Offset: 0x27d8
    // Size: 0x34
    function function_fa582112(localclientnum) {
        /#
            assert(self.var_47d8642e, "<unknown string>");
        #/
    }

    // Namespace cluielem/lui_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xdb389259, Offset: 0x27a8
    // Size: 0x26
    function register_clientside(uid) {
        self.var_47e79fc = uid;
        self.var_47d8642e = 1;
    }

    // Namespace cluielem/lui_shared
    // Params 3, eflags: 0x1 linked
    // Checksum 0xcdf44b94, Offset: 0x2710
    // Size: 0x8c
    function function_dcb34c80(var_2a0de052, field_name, version) {
        /#
            assert(!self.var_47d8642e, "<unknown string>");
        #/
        clientfield::register_bgcache("clientuimodel", var_2a0de052, "luielement." + self.var_47e79fc + "." + field_name, version, undefined, 0, 0);
    }

    // Namespace cluielem/lui_shared
    // Params 5, eflags: 0x1 linked
    // Checksum 0x6df9dd22, Offset: 0x2680
    // Size: 0x84
    function add_clientfield(field_name, version, bits, type, callback) {
        /#
            assert(!self.var_47d8642e, "<unknown string>");
        #/
        clientfield::register_luielem(self.var_47e79fc, field_name, version, bits, type, callback, 0, 0);
    }

    // Namespace cluielem/lui_shared
    // Params 1, eflags: 0x1 linked
    // Checksum 0xf4a31fea, Offset: 0x2650
    // Size: 0x26
    function setup_clientfields(uid) {
        self.var_47e79fc = uid;
        self.var_47d8642e = 0;
    }

}

// Namespace lui/lui_shared
// Params 0, eflags: 0x2
// Checksum 0x38946c01, Offset: 0x1c8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"lui_shared", &__init__, undefined, undefined);
}

// Namespace lui/lui_shared
// Params 0, eflags: 0x1 linked
// Checksum 0x46a44f90, Offset: 0x210
// Size: 0x8c
function __init__() {
    level.client_menus = associativearray();
    level.var_a14cc36b = associativearray();
    callback::on_localclient_connect(&on_player_connect);
    full_screen_black::register("full_screen_black");
    initial_black::register("initial_black");
}

// Namespace lui/lui_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x61a2d184, Offset: 0x2a8
// Size: 0x24
function on_player_connect(localclientnum) {
    level thread client_menus(localclientnum);
}

// Namespace lui/lui_shared
// Params 1, eflags: 0x1 linked
// Checksum 0x5e7ac0c8, Offset: 0x2d8
// Size: 0x56
function initmenudata(localclientnum) {
    /#
        assert(!isdefined(level.client_menus[localclientnum]));
    #/
    level.client_menus[localclientnum] = associativearray();
}

// Namespace lui/lui_shared
// Params 7, eflags: 0x0
// Checksum 0x53a7793d, Offset: 0x338
// Size: 0x186
function createextracamxcamdata(menu_name, localclientnum, extracam_index, target_name, xcam, sub_xcam, xcam_frame) {
    /#
        assert(isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    menu_data = level.client_menus[localclientnum][menu_name];
    extracam_data = {#xcam_frame:xcam_frame, #sub_xcam:sub_xcam, #xcam:xcam, #target_name:target_name, #extracam_index:extracam_index, #menu_name:menu_name};
    if (!isdefined(menu_data.extra_cams)) {
        menu_data.extra_cams = [];
    } else if (!isarray(menu_data.extra_cams)) {
        menu_data.extra_cams = array(menu_data.extra_cams);
    }
    menu_data.extra_cams[menu_data.extra_cams.size] = extracam_data;
}

// Namespace lui/lui_shared
// Params 4, eflags: 0x0
// Checksum 0xa9dcf3f0, Offset: 0x4c8
// Size: 0x12e
function createcustomextracamxcamdata(menu_name, localclientnum, extracam_index, camera_function) {
    /#
        assert(isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    menu_data = level.client_menus[localclientnum][menu_name];
    extracam_data = {#camera_function:camera_function, #extracam_index:extracam_index};
    if (!isdefined(menu_data.extra_cams)) {
        menu_data.extra_cams = [];
    } else if (!isarray(menu_data.extra_cams)) {
        menu_data.extra_cams = array(menu_data.extra_cams);
    }
    menu_data.extra_cams[menu_data.extra_cams.size] = extracam_data;
}

// Namespace lui/lui_shared
// Params 3, eflags: 0x0
// Checksum 0x9df80cbd, Offset: 0x600
// Size: 0x1f6
function addmenuexploders(menu_name, localclientnum, exploder) {
    /#
        assert(isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    menu_data = level.client_menus[localclientnum][menu_name];
    if (isarray(exploder)) {
        foreach (expl in exploder) {
            if (!isdefined(menu_data.exploders)) {
                menu_data.exploders = [];
            } else if (!isarray(menu_data.exploders)) {
                menu_data.exploders = array(menu_data.exploders);
            }
            menu_data.exploders[menu_data.exploders.size] = expl;
        }
    } else {
        if (!isdefined(menu_data.exploders)) {
            menu_data.exploders = [];
        } else if (!isarray(menu_data.exploders)) {
            menu_data.exploders = array(menu_data.exploders);
        }
        menu_data.exploders[menu_data.exploders.size] = exploder;
    }
}

// Namespace lui/lui_shared
// Params 4, eflags: 0x1 linked
// Checksum 0xc9f77dc1, Offset: 0x800
// Size: 0x176
function linktocustomcharacter(menu_name, localclientnum, target_name, alt_render_mode = 1) {
    /#
        assert(isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    menu_data = level.client_menus[localclientnum][menu_name];
    /#
        assert(!isdefined(menu_data.custom_character));
    #/
    model = getent(localclientnum, target_name, "targetname");
    if (!isdefined(model)) {
        model = util::spawn_model(localclientnum, "tag_origin");
        model.targetname = target_name;
    }
    model useanimtree("all_player");
    menu_data.custom_character = character_customization::function_dd295310(model, localclientnum, alt_render_mode);
    model hide();
    return menu_data.custom_character;
}

// Namespace lui/lui_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x56898a71, Offset: 0x980
// Size: 0x52
function getcharacterdataformenu(menu_name, localclientnum) {
    if (isdefined(level.client_menus[localclientnum][menu_name])) {
        return level.client_menus[localclientnum][menu_name].custom_character;
    }
    return undefined;
}

// Namespace lui/lui_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xb0d18591, Offset: 0x9e0
// Size: 0x5a
function function_e41243c1(var_e953aca6) {
    if (!isdefined(var_e953aca6)) {
        return array();
    } else if (isarray(var_e953aca6)) {
        return var_e953aca6;
    }
    return array(var_e953aca6);
}

// Namespace lui/lui_shared
// Params a, eflags: 0x1 linked
// Checksum 0xef99f1a0, Offset: 0xa48
// Size: 0x1c2
function createcameramenu(menu_name, localclientnum, target_name, xcam, sub_xcam, xcam_frame = undefined, var_1f199068 = undefined, var_2c679be0 = undefined, lerp_time = 0, lut_index = 0) {
    /#
        assert(!isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    level.client_menus[localclientnum][menu_name] = {#var_e57ed98b:[], #lut_index:lut_index, #lerp_time:lerp_time, #var_2c679be0:function_e41243c1(var_2c679be0), #var_1f199068:function_e41243c1(var_1f199068), #xcam_frame:xcam_frame, #sub_xcam:sub_xcam, #xcam:xcam, #target_name:target_name, #menu_name:menu_name};
    return level.client_menus[localclientnum][menu_name];
}

// Namespace lui/lui_shared
// Params 9, eflags: 0x1 linked
// Checksum 0xfa915d3f, Offset: 0xc18
// Size: 0x132
function function_9d7ab167(menu_name, localclientnum, session_mode, target_name, xcam, sub_xcam, xcam_frame = undefined, lerp_time = 0, lut_index = 0) {
    /#
        assert(isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    level.client_menus[localclientnum][menu_name].var_e57ed98b[session_mode] = {#lut_index:lut_index, #lerp_time:lerp_time, #xcam_frame:xcam_frame, #sub_xcam:sub_xcam, #xcam:xcam, #target_name:target_name};
}

// Namespace lui/lui_shared
// Params 7, eflags: 0x1 linked
// Checksum 0x19e8a101, Offset: 0xd58
// Size: 0x15a
function createcustomcameramenu(menu_name, localclientnum, camera_function, has_state, var_1f199068 = undefined, var_2c679be0 = undefined, lut_index = 0) {
    /#
        assert(!isdefined(level.client_menus[localclientnum][menu_name]));
    #/
    level.client_menus[localclientnum][menu_name] = {#lut_index:lut_index, #var_2c679be0:function_e41243c1(var_2c679be0), #var_1f199068:function_e41243c1(var_1f199068), #has_state:has_state, #camera_function:camera_function, #menu_name:menu_name};
    return level.client_menus[localclientnum][menu_name];
}

// Namespace lui/lui_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xdae62470, Offset: 0xec0
// Size: 0x7d8
function setup_menu(localclientnum, menu_data, previous_menu) {
    if (isdefined(menu_data)) {
        new_menu = level.client_menus[localclientnum][menu_data.menu_name];
    }
    if (isdefined(previous_menu) && isdefined(level.client_menus[localclientnum][previous_menu.menu_name])) {
        previous_menu_info = level.client_menus[localclientnum][previous_menu.menu_name];
        if (isdefined(previous_menu_info.var_2c679be0)) {
            foreach (fn in previous_menu_info.var_2c679be0) {
                level thread [[ fn ]](localclientnum, previous_menu_info);
            }
        }
        if (isdefined(previous_menu_info.extra_cams)) {
            foreach (extracam_data in previous_menu_info.extra_cams) {
                multi_extracam::extracam_reset_index(localclientnum, extracam_data.extracam_index);
            }
        }
        level notify(previous_menu.menu_name + "_closed");
        if (isdefined(previous_menu_info.camera_function)) {
            stopmaincamxcam(localclientnum);
        } else if (isdefined(previous_menu_info.xcam)) {
            stopmaincamxcam(localclientnum);
        }
        if (isdefined(previous_menu_info.custom_character) && (!isdefined(new_menu) || previous_menu_info.custom_character !== new_menu.custom_character)) {
            [[ previous_menu_info.custom_character ]]->hide_model();
            [[ previous_menu_info.custom_character ]]->function_39a68bf2();
        }
        if (isdefined(previous_menu_info.exploders)) {
            foreach (exploder in previous_menu_info.exploders) {
                killradiantexploder(localclientnum, exploder);
            }
        }
    }
    if (isdefined(new_menu)) {
        if (isdefined(new_menu.custom_character)) {
            [[ new_menu.custom_character ]]->show_model();
        }
        if (isdefined(new_menu.exploders)) {
            foreach (exploder in new_menu.exploders) {
                playradiantexploder(localclientnum, exploder);
            }
        }
        if (isdefined(new_menu.lut_index)) {
            setdvar(#"vc_lut", new_menu.lut_index);
        }
        if (isdefined(new_menu.camera_function)) {
            if (new_menu.has_state === 1) {
                level thread [[ new_menu.camera_function ]](localclientnum, menu_data.menu_name, menu_data.state);
            } else {
                level thread [[ new_menu.camera_function ]](localclientnum, menu_data.menu_name);
            }
        } else if (isdefined(new_menu.xcam)) {
            camera_data = isdefined(new_menu.var_e57ed98b[currentsessionmode()]) ? new_menu.var_e57ed98b[currentsessionmode()] : new_menu;
            camera_ent = struct::get(camera_data.target_name);
            if (isdefined(camera_ent)) {
                playmaincamxcam(localclientnum, camera_data.xcam, camera_data.lerp_time, camera_data.sub_xcam, "", camera_ent.origin, camera_ent.angles);
            }
        }
        if (isdefined(new_menu.var_1f199068)) {
            if (isdefined(menu_data.charactermode) && isdefined(new_menu.custom_character)) {
                [[ new_menu.custom_character ]]->set_character_mode(menu_data.charactermode);
            }
            foreach (fn in new_menu.var_1f199068) {
                level thread [[ fn ]](localclientnum, new_menu);
            }
        }
        if (isdefined(new_menu.extra_cams)) {
            foreach (extracam_data in new_menu.extra_cams) {
                if (isdefined(extracam_data.camera_function)) {
                    if (new_menu.has_state === 1) {
                        level thread [[ extracam_data.camera_function ]](localclientnum, menu_data.menu_name, extracam_data, menu_data.state);
                    } else {
                        level thread [[ extracam_data.camera_function ]](localclientnum, menu_data.menu_name, extracam_data);
                    }
                } else {
                    camera_ent = multi_extracam::extracam_init_index(localclientnum, extracam_data.target_name, extracam_data.extracam_index);
                    if (isdefined(camera_ent)) {
                        if (isdefined(extracam_data.xcam_frame)) {
                            camera_ent playextracamxcam(extracam_data.xcam, 0, extracam_data.sub_xcam, extracam_data.xcam_frame);
                        } else {
                            camera_ent playextracamxcam(extracam_data.xcam, 0, extracam_data.sub_xcam);
                        }
                    }
                }
            }
        }
    }
}

// Namespace lui/lui_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xeb446262, Offset: 0x16a0
// Size: 0x174
function function_afb6dd92(localclientnum, menu_data) {
    if (isdefined(menu_data)) {
        new_menu = level.client_menus[localclientnum][menu_data.menu_name];
    }
    if (isdefined(new_menu)) {
        if (isdefined(new_menu.camera_function) && new_menu.has_state === 1) {
            level thread [[ new_menu.camera_function ]](localclientnum, menu_data.menu_name, menu_data.state);
        }
        if (isdefined(new_menu.extra_cams)) {
            foreach (extracam_data in new_menu.extra_cams) {
                if (isdefined(extracam_data.camera_function) && new_menu.has_state === 1) {
                    level thread [[ extracam_data.camera_function ]](localclientnum, menu_data.menu_name, extracam_data, menu_data.state);
                }
            }
        }
    }
}

// Namespace lui/lui_shared
// Params 1, eflags: 0x1 linked
// Checksum 0xdd8acb09, Offset: 0x1820
// Size: 0x450
function client_menus(localclientnum) {
    level endon(#"disconnect");
    level.var_a14cc36b[localclientnum] = array();
    clientmenustack = level.var_a14cc36b[localclientnum];
    while (1) {
        waitresult = undefined;
        waitresult = level waittill("menu_change" + localclientnum);
        menu_name = waitresult.menu;
        status = waitresult.status;
        state = waitresult.state;
        menu_index = undefined;
        for (i = 0; i < clientmenustack.size; i++) {
            if (clientmenustack[i].menu_name == menu_name) {
                menu_index = i;
                break;
            }
        }
        if (status === "closeToMenu" && isdefined(menu_index)) {
            topmenu = undefined;
            for (i = 0; i < menu_index; i++) {
                popped = array::pop(clientmenustack, 0, 0);
                if (!isdefined(topmenu)) {
                    topmenu = popped;
                }
            }
            setup_menu(localclientnum, clientmenustack[0], topmenu);
            continue;
        }
        statechange = isdefined(menu_index) && status !== "closed" && clientmenustack[menu_index].state !== state && !(!isdefined(clientmenustack[menu_index].state) && !isdefined(state));
        updateonly = statechange && menu_index !== 0;
        if (updateonly) {
            clientmenustack[i].state = state;
        } else if (status === "closed" && isdefined(menu_index)) {
            /#
                /#
                    assert(menu_index == 0);
                #/
            #/
            if (menu_index == 0) {
                popped = array::pop(clientmenustack, 0, 0);
                setup_menu(localclientnum, clientmenustack[0], popped);
            }
        } else if (status === "opened" && !isdefined(menu_index)) {
            menu_data = spawnstruct();
            menu_data.menu_name = menu_name;
            menu_data.state = state;
            if (isdefined(waitresult.mode)) {
                menu_data.charactermode = waitresult.mode;
            }
            lastmenu = clientmenustack.size < 0 ? clientmenustack[0] : undefined;
            setup_menu(localclientnum, menu_data, lastmenu);
            array::push_front(clientmenustack, menu_data);
        } else if (isdefined(menu_index) && statechange) {
            /#
                assert(menu_index == 0);
            #/
            clientmenustack[0].state = state;
            function_afb6dd92(localclientnum, clientmenustack[0]);
        }
    }
}

// Namespace lui/lui_shared
// Params 3, eflags: 0x1 linked
// Checksum 0xf487d22b, Offset: 0x1c78
// Size: 0xb4
function is_current_menu(localclientnum, menu_name, state = undefined) {
    if (!isdefined(level.var_a14cc36b[localclientnum]) || level.var_a14cc36b[localclientnum].size == 0) {
        return 0;
    }
    return level.var_a14cc36b[localclientnum][0].menu_name === menu_name && (!isdefined(state) || level.var_a14cc36b[localclientnum][0].state === state);
}

// Namespace lui/lui_shared
// Params 5, eflags: 0x1 linked
// Checksum 0xd098dc2d, Offset: 0x1d38
// Size: 0x134
function screen_fade(n_time, n_target_alpha = 1, n_start_alpha = 0, str_color = "black", b_force_close_menu = 0) {
    if (self == level) {
        foreach (player in level.players) {
            player thread _screen_fade(n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu);
        }
    } else {
        self thread _screen_fade(n_time, n_target_alpha, n_start_alpha, str_color, b_force_close_menu);
    }
}

// Namespace lui/lui_shared
// Params 2, eflags: 0x1 linked
// Checksum 0xc79af91d, Offset: 0x1e78
// Size: 0x3a
function screen_fade_out(n_time, str_color) {
    screen_fade(n_time, 1, 0, str_color, 0);
    wait(n_time);
}

// Namespace lui/lui_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x78285d5a, Offset: 0x1ec0
// Size: 0x42
function screen_fade_in(n_time, str_color) {
    screen_fade(n_time, 0, 1, str_color, 1);
    wait(n_time);
}

// Namespace lui/lui_shared
// Params 0, eflags: 0x0
// Checksum 0x63a734a5, Offset: 0x1f10
// Size: 0xa4
function screen_close_menu() {
    if (self == level) {
        foreach (player in level.players) {
            player thread _screen_close_menu();
        }
    } else {
        self thread _screen_close_menu();
    }
}

// Namespace lui/lui_shared
// Params 0, eflags: 0x5 linked
// Checksum 0xf49b81d1, Offset: 0x1fc0
// Size: 0xfc
function private _screen_close_menu() {
    self notify(#"_screen_fade");
    self endon(#"_screen_fade");
    self endon(#"disconnect");
    if (isdefined(self.screen_fade_menus)) {
        str_menu = "FullScreenBlack";
        if (isdefined(self.screen_fade_menus[str_menu])) {
            closeluimenu(self.localclientnum, self.screen_fade_menus[str_menu].lui_menu);
            self.screen_fade_menus[str_menu] = undefined;
        }
        str_menu = "FullScreenWhite";
        if (isdefined(self.screen_fade_menus[str_menu])) {
            closeluimenu(self.localclientnum, self.screen_fade_menus[str_menu].lui_menu);
            self.screen_fade_menus[str_menu] = undefined;
        }
    }
}

// Namespace lui/lui_shared
// Params 5, eflags: 0x5 linked
// Checksum 0xdfede2e4, Offset: 0x20c8
// Size: 0x3dc
function private _screen_fade(n_time, n_target_alpha, n_start_alpha, v_color, b_force_close_menu) {
    self notify(#"_screen_fade");
    self endon(#"_screen_fade");
    self endon(#"disconnect");
    self endon(#"death");
    if (!isdefined(self.screen_fade_menus)) {
        self.screen_fade_menus = [];
    }
    if (!isdefined(v_color)) {
        v_color = (0, 0, 0);
    }
    n_time_ms = int(int(n_time * 1000));
    str_menu = "FullScreenBlack";
    if (isstring(v_color)) {
        switch (v_color) {
        case #"black":
            v_color = (0, 0, 0);
            break;
        case #"white":
            v_color = (1, 1, 1);
            break;
        default:
            /#
                assertmsg("<unknown string>");
            #/
            break;
        }
    }
    lui_menu = "";
    if (isdefined(self.screen_fade_menus[str_menu])) {
        s_menu = self.screen_fade_menus[str_menu];
        lui_menu = s_menu.lui_menu;
        closeluimenu(self.localclientnum, lui_menu);
        n_start_alpha = lerpfloat(s_menu.n_start_alpha, s_menu.n_target_alpha, gettime() - s_menu.n_start_time);
    }
    lui_menu = createluimenu(self.localclientnum, str_menu);
    self.screen_fade_menus[str_menu] = spawnstruct();
    self.screen_fade_menus[str_menu].lui_menu = lui_menu;
    self.screen_fade_menus[str_menu].n_start_alpha = n_start_alpha;
    self.screen_fade_menus[str_menu].n_target_alpha = n_target_alpha;
    self.screen_fade_menus[str_menu].n_target_time = n_time_ms;
    self.screen_fade_menus[str_menu].n_start_time = gettime();
    self set_color(lui_menu, v_color);
    setluimenudata(self.localclientnum, lui_menu, "startAlpha", n_start_alpha);
    setluimenudata(self.localclientnum, lui_menu, "endAlpha", n_target_alpha);
    setluimenudata(self.localclientnum, lui_menu, "fadeOverTime", n_time_ms);
    openluimenu(self.localclientnum, lui_menu);
    wait(n_time);
    if (b_force_close_menu || n_target_alpha == 0) {
        closeluimenu(self.localclientnum, self.screen_fade_menus[str_menu].lui_menu);
        self.screen_fade_menus[str_menu] = undefined;
    }
}

// Namespace lui/lui_shared
// Params 2, eflags: 0x1 linked
// Checksum 0x95628f47, Offset: 0x24b0
// Size: 0xa4
function set_color(menu, color) {
    setluimenudata(self.localclientnum, menu, "red", color[0]);
    setluimenudata(self.localclientnum, menu, "green", color[1]);
    setluimenudata(self.localclientnum, menu, "blue", color[2]);
}

// Namespace lui/lui_shared
// Params 1, eflags: 0x0
// Checksum 0x137769a5, Offset: 0x2560
// Size: 0x40
function function_b48acaf1(uid) {
    elem = new cluielem();
    [[ elem ]]->setup_clientfields(uid);
    return elem;
}

// Namespace lui/lui_shared
// Params 5, eflags: 0x0
// Checksum 0x9ddf6a36, Offset: 0x25a8
// Size: 0x4c
function add_clientfield(field_name, version, bits, type, callback) {
    [[ self ]]->add_clientfield(field_name, version, bits, type, callback);
}

// Namespace lui/lui_shared
// Params 3, eflags: 0x0
// Checksum 0x50ac51b3, Offset: 0x2600
// Size: 0x34
function function_dcb34c80(var_2a0de052, field_name, version) {
    [[ self ]]->function_dcb34c80(var_2a0de052, field_name, version);
}

