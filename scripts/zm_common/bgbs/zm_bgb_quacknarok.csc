#using scripts\zm_common\zm_utility.csc;
#using scripts\zm_common\zm_bgb.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;

#namespace zm_bgb_quacknarok;

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x2
// Checksum 0xdfd3900d, Offset: 0xa0
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_quacknarok", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_quacknarok/zm_bgb_quacknarok
// Params 0, eflags: 0x1 linked
// Checksum 0x2cb98a72, Offset: 0xf0
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_quacknarok", "time");
}

