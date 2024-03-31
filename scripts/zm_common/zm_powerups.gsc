// Atian COD Tools GSC decompiler test
#using scripts\zm_common\trials\zm_trial_headshots_only.gsc;
#using scripts\zm_common\trials\zm_trial_no_powerups.gsc;
#using scripts\zm_common\zm_zonemgr.gsc;
#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_trial.gsc;
#using scripts\zm_common\zm_stats.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_net.gsc;
#using scripts\zm_common\zm_loadout.gsc;
#using scripts\zm_common\zm_customgame.gsc;
#using scripts\zm_common\zm_contracts.gsc;
#using scripts\zm_common\zm_bgb.gsc;
#using scripts\zm_common\zm_audio.gsc;
#using scripts\zm_common\bb.gsc;
#using scripts\zm_common\ai\zm_ai_utility.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\potm_shared.gsc;
#using scripts\core_common\math_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\demo_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\array_shared.gsc;

#namespace zm_powerups;

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x38c6d475, Offset: 0x570
// Size: 0x4a4
function init() {
    zombie_utility::set_zombie_var(#"zombie_insta_kill", 0, undefined, undefined, 1);
    zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
    zombie_utility::set_zombie_var(#"zombie_timer_offset", 350);
    zombie_utility::set_zombie_var(#"zombie_timer_offset_interval", 30);
    zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_on", 0);
    zombie_utility::set_zombie_var(#"zombie_powerup_fire_sale_time", 30);
    zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_on", 0);
    zombie_utility::set_zombie_var(#"zombie_powerup_bonfire_sale_time", 30);
    zombie_utility::set_zombie_var(#"zombie_powerup_insta_kill_on", 0, undefined, undefined, 1);
    zombie_utility::set_zombie_var(#"zombie_powerup_insta_kill_time", 30, undefined, undefined, 1);
    zombie_utility::set_zombie_var(#"zombie_powerup_double_points_on", 0, undefined, undefined, 1);
    zombie_utility::set_zombie_var(#"zombie_powerup_double_points_time", 30, undefined, undefined, 1);
    if (zm_custom::function_901b751c(#"zmpowerupsislimitedround")) {
        zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", zm_custom::function_901b751c(#"zmpowerupslimitround"));
    } else {
        zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_per_round", 4);
    }
    zombie_utility::set_zombie_var(#"hash_604cac237ec8cd3", 12);
    zombie_utility::set_zombie_var(#"hash_8b7fc80184dc451", 16);
    zombie_utility::set_zombie_var(#"hash_604cbc237ec8e86", 14);
    zombie_utility::set_zombie_var(#"hash_8b7f980184dbf38", 18);
    zombie_utility::set_zombie_var(#"hash_604ccc237ec9039", 17);
    zombie_utility::set_zombie_var(#"hash_8b7fa80184dc0eb", 21);
    zombie_utility::set_zombie_var(#"hash_604cdc237ec91ec", 20);
    zombie_utility::set_zombie_var(#"hash_8b7ff80184dc96a", 24);
    zombie_utility::set_zombie_var(#"hash_4d2cc817490bcca", 4);
    zombie_utility::set_zombie_var(#"hash_4edd68174a79580", 7);
    if (!isdefined(level.zombie_powerups)) {
        level.zombie_powerups = [];
    }
    level._effect[#"powerup_off"] = #"zombie/fx_powerup_off_green_zmb";
    init_powerups();
    if (!level.enable_magic || !zm_custom::function_901b751c(#"zmpowerupsactive")) {
        return;
    }
    thread watch_for_drop();
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x9ff73773, Offset: 0xa20
// Size: 0x29c
function init_powerups() {
    level flag::init("zombie_drop_powerups");
    if (isdefined(level.enable_magic) && level.enable_magic && isdefined(zm_custom::function_901b751c(#"zmpowerupsactive")) && zm_custom::function_901b751c(#"zmpowerupsactive")) {
        level flag::set("zombie_drop_powerups");
    }
    if (!isdefined(level.active_powerups)) {
        level.active_powerups = [];
    }
    add_zombie_powerup("insta_kill_ug", "zombie_skull", #"hash_1784640b956f2f85", &func_should_never_drop, 1, 0, 0, undefined, "powerup_instant_kill_ug", "zombie_powerup_insta_kill_ug_time", "zombie_powerup_insta_kill_ug_on", 1);
    if (isdefined(level.var_cacd8f96)) {
        [[ level.var_cacd8f96 ]]();
    }
    randomize_powerups();
    level.zombie_powerup_index = 0;
    randomize_powerups();
    level.rare_powerups_active = 0;
    level.zm_genesis_robot_pay_towardsreactswordstart = randomintrange(zombie_utility::function_d2dfacfd(#"hash_4d2cc817490bcca"), zombie_utility::function_d2dfacfd(#"hash_4edd68174a79580"));
    level.firesale_vox_firstime = 0;
    level thread powerup_hud_monitor();
    clientfield::register("scriptmover", "powerup_fx", 1, 3, "int");
    clientfield::register("scriptmover", "powerup_intro_fx", 1, 3, "int");
    clientfield::register("scriptmover", "powerup_grabbed_fx", 1, 3, "int");
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x0
// Checksum 0xe59d06f1, Offset: 0xcc8
// Size: 0x42
function set_weapon_ignore_max_ammo(weapon) {
    if (!isdefined(level.zombie_weapons_no_max_ammo)) {
        level.zombie_weapons_no_max_ammo = [];
    }
    level.zombie_weapons_no_max_ammo[weapon] = 1;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xac6b696f, Offset: 0xd18
// Size: 0x5d2
function powerup_hud_monitor() {
    level flag::wait_till("start_zombie_round_logic");
    if (isdefined(level.current_game_module) && level.current_game_module == 2) {
        return;
    }
    flashing_timers = [];
    flashing_values = [];
    flashing_timer = 10;
    flashing_delta_time = 0;
    flashing_is_on = 0;
    flashing_value = 3;
    flashing_min_timer = 0.15;
    while (flashing_timer >= flashing_min_timer) {
        if (flashing_timer < 5) {
            flashing_delta_time = 0.1;
        } else {
            flashing_delta_time = 0.2;
        }
        if (flashing_is_on) {
            flashing_timer = flashing_timer - flashing_delta_time - 0.05;
            flashing_value = 2;
        } else {
            flashing_timer = flashing_timer - flashing_delta_time;
            flashing_value = 3;
        }
        flashing_timers[flashing_timers.size] = flashing_timer;
        flashing_values[flashing_values.size] = flashing_value;
        flashing_is_on = !flashing_is_on;
    }
    client_fields = [];
    powerup_keys = getarraykeys(level.zombie_powerups);
    for (powerup_key_index = 0; powerup_key_index < powerup_keys.size; powerup_key_index++) {
        if (isdefined(level.zombie_powerups[powerup_keys[powerup_key_index]].client_field_name)) {
            powerup_name = powerup_keys[powerup_key_index];
            client_fields[powerup_name] = spawnstruct();
            client_fields[powerup_name].client_field_name = level.zombie_powerups[powerup_name].client_field_name;
            client_fields[powerup_name].only_affects_grabber = level.zombie_powerups[powerup_name].only_affects_grabber;
            client_fields[powerup_name].time_name = level.zombie_powerups[powerup_name].time_name;
            client_fields[powerup_name].on_name = level.zombie_powerups[powerup_name].on_name;
        }
    }
    client_field_keys = getarraykeys(client_fields);
    while (true) {
        waittillframeend();
        players = level.players;
        for (playerindex = 0; playerindex < players.size; playerindex++) {
            for (client_field_key_index = 0; client_field_key_index < client_field_keys.size; client_field_key_index++) {
                player = players[playerindex];
                /#
                    if (isbot(player)) {
                        continue;
                    }
                #/
                if (player.team === #"spectator") {
                    continue;
                }
                if (isdefined(level.var_209e0eb4)) {
                    if (![[ level.var_209e0eb4 ]](player)) {
                        continue;
                    }
                }
                client_field_name = client_fields[client_field_keys[client_field_key_index]].client_field_name;
                time_name = client_fields[client_field_keys[client_field_key_index]].time_name;
                on_name = client_fields[client_field_keys[client_field_key_index]].on_name;
                powerup_timer = undefined;
                powerup_on = undefined;
                if (client_fields[client_field_keys[client_field_key_index]].only_affects_grabber && isdefined(player zombie_utility::function_73061b82(time_name)) && isdefined(player zombie_utility::function_73061b82(on_name))) {
                    powerup_timer = player.zombie_vars[time_name];
                    powerup_on = player.zombie_vars[on_name];
                } else if (isdefined(zombie_utility::function_6403cf83(time_name, player.team))) {
                    powerup_timer = zombie_utility::function_6403cf83(time_name, player.team);
                    powerup_on = zombie_utility::function_6403cf83(on_name, player.team);
                } else if (isdefined(zombie_utility::function_d2dfacfd(time_name))) {
                    powerup_timer = zombie_utility::function_d2dfacfd(time_name);
                    powerup_on = zombie_utility::function_d2dfacfd(on_name);
                }
                if (isdefined(powerup_timer) && isdefined(powerup_on)) {
                    player set_clientfield_powerups(client_field_name, powerup_timer, powerup_on, flashing_timers, flashing_values);
                    continue;
                }
                player clientfield::set_player_uimodel(client_field_name, 0);
            }
            waitframe(1);
        }
    }
}

// Namespace zm_powerups/zm_powerups
// Params 5, eflags: 0x1 linked
// Checksum 0x4a1f762d, Offset: 0x12f8
// Size: 0x114
function set_clientfield_powerups(clientfield_name, powerup_timer, powerup_on, flashing_timers, flashing_values) {
    if (powerup_on && !(isdefined(self.var_9414a188) && self.var_9414a188)) {
        if (powerup_timer < 10) {
            flashing_value = 3;
            for (i = flashing_timers.size - 1; i > 0; i--) {
                if (powerup_timer < flashing_timers[i]) {
                    flashing_value = flashing_values[i];
                    break;
                }
            }
            self clientfield::set_player_uimodel(clientfield_name, flashing_value);
        } else {
            self clientfield::set_player_uimodel(clientfield_name, 1);
        }
        return;
    }
    self clientfield::set_player_uimodel(clientfield_name, 0);
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xee951ae, Offset: 0x1418
// Size: 0x4e
function randomize_powerups() {
    if (!isdefined(level.zombie_powerup_array)) {
        level.zombie_powerup_array = [];
        return;
    }
    level.zombie_powerup_array = array::randomize(level.zombie_powerup_array);
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x8e12cf6d, Offset: 0x1470
// Size: 0x128
function get_next_powerup() {
    if (isdefined(level.var_ab5b85bf)) {
        powerup = level.var_ab5b85bf;
        level.var_ab5b85bf = undefined;
    } else if (level.zm_genesis_robot_pay_towardsreactswordstart == 0 && zm_custom::function_901b751c(#"zmpowerupmaxammo") && isdefined(level.zombie_powerups[#"full_ammo"].func_should_drop_with_regular_powerups) && [[ level.zombie_powerups[#"full_ammo"].func_should_drop_with_regular_powerups ]]()) {
        powerup = "full_ammo";
    } else {
        powerup = level.zombie_powerup_array[level.zombie_powerup_index];
        level.zombie_powerup_index++;
        if (level.zombie_powerup_index >= level.zombie_powerup_array.size) {
            level.zombie_powerup_index = 0;
            randomize_powerups();
        }
    }
    return powerup;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x6cb03958, Offset: 0x15a0
// Size: 0x11a
function get_valid_powerup() {
    /#
        if (isdefined(level.zombie_devgui_power) && level.zombie_devgui_power == 1) {
            level.zombie_devgui_power = 0;
            return level.zombie_powerup_array[level.zombie_powerup_index];
        }
    #/
    if (isdefined(level.zombie_powerup_boss)) {
        i = level.zombie_powerup_boss;
        level.zombie_powerup_boss = undefined;
        return level.zombie_powerup_array[i];
    }
    if (isdefined(level.zombie_powerup_ape)) {
        str_powerup = level.zombie_powerup_ape;
        level.zombie_powerup_ape = undefined;
        return str_powerup;
    }
    while (true) {
        str_powerup = get_next_powerup();
        if (isdefined(level.zombie_powerups[str_powerup]) && [[ level.zombie_powerups[str_powerup].func_should_drop_with_regular_powerups ]]()) {
            return str_powerup;
        }
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xdf551088, Offset: 0x16c8
// Size: 0xb8
function function_70bd1ec9() {
    if (!level.zombie_powerups.size) {
        return false;
    }
    foreach (str_powerup in level.zombie_powerup_array) {
        if (isdefined(level.zombie_powerups[str_powerup]) && [[ level.zombie_powerups[str_powerup].func_should_drop_with_regular_powerups ]]()) {
            return true;
        }
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x0
// Checksum 0x9fa8c665, Offset: 0x1788
// Size: 0xea
function minigun_no_drop() {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (players[i].zombie_vars[#"zombie_powerup_minigun_on"] == 1) {
            return true;
        }
    }
    if (!level flag::get("power_on")) {
        if (level flag::get("solo_game")) {
            if (!isdefined(level.solo_lives_given) || level.solo_lives_given == 0) {
                return true;
            }
        } else {
            return true;
        }
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x763c8ff5, Offset: 0x1880
// Size: 0x140
function watch_for_drop() {
    level endon(#"end_game");
    level flag::wait_till("start_zombie_round_logic");
    level flag::wait_till("begin_spawning");
    waitframe(1);
    level.var_1dce56cc = function_2ff352cc();
    if (!isdefined(level.n_total_kills)) {
        level.n_total_kills = 0;
    }
    while (true) {
        level flag::wait_till("zombie_drop_powerups");
        if (level.n_total_kills >= level.var_1dce56cc) {
            level function_a7a5570e();
            level.var_1dce56cc = level.n_total_kills + function_2ff352cc();
            zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
        }
        wait(0.5);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xfb6e3be5, Offset: 0x19c8
// Size: 0x180
function function_2ff352cc() {
    a_e_players = getplayers();
    if (!isdefined(a_e_players) || !a_e_players.size) {
        n_players = 1;
    } else {
        n_players = a_e_players.size;
    }
    n_kill_count = randomintrangeinclusive(zombie_utility::function_d2dfacfd(#"hash_434b3261c607850" + n_players), zombie_utility::function_d2dfacfd(#"zombie_powerup_drop_max_" + n_players));
    if (zm_custom::function_901b751c(#"zmpowerupfrequency") == 0) {
        n_kill_count = n_kill_count * 2;
    } else if (zm_custom::function_901b751c(#"zmpowerupfrequency") == 2) {
        n_kill_count = floor(n_kill_count / 2);
    }
    if (zm_trial_no_powerups::is_active()) {
        n_kill_count = n_kill_count / zm_trial_no_powerups::function_2fc5f13();
    }
    if (n_kill_count < 1) {
        n_kill_count = 1;
    }
    return n_kill_count;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x5 linked
// Checksum 0x6ac44bd3, Offset: 0x1b50
// Size: 0x13e
function private function_a7a5570e() {
    for (i = 1; i <= 4; i++) {
        zombie_utility::set_zombie_var(#"hash_434b3261c607850" + i, int(min(990, zombie_utility::function_d2dfacfd(#"hash_434b3261c607850" + i) + 1)));
        zombie_utility::set_zombie_var(#"zombie_powerup_drop_max_" + i, int(min(999, zombie_utility::function_d2dfacfd(#"zombie_powerup_drop_max_" + i) + 1)));
    }
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xa4202c79, Offset: 0x1c98
// Size: 0x1e2
function zombie_can_drop_powerups(weapon) {
    if (zm_trial_no_powerups::is_active() && isdefined(weapon) && (isdefined(weapon.isriotshield) && weapon.isriotshield || isdefined(weapon.isheroweapon) && weapon.isheroweapon)) {
        return true;
    }
    if (zm_loadout::is_tactical_grenade(weapon) || !level flag::get("zombie_drop_powerups")) {
        return false;
    }
    if (isdefined(level.no_powerups) && level.no_powerups || isdefined(self.no_powerups) && self.no_powerups || isdefined(weapon) && isdefined(weapon.isheroweapon) && weapon.isheroweapon) {
        return false;
    }
    if (isdefined(level.use_powerup_volumes) && level.use_powerup_volumes) {
        volumes = getentarray("no_powerups", "targetname");
        foreach (volume in volumes) {
            if (self istouching(volume)) {
                return false;
            }
        }
    }
    return true;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x39293419, Offset: 0x1e88
// Size: 0x2a4
function function_b753385f(weapon) {
    var_385d71c3 = 0;
    if (zombie_utility::function_d2dfacfd(#"zombie_drop_item")) {
        var_385d71c3 = 1;
        var_4e31704a = 1;
    } else {
        var_a45a5982 = randomint(100);
        if (bgb::is_team_enabled(#"zm_bgb_power_vacuum") && var_a45a5982 < 20) {
            var_385d71c3 = 1;
            var_4e31704a = 0;
        } else if (isdefined(weapon) && weaponhasattachment(weapon, "suppressed") && var_a45a5982 < 1) {
            var_385d71c3 = 1;
            var_4e31704a = 0;
        }
    }
    if (var_385d71c3 && self zombie_can_drop_powerups(weapon)) {
        if (isdefined(self.in_the_ground) && self.in_the_ground) {
            trace = bullettrace(self.origin + vectorscale((0, 0, 1), 100), self.origin + vectorscale((0, 0, -1), 100), 0, undefined);
        } else {
            trace = groundtrace(self.origin + vectorscale((0, 0, 1), 5), self.origin + vectorscale((0, 0, -1), 300), 0, undefined);
        }
        origin = trace[#"position"];
        hit_ent = trace[#"entity"];
        var_d13d4980 = undefined;
        if (isdefined(hit_ent) && hit_ent ismovingplatform()) {
            var_d13d4980 = spawn("script_model", origin + vectorscale((0, 0, 1), 40));
            var_d13d4980 linkto(hit_ent);
        }
        level thread powerup_drop(origin, var_d13d4980, var_4e31704a);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x0
// Checksum 0x5708ffa0, Offset: 0x2138
// Size: 0x46
function get_random_powerup_name() {
    powerup_keys = getarraykeys(level.zombie_powerups);
    powerup_keys = array::randomize(powerup_keys);
    return powerup_keys[0];
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x0
// Checksum 0xb3bb4b16, Offset: 0x2188
// Size: 0x9c
function get_regular_random_powerup_name() {
    powerup_keys = getarraykeys(level.zombie_powerups);
    powerup_keys = array::randomize(powerup_keys);
    for (i = 0; i < powerup_keys.size; i++) {
        if ([[ level.zombie_powerups[powerup_keys[i]].func_should_drop_with_regular_powerups ]]()) {
            return powerup_keys[i];
        }
    }
    return powerup_keys[0];
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x8110c7c9, Offset: 0x2230
// Size: 0x1c
function function_cc33adc8() {
    return util::get_game_type() != "zcleansed";
}

// Namespace zm_powerups/zm_powerups
// Params d, eflags: 0x1 linked
// Checksum 0xdd1a819f, Offset: 0x2258
// Size: 0x4ae
function add_zombie_powerup(powerup_name, model_name, hint, func_should_drop_with_regular_powerups, only_affects_grabber, any_team, zombie_grabbable, fx, client_field_name, time_name, on_name, clientfield_version = 1, player_specific = 0) {
    if (isdefined(level.zombie_include_powerups) && !(isdefined(level.zombie_include_powerups[powerup_name]) && level.zombie_include_powerups[powerup_name])) {
        return;
    }
    switch (powerup_name) {
    case #"small_ammo":
    case #"full_ammo":
        str_rule = "zmPowerupMaxAmmo";
        break;
    case #"fire_sale":
        str_rule = "zmPowerupFireSale";
        break;
    case #"bonus_points_player_shared":
    case #"bonus_points_player":
    case #"bonus_points_team":
        str_rule = "zmPowerupChaosPoints";
        break;
    case #"free_perk":
        str_rule = "zmPowerupFreePerk";
        break;
    case #"nuke":
        str_rule = "zmPowerupNuke";
        break;
    case #"hero_weapon_power":
        str_rule = "zmPowerupSpecialWeapon";
        break;
    case #"insta_kill":
        str_rule = "zmPowerupInstakill";
        break;
    case #"double_points":
        str_rule = "zmPowerupDouble";
        break;
    case #"carpenter":
        str_rule = "zmPowerupCarpenter";
        break;
    default:
        str_rule = "";
        break;
    }
    if (str_rule != "" && !(isdefined(zm_custom::function_901b751c(str_rule)) && zm_custom::function_901b751c(str_rule))) {
        return;
    }
    if (!isdefined(level.zombie_powerup_array)) {
        level.zombie_powerup_array = [];
    }
    struct = spawnstruct();
    struct.powerup_name = powerup_name;
    struct.model_name = model_name;
    struct.weapon_classname = "script_model";
    struct.hint = hint;
    struct.func_should_drop_with_regular_powerups = func_should_drop_with_regular_powerups;
    struct.only_affects_grabber = only_affects_grabber;
    struct.any_team = any_team;
    struct.zombie_grabbable = zombie_grabbable;
    struct.hash_id = stathash(powerup_name);
    struct.player_specific = player_specific;
    struct.can_pick_up_in_last_stand = 1;
    if (isdefined(fx)) {
        struct.fx = fx;
    }
    level.zombie_powerups[powerup_name] = struct;
    level.zombie_powerup_array[level.zombie_powerup_array.size] = powerup_name;
    add_zombie_special_drop(powerup_name);
    if (isdefined(client_field_name)) {
        var_4e6e65fa = "hudItems.zmPowerUps." + client_field_name + ".state";
        clientfield::register("clientuimodel", var_4e6e65fa, clientfield_version, 2, "int");
        struct.client_field_name = var_4e6e65fa;
        struct.time_name = time_name;
        struct.on_name = on_name;
    }
    if (isdefined(powerup_name) && powerup_name == #"full_ammo") {
        level.var_aebef29d = gettime() / 1000;
    }
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0xc57d0f59, Offset: 0x2710
// Size: 0x32
function powerup_set_can_pick_up_in_last_stand(powerup_name, b_can_pick_up) {
    level.zombie_powerups[powerup_name].can_pick_up_in_last_stand = b_can_pick_up;
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0x46fcc563, Offset: 0x2750
// Size: 0x32
function powerup_set_prevent_pick_up_if_drinking(powerup_name, b_prevent_pick_up) {
    level._custom_powerups[powerup_name].prevent_pick_up_if_drinking = b_prevent_pick_up;
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0x4c8b8b7b, Offset: 0x2790
// Size: 0x42
function powerup_set_player_specific(powerup_name, b_player_specific = 1) {
    level.zombie_powerups[powerup_name].player_specific = b_player_specific;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xc1a45463, Offset: 0x27e0
// Size: 0x42
function powerup_set_statless_powerup(powerup_name) {
    if (!isdefined(level.zombie_statless_powerups)) {
        level.zombie_statless_powerups = [];
    }
    level.zombie_statless_powerups[powerup_name] = 1;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x202950b6, Offset: 0x2830
// Size: 0x46
function add_zombie_special_drop(powerup_name) {
    if (!isdefined(level.zombie_special_drop_array)) {
        level.zombie_special_drop_array = [];
    }
    level.zombie_special_drop_array[level.zombie_special_drop_array.size] = powerup_name;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x165b2367, Offset: 0x2880
// Size: 0x42
function include_zombie_powerup(powerup_name) {
    if (!isdefined(level.zombie_include_powerups)) {
        level.zombie_include_powerups = [];
    }
    level.zombie_include_powerups[powerup_name] = 1;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x958ba175, Offset: 0x28d0
// Size: 0x5a
function powerup_remove_from_regular_drops(powerup_name) {
    if (!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name])) {
        return;
    }
    level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = &func_should_never_drop;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x879904c9, Offset: 0x2938
// Size: 0xaa
function function_74b8ec6b(powerup_name) {
    if (!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name]) || isdefined(level.zombie_powerups[powerup_name].var_d92b8001)) {
        return;
    }
    level.zombie_powerups[powerup_name].var_d92b8001 = level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups;
    level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = &func_should_never_drop;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xd39398a7, Offset: 0x29f0
// Size: 0x9a
function function_41cedb05(powerup_name) {
    if (!isdefined(level.zombie_powerups) || !isdefined(level.zombie_powerups[powerup_name]) || !isdefined(level.zombie_powerups[powerup_name].var_d92b8001)) {
        return;
    }
    level.zombie_powerups[powerup_name].func_should_drop_with_regular_powerups = level.zombie_powerups[powerup_name].var_d92b8001;
    level.zombie_powerups[powerup_name].var_d92b8001 = undefined;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x381ec3b, Offset: 0x2a98
// Size: 0x12
function powerup_round_start() {
    level.powerup_drop_count = 0;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x1b2da085, Offset: 0x2ab8
// Size: 0x2c
function function_5326bd06(e_powerup) {
    if (isdefined(e_powerup)) {
        e_powerup delete();
    }
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x1 linked
// Checksum 0x51bf9878, Offset: 0x2af0
// Size: 0x418
function powerup_drop(drop_point, powerup, var_4e31704a = 1) {
    if (zm_custom::function_e1f04ede()) {
        function_5326bd06(powerup);
        return;
    }
    if (isdefined(level.var_7e3a9cf2)) {
        b_outcome = [[ level.var_7e3a9cf2 ]](drop_point);
        if (isdefined(b_outcome) && b_outcome) {
            return;
        }
    }
    if (level.powerup_drop_count >= zombie_utility::function_d2dfacfd(#"zombie_powerup_drop_max_per_round")) {
        /#
            println("p8_zm_powerup_free_perk_02");
        #/
        function_5326bd06(powerup);
        return;
    }
    zombie_utility::set_zombie_var(#"zombie_drop_item", 0);
    level.powerup_drop_count++;
    if (!isdefined(powerup)) {
        powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", drop_point + vectorscale((0, 0, 1), 40));
    }
    powerup setmodel(#"tag_origin");
    if (!isdefined(level.zombie_include_powerups) || level.zombie_include_powerups.size == 0 || !function_70bd1ec9()) {
        function_5326bd06(powerup);
        level.powerup_drop_count--;
        zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
        return;
    }
    valid_drop = function_37e79fb6(powerup);
    if (var_4e31704a && valid_drop && level.rare_powerups_active) {
        pos = (drop_point[0], drop_point[1], drop_point[2] + 42);
        if (check_for_rare_drop_override(pos)) {
            valid_drop = 0;
        }
    }
    if (!valid_drop) {
        level.powerup_drop_count--;
        powerup delete();
        zombie_utility::set_zombie_var(#"zombie_drop_item", 1);
        return;
    }
    powerup powerup_setup(undefined, undefined, drop_point);
    /#
        if (var_4e31704a) {
            str_debug = "<unknown string>";
        } else {
            str_debug = "<unknown string>";
        }
        print_powerup_drop(powerup.powerup_name, str_debug);
    #/
    bb::logpowerupevent(powerup, undefined, "_dropped");
    powerup thread powerup_timeout();
    powerup thread powerup_wobble();
    powerup util::delay(0.1, "powerup_timedout", &powerup_grab);
    powerup thread powerup_emp();
    level notify(#"powerup_dropped", {#powerup:powerup});
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xd2815656, Offset: 0x2f10
// Size: 0x1fa
function function_37e79fb6(powerup) {
    if (zm_utility::function_21f4ac36() && !isdefined(level.var_a2a9b2de)) {
        level.var_a2a9b2de = getnodearray("player_region", "script_noteworthy");
    }
    if (zm_utility::function_c85ebbbc() && !isdefined(level.playable_area)) {
        level.playable_area = getentarray("player_volume", "script_noteworthy");
    }
    if (zm_ai_utility::function_54054394(powerup)) {
        return false;
    }
    if (isdefined(level.var_a2a9b2de)) {
        if (isdefined(level.var_61afcb81)) {
            node = function_52c1730(powerup.origin, level.var_a2a9b2de, level.var_61afcb81);
        } else {
            node = function_52c1730(powerup.origin, level.var_a2a9b2de, 500);
        }
        if (isdefined(node)) {
            return true;
        }
    }
    if (isdefined(level.playable_area)) {
        foreach (var_dab4474c in level.playable_area) {
            if (powerup istouching(var_dab4474c)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x2f390bd, Offset: 0x3118
// Size: 0x234
function function_27437dae() {
    self endon(#"death", #"powerup_timedout", #"powerup_grabbed");
    if (!zm_utility::function_21f4ac36() || !isdefined(level.var_a2a9b2de)) {
        return;
    }
    wait(1);
    var_1a7af6f3 = arraysortclosest(level.var_a2a9b2de, self.origin);
    foreach (var_30d9be5a in var_1a7af6f3) {
        if (zm_zonemgr::zone_is_enabled(var_30d9be5a.targetname)) {
            nd_closest = var_30d9be5a;
            break;
        }
    }
    if (!isdefined(nd_closest)) {
        return;
    }
    var_f55f0704 = nd_closest.origin + vectorscale((0, 0, 1), 40);
    var_8a69f8c0 = distancesquared(var_f55f0704, self.origin);
    n_travel_time = math::linear_map(var_8a69f8c0, 100, 250000, 0.1, 3);
    if (n_travel_time <= 0.25 * 2) {
        n_accel = 0;
    } else {
        n_accel = 0.25;
    }
    self moveto(var_f55f0704, n_travel_time, n_accel, n_accel);
}

// Namespace zm_powerups/zm_powerups
// Params 10, eflags: 0x1 linked
// Checksum 0x49b4ccad, Offset: 0x3358
// Size: 0x50a
function specific_powerup_drop(var_5a63971, powerup_location, powerup_team, pickup_delay = 0.1, powerup_player, b_stay_forever, var_6f4cb533 = 0, var_a6d11a96, var_73b4ca3f = 1, var_45eaa114) {
    if (!var_6f4cb533 && zm_custom::function_e1f04ede() || !zm_custom::function_901b751c(#"zmpowerupsactive")) {
        return;
    }
    if (isactor(self) && !level flag::get("zombie_drop_powerups")) {
        return;
    }
    if (isarray(var_5a63971)) {
        var_5a63971 = array::random(var_5a63971);
    }
    switch (var_5a63971) {
    case #"full_ammo":
        str_rule = "zmPowerupMaxAmmo";
        break;
    case #"fire_sale":
        str_rule = "zmPowerupFireSale";
        break;
    case #"bonus_points_player_shared":
    case #"bonus_points_player":
    case #"bonus_points_team":
        str_rule = "zmPowerupChaosPoints";
        break;
    case #"free_perk":
        str_rule = "zmPowerupFreePerk";
        break;
    case #"nuke":
        str_rule = "zmPowerupNuke";
        break;
    case #"hero_weapon_power":
        str_rule = "zmPowerupSpecialWeapon";
        break;
    case #"insta_kill":
        str_rule = "zmPowerupInstakill";
        break;
    case #"double_points":
        str_rule = "zmPowerupDouble";
        break;
    case #"carpenter":
        str_rule = "zmPowerupCarpenter";
        break;
    default:
        str_rule = "";
        break;
    }
    if (str_rule != "" && !(isdefined(zm_custom::function_901b751c(str_rule)) && zm_custom::function_901b751c(str_rule))) {
        return;
    }
    if (!var_73b4ca3f && str_rule != "" && isdefined(level.zombie_powerups[var_5a63971])) {
        if (![[ level.zombie_powerups[var_5a63971].func_should_drop_with_regular_powerups ]]()) {
            return;
        }
    }
    s_trace = physicstrace(powerup_location + vectorscale((0, 0, 1), 10), powerup_location + vectorscale((0, 0, -1), 100), (0, 0, 0), (0, 0, 0), undefined, 2 | 16);
    hit_ent = s_trace[#"entity"];
    if (isdefined(hit_ent) && hit_ent ismovingplatform()) {
        powerup = spawn("script_model", powerup_location + vectorscale((0, 0, 1), 40));
        powerup linkto(hit_ent);
    } else {
        powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", powerup_location + vectorscale((0, 0, 1), 40));
    }
    powerup setmodel(#"tag_origin");
    powerup_location = powerup.origin;
    level notify(#"powerup_dropped", {#powerup:powerup});
    return powerup_init(powerup, var_5a63971, powerup_team, powerup_location, pickup_delay, powerup_player, b_stay_forever, var_a6d11a96, var_45eaa114);
}

// Namespace zm_powerups/zm_powerups
// Params 9, eflags: 0x1 linked
// Checksum 0x8eeb9d1e, Offset: 0x3870
// Size: 0x18a
function powerup_init(powerup, str_powerup, powerup_team, powerup_location, pickup_delay = 0.1, powerup_player, b_stay_forever, var_a6d11a96, var_45eaa114) {
    if (isdefined(powerup)) {
        powerup powerup_setup(str_powerup, powerup_team, powerup_location, powerup_player, undefined, var_a6d11a96);
        if (isdefined(var_45eaa114) && var_45eaa114 && !function_37e79fb6(powerup)) {
            powerup thread function_27437dae();
        }
        if (!(isdefined(b_stay_forever) && b_stay_forever)) {
            powerup thread powerup_timeout();
        }
        powerup thread powerup_wobble();
        if (isdefined(pickup_delay) && pickup_delay < 0.1) {
            pickup_delay = 0.1;
        }
        powerup util::delay(pickup_delay, "powerup_timedout", &powerup_grab, powerup_team);
        powerup thread powerup_emp();
        return powerup;
    }
}

// Namespace zm_powerups/zm_powerups
// Params 4, eflags: 0x1 linked
// Checksum 0x748103aa, Offset: 0x3a08
// Size: 0x16c
function function_14b7208c(str_powerup, powerup_team, powerup_location, powerup_player) {
    var_ce95e926 = 60;
    var_f9f778c1 = 120;
    var_d2057007 = 6;
    if (str_powerup === "nuke") {
        name = string(randomint(2147483647));
        origin = self.origin;
        badplace_cylinder(name, 0, origin, var_ce95e926, var_f9f778c1, #"allies");
        while (isdefined(self)) {
            if (distance2dsquared(origin, self.origin) > var_d2057007 * var_d2057007) {
                origin = self.origin;
                badplace_cylinder(name, 0, origin, var_ce95e926, var_f9f778c1, #"allies");
            }
            wait(1);
        }
        badplace_delete(name);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 6, eflags: 0x1 linked
// Checksum 0xfe1da1a5, Offset: 0x3b80
// Size: 0x4dc
function powerup_setup(powerup_override, powerup_team, powerup_location, powerup_player, shouldplaysound = 1, var_a6d11a96) {
    powerup = undefined;
    if (!isdefined(powerup_override)) {
        powerup = get_valid_powerup();
    } else {
        powerup = powerup_override;
        if ("tesla" == powerup && tesla_powerup_active()) {
            powerup = "minigun";
        }
    }
    struct = level.zombie_powerups[powerup];
    if (isdefined(powerup_team)) {
        self.powerup_team = powerup_team;
    }
    if (isdefined(powerup_location)) {
        self.powerup_location = powerup_location;
    }
    if (isdefined(powerup_player)) {
        self.powerup_player = powerup_player;
    } else {
        /#
            assert(!(isdefined(struct.player_specific) && struct.player_specific), "<unknown string>");
        #/
    }
    self.powerup_name = struct.powerup_name;
    self.hint = struct.hint;
    self.only_affects_grabber = struct.only_affects_grabber;
    self.any_team = struct.any_team;
    self.zombie_grabbable = struct.zombie_grabbable;
    self.func_should_drop_with_regular_powerups = struct.func_should_drop_with_regular_powerups;
    if (isdefined(level._custom_powerups) && isdefined(level._custom_powerups[powerup]) && isdefined(level._custom_powerups[powerup].setup_powerup)) {
        self [[ level._custom_powerups[powerup].setup_powerup ]]();
    } else {
        self function_76678c8d(powerup_location, struct.model_name, var_a6d11a96);
    }
    if (powerup == "full_ammo") {
        level.zm_genesis_robot_pay_towardsreactswordstart = randomintrange(zombie_utility::function_d2dfacfd(#"hash_4d2cc817490bcca"), zombie_utility::function_d2dfacfd(#"hash_4edd68174a79580"));
    } else if (!isdefined(powerup_override)) {
        level.zm_genesis_robot_pay_towardsreactswordstart--;
    }
    demo::bookmark(#"zm_powerup_dropped", gettime(), undefined, undefined, 1);
    potm::bookmark(#"zm_powerup_dropped", gettime(), undefined, undefined, 1);
    if (isdefined(struct.fx)) {
        self.fx = struct.fx;
    }
    if (isdefined(struct.can_pick_up_in_last_stand)) {
        self.can_pick_up_in_last_stand = struct.can_pick_up_in_last_stand;
    }
    var_b9dc5e9 = isdefined(struct.var_184f74ef) ? struct.var_184f74ef : 0;
    if (!var_b9dc5e9) {
        if (isdefined(level.var_bec5bf67)) {
            var_b9dc5e9 = self [[ level.var_bec5bf67 ]](self.powerup_name);
        }
    }
    if (!(isdefined(var_b9dc5e9) && var_b9dc5e9)) {
        if ((powerup == "bonus_points_player" || powerup == "bonus_points_player_shared") && zm_utility::is_standard()) {
            self playsound(#"hash_1229e9d60b3181ef");
            self playloopsound(#"hash_46b9bf1ae523021c");
        } else {
            self playsound(#"zmb_spawn_powerup");
            self playloopsound(#"zmb_spawn_powerup_loop");
        }
    }
    level.active_powerups[level.active_powerups.size] = self;
    self thread function_14b7208c(powerup, powerup_team, powerup_location, powerup_player);
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x9662dec8, Offset: 0x4068
// Size: 0x54
function powerup_zombie_grab_trigger_cleanup(trigger) {
    self waittill(#"powerup_timedout", #"powerup_grabbed", #"hacked");
    trigger delete();
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x17d393f4, Offset: 0x40c8
// Size: 0x3c2
function powerup_zombie_grab(powerup_team) {
    self endon(#"powerup_timedout", #"powerup_grabbed", #"hacked");
    zombie_grab_trigger = spawn("trigger_radius", self.origin - vectorscale((0, 0, 1), 40), (512 | 1) + 8, 32, 72);
    zombie_grab_trigger enablelinkto();
    zombie_grab_trigger linkto(self);
    zombie_grab_trigger setteamfortrigger(level.zombie_team);
    self thread powerup_zombie_grab_trigger_cleanup(zombie_grab_trigger);
    poi_dist = 300;
    if (isdefined(level._zombie_grabbable_poi_distance_override)) {
        poi_dist = level._zombie_grabbable_poi_distance_override;
    }
    zombie_grab_trigger zm_utility::create_zombie_point_of_interest(poi_dist, 2, 0, 1, undefined, undefined, powerup_team);
    while (isdefined(self)) {
        waitresult = undefined;
        waitresult = zombie_grab_trigger waittill(#"trigger");
        who = waitresult.activator;
        if (isdefined(level.var_e387a39)) {
            if (!self [[ level.var_e387a39 ]](who)) {
                continue;
            }
        } else if (!isdefined(who) || !isai(who)) {
            continue;
        }
        self clientfield::set("powerup_grabbed_fx", 3);
        if (isdefined(who)) {
            who playsound(#"zmb_powerup_grabbed");
        }
        self stoploopsound();
        if (isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].grab_powerup)) {
            b_continue = self [[ level._custom_powerups[self.powerup_name].grab_powerup ]]();
            if (isdefined(b_continue) && b_continue) {
                continue;
            }
        } else {
            if (isdefined(level._zombiemode_powerup_zombie_grab)) {
                level thread [[ level._zombiemode_powerup_zombie_grab ]](self);
            }
            if (isdefined(level._game_mode_powerup_zombie_grab)) {
                level thread [[ level._game_mode_powerup_zombie_grab ]](self, who);
            } else {
                /#
                    println("<unknown string>");
                #/
            }
        }
        level thread zm_audio::sndannouncerplayvox(self.powerup_name);
        wait(0.1);
        self thread powerup_delete_delayed();
        self notify(#"powerup_grabbed", {#e_grabber:who});
    }
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xcafacdd, Offset: 0x4498
// Size: 0xb6c
function powerup_grab(powerup_team) {
    if (isdefined(self) && self.zombie_grabbable) {
        self thread powerup_zombie_grab(powerup_team);
        return;
    }
    self endon(#"powerup_timedout", #"powerup_grabbed");
    range_squared = 4096;
    while (isdefined(self)) {
        if (isdefined(self.powerup_player)) {
            grabbers = [];
            grabbers[0] = self.powerup_player;
        } else if (isdefined(level.var_9671faed)) {
            grabbers = [[ level.var_9671faed ]]();
        } else {
            grabbers = getplayers();
        }
        for (i = 0; i < grabbers.size; i++) {
            grabber = grabbers[i];
            if (isalive(grabber.owner) && isplayer(grabber.owner)) {
                player = grabber.owner;
            } else if (isplayer(grabber)) {
                player = grabber;
            }
            if (!isdefined(self)) {
                break;
            }
            if (self.only_affects_grabber && !isdefined(player)) {
                continue;
            }
            if (player zm_utility::is_drinking() && isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].prevent_pick_up_if_drinking) && level._custom_powerups[self.powerup_name].prevent_pick_up_if_drinking) {
                continue;
            }
            if ((self.powerup_name == "minigun" || self.powerup_name == "tesla" || self.powerup_name == "random_weapon" || self.powerup_name == "meat_stink") && (!isplayer(grabber) || player laststand::player_is_in_laststand() || player usebuttonpressed() && player zm_utility::in_revive_trigger() || player bgb::is_enabled(#"zm_bgb_disorderly_combat"))) {
                continue;
            }
            if (!(isdefined(self.can_pick_up_in_last_stand) && self.can_pick_up_in_last_stand) && player laststand::player_is_in_laststand()) {
                continue;
            }
            ignore_range = 0;
            if (grabber.ignore_range_powerup === self) {
                grabber.ignore_range_powerup = undefined;
                ignore_range = 1;
            }
            if (isalive(grabber) && (distancesquared(grabber.origin, self.origin) < range_squared || ignore_range)) {
                if (isdefined(level.var_e387a39)) {
                    if (!self [[ level.var_e387a39 ]](player)) {
                        continue;
                    }
                }
                if (zm_trial_no_powerups::is_active()) {
                    var_57807cdc = [];
                    array::add(var_57807cdc, player, 0);
                    zm_trial::fail(#"hash_2619fd380423798b", var_57807cdc);
                    self thread powerup_delete_delayed();
                    self notify(#"powerup_grabbed", {#e_grabber:player});
                    return;
                }
                if (isdefined(level._custom_powerups) && isdefined(level._custom_powerups[self.powerup_name]) && isdefined(level._custom_powerups[self.powerup_name].grab_powerup)) {
                    b_continue = self [[ level._custom_powerups[self.powerup_name].grab_powerup ]](player);
                    if (isdefined(b_continue) && b_continue) {
                        continue;
                    }
                } else {
                    switch (self.powerup_name) {
                    case #"teller_withdrawl":
                        level thread teller_withdrawl(self, player);
                        break;
                    default:
                        if (isdefined(level._zombiemode_powerup_grab)) {
                            level thread [[ level._zombiemode_powerup_grab ]](self, player);
                        } else {
                            /#
                                println("<unknown string>");
                            #/
                        }
                        break;
                    }
                }
                demo::bookmark(#"zm_player_powerup_grabbed", gettime(), player);
                potm::bookmark(#"zm_player_powerup_grabbed", gettime(), player);
                bb::logpowerupevent(self, player, "_grabbed");
                if (isdefined(self.hash_id)) {
                    player recordmapevent(23, gettime(), grabber.origin, level.round_number, self.hash_id);
                }
                if (should_award_stat(self.powerup_name) && isplayer(player)) {
                    player zm_stats::increment_client_stat("drops");
                    player zm_stats::increment_player_stat("drops");
                    player zm_stats::function_8f10788e("boas_drops");
                    player zm_stats::increment_client_stat(self.powerup_name + "_pickedup");
                    player zm_stats::increment_player_stat(self.powerup_name + "_pickedup");
                    player zm_stats::increment_challenge_stat(#"survivalist_powerup");
                    player zm_stats::function_8f10788e("boas_" + self.powerup_name + "_pickedup");
                    player contracts::increment_zm_contract(#"contract_zm_powerups");
                    if (zm_utility::is_standard()) {
                        player zm_stats::increment_challenge_stat(#"hash_35ab7dfe675d26e9");
                        player zm_stats::function_c0c6ab19(#"rush_powerups");
                    }
                }
                if (isdefined(level.var_50b95271)) {
                    self thread [[ level.var_50b95271 ]]();
                } else {
                    var_f79dc259 = self function_d5b6ce91();
                    self clientfield::set("powerup_grabbed_fx", var_f79dc259);
                }
                if (isdefined(self.stolen) && self.stolen) {
                    level notify(#"monkey_see_monkey_dont_achieved");
                }
                if (isdefined(self.grabbed_level_notify)) {
                    level notify(self.grabbed_level_notify);
                }
                if ((self.powerup_name == "bonus_points_player" || self.powerup_name == "bonus_points_player_shared") && zm_utility::is_standard()) {
                    player playsound(#"hash_6c0682a7e4e26b09");
                } else {
                    b_ignore = 0;
                    if (isdefined(level.var_bec5bf67)) {
                        b_ignore = self [[ level.var_bec5bf67 ]](self.powerup_name);
                    }
                    if (!b_ignore) {
                        player playsound(#"zmb_powerup_grabbed");
                    }
                }
                self.claimed = 1;
                self.power_up_grab_player = player;
                wait(0.1);
                if (!isdefined(self)) {
                    break;
                }
                self stoploopsound();
                self hide();
                if (self.powerup_name != "fire_sale") {
                    if (isdefined(self.power_up_grab_player)) {
                        if (isdefined(level.powerup_intro_vox)) {
                            level thread [[ level.powerup_intro_vox ]](self);
                            return;
                        } else if (isdefined(level.powerup_vo_available)) {
                            can_say_vo = [[ level.powerup_vo_available ]]();
                            if (!can_say_vo) {
                                self thread powerup_delete_delayed();
                                self notify(#"powerup_grabbed", {#e_grabber:player});
                                return;
                            }
                        }
                    }
                }
                if (isdefined(self.only_affects_grabber) && self.only_affects_grabber) {
                    level thread zm_audio::sndannouncerplayvox(self.powerup_name, player);
                } else {
                    level thread zm_audio::sndannouncerplayvox(self.powerup_name);
                }
                self thread powerup_delete_delayed();
                self notify(#"powerup_grabbed", {#e_grabber:player});
            }
        }
        wait(0.1);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x1 linked
// Checksum 0x19ba1319, Offset: 0x5010
// Size: 0x10a
function function_c1963295(var_4c20edd5, var_a6d11a96) {
    e_player = zm_utility::get_closest_player(var_4c20edd5);
    if (isdefined(level.var_ec45f213) && level.var_ec45f213 || isdefined(var_a6d11a96) && var_a6d11a96) {
        return 0.1;
    }
    if (!isdefined(e_player)) {
        return 1.5;
    }
    n_distance = distance(e_player.origin, var_4c20edd5);
    if (n_distance > 128) {
        return 0.1;
    } else if (n_distance < 8) {
        return 1.5;
    }
    n_delay = math::linear_map(n_distance, 8, 128, 1.5, 0);
    return n_delay;
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x1 linked
// Checksum 0xecb21e22, Offset: 0x5128
// Size: 0xd4
function function_76678c8d(var_41c62074, str_model, var_a6d11a96) {
    self endon(#"powerup_grabbed");
    if (isdefined(level.powerup_intro_fx_func)) {
        self thread [[ level.powerup_intro_fx_func ]]();
    } else {
        var_f79dc259 = self function_d5b6ce91();
        self clientfield::set("powerup_intro_fx", var_f79dc259);
    }
    var_e886efeb = function_c1963295(var_41c62074, var_a6d11a96);
    wait(var_e886efeb);
    self setmodel(str_model);
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0x5eff37d4, Offset: 0x5208
// Size: 0x11c
function get_closest_window_repair(windows, origin) {
    current_window = undefined;
    shortest_distance = undefined;
    for (i = 0; i < windows.size; i++) {
        if (zm_utility::all_chunks_intact(windows, windows[i].barrier_chunks)) {
            continue;
        }
        if (!isdefined(current_window)) {
            current_window = windows[i];
            shortest_distance = distancesquared(current_window.origin, origin);
            continue;
        }
        if (distancesquared(windows[i].origin, origin) < shortest_distance) {
            current_window = windows[i];
            shortest_distance = distancesquared(windows[i].origin, origin);
        }
    }
    return current_window;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xb0427382, Offset: 0x5330
// Size: 0x10c
function powerup_vo(type) {
    self endon(#"disconnect");
    if (!isplayer(self)) {
        return;
    }
    if (isdefined(level.powerup_vo_available)) {
        if (![[ level.powerup_vo_available ]]()) {
            return;
        }
    }
    if (type == "tesla") {
        wait(randomfloatrange(3.5, 4.5));
        self zm_audio::create_and_play_dialog(#"weapon_pickup", type);
    } else {
        wait(0.5);
        self zm_audio::create_and_play_dialog(#"powerup", type, undefined, 2);
    }
    if (isdefined(level.custom_powerup_vo_response)) {
        level [[ level.custom_powerup_vo_response ]](self, type);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0xd9d60eb, Offset: 0x5448
// Size: 0x56
function function_f0eb47d8(var_f0de9b92, b_disable = 1) {
    if (isdefined(level.zombie_powerups[var_f0de9b92])) {
        level.zombie_powerups[var_f0de9b92].var_cad40b46 = b_disable;
    }
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0x4df9b04b, Offset: 0x54a8
// Size: 0x56
function function_80b4c5e0(var_f0de9b92, b_disable = 1) {
    if (isdefined(level.zombie_powerups[var_f0de9b92])) {
        level.zombie_powerups[var_f0de9b92].var_184f74ef = b_disable;
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x614f0d05, Offset: 0x5508
// Size: 0x84
function powerup_wobble_fx() {
    self endon(#"death");
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(level.powerup_fx_func)) {
        self thread [[ level.powerup_fx_func ]]();
        return;
    }
    var_f79dc259 = self function_d5b6ce91();
    self clientfield::set("powerup_fx", var_f79dc259);
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xd28975c0, Offset: 0x5598
// Size: 0x46
function function_d5b6ce91() {
    if (self.only_affects_grabber) {
        return 2;
    }
    if (self.any_team) {
        return 4;
    }
    if (self.zombie_grabbable) {
        return 3;
    }
    return 1;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x7aa5f64d, Offset: 0x55e8
// Size: 0x208
function powerup_wobble() {
    self endon(#"powerup_grabbed", #"powerup_timedout");
    if (isdefined(level.zombie_powerups[self.powerup_name]) && isdefined(level.zombie_powerups[self.powerup_name].var_cad40b46) && level.zombie_powerups[self.powerup_name].var_cad40b46) {
        return;
    }
    self thread powerup_wobble_fx();
    while (isdefined(self)) {
        waittime = randomfloatrange(2.5, 5);
        yaw = randomint(360);
        if (yaw > 300) {
            yaw = 300;
        } else if (yaw < 60) {
            yaw = 60;
        }
        yaw = self.angles[1] + yaw;
        new_angles = (-60 + randomint(120), yaw, -45 + randomint(90));
        self rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        if (isdefined(self.worldgundw)) {
            self.worldgundw rotateto(new_angles, waittime, waittime * 0.5, waittime * 0.5);
        }
        wait(randomfloat(waittime - 0.1));
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xba7c1f9b, Offset: 0x57f8
// Size: 0x4c
function powerup_hide() {
    if (isdefined(self)) {
        self ghost();
        if (isdefined(self.worldgundw)) {
            self.worldgundw ghost();
        }
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x8bc6ce7, Offset: 0x5850
// Size: 0xd4
function powerup_show() {
    if (isdefined(self)) {
        self show();
        if (isdefined(self.worldgundw)) {
            self.worldgundw show();
        }
        if (isdefined(self.powerup_player)) {
            self setinvisibletoall();
            self setvisibletoplayer(self.powerup_player);
            if (isdefined(self.worldgundw)) {
                self.worldgundw setinvisibletoall();
                self.worldgundw setvisibletoplayer(self.powerup_player);
            }
        }
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x310ebf72, Offset: 0x5930
// Size: 0x18c
function powerup_timeout() {
    if (isdefined(level._powerup_timeout_override) && !isdefined(self.powerup_team)) {
        self thread [[ level._powerup_timeout_override ]]();
        return;
    }
    self endon(#"powerup_grabbed", #"death", #"powerup_reset");
    self powerup_show();
    wait_time = 15;
    if (isdefined(level.var_977f68ea)) {
        time = [[ level.var_977f68ea ]](self);
        if (time == 0) {
            return;
        }
        wait_time = time;
    }
    if (bgb::is_team_enabled(#"zm_bgb_temporal_gift")) {
        wait_time = wait_time + 30;
    }
    wait(wait_time);
    self hide_and_show(&powerup_hide, &powerup_show);
    self notify(#"powerup_timedout");
    bb::logpowerupevent(self, undefined, "_timedout");
    self powerup_delete();
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x1 linked
// Checksum 0x8e13f6c9, Offset: 0x5ac8
// Size: 0x9e
function hide_and_show(hide_func, show_func) {
    for (i = 0; i < 40; i++) {
        if (i % 2) {
            self [[ hide_func ]]();
        } else {
            self [[ show_func ]]();
        }
        if (i < 15) {
            wait(0.5);
            continue;
        }
        if (i < 25) {
            wait(0.25);
            continue;
        }
        wait(0.1);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x5800f037, Offset: 0x5b70
// Size: 0x6c
function powerup_delete() {
    if (isdefined(self)) {
        arrayremovevalue(level.active_powerups, self, 0);
        if (isdefined(self.worldgundw)) {
            self.worldgundw delete();
        }
        self delete();
    }
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x974d77b4, Offset: 0x5be8
// Size: 0x3c
function powerup_delete_delayed(time) {
    if (isdefined(time)) {
        wait(time);
    } else {
        wait(0.01);
    }
    self powerup_delete();
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x92764b6e, Offset: 0x5c30
// Size: 0x30
function function_bcfcc27e() {
    if (zm_utility::get_story() == 1) {
        return "zombie_pickup_perk_bottle";
    }
    return "p8_zm_powerup_free_perk_02";
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xa7a5c0a3, Offset: 0x5c68
// Size: 0xd6
function is_insta_kill_active() {
    if (isdefined(zombie_utility::function_6403cf83(#"zombie_insta_kill", self.team)) && zombie_utility::function_6403cf83(#"zombie_insta_kill", self.team) || isdefined(self zombie_utility::function_73061b82(#"zombie_insta_kill")) && self zombie_utility::function_73061b82(#"zombie_insta_kill") || isdefined(self.personal_instakill) && self.personal_instakill) {
        return true;
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 5, eflags: 0x1 linked
// Checksum 0x3e80541e, Offset: 0x5d48
// Size: 0x24e
function function_fe6d6eac(player, mod, hit_location, weapon, damage) {
    if (!("head" == hit_location || "helmet" == hit_location || "neck" == hit_location) && (isdefined(level.headshots_only) && level.headshots_only || zm_trial_headshots_only::is_active())) {
        return damage;
    }
    if (isdefined(player) && isalive(player) && isdefined(level.check_for_instakill_override)) {
        if (!self [[ level.check_for_instakill_override ]](player)) {
            return damage;
        }
        if (!(isdefined(self.no_gib) && self.no_gib)) {
            self zombie_utility::zombie_head_gib();
        }
        self.health = 1;
        return (self.health + 666);
    }
    if (isdefined(player) && isalive(player) && player is_insta_kill_active()) {
        if (zm_utility::is_magic_bullet_shield_enabled(self)) {
            return damage;
        }
        if (isdefined(self.instakill_func)) {
            b_result = self thread [[ self.instakill_func ]](player, mod, hit_location);
            if (isdefined(b_result) && b_result) {
                return damage;
            }
        }
        if (!level flag::get("special_round") && !(isdefined(self.no_gib) && self.no_gib)) {
            self zombie_utility::zombie_head_gib();
        }
        self.health = 1;
        return (self.health + 666);
    }
    return damage;
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x1 linked
// Checksum 0xd352035b, Offset: 0x5fa0
// Size: 0x20
function function_16c2586a(player, mod, shitloc) {
    return true;
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0xe6066bd, Offset: 0x5fc8
// Size: 0xb4
function point_doubler_on_hud(drop_item, player_team) {
    self endon(#"disconnect");
    if (zombie_utility::function_6403cf83(#"zombie_powerup_double_points_on", player_team)) {
        zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_time", player_team, 30);
        return;
    }
    zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_on", player_team, 1);
    level thread time_remaining_on_point_doubler_powerup(player_team);
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x9e6c0823, Offset: 0x6088
// Size: 0x1c4
function time_remaining_on_point_doubler_powerup(player_team) {
    temp_ent = spawn("script_origin", (0, 0, 0));
    temp_ent playloopsound(#"zmb_double_point_loop");
    while (zombie_utility::function_6403cf83(#"zombie_powerup_double_points_time", player_team) >= 0) {
        waitframe(1);
        zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_time", player_team, zombie_utility::function_6403cf83(#"zombie_powerup_double_points_time", player_team) - 0.05);
    }
    zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_on", player_team, 0);
    players = getplayers(player_team);
    for (i = 0; i < players.size; i++) {
        players[i] playsound(#"zmb_points_loop_off");
    }
    temp_ent stoploopsound(2);
    zombie_utility::function_c7ab6cbc(#"zombie_powerup_double_points_time", player_team, 30);
    temp_ent delete();
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x0
// Checksum 0xee480502, Offset: 0x6258
// Size: 0xc
function devil_dialog_delay() {
    wait(1);
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x697712ad, Offset: 0x6270
// Size: 0x34
function check_for_rare_drop_override(pos) {
    if (level flagsys::get(#"ape_round")) {
        return false;
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0xd5fbe430, Offset: 0x62b0
// Size: 0x72
function tesla_powerup_active() {
    players = getplayers();
    for (i = 0; i < players.size; i++) {
        if (players[i].zombie_vars[#"zombie_powerup_tesla_on"]) {
            return true;
        }
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0x16504af3, Offset: 0x6330
// Size: 0x194
function print_powerup_drop(powerup, type) {
    /#
        if (!isdefined(level.powerup_drop_time)) {
            level.powerup_drop_time = 0;
            level.powerup_random_count = 0;
            level.var_27b063df = 0;
        }
        time = (gettime() - level.powerup_drop_time) * 0.001;
        level.powerup_drop_time = gettime();
        if (type == "<unknown string>") {
            level.powerup_random_count++;
        } else {
            level.var_27b063df++;
        }
        println("<unknown string>");
        println("<unknown string>" + powerup);
        println("<unknown string>" + type);
        println("<unknown string>");
        println("<unknown string>" + time);
        println("<unknown string>");
        println("<unknown string>" + level.var_27b063df);
        println("<unknown string>");
    #/
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0xf534b13e, Offset: 0x64d0
// Size: 0x5e
function register_carpenter_node(node, callback) {
    if (!isdefined(level._additional_carpenter_nodes)) {
        level._additional_carpenter_nodes = [];
    }
    node._post_carpenter_callback = callback;
    level._additional_carpenter_nodes[level._additional_carpenter_nodes.size] = node;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x461e0d7, Offset: 0x6538
// Size: 0x6
function func_should_never_drop() {
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x2fd6754e, Offset: 0x6548
// Size: 0x8
function func_should_always_drop() {
    return true;
}

// Namespace zm_powerups/zm_powerups
// Params 0, eflags: 0x1 linked
// Checksum 0x90ac393b, Offset: 0x6558
// Size: 0x112
function powerup_emp() {
    self endon(#"powerup_timedout", #"powerup_grabbed");
    if (!zm_utility::should_watch_for_emp()) {
        return;
    }
    while (true) {
        waitresult = undefined;
        waitresult = level waittill(#"emp_detonate");
        if (distancesquared(waitresult.position, self.origin) < waitresult.radius * waitresult.radius) {
            playfx(level._effect[#"powerup_off"], self.origin);
            self thread powerup_delete_delayed();
            self notify(#"powerup_timedout");
        }
    }
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x1 linked
// Checksum 0xe4f557a2, Offset: 0x6678
// Size: 0xe6
function get_powerups(origin, radius) {
    if (isdefined(origin) && isdefined(radius)) {
        powerups = [];
        foreach (powerup in level.active_powerups) {
            if (distancesquared(origin, powerup.origin) < radius * radius) {
                powerups[powerups.size] = powerup;
            }
        }
        return powerups;
    }
    return level.active_powerups;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xf4bb06d8, Offset: 0x6768
// Size: 0xc6
function should_award_stat(powerup_name) {
    switch (powerup_name) {
    case #"blue_monkey":
    case #"bonus_points_player_shared":
    case #"teller_withdrawl":
    case #"wolf_bonus_hero_power":
    case #"wolf_bonus_ammo":
    case #"wolf_bonus_points":
        return false;
    }
    if (isdefined(level.zombie_statless_powerups) && isdefined(level.zombie_statless_powerups[powerup_name]) && level.zombie_statless_powerups[powerup_name]) {
        return false;
    }
    return true;
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x1 linked
// Checksum 0x7370b018, Offset: 0x6838
// Size: 0x34
function teller_withdrawl(powerup, player) {
    player zm_score::add_to_player_score(powerup.value);
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0xb2eb6cad, Offset: 0x6878
// Size: 0x62
function function_cfd04802(str_powerup) {
    if (isdefined(level.zombie_powerups[str_powerup]) && isdefined(level.zombie_powerups[str_powerup].only_affects_grabber) && level.zombie_powerups[str_powerup].only_affects_grabber) {
        return true;
    }
    return false;
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x3ca934e6, Offset: 0x68e8
// Size: 0x124
function function_5091b029(str_powerup) {
    self endon(#"disconnect");
    str_index_on = "zombie_powerup_" + str_powerup + "_on";
    str_index_time = "zombie_powerup_" + str_powerup + "_time";
    self zombie_utility::function_826f5e98(str_index_time, 30);
    if (self bgb::is_enabled(#"zm_bgb_temporal_gift")) {
        self zombie_utility::function_826f5e98(str_index_time, 60);
    }
    if (isdefined(self zombie_utility::function_73061b82(str_index_on)) && self zombie_utility::function_73061b82(str_index_on)) {
        return;
    }
    self zombie_utility::function_826f5e98(str_index_on, 1);
    self thread function_de41121d(str_powerup);
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x418e123d, Offset: 0x6a18
// Size: 0x164
function function_de41121d(str_powerup) {
    self endon(#"disconnect");
    str_index_on = "zombie_powerup_" + str_powerup + "_on";
    str_index_time = "zombie_powerup_" + str_powerup + "_time";
    str_sound_loop = "zmb_" + str_powerup + "_loop";
    str_sound_off = "zmb_" + str_powerup + "_loop_off";
    while (zombie_utility::function_73061b82(str_index_time) >= 0) {
        waitframe(1);
        self zombie_utility::function_826f5e98(str_index_time, zombie_utility::function_73061b82(str_index_time) - float(function_60d95f53()) / 1000);
    }
    self zombie_utility::function_826f5e98(str_index_on, 0);
    self playsoundtoplayer(str_sound_off, self);
    zombie_utility::function_826f5e98(str_index_time, 30);
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x1 linked
// Checksum 0xfb5cd029, Offset: 0x6b88
// Size: 0x144
function show_on_hud(player_team, str_powerup) {
    self endon(#"disconnect");
    str_index_on = "zombie_powerup_" + str_powerup + "_on";
    str_index_time = "zombie_powerup_" + str_powerup + "_time";
    if (zombie_utility::function_6403cf83(str_index_on, player_team)) {
        zombie_utility::function_c7ab6cbc(str_index_time, player_team, 30);
        if (bgb::is_team_enabled(#"zm_bgb_temporal_gift")) {
            zombie_utility::function_c7ab6cbc(str_index_time, player_team, zombie_utility::function_6403cf83(str_index_time, player_team) + 30);
        }
        return;
    }
    zombie_utility::function_c7ab6cbc(str_index_on, player_team, 1);
    level thread time_remaining_on_powerup(player_team, str_powerup);
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x1 linked
// Checksum 0x74531a47, Offset: 0x6cd8
// Size: 0x25c
function time_remaining_on_powerup(player_team, str_powerup) {
    str_index_on = "zombie_powerup_" + str_powerup + "_on";
    str_index_time = "zombie_powerup_" + str_powerup + "_time";
    str_sound_loop = "zmb_" + str_powerup + "_loop";
    str_sound_off = "zmb_" + str_powerup + "_loop_off";
    temp_ent = spawn("script_origin", (0, 0, 0));
    temp_ent playloopsound(str_sound_loop);
    if (bgb::is_team_enabled(#"zm_bgb_temporal_gift")) {
        zombie_utility::function_c7ab6cbc(str_index_time, player_team, zombie_utility::function_6403cf83(str_index_time, player_team) + 30);
    }
    while (zombie_utility::function_6403cf83(str_index_time, player_team) >= 0) {
        waitframe(1);
        zombie_utility::function_c7ab6cbc(str_index_time, player_team, zombie_utility::function_6403cf83(str_index_time, player_team) - 0.05);
    }
    zombie_utility::function_c7ab6cbc(str_index_on, player_team, 0);
    e_player = getplayers()[0];
    if (isplayer(e_player)) {
        e_player playsoundtoteam(str_sound_off, player_team);
    }
    temp_ent stoploopsound(2);
    zombie_utility::function_c7ab6cbc(str_index_time, player_team, 30);
    temp_ent delete();
}

// Namespace zm_powerups/zm_powerups
// Params 4, eflags: 0x0
// Checksum 0xdc724542, Offset: 0x6f40
// Size: 0x1dc
function weapon_powerup(ent_player, time, str_weapon, allow_cycling = 0) {
    str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
    str_weapon_time_over = str_weapon + "_time_over";
    ent_player notify(#"replace_weapon_powerup");
    ent_player._show_solo_hud = 1;
    ent_player.has_specific_powerup_weapon[str_weapon] = 1;
    ent_player.has_powerup_weapon = 1;
    ent_player zm_utility::increment_is_drinking();
    if (allow_cycling) {
        ent_player enableweaponcycling();
    }
    ent_player._zombie_weapon_before_powerup[str_weapon] = ent_player getcurrentweapon();
    ent_player giveweapon(level.zombie_powerup_weapon[str_weapon]);
    ent_player switchtoweapon(level.zombie_powerup_weapon[str_weapon]);
    ent_player.zombie_vars[str_weapon_on] = 1;
    level thread weapon_powerup_countdown(ent_player, str_weapon_time_over, time, str_weapon);
    level thread weapon_powerup_replace(ent_player, str_weapon_time_over, str_weapon);
    level thread weapon_powerup_change(ent_player, str_weapon_time_over, str_weapon);
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x1 linked
// Checksum 0x76abe0c, Offset: 0x7128
// Size: 0xe4
function weapon_powerup_change(ent_player, str_gun_return_notify, str_weapon) {
    ent_player endon(#"death", #"player_downed", str_gun_return_notify, #"replace_weapon_powerup");
    while (true) {
        waitresult = undefined;
        waitresult = ent_player waittill(#"weapon_change");
        if (waitresult.weapon != level.weaponnone && waitresult.weapon != level.zombie_powerup_weapon[str_weapon]) {
            break;
        }
    }
    level thread weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, 0);
}

// Namespace zm_powerups/zm_powerups
// Params 4, eflags: 0x1 linked
// Checksum 0x79f97b93, Offset: 0x7218
// Size: 0x12c
function weapon_powerup_countdown(ent_player, str_gun_return_notify, time, str_weapon) {
    ent_player endon(#"death", #"player_downed", str_gun_return_notify, #"replace_weapon_powerup");
    str_weapon_time = "zombie_powerup_" + str_weapon + "_time";
    ent_player.zombie_vars[str_weapon_time] = time;
    if (bgb::is_team_enabled(#"zm_bgb_temporal_gift")) {
        ent_player.zombie_vars[str_weapon_time] = ent_player.zombie_vars[str_weapon_time] + 30;
    }
    [[ level._custom_powerups[str_weapon].weapon_countdown ]](ent_player, str_weapon_time);
    level thread weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, 1);
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x1 linked
// Checksum 0x5570fb13, Offset: 0x7350
// Size: 0xec
function weapon_powerup_replace(ent_player, str_gun_return_notify, str_weapon) {
    ent_player endon(#"death", #"player_downed", str_gun_return_notify);
    str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
    ent_player waittill(#"replace_weapon_powerup");
    ent_player takeweapon(level.zombie_powerup_weapon[str_weapon]);
    ent_player.zombie_vars[str_weapon_on] = 0;
    ent_player.has_specific_powerup_weapon[str_weapon] = 0;
    ent_player.has_powerup_weapon = 0;
    ent_player zm_utility::decrement_is_drinking();
}

// Namespace zm_powerups/zm_powerups
// Params 4, eflags: 0x1 linked
// Checksum 0xbfdabc23, Offset: 0x7448
// Size: 0x134
function weapon_powerup_remove(ent_player, str_gun_return_notify, str_weapon, b_switch_back_weapon = 1) {
    ent_player endon(#"death", #"player_downed");
    str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
    ent_player takeweapon(level.zombie_powerup_weapon[str_weapon]);
    ent_player.zombie_vars[str_weapon_on] = 0;
    ent_player._show_solo_hud = 0;
    ent_player.has_specific_powerup_weapon[str_weapon] = 0;
    ent_player.has_powerup_weapon = 0;
    ent_player notify(str_gun_return_notify);
    ent_player zm_utility::decrement_is_drinking();
    if (b_switch_back_weapon) {
        ent_player zm_weapons::switch_back_primary_weapon(ent_player._zombie_weapon_before_powerup[str_weapon]);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x0
// Checksum 0xda128d3e, Offset: 0x7588
// Size: 0x152
function weapon_watch_gunner_downed(str_weapon) {
    str_notify = str_weapon + "_time_over";
    str_weapon_on = "zombie_powerup_" + str_weapon + "_on";
    if (!isdefined(self.has_specific_powerup_weapon) || !(isdefined(self.has_specific_powerup_weapon[str_weapon]) && self.has_specific_powerup_weapon[str_weapon])) {
        return;
    }
    primaryweapons = self getweaponslistprimaries();
    for (i = 0; i < primaryweapons.size; i++) {
        if (primaryweapons[i] == level.zombie_powerup_weapon[str_weapon]) {
            self takeweapon(level.zombie_powerup_weapon[str_weapon]);
        }
    }
    self notify(str_notify);
    self.zombie_vars[str_weapon_on] = 0;
    self._show_solo_hud = 0;
    waitframe(1);
    self.has_specific_powerup_weapon[str_weapon] = 0;
    self.has_powerup_weapon = 0;
}

// Namespace zm_powerups/zm_powerups
// Params 3, eflags: 0x1 linked
// Checksum 0x56aea89b, Offset: 0x76e8
// Size: 0xd6
function register_powerup(str_powerup, func_grab_powerup, func_setup) {
    /#
        assert(isdefined(str_powerup), "<unknown string>");
    #/
    _register_undefined_powerup(str_powerup);
    if (isdefined(func_grab_powerup)) {
        if (!isdefined(level._custom_powerups[str_powerup].grab_powerup)) {
            level._custom_powerups[str_powerup].grab_powerup = func_grab_powerup;
        }
    }
    if (isdefined(func_setup)) {
        if (!isdefined(level._custom_powerups[str_powerup].setup_powerup)) {
            level._custom_powerups[str_powerup].setup_powerup = func_setup;
        }
    }
}

// Namespace zm_powerups/zm_powerups
// Params 1, eflags: 0x1 linked
// Checksum 0x7effbcfa, Offset: 0x77c8
// Size: 0x7c
function _register_undefined_powerup(str_powerup) {
    if (!isdefined(level._custom_powerups)) {
        level._custom_powerups = [];
    }
    if (!isdefined(level._custom_powerups[str_powerup])) {
        level._custom_powerups[str_powerup] = spawnstruct();
        include_zombie_powerup(str_powerup);
    }
}

// Namespace zm_powerups/zm_powerups
// Params 2, eflags: 0x0
// Checksum 0x2439698d, Offset: 0x7850
// Size: 0x8e
function register_powerup_weapon(str_powerup, func_countdown) {
    /#
        assert(isdefined(str_powerup), "<unknown string>");
    #/
    _register_undefined_powerup(str_powerup);
    if (isdefined(func_countdown)) {
        if (!isdefined(level._custom_powerups[str_powerup].weapon_countdown)) {
            level._custom_powerups[str_powerup].weapon_countdown = func_countdown;
        }
    }
}

