#using scripts\core_common\clientfield_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\postfx_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace zm_fasttravel;

// Namespace zm_fasttravel/zm_fasttravel
// Params 0, eflags: 0x2
// Checksum 0xf54ada92, Offset: 0x320
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"zm_fasttravel", &__init__, undefined, undefined );
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0
// Checksum 0x4a57bf6b, Offset: 0x368
// Size: 0x24
function __init__()
{
    init_clientfields();
    init_fx();
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0
// Checksum 0x930a5852, Offset: 0x398
// Size: 0x254
function init_clientfields()
{
    clientfield::register( "world", "fasttravel_exploder", 1, 1, "int", &fasttravel_exploder, 0, 0 );
    clientfield::register( "scriptmover", "" + #"wormhole_fx", 1, 2, "int", &wormhole_fx, 0, 0 );
    clientfield::register( "toplayer", "player_stargate_fx", 1, 1, "int", &player_stargate_fx, 0, 1 );
    clientfield::register( "toplayer", "player_chaos_light_rail_fx", 1, 1, "int", &player_chaos_light_rail_fx, 0, 1 );
    clientfield::register( "toplayer", "fasttravel_teleport_sfx", 1, 1, "int", &fasttravel_teleport_sfx, 0, 0 );
    clientfield::register( "allplayers", "fasttravel_start_fx", 1, 1, "counter", &fasttravel_start_fx, 0, 0 );
    clientfield::register( "allplayers", "fasttravel_end_fx", 1, 1, "counter", &fasttravel_end_fx, 0, 0 );
    clientfield::register( "allplayers", "fasttravel_rail_fx", 1, 2, "int", &fasttravel_rail_fx, 0, 0 );
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 0
// Checksum 0xae49d863, Offset: 0x5f8
// Size: 0x152
function init_fx()
{
    level._effect[ #"fasttravel_start" ] = #"hash_2f54a4439f3a1dbf";
    level._effect[ #"fasttravel_end" ] = #"hash_4ab05aa1282b9bb7";
    level._effect[ #"fasttravel_rail_1p" ] = #"hash_259bb7806d596ed3";
    level._effect[ #"fasttravel_break_1p" ] = #"hash_37257517a8fd29e";
    level._effect[ #"fasttravel_rail_3p" ] = #"hash_809f6b4b699e4df";
    level._effect[ #"fasttravel_break_3p" ] = #"hash_13715b19c0c0e890";
    level._effect[ #"fasttravel_rail_travel" ] = #"hash_3659a06ed75f940a";
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0x6895289b, Offset: 0x758
// Size: 0x84
function fasttravel_exploder( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        level exploder::exploder( "fxexp_fast_travel_orbs" );
        return;
    }
    
    level exploder::stop_exploder( "fxexp_fast_travel_orbs" );
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0xa325ffb, Offset: 0x7e8
// Size: 0x224
function player_chaos_light_rail_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        if ( isdemoplaying() && demoisanyfreemovecamera() )
        {
            return;
        }
        
        var_8203417 = function_5c10bd79( localclientnum );
        
        if ( self != var_8203417 )
        {
            return;
        }
        
        if ( !isdefined( self.var_9a68f89f ) )
        {
            v_origin = self gettagorigin( "tag_eye" );
            self.var_9a68f89f = self function_dddf661d( localclientnum, "fasttravel_rail_travel", "tag_origin", v_origin, self.angles );
            self thread function_eaba4969( localclientnum, "fasttravel_rail_travel_complete", self.var_9a68f89f );
        }
        
        if ( isdefined( level.var_5603a802 ) )
        {
            self thread postfx::playpostfxbundle( level.var_5603a802 );
        }
        else
        {
            self thread postfx::playpostfxbundle( "pstfx_zm_chaos_temp" );
        }
        
        return;
    }
    
    self notify( #"fasttravel_rail_travel_complete" );
    
    if ( isdefined( self.var_9a68f89f ) )
    {
        function_4468d7ac( localclientnum, self.var_9a68f89f );
        self.var_9a68f89f = undefined;
    }
    
    if ( isdefined( level.var_5603a802 ) )
    {
        self postfx::exitpostfxbundle( level.var_5603a802 );
        return;
    }
    
    self postfx::exitpostfxbundle( "pstfx_zm_chaos_temp" );
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0x9f1743df, Offset: 0xa18
// Size: 0xc4
function wormhole_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        str_fx = "zombie/fx8_teleport_instant_1p_ported";
    }
    else if ( newval == 2 )
    {
        str_fx = "zombie/fx8_teleport_instant_1p";
    }
    
    if ( isdefined( str_fx ) )
    {
        self util::waittill_dobj( localclientnum );
        util::playfxontag( localclientnum, str_fx, self, "tag_fx_wormhole" );
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0x11db31e2, Offset: 0xae8
// Size: 0xb4
function player_stargate_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        if ( isdemoplaying() && demoisanyfreemovecamera() )
        {
            return;
        }
        
        self thread postfx::playpostfxbundle( "pstfx_zm_wormhole" );
        return;
    }
    
    self postfx::exitpostfxbundle( "pstfx_zm_wormhole" );
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0xfa0e1384, Offset: 0xba8
// Size: 0x126
function fasttravel_teleport_sfx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self util::waittill_dobj( localclientnum );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    if ( newval )
    {
        if ( !isdefined( self.fasttravel_teleport_sfx ) )
        {
            self playsound( localclientnum, #"hash_695df080bafaf6b7" );
            self.fasttravel_teleport_sfx = self playloopsound( #"hash_337255a64f96457b" );
        }
        
        return;
    }
    
    if ( isdefined( self.fasttravel_teleport_sfx ) )
    {
        self playsound( localclientnum, #"hash_32def2a5219ba9ee" );
        self stoploopsound( self.fasttravel_teleport_sfx );
        self.fasttravel_teleport_sfx = undefined;
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0xcfafe89d, Offset: 0xcd8
// Size: 0x1bc
function fasttravel_start_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    level endon( #"end_game" );
    self endon( #"bled_out", #"disconnect" );
    
    if ( self != function_5c10bd79( localclientnum ) )
    {
        if ( newval == 1 )
        {
            var_1d1bbd52 = struct::get_array( "fasttravel_trigger", "targetname" );
            var_4d611aa2 = arraygetclosest( self.origin, var_1d1bbd52 );
            
            if ( !isdefined( var_4d611aa2 ) )
            {
                return;
            }
            
            v_angles = vectortoangles( var_4d611aa2.origin - self.origin );
            mdl_fx = util::spawn_model( localclientnum, "tag_origin", self.origin, v_angles );
            waitframe( 1 );
            util::playfxontag( localclientnum, level._effect[ #"fasttravel_start" ], mdl_fx, "tag_origin" );
            wait 1.5;
            mdl_fx delete();
        }
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0xe8c6ff9f, Offset: 0xea0
// Size: 0x5c
function fasttravel_end_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval )
    {
        self thread play_fasttravel_end_fx( localclientnum );
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2
// Checksum 0xea1b324, Offset: 0xf08
// Size: 0x12c
function play_fasttravel_end_fx( localclientnum, var_b8763ebc = "fasttravel_end" )
{
    level endon( #"end_game" );
    self endon( #"bled_out", #"disconnect" );
    
    if ( self != function_5c10bd79( localclientnum ) )
    {
        v_angles = combineangles( self.angles, ( -90, 0, 0 ) );
        mdl_fx = util::spawn_model( localclientnum, "tag_origin", self.origin, v_angles );
        waitframe( 1 );
        util::playfxontag( localclientnum, level._effect[ var_b8763ebc ], mdl_fx, "tag_origin" );
        wait 1.15;
        mdl_fx delete();
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 7
// Checksum 0xf98309aa, Offset: 0x1040
// Size: 0x43e
function fasttravel_rail_fx( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 1 )
    {
        if ( !isdefined( self.sfx_fasttravel ) )
        {
            self playsound( localclientnum, #"hash_7204b092c976136b" );
            self.sfx_fasttravel = self playloopsound( #"hash_33b6a998603c309d" );
        }
        
        if ( !isdefined( self.var_a6b9f4c1 ) )
        {
            var_8203417 = function_5c10bd79( localclientnum );
            
            if ( self == var_8203417 )
            {
                v_origin = self gettagorigin( "tag_eye" );
                self.var_a6b9f4c1 = self function_dddf661d( localclientnum, "fasttravel_rail_1p", "tag_origin", v_origin, self.angles );
            }
            else
            {
                v_origin = self gettagorigin( "j_spine4" );
                self.var_a6b9f4c1 = self function_dddf661d( localclientnum, "fasttravel_rail_3p", "tag_origin", v_origin, self.angles );
            }
            
            self thread function_eaba4969( localclientnum, "fasttravel_rail_fx_complete", self.var_a6b9f4c1 );
        }
        
        return;
    }
    
    if ( newval == 2 )
    {
        if ( !isdefined( self.sfx_fasttravel ) )
        {
            self playsound( localclientnum, #"hash_7f171ce50ab41fb8" );
            self.sfx_fasttravel = self playloopsound( #"hash_59921813746566c8" );
        }
        
        if ( isdefined( self.var_a6b9f4c1 ) )
        {
            self notify( #"fasttravel_rail_fx_complete" );
            function_4468d7ac( localclientnum, self.var_a6b9f4c1 );
        }
        
        var_8203417 = function_5c10bd79( localclientnum );
        
        if ( self == var_8203417 )
        {
            v_origin = self gettagorigin( "tag_eye" );
            self.var_a6b9f4c1 = self function_dddf661d( localclientnum, "fasttravel_break_1p", "tag_origin", v_origin, self.angles );
        }
        else
        {
            v_origin = self gettagorigin( "j_spine4" );
            self.var_a6b9f4c1 = self function_dddf661d( localclientnum, "fasttravel_break_3p", "tag_origin", v_origin, self.angles );
        }
        
        self thread function_eaba4969( localclientnum, "fasttravel_rail_fx_complete", self.var_a6b9f4c1 );
        return;
    }
    
    if ( newval == 0 )
    {
        if ( isdefined( self.sfx_fasttravel ) )
        {
            self playsound( localclientnum, #"hash_588047eba8deb34e" );
            self stoploopsound( self.sfx_fasttravel );
            self.sfx_fasttravel = undefined;
        }
        
        if ( isdefined( self.var_a6b9f4c1 ) )
        {
            self notify( #"fasttravel_rail_fx_complete" );
            function_4468d7ac( localclientnum, self.var_a6b9f4c1 );
            self.var_a6b9f4c1 = undefined;
        }
    }
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 5, eflags: 0x4
// Checksum 0x32043e85, Offset: 0x1488
// Size: 0xb2
function private function_dddf661d( localclientnum, str_fx, str_tag, v_origin, v_angles )
{
    mdl_fx = util::spawn_model( localclientnum, "tag_origin", v_origin, v_angles );
    mdl_fx linkto( self, str_tag );
    mdl_fx.n_fx = util::playfxontag( localclientnum, level._effect[ str_fx ], mdl_fx, "tag_origin" );
    return mdl_fx;
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 3, eflags: 0x4
// Checksum 0xa4a8eec7, Offset: 0x1548
// Size: 0x6c
function private function_eaba4969( localclientnum, var_92d4e054, mdl_fx )
{
    level endon( #"end_game" );
    self endon( var_92d4e054 );
    self waittill( #"death" );
    function_4468d7ac( localclientnum, mdl_fx );
}

// Namespace zm_fasttravel/zm_fasttravel
// Params 2, eflags: 0x4
// Checksum 0xdaa9bb01, Offset: 0x15c0
// Size: 0x64
function private function_4468d7ac( localclientnum, mdl_fx )
{
    if ( isdefined( mdl_fx ) )
    {
        if ( isdefined( mdl_fx.n_fx ) )
        {
            stopfx( localclientnum, mdl_fx.n_fx );
        }
        
        mdl_fx delete();
    }
}

