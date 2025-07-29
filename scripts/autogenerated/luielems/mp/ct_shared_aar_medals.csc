#using scripts\core_common\lui_shared;

#namespace ct_shared_aar_medals;

// Namespace ct_shared_aar_medals
// Method(s) 10 Total 16
class cct_shared_aar_medals : cluielem
{

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2
    // Checksum 0x5522af76, Offset: 0x6f0
    // Size: 0x30
    function set_medalbronzethreshold( localclientnum, value )
    {
        set_data( localclientnum, "medalBronzeThreshold", value );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2
    // Checksum 0x8d58a80c, Offset: 0x6b8
    // Size: 0x30
    function set_medalsilverthreshold( localclientnum, value )
    {
        set_data( localclientnum, "medalSilverThreshold", value );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2
    // Checksum 0x72467d07, Offset: 0x680
    // Size: 0x30
    function set_medalgoldthreshold( localclientnum, value )
    {
        set_data( localclientnum, "medalGoldThreshold", value );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 2
    // Checksum 0x2c057016, Offset: 0x520
    // Size: 0x154
    function set_state( localclientnum, state_name )
    {
        if ( #"defaultstate" == state_name )
        {
            set_data( localclientnum, "_state", 0 );
            return;
        }
        
        if ( #"medal_gold" == state_name )
        {
            set_data( localclientnum, "_state", 1 );
            return;
        }
        
        if ( #"medal_silver" == state_name )
        {
            set_data( localclientnum, "_state", 2 );
            return;
        }
        
        if ( #"medal_bronze" == state_name )
        {
            set_data( localclientnum, "_state", 3 );
            return;
        }
        
        if ( #"medal_none" == state_name )
        {
            set_data( localclientnum, "_state", 4 );
            return;
        }
        
        assertmsg( "<dev string:x38>" );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 1
    // Checksum 0xd4a18a16, Offset: 0x4e8
    // Size: 0x2c
    function open( localclientnum )
    {
        cluielem::open( localclientnum, #"ct_shared_aar_medals" );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 1
    // Checksum 0x2aa51d0b, Offset: 0x420
    // Size: 0xbc
    function function_fa582112( localclientnum )
    {
        cluielem::function_fa582112( localclientnum );
        set_state( localclientnum, #"defaultstate" );
        set_data( localclientnum, "medalGoldThreshold", #"" );
        set_data( localclientnum, "medalSilverThreshold", #"" );
        set_data( localclientnum, "medalBronzeThreshold", #"" );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 1
    // Checksum 0xa23a8f13, Offset: 0x3f0
    // Size: 0x24
    function register_clientside( uid )
    {
        cluielem::register_clientside( uid );
    }

    // Namespace cct_shared_aar_medals/ct_shared_aar_medals
    // Params 4
    // Checksum 0xf799de52, Offset: 0x308
    // Size: 0xdc
    function setup_clientfields( uid, var_a6bba632, var_da3b1805, var_17bf2e2a )
    {
        cluielem::setup_clientfields( uid );
        cluielem::add_clientfield( "_state", 1, 3, "int" );
        cluielem::function_dcb34c80( "string", "medalGoldThreshold", 1 );
        cluielem::function_dcb34c80( "string", "medalSilverThreshold", 1 );
        cluielem::function_dcb34c80( "string", "medalBronzeThreshold", 1 );
    }

}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 4
// Checksum 0x4809fa02, Offset: 0xf8
// Size: 0x64
function register( uid, var_a6bba632, var_da3b1805, var_17bf2e2a )
{
    elem = new cct_shared_aar_medals();
    [[ elem ]]->setup_clientfields( uid, var_a6bba632, var_da3b1805, var_17bf2e2a );
    return elem;
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1
// Checksum 0xbc8e9e71, Offset: 0x168
// Size: 0x40
function register_clientside( uid )
{
    elem = new cct_shared_aar_medals();
    [[ elem ]]->register_clientside( uid );
    return elem;
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1
// Checksum 0xd4c0fbd2, Offset: 0x1b0
// Size: 0x1c
function open( player )
{
    [[ self ]]->open( player );
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1
// Checksum 0xb1973bac, Offset: 0x1d8
// Size: 0x1c
function close( player )
{
    [[ self ]]->close( player );
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 1
// Checksum 0x6e17be81, Offset: 0x200
// Size: 0x1a
function is_open( localclientnum )
{
    return [[ self ]]->is_open( localclientnum );
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2
// Checksum 0x7d7c447e, Offset: 0x228
// Size: 0x28
function set_state( localclientnum, state_name )
{
    [[ self ]]->set_state( localclientnum, state_name );
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2
// Checksum 0x88876e5a, Offset: 0x258
// Size: 0x28
function set_medalgoldthreshold( localclientnum, value )
{
    [[ self ]]->set_medalgoldthreshold( localclientnum, value );
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2
// Checksum 0xbe6ddb7e, Offset: 0x288
// Size: 0x28
function set_medalsilverthreshold( localclientnum, value )
{
    [[ self ]]->set_medalsilverthreshold( localclientnum, value );
}

// Namespace ct_shared_aar_medals/ct_shared_aar_medals
// Params 2
// Checksum 0xd2c35242, Offset: 0x2b8
// Size: 0x28
function set_medalbronzethreshold( localclientnum, value )
{
    [[ self ]]->set_medalbronzethreshold( localclientnum, value );
}

