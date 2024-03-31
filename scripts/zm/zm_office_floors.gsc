// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;

#namespace zm_office_floors;

// Namespace zm_office_floors/zm_office_floors
// Params 0, eflags: 0x1 linked
// Checksum 0x14bd8ab5, Offset: 0x100
// Size: 0x146
function init() {
    level.var_b4fcac11 = [];
    level.var_b4fcac11[0] = getent("thief_floor_1", "targetname");
    level.var_b4fcac11[1] = getent("thief_floor_2", "targetname");
    level.var_b4fcac11[2] = getent("thief_floor_3", "targetname");
    level.var_b4fcac11[3] = getent("thief_floor_4", "targetname");
    level.var_83225f64 = [];
    level.var_83225f64[0] = getent("elevator1_shaft", "targetname");
    level.var_83225f64[1] = getent("elevator2_shaft", "targetname");
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0x4cad828f, Offset: 0x250
// Size: 0x246
function function_35babccd(ent) {
    if (!isdefined(ent)) {
        /#
            println("<unknown string>");
        #/
        return 1;
    }
    if (isdefined(ent.var_f4bf0819)) {
        ent.floor_num = ent.var_f4bf0819;
        return ent.floor_num;
    }
    if (isdefined(level.elevator1.moving_to) && ent istouching(level.var_83225f64[0])) {
        ent.floor_num = level.elevator1.moving_to;
        return ent.floor_num;
    } else if (isdefined(level.elevator2.moving_to) && ent istouching(level.var_83225f64[1])) {
        ent.floor_num = level.elevator2.moving_to;
        return ent.floor_num;
    }
    if (!isdefined(ent.floor_num)) {
        ent.floor_num = 1;
    }
    index = ent.floor_num - 1;
    floor_count = level.var_b4fcac11.size;
    for (n = 0; n < floor_count; n++) {
        if (ent istouching(level.var_b4fcac11[index])) {
            ent.floor_num = index + 1;
            return ent.floor_num;
        }
        index = (index + 1) % floor_count;
    }
    /#
        println("<unknown string>");
    #/
    return ent.floor_num;
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0xa9834707, Offset: 0x4a0
// Size: 0xe0
function function_713b735(floor_num) {
    players = getplayers();
    foreach (player in players) {
        if (player laststand::player_is_in_laststand() || player.sessionstate == "spectator") {
            continue;
        }
        if (function_35babccd(player) == floor_num) {
            return true;
        }
    }
    return false;
}

// Namespace zm_office_floors/zm_office_floors
// Params 0, eflags: 0x0
// Checksum 0x2ba69967, Offset: 0x588
// Size: 0x2c
function function_e055f2d7() {
    return !function_713b735(function_35babccd(self));
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0x2d985654, Offset: 0x5c0
// Size: 0x5c
function function_cd2f24b2(zone_name) {
    if (!isdefined(zone_name)) {
        return;
    }
    switch (zone_name) {
    case #"offices_level1":
    case #"file_room_level1":
    case #"conference_level1":
    case #"hallway_level1":
        return 1;
    case #"war_room_zone_top":
    case #"conference_level2":
    case #"war_room_zone_south":
    case #"war_room_server_room":
    case #"war_room_zone_north":
    case #"war_room_zone_elevator":
        return 2;
    case #"labs_elevator":
    case #"labs_hallway1":
    case #"labs_hallway2":
    case #"labs_zone1":
    case #"labs_zone2":
    case #"labs_zone3":
        return 3;
    case #"cage_upper":
    case #"cage":
        return 4;
    default:
        /#
            assertmsg("<unknown string>" + zone_name);
        #/
    }
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0xf97eaa3c, Offset: 0x768
// Size: 0x164
function function_2fe0c64e(v_pos) {
    str_target_zone = zm_zonemgr::get_zone_from_position(v_pos);
    if (!isdefined(str_target_zone)) {
        foreach (zone in level.zones) {
            if (zone.is_enabled) {
                foreach (volume in zone.volumes) {
                    if (istouching(v_pos, volume)) {
                        str_target_zone = zone.name;
                        break;
                    }
                }
                if (isdefined(str_target_zone)) {
                    break;
                }
            }
        }
    }
    if (isdefined(str_target_zone)) {
        return function_cd2f24b2(str_target_zone);
    }
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0xcf5737ec, Offset: 0x8d8
// Size: 0xf0
function function_df2506d3(var_210b4680) {
    var_eb2f1399 = [];
    foreach (e_player in level.activeplayers) {
        if (function_35babccd(e_player) == var_210b4680) {
            if (!isdefined(var_eb2f1399)) {
                var_eb2f1399 = [];
            } else if (!isarray(var_eb2f1399)) {
                var_eb2f1399 = array(var_eb2f1399);
            }
            var_eb2f1399[var_eb2f1399.size] = e_player;
        }
    }
    return var_eb2f1399;
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0xbef1a646, Offset: 0x9d0
// Size: 0x32
function function_9dd97963(ent) {
    return ent istouching(level.var_b4fcac11[3]);
}

// Namespace zm_office_floors/zm_office_floors
// Params 1, eflags: 0x1 linked
// Checksum 0x1cfedc2b, Offset: 0xa10
// Size: 0xa0
function function_ee59e344(ent) {
    if (isdefined(level.elevator1.moving_to) && ent istouching(level.var_83225f64[0])) {
        return true;
    } else if (isdefined(level.elevator2.moving_to) && ent istouching(level.var_83225f64[1])) {
        return true;
    }
    return false;
}

