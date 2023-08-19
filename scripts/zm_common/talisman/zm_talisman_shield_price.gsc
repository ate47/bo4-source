// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_talisman.gsc;
#include scripts/zm_common/util.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace zm_talisman_shield_price;

// Namespace zm_talisman_shield_price/zm_talisman_shield_price
// Params 0, eflags: 0x2
// Checksum 0x1fac61cf, Offset: 0xc8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_shield_price", &__init__, undefined, undefined);
}

// Namespace zm_talisman_shield_price/zm_talisman_shield_price
// Params 0, eflags: 0x1 linked
// Checksum 0x97c9c639, Offset: 0x110
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_shield_price", &activate_talisman);
}

// Namespace zm_talisman_shield_price/zm_talisman_shield_price
// Params 0, eflags: 0x1 linked
// Checksum 0x7c72daed, Offset: 0x148
// Size: 0x12
function activate_talisman() {
    self.talisman_shield_price = 500;
}

