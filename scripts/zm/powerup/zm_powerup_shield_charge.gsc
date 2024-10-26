#using scripts\zm_common\zm_weapons.gsc;
#using scripts\zm_common\zm_utility.gsc;
#using scripts\zm_common\zm_spawner.gsc;
#using scripts\zm_common\zm_score.gsc;
#using scripts\zm_common\zm_powerups.gsc;
#using scripts\zm_common\zm_melee_weapon.gsc;
#using scripts\zm_common\zm_devgui.gsc;
#using scripts\zm_common\zm_blockers.gsc;
#using scripts\core_common\ai\zombie_utility.gsc;
#using scripts\core_common\ai\zombie_death.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\system_shared.gsc;
#using scripts\core_common\laststand_shared.gsc;
#using scripts\core_common\hud_util_shared.gsc;
#using scripts\core_common\flagsys_shared.gsc;
#using scripts\core_common\flag_shared.gsc;
#using scripts\core_common\clientfield_shared.gsc;
#using scripts\core_common\struct.gsc;

#namespace zm_powerup_shield_charge;

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 0, eflags: 0x2
// Checksum 0x1dfb24f5, Offset: 0x128
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_shield_charge", &__init__, undefined, undefined);
}

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 0, eflags: 0x0
// Checksum 0xbe5d7a42, Offset: 0x170
// Size: 0xb4
function __init__() {
    zm_powerups::register_powerup("shield_charge", &grab_shield_charge);
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("shield_charge", "p7_zm_zod_nitrous_tank", #"hash_3f5e4aa38f9aeba5", &func_drop_when_players_own, 1, 0, 0);
        zm_powerups::powerup_set_statless_powerup("shield_charge");
    }
    /#
        thread shield_devgui();
    #/
}

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 0, eflags: 0x0
// Checksum 0x58491ac3, Offset: 0x230
// Size: 0x6
function func_drop_when_players_own() {
    return false;
}

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 1, eflags: 0x0
// Checksum 0x3f5903ca, Offset: 0x240
// Size: 0x24
function grab_shield_charge(player) {
    level thread shield_charge_powerup(self, player);
}

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 2, eflags: 0x0
// Checksum 0x6836a2c5, Offset: 0x270
// Size: 0x74
function shield_charge_powerup(item, player) {
    if (isdefined(player.hasriotshield) && player.hasriotshield) {
        player givestartammo(player.weaponriotshield);
    }
    level thread shield_on_hud(item, player.team);
}

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 2, eflags: 0x0
// Checksum 0x649ba3e1, Offset: 0x2f0
// Size: 0x13c
function shield_on_hud(drop_item, player_team) {
    /#
        self endon(#"disconnect");
        hudelem = hud::function_f5a689d("<dev string:x38>", 2);
        hudelem hud::setpoint("<dev string:x44>", undefined, 0, zombie_utility::get_zombie_var(#"zombie_timer_offset") - zombie_utility::get_zombie_var(#"zombie_timer_offset_interval") * 2);
        hudelem.sort = 0.5;
        hudelem.alpha = 0;
        hudelem fadeovertime(0.5);
        hudelem.alpha = 1;
        if (isdefined(drop_item)) {
            hudelem.label = drop_item.hint;
        }
        hudelem thread full_ammo_move_hud(player_team);
    #/
}

/#

    // Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
    // Params 1, eflags: 0x0
    // Checksum 0x72c09469, Offset: 0x438
    // Size: 0xd4
    function full_ammo_move_hud(player_team) {
        players = getplayers(player_team);
        players[0] playsoundtoteam("<dev string:x4a>", player_team);
        wait 0.5;
        move_fade_time = 1.5;
        self fadeovertime(move_fade_time);
        self moveovertime(move_fade_time);
        self.y = 270;
        self.alpha = 0;
        wait move_fade_time;
        self destroy();
    }

    // Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
    // Params 0, eflags: 0x0
    // Checksum 0x889aec02, Offset: 0x518
    // Size: 0x7c
    function shield_devgui() {
        level flagsys::wait_till("<dev string:x5a>");
        wait 1;
        zm_devgui::add_custom_devgui_callback(&shield_devgui_callback);
        adddebugcommand("<dev string:x75>");
        adddebugcommand("<dev string:xc8>");
    }

    // Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
    // Params 1, eflags: 0x0
    // Checksum 0x1fc5d4a3, Offset: 0x5a0
    // Size: 0xc8
    function shield_devgui_callback(cmd) {
        players = getplayers();
        retval = 0;
        switch (cmd) {
        case #"shield_charge":
            zm_devgui::zombie_devgui_give_powerup(cmd, 1);
            break;
        case #"next_shield_charge":
            zm_devgui::zombie_devgui_give_powerup(getsubstr(cmd, 5), 0);
            break;
        }
        return retval;
    }

#/
