#using script_4bae07eadc57bb51;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_hms_util;
#using scripts\zm\zm_office_defcon;
#using scripts\zm\zm_office_floors;
#using scripts\zm_common\zm_fasttravel;
#using scripts\zm_common\zm_pack_a_punch;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_office_teleporters;

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0, eflags: 0x2
// Checksum 0xf186cb2, Offset: 0x6a8
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_office_teleporters", &__init__, &__main__, undefined );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x4734d597, Offset: 0x6f8
// Size: 0x34
function __init__()
{
    init_clientfields();
    callback::on_spawned( &on_player_spawn );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x47fee50a, Offset: 0x738
// Size: 0xde
function __main__()
{
    level thread teleporter_power_cable();
    level thread function_e1bfdf45();
    level thread open_portal_rooms();
    level thread function_93530fe9();
    level.var_f0ff37fe = struct::get_array( "conference_level2_spawns", "targetname" );
    level.pack_room_trigger = getent( "pack_room_trigger", "targetname" );
    level.pack_door_slam = getent( "slam_pack_door", "targetname" );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xfcef854a, Offset: 0x820
// Size: 0x334
function init_clientfields()
{
    clientfield::register( "scriptmover", "portal_dest_fx", 1, 3, "int" );
    clientfield::register( "toplayer", "portal_conference_level1", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_offices_level1", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_war_room", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_war_room_server_room", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_war_room_map", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_panic_room", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_labs_power_room", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_labs_hall1_east", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_labs_hall1_west", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_labs_hall2_east", 1, 1, "int" );
    clientfield::register( "toplayer", "portal_labs_hall2_west", 1, 1, "int" );
    clientfield::register( "world", "delete_war_room_portal_fx", 1, 1, "counter" );
    clientfield::register( "scriptmover", "cage_portal_fx", 1, 1, "int" );
    clientfield::register( "actor", "crawler_portal_spawn_fx", 1, 1, "counter" );
    clientfield::register( "toplayer", "teleporter_transition", 1, 1, "counter" );
    clientfield::register( "scriptmover", "war_room_map_control", 1, 1, "int" );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xd85c2383, Offset: 0xb60
// Size: 0x84
function function_93530fe9()
{
    var_89b4f417 = getent( "warroom_map_opaque", "script_noteworthy" );
    var_89b4f417 show();
    var_5485b418 = getent( "warroom_map_transp", "script_noteworthy" );
    var_5485b418 hide();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x4325b80c, Offset: 0xbf0
// Size: 0xac
function function_884a609e()
{
    var_89b4f417 = getent( "warroom_map_opaque", "script_noteworthy" );
    var_89b4f417 hide();
    var_5485b418 = getent( "warroom_map_transp", "script_noteworthy" );
    var_5485b418 show();
    waitframe( 1 );
    var_5485b418 clientfield::set( "war_room_map_control", 1 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x71e3b200, Offset: 0xca8
// Size: 0x146
function teleporter_init()
{
    level.teleport_ae_funcs = [];
    level flag::init( #"portals_active" );
    level thread setup_portals();
    poi1 = getent( "pack_room_poi1", "targetname" );
    poi2 = getent( "pack_room_poi2", "targetname" );
    poi1 zm_utility::create_zombie_point_of_interest( undefined, 30, 0, 0 );
    poi1 zm_utility::create_zombie_point_of_interest_attractor_positions( undefined, undefined, 128 );
    poi2 zm_utility::create_zombie_point_of_interest( undefined, 30, 0, 0 );
    poi2 zm_utility::create_zombie_point_of_interest_attractor_positions( undefined, undefined, 128 );
    level.s_zombie_teleport_room = struct::get( "zombie_teleport_room", "targetname" );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x7988e64a, Offset: 0xdf8
// Size: 0x38e
function function_e1bfdf45()
{
    level.portal_pack = undefined;
    level.portal_power = undefined;
    level.portal_top = [];
    level.portal_mid = [];
    level.portal_bottom = [];
    pos = struct::get_array( "zombie_pos", "script_noteworthy" );
    
    for ( i = 0; i < pos.size ; i++ )
    {
        if ( pos[ i ].script_string == "bottom_floor_5" )
        {
            level.portal_power = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "top_floor_1" )
        {
            level.portal_top[ 0 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "top_floor_2" )
        {
            level.portal_top[ 1 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "mid_floor_1" )
        {
            level.portal_mid[ 0 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "server_room" )
        {
            level.portal_mid[ 1 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "mid_floor_2" )
        {
            level.portal_pack = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "bottom_floor_1" )
        {
            level.portal_bottom[ 0 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "bottom_floor_2" )
        {
            level.portal_bottom[ 1 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "bottom_floor_3" )
        {
            level.portal_bottom[ 2 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "bottom_floor_4" )
        {
            level.portal_bottom[ 3 ] = pos[ i ];
            continue;
        }
        
        if ( pos[ i ].script_string == "bottom_floor_4" )
        {
            level.portal_bottom[ 3 ] = pos[ i ];
        }
    }
    
    level.var_8d796689 = array( level.portal_bottom[ 0 ], level.portal_bottom[ 1 ], level.portal_bottom[ 2 ], level.portal_bottom[ 3 ], level.portal_power );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xd1cd2475, Offset: 0x1190
// Size: 0xa8
function function_2113985()
{
    level.portal_trig = getentarray( "portal_trigs", "targetname" );
    
    foreach ( e_portal in level.portal_trig )
    {
        e_portal teleport_pad_init();
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x3460d1bd, Offset: 0x1240
// Size: 0x64
function teleport_pad_init()
{
    self.active = 1;
    self.portal_used = [];
    s_zombie_pos = self function_d9e2dc1f();
    self.fx_pos = s_zombie_pos.origin;
    self thread player_teleporting();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0xaa13a66c, Offset: 0x12b0
// Size: 0x74
function function_9b917fd5( is_powered )
{
    if ( self.script_string === "pap_hideaway" )
    {
        level.pap_machine = self;
    }
    
    self zm_pack_a_punch::set_state_hidden();
    level waittill( #"hash_537cc10c9deca9da" );
    self zm_pack_a_punch::function_bb629351( 1 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x4e2f300e, Offset: 0x1330
// Size: 0x110
function player_teleporting()
{
    self endon( #"death" );
    user = undefined;
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        user = waitresult.activator;
        player_used = 0;
        
        if ( isdefined( self.portal_used ) )
        {
            for ( i = 0; i < self.portal_used.size ; i++ )
            {
                if ( self.portal_used[ i ] == user )
                {
                    player_used = 1;
                }
            }
        }
        
        if ( player_used == 1 )
        {
            continue;
        }
        
        if ( zm_utility::is_player_valid( user, 0, 1 ) )
        {
            self thread teleport_player( user );
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0xb447bc0c, Offset: 0x1448
// Size: 0x63c
function teleport_player( user )
{
    if ( !isdefined( user ) )
    {
        return;
    }
    
    user endoncallback( &function_96e88318, #"death" );
    destination = undefined;
    
    if ( isdefined( user.teleporting ) && user.teleporting )
    {
        return;
    }
    
    w_curr = user getcurrentweapon();
    
    if ( isdefined( w_curr.isburstfire ) && w_curr.isburstfire && user isfiring() && !user ismeleeing() )
    {
        return;
    }
    
    user notify( #"teleporting" );
    self notify( #"portal_used" );
    level notify( #"portal_used", { #s_portal:self, #player:user } );
    user.teleporting = 1;
    user clientfield::increment_to_player( "teleporter_transition", 1 );
    
    switch ( self.n_dest )
    {
        case 0:
            var_298e4578 = self find_portal_destination();
            break;
        case 1:
            var_298e4578 = level.a_s_portals[ #"portal_panic_room" ];
            break;
        case 2:
            var_298e4578 = level.var_3f3c65c7;
            level notify( #"hash_15a9f7117b9637b" );
            break;
        case 3:
            var_298e4578 = level.a_s_portals[ #"portal_war_room_map" ];
            break;
        case 4:
            var_298e4578 = self find_portal_destination( 1 );
            break;
        case 5:
            var_298e4578 = self find_portal_destination( 2 );
            break;
        case 6:
            var_298e4578 = self find_portal_destination( 3 );
            break;
    }
    
    destination = var_298e4578.var_52a6f692;
    playfx( level._effect[ #"teleport_depart" ], user.origin );
    playfx( level._effect[ #"portal_origin" ], self.origin, ( 1, 0, 0 ), ( 0, 0, 1 ) );
    playsoundatposition( #"evt_teleporter_out", self.origin );
    level thread function_fe50866d( user, self, var_298e4578 );
    user.var_298e4578 = var_298e4578;
    self function_134670b9( 1 );
    user zm_fasttravel::function_66d020b0( undefined, undefined, undefined, undefined, destination, undefined, string( self.n_dest ), 0 );
    
    if ( var_298e4578.script_noteworthy == "portal_panic_room" )
    {
        level thread zm_office_defcon::start_defcon_countdown();
    }
    
    user clientfield::increment_to_player( "teleporter_transition", 1 );
    var_298e4578 thread cooldown_portal_timer( user );
    user thread function_c234a5ce();
    playfx( level._effect[ #"teleport_arrive" ], user.origin );
    playfx( level._effect[ #"portal_dest" ], var_298e4578.origin, ( 1, 0, 0 ), ( 0, 0, 1 ) );
    playsoundatposition( #"evt_teleporter_go", var_298e4578.origin );
    user playsoundtoplayer( #"hash_39876bf613387fef", user );
    wait 0.5;
    user function_96e88318();
    util::setclientsysstate( "levelNotify", "cool_fx", user );
    util::setclientsysstate( "levelNotify", "ae1", user );
    wait 1.25;
    
    if ( level flag::get( "dog_round" ) )
    {
        util::setclientsysstate( "levelNotify", "vis4", user );
        return;
    }
    
    user.floor = zm_office_floors::function_35babccd( user );
    util::setclientsysstate( "levelNotify", "vis" + user.floor, user );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x334c67e3, Offset: 0x1a90
// Size: 0x22
function function_96e88318( str_notify )
{
    self.var_298e4578 = undefined;
    self.teleporting = 0;
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xca84393f, Offset: 0x1ac0
// Size: 0x6c
function function_c234a5ce()
{
    self endoncallback( &function_4f5d4783, #"death" );
    self val::set( #"teleport_exit", "ignoreme", 1 );
    wait 1;
    self function_4f5d4783();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x606b46c0, Offset: 0x1b38
// Size: 0x34
function function_4f5d4783( str_notify )
{
    self val::reset( #"teleport_exit", "ignoreme" );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0xb304f820, Offset: 0x1b78
// Size: 0x16c
function cooldown_portal_timer( e_user )
{
    if ( self.script_noteworthy == "portal_cage_enter" )
    {
        return;
    }
    
    self endon( #"death", #"hash_3c91bf90cecbe758" );
    
    if ( !isdefined( self.a_e_users ) )
    {
        self.a_e_users = [];
    }
    else if ( !isarray( self.a_e_users ) )
    {
        self.a_e_users = array( self.a_e_users );
    }
    
    self.a_e_users[ self.a_e_users.size ] = e_user;
    self function_cb7c6fc7( e_user, 0 );
    
    for ( time = 0; !level flag::get( "defcon_active" ) && time < 20 || time < 2 ; time++ )
    {
        wait 1;
    }
    
    arrayremovevalue( self.a_e_users, e_user );
    self function_cb7c6fc7( e_user, 1 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 2
// Checksum 0xaf235670, Offset: 0x1cf0
// Size: 0x74
function function_cb7c6fc7( e_user, b_show = 1 )
{
    if ( !isdefined( e_user ) )
    {
        return;
    }
    
    if ( b_show )
    {
        e_user clientfield::set_to_player( self.script_noteworthy, 1 );
        return;
    }
    
    e_user clientfield::set_to_player( self.script_noteworthy, 0 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 3
// Checksum 0xe2797c05, Offset: 0x1d70
// Size: 0x128
function function_fe50866d( target, portal_enter, portal_exit )
{
    if ( portal_exit.script_noteworthy == "portal_panic_room" || portal_exit.script_noteworthy == "portal_cage_enter" )
    {
        return;
    }
    
    if ( isdefined( level.s_cage_portal ) && portal_enter == level.s_cage_portal )
    {
        return;
    }
    
    zombies = getaiarray();
    
    foreach ( zombie in zombies )
    {
        if ( zombie.favoriteenemy === target )
        {
            zombie thread function_9d689cc4( portal_enter, portal_exit );
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x2b34c247, Offset: 0x1ea0
// Size: 0xaa
function function_d9e2dc1f()
{
    portals = struct::get_array( self.target, "targetname" );
    
    foreach ( portal in portals )
    {
        if ( portal.script_noteworthy === "zombie_pos" )
        {
            return portal;
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x811a4e62, Offset: 0x1f58
// Size: 0xaa
function function_254e91a2()
{
    portals = struct::get_array( self.target, "targetname" );
    
    foreach ( portal in portals )
    {
        if ( portal.script_noteworthy === "player_pos" )
        {
            return portal;
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x43d1f4c3, Offset: 0x2010
// Size: 0x16c
function find_portal_destination( var_210b4680 )
{
    var_98ceafca = [];
    
    foreach ( s_portal in level.a_s_portals )
    {
        if ( self == s_portal )
        {
            continue;
        }
        
        if ( !level.zones[ s_portal.zone_name ].is_enabled )
        {
            continue;
        }
        
        if ( isdefined( var_210b4680 ) && s_portal.n_floor != var_210b4680 )
        {
            continue;
        }
        
        if ( s_portal.script_noteworthy == "portal_panic_room" )
        {
            continue;
        }
        
        if ( !isdefined( var_98ceafca ) )
        {
            var_98ceafca = [];
        }
        else if ( !isarray( var_98ceafca ) )
        {
            var_98ceafca = array( var_98ceafca );
        }
        
        var_98ceafca[ var_98ceafca.size ] = s_portal;
    }
    
    if ( var_98ceafca.size > 0 )
    {
        return array::random( var_98ceafca );
    }
    
    return self;
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x5d87cd3a, Offset: 0x2188
// Size: 0x334
function open_portal_rooms()
{
    yellow_conf_screen = getent( "yellow_conf_screen", "targetname" );
    power_room_screen = getent( "power_room_screen", "targetname" );
    war_room_screen_ramp = getent( "war_room_screen_ramp", "targetname" );
    war_room_screen_north = getent( "war_room_screen_north", "targetname" );
    war_room_screen_south = getent( "war_room_screen_south", "targetname" );
    server_room_portal_door = getent( "server_room_portal_door", "targetname" );
    yellow_conf_screen disconnectpaths();
    power_room_screen disconnectpaths();
    war_room_screen_north disconnectpaths();
    war_room_screen_south disconnectpaths();
    server_room_portal_door disconnectpaths();
    level waittill( #"hash_2124984d1ece329c" );
    power_room_screen playsound( "evt_teleporter_door_short" );
    power_room_screen movez( 116, 1.5 );
    power_room_screen thread function_4d547f18();
    war_room_screen_north playsound( "evt_teleporter_door_short" );
    war_room_screen_north movez( -122, 1.5 );
    war_room_screen_ramp movey( 46, 1.5 );
    war_room_screen_north thread function_4d547f18();
    war_room_screen_south playsound( "evt_teleporter_door_short" );
    war_room_screen_south movez( -120, 1.5 );
    war_room_screen_south thread function_4d547f18();
    level waittill( #"hash_21249b4d1ece37b5" );
    level thread function_3e7ccc56();
    server_room_portal_door playsound( "evt_teleporter_door_long" );
    server_room_portal_door movez( -150, 2 );
    server_room_portal_door thread function_4d547f18();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x99368cd4, Offset: 0x24c8
// Size: 0x15c
function function_3e7ccc56()
{
    yellow_conf_screen = getent( "yellow_conf_screen", "targetname" );
    yellow_conf_screen_parts = getentarray( "yellow_conf_screen_part", "script_noteworthy" );
    
    foreach ( part in yellow_conf_screen_parts )
    {
        part linkto( yellow_conf_screen );
    }
    
    yellow_conf_screen playsound( "evt_teleporter_door_short" );
    yellow_conf_screen movex( 8, 0.2 );
    yellow_conf_screen waittill( #"movedone" );
    yellow_conf_screen movez( 116, 1.5 );
    yellow_conf_screen thread function_4d547f18();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x6b7197b1, Offset: 0x2630
// Size: 0x84
function war_room_portal_door()
{
    war_room_screen_south = getent( "war_room_screen_south", "targetname" );
    war_room_screen_south playsound( "evt_teleporter_door_short" );
    war_room_screen_south movez( -120, 1.5 );
    war_room_screen_south thread function_4d547f18();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xd1a6c272, Offset: 0x26c0
// Size: 0x3c
function function_4d547f18()
{
    self endon( #"death" );
    self waittill( #"movedone" );
    self connectpaths();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x16ce6d72, Offset: 0x2708
// Size: 0x6e
function enable_zone_portals_init()
{
    portal_zone_trig = getentarray( "portal_zone_trigs", "targetname" );
    
    for ( i = 0; i < portal_zone_trig.size ; i++ )
    {
        portal_zone_trig[ i ] thread enable_zone_portals();
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x709b64f2, Offset: 0x2780
// Size: 0x9c
function enable_zone_portals()
{
    waitresult = self waittill( #"trigger" );
    user = waitresult.activator;
    
    if ( ( laststand::player_is_in_laststand() || zm_utility::is_player_valid( user ) ) && isdefined( self.script_noteworthy ) )
    {
        level thread zm_zonemgr::enable_zone( self.script_noteworthy );
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x11bed8e2, Offset: 0x2828
// Size: 0x1b0
function teleporter_power_cable()
{
    cable_on = getentarray( "teleporter_link_cable_on", "targetname" );
    cable_off = getentarray( "teleporter_link_cable_off", "targetname" );
    
    foreach ( cable in cable_on )
    {
        cable hide();
    }
    
    level waittill( #"hash_2124984d1ece329c" );
    
    foreach ( cable in cable_off )
    {
        cable hide();
    }
    
    foreach ( cable in cable_on )
    {
        cable show();
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x8a06841d, Offset: 0x29e0
// Size: 0x1fa
function function_e9848fa7()
{
    var_84a6eef7 = undefined;
    var_9d761d98 = zm_office_floors::function_35babccd( self );
    test_portals = [];
    
    foreach ( s_portal in level.a_s_portals )
    {
        if ( s_portal.n_floor == var_9d761d98 )
        {
            if ( !isdefined( test_portals ) )
            {
                test_portals = [];
            }
            else if ( !isarray( test_portals ) )
            {
                test_portals = array( test_portals );
            }
            
            test_portals[ test_portals.size ] = s_portal;
        }
    }
    
    if ( test_portals.size > 0 )
    {
        if ( isdefined( self.var_b940d6ea ) )
        {
            test_pos = self.var_b940d6ea;
        }
        else
        {
            test_pos = self.origin;
        }
        
        var_2bb91264 = 1410065408;
        
        foreach ( portal in test_portals )
        {
            var_d9c76d4b = distancesquared( portal.origin, test_pos );
            
            if ( var_d9c76d4b < var_2bb91264 )
            {
                var_2bb91264 = var_d9c76d4b;
                var_84a6eef7 = portal;
            }
        }
    }
    
    return var_84a6eef7;
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 2
// Checksum 0x764a99a4, Offset: 0x2be8
// Size: 0x1cc
function function_9d689cc4( portal, portal_exit )
{
    self endoncallback( &function_2ef25d40, #"damage", #"death", #"cancel_teleport" );
    
    if ( !isdefined( portal ) )
    {
        portal = self function_e9848fa7();
        
        if ( !isdefined( portal ) )
        {
            self.favoriteenemy = undefined;
            return;
        }
    }
    
    self.var_3f667178 = portal;
    self.var_693b80bb = self.b_ignore_cleanup;
    self.b_ignore_cleanup = 1;
    self thread function_554c780b();
    
    while ( distancesquared( self.origin, portal.origin ) > self.goalradius * self.goalradius )
    {
        wait 0.1;
    }
    
    self notify( #"reached_portal" );
    self.var_3f667178 = undefined;
    
    if ( !isdefined( portal_exit ) )
    {
        if ( !isdefined( self.favoriteenemy ) )
        {
            self.favoriteenemy = zm_hms_util::function_3815943c();
        }
        
        if ( !isdefined( self.favoriteenemy ) )
        {
            self function_2ef25d40();
            return;
        }
        
        portal_exit = self.favoriteenemy function_e9848fa7();
        
        if ( !isdefined( portal_exit ) )
        {
            self.favoriteenemy = undefined;
            self function_2ef25d40();
            return;
        }
    }
    
    level thread function_71be28e1( self, portal, portal_exit );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x6b8737ee, Offset: 0x2dc0
// Size: 0x36
function function_2ef25d40( str_notify )
{
    self notify( #"reached_portal" );
    self.b_ignore_cleanup = self.var_693b80bb;
    self.var_3f667178 = undefined;
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 3
// Checksum 0x78412c3e, Offset: 0x2e00
// Size: 0x2bc
function function_71be28e1( zombie, start_portal, end_portal )
{
    zombie endon( #"death" );
    zombie disableaimassist();
    playfx( level._effect[ #"teleport_depart" ], zombie.origin );
    playfx( level._effect[ #"portal_origin" ], start_portal.origin, ( 1, 0, 0 ), ( 0, 0, 1 ) );
    playsoundatposition( #"evt_teleporter_out", zombie.origin );
    zombie function_1f034d46( end_portal.origin );
    zombie.b_ignore_cleanup = 1;
    zombie forceteleport( level.s_zombie_teleport_room.origin );
    zombie setentitypaused( 1 );
    wait 3;
    end_target = end_portal.var_52a6f692[ 0 ];
    zombie setentitypaused( 0 );
    zombie forceteleport( end_portal.origin + anglestoforward( end_portal.angles ) * randomfloatrange( 0, 32 ), end_target.angles );
    zombie function_1f034d46();
    playfx( level._effect[ #"teleport_arrive" ], zombie.origin );
    playfx( level._effect[ #"portal_dest" ], end_portal.origin, ( 1, 0, 0 ), ( 0, 0, 1 ) );
    playsoundatposition( #"evt_teleporter_go", zombie.origin );
    zombie.b_ignore_cleanup = zombie.var_693b80bb;
    zombie enableaimassist();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xa5a3b87e, Offset: 0x30c8
// Size: 0x3e
function function_554c780b()
{
    self endon( #"death", #"reached_portal" );
    wait 2;
    self.b_ignore_cleanup = self.var_693b80bb;
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x289546a9, Offset: 0x3110
// Size: 0x66
function function_1f034d46( destination )
{
    self.var_b940d6ea = destination;
    
    if ( isdefined( self.var_b940d6ea ) )
    {
        self.var_f4bf0819 = zm_office_floors::function_cd2f24b2( zm_zonemgr::get_zone_from_position( self.var_b940d6ea, 1 ) );
        return;
    }
    
    self.var_f4bf0819 = undefined;
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xba2e4389, Offset: 0x3180
// Size: 0x30c
function function_bb3f9afd()
{
    s_portal = level.a_s_portals[ #"portal_war_room" ];
    playfx( level._effect[ #"portal_despawn" ], s_portal.origin, ( 1, 0, 0 ), ( 0, 0, 1 ) );
    s_portal.var_a1cf77d2 clientfield::set( "portal_dest_fx", 0 );
    level clientfield::increment( "delete_war_room_portal_fx", 1 );
    zm_unitrigger::unregister_unitrigger( s_portal.s_unitrigger );
    arrayremoveindex( level.a_s_portals, "portal_war_room", 1 );
    s_portal notify( #"hash_6db43858f08123dd" );
    s_portal notify( #"hash_3c91bf90cecbe758" );
    s_portal = level.var_905aea40;
    
    if ( util::get_game_type() == #"zstandard" )
    {
        s_portal.n_floor = -1;
    }
    
    level.a_s_portals[ s_portal.script_noteworthy ] = s_portal;
    s_portal zm_unitrigger::create( "", 32, &portal_think, 0, 0 );
    playfx( level._effect[ #"portal_spawn" ], s_portal.origin, ( 1, 0, 0 ), ( 0, 0, 1 ) );
    
    if ( level flag::get( "defcon_active" ) || util::get_game_type() == #"zstandard" )
    {
        s_portal function_79e8b4c6( 2 );
    }
    else
    {
        s_portal function_98cd139();
    }
    
    foreach ( e_player in level.activeplayers )
    {
        s_portal function_cb7c6fc7( e_player, 1 );
    }
    
    cage_portal_init();
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x7577f04, Offset: 0x3498
// Size: 0x15a
function setup_portals()
{
    a_s_portals = struct::get_array( "office_portal" );
    
    foreach ( s_portal in a_s_portals )
    {
        if ( s_portal.script_noteworthy == "portal_war_room_map" )
        {
            level.var_905aea40 = s_portal;
        }
        
        s_portal portal_init();
    }
    
    level.var_3f3c65c7 = struct::get( "cage_enter_portal" );
    level.var_3f3c65c7.var_52a6f692 = zm_hms_util::function_2719d4c0( level.var_3f3c65c7.target, "targetname", "script_int" );
    level.var_3f3c65c7.var_a1cf77d2 = util::spawn_model( "tag_origin", self.origin, self.angles );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x51e00d86, Offset: 0x3600
// Size: 0x27a
function portal_init()
{
    if ( !isdefined( level.a_s_portals ) )
    {
        level.a_s_portals = [];
    }
    else if ( !isarray( level.a_s_portals ) )
    {
        level.a_s_portals = array( level.a_s_portals );
    }
    
    self.var_a1cf77d2 = util::spawn_model( "tag_origin", self.origin, self.angles );
    
    if ( !isdefined( self.a_e_users ) )
    {
        self.a_e_users = [];
    }
    else if ( !isarray( self.a_e_users ) )
    {
        self.a_e_users = array( self.a_e_users );
    }
    
    self.zone_name = zm_zonemgr::get_zone_from_position( self.origin, 1 );
    self.var_d5ea18bf = array( 4 );
    self thread function_bbc76ca9();
    self.var_d99a94d9 = 0;
    self.var_52a6f692 = zm_hms_util::function_2719d4c0( self.target, "targetname", "script_int" );
    self thread function_45a968e4();
    
    switch ( self.script_noteworthy )
    {
        case #"portal_conference_level1":
        case #"portal_offices_level1":
            self.n_floor = 1;
            break;
        case #"portal_war_room_server_room":
        case #"portal_panic_room":
        case #"portal_war_room":
        case #"portal_war_room_map":
            self.n_floor = 2;
            break;
        case #"portal_labs_power_room":
        case #"portal_labs_hall2_west":
        case #"portal_labs_hall1_east":
        case #"portal_labs_hall2_east":
        case #"portal_labs_hall1_west":
            self.n_floor = 3;
            break;
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xbdb4a6cf, Offset: 0x3888
// Size: 0x13e
function function_bbc76ca9()
{
    self endon( #"death" );
    level flag::wait_till( "war_room_stair" );
    
    if ( !isdefined( self.var_d5ea18bf ) )
    {
        self.var_d5ea18bf = [];
    }
    else if ( !isarray( self.var_d5ea18bf ) )
    {
        self.var_d5ea18bf = array( self.var_d5ea18bf );
    }
    
    self.var_d5ea18bf[ self.var_d5ea18bf.size ] = 5;
    
    if ( self.script_noteworthy != "portal_labs_power_room" )
    {
        level flag::wait_till( "labs_enabled" );
        
        if ( !isdefined( self.var_d5ea18bf ) )
        {
            self.var_d5ea18bf = [];
        }
        else if ( !isarray( self.var_d5ea18bf ) )
        {
            self.var_d5ea18bf = array( self.var_d5ea18bf );
        }
        
        self.var_d5ea18bf[ self.var_d5ea18bf.size ] = 6;
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x8b4398d9, Offset: 0x39d0
// Size: 0x110
function portal_think()
{
    self endon( #"death" );
    s_portal = self.stub.related_parent;
    
    while ( true )
    {
        waitresult = self waittill( #"trigger" );
        e_user = waitresult.activator;
        
        if ( array::contains( s_portal.a_e_users, e_user ) || isdefined( self.stub.related_parent.var_cd2f1fed ) && self.stub.related_parent.var_cd2f1fed )
        {
            continue;
        }
        
        if ( zm_utility::is_player_valid( e_user, 0, 1 ) )
        {
            s_portal thread teleport_player( e_user );
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x469763fc, Offset: 0x3ae8
// Size: 0x188
function portal_activate()
{
    level.a_s_portals[ self.script_noteworthy ] = self;
    
    if ( self.script_noteworthy == "portal_war_room" )
    {
        s_stub = self zm_unitrigger::function_a7620bfb( 32, 0 );
        zm_unitrigger::unitrigger_set_hint_string( s_stub, "" );
        s_stub.related_parent = self;
        self.s_unitrigger = s_stub;
        zm_unitrigger::register_dyn_unitrigger( s_stub, &portal_think, 0 );
    }
    else
    {
        self zm_unitrigger::create( "", 32, &portal_think, 0, 0 );
    }
    
    self function_98cd139();
    
    foreach ( e_player in level.activeplayers )
    {
        self function_cb7c6fc7( e_player, 1 );
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x7b784930, Offset: 0x3c78
// Size: 0xe4
function function_ea199c46()
{
    a_s_portals = struct::get_array( "office_portal" );
    level waittill( #"hash_2124984d1ece329c" );
    
    for ( i = 0; i < a_s_portals.size ; i++ )
    {
        if ( a_s_portals[ i ].script_noteworthy != "portal_war_room_map" )
        {
            a_s_portals[ i ] portal_activate();
        }
        
        if ( i == 5 )
        {
            level waittill( #"hash_21249b4d1ece37b5" );
        }
    }
    
    level flag::set( #"portals_active" );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0xe0829976, Offset: 0x3d68
// Size: 0x192
function function_79e8b4c6( var_9dff0a2b )
{
    self.n_dest = var_9dff0a2b;
    
    switch ( self.n_dest )
    {
        case 0:
            self.var_a1cf77d2 clientfield::set( "portal_dest_fx", 1 );
            break;
        case 1:
            self.var_a1cf77d2 clientfield::set( "portal_dest_fx", 4 );
            break;
        case 2:
            self.var_a1cf77d2 clientfield::set( "portal_dest_fx", 5 );
            break;
        case 4:
            self.var_a1cf77d2 clientfield::set( "portal_dest_fx", 1 );
            break;
        case 3:
        case 5:
            self.var_a1cf77d2 clientfield::set( "portal_dest_fx", 2 );
            break;
        case 6:
            self.var_a1cf77d2 clientfield::set( "portal_dest_fx", 3 );
            break;
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xd66610a0, Offset: 0x3f08
// Size: 0x2c
function function_98cd139()
{
    self function_79e8b4c6( self.var_d5ea18bf[ self.var_d99a94d9 ] );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x84a1e6fc, Offset: 0x3f40
// Size: 0x8c
function function_63283830()
{
    if ( isdefined( self.n_dest ) && ( self.n_dest == 4 || self.n_dest == 5 || self.n_dest == 6 ) )
    {
        self.var_d99a94d9++;
        
        if ( self.var_d99a94d9 == self.var_d5ea18bf.size )
        {
            self.var_d99a94d9 = 0;
        }
        
        self function_98cd139();
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xabffe895, Offset: 0x3fd8
// Size: 0xa8
function function_45a968e4()
{
    self endon( #"death", #"hash_6db43858f08123dd" );
    
    if ( zm_utility::is_standard() )
    {
        n_cycle_time = 3;
    }
    else
    {
        n_cycle_time = 5;
    }
    
    while ( true )
    {
        self.var_9f43786e = n_cycle_time;
        
        while ( self.var_9f43786e > 0 )
        {
            wait 1;
            self.var_9f43786e--;
        }
        
        self function_63283830();
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0xb57b1f7, Offset: 0x4088
// Size: 0x2e
function function_134670b9( n_delay )
{
    if ( isdefined( self.var_9f43786e ) )
    {
        self.var_9f43786e += n_delay;
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x2ed35c8e, Offset: 0x40c0
// Size: 0x110
function function_c71dfad1( b_enable = 1 )
{
    foreach ( s_portal in level.a_s_portals )
    {
        if ( s_portal.script_noteworthy == "portal_panic_room" )
        {
            continue;
        }
        
        if ( b_enable )
        {
            if ( s_portal.script_noteworthy == "portal_war_room_map" )
            {
                s_portal function_79e8b4c6( 2 );
            }
            else
            {
                s_portal function_79e8b4c6( 1 );
            }
            
            continue;
        }
        
        s_portal function_98cd139();
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xbcd93877, Offset: 0x41d8
// Size: 0x17c
function cage_portal_init()
{
    level.s_cage_portal = struct::get( "cage_portal" );
    level.s_cage_portal.var_a1cf77d2 = util::spawn_model( "tag_origin", level.s_cage_portal.origin, level.s_cage_portal.angles );
    level.s_cage_portal.n_dest = 3;
    level.var_a23b5c5 = getent( "cage_portal_blocker", "targetname" );
    level.var_a23b5c5.v_start_pos = level.var_a23b5c5.origin;
    getent( "bunker_gate", "targetname" ) linkto( level.var_a23b5c5 );
    getent( "bunker_gate_2", "targetname" ) linkto( level.var_a23b5c5 );
    getent( "bunker_gate_3", "targetname" ) linkto( level.var_a23b5c5 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0xb88ca6d0, Offset: 0x4360
// Size: 0x124
function enable_cage_portal( b_enable = 1 )
{
    if ( self.b_active === b_enable )
    {
        return;
    }
    
    self.b_active = b_enable;
    
    if ( self.b_active )
    {
        level.s_cage_portal zm_unitrigger::create( "", 32, &portal_think, 0, 0 );
        function_60abbae4( 1 );
        level.var_a23b5c5 playsound( #"hash_123af2d6dc30025a" );
        level.var_a23b5c5 movez( 150, 1 );
        return;
    }
    
    zm_unitrigger::unregister_unitrigger( level.s_cage_portal.s_unitrigger );
    function_60abbae4( 0 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0xc60ce49c, Offset: 0x4490
// Size: 0x4c
function function_1bf7bc9e()
{
    self endon( #"death" );
    wait 0.5;
    array::random( level.a_s_portals ) teleport_player( self );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x15da2714, Offset: 0x44e8
// Size: 0x188
function function_a6bb56f6()
{
    foreach ( s_portal in level.a_s_portals )
    {
        if ( s_portal.script_noteworthy != "portal_war_room_map" || util::get_game_type() != #"zstandard" )
        {
            s_portal.var_cd2f1fed = 1;
            s_portal notify( #"hash_3c91bf90cecbe758" );
            s_portal.a_e_users = [];
            
            foreach ( e_player in getplayers() )
            {
                s_portal function_cb7c6fc7( e_player, 0 );
            }
            
            continue;
        }
        
        s_portal function_cb7c6fc7( e_player, 1 );
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x8d8701f6, Offset: 0x4678
// Size: 0xfc
function function_cc9b97b0()
{
    foreach ( s_portal in level.a_s_portals )
    {
        s_portal.var_cd2f1fed = 0;
        
        foreach ( e_player in getplayers() )
        {
            s_portal function_cb7c6fc7( e_player, 1 );
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 1
// Checksum 0x89841cf8, Offset: 0x4780
// Size: 0x74
function function_60abbae4( b_enable )
{
    if ( b_enable )
    {
        level.s_cage_portal.var_a1cf77d2 clientfield::set( "cage_portal_fx", 1 );
        return;
    }
    
    level.s_cage_portal.var_a1cf77d2 clientfield::set( "cage_portal_fx", 0 );
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x9ff964a0, Offset: 0x4800
// Size: 0xa8
function on_player_spawn()
{
    if ( level flag::get( #"portals_active" ) )
    {
        foreach ( s_portal in level.a_s_portals )
        {
            s_portal function_cb7c6fc7( self, 1 );
        }
    }
}

// Namespace zm_office_teleporters/zm_office_teleporters
// Params 0
// Checksum 0x72ffa7ba, Offset: 0x48b0
// Size: 0xae, Type: bool
function function_2143dc13()
{
    a_e_players = getplayers();
    
    foreach ( e_player in a_e_players )
    {
        if ( e_player.var_298e4578 === level.a_s_portals[ #"portal_panic_room" ] )
        {
            return true;
        }
    }
    
    return false;
}

