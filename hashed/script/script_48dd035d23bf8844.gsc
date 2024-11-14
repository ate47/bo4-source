#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_net;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\struct;
#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;

#namespace namespace_456de992;

// Namespace namespace_456de992/namespace_456de992
// Params 0, eflags: 0x1 linked
// Checksum 0xc1b1b179, Offset: 0x260
// Size: 0x2c
function init() {
    init_flags();
    level thread perks_behind_door();
}

// Namespace namespace_456de992/namespace_456de992
// Params 0, eflags: 0x1 linked
// Checksum 0xc724de7d, Offset: 0x298
// Size: 0x44
function init_flags() {
    level flag::init("magic_door_power_up_grabbed");
    level flag::init("population_count_step_complete");
}

// Namespace namespace_456de992/namespace_456de992
// Params 4, eflags: 0x1 linked
// Checksum 0x7b0da623, Offset: 0x2e8
// Size: 0x13a
function door_powerup_drop(powerup_name, var_e3a28454, powerup_team, powerup_location) {
    if (isdefined(level.door_powerup)) {
        level.door_powerup zm_powerups::powerup_delete();
    }
    powerup = zm_net::network_safe_spawn("powerup", 1, "script_model", var_e3a28454 + (0, 0, 40));
    powerup setmodel(#"tag_origin");
    level notify(#"powerup_dropped", powerup);
    if (isdefined(powerup)) {
        powerup.grabbed_level_notify = #"magic_door_power_up_grabbed";
        powerup function_94cd396e(powerup_name, powerup_team, var_e3a28454);
        powerup thread zm_powerups::powerup_wobble();
        powerup thread zm_powerups::powerup_grab(powerup_team);
        level.door_powerup = powerup;
    }
}

// Namespace namespace_456de992/namespace_456de992
// Params 0, eflags: 0x1 linked
// Checksum 0xbe3bcb39, Offset: 0x430
// Size: 0x300
function perks_behind_door() {
    if (level.enable_magic !== 1) {
        return;
    }
    if (!zm_custom::function_901b751c("zmPowerupsActive") || zm_custom::function_901b751c("zmPowerupsIsLimitedRound") || !zm_custom::function_901b751c("zmPowerupNuke") || !zm_custom::function_901b751c("zmPowerupDouble") || !zm_custom::function_901b751c("zmPowerupInstakill") || !zm_custom::function_901b751c("zmPowerupFireSale") || !zm_custom::function_901b751c("zmPowerupMaxAmmo")) {
        return;
    }
    level endon(#"magic_door_power_up_grabbed", #"population_count_step_complete");
    level thread powerup_grabbed_watcher();
    level flag::wait_till("initial_blackscreen_passed");
    level.var_2cc90a51 = [];
    level.var_2cc90a51[0] = "nuke";
    level.var_2cc90a51[1] = "double_points";
    level.var_2cc90a51[2] = "insta_kill";
    level.var_2cc90a51[3] = "fire_sale";
    level.var_2cc90a51[4] = "full_ammo";
    index = 0;
    level.ammodrop = struct::get("zm_nuked_ammo_drop", "script_noteworthy");
    level.perk_type = level.var_2cc90a51[index];
    index++;
    door_powerup_drop(level.perk_type, level.ammodrop.origin);
    while (true) {
        level waittill(#"nuke_clock_moved");
        if (index == level.var_2cc90a51.size) {
            index = 0;
        }
        level.perk_type = level.var_2cc90a51[index];
        index++;
        door_powerup_drop(level.perk_type, level.ammodrop.origin);
    }
}

// Namespace namespace_456de992/namespace_456de992
// Params 0, eflags: 0x1 linked
// Checksum 0xaea8966a, Offset: 0x738
// Size: 0x3c
function powerup_grabbed_watcher() {
    level waittill(#"magic_door_power_up_grabbed");
    level flag::set(#"magic_door_power_up_grabbed");
}

// Namespace namespace_456de992/namespace_456de992
// Params 6, eflags: 0x1 linked
// Checksum 0xb1f698d5, Offset: 0x780
// Size: 0x3d4
function function_94cd396e(powerup_override, powerup_team, powerup_location, powerup_player, shouldplaysound = 1, var_a6d11a96) {
    str_powerup = undefined;
    if (!isdefined(powerup_override)) {
        str_powerup = zm_powerups::get_valid_powerup();
    } else {
        str_powerup = powerup_override;
        if ("tesla" == str_powerup && zm_powerups::tesla_powerup_active()) {
            str_powerup = "minigun";
        }
    }
    struct = level.zombie_powerups[str_powerup];
    if (isdefined(powerup_team)) {
        self.powerup_team = powerup_team;
    }
    if (isdefined(powerup_location)) {
        self.powerup_location = powerup_location;
    }
    if (isdefined(powerup_player)) {
        self.powerup_player = powerup_player;
    } else {
        assert(!(isdefined(struct.player_specific) && struct.player_specific), "<dev string:x38>");
    }
    self.powerup_name = struct.powerup_name;
    self.hint = struct.hint;
    self.only_affects_grabber = struct.only_affects_grabber;
    self.any_team = struct.any_team;
    self.zombie_grabbable = struct.zombie_grabbable;
    self.func_should_drop_with_regular_powerups = struct.func_should_drop_with_regular_powerups;
    if (isdefined(level._custom_powerups) && isdefined(level._custom_powerups[str_powerup]) && isdefined(level._custom_powerups[str_powerup].setup_powerup)) {
        self [[ level._custom_powerups[str_powerup].setup_powerup ]]();
    } else {
        self zm_powerups::function_76678c8d(powerup_location, struct.model_name, var_a6d11a96);
    }
    if (isdefined(struct.fx)) {
        self.fx = struct.fx;
    }
    if (isdefined(struct.can_pick_up_in_last_stand)) {
        self.can_pick_up_in_last_stand = struct.can_pick_up_in_last_stand;
    }
    var_b9dc5e9 = isdefined(struct.var_184f74ef) ? struct.var_184f74ef : 0;
    if (!(isdefined(var_b9dc5e9) && var_b9dc5e9)) {
        if ((str_powerup == "bonus_points_player" || str_powerup == "bonus_points_player_shared") && zm_utility::is_standard()) {
            self playsound(#"hash_1229e9d60b3181ef");
            self playloopsound(#"hash_46b9bf1ae523021c");
        } else {
            self playsound(#"zmb_spawn_powerup");
            self playloopsound(#"zmb_spawn_powerup_loop");
        }
    }
    level.active_powerups[level.active_powerups.size] = self;
    self thread zm_powerups::function_14b7208c(str_powerup, powerup_team, powerup_location, powerup_player);
}

