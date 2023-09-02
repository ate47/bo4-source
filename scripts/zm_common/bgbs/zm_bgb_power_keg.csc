// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_bgb_power_keg;

// Namespace zm_bgb_power_keg/zm_bgb_power_keg
// Params 0, eflags: 0x2
// Checksum 0x1664d62e, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_power_keg", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_power_keg/zm_bgb_power_keg
// Params 0, eflags: 0x1 linked
// Checksum 0x82dda024, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_power_keg", "activated");
}

