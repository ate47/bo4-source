// Atian COD Tools GSC decompiler test
#using scripts\zm_common\zm_bgb.csc;
#using scripts\core_common\system_shared.csc;

#namespace zm_bgb_anywhere_but_here;

// Namespace zm_bgb_anywhere_but_here/zm_bgb_anywhere_but_here
// Params 0, eflags: 0x2
// Checksum 0xada2a297, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_anywhere_but_here", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_anywhere_but_here/zm_bgb_anywhere_but_here
// Params 0, eflags: 0x1 linked
// Checksum 0x402dc608, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_anywhere_but_here", "activated");
}

