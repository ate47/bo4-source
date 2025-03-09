#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\zm\zm_orange_util;
#using scripts\zm_common\callbacks;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_orange_trophies;

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x40f7f106, Offset: 0x468
// Size: 0x13c
function init() {
    level function_e12fb431();
    level function_2b6fe83b();
    level third_fallen_soldiers_robots_decon_room_cleared();
    callback::on_connect(&on_player_connect);
    callback::on_ai_killed(&function_4ff2cfd9);
    level flag::init(#"hash_6046825f3ec27c48");
    callback::on_ai_killed(&function_5b264d4d);
    level.var_79447139 = 0;
    level.var_a43a746d = 0;
    callback::on_ai_killed(&function_c28621d7);
    level thread function_6c88da5b();
    level flag::init(#"hash_e1ce5432989899");
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x623d51e5, Offset: 0x5b0
// Size: 0x34
function main() {
    level thread function_63522769();
    level thread function_b0e59abe();
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x934e37f9, Offset: 0x5f0
// Size: 0x8c
function on_player_connect() {
    self.var_c4baf001 = 0;
    self.var_59c409c3 = 0;
    self.var_65b6215d = [];
    self.var_5fe30ecb = [];
    self thread function_790e5d6();
    self thread function_3202188();
    self thread function_c7b3bfea();
    self thread function_3d9f4eef();
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x78dfb5b1, Offset: 0x688
// Size: 0x64
function function_ea67bd7c() {
    level endon(#"game_ended");
    /#
        iprintlnbold("<dev string:x38>" + "<dev string:x4b>");
    #/
    self zm_utility::giveachievement_wrapper("zm_orange_ascend", 1);
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x176df8da, Offset: 0x6f8
// Size: 0xa0
function function_e12fb431() {
    a_e_bells = getentarray("challenges_bell", "targetname");
    foreach (e_bell in a_e_bells) {
        e_bell thread function_e86e864b();
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x5cb23ed1, Offset: 0x7a0
// Size: 0xbc
function function_e86e864b() {
    while (true) {
        s_result = self waittill(#"damage");
        if (zm_orange_util::function_fe8ee9f0(s_result.weapon, 0) && isplayer(s_result.attacker) && !isbot(s_result.attacker)) {
            s_result.attacker notify(#"hash_2a12c37201945891");
        }
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x996a0e24, Offset: 0x868
// Size: 0x130
function function_790e5d6() {
    self notify("6bc3c02292831de5");
    self endon("6bc3c02292831de5");
    self endon(#"death");
    self endon(#"disconnect");
    self endon(#"bells_failed");
    var_a3404ecb = 0;
    while (!var_a3404ecb) {
        self waittill(#"hash_2a12c37201945891");
        self.var_c4baf001 += 1;
        if (self.var_c4baf001 >= 4) {
            self notify(#"bells_complete");
            /#
                iprintlnbold("<dev string:x38>" + "<dev string:x5e>");
            #/
            self zm_utility::giveachievement_wrapper("zm_orange_bells", 0);
            var_a3404ecb = 1;
            continue;
        }
        if (self.var_c4baf001 == 1) {
            self thread function_a0367a9();
        }
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x77c61653, Offset: 0x9a0
// Size: 0x84
function function_a0367a9() {
    self notify("2893aeee5972a277");
    self endon("2893aeee5972a277");
    self endon(#"death");
    self endon(#"disconnect");
    self endon(#"bells_complete");
    wait 12;
    self notify(#"bells_failed");
    self.var_c4baf001 = 0;
    self thread function_790e5d6();
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 1, eflags: 0x0
// Checksum 0x1b95b1f5, Offset: 0xa30
// Size: 0x64
function function_c28621d7(s_params) {
    if (isdefined(self.water_damage) && self.water_damage && !level flag::get(#"hash_e1ce5432989899")) {
        level thread function_b9f47977(self);
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 1, eflags: 0x0
// Checksum 0x20a32bf, Offset: 0xaa0
// Size: 0x112
function function_b9f47977(e_zombie) {
    self endon(#"hash_402140b7cdc4bca1");
    self.var_79447139 += 1;
    if (self.var_79447139 >= 10) {
        /#
            iprintlnbold("<dev string:x38>" + "<dev string:x70>");
        #/
        self zm_utility::giveachievement_wrapper("zm_orange_freeze", 1);
        level flag::set(#"hash_e1ce5432989899");
        callback::remove_on_ai_killed(&function_c28621d7);
        self notify(#"hash_402140b7cdc4bca1");
    }
    e_zombie function_e140ff5c();
    self.var_79447139 -= 1;
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x5e62aebb, Offset: 0xbc0
// Size: 0x2c
function function_e140ff5c() {
    self endon(#"cleanup_freezegun_triggers");
    while (true) {
        wait 1;
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 1, eflags: 0x0
// Checksum 0x29916329, Offset: 0xbf8
// Size: 0x14c
function function_4ff2cfd9(s_result) {
    if (self.archetype == #"zombie_dog" && zm_orange_util::function_fe8ee9f0(s_result.weapon, 0) && !level flag::get(#"hash_6046825f3ec27c48")) {
        s_result.eattacker.var_59c409c3 += 1;
        if (s_result.eattacker.var_59c409c3 >= 5) {
            /#
                iprintlnbold("<dev string:x38>" + "<dev string:x83>");
            #/
            s_result.eattacker zm_utility::giveachievement_wrapper("zm_orange_hounds", 0);
            level flag::set(#"hash_6046825f3ec27c48");
            level callback::remove_on_ai_killed(&function_4ff2cfd9);
        }
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0xee78c529, Offset: 0xd50
// Size: 0x6c
function function_6c88da5b() {
    while (level.var_a43a746d < 5) {
        wait 1;
    }
    /#
        iprintlnbold("<dev string:x38>" + "<dev string:x96>");
    #/
    level zm_utility::giveachievement_wrapper("zm_orange_totems", 1);
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x63315c1e, Offset: 0xdc8
// Size: 0x154
function function_3202188() {
    self endon(#"death");
    self endon(#"disconnect");
    while (self.var_65b6215d.size < 5) {
        s_result = self waittill(#"hash_1ac4338b0d419091");
        if (s_result.var_7139c18c == "pap_taken") {
            if (!isdefined(self.var_65b6215d)) {
                self.var_65b6215d = [];
            } else if (!isarray(self.var_65b6215d)) {
                self.var_65b6215d = array(self.var_65b6215d);
            }
            if (!isinarray(self.var_65b6215d, level.var_7d8bf93f)) {
                self.var_65b6215d[self.var_65b6215d.size] = level.var_7d8bf93f;
            }
        }
    }
    /#
        iprintlnbold("<dev string:x38>" + "<dev string:xa9>");
    #/
    self zm_utility::giveachievement_wrapper("zm_orange_pack", 0);
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0xf8d12137, Offset: 0xf28
// Size: 0x7c
function function_b0e59abe() {
    level flag::wait_till(#"edge_of_the_world_complete");
    if (isdefined(level.edge_player)) {
        /#
            iprintlnbold("<dev string:x38>" + "<dev string:xba>");
        #/
        level.edge_player zm_utility::giveachievement_wrapper("zm_orange_secret", 0);
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0xee3aa11d, Offset: 0xfb0
// Size: 0x1206
function third_fallen_soldiers_robots_decon_room_cleared() {
    level flag::init(#"hash_113f70c573aed94d");
    level.var_55b76576 = [];
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "artifact_storage_to_forecastle")) {
        level.var_55b76576[level.var_55b76576.size] = "artifact_storage_to_forecastle";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "beach_to_gangway")) {
        level.var_55b76576[level.var_55b76576.size] = "beach_to_gangway";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "beach_to_lighthouse_approach")) {
        level.var_55b76576[level.var_55b76576.size] = "beach_to_lighthouse_approach";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "cargo_hold_to_artifact_storage")) {
        level.var_55b76576[level.var_55b76576.size] = "cargo_hold_to_artifact_storage";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, #"hash_38c97197db36afb7")) {
        level.var_55b76576[level.var_55b76576.size] = #"hash_38c97197db36afb7";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "decontamination_doors")) {
        level.var_55b76576[level.var_55b76576.size] = "decontamination_doors";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "docks_to_boathouse")) {
        level.var_55b76576[level.var_55b76576.size] = "docks_to_boathouse";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "frozen_crevasse_open")) {
        level.var_55b76576[level.var_55b76576.size] = "frozen_crevasse_open";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "gangway_to_main_deck")) {
        level.var_55b76576[level.var_55b76576.size] = "gangway_to_main_deck";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "gangway_to_navigation")) {
        level.var_55b76576[level.var_55b76576.size] = "gangway_to_navigation";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "gangway_to_stern")) {
        level.var_55b76576[level.var_55b76576.size] = "gangway_to_stern";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "geological_processing_doors")) {
        level.var_55b76576[level.var_55b76576.size] = "geological_processing_doors";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "grotto_tunnel_open")) {
        level.var_55b76576[level.var_55b76576.size] = "grotto_tunnel_open";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "hidden_path_open")) {
        level.var_55b76576[level.var_55b76576.size] = "hidden_path_open";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, #"hash_48e7d63b38c5e2da")) {
        level.var_55b76576[level.var_55b76576.size] = #"hash_48e7d63b38c5e2da";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "lighthouse_cove_to_cargo_hold")) {
        level.var_55b76576[level.var_55b76576.size] = "lighthouse_cove_to_cargo_hold";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "lighthouse_cove_to_lighthouse_station")) {
        level.var_55b76576[level.var_55b76576.size] = "lighthouse_cove_to_lighthouse_station";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "lighthouse_level_1_doors")) {
        level.var_55b76576[level.var_55b76576.size] = "lighthouse_level_1_doors";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "lighthouse_station_to_lighthouse_level_2")) {
        level.var_55b76576[level.var_55b76576.size] = "lighthouse_station_to_lighthouse_level_2";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "lighthouse_station_to_lighthouse_level_3")) {
        level.var_55b76576[level.var_55b76576.size] = "lighthouse_station_to_lighthouse_level_3";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "lighthouse_level_3_to_level_4")) {
        level.var_55b76576[level.var_55b76576.size] = "lighthouse_level_3_to_level_4";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "main_deck_to_forecastle")) {
        level.var_55b76576[level.var_55b76576.size] = "main_deck_to_forecastle";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, #"hash_52d967f4fc8b12fc")) {
        level.var_55b76576[level.var_55b76576.size] = #"hash_52d967f4fc8b12fc";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, #"hash_6f7fd3d4d070db87")) {
        level.var_55b76576[level.var_55b76576.size] = #"hash_6f7fd3d4d070db87";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "specimen_storage_doors")) {
        level.var_55b76576[level.var_55b76576.size] = "specimen_storage_doors";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "sun_deck_to_bridge")) {
        level.var_55b76576[level.var_55b76576.size] = "sun_deck_to_bridge";
    }
    if (!isdefined(level.var_55b76576)) {
        level.var_55b76576 = [];
    } else if (!isarray(level.var_55b76576)) {
        level.var_55b76576 = array(level.var_55b76576);
    }
    if (!isinarray(level.var_55b76576, "upper_catwalk_to_human_infusion")) {
        level.var_55b76576[level.var_55b76576.size] = "upper_catwalk_to_human_infusion";
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x7ddbb66b, Offset: 0x21c0
// Size: 0x12c
function function_63522769() {
    level flag::wait_till_all(level.var_55b76576);
    level flag::set(#"hash_113f70c573aed94d");
    if (!level flag::get(#"power_on") && !level flag::get(#"power_on1") && !level flag::get(#"power_on2") && !level flag::get(#"power_on3")) {
        /#
            iprintlnbold("<dev string:x38>" + "<dev string:xcd>");
        #/
        level zm_utility::giveachievement_wrapper("zm_orange_power", 1);
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0xa2d1db0f, Offset: 0x22f8
// Size: 0x150
function function_c7b3bfea() {
    self endon(#"death");
    self endon(#"disconnect");
    while (self.var_5fe30ecb.size < 9) {
        s_result = self waittill(#"hash_702a9c7f10066b19");
        if (!isdefined(self.var_5fe30ecb)) {
            self.var_5fe30ecb = [];
        } else if (!isarray(self.var_5fe30ecb)) {
            self.var_5fe30ecb = array(self.var_5fe30ecb);
        }
        if (!isinarray(self.var_5fe30ecb, s_result.str_location)) {
            self.var_5fe30ecb[self.var_5fe30ecb.size] = s_result.str_location;
        }
        if (self.var_5fe30ecb.size >= 9) {
            /#
                iprintlnbold("<dev string:x38>" + "<dev string:xdf>");
            #/
            self zm_utility::giveachievement_wrapper("zm_orange_ziplines", 0);
        }
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 1, eflags: 0x0
// Checksum 0x1ed5a6ce, Offset: 0x2450
// Size: 0x3a
function function_5b264d4d(s_result) {
    if (isplayer(s_result.eattacker)) {
        s_result.eattacker.var_5fe30ecb = [];
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0xc0c80f14, Offset: 0x2498
// Size: 0x52
function function_3d9f4eef() {
    self endon(#"disconnect");
    self endon(#"death");
    while (true) {
        self waittill(#"entering_last_stand");
        self.var_5fe30ecb = [];
    }
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0xdb655d8c, Offset: 0x24f8
// Size: 0x64
function function_2b6fe83b() {
    e_jar = getent("animosity", "targetname");
    e_jar setcandamage(1);
    e_jar thread function_82947e72();
}

// Namespace zm_orange_trophies/zm_orange_trophies
// Params 0, eflags: 0x0
// Checksum 0x4ad62357, Offset: 0x2568
// Size: 0x158
function function_82947e72() {
    while (true) {
        s_result = self waittill(#"damage");
        if (s_result.weapon.name === #"pistol_standard_t8" || s_result.weapon.name === #"pistol_standard_t8_upgraded") {
            level exploder::exploder("fxexp_glass_jar_exp");
            self hide();
            self setcandamage(0);
            /#
                iprintlnbold("<dev string:x38>" + "<dev string:xf4>");
            #/
            s_result.attacker zm_utility::giveachievement_wrapper("zm_orange_jar", 0);
            wait 3;
            self show();
            self setcandamage(1);
        }
    }
}

