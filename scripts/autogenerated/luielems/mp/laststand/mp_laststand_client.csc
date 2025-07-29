#using scripts\core_common\lui_shared;

#namespace mp_laststand_client;

// Namespace mp_laststand_client
// Method(s) 8 Total 14
class cmp_laststand_client : cluielem
{

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 2
    // Checksum 0xe6fedaa0, Offset: 0x410
    // Size: 0x30
    function set_revive_progress( localclientnum, value )
    {
        set_data( localclientnum, "revive_progress", value );
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 2
    // Checksum 0x35e3ec9f, Offset: 0x3d8
    // Size: 0x30
    function set_bleedout_progress( localclientnum, value )
    {
        set_data( localclientnum, "bleedout_progress", value );
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 1
    // Checksum 0x636fd351, Offset: 0x3a0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"mp_laststand_client" );
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 1
    // Checksum 0x4fc04249, Offset: 0x328
    // Size: 0x6c
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "bleedout_progress", 0 );
        set_data( localclientnum, "revive_progress", 0 );
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 1
    // Checksum 0xdd39439f, Offset: 0x2f8
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cmp_laststand_client/mp_laststand_client
    // Params 3
    // Checksum 0xe327593b, Offset: 0x268
    // Size: 0x84
    function setup_clientfields( uid, var_a9a4e140, var_e97e7153 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "bleedout_progress", 1, 6, "float", var_a9a4e140 );
        cluielem::add_clientfield( "revive_progress", 1, 5, "float", var_e97e7153 );
    }

}

// Namespace mp_laststand_client/mp_laststand_client
// Params 3
// Checksum 0xe6ea2a41, Offset: 0xc8
// Size: 0x58
function register( uid, var_a9a4e140, var_e97e7153 )
{
    elem = new cmp_laststand_client();
    [[ elem ]]->setup_clientfields( uid, var_a9a4e140, var_e97e7153 );
    return elem;
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1
// Checksum 0x48f092a6, Offset: 0x128
// Size: 0x40
function register_clientside( uid )
{
    elem = new cmp_laststand_client();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1
// Checksum 0x973e3469, Offset: 0x170
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1
// Checksum 0x7e940818, Offset: 0x198
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 1
// Checksum 0xb8ca79fb, Offset: 0x1c0
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 2
// Checksum 0x4db93dbb, Offset: 0x1e8
// Size: 0x28
function set_bleedout_progress( localclientnum, value )
{
    [[ self ]]->set_bleedout_progress( localclientnum, value );
}

// Namespace mp_laststand_client/mp_laststand_client
// Params 2
// Checksum 0x502f9501, Offset: 0x218
// Size: 0x28
function set_revive_progress( localclientnum, value )
{
    [[ self ]]->set_revive_progress( localclientnum, value );
}

