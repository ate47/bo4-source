#using scripts\core_common\util_shared;

#namespace clientfield;

// Namespace clientfield/clientfield_shared
// Params 5
// Checksum 0x75baacc0, Offset: 0x98
// Size: 0x54
function register( str_pool_name, str_name, n_version, n_bits, str_type )
{
    registerclientfield( str_pool_name, str_name, n_version, n_bits, str_type );
}

// Namespace clientfield/clientfield_shared
// Params 5
// Checksum 0x47c4a28d, Offset: 0xf8
// Size: 0x54
function register_clientuimodel( str_name, n_version, n_bits, str_type, var_59f69872 )
{
    registerclientfield( "clientuimodel", str_name, n_version, n_bits, str_type, var_59f69872 );
}

// Namespace clientfield/clientfield_shared
// Params 6
// Checksum 0xb3abb931, Offset: 0x158
// Size: 0x74
function register_luielem( unique_name, field_name, n_version, n_bits, str_type, var_59f69872 )
{
    registerclientfield( "clientuimodel", "luielement." + unique_name + "." + field_name, n_version, n_bits, str_type, var_59f69872 );
}

// Namespace clientfield/clientfield_shared
// Params 5
// Checksum 0xc2706ac, Offset: 0x1d8
// Size: 0x54
function register_bgcache( poolname, var_b693fec6, uniqueid, version, var_59f69872 )
{
    function_3ff577e6( poolname, var_b693fec6, uniqueid, version, var_59f69872 );
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0x43bdad39, Offset: 0x238
// Size: 0x84
function set( str_field_name, n_value )
{
    if ( !isdefined( str_field_name ) )
    {
        assertmsg( "<dev string:x38>" );
        return;
    }
    
    if ( self == level )
    {
        codesetworldclientfield( str_field_name, n_value );
        return;
    }
    
    codesetclientfield( self, str_field_name, n_value );
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0xf8b41e42, Offset: 0x2c8
// Size: 0x22
function can_set( str_field_name, n_value )
{
    return function_26b3a620();
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0x8324b1e, Offset: 0x2f8
// Size: 0x84
function set_to_player( str_field_name, n_value )
{
    assert( isplayer( self ), "<dev string:x77>" );
    
    if ( isplayer( self ) )
    {
        codesetplayerstateclientfield( self, str_field_name, n_value );
    }
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0x95984f53, Offset: 0x388
// Size: 0x2c
function set_player_uimodel( str_field_name, n_value )
{
    codesetuimodelclientfield( self, str_field_name, n_value );
}

// Namespace clientfield/clientfield_shared
// Params 3
// Checksum 0x5a63c238, Offset: 0x3c0
// Size: 0x4c
function function_9bf78ef8( unique_name, str_field_name, n_value )
{
    codesetuimodelclientfield( self, "luielement." + unique_name + "." + str_field_name, n_value );
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0x917a406c, Offset: 0x418
// Size: 0x44
function function_bb878fc3( unique_name, str_field_name )
{
    codeincrementuimodelclientfield( self, "luielement." + unique_name + "." + str_field_name );
}

// Namespace clientfield/clientfield_shared
// Params 1
// Checksum 0x580a3755, Offset: 0x468
// Size: 0x22
function get_player_uimodel( str_field_name )
{
    return codegetuimodelclientfield( self, str_field_name );
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0xffe6398d, Offset: 0x498
// Size: 0x42
function function_f7ae6994( unique_name, str_field_name )
{
    return codegetuimodelclientfield( self, "luielement." + unique_name + "." + str_field_name );
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0xf98ea7fc, Offset: 0x4e8
// Size: 0x2c
function set_world_uimodel( str_field_name, n_value )
{
    codesetworlduimodelfield( str_field_name, n_value );
}

// Namespace clientfield/clientfield_shared
// Params 1
// Checksum 0xa85463bb, Offset: 0x520
// Size: 0x22
function get_world_uimodel( str_field_name )
{
    return codegetworlduimodelfield( str_field_name );
}

// Namespace clientfield/clientfield_shared
// Params 1
// Checksum 0x2a23fa6, Offset: 0x550
// Size: 0x22
function increment_world_uimodel( str_field_name )
{
    return codeincrementworlduimodelfield( str_field_name );
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0x8d55c4c5, Offset: 0x580
// Size: 0x2c
function increment( str_field_name, n_increment_count )
{
    self thread _increment( str_field_name, n_increment_count );
}

// Namespace clientfield/clientfield_shared
// Params 2, eflags: 0x4
// Checksum 0xfbea2e95, Offset: 0x5b8
// Size: 0xde
function private _increment( str_field_name, n_increment_count = 1 )
{
    if ( self != level )
    {
        self endon( #"death" );
    }
    
    for ( i = 0; i < n_increment_count ; i++ )
    {
        if ( self == level )
        {
            codeincrementworldclientfield( str_field_name );
            continue;
        }
        
        waittillframeend();
        
        if ( isdefined( self.birthtime ) && self.birthtime >= level.var_58bc5d04 )
        {
            util::wait_network_frame();
        }
        
        codeincrementclientfield( self, str_field_name );
    }
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0xe2f4ee24, Offset: 0x6a0
// Size: 0x106
function increment_uimodel( str_field_name, n_increment_count = 1 )
{
    if ( self == level )
    {
        foreach ( player in level.players )
        {
            for ( i = 0; i < n_increment_count ; i++ )
            {
                codeincrementuimodelclientfield( player, str_field_name );
            }
        }
        
        return;
    }
    
    for ( i = 0; i < n_increment_count ; i++ )
    {
        codeincrementuimodelclientfield( self, str_field_name );
    }
}

// Namespace clientfield/clientfield_shared
// Params 2
// Checksum 0xd0e04c57, Offset: 0x7b0
// Size: 0x5e
function increment_to_player( str_field_name, n_increment_count = 1 )
{
    for ( i = 0; i < n_increment_count ; i++ )
    {
        codeincrementplayerstateclientfield( self, str_field_name );
    }
}

// Namespace clientfield/clientfield_shared
// Params 1
// Checksum 0x4f448b88, Offset: 0x818
// Size: 0x44
function get( str_field_name )
{
    if ( self == level )
    {
        return codegetworldclientfield( str_field_name );
    }
    
    return codegetclientfield( self, str_field_name );
}

// Namespace clientfield/clientfield_shared
// Params 1
// Checksum 0xd659b299, Offset: 0x868
// Size: 0x22
function get_to_player( field_name )
{
    return codegetplayerstateclientfield( self, field_name );
}

