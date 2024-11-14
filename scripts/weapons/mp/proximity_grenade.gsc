#using scripts\weapons\proximity_grenade;
#using scripts\core_common\system_shared;

#namespace proximity_grenade;

// Namespace proximity_grenade/proximity_grenade
// Params 0, eflags: 0x2
// Checksum 0xfea2a705, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"proximity_grenade", &__init__, undefined, undefined);
}

// Namespace proximity_grenade/proximity_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0x1224cdf0, Offset: 0xc0
// Size: 0x22
function __init__() {
    init_shared();
    level.trackproximitygrenadesonowner = 1;
}

