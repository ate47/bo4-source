#using scripts\core_common\system_shared;
#using scripts\weapons\proximity_grenade;

#namespace proximity_grenade;

// Namespace proximity_grenade/proximity_grenade
// Params 0, eflags: 0x2
// Checksum 0xc273b2f4, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"proximity_grenade", &__init__, undefined, undefined);
}

// Namespace proximity_grenade/proximity_grenade
// Params 0, eflags: 0x0
// Checksum 0xa557e810, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

