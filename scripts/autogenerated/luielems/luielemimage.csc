#using scripts\core_common\lui_shared;

#namespace luielemimage;

// Namespace luielemimage
// Method(s) 16 Total 22
class cluielemimage : cluielem
{

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x566fee0f, Offset: 0xa60
    // Size: 0x30
    function set_material( localclientnum, value )
    {
        set_data( localclientnum, "material", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x3c229e66, Offset: 0xa28
    // Size: 0x30
    function set_blue( localclientnum, value )
    {
        set_data( localclientnum, "blue", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x8776d27e, Offset: 0x9f0
    // Size: 0x30
    function set_green( localclientnum, value )
    {
        set_data( localclientnum, "green", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x73d7ce69, Offset: 0x9b8
    // Size: 0x30
    function set_red( localclientnum, value )
    {
        set_data( localclientnum, "red", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x99959d0, Offset: 0x980
    // Size: 0x30
    function set_alpha( localclientnum, value )
    {
        set_data( localclientnum, "alpha", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x5574019e, Offset: 0x948
    // Size: 0x30
    function set_fadeovertime( localclientnum, value )
    {
        set_data( localclientnum, "fadeOverTime", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0xd484f925, Offset: 0x910
    // Size: 0x30
    function set_height( localclientnum, value )
    {
        set_data( localclientnum, "height", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x656fc8c1, Offset: 0x8d8
    // Size: 0x30
    function set_width( localclientnum, value )
    {
        set_data( localclientnum, "width", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0x9211ebc0, Offset: 0x8a0
    // Size: 0x30
    function set_y( localclientnum, value )
    {
        set_data( localclientnum, "y", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 2
    // Checksum 0xfa7dad40, Offset: 0x868
    // Size: 0x30
    function set_x( localclientnum, value )
    {
        set_data( localclientnum, "x", value );
    }

    // Namespace cluielemimage/luielemimage
    // Params 1
    // Checksum 0xb682bd37, Offset: 0x830
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"luielemimage" );
    }

    // Namespace cluielemimage/luielemimage
    // Params 1
    // Checksum 0x5e8bd47a, Offset: 0x6b8
    // Size: 0x16c
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "x", 0 );
        set_data( localclientnum, "y", 0 );
        set_data( localclientnum, "width", 0 );
        set_data( localclientnum, "height", 0 );
        set_data( localclientnum, "fadeOverTime", 0 );
        set_data( localclientnum, "alpha", 0 );
        set_data( localclientnum, "red", 0 );
        set_data( localclientnum, "green", 0 );
        set_data( localclientnum, "blue", 0 );
        set_data( localclientnum, "material", #"" );
    }

    // Namespace cluielemimage/luielemimage
    // Params 1
    // Checksum 0x6dab4032, Offset: 0x688
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cluielemimage/luielemimage
    // Params 11
    // Checksum 0x8114e94b, Offset: 0x478
    // Size: 0x204
    function setup_clientfields( uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, materialcallback )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "x", 1, 7, "int", xcallback );
        cluielem::add_clientfield( "y", 1, 6, "int", ycallback );
        cluielem::add_clientfield( "width", 1, 6, "int", widthcallback );
        cluielem::add_clientfield( "height", 1, 6, "int", heightcallback );
        cluielem::add_clientfield( "fadeOverTime", 1, 5, "int", fadeovertimecallback );
        cluielem::add_clientfield( "alpha", 1, 4, "float", alphacallback );
        cluielem::add_clientfield( "red", 1, 4, "float", redcallback );
        cluielem::add_clientfield( "green", 1, 4, "float", greencallback );
        cluielem::add_clientfield( "blue", 1, 4, "float", bluecallback );
        cluielem::function_dcb34c80( "material", "material", 1 );
    }

}

// Namespace luielemimage/luielemimage
// Params 11
// Checksum 0xc7386b61, Offset: 0xf8
// Size: 0xb8
function register( uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, materialcallback )
{
    elem = new cluielemimage();
    [[ elem ]]->setup_clientfields( uid, xcallback, ycallback, widthcallback, heightcallback, fadeovertimecallback, alphacallback, redcallback, greencallback, bluecallback, materialcallback );
    return elem;
}

// Namespace luielemimage/luielemimage
// Params 1
// Checksum 0xe3055534, Offset: 0x1b8
// Size: 0x40
function register_clientside( uid )
{
    elem = new cluielemimage();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace luielemimage/luielemimage
// Params 1
// Checksum 0x391d8046, Offset: 0x200
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace luielemimage/luielemimage
// Params 1
// Checksum 0x8e182657, Offset: 0x228
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace luielemimage/luielemimage
// Params 1
// Checksum 0x93a1617, Offset: 0x250
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0x1abdf039, Offset: 0x278
// Size: 0x28
function set_x( localclientnum, value )
{
    [[ self ]]->set_x( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0x392c04f9, Offset: 0x2a8
// Size: 0x28
function set_y( localclientnum, value )
{
    [[ self ]]->set_y( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0x4f464214, Offset: 0x2d8
// Size: 0x28
function set_width( localclientnum, value )
{
    [[ self ]]->set_width( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0xe53e6a9a, Offset: 0x308
// Size: 0x28
function set_height( localclientnum, value )
{
    [[ self ]]->set_height( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0xf4f2c88a, Offset: 0x338
// Size: 0x28
function set_fadeovertime( localclientnum, value )
{
    [[ self ]]->set_fadeovertime( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0x568fc7ad, Offset: 0x368
// Size: 0x28
function set_alpha( localclientnum, value )
{
    [[ self ]]->set_alpha( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0x1170a18, Offset: 0x398
// Size: 0x28
function set_red( localclientnum, value )
{
    [[ self ]]->set_red( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0x267816d2, Offset: 0x3c8
// Size: 0x28
function set_green( localclientnum, value )
{
    [[ self ]]->set_green( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0xb231d50c, Offset: 0x3f8
// Size: 0x28
function set_blue( localclientnum, value )
{
    [[ self ]]->set_blue( localclientnum, value );
}

// Namespace luielemimage/luielemimage
// Params 2
// Checksum 0xba04cf9d, Offset: 0x428
// Size: 0x28
function set_material( localclientnum, value )
{
    [[ self ]]->set_material( localclientnum, value );
}

