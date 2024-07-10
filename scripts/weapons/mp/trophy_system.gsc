#using scripts\weapons\trophy_system.gsc;
#using scripts\mp_common\gametypes\battlechatter.gsc;
#using scripts\core_common\contracts_shared.gsc;
#using scripts\core_common\system_shared.gsc;

#namespace trophy_system;

// Namespace trophy_system/trophy_system
// Params 0, eflags: 0x2
// Checksum 0x82b8ded5, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__() {
    system::register(#"trophy_system", &__init__, undefined, undefined);
}

// Namespace trophy_system/trophy_system
// Params 0, eflags: 0x0
// Checksum 0xba59b9ed, Offset: 0xd0
// Size: 0x34
function __init__() {
    init_shared();
    function_720ddf7f(&function_ccfcde75);
}

// Namespace trophy_system/trophy_system
// Params 2, eflags: 0x0
// Checksum 0x7d9d5c73, Offset: 0x110
// Size: 0x6c
function function_ccfcde75(trophy, grenade) {
    self battlechatter::function_bd715920(trophy.weapon, grenade.owner, grenade.origin, trophy);
    self contracts::increment_contract(#"hash_369e3fd5caa5145b");
}

