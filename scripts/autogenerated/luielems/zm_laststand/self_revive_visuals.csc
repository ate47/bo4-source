#using scripts\core_common\lui_shared;

#namespace self_revive_visuals;

// Namespace self_revive_visuals
// Method(s) 8 Total 14
class cself_revive_visuals : cluielem
{

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 2
    // Checksum 0x4bca128, Offset: 0x420
    // Size: 0x30
    function set_revive_progress( localclientnum, value )
    {
        set_data( localclientnum, "revive_progress", value );
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 2
    // Checksum 0x3a66e582, Offset: 0x3e8
    // Size: 0x30
    function set_self_revive_progress_bar_fill( localclientnum, value )
    {
        set_data( localclientnum, "self_revive_progress_bar_fill", value );
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 1
    // Checksum 0xed042215, Offset: 0x3b0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"self_revive_visuals" );
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 1
    // Checksum 0xdbd7f457, Offset: 0x338
    // Size: 0x6c
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_data( localclientnum, "self_revive_progress_bar_fill", 0 );
        set_data( localclientnum, "revive_progress", 0 );
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 1
    // Checksum 0x6c77a4ad, Offset: 0x308
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cself_revive_visuals/self_revive_visuals
    // Params 3
    // Checksum 0xdebc5ce4, Offset: 0x278
    // Size: 0x84
    function setup_clientfields( uid, var_967a63df, var_e97e7153 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "self_revive_progress_bar_fill", 1, 5, "float", var_967a63df );
        cluielem::add_clientfield( "revive_progress", 1, 5, "float", var_e97e7153 );
    }

}

// Namespace self_revive_visuals/self_revive_visuals
// Params 3
// Checksum 0x5f21748c, Offset: 0xd8
// Size: 0x58
function register( uid, var_967a63df, var_e97e7153 )
{
    elem = new cself_revive_visuals();
    [[ elem ]]->setup_clientfields( uid, var_967a63df, var_e97e7153 );
    return elem;
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1
// Checksum 0xb6db94e9, Offset: 0x138
// Size: 0x40
function register_clientside( uid )
{
    elem = new cself_revive_visuals();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1
// Checksum 0x94d21a1f, Offset: 0x180
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1
// Checksum 0xf452d859, Offset: 0x1a8
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 1
// Checksum 0x23d218ab, Offset: 0x1d0
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 2
// Checksum 0x1d4f4618, Offset: 0x1f8
// Size: 0x28
function set_self_revive_progress_bar_fill( localclientnum, value )
{
    [[ self ]]->set_self_revive_progress_bar_fill( localclientnum, value );
}

// Namespace self_revive_visuals/self_revive_visuals
// Params 2
// Checksum 0x704ba2a5, Offset: 0x228
// Size: 0x28
function set_revive_progress( localclientnum, value )
{
    [[ self ]]->set_revive_progress( localclientnum, value );
}

