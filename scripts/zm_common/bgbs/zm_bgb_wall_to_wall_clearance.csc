// Atian COD Tools GSC decompiler test
#include scripts/zm_common/zm_bgb.csc;
#include scripts/core_common/system_shared.csc;

#namespace zm_bgb_wall_to_wall_clearance;

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x2
// Checksum 0x7aca2dcf, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_wall_to_wall_clearance", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x1 linked
// Checksum 0x8ad24e46, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_wall_to_wall_clearance", "time");
}
