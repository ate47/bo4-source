// Atian COD Tools GSC decompiler test
#using script_25b8e6a85a7f8635;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_trial_util.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\core_common\gameobjects_shared.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\animation_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\array_shared.gsc;
#using scripts\core_common\callbacks_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace zm_trial_white_nukerun;

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 0, eflags: 0x2
// Checksum 0x8d6e8e55, Offset: 0x220
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_trial_white_nukerun", &__init__, undefined, undefined);
}

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 0, eflags: 0x1 linked
// Checksum 0xd4832036, Offset: 0x268
// Size: 0x74
function __init__() {
    if (!zm_trial::is_trial_mode()) {
        return;
    }
    level flag::init(#"hash_745ef45972843bd3");
    zm_trial::register_challenge("nukerun", &on_begin, &on_end);
}

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 0, eflags: 0x5 linked
// Checksum 0x967da477, Offset: 0x2e8
// Size: 0x110
function private on_begin() {
    level.var_8c018a0e = 1;
    level.var_4f7df1ac = 1;
    level flag::clear(#"hash_745ef45972843bd3");
    callback::function_33f0ddd3(&function_33f0ddd3);
    level zm_trial::function_25ee130(1);
    level thread nuke_loop();
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_bf710271();
    }
}

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 0, eflags: 0x1 linked
// Checksum 0xd21c4eb0, Offset: 0x400
// Size: 0x488
function nuke_loop() {
    level endon(#"hash_7646638df88a3656");
    wait(5);
    while (1) {
        wait(10);
        a_locations = struct::get_array("dog_location", "script_noteworthy");
        players = getplayers();
        valid_players = [];
        foreach (player in players) {
            if (zm_utility::is_player_valid(player)) {
                if (!isdefined(valid_players)) {
                    valid_players = [];
                } else if (!isarray(valid_players)) {
                    valid_players = array(valid_players);
                }
                valid_players[valid_players.size] = player;
            }
        }
        a_zones = [];
        foreach (zone in level.zones) {
            if (isdefined(zone.is_enabled) && zone.is_enabled && !(isdefined(zone.is_occupied) && zone.is_occupied) && zone.name !== "zone_security_checkpoint") {
                if (!isdefined(a_zones)) {
                    a_zones = [];
                } else if (!isarray(a_zones)) {
                    a_zones = array(a_zones);
                }
                if (!isinarray(a_zones, zone)) {
                    a_zones[a_zones.size] = zone;
                }
            }
        }
        zone = array::random(a_zones);
        str_zone = zone.name;
        switch (str_zone) {
        case #"zone_street_start":
            str_zone = "zone_street2";
            break;
        case #"zone_street_mid":
            str_zone = "zone_street1";
            break;
        }
        var_a4cd10ea = [];
        foreach (loc in a_locations) {
            if (loc.targetname === str_zone + "_spawns") {
                if (!isdefined(var_a4cd10ea)) {
                    var_a4cd10ea = [];
                } else if (!isarray(var_a4cd10ea)) {
                    var_a4cd10ea = array(var_a4cd10ea);
                }
                if (!isinarray(var_a4cd10ea, loc)) {
                    var_a4cd10ea[var_a4cd10ea.size] = loc;
                }
            }
        }
        loc = array::random(var_a4cd10ea);
        location = zm_utility::groundpos(loc.origin);
        level thread function_fe74909(location);
        level waittill(#"hash_4d75b8766027b0f2");
        wait(10);
    }
}

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 1, eflags: 0x1 linked
// Checksum 0x535a816, Offset: 0x890
// Size: 0x3a0
function function_fe74909(drop_point) {
    playsoundatposition(#"hash_1fc67d7ad7445bbf", (-521, -1972, -82));
    playsoundatposition(#"hash_1fc67c7ad7445a0c", (-1146, -1956, -92));
    wait(3);
    level.var_dcd1e798 = getent("perk_machine_mover", "targetname");
    level.var_dcd1e798 useanimtree("generic");
    var_2379bb0e = util::spawn_model("p7_zm_power_up_nuke", drop_point);
    var_2379bb0e hide();
    level.var_dcd1e798.origin = drop_point;
    var_2379bb0e linkto(level.var_dcd1e798, "tag_animate_origin");
    level.var_dcd1e798 thread animation::play("p8_fxanim_zm_white_perk_machine_dummy_fly_in");
    waitframe(2);
    var_2379bb0e show();
    wait(3.5);
    level thread namespace_9efb8d22::function_48acb6ed(drop_point);
    playrumbleonposition("zm_white_perk_impact", drop_point);
    playrumbleonposition("zm_white_perk_aftershock", drop_point);
    level.var_7540bc25 = zm_powerups::specific_powerup_drop("nuke", drop_point, undefined, 0.1, undefined, 0);
    var_2379bb0e delete();
    if (isdefined(level.var_7540bc25)) {
        level.var_7cd7bd38 = gameobjects::get_next_obj_id();
        if (!isdefined(self.a_n_objective_ids)) {
            self.a_n_objective_ids = [];
        } else if (!isarray(self.a_n_objective_ids)) {
            self.a_n_objective_ids = array(self.a_n_objective_ids);
        }
        self.a_n_objective_ids[self.a_n_objective_ids.size] = level.var_7cd7bd38;
        objective_add(level.var_7cd7bd38, "active", level.var_7540bc25.origin, #"hash_423a75e2700a53ab");
        function_da7940a3(level.var_7cd7bd38, 1);
        while (isdefined(level.var_7540bc25) && !level flag::get(#"hash_745ef45972843bd3")) {
            waitframe(1);
        }
        objective_setinvisibletoall(level.var_7cd7bd38);
        objective_delete(level.var_7cd7bd38);
        gameobjects::release_obj_id(level.var_7cd7bd38);
        level.var_7cd7bd38 = undefined;
    }
    level notify(#"hash_4d75b8766027b0f2");
}

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 1, eflags: 0x5 linked
// Checksum 0x8f4f2f3, Offset: 0xc38
// Size: 0xf8
function private on_end(round_reset) {
    level.var_8c018a0e = undefined;
    level.var_4f7df1ac = undefined;
    level flag::set(#"hash_745ef45972843bd3");
    callback::function_824d206(&function_33f0ddd3);
    level zm_trial::function_25ee130(0);
    foreach (player in getplayers()) {
        player thread zm_trial_util::function_dc0859e();
    }
}

// Namespace zm_trial_white_nukerun/zm_trial_white_nukerun
// Params 1, eflags: 0x5 linked
// Checksum 0xed6fe273, Offset: 0xd38
// Size: 0xb4
function private function_33f0ddd3(s_event) {
    if (s_event.event === "give_weapon") {
        if (!zm_loadout::function_2ff6913(s_event.weapon)) {
            self lockweapon(s_event.weapon, 1, 1);
            if (s_event.weapon.dualwieldweapon != level.weaponnone) {
                self lockweapon(s_event.weapon.dualwieldweapon, 1, 1);
            }
        }
    }
}

