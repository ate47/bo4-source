// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/lui_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/postfx_shared.csc;
#include scripts/core_common/duplicaterender_mgr.csc;
#include scripts/core_common/activecamo_shared.csc;

#namespace customclass;

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x74ab8e80, Offset: 0x398
// Size: 0x24
function localclientconnect(localclientnum) {
    level thread function_12209e52(localclientnum);
}

// Namespace customclass/custom_class
// Params 0, eflags: 0x1 linked
// Checksum 0x243f5674, Offset: 0x3c8
// Size: 0x13c
function init() {
    level.weapon_script_model = [];
    level.var_4230450c = [];
    level.var_51587757 = [];
    level.var_8ad413c = [];
    level.current_weapon = [];
    level.var_a65bbdea = [];
    level.var_870fcb60 = [];
    level.camo_index = [];
    level.reticle_index = [];
    level.var_dd70be5b = [];
    level.var_aa10d0b4 = [];
    level.var_a92f6f89 = [];
    level.var_15dc0017 = [];
    level.var_38bc4b6 = [];
    level.var_38bc4b6 = [];
    level.var_a6482d46 = [];
    level.weaponnone = getweapon(#"none");
    function_d686c8ae();
    duplicate_render::set_dr_filter_offscreen("cac_locked_weapon", 10, "cac_locked_weapon", undefined, 2, "mc/sonar_frontend_locked_gun", 1);
}

// Namespace customclass/custom_class
// Params 0, eflags: 0x1 linked
// Checksum 0x54e814ed, Offset: 0x510
// Size: 0x26
function function_d686c8ae() {
    level.weapon_position = struct::get("loadout_camera");
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x1c425bbe, Offset: 0x540
// Size: 0x84
function function_12209e52(localclientnum) {
    level.var_51587757[localclientnum] = "";
    level.var_8ad413c[localclientnum] = "";
    localclientnum = [];
    level thread function_65c2dd23(localclientnum);
    level thread function_a0e9edd8(localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x404c7473, Offset: 0x5d0
// Size: 0xf2
function function_65c2dd23(localclientnum) {
    level endon(#"disconnect");
    while (1) {
        if (getdvarint(#"hash_296f823881cb6f30", 0) == 0) {
            level thread function_9a5cdeb3(localclientnum);
            level thread function_a9e61a3b(localclientnum);
            level thread function_4cd8f180(localclientnum);
            level thread function_170c303e(localclientnum);
        }
        level waittill("CustomClass_update" + localclientnum, "CustomClass_focus" + localclientnum, "CustomClass_remove" + localclientnum, "CustomClass_closed" + localclientnum);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x4a1341bb, Offset: 0x6d0
// Size: 0x96
function function_a0e9edd8(localclientnum) {
    level endon(#"disconnect");
    self.var_52c5eb61 = [];
    self.var_5a489ac2 = [];
    self.var_3d37b49 = [];
    while (1) {
        level thread function_5d9ce4fe(localclientnum);
        level thread function_212b1048(localclientnum);
        level waittill("cam_customization_closed" + localclientnum);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x1e181b27, Offset: 0x770
// Size: 0x38c
function function_9a5cdeb3(localclientnum) {
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
    var_1320843f = waitresult.var_1320843f;
    var_8a6eef52 = waitresult.var_8a6eef52;
    var_8ba4443d = waitresult.var_8ba4443d;
    if (!isdefined(var_1320843f)) {
        var_1320843f = 1;
    }
    if (!isdefined(var_8ba4443d)) {
        var_8ba4443d = 1;
    }
    if (!isdefined(var_8a6eef52)) {
        var_8a6eef52 = #"hash_0";
    }
    if (isdefined(var_f0bf9259)) {
        if (isdefined(weapon_options_param) && weapon_options_param != "none") {
            function_998e2be7(localclientnum, weapon_options_param);
        }
        postfx::setfrontendstreamingoverlay(localclientnum, "cac", 1);
        position = level.weapon_position;
        if (!isdefined(level.weapon_script_model[localclientnum])) {
            level.weapon_script_model[localclientnum] = spawn_weapon_model(localclientnum, position.origin, position.angles);
            level.var_4230450c[localclientnum] = spawn_weapon_model(localclientnum, position.origin, position.angles);
            level.var_4230450c[localclientnum] hide();
        }
        function_f8c54d4b(localclientnum, var_1320843f);
        function_509e1b67(localclientnum, var_f0bf9259, attachments, undefined, var_1320843f, var_8ba4443d, var_8a6eef52);
        level notify(#"hash_56a96cfb635b7cad");
        lerpduration = function_9c516f98(camera);
        function_bb3640a2(localclientnum, camera);
        level function_bed1dd3d(localclientnum, base_weapon_slot, "cam_cac_weapon", "cam_cac", lerpduration, camera);
        setallowxcamrightstickrotation(localclientnum, !function_4675628e(camera));
    }
}

// Namespace customclass/custom_class
// Params 2, eflags: 0x1 linked
// Checksum 0xc4a95bc5, Offset: 0xb08
// Size: 0x84
function function_f8c54d4b(localclientnum, var_1320843f = 1) {
    if (!isdefined(level.weapon_script_model[localclientnum])) {
        return;
    }
    if (var_1320843f != 1) {
        enablefrontendlockedweaponoverlay(localclientnum, 1);
    } else {
        enablefrontendlockedweaponoverlay(localclientnum, 0);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x5fc2442b, Offset: 0xb98
// Size: 0x98
function function_91039ee4(attachmentname) {
    var_6384bd8a = #"hash_7cfeb5c2c217b385";
    row = tablelookuprownum(var_6384bd8a, 4, attachmentname);
    if (row > -1) {
        group = tablelookupcolumnforrow(var_6384bd8a, row, 2);
        return (group == "optic");
    }
    return 0;
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xcaaaa4d0, Offset: 0xc38
// Size: 0x314
function function_a9e61a3b(localclientnum) {
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
    var_d07190c5 = waitresult.var_8d28e442;
    var_8e9aaf26 = 0;
    var_534f02ba = function_cd36017b(level.var_51587757[localclientnum], level.var_8ad413c[localclientnum], attachments);
    if (isdefined(weapon_options_param) && weapon_options_param != "none") {
        function_998e2be7(localclientnum, weapon_options_param);
    }
    var_9fa5ba23 = 0.3;
    lerpduration = 400;
    if (function_91039ee4(attachment)) {
        var_9fa5ba23 = 0;
        lerpduration = 200;
    }
    function_4230450c(localclientnum, weapon_name, var_534f02ba, var_8e9aaf26);
    function_3f265fd3(localclientnum);
    function_509e1b67(localclientnum, weapon_name, var_534f02ba, var_8e9aaf26);
    if (weapon_name == var_534f02ba) {
        weapon_name = undefined;
    }
    if (isdefined(var_d07190c5) && var_d07190c5) {
        if (isdefined(weapon_name)) {
            function_4230450c(localclientnum, weapon_name, var_534f02ba, 0);
            wait(var_9fa5ba23);
            function_3f265fd3(localclientnum);
            function_509e1b67(localclientnum, weapon_name, var_534f02ba, 0);
        }
    } else {
        level thread function_356f6575(localclientnum, base_weapon_slot, "cam_cac_attachments", "cam_cac", var_9fa5ba23, lerpduration, attachment, weapon_name, var_534f02ba);
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
function function_4cd8f180(localclientnum) {
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
    var_9c4a68ac = "ui_cam_cac_ar_standard";
    level thread function_e057e705(localclientnum);
    playmaincamxcam(localclientnum, var_9c4a68ac, 0, "cam_cac", camera, position.origin, position.angles);
    function_bb3640a2(localclientnum, camera);
    if (isdefined(level.weapon_script_model[localclientnum])) {
        level.weapon_script_model[localclientnum] forcedelete();
    }
    level.var_51587757[localclientnum] = "";
    level.var_8ad413c[localclientnum] = "";
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x410088b9, Offset: 0x11d8
// Size: 0x172
function function_170c303e(localclientnum) {
    level endon(#"disconnect");
    level endon("CustomClass_update" + localclientnum);
    level endon("CustomClass_focus" + localclientnum);
    level endon("CustomClass_remove" + localclientnum);
    params = undefined;
    params = level waittill(#"hash_572454939cfd48e7");
    if (params.param1 == localclientnum) {
        if (isdefined(level.weapon_script_model[localclientnum])) {
            level.weapon_script_model[localclientnum] forcedelete();
        }
        postfx::setfrontendstreamingoverlay(localclientnum, "cac", 0);
        enablefrontendlockedweaponoverlay(localclientnum, 0);
        enablefrontendtokenlockedweaponoverlay(localclientnum, 0);
        setexposureignoreteleport(localclientnum, 0);
        level.var_51587757[localclientnum] = "";
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
function function_6c5294d(localclientnum) {
    var_64e00d31 = getent(localclientnum, "paintshop_black", "targetname");
    if (isdefined(var_64e00d31)) {
        if (!isdefined(level.var_870fcb60[localclientnum])) {
            level.var_870fcb60[localclientnum] = var_64e00d31.origin;
        }
        var_64e00d31 hide();
        var_64e00d31 moveto(level.var_870fcb60[localclientnum], 0.01);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x9c86ee28, Offset: 0x14a8
// Size: 0x94
function function_f508fa2d(localclientnum) {
    var_64e00d31 = getent(localclientnum, "paintshop_black", "targetname");
    if (isdefined(var_64e00d31)) {
        var_64e00d31 show();
        var_64e00d31 moveto(level.var_870fcb60[localclientnum] + vectorscale((0, 0, 1), 227), 0.01);
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xe1e29b99, Offset: 0x1548
// Size: 0x44
function function_bb7c0ede(localclientnum) {
    if (!isdefined(level.camo_index[localclientnum])) {
        level.camo_index[localclientnum] = 0;
    }
    return level.camo_index[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x786c1b9b, Offset: 0x1598
// Size: 0x44
function function_12c29130(localclientnum) {
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
    if (!isdefined(level.var_a92f6f89[localclientnum])) {
        level.var_a92f6f89[localclientnum] = 0;
    }
    return level.var_a92f6f89[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x3da50f79, Offset: 0x16a0
// Size: 0x44
function function_df023db3(localclientnum) {
    if (!isdefined(level.var_15dc0017[localclientnum])) {
        level.var_15dc0017[localclientnum] = 0;
    }
    return level.var_15dc0017[localclientnum];
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xdd811acb, Offset: 0x16f0
// Size: 0x44
function function_13f39a4d(localclientnum) {
    if (!isdefined(level.var_30e8a36a[localclientnum])) {
        level.var_30e8a36a[localclientnum] = 0;
    }
    return level.var_30e8a36a[localclientnum];
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
    level.var_a92f6f89[localclientnum] = 0;
    level.var_15dc0017[localclientnum] = 0;
    level.reticle_index[localclientnum] = int(weapon_options[1]);
    level.var_30e8a36a[localclientnum] = int(weapon_options[2]);
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
    return function_140a6212(function_bb7c0ede(localclientnum), function_12c29130(localclientnum), function_b843e11a(localclientnum), function_442ccfdd(localclientnum), function_df023db3(localclientnum), function_13f39a4d(localclientnum));
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xa05a4085, Offset: 0x1ab8
// Size: 0xb2
function function_9c516f98(camera) {
    lerpduration = 0;
    if (isdefined(camera)) {
        var_6ddb7207 = camera == "left" || camera == "right" || camera == "top" || camera == "paintshop_preview_left" || camera == "paintshop_preview_right" || camera == "paintshop_preview_top";
        if (var_6ddb7207) {
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
function function_bb3640a2(localclientnum, camera) {
    if (isdefined(camera)) {
        playradiantexploder(localclientnum, "weapon_kick");
        if (function_4675628e(camera)) {
            function_f508fa2d(localclientnum);
            killradiantexploder(localclientnum, "lights_paintshop");
            killradiantexploder(localclientnum, "weapon_kick");
            playradiantexploder(localclientnum, "lights_paintshop_zoom");
        } else {
            function_6c5294d(localclientnum);
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
function function_bed1dd3d(localclientnum, weapontype, camera, subxcam, lerpduration, notetrack) {
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
    self.var_52c5eb61[weapontype] = xcam;
    self.var_5a489ac2[weapontype] = subxcam;
    self.var_3d37b49[weapontype] = notetrack;
    position = level.weapon_position;
    model = level.weapon_script_model[localclientnum];
    level thread function_e057e705(localclientnum);
    playmaincamxcam(localclientnum, xcam, lerpduration, subxcam, notetrack, position.origin, position.angles, model, position.origin, position.angles);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x77df60d5, Offset: 0x1fa0
// Size: 0x3a
function function_3f265fd3(localclientnum) {
    if (level.var_38bc4b6[localclientnum]) {
        return;
    }
    level waittill("preload_weapon_complete_" + localclientnum);
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0xea7e9aab, Offset: 0x1fe8
// Size: 0x98
function function_7d5cd550(localclientnum) {
    level endon("preload_weapon_changing_" + localclientnum);
    level endon("preload_weapon_complete_" + localclientnum);
    while (1) {
        if (level.var_4230450c[localclientnum] isstreamed()) {
            level.var_38bc4b6[localclientnum] = 1;
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
function function_4230450c(localclientnum, var_47465301, var_f020955, var_13285754 = 1) {
    level notify("preload_weapon_changing_" + localclientnum);
    level.var_38bc4b6[localclientnum] = 0;
    current_weapon = getweapon(var_47465301, strtok(var_f020955, "+"));
    if (current_weapon == level.weaponnone) {
        level.var_38bc4b6[localclientnum] = 1;
        level notify("preload_weapon_complete_" + localclientnum);
        return;
    }
    level.var_4230450c[localclientnum] useweaponmodel(current_weapon, undefined, get_weapon_options(localclientnum));
    level thread function_7d5cd550(localclientnum);
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
function function_509e1b67(localclientnum, var_47465301, var_f020955, var_13285754 = 1, var_1320843f = 1, var_8ba4443d = 1, var_8a6eef52 = #"hash_0") {
    /#
        /#
            assert(isdefined(var_47465301), "<unknown string>");
        #/
        /#
            assert(isdefined(var_f020955), "<unknown string>");
        #/
    #/
    level.var_51587757[localclientnum] = isdefined(var_47465301) ? var_47465301 : #"ar_accurate_t8";
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
    level.current_weapon[localclientnum] = getweapon(level.var_51587757[localclientnum], strtok(level.var_8ad413c[localclientnum], "+"));
    if (level.current_weapon[localclientnum] == level.weaponnone || !(var_8a6eef52 === #"hash_0")) {
        level.weapon_script_model[localclientnum] delete();
        position = level.weapon_position;
        level.weapon_script_model[localclientnum] = spawn_weapon_model(localclientnum, position.origin, position.angles);
        function_f8c54d4b(localclientnum, var_1320843f);
        if (!(var_8a6eef52 === #"hash_0")) {
            level.weapon_script_model[localclientnum] setmodel(var_8a6eef52);
        } else {
            level.weapon_script_model[localclientnum] setmodel(level.var_51587757[localclientnum]);
        }
        level.weapon_script_model[localclientnum] setscale(var_8ba4443d);
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
            localclientnum = [];
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
function function_356f6575(localclientnum, weapontype, camera, subxcam, var_9fa5ba23, lerpduration, notetrack, var_47465301, var_f020955, var_13285754 = 0) {
    self endon(#"death");
    self notify(#"hash_56a96cfb635b7cad");
    self endon(#"hash_56a96cfb635b7cad");
    level endon(#"hash_13db50593e9e0c53");
    if (isdefined(var_47465301)) {
        function_4230450c(localclientnum, var_47465301, var_f020955, var_13285754);
    }
    wait(var_9fa5ba23);
    function_bed1dd3d(localclientnum, weapontype, camera, subxcam, lerpduration, notetrack);
    if (isdefined(var_47465301)) {
        wait(float(lerpduration) / 1000);
        function_3f265fd3(localclientnum);
        function_509e1b67(localclientnum, var_47465301, var_f020955, var_13285754);
    }
}

// Namespace customclass/custom_class
// Params 3, eflags: 0x1 linked
// Checksum 0x3106865c, Offset: 0x2af0
// Size: 0x122
function function_cd36017b(oldweapon, var_314432b2, var_6714c3a0) {
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
function function_5d9ce4fe(localclientnum) {
    level endon(#"disconnect");
    level endon("cam_customization_closed" + localclientnum);
    while (1) {
        waitresult = undefined;
        waitresult = level waittill("cam_customization_focus" + localclientnum);
        base_weapon_slot = waitresult.base_weapon_slot;
        notetrack = waitresult.notetrack;
        if (isdefined(level.weapon_script_model[localclientnum])) {
            var_13285754 = 1;
            level thread function_356f6575(localclientnum, base_weapon_slot, "cam_cac_weapon", "cam_cac", 0.3, 400, notetrack, level.var_51587757[localclientnum], level.var_8ad413c[localclientnum], var_13285754);
        }
    }
}

// Namespace customclass/custom_class
// Params 1, eflags: 0x1 linked
// Checksum 0x91c05281, Offset: 0x2d40
// Size: 0x54
function function_212b1048(localclientnum) {
    level endon(#"disconnect");
    level waittill("cam_customization_closed" + localclientnum);
    setexposureignoreteleport(localclientnum, 0);
}

