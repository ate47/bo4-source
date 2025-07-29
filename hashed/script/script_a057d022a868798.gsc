#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;

#namespace namespace_d30b9d9b;

// Namespace namespace_d30b9d9b/namespace_719e95ce
// Params 0, eflags: 0x2
// Checksum 0x2962c3c8, Offset: 0x80
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_2dccaaff9ebe6851", &__init__, undefined, undefined );
}

// Namespace namespace_d30b9d9b/namespace_719e95ce
// Params 0
// Checksum 0x2a647536, Offset: 0xc8
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"hash_3a3072e83c70889c", &on_begin, &on_end );
}

// Namespace namespace_d30b9d9b/namespace_719e95ce
// Params 1, eflags: 0x4
// Checksum 0xdd0b9891, Offset: 0x130
// Size: 0x4c
function private on_begin( var_ff22cb62 )
{
    self.var_ff22cb62 = zm_trial::function_5769f26a( var_ff22cb62 );
    self.var_6a7521e3 = 0;
    self thread function_53627246();
}

// Namespace namespace_d30b9d9b/namespace_719e95ce
// Params 1, eflags: 0x4
// Checksum 0xe791f91, Offset: 0x188
// Size: 0xe4
function private on_end( round_reset )
{
    zm_trial_util::function_f3dbeda7();
    
    foreach ( s_portal in level.a_s_portals )
    {
        s_portal.var_5b12474a = undefined;
    }
    
    if ( isdefined( level.s_cage_portal ) )
    {
        level.s_cage_portal.var_5b12474a = undefined;
    }
    
    if ( !round_reset )
    {
        if ( self.var_6a7521e3 < self.var_ff22cb62 )
        {
            zm_trial::fail( #"hash_6a1df2dbfb66a948" );
        }
    }
}

// Namespace namespace_d30b9d9b/namespace_719e95ce
// Params 0, eflags: 0x4
// Checksum 0x86ffb166, Offset: 0x278
// Size: 0x12c
function private function_53627246()
{
    level endon( #"hash_7646638df88a3656", #"end_game" );
    zm_trial_util::function_2976fa44( self.var_ff22cb62 );
    zm_trial_util::function_dace284( self.var_6a7521e3 );
    
    while ( true )
    {
        s_waitresult = level waittill( #"portal_used" );
        
        if ( !( isdefined( s_waitresult.s_portal.var_5b12474a ) && s_waitresult.s_portal.var_5b12474a ) )
        {
            s_waitresult.s_portal.var_5b12474a = 1;
            self.var_6a7521e3++;
            zm_trial_util::function_dace284( self.var_6a7521e3 );
        }
        
        if ( self.var_6a7521e3 == self.var_ff22cb62 )
        {
            zm_trial_util::function_7d32b7d0( 1 );
            break;
        }
    }
}

