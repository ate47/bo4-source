#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_white_electric_traps;

// Namespace zm_white_electric_traps/zm_white_electric_traps
// Params 0, eflags: 0x2
// Checksum 0x7a904d9b, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_white_electric_trap", &__init__, undefined, undefined );
}

// Namespace zm_white_electric_traps/zm_white_electric_traps
// Params 0
// Checksum 0x81aa6534, Offset: 0x120
// Size: 0x34
function __init__()
{
    level init_fx();
    level init_clientfields();
}

// Namespace zm_white_electric_traps/zm_white_electric_traps
// Params 0
// Checksum 0xe2d394e, Offset: 0x160
// Size: 0xc2
function init_fx()
{
    level._effect[ #"hash_6d40a3f1944d81b2" ] = #"hash_3a5776a6c23c9563";
    level._effect[ #"hash_3d339d7ae7b008d3" ] = #"hash_6a84f61b7271e098";
    level._effect[ #"hash_6a97de5de4ae14a" ] = #"zombie/fx_tesla_shock_zmb";
    level._effect[ #"hash_21e93d9faa37cad" ] = #"zombie/fx_tesla_shock_eyes_zmb";
}

// Namespace zm_white_electric_traps/zm_white_electric_traps
// Params 0
// Checksum 0x82ba7cfd, Offset: 0x230
// Size: 0xb4
function init_clientfields()
{
    clientfield::register( "scriptmover", "" + #"hash_6d40a3f1944d81b2", 20000, 2, "int", &function_946acaec, 0, 0 );
    clientfield::register( "actor", "" + #"electrocute_ai_fx", 20000, 1, "int", &electrocute_ai, 0, 0 );
}

// Namespace zm_white_electric_traps/zm_white_electric_traps
// Params 7
// Checksum 0x4af579c5, Offset: 0x2f0
// Size: 0x10c
function function_946acaec( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 2 )
    {
        self.blinking_fx = util::playfxontag( localclientnum, level._effect[ #"hash_6d40a3f1944d81b2" ], self, "tag_origin" );
        return;
    }
    
    if ( newval == 1 )
    {
        self.blinking_fx = util::playfxontag( localclientnum, level._effect[ #"hash_3d339d7ae7b008d3" ], self, "tag_origin" );
        return;
    }
    
    if ( isdefined( self.blinking_fx ) )
    {
        deletefx( localclientnum, self.blinking_fx );
    }
}

// Namespace zm_white_electric_traps/zm_white_electric_traps
// Params 7
// Checksum 0xb11f1801, Offset: 0x408
// Size: 0x1fe
function electrocute_ai( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        str_tag = "J_SpineUpper";
        
        if ( isdefined( self.var_c8b0b5be ) )
        {
            str_tag = self.var_c8b0b5be;
        }
        else if ( self.archetype === #"zombie_dog" )
        {
            str_tag = "J_Spine1";
        }
        
        self.n_shock_eyes_fx = util::playfxontag( localclientnum, level._effect[ #"hash_21e93d9faa37cad" ], self, "J_Eyeball_LE" );
        
        if ( isdefined( self ) && isdefined( self.n_shock_eyes_fx ) )
        {
            setfxignorepause( localclientnum, self.n_shock_eyes_fx, 1 );
        }
        
        self.n_shock_fx = util::playfxontag( localclientnum, level._effect[ #"hash_6a97de5de4ae14a" ], self, str_tag );
        
        if ( isdefined( self ) && isdefined( self.n_shock_eyes_fx ) )
        {
            setfxignorepause( localclientnum, self.n_shock_fx, 1 );
        }
        
        return;
    }
    
    if ( isdefined( self.n_shock_eyes_fx ) )
    {
        deletefx( localclientnum, self.n_shock_eyes_fx, 1 );
        self.n_shock_eyes_fx = undefined;
    }
    
    if ( isdefined( self.n_shock_fx ) )
    {
        deletefx( localclientnum, self.n_shock_fx, 1 );
        self.n_shock_fx = undefined;
    }
}

