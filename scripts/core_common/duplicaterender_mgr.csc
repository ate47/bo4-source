// Atian COD Tools GSC decompiler test
#using scripts\core_common\shoutcaster.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\flagsys_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\filter_shared.csc;
#using scripts\core_common\callbacks_shared.csc;

#namespace duplicate_render;

// Namespace duplicate_render/duplicaterender_mgr
// Params 0, eflags: 0x2
// Checksum 0x37b13407, Offset: 0x2f8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"duplicate_render", &__init__, undefined, undefined);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 0, eflags: 0x1 linked
// Checksum 0x25565447, Offset: 0x340
// Size: 0x3c6
function __init__() {
    if (!isdefined(level.drfilters)) {
        level.drfilters = [];
    }
    set_dr_filter_framebuffer("none_fb", 0, undefined, undefined, 0, 1, 0);
    set_dr_filter_framebuffer_duplicate("none_fbd", 0, undefined, undefined, 1, 0, 0);
    set_dr_filter_offscreen("none_os", 0, undefined, undefined, 2, 0, 0);
    set_dr_filter_framebuffer("frveh_fb", 8, "friendlyvehicle_fb", undefined, 0, 1, 1);
    set_dr_filter_offscreen("retrv", 5, "retrievable", undefined, 2, "mc/hud_keyline_retrievable", 1);
    set_dr_filter_offscreen("unplc", 7, "unplaceable", undefined, 2, "mc/hud_keyline_unplaceable", 1);
    set_dr_filter_offscreen("eneqp", 8, "enemyequip", undefined, 2, "mc/hud_outline_rim", 1);
    set_dr_filter_offscreen("enexp", 8, "enemyexplo", undefined, 2, "mc/hud_outline_rim", 1);
    set_dr_filter_offscreen("enveh", 8, "enemyvehicle", undefined, 2, "mc/hud_outline_rim", 1);
    set_dr_filter_offscreen("freqp", 8, "friendlyequip", undefined, 2, "mc/hud_keyline_friendlyequip", 1);
    set_dr_filter_offscreen("frexp", 8, "friendlyexplo", undefined, 2, "mc/hud_keyline_friendlyequip", 1);
    set_dr_filter_offscreen("frveh", 8, "friendlyvehicle", undefined, 2, "mc/hud_keyline_friendlyequip", 1);
    set_dr_filter_offscreen("infrared", 9, "infrared_entity", undefined, 2, 2, 1);
    set_dr_filter_offscreen("threat_detector_enemy", 10, "threat_detector_enemy", undefined, 2, "mc/hud_keyline_enemyequip", 1);
    set_dr_filter_offscreen("bcarrier", 9, "ballcarrier", undefined, 2, "mc/hud_keyline_friendlyequip", 1);
    set_dr_filter_offscreen("poption", 9, "passoption", undefined, 2, "mc/hud_keyline_friendlyequip", 1);
    set_dr_filter_offscreen("draft_unselected", 10, "draft_unselected", undefined, 0, "mc/hud_outline_model_z_scriptint", 1);
    level.friendlycontentoutlines = getdvarint(#"friendlycontentoutlines", 0);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x0
// Checksum 0x437b332f, Offset: 0x710
// Size: 0x74
function on_player_spawned(local_client_num) {
    self.currentdrfilter = [];
    self change_dr_flags(local_client_num);
    if (!level flagsys::get(#"duplicaterender_registry_ready")) {
        waitframe(1);
        level flagsys::set(#"duplicaterender_registry_ready");
    }
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 14, eflags: 0x1 linked
// Checksum 0x7bf740c5, Offset: 0x790
// Size: 0x37c
function set_dr_filter(filterset, name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3) {
    if (!isdefined(level.drfilters)) {
        level.drfilters = [];
    }
    if (!isdefined(level.drfilters[filterset])) {
        level.drfilters[filterset] = [];
    }
    if (!isdefined(level.drfilters[filterset][name])) {
        level.drfilters[filterset][name] = spawnstruct();
    }
    filter = level.drfilters[filterset][name];
    filter.name = name;
    filter.priority = priority * -1;
    if (!isdefined(require_flags)) {
        filter.require = [];
    } else if (isarray(require_flags)) {
        filter.require = require_flags;
    } else {
        filter.require = strtok(require_flags, ",");
    }
    if (!isdefined(refuse_flags)) {
        filter.refuse = [];
    } else if (isarray(refuse_flags)) {
        filter.refuse = refuse_flags;
    } else {
        filter.refuse = strtok(refuse_flags, ",");
    }
    filter.types = [];
    filter.values = [];
    filter.culling = [];
    filter.method = [];
    if (isdefined(drtype1)) {
        idx = filter.types.size;
        filter.types[idx] = drtype1;
        filter.values[idx] = drval1;
        filter.culling[idx] = drcull1;
    }
    if (isdefined(drtype2)) {
        idx = filter.types.size;
        filter.types[idx] = drtype2;
        filter.values[idx] = drval2;
        filter.culling[idx] = drcull2;
    }
    if (isdefined(drtype3)) {
        idx = filter.types.size;
        filter.types[idx] = drtype3;
        filter.values[idx] = drval3;
        filter.culling[idx] = drcull3;
    }
    thread register_filter_materials(filter);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 13, eflags: 0x1 linked
// Checksum 0xed5dfb70, Offset: 0xb18
// Size: 0xb4
function set_dr_filter_framebuffer(name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3) {
    set_dr_filter("framebuffer", name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params d, eflags: 0x1 linked
// Checksum 0xd38985fd, Offset: 0xbd8
// Size: 0xb4
function set_dr_filter_framebuffer_duplicate(name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3) {
    set_dr_filter("framebuffer_duplicate", name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params d, eflags: 0x1 linked
// Checksum 0x5f9aabbc, Offset: 0xc98
// Size: 0xb4
function set_dr_filter_offscreen(name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3) {
    set_dr_filter("offscreen", name, priority, require_flags, refuse_flags, drtype1, drval1, drcull1, drtype2, drval2, drcull2, drtype3, drval3, drcull3);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x1 linked
// Checksum 0xc16dd3d6, Offset: 0xd58
// Size: 0x17e
function register_filter_materials(filter) {
    playercount = undefined;
    opts = filter.types.size;
    for (i = 0; i < opts; i++) {
        value = filter.values[i];
        if (isstring(value)) {
            if (!isdefined(playercount)) {
                while (!isdefined(level.localplayers) && !isdefined(level.frontendclientconnected)) {
                    waitframe(1);
                }
                if (isdefined(level.frontendclientconnected)) {
                    playercount = 1;
                } else {
                    util::waitforallclients();
                    playercount = level.localplayers.size;
                }
            }
            if (!isdefined(filter::mapped_material_id(value))) {
                for (localclientnum = 0; localclientnum < playercount; localclientnum++) {
                    filter::map_material_helper_by_localclientnum(localclientnum, value);
                }
            }
        }
    }
    filter.priority = abs(filter.priority);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 3, eflags: 0x1 linked
// Checksum 0xead80250, Offset: 0xee0
// Size: 0x5c
function update_dr_flag(localclientnum, toset, setto = 1) {
    if (set_dr_flag(toset, setto)) {
        update_dr_filters(localclientnum);
    }
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x90c34392, Offset: 0xf48
// Size: 0xc0
function set_dr_flag_not_array(toset, setto = 1) {
    if (!isdefined(self.flag) || !isdefined(self.flag[toset])) {
        self flag::init(toset);
    }
    if (setto == self.flag[toset]) {
        return 0;
    }
    if (isdefined(setto) && setto) {
        self flag::set(toset);
    } else {
        self flag::clear(toset);
    }
    return 1;
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x1 linked
// Checksum 0x785fded0, Offset: 0x1010
// Size: 0x170
function set_dr_flag(toset, setto = 1) {
    /#
        assert(isdefined(setto));
    #/
    if (isarray(toset)) {
        foreach (ts in toset) {
            set_dr_flag(ts, setto);
        }
        return;
    }
    if (!isdefined(self.flag) || !isdefined(self.flag[toset])) {
        self flag::init(toset);
    }
    if (setto == self.flag[toset]) {
        return 0;
    }
    if (isdefined(setto) && setto) {
        self flag::set(toset);
    } else {
        self flag::clear(toset);
    }
    return 1;
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x1 linked
// Checksum 0xdbc722df, Offset: 0x1188
// Size: 0x24
function clear_dr_flag(toclear) {
    set_dr_flag(toclear, 0);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 3, eflags: 0x1 linked
// Checksum 0x1e84ea47, Offset: 0x11b8
// Size: 0xe4
function change_dr_flags(localclientnum, toset, toclear) {
    if (isdefined(toset)) {
        if (isstring(toset)) {
            toset = strtok(toset, ",");
        }
        self set_dr_flag(toset);
    }
    if (isdefined(toclear)) {
        if (isstring(toclear)) {
            toclear = strtok(toclear, ",");
        }
        self clear_dr_flag(toclear);
    }
    update_dr_filters(localclientnum);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x1 linked
// Checksum 0x3c53229a, Offset: 0x12a8
// Size: 0x164
function _update_dr_filters(localclientnum) {
    self notify(#"update_dr_filters");
    self endon(#"update_dr_filters");
    self endon(#"death");
    waittillframeend();
    foreach (key, filterset in level.drfilters) {
        filter = self find_dr_filter(filterset);
        if (isdefined(filter) && (!isdefined(self.currentdrfilter) || !(self.currentdrfilter[key] === filter.name))) {
            self apply_filter(localclientnum, filter, key);
        }
    }
    if (sessionmodeismultiplayergame() || sessionmodeiswarzonegame()) {
        self thread disable_all_filters_on_game_ended();
    }
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x1 linked
// Checksum 0xf1ab1c51, Offset: 0x1418
// Size: 0x24
function update_dr_filters(localclientnum) {
    self thread _update_dr_filters(localclientnum);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x1 linked
// Checksum 0x1b434c1f, Offset: 0x1448
// Size: 0xe6
function find_dr_filter(filterset = level.drfilters[#"framebuffer"]) {
    best = undefined;
    foreach (filter in filterset) {
        if (self can_use_filter(filter)) {
            if (!isdefined(best) || filter.priority > best.priority) {
                best = filter;
            }
        }
    }
    return best;
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x1 linked
// Checksum 0xf10f1278, Offset: 0x1538
// Size: 0xb8
function can_use_filter(filter) {
    for (i = 0; i < filter.require.size; i++) {
        if (!self flagsys::get(filter.require[i])) {
            return 0;
        }
    }
    for (i = 0; i < filter.refuse.size; i++) {
        if (self flagsys::get(filter.refuse[i])) {
            return 0;
        }
    }
    return 1;
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 3, eflags: 0x1 linked
// Checksum 0xf997b113, Offset: 0x15f8
// Size: 0x306
function apply_filter(localclientnum, filter, filterset = "framebuffer") {
    if (isdefined(level.postgame) && level.postgame && !(isdefined(level.showedtopthreeplayers) && level.showedtopthreeplayers)) {
        if (!function_1cbf351b(localclientnum)) {
            return;
        }
    }
    /#
        if (getdvarint(#"scr_debug_duplicaterender", 0)) {
            name = "<unknown string>";
            if (isplayer(self)) {
                if (isdefined(self.name)) {
                    name = "<unknown string>" + self.name;
                }
            } else if (isdefined(self.model)) {
                name = name + "<unknown string>" + self.model;
            }
            msg = "<unknown string>" + filter.name + "<unknown string>" + name + "<unknown string>" + filterset;
            println(msg);
        }
    #/
    if (!isdefined(self.currentdrfilter)) {
        self.currentdrfilter = [];
    }
    self.currentdrfilter[filterset] = filter.name;
    opts = filter.types.size;
    for (i = 0; i < opts; i++) {
        type = filter.types[i];
        value = filter.values[i];
        culling = filter.culling[i];
        var_385a59fa = filter.method[i];
        material = undefined;
        if (isstring(value)) {
            material = filter::mapped_material_id(value);
            if (!isdefined(var_385a59fa)) {
                var_385a59fa = 3;
            }
            if (isdefined(material)) {
                self addduplicaterenderoption(type, var_385a59fa, material, culling);
            } else {
                self.currentdrfilter[filterset] = undefined;
            }
        } else {
            self addduplicaterenderoption(type, value, -1, culling);
        }
    }
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 0, eflags: 0x1 linked
// Checksum 0xa55df227, Offset: 0x1908
// Size: 0x6c
function disable_all_filters_on_game_ended() {
    self endon(#"death");
    self notify(#"disable_all_filters_on_game_ended");
    self endon(#"disable_all_filters_on_game_ended");
    level waittill(#"post_game");
    self disableduplicaterendering();
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x1 linked
// Checksum 0xe2da1ec8, Offset: 0x1980
// Size: 0x34
function set_item_retrievable(localclientnum, on_off) {
    self update_dr_flag(localclientnum, "retrievable", on_off);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x74606e24, Offset: 0x19c0
// Size: 0x34
function set_item_unplaceable(localclientnum, on_off) {
    self update_dr_flag(localclientnum, "unplaceable", on_off);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x44ad9803, Offset: 0x1a00
// Size: 0x34
function set_item_enemy_equipment(localclientnum, on_off) {
    self update_dr_flag(localclientnum, "enemyequip", on_off);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x1e03f26d, Offset: 0x1a40
// Size: 0x34
function set_item_friendly_equipment(localclientnum, on_off) {
    self update_dr_flag(localclientnum, "friendlyequip", on_off);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x1c0bbbc8, Offset: 0x1a80
// Size: 0x34
function set_entity_thermal(localclientnum, on_off) {
    self update_dr_flag(localclientnum, "infrared_entity", on_off);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x83ee9896, Offset: 0x1ac0
// Size: 0x34
function set_player_threat_detected(localclientnum, on_off) {
    self update_dr_flag(localclientnum, "threat_detector_enemy", on_off);
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0xcb9120ac, Offset: 0x1b00
// Size: 0x14
function set_hacker_tool_hacked(localclientnum, on_off) {
    
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x2564dd9e, Offset: 0x1b20
// Size: 0x14
function set_hacker_tool_hacking(localclientnum, on_off) {
    
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x0
// Checksum 0x88415731, Offset: 0x1b40
// Size: 0x14
function set_hacker_tool_breaching(localclientnum, on_off) {
    
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 1, eflags: 0x0
// Checksum 0xb606d635, Offset: 0x1b60
// Size: 0x4e
function show_friendly_outlines(local_client_num) {
    if (!(isdefined(level.friendlycontentoutlines) && level.friendlycontentoutlines)) {
        return 0;
    }
    if (shoutcaster::is_shoutcaster(local_client_num)) {
        return 0;
    }
    return 1;
}

// Namespace duplicate_render/duplicaterender_mgr
// Params 2, eflags: 0x1 linked
// Checksum 0xe5682aaa, Offset: 0x1bb8
// Size: 0xbc
function set_entity_draft_unselected(localclientnum, on_off) {
    if (util::is_frontend_map()) {
        rob = #"hash_79892e1d5a8f9f33";
    } else if (util::function_26489405()) {
        rob = #"hash_5418181592b8b61a";
    } else {
        rob = #"hash_68bd6efcb1324e3";
    }
    if (isdefined(on_off) && on_off) {
        self playrenderoverridebundle(rob);
    } else {
        self stoprenderoverridebundle(rob);
    }
}

