#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_perks;

#namespace zm_perk_tortoise;

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0, eflags: 0x2
// Checksum 0x56de8127, Offset: 0x170
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_perk_tortoise", &__init__, undefined, undefined );
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0
// Checksum 0xcfaa22f1, Offset: 0x1b8
// Size: 0x5c
function __init__()
{
    enable_tortoise_perk_for_level();
    level._effect[ #"perk_tortoise_explosion" ] = "zombie/fx8_perk_vic_tort_exp";
    zm_perks::function_f3c80d73( "zombie_perk_bottle_tortoise", "zombie_perk_totem_tortoise" );
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0
// Checksum 0x55152949, Offset: 0x220
// Size: 0xe4
function enable_tortoise_perk_for_level()
{
    zm_perks::register_perk_clientfields( #"specialty_shield", &function_6dd9c0ca, &function_cdbbd4f1 );
    zm_perks::register_perk_effects( #"specialty_shield", "divetonuke_light" );
    zm_perks::register_perk_init_thread( #"specialty_shield", &function_3cc019d7 );
    zm_perks::function_b60f4a9f( #"specialty_shield", #"p8_zm_vapor_altar_icon_01_victorioustortoise", "zombie/fx8_perk_altar_symbol_ambient_victorious_tortoise", #"zmperksvictorious" );
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0
// Checksum 0x80f724d1, Offset: 0x310
// Size: 0x4
function function_3cc019d7()
{
    
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0
// Checksum 0x26f6ae42, Offset: 0x320
// Size: 0x4c
function function_6dd9c0ca()
{
    clientfield::register( "allplayers", "perk_tortoise_explosion", 1, 1, "counter", &function_f92dce50, 0, 0 );
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 0
// Checksum 0x80f724d1, Offset: 0x378
// Size: 0x4
function function_cdbbd4f1()
{
    
}

// Namespace zm_perk_tortoise/zm_perk_tortoise
// Params 7
// Checksum 0xab3d3794, Offset: 0x388
// Size: 0x7c
function function_f92dce50( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"perk_tortoise_explosion" ], self, " j_spine" );
    }
}

