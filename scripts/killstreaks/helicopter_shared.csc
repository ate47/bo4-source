#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\duplicaterender_mgr;
#using scripts\core_common\fx_shared;
#using scripts\core_common\helicopter_sounds_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\killstreaks\flak_drone;
#using scripts\killstreaks\killstreak_bundles;

#namespace helicopter;

// Namespace helicopter/helicopter_shared
// Params 0
// Checksum 0xf19e8849, Offset: 0x408
// Size: 0x55c
function init_shared()
{
    if ( !isdefined( level.var_164c3b65 ) )
    {
        level.var_164c3b65 = {};
        flak_drone::init_shared();
        level.chopper_fx[ #"damage" ][ #"light_smoke" ] = "destruct/fx8_atk_chppr_smk_trail";
        level.chopper_fx[ #"damage" ][ #"heavy_smoke" ] = "destruct/fx8_atk_chppr_exp_trail";
        level._effect[ #"qrdrone_prop" ] = #"hash_6cd811fe548313ca";
        level._effect[ #"heli_guard_light" ][ #"friendly" ] = #"killstreaks/fx_sc_lights_grn";
        level._effect[ #"heli_guard_light" ][ #"enemy" ] = #"killstreaks/fx_sc_lights_red";
        level._effect[ #"heli_comlink_light" ][ #"common" ] = #"killstreaks/fx_drone_hunter_lights";
        level._effect[ #"heli_gunner_light" ][ #"friendly" ] = #"killstreaks/fx_vtol_lights_grn";
        level._effect[ #"heli_gunner_light" ][ #"enemy" ] = #"killstreaks/fx_vtol_lights_red";
        level._effect[ #"heli_gunner" ][ #"vtol_fx" ] = #"killstreaks/fx_vtol_thruster";
        level._effect[ #"heli_gunner" ][ #"vtol_fx_ft" ] = #"killstreaks/fx_vtol_thruster";
        clientfield::register( "vehicle", "heli_warn_targeted", 1, 1, "int", &warnmissilelocking, 0, 0 );
        clientfield::register( "vehicle", "heli_warn_locked", 1, 1, "int", &warnmissilelocked, 0, 0 );
        clientfield::register( "vehicle", "heli_warn_fired", 1, 1, "int", &warnmissilefired, 0, 0 );
        clientfield::register( "vehicle", "heli_comlink_bootup_anim", 1, 1, "int", &heli_comlink_bootup_anim, 0, 0 );
        duplicate_render::set_dr_filter_framebuffer( "active_camo_scorestreak", 90, "active_camo_on", "", 0, "mc/hud_outline_predator_camo_active_enemy_scorestreak", 0 );
        duplicate_render::set_dr_filter_framebuffer( "active_camo_flicker_scorestreak", 80, "active_camo_flicker", "", 0, "mc/hud_outline_predator_camo_disruption_enemy_scorestreak", 0 );
        duplicate_render::set_dr_filter_framebuffer_duplicate( "active_camo_reveal_scorestreak_dr", 90, "active_camo_reveal", "hide_model", 1, "mc/hud_outline_predator_camo_active_enemy_scorestreak", 0 );
        duplicate_render::set_dr_filter_framebuffer( "active_camo_reveal_scorestreak", 80, "active_camo_reveal,hide_model", "", 0, "mc/hud_outline_predator_scorestreak", 0 );
        clientfield::register( "vehicle", "active_camo", 1, 3, "int", &active_camo_changed, 0, 0 );
        callback::on_spawned( &on_player_spawned );
        bundle = struct::get_script_bundle( "killstreak", "killstreak_helicopter_comlink" );
        
        if ( isdefined( bundle ) )
        {
            vehicle::add_vehicletype_callback( bundle.ksvehicle, &killstreak_bundles::spawned, bundle );
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1
// Checksum 0xc4ed25fc, Offset: 0x970
// Size: 0xa6
function on_player_spawned( localclientnum )
{
    player = self;
    player waittill( #"death" );
    player.markerfx = undefined;
    
    if ( isdefined( player.markerobj ) )
    {
        player.markerobj delete();
    }
    
    if ( isdefined( player.markerfxhandle ) )
    {
        killfx( localclientnum, player.markerfxhandle );
        player.markerfxhandle = undefined;
    }
}

// Namespace helicopter/helicopter_shared
// Params 0
// Checksum 0xd36eba7c, Offset: 0xa20
// Size: 0x4c
function setupanimtree()
{
    if ( isdefined( self ) && self hasanimtree() == 0 )
    {
        self useanimtree( "generic" );
    }
}

// Namespace helicopter/helicopter_shared
// Params 7
// Checksum 0xb08ccba3, Offset: 0xa78
// Size: 0x15c
function active_camo_changed( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval == 0 )
    {
        self thread heli_comlink_lights_on_after_wait( localclientnum, 0.7 );
    }
    else
    {
        self heli_comlink_lights_off( localclientnum );
    }
    
    flags_changed = self duplicate_render::set_dr_flag( "active_camo_flicker", newval == 2 );
    flags_changed = self duplicate_render::set_dr_flag( "active_camo_on", 0 ) || flags_changed;
    flags_changed = self duplicate_render::set_dr_flag( "active_camo_reveal", 1 ) || flags_changed;
    
    if ( flags_changed )
    {
        self duplicate_render::update_dr_filters( localclientnum );
    }
    
    self notify( #"endtest" );
    self thread doreveal( localclientnum, newval != 0 );
}

// Namespace helicopter/helicopter_shared
// Params 2
// Checksum 0xeedecbb1, Offset: 0xbe0
// Size: 0x2b4
function doreveal( local_client_num, direction )
{
    self notify( #"endtest" );
    self endon( #"endtest" );
    self endon( #"death" );
    
    if ( direction )
    {
        self duplicate_render::update_dr_flag( local_client_num, "hide_model", 0 );
        startval = 0;
        endval = 1;
    }
    else
    {
        self duplicate_render::update_dr_flag( local_client_num, "hide_model", 1 );
        startval = 1;
        endval = 0;
    }
    
    priorvalue = startval;
    
    while ( startval >= 0 && startval <= 1 )
    {
        self mapshaderconstant( local_client_num, 0, "scriptVector0", startval, 0, 0, 0 );
        
        if ( direction )
        {
            startval += 0.032;
            
            if ( priorvalue < 0.5 && startval >= 0.5 )
            {
                self duplicate_render::set_dr_flag( "hide_model", 1 );
                self duplicate_render::change_dr_flags( local_client_num );
            }
        }
        else
        {
            startval -= 0.032;
            
            if ( priorvalue > 0.5 && startval <= 0.5 )
            {
                self duplicate_render::set_dr_flag( "hide_model", 0 );
                self duplicate_render::change_dr_flags( local_client_num );
            }
        }
        
        priorvalue = startval;
        waitframe( 1 );
    }
    
    self mapshaderconstant( local_client_num, 0, "scriptVector0", endval, 0, 0, 0 );
    flags_changed = self duplicate_render::set_dr_flag( "active_camo_reveal", 0 );
    flags_changed = self duplicate_render::set_dr_flag( "active_camo_on", direction ) || flags_changed;
    
    if ( flags_changed )
    {
        self duplicate_render::update_dr_filters( local_client_num );
    }
}

// Namespace helicopter/helicopter_shared
// Params 7
// Checksum 0xd1c52fd0, Offset: 0xea0
// Size: 0x50
function heli_comlink_bootup_anim( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    self endon( #"death" );
}

// Namespace helicopter/helicopter_shared
// Params 7
// Checksum 0xcd1d8bca, Offset: 0xef8
// Size: 0x7c
function warnmissilelocking( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !self function_4add50a7() )
    {
        return;
    }
    
    helicopter_sounds::play_targeted_sound( newval );
}

// Namespace helicopter/helicopter_shared
// Params 7
// Checksum 0xfc2eba99, Offset: 0xf80
// Size: 0x7c
function warnmissilelocked( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !self function_4add50a7() )
    {
        return;
    }
    
    helicopter_sounds::play_locked_sound( newval );
}

// Namespace helicopter/helicopter_shared
// Params 7
// Checksum 0xd76903b0, Offset: 0x1008
// Size: 0x7c
function warnmissilefired( localclientnum, oldval, newval, bnewent, binitialsnap, fieldname, bwastimejump )
{
    if ( newval && !self function_4add50a7() )
    {
        return;
    }
    
    helicopter_sounds::play_fired_sound( newval );
}

// Namespace helicopter/helicopter_shared
// Params 1
// Checksum 0xf83ea8db, Offset: 0x1090
// Size: 0x156
function heli_deletefx( localclientnum )
{
    if ( isdefined( self.exhaustleftfxhandle ) )
    {
        deletefx( localclientnum, self.exhaustleftfxhandle );
        self.exhaustleftfxhandle = undefined;
    }
    
    if ( isdefined( self.exhaustrightfxhandlee ) )
    {
        deletefx( localclientnum, self.exhaustrightfxhandle );
        self.exhaustrightfxhandle = undefined;
    }
    
    if ( isdefined( self.lightfxid ) )
    {
        deletefx( localclientnum, self.lightfxid );
        self.lightfxid = undefined;
    }
    
    if ( isdefined( self.propfxid ) )
    {
        deletefx( localclientnum, self.propfxid );
        self.propfxid = undefined;
    }
    
    if ( isdefined( self.vtolleftfxid ) )
    {
        deletefx( localclientnum, self.vtolleftfxid );
        self.vtolleftfxid = undefined;
    }
    
    if ( isdefined( self.vtolrightfxid ) )
    {
        deletefx( localclientnum, self.vtolrightfxid );
        self.vtolrightfxid = undefined;
    }
}

// Namespace helicopter/helicopter_shared
// Params 1
// Checksum 0xee4b827f, Offset: 0x11f0
// Size: 0x36a
function startfx( localclientnum )
{
    self endon( #"death" );
    
    if ( isdefined( self.vehicletype ) )
    {
        if ( self.vehicletype == #"remote_mortar_vehicle_mp" )
        {
            return;
        }
        
        if ( self.vehicletype == #"vehicle_straferun_mp" )
        {
            return;
        }
    }
    
    if ( isdefined( self.exhaustfxname ) && self.exhaustfxname != "" )
    {
        self.exhaustfx = self.exhaustfxname;
    }
    
    if ( isdefined( self.exhaustfx ) )
    {
        self.exhaustleftfxhandle = util::playfxontag( localclientnum, self.exhaustfx, self, "tag_engine_left" );
        
        if ( !( isdefined( self.oneexhaust ) && self.oneexhaust ) )
        {
            self.exhaustrightfxhandle = util::playfxontag( localclientnum, self.exhaustfx, self, "tag_engine_right" );
        }
    }
    else
    {
        println( "<dev string:x38>" );
    }
    
    if ( isdefined( self.vehicletype ) )
    {
        light_fx = undefined;
        prop_fx = undefined;
        
        switch ( self.vehicletype )
        {
            case #"heli_ai_mp":
                light_fx = "heli_comlink_light";
                break;
            case #"heli_player_gunner_mp":
                self.vtolleftfxid = util::playfxontag( localclientnum, level._effect[ #"heli_gunner" ][ #"vtol_fx" ], self, "tag_engine_left" );
                self.vtolrightfxid = util::playfxontag( localclientnum, level._effect[ #"heli_gunner" ][ #"vtol_fx_ft" ], self, "tag_engine_right" );
                light_fx = "heli_gunner_light";
                break;
            case #"heli_guard_mp":
                light_fx = "heli_guard_light";
                break;
            case #"qrdrone_mp":
                prop_fx = "qrdrone_prop";
                break;
        }
        
        if ( isdefined( light_fx ) )
        {
            self.lightfxid = self fx::function_3539a829( localclientnum, level._effect[ light_fx ][ #"friendly" ], level._effect[ light_fx ][ #"enemy" ], "tag_origin" );
        }
        
        if ( isdefined( prop_fx ) && !self function_4add50a7() )
        {
            self.propfxid = util::playfxontag( localclientnum, level._effect[ prop_fx ], self, "tag_origin" );
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1
// Checksum 0x1690069f, Offset: 0x1568
// Size: 0xe2
function startfx_loop( localclientnum )
{
    self endon( #"death" );
    self thread helicopter_sounds::aircraft_dustkick( localclientnum );
    startfx( localclientnum );
    servertime = getservertime( 0 );
    lastservertime = servertime;
    
    while ( isdefined( self ) )
    {
        if ( servertime < lastservertime )
        {
            heli_deletefx( localclientnum );
            startfx( localclientnum );
        }
        
        waitframe( 1 );
        lastservertime = servertime;
        servertime = getservertime( 0 );
    }
}

// Namespace helicopter/helicopter_shared
// Params 3
// Checksum 0x6e2f6266, Offset: 0x1658
// Size: 0x4a
function trail_fx( localclientnum, trail_fx, trail_tag )
{
    id = util::playfxontag( localclientnum, trail_fx, self, trail_tag );
    return id;
}

// Namespace helicopter/helicopter_shared
// Params 2
// Checksum 0x9fba2765, Offset: 0x16b0
// Size: 0x54
function heli_comlink_lights_on_after_wait( localclientnum, wait_time )
{
    self endon( #"death" );
    self endon( #"heli_comlink_lights_off" );
    wait wait_time;
    self heli_comlink_lights_on( localclientnum );
}

// Namespace helicopter/helicopter_shared
// Params 1
// Checksum 0x7376df39, Offset: 0x1710
// Size: 0x1ee
function heli_comlink_lights_on( localclientnum )
{
    if ( !isdefined( self.light_fx_handles_heli_comlink ) )
    {
        self.light_fx_handles_heli_comlink = [];
    }
    
    self.light_fx_handles_heli_comlink[ 0 ] = util::playfxontag( localclientnum, level._effect[ #"heli_comlink_light" ][ #"common" ], self, "tag_fx_light_left" );
    self.light_fx_handles_heli_comlink[ 1 ] = util::playfxontag( localclientnum, level._effect[ #"heli_comlink_light" ][ #"common" ], self, "tag_fx_light_right" );
    self.light_fx_handles_heli_comlink[ 2 ] = util::playfxontag( localclientnum, level._effect[ #"heli_comlink_light" ][ #"common" ], self, "tag_fx_tail" );
    self.light_fx_handles_heli_comlink[ 3 ] = util::playfxontag( localclientnum, level._effect[ #"heli_comlink_light" ][ #"common" ], self, "tag_fx_scanner" );
    
    if ( isdefined( self.team ) )
    {
        for ( i = 0; i < self.light_fx_handles_heli_comlink.size ; i++ )
        {
            setfxteam( localclientnum, self.light_fx_handles_heli_comlink[ i ], self.owner.team );
        }
    }
}

// Namespace helicopter/helicopter_shared
// Params 1
// Checksum 0x9ad2455b, Offset: 0x1908
// Size: 0x96
function heli_comlink_lights_off( localclientnum )
{
    self notify( #"heli_comlink_lights_off" );
    
    if ( isdefined( self.light_fx_handles_heli_comlink ) )
    {
        for ( i = 0; i < self.light_fx_handles_heli_comlink.size ; i++ )
        {
            if ( isdefined( self.light_fx_handles_heli_comlink[ i ] ) )
            {
                deletefx( localclientnum, self.light_fx_handles_heli_comlink[ i ] );
            }
        }
        
        self.light_fx_handles_heli_comlink = undefined;
    }
}

