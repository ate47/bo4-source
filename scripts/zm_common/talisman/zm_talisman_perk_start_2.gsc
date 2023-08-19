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

#namespace zm_talisman_perk_start_2;

// Namespace zm_talisman_perk_start_2/zm_talisman_perk_start_2
// Params 0, eflags: 0x2
// Checksum 0xbe317791, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_perk_start_2", &__init__, undefined, undefined);
}

// Namespace zm_talisman_perk_start_2/zm_talisman_perk_start_2
// Params 0, eflags: 0x1 linked
// Checksum 0x60c70caa, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_perk_start_2", &activate_talisman);
}

// Namespace zm_talisman_perk_start_2/zm_talisman_perk_start_2
// Params 0, eflags: 0x1 linked
// Checksum 0x58fe67cc, Offset: 0x150
// Size: 0x46
function activate_talisman() {
    if (isdefined(self.var_c27f1e90) && zm_custom::function_d9f0defb(self.var_c27f1e90[1])) {
        self.talisman_perk_start_2 = 1;
    }
}

