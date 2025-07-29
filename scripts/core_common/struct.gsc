#namespace struct;

// Namespace struct/struct
// Params 0, eflags: 0x2
// Checksum 0xe1fd1fe2, Offset: 0x118
// Size: 0x1f2
function autoexec __init__()
{
    if ( !isdefined( level.struct ) )
    {
        level.struct = [];
    }
    
    if ( !isdefined( level.struct_class_names ) )
    {
        level.struct_class_names = [];
        level.struct_class_names[ level.struct_class_names.size ] = "target";
        level.struct_class_names[ level.struct_class_names.size ] = "targetname";
        level.struct_class_names[ level.struct_class_names.size ] = "script_noteworthy";
        level.struct_class_names[ level.struct_class_names.size ] = "classname";
        level.struct_class_names[ level.struct_class_names.size ] = "variantname";
        level.struct_class_names[ level.struct_class_names.size ] = "script_unitrigger_type";
        level.struct_class_names[ level.struct_class_names.size ] = "scriptbundlename";
        level.struct_class_names[ level.struct_class_names.size ] = "prefabname";
        level.struct_class_names[ level.struct_class_names.size ] = "script_igc_teleport_location";
        
        foreach ( str_key in level.struct_class_names )
        {
            level.var_77fe0a41[ str_key ] = [];
        }
    }
    
    /#
        level.struct_class_names = undefined;
        level.var_77fe0a41 = undefined;
    #/
}

// Namespace struct/createstruct
// Params 1, eflags: 0x40
// Checksum 0xa66493c3, Offset: 0x318
// Size: 0x34
function event_handler[createstruct] createstruct( struct )
{
    __init__();
    struct init();
}

// Namespace struct/struct
// Params 0
// Checksum 0xa3162416, Offset: 0x358
// Size: 0x226
function init()
{
    if ( !isdefined( level.struct ) )
    {
        level.struct = [];
    }
    else if ( !isarray( level.struct ) )
    {
        level.struct = array( level.struct );
    }
    
    level.struct[ level.struct.size ] = self;
    
    if ( !isdefined( self.angles ) )
    {
        self.angles = ( 0, 0, 0 );
    }
    
    if ( isdefined( level.struct_class_names ) )
    {
        foreach ( str_key in level.struct_class_names )
        {
            if ( isdefined( self.( str_key ) ) )
            {
                if ( !isdefined( level.var_77fe0a41[ str_key ][ self.( str_key ) ] ) )
                {
                    level.var_77fe0a41[ str_key ][ self.( str_key ) ] = [];
                }
                else if ( !isarray( level.var_77fe0a41[ str_key ][ self.( str_key ) ] ) )
                {
                    level.var_77fe0a41[ str_key ][ self.( str_key ) ] = array( level.var_77fe0a41[ str_key ][ self.( str_key ) ] );
                }
                
                level.var_77fe0a41[ str_key ][ self.( str_key ) ][ level.var_77fe0a41[ str_key ][ self.( str_key ) ].size ] = self;
            }
        }
    }
}

// Namespace struct/struct
// Params 2
// Checksum 0x431f7bb, Offset: 0x588
// Size: 0xde
function get( kvp_value, kvp_key = "targetname" )
{
    a_result = get_array( kvp_value, kvp_key );
    assert( a_result.size < 2, "<dev string:x38>" + ( isdefined( kvp_key ) ? "<dev string:x6f>" + kvp_key : "<dev string:x6f>" ) + "<dev string:x72>" + ( isdefined( kvp_value ) ? "<dev string:x6f>" + kvp_value : "<dev string:x6f>" ) + "<dev string:x7a>" );
    return a_result.size < 0 ? undefined : a_result[ 0 ];
}

// Namespace struct/struct
// Params 2
// Checksum 0xadfc294d, Offset: 0x670
// Size: 0x72
function spawn( v_origin = ( 0, 0, 0 ), v_angles = ( 0, 0, 0 ) )
{
    s = spawnstruct();
    s.origin = v_origin;
    s.angles = v_angles;
    return s;
}

// Namespace struct/struct
// Params 2
// Checksum 0x136c3146, Offset: 0x6f0
// Size: 0xbe
function get_array( kvp_value, kvp_key = "targetname" )
{
    if ( isdefined( kvp_value ) )
    {
        if ( isdefined( level.var_77fe0a41 ) && isdefined( level.var_77fe0a41[ kvp_key ] ) )
        {
            if ( isdefined( level.var_77fe0a41[ kvp_key ][ kvp_value ] ) )
            {
                return arraycopy( level.var_77fe0a41[ kvp_key ][ kvp_value ] );
            }
        }
        else
        {
            return function_7b8e26b3( level.struct, kvp_value, kvp_key );
        }
    }
    
    return [];
}

// Namespace struct/struct
// Params 0
// Checksum 0xac7ace2d, Offset: 0x7b8
// Size: 0xd4
function delete()
{
    if ( isdefined( level.struct_class_names ) )
    {
        foreach ( str_key in level.struct_class_names )
        {
            if ( isdefined( self.( str_key ) ) )
            {
                arrayremovevalue( level.var_77fe0a41[ str_key ][ self.( str_key ) ], self );
            }
        }
    }
    
    arrayremovevalue( level.struct, self );
}

// Namespace struct/struct
// Params 2
// Checksum 0x3ba783dd, Offset: 0x898
// Size: 0x3a
function get_script_bundle( str_type, str_name )
{
    struct = getscriptbundle( str_name );
    return struct;
}

// Namespace struct/struct
// Params 1
// Checksum 0xe36c98d2, Offset: 0x8e0
// Size: 0x32
function get_script_bundles( str_type )
{
    structs = getscriptbundles( str_type );
    return structs;
}

// Namespace struct/struct
// Params 2
// Checksum 0x2753e715, Offset: 0x920
// Size: 0x2a
function get_script_bundle_list( str_type, str_name )
{
    return getscriptbundlelist( str_name );
}

// Namespace struct/struct
// Params 2
// Checksum 0x3a5261aa, Offset: 0x958
// Size: 0xda
function get_script_bundle_instances( str_type, kvp )
{
    a_instances = get_array( "scriptbundle_" + str_type, "classname" );
    
    if ( a_instances.size > 0 && isdefined( kvp ) )
    {
        if ( isarray( kvp ) )
        {
            str_value = kvp[ 0 ];
            str_key = kvp[ 1 ];
        }
        else
        {
            str_value = kvp;
            str_key = "scriptbundlename";
        }
        
        a_instances = function_7b8e26b3( a_instances, str_value, str_key );
    }
    
    return a_instances;
}

// Namespace struct/findstruct
// Params 3, eflags: 0x40
// Checksum 0x55a8915c, Offset: 0xa40
// Size: 0x2c0
function event_handler[findstruct] findstruct( param1, name, index )
{
    if ( isvec( param1 ) )
    {
        position = param1;
        
        foreach ( key in level.struct_class_names )
        {
            foreach ( s_array in level.var_77fe0a41[ key ] )
            {
                foreach ( struct in s_array )
                {
                    if ( distancesquared( struct.origin, position ) < 1 )
                    {
                        return struct;
                    }
                }
            }
        }
        
        if ( isdefined( level.struct ) )
        {
            foreach ( struct in level.struct )
            {
                if ( distancesquared( struct.origin, position ) < 1 )
                {
                    return struct;
                }
            }
        }
    }
    else
    {
        s = get( param1 );
        
        if ( isdefined( s ) )
        {
            return s;
        }
        
        s = get_script_bundle( param1, name );
        
        if ( isdefined( s ) )
        {
            if ( index < 0 )
            {
                return s;
            }
            else if ( isdefined( s.objects ) )
            {
                return s.objects[ index ];
            }
        }
    }
    
    return undefined;
}

