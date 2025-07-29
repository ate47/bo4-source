#using script_59a783d756554a80;
#using scripts\core_common\array_shared;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_office_teleporters;
#using scripts\zm\zm_office_ww_quest;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_office_defcon;

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xa25108bb, Offset: 0x450
// Size: 0x18e
function pentagon_packapunch_init()
{
    level thread pack_hideaway_init();
    level thread pack_door_init();
    level.defcon_level = 1;
    level.defcon_activated = 0;
    level.ignore_spawner_func = &pentagon_ignore_spawner;
    level._effect[ #"hash_4ec0caccaa9167d3" ] = #"hash_6cd6da1c7e245c1c";
    level.var_5531a118 = level._effect[ #"hash_4ec0caccaa9167d3" ];
    level._effect[ #"hash_415ba37393754417" ] = #"hash_35cb5be5a38af07c";
    level.var_2e21f906 = level._effect[ #"hash_415ba37393754417" ];
    level thread defcon_sign_lights();
    punch_switches = getentarray( "punch_switch", "targetname" );
    
    if ( isdefined( punch_switches ) )
    {
        for ( i = 0; i < punch_switches.size ; i++ )
        {
            punch_switches[ i ] thread defcon_sign_setup();
        }
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xd0ba4870, Offset: 0x5e8
// Size: 0x8f2
function defcon_sign_setup()
{
    self setcursorhint( "HINT_NOICON" );
    self usetriggerrequirelookat();
    self sethintstring( #"zombie/need_power" );
    level waittill( #"hash_2124984d1ece329c" );
    self.lights = getentarray( self.target, "targetname" );
    
    if ( isdefined( self.lights ) && util::get_game_type() != #"zstandard" )
    {
        for ( j = 0; j < self.lights.size ; j++ )
        {
            if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "defcon_bulb" )
            {
                self.lights[ j ] setmodel( "p8_zm_off_trap_switch_light_green_on" );
                self.var_dd7da790[ j ] = util::spawn_model( "tag_origin", self.lights[ j ].origin );
                self.var_dd7da790[ j ].angles = self.lights[ j ].angles;
                self.var_dd7da790[ j ].var_fe0165db = playfxontag( level.var_5531a118, self.var_dd7da790[ j ], "tag_origin" );
            }
        }
    }
    
    while ( true )
    {
        if ( function_8b1a219a() )
        {
            self sethintstring( #"hash_2c6e2897c388e68" );
        }
        else
        {
            self sethintstring( #"hash_734fe766ffad1d04" );
        }
        
        waitresult = self waittill( #"trigger" );
        user = waitresult.activator;
        self sethintstring( "" );
        
        if ( isdefined( self.lights ) )
        {
            for ( j = 0; j < self.lights.size ; j++ )
            {
                if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "defcon_bulb" )
                {
                    self.lights[ j ] setmodel( "p8_zm_off_trap_switch_light_red_on" );
                    self.var_dd7da790[ j ] delete();
                    self.var_dd7da790[ j ] = util::spawn_model( "tag_origin", self.lights[ j ].origin );
                    self.var_dd7da790[ j ].angles = self.lights[ j ].angles;
                    self.var_dd7da790[ j ].var_b8a3170a = playfxontag( level.var_2e21f906, self.var_dd7da790[ j ], "tag_origin" );
                }
                
                if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "defcon_handle" )
                {
                    self.lights[ j ] rotatepitch( -180, 0.5 );
                    self.lights[ j ] playsound( "zmb_defcon_switch" );
                }
            }
        }
        
        zm_office_ww_quest::function_fec4fc26( self );
        
        if ( level.defcon_level != 4 )
        {
            level.defcon_level++;
            
            if ( level.zombie_vars[ #"zombie_powerup_bonfire_sale_on" ] == 0 )
            {
                level thread namespace_8f53e87b::play_pentagon_announcer_vox( #"hash_450f3dd9fe21becd", level.defcon_level );
            }
            
            level thread defcon_sign_lights();
        }
        else
        {
            level.defcon_level = 5;
            
            if ( level.zombie_vars[ #"zombie_powerup_bonfire_sale_on" ] == 0 || !level flag::get( "bonfire_reset" ) )
            {
                if ( level flag::get( #"hash_38f45c699c5d5d63" ) )
                {
                    level thread namespace_8f53e87b::function_777b7961( user );
                }
                else
                {
                    level thread namespace_8f53e87b::play_pentagon_announcer_vox( #"hash_450f3dd9fe21becd", level.defcon_level );
                }
            }
            
            level thread defcon_sign_lights();
            level flag::set( "defcon_active" );
            zm_office_teleporters::function_c71dfad1( 1 );
            
            if ( level.zombie_vars[ #"zombie_powerup_bonfire_sale_on" ] == 0 || !level flag::get( "bonfire_reset" ) )
            {
                level thread play_defcon5_alarms();
            }
        }
        
        level waittill( #"pack_room_reset" );
        
        if ( !level flag::get( "bonfire_reset" ) )
        {
            level thread namespace_8f53e87b::play_pentagon_announcer_vox( #"hash_55967e6191de36d2" );
        }
        
        if ( isdefined( self.lights ) )
        {
            for ( j = 0; j < self.lights.size ; j++ )
            {
                if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "defcon_bulb" )
                {
                    self.lights[ j ] setmodel( "p8_zm_off_trap_switch_light_green_on" );
                    self.var_dd7da790[ j ] delete();
                    self.var_dd7da790[ j ] = util::spawn_model( "tag_origin", self.lights[ j ].origin );
                    self.var_dd7da790[ j ].angles = self.lights[ j ].angles;
                    self.var_dd7da790[ j ].var_fe0165db = playfxontag( level.var_5531a118, self.var_dd7da790[ j ], "tag_origin" );
                }
                
                if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "defcon_handle" )
                {
                    self.lights[ j ] rotatepitch( 180, 0.5 );
                    self.lights[ j ] playsound( "zmb_defcon_switch" );
                }
            }
        }
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0x5c8316c9, Offset: 0xee8
// Size: 0xa0
function function_cec9d001()
{
    var_4006a329 = getentarray( "punch_switch", "targetname" );
    
    foreach ( t_switch in var_4006a329 )
    {
        t_switch hide();
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xb5b86f9e, Offset: 0xf90
// Size: 0x198
function defcon_sign_lights()
{
    defcon_signs = getentarray( "defcon_sign", "targetname" );
    defcon[ 1 ] = "p8_zm_off_sign_defcon_01";
    defcon[ 2 ] = "p8_zm_off_sign_defcon_02";
    defcon[ 3 ] = "p8_zm_off_sign_defcon_03";
    defcon[ 4 ] = "p8_zm_off_sign_defcon_04";
    defcon[ 5 ] = "p8_zm_off_sign_defcon_05";
    
    if ( isdefined( defcon_signs ) )
    {
        foreach ( sign in defcon_signs )
        {
            if ( !isdefined( sign ) )
            {
                continue;
            }
            
            if ( isdefined( level.defcon_level ) && level.defcon_level > 0 && level.defcon_level <= defcon.size )
            {
                sign setmodel( defcon[ level.defcon_level ] );
                continue;
            }
            
            sign setmodel( defcon[ 1 ] );
        }
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xfd23661f, Offset: 0x1130
// Size: 0x1ec
function play_defcon5_alarms()
{
    a_s_alarms = struct::get_array( "defcon_alarms" );
    var_674c8f1b = [];
    
    foreach ( s_alarm in a_s_alarms )
    {
        e_sfx = spawn( "script_origin", s_alarm.origin );
        e_sfx playloopsound( s_alarm.script_sound, 0.25 );
        
        if ( !isdefined( var_674c8f1b ) )
        {
            var_674c8f1b = [];
        }
        else if ( !isarray( var_674c8f1b ) )
        {
            var_674c8f1b = array( var_674c8f1b );
        }
        
        var_674c8f1b[ var_674c8f1b.size ] = e_sfx;
    }
    
    level waittill( #"defcon_reset" );
    
    foreach ( var_745f7c4 in var_674c8f1b )
    {
        var_745f7c4 stoploopsound( 0.5 );
    }
    
    wait 1;
    array::delete_all( var_674c8f1b );
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0x9c88104d, Offset: 0x1328
// Size: 0x210
function start_defcon_countdown()
{
    if ( level.defcon_activated )
    {
        return;
    }
    
    if ( level.zones[ #"war_room_zone_south" ].is_enabled )
    {
        if ( !level flag::get( "war_room_entry" ) )
        {
            level flag::set( "war_room_entry" );
        }
        else
        {
            level.zones[ #"conference_level2" ].is_enabled = 1;
        }
    }
    else if ( !level flag::get( "war_room_special" ) )
    {
        level flag::set( "war_room_special" );
    }
    
    level thread special_pack_time_spawning();
    level flag::set( "open_pack_hideaway" );
    level.defcon_activated = 1;
    level notify( #"defcon_activated" );
    level.defcon_countdown_time = 30;
    
    while ( level.defcon_level > 1 )
    {
        wait level.defcon_countdown_time / 4;
        level.defcon_level--;
        level thread defcon_sign_lights();
    }
    
    level.defcon_level = 1;
    level flag::clear( "defcon_active" );
    level.defcon_activated = 0;
    zm_office_teleporters::function_c71dfad1( 0 );
    level flag::clear( "bonfire_reset" );
    level notify( #"defcon_reset" );
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0x5bf0b1bc, Offset: 0x1540
// Size: 0xfe
function special_pack_time_spawning()
{
    foreach ( point in level.var_f0ff37fe )
    {
        point.is_enabled = 0;
    }
    
    while ( level.defcon_level >= 3 )
    {
        wait 0.1;
    }
    
    foreach ( point in level.var_f0ff37fe )
    {
        point.is_enabled = 1;
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0x76ab0b04, Offset: 0x1648
// Size: 0x194
function defcon_pack_poi()
{
    zone_name = "conference_level2";
    players = getplayers();
    poi1 = getent( "pack_room_poi1", "targetname" );
    poi2 = getent( "pack_room_poi2", "targetname" );
    wait 0.5;
    num_players = zm_zonemgr::get_players_in_zone( zone_name );
    
    if ( num_players == players.size )
    {
        if ( level.zones[ #"war_room_zone_south" ].is_enabled )
        {
            poi1 zm_utility::activate_zombie_point_of_interest();
        }
        else
        {
            poi2 zm_utility::activate_zombie_point_of_interest();
        }
    }
    else
    {
        return;
    }
    
    while ( num_players >= players.size && level flag::get( "defcon_active" ) )
    {
        num_players = zm_zonemgr::get_players_in_zone( zone_name );
        wait 0.1;
    }
    
    poi1 zm_utility::deactivate_zombie_point_of_interest();
    poi2 zm_utility::deactivate_zombie_point_of_interest();
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 1
// Checksum 0x64ff6277, Offset: 0x17e8
// Size: 0xd0, Type: bool
function pentagon_ignore_spawner( spawner )
{
    if ( level flag::get( "no_pack_room_spawning" ) )
    {
        if ( spawner.targetname == "conference_level2_spawns" )
        {
            return true;
        }
    }
    
    if ( level flag::get( "no_warroom_elevator_spawning" ) )
    {
        if ( spawner.targetname == "war_room_zone_elevator_spawns" )
        {
            return true;
        }
    }
    
    if ( level flag::get( "no_labs_elevator_spawning" ) )
    {
        if ( spawner.targetname == "labs_elevator_spawns" )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xd569fdaf, Offset: 0x18c0
// Size: 0x450
function pack_door_init()
{
    trigger = getent( "pack_room_door", "targetname" );
    
    if ( util::get_game_type() === #"zstandard" )
    {
        trigger hide();
    }
    
    doors = getentarray( trigger.target, "targetname" );
    pack_door_slam = getent( "slam_pack_door", "targetname" );
    var_ae0ee842 = 0;
    
    foreach ( door in doors )
    {
        door disconnectpaths();
    }
    
    while ( true )
    {
        trigger setcursorhint( "HINT_NOICON" );
        trigger sethintstring( #"hash_11b82b0d638f6098" );
        level waittill( #"defcon_activated", #"player_in_pack" );
        players = getplayers();
        trigger sethintstring( "" );
        
        for ( i = 0; i < doors.size ; i++ )
        {
            doors[ i ].start_angles = doors[ i ].angles;
            
            if ( isdefined( doors[ i ].script_angles ) )
            {
                doors[ i ] notsolid();
                doors[ i ] rotateto( doors[ i ].script_angles, 1 );
                playsoundatposition( "zmb_office_wood_door", doors[ i ].origin );
                doors[ i ] thread pack_door_solid_thread();
            }
        }
        
        var_ae0ee842 = 1;
        level flag::wait_till_clear( "defcon_active" );
        wait 0.1;
        
        while ( !is_packroom_clear() )
        {
            wait 0.1;
        }
        
        if ( var_ae0ee842 == 1 )
        {
            for ( i = 0; i < doors.size ; i++ )
            {
                if ( isdefined( doors[ i ].script_angles ) )
                {
                    doors[ i ] notsolid();
                    doors[ i ] rotateto( doors[ i ].start_angles, 0.25 );
                    playsoundatposition( "zmb_office_wood_door_close", doors[ i ].origin );
                    doors[ i ] thread pack_door_solid_thread();
                }
            }
        }
        
        level notify( #"pack_room_reset" );
        level.zones[ #"conference_level2" ].is_enabled = 0;
        util::wait_network_frame();
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0x5e284550, Offset: 0x1d18
// Size: 0x2b8
function pack_hideaway_init()
{
    hideaway = getent( "pack_hideaway", "targetname" );
    parts = getentarray( "pack_hideaway_part", "targetname" );
    pack_machine = getent( "vending_packapunch", "targetname" );
    
    if ( isdefined( parts ) )
    {
        for ( i = 0; i < parts.size ; i++ )
        {
            parts[ i ] linkto( hideaway );
        }
    }
    
    while ( true )
    {
        level flag::wait_till( "open_pack_hideaway" );
        hideaway notsolid();
        hideaway movez( 116, 2.5 );
        hideaway playsound( "evt_packapunch_revolve_start" );
        hideaway playloopsound( "evt_packapunch_revolve_loop" );
        hideaway waittill( #"movedone" );
        hideaway stoploopsound( 1 );
        hideaway playsound( "evt_packapunch_revolve_end" );
        wait 40;
        hideaway movez( 116 * -1, 2.5 );
        hideaway playsound( "evt_packapunch_revolve_start" );
        hideaway playloopsound( "evt_packapunch_revolve_loop" );
        level flag::clear( "open_pack_hideaway" );
        util::wait_network_frame();
        hideaway waittill( #"movedone" );
        hideaway stoploopsound( 1 );
        hideaway playsound( "evt_packapunch_revolve_end" );
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xe674e6aa, Offset: 0x1fd8
// Size: 0xbe, Type: bool
function is_packroom_clear()
{
    a_e_players = getplayers();
    
    foreach ( e_player in a_e_players )
    {
        if ( e_player istouching( level.pack_door_slam ) )
        {
            return false;
        }
    }
    
    if ( zm_office_teleporters::function_2143dc13() )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0x2321f023, Offset: 0x20a0
// Size: 0x110
function pack_door_solid_thread()
{
    self waittill( #"rotatedone" );
    self.door_moving = undefined;
    
    while ( true )
    {
        players = getplayers();
        player_touching = 0;
        
        for ( i = 0; i < players.size ; i++ )
        {
            if ( players[ i ] istouching( self ) )
            {
                player_touching = 1;
                break;
            }
        }
        
        if ( !player_touching )
        {
            self solid();
            
            if ( self.angles != self.start_angles )
            {
                self connectpaths();
                return;
            }
            
            self disconnectpaths();
            return;
        }
        
        wait 1;
    }
}

// Namespace zm_office_defcon/zm_office_defcon
// Params 0
// Checksum 0xc606da28, Offset: 0x21b8
// Size: 0x22
function function_cacd3270()
{
    return self istouching( level.pack_room_trigger );
}

/#

    // Namespace zm_office_defcon/zm_office_defcon
    // Params 0
    // Checksum 0x7a32274b, Offset: 0x21e8
    // Size: 0x3c6, Type: dev
    function function_d2f6cecb()
    {
        if ( !level flag::get( "<dev string:x38>" ) )
        {
            level flag::set( "<dev string:x38>" );
            wait 1;
        }
        
        level.defcon_level = 5;
        
        if ( level.zombie_vars[ #"zombie_powerup_bonfire_sale_on" ] == 0 || !level flag::get( "<dev string:x43>" ) )
        {
            level thread namespace_8f53e87b::play_pentagon_announcer_vox( #"hash_450f3dd9fe21becd", level.defcon_level );
        }
        
        level thread defcon_sign_lights();
        level flag::set( "<dev string:x53>" );
        zm_office_teleporters::function_c71dfad1( 1 );
        
        if ( level.zombie_vars[ #"zombie_powerup_bonfire_sale_on" ] == 0 || !level flag::get( "<dev string:x43>" ) )
        {
            level thread play_defcon5_alarms();
        }
        
        level waittill( #"pack_room_reset" );
        
        if ( !level flag::get( "<dev string:x43>" ) )
        {
            level thread namespace_8f53e87b::play_pentagon_announcer_vox( #"hash_55967e6191de36d2" );
        }
        
        if ( isdefined( self.lights ) )
        {
            for ( j = 0; j < self.lights.size ; j++ )
            {
                if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "<dev string:x63>" )
                {
                    self.lights[ j ] setmodel( "<dev string:x71>" );
                    self.var_dd7da790[ j ] delete();
                    self.var_dd7da790[ j ] = util::spawn_model( "<dev string:x98>", self.lights[ j ].origin );
                    self.var_dd7da790[ j ].angles = self.lights[ j ].angles;
                    self.var_dd7da790[ j ].var_fe0165db = playfxontag( level.var_5531a118, self.var_dd7da790[ j ], "<dev string:x98>" );
                }
                
                if ( isdefined( self.lights[ j ].script_noteworthy ) && self.lights[ j ].script_noteworthy == "<dev string:xa5>" )
                {
                    self.lights[ j ] rotatepitch( 180, 0.5 );
                    self.lights[ j ] playsound( "<dev string:xb5>" );
                }
            }
        }
    }

#/
