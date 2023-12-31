// Atian COD Tools GSC decompiler test
#using scripts\core\gametypes\frontend_draft.csc;
#using scripts\core\gametypes\frontend_blackmarket.csc;
#using script_7ca3324ffa5389e4;
#using scripts\core_common\lui_shared.csc;
#using scripts\core_common\character_customization.csc;
#using scripts\core_common\struct.csc;
#using scripts\mp_common\devgui.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\postfx_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\exploder_shared.csc;
#using scripts\core_common\weapon_customization_icon.csc;
#using scripts\core_common\math_shared.csc;
#using scripts\core_common\custom_class.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\array_shared.csc;
#using scripts\core_common\animation_shared.csc;
#using scripts\core_common\activecamo_shared.csc;

#namespace frontend;

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xb46e33c2, Offset: 0xd00
// Size: 0x9e
function function_9bfe9255(var_f75a02ea, mode) {
    var_a2865de6 = getplayerroletemplatecount(mode);
    for (i = 0; i < var_a2865de6; i++) {
        var_eb49090f = function_b14806c6(i, mode);
        if (isdefined(var_eb49090f) && var_eb49090f == var_f75a02ea) {
            return i;
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x173ad2b3, Offset: 0xda8
// Size: 0x52
function function_b7d4bfd9(var_4fa755f8, var_3f0e790b = 0) {
    if (!isdefined(var_4fa755f8)) {
        return undefined;
    }
    switch (var_3f0e790b) {
    case 1:
        return var_4fa755f8.arenalobbyscenes;
    case 0:
    default:
        return var_4fa755f8.lobbyscenes;
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x1d5ec1ca, Offset: 0xe40
// Size: 0xb8
function function_b9f8bbd9(character_index, session_mode) {
    if (session_mode == 4) {
        return 0;
    }
    if (!function_f4bf7e3f(character_index, session_mode)) {
        return 0;
    }
    fields = getcharacterfields(character_index, session_mode);
    if (!isdefined(fields)) {
        return 0;
    }
    scenes = function_b7d4bfd9(fields, session_mode);
    if (!isdefined(scenes) || scenes.size == 0) {
        return 0;
    }
    return 1;
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xbe02b61a, Offset: 0xf00
// Size: 0xe2
function function_8d1cae0b(character_index, session_mode) {
    if (!function_b9f8bbd9(character_index, session_mode)) {
        return 0;
    }
    if (session_mode == 3) {
        fields = getplayerrolefields(character_index, session_mode);
        return (isdefined(fields.isdefaultcharacter) && fields.isdefaultcharacter);
    }
    characterfields = getcharacterfields(character_index, session_mode);
    if (isdefined(characterfields.requireddvar) && !getdvarint(characterfields.requireddvar, 0)) {
        return 0;
    }
    return 1;
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x9c530846, Offset: 0xff0
// Size: 0x246
function function_e3efec59(xuid, session_mode) {
    if (!isdefined(level.var_dd1c817)) {
        level.var_dd1c817 = [];
    }
    if (!isdefined(level.var_dd1c817[session_mode])) {
        level.var_dd1c817[session_mode] = [];
    }
    character_index = undefined;
    if (function_89e574c(xuid) && isdefined(level.var_be02eda3) && level.var_e362b5d9[level.var_be02eda3].mode == session_mode && function_b9f8bbd9(level.var_e362b5d9[level.var_be02eda3].role_index, session_mode)) {
        character_index = level.var_e362b5d9[level.var_be02eda3].role_index;
    } else if (isdefined(level.var_dd1c817[session_mode][xuid])) {
        character_index = level.var_dd1c817[session_mode][xuid];
    } else {
        var_a2865de6 = getplayerroletemplatecount(session_mode);
        attempts = 0;
        while (1) {
            character_index = randomint(var_a2865de6);
            if (function_8d1cae0b(character_index, session_mode)) {
                break;
            } else {
                attempts++;
                if (attempts > 3) {
                    character_index = undefined;
                    for (ci = 0; ci < var_a2865de6; ci++) {
                        if (function_8d1cae0b(ci, session_mode)) {
                            character_index = ci;
                            break;
                        }
                    }
                    break;
                }
            }
        }
    }
    level.var_dd1c817[session_mode][xuid] = character_index;
    return level.var_dd1c817[session_mode][xuid];
}

// Namespace frontend/frontend
// Params 4, eflags: 0x1 linked
// Checksum 0x72d3d9b, Offset: 0x1240
// Size: 0x280
function function_3a965fac(scene_name, prt, mode, fields) {
    var_8b15a963 = function_9bfe9255(prt, mode);
    if (isdefined(var_8b15a963)) {
        var_f8a2729f = !(isdefined(fields.var_819846c7) && fields.var_819846c7);
        var_7accf7bb = {#isdefault:isdefined(fields.var_c6376b99) && fields.var_c6376b99, #fields:fields, #mode:mode, #list_index:level.var_e362b5d9.size, #role_index:var_8b15a963, #dvar:fields.requireddvar, #var_f8a2729f:var_f8a2729f, #prt:prt, #scene:scene_name};
        if (!isdefined(level.var_e362b5d9)) {
            level.var_e362b5d9 = [];
        } else if (!isarray(level.var_e362b5d9)) {
            level.var_e362b5d9 = array(level.var_e362b5d9);
        }
        level.var_e362b5d9[level.var_e362b5d9.size] = var_7accf7bb;
        if (mode == 1) {
            scene_shots = scene::get_all_shot_names(scene_name, undefined, 1);
            foreach (shot in scene_shots) {
                scene::add_scene_func(scene_name, &function_ebc650f4, shot, scene_name, shot);
            }
        }
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x76291065, Offset: 0x14c8
// Size: 0x10e
function function_89c6128e(mode) {
    for (index = 0; index < getplayerroletemplatecount(mode); index++) {
        fields = getcharacterfields(index, mode);
        if (isdefined(fields) && isdefined(fields.var_4c65efc8)) {
            var_200be221 = struct::get_script_bundle("scene", fields.var_4c65efc8);
            if (isdefined(var_200be221)) {
                var_3c6fd4f7 = function_b14806c6(index, mode);
                /#
                    var_3c6fd4f7 = function_9e72a96(var_3c6fd4f7);
                #/
                function_3a965fac(fields.var_4c65efc8, var_3c6fd4f7, mode, fields);
            }
        }
    }
}

// Namespace frontend/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x307ce45e, Offset: 0x15e0
// Size: 0x15c
function event_handler[gametype_init] main(eventstruct) {
    draft::init();
    level.callbackentityspawned = &entityspawned;
    level.callbacklocalclientconnect = &localclientconnect;
    level.orbis = getdvarstring(#"orbisgame") == "true";
    level.durango = getdvarstring(#"durangogame") == "true";
    customclass::init();
    level.var_e362b5d9 = array();
    function_89c6128e(1);
    function_89c6128e(0);
    function_89c6128e(3);
    level thread blackscreen_watcher();
    setstreamerrequest(1, "core_frontend");
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x85e48b78, Offset: 0x1748
// Size: 0x84
function function_e843475e(localclientnum, menuname) {
    lui::createcameramenu(menuname, localclientnum, #"tag_align_frontend_background", #"hash_64fa56583c3b00bd");
    lui::function_9d7ab167(menuname, localclientnum, 3, #"wz_inspection_struct", #"hash_191c3f4fc94449f1");
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x7e0286c4, Offset: 0x17d8
// Size: 0x1570
function setupclientmenus(localclientnum) {
    lui::initmenudata(localclientnum);
    lui::createcustomcameramenu("Main", localclientnum, &lobby_main, 1, undefined, &function_58994f4a);
    lui::createcustomcameramenu("LobbyInspection", localclientnum, &handle_inspect_player, 0, &start_character_rotating_any, &end_character_rotating_any);
    lui::linktocustomcharacter("LobbyInspection", localclientnum, "inspection_character", 0);
    lui::createcustomcameramenu("SinglePlayerInspection", localclientnum, &handle_inspect_player, 0, &start_character_rotating_any, &end_character_rotating_any);
    lui::linktocustomcharacter("SinglePlayerInspection", localclientnum, "inspection_character", 0);
    lui::createcustomcameramenu("ChooseTaunts", localclientnum, &choose_taunts_camera_watch, 0);
    lui::linktocustomcharacter("ChooseTaunts", localclientnum, "character_customization");
    lui::createcameramenu("ChooseFaction", localclientnum, #"spawn_char_custom", #"ui_cam_character_customization", "cam_helmet", undefined, undefined, undefined, 1000);
    lui::createcustomcameramenu("Paintshop", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("PaintjobWeaponSelect", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("Gunsmith", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("MyShowcase", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("Community", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("MyShowcase_Paintjobs", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("MyShowcase_Variants", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("MyShowcase_Emblems", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("MyShowcase_CategorySelector", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("GroupHeadquarters", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("MediaManager", localclientnum, undefined, 0, undefined, undefined);
    lui::createcameramenu("WeaponBuildKits", localclientnum, #"zm_weapon_position", #"ui_cam_cac_specialist", "cam_specialist", undefined, undefined, undefined);
    lui::createcameramenu("CombatRecordWeaponsZM", localclientnum, #"zm_weapon_position", #"ui_cam_cac_specialist", "cam_specialist", undefined, undefined, undefined);
    lui::createcameramenu("BubblegumBuffs", localclientnum, #"loadout_camera", #"c_fe_zm_megachew_vign_camera_2", "c_fe_zm_megachew_vign_camera_2", undefined, undefined, undefined);
    lui::createcameramenu("BubblegumPacks", localclientnum, #"loadout_camera", #"c_fe_zm_megachew_vign_camera_2", "c_fe_zm_megachew_vign_camera_2");
    lui::createcustomcameramenu("BubblegumPackEdit", localclientnum, undefined, undefined, undefined, undefined);
    lui::createcustomcameramenu("BubblegumBuffSelect", localclientnum, undefined, undefined, undefined, undefined);
    lui::createcustomcameramenu("CombatRecordBubblegumBuffs", localclientnum, undefined, undefined, undefined, undefined);
    lui::createcameramenu("MegaChewFactory", localclientnum, #"zm_gum_position", #"c_fe_zm_megachew_vign_camera", "default", undefined, undefined, undefined);
    lui::createcustomcameramenu("Pregame_Main", localclientnum, &lobby_main, 1);
    lui::createcustomcameramenu("CombatRecordWeapons", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("CombatRecordEquipment", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("CombatRecordCybercore", localclientnum, undefined, 0, undefined, undefined);
    lui::createcustomcameramenu("CombatRecordCollectibles", localclientnum, undefined, 0, undefined, undefined);
    lui::createcameramenu("CombatRecordSpecialists", localclientnum, #"spawn_char_cac_choose", #"ui_cam_cac_specialist", "cam_specialist", undefined, &open_choose_class, &close_choose_class);
    lui::linktocustomcharacter("CombatRecordSpecialists", localclientnum, "character_customization");
    lui::createcameramenu("MPCustomizeClassMenu", localclientnum, #"cac_specialist_angle", #"ui_cam_loadout_character", "");
    lui::createcustomcameramenu("AAR_T8_MP", localclientnum, &function_73b8462a, 1, undefined, &function_48fb04a7);
    lui::linktocustomcharacter("AAR_T8_MP", localclientnum, "aar_character");
    lui::createcustomcameramenu("AAR_T8_ZM", localclientnum, &function_73b8462a, 1, undefined, &function_48fb04a7);
    lui::linktocustomcharacter("AAR_T8_ZM", localclientnum, "aar_character");
    lui::createcustomcameramenu("AAR_T8_WZ", localclientnum, &function_73b8462a, 1, undefined, &function_48fb04a7);
    lui::linktocustomcharacter("AAR_T8_WZ", localclientnum, "aar_character");
    lui::createcustomcameramenu("AAR_T8_ARENA", localclientnum, &function_73b8462a, 1, undefined, &function_48fb04a7);
    lui::linktocustomcharacter("AAR_T8_ARENA", localclientnum, "aar_character");
    lui::createcustomcameramenu("AARMissionRewardOverlay", localclientnum, &function_f8cec907, 1, undefined, &end_character_rotating);
    lui::linktocustomcharacter("AARMissionRewardOverlay", localclientnum, "specialist_customization");
    function_e843475e(localclientnum, "Social_Main");
    function_e843475e(localclientnum, "SupportSelection");
    function_e843475e(localclientnum, "DirectorPersonalizeCharacterMP");
    function_e843475e(localclientnum, "MPSpecialistHUB");
    function_e843475e(localclientnum, "MPSpecialistHUBWeapons");
    function_e843475e(localclientnum, "EmblemSelect");
    function_e843475e(localclientnum, "EmblemChooseIcon");
    function_e843475e(localclientnum, "EmblemEditor");
    function_e843475e(localclientnum, "Store");
    function_e843475e(localclientnum, "Store_DLC");
    function_e843475e(localclientnum, "DirectorFindGame");
    function_e843475e(localclientnum, "ZMPersonalizeCharacterMain");
    function_e843475e(localclientnum, "WZPersonalizeCharacterMain");
    lui::createcustomcameramenu("MPSpecialistHUBInspect", localclientnum, &function_25b060af, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("MPSpecialistHUBInspect", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("directorTraining", localclientnum, &function_25b060af, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("directorTraining", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("PersonalizeCharacter", localclientnum, &function_6657c529, 1, &start_character_rotating, array(&end_character_rotating, &function_a72640b3));
    lui::linktocustomcharacter("PersonalizeCharacter", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("ZMPersonalizeCharacter", localclientnum, &function_d8402f0c, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("ZMPersonalizeCharacter", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("MPSpecialistHUBGestures", localclientnum, &function_9602c423, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("MPSpecialistHUBGestures", localclientnum, "specialist_customization");
    function_e843475e(localclientnum, "MPSpecialistHUBTags");
    lui::createcustomcameramenu("MPSpecialistHUBPreviewMoment", localclientnum, &function_3dde055b, 0, undefined, &function_c4db2740);
    lui::linktocustomcharacter("MPSpecialistHUBPreviewMoment", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("ItemShopDetails", localclientnum, &function_837446a8, 1, array(&function_98088878), array(&end_character_rotating, &function_7142469f));
    lui::linktocustomcharacter("ItemShopDetails", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("ItemShopDetailsSunset", localclientnum, &function_837446a8, 1, array(&function_98088878), array(&end_character_rotating, &function_7142469f));
    lui::linktocustomcharacter("ItemShopDetailsSunset", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("QuarterMasterMenu", localclientnum, &function_837446a8, 1, array(&function_98088878, &blackmarket::function_78a5c895), array(&end_character_rotating, &function_7142469f, &blackmarket::function_c46c0287));
    lui::linktocustomcharacter("QuarterMasterMenu", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("ContractDetails", localclientnum, &function_837446a8, 1, array(&function_98088878), array(&end_character_rotating, &function_7142469f));
    lui::linktocustomcharacter("ContractDetails", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("ContractDetailsSunset", localclientnum, &function_837446a8, 1, array(&function_98088878), array(&end_character_rotating, &function_7142469f));
    lui::linktocustomcharacter("ContractDetailsSunset", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("BlackMarketBountyDetails", localclientnum, &function_837446a8, 1, array(&function_98088878), array(&end_character_rotating, &function_7142469f));
    lui::linktocustomcharacter("BlackMarketBountyDetails", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("PersonalizeDefaultWZCharacter", localclientnum, &function_36962bc4, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("PersonalizeDefaultWZCharacter", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("WZPersonalizeCharacterInspect", localclientnum, &function_8ad37038, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("WZPersonalizeCharacterInspect", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("WZPersonalizeCharacter", localclientnum, &wz_personalize_character, 1, &start_character_rotating, &end_character_rotating);
    lui::linktocustomcharacter("WZPersonalizeCharacter", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("WeaponBribeSelection", localclientnum, &function_837446a8, 1, array(&function_98088878), array(&end_character_rotating, &function_7142469f));
    lui::linktocustomcharacter("WeaponBribeSelection", localclientnum, "specialist_customization");
    lui::createcustomcameramenu("WZJumpKitSelector", localclientnum, &function_bc98f036);
    lui::createcustomcameramenu("DirectorChangeCharacter", localclientnum, &function_d252281d, 0, undefined, undefined);
    lui::createcustomcameramenu("WeaponDeathFxSelect", localclientnum, &function_ac9a8cf, 0, &start_character_rotating, array(&function_5e7dcbed, &end_character_rotating));
    lui::linktocustomcharacter("WeaponDeathFxSelect", localclientnum, "specialist_customization");
    var_eeef11ce = "scene_frontend_t8_zombies";
    scene::add_scene_func(var_eeef11ce, &function_2f93d681, "init");
    scene::add_scene_func(var_eeef11ce, &function_1bff2e73, "stop");
    var_5ef5aa96 = "scene_frontend_arena_team";
    scene::add_scene_func(var_5ef5aa96, &function_fad4ce33, "init");
    scene::add_scene_func(var_5ef5aa96, &function_c5cbf7d6, "stop");
    var_a2999da1 = scene::get_all_shot_names(var_eeef11ce, undefined, 1);
    foreach (shot in var_a2999da1) {
        scene::add_scene_func(var_eeef11ce, &function_12f56a9, shot);
    }
}

// Namespace frontend/frontend
// Params 0, eflags: 0x1 linked
// Checksum 0xf32523ce, Offset: 0x2d50
// Size: 0x168
function blackscreen_watcher() {
    blackscreenuimodel = createuimodel(getglobaluimodel(), "hideWorldForStreamer");
    setuimodelvalue(blackscreenuimodel, 1);
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"streamer_change");
        var_d0b01271 = waitresult.var_d0b01271;
        setuimodelvalue(blackscreenuimodel, 1);
        wait(0.1);
        while (1) {
            charready = 1;
            if (isdefined(var_d0b01271)) {
                charready = [[ var_d0b01271 ]]->is_streamed();
            }
            sceneready = getstreamerrequestprogress(0) >= 100;
            if (charready && sceneready) {
                break;
            }
            wait(0.1);
        }
        setuimodelvalue(blackscreenuimodel, 0);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0x47ab034c, Offset: 0x2ec0
// Size: 0x78
function streamer_change(hint, var_d0b01271) {
    if (isdefined(hint)) {
        setstreamerrequest(0, hint);
    } else {
        clearstreamerrequest(0);
    }
    level notify(#"streamer_change", {#var_d0b01271:var_d0b01271});
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xa328c3be, Offset: 0x2f40
// Size: 0x128
function handle_inspect_player(localclientnum, menu_name) {
    level endon(#"disconnect");
    level endon(menu_name + "_closed");
    level thread scene::play("scene_frontend_inspection_camera", "inspection_full");
    level thread function_b885d47c(menu_name, localclientnum);
    level thread function_37304ace(localclientnum, menu_name);
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"inspect_player");
        /#
            assert(isdefined(waitresult.xuid));
        #/
        level childthread update_inspection_character(localclientnum, waitresult.xuid, menu_name);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x81c66db9, Offset: 0x3070
// Size: 0x5c
function function_b885d47c(menu_name, localclientnum) {
    level waittill(menu_name + "_closed");
    level thread scene::stop("scene_frontend_inspection_camera");
    level.var_44011752 hide();
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xcd21cec7, Offset: 0x30d8
// Size: 0x4c8
function update_inspection_character(localclientnum, xuid, menu_name) {
    self notify("adfb62bb15c5d46");
    self endon("adfb62bb15c5d46");
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    var_a708693a = isdefined(level.draftcharacters) && level.draftcharacters.size > 0;
    if (var_a708693a) {
        foreach (character in level.draftcharacters) {
            info = [[ character ]]->function_82e05d64();
            if (isdefined(info) && util::function_48e57e36(xuid) == info.xuid) {
                var_23904c1d = [[ character ]]->function_e599283f();
            }
        }
    }
    if (!isdefined(var_23904c1d)) {
        var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
    }
    if (!isdefined(var_23904c1d)) {
        [[ var_d0b01271 ]]->function_1ec9448d(1);
        [[ var_d0b01271 ]]->function_27945cb8(1);
        params = {#anim_name:[[ var_d0b01271 ]]->function_8144231c()};
        [[ var_d0b01271 ]]->update(params);
        for (var_ed7308ad = 0; !isdefined(var_23904c1d) && var_ed7308ad < 15; var_ed7308ad++) {
            wait(1);
            var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
        }
        [[ var_d0b01271 ]]->function_1ec9448d(0);
        [[ var_d0b01271 ]]->function_27945cb8(0);
    }
    session_mode = currentsessionmode();
    if (!isdefined(var_23904c1d) || !var_a708693a && !function_8d1cae0b(var_23904c1d.charactertype, var_23904c1d.charactermode) || session_mode != 4 && var_23904c1d.charactermode != session_mode) {
        if (session_mode == 4 || session_mode == 2) {
            session_mode = 1;
            if (getplayerroletemplatecount(session_mode) == 0) {
                session_mode = 3;
            }
            if (getplayerroletemplatecount(session_mode) == 0) {
                session_mode = 0;
            }
        }
        character_index = function_e3efec59(xuid, session_mode);
        if (isdefined(character_index)) {
            level.var_dd1c817[xuid] = character_index;
            var_23904c1d = character_customization::function_3f5625f1(session_mode, character_index);
            fields = getcharacterfields(character_index, session_mode);
        }
    } else {
        fields = getcharacterfields(var_23904c1d.charactertype, var_23904c1d.charactermode);
    }
    var_8e0277a = undefined;
    if (isdefined(fields)) {
        var_8e0277a = fields.var_2081b2ed;
    }
    if (isdefined(var_8e0277a) && character_customization::function_aa5382ed([[ var_d0b01271 ]]->function_e599283f(), var_23904c1d)) {
        [[ var_d0b01271 ]]->function_1ec9448d(0);
        params = {#scene:var_8e0277a, #var_c76f3e47:1, #var_401d9a1:1};
        [[ var_d0b01271 ]]->function_15a8906a(var_23904c1d);
        [[ var_d0b01271 ]]->update(params);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xaba9424, Offset: 0x35a8
// Size: 0x198
function function_37304ace(localclientnum, menu_name) {
    level endon(#"disconnect");
    level endon(menu_name + "_closed");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"hash_6d381d5ecca233c6");
        if (isdefined(waitresult.clear_weapon) && waitresult.clear_weapon) {
            level.var_44011752 hide();
            level thread scene::stop(#"scene_frontend_inspection_weapon");
        } else {
            /#
                assert(isdefined(waitresult.weapon));
            #/
            /#
                assert(isdefined(waitresult.attachments));
            #/
            /#
                assert(isdefined(waitresult.camoindex));
            #/
            /#
                assert(isdefined(waitresult.paintjobslot));
            #/
            /#
                assert(isdefined(waitresult.weaponmodelslot));
            #/
            level childthread function_daa3f7d0(localclientnum, waitresult, 1);
        }
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x3e0c8f2a, Offset: 0x3748
// Size: 0x2cc
function function_daa3f7d0(localclientnum, weaponinfo, should_update_weapon_options = 1) {
    newweaponstring = weaponinfo.weapon;
    var_f020955 = weaponinfo.attachments;
    current_weapon = getweapon(newweaponstring, strtok(var_f020955, "+"));
    if (isdefined(current_weapon) && isdefined(level.var_44011752)) {
        if (level scene::is_playing(#"scene_frontend_inspection_weapon")) {
            level.var_44011752 show();
            level thread scene::stop(#"scene_frontend_inspection_weapon");
        }
        wait(0.1);
        info = function_f2f10929(current_weapon);
        render_options = function_140a6212(weaponinfo.camoindex, 0, weaponinfo.weaponmodelslot, 0, 0, 0);
        level.var_44011752 useweaponmodel(current_weapon, undefined, render_options);
        level.var_44011752 setscale(info.scale);
        level.var_44011752.targetname = "customized_inspection_weapon";
        level.var_44011752 useanimtree("generic");
        position = struct::get(#"tag_align_inspection_weapon1");
        origin = position.origin + info.offset;
        angles = position.angles + info.angles;
        level.var_44011752 thread animation::play(#"hash_3689442490c2e5dd", origin, angles);
        level thread scene::play(#"scene_frontend_inspection_weapon", "inspection_weapon_full");
        level.var_44011752 show();
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0xca3bda2, Offset: 0x3a20
// Size: 0xc
function entityspawned(localclientnum) {
    
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x7859d00b, Offset: 0x3a38
// Size: 0x324
function function_c9f8c5e9(localclientnum) {
    /#
        var_663588d = "Store";
        var_408e7d77 = -1;
        foreach (i, scene in level.var_e362b5d9) {
            var_2b58d8c0 = "WZPersonalizeCharacterInspect";
            switch (scene.mode) {
            case 2:
                var_2b58d8c0 = "WZJumpKitSelector";
                break;
            case 1:
                var_2b58d8c0 = "scene_frontend_arena_team";
                break;
            case 3:
                var_2b58d8c0 = "+";
                break;
            case 0:
                var_2b58d8c0 = "cycle_frozen_moment_char_current";
                break;
            }
            var_34415027 = var_663588d + var_2b58d8c0 + scene.prt;
            adddebugcommand(localclientnum, "frontend" + var_34415027 + "cam_eyes" + i + "1e968675840551ec");
        }
        while (1) {
            wait(0.1);
            var_879980c4 = getdvarint(#"hash_563d2a49168a665c", -1);
            if (var_879980c4 != var_408e7d77) {
                var_f44acc91 = level.var_e362b5d9[var_879980c4];
                var_d53ddee1 = function_25f808c9(localclientnum, var_f44acc91.mode, var_f44acc91.role_index);
                if (!isdefined(var_d53ddee1)) {
                    var_d53ddee1 = character_customization::function_3f5625f1(var_f44acc91.mode, var_f44acc91.role_index);
                }
                level thread function_a71254a9(localclientnum, 1, var_d53ddee1, 0, undefined, 0, var_f44acc91.scene);
                var_408e7d77 = var_879980c4;
                if (level.var_e362b5d9[var_879980c4].scene == #"scene_frontend_zm_elixir_lab" && isdefined(level.var_1a2c5c75)) {
                    level thread [[ level.var_1a2c5c75 ]](localclientnum);
                } else {
                    level notify(#"hash_79bbc4f96a28b094");
                }
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0xd6f9a020, Offset: 0x3d68
// Size: 0x182
function function_da10fc8f(localclientnum, var_da239274) {
    /#
        var_38b900c2 = getent(localclientnum, "j_neck", "<unknown string>");
        var_51a0f339 = getent(localclientnum, "<unknown string>", "<unknown string>");
        var_38b900c2 show();
        var_51a0f339 hide();
        function_45180840(localclientnum);
        do {
            waitframe(1);
        } while(function_6911e8d(localclientnum));
        var_38b900c2 hide();
        var_51a0f339 show();
        waitframe(1);
        function_c6df7fed(localclientnum);
        do {
            waitframe(1);
        } while(function_6911e8d(localclientnum));
        function_84469b54(var_da239274);
        var_38b900c2 show();
        var_51a0f339 hide();
        waitframe(1);
    #/
}

// Namespace frontend/frontend
// Params 4, eflags: 0x0
// Checksum 0x93fb08eb, Offset: 0x3ef8
// Size: 0x254
function function_93ccf33d(var_62d90151, var_71bac06, &var_37451b86, &var_7f0244ba) {
    /#
        foreach (i, item in var_62d90151) {
            entry = {#item:item, #type:var_71bac06, #index:i};
            if (isdefined(var_37451b86[item.name])) {
                if (!isdefined(var_37451b86[item.name].options[var_71bac06])) {
                    var_37451b86[item.name].options[var_71bac06] = [];
                } else if (!isarray(var_37451b86[item.name].options[var_71bac06])) {
                    var_37451b86[item.name].options[var_71bac06] = array(var_37451b86[item.name].options[var_71bac06]);
                }
                var_37451b86[item.name].options[var_71bac06][var_37451b86[item.name].options[var_71bac06].size] = entry;
            } else if (i != 0) {
                if (!isdefined(var_7f0244ba)) {
                    var_7f0244ba = [];
                } else if (!isarray(var_7f0244ba)) {
                    var_7f0244ba = array(var_7f0244ba);
                }
                var_7f0244ba[var_7f0244ba.size] = entry;
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 7, eflags: 0x0
// Checksum 0x652c7ffa, Offset: 0x4158
// Size: 0x31c
function function_23bc6f08(localclientnum, var_d0b01271, itemtype, item_data, mode, character_index, var_b34f01f0) {
    /#
        if (item_data.lootid == #"") {
            return;
        }
        switch (itemtype) {
        case 1:
            
        case 2:
            shot_name = "<unknown string>";
            break;
        case 3:
            shot_name = "<unknown string>";
            break;
        case 7:
            shot_name = "<unknown string>";
            break;
        case 6:
            shot_name = "<unknown string>";
            break;
        case 0:
            shot_name = "<unknown string>";
            break;
        case 4:
            shot_name = "<unknown string>";
            break;
        default:
            shot_name = "<unknown string>";
            break;
        }
        scene_name = #"scene_frontend_character_male_render";
        if (#"female" == getherogender(character_index, mode)) {
            scene_name = #"scene_frontend_character_female_render";
        }
        [[ var_d0b01271 ]]->update({#scene_shot:shot_name, #scene:scene_name, #var_13fb1841:4, #var_5bd51249:8, #var_c76f3e47:1});
        do {
            wait(0.5);
        } while(![[ var_d0b01271 ]]->function_ea4ac9f8());
        var_f75a02ea = function_9e72a96(function_b14806c6(character_index, mode));
        if (var_b34f01f0) {
            shot_name = "<unknown string>" + var_f75a02ea + "<unknown string>" + function_9e72a96(item_data.lootid) + "<unknown string>";
        } else {
            shot_name = "<unknown string>" + var_f75a02ea + "<unknown string>" + function_9e72a96(item_data.lootid) + "<unknown string>";
        }
        function_da10fc8f(localclientnum, shot_name);
    #/
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0x6d644e5, Offset: 0x4480
// Size: 0xb0
function function_2351cba1(itemtype, mode) {
    /#
        switch (itemtype) {
        case 1:
            return 0;
        case 0:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
            return (mode != 1);
            break;
        }
        return 1;
    #/
}

// Namespace frontend/frontend
// Params 3, eflags: 0x0
// Checksum 0x19d9877f, Offset: 0x4538
// Size: 0x8ac
function function_4920c25a(localclientnum, menu_name, state) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        function_25485718();
        var_38b900c2 = getent(localclientnum, "j_neck", "<unknown string>");
        var_51a0f339 = getent(localclientnum, "<unknown string>", "<unknown string>");
        var_38b900c2 show();
        var_51a0f339 hide();
        args = strtok(state, "<unknown string>");
        mode = int(args[0]);
        character_index = int(args[1]);
        outfit_index = int(args[2]);
        var_7823b8b1 = int(args[3]);
        var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
        [[ var_d0b01271 ]]->set_character_mode(mode);
        [[ var_d0b01271 ]]->set_character_index(character_index);
        [[ var_d0b01271 ]]->function_22039feb();
        var_13240050 = function_d299ef16(character_index, mode);
        var_f750af1d = outfit_index == -1 ? 0 : outfit_index;
        var_f58d84ac = outfit_index == -1 ? var_13240050 - 1 : outfit_index;
        for (outfitindex = var_f750af1d; outfitindex <= var_f58d84ac; outfitindex++) {
            var_9cf37283 = function_d7c3cf6c(character_index, outfitindex, mode);
            [[ var_d0b01271 ]]->set_character_outfit(outfitindex);
            [[ var_d0b01271 ]]->function_158505aa(outfitindex);
            if (mode == 1 && (var_7823b8b1 == -1 || var_7823b8b1 == 8)) {
                foreach (preset in var_9cf37283.presets) {
                    if (preset.isvalid && preset.lootid != #"") {
                        [[ var_d0b01271 ]]->function_95779b72();
                        foreach (type, option in preset.parts) {
                            [[ var_d0b01271 ]]->set_character_outfit_item(option, type);
                        }
                        function_23bc6f08(localclientnum, var_d0b01271, 8, preset, mode, character_index, 0);
                        foreach (option, war_paint in var_9cf37283.options[7]) {
                            if (war_paint.name == preset.name) {
                                [[ var_d0b01271 ]]->set_character_outfit_item(option, 7);
                                break;
                            }
                        }
                        foreach (option, war_paint in var_9cf37283.options[1]) {
                            if (war_paint.name == preset.name) {
                                [[ var_d0b01271 ]]->set_character_outfit_item(option, 7);
                                break;
                            }
                        }
                        function_23bc6f08(localclientnum, var_d0b01271, 8, preset, mode, character_index, 1);
                    }
                }
            }
            foreach (type, options in var_9cf37283.options) {
                if (function_2351cba1(type, mode) && (var_7823b8b1 == -1 || var_7823b8b1 == type)) {
                    [[ var_d0b01271 ]]->set_character_outfit(outfitindex);
                    [[ var_d0b01271 ]]->function_158505aa(outfitindex);
                    foreach (i, option in options) {
                        [[ var_d0b01271 ]]->function_95779b72();
                        [[ var_d0b01271 ]]->set_character_outfit_item(i, type);
                        if (type == 7 && mode == 1) {
                            var_47e7e198 = undefined;
                            foreach (j, palette in var_9cf37283.options[5]) {
                                if (palette.name == option.name) {
                                    var_47e7e198 = j;
                                    break;
                                }
                            }
                            if (isdefined(var_47e7e198)) {
                                [[ var_d0b01271 ]]->set_character_outfit(outfitindex);
                                [[ var_d0b01271 ]]->set_character_outfit_item(var_47e7e198, 5);
                            } else {
                                [[ var_d0b01271 ]]->set_character_outfit(0);
                            }
                        }
                        function_23bc6f08(localclientnum, var_d0b01271, type, option, mode, character_index, 0);
                    }
                }
            }
        }
        [[ var_d0b01271 ]]->function_39a68bf2();
        level notify("<unknown string>" + localclientnum, {#status:"<unknown string>", #menu:"<unknown string>"});
        setdvar(#"char_render", "WZPersonalizeCharacterInspect");
        function_59013397();
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0xcc0faf18, Offset: 0x4df0
// Size: 0x9c
function function_92087f1b(localclientnum) {
    /#
        if (getdvarint(#"hash_af3e02adb15e8ec", 0) > 0) {
            level thread function_fb399a61(localclientnum);
            return;
        }
        util::add_devgui(localclientnum, "<unknown string>" + "<unknown string>", "<unknown string>");
        level thread function_622b5dc0(localclientnum);
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0xd9465ee, Offset: 0x4e98
// Size: 0xa4
function function_622b5dc0(localclientnum) {
    /#
        level endon(#"game_ended");
        while (1) {
            if (getdvarint(#"hash_af3e02adb15e8ec", 0) > 0) {
                util::remove_devgui(localclientnum, "<unknown string>" + "<unknown string>");
                level thread function_fb399a61(localclientnum);
                return;
            }
            wait(1);
        }
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x15c594c8, Offset: 0x4f48
// Size: 0x6f2
function function_fb399a61(localclientnum) {
    /#
        lui::createcustomcameramenu("<unknown string>", localclientnum, &function_4920c25a, 1, undefined, undefined, 0);
        lui::linktocustomcharacter("<unknown string>", localclientnum, "<unknown string>");
        target = struct::get(#"character_staging_extracam1");
        /#
            assert(isdefined(target));
        #/
        var_663588d = "<unknown string>";
        var_f4b452be = [0:"<unknown string>", 3:"<unknown string>", 1:"<unknown string>"];
        var_8d6e963c = [7:"<unknown string>", 6:"<unknown string>", 5:"<unknown string>", 4:"<unknown string>", 3:"<unknown string>", 2:"<unknown string>", 0:"<unknown string>"];
        foreach (mode, display_name in var_f4b452be) {
            var_82414930 = var_663588d + display_name + "<unknown string>";
            for (index = 0; index < getplayerroletemplatecount(mode); index++) {
                var_f75a02ea = function_9e72a96(function_b14806c6(index, mode));
                var_11f96a92 = var_82414930 + var_f75a02ea + "<unknown string>";
                adddebugcommand(localclientnum, "frontend" + var_11f96a92 + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + mode + "<unknown string>" + index + "<unknown string>" + -1 + "<unknown string>" + -1 + "<unknown string>" + "<unknown string>");
                var_13240050 = function_d299ef16(index, mode);
                for (outfitindex = 0; outfitindex < var_13240050; outfitindex++) {
                    var_9cf37283 = function_d7c3cf6c(index, outfitindex, mode);
                    if (var_9cf37283.valid) {
                        var_b614b3ba = var_11f96a92 + function_9e72a96(var_9cf37283.namehash) + "<unknown string>";
                        adddebugcommand(localclientnum, "frontend" + var_b614b3ba + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + mode + "<unknown string>" + index + "<unknown string>" + outfitindex + "<unknown string>" + -1 + "<unknown string>" + "<unknown string>");
                        if (mode == 1) {
                            adddebugcommand(localclientnum, "frontend" + var_b614b3ba + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + mode + "<unknown string>" + index + "<unknown string>" + outfitindex + "<unknown string>" + 8 + "<unknown string>" + "<unknown string>");
                        }
                        foreach (type, name in var_8d6e963c) {
                            if (function_2351cba1(type, mode)) {
                                adddebugcommand(localclientnum, "frontend" + var_b614b3ba + name + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + mode + "<unknown string>" + index + "<unknown string>" + outfitindex + "<unknown string>" + type + "<unknown string>" + "<unknown string>");
                            }
                        }
                        waitframe(1);
                    }
                }
            }
        }
        setdvar(#"char_render", "WZPersonalizeCharacterInspect");
        var_f7a528f2 = "WZPersonalizeCharacterInspect";
        while (1) {
            wait(0.1);
            if (getdvarstring(#"char_render", var_f7a528f2) != var_f7a528f2) {
                var_f7a528f2 = getdvarstring(#"char_render");
                if (var_f7a528f2 != "WZPersonalizeCharacterInspect") {
                    level notify("<unknown string>" + localclientnum, {#state:var_f7a528f2, #status:"<unknown string>", #menu:"<unknown string>"});
                }
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 6, eflags: 0x0
// Checksum 0xb2c4badd, Offset: 0x5648
// Size: 0x2e4
function function_5d6480a0(localclientnum, weapon, weapon_model, weapon_name, var_2d8a24a3, var_e30bf49f) {
    /#
        if (!isdefined(var_e30bf49f)) {
            var_e30bf49f = 0;
        }
        camo_index = var_2d8a24a3.item_index == 0 ? 0 : function_8b51d9d1(hash(var_2d8a24a3.name));
        var_9ce34e01 = var_2d8a24a3.name;
        if (isdefined(camo_index)) {
            activecamoinfo = activecamo::function_ae141bf2(camo_index);
            if (isdefined(activecamoinfo) && activecamoinfo.stages.size > 1) {
                var_3594168e = activecamoinfo.stages[2];
                if (!(isdefined(var_3594168e.disabled) && var_3594168e.disabled)) {
                    camo_index = function_8b51d9d1(var_3594168e.var_879c8798);
                    var_9ce34e01 = function_9e72a96(var_3594168e.var_879c8798);
                } else {
                    var_3594168e = undefined;
                }
            }
            if (isdefined(level.var_43aac701[localclientnum])) {
                weapon_model stoprenderoverridebundle(level.var_43aac701[localclientnum]);
                level.var_43aac701[localclientnum] = undefined;
            }
            render_options = function_140a6212(camo_index, 0, var_e30bf49f, 0, 0, 0);
            weapon_model useweaponmodel(weapon, undefined, render_options);
            if (isdefined(var_3594168e)) {
                activecamo::function_374e37a0(localclientnum, weapon_model, var_3594168e, level.var_43aac701);
            }
            iteration = 0;
            do {
                wait(0.5);
                iteration++;
            } while(!weapon_model isstreamed(8, 4) && iteration < 1);
            wait(2);
            function_da10fc8f(localclientnum, "<unknown string>" + weapon_name + "<unknown string>" + weapon_name + "<unknown string>" + var_9ce34e01 + "<unknown string>");
        }
    #/
}

// Namespace frontend/frontend
// Params 3, eflags: 0x0
// Checksum 0x6ce8037f, Offset: 0x5938
// Size: 0x574
function function_f2c538de(localclientnum, menu_name, state) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        args = strtok(state, "<unknown string>");
        weapon_name = args[0];
        camo = int(args[1]);
        var_c58c03de = int(args[2]);
        filter = args[3];
        function_25485718();
        var_38b900c2 = getent(localclientnum, "j_neck", "<unknown string>");
        var_51a0f339 = getent(localclientnum, "<unknown string>", "<unknown string>");
        var_38b900c2 show();
        var_51a0f339 hide();
        weapon = getweapon(weapon_name);
        target = struct::get(#"weapon_icon_staging");
        weapon_model = spawn(localclientnum, target.origin, "<unknown string>");
        weapon_model.targetname = "<unknown string>";
        weapon_model.angles = target.angles;
        weapon_model sethighdetail();
        weapon_model useweaponmodel(weapon);
        weapon_model setscale(function_8d32e28(weapon));
        level thread scene::play(#"scene_frontend_weapon_camo_render");
        if (camo != -2) {
            options = function_ea647602("<unknown string>");
            if (camo == -1) {
                start_index = 0;
                end_index = options.size - 1;
            } else {
                start_index = camo;
                end_index = camo;
            }
            for (i = start_index; i <= end_index; i++) {
                var_2d8a24a3 = options[i];
                if (filter != "<unknown string>") {
                    category = function_57411076(var_2d8a24a3.name);
                    if (filter == "<unknown string>") {
                        if (category != "<unknown string>" && category != "<unknown string>" && category != "<unknown string>") {
                            continue;
                        }
                        goto LOC_000003d6;
                    }
                    jumpiffalse(category != filter) LOC_000003d6;
                } else {
                LOC_000003d6:
                    function_5d6480a0(localclientnum, weapon, weapon_model, weapon_name, var_2d8a24a3, 0);
                }
            }
        }
        if (var_c58c03de != 0) {
            if (var_c58c03de == -1) {
                start_index = 1;
                end_index = weapon.var_5b73038c;
            } else {
                start_index = var_c58c03de;
                end_index = var_c58c03de;
            }
            for (i = start_index; i <= end_index; i++) {
                function_5d6480a0(localclientnum, weapon, weapon_model, weapon_name, {#name:"<unknown string>" + i, #item_index:0}, i);
            }
        }
        level thread scene::stop(#"scene_frontend_weapon_camo_render");
        level notify("<unknown string>" + localclientnum, {#status:"<unknown string>", #menu:"<unknown string>"});
        weapon_model delete();
        setdvar(#"weap_render", "WZPersonalizeCharacterInspect");
        function_59013397();
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0xd9b4f30d, Offset: 0x5eb8
// Size: 0x26
function function_d583ca36(weapon) {
    /#
        return weapon.inventorytype == "<unknown string>";
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x36c98d97, Offset: 0x5ee8
// Size: 0x7b2
function function_db3c4c69(localclientnum) {
    /#
        lui::createcustomcameramenu("<unknown string>", localclientnum, &function_f2c538de, 1, undefined, undefined, 0);
        target = struct::get(#"weapon_icon_staging");
        /#
            assert(isdefined(target));
        #/
        level.var_43aac701 = [];
        var_663588d = "<unknown string>";
        root_weapon = var_663588d + "<unknown string>";
        a_weapons = enumerateweapons("<unknown string>");
        if (!isdefined(a_weapons)) {
            a_weapons = [];
        }
        a_weapons = array::filter(a_weapons, 1, &function_d583ca36);
        foreach (weapon in a_weapons) {
            name = function_a16a090d(weapon);
            var_ee63b362 = root_weapon + "<unknown string>" + name;
            adddebugcommand(localclientnum, "frontend" + var_ee63b362 + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "1e968675840551ec");
        }
        setdvar(#"hash_1311d7636a782655", "WZPersonalizeCharacterInspect");
        setdvar(#"weap_render", "WZPersonalizeCharacterInspect");
        var_c11ba901 = array("<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>", "<unknown string>");
        weapon_name = "WZPersonalizeCharacterInspect";
        var_f7a528f2 = "WZPersonalizeCharacterInspect";
        while (1) {
            wait(0.1);
            if (getdvarstring(#"hash_1311d7636a782655", weapon_name) != weapon_name) {
                weapon_name = getdvarstring(#"hash_1311d7636a782655");
                if (weapon_name != "WZPersonalizeCharacterInspect") {
                    foreach (weapon in a_weapons) {
                        name = function_a16a090d(weapon);
                        if (name != weapon_name) {
                            continue;
                        }
                        var_c001baa1 = var_663588d + "<unknown string>" + name;
                        adddebugcommand(localclientnum, "frontend" + var_c001baa1 + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>" + -1 + "<unknown string>" + -1 + "<unknown string>" + "<unknown string>" + "1e968675840551ec");
                        for (i = 0; i < var_c11ba901.size; i++) {
                            type = var_c11ba901[i];
                            adddebugcommand(localclientnum, "frontend" + var_c001baa1 + "<unknown string>" + type + "<unknown string>" + 2 + i + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>" + -1 + "<unknown string>" + -1 + "<unknown string>" + type + "1e968675840551ec");
                        }
                        options = function_ea647602("<unknown string>");
                        foreach (i, option in options) {
                            adddebugcommand(localclientnum, "frontend" + var_c001baa1 + "<unknown string>" + option.name + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>" + i + "<unknown string>" + 0 + "<unknown string>" + "<unknown string>" + "1e968675840551ec");
                        }
                        for (i = 1; i < weapon.var_5b73038c; i++) {
                            adddebugcommand(localclientnum, "frontend" + var_c001baa1 + "<unknown string>" + i + "<unknown string>" + "<unknown string>" + "<unknown string>" + name + "<unknown string>" + -2 + "<unknown string>" + i + "<unknown string>" + "<unknown string>" + "1e968675840551ec");
                        }
                    }
                }
            }
            if (getdvarstring(#"weap_render", var_f7a528f2) != var_f7a528f2) {
                var_f7a528f2 = getdvarstring(#"weap_render");
                if (var_f7a528f2 != "WZPersonalizeCharacterInspect") {
                    level notify("<unknown string>" + localclientnum, {#state:var_f7a528f2, #status:"<unknown string>", #menu:"<unknown string>"});
                }
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0xb3f155fb, Offset: 0x66a8
// Size: 0xbc
function function_3d29f330(localclientnum) {
    /#
        util::add_devgui(localclientnum, "<unknown string>" + "<unknown string>", "<unknown string>");
        while (getdvarint(#"hash_2a806885aa30e65b", 0) == 0) {
            wait(1);
        }
        util::remove_devgui(localclientnum, "<unknown string>" + "<unknown string>");
        function_ea9a5e69(localclientnum);
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x983e102e, Offset: 0x6770
// Size: 0x1a
function function_671eb8fa() {
    /#
        return [1:"<unknown string>"];
    #/
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x212a261e, Offset: 0x6798
// Size: 0x4fa
function function_ea9a5e69(localclientnum) {
    /#
        lui::createcustomcameramenu("<unknown string>", localclientnum, &function_4cd43ca2, 1, undefined, undefined, 0);
        var_2067e07 = function_671eb8fa();
        adddebugcommand(localclientnum, "frontend" + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + -1 + "<unknown string>" + -1 + "1e968675840551ec");
        foreach (type, name in var_2067e07) {
            adddebugcommand(localclientnum, "frontend" + "<unknown string>" + name + "<unknown string>" + "<unknown string>" + "<unknown string>" + -1 + "<unknown string>" + type + "1e968675840551ec");
        }
        /#
            assert(isdefined(getent(localclientnum, "<unknown string>", "<unknown string>")));
        #/
        /#
            assert(isdefined(struct::get(#"fx_trail_start")));
        #/
        /#
            assert(isdefined(struct::get(#"fx_trail_end")));
        #/
        jumpkits = namespace_eb06e24d::get_jumpkits();
        foreach (i, jumpkit in jumpkits) {
            name = function_9e72a96(jumpkit);
            var_c23e6a40 = "<unknown string>" + name + "<unknown string>";
            adddebugcommand(localclientnum, "frontend" + var_c23e6a40 + "<unknown string>" + "<unknown string>" + "<unknown string>" + "<unknown string>" + i + "<unknown string>" + -1 + "1e968675840551ec");
            foreach (type, name in var_2067e07) {
                adddebugcommand(localclientnum, "frontend" + var_c23e6a40 + name + "<unknown string>" + "<unknown string>" + "<unknown string>" + i + "<unknown string>" + type + "1e968675840551ec");
            }
            waitframe(1);
        }
        setdvar(#"hash_4243dd01393aa940", "WZPersonalizeCharacterInspect");
        var_f7a528f2 = "WZPersonalizeCharacterInspect";
        while (1) {
            wait(0.1);
            if (getdvarstring(#"hash_4243dd01393aa940", var_f7a528f2) != var_f7a528f2) {
                var_f7a528f2 = getdvarstring(#"hash_4243dd01393aa940");
                if (var_f7a528f2 != "WZPersonalizeCharacterInspect") {
                    level notify("<unknown string>" + localclientnum, {#state:var_f7a528f2, #status:"<unknown string>", #menu:"<unknown string>"});
                }
            }
        }
    #/
}

// Namespace frontend/frontend
// Params 3, eflags: 0x0
// Checksum 0xb7c6a6a0, Offset: 0x6ca0
// Size: 0x664
function function_4cd43ca2(localclientnum, menu_name, state) {
    /#
        self notify("<unknown string>");
        self endon("<unknown string>");
        args = strtok(state, "<unknown string>");
        jumpkit = int(args[0]);
        type = int(args[1]);
        function_25485718();
        var_38b900c2 = getent(localclientnum, "j_neck", "<unknown string>");
        var_51a0f339 = getent(localclientnum, "<unknown string>", "<unknown string>");
        var_38b900c2 show();
        var_51a0f339 hide();
        if (jumpkit == -1) {
            var_d4e4e3a8 = 0;
            var_dcb0ef67 = namespace_eb06e24d::function_3045dd71() - 1;
        } else {
            var_d4e4e3a8 = jumpkit;
            var_dcb0ef67 = jumpkit;
        }
        types = function_671eb8fa();
        if (type != -1) {
            type_data = types[type];
            types = [];
            types[type] = type_data;
        }
        var_351da865 = getent(localclientnum, "<unknown string>", "<unknown string>");
        fx_start = struct::get(#"fx_trail_start");
        fx_end = struct::get(#"fx_trail_end");
        foreach (type, var_3aec81f4 in types) {
            switch (type) {
            case 1:
                level thread scene::play(#"scene_frontend_fxtrail_render");
                break;
            default:
                goto LOC_000005d8;
            }
            for (i = var_d4e4e3a8; i <= var_dcb0ef67; i++) {
                var_4132246d = namespace_eb06e24d::get_jumpkits()[i];
                switch (type) {
                case 1:
                    trail = namespace_eb06e24d::function_6452f9c5(i);
                    if (!isdefined(trail) || !isdefined(trail.body_trail)) {
                        continue;
                    }
                    var_351da865.origin = fx_start.origin;
                    handle = util::playfxontag(localclientnum, trail.body_trail, var_351da865, "<unknown string>");
                    if (!isdefined(handle)) {
                        continue;
                    }
                    direction = fx_end.origin - fx_start.origin;
                    step_size = direction / getdvarint(#"hash_522e5987825dd16e", 100);
                    for (var_d7f46807 = 0; var_d7f46807 <= getdvarint(#"hash_522e5987825dd16e", 100); var_d7f46807++) {
                        waitframe(1);
                        var_351da865.origin = var_351da865.origin + step_size;
                    }
                    function_da10fc8f(localclientnum, "<unknown string>" + function_9e72a96(var_4132246d) + "<unknown string>" + function_9e72a96(trail.name) + "<unknown string>");
                    killfx(localclientnum, handle);
                    break;
                default:
                    continue;
                }
                waitframe(1);
            }
            switch (type) {
            case 1:
                level thread scene::stop(#"scene_frontend_fxtrail_render");
            default:
                break;
            }
        LOC_000005d8:
        }
        level notify("<unknown string>" + localclientnum, {#status:"<unknown string>", #menu:"<unknown string>"});
        setdvar(#"hash_4243dd01393aa940", "WZPersonalizeCharacterInspect");
        function_59013397();
    #/
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x9c39fe3f, Offset: 0x7310
// Size: 0xda
function function_70e963be(entry, localclientnum) {
    if (entry.mode == 3 && isdefined(localclientnum)) {
        customization = function_25f808c9(localclientnum, entry.mode, entry.role_index);
        if (isdefined(customization) && isdefined(customization.locked) && customization.locked) {
            return 0;
        }
    }
    if (isdefined(entry.dvar) && !getdvarint(entry.dvar, 0)) {
        return 0;
    }
    return entry.var_f8a2729f;
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x54ed0212, Offset: 0x73f8
// Size: 0xb0
function function_3dc16db1(mode, index) {
    foreach (var_dea538a3 in level.var_e362b5d9) {
        if (var_dea538a3.mode == mode && var_dea538a3.role_index == index) {
            return var_dea538a3.list_index;
        }
    }
}

// Namespace frontend/frontend
// Params 0, eflags: 0x1 linked
// Checksum 0x5289f601, Offset: 0x74b0
// Size: 0xb4
function function_4a6953b8() {
    selectable = array::filter(level.var_e362b5d9, 0, &function_70e963be);
    foreach (var_dea538a3 in selectable) {
        if (var_dea538a3.mode == 0) {
            return var_dea538a3.list_index;
        }
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0xc24345bb, Offset: 0x7570
// Size: 0xfc
function function_31a3348c(session_mode) {
    selectable = array::filter(level.var_e362b5d9, 0, &function_70e963be);
    var_e362b5d9 = [];
    foreach (var_dea538a3 in selectable) {
        if (var_dea538a3.mode == session_mode) {
            var_e362b5d9[var_e362b5d9.size] = var_dea538a3.list_index;
        }
    }
    if (var_e362b5d9.size > 0) {
        return array::random(var_e362b5d9);
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x22fc4a98, Offset: 0x7678
// Size: 0x51c
function function_deed1dbf(localclientnum) {
    var_b4a66a1f = util::spawn_model(localclientnum, "tag_origin", (0, 0, 0), (0, 0, 0));
    var_b4a66a1f.targetname = "frozen_moment_character";
    level.frozen_moment_character = character_customization::function_dd295310(var_b4a66a1f, localclientnum, 1);
    var_e7eccf53 = util::spawn_model(localclientnum, "tag_origin", (0, 0, 0), (0, 0, 0));
    var_e7eccf53.targetname = "cycle_frozen_moment_char_current";
    level.cycle_frozen_moment_char_current = character_customization::function_dd295310(var_e7eccf53, localclientnum, 1);
    var_354d3ff2 = util::spawn_model(localclientnum, "tag_origin", (0, 0, 0), (0, 0, 0));
    var_354d3ff2.targetname = "cycle_frozen_moment_char_next";
    level.cycle_frozen_moment_char_next = character_customization::function_dd295310(var_354d3ff2, localclientnum, 1);
    attempts = 0;
    limit = 20;
    do {
        wait(1);
        var_ca56648b = function_3d72f7e7(localclientnum);
        attempts = attempts + 1;
    } while(var_ca56648b == 0 && attempts < limit);
    selectable = array::filter(level.var_e362b5d9, 0, &function_70e963be, localclientnum);
    if (selectable.size == 0) {
        /#
            println("<unknown string>");
        #/
        selectable = level.var_e362b5d9;
    }
    if (var_ca56648b == 1) {
        foreach (entry in selectable) {
            if (entry.isdefault) {
                var_d6895424 = entry;
                break;
            }
        }
    }
    if (!isdefined(var_d6895424)) {
        scenes = [];
        foreach (moment in selectable) {
            if (!isdefined(scenes[moment.scene])) {
                scenes[moment.scene] = [];
            } else if (!isarray(scenes[moment.scene])) {
                scenes[moment.scene] = array(scenes[moment.scene]);
            }
            if (!isinarray(scenes[moment.scene], moment)) {
                scenes[moment.scene][scenes[moment.scene].size] = moment;
            }
        }
        var_d6895424 = array::random(array::random(scenes));
    }
    /#
        var_7318f7f0 = getdvarint(#"hash_563d2a49168a665c", -1);
        if (var_7318f7f0 >= 0 && var_7318f7f0 < level.var_e362b5d9.size) {
            var_d6895424 = level.var_e362b5d9[var_7318f7f0];
        }
    #/
    level.var_be02eda3 = var_d6895424.list_index;
    level.var_7208b551 = var_d6895424.scene;
    /#
        level thread function_c9f8c5e9(localclientnum);
    #/
    forcestreambundle(level.var_7208b551, 8, 4);
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x6facfb70, Offset: 0x7ba0
// Size: 0x74
function function_becded4f(localclientnum) {
    level.var_44011752 = util::spawn_model(localclientnum, #"hash_4a7568851a0264b8", (0, 0, 0), (0, 0, 0));
    level.var_44011752.targetname = "customized_inspection_weapon";
    level.var_44011752 hide();
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0xffc7b745, Offset: 0x7c20
// Size: 0x92
function function_a588eb2e(localclientnum) {
    var_e6977977 = util::spawn_model(localclientnum, #"hash_4a7568851a0264b8", (0, 0, 0), (0, 0, 0));
    var_e6977977.targetname = "quartermaster_weapon";
    var_e6977977 hide();
    var_e6977977 sethighdetail(1, 1);
    level.var_324c3190 = [];
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x57b67596, Offset: 0x7cc0
// Size: 0x35c
function localclientconnect(localclientnum) {
    /#
        println("<unknown string>" + localclientnum);
    #/
    var_acd4d941 = util::spawn_model(localclientnum, "tag_origin", (0, 0, 0), (0, 0, 0));
    var_acd4d941.targetname = "__masked_char";
    var_22f20461 = character_customization::function_dd295310(var_acd4d941, localclientnum, 0);
    [[ var_22f20461 ]]->function_1ec9448d(1);
    [[ var_22f20461 ]]->update();
    level.specialist_customization = function_f2e7abdc(localclientnum, "updateSpecialistCustomization");
    level thread scene::play(#"scene_frontend_inspection_weapon", "inspection_weapon_full");
    function_becded4f(localclientnum);
    function_a588eb2e(localclientnum);
    setupclientmenus(localclientnum);
    level thread function_f00ff0c7(localclientnum);
    level thread function_deed1dbf(localclientnum);
    if (isdefined(level.charactercustomizationsetup)) {
        [[ level.charactercustomizationsetup ]](localclientnum);
    }
    if (isdefined(level.weaponcustomizationiconsetup)) {
        [[ level.weaponcustomizationiconsetup ]](localclientnum);
    }
    callback::callback(#"on_localclient_connect", localclientnum);
    customclass::localclientconnect(localclientnum);
    customclass::hide_paintshop_bg(localclientnum);
    globalmodel = getglobaluimodel();
    roommodel = createuimodel(globalmodel, "lobbyRoot.room");
    room = getuimodelvalue(roommodel);
    postfx::setfrontendstreamingoverlay(localclientnum, "frontend", 1);
    level.frontendclientconnected = 1;
    level notify("menu_change" + localclientnum, {#state:room, #status:"opened", #menu:"Main"});
    /#
        level function_92087f1b(localclientnum);
        level thread function_db3c4c69(localclientnum);
        level thread function_3d29f330(localclientnum);
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x8028
// Size: 0x4
function onprecachegametype() {
    
}

// Namespace frontend/frontend
// Params 0, eflags: 0x0
// Checksum 0x80f724d1, Offset: 0x8038
// Size: 0x4
function onstartgametype() {
    
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x3c38fb6, Offset: 0x8048
// Size: 0x44
function open_choose_class(localclientnum, menu_data) {
    level thread character_customization::rotation_thread_spawner(localclientnum, menu_data.custom_character, "choose_class_closed" + localclientnum);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xd3b01019, Offset: 0x8098
// Size: 0x5a
function close_choose_class(localclientnum, menu_data) {
    enablefrontendlockedweaponoverlay(localclientnum, 0);
    enablefrontendtokenlockedweaponoverlay(localclientnum, 0);
    level notify("choose_class_closed" + localclientnum);
}

// Namespace frontend/frontend
// Params 4, eflags: 0x1 linked
// Checksum 0xc38f6651, Offset: 0x8100
// Size: 0x4e6
function function_d3cd6cf7(localclientnum, var_d0b01271, waitresult, params) {
    fields = [[ var_d0b01271 ]]->function_e8b0acef();
    if (isdefined(fields)) {
        params.scene = fields.var_9e9caced;
        params.var_401d9a1 = 1;
        params.var_c76f3e47 = 1;
        params.var_d8cb38a9 = 1;
        if (lui::is_current_menu(localclientnum, "ItemShopDetails") || lui::is_current_menu(localclientnum, "ItemShopDetailsSunset") || lui::is_current_menu(localclientnum, "QuarterMasterMenu") || lui::is_current_menu(localclientnum, "ContractDetails") || lui::is_current_menu(localclientnum, "ContractDetailsSunset") || lui::is_current_menu(localclientnum, "BlackMarketBountyDetails") || lui::is_current_menu(localclientnum, "WeaponBribeSelection")) {
            params.scene_target = struct::get(#"tag_align_quartermaster");
            params.anim_name = [[ var_d0b01271 ]]->function_8144231c();
            params.align_struct = struct::get(#"tag_align_quartermaster_character");
            params.scene = undefined;
        } else if (lui::is_current_menu(localclientnum, "PersonalizeDefaultWZCharacter") || lui::is_current_menu(localclientnum, "WZPersonalizeCharacter")) {
            params.scene = fields.var_bb70c379;
            params.scene_target = struct::get(#"cac_specialist");
        } else if (lui::is_current_menu(localclientnum, "PersonalizeCharacter") || lui::is_current_menu(localclientnum, "WZPersonalizeCharacterInspect")) {
            params.scene_target = struct::get(#"cac_specialist");
            params.scene = fields.var_bb70c379;
            params.var_f5332569 = [[ var_d0b01271 ]]->function_98d70bef();
        } else if (lui::is_current_menu(localclientnum, "ZMPersonalizeCharacter")) {
            params.scene_target = struct::get(#"cac_specialist");
            params.scene = fields.var_bb70c379;
        } else if (lui::is_current_menu(localclientnum, "AARMissionRewardOverlay", waitresult.character_index)) {
            params.scene = fields.var_be6ea125;
            params.scene_target = struct::get(#"wz_unlock_struct");
        } else if (lui::is_current_menu(localclientnum, "MPSpecialistHUBGestures")) {
            params.anim_name = [[ var_d0b01271 ]]->function_8144231c();
            params.align_struct = struct::get(#"cac_specialist");
            params.scene = undefined;
        } else if (lui::is_current_menu(localclientnum, "WeaponDeathFxSelect")) {
            params.anim_name = [[ var_d0b01271 ]]->function_8144231c();
            params.align_struct = struct::get(#"cac_specialist");
            params.scene = undefined;
        } else {
            params.scene_target = struct::get(#"cac_specialist");
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x6378508, Offset: 0x85f0
// Size: 0x10c
function function_f2e7abdc(localclientnum, notifyname) {
    var_20e9ec07 = struct::get(#"cac_specialist");
    if (isdefined(var_20e9ec07)) {
        var_8aa8dfb7 = util::spawn_model(localclientnum, "tag_origin", var_20e9ec07.origin, var_20e9ec07.angles);
        var_8aa8dfb7.targetname = "specialist_customization";
        var_f3b86f32 = character_customization::function_dd295310(var_8aa8dfb7, localclientnum, 0);
        [[ var_f3b86f32 ]]->set_character_mode(1);
        level thread character_customization::updateeventthread(localclientnum, var_f3b86f32, notifyname, &function_d3cd6cf7);
        return var_f3b86f32;
    }
    return undefined;
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0xa6cb3232, Offset: 0x8708
// Size: 0x64
function open_character_menu(localclientnum, menu_data) {
    character_ent = getent(localclientnum, menu_data.target_name, "targetname");
    if (isdefined(character_ent)) {
        character_ent show();
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0x81bdd75d, Offset: 0x8778
// Size: 0x64
function close_character_menu(localclientnum, menu_data) {
    character_ent = getent(localclientnum, menu_data.target_name, "targetname");
    if (isdefined(character_ent)) {
        character_ent hide();
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xc1816cf9, Offset: 0x87e8
// Size: 0x5e
function start_character_rotating_any(localclientnum, menu_data) {
    maxlocalclient = getmaxlocalclients();
    while (localclientnum < maxlocalclient) {
        start_character_rotating(localclientnum, menu_data);
        localclientnum++;
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xa5c79a06, Offset: 0x8850
// Size: 0x5e
function end_character_rotating_any(localclientnum, menu_data) {
    maxlocalclient = getmaxlocalclients();
    while (localclientnum < maxlocalclient) {
        end_character_rotating(localclientnum, menu_data);
        localclientnum++;
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x28f9ac5e, Offset: 0x88b8
// Size: 0x44
function start_character_rotating(localclientnum, menu_data) {
    level thread character_customization::rotation_thread_spawner(localclientnum, menu_data.custom_character, "end_character_rotating" + localclientnum);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xc34f680a, Offset: 0x8908
// Size: 0x2a
function end_character_rotating(localclientnum, menu_data) {
    level notify("end_character_rotating" + localclientnum);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0x28d72e44, Offset: 0x8940
// Size: 0xd0
function open_choose_head_menu(localclientnum, menu_data) {
    [[ menu_data.custom_character ]]->set_show_helmets(0);
    [[ menu_data.custom_character ]]->function_79f89fb6(1);
    [[ menu_data.custom_character ]]->set_character_mode(2);
    [[ menu_data.custom_character ]]->function_225b6e07();
    [[ menu_data.custom_character ]]->function_77e3be08();
    [[ menu_data.custom_character ]]->update();
    start_character_rotating(localclientnum, menu_data);
    level notify(#"begin_personalizing_hero");
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0x5a19d384, Offset: 0x8a18
// Size: 0xd8
function close_choose_head_menu(localclientnum, menu_data) {
    if (!isdefined(menu_data.custom_character.charactermode) || menu_data.custom_character.charactermode == 4) {
        menu_data.custom_character.charactermode = currentsessionmode();
    }
    [[ menu_data.custom_character ]]->set_show_helmets(1);
    [[ menu_data.custom_character ]]->function_79f89fb6(0);
    end_character_rotating(localclientnum, menu_data);
    level notify(#"done_personalizing_hero");
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0x675cb59d, Offset: 0x8af8
// Size: 0x210
function personalize_characters_watch(localclientnum, menu_name) {
    level endon(#"disconnect");
    level endon(menu_name + "_closed");
    s_cam = struct::get(#"personalizehero_camera", "targetname");
    /#
        assert(isdefined(s_cam));
    #/
    animtime = 0;
    while (1) {
        waitresult = undefined;
        waitresult = level waittill("camera_change" + localclientnum);
        pose = waitresult.pose;
        if (pose === "exploring") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", animtime, "cam_preview", "", s_cam.origin, s_cam.angles);
        } else if (pose === "inspecting_helmet") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", animtime, "cam_helmet", "", s_cam.origin, s_cam.angles);
        } else if (pose === "inspecting_body") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", animtime, "cam_select", "", s_cam.origin, s_cam.angles);
        }
        animtime = 300;
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0xaebb5fab, Offset: 0x8d10
// Size: 0x300
function function_d9a44ae1(localclientnum, menu_name) {
    level endon(#"disconnect");
    level endon(menu_name + "_closed");
    s_cam = struct::get(#"spawn_char_custom", "targetname");
    /#
        assert(isdefined(s_cam));
    #/
    playmaincamxcam(localclientnum, #"ui_cam_character_customization", 0, "cam_helmet", "", s_cam.origin, s_cam.angles);
    while (1) {
        waitresult = undefined;
        waitresult = level waittill("choose_face_camera_change" + localclientnum);
        region = waitresult.param1;
        if (region === "face") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_helmet", "", s_cam.origin, s_cam.angles);
        } else if (region === "eyes") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_eyes", "", s_cam.origin, s_cam.angles);
        } else if (region === "ears") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_ears", "", s_cam.origin, s_cam.angles);
        } else if (region === "nose") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_nose", "", s_cam.origin, s_cam.angles);
        } else if (region === "mouth") {
            playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_mouth", "", s_cam.origin, s_cam.angles);
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xa15351ce, Offset: 0x9018
// Size: 0x1ac
function choose_taunts_camera_watch(localclientnum, menu_name) {
    s_cam = struct::get(#"personalizehero_camera", "targetname");
    /#
        assert(isdefined(s_cam));
    #/
    playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_topscorers", "", s_cam.origin, s_cam.angles);
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->function_4240a39a(1, vectorscale((0, 1, 0), 112));
    level waittill(menu_name + "_closed");
    params = {#anim_name:[[ var_d0b01271 ]]->function_8144231c()};
    [[ var_d0b01271 ]]->update(params);
    [[ var_d0b01271 ]]->function_4240a39a(0, undefined);
    playmaincamxcam(localclientnum, #"ui_cam_character_customization", 300, "cam_preview", "", s_cam.origin, s_cam.angles);
    wait(3);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xb1c860d2, Offset: 0x91d0
// Size: 0x100
function function_b0442428(var_ce754e62, var_3f0e790b) {
    if (isdefined(var_ce754e62) && isdefined(var_ce754e62[var_3f0e790b])) {
        foreach (object in var_ce754e62[var_3f0e790b]) {
            var_2d0192e5 = [[ object.character ]]->function_82e05d64();
            if (isdefined(var_2d0192e5) && isdefined(var_2d0192e5.var_90ba8f6f)) {
                setuimodelvalue(var_2d0192e5.var_90ba8f6f, [[ object.character ]]->function_47cb6b19());
            }
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x8cbfac11, Offset: 0x92d8
// Size: 0xf0
function function_f5eca51d(var_ce754e62, var_3f0e790b) {
    if (isdefined(var_ce754e62) && isdefined(var_ce754e62[var_3f0e790b])) {
        foreach (object in var_ce754e62[var_3f0e790b]) {
            var_2d0192e5 = [[ object.character ]]->function_82e05d64();
            if (isdefined(var_2d0192e5) && isdefined(var_2d0192e5.var_90ba8f6f)) {
                setuimodelvalue(var_2d0192e5.var_90ba8f6f, -1);
            }
        }
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x570f877f, Offset: 0x93d0
// Size: 0xe2
function function_eb297e19(var_23904c1d) {
    level.var_ff851224 = var_23904c1d;
    var_6d8e8e31 = function_3dc16db1(var_23904c1d.charactermode, var_23904c1d.charactertype);
    if (isdefined(var_6d8e8e31)) {
        var_53511779 = level.var_e362b5d9[var_6d8e8e31].scene;
        if (isdefined(level.var_c37ccfec) && level.var_c37ccfec != var_53511779) {
            function_66b6e720(level.var_c37ccfec);
        } else {
            forcestreambundle(var_53511779, 1, 1);
        }
        level.var_c37ccfec = var_53511779;
    }
}

// Namespace frontend/frontend
// Params 5, eflags: 0x1 linked
// Checksum 0x6a34ae62, Offset: 0x94c0
// Size: 0x544
function function_f00765ad(localclientnum, xuid, var_87c045d1, index, var_3f0e790b) {
    level endon(#"lobby_change");
    session_mode = 1;
    force_update = 0;
    var_ed7308ad = 0;
    var_a65df30 = [[ var_87c045d1 ]]->function_e599283f();
    current_index = [[ var_87c045d1 ]]->function_9004475c();
    [[ var_87c045d1 ]]->show_model();
    [[ var_87c045d1 ]]->set_xuid(xuid);
    [[ var_87c045d1 ]]->set_character_mode(session_mode);
    var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
    while (!isdefined(var_23904c1d) && var_ed7308ad < 15) {
        wait(1);
        var_23904c1d = getcharactercustomizationforxuid(localclientnum, xuid);
        var_ed7308ad++;
    }
    if (isdefined(var_23904c1d) && var_23904c1d.charactermode == currentsessionmode() && function_b9f8bbd9(var_23904c1d.charactertype, var_23904c1d.charactermode)) {
        var_4865db3b = var_23904c1d.charactertype;
        fields = getcharacterfields(var_23904c1d.charactertype, var_23904c1d.charactermode);
    } else {
        var_23904c1d = undefined;
        var_4865db3b = function_e3efec59(xuid, session_mode);
        character_index = var_4865db3b;
        [[ var_87c045d1 ]]->set_character_index(character_index);
        if (isdefined(character_index)) {
            fields = getcharacterfields(character_index, session_mode);
        }
    }
    var_8e0277a = undefined;
    if (isdefined(fields)) {
        scenes = function_b7d4bfd9(fields, var_3f0e790b);
        if (isdefined(scenes)) {
            var_8e0277a = scenes[index % scenes.size].scene;
        }
    }
    if (isdefined(var_8e0277a)) {
        params = {#var_401d9a1:1, #var_c76f3e47:1, #var_a34c858c:1, #scene_target:self, #scene:var_8e0277a};
        if (isdefined(var_23904c1d)) {
            if (function_89e574c(xuid)) {
                function_eb297e19(var_23904c1d);
            }
            if (character_customization::function_aa5382ed(var_23904c1d, var_a65df30, 0)) {
                [[ var_87c045d1 ]]->function_15a8906a(var_23904c1d);
                [[ var_87c045d1 ]]->update(params);
            }
        } else {
            [[ var_87c045d1 ]]->set_character_index(character_index);
            [[ var_87c045d1 ]]->function_22039feb();
        }
    }
    if (!isdefined(var_23904c1d) && current_index != var_4865db3b) {
        var_7f40501d = undefined;
        var_44cf5e5b = getcharacterfields(var_4865db3b, session_mode);
        if (isdefined(var_44cf5e5b)) {
            var_da03826 = function_b7d4bfd9(var_44cf5e5b, var_3f0e790b);
            if (isdefined(var_da03826)) {
                var_7f40501d = var_da03826[index % var_da03826.size].scene;
            }
        }
        if (isdefined(var_7f40501d)) {
            var_cb498604 = {#var_401d9a1:1, #var_c76f3e47:1, #var_a34c858c:1, #scene_target:self, #scene:var_7f40501d};
        } else {
            var_cb498604 = {#anim_name:[[ var_87c045d1 ]]->function_8144231c()};
        }
        force_update = 1;
        [[ var_87c045d1 ]]->update(var_cb498604);
        if (function_89e574c(xuid)) {
            function_eb297e19([[ var_87c045d1 ]]->function_e599283f());
        }
    }
    draft::function_e1f85a64(var_87c045d1, index, var_3f0e790b);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x2a3a77c4, Offset: 0x9a10
// Size: 0x186
function function_7c77108d(localclientnum, &var_13ef9467, var_63aea26e) {
    for (i = 0; 1; i++) {
        target = struct::get(var_63aea26e + i);
        if (!isdefined(target)) {
            break;
        }
        charactermodel = util::spawn_model(localclientnum, "tag_origin", target.origin, target.angles);
        charactermodel.targetname = var_63aea26e + "character_" + i;
        var_a4fe2697 = character_customization::function_dd295310(charactermodel, localclientnum, 0);
        var_ac2e02ac = {#scene_name:undefined, #character:var_a4fe2697, #target:target};
        if (!isdefined(var_13ef9467)) {
            var_13ef9467 = [];
        } else if (!isarray(var_13ef9467)) {
            var_13ef9467 = array(var_13ef9467);
        }
        var_13ef9467[var_13ef9467.size] = var_ac2e02ac;
    }
    return i;
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xc72af396, Offset: 0x9ba0
// Size: 0x182
function function_4fc36b1a(localclientnum, xuid) {
    if (!isdefined(level.var_4c6f850d)) {
        level.var_4c6f850d = [];
    }
    var_d53ddee1 = function_f03f5d4e(localclientnum, xuid, 1);
    if (isdefined(var_d53ddee1)) {
        if (character_customization::function_aa5382ed(var_d53ddee1, level.var_4c6f850d[xuid], 0)) {
            if (function_9bed6a71(localclientnum, 1) == xuid && isdefined(level.var_47863282) && xuid == level.var_47863282 && !(isdefined(level.var_c8fac6ea) && level scene::is_playing(level.var_c8fac6ea))) {
                function_a71254a9(localclientnum, 0, undefined, 1);
                [[ level.cycle_frozen_moment_char_current ]]->function_39a68bf2();
                stopmaincamxcam(localclientnum);
                function_e56abdb(localclientnum, 1);
            }
        }
        level.var_4c6f850d[xuid] = var_d53ddee1;
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x67a609e0, Offset: 0x9d30
// Size: 0x2cc
function function_ce0c92c1(localclientnum, var_dde5862c) {
    if (isdefined(var_dde5862c)) {
        level.var_e8250c7b = var_dde5862c;
        if (isdefined(level.var_4c6f850d)) {
            var_19b413e2 = level.var_4c6f850d;
            var_375e4c88 = [];
            var_8632c0a1 = [];
            foreach (xuid, data in var_19b413e2) {
                if (array::contains(var_dde5862c, xuid)) {
                    var_375e4c88[xuid] = data;
                }
            }
            level.var_4c6f850d = var_375e4c88;
        }
        if (isdefined(level.var_4c6f850d)) {
            if (isdefined(level.var_47863282) && !array::contains(getarraykeys(level.var_4c6f850d), level.var_47863282)) {
                level.var_37fcc91f = undefined;
                if ([[ level.cycle_frozen_moment_char_next ]]->function_ea4ac9f8()) {
                    level notify(#"hash_5661859119127749");
                } else {
                    level notify(#"hash_4cfb73b5657634d1");
                    function_a71254a9(localclientnum, 0, undefined, 1);
                    [[ level.cycle_frozen_moment_char_current ]]->function_39a68bf2();
                    stopmaincamxcam(localclientnum);
                    level.var_494e824d = 0;
                    function_6e9fbb54(localclientnum);
                }
            }
            if (isdefined(level.var_202758dc) && !array::contains(getarraykeys(level.var_4c6f850d), level.var_202758dc)) {
                level.var_37fcc91f = undefined;
                level.var_3cea0f38 = 0;
                level notify(#"hash_1ac908ea1013c378");
                [[ level.cycle_frozen_moment_char_next ]]->function_39a68bf2();
                function_6e9fbb54(localclientnum, function_9bed6a71(localclientnum, 1));
            }
        }
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x2fb7bcb2, Offset: 0xa008
// Size: 0x258
function function_79b4e640(localclientnum) {
    self notify("514e2d4456d495c3");
    self endon("514e2d4456d495c3");
    level endon(#"hash_73b4088ba8bf09ca");
    level endon(#"hash_4cfb73b5657634d1");
    while (1) {
        level waittill(#"hash_5661859119127749");
        if (isdefined(level.var_202758dc) && isdefined(level.var_723bf922)) {
            function_a71254a9(localclientnum, 0, undefined, 1);
            var_2c72511b = [[ level.cycle_frozen_moment_char_current ]]->function_9004475c();
            var_f5bfdfe7 = [[ level.cycle_frozen_moment_char_next ]]->function_9004475c();
            temp = level.cycle_frozen_moment_char_current;
            level.cycle_frozen_moment_char_current = level.cycle_frozen_moment_char_next;
            level.cycle_frozen_moment_char_next = temp;
            [[ level.cycle_frozen_moment_char_next ]]->function_39a68bf2();
            stopmaincamxcam(localclientnum);
            level.var_47863282 = level.var_202758dc;
            level.var_3cea0f38 = 0;
            if (isdefined(level.var_4c6f850d) && isdefined(level.var_4c6f850d[level.var_47863282])) {
                scene_shots = scene::get_all_shot_names(level.var_723bf922, undefined, 1);
                scene_shot = array::random(scene_shots);
                function_a71254a9(localclientnum, 1, level.var_4c6f850d[level.var_47863282], 0, scene_shot, var_2c72511b == var_f5bfdfe7);
            } else {
                level.var_494e824d = 0;
            }
            function_6e9fbb54(localclientnum);
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xd284ab90, Offset: 0xa268
// Size: 0x65a
function function_6e9fbb54(localclientnum, var_baeecec7 = undefined) {
    level endon(#"hash_73b4088ba8bf09ca");
    level endon(#"hash_1ac908ea1013c378");
    if (!(isdefined(level.var_494e824d) && level.var_494e824d) && isdefined(level.var_4c6f850d) && level.var_4c6f850d.size > 0 && lui::is_current_menu(localclientnum, "Main", "matchmaking")) {
        level.var_47863282 = function_9bed6a71(localclientnum, 1);
        if (!isdefined(level.var_4c6f850d[level.var_47863282])) {
            return;
        }
        level.var_494e824d = 1;
        fbc = getuimodel(getglobaluimodel(), "lobbyRoot.fullscreenBlackCount");
        setuimodelvalue(fbc, 1);
        character_index = level.var_4c6f850d[level.var_47863282].charactertype;
        var_6d8e8e31 = function_3dc16db1(1, character_index);
        var_53511779 = level.var_e362b5d9[var_6d8e8e31].scene;
        forcestreambundle(var_53511779);
        params = {#var_8d3b5f69:1, #var_d8cb38a9:1, #var_c76f3e47:1};
        [[ level.cycle_frozen_moment_char_current ]]->function_15a8906a(level.var_4c6f850d[level.var_47863282]);
        [[ level.cycle_frozen_moment_char_current ]]->update(params);
        while (![[ level.cycle_frozen_moment_char_current ]]->function_ea4ac9f8()) {
            wait(0.1);
        }
        if (isdefined(level.var_4c6f850d) && isdefined(level.var_4c6f850d[level.var_47863282])) {
            level.var_37fcc91f = "play";
            function_a71254a9(localclientnum, 1, level.var_4c6f850d[level.var_47863282]);
            level thread function_79b4e640(localclientnum);
        } else {
            level.var_494e824d = 1;
            level.var_47863282 = undefined;
            return;
        }
    }
    if (!(isdefined(level.var_3cea0f38) && level.var_3cea0f38) && isdefined(level.var_4c6f850d) && level.var_4c6f850d.size > 1 && level.var_e8250c7b.size > 1) {
        level.var_3cea0f38 = 1;
        while (![[ level.cycle_frozen_moment_char_current ]]->function_ea4ac9f8()) {
            wait(0.1);
        }
        if (isdefined(var_baeecec7)) {
            level.var_202758dc = var_baeecec7;
        } else {
            var_e8250c7b = level.var_e8250c7b;
            var_b08af46e = [];
            var_b08af46e[0] = level.var_47863282;
            var_e8250c7b = array::exclude(var_e8250c7b, var_b08af46e);
            do {
                if (var_e8250c7b.size == 0) {
                    break;
                }
                level.var_202758dc = array::random(var_e8250c7b);
                var_b08af46e[0] = level.var_202758dc;
                var_e8250c7b = array::exclude(var_e8250c7b, var_b08af46e);
            } while(!isdefined(level.var_4c6f850d[level.var_202758dc]));
        }
        if (isdefined(level.var_202758dc) && isdefined(level.var_4c6f850d[level.var_202758dc])) {
            character_index = level.var_4c6f850d[level.var_202758dc].charactertype;
            var_6d8e8e31 = function_3dc16db1(1, character_index);
            var_4bcfb6f5 = level.var_e362b5d9[var_6d8e8e31].scene;
            if (isdefined(level.var_723bf922)) {
                if (level.var_723bf922 != var_4bcfb6f5) {
                    function_66b6e720(level.var_723bf922);
                }
            }
            level.var_723bf922 = var_4bcfb6f5;
            while (isdefined(level.var_723bf922) && !forcestreambundle(level.var_723bf922)) {
                wait(0.1);
            }
            if (isdefined(level.var_723bf922)) {
                params = {#var_8d3b5f69:1, #var_d8cb38a9:1, #var_c76f3e47:1};
                [[ level.cycle_frozen_moment_char_next ]]->function_15a8906a(level.var_4c6f850d[level.var_202758dc]);
                [[ level.cycle_frozen_moment_char_next ]]->update(params);
            }
        } else {
            level.var_3cea0f38 = 0;
        }
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x81bf7f99, Offset: 0xa8d0
// Size: 0x73a
function function_f00ff0c7(localclientnum) {
    level endon(#"disconnect");
    var_11302f48 = createuimodel(getglobaluimodel(), "LobbyClientPose");
    level.var_6f1da91a = [1:[], 0:[]];
    var_6aeec2ad = getdvarstring(#"hash_52abdac1a234fa29", "");
    var_c7581878 = function_7c77108d(localclientnum, level.var_6f1da91a[0], "lobby_player" + var_6aeec2ad + "_");
    var_c7581878 = max(function_7c77108d(localclientnum, level.var_6f1da91a[1], "arena_player_"), var_c7581878);
    level.var_90fa1c3e = var_c7581878;
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"lobby_change");
        if (level.lastlobbystate === "matchmaking" || level.lastlobbystate === "zm_online" || level.lastlobbystate === #"lobby_pose") {
            var_68a9a63c = function_664bca26(localclientnum, 1, 0, 1);
        } else {
            var_68a9a63c = function_77ccb73(1, 1);
        }
        if (isdefined(waitresult.var_a3325423) && waitresult.var_a3325423 || isdefined(waitresult.var_2c5ad26b) && waitresult.var_2c5ad26b) {
            for (i = 0; i < var_c7581878; i++) {
                if (i < var_68a9a63c.size) {
                    setuimodelvalue(createuimodel(var_11302f48, i), var_68a9a63c[i]);
                    foreach (var_3f0e790b, var_3a76595 in level.var_6f1da91a) {
                        var_7d4d74d3 = i > var_3a76595.size ? var_3a76595[i] : undefined;
                        if (isdefined(var_7d4d74d3) && (level.lastlobbystate === #"lobby_pose" || level.lastlobbystate === #"arena_pose" || level.lastlobbystate === #"private_lobby_pose")) {
                            var_7d4d74d3.target thread function_f00765ad(localclientnum, var_68a9a63c[i], var_7d4d74d3.character, i, var_3f0e790b);
                        } else if (level.lastlobbystate === "matchmaking" && !(isdefined(level.var_e76e961f) && level.var_e76e961f)) {
                            function_4fc36b1a(localclientnum, var_68a9a63c[i]);
                        } else if (isdefined(var_7d4d74d3)) {
                            var_7d4d74d3.character draft::cancel_spray();
                            var_7d4d74d3.character notify(#"cancel_gesture");
                            character_customization::function_bee62aa1(var_7d4d74d3.character);
                        }
                    }
                } else {
                    foreach (var_3f0e790b, var_3a76595 in level.var_6f1da91a) {
                        var_7d4d74d3 = i > var_3a76595.size ? var_3a76595[i] : undefined;
                        if (isdefined(var_7d4d74d3)) {
                            [[ var_7d4d74d3.character ]]->hide_model();
                            var_7d4d74d3.character draft::cancel_spray();
                            var_7d4d74d3.character notify(#"cancel_gesture");
                            character_customization::function_bee62aa1(var_7d4d74d3.character);
                        }
                    }
                }
            }
            forcenotifyuimodel(var_11302f48);
            if (level.lastlobbystate === "matchmaking" && !(isdefined(level.var_e76e961f) && level.var_e76e961f)) {
                function_ce0c92c1(localclientnum, var_68a9a63c);
                if (!(isdefined(level.var_494e824d) && level.var_494e824d) || !(isdefined(level.var_3cea0f38) && level.var_3cea0f38)) {
                    level thread function_6e9fbb54(localclientnum);
                }
            }
        }
        var_3a76595 = level.var_6f1da91a[draft::function_f701ad2a()];
        if (isdefined(var_3a76595)) {
            for (i = 0; i < var_c7581878; i++) {
                if (i < var_68a9a63c.size) {
                    var_7d4d74d3 = i > var_3a76595.size ? var_3a76595[i] : undefined;
                    if (isdefined(var_7d4d74d3) && (level.lastlobbystate === #"lobby_pose" || level.lastlobbystate === #"arena_pose" || level.lastlobbystate === #"private_lobby_pose")) {
                        draft::function_8be87802(localclientnum, var_7d4d74d3.character);
                    }
                }
            }
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xdd0d59cb, Offset: 0xb018
// Size: 0x15c
function function_b1b8f767(localclientnum, play) {
    var_6aeec2ad = getdvarstring(#"hash_52abdac1a234fa29", "");
    var_bfe5e572 = struct::get(#"lobby_align_tag" + var_6aeec2ad);
    if (isdefined(var_bfe5e572)) {
        if (play) {
            var_bfe5e572.var_e8b5aff5 = 1;
            function_b0442428(level.var_6f1da91a, 0);
            var_bfe5e572 thread scene::play("scene_frontend_lobby_team" + var_6aeec2ad);
        } else if (!play && isdefined(var_bfe5e572.var_e8b5aff5) && var_bfe5e572.var_e8b5aff5) {
            var_bfe5e572.var_e8b5aff5 = 0;
            function_f5eca51d(level.var_6f1da91a, 0);
            var_bfe5e572 thread scene::stop("scene_frontend_lobby_team" + var_6aeec2ad, 1);
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x324b4425, Offset: 0xb180
// Size: 0x11c
function function_db9d479f(localclientnum, play) {
    var_bfe5e572 = struct::get(#"arena_align_tag");
    if (isdefined(var_bfe5e572)) {
        if (play) {
            var_bfe5e572.var_e8b5aff5 = 1;
            function_b0442428(level.var_6f1da91a, 1);
            var_bfe5e572 thread scene::play("scene_frontend_arena_team");
        } else if (!play && isdefined(var_bfe5e572.var_e8b5aff5) && var_bfe5e572.var_e8b5aff5) {
            var_bfe5e572.var_e8b5aff5 = 0;
            function_f5eca51d(level.var_6f1da91a, 1);
            var_bfe5e572 thread scene::stop("scene_frontend_arena_team", 1);
        }
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x27aee8a7, Offset: 0xb2a8
// Size: 0xc4
function toggle_postfx(localclientnum, on_off, postfx) {
    player = function_5c10bd79(localclientnum);
    if (on_off && !player postfx::function_556665f2(postfx)) {
        player postfx::playpostfxbundle(postfx);
    } else if (!on_off && player postfx::function_556665f2(postfx)) {
        player postfx::stoppostfxbundle(postfx);
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0xbc4944dc, Offset: 0xb378
// Size: 0xb2
function function_ae99571d(localclientnum) {
    while (!isdefined(level.var_7208b551)) {
        wait(0.1);
    }
    var_f44acc91 = level.var_e362b5d9[level.var_be02eda3];
    var_d53ddee1 = function_25f808c9(localclientnum, var_f44acc91.mode, var_f44acc91.role_index);
    if (!isdefined(var_d53ddee1)) {
        var_d53ddee1 = character_customization::function_3f5625f1(var_f44acc91.mode, var_f44acc91.role_index);
    }
    return var_d53ddee1;
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xbb5a15e3, Offset: 0xb438
// Size: 0x114
function function_f03f5d4e(localclientnum, xuid, session_mode) {
    var_d53ddee1 = getcharactercustomizationforxuid(localclientnum, xuid);
    if (isdefined(var_d53ddee1)) {
        character_index = var_d53ddee1.charactertype;
        if (!function_b9f8bbd9(character_index, session_mode)) {
            var_d53ddee1 = undefined;
        }
    }
    if (!isdefined(var_d53ddee1)) {
        character_index = function_e3efec59(xuid, session_mode);
    }
    var_6d8e8e31 = function_3dc16db1(session_mode, character_index);
    if (isdefined(var_6d8e8e31)) {
        var_f44acc91 = level.var_e362b5d9[var_6d8e8e31];
        if (!isdefined(var_d53ddee1)) {
            var_d53ddee1 = character_customization::function_3f5625f1(var_f44acc91.mode, var_f44acc91.role_index);
        }
        return var_d53ddee1;
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xce6a2ff1, Offset: 0xb558
// Size: 0xc80
function lobby_main(localclientnum, menu_name, state) {
    level endon(menu_name + "_closed");
    setpbgactivebank(localclientnum, 1);
    if (isdefined(level.lastlobbystate) && state !== level.lastlobbystate) {
        if (level.lastlobbystate === #"lobby_pose" || level.lastlobbystate === #"private_lobby_pose") {
            function_b1b8f767(localclientnum, 0);
        } else if (level.lastlobbystate === #"arena_pose") {
            function_db9d479f(localclientnum, 0);
        } else if (level.lastlobbystate === "warzone" || level.lastlobbystate === "zm_online" || level.lastlobbystate === "zm_custom") {
            level notify(#"positiondraft_close", {#var_b69dc9af:1, #localclientnum:localclientnum});
            level waittill(#"hash_21c79522aa982cdd");
        } else if (level.lastlobbystate === "inspect_specialist") {
            level notify("menu_change" + localclientnum, {#mode:1, #state:undefined, #status:"closed", #menu:"directorTraining"});
        } else if (level.lastlobbystate === "matchmaking") {
            level.var_47863282 = function_9bed6a71(localclientnum, 1);
            level.var_202758dc = undefined;
            level.var_4c6f850d = undefined;
            level.var_723bf922 = undefined;
            function_e56abdb(localclientnum);
        }
    }
    camera_ent = struct::get(#"tag_align_frozen");
    var_fce147fa = 1;
    var_1c5551d6 = 0;
    var_d43870a7 = undefined;
    lut_index = 3;
    if (isdefined(camera_ent)) {
        var_d53ddee1 = undefined;
        if (!isdefined(state) || state == "room2") {
            lut_index = 2;
            var_d53ddee1 = function_ae99571d(localclientnum);
            /#
                update_room2_devgui(localclientnum);
            #/
        } else if (state == "room1") {
            setallcontrollerslightbarcolor((1, 0.4, 0));
            level thread pulse_controller_color();
            if (isdefined(level.var_ff851224)) {
                var_d53ddee1 = level.var_ff851224;
            } else if (isdefined(level.var_4e236556)) {
                var_d53ddee1 = level.var_4e236556;
            } else {
                var_d53ddee1 = function_ae99571d(localclientnum);
            }
        } else if (state == "room3") {
            var_d53ddee1 = function_ae99571d(localclientnum);
        } else if (state == "matchmaking") {
            if (isdefined(level.var_e76e961f) && level.var_e76e961f) {
                var_b19ae154 = function_9bed6a71(localclientnum, 1);
                if (isdefined(var_b19ae154)) {
                    var_d53ddee1 = function_f03f5d4e(localclientnum, var_b19ae154, 1);
                }
                if (!isdefined(var_d53ddee1)) {
                    var_6d8e8e31 = function_31a3348c(1);
                    var_f44acc91 = level.var_e362b5d9[var_6d8e8e31];
                    var_d53ddee1 = character_customization::function_7474681d(localclientnum, var_f44acc91.mode, var_f44acc91.role_index);
                }
            } else if (level.lastlobbystate !== state) {
                var_b0c618aa = 1;
            } else {
                if (!(isdefined(level.var_494e824d) && level.var_494e824d) || !(isdefined(level.var_3cea0f38) && level.var_3cea0f38)) {
                    level thread function_6e9fbb54(localclientnum);
                }
                var_fce147fa = 0;
            }
        } else if (state == #"lobby_pose" || state == #"private_lobby_pose") {
            level notify(#"lobby_change", {#var_a3325423:1});
            function_b1b8f767(localclientnum, 1);
        } else if (state == #"arena_pose") {
            level notify(#"lobby_change", {#var_a3325423:1});
            function_db9d479f(localclientnum, 1);
        } else if (state == "warzone") {
            if (!(isdefined(level.draftactive) && level.draftactive)) {
                level notify(#"positiondraft_open", {#localclientnum:localclientnum});
            } else if (!(isdefined(level.var_e6802f10) && level.var_e6802f10)) {
                level notify(#"hash_8946580b1303e30", {#localclientnum:localclientnum});
            }
        } else if (state == "zombie") {
            level.var_ff851224 = undefined;
            var_f44acc91 = level.var_e362b5d9[function_4a6953b8()];
            var_d43870a7 = var_f44acc91.scene;
            if (!forcestreambundle(var_d43870a7, 8, 4)) {
                stopmaincamxcam(localclientnum);
            }
            if (isdefined(level.var_8013e6bd) && level.var_8013e6bd != var_d43870a7) {
                function_a71254a9(localclientnum, 0, undefined, 1);
            }
            level.var_8013e6bd = undefined;
            var_d53ddee1 = character_customization::function_7474681d(localclientnum, var_f44acc91.mode, var_f44acc91.role_index);
        } else if (state == "zm_online" || state == "zm_custom") {
            level.var_ff851224 = undefined;
            if (!(isdefined(level.draftactive) && level.draftactive)) {
                level notify(#"positiondraft_open", {#localclientnum:localclientnum});
            } else {
                level notify(#"hash_8946580b1303e30", {#localclientnum:localclientnum});
            }
        } else if (state == "mode_select") {
            if (isdefined(level.var_ff851224)) {
                var_d53ddee1 = level.var_ff851224;
            } else if (isdefined(level.var_4e236556)) {
                var_d53ddee1 = level.var_4e236556;
            } else {
                while (!isdefined(level.var_7208b551)) {
                    wait(0.1);
                }
                var_f44acc91 = level.var_e362b5d9[level.var_be02eda3];
                var_d53ddee1 = character_customization::function_7474681d(localclientnum, var_f44acc91.mode, var_f44acc91.role_index);
            }
        } else if (state == "inspect_specialist" && level.lastlobbystate !== "inspect_specialist") {
            waitframe(1);
            controllermodel = getuimodelforcontroller(localclientnum);
            var_aa16ae79 = getuimodel(controllermodel, "SpecialistHeadquarters.ChosenSpecialistID");
            character_index = getuimodelvalue(var_aa16ae79);
            while (!isdefined(character_index) || character_index == 0) {
                wait(0.1);
                character_index = getuimodelvalue(var_aa16ae79);
            }
            level notify("menu_change" + localclientnum, {#mode:1, #state:character_index, #status:"opened", #menu:"directorTraining"});
        } else if (state == "inspect_specialist" && level.lastlobbystate === "inspect_specialist") {
            var_fce147fa = 0;
        } else {
            var_d53ddee1 = function_ae99571d(localclientnum);
        }
        if (var_fce147fa) {
            var_51dd69a5 = isdefined(var_d53ddee1);
            level thread function_a71254a9(localclientnum, var_51dd69a5, var_d53ddee1, var_1c5551d6, undefined, 0, var_d43870a7);
            toggle_postfx(localclientnum, var_51dd69a5, #"hash_50a4ae6595f15cb0");
            toggle_postfx(localclientnum, !var_51dd69a5, #"hash_e1c80e52b24b46b");
        }
    }
    if (!isdefined(state) || state != "room1") {
        setallcontrollerslightbarcolor();
        level notify(#"end_controller_pulse");
    }
    level.lastlobbystate = state;
    if (isdefined(var_b0c618aa) && var_b0c618aa) {
        level notify(#"lobby_change", {#var_a3325423:1});
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xf3fb6c37, Offset: 0xc1e0
// Size: 0x9c
function function_58994f4a(localclientnum, menu_data) {
    level thread function_a71254a9(localclientnum, 0);
    function_e56abdb(localclientnum);
    toggle_postfx(localclientnum, 0, #"hash_50a4ae6595f15cb0");
    toggle_postfx(localclientnum, 0, #"hash_e1c80e52b24b46b");
}

// Namespace frontend/frontend
// Params 1, eflags: 0x0
// Checksum 0x80782190, Offset: 0xc288
// Size: 0x2c
function update_room2_devgui(localclientnum) {
    /#
        level thread mp_devgui::remove_mp_contracts_devgui(localclientnum);
    #/
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0xceb74f92, Offset: 0xc2c0
// Size: 0x74
function update_mp_lobby_room_devgui(localclientnum, state) {
    /#
        if (state == "<unknown string>" || state == "<unknown string>") {
            level thread mp_devgui::create_mp_contracts_devgui(localclientnum);
        } else {
            level mp_devgui::remove_mp_contracts_devgui(localclientnum);
        }
    #/
}

// Namespace frontend/frontend
// Params 0, eflags: 0x1 linked
// Checksum 0x120b6300, Offset: 0xc340
// Size: 0xca
function pulse_controller_color() {
    level endon(#"end_controller_pulse");
    delta_t = -0.01;
    t = 1;
    while (1) {
        setallcontrollerslightbarcolor((1 * t, 0.2 * t, 0));
        t = t + delta_t;
        if (t < 0.2 || t > 0.99) {
            delta_t = delta_t * -1;
        }
        waitframe(1);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x4
// Checksum 0xb51f5bfd, Offset: 0xc418
// Size: 0xa8
function private function_70733b8c(session_mode, character_index) {
    foreach (var_dea538a3 in level.var_e362b5d9) {
        if (var_dea538a3.role_index == character_index && var_dea538a3.mode == session_mode) {
            return var_dea538a3;
        }
    }
}

// Namespace frontend/frontend
// Params 7, eflags: 0x1 linked
// Checksum 0x933b4c87, Offset: 0xc4c8
// Size: 0x534
function function_a71254a9(localclientnum, play, var_211dbb67, var_1c5551d6 = 0, scene_shot = undefined, var_ddc01a5 = 0, var_7318f7f0 = undefined) {
    self notify("6b72393916eafd89");
    self endon("6b72393916eafd89");
    /#
        /#
            assert(!play || isdefined(var_211dbb67));
        #/
    #/
    if (play && (!isdefined(level.var_8013e6bd) || character_customization::function_aa5382ed(level.var_4e236556, var_211dbb67))) {
        while (!isdefined(level.var_7208b551)) {
            wait(0.1);
        }
        if (isdefined(var_7318f7f0)) {
            var_53511779 = var_7318f7f0;
        } else if (isdefined(var_211dbb67)) {
            var_6d8e8e31 = function_3dc16db1(var_211dbb67.charactermode, var_211dbb67.charactertype);
            if (isdefined(var_6d8e8e31)) {
                var_53511779 = level.var_e362b5d9[var_6d8e8e31].scene;
            }
        }
        if (isdefined(var_53511779)) {
            if (isdefined(level.var_8013e6bd) && level.var_8013e6bd !== var_53511779) {
                stopmaincamxcam(localclientnum);
            }
            if (!(isdefined(level.lastlobbystate) && level.lastlobbystate == "matchmaking")) {
                fbc = getuimodel(getglobaluimodel(), "lobbyRoot.fullscreenBlackCount");
                setuimodelvalue(fbc, 1);
            }
            if (isdefined(scene_shot)) {
                var_e9a3b264 = scene::get_all_shot_names(var_53511779, undefined, 0);
                if (!isdefined(var_e9a3b264) || var_e9a3b264.size == 0 || !array::contains(var_e9a3b264, scene_shot)) {
                    scene_shot = undefined;
                }
            }
            [[ level.frozen_moment_character ]]->function_15a8906a(var_211dbb67);
            params = {#scene_shot:scene_shot, #var_8d3b5f69:1, #var_d8cb38a9:1, #var_c76f3e47:1, #scene:var_53511779};
            [[ level.frozen_moment_character ]]->update(params);
            character_index = [[ level.frozen_moment_character ]]->function_9004475c();
            character_mode = [[ level.frozen_moment_character ]]->get_character_mode();
            var_6d8e8e31 = isdefined(function_3dc16db1(character_mode, character_index)) ? function_3dc16db1(character_mode, character_index) : 0;
            level.var_8013e6bd = var_53511779;
            level.var_4e236556 = var_211dbb67;
            function_cdbcba12(localclientnum, isdefined(level.var_e362b5d9[var_6d8e8e31].fields.var_5c403974) ? level.var_e362b5d9[var_6d8e8e31].fields.var_5c403974 : 0, 1);
            if (!var_ddc01a5) {
                function_66b6e720(level.var_8013e6bd);
            }
        }
    } else if (!play && isdefined(level.var_8013e6bd)) {
        [[ level.frozen_moment_character ]]->function_39a68bf2();
        fbc = getuimodel(getglobaluimodel(), "lobbyRoot.fullscreenBlackCount");
        if (var_1c5551d6) {
            setuimodelvalue(fbc, 1);
        } else {
            setuimodelvalue(fbc, 0);
        }
        level.var_8013e6bd = undefined;
        level.var_4e236556 = undefined;
        function_cdbcba12(localclientnum, 0, 1);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xa1b4b2ed, Offset: 0xca08
// Size: 0x130
function function_e56abdb(localclientnum, var_d50f88e0 = 0) {
    if (isdefined(level.var_494e824d) && level.var_494e824d) {
        [[ level.cycle_frozen_moment_char_current ]]->function_39a68bf2();
        [[ level.cycle_frozen_moment_char_next ]]->function_39a68bf2();
        fbc = getuimodel(getglobaluimodel(), "lobbyRoot.fullscreenBlackCount");
        if (var_d50f88e0) {
            setuimodelvalue(fbc, 1);
        } else {
            setuimodelvalue(fbc, 0);
        }
        function_cdbcba12(localclientnum, 0, 1);
        level.var_494e824d = 0;
        level.var_3cea0f38 = 0;
        level notify(#"hash_73b4088ba8bf09ca");
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xcf1867ca, Offset: 0xcb40
// Size: 0x136
function function_9602c423(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_character_gesture", 0, "", "", camera_ent.origin, camera_ent.angles);
    if (isdefined(state)) {
        [[ var_d0b01271 ]]->set_character_index(state);
        level notify("updateSpecialistCustomization" + localclientnum, {#mode:currentsessionmode(), #character_index:state, #event_name:"changeHero"});
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x6877656e, Offset: 0xcc80
// Size: 0x126
function function_25b060af(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_loadout_character", 0, "", "", camera_ent.origin, camera_ent.angles);
    if (isdefined(state)) {
        [[ var_d0b01271 ]]->set_character_index(state);
        level notify("updateSpecialistCustomization" + localclientnum, {#mode:1, #character_index:state, #event_name:"changeHero"});
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x9223616b, Offset: 0xcdb0
// Size: 0x1ce
function function_f8cec907(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"wz_unlock_struct");
    playmaincamxcam(localclientnum, #"ui_scene_cam_wz_unlock", 0, "", "", camera_ent.origin, camera_ent.angles);
    if (isdefined(state)) {
        args = strtok(state, ";");
        char_index = int(isdefined(args[0]) ? args[0] : 0);
        outfit_index = int(isdefined(args[1]) ? args[1] : 0);
        [[ var_d0b01271 ]]->set_character_mode(3);
        [[ var_d0b01271 ]]->set_character_index(char_index);
        level notify("updateSpecialistCustomization" + localclientnum, {#outfit_index:outfit_index, #event_name:"changeOutfit"});
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x6579fb10, Offset: 0xcf88
// Size: 0x1e
function function_a72640b3(localclientnum, menu_data) {
    level.var_8b9b6862 = undefined;
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x4d5c0525, Offset: 0xcfb0
// Size: 0x154
function function_6657c529(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    lerp_time = isdefined(level.var_8b9b6862) ? 300 : 0;
    level.var_8b9b6862 = state;
    if (state === "face") {
        playmaincamxcam(localclientnum, #"ui_cam_character_customization_head", lerp_time, "", "", camera_ent.origin, camera_ent.angles);
    } else {
        playmaincamxcam(localclientnum, #"ui_cam_character_customization_3d", lerp_time, "", "", camera_ent.origin, camera_ent.angles);
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x62d06603, Offset: 0xd110
// Size: 0x124
function function_d8402f0c(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    if (isdefined(state)) {
        [[ var_d0b01271 ]]->set_character_index(state);
        level notify("updateSpecialistCustomization" + localclientnum, {#mode:0, #character_index:state, #event_name:"changeHero"});
    }
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_character_customization_3d", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x6b6f4a29, Offset: 0xd240
// Size: 0xbc
function wz_personalize_character(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_character_customization_3d", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x0
// Checksum 0xfa590a82, Offset: 0xd308
// Size: 0xb4
function function_a8095769(localclientnum, menu_name) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"tag_align_quartermaster");
    playmaincamxcam(localclientnum, #"ui_cam_store_camera", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x24f98f15, Offset: 0xd3c8
// Size: 0xdc
function function_7142469f(localclientnum, menu_data) {
    level notify(#"blackmarket_closed");
    level thread scene::stop(level.var_d29ac799, 1);
    level.var_d29ac799 = undefined;
    if (isdefined(level.var_c7cd91f5)) {
        stopradiantexploder(localclientnum, level.var_c7cd91f5);
        level.var_c7cd91f5 = undefined;
    }
    season = getdvarstring(#"mtx_seasonal_exploder");
    stopradiantexploder(localclientnum, "fxexp_mtx_ambient" + season);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xb6129d81, Offset: 0xd4b0
// Size: 0x292
function function_3e7aaaea(localclientnum, weapon_model, waitresult) {
    self notify("360f824f6d7c11d5");
    self endon("360f824f6d7c11d5");
    level endon(#"qmweaponupdate");
    var_9d7ee952 = getdvarint(#"hash_41ef264ae8370dc7", 5);
    activecamoinfo = activecamo::function_ae141bf2(waitresult.activecamoindex);
    if (isdefined(activecamoinfo) && activecamoinfo.stages.size > 1) {
        stage = 0;
        while (1) {
            if (isdefined(level.var_324c3190[localclientnum])) {
                weapon_model stoprenderoverridebundle(level.var_324c3190[localclientnum]);
                level.var_324c3190[localclientnum] = undefined;
            }
            var_3594168e = activecamoinfo.stages[stage];
            if (!isdefined(var_3594168e.disabled) || var_3594168e.disabled == 0) {
                var_d6e83d42 = function_8b51d9d1(var_3594168e.var_879c8798);
                render_options = function_140a6212(var_d6e83d42, 0, waitresult.model_idx, 0, 0, 0);
                weapon = getweapon(waitresult.weapon_ref);
                var_2d45743e = function_2a6e79cf(weapon);
                weapon_model useweaponmodel(weapon, undefined, render_options);
                weapon_model setscale(var_2d45743e.scale);
                activecamo::function_374e37a0(localclientnum, weapon_model, var_3594168e, level.var_324c3190);
                wait(var_9d7ee952);
            }
            stage = (stage + 1) % activecamoinfo.stages.size;
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x87554da4, Offset: 0xd750
// Size: 0x2a0
function function_98088878(localclientnum, menu_data) {
    level endon(menu_data.menu_name + "_closed");
    season = getdvarstring(#"mtx_seasonal_exploder");
    playradiantexploder(localclientnum, "fxexp_mtx_ambient" + season);
    weapon_model = getent(localclientnum, "quartermaster_weapon", "targetname");
    var_7ef44086 = struct::get("tag_align_quartermaster_weapon");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill(#"qmweaponupdate");
        if (isdefined(level.var_324c3190[localclientnum])) {
            weapon_model stoprenderoverridebundle(level.var_324c3190[localclientnum]);
            level.var_324c3190[localclientnum] = undefined;
        }
        camoindex = 0;
        if (isdefined(waitresult.camoindex)) {
            camoindex = waitresult.camoindex;
        }
        render_options = function_140a6212(camoindex, 0, waitresult.model_idx, 0, 0, 0);
        weapon = getweapon(waitresult.weapon_ref);
        var_2d45743e = function_2a6e79cf(weapon);
        weapon_model useweaponmodel(weapon, undefined, render_options);
        weapon_model setscale(var_2d45743e.scale);
        weapon_model.origin = var_7ef44086.origin + var_2d45743e.offset;
        weapon_model.angles = var_7ef44086.angles;
        if (isdefined(waitresult.activecamoindex)) {
            childthread function_3e7aaaea(localclientnum, weapon_model, waitresult);
        }
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xaa632a80, Offset: 0xd9f8
// Size: 0x4bc
function function_837446a8(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    weapon_model = getent(localclientnum, "quartermaster_weapon", "targetname");
    level notify("end_character_rotating" + localclientnum);
    switch (state) {
    case #"character":
    case #"gesture":
        [[ var_d0b01271 ]]->function_4240a39a(1, vectorscale((0, 1, 0), 90));
        level thread character_customization::rotation_thread_spawner(localclientnum, var_d0b01271, "end_character_rotating" + localclientnum);
        [[ var_d0b01271 ]]->function_4240a39a(0);
        [[ var_d0b01271 ]]->show_model();
        weapon_model hide();
        scene = #"scene_frontend_quartermaster_character";
        break;
    case #"character_full":
        [[ var_d0b01271 ]]->function_4240a39a(1, vectorscale((0, 1, 0), 90));
        level thread character_customization::rotation_thread_spawner(localclientnum, var_d0b01271, "end_character_rotating" + localclientnum);
        [[ var_d0b01271 ]]->function_4240a39a(0);
        [[ var_d0b01271 ]]->show_model();
        weapon_model hide();
        scene = #"scene_frontend_quartermaster_character_full";
        break;
    case #"character_face":
        [[ var_d0b01271 ]]->function_4240a39a(1, vectorscale((0, 1, 0), 90));
        level thread character_customization::rotation_thread_spawner(localclientnum, var_d0b01271, "end_character_rotating" + localclientnum);
        [[ var_d0b01271 ]]->function_4240a39a(0);
        [[ var_d0b01271 ]]->show_model();
        weapon_model hide();
        scene = #"scene_frontend_quartermaster_character_face";
        break;
    case #"weapon":
        [[ var_d0b01271 ]]->hide_model();
        weapon_model show();
        scene = #"scene_frontend_quartermaster_weapon";
        break;
    case #"crate":
        [[ var_d0b01271 ]]->hide_model();
        weapon_model hide();
        season = getdvarstring(#"mtx_seasonal_exploder");
        scene = #"scene_frontend_quartermaster_crate" + season;
        exploder = "fxexp_mtx_crate" + season;
        break;
    default:
        [[ var_d0b01271 ]]->hide_model();
        weapon_model hide();
        scene = #"scene_frontend_quartermaster";
        break;
    }
    if (level.var_c7cd91f5 !== exploder) {
        if (isdefined(level.var_c7cd91f5)) {
            stopradiantexploder(localclientnum, level.var_c7cd91f5);
        }
        if (isdefined(exploder)) {
            playradiantexploder(localclientnum, exploder);
        }
        level.var_c7cd91f5 = exploder;
    }
    if (level.var_d29ac799 !== scene) {
        if (isdefined(level.var_d29ac799)) {
            level scene::stop(level.var_d29ac799, 1);
        }
        level.var_d29ac799 = scene;
        level thread scene::play(level.var_d29ac799);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x588f177d, Offset: 0xdec0
// Size: 0x34
function function_d252281d(localclientnum, menu_data) {
    draft::function_532dfc0b(localclientnum, 0, 1);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x9578202b, Offset: 0xdf00
// Size: 0xdc
function function_36962bc4(localclientnum, menu_name, state) {
    self notify("1e968675840551ec");
    self endon("1e968675840551ec");
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_character_customization_3d", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x4bf73c9f, Offset: 0xdfe8
// Size: 0x144
function function_8ad37038(localclientnum, menu_name, state) {
    self notify("39be01a84c2a84b");
    self endon("39be01a84c2a84b");
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    if (isdefined(state)) {
        [[ var_d0b01271 ]]->set_character_index(state);
        level notify("updateSpecialistCustomization" + localclientnum, {#mode:3, #character_index:state, #event_name:"changeHero"});
    }
    [[ var_d0b01271 ]]->show_model();
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_loadout_character", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xb5ffaccf, Offset: 0xe138
// Size: 0x8c
function function_bc98f036(localclientnum, menu_name, state) {
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_character_customization_3d", 0, "", "", camera_ent.origin, camera_ent.angles);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xf7944010, Offset: 0xe1d0
// Size: 0x2c
function function_5e7dcbed(localclientnum, menu_data) {
    [[ menu_data.custom_character ]]->function_1ec9448d(0);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x543ef7a6, Offset: 0xe208
// Size: 0xcc
function function_ac9a8cf(localclientnum, menu_name, state) {
    camera_ent = struct::get(#"cac_specialist_angle");
    playmaincamxcam(localclientnum, #"ui_cam_character_customization_3d", 0, "", "", camera_ent.origin, camera_ent.angles);
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    level thread function_914198cd(localclientnum, var_d0b01271, menu_name);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x9f318a03, Offset: 0xe2e0
// Size: 0x14e
function function_914198cd(localclientnum, var_d0b01271, menu_name) {
    level endon(#"disconnect");
    level endon(menu_name + "_closed");
    while (1) {
        waitresult = undefined;
        waitresult = level waittill("deathfx_update_" + localclientnum);
        switch (waitresult.event_name) {
        case #"updatecharacter":
            var_d0b01271 function_79c881da(localclientnum, waitresult.mode);
            break;
        case #"previewdeathfx":
            var_d0b01271 notify(#"cancel_deathfx");
            var_d0b01271 thread function_317ab257(localclientnum, menu_name, waitresult.deathfxindex);
            break;
        case #"stopdeathfx":
            var_d0b01271 function_ca43d336(localclientnum);
            break;
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xba3cc50e, Offset: 0xe438
// Size: 0xac
function function_79c881da(localclientnum, mode) {
    [[ self ]]->set_character_index(1);
    [[ self ]]->function_22039feb();
    [[ self ]]->function_1ec9448d(1);
    if (isdefined(mode)) {
        [[ self ]]->set_character_mode(mode);
    }
    [[ self ]]->show_model();
    params = {};
    function_d3cd6cf7(localclientnum, self, {}, params);
    [[ self ]]->update(params);
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0x4c2f3f60, Offset: 0xe4f0
// Size: 0x4d6
function function_317ab257(localclientnum, menu_name, var_83a11058) {
    self notify("5befa1e0f1c95e1e");
    self endon("5befa1e0f1c95e1e");
    level endon(#"disconnect");
    level endon(menu_name + "_closed");
    self endon(#"cancel_deathfx");
    var_cc8a3490 = #"hash_521de69029125f63";
    var_7d89d45 = #"hash_33ffd8c85b4da392";
    var_e04a6c21 = #"hash_4c04b62047703a60";
    if (![[ self ]]->function_ea4ac9f8()) {
        return;
    }
    var_2ae2bfde = function_b52a94ae(var_83a11058);
    if (isdefined(var_2ae2bfde)) {
        var_cc8a3490 = isdefined(var_2ae2bfde.var_cc8a3490) ? var_2ae2bfde.var_cc8a3490 : #"hash_521de69029125f63";
        var_7d89d45 = isdefined(var_2ae2bfde.var_7d89d45) ? var_2ae2bfde.var_7d89d45 : #"hash_521de69029125f63";
        var_e04a6c21 = isdefined(var_2ae2bfde.var_e04a6c21) ? var_2ae2bfde.var_e04a6c21 : #"hash_4c04b62047703a60";
    }
    self function_ca43d336(localclientnum);
    var_1035f50c = (0, 0, 0);
    v_forward = vectorscale((1, 0, 0), 90);
    character_model = [[ self ]]->function_217b10ed();
    if (isdefined(character_model)) {
        var_5f26f63 = character_model gettagangles("j_spine4");
        var_46abe989 = character_model gettagorigin("j_spine4");
        if (isdefined(var_5f26f63) && isdefined(var_46abe989)) {
            var_5f26f63 = var_5f26f63 + v_forward;
            var_46abe989 = var_46abe989 + anglestoforward((0, var_5f26f63[1], 0));
            [[ self ]]->function_82e05d64().var_d35ebd8e = playfx(localclientnum, var_cc8a3490, var_46abe989, anglestoforward(var_5f26f63), anglestoup(var_5f26f63));
            wait(0.3);
        }
    }
    character_model = [[ self ]]->function_217b10ed();
    if (isdefined(character_model)) {
        var_bee5328d = character_model gettagangles("j_neck");
        var_78a78382 = character_model gettagorigin("j_neck");
        if (isdefined(var_bee5328d) && isdefined(var_78a78382)) {
            var_bee5328d = var_bee5328d + v_forward;
            var_78a78382 = var_78a78382 + anglestoforward((0, var_bee5328d[1], 0));
            [[ self ]]->function_82e05d64().var_bef648d0 = playfx(localclientnum, var_7d89d45, var_78a78382, anglestoforward(var_bee5328d), anglestoup(var_bee5328d));
            wait(0.5);
        }
    }
    character_model = [[ self ]]->function_217b10ed();
    if (isdefined(character_model)) {
        var_7110530b = character_model gettagangles("j_head");
        var_ad65ea66 = character_model gettagorigin("j_head");
        if (isdefined(var_7110530b) && isdefined(var_ad65ea66)) {
            var_7110530b = var_7110530b + v_forward;
            var_ad65ea66 = var_ad65ea66 + anglestoforward((0, var_7110530b[1], 0));
            [[ self ]]->function_82e05d64().var_21cb8ea6 = playfx(localclientnum, var_e04a6c21, var_ad65ea66, anglestoforward(var_7110530b), anglestoup(var_7110530b));
        }
    }
}

// Namespace frontend/frontend
// Params 1, eflags: 0x1 linked
// Checksum 0x5c38d98, Offset: 0xe9d0
// Size: 0x11a
function function_ca43d336(localclientnum) {
    if (isdefined([[ self ]]->function_82e05d64().var_d35ebd8e)) {
        killfx(localclientnum, [[ self ]]->function_82e05d64().var_d35ebd8e);
        [[ self ]]->function_82e05d64().var_d35ebd8e = undefined;
    }
    if (isdefined([[ self ]]->function_82e05d64().var_bef648d0)) {
        killfx(localclientnum, [[ self ]]->function_82e05d64().var_bef648d0);
        [[ self ]]->function_82e05d64().var_bef648d0 = undefined;
    }
    if (isdefined([[ self ]]->function_82e05d64().var_21cb8ea6)) {
        killfx(localclientnum, [[ self ]]->function_82e05d64().var_21cb8ea6);
        [[ self ]]->function_82e05d64().var_21cb8ea6 = undefined;
    }
}

// Namespace frontend/frontend
// Params 3, eflags: 0x1 linked
// Checksum 0xa79188e5, Offset: 0xeaf8
// Size: 0x36c
function function_73b8462a(localclientnum, menu_name, state) {
    var_d0b01271 = lui::getcharacterdataformenu(menu_name, localclientnum);
    if (state === "character") {
        [[ var_d0b01271 ]]->show_model();
    } else {
        [[ var_d0b01271 ]]->hide_model();
    }
    session_mode = currentsessionmode();
    if (session_mode == 4) {
        return;
    }
    var_a5454544 = createuimodel(getuimodelforcontroller(localclientnum), "AAR.characterIndex");
    character_index = getuimodelvalue(var_a5454544);
    var_a2865de6 = getplayerroletemplatecount(session_mode);
    attempts = 0;
    while (1) {
        if (!isdefined(character_index)) {
            character_index = 0;
        }
        if (function_f4bf7e3f(character_index, session_mode)) {
            break;
        } else {
            attempts++;
            if (attempts > 3) {
                character_index = undefined;
                for (ci = 0; ci < var_a2865de6; ci++) {
                    if (function_f4bf7e3f(ci, session_mode)) {
                        character_index = ci;
                        break;
                    }
                }
                break;
            }
        }
    }
    /#
        assert(character_index);
    #/
    fields = getcharacterfields(character_index, session_mode);
    if (isdefined(fields) && isdefined(fields.var_47c73c9d)) {
        level.var_c8fac6ea = fields.var_47c73c9d;
    } else if (currentsessionmode() == 0) {
        level.var_c8fac6ea = "scene_frontend_aar_zm";
    } else if (currentsessionmode() == 3) {
        level.var_c8fac6ea = "scene_frontend_aar_wz";
    } else if (util::is_arena_lobby()) {
        level.var_c8fac6ea = "scene_frontend_aar_arena";
    } else {
        level.var_c8fac6ea = "scene_frontend_aar";
    }
    if (!level scene::is_playing(level.var_c8fac6ea)) {
        [[ var_d0b01271 ]]->set_character_mode(session_mode);
        [[ var_d0b01271 ]]->set_character_index(character_index);
        [[ var_d0b01271 ]]->function_77e3be08();
        [[ var_d0b01271 ]]->update(undefined);
        level thread scene::play(level.var_c8fac6ea);
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x95937561, Offset: 0xee70
// Size: 0x4e
function function_48fb04a7(localclientnum, menu_name) {
    if (isdefined(level.var_c8fac6ea)) {
        level thread scene::stop(level.var_c8fac6ea);
        level.var_c8fac6ea = undefined;
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x29a0fb85, Offset: 0xeec8
// Size: 0xb0
function function_2f93d681(localclientnum, entities) {
    foreach (ent in entities) {
        if (isdefined(ent) && isdefined(ent.model)) {
            ent playrenderoverridebundle(#"rob_zm_eyes_red");
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xef4b03d2, Offset: 0xef80
// Size: 0x54
function function_12f56a9(localclientnum, entities) {
    lut_index = randomintrange(7, 10);
    setlutscriptindex(localclientnum, lut_index, 1);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xf0d62240, Offset: 0xefe0
// Size: 0x2c
function function_1bff2e73(localclientnum, entities) {
    setlutscriptindex(localclientnum, 0, 0);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0xc39e403b, Offset: 0xf018
// Size: 0x5c
function function_3dde055b(localclientnum, new_menu) {
    var_d0b01271 = lui::getcharacterdataformenu("MPSpecialistHUBPreviewMoment", localclientnum);
    function_a71254a9(localclientnum, 1, [[ var_d0b01271 ]]->function_e599283f());
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x1be52306, Offset: 0xf080
// Size: 0x2c
function function_c4db2740(localclientnum, prev_menu) {
    function_a71254a9(localclientnum, 0, undefined);
}

// Namespace frontend/frontend
// Params 4, eflags: 0x1 linked
// Checksum 0x9219234a, Offset: 0xf0b8
// Size: 0xd4
function function_ebc650f4(localclientnum, entities, var_dea538a3, scene_shot) {
    if (isdefined(level.var_494e824d) && level.var_494e824d) {
        if ([[ level.cycle_frozen_moment_char_next ]]->function_ea4ac9f8()) {
            if (!isdefined(level.var_37fcc91f)) {
                level.var_37fcc91f = scene_shot;
            } else if (level.var_37fcc91f != scene_shot) {
                level.var_37fcc91f = undefined;
                level notify(#"hash_5661859119127749");
            }
        } else if (!isdefined(level.var_202758dc)) {
            function_6e9fbb54(localclientnum);
        }
    }
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x137732f7, Offset: 0xf198
// Size: 0x34
function function_fad4ce33(localclientnum, entities) {
    setlutscriptindex(localclientnum, 5, 1);
}

// Namespace frontend/frontend
// Params 2, eflags: 0x1 linked
// Checksum 0x4efb90df, Offset: 0xf1d8
// Size: 0x2c
function function_c5cbf7d6(localclientnum, entities) {
    setlutscriptindex(localclientnum, 0, 0);
}

