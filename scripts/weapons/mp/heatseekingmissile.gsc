#using scripts\core_common\system_shared;
#using scripts\weapons\heatseekingmissile;

#namespace heatseekingmissile;

// Namespace heatseekingmissile/heatseekingmissile
// Params 0, eflags: 0x2
// Checksum 0xf8cabe3, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"heatseekingmissile", &__init__, undefined, undefined);
}

// Namespace heatseekingmissile/heatseekingmissile
// Params 0, eflags: 0x0
// Checksum 0x7d6f9470, Offset: 0xc0
// Size: 0x34
function __init__() {
    level.lockoncloserange = 330;
    level.lockoncloseradiusscaler = 3;
    init_shared();
}

