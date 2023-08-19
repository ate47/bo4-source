// Atian COD Tools GSC decompiler test
#include scripts/mp_common/callbacks.gsc;
#include scripts/core_common/util_shared.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/scene_shared.gsc;
#include scripts/core_common/flag_shared.gsc;
#include scripts/core_common/struct.gsc;
#include scripts/abilities/gadgets/gadget_icepick_shared.gsc;

#namespace icepick;

// Namespace icepick/gadget_icepick
// Params 0, eflags: 0x2
// Checksum 0x66052e9b, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_icepick", &__init__, undefined, undefined);
}

// Namespace icepick/gadget_icepick
// Params 0, eflags: 0x1 linked
// Checksum 0x3d30dc65, Offset: 0xe8
// Size: 0x34
function __init__() {
    init_shared();
    callback::on_changed_specialist(&onspecialistchange);
}

