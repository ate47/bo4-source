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

#namespace zm_talisman_shield_durability_rare;

// Namespace zm_talisman_shield_durability_rare/zm_talisman_shield_durability_rare
// Params 0, eflags: 0x2
// Checksum 0x46be2d37, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_shield_durability_rare", &__init__, undefined, undefined);
}

// Namespace zm_talisman_shield_durability_rare/zm_talisman_shield_durability_rare
// Params 0, eflags: 0x1 linked
// Checksum 0x89fddea4, Offset: 0x120
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_shield_durability_rare", &activate_talisman);
}

// Namespace zm_talisman_shield_durability_rare/zm_talisman_shield_durability_rare
// Params 0, eflags: 0x1 linked
// Checksum 0xacde260b, Offset: 0x158
// Size: 0x12
function activate_talisman() {
    self.var_9c2026aa = 0.2;
}
