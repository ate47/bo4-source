#using scripts\zm_common\zm_powerups.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_powerup_free_perk;

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 0, eflags: 0x2
// Checksum 0x717eb741, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_free_perk", &__init__, undefined, undefined);
}

// Namespace zm_powerup_free_perk/zm_powerup_free_perk
// Params 0, eflags: 0x1 linked
// Checksum 0xdda77651, Offset: 0xd8
// Size: 0x34
function __init__() {
    zm_powerups::include_zombie_powerup("free_perk");
    zm_powerups::add_zombie_powerup("free_perk");
}

