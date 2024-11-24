#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_bgb;

#namespace zm_bgb_licensed_contractor;

// Namespace zm_bgb_licensed_contractor/zm_bgb_licensed_contractor
// Params 0, eflags: 0x2
// Checksum 0x90c12c2c, Offset: 0x90
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"zm_bgb_licensed_contractor", &__init__, undefined, #"bgb");
}

// Namespace zm_bgb_licensed_contractor/zm_bgb_licensed_contractor
// Params 0, eflags: 0x1 linked
// Checksum 0xa5ed927e, Offset: 0xe0
// Size: 0x74
function __init__() {
    if (!(isdefined(level.bgb_in_use) && level.bgb_in_use)) {
        return;
    }
    bgb::register(#"zm_bgb_licensed_contractor", "activated", 1, undefined, undefined, &validation, &activation);
}

// Namespace zm_bgb_licensed_contractor/zm_bgb_licensed_contractor
// Params 0, eflags: 0x1 linked
// Checksum 0x6ab0ccfd, Offset: 0x160
// Size: 0x24
function activation() {
    self thread bgb::function_c6cd71d5("carpenter", undefined, 96);
}

// Namespace zm_bgb_licensed_contractor/zm_bgb_licensed_contractor
// Params 0, eflags: 0x1 linked
// Checksum 0x4dc1d2c5, Offset: 0x190
// Size: 0x1a
function validation() {
    return self bgb::function_9d8118f5();
}

