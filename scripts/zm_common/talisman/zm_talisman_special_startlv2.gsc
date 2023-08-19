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

#namespace zm_talisman_special_startlv2;

// Namespace zm_talisman_special_startlv2/zm_talisman_special_startlv2
// Params 0, eflags: 0x2
// Checksum 0xf62a7268, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"zm_talisman_special_startlv2", &__init__, undefined, undefined);
}

// Namespace zm_talisman_special_startlv2/zm_talisman_special_startlv2
// Params 0, eflags: 0x1 linked
// Checksum 0x98587b2, Offset: 0x118
// Size: 0x2c
function __init__() {
    zm_talisman::register_talisman("talisman_special_startlv2", &activate_talisman);
}

// Namespace zm_talisman_special_startlv2/zm_talisman_special_startlv2
// Params 0, eflags: 0x1 linked
// Checksum 0x5d45eb76, Offset: 0x150
// Size: 0x12
function activate_talisman() {
    self.talisman_special_startlv2 = 1;
}

