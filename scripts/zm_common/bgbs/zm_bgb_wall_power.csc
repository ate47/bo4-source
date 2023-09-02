// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_bgb_wall_power;

// Namespace zm_bgb_wall_power/zm_bgb_wall_power
// Params 0, eflags: 0x2
// Checksum 0x4644fed6, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_wall_power", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_wall_power/zm_bgb_wall_power
// Params 0, eflags: 0x1 linked
// Checksum 0x45684dd6, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_wall_power", "event");
}

