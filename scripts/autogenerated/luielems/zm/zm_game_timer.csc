#using scripts\core_common\lui_shared;

#namespace zm_game_timer;

// Namespace zm_game_timer
// Method(s) 9 Total 15
class czm_game_timer : cluielem
{

    // Namespace czm_game_timer/zm_game_timer
    // Params 2
    // Checksum 0x244b186e, Offset: 0x4b8
    // Size: 0x30
    function set_showzero( localclientnum, value )
    {
        set_data( localclientnum, "showzero", value );
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 2
    // Checksum 0x474eea73, Offset: 0x480
    // Size: 0x30
    function set_minutes( localclientnum, value )
    {
        set_data( localclientnum, "minutes", value );
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 2
    // Checksum 0x44eb424d, Offset: 0x448
    // Size: 0x30
    function set_seconds( localclientnum, value )
    {
        set_data( localclientnum, "seconds", value );
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 1
    // Checksum 0x91f1521, Offset: 0x410
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"zm_game_timer" );
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 1
    // Checksum 0xe2a72655, Offset: 0x390
    // Size: 0x78
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "seconds", 0 );
        set_data( localclientnum, "minutes", 0 );
        set_data( localclientnum, "showzero", 0 );
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 1
    // Checksum 0xdefb438d, Offset: 0x360
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace czm_game_timer/zm_game_timer
    // Params 4
    // Checksum 0xfb9f5f43, Offset: 0x2a0
    // Size: 0xb4
    function setup_clientfields( uid, var_b1de907e, var_359a4d9a, var_8fd8bfaa )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "seconds", 1, 6, "int", var_b1de907e );
        cluielem::add_clientfield( "minutes", 1, 9, "int", var_359a4d9a );
        cluielem::add_clientfield( "showzero", 1, 1, "int", var_8fd8bfaa );
    }

}

// Namespace zm_game_timer/zm_game_timer
// Params 4
// Checksum 0x770ef87a, Offset: 0xc0
// Size: 0x64
function register( uid, var_b1de907e, var_359a4d9a, var_8fd8bfaa )
{
    elem = new czm_game_timer();
    [[ elem ]]->setup_clientfields( uid, var_b1de907e, var_359a4d9a, var_8fd8bfaa );
    return elem;
}

// Namespace zm_game_timer/zm_game_timer
// Params 1
// Checksum 0x1aa696be, Offset: 0x130
// Size: 0x40
function register_clientside( uid )
{
    elem = new czm_game_timer();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace zm_game_timer/zm_game_timer
// Params 1
// Checksum 0xcb4327c5, Offset: 0x178
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace zm_game_timer/zm_game_timer
// Params 1
// Checksum 0x30c88b9b, Offset: 0x1a0
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace zm_game_timer/zm_game_timer
// Params 1
// Checksum 0xdca510b8, Offset: 0x1c8
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace zm_game_timer/zm_game_timer
// Params 2
// Checksum 0x73b55ebe, Offset: 0x1f0
// Size: 0x28
function set_seconds( localclientnum, value )
{
    [[ self ]]->set_seconds( localclientnum, value );
}

// Namespace zm_game_timer/zm_game_timer
// Params 2
// Checksum 0xfda88e29, Offset: 0x220
// Size: 0x28
function set_minutes( localclientnum, value )
{
    [[ self ]]->set_minutes( localclientnum, value );
}

// Namespace zm_game_timer/zm_game_timer
// Params 2
// Checksum 0xb436270d, Offset: 0x250
// Size: 0x28
function set_showzero( localclientnum, value )
{
    [[ self ]]->set_showzero( localclientnum, value );
}

