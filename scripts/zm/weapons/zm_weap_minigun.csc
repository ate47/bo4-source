#using script_70ab01a7690ea256;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_minigun;

// Namespace zm_weap_minigun/zm_weap_minigun
// Params 0, eflags: 0x2
// Checksum 0x6849191c, Offset: 0x168
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_minigun", &__init__, undefined, undefined );
}

// Namespace zm_weap_minigun/zm_weap_minigun
// Params 0
// Checksum 0x995b59cb, Offset: 0x1b0
// Size: 0x182
function __init__()
{
    clientfield::register( "toplayer", "hero_minigun_vigor_postfx", 1, 1, "counter", &function_d05553c6, 0, 0 );
    clientfield::register( "allplayers", "minigun_launcher_muzzle_fx", 1, 1, "counter", &minigun_launcher_muzzle_fx, 0, 0 );
    clientfield::register( "missile", "minigun_nuke_rob", 1, 1, "int", &minigun_nuke_rob, 0, 0 );
    clientfield::register( "toplayer", "minigun_nuke_rumble", 1, 1, "counter", &minigun_nuke_rumble, 0, 0 );
    level._effect[ #"hash_319b0ab74b8b1f3c" ] = #"hash_296e81a6f8cea122";
    level._effect[ #"hash_31a216b74b91524e" ] = #"hash_296775a6f8c86e10";
}

// Namespace zm_weap_minigun/zm_weap_minigun
// Params 7, eflags: 0x4
// Checksum 0xb27dedcd, Offset: 0x340
// Size: 0x8c
function private function_d05553c6( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue && !namespace_a6aea2c6::is_active( #"silent_film" ) )
    {
        self thread postfx::playpostfxbundle( #"hash_1663ca7cc81f9b17" );
    }
}

// Namespace zm_weap_minigun/zm_weap_minigun
// Params 7, eflags: 0x4
// Checksum 0xa8159661, Offset: 0x3d8
// Size: 0x84
function private minigun_nuke_rob( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue == 1 )
    {
        self playrenderoverridebundle( "rob_zm_going_nuclear" );
        return;
    }
    
    self stoprenderoverridebundle( "rob_zm_going_nuclear" );
}

// Namespace zm_weap_minigun/zm_weap_minigun
// Params 7, eflags: 0x4
// Checksum 0xf32203f5, Offset: 0x468
// Size: 0xe4
function private minigun_nuke_rumble( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    self playrumbleonentity( localclientnum, "damage_heavy" );
    
    if ( function_65b9eb0f( localclientnum ) )
    {
        return;
    }
    
    self thread postfx::playpostfxbundle( #"pstfx_slowed" );
    self waittilltimeout( 1, #"death" );
    
    if ( isdefined( self ) )
    {
        self thread postfx::exitpostfxbundle( #"pstfx_slowed" );
    }
}

// Namespace zm_weap_minigun/zm_weap_minigun
// Params 7
// Checksum 0x675873f1, Offset: 0x558
// Size: 0x102
function minigun_launcher_muzzle_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( isdefined( self.var_83a410ad ) )
    {
        deletefx( localclientnum, self.var_83a410ad, 1 );
    }
    
    if ( self zm_utility::function_f8796df3( localclientnum ) )
    {
        self.var_83a410ad = playviewmodelfx( localclientnum, level._effect[ #"hash_319b0ab74b8b1f3c" ], "tag_flash2" );
        return;
    }
    
    self.var_83a410ad = util::playfxontag( localclientnum, level._effect[ #"hash_31a216b74b91524e" ], self, "tag_flash2" );
}

