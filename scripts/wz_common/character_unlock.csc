#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\mp_common\item_inventory;
#using scripts\mp_common\item_world_fixup;

#namespace character_unlock;

// Namespace character_unlock/character_unlock
// Params 0, eflags: 0x2
// Checksum 0x54f24694, Offset: 0x88
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"character_unlock", &__init__, undefined, #"character_unlock_fixup" );
}

// Namespace character_unlock/character_unlock
// Params 0
// Checksum 0x80f724d1, Offset: 0xd8
// Size: 0x4
function __init__()
{
    
}

// Namespace character_unlock/character_unlock
// Params 3
// Checksum 0xd695a62e, Offset: 0xe8
// Size: 0x1c
function function_d2294476( var_2ab9d3bd, replacementcount, var_3afaa57b )
{
    
}

