#using scripts\abilities\gadgets\gadget_vision_pulse;
#using scripts\core_common\util_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\flag_shared;

#namespace shoutcaster;

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x1 linked
// Checksum 0x7054ad35, Offset: 0x1f8
// Size: 0x22
function is_shoutcaster(localclientnum) {
    return function_9d295a8c(localclientnum);
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x1 linked
// Checksum 0xbdbb8c2b, Offset: 0x228
// Size: 0x3c
function function_2e6e4ee0(localclientnum) {
    return is_shoutcaster(localclientnum) && function_ea9917ce(localclientnum);
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x1 linked
// Checksum 0x866cf77e, Offset: 0x270
// Size: 0x44
function is_shoutcaster_using_team_identity(localclientnum) {
    return is_shoutcaster(localclientnum) && getshoutcastersetting(localclientnum, "shoutcaster_fe_team_identity");
}

// Namespace shoutcaster/shoutcaster
// Params 2, eflags: 0x1 linked
// Checksum 0x441848b9, Offset: 0x2c0
// Size: 0x62
function get_team_color_id(localclientnum, team) {
    if (team == #"allies") {
        return getshoutcastersetting(localclientnum, "shoutcaster_fe_team1_color");
    }
    return getshoutcastersetting(localclientnum, "shoutcaster_fe_team2_color");
}

// Namespace shoutcaster/shoutcaster
// Params 3, eflags: 0x1 linked
// Checksum 0xf8d168bf, Offset: 0x330
// Size: 0x56
function get_team_color_fx(localclientnum, team, script_bundle) {
    color = get_team_color_id(localclientnum, team);
    return script_bundle.objects[color].fx_colorid;
}

// Namespace shoutcaster/shoutcaster
// Params 2, eflags: 0x0
// Checksum 0x20a0678f, Offset: 0x390
// Size: 0x96
function get_color_fx(localclientnum, script_bundle) {
    effects = [];
    effects[#"allies"] = get_team_color_fx(localclientnum, #"allies", script_bundle);
    effects[#"axis"] = get_team_color_fx(localclientnum, #"axis", script_bundle);
    return effects;
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x0
// Checksum 0x2dc2c898, Offset: 0x430
// Size: 0xa4
function is_friendly(localclientnum) {
    localplayer = function_5c10bd79(localclientnum);
    scorepanel_flipped = getshoutcastersetting(localclientnum, "shoutcaster_ds_flip_scorepanel");
    if (!scorepanel_flipped) {
        friendly = self.team == #"allies";
    } else {
        friendly = self.team == #"axis";
    }
    return friendly;
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x1 linked
// Checksum 0x9c2790be, Offset: 0x4e0
// Size: 0x3c
function function_981be10f(local_client_num) {
    thread shoutcaster_monitor_xray_change(local_client_num);
    thread shoutcaster_monitor_player_pucks(local_client_num);
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x5 linked
// Checksum 0xec3409e0, Offset: 0x528
// Size: 0x410
function private shoutcaster_monitor_xray_change(local_client_num) {
    level notify("shoutcaster_monitor_xray_change" + local_client_num);
    level endon("shoutcaster_monitor_xray_change" + local_client_num);
    util::waitforclient(local_client_num);
    firsttime = 1;
    localplayer = function_5c10bd79(local_client_num);
    lastteam = localplayer.team;
    var_f4e066d = 0;
    var_821a5c52 = 0;
    var_28f6bf0f = 0;
    var_c1935186 = 0;
    if (is_shoutcaster(local_client_num)) {
        var_f4e066d = getshoutcastersetting(local_client_num, "shoutcaster_qs_xray");
        var_821a5c52 = (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_1p_allies") ? 1 : 0) + (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_1p_enemies") ? 2 : 0);
        var_28f6bf0f = (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_air_allies") ? 1 : 0) + (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_air_enemies") ? 2 : 0);
        var_c1935186 = function_2e6e4ee0(local_client_num);
    }
    while (true) {
        waitframe(1);
        if (!is_shoutcaster(local_client_num)) {
            continue;
        }
        localplayer = function_5c10bd79(local_client_num);
        team = localplayer.team;
        var_52fe6881 = getshoutcastersetting(local_client_num, "shoutcaster_qs_xray");
        var_a6f20d43 = (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_1p_allies") ? 1 : 0) + (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_1p_enemies") ? 2 : 0);
        var_c1e644b1 = (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_air_allies") ? 1 : 0) + (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_air_enemies") ? 2 : 0);
        var_36f13a21 = function_2e6e4ee0(local_client_num);
        needupdate = 0;
        if (firsttime) {
            firsttime = 0;
            needupdate = 1;
        } else if (team != lastteam || var_52fe6881 != var_f4e066d || var_a6f20d43 != var_821a5c52 || var_c1e644b1 != var_28f6bf0f || var_c1935186 != var_36f13a21) {
            needupdate = 1;
        }
        if (needupdate) {
            lastteam = team;
            var_f4e066d = var_52fe6881;
            var_821a5c52 = var_a6f20d43;
            var_28f6bf0f = var_c1e644b1;
            var_c1935186 = var_36f13a21;
            self function_4c4946d4(local_client_num, team, var_52fe6881, var_36f13a21 ? var_c1e644b1 : var_a6f20d43);
        }
    }
}

// Namespace shoutcaster/shoutcaster
// Params 4, eflags: 0x5 linked
// Checksum 0xcadaedeb, Offset: 0x940
// Size: 0x428
function private function_4c4946d4(local_client_num, localplayerteam, var_52fe6881, var_faa7a3fb) {
    var_f2a410c9 = [];
    players = getplayers(local_client_num);
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        var_f2a410c9[var_f2a410c9.size] = [];
        var_f2a410c9[var_f2a410c9.size - 1][0] = player;
        var_f2a410c9[var_f2a410c9.size - 1][1] = #"hash_2f86d28434166be7";
        var_f2a410c9[var_f2a410c9.size - 1][2] = #"hash_71fbf1094f57b910";
    }
    ents = getentarraybytype(local_client_num, 15);
    foreach (entity in ents) {
        if (!isdefined(entity.archetype)) {
            continue;
        }
        if (entity.archetype != #"mp_dog") {
            continue;
        }
        var_f2a410c9[var_f2a410c9.size] = [];
        var_f2a410c9[var_f2a410c9.size - 1][0] = entity;
        var_f2a410c9[var_f2a410c9.size - 1][1] = #"hash_16bdbd0b3de5c91a";
        var_f2a410c9[var_f2a410c9.size - 1][2] = #"hash_71fbf1094f57b910";
    }
    foreach (array in var_f2a410c9) {
        entity = array[0];
        robkey = array[1];
        rob = array[2];
        if (!var_52fe6881 || var_faa7a3fb == 0) {
            if (entity flag::exists(#"shoutcaster_flag")) {
                entity renderoverridebundle::stop_bundle(#"shoutcaster_flag", rob, 0);
            }
            continue;
        }
        if (var_faa7a3fb == 2 && localplayerteam == entity.team || var_faa7a3fb == 1 && localplayerteam != entity.team) {
            if (entity flag::exists(#"shoutcaster_flag")) {
                entity renderoverridebundle::stop_bundle(#"shoutcaster_flag", rob, 0);
            }
            continue;
        }
        entity function_a0b844f1(local_client_num, robkey, rob);
    }
}

// Namespace shoutcaster/shoutcaster
// Params 3, eflags: 0x1 linked
// Checksum 0x40612b99, Offset: 0xd70
// Size: 0x38c
function function_a0b844f1(local_client_num, rob_key, rob) {
    var_52fe6881 = getshoutcastersetting(local_client_num, "shoutcaster_qs_xray");
    var_a6f20d43 = (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_1p_allies") ? 1 : 0) + (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_1p_enemies") ? 2 : 0);
    var_c1e644b1 = (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_air_allies") ? 1 : 0) + (getshoutcastersetting(local_client_num, "shoutcaster_ds_xray_air_enemies") ? 2 : 0);
    var_faa7a3fb = function_2e6e4ee0(local_client_num) ? var_c1e644b1 : var_a6f20d43;
    localplayer = function_5c10bd79(local_client_num);
    localplayerteam = localplayer.team;
    if (!var_52fe6881 || var_faa7a3fb == 0) {
        return;
    }
    if (var_faa7a3fb == 2 && localplayerteam == self.team || var_faa7a3fb == 1 && localplayerteam != self.team) {
        return;
    }
    self renderoverridebundle::function_c8d97b8e(local_client_num, #"shoutcaster_flag", rob_key);
    teamcolor = self.team == #"allies" ? (0.13, 0.87, 0.94) : (0.98, 0.18, 0.1);
    if (is_shoutcaster_using_team_identity(local_client_num)) {
        var_f90afe60 = get_team_color_id(local_client_num, self.team);
        teamcolor = function_4823f055(var_f90afe60);
    }
    self function_78233d29(rob, "", #"tintr", teamcolor[0]);
    self function_78233d29(rob, "", #"tintg", teamcolor[1]);
    self function_78233d29(rob, "", #"tintb", teamcolor[2]);
    self function_78233d29(rob, "", #"alpha", 1);
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x5 linked
// Checksum 0x60a8b40e, Offset: 0x1108
// Size: 0x4a
function private function_7ed4edd3(playername) {
    if (!isdefined(playername)) {
        return false;
    }
    if (!isdefined(level.shoutcasterpucks)) {
        return false;
    }
    if (!isdefined(level.shoutcasterpucks[playername])) {
        return false;
    }
    return true;
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x5 linked
// Checksum 0x50b84315, Offset: 0x1160
// Size: 0x5c
function private function_2b07633f(playername) {
    if (!isdefined(playername)) {
        return false;
    }
    if (!isdefined(level.var_b9e7d957)) {
        return false;
    }
    if (level.var_b9e7d957 != playername) {
        return false;
    }
    if (!isdefined(level.var_fea1a13)) {
        return false;
    }
    return true;
}

// Namespace shoutcaster/shoutcaster
// Params 2, eflags: 0x1 linked
// Checksum 0x34194998, Offset: 0x11c8
// Size: 0x9e
function function_995e01b6(localclientnum, player) {
    if (player.team == #"allies") {
        var_11792f05 = #"hash_e7985dec7c3faa9";
    } else {
        var_11792f05 = #"hash_40193ed2b55dd6b6";
    }
    level.shoutcasterpucks[player.name] = util::playfxontag(localclientnum, var_11792f05, self, "tag_origin");
}

// Namespace shoutcaster/shoutcaster
// Params 2, eflags: 0x5 linked
// Checksum 0x8bcb674f, Offset: 0x1270
// Size: 0xa6
function private function_8e1e7736(localclientnum, player) {
    level.var_b9e7d957 = player.name;
    if (player.team == #"allies") {
        var_e15b5f0c = #"hash_1e1361dd9519bc55";
    } else {
        var_e15b5f0c = #"hash_7a180b53914e467a";
    }
    level.var_fea1a13 = util::playfxontag(localclientnum, var_e15b5f0c, self, "tag_origin");
}

// Namespace shoutcaster/shoutcaster
// Params 2, eflags: 0x5 linked
// Checksum 0x873f3749, Offset: 0x1320
// Size: 0x5c
function private function_35248a94(localclientnum, playername) {
    if (isdefined(level.shoutcasterpucks[playername])) {
        stopfx(localclientnum, level.shoutcasterpucks[playername]);
        level.shoutcasterpucks[playername] = undefined;
    }
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x5 linked
// Checksum 0x20b7f206, Offset: 0x1388
// Size: 0x46
function private function_69b179ea(localclientnum) {
    if (isdefined(level.var_fea1a13)) {
        stopfx(localclientnum, level.var_fea1a13);
        level.var_fea1a13 = undefined;
    }
}

// Namespace shoutcaster/shoutcaster
// Params 1, eflags: 0x5 linked
// Checksum 0x70c12bc1, Offset: 0x13d8
// Size: 0x2a8
function private shoutcaster_monitor_player_pucks(localclientnum) {
    level notify("shoutcaster_monitor_player_pucks" + localclientnum);
    level endon("shoutcaster_monitor_player_pucks" + localclientnum);
    while (true) {
        waitframe(1);
        if (!is_shoutcaster(localclientnum)) {
            continue;
        }
        var_436f361e = function_ea9917ce(localclientnum);
        foreach (player in getplayers(localclientnum)) {
            if (isdefined(player) && !function_3132f113(player)) {
                if (isalive(player)) {
                    if (var_436f361e) {
                        if (!function_7ed4edd3(player.name)) {
                            player function_995e01b6(localclientnum, player);
                        }
                        if (player function_21c0fa55() && !function_2b07633f(player.name)) {
                            function_69b179ea(localclientnum);
                            player function_8e1e7736(localclientnum, player);
                        }
                    } else if (function_7ed4edd3(player.name)) {
                        function_35248a94(localclientnum, player.name);
                    }
                    continue;
                }
                if (function_7ed4edd3(player.name)) {
                    function_35248a94(localclientnum, player.name);
                }
                if (function_2b07633f(player.name)) {
                    function_69b179ea(localclientnum);
                }
            }
        }
        if (!var_436f361e) {
            function_69b179ea(localclientnum);
        }
    }
}

