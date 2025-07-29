#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_shared_aar;

// Namespace ct_shared_aar
// Method(s) 10 Total 17
class cct_shared_aar : cluielem
{

    var _uid;

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2
    // Checksum 0x575dd738, Offset: 0x8a0
    // Size: 0x3c
    function set_medalthresholds( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "medalThresholds", value );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2
    // Checksum 0x95d6c8ea, Offset: 0x858
    // Size: 0x3c
    function set_missionresultmsg( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "missionResultMsg", value );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2
    // Checksum 0x12735d8e, Offset: 0x810
    // Size: 0x3c
    function set_besttimemilliseconds( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "bestTimeMilliseconds", value );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2
    // Checksum 0x72f42b4c, Offset: 0x7c8
    // Size: 0x3c
    function set_timemilliseconds( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "timeMilliseconds", value );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2
    // Checksum 0xa6d10e28, Offset: 0x480
    // Size: 0x33c
    function set_state( player, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 0 );
            return;
        }
        
        if ( #"success_fadeout" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 1 );
            return;
        }
        
        if ( #"hash_e4c570778eda419" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 2 );
            return;
        }
        
        if ( #"fail" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 3 );
            return;
        }
        
        if ( #"fail_fadeout" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 4 );
            return;
        }
        
        if ( #"win_gold" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 5 );
            return;
        }
        
        if ( #"win_silver" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 6 );
            return;
        }
        
        if ( #"win_bronze" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 7 );
            return;
        }
        
        if ( #"hash_18174a43e0ca3b90" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 8 );
            return;
        }
        
        if ( #"hash_3327faf4ae535f2b" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 9 );
            return;
        }
        
        if ( #"hash_32ceb5e1ecc00d78" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 10 );
            return;
        }
        
        if ( #"hash_71b423d13c228d59" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 11 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 1
    // Checksum 0x9ce38524, Offset: 0x450
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 2
    // Checksum 0x1c53dec8, Offset: 0x400
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "ct_shared_aar", persistent );
    }

    // Namespace cct_shared_aar/ct_shared_aar
    // Params 1
    // Checksum 0xeb2ef562, Offset: 0x308
    // Size: 0xec
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 4, "int" );
        cluielem::add_clientfield( "timeMilliseconds", 1, 14, "int" );
        cluielem::add_clientfield( "bestTimeMilliseconds", 1, 14, "int" );
        cluielem::function_dcb34c80( "string", "missionResultMsg", 1 );
        cluielem::function_dcb34c80( "string", "medalThresholds", 1 );
    }

}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1
// Checksum 0x63f838f2, Offset: 0x120
// Size: 0x40
function register( uid )
{
    elem = new cct_shared_aar();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2
// Checksum 0xb1fcaf2a, Offset: 0x168
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1
// Checksum 0x5c203699, Offset: 0x1a8
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 1
// Checksum 0x348a786c, Offset: 0x1d0
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2
// Checksum 0x8aa3e1e1, Offset: 0x1f8
// Size: 0x28
function set_state( player, state_name )
{
    [[ self ]]->set_state( player, state_name );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2
// Checksum 0x443b6d4d, Offset: 0x228
// Size: 0x28
function set_timemilliseconds( player, value )
{
    [[ self ]]->set_timemilliseconds( player, value );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2
// Checksum 0x392203df, Offset: 0x258
// Size: 0x28
function set_besttimemilliseconds( player, value )
{
    [[ self ]]->set_besttimemilliseconds( player, value );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2
// Checksum 0xf30d7adb, Offset: 0x288
// Size: 0x28
function set_missionresultmsg( player, value )
{
    [[ self ]]->set_missionresultmsg( player, value );
}

// Namespace ct_shared_aar/ct_shared_aar
// Params 2
// Checksum 0x6db80e2d, Offset: 0x2b8
// Size: 0x28
function set_medalthresholds( player, value )
{
    [[ self ]]->set_medalthresholds( player, value );
}

