// Atian COD Tools GSC decompiler test
#include scripts/core_common/status_effects/status_effect_util.gsc;
#include scripts/core_common/callbacks_shared.gsc;
#include scripts/core_common/clientfield_shared.gsc;
#include scripts/core_common/system_shared.gsc;

#namespace status_effect_explosive_damage;

// Namespace status_effect_explosive_damage/status_effect_explosive_damage
// Params 0, eflags: 0x2
// Checksum 0x1c499757, Offset: 0xa0
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"status_effect_explosive_damage", &__init__, undefined, undefined);
}

// Namespace status_effect_explosive_damage/status_effect_explosive_damage
// Params 0, eflags: 0x1 linked
// Checksum 0xea476c41, Offset: 0xe8
// Size: 0x2c
function __init__() {
    status_effect::function_6f4eaf88(getstatuseffect("explosive_damage"));
}

