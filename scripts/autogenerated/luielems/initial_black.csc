#using scripts\core_common\lui_shared;

#namespace initial_black;

// Namespace initial_black
// Method(s) 6 Total 12
class cinitial_black : cluielem
{

    // Namespace cinitial_black/initial_black
    // Params 1
    // Checksum 0x5367638, Offset: 0x258
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"initial_black" );
    }

    // Namespace cinitial_black/initial_black
    // Params 1
    // Checksum 0x28a47fc7, Offset: 0x228
    // Size: 0x24
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
    }

    // Namespace cinitial_black/initial_black
    // Params 1
    // Checksum 0x6e533ee2, Offset: 0x1f8
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cinitial_black/initial_black
    // Params 1
    // Checksum 0xd89208d9, Offset: 0x1c8
    // Size: 0x24
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
    }

}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0x3295262c, Offset: 0xa0
// Size: 0x40
function register( uid )
{
    elem = new cinitial_black();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0x6e7e5033, Offset: 0xe8
// Size: 0x40
function register_clientside( uid )
{
    elem = new cinitial_black();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0xc6ec12e2, Offset: 0x130
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0xa0e7b69, Offset: 0x158
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0x64b28e02, Offset: 0x180
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

