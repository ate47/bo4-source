#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace player_insertion_choice;

// Namespace player_insertion_choice
// Method(s) 6 Total 13
class cplayer_insertion_choice : cluielem
{

    var _uid;

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 2
    // Checksum 0xc60874c, Offset: 0x2d0
    // Size: 0x13c
    function set_state( player, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 0 );
            return;
        }
        
        if ( #"groundvehicle" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 1 );
            return;
        }
        
        if ( #"halojump" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 2 );
            return;
        }
        
        if ( #"heli" == state_name )
        {
            player clientfield::function_9bf78ef8( _uid, "_state", 3 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1
    // Checksum 0x33e0f342, Offset: 0x2a0
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 2
    // Checksum 0xec0be477, Offset: 0x250
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "player_insertion_choice", persistent );
    }

    // Namespace cplayer_insertion_choice/player_insertion_choice
    // Params 1
    // Checksum 0xff882a3c, Offset: 0x1f8
    // Size: 0x4c
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 2, "int" );
    }

}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1
// Checksum 0x289cfca3, Offset: 0xd0
// Size: 0x40
function register( uid )
{
    elem = new cplayer_insertion_choice();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 2
// Checksum 0x58e7239d, Offset: 0x118
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1
// Checksum 0x88b3a92, Offset: 0x158
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 1
// Checksum 0xb1260aa3, Offset: 0x180
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

// Namespace player_insertion_choice/player_insertion_choice
// Params 2
// Checksum 0xd6608380, Offset: 0x1a8
// Size: 0x28
function set_state( player, state_name )
{
    [[ self ]]->set_state( player, state_name );
}

