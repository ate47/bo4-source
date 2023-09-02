// Atian COD Tools GSC decompiler test
#using scripts\weapons\ballistic_knife.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace ballistic_knife;

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x2
// Checksum 0x113f649d, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"ballistic_knife", &__init__, undefined, undefined);
}

// Namespace ballistic_knife/ballistic_knife
// Params 0, eflags: 0x1 linked
// Checksum 0x2258fcb0, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

