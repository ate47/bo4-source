#using scripts\weapons\grenades.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace grenades;

// Namespace grenades/grenades
// Params 0, eflags: 0x2
// Checksum 0x505e9914, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"grenades", &__init__, undefined, undefined);
}

// Namespace grenades/grenades
// Params 0, eflags: 0x0
// Checksum 0x9037db12, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

