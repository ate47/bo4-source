#using scripts\weapons\proximity_grenade.csc;
#using scripts\core_common\util_shared.csc;
#using scripts\core_common\system_shared.csc;
#using scripts\core_common\clientfield_shared.csc;
#using scripts\core_common\callbacks_shared.csc;
#using scripts\core_common\struct.csc;

#namespace proximity_grenade;

// Namespace proximity_grenade/zm_weap_proximity_grenade
// Params 0, eflags: 0x2
// Checksum 0xbf2fc13b, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"proximity_grenade", &__init__, undefined, undefined);
}

// Namespace proximity_grenade/zm_weap_proximity_grenade
// Params 0, eflags: 0x1 linked
// Checksum 0x8fc5d6d5, Offset: 0xe0
// Size: 0x14
function __init__() {
    init_shared();
}

