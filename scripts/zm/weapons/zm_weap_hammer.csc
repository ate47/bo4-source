#using script_70ab01a7690ea256;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_lightning_chain;
#using scripts\zm_common\zm_utility;

#namespace zm_weap_hammer;

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 0, eflags: 0x2
// Checksum 0xbf1cc9c, Offset: 0x138
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_weap_hammer", &__init__, undefined, undefined );
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 0
// Checksum 0xdda56cb9, Offset: 0x180
// Size: 0x5d6
function __init__()
{
    clientfield::register( "allplayers", "" + #"lightning_bolt_fx", 1, 1, "counter", &function_37d03e44, 0, 0 );
    clientfield::register( "toplayer", "" + #"hero_hammer_armor_postfx", 1, 1, "counter", &function_6765f5b4, 0, 0 );
    clientfield::register( "scriptmover", "" + #"lightning_miss_fx", 1, 1, "int", &function_93d275f2, 0, 0 );
    clientfield::register( "scriptmover", "" + #"hammer_storm", 1, 1, "int", &hammer_storm, 0, 0 );
    clientfield::register( "actor", "" + #"hero_hammer_melee_impact_trail", 1, 1, "counter", &function_e6845153, 0, 0 );
    clientfield::register( "vehicle", "" + #"hero_hammer_melee_impact_trail", 1, 1, "counter", &function_e6845153, 0, 0 );
    clientfield::register( "actor", "" + #"lightning_impact_fx", 1, 1, "int", &function_54b0b1b, 0, 0 );
    clientfield::register( "vehicle", "" + #"lightning_impact_fx", 1, 1, "int", &function_54b0b1b, 0, 0 );
    clientfield::register( "actor", "" + #"lightning_arc_fx", 1, 1, "int", &function_311f3501, 0, 0 );
    clientfield::register( "vehicle", "" + #"lightning_arc_fx", 1, 1, "int", &function_311f3501, 0, 0 );
    clientfield::register( "actor", "" + #"hero_hammer_stun", 1, 1, "int", &function_cd968d6, 0, 0 );
    clientfield::register( "vehicle", "" + #"hero_hammer_stun", 1, 1, "int", &function_cd968d6, 0, 0 );
    clientfield::register( "toplayer", "" + #"hammer_rumble", 1, 1, "counter", &hammer_rumble, 0, 0 );
    level._effect[ #"hammer_storm" ] = #"hash_20c78a023629447a";
    level._effect[ #"lightning_miss" ] = #"hash_211c80023671737b";
    level._effect[ #"lightning_arc" ] = #"hash_5bf3f1914a8ad11f";
    level._effect[ #"lightning_impact" ] = #"hash_13721326cc2b0c0d";
    level._effect[ #"hash_68b51e827d391590" ] = #"hash_6a3c982733846cf1";
    level._effect[ #"hash_68bc2a827d3f48a2" ] = #"hash_6a3c982733846cf1";
    level._effect[ #"hash_710d46f7ce760dda" ] = #"hash_421d1bfc8c356db6";
    level.var_76234ae5 = [];
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0x90f235ce, Offset: 0x760
// Size: 0x5c
function function_37d03e44( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    thread lightning_bolt_fx( localclientnum, self, self.origin );
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 3
// Checksum 0x802a1cdc, Offset: 0x7c8
// Size: 0x104
function lightning_bolt_fx( localclientnum, owner, position )
{
    if ( self zm_utility::function_f8796df3( localclientnum ) )
    {
        fx = level._effect[ #"groundhit_1p" ];
        fwd = anglestoforward( owner.angles );
        playfx( localclientnum, fx, position + fwd * 100, fwd );
        return;
    }
    
    fx = level._effect[ #"groundhit_3p" ];
    fwd = anglestoforward( owner.angles );
    playfx( localclientnum, fx, position, fwd );
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0xb9a0fa1a, Offset: 0x8d8
// Size: 0x84
function function_e6845153( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    util::playfxontag( localclientnum, level._effect[ #"hash_710d46f7ce760dda" ], self, self zm_utility::function_467efa7b() );
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0xd0f0a564, Offset: 0x968
// Size: 0x1a6
function hammer_storm( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        if ( isdefined( self.n_beacon_fx ) )
        {
            deletefx( localclientnum, self.n_beacon_fx, 1 );
        }
        
        self.n_beacon_fx = util::playfxontag( localclientnum, level._effect[ #"hammer_storm" ], self, "tag_origin" );
        
        if ( !isdefined( self.var_49f8e089 ) )
        {
            self.var_49f8e089 = self playloopsound( #"hash_1fc7648098c65e92" );
            self thread function_9f78a957( localclientnum );
        }
        
        return;
    }
    
    if ( isdefined( self.n_beacon_fx ) )
    {
        deletefx( localclientnum, self.n_beacon_fx, 0 );
        self.n_beacon_fx = undefined;
    }
    
    self playsound( 0, #"hash_15633b83c64a3ebb" );
    
    if ( isdefined( self.var_49f8e089 ) )
    {
        self notify( #"hash_5384bc96a8e66d91" );
        self stoploopsound( self.var_49f8e089 );
        self.var_49f8e089 = undefined;
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 1
// Checksum 0x9dde111c, Offset: 0xb18
// Size: 0x78
function function_9f78a957( localclientnum )
{
    self endon( #"hash_5384bc96a8e66d91" );
    self endon( #"death" );
    
    while ( isdefined( self ) )
    {
        self playsound( 0, "wpn_hammer_storm_bolt" );
        wait randomfloatrange( 0.2, 0.8 );
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0xb423c8e5, Offset: 0xb98
// Size: 0xfc
function function_54b0b1b( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self.var_89d8285 ) )
    {
        deletefx( localclientnum, self.var_89d8285, 1 );
        self.var_89d8285 = undefined;
    }
    
    if ( newval == 1 )
    {
        self.var_89d8285 = util::playfxontag( localclientnum, level._effect[ #"lightning_impact" ], self, self zm_utility::function_467efa7b() );
        self playsound( localclientnum, #"hash_63d588d1f28ecdc1" );
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0xe9b0de5a, Offset: 0xca0
// Size: 0xfe
function function_93d275f2( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( isdefined( self.var_9f5d50f5 ) )
    {
        deletefx( localclientnum, self.var_9f5d50f5, 1 );
        self.var_9f5d50f5 = undefined;
    }
    
    if ( isdefined( level.var_76234ae5[ localclientnum ] ) )
    {
        level.var_76234ae5[ localclientnum ] = undefined;
    }
    
    if ( newval == 1 )
    {
        self.var_9f5d50f5 = util::playfxontag( localclientnum, level._effect[ #"lightning_miss" ], self, "tag_origin" );
        level.var_76234ae5[ localclientnum ] = self;
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 1, eflags: 0x4
// Checksum 0x25aeacb4, Offset: 0xda8
// Size: 0x250
function private function_7dac3bb6( localclientnum )
{
    self endon( #"death", #"hash_5531647ca0352039" );
    
    while ( !isdefined( level.var_76234ae5[ localclientnum ] ) )
    {
        waitframe( 1 );
    }
    
    e_ball = level.var_76234ae5[ localclientnum ];
    e_ball endon( #"death" );
    util::server_wait( localclientnum, randomfloatrange( 0.05, 0.1 ) );
    
    if ( !isdefined( e_ball ) )
    {
        return;
    }
    
    self.e_fx = util::spawn_model( localclientnum, #"tag_origin", e_ball.origin );
    self.fx_arc = util::playfxontag( localclientnum, level._effect[ #"lightning_arc" ], self.e_fx, "tag_origin" );
    
    while ( true )
    {
        var_a05eed18 = self gettagorigin( self zm_utility::function_467efa7b() );
        
        if ( isdefined( var_a05eed18 ) )
        {
            self.e_fx moveto( var_a05eed18, 0.1 );
        }
        else
        {
            self.e_fx moveto( self.origin, 0.1 );
        }
        
        util::server_wait( localclientnum, 0.1 );
        
        if ( !isdefined( e_ball ) )
        {
            return;
        }
        
        self.e_fx moveto( e_ball.origin, 0.1 );
        util::server_wait( localclientnum, 0.1 );
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0xe4b76de3, Offset: 0x1000
// Size: 0x96
function function_311f3501( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwasdemojump )
{
    if ( newval == 1 )
    {
        self thread function_7dac3bb6( localclientnum );
        self thread function_85050f7f( localclientnum );
        return;
    }
    
    self notify( #"hash_5531647ca0352039" );
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 1, eflags: 0x4
// Checksum 0x5a12475c, Offset: 0x10a0
// Size: 0x96
function private function_85050f7f( localclientnum )
{
    self waittill( #"death", #"hash_5531647ca0352039" );
    
    if ( isdefined( self.fx_arc ) )
    {
        stopfx( localclientnum, self.fx_arc );
        self.fx_arc = undefined;
    }
    
    if ( isdefined( self.e_fx ) )
    {
        self.e_fx delete();
        self.e_fx = undefined;
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7, eflags: 0x4
// Checksum 0x2b5953fd, Offset: 0x1140
// Size: 0x8c
function private function_6765f5b4( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue && !namespace_a6aea2c6::is_active( #"silent_film" ) )
    {
        self thread postfx::playpostfxbundle( #"hash_74fd0cf7c91d14d0" );
    }
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0x35af8a06, Offset: 0x11d8
// Size: 0x106
function function_cd968d6( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        if ( !isdefined( self.var_89d8285 ) )
        {
            self.var_89d8285 = util::playfxontag( localclientnum, level._effect[ #"lightning_impact" ], self, self zm_utility::function_467efa7b() );
        }
        
        self playsound( localclientnum, #"hash_63d588d1f28ecdc1" );
        return;
    }
    
    if ( isdefined( self.var_89d8285 ) )
    {
        deletefx( localclientnum, self.var_89d8285, 1 );
    }
    
    self.var_89d8285 = undefined;
}

// Namespace zm_weap_hammer/zm_weap_hammer
// Params 7
// Checksum 0x45fec1a4, Offset: 0x12e8
// Size: 0x8a
function hammer_rumble( localclientnum, oldvalue, newvalue, bnewent, binitialsnap, fieldname, wasdemojump )
{
    if ( newvalue )
    {
        switch ( newvalue )
        {
            case 4:
                self playrumbleonentity( localclientnum, "zm_weap_hammer_swipe_hit_rumble" );
                break;
        }
    }
}

