#using scripts\core_common\lui_shared;

#namespace self_revive_visuals_rush;

// Namespace self_revive_visuals_rush
// Method(s) 7 Total 13
class cself_revive_visuals_rush : cluielem
{

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 2
    // Checksum 0xc12ab88d, Offset: 0x328
    // Size: 0x30
    function set_revive_time( localclientnum, value )
    {
        set_data( localclientnum, "revive_time", value );
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 1
    // Checksum 0x89e61657, Offset: 0x2f0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"self_revive_visuals_rush" );
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 1
    // Checksum 0xdb127588, Offset: 0x2a8
    // Size: 0x40
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "revive_time", 0 );
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 1
    // Checksum 0x8260c864, Offset: 0x278
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cself_revive_visuals_rush/self_revive_visuals_rush
    // Params 2
    // Checksum 0x29417742, Offset: 0x218
    // Size: 0x54
    function setup_clientfields( uid, var_2e62cab3 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "revive_time", 1, 4, "int", var_2e62cab3 );
    }

}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 2
// Checksum 0x785c07f7, Offset: 0xb0
// Size: 0x4c
function register( uid, var_2e62cab3 )
{
    elem = new cself_revive_visuals_rush();
    [[ elem ]]->setup_clientfields( uid, var_2e62cab3 );
    return elem;
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1
// Checksum 0x121ed2f2, Offset: 0x108
// Size: 0x40
function register_clientside( uid )
{
    elem = new cself_revive_visuals_rush();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1
// Checksum 0x6a447992, Offset: 0x150
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1
// Checksum 0x21c34cc8, Offset: 0x178
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 1
// Checksum 0xd656fa23, Offset: 0x1a0
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace self_revive_visuals_rush/self_revive_visuals_rush
// Params 2
// Checksum 0x579b804d, Offset: 0x1c8
// Size: 0x28
function set_revive_time( localclientnum, value )
{
    [[ self ]]->set_revive_time( localclientnum, value );
}

