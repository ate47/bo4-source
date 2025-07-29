#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_melee_weapon;
#using scripts\zm_common\zm_weapons;

#namespace zm_weap_spoon;

// Namespace zm_weap_spoon/zm_weap_spoon
// Params 0, eflags: 0x2
// Checksum 0x3a648f5, Offset: 0x88
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"spoon", &__init__, &__main__, undefined );
}

// Namespace zm_weap_spoon/zm_weap_spoon
// Params 0, eflags: 0x4
// Checksum 0xe31d18f9, Offset: 0xd8
// Size: 0x4c
function private __init__()
{
    zm_melee_weapon::init( #"spoon_alcatraz", #"spoon_alcatraz_flourish", 1000, "spoon", undefined, "spoon", undefined );
}

// Namespace zm_weap_spoon/zm_weap_spoon
// Params 0, eflags: 0x4
// Checksum 0x80f724d1, Offset: 0x130
// Size: 0x4
function private __main__()
{
    
}

