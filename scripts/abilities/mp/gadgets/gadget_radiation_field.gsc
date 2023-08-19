// Atian COD Tools GSC decompiler test
#include scripts/mp_common/util.gsc;
#include scripts/mp_common/gametypes/battlechatter.gsc;
#include scripts/abilities/gadgets/gadget_radiation_field.gsc;
#include scripts/core_common/system_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/struct.gsc;

#namespace gadget_radiation_field;

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0, eflags: 0x2
// Checksum 0x54b7fba7, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"gadget_radiation_field", &__init__, undefined, undefined);
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 0, eflags: 0x1 linked
// Checksum 0xcfaa3683, Offset: 0xe8
// Size: 0x34
function __init__() {
    init_shared();
    function_6ca75924(&function_4a9c8bba);
}

// Namespace gadget_radiation_field/gadget_radiation_field
// Params 1, eflags: 0x1 linked
// Checksum 0x5bac26ab, Offset: 0x128
// Size: 0x3c
function function_4a9c8bba(var_d90c942a) {
    self battlechatter::function_bd715920(var_d90c942a, undefined, self geteye(), self);
}

