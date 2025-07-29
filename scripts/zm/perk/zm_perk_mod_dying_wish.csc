#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_dying_wish;

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0, eflags: 0x2
// Checksum 0xb7692bc2, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_mod_dying_wish", &__init__, undefined, undefined );
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0
// Checksum 0xd228e987, Offset: 0xc0
// Size: 0x14
function __init__()
{
    function_7186a3aa();
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0
// Checksum 0x17119c81, Offset: 0xe0
// Size: 0x74
function function_7186a3aa()
{
    zm_perks::register_perk_clientfields( #"specialty_mod_berserker", &function_974d4ee2, &function_992358e3 );
    zm_perks::register_perk_init_thread( #"specialty_mod_berserker", &function_4e184775 );
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0
// Checksum 0x80f724d1, Offset: 0x160
// Size: 0x4
function function_4e184775()
{
    
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0
// Checksum 0x80f724d1, Offset: 0x170
// Size: 0x4
function function_974d4ee2()
{
    
}

// Namespace zm_perk_mod_dying_wish/zm_perk_mod_dying_wish
// Params 0
// Checksum 0x80f724d1, Offset: 0x180
// Size: 0x4
function function_992358e3()
{
    
}

