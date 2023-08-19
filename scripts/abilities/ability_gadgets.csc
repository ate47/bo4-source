// Atian COD Tools GSC decompiler test
#include scripts/core_common/clientfield_shared.csc;
#include scripts/core_common/system_shared.csc;

#namespace ability_gadgets;

// Namespace ability_gadgets/ability_gadgets
// Params 0, eflags: 0x2
// Checksum 0x1b9b11cc, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ability_gadgets", &__init__, undefined, undefined);
}

// Namespace ability_gadgets/ability_gadgets
// Params 0, eflags: 0x1 linked
// Checksum 0xe9b31ce4, Offset: 0x140
// Size: 0xac
function __init__() {
    clientfield::register("clientuimodel", "huditems.abilityHoldToActivate", 1, 2, "int", undefined, 0, 0);
    clientfield::register("clientuimodel", "huditems.abilityDelayProgress", 1, 5, "float", undefined, 0, 0);
    clientfield::register("clientuimodel", "hudItems.abilityHintIndex", 1, 3, "int", undefined, 0, 0);
}

