// Atian COD Tools GSC decompiler test
#include scripts/core_common/player/player_stats.gsc;
#include scripts/wz_common/character_unlock_fixup.gsc;
#include scripts/wz_common/character_unlock.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;

#namespace character_unlock_outrider;

// Namespace character_unlock_outrider/character_unlock_outrider
// Params 0, eflags: 0x2
// Checksum 0x5059fca9, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"character_unlock_outrider", &__init__, undefined, #"character_unlock_outrider_fixup");
}

// Namespace character_unlock_outrider/character_unlock_outrider
// Params 0, eflags: 0x1 linked
// Checksum 0x2f57908d, Offset: 0xe0
// Size: 0x34
function __init__() {
    character_unlock_fixup::function_90ee7a97(#"outrider_unlock", &function_2613aeec);
}

// Namespace character_unlock_outrider/character_unlock_outrider
// Params 1, eflags: 0x1 linked
// Checksum 0x3f8e31f7, Offset: 0x120
// Size: 0x74
function function_2613aeec(enabled) {
    if (enabled) {
        callback::add_callback(#"hash_7a9bdd3ee0ae95af", &function_c915e2a7);
        callback::add_callback(#"hash_48bcdfea6f43fecb", &function_1c4b5097);
    }
}

// Namespace character_unlock_outrider/character_unlock_outrider
// Params 1, eflags: 0x1 linked
// Checksum 0x4ea6b22d, Offset: 0x1a0
// Size: 0xc4
function function_1c4b5097(item) {
    var_a6762160 = item.var_a6762160;
    if (var_a6762160.name === #"cu33_item") {
        if (self character_unlock::function_f0406288(#"outrider_unlock")) {
            if (self stats::get_stat_global(#"hash_35020c395a89befb") >= 25) {
                self character_unlock::function_c8beca5e(#"outrider_unlock", #"hash_28966e441535b733", 1);
            }
        }
    }
}

// Namespace character_unlock_outrider/character_unlock_outrider
// Params 0, eflags: 0x1 linked
// Checksum 0xe09047c6, Offset: 0x270
// Size: 0x84
function function_c915e2a7() {
    if (self character_unlock::function_f0406288(#"outrider_unlock")) {
        if (self stats::get_stat_global(#"hash_35020c395a89befb") >= 25) {
            self character_unlock::function_c8beca5e(#"outrider_unlock", #"hash_28966e441535b733", 1);
        }
    }
}

