#using scripts\core_common\lui_shared;

#namespace ct_shared_objcounter;

// Namespace ct_shared_objcounter
// Method(s) 10 Total 16
class cct_shared_objcounter : cluielem
{

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2
    // Checksum 0x8f4a52, Offset: 0x738
    // Size: 0x30
    function set_objectivetotal( localclientnum, value )
    {
        set_data( localclientnum, "objectiveTotal", value );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2
    // Checksum 0xdee6df9c, Offset: 0x700
    // Size: 0x30
    function set_objectivelabel( localclientnum, value )
    {
        set_data( localclientnum, "objectiveLabel", value );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2
    // Checksum 0x23c50273, Offset: 0x6c8
    // Size: 0x30
    function set_objectivecount( localclientnum, value )
    {
        set_data( localclientnum, "objectiveCount", value );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 2
    // Checksum 0x54946d0, Offset: 0x4f8
    // Size: 0x1c4
    function set_state( localclientnum, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            set_data( localclientnum, "_state", 0 );
            return;
        }
        
        if ( #"nototal" == state_name )
        {
            set_data( localclientnum, "_state", 1 );
            return;
        }
        
        if ( #"hash_1895dd9cec027130" == state_name )
        {
            set_data( localclientnum, "_state", 2 );
            return;
        }
        
        if ( #"total" == state_name )
        {
            set_data( localclientnum, "_state", 3 );
            return;
        }
        
        if ( #"total_update" == state_name )
        {
            set_data( localclientnum, "_state", 4 );
            return;
        }
        
        if ( #"hash_5edcadf19882d66f" == state_name )
        {
            set_data( localclientnum, "_state", 5 );
            return;
        }
        
        if ( #"total_init" == state_name )
        {
            set_data( localclientnum, "_state", 6 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 1
    // Checksum 0x384860d, Offset: 0x4c0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"ct_shared_objcounter" );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 1
    // Checksum 0x27e48f04, Offset: 0x410
    // Size: 0xa8
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_state( localclientnum, #"defaultstate" );
        set_data( localclientnum, "objectiveCount", 0 );
        set_data( localclientnum, "objectiveLabel", #"" );
        set_data( localclientnum, "objectiveTotal", 0 );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 1
    // Checksum 0xbdd02bc9, Offset: 0x3e0
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cct_shared_objcounter/ct_shared_objcounter
    // Params 4
    // Checksum 0xc3a0d53b, Offset: 0x2f8
    // Size: 0xdc
    function setup_clientfields( uid, var_c2f4c01a, var_d45d2560, var_cee9c803 )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 3, "int" );
        cluielem::add_clientfield( "objectiveCount", 1, 5, "int", var_c2f4c01a );
        cluielem::function_dcb34c80( "string", "objectiveLabel", 1 );
        cluielem::add_clientfield( "objectiveTotal", 1, 5, "int", var_cee9c803 );
    }

}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 4
// Checksum 0x657bc818, Offset: 0xe8
// Size: 0x64
function register( uid, var_c2f4c01a, var_d45d2560, var_cee9c803 )
{
    elem = new cct_shared_objcounter();
    [[ elem ]]->setup_clientfields( uid, var_c2f4c01a, var_d45d2560, var_cee9c803 );
    return elem;
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1
// Checksum 0x55a3a721, Offset: 0x158
// Size: 0x40
function register_clientside( uid )
{
    elem = new cct_shared_objcounter();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1
// Checksum 0x3b465b4d, Offset: 0x1a0
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1
// Checksum 0x2cd5d2e9, Offset: 0x1c8
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 1
// Checksum 0xb16fcc3c, Offset: 0x1f0
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2
// Checksum 0xf4c403a, Offset: 0x218
// Size: 0x28
function set_state( localclientnum, state_name )
{
    [[ self ]]->set_state( localclientnum, state_name );
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2
// Checksum 0x4fde408d, Offset: 0x248
// Size: 0x28
function set_objectivecount( localclientnum, value )
{
    [[ self ]]->set_objectivecount( localclientnum, value );
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2
// Checksum 0x65261ed9, Offset: 0x278
// Size: 0x28
function set_objectivelabel( localclientnum, value )
{
    [[ self ]]->set_objectivelabel( localclientnum, value );
}

// Namespace ct_shared_objcounter/ct_shared_objcounter
// Params 2
// Checksum 0xaabcd3e3, Offset: 0x2a8
// Size: 0x28
function set_objectivetotal( localclientnum, value )
{
    [[ self ]]->set_objectivetotal( localclientnum, value );
}

