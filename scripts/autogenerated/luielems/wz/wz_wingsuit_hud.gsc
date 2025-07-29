#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace wz_wingsuit_hud;

// Namespace wz_wingsuit_hud
// Method(s) 5 Total 12
class cwz_wingsuit_hud : cluielem
{

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 1
    // Checksum 0xe7e68618, Offset: 0x230
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 2
    // Checksum 0x94e11145, Offset: 0x1e0
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "wz_wingsuit_hud", persistent );
    }

    // Namespace cwz_wingsuit_hud/wz_wingsuit_hud
    // Params 1
    // Checksum 0xc95fb542, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
    }

}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1
// Checksum 0xa4906de1, Offset: 0xb8
// Size: 0x40
function register( uid )
{
    elem = new cwz_wingsuit_hud();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 2
// Checksum 0xbaeef030, Offset: 0x100
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1
// Checksum 0x2ab64469, Offset: 0x140
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace wz_wingsuit_hud/wz_wingsuit_hud
// Params 1
// Checksum 0x1388edf, Offset: 0x168
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

