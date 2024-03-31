// Atian COD Tools GSC decompiler test
#using scripts\wz_common\wz_blackjack_stash.gsc;
#using scripts\wz_common\wz_holiday.gsc;
#using scripts\wz_common\wz_ee_poster.gsc;
#using scripts\wz_common\wz_dynents.gsc;
#using script_34e49e82e2f499e1;
#using scripts\wz_common\wz_jukebox.gsc;
#using scripts\wz_common\wz_buoy_stash.gsc;
#using script_217568d3a92fb9b;
#using scripts\wz_common\wz_asylum.gsc;
#using scripts\wz_common\wz_array_broadcast.gsc;
#using scripts\wz_common\wz_firing_range.gsc;
#using script_3267610dfd12104c;
#using scripts\wz\wz_open_skyscrapers_ai_zones.gsc;
#using scripts\wz\wz_open_skyscrapers_ffotd.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\gestures.gsc;
#using scripts\wz\wz_open_skyscrapers_sound.gsc;
#using scripts\wz\wz_open_skyscrapers_fx.gsc;
#using scripts\wz_common\wz_loadouts.gsc;
#using scripts\wz_common\spawn.gsc;
#using script_7611295950bc2c87;
#using script_5f3e7d348fbc5283;
#using scripts\mp_common\load.gsc;
#using scripts\mp_common\item_inventory.gsc;
#using script_71e26f08f03b7a7a;
#using scripts\mp_common\item_world.gsc;
#using scripts\core_common\compass.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\values_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\death_circle.gsc;
#using scripts\core_common\callbacks_shared.gsc;

#namespace wz_open_skyscrapers;

// Namespace wz_open_skyscrapers/level_init
// Params 1, eflags: 0x40
// Checksum 0x79f63928, Offset: 0x1d8
// Size: 0x2dc
function event_handler[level_init] main(eventstruct) {
    setclearanceceiling(17);
    callback::on_spawned(&on_player_spawned);
    callback::on_vehicle_spawned(&on_vehicle_spawned);
    callback::on_finalize_initialization(&on_finalize_initialization);
    level.mapcenter = (0, 0, 0);
    setmapcenter(level.mapcenter);
    level.var_7fd6bd44 = 9000;
    wz_open_skyscrapers_fx::main();
    namespace_3e7014ef::main();
    load::main();
    level.var_405a6738 = 35000;
    level.var_8a390df2 = 35000;
    compass::setupminimap("");
    setdvar(#"hash_6b51c550499b0af2", 1);
    level namespace_ebd5f10d::function_6f6f5189();
    if (isdefined(getgametypesetting(#"wzheavymetalheroes")) && getgametypesetting(#"wzheavymetalheroes")) {
        level.var_2089aa11 = #"supply_drop_stash_parent_dlc1_heroes";
        namespace_3d2704b3::function_f0297225(#"supply_drop_stash_parent_dlc1_flare_gun_heroes", 2, 4);
    }
    if (util::get_game_type() == "warzone_pandemic_quad") {
        namespace_3d2704b3::function_f0297225(#"supply_drop_stash_parent_pandemic", 2147483647, 100);
        level function_5725bc63();
    }
    /#
        init_devgui();
    #/
    level wz_open_skyscrapers_ai_zones::init();
    wz_firing_range::init_targets("firing_range_target");
    wz_firing_range::init_targets("firing_range_target_challenge");
    item_world::function_cbc32e1b(30000);
    level thread function_2560f130();
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x1 linked
// Checksum 0x64945dcf, Offset: 0x4c0
// Size: 0x64
function on_player_spawned() {
    /#
        self thread function_2d706436();
    #/
    /#
        self thread function_f2c2f4f9();
    #/
    /#
        self thread function_38146f54();
    #/
    /#
        self thread function_e8f0335f();
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x1 linked
// Checksum 0x7ccc7e02, Offset: 0x530
// Size: 0x4c
function on_vehicle_spawned() {
    /#
        self thread function_f42944c7();
    #/
    /#
        self thread function_6a3e277();
    #/
    /#
        self thread function_e2fc5dd9();
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x1 linked
// Checksum 0x3e4f81e0, Offset: 0x588
// Size: 0x24
function on_finalize_initialization() {
    waitframe(3);
    level function_7276b578();
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x5 linked
// Checksum 0x961f835e, Offset: 0x5b8
// Size: 0x148
function private function_5725bc63() {
    var_e749c212 = struct::get_array(#"hydro_zombie_player_spawn");
    foreach (spawn in var_e749c212) {
        if (isdefined(spawn)) {
            if (spawn.origin === (30224, -46011, 2048) || spawn.origin === (30149, -45912, 2048) || spawn.origin === (30273, -45851, 2048) || spawn.origin === (30179, -45774, 2048)) {
                arrayremovevalue(level.struct, spawn);
                spawn struct::delete();
            }
        }
    }
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x1 linked
// Checksum 0xb477a6e4, Offset: 0x708
// Size: 0x100
function function_7276b578() {
    a_ramps = getdynentarray("hmh_ramp");
    enabled = isdefined(getgametypesetting(#"wzheavymetalheroes")) && getgametypesetting(#"wzheavymetalheroes");
    if (isdefined(a_ramps)) {
        foreach (ramp in a_ramps) {
            if (isdefined(ramp)) {
                setdynentenabled(ramp, enabled);
            }
        }
    }
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x1 linked
// Checksum 0xbcd46130, Offset: 0x810
// Size: 0x110
function function_2560f130() {
    item_world::function_4de3ca98();
    a_ramps = getdynentarray("hmh_ramp");
    enabled = isdefined(getgametypesetting(#"wzheavymetalheroes")) && getgametypesetting(#"wzheavymetalheroes");
    if (isdefined(a_ramps)) {
        foreach (ramp in a_ramps) {
            if (isdefined(ramp)) {
                setdynentenabled(ramp, enabled);
            }
        }
    }
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x7731ec65, Offset: 0x928
// Size: 0x22c
function init_devgui() {
    /#
        mapname = util::get_map_name();
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        adddebugcommand("<unknown string>");
        adddebugcommand("<unknown string>" + mapname + "<unknown string>");
        level thread function_97714f49();
        level thread function_9cc59537();
        level thread function_10c650e6();
        level thread function_eef7849();
        level thread function_4b227faf();
        level thread function_c447999a();
        level thread function_a2b6e273();
        level thread devgui_weapon_think();
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x5912a880, Offset: 0xb60
// Size: 0xb0a
function function_4b227faf() {
    /#
        if (!getdvarint(#"hash_59e2d7722e56c1c6", 0)) {
            return;
        }
        var_1d9375fc = struct::get_array("<unknown string>", "<unknown string>");
        foreach (group in var_1d9375fc) {
            switch (group.scriptbundlename) {
            case #"open_skyscraper_vehicles_arav":
                var_d5d9cd1 = group;
                break;
            case #"open_skyscraper_vehicles_atv":
                var_96bc77ce = group;
                break;
            case #"open_skyscraper_vehicles_cargo_truck":
                var_208aaa54 = group;
                break;
            case #"open_skyscraper_vehicles_cargo_truck_clearing":
                var_25dfca32 = group;
                break;
            case #"open_skyscraper_vehicles_heli":
                var_4b606147 = group;
                break;
            case #"open_skyscraper_vehicles_heli_clearing":
                var_d6662d66 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac":
                var_dc1ea650 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_docks":
                var_707ce24b = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_nuketown":
                var_e3ab2d7f = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_hydro_dam":
                var_169219e9 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_skyscraper":
                var_4bf01581 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_hijacked":
                var_993b03f = group;
                break;
            case #"open_skyscraper_vehicles_muscle_car_hot_pursuit":
                var_5864ac74 = group;
                break;
            case #"open_skyscraper_vehicles_pbr":
                var_25e0e288 = group;
                break;
            case #"open_skyscraper_vehicles_suv_base":
                var_284a1b99 = group;
                break;
            default:
                break;
            }
            if (isdefined(var_96bc77ce) && isdefined(var_208aaa54) && isdefined(var_25dfca32) && isdefined(var_4b606147) && isdefined(var_d6662d66) && isdefined(var_dc1ea650) && isdefined(var_707ce24b) && isdefined(var_e3ab2d7f) && isdefined(var_169219e9) && isdefined(var_4bf01581) && isdefined(var_993b03f) && isdefined(var_5864ac74) && isdefined(var_d5d9cd1) && isdefined(var_25e0e288) && isdefined(var_284a1b99)) {
                break;
            }
        }
        var_4ff6627b = [];
        var_6c8a74fa = function_91b29d2a(var_96bc77ce.target);
        var_346f9993 = function_91b29d2a(var_208aaa54.target);
        var_46a9ff45 = function_91b29d2a(var_25dfca32.target);
        var_99b9c72b = function_91b29d2a(var_4b606147.target);
        var_78e45028 = function_91b29d2a(var_d6662d66.target);
        var_6b5f6eb2 = function_91b29d2a(var_dc1ea650.target);
        var_8c0143c5 = function_91b29d2a(var_707ce24b.target);
        var_b212d5c7 = function_91b29d2a(var_e3ab2d7f.target);
        var_50e69803 = function_91b29d2a(var_169219e9.target);
        var_88d37f1e = function_91b29d2a(var_4bf01581.target);
        var_d5253bc7 = function_91b29d2a(var_993b03f.target);
        var_2ee195e7 = function_91b29d2a(var_5864ac74.target);
        var_c3fc5903 = function_91b29d2a(var_d5d9cd1.target);
        var_55d52358 = function_91b29d2a(var_284a1b99.target);
        var_f41e1beb = function_91b29d2a(var_25e0e288.target);
        if (getdvarint(#"hash_50975241d48cd6e1", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_6c8a74fa, 0, 0);
        }
        if (getdvarint(#"hash_5e06d8d533e0af7c", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_346f9993, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_46a9ff45, 0, 0);
        }
        if (getdvarint(#"hash_723608e658ae5e0", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_99b9c72b, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_78e45028, 0, 0);
        }
        if (getdvarint(#"hash_25be466ac3a75b4f", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_6b5f6eb2, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_8c0143c5, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_b212d5c7, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_50e69803, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_88d37f1e, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_d5253bc7, 0, 0);
        }
        if (getdvarint(#"hash_14ddfe1d4333e9e", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_2ee195e7, 0, 0);
        }
        if (getdvarint(#"hash_6ba532422c2147de", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_55d52358, 0, 0);
        }
        if (getdvarint(#"hash_4b7e74dc0f26db48", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_c3fc5903, 0, 0);
        }
        if (getdvarint(#"hash_5248bb421df16d24", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_f41e1beb, 0, 0);
        }
        level flag::wait_till("<unknown string>");
        while (getdvarint(#"hash_59e2d7722e56c1c6", 0)) {
            foreach (point in var_4ff6627b) {
                var_91d1913b = distance2d(level.players[0].origin, point.origin);
                n_radius = 0.015 * var_91d1913b;
                if (n_radius > 768) {
                    n_radius = 768;
                }
                if (var_91d1913b > 768) {
                    v_color = function_df930125(point.targetname);
                    str_type = function_9e72a96(point.targetname);
                    sphere(point.origin, n_radius, v_color);
                    if (var_91d1913b < 2048) {
                        print3d(point.origin + (0, 0, 32), str_type, v_color);
                    }
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xb56f1a0c, Offset: 0x1678
// Size: 0x1fa
function function_c447999a() {
    /#
        level endon(#"hash_78e53817cafb5265");
        if (!getdvarint(#"hash_4b508e86f8bff982", 0)) {
            return;
        }
        level flag::wait_till("<unknown string>");
        if (isdefined(level.var_63460f40)) {
            while (getdvarint(#"hash_4b508e86f8bff982", 0)) {
                foreach (obj in level.var_63460f40) {
                    var_91d1913b = distance2d(level.players[0].origin, obj.origin);
                    n_radius = 0.015 * var_91d1913b;
                    if (n_radius > 768) {
                        n_radius = 768;
                    }
                    if (var_91d1913b > 768) {
                        sphere(obj.origin, n_radius, (1, 0, 0));
                        if (var_91d1913b < 2048) {
                            print3d(obj.origin + (0, 0, 32), "<unknown string>", (1, 0, 0));
                        }
                    }
                }
                waitframe(1);
            }
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x7f610c1a, Offset: 0x1880
// Size: 0xaae
function function_eef7849() {
    /#
        if (!getdvarint(#"hash_574de6ff609cc0b1", 0)) {
            return;
        }
        var_1d9375fc = struct::get_array("<unknown string>", "<unknown string>");
        foreach (group in var_1d9375fc) {
            switch (group.scriptbundlename) {
            case #"open_skyscraper_vehicles_arav":
                var_d5d9cd1 = group;
                break;
            case #"open_skyscraper_vehicles_atv":
                var_96bc77ce = group;
                break;
            case #"open_skyscraper_vehicles_cargo_truck":
                var_208aaa54 = group;
                break;
            case #"open_skyscraper_vehicles_cargo_truck_clearing":
                var_25dfca32 = group;
                break;
            case #"open_skyscraper_vehicles_heli":
                var_4b606147 = group;
                break;
            case #"open_skyscraper_vehicles_heli_clearing":
                var_d6662d66 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac":
                var_dc1ea650 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_docks":
                var_707ce24b = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_nuketown":
                var_e3ab2d7f = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_hydro_dam":
                var_169219e9 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_skyscraper":
                var_4bf01581 = group;
                break;
            case #"open_skyscraper_vehicles_zodiac_hijacked":
                var_993b03f = group;
                break;
            case #"open_skyscraper_vehicles_muscle_car_hot_pursuit":
                var_5864ac74 = group;
                break;
            case #"open_skyscraper_vehicles_pbr":
                var_25e0e288 = group;
                break;
            case #"open_skyscraper_vehicles_suv_base":
                var_284a1b99 = group;
                break;
            default:
                break;
            }
            if (isdefined(var_96bc77ce) && isdefined(var_208aaa54) && isdefined(var_25dfca32) && isdefined(var_4b606147) && isdefined(var_d6662d66) && isdefined(var_dc1ea650) && isdefined(var_707ce24b) && isdefined(var_e3ab2d7f) && isdefined(var_169219e9) && isdefined(var_4bf01581) && isdefined(var_993b03f) && isdefined(var_5864ac74) && isdefined(var_d5d9cd1) && isdefined(var_25e0e288) && isdefined(var_284a1b99)) {
                break;
            }
        }
        var_4ff6627b = [];
        var_6c8a74fa = function_91b29d2a(var_96bc77ce.target);
        var_346f9993 = function_91b29d2a(var_208aaa54.target);
        var_46a9ff45 = function_91b29d2a(var_25dfca32.target);
        var_99b9c72b = function_91b29d2a(var_4b606147.target);
        var_78e45028 = function_91b29d2a(var_d6662d66.target);
        var_6b5f6eb2 = function_91b29d2a(var_dc1ea650.target);
        var_8c0143c5 = function_91b29d2a(var_707ce24b.target);
        var_b212d5c7 = function_91b29d2a(var_e3ab2d7f.target);
        var_50e69803 = function_91b29d2a(var_169219e9.target);
        var_88d37f1e = function_91b29d2a(var_4bf01581.target);
        var_d5253bc7 = function_91b29d2a(var_993b03f.target);
        var_2ee195e7 = function_91b29d2a(var_5864ac74.target);
        var_c3fc5903 = function_91b29d2a(var_d5d9cd1.target);
        var_55d52358 = function_91b29d2a(var_284a1b99.target);
        var_f41e1beb = function_91b29d2a(var_25e0e288.target);
        if (getdvarint(#"hash_50975241d48cd6e1", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_6c8a74fa, 0, 0);
        }
        if (getdvarint(#"hash_5e06d8d533e0af7c", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_346f9993, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_46a9ff45, 0, 0);
        }
        if (getdvarint(#"hash_723608e658ae5e0", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_99b9c72b, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_78e45028, 0, 0);
        }
        if (getdvarint(#"hash_25be466ac3a75b4f", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_6b5f6eb2, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_8c0143c5, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_b212d5c7, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_50e69803, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_88d37f1e, 0, 0);
            var_4ff6627b = arraycombine(var_4ff6627b, var_d5253bc7, 0, 0);
        }
        if (getdvarint(#"hash_14ddfe1d4333e9e", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_2ee195e7, 0, 0);
        }
        if (getdvarint(#"hash_6ba532422c2147de", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_55d52358, 0, 0);
        }
        if (getdvarint(#"hash_4b7e74dc0f26db48", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_c3fc5903, 0, 0);
        }
        if (getdvarint(#"hash_5248bb421df16d24", 0)) {
            var_4ff6627b = arraycombine(var_4ff6627b, var_f41e1beb, 0, 0);
        }
        level flag::wait_till("<unknown string>");
        player = level.players[0];
        n_index = 0;
        var_d4714efb = 0;
        while (getdvarint(#"hash_574de6ff609cc0b1", 0) && isalive(player)) {
            if (player util::up_button_pressed()) {
                if (n_index < var_4ff6627b.size - 1) {
                    n_index++;
                } else {
                    n_index = 0;
                }
            } else if (player util::down_button_pressed()) {
                if (n_index == 0) {
                    n_index = var_4ff6627b.size - 1;
                } else {
                    n_index--;
                }
            }
            if (n_index != var_d4714efb) {
                player setorigin(var_4ff6627b[n_index].origin);
                player setplayerangles((0, var_4ff6627b[n_index].angles[1], 0));
                var_d4714efb = n_index;
                wait(0.1);
            }
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 1, eflags: 0x0
// Checksum 0xa50e466a, Offset: 0x2338
// Size: 0x11a
function function_df930125(str_type) {
    /#
        switch (str_type) {
        case #"atv_spawn":
            return (0, 0, 1);
        case #"cargo_truck_spawn":
        case #"cargo_truck_clearing_spawn":
            return (1, 0, 1);
        case #"heli_spawn":
        case #"heli_clearing_spawn":
            return (1, 0, 0);
        case #"arav_clearing_spawn":
        case #"arav_spawn":
            return (0, 1, 1);
        case #"pbr_spawn":
            return (0, 1, 0);
        case #"muscle_car_spawn":
            return (1, 1, 0);
        case #"suv_spawn":
            return (1, 0, 1);
        default:
            return (1, 0.5, 0);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xe409989b, Offset: 0x2460
// Size: 0x436
function function_f42944c7() {
    /#
        if (!getdvarint(#"hash_57a9b32c8a8503f1", 0) || !self function_1221d304()) {
            return;
        }
        self endon(#"death");
        if (!isdefined(level.var_6eef6733)) {
            level.var_6eef6733 = [];
        }
        if (!isdefined(level.var_6eef6733[function_9e72a96(self.vehicletype)])) {
            level.var_6eef6733[function_9e72a96(self.vehicletype)] = [];
        }
        if (!isdefined(level.var_6eef6733[function_9e72a96(self.vehicletype)])) {
            level.var_6eef6733[function_9e72a96(self.vehicletype)] = [];
        } else if (!isarray(level.var_6eef6733[function_9e72a96(self.vehicletype)])) {
            level.var_6eef6733[function_9e72a96(self.vehicletype)] = array(level.var_6eef6733[function_9e72a96(self.vehicletype)]);
        }
        level.var_6eef6733[function_9e72a96(self.vehicletype)][level.var_6eef6733[function_9e72a96(self.vehicletype)].size] = self;
        v_spawn_pos = self.origin;
        level thread function_f567f0cd();
        level flag::wait_till("<unknown string>");
        str_type = function_9e72a96(self.vehicletype);
        v_color = self function_b2775b52();
        while (getdvarint(#"hash_57a9b32c8a8503f1", 0)) {
            var_91d1913b = distance2d(level.players[0].origin, self.origin);
            n_radius = 0.015 * var_91d1913b;
            if (n_radius > 768) {
                n_radius = 768;
            }
            if (var_91d1913b > 768) {
                sphere(self.origin, n_radius, v_color);
                if (var_91d1913b < 2048) {
                    print3d(self.origin + (0, 0, 32), str_type, v_color);
                }
            }
            if (getdvarint(#"hash_491fd7f96bbc8909", 0) && distance2d(v_spawn_pos, self.origin) > 768) {
                line(v_spawn_pos, self.origin, v_color);
                circle(v_spawn_pos, 64, v_color, 0, 1);
            }
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xe6fc14c, Offset: 0x28a0
// Size: 0x25e
function function_f567f0cd() {
    /#
        level notify(#"hash_79845fe0e187bb22");
        level endon(#"hash_79845fe0e187bb22");
        while (getdvarint(#"hash_57a9b32c8a8503f1", 0)) {
            n_total = 0;
            var_bd9acc19 = 176;
            foreach (var_f0ffe8b2 in level.var_6eef6733) {
                var_bd9acc19 = var_bd9acc19 + 24;
                n_total = n_total + var_f0ffe8b2.size;
                foreach (var_3ed342fe in var_f0ffe8b2) {
                    if (isvehicle(var_3ed342fe) && isdefined(var_f0ffe8b2) && isdefined(var_f0ffe8b2[0]) && isdefined(var_f0ffe8b2[0].vehicletype)) {
                        debug2dtext((810, var_bd9acc19, 0), function_9e72a96(var_f0ffe8b2[0].vehicletype) + "<unknown string>" + var_f0ffe8b2.size, var_3ed342fe function_b2775b52());
                        break;
                    }
                }
            }
            debug2dtext((810, 176, 0), "<unknown string>" + n_total, (1, 1, 1));
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x71c50452, Offset: 0x2b08
// Size: 0x4fe
function function_1221d304() {
    /#
        a_str_types = array(#"vehicle_boct_mil_truck_cargo_wz_dark", #"vehicle_boct_mil_truck_cargo_wz_green", #"vehicle_boct_mil_truck_cargo_wz_tan", #"vehicle_boct_mil_boat_tactical_raft_wz_blk", #"vehicle_boct_mil_boat_tactical_raft_wz_gry", #"vehicle_boct_mil_boat_tactical_raft_wz_odg", #"veh_quad_player_wz_blk", #"hash_232abda4e81275f4", #"veh_quad_player_wz_grn", #"hash_2f8d60a5381870ee", #"veh_quad_player_wz_tan", #"vehicle_t8_mil_helicopter_light_transport_wz_grey", #"vehicle_t8_mil_helicopter_light_transport_wz_tan", #"vehicle_t8_mil_helicopter_light_transport_wz_dark", #"vehicle_t8_mil_helicopter_light_transport_wz_black", #"veh_fav_player_wz_blk", #"veh_fav_player_wz_grn", #"veh_fav_player_wz_tan", #"veh_muscle_car_convertible_player_wz_bandit_blk", #"veh_muscle_car_convertible_player_wz_blu", #"veh_muscle_car_convertible_player_wz_grn", #"veh_muscle_car_convertible_player_wz_org", #"veh_muscle_car_convertible_player_wz_phantom", #"veh_muscle_car_convertible_player_wz_red", #"veh_muscle_car_convertible_player_wz_replacer", #"veh_muscle_car_convertible_player_wz_wht", #"veh_muscle_car_convertible_player_wz_ylw", #"veh_muscle_car_convertible_player_wz_blk", #"veh_muscle_car_convertible_player_wz_racing_grn", #"veh_suv_player_police_wz", #"vehicle_boct_mil_boat_pbr_wz_police", #"veh_suv_player_wz_blk", #"veh_suv_player_wz_gry", #"veh_suv_player_wz_met_gry", #"veh_suv_player_wz_wht", #"vehicle_t8_mil_helicopter_light_transport_wz_police", #"veh_suv_player_private_security_wz", #"veh_quad_player_wz_police", #"hash_482e864157620248", #"hash_1d37bc413f25898e", #"hash_1d37af413f257377", #"hash_8ea0340ead96490", #"hash_79bf6a7491c80c7", #"hash_32e4c0a7619f03a9", #"hash_22d9b5a7a0d9dd73", #"vehicle_boct_mil_boat_pbr_wz_black", #"vehicle_boct_mil_boat_pbr_wz_green", #"vehicle_boct_mil_boat_pbr_wz_grey", #"vehicle_boct_mil_boat_pbr_wz_tan", #"vehicle_t8_mil_helicopter_light_gunner_wz_black", #"vehicle_t8_mil_helicopter_light_gunner_wz_dark", #"vehicle_t8_mil_helicopter_light_gunner_wz_green", #"vehicle_t8_mil_helicopter_light_gunner_wz_grey", #"vehicle_t8_mil_helicopter_light_gunner_wz_tan", #"hash_77ac4aa97a8b5aa2", #"vehicle_t8_mil_tank_wz_black", #"vehicle_t8_mil_tank_wz_green", #"vehicle_t8_mil_tank_wz_grey", #"vehicle_t8_mil_tank_wz_tan", #"veh_motorcycle_sidecar_player_wz", #"veh_motorcycle_sidecar_player_wz", #"veh_motorcycle_sidecar_player_wz_dark_grey", #"veh_motorcycle_sidecar_player_wz_light_grey", #"veh_motorcycle_sidecar_player_wz_metal_grey", #"hash_275b12ca9b3cc010", #"veh_motorcycle_sidecar_player_wz_tan", #"veh_motorcycle_sidecar_player_wz_white", #"veh_motorcycle_sidecar_player_wz_heroes", #"vehicle_t8_mil_helicopter_light_gunner_wz_heroes", #"veh_fav_player_wz_heroes");
        foreach (str_type in a_str_types) {
            if (self.vehicletype == str_type) {
                return 1;
            }
        }
        return 0;
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x814df9ef, Offset: 0x3010
// Size: 0x3e2
function function_b2775b52() {
    /#
        switch (self.vehicletype) {
        case #"veh_quad_player_wz_blk":
        case #"hash_232abda4e81275f4":
        case #"veh_quad_player_wz_grn":
        case #"veh_quad_player_wz_tan":
        case #"hash_2f8d60a5381870ee":
            return (0, 0, 1);
        case #"vehicle_boct_mil_truck_cargo_wz_tan":
        case #"vehicle_boct_mil_truck_cargo_wz_dark":
        case #"vehicle_boct_mil_truck_cargo_wz_green":
            return (1, 0, 1);
        case #"vehicle_t8_mil_helicopter_light_transport_wz_grey":
        case #"vehicle_t8_mil_helicopter_light_transport_wz_black":
        case #"hash_482e864157620248":
        case #"vehicle_t8_mil_helicopter_light_gunner_wz_green":
        case #"vehicle_t8_mil_helicopter_light_gunner_wz_dark":
        case #"vehicle_t8_mil_helicopter_light_transport_wz_tan":
        case #"vehicle_t8_mil_helicopter_light_gunner_wz_tan":
        case #"vehicle_t8_mil_helicopter_light_gunner_wz_grey":
        case #"hash_1d37af413f257377":
        case #"hash_1d37bc413f25898e":
        case #"vehicle_t8_mil_helicopter_light_gunner_wz_black":
        case #"vehicle_t8_mil_helicopter_light_transport_wz_dark":
            return (1, 0, 0);
        case #"vehicle_boct_mil_boat_tactical_raft_wz_blk":
        case #"vehicle_boct_mil_boat_tactical_raft_wz_gry":
        case #"vehicle_boct_mil_boat_tactical_raft_wz_odg":
            return (1, 0.5, 0);
        case #"veh_fav_player_wz_blk":
        case #"veh_fav_player_wz_tan":
        case #"veh_fav_player_wz_grn":
        case #"hash_79bf6a7491c80c7":
        case #"hash_22d9b5a7a0d9dd73":
        case #"hash_32e4c0a7619f03a9":
            return vectorscale((1, 1, 0), 0.501961);
        case #"vehicle_boct_mil_boat_pbr_wz_tan":
        case #"vehicle_boct_mil_boat_pbr_wz_grey":
        case #"vehicle_boct_mil_boat_pbr_wz_green":
        case #"vehicle_boct_mil_boat_pbr_wz_police":
        case #"vehicle_boct_mil_boat_pbr_wz_black":
            return (0, 1, 0);
        case #"veh_suv_player_wz_blk":
        case #"veh_suv_player_wz_met_gry":
        case #"veh_suv_player_wz_wht":
        case #"veh_suv_player_wz_gry":
        case #"veh_suv_player_private_security_wz":
        case #"veh_suv_player_police_wz":
            return (0, 1, 1);
        case #"veh_muscle_car_convertible_player_wz_wht":
        case #"veh_muscle_car_convertible_player_wz_replacer":
        case #"veh_muscle_car_convertible_player_wz_grn":
        case #"veh_muscle_car_convertible_player_wz_red":
        case #"veh_muscle_car_convertible_player_wz_org":
        case #"veh_muscle_car_convertible_player_wz_blk":
        case #"veh_muscle_car_convertible_player_wz_bandit_blk":
        case #"veh_muscle_car_convertible_player_wz_racing_grn":
        case #"veh_muscle_car_convertible_player_wz_blu":
        case #"veh_muscle_car_convertible_player_wz_ylw":
        case #"veh_muscle_car_convertible_player_wz_phantom":
            return (0, 1, 1);
        case #"veh_quad_player_wz_police":
            return (0.545098, 0.270588, 0.0745098);
        default:
            return (1, 0, 1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x1a299d7e, Offset: 0x3400
// Size: 0x218
function function_6a3e277() {
    /#
        if (!getdvarint(#"hash_9af4a204686e76d", 0) || !self function_1221d304()) {
            return;
        }
        self endon(#"death", #"hash_57887008fa0fd8ad");
        self util::delay("<unknown string>", undefined, &function_fe9593b2);
        level flag::wait_till("<unknown string>");
        while (getdvarint(#"hash_9af4a204686e76d", 0)) {
            waitframe(1);
            if (distance2d(level.players[0].origin, self.origin) > 1024) {
                continue;
            }
            n_depth = getwaterheight(self.origin) - self.origin[2];
            var_62ce46e5 = self.origin + (0, 0, n_depth);
            print3d(self.origin, "<unknown string>" + n_depth, (0, 1, 0), 1, 0.6);
            circle(var_62ce46e5, 16, (0, 1, 0), 0, 1);
            debugstar(self.origin, 1, (0, 1, 0));
            line(self.origin, var_62ce46e5, (0, 1, 0));
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x2037e97b, Offset: 0x3620
// Size: 0x180
function function_fe9593b2() {
    /#
        self endon(#"death");
        level flag::wait_till("<unknown string>");
        while (getdvarint(#"hash_9af4a204686e76d", 0)) {
            waitframe(1);
            if (distance2d(level.players[0].origin, self.origin) > 1024) {
                continue;
            }
            n_depth = self depthinwater();
            var_62ce46e5 = self.origin + (0, 0, n_depth);
            print3d(self.origin, "<unknown string>" + n_depth, (1, 0, 0), 1, 0.6);
            circle(var_62ce46e5, 16, (1, 0, 0), 0, 1);
            debugstar(self.origin, 1, (1, 0, 0));
            line(self.origin, var_62ce46e5, (1, 0, 0));
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xdea08cfc, Offset: 0x37a8
// Size: 0xfe
function function_2d706436() {
    /#
        if (!getdvarint(#"hash_9af4a204686e76d", 0)) {
            return;
        }
        self endon(#"death", #"disconnect");
        while (getdvarint(#"hash_9af4a204686e76d", 0)) {
            n_height = getwaterheight(self.origin) - self.origin[2];
            if (n_height > 0) {
                debug2dtext((810, 768, 0), "<unknown string>" + n_height, (0, 0, 1));
            }
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x7f710bed, Offset: 0x38b0
// Size: 0x336
function function_f2c2f4f9() {
    /#
        if (!getdvarint(#"hash_363b1c69ef9f1237", 0)) {
            return;
        }
        self endon(#"death", #"disconnect");
        var_af2b54d8 = util::spawn_model("<unknown string>");
        self thread util::delete_on_death_or_notify(var_af2b54d8, "<unknown string>");
        while (getdvarint(#"hash_363b1c69ef9f1237", 0)) {
            v_eye = self geteye();
            a_trace = bullettrace(v_eye, v_eye + vectorscale(anglestoforward(self getplayerangles()), 1000000), 0, self);
            var_af2b54d8.origin = a_trace[#"position"];
            n_depth = getwaterheight(var_af2b54d8.origin) - var_af2b54d8.origin[2];
            var_62ce46e5 = var_af2b54d8.origin + (0, 0, n_depth);
            v_color = (1, 0, 0);
            if (n_depth > 0) {
                v_color = (0, 0, 1);
            }
            var_91d1913b = distance2d(self getorigin(), var_af2b54d8.origin);
            n_radius = 0.015 * var_91d1913b;
            if (n_radius > 768) {
                n_radius = 768;
            }
            print3d(var_af2b54d8.origin, "<unknown string>" + n_depth, v_color, 1, 0.6);
            circle(var_62ce46e5, 96, (0, 1, 0), 0, 1);
            sphere(var_af2b54d8.origin, n_radius, v_color);
            line(var_af2b54d8.origin, var_62ce46e5, v_color);
            debug2dtext((810, 635, 0), "<unknown string>" + n_depth, v_color);
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x4eceaeea, Offset: 0x3bf0
// Size: 0x298
function function_e2fc5dd9() {
    /#
        if (!getdvarint(#"hash_184bc9c4871144d3", 0) || !self function_1221d304()) {
            return;
        }
        level flag::wait_till("<unknown string>");
        while (isdefined(self) && getdvarint(#"hash_184bc9c4871144d3", 0)) {
            waitframe(1);
            if (distance2d(self getorigin(), level.players[0] getorigin()) > 768) {
                continue;
            }
            var_9d1781af = self.origin + vectorscale(anglestoforward(self.angles), self.radiusdamageradius);
            var_257374bd = self.origin + vectorscale(anglestoforward(self.angles), self.radiusdamageradius / 2);
            print3d(self.origin, "<unknown string>" + self.radiusdamagemax, (1, 0, 0));
            print3d(var_9d1781af, "<unknown string>" + self.radiusdamagemin, (1, 1, 0));
            print3d(var_257374bd, "<unknown string>" + self.radiusdamageradius, (1, 0.5, 0));
            sphere(self.origin, 8, (1, 0, 0));
            circle(self.origin, self.radiusdamageradius, (1, 0, 0), 0, 1);
            line(self.origin, var_9d1781af, (1, 0.5, 0));
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x55623d1f, Offset: 0x3e90
// Size: 0x220
function function_38146f54() {
    /#
        if (!getdvarint(#"hash_184bc9c4871144d3", 0)) {
            return;
        }
        self endon(#"death", #"disconnect");
        while (getdvarint(#"hash_184bc9c4871144d3", 0)) {
            waitframe(2);
            if (!getdvarint(#"hash_639a741f419f5790", 0)) {
                continue;
            }
            setdvar(#"hash_639a741f419f5790", 0);
            foreach (var_f0ffe8b2 in level.var_6eef6733) {
                foreach (var_80730518 in var_f0ffe8b2) {
                    if (distance2d(self getorigin(), var_80730518.origin) <= var_80730518.radiusdamageradius) {
                        self val::set(#"warzonestaging", "<unknown string>", 1);
                        var_80730518 dodamage(100000, var_80730518.origin);
                    }
                }
            }
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xcb52d13b, Offset: 0x40b8
// Size: 0x20a
function function_10c650e6() {
    /#
        if (!getdvarint(#"hash_45acaa3a266bbdec", 0)) {
            return;
        }
        item_world::function_1b11e73c();
        item_world::function_4de3ca98();
        var_6e64f8a3 = function_91b29d2a(#"cu35_item");
        while (getdvarint(#"hash_45acaa3a266bbdec", 0)) {
            foreach (point in var_6e64f8a3) {
                var_91d1913b = distance2d(level.players[0].origin, point.origin);
                n_radius = 0.015 * var_91d1913b;
                if (n_radius > 768) {
                    n_radius = 768;
                }
                if (var_91d1913b > 768) {
                    sphere(point.origin, n_radius, (0, 1, 0));
                    if (var_91d1913b < 2048) {
                        print3d(point.origin + (0, 0, 32), "<unknown string>", (0, 1, 0));
                    }
                }
            }
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xf1d120cc, Offset: 0x42d0
// Size: 0x1316
function function_9cc59537() {
    /#
        if (!getdvarint(#"hash_68dcd0d52e11b957", 0)) {
            return;
        }
        var_55a05f87 = 0;
        var_cbc7aaf6 = 0;
        var_ebd66b56 = [];
        var_1d9375fc = struct::get_array("<unknown string>", "<unknown string>");
        foreach (group in var_1d9375fc) {
            group.debug_spawnpoints = [];
            var_f0179f4a = getdvarstring(#"hash_230734aeaaf8671", "<unknown string>");
            if (isstring(group.target) && (var_f0179f4a == "<unknown string>" || function_d72aa67e(var_f0179f4a, group.target))) {
                group.debug_spawnpoints = function_91b29d2a(group.target);
            }
        }
        var_7cb887a8 = [];
        level flag::wait_till("<unknown string>");
        level.players[0] endon(#"disconnect");
        adddebugcommand("<unknown string>");
        do {
            waitframe(8);
            foreach (group in var_1d9375fc) {
                itemlistbundle = getscriptbundle(group.scriptbundlename);
                if (!isdefined(itemlistbundle) || isdefined(itemlistbundle.vehiclespawner) && itemlistbundle.vehiclespawner || group.debug_spawnpoints.size == 0 || itemlistbundle.name === "<unknown string>" || itemlistbundle.name === "<unknown string>" || itemlistbundle.name === "<unknown string>") {
                    continue;
                } else if (itemlistbundle.name === "<unknown string>") {
                    var_df1e5fef = arraysortclosest(group.debug_spawnpoints, level.players[0].origin, 85, 1, 4000);
                    foreach (point in var_df1e5fef) {
                        sphere(point.origin, 16, (1, 1, 1), 1, 0, 16, 8);
                    }
                    continue;
                }
                spawn_points = arraysortclosest(group.debug_spawnpoints, level.players[0].origin, 85, 1, 4000);
                foreach (point in spawn_points) {
                    if (level.players[0] util::is_player_looking_at(point.origin, 0.8, 0)) {
                        b_failed = 0;
                        var_47748885 = 28;
                        var_c5330f11 = 32;
                        v_color = (1, 0, 1);
                        if (isdefined(itemlistbundle.itemlist[0])) {
                            if (itemlistbundle.itemlist[0].itementry === "<unknown string>" || itemlistbundle.itemlist[0].itementry === "<unknown string>" || itemlistbundle.itemlist[0].itementry === "<unknown string>" || itemlistbundle.itemlist[0].itementry === "<unknown string>" || itemlistbundle.itemlist[0].itementry === "<unknown string>" || itemlistbundle.itemlist[0].itementry === "<unknown string>") {
                                v_color = (1, 1, 0);
                                var_47748885 = 4;
                                var_c5330f11 = 4;
                            }
                        }
                        items = item_world::function_2e3efdda(point.origin, undefined, 1, var_47748885, -1, 1);
                        if (items.size > 0) {
                            v_color = (0, 1, 0);
                        }
                        n_radius = 4;
                        var_7cb887a8 = [];
                        var_3e832e74 = 360 / 8;
                        v_angles = point.angles;
                        var_c24ea284 = undefined;
                        var_4b82457c = distance2d(point.origin, level.players[0].origin);
                        var_24b0b1ea = itemlistbundle.var_7fb0967b;
                        if (isdefined(var_24b0b1ea)) {
                            if (items.size > 0) {
                                var_abc7e003 = item_world::function_2e3efdda(point.origin, undefined, 20, var_24b0b1ea, -1, 1);
                                var_abc7e003 = arraysortclosest(var_abc7e003, point.origin, 10, var_47748885);
                                foreach (item_type in itemlistbundle.itemlist) {
                                    foreach (var_d76a7255 in var_abc7e003) {
                                        if (item_type.itementry === var_d76a7255.itementry.name && var_d76a7255.itementry.name === items[0].itementry.name) {
                                            print3d(point.origin + vectorscale((0, 0, 1), 18), item_type.itementry + "<unknown string>" + var_24b0b1ea, (1, 0.5, 0), 1, 0.3, 8);
                                            line(var_d76a7255.origin, point.origin, (1, 0.5, 0), 1, 0, 8);
                                        }
                                    }
                                }
                            }
                        }
                        if (isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash) {
                            n_depth = 18;
                            n_width = 24;
                            if (itemlistbundle.name === "<unknown string>" || itemlistbundle.name === "<unknown string>" || itemlistbundle.name === "<unknown string>") {
                                n_depth = 12;
                                n_width = 48;
                            }
                            var_7cb887a8[0] = point.origin + (0, 0, 16) + vectorscale(anglestoforward(v_angles), n_depth);
                            var_7cb887a8[1] = point.origin + (0, 0, 16) + vectorscale(anglestoforward(v_angles) * -1, n_depth);
                            var_7cb887a8[2] = point.origin + (0, 0, 16) + vectorscale(anglestoright(v_angles), n_width);
                            var_7cb887a8[3] = point.origin + (0, 0, 16) + vectorscale(anglestoright(v_angles) * -1, n_width);
                        } else {
                            for (i = 0; i < 8; i++) {
                                var_7cb887a8[i] = point.origin + (0, 0, 16) + vectorscale(anglestoforward(v_angles), var_47748885);
                                v_angles = v_angles + (0, var_3e832e74, 0);
                            }
                        }
                        var_2e0e7774 = arraysortclosest(spawn_points, point.origin, 20, 1, var_c5330f11);
                        foreach (close in var_2e0e7774) {
                            if (bullettracepassed(point.origin + (0, 0, 16), close.origin, 0, level.players[0])) {
                                v_color = (0, 0, 1);
                                b_failed = 1;
                                line(close.origin, point.origin, v_color, 1, 0, 8);
                                circle(point.origin, var_c5330f11 / 2, v_color, 0, 1, 8);
                                print3d(point.origin + vectorscale((0, 0, 1), 24), sqrt(distancesquared(point.origin, close.origin)), v_color, 1, 0.3, 8);
                            }
                        }
                        if (isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash) {
                            var_47748885 = n_depth;
                            foreach (i, v_test in var_7cb887a8) {
                                if (i > 2) {
                                    var_47748885 = n_width;
                                }
                                a_trace = bullettrace(point.origin + vectorscale((0, 0, 1), 24), v_test, 0, level.players[0]);
                                if (distancesquared(a_trace[#"position"], point.origin + vectorscale((0, 0, 1), 24)) < var_47748885 * var_47748885 - 2 && !isdefined(a_trace[#"dynent"])) {
                                    v_color = (1, 0, 0);
                                    b_failed = 1;
                                    if (var_4b82457c < 256) {
                                        debugstar(a_trace[#"position"], 8, v_color);
                                    }
                                }
                            }
                            var_47748885 = 18;
                        } else {
                            foreach (v_test in var_7cb887a8) {
                                a_trace = bullettrace(point.origin + (0, 0, 16), v_test, 0, level.players[0]);
                                if (distancesquared(a_trace[#"position"], point.origin + (0, 0, 16)) < var_47748885 * var_47748885 - 3 && !isdefined(a_trace[#"dynent"])) {
                                    v_color = (1, 0, 0);
                                    b_failed = 1;
                                    if (var_4b82457c < 256) {
                                        debugstar(a_trace[#"position"], 8, v_color);
                                    }
                                }
                            }
                        }
                        if (b_failed) {
                            n_radius = 0.015 * var_4b82457c;
                            if (n_radius > 32) {
                                n_radius = 32;
                            }
                        }
                        if (isdefined(itemlistbundle.supplystash) && itemlistbundle.supplystash) {
                            function_47351fa3(point.origin, point.angles, v_color, 8);
                        }
                        if (var_4b82457c > 212) {
                            sphere(point.origin, n_radius, v_color, 1, 0, 8, 8);
                        }
                        if (bullettracepassed(point.origin, level.players[0] geteye(), 0, level.players[0], var_c24ea284)) {
                            circle(point.origin, var_47748885, v_color, 0, 1, 8);
                            if (var_4b82457c < 512) {
                                print3d(point.origin, function_9e72a96(point.targetname), v_color, 1, 0.4, 8);
                                if (var_4b82457c < 256 && level.players[0] util::is_player_looking_at(point.origin, 0.87, 0)) {
                                    print3d(point.origin + vectorscale((0, 0, 1), 12), point.origin, v_color, 1, 0.3, 8);
                                }
                            }
                        }
                    }
                }
            }
        } while (getdvarint(#"hash_68dcd0d52e11b957", 0));
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 2, eflags: 0x0
// Checksum 0x37ac10db, Offset: 0x55f0
// Size: 0xb4
function function_d72aa67e(str_list, str_name) {
    /#
        a_str_tok = strtok(str_list, "<unknown string>");
        foreach (tok in a_str_tok) {
            if (tok == str_name) {
                return 1;
            }
        }
        return 0;
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 4, eflags: 0x0
// Checksum 0x85d21907, Offset: 0x56b0
// Size: 0x324
function function_47351fa3(org, ang, opcolor, frames) {
    /#
        if (!isdefined(frames)) {
            frames = 1;
        }
        forward = anglestoforward(ang);
        forwardfar = vectorscale(forward, 50);
        forwardclose = vectorscale(forward, 50 * 0.8);
        right = anglestoright(ang);
        left = anglestoright(ang) * -1;
        leftdraw = vectorscale(right, 50 * -0.2);
        rightdraw = vectorscale(right, 50 * 0.2);
        up = anglestoup(ang);
        right = vectorscale(right, 50);
        left = vectorscale(left, 50);
        up = vectorscale(up, 50);
        red = (0.9, 0.2, 0.2);
        green = (0.2, 0.9, 0.2);
        blue = (0.2, 0.2, 0.9);
        if (isdefined(opcolor)) {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        line(org, org + forwardfar, red, 0.9, 0, frames);
        line(org + forwardfar, org + forwardclose + rightdraw, red, 0.9, 0, frames);
        line(org + forwardfar, org + forwardclose + leftdraw, red, 0.9, 0, frames);
        line(org, org + right, blue, 0.9, 0, frames);
        line(org, org + left, blue, 0.9, 0, frames);
        line(org, org + up, green, 0.9, 0, frames);
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 1, eflags: 0x0
// Checksum 0x9cd1671b, Offset: 0x59e0
// Size: 0x1f6
function function_5ef515a6(var_1d9375fc) {
    /#
        n_total = 0;
        foreach (group in var_1d9375fc) {
            n_total = n_total + group.debug_spawnpoints.size;
        }
        while (getdvarint(#"hash_4701ef1aeafb2f3", 0)) {
            var_bd9acc19 = 50;
            foreach (group in var_1d9375fc) {
                if (isstring(group.target)) {
                    var_bd9acc19 = var_bd9acc19 + 24;
                    debug2dtext((1300, var_bd9acc19, 0), group.target + "<unknown string>" + group.debug_spawnpoints.size, (1, 1, 1), 1, (0, 0, 0), 0.75);
                }
            }
            debug2dtext((1300, 50, 0), "<unknown string>" + n_total, (1, 1, 1));
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 7, eflags: 0x0
// Checksum 0xca22e431, Offset: 0x5be0
// Size: 0x5d6
function function_317da0a9(var_1d9375fc, group, point, var_9b62e326, var_cc2e4f94, n_z, n_dist) {
    /#
        b_failed = 0;
        b_close = 0;
        v_color = (0, 1, 0);
        var_7cb887a8 = [];
        var_3e832e74 = 360 / var_9b62e326;
        v_angles = point.angles;
        var_c24ea284 = undefined;
        if (isdefined(group.itemlistbundle) && isdefined(group.itemlistbundle.vehiclespawner) && group.itemlistbundle.vehiclespawner) {
            return 1;
        }
        if (isdefined(group.itemlistbundle) && isdefined(group.itemlistbundle.supplystash) && group.itemlistbundle.supplystash) {
            if (isdefined(point.radius)) {
                var_cc2e4f94 = point.radius;
            }
        }
        for (i = 0; i < var_9b62e326; i++) {
            var_7cb887a8[i] = point.origin + (0, 0, n_z) + vectorscale(anglestoforward(v_angles), var_cc2e4f94);
            v_angles = point.angles + (0, var_3e832e74, 0);
        }
        var_7cb887a8[i + 1] = point.origin + (0, 0, n_z) + vectorscale(anglestoup(point.angles), var_cc2e4f94);
        foreach (group in var_1d9375fc) {
            if (isarray(group.debug_spawnpoints)) {
                var_2e0e7774 = arraysortclosest(group.debug_spawnpoints, point.origin, 20, 1, n_dist);
                foreach (close in var_2e0e7774) {
                    if (bullettracepassed(point.origin + (0, 0, n_z), close.origin, 0, level.players[0])) {
                        print("<unknown string>" + function_9e72a96(point.targetname) + "<unknown string>" + point.origin + "<unknown string>" + close.origin + "<unknown string>");
                        b_close = 1;
                    }
                }
            }
        }
        foreach (v_test in var_7cb887a8) {
            a_trace = bullettrace(point.origin + (0, 0, n_z), v_test, 0, level.players[0]);
            if (isvehicle(a_trace[#"entity"])) {
                var_c24ea284 = a_trace[#"entity"];
                a_trace = bullettrace(point.origin + (0, 0, n_z), v_test, 0, var_c24ea284);
            }
            if (distancesquared(a_trace[#"position"], point.origin + (0, 0, n_z)) < var_cc2e4f94 * var_cc2e4f94 - 2) {
                b_failed = 1;
            }
        }
        if (b_failed) {
            print("<unknown string>" + function_9e72a96(point.targetname) + "<unknown string>" + point.origin + "<unknown string>" + "<unknown string>");
            return 0;
        } else if (b_close) {
            return 0;
        }
        return 1;
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xd0e848b8, Offset: 0x61c0
// Size: 0x6c0
function function_e8f0335f() {
    /#
        if (!getdvarint(#"hash_15ce8723d2ead5ef", 0)) {
            return;
        }
        self endon(#"death", #"disconnect");
        var_b3a9e916 = getdvarint(#"hash_796c892495c48172", 1);
        while (getdvarint(#"hash_15ce8723d2ead5ef", 1)) {
            waitframe(1);
            if (self weaponswitchbuttonpressed()) {
                var_b3a9e916 = var_b3a9e916 + 1;
                if (var_b3a9e916 > 2) {
                    var_b3a9e916 = 0;
                }
                setdvar(#"hash_796c892495c48172", var_b3a9e916);
                while (self weaponswitchbuttonpressed()) {
                    waitframe(1);
                }
            }
            if (var_b3a9e916 == 0) {
                continue;
            }
            v_eye = self geteye();
            v_end = v_eye + vectorscale(anglestoforward(self getplayerangles()), 1024);
            physicstrace = physicstraceex(v_eye, v_end, vectorscale((-1, -1, -1), 0.5), vectorscale((1, 1, 1), 0.5), self, 32);
            var_11cc451b = bullettrace(v_eye, v_end, 0, self, 0, 0);
            var_708a2754 = physicstrace;
            var_7cb887a8 = [];
            var_3e832e74 = 360 / 8;
            if (var_11cc451b[#"position"][2] > physicstrace[#"position"][2]) {
                var_708a2754 = var_11cc451b;
            }
            origin = var_708a2754[#"position"];
            if (var_708a2754[#"fraction"] < 1 && vectordot(var_708a2754[#"normal"], (0, 0, 1)) >= 0.707) {
                if (var_708a2754[#"position"][2] > -10000) {
                    origin = var_708a2754[#"position"];
                }
            }
            b_failed = 0;
            v_color = (0, 1, 0);
            v_angles = (0, 0, 0);
            if (var_b3a9e916 != 0) {
                for (i = 0; i < 8; i++) {
                    var_7cb887a8[i] = origin + (0, 0, 12) + vectorscale(anglestoforward(v_angles), 32);
                    v_angles = v_angles + (0, var_3e832e74, 0);
                }
                foreach (v_test in var_7cb887a8) {
                    a_trace = bullettrace(origin + (0, 0, 12), v_test, 0, level.players[0]);
                    if (isdefined(a_trace[#"entity"])) {
                        a_trace = bullettrace(origin + (0, 0, 12), v_test, 0, a_trace[#"entity"]);
                    }
                    if (distancesquared(a_trace[#"position"], origin + (0, 0, 12)) < 32 * 32 - 2) {
                        v_color = (1, 0, 0);
                        b_failed = 1;
                        if (distance2d(origin, level.players[0] getorigin()) < 512) {
                            debugstar(a_trace[#"position"], 1, v_color);
                        }
                    }
                }
            }
            sphere(origin, 2, v_color);
            circle(origin, 32, v_color, 0, 1, 1);
            if (var_b3a9e916 == 2) {
                print3d(origin + vectorscale((0, 0, 1), 8), "<unknown string>" + origin, v_color, 0.25, 1);
            }
            if (b_failed) {
                print3d(origin + vectorscale((0, 0, 1), 8), "<unknown string>", v_color, 0.85, 1);
            }
        }
    #/
}

// Namespace wz_open_skyscrapers/event_9673dc9a
// Params 1, eflags: 0x44
// Checksum 0xad01112f, Offset: 0x6888
// Size: 0x2b0
function private event_handler[event_9673dc9a] function_f9b68fd7(eventstruct) {
    /#
        if (!getdvarint(#"hash_69592e1b2d05fb21", 0)) {
            return;
        }
        dynent = eventstruct.ent;
        dynent notify(#"debug_draw");
        dynent endon(#"debug_draw");
        while (getdvarint(#"hash_69592e1b2d05fb21", 0)) {
            waitframe(10);
            if (!isdefined(level.players[0])) {
                continue;
            }
            var_91d1913b = distance2d(dynent.origin, level.players[0].origin);
            if (level.players[0] util::is_player_looking_at(dynent.origin, 0.8, 0) && var_91d1913b <= 6000) {
                if (isdefined(dynent.var_15d44120) && dynent.var_15d44120 !== #"hash_1dcbe8021fb16344") {
                    function_a476d876(dynent.origin, dynent.angles, (1, 0.5, 0), 10);
                    if (var_91d1913b <= 768) {
                        print3d(dynent.origin + vectorscale((0, 0, 1), 18), function_9e72a96(dynent.var_15d44120), (1, 0.5, 0), 0.9, 0.5, 10);
                    }
                }
                if (isdefined(dynent.targetname) && var_91d1913b <= 768) {
                    print3d(dynent.origin + vectorscale((0, 0, 1), 8), function_9e72a96(dynent.targetname), (1, 0.5, 0), 0.9, 0.5, 10);
                }
            }
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 4, eflags: 0x0
// Checksum 0xe3d77f5a, Offset: 0x6b40
// Size: 0x22c
function function_a476d876(org, ang, opcolor, frames) {
    /#
        if (!isdefined(frames)) {
            frames = 1;
        }
        right = anglestoright(ang);
        left = anglestoright(ang) * -1;
        forwardfar = vectorscale(left, 52);
        forwardclose = vectorscale(left, 52 * 0.8);
        leftdraw = vectorscale(right, 52 * -0.2);
        rightdraw = vectorscale(right, 52 * 0.2);
        up = anglestoup(ang);
        right = vectorscale(right, 52);
        left = vectorscale(left, 52);
        up = vectorscale(up, 96);
        red = (0.9, 0.2, 0.2);
        green = (0.2, 0.9, 0.2);
        blue = (0.2, 0.2, 0.9);
        if (isdefined(opcolor)) {
            red = opcolor;
            green = opcolor;
            blue = opcolor;
        }
        line(org, org + left, blue, 0.9, 0, frames);
        line(org, org + up, green, 0.9, 0, frames);
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xa9fc5876, Offset: 0x6d78
// Size: 0x56e
function function_13a77bfa() {
    /#
        if (!getdvarint(#"hash_43f2306cde703585", 0)) {
            return;
        }
        level flag::wait_till("<unknown string>");
        var_c57af5d9 = level.var_7767cea8;
        do {
            waitframe(12);
            total_spawns = 0;
            var_ad802a37 = (120, 480, 0);
            debug2dtext(var_ad802a37, "<unknown string>" + var_c57af5d9.size, (1, 0.752941, 0.796078), 1, (0, 0, 0), 0.5, 1.3, 12);
            foreach (influencer in var_c57af5d9) {
                spawns = arraysortclosest(influencer.spawns, influencer.origin);
                furthest = spawns[spawns.size - 1];
                radius = distance2d(influencer.origin, furthest.origin);
                circle(influencer.origin, radius, (1, 0.752941, 0.796078), 0, 1, 12);
                print3d(influencer.origin + (0, 0, 0), function_9e72a96(influencer.target), (1, 0.752941, 0.796078), 0.9, 4, 12);
                print3d(influencer.origin + vectorscale((0, 0, 1), 96), spawns.size, (1, 0.752941, 0.796078), 0.9, 4, 12);
                foreach (spawn in spawns) {
                    line(influencer.origin, spawn.origin, (1, 0.752941, 0.796078), 1, 0, 12);
                    sphere(spawn.origin, 10, (1, 0.752941, 0.796078), 1, 0, 4, 12);
                    print3d(spawn.origin + vectorscale((0, 0, 1), 12), function_9e72a96(spawn.targetname), (1, 0.752941, 0.796078), 0.9, 0.5, 12);
                }
                total_spawns = total_spawns + spawns.size;
                var_ad802a37 = var_ad802a37 + (0, 28, 0);
                debug2dtext(var_ad802a37, influencer.target + "<unknown string>" + spawns.size, (1, 0.752941, 0.796078), 1, (0, 0, 0), 0.5, 1, 12);
            }
            var_ad802a37 = var_ad802a37 + (0, 28, 0);
            debug2dtext(var_ad802a37, "<unknown string>" + total_spawns, (1, 0.752941, 0.796078), 1, (0, 0, 0), 0.5, 1.3, 12);
        } while (getdvarint(#"hash_43f2306cde703585", 0));
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xd05c37c4, Offset: 0x72f0
// Size: 0x352
function function_97714f49() {
    /#
        var_d88c2ae1 = 1;
        tracepoint = undefined;
        while (true) {
            waitframe(1);
            if (getdvarint(#"hash_5fd194403e0d175e", 0) || getdvarint(#"hash_27e2616ae4b57202", 1) != var_d88c2ae1) {
                player = level.players[0];
                weapon = player getcurrentweapon();
                if (weapon.firetype == "<unknown string>") {
                    continue;
                }
                level notify(#"hash_7e565f1e80f93ecd");
                if (getdvarint(#"hash_5fd194403e0d175e", 0) || !isdefined(tracepoint)) {
                    players = getplayers();
                    if (players.size <= 0) {
                        continue;
                    }
                    player = players[0];
                    direction = player getplayerangles();
                    direction_vec = anglestoforward(direction);
                    eye = player geteye();
                    eye = (eye[0], eye[1], eye[2] + 20);
                    trace = bullettrace(eye, eye + vectorscale(direction_vec, 100000), 1, player);
                    tracepoint = trace[#"position"];
                }
                setdvar(#"hash_5fd194403e0d175e", 0);
                switch (getdvarint(#"hash_27e2616ae4b57202", 1)) {
                case 1:
                    thread function_c21a7f52(tracepoint, weapon, (0, 1, 0));
                    break;
                case 2:
                    thread function_c21a7f52(tracepoint, weapon, (0, 1, 0), 0);
                    break;
                case 3:
                    thread function_2e72f24d(tracepoint, weapon);
                    break;
                }
                var_d88c2ae1 = getdvarint(#"hash_27e2616ae4b57202", 1);
            }
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 2, eflags: 0x0
// Checksum 0xbc71361b, Offset: 0x7650
// Size: 0x2a2
function function_2e72f24d(tracepoint, weapon) {
    /#
        var_b9090b50 = 1.31908;
        var_44345100 = 0.7;
        distance = 0;
        var_57b06497 = 3000;
        var_71c007dd = weapon.var_deb0b2fe;
        base_damage = weapon.damagevalues[0];
        var_a41a6d87 = weapon.var_bbc8dbc;
        var_97ed9e7a = weapon.var_f06a2fee;
        var_b62fd725 = weapon.var_a1252254;
        var_c587700f = var_a41a6d87 / 2 * var_a41a6d87 / 2 * 3.14159 * 1e-06;
        vel = var_71c007dd * var_44345100;
        thread function_61e22785(tracepoint, distance * 39.3701, int(base_damage), (0, 1, 0));
        i = 0;
        while (true) {
            new_vel = vel - vel * vel * 0.5 * var_b9090b50 * var_c587700f * var_97ed9e7a / var_b62fd725 * 6.47989e-05 * 16 / 1000;
            distance = distance + (vel + new_vel) / 2 * 16 / 1000;
            vel = new_vel;
            var_bf960c5 = vel / var_71c007dd * var_44345100;
            damage = base_damage * var_bf960c5;
            i++;
            if (int(damage) < var_57b06497) {
                thread function_61e22785(tracepoint, distance * 39.3701, int(damage), (0, 1, 0));
                var_57b06497 = int(damage);
                if (i > 25) {
                    break;
                }
            }
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 4, eflags: 0x0
// Checksum 0x11eda887, Offset: 0x7900
// Size: 0x17e
function function_c21a7f52(tracepoint, weapon, color, mp) {
    /#
        if (!isdefined(mp)) {
            mp = 1;
        }
        var_1e9ad3cb = weapon.damagevalues;
        var_eb5812b5 = weapon.var_6aac6921;
        for (i = 0; i < var_1e9ad3cb.size; i++) {
            if (var_1e9ad3cb[i] == 0) {
                arrayremoveindex(var_1e9ad3cb, i);
                arrayremoveindex(var_eb5812b5, i);
                i--;
            }
        }
        thread function_61e22785(tracepoint, 0, var_1e9ad3cb[0], color);
        for (i = 1; i < var_1e9ad3cb.size; i++) {
            if (mp == 0) {
                var_eb5812b5[i - 1] = var_eb5812b5[i - 1] * 1.5;
            }
            thread function_61e22785(tracepoint, var_eb5812b5[i - 1], var_1e9ad3cb[i], color);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 4, eflags: 0x0
// Checksum 0x8ea10377, Offset: 0x7a88
// Size: 0x34e
function function_61e22785(tracepoint, radius, var_5a1fa430, color) {
    /#
        self endon(#"hash_7e565f1e80f93ecd");
        while (!getdvarint(#"hash_5fd194403e0d175e", 0)) {
            if (radius > 1000) {
                scale = radius / 500;
            } else {
                scale = 2;
            }
            circle(tracepoint, radius, color, 0, 1);
            var_eb9780e9 = tracepoint + (radius, 0, 0);
            print3d(var_eb9780e9, var_5a1fa430, (1, 1, 1), 1, scale, 3);
            var_eb9780e9 = tracepoint + (radius, 0, -10 * scale);
            print3d(var_eb9780e9, int(radius), (1, 0, 0), 1, scale * 0.25, 3);
            var_eb9780e9 = tracepoint - (radius, 0, 0);
            print3d(var_eb9780e9, var_5a1fa430, (1, 1, 1), 1, scale, 3);
            var_eb9780e9 = tracepoint - (radius, 0, 10 * scale);
            print3d(var_eb9780e9, int(radius), (1, 0, 0), 1, scale * 0.25, 3);
            var_eb9780e9 = tracepoint + (0, radius, 0);
            print3d(var_eb9780e9, var_5a1fa430, (1, 1, 1), 1, scale, 3);
            var_eb9780e9 = tracepoint + (0, radius, -10 * scale);
            print3d(var_eb9780e9, int(radius), (1, 0, 0), 1, scale * 0.25, 3);
            var_eb9780e9 = tracepoint - (0, radius, 0);
            print3d(var_eb9780e9, var_5a1fa430, (1, 1, 1), 1, scale, 3);
            var_eb9780e9 = tracepoint - (0, radius, 10 * scale);
            print3d(var_eb9780e9, int(radius), (1, 0, 0), 1, scale * 0.25, 3);
            waitframe(1);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0x8daf9940, Offset: 0x7de0
// Size: 0x266
function function_a2b6e273() {
    /#
        /#
            if (!getdvarint(#"hash_270a21a654a1a79f", 0)) {
                return;
            }
            level waittill(#"all_players_spawned");
            if (!isdefined(level.totalspawnpoints)) {
                return;
            }
            player = util::gethostplayer();
            n_index = 0;
            var_d4714efb = 0;
            wait(3);
            while (true) {
                if (player util::up_button_pressed()) {
                    if (n_index < level.totalspawnpoints.size - 1) {
                        n_index++;
                    } else {
                        n_index = 0;
                    }
                } else if (player util::down_button_pressed()) {
                    if (n_index == 0) {
                        n_index = level.totalspawnpoints.size - 1;
                    } else {
                        n_index--;
                    }
                }
                if (n_index != var_d4714efb) {
                    player setorigin(level.totalspawnpoints[n_index].origin);
                    player setplayerangles((0, level.totalspawnpoints[n_index].angles[1], 0));
                    var_d4714efb = n_index;
                    wait(0.1);
                }
                if (player buttonpressed("<unknown string>")) {
                    spawn = level.totalspawnpoints[n_index];
                    info = spawn::function_f468d9a5(spawn);
                    player setorigin(info.origin);
                    player setplayerangles(info.angles);
                    player function_2ffa8aaf(1, info.freefall, 0);
                }
                waitframe(1);
            }
        #/
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x0
// Checksum 0xd5557b64, Offset: 0x8050
// Size: 0xb0
function devgui_weapon_think() {
    /#
        for (;;) {
            weapon_index = getdvarint(#"scr_give_wz_item", 0);
            switch (weapon_index) {
            case 1:
                devgui_handle_player_command(&function_1880c93d);
                break;
            }
            setdvar(#"scr_give_wz_item", 0);
            wait(0.5);
        }
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 3, eflags: 0x0
// Checksum 0x7b3c4a60, Offset: 0x8108
// Size: 0x134
function devgui_handle_player_command(playercallback, pcb_param_1, pcb_param_2) {
    /#
        pid = getdvarint(#"scr_give_wz_item", 0);
        if (pid > 0) {
            player = getplayers()[pid - 1];
            if (isdefined(player)) {
                if (isdefined(pcb_param_2)) {
                    player thread [[ playercallback ]](pcb_param_1, pcb_param_2);
                } else if (isdefined(pcb_param_1)) {
                    player thread [[ playercallback ]](pcb_param_1);
                } else {
                    player thread [[ playercallback ]]();
                }
            }
        } else {
            array::thread_all(getplayers(), playercallback, pcb_param_1, pcb_param_2);
        }
        setdvar(#"scr_give_wz_item", -1);
    #/
}

// Namespace wz_open_skyscrapers/wz_open_skyscrapers
// Params 0, eflags: 0x4
// Checksum 0xc72af4be, Offset: 0x8248
// Size: 0xb4
function private function_1880c93d() {
    /#
        /#
            assert(isdefined(self));
        #/
        /#
            assert(isplayer(self));
        #/
        item = wz_loadouts::_get_item(#"ultimate_turret_wz_item");
        var_fa3df96 = self item_inventory::function_e66dcff5(item);
        self item_world::function_de2018e3(item, self, var_fa3df96);
    #/
}

