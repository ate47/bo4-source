// Atian COD Tools GSC decompiler test
#include scripts/core_common/util_shared.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/scene_shared.csc;
#include scripts/core_common/flag_shared.csc;
#include scripts/core_common/struct.csc;
#include scripts/abilities/gadgets/gadget_jammer_shared.csc;

#namespace jammer;

// Namespace jammer/gadget_jammer
// Params 0, eflags: 0x2
// Checksum 0x5ac515a5, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_jammer", &__init__, undefined, undefined);
}

// Namespace jammer/gadget_jammer
// Params 0, eflags: 0x1 linked
// Checksum 0x82d05b92, Offset: 0xe0
// Size: 0x14
function __init__() {
    init_shared();
}
