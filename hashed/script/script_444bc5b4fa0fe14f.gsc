#using scripts\core_common\system_shared;
#using scripts\zm_common\trials\zm_trial_add_special;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace namespace_c56530a8;

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0, eflags: 0x2
// Checksum 0x4046b1ed, Offset: 0x90
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_4229d59c5b830185", &__init__, undefined, undefined );
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0
// Checksum 0xefa28228, Offset: 0xd8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"hash_3746f3c279f7a5ea", &on_begin, &on_end );
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 4, eflags: 0x4
// Checksum 0x6c54c92d, Offset: 0x140
// Size: 0x2e4
function private on_begin( var_49d0b42a, var_d2d5c522, var_17d04dfe, var_6a68f1d6 )
{
    n_variant = getgametypesetting( #"zmtrialsvariant" );
    
    switch ( getplayers().size )
    {
        case 1:
            level.var_88bac0b7 = zm_trial::function_5769f26a( var_49d0b42a );
            level.var_e34a018e = level.var_88bac0b7 + ( n_variant ? 15 : 15 );
            break;
        case 2:
            level.var_88bac0b7 = zm_trial::function_5769f26a( var_d2d5c522 );
            level.var_e34a018e = level.var_88bac0b7 + ( n_variant ? 15 : 15 );
            break;
        case 3:
            level.var_88bac0b7 = zm_trial::function_5769f26a( var_17d04dfe );
            level.var_e34a018e = level.var_88bac0b7 + ( n_variant ? 15 : 15 );
            break;
        case 4:
        default:
            level.var_88bac0b7 = zm_trial::function_5769f26a( var_6a68f1d6 );
            level.var_e34a018e = level.var_88bac0b7 + ( n_variant ? 20 : 20 );
            break;
    }
    
    level.var_fb0b57a7 = 0;
    zm_trial_util::function_2976fa44( level.var_88bac0b7 );
    zm_trial_util::function_dace284( level.var_fb0b57a7 );
    level.var_1c7412f9 = #"catalyst";
    zm_round_spawning::function_c1571721( &zm_trial_add_special::function_51ec9e09 );
    zm_round_spawning::function_54fee373( &zm_trial_add_special::function_1b1d71e7 );
    zm_round_spawning::function_2876740e( level.var_1c7412f9, &zm_trial_add_special::function_a7c00976 );
    level.var_ed006fe8 = array( 1, 2, 3, 4 );
    level thread function_cb35d440();
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 1, eflags: 0x4
// Checksum 0xe95e715e, Offset: 0x430
// Size: 0xfe
function private on_end( round_reset )
{
    zm_trial_util::function_f3dbeda7();
    zm_round_spawning::function_510039c1( &zm_trial_add_special::function_51ec9e09 );
    zm_round_spawning::function_375519eb( &zm_trial_add_special::function_1b1d71e7 );
    zm_round_spawning::function_9bf14a10( level.var_1c7412f9, &zm_trial_add_special::function_a7c00976 );
    
    if ( !round_reset )
    {
        if ( level.var_fb0b57a7 < level.var_88bac0b7 )
        {
            zm_trial::fail( #"hash_3f700791572b0dcf" );
        }
    }
    
    level.var_88bac0b7 = undefined;
    level.var_fb0b57a7 = undefined;
    level.var_1c7412f9 = undefined;
    level.var_e34a018e = undefined;
    level.var_ed006fe8 = undefined;
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0, eflags: 0x4
// Checksum 0x2419598c, Offset: 0x538
// Size: 0x80
function private function_cb35d440()
{
    level endon( #"hash_7646638df88a3656" );
    
    while ( true )
    {
        level waittill( #"hash_166cac102910cdb3" );
        level.var_fb0b57a7++;
        
        if ( level.var_fb0b57a7 <= level.var_88bac0b7 )
        {
            zm_trial_util::function_dace284( level.var_fb0b57a7 );
        }
    }
}

// Namespace namespace_c56530a8/namespace_c56530a8
// Params 0
// Checksum 0x6b09332a, Offset: 0x5c0
// Size: 0x32, Type: bool
function is_active()
{
    challenge = zm_trial::function_a36e8c38( #"hash_3746f3c279f7a5ea" );
    return isdefined( challenge );
}

