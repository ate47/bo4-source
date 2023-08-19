// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/abilities/gadgets/gadget_jammer_shared.gsc;

#namespace jammer;

// Namespace jammer/gadget_jammer
// Params 0, eflags: 0x2
// Checksum 0x31813507, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_jammer", &__init__, undefined, undefined);
}

// Namespace jammer/gadget_jammer
// Params 0, eflags: 0x1 linked
// Checksum 0x37413253, Offset: 0xe0
// Size: 0x14
function __init__() {
    init_shared();
}

