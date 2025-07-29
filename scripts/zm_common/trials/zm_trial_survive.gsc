#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;

#namespace zm_trial_survive;

// Namespace zm_trial_survive/zm_trial_survive
// Params 0, eflags: 0x2
// Checksum 0x85a5d5a7, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_survive", &__init__, undefined, undefined );
}

// Namespace zm_trial_survive/zm_trial_survive
// Params 0
// Checksum 0x4cf7f062, Offset: 0xc0
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"survive", &on_begin, &on_end );
}

// Namespace zm_trial_survive/zm_trial_survive
// Params 0, eflags: 0x4
// Checksum 0x80f724d1, Offset: 0x128
// Size: 0x4
function private on_begin()
{
    
}

// Namespace zm_trial_survive/zm_trial_survive
// Params 1, eflags: 0x4
// Checksum 0x7a8f865e, Offset: 0x138
// Size: 0xc
function private on_end( round_reset )
{
    
}

