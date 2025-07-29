#using scripts\core_common\clientfield_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\core_common\vehicles\driving_fx;
#using scripts\core_common\visionset_mgr_shared;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\mp_common\callbacks;

#namespace killstreak_vehicle;

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 0
// Checksum 0xe0a671b8, Offset: 0x128
// Size: 0x134
function init()
{
    level._effect[ #"rcbomb_enemy_light" ] = #"killstreaks/fx_rcxd_lights_blinky";
    level._effect[ #"rcbomb_friendly_light" ] = #"killstreaks/fx_rcxd_lights_solid";
    level._effect[ #"rcbomb_enemy_light_blink" ] = #"killstreaks/fx_rcxd_lights_red";
    level._effect[ #"rcbomb_friendly_light_blink" ] = #"killstreaks/fx_rcxd_lights_grn";
    level._effect[ #"rcbomb_stunned" ] = #"hash_622d3cdb93e01de5";
    clientfield::register( "vehicle", "stunned", 1, 1, "int", &callback::callback_stunned, 0, 0 );
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x9debe69, Offset: 0x268
// Size: 0x84
function init_killstreak( bundle )
{
    if ( isdefined( bundle.ksvehicle ) )
    {
        vehicle::add_vehicletype_callback( bundle.ksvehicle, &spawned, bundle );
    }
    
    if ( isdefined( bundle.ksvehiclepost ) )
    {
        visionset_mgr::register_overlay_info_style_postfx_bundle( bundle.ksvehiclepost, 1, 1, bundle.ksvehiclepost );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2
// Checksum 0x73591017, Offset: 0x2f8
// Size: 0xbc
function spawned( localclientnum, bundle )
{
    self thread demo_think( localclientnum );
    self thread stunnedhandler( localclientnum );
    self thread boost_think( localclientnum );
    self thread shutdown_think( localclientnum );
    self.driving_fx_collision_override = &ondrivingfxcollision;
    self.driving_fx_jump_landing_override = &ondrivingfxjumplanding;
    self killstreak_bundles::spawned( localclientnum, bundle );
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0xd7b76ce, Offset: 0x3c0
// Size: 0x78
function demo_think( localclientnum )
{
    self endon( #"death" );
    
    if ( !isdemoplaying() )
    {
        return;
    }
    
    for ( ;; )
    {
        level waittill( #"demo_jump", #"demo_player_switch" );
        self vehicle::lights_off( localclientnum );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x82532e1a, Offset: 0x440
// Size: 0x114
function boost_blur( localclientnum )
{
    self endon( #"death" );
    
    if ( isdefined( self.owner ) && self.owner function_21c0fa55() )
    {
        enablespeedblur( localclientnum, getdvarfloat( #"scr_rcbomb_amount", 0.1 ), getdvarfloat( #"scr_rcbomb_inner_radius", 0.5 ), getdvarfloat( #"scr_rcbomb_outer_radius", 0.75 ), 0, 0 );
        wait getdvarfloat( #"scr_rcbomb_duration", 1 );
        disablespeedblur( localclientnum );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x6745f869, Offset: 0x560
// Size: 0x50
function boost_think( localclientnum )
{
    self endon( #"death" );
    
    for ( ;; )
    {
        self waittill( #"veh_boost" );
        self boost_blur( localclientnum );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x6cbeeb4c, Offset: 0x5b8
// Size: 0x34
function shutdown_think( localclientnum )
{
    self waittill( #"death" );
    disablespeedblur( localclientnum );
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x5067a8bc, Offset: 0x5f8
// Size: 0xa0
function play_boost_fx( localclientnum )
{
    self endon( #"death" );
    
    while ( true )
    {
        speed = self getspeed();
        
        if ( speed > 400 )
        {
            self playsound( localclientnum, #"mpl_veh_rc_boost" );
            return;
        }
        
        util::server_wait( localclientnum, 0.1 );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0xe3bef2b9, Offset: 0x6a0
// Size: 0xa0
function stunnedhandler( localclientnum )
{
    self endon( #"death" );
    self thread enginestutterhandler( localclientnum );
    
    while ( true )
    {
        self waittill( #"stunned" );
        self setstunned( 1 );
        self thread notstunnedhandler( localclientnum );
        self thread play_stunned_fx_handler( localclientnum );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x7baeb94c, Offset: 0x748
// Size: 0x5c
function notstunnedhandler( localclientnum )
{
    self endon( #"death" );
    self endon( #"stunned" );
    self waittill( #"not_stunned" );
    self setstunned( 0 );
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0xbb5edda3, Offset: 0x7b0
// Size: 0x90
function play_stunned_fx_handler( localclientnum )
{
    self endon( #"death" );
    self endon( #"stunned" );
    self endon( #"not_stunned" );
    
    while ( true )
    {
        util::playfxontag( localclientnum, level._effect[ #"rcbomb_stunned" ], self, "tag_origin" );
        wait 0.5;
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 1
// Checksum 0x9ca28fca, Offset: 0x848
// Size: 0x70
function enginestutterhandler( localclientnum )
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"veh_engine_stutter" );
        
        if ( self function_4add50a7() )
        {
            function_36e4ebd4( localclientnum, "rcbomb_engine_stutter" );
        }
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 5
// Checksum 0xb5ec124a, Offset: 0x8c0
// Size: 0x11c
function ondrivingfxcollision( localclientnum, player, hip, hitn, hit_intensity )
{
    if ( isdefined( hit_intensity ) && hit_intensity > 15 )
    {
        volume = driving_fx::get_impact_vol_from_speed();
        
        if ( isdefined( self.sounddef ) )
        {
            alias = self.sounddef + "_suspension_lg_hd";
        }
        else
        {
            alias = "veh_default_suspension_lg_hd";
        }
        
        id = playsound( 0, alias, self.origin, volume );
        earthquake( localclientnum, 0.7, 0.25, player.origin, 1500 );
        player playrumbleonentity( localclientnum, "damage_heavy" );
    }
}

// Namespace killstreak_vehicle/killstreak_vehicle
// Params 2
// Checksum 0xf5bcb5be, Offset: 0x9e8
// Size: 0x14
function ondrivingfxjumplanding( localclientnum, player )
{
    
}

