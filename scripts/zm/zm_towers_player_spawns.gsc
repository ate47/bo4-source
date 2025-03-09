#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\teleport_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_towers_player_spawns;

// Namespace zm_towers_player_spawns/zm_towers_player_spawns
// Params 0, eflags: 0x0
// Checksum 0x91a218ee, Offset: 0x2f8
// Size: 0x6c
function init() {
    level thread function_c91644e8();
    level thread function_e5f05a92();
    level thread function_b117d867();
    callback::on_connect(&function_c49fe830);
}

// Namespace zm_towers_player_spawns/zm_towers_player_spawns
// Params 0, eflags: 0x0
// Checksum 0xff52d74b, Offset: 0x370
// Size: 0x4c
function function_c91644e8() {
    level endon(#"end_game");
    level flag::wait_till("begin_spawning");
    teleport::team("teleport_starting_tunnel");
}

// Namespace zm_towers_player_spawns/zm_towers_player_spawns
// Params 0, eflags: 0x0
// Checksum 0xa96b2ed5, Offset: 0x3c8
// Size: 0x524
function function_e5f05a92() {
    level endon(#"end_game");
    mdl_clip = getent("arena_gate_east_clip", "targetname");
    mdl_gate = getent("arena_gate_east", "targetname");
    mdl_clip linkto(mdl_gate);
    level flag::wait_till("begin_spawning");
    wait 2.5;
    mdl_gate movez(100, 3);
    mdl_gate playsound(#"hash_2dfa3192317aab20");
    mdl_gate clientfield::set("entry_gate_dust", 1);
    wait 3;
    var_ac1242dd = 0;
    vol_spawn_area = getent("vol_spawn_area", "targetname");
    while (!var_ac1242dd) {
        a_e_touching = [];
        foreach (e_player in util::get_active_players()) {
            if (e_player istouching(vol_spawn_area)) {
                if (!isdefined(a_e_touching)) {
                    a_e_touching = [];
                } else if (!isarray(a_e_touching)) {
                    a_e_touching = array(a_e_touching);
                }
                a_e_touching[a_e_touching.size] = e_player;
                continue;
            }
            if (e_player clientfield::get_to_player("snd_crowd_react") != 8) {
                e_player clientfield::set_to_player("snd_crowd_react", 8);
                if (level clientfield::get("crowd_react") != 3) {
                    level clientfield::set("crowd_react", 3);
                }
            }
        }
        if (a_e_touching.size == 0) {
            a_ai_zombies = getactorarray();
            foreach (ai_zombie in a_ai_zombies) {
                if (ai_zombie istouching(vol_spawn_area)) {
                    if (!isdefined(a_e_touching)) {
                        a_e_touching = [];
                    } else if (!isarray(a_e_touching)) {
                        a_e_touching = array(a_e_touching);
                    }
                    a_e_touching[a_e_touching.size] = ai_zombie;
                }
            }
            if (a_e_touching.size == 0) {
                var_ac1242dd = 1;
                break;
            }
        }
        waitframe(1);
    }
    level notify(#"hash_576f1c2e68b31710");
    mdl_gate movez(100 * -1, 0.5);
    mdl_gate playsound(#"hash_7f2e66132114e68c");
    wait 0.5;
    zm_zonemgr::function_d68ef0f9("zone_starting_area_tunnel");
    exploder::exploder("exp_gate_slam");
    exploder::exploder("exp_lgt_player_start");
    level util::clientnotify("crowd_ducker_lvlstart");
    wait 10;
    if (level clientfield::get("crowd_react") == 3) {
        level clientfield::set("crowd_react", 0);
    }
}

// Namespace zm_towers_player_spawns/zm_towers_player_spawns
// Params 0, eflags: 0x0
// Checksum 0x65f55e99, Offset: 0x8f8
// Size: 0xd4
function function_b117d867() {
    level endon(#"end_game");
    scene::init("p8_fxanim_zm_towers_center_platform_rails_bundle");
    level flag::wait_till("begin_spawning");
    t_trigger = getent("t_raise_center_platform_rails", "targetname");
    t_trigger waittilltimeout(6, #"trigger");
    scene::play("p8_fxanim_zm_towers_center_platform_rails_bundle");
    t_trigger delete();
}

// Namespace zm_towers_player_spawns/zm_towers_player_spawns
// Params 0, eflags: 0x0
// Checksum 0xd00a7d5b, Offset: 0x9d8
// Size: 0x242
function function_c49fe830() {
    level endon(#"end_game");
    self endon(#"disconnect");
    level.var_c9942395 = 0;
    var_7529ade9 = array("zone_starting_area_tunnel", "zone_starting_area_center", "zone_starting_area_danu", "zone_starting_area_ra", "zone_starting_area_odin", "zone_starting_area_zeus", "zone_danu_hallway", "zone_ra_hallway", "zone_odin_hallway", "zone_zeus_hallway");
    while (true) {
        str_zone = self zm_zonemgr::get_player_zone();
        if (!isinarray(var_7529ade9, str_zone)) {
            wait 30;
            str_zone = self zm_zonemgr::get_player_zone();
            if (!isinarray(var_7529ade9, str_zone) && !level.var_c9942395) {
                break;
            }
        }
        wait 1;
    }
    var_d4061661 = array("zone_starting_area_center", "zone_starting_area_danu", "zone_starting_area_ra", "zone_starting_area_odin", "zone_starting_area_zeus");
    while (true) {
        str_zone = self zm_zonemgr::get_player_zone();
        if (zm_utility::is_player_valid(self, 0, 0) && isinarray(var_d4061661, str_zone) && !level.var_c9942395) {
            level thread function_a1379826();
            self thread zm_audio::create_and_play_dialog(#"location_enter", #"arena");
            break;
        }
        wait 1;
    }
}

// Namespace zm_towers_player_spawns/zm_towers_player_spawns
// Params 0, eflags: 0x0
// Checksum 0x2b6963b0, Offset: 0xc28
// Size: 0x42
function function_a1379826() {
    self notify("774a09e7ee8e5620");
    self endon("774a09e7ee8e5620");
    level.var_c9942395 = 1;
    wait 45;
    level.var_c9942395 = 0;
}

