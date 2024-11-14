#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_powerups;
#using scripts\core_common\system_shared;

#namespace zm_powerup_bonus_points_team;

// Namespace zm_powerup_bonus_points_team/zm_powerup_bonus_points_team
// Params 0, eflags: 0x2
// Checksum 0xd51b5d1d, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_bonus_points_team", &__init__, undefined, undefined);
}

// Namespace zm_powerup_bonus_points_team/zm_powerup_bonus_points_team
// Params 0, eflags: 0x1 linked
// Checksum 0xa17aa717, Offset: 0x120
// Size: 0x84
function __init__() {
    zm_powerups::register_powerup("bonus_points_team", &grab_bonus_points_team);
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("bonus_points_team", "zombie_z_money_icon", #"zombie_powerup_bonus_points", &zm_powerups::func_should_always_drop, 0, 0, 0);
    }
}

// Namespace zm_powerup_bonus_points_team/zm_powerup_bonus_points_team
// Params 1, eflags: 0x1 linked
// Checksum 0x64988313, Offset: 0x1b0
// Size: 0x44
function grab_bonus_points_team(player) {
    level thread bonus_points_team_powerup(self, player);
    player thread zm_powerups::powerup_vo("bonus");
}

// Namespace zm_powerup_bonus_points_team/zm_powerup_bonus_points_team
// Params 2, eflags: 0x1 linked
// Checksum 0xc87018a7, Offset: 0x200
// Size: 0x120
function bonus_points_team_powerup(item, player) {
    if (isdefined(level.var_a4c782b9) && level.var_a4c782b9) {
        points = randomintrange(2, 11) * 100;
    } else {
        points = 500;
    }
    if (isdefined(level.bonus_points_powerup_override)) {
        points = item [[ level.bonus_points_powerup_override ]](player);
    }
    foreach (e_player in level.players) {
        e_player zm_score::player_add_points("bonus_points_powerup", points, undefined, undefined, undefined, undefined, 1);
    }
}

