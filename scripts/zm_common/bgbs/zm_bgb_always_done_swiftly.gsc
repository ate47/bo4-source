#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;
#using scripts\core_common\perks;

#namespace zm_bgb_always_done_swiftly;

// Namespace zm_bgb_always_done_swiftly/zm_bgb_always_done_swiftly
// Params 0, eflags: 0x2
// Checksum 0x73f498b2, Offset: 0xb0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_always_done_swiftly", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_always_done_swiftly/zm_bgb_always_done_swiftly
// Params 0, eflags: 0x1 linked
// Checksum 0xc9b150d3, Offset: 0x100
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_always_done_swiftly", "time", 300, &enable, &disable, undefined);
}

// Namespace zm_bgb_always_done_swiftly/zm_bgb_always_done_swiftly
// Params 0, eflags: 0x1 linked
// Checksum 0xc48deecc, Offset: 0x180
// Size: 0x44
function enable() {
    self perks::perk_setperk("specialty_fastads");
    self perks::perk_setperk("specialty_stalker");
}

// Namespace zm_bgb_always_done_swiftly/zm_bgb_always_done_swiftly
// Params 0, eflags: 0x1 linked
// Checksum 0xf7c5bb70, Offset: 0x1d0
// Size: 0x44
function disable() {
    self perks::perk_unsetperk("specialty_fastads");
    self perks::perk_unsetperk("specialty_stalker");
}

