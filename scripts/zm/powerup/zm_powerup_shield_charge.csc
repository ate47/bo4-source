// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_powerups.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_powerup_shield_charge;

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 0, eflags: 0x2
// Checksum 0x32e4c348, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_shield_charge", &__init__, undefined, undefined);
}

// Namespace zm_powerup_shield_charge/zm_powerup_shield_charge
// Params 0, eflags: 0x0
// Checksum 0x613b6647, Offset: 0xd8
// Size: 0x34
function __init__() {
    zm_powerups::include_zombie_powerup("shield_charge");
    zm_powerups::add_zombie_powerup("shield_charge");
}

