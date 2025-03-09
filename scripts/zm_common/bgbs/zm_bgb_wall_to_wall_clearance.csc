#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_wall_to_wall_clearance;

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x2
// Checksum 0x7aca2dcf, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_wall_to_wall_clearance", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_wall_to_wall_clearance/zm_bgb_wall_to_wall_clearance
// Params 0, eflags: 0x0
// Checksum 0x8ad24e46, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_wall_to_wall_clearance", "time");
}

