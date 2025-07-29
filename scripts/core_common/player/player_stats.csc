#namespace stats;

/#

    // Namespace stats/player_stats
    // Params 2
    // Checksum 0x4c4b2921, Offset: 0x68
    // Size: 0x124, Type: dev
    function function_d92cb558( result, vararg )
    {
        if ( !isdefined( result ) )
        {
            pathstr = ishash( vararg[ 0 ] ) ? function_9e72a96( vararg[ 0 ] ) : vararg[ 0 ];
            
            if ( !isdefined( pathstr ) )
            {
                return;
            }
            
            for ( i = 1; i < vararg.size ; i++ )
            {
                pathstr = pathstr + "<dev string:x38>" + ( ishash( vararg[ i ] ) ? function_9e72a96( vararg[ i ] ) : vararg[ i ] );
            }
            
            println( "<dev string:x3c>" + pathstr );
        }
    }

#/

// Namespace stats/player_stats
// Params 2, eflags: 0x20 variadic
// Checksum 0x7d4d009b, Offset: 0x198
// Size: 0x68
function get_stat( localclientnum, ... )
{
    result = readstat( localclientnum, currentsessionmode(), vararg );
    
    /#
        function_d92cb558( result, vararg );
    #/
    
    return result;
}

// Namespace stats/player_stats
// Params 3, eflags: 0x20 variadic
// Checksum 0x75a37c2b, Offset: 0x208
// Size: 0x68
function function_842e069e( localclientnum, sessionmode, ... )
{
    result = readstat( localclientnum, sessionmode, vararg );
    
    /#
        function_d92cb558( result, vararg );
    #/
    
    return result;
}

// Namespace stats/player_stats
// Params 2
// Checksum 0xba83d867, Offset: 0x278
// Size: 0x42
function get_stat_global( localclientnum, statname )
{
    return get_stat( localclientnum, #"playerstatslist", statname, #"statvalue" );
}

