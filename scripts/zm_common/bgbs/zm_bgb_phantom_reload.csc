#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_phantom_reload;

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x2
// Checksum 0xa9753b38, Offset: 0x80
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_phantom_reload", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_phantom_reload/zm_bgb_phantom_reload
// Params 0, eflags: 0x1 linked
// Checksum 0x4c1266de, Offset: 0xd0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_phantom_reload", "time");
}

