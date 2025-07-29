#using scripts\core_common\clientfield_shared;
#using scripts\core_common\lui_shared;

#namespace initial_black;

// Namespace initial_black
// Method(s) 5 Total 12
class cinitial_black : cluielem
{

    // Namespace cinitial_black/initial_black
    // Params 1
    // Checksum 0x8859ba13, Offset: 0x230
    // Size: 0x24
    function close( player )
    {
        cluielem::close_luielem( player );
    }

    // Namespace cinitial_black/initial_black
    // Params 2
    // Checksum 0xceba4374, Offset: 0x1e0
    // Size: 0x44
    function open( player, persistent = 0 )
    {
        cluielem::open_luielem( player, "initial_black", persistent );
    }

    // Namespace cinitial_black/initial_black
    // Params 1
    // Checksum 0xf81fe114, Offset: 0x1b0
    // Size: 0x24
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
    }

}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0xaac22dc0, Offset: 0xb8
// Size: 0x40
function register( uid )
{
    elem = new cinitial_black();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace initial_black/initial_black
// Params 2
// Checksum 0xdc183c4b, Offset: 0x100
// Size: 0x38
function open( player, persistent = 0 )
{
    [[ self ]]->open( player, persistent );
}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0xcf13dac7, Offset: 0x140
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace initial_black/initial_black
// Params 1
// Checksum 0x8acf073b, Offset: 0x168
// Size: 0x1a
function is_open( player )
{
    return [[ self ]]->function_7bfd10e6( player );
}

