#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_bgb;
#using scripts\zm_common\zm_utility;

#namespace zm_bgb_phoenix_up;

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 0, eflags: 0x2
// Checksum 0x54f4d990, Offset: 0xa8
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_phoenix_up", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_phoenix_up/zm_bgb_phoenix_up
// Params 0, eflags: 0x1 linked
// Checksum 0x7d5d6d0c, Offset: 0xf8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_phoenix_up", "activated");
}

