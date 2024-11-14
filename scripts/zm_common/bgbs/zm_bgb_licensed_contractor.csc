#using scripts\zm_common\zm_bgb;
#using scripts\core_common\system_shared;

#namespace zm_bgb_licensed_contractor;

// Namespace zm_bgb_licensed_contractor/zm_bgb_licensed_contractor
// Params 0, eflags: 0x2
// Checksum 0x455dd295, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_licensed_contractor", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_licensed_contractor/zm_bgb_licensed_contractor
// Params 0, eflags: 0x1 linked
// Checksum 0xe462710e, Offset: 0xd8
// Size: 0x4c
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_licensed_contractor", "activated");
}

