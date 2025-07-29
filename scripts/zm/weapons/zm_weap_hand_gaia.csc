#using scripts\core_common\beam_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_lightning_chain;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_hand_gaia;

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0, eflags: 0x2
// Checksum 0x738eb1cd, Offset: 0x100
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_hand_gaia", &__init__, undefined, undefined );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 0
// Checksum 0xcae74d63, Offset: 0x148
// Size: 0x27a
function __init__()
{
    clientfield::register( "actor", "" + #"gaia_impact_zombie", 16000, 1, "counter", &gaia_impact_zombie_fx, 0, 0 );
    clientfield::register( "scriptmover", "" + #"gaia_shoot", 16000, 1, "counter", &mostmost_mo, 0, 0 );
    clientfield::register( "scriptmover", "" + #"gaia_impact", 16000, 1, "counter", &gaia_impact_fx, 0, 0 );
    clientfield::register( "scriptmover", "" + #"spike_explode", 16000, 1, "counter", &function_10485953, 0, 0 );
    clientfield::register( "scriptmover", "" + #"spike_spawn", 16000, 1, "counter", &function_3672d8a5, 0, 0 );
    level._effect[ #"gaia_projectile_trail" ] = #"hash_5873b3e8eed6eece";
    level._effect[ #"gaia_projectile_impact" ] = #"hash_d2b136a3d2607a0";
    level._effect[ #"gaia_spikes_reveal" ] = #"hash_13b6231a05889663";
    level._effect[ #"gaia_spikes_crumble" ] = #"hash_224a2a7d7295284";
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 7
// Checksum 0x9e1e2731, Offset: 0x3d0
// Size: 0x174
function gaia_impact_zombie_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    self endon( #"death" );
    
    if ( isdefined( self ) && isdefined( self gettagorigin( "j_spine4" ) ) )
    {
        v_org = self gettagorigin( "j_spine4" );
    }
    else if ( isdefined( self ) )
    {
        str_tag = self zm_utility::function_467efa7b();
        
        if ( !isdefined( str_tag ) )
        {
            v_org = self.origin;
        }
        else
        {
            v_org = self gettagorigin( str_tag );
        }
    }
    
    if ( !isdefined( v_org ) )
    {
        return;
    }
    
    playfx( localclientnum, level._effect[ #"gaia_projectile_impact" ], v_org, anglestoforward( self.angles ) );
    self playsound( localclientnum, #"hash_3efca867dc76b512" );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 7
// Checksum 0xead6c9e0, Offset: 0x550
// Size: 0xaa
function mostmost_mo( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    util::playfxontag( localclientnum, level._effect[ #"gaia_projectile_trail" ], self, "tag_origin" );
    
    if ( !isdefined( self.n_sfx ) )
    {
        self.n_sfx = self playloopsound( #"hash_bc432b7cd09e11d" );
    }
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 7
// Checksum 0x8a2f45f4, Offset: 0x608
// Size: 0x21c
function gaia_impact_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self gettagorigin( "j_wingulna_le" ) ) )
    {
        v_org = self gettagorigin( "j_h_neck_lower" );
    }
    else if ( isdefined( self gettagorigin( "j_spine4" ) ) )
    {
        v_org = self gettagorigin( "j_spine4" );
    }
    else
    {
        v_org = self.origin;
    }
    
    v_forward = anglestoforward( self.angles ) * 1000 + self.origin;
    v_back = anglestoforward( self.angles ) * -100 + self.origin;
    a_trace = bullettrace( v_back, v_forward, 0, self );
    
    if ( isdefined( a_trace[ #"normal" ] ) )
    {
        v_ang = a_trace[ #"normal" ];
    }
    else
    {
        v_ang = anglestoforward( self.angles ) * -1;
    }
    
    playfx( localclientnum, level._effect[ #"gaia_projectile_impact" ], v_org, v_ang );
    playsound( localclientnum, #"hash_3bf3dbe329c0568b", self.origin );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 7
// Checksum 0x814dbb11, Offset: 0x830
// Size: 0x74
function function_10485953( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    util::playfxontag( localclientnum, level._effect[ #"gaia_spikes_crumble" ], self, "tag_origin" );
}

// Namespace zm_weap_hand_gaia/zm_weap_hand_gaia
// Params 7
// Checksum 0xdf913c8f, Offset: 0x8b0
// Size: 0x74
function function_3672d8a5( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    util::playfxontag( localclientnum, level._effect[ #"gaia_spikes_reveal" ], self, "tag_origin" );
}

