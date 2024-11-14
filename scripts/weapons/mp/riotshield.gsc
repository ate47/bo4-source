#using scripts\weapons\riotshield;
#using scripts\core_common\system_shared;

#namespace riotshield;

// Namespace riotshield/riotshield
// Params 0, eflags: 0x2
// Checksum 0x63a2d4bb, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"riotshield", &__init__, undefined, undefined);
}

// Namespace riotshield/riotshield
// Params 0, eflags: 0x1 linked
// Checksum 0xd18c58f8, Offset: 0xc0
// Size: 0x14
function __init__() {
    init_shared();
}

