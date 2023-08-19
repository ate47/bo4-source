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

#namespace zm_talisman_perk_mod_single;

// Namespace zm_talisman_perk_mod_single/zm_talisman_perk_mod_single
// Params 0, eflags: 0x2
// Checksum 0x137fb1c6, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_mod_single", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_mod_single/zm_talisman_perk_mod_single
// Params 0, eflags: 0x1 linked
// Checksum 0x859fbf53, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_mod_single", &activate_talisman);
}

// Namespace zm_talisman_perk_mod_single/zm_talisman_perk_mod_single
// Params 0, eflags: 0x1 linked
// Checksum 0x1d762c83, Offset: 0x150
// Size: 0x12
function activate_talisman() {
    self.talisman_perk_mod_single = 1;
}

