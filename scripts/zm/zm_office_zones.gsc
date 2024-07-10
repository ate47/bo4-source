#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_hud.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\spawner_shared.gsc;
#using scripts\core_common\flag_shared.gsc;

#namespace zm_office_zones;

// Namespace zm_office_zones/zm_office_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xb91cbc2d, Offset: 0x328
// Size: 0x24
function init() {
    callback::on_spawned(&function_29ec1ad7);
}

// Namespace zm_office_zones/zm_office_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xb55461d2, Offset: 0x358
// Size: 0x4c4
function zone_init() {
    level flag::init("always_on");
    level flag::set("always_on");
    zm_zonemgr::zone_init("conference_level1");
    zm_zonemgr::enable_zone("conference_level1");
    level.disable_kill_thread = 1;
    zm_zonemgr::add_adjacent_zone("conference_level1", "hallway_level1", "conf1_hall1", 0);
    zm_zonemgr::add_adjacent_zone("conference_level1", "file_room_level1", "conf1_file_door", 0);
    zm_zonemgr::add_adjacent_zone("hallway_level1", "offices_level1", "hallway1_office_door", 0);
    zm_zonemgr::add_adjacent_zone("file_room_level1", "offices_level1", "file_office_blocker", 0);
    zm_zonemgr::add_adjacent_zone("conference_level1", "offices_level1", "conf1_offices1", 0);
    zm_zonemgr::add_adjacent_zone("hallway_level1", "file_room_level1", "hall1_file1", 0);
    zm_zonemgr::add_adjacent_zone("conference_level2", "war_room_zone_south", "war_room_entry");
    zm_zonemgr::add_adjacent_zone("conference_level2", "war_room_zone_north", "war_room_special");
    zm_zonemgr::add_adjacent_zone("war_room_zone_top", "war_room_zone_south", "war_room_stair", 0);
    zm_zonemgr::add_adjacent_zone("war_room_zone_top", "war_room_zone_north", "war_room_stair", 0);
    zm_zonemgr::add_adjacent_zone("war_room_zone_south", "war_room_zone_north", "war_room_stair", 0);
    zm_zonemgr::add_adjacent_zone("war_room_zone_south", "war_room_zone_north", "war_room_west", 0);
    zm_zonemgr::add_adjacent_zone("war_room_zone_south", "war_room_server_room", "war_room_server_door", 0);
    zm_zonemgr::add_adjacent_zone("war_room_zone_north", "war_room_zone_elevator", "war_room_elevator", 0);
    zm_zonemgr::add_adjacent_zone("labs_elevator", "labs_hallway1", "labs_enabled", 0);
    zm_zonemgr::add_adjacent_zone("labs_hallway1", "labs_hallway2", "labs_enabled", 0);
    zm_zonemgr::add_adjacent_zone("labs_hallway2", "labs_zone1", "lab1_level3", 0);
    zm_zonemgr::add_adjacent_zone("labs_hallway1", "labs_zone2", "lab2_level3", 0);
    zm_zonemgr::add_adjacent_zone("labs_hallway2", "labs_zone2", "lab2_level3", 0);
    zm_zonemgr::add_adjacent_zone("labs_hallway1", "labs_zone3", "lab3_level3", 0);
    zm_zonemgr::add_adjacent_zone("labs_zone1", "labs_hallway1", "lab1_level3", 1);
    zm_zonemgr::add_adjacent_zone("cage", "cage_upper", #"hash_537cc10c9deca9da", 0);
    level.zones[#"conference_level1"].var_305d6168 = 4;
    level.zones[#"hallway_level1"].var_305d6168 = 4;
    level thread function_d03a6fa("conference_level1", "offices_level1", "conf1_offices1");
    level thread function_d03a6fa("hallway_level1", "file_room_level1", "hall1_file1");
    /#
        level thread function_2fb4c999();
    #/
}

// Namespace zm_office_zones/zm_office_zones
// Params 3, eflags: 0x1 linked
// Checksum 0x9dd38f70, Offset: 0x828
// Size: 0x74
function function_d03a6fa(str_zone1, str_zone2, str_flag) {
    while (!zm_zonemgr::zone_is_enabled(str_zone1) || !zm_zonemgr::zone_is_enabled(str_zone2)) {
        waitframe(1);
    }
    level flag::set(str_flag);
}

// Namespace zm_office_zones/zm_office_zones
// Params 1, eflags: 0x1 linked
// Checksum 0x68270145, Offset: 0x8a8
// Size: 0x66
function function_cada51b5(b_enable = 1) {
    level.zones[#"cage"].is_enabled = b_enable;
    level.zones[#"cage_upper"].is_enabled = b_enable;
}

// Namespace zm_office_zones/zm_office_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xa12f6fd2, Offset: 0x918
// Size: 0x1c
function function_29ec1ad7() {
    self thread function_8e0b371();
}

// Namespace zm_office_zones/zm_office_zones
// Params 0, eflags: 0x1 linked
// Checksum 0xe0d7ad49, Offset: 0x940
// Size: 0xb8
function function_8e0b371() {
    self endon(#"disconnect");
    while (true) {
        if (isalive(self)) {
            str_location = function_ab7f70b9(self);
            self zm_hud::function_29780fb5(isdefined(str_location) ? str_location : #"");
        } else {
            self zm_hud::function_29780fb5(#"");
        }
        wait(0.5);
    }
}

// Namespace zm_office_zones/zm_office_zones
// Params 1, eflags: 0x1 linked
// Checksum 0xaea5cf36, Offset: 0xa00
// Size: 0x336
function function_ab7f70b9(e_player) {
    str_zone = e_player zm_zonemgr::get_player_zone();
    if (!isdefined(str_zone)) {
        return undefined;
    }
    switch (str_zone) {
    case #"conference_level1":
        var_dd0ed16d = getent("file_hallway_zone", "targetname");
        if (e_player istouching(var_dd0ed16d)) {
            str_display = #"hash_38aec412b15daa7f";
        } else {
            str_display = #"hash_2960dd7ca313a1d0";
        }
        break;
    case #"hallway_level1":
        str_display = #"hash_23e7b86056327ad8";
        break;
    case #"file_room_level1":
        str_display = #"hash_43e992b83f837d3e";
        break;
    case #"offices_level1":
        str_display = #"hash_179368775ecfafa9";
        break;
    case #"war_room_zone_south":
    case #"war_room_zone_north":
    case #"war_room_zone_elevator":
        str_display = #"hash_25854f4ac1fdadf5";
        break;
    case #"war_room_server_room":
        str_display = #"hash_7d3cd67fea75827c";
        break;
    case #"war_room_zone_top":
        str_display = #"hash_572f6dd3e58ede79";
        break;
    case #"conference_level2":
        str_display = #"hash_2960e07ca313a6e9";
        break;
    case #"labs_elevator":
    case #"labs_hallway1":
        str_display = #"hash_48fce08911acd38a";
        break;
    case #"labs_hallway2":
        str_display = #"hash_48fcdf8911acd1d7";
        break;
    case #"labs_zone1":
        str_display = #"hash_6e0edea58f326450";
        break;
    case #"labs_zone2":
        str_display = #"hash_6e0ee1a58f326969";
        break;
    case #"labs_zone3":
        str_display = #"hash_6e0ee0a58f3267b6";
        break;
    case #"cage_upper":
    case #"cage":
        str_display = #"hash_62b9f4974de13b76";
        break;
    default:
        str_display = undefined;
        break;
    }
    return str_display;
}

/#

    // Namespace zm_office_zones/zm_office_zones
    // Params 0, eflags: 0x0
    // Checksum 0x80085022, Offset: 0xd40
    // Size: 0x3c
    function function_2fb4c999() {
        level waittill(#"open_sesame");
        level flag::set("<dev string:x38>");
    }

#/
