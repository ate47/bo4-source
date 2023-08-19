// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_powerups.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_powerup_bonus_points_team;

// Namespace zm_powerup_bonus_points_team/zm_powerup_bonus_points_team
// Params 0, eflags: 0x2
// Checksum 0x60911f2a, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_bonus_points_team", &__init__, undefined, undefined);
}

// Namespace zm_powerup_bonus_points_team/zm_powerup_bonus_points_team
// Params 0, eflags: 0x1 linked
// Checksum 0xa3cb909e, Offset: 0xe0
// Size: 0x34
function __init__() {
    zm_powerups::include_zombie_powerup("bonus_points_team");
    zm_powerups::add_zombie_powerup("bonus_points_team");
}

