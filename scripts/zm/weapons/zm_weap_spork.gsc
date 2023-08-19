// Atian COD Tools GSC decompiler test
#include scripts/core_common/system_shared.gsc;
#include scripts/zm_common/zm_weapons.gsc;
#include scripts/zm_common/zm_melee_weapon.gsc;

#namespace zm_weap_spork;

// Namespace zm_weap_spork/zm_weap_spork
// Params 0, eflags: 0x2
// Checksum 0x4c38790b, Offset: 0x88
// Size: 0x44
function autoexec __init__system__() {
    system::register(#"spork", &__init__, &__main__, undefined);
}

// Namespace zm_weap_spork/zm_weap_spork
// Params 0, eflags: 0x5 linked
// Checksum 0xe567473f, Offset: 0xd8
// Size: 0x4c
function private __init__() {
    zm_melee_weapon::init(#"spork_alcatraz", #"spork_alcatraz_flourish", 1000, "spork", undefined, "spork", undefined);
}

// Namespace zm_weap_spork/zm_weap_spork
// Params 0, eflags: 0x5 linked
// Checksum 0x80f724d1, Offset: 0x130
// Size: 0x4
function private __main__() {
    
}

