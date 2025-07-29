#using scripts\core_common\callbacks_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\system_shared;
#using scripts\wz_common\character_unlock;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_zero;

// Namespace character_unlock_zero/character_unlock_zero
// Params 0, eflags: 0x2
// Checksum 0xce98a125, Offset: 0x90
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_zero", &__init__, undefined, #"character_unlock_zero_fixup" );
}

// Namespace character_unlock_zero/character_unlock_zero
// Params 0
// Checksum 0x27f66cb1, Offset: 0xe0
// Size: 0x64
function __init__()
{
    callback::add_callback( #"hash_67dd51a5d529c64c", &function_2a798d57 );
    character_unlock_fixup::function_90ee7a97( #"zero_unlock", &function_2613aeec );
}

// Namespace character_unlock_zero/character_unlock_zero
// Params 1
// Checksum 0xf3a32b29, Offset: 0x150
// Size: 0x44
function function_2613aeec( enabled )
{
    if ( enabled )
    {
        callback::add_callback( #"hash_48bcdfea6f43fecb", &function_1c4b5097 );
    }
}

// Namespace character_unlock_zero/character_unlock_zero
// Params 0
// Checksum 0x9d80e218, Offset: 0x1a0
// Size: 0x84
function function_2a798d57()
{
    if ( self character_unlock::function_f0406288( #"zero_unlock" ) )
    {
        if ( self stats::get_stat_global( #"destroy_equipment" ) >= 50 )
        {
            self character_unlock::function_c8beca5e( #"zero_unlock", #"hash_178b421c5b67b4d5", 1 );
        }
    }
}

// Namespace character_unlock_zero/character_unlock_zero
// Params 1
// Checksum 0xd64f3de1, Offset: 0x230
// Size: 0xc4
function function_1c4b5097( item )
{
    itementry = item.itementry;
    
    if ( itementry.name === #"cu32_item" )
    {
        if ( self character_unlock::function_f0406288( #"zero_unlock" ) )
        {
            if ( self stats::get_stat_global( #"destroy_equipment" ) >= 50 )
            {
                self character_unlock::function_c8beca5e( #"zero_unlock", #"hash_178b421c5b67b4d5", 1 );
            }
        }
    }
}

