#using scripts\core_common\aat_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\renderoverridebundle;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_aat_brain_decay;

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 0, eflags: 0x2
// Checksum 0xefbf62aa, Offset: 0x1c0
// Size: 0x34
function autoexec __init__system__()
{
    system::register( "zm_aat_brain_decay", &__init__, undefined, undefined );
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 0
// Checksum 0x7b49959d, Offset: 0x200
// Size: 0x1ac
function __init__()
{
    if ( !( isdefined( level.aat_in_use ) && level.aat_in_use ) )
    {
        return;
    }
    
    aat::register( "zm_aat_brain_decay", #"hash_3c1c6f0860be6c5", "t7_icon_zm_aat_turned" );
    clientfield::register( "actor", "zm_aat_brain_decay", 1, 1, "int", &function_791e18ed, 0, 0 );
    clientfield::register( "vehicle", "zm_aat_brain_decay", 1, 1, "int", &function_791e18ed, 0, 0 );
    clientfield::register( "actor", "zm_aat_brain_decay_exp", 1, 1, "counter", &zm_aat_brain_decay_explosion, 0, 0 );
    clientfield::register( "vehicle", "zm_aat_brain_decay_exp", 1, 1, "counter", &zm_aat_brain_decay_explosion, 0, 0 );
    renderoverridebundle::function_f72f089c( #"hash_5afb2d74423459bf", "rob_sonar_set_friendly_zm", &function_b9c917cc );
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 7
// Checksum 0x49b0f3aa, Offset: 0x3b8
// Size: 0x2e4
function function_791e18ed( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self renderoverridebundle::function_c8d97b8e( localclientnum, #"zm_friendly", #"hash_5afb2d74423459bf" );
    
    if ( newval )
    {
        self setdrawname( #"hash_3a9d51a39880facd", 1 );
        str_fx_tag = self zm_utility::function_467efa7b( 1 );
        
        if ( !isdefined( str_fx_tag ) )
        {
            str_fx_tag = "tag_origin";
        }
        
        eye_pos = self gettagorigin( "j_eyeball_le" );
        
        if ( isdefined( eye_pos ) )
        {
            self.var_8c12ae9 = util::playfxontag( localclientnum, "zm_weapons/fx8_aat_brain_decay_eye", self, "j_eyeball_le" );
        }
        
        self.var_8dfe2b97 = util::playfxontag( localclientnum, "zm_weapons/fx8_aat_brain_decay_torso", self, str_fx_tag );
        
        if ( !isdefined( self.var_67857d4d ) )
        {
            self playsound( localclientnum, #"hash_637c5e1579bb239a" );
            self.var_67857d4d = self playloopsound( #"hash_6064261162c8a2e" );
        }
        
        if ( isdefined( self.var_4703d488 ) )
        {
            self [[ self.var_4703d488 ]]( localclientnum, newval );
        }
        
        return;
    }
    
    if ( isdefined( self.var_8c12ae9 ) )
    {
        stopfx( localclientnum, self.var_8c12ae9 );
        self.var_8c12ae9 = undefined;
    }
    
    if ( isdefined( self.var_4bc659c4 ) )
    {
        stopfx( localclientnum, self.var_4bc659c4 );
        self.var_4bc659c4 = undefined;
    }
    
    if ( isdefined( self.var_8dfe2b97 ) )
    {
        stopfx( localclientnum, self.var_8dfe2b97 );
        self.var_8dfe2b97 = undefined;
    }
    
    if ( isdefined( self.var_67857d4d ) )
    {
        self stoploopsound( self.var_67857d4d );
        self.var_67857d4d = undefined;
    }
    
    if ( isdefined( self.var_4703d488 ) )
    {
        self [[ self.var_4703d488 ]]( localclientnum, newval );
    }
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 2
// Checksum 0xe284431c, Offset: 0x6a8
// Size: 0x70, Type: bool
function function_b9c917cc( localclientnum, str_bundle )
{
    if ( !self function_ca024039() || isdefined( level.var_dc60105c ) && level.var_dc60105c || isigcactive( localclientnum ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_aat_brain_decay/zm_aat_brain_decay
// Params 7
// Checksum 0x69c17bfa, Offset: 0x720
// Size: 0x84
function zm_aat_brain_decay_explosion( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::playfxontag( localclientnum, "zm_weapons/fx8_aat_brain_decay_head", self, "j_head" );
    self playsound( 0, #"hash_422ccb7ddff9b3f4" );
}

