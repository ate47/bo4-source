#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_mod_bandolier;

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0, eflags: 0x2
// Checksum 0x24cbf04a, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_mod_bandolier", &__init__, undefined, undefined );
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0
// Checksum 0x9e79af00, Offset: 0xd8
// Size: 0x14
function __init__()
{
    function_27473e44();
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0
// Checksum 0xf4b90430, Offset: 0xf8
// Size: 0x9c
function function_27473e44()
{
    zm_perks::register_perk_clientfields( #"specialty_mod_extraammo", &function_12161a30, &function_b10a7225 );
    zm_perks::register_perk_effects( #"specialty_mod_extraammo", "sleight_light" );
    zm_perks::register_perk_init_thread( #"specialty_mod_extraammo", &init_perk );
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0
// Checksum 0x1d4428c2, Offset: 0x1a0
// Size: 0x24
function init_perk()
{
    if ( isdefined( level.enable_magic ) && level.enable_magic )
    {
    }
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0
// Checksum 0x80f724d1, Offset: 0x1d0
// Size: 0x4
function function_12161a30()
{
    
}

// Namespace zm_perk_mod_bandolier/zm_perk_mod_bandolier
// Params 0
// Checksum 0x80f724d1, Offset: 0x1e0
// Size: 0x4
function function_b10a7225()
{
    
}

