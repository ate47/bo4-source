#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace revive_hud;

// Namespace revive_hud
// Method(s) 8 Total 15
class crevive_hud : cluielem
{

    var _uid;

    // Namespace crevive_hud/revive_hud
    // Params 2
    // Checksum 0xef18594c, Offset: 0x420
    // Size: 0x3c
    function set_fadetime( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "fadeTime", value );
    }

    // Namespace crevive_hud/revive_hud
    // Params 2
    // Checksum 0x4eef2d1, Offset: 0x3d8
    // Size: 0x3c
    function set_clientnum( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "clientNum", value );
    }

    // Namespace crevive_hud/revive_hud
    // Params 2
    // Checksum 0xe48cc578, Offset: 0x390
    // Size: 0x3c
    function set_text( player, value )
    {
        player clientfield::function_9bf78ef8( _uid, "text", value );
    }

    // Namespace crevive_hud/revive_hud
    // Params 1
    // Checksum 0xa06177e0, Offset: 0x360
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace crevive_hud/revive_hud
    // Params 2
    // Checksum 0xca70395a, Offset: 0x310
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "revive_hud", persistent );
    }

    // Namespace crevive_hud/revive_hud
    // Params 1
    // Checksum 0xc7f4eca2, Offset: 0x268
    // Size: 0x9c
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::function_dcb34c80( "string", "text", 1 );
        cluielem::add_clientfield( "clientNum", 1, 6, "int" );
        cluielem::add_clientfield( "fadeTime", 1, 5, "int" );
    }

}

// Namespace revive_hud/revive_hud
// Params 1
// Checksum 0xc88c96a8, Offset: 0xe0
// Size: 0x40
function register( uid )
{
    elem = new crevive_hud();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace revive_hud/revive_hud
// Params 2
// Checksum 0x7fbcbdac, Offset: 0x128
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace revive_hud/revive_hud
// Params 1
// Checksum 0xf65dd395, Offset: 0x168
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace revive_hud/revive_hud
// Params 1
// Checksum 0x42c392a4, Offset: 0x190
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

// Namespace revive_hud/revive_hud
// Params 2
// Checksum 0xa25a0f67, Offset: 0x1b8
// Size: 0x28
function set_text( player, value )
{
    [[ self ]]->set_text( player, value );
}

// Namespace revive_hud/revive_hud
// Params 2
// Checksum 0x12ebf496, Offset: 0x1e8
// Size: 0x28
function set_clientnum( player, value )
{
    [[ self ]]->set_clientnum( player, value );
}

// Namespace revive_hud/revive_hud
// Params 2
// Checksum 0x9930f51f, Offset: 0x218
// Size: 0x28
function set_fadetime( player, value )
{
    [[ self ]]->set_fadetime( player, value );
}

