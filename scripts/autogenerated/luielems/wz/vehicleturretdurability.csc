#using scripts\core_common\lui_shared;

#namespace vehicleturretdurability;

// Namespace vehicleturretdurability
// Method(s) 7 Total 13
class cvehicleturretdurability : cluielem
{

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 2
    // Checksum 0x89a2d801, Offset: 0x330
    // Size: 0x30
    function set_bar_percent( localclientnum, value )
    {
        set_data( localclientnum, "bar_percent", value );
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 1
    // Checksum 0xfd0b67fc, Offset: 0x2f8
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"vehicleturretdurability" );
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 1
    // Checksum 0x92cba120, Offset: 0x2a8
    // Size: 0x48
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "bar_percent", 0 );
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 1
    // Checksum 0x1f60fffb, Offset: 0x278
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cvehicleturretdurability/vehicleturretdurability
    // Params 2
    // Checksum 0x49840796, Offset: 0x218
    // Size: 0x54
    function setup_clientfields( uid, var_661989d5 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "bar_percent", 4000, 6, "float", var_661989d5 );
    }

}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 2
// Checksum 0x4d5c2af0, Offset: 0xb0
// Size: 0x4c
function register( uid, var_661989d5 )
{
    elem = new cvehicleturretdurability();
    [[ elem ]]->setup_clientfields( uid, var_661989d5 );
    return elem;
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1
// Checksum 0x2b2dd481, Offset: 0x108
// Size: 0x40
function register_clientside( uid )
{
    elem = new cvehicleturretdurability();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1
// Checksum 0x1ad66413, Offset: 0x150
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1
// Checksum 0x35ae8566, Offset: 0x178
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 1
// Checksum 0x19f5442e, Offset: 0x1a0
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace vehicleturretdurability/vehicleturretdurability
// Params 2
// Checksum 0x9dcb6bc6, Offset: 0x1c8
// Size: 0x28
function set_bar_percent( localclientnum, value )
{
    [[ self ]]->set_bar_percent( localclientnum, value );
}

