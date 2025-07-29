#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_weapons;

#namespace zm_weap_homunculus;

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0, eflags: 0x2
// Checksum 0xce489fc7, Offset: 0x118
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_weap_homunculus", &__init__, &__main__, undefined );
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0
// Checksum 0xfc01387f, Offset: 0x168
// Size: 0xb4
function __init__()
{
    clientfield::register( "scriptmover", "" + #"hash_2d49d2cf3d339e18", 1, 1, "int", &function_6fcc4908, 0, 0 );
    clientfield::register( "scriptmover", "" + #"hash_32c5838be960cfee", 1, 1, "int", &function_3e362ad8, 0, 0 );
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 0
// Checksum 0x12668483, Offset: 0x228
// Size: 0x38
function __main__()
{
    if ( !zm_weapons::is_weapon_included( getweapon( #"homunculus" ) ) )
    {
        return;
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 7
// Checksum 0xab5e8c2b, Offset: 0x268
// Size: 0xe4
function function_6fcc4908( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && isdefined( self ) )
    {
        v_up = ( 360, 0, 0 );
        v_forward = ( 0, 0, 360 );
        origin = self gettagorigin( "j_spinelower" );
        
        if ( !isdefined( origin ) )
        {
            origin = self.origin;
        }
        
        playfx( localclientnum, "zm_weapons/fx8_equip_homunc_death_exp", origin, v_forward, v_up );
    }
}

// Namespace zm_weap_homunculus/zm_weap_homunculus
// Params 7
// Checksum 0xd1bf28af, Offset: 0x358
// Size: 0xc4
function function_3e362ad8( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        v_up = ( 360, 0, 0 );
        v_forward = ( 0, 0, 360 );
        playfx( localclientnum, "zm_weapons/fx8_equip_homunc_spawn", self.origin, v_forward, v_up );
        self playsound( localclientnum, #"hash_21206f1b7fb27f81" );
    }
}

