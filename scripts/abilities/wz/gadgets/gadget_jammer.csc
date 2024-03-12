// Atian COD Tools GSC decompiler test
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\scene_shared.csc;
#using scripts\core_common\flag_shared.csc;
#using scripts\core_common\struct.csc;
#using scripts\abilities\gadgets\gadget_jammer_shared.csc;

#namespace jammer;

// Namespace jammer/gadget_jammer
// Params 0, eflags: 0x2
// Checksum 0x5ac515a5, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_jammer", &__init__, undefined, undefined);
}

// Namespace jammer/gadget_jammer
// Params 0, eflags: 0x0
// Checksum 0x82d05b92, Offset: 0xe0
// Size: 0x14
function __init__() {
    init_shared();
}

