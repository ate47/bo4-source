// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_powerups.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_powerup_fire_sale;

// Namespace zm_powerup_fire_sale/zm_powerup_fire_sale
// Params 0, eflags: 0x2
// Checksum 0x9c63930e, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_powerup_fire_sale", &__init__, undefined, undefined);
}

// Namespace zm_powerup_fire_sale/zm_powerup_fire_sale
// Params 0, eflags: 0x1 linked
// Checksum 0x15aa3cad, Offset: 0xe8
// Size: 0x4c
function __init__() {
    zm_powerups::include_zombie_powerup("fire_sale");
    if (zm_powerups::function_cc33adc8()) {
        zm_powerups::add_zombie_powerup("fire_sale", "powerup_fire_sale");
    }
}

