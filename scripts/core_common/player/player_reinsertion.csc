#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace player_reinsertion;

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x2
// Checksum 0x65eb196d, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"player_reinsertion", &__init__, undefined, undefined );
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x80f724d1, Offset: 0xc0
// Size: 0x4
function __init__()
{
    
}

