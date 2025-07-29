#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace zm_white_debris_buys;

// Namespace zm_white_debris_buys/zm_white_debris_buys
// Params 0, eflags: 0x2
// Checksum 0xb9b39b61, Offset: 0xa8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_white_debris_buys", &init, undefined, undefined );
}

// Namespace zm_white_debris_buys/zm_white_debris_buys
// Params 0
// Checksum 0xece4c4da, Offset: 0xf0
// Size: 0x5c
function init()
{
    clientfield::register( "zbarrier", "" + #"hash_7e15d8abc4d6c79a", 1, 1, "int", &function_32f95e3f, 0, 0 );
}

// Namespace zm_white_debris_buys/zm_white_debris_buys
// Params 7
// Checksum 0xdb24d0ea, Offset: 0x158
// Size: 0x126
function function_32f95e3f( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        for ( i = 0; i < self getnumzbarrierpieces() ; i++ )
        {
            var_a6b8d2c2 = self zbarriergetpiece( i );
            var_a6b8d2c2 playrenderoverridebundle( "rob_zm_white_crate_clear" );
        }
        
        return;
    }
    
    for ( i = 0; i < self getnumzbarrierpieces() ; i++ )
    {
        var_a6b8d2c2 = self zbarriergetpiece( i );
        var_a6b8d2c2 stoprenderoverridebundle( "rob_zm_white_crate_clear" );
    }
}

