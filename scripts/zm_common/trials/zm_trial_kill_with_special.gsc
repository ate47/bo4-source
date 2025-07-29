#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_loadout;
#using scripts\zm_common\zm_trial;

#namespace zm_trial_kill_with_special;

// Namespace zm_trial_kill_with_special/zm_trial_kill_with_special
// Params 0, eflags: 0x2
// Checksum 0x39f85a6b, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"kill_with_special", &__init__, undefined, undefined );
}

// Namespace zm_trial_kill_with_special/zm_trial_kill_with_special
// Params 0
// Checksum 0x8df7c59b, Offset: 0xd0
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"kill_with_special", &on_begin, &on_end );
}

// Namespace zm_trial_kill_with_special/zm_trial_kill_with_special
// Params 0, eflags: 0x4
// Checksum 0x80f724d1, Offset: 0x138
// Size: 0x4
function private on_begin()
{
    
}

// Namespace zm_trial_kill_with_special/zm_trial_kill_with_special
// Params 1, eflags: 0x4
// Checksum 0xef9ef00f, Offset: 0x148
// Size: 0x98
function private on_end( round_reset )
{
    if ( round_reset )
    {
        foreach ( e_player in level.players )
        {
            e_player gadgetpowerset( level.var_a53a05b5, 100 );
        }
    }
}

