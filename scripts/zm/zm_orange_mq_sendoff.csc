#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;

#namespace zm_orange_mq_sendoff;

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 0
// Checksum 0xfceb41b0, Offset: 0x98
// Size: 0x84
function preload()
{
    level._effect[ #"hash_490bb70162069301" ] = #"hash_406e48055b40a506";
    clientfield::register( "vehicle", "" + #"wisp_fx", 24000, 1, "int", &function_e5ecfa90, 0, 0 );
}

// Namespace zm_orange_mq_sendoff/zm_orange_mq_sendoff
// Params 7
// Checksum 0xc90f837b, Offset: 0x128
// Size: 0x74
function function_e5ecfa90( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::playfxontag( localclientnum, level._effect[ #"hash_490bb70162069301" ], self, "tag_origin" );
}

