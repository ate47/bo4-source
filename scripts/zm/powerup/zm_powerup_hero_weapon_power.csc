#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_powerups;

#namespace zm_powerup_hero_weapon_power;

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 0, eflags: 0x2
// Checksum 0xcf6bfdc, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_hero_weapon_power", &__init__, undefined, undefined);
}

// Namespace zm_powerup_hero_weapon_power/zm_powerup_hero_weapon_power
// Params 0, eflags: 0x1 linked
// Checksum 0x6b30e786, Offset: 0xe0
// Size: 0x34
function __init__() {
    zm_powerups::include_zombie_powerup("hero_weapon_power");
    zm_powerups::add_zombie_powerup("hero_weapon_power");
}

