// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\duplicaterender_mgr.csc;
#using scripts\core_common\activecamo_shared.csc;

#namespace customclass;

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x74ab8e80, Offset: 0x398
// Size: 0x24
function localclientconnect(localclientnum) {
    level thread custom_class_init(localclientnum);
}

// Namespace customclass/custom_class
// Params 0, eflags: 0x1 linked
// Checksum 0x243f5674, Offset: 0x3c8
// Size: 0x13c
function init() {
    level.weapon_script_model = [];
    level.preload_weapon_model = [];
    level.last_weapon_name = [];
    level.var_8ad413c = [];
    level.current_weapon = [];
    level.attachment_names = [];
    level.paintshophiddenposition = [];
    level.camo_index = [];
    level.reticle_index = [];
    level.var_dd70be5b = [];
    level.var_aa10d0b4 = [];
    level.show_player_tag = [];
    level.show_emblem = [];
    level.preload_weapon_complete = [];
    level.preload_weapon_complete = [];
    level.weapon_clientscript_cac_model = [];
    level.weaponnone = getweapon(#"none");
    refeshweaponposition();
    duplicate_render::set_dr_filter_offscreen("cac_locked_weapon", 10, "cac_locked_weapon", undefined, 2, "mc/sonar_frontend_locked_gun", 1);
}

// Namespace customclass/custom_class
// Params 0, eflags: 0x1 linked
// Checksum 0x54e814ed, Offset: 0x510
// Size: 0x26
function refeshweaponposition() {
    level.weapon_position = struct::get("loadout_camera");
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x1c425bbe, Offset: 0x540
// Size: 0x84
function custom_class_init(localclientnum) {
    level.last_weapon_name[localclientnum] = "";
    level.var_8ad413c[localclientnum] = "";
    level.current_weapon[localclientnum] = undefined;
    level thread custom_class_start_threads(localclientnum);
    level thread handle_cac_customization(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x404c7473, Offset: 0x5d0
// Size: 0xf2
function custom_class_start_threads(localclientnum) {
    level endon(#"disconnect");
    while (1) {
        if (getdvarint(#"ui_enablecacscene", 0) == 0) {
            level thread custom_class_update(localclientnum);
            level thread custom_class_attachment_select_focus(localclientnum);
            level thread custom_class_remove(localclientnum);
            level thread custom_class_closed(localclientnum);
        }
        level waittill("CustomClass_update" + localclientnum, "CustomClass_focus" + localclientnum, "CustomClass_remove" + localclientnum, "CustomClass_closed" + localclientnum);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x4a1341bb, Offset: 0x6d0
// Size: 0x96
function handle_cac_customization(localclientnum) {
    level endon(#"disconnect");
    self.lastxcam = [];
    self.lastsubxcam = [];
    self.lastnotetrack = [];
    while (1) {
        level thread handle_cac_customization_focus(localclientnum);
        level thread handle_cac_customization_closed(localclientnum);
        level waittill("cam_customization_closed" + localclientnum);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x1e181b27, Offset: 0x770
// Size: 0x38c
function custom_class_update(localclientnum) {
    level endon(#"disconnect");
    level endon("CustomClass_focus" + localclientnum);
    level endon("CustomClass_remove" + localclientnum);
    level endon("CustomClass_closed" + localclientnum);
    waitresult = undefined;
    waitresult = level waittill("CustomClass_update" + localclientnum);
    base_weapon_slot = waitresult.base_weapon_slot;
    var_f0bf9259 = waitresult.weapon;
    attachments = waitresult.attachments;
    camera = waitresult.camera;
    weapon_options_param = waitresult.options;
    is_item_unlocked = waitresult.is_item_unlocked;
    xmodel_name = waitresult.xmodel_name;
    xmodel_scale = waitresult.xmodel_scale;
    if (!isdefined(is_item_unlocked)) {
        is_item_unlocked = 1;
    }
    if (!isdefined(xmodel_scale)) {
        xmodel_scale = 1;
    }
    if (!isdefined(xmodel_name)) {
        xmodel_name = #"";
    }
    if (isdefined(var_f0bf9259)) {
        if (isdefined(weapon_options_param) && weapon_options_param != "none") {
            function_998e2be7(localclientnum, weapon_options_param);
        }
        postfx::setfrontendstreamingoverlay(localclientnum, "cac", 1);
        position = level.weapon_position;
        if (!isdefined(level.weapon_script_model[localclientnum])) {
            level.weapon_script_model[localclientnum] = spawn_weapon_model(localclientnum, position.origin, position.angles);
            level.preload_weapon_model[localclientnum] = spawn_weapon_model(localclientnum, position.origin, position.angles);
            level.preload_weapon_model[localclientnum] hide();
        }
        toggle_locked_weapon_shader(localclientnum, is_item_unlocked);
        update_weapon_script_model(localclientnum, var_f0bf9259, attachments, undefined, is_item_unlocked, xmodel_scale, xmodel_name);
        level notify(#"xcammoved");
        lerpduration = get_lerp_duration(camera);
        setup_paintshop_bg(localclientnum, camera);
        level transition_camera_immediate(localclientnum, base_weapon_slot, "cam_cac_weapon", "cam_cac", lerpduration, camera);
        setallowxcamrightstickrotation(localclientnum, !function_4675628e(camera));
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x1 linked
// Checksum 0xc4a95bc5, Offset: 0xb08
// Size: 0x84
function toggle_locked_weapon_shader(localclientnum, is_item_unlocked = 1) {
    if (!isdefined(level.weapon_script_model[localclientnum])) {
        return;
    }
    if (is_item_unlocked != 1) {
        enablefrontendlockedweaponoverlay(localclientnum, 1);
    } else {
        enablefrontendlockedweaponoverlay(localclientnum, 0);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x5fc2442b, Offset: 0xb98
// Size: 0x98
function is_optic(attachmentname) {
    csv_filename = #"gamedata/weapons/common/attachmenttable.csv";
    row = tablelookuprownum(csv_filename, 4, attachmentname);
    if (row > -1) {
        group = tablelookupcolumnforrow(csv_filename, row, 2);
        return (group == "optic");
    }
    return 0;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xcaaaa4d0, Offset: 0xc38
// Size: 0x314
function custom_class_attachment_select_focus(localclientnum) {
    level endon(#"disconnect");
    level endon("CustomClass_update" + localclientnum);
    level endon("CustomClass_remove" + localclientnum);
    level endon("CustomClass_closed" + localclientnum);
    waitresult = undefined;
    waitresult = level waittill("CustomClass_focus" + localclientnum);
    level endon("CustomClass_focus" + localclientnum);
    base_weapon_slot = waitresult.base_weapon_slot;
    weapon_name = waitresult.weapon;
    attachments = waitresult.attachments;
    attachment = waitresult.attachment;
    weapon_options_param = waitresult.options;
    donotmovecamera = waitresult.do_no_move_camera;
    update_weapon_options = 0;
    weaponattachmentintersection = get_attachments_intersection(level.last_weapon_name[localclientnum], level.var_8ad413c[localclientnum], attachments);
    if (isdefined(weapon_options_param) && weapon_options_param != "none") {
        function_998e2be7(localclientnum, weapon_options_param);
    }
    initialdelay = 0.3;
    lerpduration = 400;
    if (is_optic(attachment)) {
        initialdelay = 0;
        lerpduration = 200;
    }
    preload_weapon_model(localclientnum, weapon_name, weaponattachmentintersection, update_weapon_options);
    wait_preload_weapon(localclientnum);
    update_weapon_script_model(localclientnum, weapon_name, weaponattachmentintersection, update_weapon_options);
    if (weapon_name == weaponattachmentintersection) {
        weapon_name = undefined;
    }
    if (isdefined(donotmovecamera) && donotmovecamera) {
        if (isdefined(weapon_name)) {
            preload_weapon_model(localclientnum, weapon_name, weaponattachmentintersection, 0);
            wait(initialdelay);
            wait_preload_weapon(localclientnum);
            update_weapon_script_model(localclientnum, weapon_name, weaponattachmentintersection, 0);
        }
    } else {
        level thread transition_camera(localclientnum, base_weapon_slot, "cam_cac_attachments", "cam_cac", initialdelay, lerpduration, attachment, weapon_name, weaponattachmentintersection);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xb97e5e1, Offset: 0xf58
// Size: 0x84
function function_e057e705(localclientnum) {
    level endon(#"disconnect");
    level endon("CustomClass_closed" + localclientnum);
    level endon("cam_customization_closed" + localclientnum);
    setexposureignoreteleport(localclientnum, 1);
    waitframe(1);
    setexposureignoreteleport(localclientnum, 0);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xfa7e2ff6, Offset: 0xfe8
// Size: 0x1e2
function custom_class_remove(localclientnum) {
    level endon(#"disconnect");
    level endon("CustomClass_update" + localclientnum);
    level endon("CustomClass_focus" + localclientnum);
    level endon("CustomClass_closed" + localclientnum);
    level waittill("CustomClass_remove" + localclientnum);
    postfx::setfrontendstreamingoverlay(localclientnum, "cac", 0);
    enablefrontendlockedweaponoverlay(localclientnum, 0);
    enablefrontendtokenlockedweaponoverlay(localclientnum, 0);
    position = level.weapon_position;
    camera = "select01";
    xcamname = "ui_cam_cac_ar_standard";
    level thread function_e057e705(localclientnum);
    playmaincamxcam(localclientnum, xcamname, 0, "cam_cac", camera, position.origin, position.angles);
    setup_paintshop_bg(localclientnum, camera);
    if (isdefined(level.weapon_script_model[localclientnum])) {
        level.weapon_script_model[localclientnum] forcedelete();
    }
    level.last_weapon_name[localclientnum] = "";
    level.var_8ad413c[localclientnum] = "";
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x410088b9, Offset: 0x11d8
// Size: 0x172
function custom_class_closed(localclientnum) {
    level endon(#"disconnect");
    level endon("CustomClass_update" + localclientnum);
    level endon("CustomClass_focus" + localclientnum);
    level endon("CustomClass_remove" + localclientnum);
    params = undefined;
    params = level waittill(#"customclass_closed");
    if (params.param1 == localclientnum) {
        if (isdefined(level.weapon_script_model[localclientnum])) {
            level.weapon_script_model[localclientnum] forcedelete();
        }
        postfx::setfrontendstreamingoverlay(localclientnum, "cac", 0);
        enablefrontendlockedweaponoverlay(localclientnum, 0);
        enablefrontendtokenlockedweaponoverlay(localclientnum, 0);
        setexposureignoreteleport(localclientnum, 0);
        level.last_weapon_name[localclientnum] = "";
        level.var_8ad413c[localclientnum] = "";
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x1 linked
// Checksum 0x1fea114c, Offset: 0x1358
// Size: 0x7e
function spawn_weapon_model(localclientnum, origin, angles) {
    weapon_model = spawn(localclientnum, origin, "script_model");
    weapon_model sethighdetail(1, 1);
    if (isdefined(angles)) {
        weapon_model.angles = angles;
    }
    return weapon_model;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x7069b2e3, Offset: 0x13e0
// Size: 0xbc
function hide_paintshop_bg(localclientnum) {
    paintshop_bg = getent(localclientnum, "paintshop_black", "targetname");
    if (isdefined(paintshop_bg)) {
        if (!isdefined(level.paintshophiddenposition[localclientnum])) {
            level.paintshophiddenposition[localclientnum] = paintshop_bg.origin;
        }
        paintshop_bg hide();
        paintshop_bg moveto(level.paintshophiddenposition[localclientnum], 0.01);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x9c86ee28, Offset: 0x14a8
// Size: 0x94
function show_paintshop_bg(localclientnum) {
    paintshop_bg = getent(localclientnum, "paintshop_black", "targetname");
    if (isdefined(paintshop_bg)) {
        paintshop_bg show();
        paintshop_bg moveto(level.paintshophiddenposition[localclientnum] + vectorscale((0, 0, 1), 227), 0.01);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xe1e29b99, Offset: 0x1548
// Size: 0x44
function get_camo_index(localclientnum) {
    if (!isdefined(level.camo_index[localclientnum])) {
        level.camo_index[localclientnum] = 0;
    }
    return level.camo_index[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x786c1b9b, Offset: 0x1598
// Size: 0x44
function get_reticle_index(localclientnum) {
    if (!isdefined(level.reticle_index[localclientnum])) {
        level.reticle_index[localclientnum] = 0;
    }
    return level.reticle_index[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xcb21cc80, Offset: 0x15e8
// Size: 0x60
function function_b843e11a(localclientnum) {
    if (!isdefined(level.var_eb2e3f90)) {
        level.var_eb2e3f90 = [];
    }
    if (!isdefined(level.var_eb2e3f90[localclientnum])) {
        level.var_eb2e3f90[localclientnum] = 0;
    }
    return level.var_eb2e3f90[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x57df784c, Offset: 0x1650
// Size: 0x44
function function_442ccfdd(localclientnum) {
    if (!isdefined(level.show_player_tag[localclientnum])) {
        level.show_player_tag[localclientnum] = 0;
    }
    return level.show_player_tag[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x3da50f79, Offset: 0x16a0
// Size: 0x44
function get_show_emblem(localclientnum) {
    if (!isdefined(level.show_emblem[localclientnum])) {
        level.show_emblem[localclientnum] = 0;
    }
    return level.show_emblem[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xdd811acb, Offset: 0x16f0
// Size: 0x44
function get_show_paintshop(localclientnum) {
    if (!isdefined(level.show_paintshop[localclientnum])) {
        level.show_paintshop[localclientnum] = 0;
    }
    return level.show_paintshop[localclientnum];
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x1 linked
// Checksum 0x505b0754, Offset: 0x1740
// Size: 0x72
function function_162e1121(localclientnum, var_571f2574) {
    if (!isdefined(level.var_571f2574)) {
        level.var_571f2574 = [];
    }
    if (!isdefined(level.var_571f2574[localclientnum])) {
        level.var_571f2574[localclientnum] = 0;
    }
    level.var_571f2574[localclientnum] = var_571f2574;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x7795a50d, Offset: 0x17c0
// Size: 0x60
function function_52145a0d(localclientnum) {
    if (!isdefined(level.var_571f2574)) {
        level.var_571f2574 = [];
    }
    if (!isdefined(level.var_571f2574[localclientnum])) {
        level.var_571f2574[localclientnum] = 0;
    }
    return level.var_571f2574[localclientnum];
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x1 linked
// Checksum 0x560d026a, Offset: 0x1828
// Size: 0x1f4
function function_998e2be7(localclientnum, weapon_options_param) {
    weapon_options = strtok(weapon_options_param, ",");
    level.camo_index[localclientnum] = int(weapon_options[0]);
    level.show_player_tag[localclientnum] = 0;
    level.show_emblem[localclientnum] = 0;
    level.reticle_index[localclientnum] = int(weapon_options[1]);
    level.show_paintshop[localclientnum] = int(weapon_options[2]);
    if (isdefined(weapon_options[3])) {
        level.var_eb2e3f90[localclientnum] = int(weapon_options[3]);
    }
    if (isdefined(weapon_options[4])) {
        level.var_dd70be5b[localclientnum] = int(weapon_options[4]);
    } else {
        level.var_dd70be5b[localclientnum] = -1;
    }
    if (isdefined(weapon_options[5])) {
        function_162e1121(localclientnum, int(weapon_options[5]));
    } else {
        function_162e1121(localclientnum, 0);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x92483f39, Offset: 0x1a28
// Size: 0x82
function get_weapon_options(localclientnum) {
    return function_140a6212(get_camo_index(localclientnum), get_reticle_index(localclientnum), function_b843e11a(localclientnum), function_442ccfdd(localclientnum), get_show_emblem(localclientnum), get_show_paintshop(localclientnum));
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xa05a4085, Offset: 0x1ab8
// Size: 0xb2
function get_lerp_duration(camera) {
    lerpduration = 0;
    if (isdefined(camera)) {
        paintshopcameracloseup = camera == "left" || camera == "right" || camera == "top" || camera == "paintshop_preview_left" || camera == "paintshop_preview_right" || camera == "paintshop_preview_top";
        if (paintshopcameracloseup) {
            lerpduration = 500;
        }
    }
    return lerpduration;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x4697acbf, Offset: 0x1b78
// Size: 0x7a
function function_4675628e(camera) {
    return camera == "left" || camera == "right" || camera == "top" || camera == "paintshop_preview_left" || camera == "paintshop_preview_right" || camera == "paintshop_preview_top";
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x1 linked
// Checksum 0xd48c9f39, Offset: 0x1c00
// Size: 0x144
function setup_paintshop_bg(localclientnum, camera) {
    if (isdefined(camera)) {
        playradiantexploder(localclientnum, "weapon_kick");
        if (function_4675628e(camera)) {
            show_paintshop_bg(localclientnum);
            killradiantexploder(localclientnum, "lights_paintshop");
            killradiantexploder(localclientnum, "weapon_kick");
            playradiantexploder(localclientnum, "lights_paintshop_zoom");
        } else {
            hide_paintshop_bg(localclientnum);
            killradiantexploder(localclientnum, "lights_paintshop_zoom");
            playradiantexploder(localclientnum, "lights_paintshop");
            playradiantexploder(localclientnum, "weapon_kick");
        }
    }
}

// Namespace customclass/custom_class
// Params 6, eflags: 0x1 linked
// Checksum 0xdab51002, Offset: 0x1d50
// Size: 0x244
function transition_camera_immediate(localclientnum, weapontype, camera, subxcam, lerpduration, notetrack) {
    xcam = getweaponxcam(level.current_weapon[localclientnum], camera);
    if (!isdefined(xcam)) {
        if (strstartswith(weapontype, "tacticalgear")) {
            xcam = "ui_cam_cac_perk";
        } else if (strstartswith(weapontype, "bubblegum")) {
            xcam = "ui_cam_cac_elixir";
        } else if (strstartswith(weapontype, "talisman")) {
            xcam = "ui_cam_cac_talisman";
        } else if (strstartswith(weapontype, "charm")) {
            xcam = "ui_cam_cac_charm";
        } else {
            xcam = getweaponxcam(getweapon(#"ar_accurate_t8"), camera);
        }
    }
    self.lastxcam[weapontype] = xcam;
    self.lastsubxcam[weapontype] = subxcam;
    self.lastnotetrack[weapontype] = notetrack;
    position = level.weapon_position;
    model = level.weapon_script_model[localclientnum];
    level thread function_e057e705(localclientnum);
    playmaincamxcam(localclientnum, xcam, lerpduration, subxcam, notetrack, position.origin, position.angles, model, position.origin, position.angles);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x77df60d5, Offset: 0x1fa0
// Size: 0x3a
function wait_preload_weapon(localclientnum) {
    if (level.preload_weapon_complete[localclientnum]) {
        return;
    }
    level waittill("preload_weapon_complete_" + localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xea7e9aab, Offset: 0x1fe8
// Size: 0x98
function preload_weapon_watcher(localclientnum) {
    level endon("preload_weapon_changing_" + localclientnum);
    level endon("preload_weapon_complete_" + localclientnum);
    while (1) {
        if (level.preload_weapon_model[localclientnum] isstreamed()) {
            level.preload_weapon_complete[localclientnum] = 1;
            level notify("preload_weapon_complete_" + localclientnum);
            return;
        }
        wait(0.1);
    }
}

// Namespace customclass/custom_class
// Params 4, eflags: 0x1 linked
// Checksum 0xe4cce132, Offset: 0x2088
// Size: 0x12c
function preload_weapon_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options = 1) {
    level notify("preload_weapon_changing_" + localclientnum);
    level.preload_weapon_complete[localclientnum] = 0;
    current_weapon = getweapon(newweaponstring, strtok(var_f020955, "+"));
    if (current_weapon == level.weaponnone) {
        level.preload_weapon_complete[localclientnum] = 1;
        level notify("preload_weapon_complete_" + localclientnum);
        return;
    }
    level.preload_weapon_model[localclientnum] useweaponmodel(current_weapon, undefined, get_weapon_options(localclientnum));
    level thread preload_weapon_watcher(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x2f58f787, Offset: 0x21c0
// Size: 0x7c
function function_8bf05e82(localclientnum) {
    var_cc22b19 = createuimodel(getuimodelforcontroller(localclientnum), "WeaponAttachmentFlyout.entNum");
    var_b65f6ce3 = self getentitynumber();
    setuimodelvalue(var_cc22b19, var_b65f6ce3);
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x5 linked
// Checksum 0xb4d7f600, Offset: 0x2248
// Size: 0xb2
function private function_3e2b5b60(localclientnum, weaponmodel) {
    if (level.var_dd70be5b[localclientnum] <= -1) {
        return 0;
    }
    activecamoinfo = activecamo::function_ae141bf2(level.camo_index[localclientnum]);
    if (!isdefined(activecamoinfo)) {
        return 0;
    }
    var_3594168e = activecamoinfo.stages[level.var_dd70be5b[localclientnum]];
    return activecamo::function_374e37a0(localclientnum, weaponmodel, var_3594168e, level.var_aa10d0b4);
}

// Namespace customclass/custom_class
// Params 7, eflags: 0x1 linked
// Checksum 0xac03f1a3, Offset: 0x2308
// Size: 0x61c
function update_weapon_script_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options = 1, is_item_unlocked = 1, xmodel_scale = 1, xmodel_name = #"") {
    /#
        /#
            assert(isdefined(newweaponstring), "<unknown string>");
        #/
        /#
            assert(isdefined(var_f020955), "<unknown string>");
        #/
    #/
    level.last_weapon_name[localclientnum] = isdefined(newweaponstring) ? newweaponstring : #"ar_accurate_t8";
    level.var_8ad413c[localclientnum] = isdefined(var_f020955) ? var_f020955 : "";
    var_571f2574 = function_52145a0d(localclientnum);
    if (var_571f2574 > 0) {
        if (!issubstr(level.var_8ad413c[localclientnum], "custom2")) {
            attachments = strtok(level.var_8ad413c[localclientnum], "+");
            if (attachments.size < 7) {
                if (!isdefined(attachments)) {
                    attachments = [];
                } else if (!isarray(attachments)) {
                    attachments = array(attachments);
                }
                attachments[attachments.size] = "custom2";
                var_f020955 = "";
                for (i = 0; i < attachments.size; i++) {
                    if (i > 0) {
                        var_f020955 = var_f020955 + "+";
                    }
                    var_f020955 = var_f020955 + attachments[i];
                }
                level.var_8ad413c[localclientnum] = var_f020955;
            }
        }
    }
    level.current_weapon[localclientnum] = getweapon(level.last_weapon_name[localclientnum], strtok(level.var_8ad413c[localclientnum], "+"));
    if (level.current_weapon[localclientnum] == level.weaponnone || !(xmodel_name === #"")) {
        level.weapon_script_model[localclientnum] delete();
        position = level.weapon_position;
        level.weapon_script_model[localclientnum] = spawn_weapon_model(localclientnum, position.origin, position.angles);
        toggle_locked_weapon_shader(localclientnum, is_item_unlocked);
        if (!(xmodel_name === #"")) {
            level.weapon_script_model[localclientnum] setmodel(xmodel_name);
        } else {
            level.weapon_script_model[localclientnum] setmodel(level.last_weapon_name[localclientnum]);
        }
        level.weapon_script_model[localclientnum] setscale(xmodel_scale);
        level.weapon_script_model[localclientnum] setdedicatedshadow(1);
        if (lui::is_current_menu(localclientnum, "BubblegumBuffSelect")) {
            level.weapon_script_model[localclientnum] function_ccfcedeb(localclientnum);
        }
        return;
    }
    function_975f521b(var_571f2574);
    level.weapon_script_model[localclientnum] useweaponmodel(level.current_weapon[localclientnum], undefined, get_weapon_options(localclientnum));
    weaponmodel = level.weapon_script_model[localclientnum];
    if (!function_3e2b5b60(localclientnum, weaponmodel)) {
        if (isdefined(level.var_aa10d0b4[localclientnum])) {
            weaponmodel stoprenderoverridebundle(level.var_aa10d0b4[localclientnum]);
            level.var_aa10d0b4[localclientnum] = undefined;
        }
    }
    level.weapon_script_model[localclientnum] setscale(function_8d32e28(level.current_weapon[localclientnum]));
    level.weapon_script_model[localclientnum] setdedicatedshadow(1);
    level.weapon_script_model[localclientnum] function_8bf05e82(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x1312f194, Offset: 0x2930
// Size: 0x3e
function function_ccfcedeb(localclientnum) {
    if (isdefined(self.var_a8f1ca4e)) {
        stopfx(localclientnum, self.var_a8f1ca4e);
        self.var_a8f1ca4e = undefined;
    }
}

// Namespace customclass/custom_class
// Params 10, eflags: 0x1 linked
// Checksum 0xb2bdc1af, Offset: 0x2978
// Size: 0x16c
function transition_camera(localclientnum, weapontype, camera, subxcam, initialdelay, lerpduration, notetrack, newweaponstring, var_f020955, should_update_weapon_options = 0) {
    self endon(#"death");
    self notify(#"xcammoved");
    self endon(#"xcammoved");
    level endon(#"cam_customization_closed");
    if (isdefined(newweaponstring)) {
        preload_weapon_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options);
    }
    wait(initialdelay);
    transition_camera_immediate(localclientnum, weapontype, camera, subxcam, lerpduration, notetrack);
    if (isdefined(newweaponstring)) {
        wait(float(lerpduration) / 1000);
        wait_preload_weapon(localclientnum);
        update_weapon_script_model(localclientnum, newweaponstring, var_f020955, should_update_weapon_options);
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x1 linked
// Checksum 0x3106865c, Offset: 0x2af0
// Size: 0x122
function get_attachments_intersection(oldweapon, var_314432b2, var_6714c3a0) {
    if (!isdefined(oldweapon)) {
        return var_6714c3a0;
    }
    var_3f8fbddf = strtok(var_314432b2, "+");
    var_95e90a5e = strtok(var_6714c3a0, "+");
    if (!isdefined(var_3f8fbddf[0]) || var_3f8fbddf[0] != var_95e90a5e[0]) {
        return var_6714c3a0;
    }
    var_a014270e = var_95e90a5e[0];
    for (i = 1; i < var_95e90a5e.size; i++) {
        if (isinarray(var_3f8fbddf, var_95e90a5e[i])) {
            var_a014270e = var_a014270e + "+" + var_95e90a5e[i];
        }
    }
    return var_a014270e;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xc3d5f551, Offset: 0x2c20
// Size: 0x118
function handle_cac_customization_focus(localclientnum) {
    level endon(#"disconnect");
    level endon("cam_customization_closed" + localclientnum);
    while (1) {
        waitresult = undefined;
        waitresult = level waittill("cam_customization_focus" + localclientnum);
        base_weapon_slot = waitresult.base_weapon_slot;
        notetrack = waitresult.notetrack;
        if (isdefined(level.weapon_script_model[localclientnum])) {
            should_update_weapon_options = 1;
            level thread transition_camera(localclientnum, base_weapon_slot, "cam_cac_weapon", "cam_cac", 0.3, 400, notetrack, level.last_weapon_name[localclientnum], level.var_8ad413c[localclientnum], should_update_weapon_options);
        }
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x91c05281, Offset: 0x2d40
// Size: 0x54
function handle_cac_customization_closed(localclientnum) {
    level endon(#"disconnect");
    level waittill("cam_customization_closed" + localclientnum);
    setexposureignoreteleport(localclientnum, 0);
}

