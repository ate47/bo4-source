#namespace serverfield;

// Namespace serverfield/serverfield_shared
// Params 5
// Checksum 0x6fdab05, Offset: 0x68
// Size: 0x54
function register( str_name, n_version, n_bits, str_type, func_callback )
{
    serverfieldregister( str_name, n_version, n_bits, str_type, func_callback );
}

// Namespace serverfield/serverfield_shared
// Params 1
// Checksum 0xeddfd86f, Offset: 0xc8
// Size: 0x22
function get( field_name )
{
    return serverfieldgetvalue( self, field_name );
}

