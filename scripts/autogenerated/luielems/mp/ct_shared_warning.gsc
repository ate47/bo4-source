#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace ct_shared_warning;

// Namespace ct_shared_warning
// Method(s) 7 Total 14
class cct_shared_warning : cluielem
{

    var _uid;

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 2
    // Checksum 0x1b30b476, Offset: 0x5b8
    // Size: 0x3c
    function set_objpoints( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "objpoints", value );
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 2
    // Checksum 0x3d7c9c39, Offset: 0x330
    // Size: 0x27c
    function set_state( player, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 0 );
            return;
        }
        
        if ( #"warnheal_fadeout" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 1 );
            return;
        }
        
        if ( #"hash_5e59fb81ffd2fd6b" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 2 );
            return;
        }
        
        if ( #"hash_4d78e6d4caf789ce" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 3 );
            return;
        }
        
        if ( #"warnheal" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 4 );
            return;
        }
        
        if ( #"warnheal_cycle1" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 5 );
            return;
        }
        
        if ( #"warnheal_cycle2" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 6 );
            return;
        }
        
        if ( #"hash_5ae2f5a909a5efa9" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 7 );
            return;
        }
        
        if ( #"hash_5ae2f2a909a5ea90" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 8 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 1
    // Checksum 0xe1166fef, Offset: 0x300
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 2
    // Checksum 0x1f41c5d5, Offset: 0x2b0
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "ct_shared_warning", persistent );
    }

    // Namespace cct_shared_warning/ct_shared_warning
    // Params 1
    // Checksum 0xd81d1597, Offset: 0x230
    // Size: 0x74
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 4, "int" );
        cluielem::add_clientfield( "objpoints", 1, 11, "int" );
    }

}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1
// Checksum 0x286440ce, Offset: 0xd8
// Size: 0x40
function register( uid )
{
    elem = new cct_shared_warning();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 2
// Checksum 0xd80b734e, Offset: 0x120
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1
// Checksum 0xfc080168, Offset: 0x160
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 1
// Checksum 0x8bd26e7f, Offset: 0x188
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 2
// Checksum 0x3b095ebb, Offset: 0x1b0
// Size: 0x28
function set_state( player, state_name )
{
    [[ self ]]->set_state( player, state_name );
}

// Namespace ct_shared_warning/ct_shared_warning
// Params 2
// Checksum 0x9892acd0, Offset: 0x1e0
// Size: 0x28
function set_objpoints( player, value )
{
    [[ self ]]->set_objpoints( player, value );
}

