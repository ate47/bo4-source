#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_cache_back;

// Namespace zm_bgb_cache_back/zm_bgb_cache_back
// Params 0, eflags: 0x2
// Checksum 0x8b1ba23, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_cache_back", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_cache_back/zm_bgb_cache_back
// Params 0, eflags: 0x0
// Checksum 0x57cc0a9e, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_cache_back", "activated");
}

