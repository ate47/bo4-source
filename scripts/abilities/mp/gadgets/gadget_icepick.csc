#using scripts\core_common\util_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\abilities\gadgets\gadget_icepick_shared;

#namespace jammer;

// Namespace jammer/gadget_icepick
// Params 0, eflags: 0x2
// Checksum 0x8ca57151, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_icepick", &__init__, undefined, undefined);
}

// Namespace jammer/gadget_icepick
// Params 0, eflags: 0x1 linked
// Checksum 0x7d97efac, Offset: 0xe0
// Size: 0x14
function __init__() {
    icepick::init_shared();
}

