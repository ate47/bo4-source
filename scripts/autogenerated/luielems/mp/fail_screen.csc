#using scripts\core_common\lui_shared;

#namespace fail_screen;

// Namespace fail_screen
// Method(s) 6 Total 12
class cfail_screen : cluielem
{

    // Namespace cfail_screen/fail_screen
    // Params 1
    // Checksum 0x4247826b, Offset: 0x258
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"fail_screen" );
    }

    // Namespace cfail_screen/fail_screen
    // Params 1
    // Checksum 0xcb6d18f0, Offset: 0x228
    // Size: 0x24
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
    }

    // Namespace cfail_screen/fail_screen
    // Params 1
    // Checksum 0x76590ab8, Offset: 0x1f8
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cfail_screen/fail_screen
    // Params 1
    // Checksum 0x5c4f45d9, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
    }

}

// Namespace fail_screen/fail_screen
// Params 1
// Checksum 0xe5211312, Offset: 0xa0
// Size: 0x40
function register( uid )
{
    elem = new cfail_screen();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace fail_screen/fail_screen
// Params 1
// Checksum 0xe341d8e, Offset: 0xe8
// Size: 0x40
function register_clientside( uid )
{
    elem = new cfail_screen();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace fail_screen/fail_screen
// Params 1
// Checksum 0xb9e95993, Offset: 0x130
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace fail_screen/fail_screen
// Params 1
// Checksum 0xb88090a9, Offset: 0x158
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace fail_screen/fail_screen
// Params 1
// Checksum 0x7eb4017d, Offset: 0x180
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

