#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_trial;

#namespace zm_trial_add_special;

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 0, eflags: 0x2
// Checksum 0x4572c1ca, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_add_special", &__init__, undefined, undefined );
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 0
// Checksum 0x38872da7, Offset: 0xc8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"add_special", &on_begin, &on_end );
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 5, eflags: 0x4
// Checksum 0x651493b6, Offset: 0x130
// Size: 0x184
function private on_begin( enemy_type, var_1f950d4d, var_81dcf087, var_d631185a, var_fe1bdf31 )
{
    level.var_1c7412f9 = enemy_type;
    
    switch ( getplayers().size )
    {
        case 1:
            level.var_e34a018e = zm_trial::function_5769f26a( var_1f950d4d );
            break;
        case 2:
            level.var_e34a018e = zm_trial::function_5769f26a( var_81dcf087 );
            break;
        case 3:
            level.var_e34a018e = zm_trial::function_5769f26a( var_d631185a );
            break;
        case 4:
            level.var_e34a018e = zm_trial::function_5769f26a( var_fe1bdf31 );
            break;
    }
    
    zm_round_spawning::function_c1571721( &function_51ec9e09 );
    zm_round_spawning::function_54fee373( &function_1b1d71e7 );
    zm_round_spawning::function_2876740e( level.var_1c7412f9, &function_a7c00976 );
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 1, eflags: 0x4
// Checksum 0xd07f26d7, Offset: 0x2c0
// Size: 0x8a
function private on_end( round_reset )
{
    zm_round_spawning::function_9bf14a10( level.var_1c7412f9, &function_a7c00976 );
    zm_round_spawning::function_510039c1( &function_51ec9e09 );
    zm_round_spawning::function_375519eb( &function_1b1d71e7 );
    level.var_1c7412f9 = undefined;
    level.var_e34a018e = undefined;
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 1
// Checksum 0x19200ca2, Offset: 0x358
// Size: 0x62
function is_active( str_archetype )
{
    challenge = zm_trial::function_a36e8c38( #"add_special" );
    
    if ( isdefined( str_archetype ) )
    {
        return ( isdefined( challenge ) && level.var_1c7412f9 === str_archetype );
    }
    
    return isdefined( challenge );
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 1
// Checksum 0xe780354e, Offset: 0x3c8
// Size: 0x10
function function_a7c00976( n_max )
{
    return 999;
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 1
// Checksum 0xf2e7dbd1, Offset: 0x3e0
// Size: 0x6c
function function_51ec9e09( n_points )
{
    if ( isdefined( level.var_819e7dfd[ level.var_1c7412f9 ].var_f6a3b5b0 ) )
    {
        var_dbce0c44 = level.var_819e7dfd[ level.var_1c7412f9 ].var_f6a3b5b0 * level.var_e34a018e;
    }
    else
    {
        var_dbce0c44 = 1600;
    }
    
    return var_dbce0c44;
}

// Namespace zm_trial_add_special/zm_trial_add_special
// Params 1
// Checksum 0xf5ef8996, Offset: 0x458
// Size: 0xcc
function function_1b1d71e7( var_8997f0f2 )
{
    a_str_archetypes = getarraykeys( var_8997f0f2 );
    
    foreach ( str_archetype in a_str_archetypes )
    {
        if ( str_archetype === level.var_1c7412f9 )
        {
            var_8997f0f2[ str_archetype ] = level.var_e34a018e;
            continue;
        }
        
        var_8997f0f2[ str_archetype ] = 0;
    }
    
    return var_8997f0f2;
}

