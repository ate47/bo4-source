#using scripts\core_common\flag_shared;
#using scripts\core_common\system_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;

#namespace zm_trial_white_population_control;

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 0, eflags: 0x2
// Checksum 0x70247c05, Offset: 0x110
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_trial_white_population_control", &__init__, undefined, undefined );
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 0
// Checksum 0x89a3074e, Offset: 0x158
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"population_control", &on_begin, &on_end );
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 5, eflags: 0x4
// Checksum 0x7710a107, Offset: 0x1c0
// Size: 0x1a4
function private on_begin( var_80bd7996, var_49d28bc1, var_5b932f42, var_a53dc296, var_60bdad5f )
{
    zm_trial_util::function_7d32b7d0( 0 );
    n_base = 99;
    level.population_count = n_base;
    
    switch ( getplayers().size )
    {
        case 1:
            n_base = zm_trial::function_5769f26a( var_80bd7996 );
            break;
        case 2:
            n_base = zm_trial::function_5769f26a( var_49d28bc1 );
            break;
        case 3:
            n_base = zm_trial::function_5769f26a( var_5b932f42 );
            break;
        case 4:
            n_base = zm_trial::function_5769f26a( var_a53dc296 );
            break;
    }
    
    level.var_4ce2a315 = var_60bdad5f;
    level.var_5cf4858b = 0;
    level flag::set( #"infinite_round_spawning" );
    level thread function_a4adaedb();
    level thread nuked_population_sign_think( n_base );
    level thread function_8e69c85();
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 1, eflags: 0x4
// Checksum 0x828b3ede, Offset: 0x370
// Size: 0xa4
function private on_end( round_reset )
{
    zm_trial_util::function_f3dbeda7();
    level flag::clear( #"infinite_round_spawning" );
    level.var_382a24b0 = 0;
    
    if ( !round_reset )
    {
        if ( !level.var_5cf4858b )
        {
            zm_trial::fail( level.var_4ce2a315 );
        }
    }
    
    if ( isdefined( level.var_d76270a8 ) )
    {
        level.var_d76270a8 delete();
    }
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 0, eflags: 0x4
// Checksum 0x880a0416, Offset: 0x420
// Size: 0x8c
function private function_8e69c85()
{
    level endon( #"hash_7646638df88a3656" );
    level.var_d76270a8 = spawn( "trigger_damage_new", ( -208, 530, -24 ), 1048576 | 2097152 | 8388608, 16, 16 );
    level.var_d76270a8 thread function_75f0aac6();
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 0, eflags: 0x4
// Checksum 0xadc87aea, Offset: 0x4b8
// Size: 0x154
function private function_75f0aac6()
{
    self endon( #"death" );
    
    while ( true )
    {
        waitresult = self waittill( #"damage" );
        
        if ( waitresult.weapon.name === #"galvaknuckles_t8" && level.population_count === 0 )
        {
            level.var_5cf4858b = 1;
            zm_trial_util::function_7d32b7d0( 1 );
            level flag::clear( #"infinite_round_spawning" );
            level flag::set( #"hold_round_end" );
            level zm_utility::function_9ad5aeb1( 1, 1, 0, 1, 0 );
            wait 5;
            level flag::clear( #"hold_round_end" );
            break;
        }
    }
    
    self delete();
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 1
// Checksum 0x21807611, Offset: 0x618
// Size: 0x4b0
function nuked_population_sign_think( n_base = 99 )
{
    level endon( #"hash_7646638df88a3656" );
    var_50f6b3f4 = getent( "counter_tens", "targetname" );
    var_d02e9cd = getent( "counter_ones", "targetname" );
    var_50f6b3f4 rotateto( var_50f6b3f4.start_angles, 0.05 );
    var_d02e9cd rotateto( var_d02e9cd.start_angles, 0.05 );
    var_d02e9cd waittill( #"rotatedone" );
    n_step = 36;
    var_b09f093e = 0;
    var_aa6e55d3 = level.total_zombies_killed - level.zombie_total_subtract;
    var_50f6b3f4 rotateroll( n_step, 0.05 );
    var_d02e9cd rotateroll( n_step, 0.05 );
    var_d02e9cd waittill( #"rotatedone" );
    
    while ( true )
    {
        switch ( n_base )
        {
            case 99:
                n_ones = 9;
                n_tens = 9;
                var_b09f093e = 9;
                break;
            case 66:
                n_ones = 6;
                n_tens = 6;
                var_b09f093e = 6;
                break;
            case 33:
                n_ones = 3;
                n_tens = 3;
                var_b09f093e = 3;
                break;
        }
        
        if ( var_b09f093e > 0 )
        {
            var_50f6b3f4 rotateroll( n_step * var_b09f093e, 0.05 );
            var_d02e9cd rotateroll( n_step * var_b09f093e, 0.05 );
            var_d02e9cd waittill( #"rotatedone" );
        }
        
        level.population_count = n_base;
        
        while ( level.population_count > 0 )
        {
            if ( var_aa6e55d3 < level.total_zombies_killed - level.zombie_total_subtract )
            {
                n_ones--;
                n_time = set_dvar_float_if_unset( "scr_dial_rotate_time", "0.5" );
                
                if ( n_ones < 0 )
                {
                    n_ones = 9;
                    var_50f6b3f4 rotateroll( 0 - n_step, n_time );
                    var_50f6b3f4 playsound( "zmb_counter_flip" );
                    n_tens--;
                }
                
                if ( n_tens < 0 )
                {
                    n_tens = 9;
                }
                
                var_d02e9cd rotateroll( 0 - n_step, n_time );
                var_d02e9cd playsound( "zmb_counter_flip" );
                var_d02e9cd waittill( #"rotatedone" );
                level.population_count = n_ones + n_tens * 10;
                var_aa6e55d3++;
            }
            
            wait 0.05;
        }
        
        while ( level.population_count == 0 )
        {
            if ( var_aa6e55d3 < level.total_zombies_killed - level.zombie_total_subtract )
            {
                n_ones--;
                n_time = set_dvar_float_if_unset( "scr_dial_rotate_time", "0.5" );
                
                if ( n_ones < 0 )
                {
                    n_ones = 9;
                    n_tens--;
                }
                
                if ( n_tens < 0 )
                {
                    n_tens = 9;
                }
                
                level.population_count = n_ones + n_tens * 10;
                var_aa6e55d3++;
            }
            
            wait 0.05;
        }
    }
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 3
// Checksum 0x357286a3, Offset: 0xad0
// Size: 0x82
function set_dvar_float_if_unset( dvar, value, reset = 0 )
{
    if ( reset || getdvarstring( dvar ) == "" )
    {
        setdvar( dvar, value );
    }
    
    return getdvarfloat( dvar, 0 );
}

// Namespace zm_trial_white_population_control/zm_trial_white_population_control
// Params 0, eflags: 0x4
// Checksum 0x9c74f139, Offset: 0xb60
// Size: 0x72
function private function_a4adaedb()
{
    level endon( #"hash_7646638df88a3656" );
    level.var_382a24b0 = 1;
    n_threshold = level.total_zombies_killed + level.zombie_total;
    
    while ( n_threshold < level.total_zombies_killed )
    {
        waitframe( 1 );
    }
    
    level.var_382a24b0 = 0;
}

