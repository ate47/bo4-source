#using scripts\core_common\beam_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\serverfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_lightning_chain;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_hand_ouranos;

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0, eflags: 0x2
// Checksum 0x72b86176, Offset: 0x1e0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_hand_ouranos", &__init__, undefined, undefined );
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 0
// Checksum 0x3ece80aa, Offset: 0x228
// Size: 0x35a
function __init__()
{
    clientfield::register( "scriptmover", "ouranos_shoot", 16000, 1, "counter", &function_b3ffbfd, 0, 0 );
    clientfield::register( "scriptmover", "ouranos_impact", 16000, 1, "counter", &ouranos_impact_fx, 0, 0 );
    clientfield::register( "allplayers", "" + #"ouranos_beam_fire", 16000, 1, "int", &skull_turret_beam_fire, 0, 1 );
    clientfield::register( "allplayers", "" + #"hash_4fb73e88d45af0ef", 16000, 1, "int", &function_98b06f97, 0, 1 );
    clientfield::register( "actor", "" + #"ouranos_proj_knock", 16000, getminbitcountfornum( 3 ), "int", &function_a1d614f9, 0, 1 );
    clientfield::register( "actor", "" + #"ouranos_zombie_impact", 16000, 1, "counter", &function_1322534b, 0, 0 );
    serverfield::register( "ouranos_feather_hit", 16000, getminbitcountfornum( 3 ), "int" );
    level._effect[ #"ouranos_wind" ] = #"hash_3ee5b689d09f0824";
    level._effect[ #"ouranos_trail" ] = #"hash_62f4ee1a2e3c46fc";
    level._effect[ #"ouranos_impact" ] = #"hash_5869597389a55f7b";
    level._effect[ #"ouranos_proj_knock" ] = #"hash_215ead487c4bef59";
    level._effect[ #"ouranos_wind_knock" ] = #"hash_4cc40e13ee8dff61";
    level._effect[ #"hash_31736c99409b40ef" ] = #"hash_44bd80522ac100e7";
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 7
// Checksum 0xdfd609ec, Offset: 0x590
// Size: 0x14c
function function_1322534b( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self gettagorigin( "j_spine4" ) ) )
    {
        v_org = self gettagorigin( "j_spine4" );
    }
    else
    {
        str_tag = self zm_utility::function_467efa7b();
        
        if ( !isdefined( str_tag ) )
        {
            str_tag = "tag_origin";
        }
        else
        {
            v_org = self gettagorigin( str_tag );
        }
    }
    
    playfx( localclientnum, level._effect[ #"ouranos_impact" ], v_org, anglestoforward( self.angles ) );
    playsound( localclientnum, #"hash_3360f981ac697bfe", self.origin );
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 7
// Checksum 0xadecf2d6, Offset: 0x6e8
// Size: 0x20c
function function_a1d614f9( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self gettagorigin( "j_spine4" ) ) )
    {
        str_tag = "j_spine4";
    }
    else
    {
        str_tag = self zm_utility::function_467efa7b();
        
        if ( !isdefined( str_tag ) )
        {
            str_tag = "tag_origin";
        }
    }
    
    if ( newval == 1 )
    {
        self playsound( localclientnum, #"hash_3360f981ac697bfe" );
        util::playfxontag( localclientnum, level._effect[ #"ouranos_proj_knock" ], self, str_tag );
        return;
    }
    
    if ( newval == 2 )
    {
        self playsound( localclientnum, #"hash_3360f981ac697bfe" );
        util::playfxontag( localclientnum, level._effect[ #"ouranos_wind_knock" ], self, str_tag );
        return;
    }
    
    if ( newval == 3 )
    {
        self playsound( localclientnum, #"hash_3360f981ac697bfe" );
        util::playfxontag( localclientnum, level._effect[ #"ouranos_proj_knock" ], self, str_tag );
        self thread function_f89a4434( localclientnum );
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1
// Checksum 0xed05ae75, Offset: 0x900
// Size: 0x202
function function_f89a4434( localclientnum )
{
    waitframe( 1 );
    
    if ( !isdefined( self ) || !isdefined( self.enemy ) )
    {
        return;
    }
    
    self endon( #"death" );
    self.enemy endon( #"death" );
    vol_center = getent( localclientnum, "vol_ww_ouranos_center_fletching", "targetname" );
    vol_cliff = getent( localclientnum, "vol_ww_ouranos_cliff_fletching", "targetname" );
    vol_serpent = getent( localclientnum, "vol_ww_ouranos_serpent_fletching", "targetname" );
    
    while ( isdefined( self ) )
    {
        if ( isdefined( vol_center ) && istouching( self.origin, vol_center ) )
        {
            if ( isdefined( self.enemy ) )
            {
                self.enemy thread function_1ebdc841( 1 );
                break;
            }
        }
        else if ( isdefined( vol_cliff ) && istouching( self.origin, vol_cliff ) )
        {
            if ( isdefined( self.enemy ) )
            {
                self.enemy thread function_1ebdc841( 2 );
                break;
            }
        }
        else if ( isdefined( vol_serpent ) && istouching( self.origin, vol_serpent ) )
        {
            if ( isdefined( self.enemy ) )
            {
                self.enemy thread function_1ebdc841( 3 );
                break;
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 1
// Checksum 0x919c7098, Offset: 0xb10
// Size: 0x64
function function_1ebdc841( n_feather )
{
    self endon( #"death" );
    self serverfield::set( "ouranos_feather_hit", n_feather );
    waitframe( 1 );
    self serverfield::set( "ouranos_feather_hit", 0 );
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 7
// Checksum 0xae0979, Offset: 0xb80
// Size: 0xaa
function function_b3ffbfd( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    util::playfxontag( localclientnum, level._effect[ #"ouranos_trail" ], self, "tag_origin" );
    
    if ( !isdefined( self.n_sfx ) )
    {
        self.n_sfx = self playloopsound( #"hash_166762facd657625" );
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 7
// Checksum 0x752e63e2, Offset: 0xc38
// Size: 0x21c
function ouranos_impact_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
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
    
    playfx( localclientnum, level._effect[ #"ouranos_impact" ], v_org, v_ang );
    playsound( localclientnum, #"hash_d09856cb05b1a39", self.origin );
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 7
// Checksum 0x475f6a7f, Offset: 0xe60
// Size: 0x1f6
function skull_turret_beam_fire( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death", #"disconnect" );
    
    if ( newval == 1 )
    {
        if ( isdefined( self.var_c400cdd5 ) )
        {
            killfx( localclientnum, self.var_c400cdd5 );
            self.var_c400cdd5 = undefined;
        }
        
        if ( !self zm_utility::function_f8796df3( localclientnum ) )
        {
            self.var_c400cdd5 = util::playfxontag( localclientnum, level._effect[ #"hash_31736c99409b40ef" ], self, "tag_weapon_right" );
        }
        
        if ( !isdefined( self.var_76c23e4c ) )
        {
            self playsound( localclientnum, #"hash_5e5e7d42f62fb92d" );
            self.var_76c23e4c = self playloopsound( #"hash_14ac86ceee99d2f3" );
        }
        
        return;
    }
    
    if ( isdefined( self.var_c400cdd5 ) )
    {
        killfx( localclientnum, self.var_c400cdd5 );
        self.var_c400cdd5 = undefined;
    }
    
    if ( isdefined( self.var_76c23e4c ) )
    {
        self playsound( localclientnum, #"hash_6b91419f41fc8d34" );
        self stoploopsound( self.var_76c23e4c );
        self.var_76c23e4c = undefined;
    }
}

// Namespace zm_weap_hand_ouranos/zm_weap_hand_ouranos
// Params 7
// Checksum 0x2d87370e, Offset: 0x1060
// Size: 0x10e
function function_98b06f97( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        if ( !isdefined( self.var_76c23e4c ) )
        {
            self playsound( localclientnum, #"hash_5e5e7d42f62fb92d" );
            self.var_76c23e4c = self playloopsound( #"hash_14ac86ceee99d2f3" );
        }
        
        return;
    }
    
    if ( isdefined( self.var_76c23e4c ) )
    {
        self playsound( localclientnum, #"hash_6b91419f41fc8d34" );
        self stoploopsound( self.var_76c23e4c );
        self.var_76c23e4c = undefined;
    }
}

