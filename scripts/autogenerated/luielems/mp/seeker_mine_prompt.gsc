#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace seeker_mine_prompt;

// Namespace seeker_mine_prompt
// Method(s) 7 Total 14
class cseeker_mine_prompt : cluielem
{

    var _uid;

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 2
    // Checksum 0xb72d4e15, Offset: 0x380
    // Size: 0x3c
    function set_promptstate( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "promptState", value );
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 2
    // Checksum 0x4a765bae, Offset: 0x338
    // Size: 0x3c
    function set_progress( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "progress", value );
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 1
    // Checksum 0xd31bb692, Offset: 0x308
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 2
    // Checksum 0x8a312c9c, Offset: 0x2b8
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "seeker_mine_prompt", persistent );
    }

    // Namespace cseeker_mine_prompt/seeker_mine_prompt
    // Params 1
    // Checksum 0x7ac5dc51, Offset: 0x238
    // Size: 0x74
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "progress", 1, 5, "float" );
        cluielem::add_clientfield( "promptState", 1, 2, "int" );
    }

}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1
// Checksum 0xc7c19110, Offset: 0xe0
// Size: 0x40
function register( uid )
{
    elem = new cseeker_mine_prompt();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 2
// Checksum 0xe65cb3fe, Offset: 0x128
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1
// Checksum 0x7879c02b, Offset: 0x168
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 1
// Checksum 0x551f3e7e, Offset: 0x190
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 2
// Checksum 0x22fb9802, Offset: 0x1b8
// Size: 0x28
function set_progress( player, value )
{
    [[ self ]]->set_progress( player, value );
}

// Namespace seeker_mine_prompt/seeker_mine_prompt
// Params 2
// Checksum 0xc2a9ea5b, Offset: 0x1e8
// Size: 0x28
function set_promptstate( player, value )
{
    [[ self ]]->set_promptstate( player, value );
}

