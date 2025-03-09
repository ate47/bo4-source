#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_perkaholic;

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x2
// Checksum 0x6d0b0c64, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_perkaholic", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_perkaholic/zm_bgb_perkaholic
// Params 0, eflags: 0x0
// Checksum 0x93190216, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_perkaholic", "activated");
}

