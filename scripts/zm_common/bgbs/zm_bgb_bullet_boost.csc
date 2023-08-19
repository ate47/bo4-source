// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_utility.csc;
#include scripts/zm_common/zm_bgb.csc;
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/struct.csc;

#namespace zm_bgb_bullet_boost;

// Namespace zm_bgb_bullet_boost/zm_bgb_bullet_boost
// Params 0, eflags: 0x2
// Checksum 0xce68c6f9, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_bullet_boost", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_bullet_boost/zm_bgb_bullet_boost
// Params 0, eflags: 0x1 linked
// Checksum 0x996ba634, Offset: 0xf8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_bullet_boost", "activated");
}

