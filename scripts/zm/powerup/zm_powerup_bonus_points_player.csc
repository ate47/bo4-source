// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_bonus_points_player;

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 0, eflags: 0x2
// Checksum 0x87d859ec, Offset: 0xb8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_bonus_points_player", &__init__, undefined, undefined);
}

// Namespace zm_powerup_bonus_points_player/zm_powerup_bonus_points_player
// Params 0, eflags: 0x1 linked
// Checksum 0xb04a5614, Offset: 0x100
// Size: 0x64
function __init__() {
    zm_powerups::include_zombie_powerup("bonus_points_player");
    zm_powerups::add_zombie_powerup("bonus_points_player");
    zm_powerups::include_zombie_powerup("bonus_points_player_shared");
    zm_powerups::add_zombie_powerup("bonus_points_player_shared");
}

