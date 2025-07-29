#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\compass;
#using scripts\core_common\exploder_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\mp\mp_silo_fx;
#using scripts\mp\mp_silo_sound;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\load;

#namespace mp_silo;

// Namespace mp_silo/level_init
// Params 1, eflags: 0x40
// Checksum 0x9c19cc97, Offset: 0x308
// Size: 0x2e4
function event_handler[level_init] main( eventstruct )
{
    clientfield::register( "scriptmover", "helo_spawn_flavor_rope_pulse", 1, 1, "counter" );
    level.var_cfec596d = -4271;
    level.var_39b27fbe = -8002;
    level.var_8db9ea19 = 5500;
    level.var_c6129172 = -4271;
    level.var_ae8d87c7 = -8002;
    level.var_98c93497 = -4271;
    level.var_31be45ec = -8002;
    level.var_8ac94558 = 1200;
    level.uav_z_offset = 1200;
    level.var_5d4b4923 = 2000;
    level.var_f3e25805 = &prematch_init;
    mp_silo_fx::main();
    mp_silo_sound::main();
    
    /#
        init_devgui();
    #/
    
    load::main();
    compass::setupminimap( "" );
    level.cleandepositpoints = array( ( -6170, -6350, 208 ), ( -6860, -6720, 212 ), ( -5050, -8000, 101 ), ( -5670.5, -9229.5, 104 ), ( -6186.5, -10457.5, 85 ) );
    spawncollision( "collision_clip_256x256x256", "collider", ( -6016, -7016, 576 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_256x256x256", "collider", ( -6016, -7016, 472 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_256x256x256", "collider", ( -5903, -7086, 280 ), ( 0, 0, 0 ) );
    spawncollision( "collision_clip_64x64x256", "collider", ( -6045, -6933.25, 216 ), ( 0, 315, 0 ) );
    function_2cdcf5c3();
    level thread init_gameobjects();
    level spawnkilltrigger();
}

// Namespace mp_silo/mp_silo
// Params 0
// Checksum 0x74e50ffd, Offset: 0x5f8
// Size: 0x294
function spawnkilltrigger()
{
    trigger = spawn( "trigger_radius", ( -6384, -7644, 96 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -6384, -7688, 96 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -6216, -7644, 96 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -6216, -7688, 96 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -5080, -7324, 128 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -5080, -7284, 128 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -5080, -7244, 128 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -5080, -7204, 128 ), 0, 24, 256 );
    trigger thread watchkilltrigger();
    trigger = spawn( "trigger_radius", ( -6104, -7000, 128 ), 0, 96, 256 );
    trigger thread watchkilltrigger();
}

// Namespace mp_silo/mp_silo
// Params 0
// Checksum 0x9b24b4a, Offset: 0x898
// Size: 0xa8
function watchkilltrigger()
{
    level endon( #"game_ended" );
    trigger = self;
    
    while ( true )
    {
        waitresult = trigger waittill( #"trigger" );
        waitresult.activator dodamage( 1000, trigger.origin + ( 0, 0, 0 ), trigger, trigger, "none", "MOD_SUICIDE", 0 );
    }
}

// Namespace mp_silo/mp_silo
// Params 0
// Checksum 0x458d6f24, Offset: 0x948
// Size: 0x2e0
function init_gameobjects()
{
    level.e_bridge = getent( "silo_moving_catwalk", "targetname" );
    level.var_f5272e32 = 0;
    level.var_7804ffe3 = 0;
    
    for ( i = 0; i < 3 ; i++ )
    {
        nodename = "bridge_up_trav_" + i;
        node = getnode( nodename, "targetname" );
        linktraversal( node );
    }
    
    if ( !getgametypesetting( #"allowmapscripting" ) )
    {
        a_s_gameobjects = struct::get_array( "elevator_push_button", "targetname" );
        
        foreach ( s_gameobject in a_s_gameobjects )
        {
            s_gameobject gameobjects::destroy_object( 1, 0 );
        }
        
        return;
    }
    
    a_s_gameobjects = struct::get_array( "elevator_push_button", "targetname" );
    
    foreach ( s_gameobject in a_s_gameobjects )
    {
        s_gameobject.mdl_gameobject.b_auto_reenable = 0;
        s_gameobject.var_af0b3945 = a_s_gameobjects;
        level thread function_1f5fd2c5( s_gameobject );
    }
    
    var_d6948fd6 = getentarray( "elevator_rail_guide", "targetname" );
    
    foreach ( var_e1f63988 in var_d6948fd6 )
    {
        var_e1f63988 linkto( level.e_bridge );
    }
}

// Namespace mp_silo/mp_silo
// Params 1
// Checksum 0xbaeb4e4e, Offset: 0xc30
// Size: 0x96
function function_1f5fd2c5( s_gameobject )
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        waitresult = s_gameobject.mdl_gameobject waittill( #"gameobject_end_use_player" );
        e_player = waitresult.player;
        s_gameobject thread move_bridge( 1 );
        waitframe( 1 );
    }
}

// Namespace mp_silo/mp_silo
// Params 1
// Checksum 0x483bcfd1, Offset: 0xcd0
// Size: 0x512
function move_bridge( var_60d70418 )
{
    if ( level.var_f5272e32 )
    {
        return;
    }
    
    array::thread_all( self.var_af0b3945, &gameobjects::disable_object, 1 );
    exploder::exploder( "fxexp_catwalk_off" );
    exploder::stop_exploder( "fxexp_catwalk_on" );
    bridge_center = level.e_bridge.origin;
    bridge_center = ( bridge_center[ 0 ], bridge_center[ 1 ] - 272, bridge_center[ 2 ] );
    physicsexplosionsphere( bridge_center, 287, 0, 0.1 );
    
    if ( level.var_7804ffe3 )
    {
        for ( i = 0; i < 3 ; i++ )
        {
            nodename = "bridge_low_trav_" + i;
            node = getnode( nodename, "targetname" );
            unlinktraversal( node );
        }
        
        level.var_f5272e32 = 1;
        neworigin = level.e_bridge.origin + ( 0, 0, 128 );
        level.e_bridge moveto( neworigin, 2.5 );
        level.e_bridge playsound( "amb_silo_elev_start" );
        level.e_bridge playloopsound( "amb_silo_elev_loop" );
        level.e_bridge waittill( #"movedone" );
        level.e_bridge stoploopsound();
        level.e_bridge playsound( "amb_silo_elev_stop" );
        level.var_7804ffe3 = 0;
        
        for ( i = 0; i < 3 ; i++ )
        {
            nodename = "bridge_up_trav_" + i;
            node = getnode( nodename, "targetname" );
            linktraversal( node );
        }
    }
    else
    {
        for ( i = 0; i < 3 ; i++ )
        {
            nodename = "bridge_up_trav_" + i;
            node = getnode( nodename, "targetname" );
            unlinktraversal( node );
        }
        
        level.var_f5272e32 = 1;
        neworigin = level.e_bridge.origin + ( 0, 0, -128 );
        level.e_bridge moveto( neworigin, 2.5 );
        level.e_bridge playsound( "amb_silo_elev_start" );
        level.e_bridge playloopsound( "amb_silo_elev_loop" );
        level.e_bridge waittill( #"movedone" );
        level.e_bridge stoploopsound();
        level.e_bridge playsound( "amb_silo_elev_stop" );
        level.var_7804ffe3 = 1;
        
        for ( i = 0; i < 3 ; i++ )
        {
            nodename = "bridge_low_trav_" + i;
            node = getnode( nodename, "targetname" );
            linktraversal( node );
        }
    }
    
    wait 5;
    array::thread_all( self.var_af0b3945, &gameobjects::enable_object, 1 );
    exploder::exploder( "fxexp_catwalk_on" );
    exploder::stop_exploder( "fxexp_catwalk_off" );
    level.var_f5272e32 = 0;
}

// Namespace mp_silo/mp_silo
// Params 0
// Checksum 0x6466fa8d, Offset: 0x11f0
// Size: 0xa6
function function_2cdcf5c3()
{
    if ( util::isfirstround() )
    {
        level scene::init( #"p8_fxanim_mp_silo_helicopter_crash_bundle" );
        level.damaged_globe = getent( "radar_globe_damaged", "targetname" );
        level.damaged_globe hide();
        level.pristine_globe = getent( "radar_globe_pristine", "targetname" );
    }
}

// Namespace mp_silo/mp_silo
// Params 0
// Checksum 0x9ed78db9, Offset: 0x12a0
// Size: 0x31c
function prematch_init()
{
    array::delete_all( getentarray( "sun_block", "targetname" ) );
    level flag::wait_till( "first_player_spawned" );
    wait getdvarfloat( #"hash_205d729c5c415715", 0 );
    exploder::exploder( "fxexp_alarm_lights" );
    
    if ( !getgametypesetting( #"allowmapscripting" ) )
    {
        exploder::exploder( "fxexp_catwalk_off" );
    }
    else
    {
        exploder::exploder( "fxexp_catwalk_on" );
    }
    
    if ( util::isfirstround() )
    {
        level util::delay( 0.4, undefined, &function_fffbeb7f );
        level util::delay( 3, undefined, &scene::play, #"p8_fxanim_mp_silo_missle_deploy_bundle" );
        level scene::add_scene_func( #"p8_fxanim_mp_silo_helicopter_crash_bundle", &function_5c718249, "play" );
        level util::delay( 0.2, undefined, &scene::play, #"p8_fxanim_mp_silo_helicopter_crash_bundle" );
        level notify( #"hash_771bf8874446d6f6" );
        level notify( #"hash_388057c56b2acf4c" );
        return;
    }
    
    exploder::exploder( "fxexp_globe_fire" );
    waitframe( 4 );
    level scene::skipto_end( #"p8_fxanim_mp_silo_missle_deploy_bundle", undefined, undefined, 1 );
    level scene::skipto_end( #"p8_fxanim_mp_silo_helicopter_crash_bundle", undefined, undefined, 1 );
    level.damaged_globe = getent( "radar_globe_damaged", "targetname" );
    level.damaged_globe show();
    wait 1;
    level.pristine_globe = getent( "radar_globe_pristine", "targetname" );
    level.pristine_globe hide();
}

// Namespace mp_silo/mp_silo
// Params 1
// Checksum 0x73d78155, Offset: 0x15c8
// Size: 0x5c
function function_5c718249( a_ents )
{
    waitframe( 1 );
    
    if ( isdefined( a_ents[ #"prop 1" ] ) )
    {
        a_ents[ #"prop 1" ] clientfield::increment( "helo_spawn_flavor_rope_pulse" );
    }
}

// Namespace mp_silo/mp_silo
// Params 0
// Checksum 0x7f41920f, Offset: 0x1630
// Size: 0x8c
function function_fffbeb7f()
{
    level.damaged_globe show();
    exploder::exploder( "fxexp_globe_explosion" );
    explode_pos = ( -5555.25, -5398.75, 20 );
    playrumbleonposition( "mp_silo_globe_explosion", explode_pos );
    wait 1.25;
    level.pristine_globe hide();
}

/#

    // Namespace mp_silo/mp_silo
    // Params 0
    // Checksum 0x7fd92b76, Offset: 0x16c8
    // Size: 0x74, Type: dev
    function init_devgui()
    {
        mapname = util::get_map_name();
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x48>" );
        adddebugcommand( "<dev string:x38>" + mapname + "<dev string:x89>" );
    }

#/
