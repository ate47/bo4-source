#using script_444bc5b4fa0fe14f;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;

#namespace zm_trial_super_sprinters_only;

// Namespace zm_trial_super_sprinters_only/zm_trial_super_sprinters_only
// Params 0, eflags: 0x2
// Checksum 0x128fe37c, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_super_sprinters_only", &__init__, undefined, undefined );
}

// Namespace zm_trial_super_sprinters_only/zm_trial_super_sprinters_only
// Params 0
// Checksum 0x4936859e, Offset: 0xd8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"super_sprinters_only", &on_begin, &on_end );
}

// Namespace zm_trial_super_sprinters_only/zm_trial_super_sprinters_only
// Params 0, eflags: 0x4
// Checksum 0x79625d33, Offset: 0x140
// Size: 0x6e
function private on_begin()
{
    level.var_43fb4347 = "super_sprint";
    level.var_102b1301 = "super_sprint";
    level.var_153e9058 = 1;
    level.var_fe2bb2ac = 1;
    
    if ( !namespace_c56530a8::is_active() )
    {
        level.var_5e45f817 = 1;
    }
}

// Namespace zm_trial_super_sprinters_only/zm_trial_super_sprinters_only
// Params 1, eflags: 0x4
// Checksum 0x75bb9b12, Offset: 0x1b8
// Size: 0x46
function private on_end( round_reset )
{
    level.var_43fb4347 = undefined;
    level.var_102b1301 = undefined;
    level.var_153e9058 = 0;
    level.var_fe2bb2ac = 0;
    level.var_5e45f817 = 0;
}

