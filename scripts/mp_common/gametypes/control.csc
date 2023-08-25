// Atian COD Tools GSC decompiler test
#include script_28a20e497bd69c36;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/core_common/shoutcaster.csc;
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/callbacks_shared.csc;

#namespace control;

// Namespace control/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xd4ff0c22, Offset: 0x1e8
// Size: 0x484
function event<gametype_init> main(eventstruct) {
    level.var_c66ad71 = [];
    level.var_38360a23 = [];
    level.visuals = [];
    level.var_893697bd = [];
    level.zones = [];
    for (i = 0; i < 4; i++) {
        level.var_c66ad71[i] = 0;
        level.var_38360a23[i] = 0;
        level.var_893697bd[i] = [];
    }
    clientfield::register("world", "warzone", 1, 5, "int", &warzone, 0, 0);
    clientfield::register("world", "warzonestate", 1, 10, "int", &function_7f7b86d, 0, 0);
    clientfield::register("worlduimodel", "hudItems.missions.captureMultiplierStatus", 1, 2, "int", undefined, 0, 1);
    clientfield::register("worlduimodel", "hudItems.war.attackingTeam", 1, 2, "int", undefined, 0, 1);
    level.var_f72a3c7b = [];
    level.var_f72a3c7b[#"hash_62dd73d4603d4fb8"] = struct::get_script_bundle("teamcolorfx", "teamcolorfx_koth_edge_marker");
    level.var_f72a3c7b[#"hash_685f1cf10641e640"] = struct::get_script_bundle("teamcolorfx", "teamcolorfx_koth_edge_marker_window");
    level._effect[#"hash_62dd73d4603d4fb8"] = [];
    level._effect[#"hash_62dd73d4603d4fb8"][0] = #"hash_1f447aeb1973f7b6";
    level._effect[#"hash_62dd73d4603d4fb8"][1] = #"hash_5c2ae9f4f331d4b9";
    level._effect[#"hash_62dd73d4603d4fb8"][2] = #"hash_7d1b0f001ea88b82";
    level._effect[#"hash_62dd73d4603d4fb8"][3] = #"hash_7981eb245ea536fc";
    level._effect[#"hash_685f1cf10641e640"] = [];
    level._effect[#"hash_685f1cf10641e640"][0] = #"hash_35ab4f45bbfba6b3";
    level._effect[#"hash_685f1cf10641e640"][1] = #"hash_5565c3fc2c7742fe";
    level._effect[#"hash_685f1cf10641e640"][2] = #"hash_3283b765fe480df7";
    level._effect[#"hash_685f1cf10641e640"][3] = #"hash_6a512c225256a2e9";
    level.var_8b2913b0 = getscriptbundle("mission_settings_control");
    callback::on_localclient_connect(&on_localclient_connect);
    callback::on_spawned(&function_6e3affdc);
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
}

// Namespace control/control
// Params 1, eflags: 0x0
// Checksum 0x1b7a2469, Offset: 0x678
// Size: 0x24
function on_localclient_connect(localclientnum) {
    thread function_185b0894(localclientnum, undefined, undefined);
}

// Namespace control/control
// Params 1, eflags: 0x0
// Checksum 0x35bdc8c8, Offset: 0x6a8
// Size: 0x222
function function_12a1f978(local_client_num) {
    effects = [];
    effects[#"hash_62dd73d4603d4fb8"] = level._effect[#"hash_62dd73d4603d4fb8"];
    effects[#"hash_685f1cf10641e640"] = level._effect[#"hash_685f1cf10641e640"];
    effects[#"hash_62dd73d4603d4fb8"][2] = #"hash_b348da50894d2f3";
    effects[#"hash_62dd73d4603d4fb8"][1] = #"hash_22f6c3df53586600";
    effects[#"hash_62dd73d4603d4fb8"][3] = [];
    effects[#"hash_62dd73d4603d4fb8"][3][2] = #"hash_2d6240bcbe378735";
    effects[#"hash_62dd73d4603d4fb8"][3][1] = #"hash_1485defdfe47975a";
    effects[#"hash_685f1cf10641e640"][2] = #"hash_18926b1c92d97fb8";
    effects[#"hash_685f1cf10641e640"][1] = #"hash_175505bf60101ef5";
    effects[#"hash_685f1cf10641e640"][3] = [];
    effects[#"hash_685f1cf10641e640"][3][2] = #"hash_3add4ab2008b6ea2";
    effects[#"hash_685f1cf10641e640"][3][1] = #"hash_49751fe881244b5f";
    return effects;
}

// Namespace control/control
// Params 4, eflags: 0x0
// Checksum 0x8f953343, Offset: 0x8d8
// Size: 0x100
function function_46b3ecd3(local_client_num, state, attackers, is_shoutcaster) {
    if (is_shoutcaster) {
        if (attackers == #"allies") {
            return state;
        } else if (state == 1) {
            return 2;
        } else if (state == 2) {
            return 1;
        } else {
            return state;
        }
    }
    if (state == 1) {
        if (function_9b3f0ed1(local_client_num) != attackers) {
            return 1;
        } else {
            return 2;
        }
    } else if (state == 2) {
        if (function_9b3f0ed1(local_client_num) == attackers) {
            return 1;
        } else {
            return 2;
        }
    }
    return state;
}

// Namespace control/control
// Params 3, eflags: 0x0
// Checksum 0x13a0b0ee, Offset: 0x9e0
// Size: 0x2c
function function_95f997c5(fx_name, var_11cad3ba, effects) {
    return effects[fx_name][var_11cad3ba];
}

// Namespace control/control
// Params 0, eflags: 0x4
// Checksum 0x1ffbdc87, Offset: 0xa18
// Size: 0x62
function private function_bcf33c85() {
    var_5937e82d = codegetworlduimodelfield("hudItems.war.attackingTeam");
    attackers = #"allies";
    if (var_5937e82d == 2) {
        attackers = #"axis";
    }
    return attackers;
}

// Namespace control/control
// Params 0, eflags: 0x0
// Checksum 0xdafa9ed9, Offset: 0xa88
// Size: 0x54
function function_6e3affdc() {
    if (isdefined(level.var_38360a23)) {
        local_client_num = self getlocalclientnumber();
        if (isdefined(local_client_num)) {
            function_383d0a91(local_client_num);
        }
    }
}

// Namespace control/control
// Params 1, eflags: 0x0
// Checksum 0xc2cb746f, Offset: 0xae8
// Size: 0x3c4
function function_383d0a91(local_client_num) {
    for (zi = 0; zi < level.zones.size; zi++) {
        var_33636eed = level.var_38360a23[local_client_num] >> zi * 2 & 3;
        effects = [];
        if (shoutcaster::is_shoutcaster(local_client_num)) {
            effects = function_12a1f978(local_client_num);
        } else {
            effects[#"hash_62dd73d4603d4fb8"] = level._effect[#"hash_62dd73d4603d4fb8"];
            effects[#"hash_685f1cf10641e640"] = level._effect[#"hash_685f1cf10641e640"];
        }
        if (isdefined(level.var_893697bd[local_client_num][zi])) {
            foreach (fx in level.var_893697bd[local_client_num][zi]) {
                stopfx(local_client_num, fx);
            }
        }
        level.var_893697bd[local_client_num][zi] = [];
        if (level.var_c66ad71[local_client_num] & 1 << zi) {
            if (isdefined(level.visuals[zi])) {
                attackers = function_bcf33c85();
                var_11cad3ba = function_46b3ecd3(local_client_num, var_33636eed, attackers, shoutcaster::is_shoutcaster(local_client_num));
                foreach (visual in level.visuals[zi]) {
                    if (!isdefined(visual.script_fxid)) {
                        continue;
                    }
                    fxid = function_95f997c5(visual.script_fxid, var_11cad3ba, effects);
                    if (isarray(fxid)) {
                        var_33636eed = 2;
                        function_ca8ebccf(local_client_num, visual, fxid[var_33636eed], zi, var_33636eed, attackers);
                        var_33636eed = 1;
                        function_ca8ebccf(local_client_num, visual, fxid[var_33636eed], zi, var_33636eed, attackers);
                    } else {
                        function_ca8ebccf(local_client_num, visual, fxid, zi, var_33636eed, attackers);
                    }
                }
            }
        }
    }
    thread function_40370b(local_client_num);
}

// Namespace control/control
// Params 6, eflags: 0x4
// Checksum 0x181ccc80, Offset: 0xeb8
// Size: 0x184
function private function_ca8ebccf(local_client_num, visual, fxid, zi, var_33636eed, attackers) {
    if (isdefined(visual.angles)) {
        forward = anglestoforward(visual.angles);
    } else {
        forward = (0, 0, 0);
    }
    fxhandle = playfx(local_client_num, fxid, visual.origin, forward);
    level.var_893697bd[local_client_num][zi][level.var_893697bd[local_client_num][zi].size] = fxhandle;
    if (isdefined(fxhandle)) {
        if (var_33636eed == 2) {
            setfxteam(local_client_num, fxhandle, attackers);
        } else if (var_33636eed == 1) {
            defenders = util::get_other_team(attackers);
            setfxteam(local_client_num, fxhandle, defenders);
        } else {
            setfxteam(local_client_num, fxhandle, "free");
        }
    }
}

// Namespace control/control
// Params 2, eflags: 0x0
// Checksum 0xdc8932fa, Offset: 0x1048
// Size: 0xfc
function function_e7e84c96(zone_a, zone_b) {
    var_4aeef54 = zone_a.script_index;
    var_2e6a42ca = zone_b.script_index;
    if (!isdefined(var_4aeef54) && !isdefined(var_2e6a42ca)) {
        return 0;
    }
    if (!isdefined(var_4aeef54) && isdefined(var_2e6a42ca)) {
        /#
            println("<unknown string>" + zone_a.origin);
        #/
        return 1;
    }
    if (isdefined(var_4aeef54) && !isdefined(var_2e6a42ca)) {
        /#
            println("<unknown string>" + zone_b.origin);
        #/
        return 0;
    }
    if (var_4aeef54 > var_2e6a42ca) {
        return 1;
    }
    return 0;
}

// Namespace control/control
// Params 0, eflags: 0x0
// Checksum 0x84117790, Offset: 0x1150
// Size: 0x2ec
function function_c9bc70d6() {
    var_c96c663b = struct::get_array("control_zone_center", "targetname");
    if (var_c96c663b.size > 1) {
        if (!isdefined(var_c96c663b)) {
            return;
        }
        var_71b9425c = [];
        var_93fd6689 = var_c96c663b.size;
        for (i = 0; i < var_93fd6689; i++) {
            fieldname = "zoneinfo" + var_93fd6689 + i + 1;
            index = isdefined(level.var_8b2913b0.(fieldname)) ? level.var_8b2913b0.(fieldname) : 0;
            var_71b9425c[var_71b9425c.size] = index;
        }
        zones = [];
        for (i = 0; i < var_c96c663b.size; i++) {
            ind = var_c96c663b[i].script_index;
            if (isdefined(ind)) {
                for (j = 0; j < var_71b9425c.size; j++) {
                    if (var_71b9425c[j] == ind) {
                        zones[zones.size] = var_c96c663b[i];
                        continue;
                    }
                }
            }
        }
    } else {
        zones = struct::get_array("control_zone_center", "targetname");
    }
    if (!isdefined(zones)) {
        return undefined;
    }
    var_58429fdf = 1;
    for (n = zones.size; var_58429fdf; n--) {
        var_58429fdf = 0;
        for (i = 0; i < n - 1; i++) {
            if (function_e7e84c96(zones[i], zones[i + 1])) {
                temp = zones[i];
                zones[i] = zones[i + 1];
                zones[i + 1] = temp;
                var_58429fdf = 1;
            }
        }
    }
    for (i = 0; i < zones.size; i++) {
        zones[i].zone_index = i;
    }
    return zones;
}

// Namespace control/control
// Params 7, eflags: 0x0
// Checksum 0x1a66b93, Offset: 0x1448
// Size: 0x254
function warzone(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (level.zones.size == 0) {
        level.zones = function_c9bc70d6();
        for (zi = 0; zi < level.zones.size; zi++) {
            if (isdefined(level.zones[zi].target)) {
                level.visuals[zi] = struct::get_array(level.zones[zi].target, "targetname");
            }
            level.zones[zi].objectiveid = serverobjective_getobjective(localclientnum, "control_" + zi);
            level.zones[zi].var_6d7365a9 = spawn(0, level.zones[zi].origin, "script_origin");
            level.zones[zi].var_ce6accbd = 0;
        }
        level notify(#"hash_3f294ebbb7ff9154");
    }
    level.var_c66ad71[localclientnum] = newval;
    for (zi = 0; zi < level.zones.size; zi++) {
        if ((oldval & 1 << zi) != (newval & 1 << zi)) {
            level.var_38360a23[localclientnum] = level.var_38360a23[localclientnum] & ~(3 << zi);
        }
    }
    function_383d0a91(localclientnum);
}

// Namespace control/control
// Params 7, eflags: 0x0
// Checksum 0x99504e4, Offset: 0x16a8
// Size: 0x84
function function_7f7b86d(localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump) {
    if (newval != level.var_38360a23[localclientnum]) {
        level.var_38360a23[localclientnum] = newval;
        function_383d0a91(localclientnum);
    }
}

// Namespace control/control
// Params 1, eflags: 0x0
// Checksum 0x77e6d028, Offset: 0x1738
// Size: 0x64
function function_40370b(localclientnum) {
    level notify(#"hash_464c43f8a91b82b3");
    level endon(#"hash_464c43f8a91b82b3");
    level waittill(#"team_changed");
    thread function_383d0a91(localclientnum);
}

// Namespace control/control
// Params 3, eflags: 0x0
// Checksum 0x725da180, Offset: 0x17a8
// Size: 0x294
function function_185b0894(localclientnum, oldval, newval) {
    level endon(#"game_ended");
    self notify("4f9ede08240c30af");
    self endon("4f9ede08240c30af");
    var_4a614782 = 0.8;
    var_9a7dc638 = 1;
    var_f802a6b1 = 255;
    var_8261032c = 1 / var_f802a6b1;
    waitresult = undefined;
    waitresult = level waittill(#"hash_3f294ebbb7ff9154");
    while (1) {
        foreach (zone in level.zones) {
            if (!isdefined(zone.objectiveid)) {
                continue;
            }
            progress = serverobjective_getobjectiveprogress(localclientnum, zone.objectiveid);
            change = progress - (isdefined(zone.var_cbf4cb85) ? zone.var_cbf4cb85 : 0);
            if (change <= 0) {
                if (zone.var_ce6accbd) {
                    zone.var_6d7365a9 stoploopsound(zone.soundid);
                    zone.var_ce6accbd = 0;
                }
            } else {
                if (!zone.var_ce6accbd) {
                    zone.soundid = zone.var_6d7365a9 playloopsound(#"hash_5a0b392405d5f148");
                    zone.var_ce6accbd = 1;
                }
                var_535a15b1 = var_4a614782 + var_9a7dc638 * progress * var_8261032c;
                setsoundpitch(zone.soundid, var_535a15b1);
            }
            zone.var_cbf4cb85 = progress;
        }
        wait(0.25);
    }
}

