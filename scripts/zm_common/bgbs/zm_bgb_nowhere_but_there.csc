// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_bgb_nowhere_but_there;

// Namespace zm_bgb_nowhere_but_there/zm_bgb_nowhere_but_there
// Params 0, eflags: 0x2
// Checksum 0xcd8539b9, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_nowhere_but_there", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_nowhere_but_there/zm_bgb_nowhere_but_there
// Params 0, eflags: 0x1 linked
// Checksum 0x11dbc36d, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_nowhere_but_there", "activated");
}

