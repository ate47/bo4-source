#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;

#namespace namespace_f2050961;

// Namespace namespace_f2050961/namespace_f2050961
// Params 0
// Checksum 0x2ae49d26, Offset: 0x90
// Size: 0x5c
function init()
{
    clientfield::register( "toplayer", "" + #"hash_686e5c0d7af86361", 16000, 1, "int", &function_be33348b, 0, 0 );
}

// Namespace namespace_f2050961/namespace_f2050961
// Params 7
// Checksum 0xebbda42e, Offset: 0xf8
// Size: 0x154
function function_be33348b( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval )
    {
        self postfx::playpostfxbundle( #"pstfx_blood_wash" );
        self postfx::playpostfxbundle( #"pstfx_zm_acid_dmg" );
        self postfx::playpostfxbundle( #"hash_25c3aa91c32db43c" );
        self.var_431ddde9 = self playloopsound( #"hash_341a3fa00975f232" );
        return;
    }
    
    self postfx::exitpostfxbundle( #"pstfx_blood_wash" );
    self postfx::exitpostfxbundle( #"pstfx_zm_acid_dmg" );
    self postfx::exitpostfxbundle( #"hash_25c3aa91c32db43c" );
    
    if ( isdefined( self.var_431ddde9 ) )
    {
        self stoploopsound( self.var_431ddde9 );
    }
}

