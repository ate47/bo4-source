#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace wz_ai_utils;

// Namespace wz_ai_utils/wz_ai_utils
// Params 0, eflags: 0x2
// Checksum 0x3d3340fe, Offset: 0xf8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_ai_utils", &__init__, undefined, undefined );
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0
// Checksum 0xbf7cf87, Offset: 0x140
// Size: 0x31e
function __init__()
{
    clientfield::register( "scriptmover", "aizoneflag", -1, 2, "int", &function_5c69ac3b, 0, 0 );
    clientfield::register( "scriptmover", "aizoneflag_tu14", 14000, 3, "int", &function_5c69ac3b, 0, 0 );
    clientfield::register( "scriptmover", "magicboxflag", 1, 3, "int", &function_7e5339f3, 0, 0 );
    clientfield::register( "scriptmover", "soultransfer", 14000, 2, "int", &function_88a28ed1, 0, 0 );
    clientfield::register( "actor", "zombie_died", 17000, 1, "int", &function_46c950, 1, 0 );
    level._effect[ #"hash_2ff87d61167ea531" ] = #"wz/fx8_zm_box_marker";
    level._effect[ #"hash_1e5c0bbc60604949" ] = #"wz/fx8_zm_box_marker_red";
    level._effect[ #"hash_7fe086085cbbacac" ] = #"hash_4bd4c9b0fb97f425";
    level._effect[ #"hash_4048cb4967032c4a" ] = #"hash_1e43d43c6586fcb5";
    level._effect[ #"hash_1e35a559be3b8286" ] = #"wz/fx8_magicbox_marker_fl_red";
    level._effect[ #"hash_19f4dd97cbb87594" ] = #"hash_5f376e9395e16666";
    level._effect[ #"hash_4fbab83578c5a7e7" ] = #"hash_5c4ef04b0752716a";
    level._effect[ #"hash_538c528b09706dc8" ] = #"hash_286e0d228779181";
    level.var_96add4a1 = #"hash_210be93b3bfae433";
    level.var_86e1b0cc = #"hash_1807f48a5193ce49";
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 7
// Checksum 0x27761fbd, Offset: 0x468
// Size: 0x12c
function function_46c950( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval === 1 && isdefined( self ) )
    {
        spawn_pos = ( self.origin[ 0 ], self.origin[ 1 ], self.origin[ 2 ] + 64 );
        var_e2c1d066 = ( randomint( 1 ), randomint( 1 ), 1 );
        dynent = createdynentandlaunch( localclientnum, #"p8_zm_red_floatie_duck", spawn_pos, self.angles, self.origin, var_e2c1d066 );
        
        if ( isdefined( dynent ) )
        {
            dynent thread function_645efd58();
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 0
// Checksum 0xc1e63882, Offset: 0x5a0
// Size: 0x3c
function function_645efd58()
{
    wait randomintrange( 15, 25 );
    
    if ( isdefined( self ) )
    {
        setdynentenabled( self, 0 );
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 7
// Checksum 0xc49e8812, Offset: 0x5e8
// Size: 0x246
function function_5c69ac3b( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval > 0 )
    {
        if ( isdefined( self.var_26a0bda1 ) )
        {
            stopfx( localclientnum, self.var_26a0bda1 );
            self.var_26a0bda1 = undefined;
        }
        
        if ( newval == 1 )
        {
            playfx( localclientnum, level._effect[ #"hash_4048cb4967032c4a" ], self.origin );
            self.var_26a0bda1 = playfx( localclientnum, level._effect[ #"hash_2ff87d61167ea531" ], self.origin );
        }
        else if ( newval == 2 )
        {
            playfx( localclientnum, level._effect[ #"hash_1e35a559be3b8286" ], self.origin );
            self.var_26a0bda1 = playfx( localclientnum, level._effect[ #"hash_1e5c0bbc60604949" ], self.origin );
        }
        else if ( newval == 3 )
        {
            self.var_26a0bda1 = playfx( localclientnum, level._effect[ #"hash_7fe086085cbbacac" ], self.origin );
        }
        
        self playsound( localclientnum, #"hash_7d0432d3e280bce1", self.origin );
        return;
    }
    
    if ( isdefined( self.var_26a0bda1 ) )
    {
        stopfx( localclientnum, self.var_26a0bda1 );
        self.var_26a0bda1 = undefined;
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 7
// Checksum 0xdb2edd47, Offset: 0x838
// Size: 0x1ca
function function_7e5339f3( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval > 0 )
    {
        if ( newval == 1 )
        {
            util::playfxontag( localclientnum, level._effect[ #"hash_4fbab83578c5a7e7" ], self, "tag_origin" );
            self playsound( localclientnum, level.var_86e1b0cc, self.origin );
            return;
        }
        
        if ( newval == 2 )
        {
            self.var_8ddb3e81 = util::playfxontag( localclientnum, level._effect[ #"hash_19f4dd97cbb87594" ], self, "tag_origin" );
            self playsound( localclientnum, level.var_96add4a1, self.origin );
            return;
        }
        
        if ( newval == 3 )
        {
            if ( isdefined( self.var_8ddb3e81 ) )
            {
                stopfx( localclientnum, self.var_8ddb3e81 );
                self.var_8ddb3e81 = undefined;
            }
            
            return;
        }
        
        if ( newval == 4 )
        {
            self.var_8ddb3e81 = util::playfxontag( localclientnum, level._effect[ #"hash_19f4dd97cbb87594" ], self, "tag_origin" );
        }
    }
}

// Namespace wz_ai_utils/wz_ai_utils
// Params 7
// Checksum 0x53871b8b, Offset: 0xa10
// Size: 0x17e
function function_88a28ed1( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval > 0 )
    {
        self.var_39557fca = util::playfxontag( localclientnum, level._effect[ #"hash_538c528b09706dc8" ], self, "tag_origin" );
        
        if ( !isdefined( self.var_2a145797 ) )
        {
            self playsound( localclientnum, #"zmb_sq_souls_release" );
            self.var_2a145797 = self playloopsound( #"zmb_sq_souls_lp" );
        }
        
        return;
    }
    
    if ( isdefined( self.var_39557fca ) )
    {
        stopfx( localclientnum, self.var_39557fca );
        self.var_39557fca = undefined;
    }
    
    if ( isdefined( self.var_2a145797 ) )
    {
        self playsound( localclientnum, #"zmb_sq_souls_impact" );
        self stoploopsound( self.var_2a145797 );
        self.var_2a145797 = undefined;
    }
}

