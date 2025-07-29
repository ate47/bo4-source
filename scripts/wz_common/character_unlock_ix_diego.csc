#using scripts\core_common\system_shared;
#using scripts\mp_common\item_world_fixup;
#using scripts\wz_common\character_unlock_fixup;

#namespace character_unlock_ix_diego;

// Namespace character_unlock_ix_diego/character_unlock_ix_diego
// Params 0, eflags: 0x2
// Checksum 0x114be3d0, Offset: 0x80
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock_ix_diego", &__init__, undefined, #"character_unlock_ix_diego_fixup" );
}

// Namespace character_unlock_ix_diego/character_unlock_ix_diego
// Params 0
// Checksum 0xdc5a6627, Offset: 0xd0
// Size: 0x34
function __init__()
{
    character_unlock_fixup::function_90ee7a97( #"ix_diego_unlock", &function_2613aeec );
}

// Namespace character_unlock_ix_diego/character_unlock_ix_diego
// Params 1
// Checksum 0xa526e553, Offset: 0x110
// Size: 0xcc
function function_2613aeec( enabled )
{
    if ( enabled )
    {
        if ( isdefined( getgametypesetting( #"hash_17f17e92c2654659" ) ) && getgametypesetting( #"hash_17f17e92c2654659" ) )
        {
            item_world_fixup::function_e70fa91c( #"ammo_stash_parent_dlc1", #"zombie_supply_stash_cu29", 3 );
            return;
        }
        
        item_world_fixup::function_e70fa91c( #"ammo_stash_parent_dlc1", #"zombie_supply_stash_cu29", 6 );
    }
}

