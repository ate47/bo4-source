#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;

#namespace flag;

// Namespace flag/flag_shared
// Params 2
// Checksum 0x7c31e01f, Offset: 0xa0
// Size: 0xce
function init( str_flag, b_val = 0 )
{
    if ( !isdefined( self.flag ) )
    {
        self.flag = [];
    }
    
    if ( !isdefined( self.flag_count ) )
    {
        self.flag_count = [];
    }
    
    /#
        if ( !isdefined( level.first_frame ) )
        {
            assert( !isdefined( self.flag[ str_flag ] ), "<dev string:x38>" + str_flag + "<dev string:x62>" );
        }
    #/
    
    self.flag[ str_flag ] = b_val;
    self.flag_count[ str_flag ] = 0;
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xb974578b, Offset: 0x178
// Size: 0x28, Type: bool
function exists( str_flag )
{
    return isdefined( self.flag ) && isdefined( self.flag[ str_flag ] );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x1aa586a6, Offset: 0x1a8
// Size: 0x94
function set( str_flag )
{
    assert( exists( str_flag ), "<dev string:x71>" + function_9e72a96( str_flag ) + "<dev string:x8e>" );
    self.flag[ str_flag ] = 1;
    self notify( str_flag );
    trigger::set_flag_permissions( str_flag );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x302929bd, Offset: 0x248
// Size: 0x8c
function increment( str_flag )
{
    assert( exists( str_flag ), "<dev string:xaa>" + function_9e72a96( str_flag ) + "<dev string:x8e>" );
    self.flag_count[ str_flag ]++;
    set( str_flag );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x8549ba34, Offset: 0x2e0
// Size: 0xd4
function decrement( str_flag )
{
    assert( exists( str_flag ), "<dev string:xcd>" + function_9e72a96( str_flag ) + "<dev string:x8e>" );
    assert( self.flag_count[ str_flag ] > 0, "<dev string:xf0>" );
    self.flag_count[ str_flag ]--;
    
    if ( self.flag_count[ str_flag ] == 0 )
    {
        clear( str_flag );
    }
}

// Namespace flag/flag_shared
// Params 3
// Checksum 0x95e7a0e5, Offset: 0x3c0
// Size: 0x3c
function delay_set( n_delay, str_flag, str_cancel )
{
    self thread _delay_set( n_delay, str_flag, str_cancel );
}

// Namespace flag/flag_shared
// Params 3
// Checksum 0xc2ce69b3, Offset: 0x408
// Size: 0x5c
function _delay_set( n_delay, str_flag, str_cancel )
{
    if ( isdefined( str_cancel ) )
    {
        self endon( str_cancel );
    }
    
    self endon( #"death" );
    wait n_delay;
    set( str_flag );
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x544e2e12, Offset: 0x470
// Size: 0x6c
function set_val( str_flag, b_val )
{
    assert( isdefined( b_val ), "<dev string:x12f>" );
    
    if ( b_val )
    {
        set( str_flag );
        return;
    }
    
    clear( str_flag );
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x4b912ffe, Offset: 0x4e8
// Size: 0x64
function set_for_time( n_time, str_flag )
{
    self notify( "__flag::set_for_time__" + str_flag );
    self endon( "__flag::set_for_time__" + str_flag );
    set( str_flag );
    wait n_time;
    clear( str_flag );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x654b3639, Offset: 0x558
// Size: 0x8c
function clear( str_flag )
{
    assert( exists( str_flag ), "<dev string:x15d>" + str_flag + "<dev string:x8e>" );
    
    if ( self.flag[ str_flag ] )
    {
        self.flag[ str_flag ] = 0;
        self notify( str_flag );
        trigger::set_flag_permissions( str_flag );
    }
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xce83372, Offset: 0x5f0
// Size: 0x54
function toggle( str_flag )
{
    if ( get( str_flag ) )
    {
        clear( str_flag );
        return;
    }
    
    set( str_flag );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xa18869c3, Offset: 0x650
// Size: 0x58
function get( str_flag )
{
    assert( exists( str_flag ), "<dev string:x17c>" + str_flag + "<dev string:x8e>" );
    return self.flag[ str_flag ];
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x7792fb45, Offset: 0x6b0
// Size: 0x8a, Type: bool
function get_any( &array )
{
    foreach ( str_flag in array )
    {
        if ( get( str_flag ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xf6a742bd, Offset: 0x748
// Size: 0x8a, Type: bool
function get_all( &array )
{
    foreach ( str_flag in array )
    {
        if ( !get( str_flag ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x1ecaecb1, Offset: 0x7e0
// Size: 0x46
function wait_till( str_flag )
{
    self endon( #"death" );
    
    while ( !get( str_flag ) )
    {
        self waittill( str_flag );
    }
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x9af68855, Offset: 0x830
// Size: 0x84
function wait_till_timeout( n_timeout, str_flag )
{
    if ( isdefined( n_timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_timeout, "timeout" );
    }
    
    wait_till( str_flag );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xd750b1de, Offset: 0x8c0
// Size: 0x84
function wait_till_all( a_flags )
{
    self endon( #"death" );
    
    for ( i = 0; i < a_flags.size ; i++ )
    {
        str_flag = a_flags[ i ];
        
        if ( !get( str_flag ) )
        {
            self waittill( str_flag );
            i = -1;
        }
    }
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x6798ed8b, Offset: 0x950
// Size: 0x84
function wait_till_all_timeout( n_timeout, a_flags )
{
    if ( isdefined( n_timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_timeout, "timeout" );
    }
    
    wait_till_all( a_flags );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x6f719fa8, Offset: 0x9e0
// Size: 0xb4
function wait_till_any( a_flags )
{
    self endon( #"death" );
    
    foreach ( flag in a_flags )
    {
        if ( get( flag ) )
        {
            return { #_notify:flag };
        }
    }
    
    return self waittill( a_flags );
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x553af8b1, Offset: 0xaa0
// Size: 0x84
function wait_till_any_timeout( n_timeout, a_flags )
{
    if ( isdefined( n_timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_timeout, "timeout" );
    }
    
    wait_till_any( a_flags );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xa71d2ede, Offset: 0xb30
// Size: 0x46
function wait_till_clear( str_flag )
{
    self endon( #"death" );
    
    while ( get( str_flag ) )
    {
        self waittill( str_flag );
    }
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0xb432b1ad, Offset: 0xb80
// Size: 0x9c
function wait_till_clear_timeout( n_timeout, str_flag )
{
    self endon( #"death" );
    
    if ( isdefined( n_timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_timeout, "timeout" );
    }
    
    wait_till_clear( str_flag );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x9c143b3b, Offset: 0xc28
// Size: 0x84
function wait_till_clear_all( a_flags )
{
    self endon( #"death" );
    
    for ( i = 0; i < a_flags.size ; i++ )
    {
        str_flag = a_flags[ i ];
        
        if ( get( str_flag ) )
        {
            self waittill( str_flag );
            i = -1;
        }
    }
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x21e3fb34, Offset: 0xcb8
// Size: 0x10c
function function_5f02becb( n_timeout )
{
    if ( isdefined( n_timeout ) && n_timeout > 0 )
    {
        if ( isdefined( n_timeout ) )
        {
            __s = spawnstruct();
            __s endon( #"timeout" );
            __s util::delay_notify( n_timeout, "timeout" );
        }
    }
    
    if ( isdefined( self.script_flag_true ) )
    {
        var_ed5ed076 = util::create_flags_and_return_tokens( self.script_flag_true );
        level wait_till_all( var_ed5ed076 );
    }
    
    if ( isdefined( self.script_flag_false ) )
    {
        var_b1418b4 = util::create_flags_and_return_tokens( self.script_flag_false );
        level wait_till_clear_all( var_b1418b4 );
    }
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0xdb9c9d24, Offset: 0xdd0
// Size: 0x84
function wait_till_clear_all_timeout( n_timeout, a_flags )
{
    if ( isdefined( n_timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_timeout, "timeout" );
    }
    
    wait_till_clear_all( a_flags );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0xb326169d, Offset: 0xe60
// Size: 0xb0
function wait_till_clear_any( a_flags )
{
    self endon( #"death" );
    
    while ( true )
    {
        foreach ( flag in a_flags )
        {
            if ( !get( flag ) )
            {
                return flag;
            }
        }
        
        self waittill( a_flags );
    }
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x5bc2f98, Offset: 0xf18
// Size: 0x84
function wait_till_clear_any_timeout( n_timeout, a_flags )
{
    if ( isdefined( n_timeout ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_timeout, "timeout" );
    }
    
    wait_till_clear_any( a_flags );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x22ac3a30, Offset: 0xfa8
// Size: 0x54
function delete( str_flag )
{
    if ( isdefined( self.flag[ str_flag ] ) )
    {
        self.flag[ str_flag ] = undefined;
        return;
    }
    
    println( "<dev string:x192>" + str_flag );
}

// Namespace flag/flag_shared
// Params 0
// Checksum 0x95c7b48f, Offset: 0x1008
// Size: 0x34, Type: bool
function script_flag_wait()
{
    if ( isdefined( self.script_flag_wait ) )
    {
        self wait_till( self.script_flag_wait );
        return true;
    }
    
    return false;
}

