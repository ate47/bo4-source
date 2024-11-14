#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_dead_of_nuclear_winter;

// Namespace zm_bgb_dead_of_nuclear_winter/zm_bgb_dead_of_nuclear_winter
// Params 0, eflags: 0x2
// Checksum 0x3717d72c, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_dead_of_nuclear_winter", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_dead_of_nuclear_winter/zm_bgb_dead_of_nuclear_winter
// Params 0, eflags: 0x1 linked
// Checksum 0x234e0126, Offset: 0xe0
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_dead_of_nuclear_winter", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_dead_of_nuclear_winter/zm_bgb_dead_of_nuclear_winter
// Params 0, eflags: 0x1 linked
// Checksum 0xd1b33afb, Offset: 0x160
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("nuke", undefined, 96);
}

// Namespace zm_bgb_dead_of_nuclear_winter/zm_bgb_dead_of_nuclear_winter
// Params 0, eflags: 0x1 linked
// Checksum 0xb8b055db, Offset: 0x190
// Size: 0x1a
function validation() {
    return self bgb::function_9d8118f5();
}

