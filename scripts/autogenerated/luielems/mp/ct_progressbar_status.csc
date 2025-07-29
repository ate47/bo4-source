#using scripts\core_common\lui_shared;

#namespace ct_progressbar_status;

// Namespace ct_progressbar_status
// Method(s) 7 Total 13
class cct_progressbar_status : cluielem
{

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 2
    // Checksum 0x418b5ad4, Offset: 0x318
    // Size: 0x2a4
    function set_state( localclientnum, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            set_data( localclientnum, "_state", 0 );
            return;
        }
        
        if ( #"download_complete" == state_name )
        {
            set_data( localclientnum, "_state", 1 );
            return;
        }
        
        if ( #"downloading" == state_name )
        {
            set_data( localclientnum, "_state", 2 );
            return;
        }
        
        if ( #"connection_lost" == state_name )
        {
            set_data( localclientnum, "_state", 3 );
            return;
        }
        
        if ( #"downloading1" == state_name )
        {
            set_data( localclientnum, "_state", 4 );
            return;
        }
        
        if ( #"hash_42f8a09c2e0a99e3" == state_name )
        {
            set_data( localclientnum, "_state", 5 );
            return;
        }
        
        if ( #"awaitingconnection" == state_name )
        {
            set_data( localclientnum, "_state", 6 );
            return;
        }
        
        if ( #"hash_7f00f68e42b5b8f6" == state_name )
        {
            set_data( localclientnum, "_state", 7 );
            return;
        }
        
        if ( #"sabotagedata" == state_name )
        {
            set_data( localclientnum, "_state", 8 );
            return;
        }
        
        if ( #"sabotagedata1" == state_name )
        {
            set_data( localclientnum, "_state", 9 );
            return;
        }
        
        if ( #"hash_7185fe2194047325" == state_name )
        {
            set_data( localclientnum, "_state", 10 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 1
    // Checksum 0xc4f2c1e1, Offset: 0x2e0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"ct_progressbar_status" );
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 1
    // Checksum 0xfc38863a, Offset: 0x290
    // Size: 0x44
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_state( localclientnum, #"defaultstate" );
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 1
    // Checksum 0x6a955c2e, Offset: 0x260
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cct_progressbar_status/ct_progressbar_status
    // Params 1
    // Checksum 0xdd12400f, Offset: 0x208
    // Size: 0x4c
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 4, "int" );
    }

}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1
// Checksum 0x1c734833, Offset: 0xb0
// Size: 0x40
function register( uid )
{
    elem = new cct_progressbar_status();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1
// Checksum 0x32e56f9f, Offset: 0xf8
// Size: 0x40
function register_clientside( uid )
{
    elem = new cct_progressbar_status();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1
// Checksum 0x8da41ddf, Offset: 0x140
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1
// Checksum 0x5613bd9e, Offset: 0x168
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 1
// Checksum 0x624474f8, Offset: 0x190
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace ct_progressbar_status/ct_progressbar_status
// Params 2
// Checksum 0xf2e3859, Offset: 0x1b8
// Size: 0x28
function set_state( localclientnum, state_name )
{
    [[ self ]]->set_state( localclientnum, state_name );
}

