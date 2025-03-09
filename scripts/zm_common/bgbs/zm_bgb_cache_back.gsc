#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_cache_back;

// Namespace zm_bgb_cache_back/zm_bgb_cache_back
// Params 0, eflags: 0x2
// Checksum 0x17fb2e02, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_cache_back", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_cache_back/zm_bgb_cache_back
// Params 0, eflags: 0x0
// Checksum 0x37db5098, Offset: 0xe0
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_cache_back", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_cache_back/zm_bgb_cache_back
// Params 0, eflags: 0x0
// Checksum 0xf39c9f02, Offset: 0x160
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("full_ammo", undefined, 96);
}

// Namespace zm_bgb_cache_back/zm_bgb_cache_back
// Params 0, eflags: 0x0
// Checksum 0xc090f3c7, Offset: 0x190
// Size: 0x1a
function validation() {
    return self bgb::function_9d8118f5();
}

