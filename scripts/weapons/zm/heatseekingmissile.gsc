#using scripts\weapons\heatseekingmissile;
#using scripts\core_common\system_shared;

#namespace heatseekingmissile;

// Namespace heatseekingmissile/heatseekingmissile
// Params 0, eflags: 0x2
// Checksum 0x440ea55a, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"heatseekingmissile", &__init__, undefined, undefined);
}

// Namespace heatseekingmissile/heatseekingmissile
// Params 0, eflags: 0x1 linked
// Checksum 0x32cc5bb4, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

