#using script_5f90a0e71aee1dc4;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace namespace_90b0490e;

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 0
// Checksum 0x59261db8, Offset: 0xc8
// Size: 0x1f4
function preload()
{
    level._effect[ #"hash_5167810d20f56cde" ] = #"hash_ea58012779b62a6";
    level._effect[ #"hash_7076baef5f9776c0" ] = #"hash_5a0d3d80e5fadfe8";
    level._effect[ #"hash_5a1b907f8cfb78f9" ] = #"hash_1fe7b0ba967e52f6";
    namespace_bd74bbd2::register( #"sc_mk2z_1", 20000, "sc_mk2z_1", level._effect[ #"hash_5167810d20f56cde" ], level._effect[ #"hash_7076baef5f9776c0" ] );
    namespace_bd74bbd2::register( #"sc_mk2z_2", 20000, "sc_mk2z_2", level._effect[ #"hash_5167810d20f56cde" ], level._effect[ #"hash_7076baef5f9776c0" ] );
    namespace_bd74bbd2::register( #"sc_mk2z_3", 20000, "sc_mk2z_3", level._effect[ #"hash_5167810d20f56cde" ], level._effect[ #"hash_7076baef5f9776c0" ] );
    clientfield::register( "scriptmover", "" + #"hash_2184dd4e9090521f", 20000, 1, "int", &function_7cd6e78c, 0, 0 );
}

// Namespace namespace_90b0490e/namespace_90b0490e
// Params 7
// Checksum 0xebb74b94, Offset: 0x2c8
// Size: 0x7c
function function_7cd6e78c( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_5a1b907f8cfb78f9" ], self, "tag_origin" );
    }
}

