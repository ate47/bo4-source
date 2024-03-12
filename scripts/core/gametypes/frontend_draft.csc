// Atian COD Tools GSC decompiler test
#using scripts\core_common\dialog_shared.csc;
#using scripts\core_common\player\player_role.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\struct.csc;

#namespace draft;

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0x3d2a583, Offset: 0x268
// Size: 0x11c
function init() {
    level.var_1f0933dc = [];
    level.var_1f0933dc[#"allies"] = "mp_draft_lights_allies";
    level.var_1f0933dc[#"axis"] = "mp_draft_lights_axis";
    level.var_eeee7da4 = undefined;
    level thread function_ca03ab69();
    level thread function_91858511();
    level.var_368aaeb9 = "";
    level.var_bbb8810e = #"ui_cam_draft_common";
    level.var_482af62e = #"hash_12263e5d70551bf9";
    level.var_df72fe54 = undefined;
    level.draftcharacters = [];
    level.var_6963abdb = [];
    level thread function_393e6d42();
}

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0xe56dba18, Offset: 0x390
// Size: 0x3c
function function_47569560() {
    if (currentsessionmode() == 0) {
        return #"zm_lobby_struct";
    }
    return #"draft_team_struct_allies";
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0xb262a3d8, Offset: 0x3d8
// Size: 0x13e
function function_75442e78(index) {
    var_8cb8d474 = [];
    if (currentsessionmode() == 0) {
        var_8cb8d474[0] = #"zm_lobby_player_2";
        var_8cb8d474[1] = #"zm_lobby_player_1";
        var_8cb8d474[2] = #"zm_lobby_player_0";
        var_8cb8d474[3] = #"zm_lobby_player_3";
    } else {
        var_8cb8d474[0] = #"draft_player_struct_2_allies";
        var_8cb8d474[1] = #"draft_player_struct_1_allies";
        var_8cb8d474[2] = #"draft_player_struct_0_allies";
        var_8cb8d474[3] = #"draft_player_struct_3_allies";
        var_8cb8d474[4] = #"draft_player_struct_4_allies";
    }
    if (index < var_8cb8d474.size) {
        return struct::get(var_8cb8d474[index]);
    }
    return undefined;
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x0
// Checksum 0xae99049e, Offset: 0x520
// Size: 0x60
function getpositionforlocalclient(localclientnum) {
    localclientmapping = [];
    localclientmapping[0] = 2;
    localclientmapping[1] = 1;
    localclientmapping[2] = 3;
    localclientmapping[3] = 0;
    return localclientmapping[localclientnum];
}

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0xd7f995d6, Offset: 0x588
// Size: 0xa2
function function_f701ad2a() {
    if (sessionmodeiswarzonegame()) {
        return 3;
    }
    if (sessionmodeiszombiesgame()) {
        return 2;
    }
    if (level.lastlobbystate === #"lobby_pose" || level.lastlobbystate === #"private_lobby_pose") {
        return 0;
    } else if (level.lastlobbystate === #"arena_pose") {
        return 1;
    }
    return -1;
}

// Namespace draft/frontend_draft
// Params 2, eflags: 0x1 linked
// Checksum 0xc63c2e4d, Offset: 0x638
// Size: 0x124
function function_8be87802(localclientnum, character) {
    var_2d0192e5 = [[ character ]]->function_82e05d64();
    if (!(isdefined(var_2d0192e5) && isdefined(var_2d0192e5.entnummodel))) {
        return;
    }
    var_c2ab6c5b = function_f701ad2a();
    if (var_2d0192e5.var_3f0e790b === var_c2ab6c5b) {
        setuimodelvalue(var_2d0192e5.entnummodel, [[ character ]]->function_47cb6b19());
    }
    if (isdefined(var_2d0192e5.var_3f0e790b) && isdefined(var_c2ab6c5b) && var_2d0192e5.var_3f0e790b != var_c2ab6c5b) {
        character_customization::function_bee62aa1(character);
    }
    setuimodelvalue(var_2d0192e5.visible_model, [[ character ]]->function_ea4ac9f8() && [[ character ]]->is_visible());
}

// Namespace draft/frontend_draft
// Params 3, eflags: 0x1 linked
// Checksum 0xc53bd58b, Offset: 0x768
// Size: 0x254
function function_e1f85a64(var_87c045d1, index, var_3f0e790b) {
    var_6b71abc1 = getuimodel(getglobaluimodel(), "LobbyClients");
    var_c4caf9dd = getuimodel(var_6b71abc1, index + 1);
    if (!isdefined(var_c4caf9dd)) {
        return;
    }
    [[ var_87c045d1 ]]->function_82e05d64().entnummodel = createuimodel(var_c4caf9dd, "entNum");
    [[ var_87c045d1 ]]->function_82e05d64().var_3f0e790b = var_3f0e790b;
    [[ var_87c045d1 ]]->function_184a4d2e(&function_8be87802);
    entnum = getuimodelvalue([[ var_87c045d1 ]]->function_82e05d64().entnummodel);
    if (!isdefined(entnum)) {
        setuimodelvalue([[ var_87c045d1 ]]->function_82e05d64().entnummodel, [[ var_87c045d1 ]]->function_47cb6b19());
    }
    [[ var_87c045d1 ]]->function_82e05d64().visible_model = getuimodel(var_c4caf9dd, "visible");
    setuimodelvalue([[ var_87c045d1 ]]->function_82e05d64().visible_model, [[ var_87c045d1 ]]->function_ea4ac9f8() && [[ var_87c045d1 ]]->is_visible());
    var_2097336a = createuimodel(var_c4caf9dd, "sprayGestureIndex");
    [[ var_87c045d1 ]]->function_82e05d64().var_5da50127 = var_2097336a;
    setuimodelvalue(var_2097336a, isdefined(getuimodelvalue(var_2097336a)) ? getuimodelvalue(var_2097336a) : -1);
}

// Namespace draft/frontend_draft
// Params 5, eflags: 0x1 linked
// Checksum 0x6dfe5df4, Offset: 0x9c8
// Size: 0x162
function show_cam(localclientnum, xcam, animname, lerpduration, force) {
    if (isdefined(level.var_84e5adfd) && level.var_84e5adfd) {
        return;
    }
    if (!isdefined(xcam) || !isdefined(animname)) {
        return;
    }
    if (!(isdefined(force) && force) && isdefined(level.var_368aaeb9) && level.var_368aaeb9 == animname && isdefined(level.var_df72fe54) && level.var_df72fe54 == xcam) {
        return;
    }
    draftstruct = struct::get(function_47569560(), "targetname");
    if (isdefined(draftstruct)) {
        playmaincamxcam(localclientnum, xcam, lerpduration, animname, "", draftstruct.origin, draftstruct.angles);
        level.var_368aaeb9 = animname;
        level.var_df72fe54 = xcam;
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0x4a3fcdae, Offset: 0xb38
// Size: 0x3a
function stop_cameras(localclientnum) {
    stopmaincamxcam(localclientnum);
    level.var_368aaeb9 = undefined;
    level.var_df72fe54 = undefined;
}

// Namespace draft/frontend_draft
// Params 3, eflags: 0x1 linked
// Checksum 0x705fe719, Offset: 0xb80
// Size: 0x44
function function_532dfc0b(localclientnum, lerpduration, force) {
    show_cam(localclientnum, level.var_482af62e, "cam_draft_zoom", lerpduration, force);
}

// Namespace draft/frontend_draft
// Params 3, eflags: 0x1 linked
// Checksum 0xd842026e, Offset: 0xbd0
// Size: 0x44
function function_e79c182b(localclientnum, lerpduration, force) {
    show_cam(localclientnum, level.var_bbb8810e, "cam_draft_ingame", lerpduration, force);
}

// Namespace draft/frontend_draft
// Params 2, eflags: 0x1 linked
// Checksum 0x331ec888, Offset: 0xc20
// Size: 0x84
function function_1cf2437c(localclientnum, var_121d6e9a) {
    if (!player_role::is_valid(var_121d6e9a)) {
        return;
    }
    player = function_5c10bd79(localclientnum);
    if (isdefined(player)) {
        player stopsounds();
        player dialog_shared::function_ad01601e(var_121d6e9a);
    }
}

// Namespace draft/frontend_draft
// Params 3, eflags: 0x1 linked
// Checksum 0xd9274019, Offset: 0xcb0
// Size: 0x3fa
function function_93a4f3c5(localclientnum, draftcharacter, characterselected = 0) {
    sessionmode = currentsessionmode();
    if (player_role::is_valid([[ draftcharacter ]]->function_82e05d64().focusedcharacterindex)) {
        var_3f83e0ee = character_customization::function_7474681d(localclientnum, sessionmode, [[ draftcharacter ]]->function_82e05d64().focusedcharacterindex);
        if (!character_customization::function_aa5382ed([[ draftcharacter ]]->function_82e05d64().var_435f68bc, var_3f83e0ee)) {
            return 0;
        }
        [[ draftcharacter ]]->function_82e05d64().var_435f68bc = var_3f83e0ee;
    } else if (!isdefined([[ draftcharacter ]]->function_82e05d64().var_435f68bc) || character_customization::function_aa5382ed([[ draftcharacter ]]->function_82e05d64().var_435f68bc, [[ draftcharacter ]]->function_82e05d64().var_c018da16)) {
        [[ draftcharacter ]]->function_82e05d64().var_435f68bc = [[ draftcharacter ]]->function_82e05d64().var_c018da16;
    } else {
        return 0;
    }
    var_e297151a = "scene_frontend_t8_mp_male_team_0";
    [[ draftcharacter ]]->set_character_mode(sessionmode);
    if (isdefined([[ draftcharacter ]]->function_82e05d64().var_435f68bc) && player_role::is_valid([[ draftcharacter ]]->function_82e05d64().var_435f68bc.charactertype)) {
        [[ draftcharacter ]]->function_15a8906a([[ draftcharacter ]]->function_82e05d64().var_435f68bc);
        [[ draftcharacter ]]->function_27945cb8(1);
        [[ draftcharacter ]]->show_model();
        var_fb564576 = [[ draftcharacter ]]->function_82e05d64().var_fb564576;
        characterindex = [[ draftcharacter ]]->function_82e05d64().var_435f68bc.charactertype;
        fields = getcharacterfields(characterindex, sessionmode);
        if (sessionmodeiszombiesgame()) {
            if (isdefined(fields) && isdefined(fields.var_e297151a)) {
                var_e297151a = fields.var_e297151a;
            }
        } else if (isdefined(fields) && isdefined(fields.lobbyscenes) && fields.lobbyscenes.size > 0) {
            var_e297151a = fields.lobbyscenes[var_fb564576 % fields.lobbyscenes.size].scene;
        }
    } else {
        [[ draftcharacter ]]->set_character_index(0);
        [[ draftcharacter ]]->function_77e3be08();
        [[ draftcharacter ]]->hide_model();
        if (isdefined([[ draftcharacter ]]->function_82e05d64().visible) && [[ draftcharacter ]]->function_82e05d64().visible) {
            [[ draftcharacter ]]->function_27945cb8(1);
        }
        return 0;
    }
    [[ draftcharacter ]]->function_82e05d64().params.scene = var_e297151a;
    return 1;
}

// Namespace draft/frontend_draft
// Params 4, eflags: 0x1 linked
// Checksum 0xd4809778, Offset: 0x10b8
// Size: 0x74
function function_71a9fb67(localclientnum, draftcharacter, isvalidxuid, characterselected = 0) {
    if (function_93a4f3c5(localclientnum, draftcharacter, characterselected)) {
        [[ draftcharacter ]]->update([[ draftcharacter ]]->function_82e05d64().params);
    }
}

// Namespace draft/frontend_draft
// Params 2, eflags: 0x1 linked
// Checksum 0x7e3cfa7d, Offset: 0x1138
// Size: 0x1d4
function function_f39eac8f(var_dde5862c, var_e1d25028) {
    var_3aabafe3 = [];
    foreach (i, xuid in var_dde5862c) {
        var_12088e2e = 0;
        for (j = 0; j < 5; j++) {
            luaindex = j + 1;
            draftclient = getuimodel(var_e1d25028, luaindex);
            xuidmodel = getuimodel(draftclient, "xuid");
            if (!isdefined(xuidmodel)) {
                continue;
            }
            var_f33ed25a = getuimodelvalue(xuidmodel);
            if (isdefined(var_f33ed25a) && var_f33ed25a == xuid) {
                var_3aabafe3[i] = luaindex;
                var_12088e2e = 1;
                break;
            }
        }
        if (!var_12088e2e) {
            for (j = 0; j < 5; j++) {
                luaindex = j + 1;
                if (!array::contains(var_3aabafe3, luaindex)) {
                    var_3aabafe3[i] = luaindex;
                    break;
                }
            }
        }
    }
    return var_3aabafe3;
}

// Namespace draft/frontend_draft
// Params 2, eflags: 0x1 linked
// Checksum 0x1b0103ae, Offset: 0x1318
// Size: 0x43e
function update_team(localclientnum, characterselected = 0) {
    self notify("46f4bab1cb07540e");
    self endon("46f4bab1cb07540e");
    session = currentsessionmode();
    if (session == 4) {
        return;
    } else if (session == 0) {
        var_dde5862c = function_664bca26(localclientnum, 1);
    } else {
        var_dde5862c = function_77ccb73(1);
    }
    for (var_e1d25028 = getuimodel(getuimodelforcontroller(localclientnum), "PositionDraftClients"); !isdefined(var_e1d25028); var_e1d25028 = getuimodel(getuimodelforcontroller(localclientnum), "PositionDraftClients")) {
        waitframe(1);
    }
    var_d63ec5a3 = function_f39eac8f(var_dde5862c, var_e1d25028);
    while (var_dde5862c.size < 5) {
        var_dde5862c[var_dde5862c.size] = 0;
        for (i = 0; i < 5; i++) {
            luaindex = i + 1;
            if (!array::contains(var_d63ec5a3, luaindex)) {
                var_d63ec5a3[var_dde5862c.size - 1] = luaindex;
                break;
            }
        }
    }
    for (i = 0; i < 5; i++) {
        if (!isdefined(level.draftcharacters[i])) {
            continue;
        }
        draftcharacter = level.draftcharacters[i];
        [[ draftcharacter ]]->function_82e05d64().var_c018da16 = undefined;
        if (isdefined(var_e1d25028)) {
            xuid = var_dde5862c[i];
            luaindex = var_d63ec5a3[i];
            var_e1881e64 = getuimodel(var_e1d25028, luaindex);
            [[ draftcharacter ]]->function_82e05d64().xuid = xuid;
            [[ draftcharacter ]]->function_82e05d64().var_c018da16 = function_5add6d0c(xuid);
            [[ draftcharacter ]]->function_82e05d64().visible = getuimodelvalue(getuimodel(var_e1881e64, "visible"));
            function_e1f85a64(draftcharacter, i, function_f701ad2a());
            focusedcharacterindex = undefined;
            isvalidxuid = xuid != 0;
            if (isvalidxuid && function_89e574c(xuid)) {
                var_2a860e73 = getuimodel(getuimodelforcontroller(localclientnum), "PositionDraft.focusedCharacterIndex");
                if (isdefined(var_2a860e73)) {
                    focusedcharacterindex = getuimodelvalue(var_2a860e73);
                    if (!player_role::is_valid(focusedcharacterindex)) {
                        focusedcharacterindex = undefined;
                    }
                }
            }
            [[ draftcharacter ]]->function_82e05d64().focusedcharacterindex = focusedcharacterindex;
            function_71a9fb67(localclientnum, draftcharacter, isvalidxuid, characterselected);
        }
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0xc491b410, Offset: 0x1760
// Size: 0x5e
function function_20811f66(localclientnum) {
    for (i = 0; i < level.draftcharacters.size; i++) {
        [[ level.draftcharacters[i] ]]->delete_models();
    }
    level.draftcharacters = [];
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0x4bbe7163, Offset: 0x17c8
// Size: 0x360
function setup_team(localclientnum) {
    function_20811f66(localclientnum);
    sessionmode = currentsessionmode();
    targetname = "draftCharacter";
    if (sessionmode == 3) {
        level.var_bbb8810e = #"hash_2598b6f5e72695c7";
        targetname = "WZdraftCharacter";
    } else if (sessionmode == 0) {
        level.var_bbb8810e = #"hash_590b617ac1441b1b";
        targetname = "ZMdraftCharacter";
    }
    var_9b6e828a = array::randomize(array(#"pb_launcher_alt_endgame_1stplace_idle", #"pb_sniper_endgame_1stplace_idle", #"pb_lmg_endgame_1stplace_idle"));
    for (i = 0; 1; i++) {
        var_3ec3c6aa = function_75442e78(i);
        if (!isdefined(var_3ec3c6aa)) {
            return;
        }
        if (!isdefined(level.draftcharacters[i])) {
            model = util::spawn_model(localclientnum, "tag_origin", var_3ec3c6aa.origin, var_3ec3c6aa.angles);
            model.targetname = targetname + i;
            level.draftcharacters[i] = character_customization::function_dd295310(model, localclientnum, 0);
            [[ level.draftcharacters[i] ]]->function_82e05d64().var_67f6171b = var_9b6e828a[i % var_9b6e828a.size];
            [[ level.draftcharacters[i] ]]->function_82e05d64().var_fb564576 = i;
            [[ level.draftcharacters[i] ]]->function_82e05d64().params = spawnstruct();
            [[ level.draftcharacters[i] ]]->function_82e05d64().params.sessionmode = sessionmode;
            [[ level.draftcharacters[i] ]]->function_82e05d64().params.scene_target = var_3ec3c6aa;
            [[ level.draftcharacters[i] ]]->function_82e05d64().params.var_a34c858c = 1;
            [[ level.draftcharacters[i] ]]->function_82e05d64().params.var_c76f3e47 = 1;
            [[ level.draftcharacters[i] ]]->function_82e05d64().params.var_401d9a1 = 1;
        }
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0x47ef549d, Offset: 0x1b30
// Size: 0x136
function function_a5644aa3(localclientnum) {
    self notify("7d76e12da1faca50");
    self endon("7d76e12da1faca50");
    level endon(#"disconnect", #"draft_closed");
    while (1) {
        level waittill(#"hash_4bb9479c29665c84");
        function_532dfc0b(localclientnum, 1000);
        level.var_e6802f10 = 1;
        waitresult = undefined;
        waitresult = level waittill(#"hash_4ef5fa5de0b8868b", #"hash_3f81f5a6c0c89878");
        if (waitresult._notify == #"hash_4ef5fa5de0b8868b") {
            function_e79c182b(localclientnum, 1000);
        } else {
            function_e79c182b(localclientnum, 0, 1);
        }
        level.var_e6802f10 = 0;
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0xb0332603, Offset: 0x1c70
// Size: 0x128
function function_9c896b69(localclientnum) {
    self notify("5b07248da504b6c9");
    self endon("5b07248da504b6c9");
    level endon(#"disconnect", #"draft_closed");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"positiondraft_update", #"positiondraft_reject", #"hash_6f2435126950e914");
        localclientnum = waitresult.localclientnum;
        if (waitresult._notify == #"hash_6f2435126950e914") {
            level childthread update_team(localclientnum, 1);
            level childthread function_1cf2437c(localclientnum, waitresult.characterindex);
            continue;
        }
        level childthread update_team(localclientnum, 0);
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0xa8008ae5, Offset: 0x1da0
// Size: 0x108
function function_4f269ca3(var_d0b01271) {
    gesture_index = randomint(350);
    var_bc8cfff8 = 0;
    if ([[ var_d0b01271 ]]->is_visible()) {
        for (i = 0; i < 10; i++) {
            gesture = [[ var_d0b01271 ]]->get_gesture(gesture_index);
            if (isdefined(gesture) && isdefined(gesture.animation)) {
                var_bc8cfff8 = 1;
                break;
            }
            gesture_index = randomint(350);
        }
        if (var_bc8cfff8) {
            thread [[ var_d0b01271 ]]->play_gesture(gesture_index, 1, 1, 0);
        }
    }
}

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0x5f3f7f5e, Offset: 0x1eb0
// Size: 0x5e
function cancel_spray() {
    if (isdefined([[ self ]]->function_82e05d64().var_5da50127)) {
        setuimodelvalue([[ self ]]->function_82e05d64().var_5da50127, -1);
    }
    self notify(#"cancel_spray");
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0x115bc234, Offset: 0x1f18
// Size: 0x7c
function function_66e7c332(index) {
    self notify("6f575c6893d429f0");
    self endon("6f575c6893d429f0");
    self endon(#"cancel_spray");
    setuimodelvalue([[ self ]]->function_82e05d64().var_5da50127, index);
    wait(5);
    self cancel_spray();
}

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0x960e826a, Offset: 0x1fa0
// Size: 0x628
function function_393e6d42() {
    self notify("367619e27fe3cbc2");
    self endon("367619e27fe3cbc2");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"positiondraft_playgesture");
        level.var_6963abdb[waitresult.xuid] = waitresult.gesture_index;
        var_f5f3ad67 = getdvarint(#"lobby_gestures_enabled", 0) == 2;
        if (var_f5f3ad67) {
            foreach (var_d0b01271 in level.draftcharacters) {
                var_2d0192e5 = [[ var_d0b01271 ]]->function_82e05d64();
                if (isdefined(var_2d0192e5)) {
                    function_4f269ca3(var_d0b01271);
                }
            }
            if (isdefined(level.var_6f1da91a)) {
                var_3a76595 = level.var_6f1da91a[function_f701ad2a()];
                if (isdefined(var_3a76595)) {
                    foreach (var_61d77bf6 in var_3a76595) {
                        if (isdefined(var_61d77bf6) && isdefined(var_61d77bf6.character)) {
                            function_4f269ca3(var_61d77bf6.character);
                        }
                    }
                }
            }
            continue;
        }
        foreach (var_d0b01271 in level.draftcharacters) {
            var_2d0192e5 = [[ var_d0b01271 ]]->function_82e05d64();
            if (isdefined(var_2d0192e5) && isdefined(var_2d0192e5.xuid)) {
                xuid = xuidtostring(var_2d0192e5.xuid);
                if (xuid === waitresult.xuid) {
                    if (waitresult.gesture_index == -1) {
                        var_d0b01271 notify(#"cancel_gesture");
                        character_customization::function_bee62aa1(var_d0b01271);
                        var_d0b01271 cancel_spray();
                    } else if (function_b72088f(waitresult.gesture_index)) {
                        thread [[ var_d0b01271 ]]->play_gesture(waitresult.gesture_index, 1, 1, 0);
                        var_d0b01271 cancel_spray();
                    } else {
                        var_d0b01271 notify(#"cancel_gesture");
                        character_customization::function_bee62aa1(var_d0b01271);
                        var_d0b01271 thread function_66e7c332(waitresult.gesture_index);
                        thread [[ var_d0b01271 ]]->play_gesture(-1, 1, 1, 0);
                    }
                    break;
                }
            }
        }
        if (isdefined(level.var_6f1da91a)) {
            var_3a76595 = level.var_6f1da91a[function_f701ad2a()];
            if (isdefined(var_3a76595)) {
                foreach (var_61d77bf6 in var_3a76595) {
                    if (isdefined(var_61d77bf6) && isdefined(var_61d77bf6.character) && var_61d77bf6.character._xuid === waitresult.xuid) {
                        var_d0b01271 = var_61d77bf6.character;
                        if (waitresult.gesture_index == -1) {
                            var_d0b01271 notify(#"cancel_gesture");
                            character_customization::function_bee62aa1(var_d0b01271);
                            var_d0b01271 cancel_spray();
                        } else if (function_b72088f(waitresult.gesture_index)) {
                            thread [[ var_d0b01271 ]]->play_gesture(waitresult.gesture_index, 1, 1, 0);
                            var_d0b01271 cancel_spray();
                        } else {
                            var_d0b01271 notify(#"cancel_gesture");
                            character_customization::function_bee62aa1(var_d0b01271);
                            var_d0b01271 thread function_66e7c332(waitresult.gesture_index);
                            thread [[ var_d0b01271 ]]->play_gesture(-1, 1, 1, 0);
                        }
                        break;
                    }
                }
            }
        }
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0x77806054, Offset: 0x25d0
// Size: 0x98
function function_37313c1b(localclientnum) {
    self notify("58006327a1d63bff");
    self endon("58006327a1d63bff");
    level endon(#"disconnect", #"draft_closed");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"hash_8946580b1303e30");
        function_e79c182b(localclientnum, 0, 1);
    }
}

// Namespace draft/frontend_draft
// Params 1, eflags: 0x1 linked
// Checksum 0xd9f70492, Offset: 0x2670
// Size: 0xf4
function function_9afd868e(localclientnum) {
    self notify("2a36a3356b6e1b6f");
    self endon("2a36a3356b6e1b6f");
    self endon(#"draft_closed");
    if (!(isdefined(level.draftactive) && level.draftactive)) {
        level.draftactive = 1;
        setup_team(localclientnum);
        function_e79c182b(localclientnum, 0);
        level thread function_9c896b69(localclientnum);
        level thread function_a5644aa3(localclientnum);
        level thread function_37313c1b(localclientnum);
        level childthread update_team(localclientnum);
    }
}

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0x4cff5d1f, Offset: 0x2770
// Size: 0x78
function function_ca03ab69() {
    level endon(#"disconnect");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"positiondraft_open");
        localclientnum = waitresult.localclientnum;
        function_9afd868e(localclientnum);
    }
}

// Namespace draft/frontend_draft
// Params 0, eflags: 0x1 linked
// Checksum 0xc8a46ec0, Offset: 0x27f0
// Size: 0x114
function function_91858511() {
    level endon(#"disconnect");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"positiondraft_close");
        localclientnum = waitresult.localclientnum;
        if (isdefined(level.draftactive) && level.draftactive) {
            level notify(#"draft_closed");
            function_20811f66(localclientnum);
            stop_cameras(localclientnum);
            level.draftactive = 0;
            level.var_6963abdb = [];
            if (isdefined(waitresult.var_b69dc9af) && waitresult.var_b69dc9af) {
                level notify(#"hash_21c79522aa982cdd");
            }
        }
    }
}

