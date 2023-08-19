// Atian COD Tools GSC decompiler test
#include scripts/weapons/deployable.csc;
#include scripts/core_common/system_shared.csc;
#include scripts/core_common/struct.csc;

#namespace ultimate_turret;

// Namespace ultimate_turret/ultimate_turret
// Params 0, eflags: 0x2
// Checksum 0xd2b57a0e, Offset: 0xa8
// Size: 0x34
function autoexec __init__system__() {
    system::register("ultimate_turret_wz", &__init__, undefined, undefined);
}

// Namespace ultimate_turret/ultimate_turret
// Params 0, eflags: 0x1 linked
// Checksum 0x6129786a, Offset: 0xe8
// Size: 0x34
function __init__() {
    deployable::register_deployable(getweapon("ultimate_turret"), 1);
}

