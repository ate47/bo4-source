#using scripts\core_common\lui_shared;

#namespace ct_shared_desc;

// Namespace ct_shared_desc
// Method(s) 7 Total 13
class cct_shared_desc : cluielem
{

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 2
    // Checksum 0xc39709d1, Offset: 0x318
    // Size: 0xe4
    function set_state( localclientnum, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            set_data( localclientnum, "_state", 0 );
            return;
        }
        
        if ( #"hash_3319eaa2c590a2ac" == state_name )
        {
            set_data( localclientnum, "_state", 1 );
            return;
        }
        
        if ( #"hash_2ac3b79c708dcfd5" == state_name )
        {
            set_data( localclientnum, "_state", 2 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 1
    // Checksum 0x74d23105, Offset: 0x2e0
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"ct_shared_desc" );
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 1
    // Checksum 0x8c07d54f, Offset: 0x290
    // Size: 0x44
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_state( localclientnum, #"defaultstate" );
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 1
    // Checksum 0x8f17f6e6, Offset: 0x260
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cct_shared_desc/ct_shared_desc
    // Params 1
    // Checksum 0x24c04009, Offset: 0x208
    // Size: 0x4c
    function setup_clientfields( uid )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 2, "int" );
    }

}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1
// Checksum 0xbb4e31e5, Offset: 0xb0
// Size: 0x40
function register( uid )
{
    elem = new cct_shared_desc();
    [[ elem ]]->setup_clientfields( uid );
    return elem;
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1
// Checksum 0x3cc1832e, Offset: 0xf8
// Size: 0x40
function register_clientside( uid )
{
    elem = new cct_shared_desc();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1
// Checksum 0x69678b99, Offset: 0x140
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1
// Checksum 0x2ff7b883, Offset: 0x168
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 1
// Checksum 0xdf764d0a, Offset: 0x190
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace ct_shared_desc/ct_shared_desc
// Params 2
// Checksum 0xe3ac16b, Offset: 0x1b8
// Size: 0x28
function set_state( localclientnum, state_name )
{
    [[ self ]]->set_state( localclientnum, state_name );
}

