#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_kill_joy;

// Namespace zm_bgb_kill_joy/zm_bgb_kill_joy
// Params 0, eflags: 0x2
// Checksum 0xfec88a53, Offset: 0x98
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_kill_joy", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_kill_joy/zm_bgb_kill_joy
// Params 0, eflags: 0x1 linked
// Checksum 0x9dcd3860, Offset: 0xe8
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_kill_joy", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_kill_joy/zm_bgb_kill_joy
// Params 0, eflags: 0x1 linked
// Checksum 0x1c5a78ce, Offset: 0x168
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("insta_kill", undefined, 96);
}

// Namespace zm_bgb_kill_joy/zm_bgb_kill_joy
// Params 0, eflags: 0x1 linked
// Checksum 0xad6b77e3, Offset: 0x198
// Size: 0x1a
function validation() {
    return self bgb::function_9d8118f5();
}

