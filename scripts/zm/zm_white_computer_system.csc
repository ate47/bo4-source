#using scripts\core_common\clientfield_shared;

#namespace zm_white_computer_system;

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0x6ef171a, Offset: 0x88
// Size: 0x14
function preload()
{
    init_clientfields();
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 0
// Checksum 0xde59fe20, Offset: 0xa8
// Size: 0x5c
function init_clientfields()
{
    clientfield::register( "toplayer", "" + #"hash_33c373888aa78dc2", 20000, 1, "counter", &function_e67464c1, 0, 0 );
}

// Namespace zm_white_computer_system/zm_white_computer_system
// Params 7
// Checksum 0x881b2d84, Offset: 0x110
// Size: 0x6c
function function_e67464c1( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        self playrumbleonentity( localclientnum, #"hash_38a12b73c9342fd9" );
    }
}

