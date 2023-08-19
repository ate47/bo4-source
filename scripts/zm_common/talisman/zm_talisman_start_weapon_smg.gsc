// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.gsc;
#include scripts/zm_common/zm_stats.gsc;
#include scripts/zm_common/zm_talisman.gsc;
#include scripts/zm_common/zm_customgame.gsc;
#include scripts/zm_common/util.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/array_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace zm_talisman_start_weapon_smg;

// Namespace zm_talisman_start_weapon_smg/zm_talisman_start_weapon_smg
// Params 0, eflags: 0x2
// Checksum 0x877f5f58, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_start_weapon_smg", &__init__, undefined, undefined);
}

// Namespace zm_talisman_start_weapon_smg/zm_talisman_start_weapon_smg
// Params 0, eflags: 0x1 linked
// Checksum 0x78bf79cb, Offset: 0x120
// Size: 0x7c
function __init__() {
    if (!zm_custom::function_901b751c(#"zmweaponssmg") || !zm_custom::function_901b751c(#"zmstartingweaponenabled")) {
        return;
    }
    zm_talisman::register_talisman("talisman_start_weapon_smg", &activate_talisman);
}

// Namespace zm_talisman_start_weapon_smg/zm_talisman_start_weapon_smg
// Params 0, eflags: 0x1 linked
// Checksum 0x5a98d09e, Offset: 0x1a8
// Size: 0x1a
function activate_talisman() {
    self.var_8313fee5 = #"smg_accurate_t8";
}

