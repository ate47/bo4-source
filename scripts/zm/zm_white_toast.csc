#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\serverfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\load;
#using scripts\zm_common\zm;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_sq_modules;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_wallbuy;
#using scripts\zm_common\zm_weapons;

#namespace zm_white_toast;

// Namespace zm_white_toast/zm_white_toast
// Params 0
// Checksum 0xa207f6c2, Offset: 0x1c0
// Size: 0x374
function init_clientfields()
{
    zm_sq_modules::function_d8383812( #"sc_toast_apd", 8000, "cp_toast_apd", 400, level._effect[ #"apd_projectile" ], level._effect[ #"hash_2ccbbf521f943fc4" ], undefined, undefined, 1 );
    zm_sq_modules::function_d8383812( #"sc_toast_diner", 8000, "cp_toast_diner", 400, level._effect[ #"apd_projectile" ], level._effect[ #"hash_2ccbbf521f943fc4" ], undefined, undefined, 1 );
    zm_sq_modules::function_d8383812( #"sc_toast_lounge", 8000, "cp_toast_lounge", 400, level._effect[ #"apd_projectile" ], level._effect[ #"hash_2ccbbf521f943fc4" ], undefined, undefined, 1 );
    zm_sq_modules::function_d8383812( #"sc_toast_storage", 8000, "cp_toast_storage", 400, level._effect[ #"apd_projectile" ], level._effect[ #"hash_2ccbbf521f943fc4" ], undefined, undefined, 1 );
    zm_sq_modules::function_d8383812( #"sc_toast_beds", 8000, "cp_toast_beds", 400, level._effect[ #"apd_projectile" ], level._effect[ #"hash_2ccbbf521f943fc4" ], undefined, undefined, 1 );
    clientfield::register( "scriptmover", "soul_capture_filled", 1, 1, "int", &function_2a58f409, 0, 0 );
    clientfield::register( "scriptmover", "soul_capture_depleted", 1, 1, "int", &canister_depleted, 0, 0 );
    clientfield::register( "zbarrier", "discharge_pap", 1, 1, "int", &discharge_pap, 0, 0 );
    clientfield::register( "scriptmover", "discharge_perk", 1, 1, "int", &discharge_perk, 0, 0 );
    clientfield::register( "scriptmover", "discharge_wallbuy", 1, 1, "int", &discharge_wallbuy, 0, 0 );
}

// Namespace zm_white_toast/zm_white_toast
// Params 0
// Checksum 0x6698496f, Offset: 0x540
// Size: 0x182
function init_fx()
{
    level._effect[ #"apd_projectile" ] = #"maps/zm_white/fx8_power_wisp";
    level._effect[ #"hash_50817e52341b2129" ] = #"maps/zm_white/fx8_power_wisp_lg";
    level._effect[ #"hash_2ccbbf521f943fc4" ] = #"hash_4b9c72e8053cbd1e";
    level._effect[ #"hash_6a86077d83942719" ] = #"hash_51c50bab95b10eb4";
    level._effect[ #"hash_3215540730982960" ] = #"hash_108f821580c61bdc";
    level._effect[ #"discharge_pap" ] = #"hash_443a4f41b97dd62";
    level._effect[ #"discharge_perk" ] = #"hash_7ab3f7caf7bc6d91";
    level._effect[ #"discharge_wallbuy" ] = #"hash_1f66229beff9787f";
}

// Namespace zm_white_toast/zm_white_toast
// Params 7
// Checksum 0xa40a28f5, Offset: 0x6d0
// Size: 0xbc
function function_2a58f409( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        self.fx_filled = util::playfxontag( localclientnum, level._effect[ #"hash_6a86077d83942719" ], self, "tag_origin" );
        return;
    }
    
    if ( isdefined( self.fx_filled ) )
    {
        stopfx( localclientnum, self.fx_filled );
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 7
// Checksum 0x3619892, Offset: 0x798
// Size: 0x84
function canister_depleted( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        util::playfxontag( localclientnum, level._effect[ #"hash_3215540730982960" ], self, "tag_origin" );
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 7
// Checksum 0x4f0229fe, Offset: 0x828
// Size: 0xbc
function discharge_pap( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        self.discharge_fx = playfx( localclientnum, level._effect[ #"discharge_pap" ], self.origin );
        return;
    }
    
    if ( isdefined( self.discharge_fx ) )
    {
        stopfx( localclientnum, self.discharge_fx );
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 7
// Checksum 0xe64fc45b, Offset: 0x8f0
// Size: 0xbc
function discharge_perk( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        self.discharge_fx = util::playfxontag( localclientnum, level._effect[ #"discharge_perk" ], self, "tag_origin" );
        return;
    }
    
    if ( isdefined( self.discharge_fx ) )
    {
        stopfx( localclientnum, self.discharge_fx );
    }
}

// Namespace zm_white_toast/zm_white_toast
// Params 7
// Checksum 0xf70bfdc7, Offset: 0x9b8
// Size: 0xbc
function discharge_wallbuy( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        self.discharge_fx = playfx( localclientnum, level._effect[ #"discharge_wallbuy" ], self.origin );
        return;
    }
    
    if ( isdefined( self.discharge_fx ) )
    {
        stopfx( localclientnum, self.discharge_fx );
    }
}

