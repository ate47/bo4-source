#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_dead_of_nuclear_winter;

// Namespace zm_bgb_dead_of_nuclear_winter/zm_bgb_dead_of_nuclear_winter
// Params 0, eflags: 0x2
// Checksum 0xc902d090, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_dead_of_nuclear_winter", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_dead_of_nuclear_winter/zm_bgb_dead_of_nuclear_winter
// Params 0, eflags: 0x1 linked
// Checksum 0xed8d79e, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_dead_of_nuclear_winter", "activated");
}

