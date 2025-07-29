#using scripts\core_common\util_shared;

#namespace flag;

// Namespace flag/flag_shared
// Params 3
// Checksum 0xbc82a342, Offset: 0x98
// Size: 0xb2
function init( str_flag, b_val = 0, b_is_trigger = 0 )
{
    if ( !isdefined( self.flag ) )
    {
        self.flag = [];
    }
    
    /#
        if ( !isdefined( level.first_frame ) )
        {
            assert( !isdefined( self.flag[ str_flag ] ), "<dev string:x38>" + str_flag + "<dev string:x62>" );
        }
    #/
    
    self.flag[ str_flag ] = b_val;
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x4ef6855b, Offset: 0x158
// Size: 0x28, Type: bool
function exists( str_flag )
{
    return isdefined( self.flag ) && isdefined( self.flag[ str_flag ] );
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x8d3f413f, Offset: 0x188
// Size: 0x82
function set( str_flag )
{
    assert( exists( str_flag ), "<dev string:x71>" + function_9e72a96( str_flag ) + "<dev string:x8e>" );
    self.flag[ str_flag ] = 1;
    self notify( str_flag );
}

// Namespace flag/flag_shared
// Params 3
// Checksum 0x5f98e0, Offset: 0x218
// Size: 0x3c
function delay_set( n_delay, str_flag, str_cancel )
{
    self thread _delay_set( n_delay, str_flag, str_cancel );
}

// Namespace flag/flag_shared
// Params 3
// Checksum 0x668e81b4, Offset: 0x260
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
// Checksum 0x74daf04c, Offset: 0x2c8
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
// Checksum 0x81d702b8, Offset: 0x338
// Size: 0x76
function clear( str_flag )
{
    assert( exists( str_flag ), "<dev string:xaa>" + str_flag + "<dev string:x8e>" );
    
    if ( self.flag[ str_flag ] )
    {
        self.flag[ str_flag ] = 0;
        self notify( str_flag );
    }
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x89cf1be1, Offset: 0x3b8
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
// Checksum 0xdd02bece, Offset: 0x418
// Size: 0x58
function get( str_flag )
{
    assert( exists( str_flag ), "<dev string:xc9>" + str_flag + "<dev string:x8e>" );
    return self.flag[ str_flag ];
}

// Namespace flag/flag_shared
// Params 1
// Checksum 0x411f40f3, Offset: 0x478
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
// Checksum 0x43adc6bc, Offset: 0x4c8
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
// Checksum 0x105b4a61, Offset: 0x558
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
// Checksum 0xcc12e536, Offset: 0x5e8
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
// Checksum 0x7f17e06c, Offset: 0x678
// Size: 0xa4
function wait_till_any( a_flags )
{
    self endon( #"death" );
    
    foreach ( flag in a_flags )
    {
        if ( get( flag ) )
        {
            return flag;
        }
    }
    
    self waittill( a_flags );
}

// Namespace flag/flag_shared
// Params 2
// Checksum 0x63dd37ce, Offset: 0x728
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
// Checksum 0xfd25e8c8, Offset: 0x7b8
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
// Checksum 0x8941aee1, Offset: 0x808
// Size: 0x84
function wait_till_clear_timeout( n_timeout, str_flag )
{
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
// Checksum 0x4eddf903, Offset: 0x898
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
// Params 2
// Checksum 0x4b402ff7, Offset: 0x928
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
// Checksum 0x5d6c95a9, Offset: 0x9b8
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
// Checksum 0x4266045a, Offset: 0xa70
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
// Checksum 0x5c179019, Offset: 0xb00
// Size: 0x54
function delete( str_flag )
{
    if ( isdefined( self.flag[ str_flag ] ) )
    {
        self.flag[ str_flag ] = undefined;
        return;
    }
    
    println( "<dev string:xdf>" + str_flag );
}

