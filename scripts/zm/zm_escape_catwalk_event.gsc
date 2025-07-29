#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\music_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\zm\zm_escape_util;
#using scripts\zm\zm_escape_vo_hooks;
#using scripts\zm_common\util\ai_brutus_util;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_escape_catwalk_event;

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0xc964fe5b, Offset: 0x638
// Size: 0x84
function init_clientfields()
{
    clientfield::register( "scriptmover", "" + #"hash_144c7c2895ed95c", 1, 1, "int" );
    clientfield::register( "scriptmover", "" + #"hash_48f1f50c412d80c7", 1, 1, "counter" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x816e4dbe, Offset: 0x6c8
// Size: 0x324
function function_4989fd7e()
{
    level flag::init( #"hash_6019aeb57ae7e6b5" );
    level flag::init( #"catwalk_event_completed" );
    level flag::init( #"catwalk_door_open" );
    var_40762d8a = getent( "t_catwalk_door_open", "targetname" );
    var_40762d8a sethintstring( #"zombie/need_power" );
    level.var_2ea46461 = getent( "mdl_ca_l", "targetname" );
    a_e_door = getentarray( "door_model_west_side_exterior_to_catwalk", "targetname" );
    
    foreach ( e_door in a_e_door )
    {
        if ( e_door.classname == "script_model" )
        {
            level.var_2ea46461 linkto( e_door );
            break;
        }
    }
    
    scene::add_scene_func( #"aib_vign_zm_mob_brutus_summon_hellhounds", &function_bbc07822, "Shot 1" );
    scene::add_scene_func( #"aib_vign_zm_mob_brutus_summon_hellhounds", &function_e7c9f15b, "Shot 1" );
    scene::add_scene_func( #"aib_vign_zm_mob_brutus_summon_hellhounds", &play_brutus_scene_done, "done" );
    scene::add_scene_func( #"aib_vign_zm_mob_brutus_summon_hellhounds", &function_e16c819a, "Shot 1" );
    var_47463bbe = getent( "t_rocks_b_bundle_play_scene", "targetname" );
    var_1b4c13ea = getent( "t_rocks_c_bundle_play_scene", "targetname" );
    var_47463bbe thread function_f184754();
    var_1b4c13ea thread function_fd3fa3a3();
    level thread function_84f1c310();
    level thread function_dc212e9f();
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x290c1a16, Offset: 0x9f8
// Size: 0x8b4
function function_84f1c310()
{
    level endon( #"hash_7bf357f5c916ca4e" );
    
    if ( zm_custom::function_901b751c( #"zmpowerdoorstate" ) != 2 )
    {
        if ( zm_utility::is_standard() )
        {
            level waittill( #"hash_545d84d6e7f5c7a6" );
        }
        else
        {
            level flag::wait_till_any( array( "power_on2", "power_on" ) );
        }
    }
    
    var_40762d8a = getent( "t_catwalk_door_open", "targetname" );
    t_catwalk_door = getent( "door_model_west_side_exterior_to_catwalk", "target" );
    var_f7076542 = getentarray( "catwalk_event_triggers", "script_noteworthy" );
    
    foreach ( t_catwalk_event in var_f7076542 )
    {
        trigger::add_function( t_catwalk_event, "enemies_spawned", &function_7b6777c5, t_catwalk_event );
    }
    
    if ( zm_custom::function_901b751c( #"zmpowerstate" ) == 1 && zm_custom::function_901b751c( #"zmpowerdoorstate" ) != 2 )
    {
        if ( function_8b1a219a() )
        {
            var_40762d8a sethintstring( #"hash_6c7c18e3ce28c91b" );
        }
        else
        {
            var_40762d8a sethintstring( #"hash_52803ee9fe3f2ea5" );
        }
        
        t_catwalk_door sethintstring( #"" );
        level.var_2ea46461 setmodel( #"p8_zm_esc_catwalk_door_light_green" );
        
        if ( function_8b1a219a() )
        {
            var_40762d8a sethintstring( #"hash_6c7c18e3ce28c91b" );
        }
        else
        {
            var_40762d8a sethintstring( #"hash_52803ee9fe3f2ea5" );
        }
        
        t_catwalk_door sethintstring( #"" );
        waitresult = var_40762d8a waittill( #"trigger" );
        level flag::set( #"catwalk_door_open" );
        level thread scene::init_streamer( #"aib_vign_zm_mob_brutus_summon_hellhounds", #"allies", 0, 0 );
        
        if ( isplayer( waitresult.activator ) )
        {
            waitresult.activator thread zm_audio::create_and_play_dialog( #"catwalk", #"open", undefined, 1 );
        }
        
        var_40762d8a sethintstring( #"" );
        t_catwalk_door notify( #"power_on" );
        playsoundatposition( #"hash_97aff7905795396", ( 8223, 10111, 817 ) );
        level.musicsystemoverride = 1;
        music::setmusicstate( "escape_catwalk" );
        s_sparks = struct::get( "catwalk_door_spark" );
        mdl_sparks = util::spawn_model( "tag_origin", s_sparks.origin, s_sparks.angles );
        mdl_sparks clientfield::set( "" + #"hash_144c7c2895ed95c", 1 );
        mdl_gate = undefined;
        
        foreach ( mdl_door in t_catwalk_door.doors )
        {
            if ( mdl_door.classname == "script_model" )
            {
                mdl_gate = mdl_door;
                break;
            }
        }
        
        if ( isdefined( mdl_gate ) )
        {
            level thread function_40312eda( mdl_sparks, mdl_gate );
        }
        
        level.var_2ea46461 clientfield::increment( "" + #"hash_48f1f50c412d80c7" );
        level.var_b2b15659 = 1;
    }
    else if ( zm_custom::function_901b751c( "zmPowerState" ) == 2 || zm_custom::function_901b751c( #"zmpowerdoorstate" ) == 2 )
    {
        var_40762d8a sethintstring( #"" );
        t_catwalk_door sethintstring( #"" );
        var_40762d8a setinvisibletoall();
        t_catwalk_door setinvisibletoall();
        
        if ( isdefined( level.var_2ea46461 ) )
        {
            level.var_2ea46461 delete();
        }
    }
    
    level.var_e120ae98 = &function_82a43802;
    trigger::wait_till( "t_catwalk_event_00" );
    level flag::set( #"hash_6019aeb57ae7e6b5" );
    
    foreach ( s_powerup in level.zombie_powerups )
    {
        s_powerup.var_4428eab7 = s_powerup.func_should_drop_with_regular_powerups;
        s_powerup.func_should_drop_with_regular_powerups = &zm_powerups::func_should_never_drop;
    }
    
    level thread function_17ccf041();
    level thread function_da824de8();
    
    foreach ( e_player in level.activeplayers )
    {
        e_player thread function_ddadfe7();
    }
    
    callback::on_connect( &function_ddadfe7 );
    function_1646f141();
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0xfa8ac38b, Offset: 0x12b8
// Size: 0x164
function function_1646f141( var_e8ba54a2 = 0 )
{
    if ( var_e8ba54a2 )
    {
        level thread function_17ccf041();
        level thread function_da824de8();
    }
    
    t_catwalk_event_10 = getent( "t_catwalk_event_10", "targetname" );
    
    if ( isdefined( t_catwalk_event_10 ) && !var_e8ba54a2 )
    {
        t_catwalk_event_10 waittill( #"enemies_spawned" );
    }
    
    while ( level.var_20cff6f0 )
    {
        waitframe( 1 );
    }
    
    for ( var_7ffb217b = getentarray( "catwalk_event_zombie", "script_noteworthy" ); var_7ffb217b.size > 0 ; var_7ffb217b = getentarray( "catwalk_event_zombie", "script_noteworthy" ) )
    {
        waitframe( 1 );
    }
    
    level flag::wait_till_timeout( 61, "trig_catwalk_event_completed" );
    level thread function_e11ac4f5();
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0xbdaca8b9, Offset: 0x1428
// Size: 0xac
function function_dc212e9f()
{
    mdl_wire = getent( "catwalk_wires", "targetname" );
    bundle = #"p8_fxanim_zm_esc_wires_catwalk_bundle";
    mdl_wire thread scene::play( bundle, "LOOP", mdl_wire );
    level flag::wait_till( #"catwalk_door_open" );
    mdl_wire thread scene::play( bundle, "SHOCKED", mdl_wire );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x8536511, Offset: 0x14e0
// Size: 0xec
function function_f184754()
{
    while ( true )
    {
        s_info = self waittill( #"trigger", #"death" );
        
        if ( isplayer( s_info.activator ) && !s_info.activator laststand::player_is_in_laststand() || s_info._notify === "death" )
        {
            break;
        }
    }
    
    var_4bdae8cd = struct::get( "p8_fxanim_zm_esc_recreationyard_rocks_b_bundle", "scriptbundlename" );
    var_4bdae8cd thread scene::play( "Main & Idle Loop Out" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x902797fa, Offset: 0x15d8
// Size: 0x12c
function function_fd3fa3a3()
{
    self endon( #"death" );
    
    while ( true )
    {
        s_info = self waittill( #"trigger", #"death" );
        
        if ( isplayer( s_info.activator ) && !s_info.activator laststand::player_is_in_laststand() || s_info._notify === "death" )
        {
            break;
        }
    }
    
    var_4bdae8cd = struct::get( "p8_fxanim_zm_esc_recreationyard_rocks_c_bundle", "scriptbundlename" );
    playsoundatposition( #"hash_83f364ceb17bf92", var_4bdae8cd.origin );
    var_4bdae8cd thread scene::play( "Main & Idle Loop Out" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 2
// Checksum 0xe7f49f91, Offset: 0x1710
// Size: 0x84
function function_40312eda( mdl_sparks, mdl_gate )
{
    v_new_position = mdl_sparks.origin + mdl_gate.script_vector;
    mdl_sparks moveto( v_new_position, 1, 0.25, 0.25 );
    wait 1.25;
    mdl_sparks delete();
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0xce788bf8, Offset: 0x17a0
// Size: 0x144
function function_1b943b6c( var_5213b44c )
{
    a_spots = struct::get_array( var_5213b44c, "catwalk_spawner" );
    
    if ( a_spots.size > 0 )
    {
        foreach ( s_spot in a_spots )
        {
            s_spot thread function_9d553a8();
        }
        
        level flag::wait_till_clear( #"hash_6019aeb57ae7e6b5" );
        
        foreach ( s_spot in a_spots )
        {
            s_spot notify( #"restore" );
        }
    }
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0xd8823252, Offset: 0x18f0
// Size: 0x2e
function function_9d553a8()
{
    self.is_enabled = 0;
    self waittill( #"restore" );
    self.is_enabled = 1;
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0x6d623e98, Offset: 0x1928
// Size: 0x54e
function function_7b6777c5( t_spawner )
{
    if ( isdefined( t_spawner.catwalk_spawner ) )
    {
        level thread function_1b943b6c( t_spawner.catwalk_spawner );
    }
    
    if ( isdefined( t_spawner.var_945ce5e ) )
    {
        a_str_sets = strtok( t_spawner.var_945ce5e, " " );
        
        foreach ( str_set in a_str_sets )
        {
            a_s_spots = struct::get_array( str_set, "catwalk_spawner" );
            
            foreach ( s_spot in a_s_spots )
            {
                s_spot notify( #"restore" );
            }
        }
    }
    
    t_spawner notify( #"enemies_spawned" );
    level.var_20cff6f0 = 1;
    var_d72fffcc = struct::get_array( t_spawner.target );
    
    foreach ( var_adad907f in var_d72fffcc )
    {
        if ( level.activeplayers.size == 1 && isdefined( var_adad907f.var_e6eb2eff ) && var_adad907f.var_e6eb2eff )
        {
            continue;
        }
        
        e_enemy = undefined;
        
        if ( isdefined( level.var_a2831281 ) && level.var_a2831281 )
        {
            while ( !isdefined( e_enemy ) )
            {
                e_enemy = zombie_utility::spawn_zombie( level.var_d668eae7[ 0 ], undefined, var_adad907f );
                waitframe( 1 );
            }
            
            e_enemy zombie_brutus_util::brutus_spawn( 250, 0 );
            continue;
        }
        
        if ( isdefined( level.var_2b94ce72 ) && level.var_2b94ce72 )
        {
            while ( !isdefined( e_enemy ) )
            {
                e_enemy = zombie_utility::spawn_zombie( level.dog_spawners[ 0 ], undefined, var_adad907f );
                waitframe( 1 );
            }
            
            level notify( #"hash_744c6105bcd18f3a", { #ai_dog:e_enemy } );
            e_enemy thread zm_escape_util::function_7273c33d( var_adad907f );
            e_enemy ai::set_behavior_attribute( "sprint", 1 );
            continue;
        }
        
        if ( var_adad907f.script_noteworthy == "spawn_location" && !( isdefined( level.var_a2831281 ) && level.var_a2831281 ) && !( isdefined( level.var_2b94ce72 ) && level.var_2b94ce72 ) )
        {
            while ( !isdefined( e_enemy ) )
            {
                e_enemy = zombie_utility::spawn_zombie( level.zombie_spawners[ 0 ], undefined, var_adad907f );
                waitframe( 1 );
            }
            
            e_enemy thread zm_escape_util::function_24d3ec02( "catwalk_event_zombie", 1 );
            continue;
        }
        
        if ( var_adad907f.script_noteworthy == "dog_location" && !( isdefined( level.var_15747fb1 ) && level.var_15747fb1 ) )
        {
            while ( !isdefined( e_enemy ) )
            {
                e_enemy = zombie_utility::spawn_zombie( level.dog_spawners[ 0 ] );
                waitframe( 1 );
            }
            
            level notify( #"hash_744c6105bcd18f3a", { #ai_dog:e_enemy } );
            e_enemy thread zm_escape_util::function_7273c33d( var_adad907f );
            e_enemy ai::set_behavior_attribute( "sprint", 1 );
        }
    }
    
    level.var_20cff6f0 = 0;
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x13fc6bc, Offset: 0x1e80
// Size: 0x4ca
function function_17ccf041()
{
    self notify( "132dac1db2bd93e0" );
    self endon( "132dac1db2bd93e0" );
    level endon( #"catwalk_event_completed", #"end_game" );
    level.var_20cff6f0 = 0;
    
    while ( true )
    {
        n_check_time = function_27b45f3e();
        e_leader = function_9ac202b9();
        
        if ( isplayer( e_leader ) )
        {
            s_notify = e_leader waittilltimeout( n_check_time, #"damage", #"death" );
            
            if ( s_notify._notify === "death" )
            {
                waitframe( 1 );
                continue;
            }
        }
        else
        {
            waitframe( 1 );
            continue;
        }
        
        while ( zm_escape_util::function_28d0cf11( "catwalk_event_zombie" ) && !level.var_20cff6f0 )
        {
            if ( !isdefined( e_leader ) )
            {
                break;
            }
            
            a_ai_zombies = zombie_utility::get_zombie_array();
            a_ai_zombies = arraysort( a_ai_zombies, e_leader.origin, 0 );
            var_57662f94 = arraycopy( a_ai_zombies );
            var_8778c04e = 0;
            
            foreach ( ai_zombie in a_ai_zombies )
            {
                if ( !isdefined( ai_zombie ) )
                {
                    continue;
                }
                
                if ( isdefined( ai_zombie.var_45cec07d ) )
                {
                    arrayremovevalue( var_57662f94, ai_zombie );
                    var_8778c04e++;
                    continue;
                }
                
                b_can_see = 0;
                
                foreach ( player in util::get_active_players() )
                {
                    if ( player cansee( ai_zombie ) )
                    {
                        b_can_see = 1;
                    }
                    
                    if ( player util::is_player_looking_at( ai_zombie.origin, 0.5, 0, player ) && distance( player.origin, ai_zombie.origin ) < 500 )
                    {
                        b_can_see = 1;
                    }
                }
                
                if ( b_can_see )
                {
                    arrayremovevalue( var_57662f94, ai_zombie );
                    var_8778c04e++;
                }
            }
            
            a_ai_zombies = var_57662f94;
            
            if ( var_8778c04e < level.var_c843e795 )
            {
                var_89282900 = level.var_c843e795 - var_8778c04e;
                
                for ( i = 1; i <= var_89282900 ; i++ )
                {
                    array::pop( a_ai_zombies );
                    var_8778c04e++;
                }
            }
            
            foreach ( ai_zombie in a_ai_zombies )
            {
                if ( !isalive( ai_zombie ) )
                {
                    continue;
                }
                
                ai_zombie.allowdeath = 1;
                ai_zombie kill();
                level.zombie_total++;
                level.zombie_respawns++;
                waitframe( 1 );
            }
            
            waitframe( 1 );
        }
        
        waitframe( 1 );
    }
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x75119043, Offset: 0x2358
// Size: 0xce
function function_27b45f3e()
{
    switch ( level.activeplayers.size )
    {
        case 1:
            n_time = 0.05;
            break;
        case 2:
            n_time = 2.9;
            break;
        case 3:
            n_time = 3.9;
            break;
        default:
            n_time = 6.1;
            break;
    }
    
    return n_time;
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x975820a9, Offset: 0x2430
// Size: 0xd0
function function_9ac202b9()
{
    e_leader = undefined;
    a_players = util::get_active_players();
    
    if ( a_players.size )
    {
        e_leader = a_players[ 0 ];
        
        foreach ( e_player in a_players )
        {
            if ( e_player.origin[ 0 ] < e_leader.origin[ 0 ] )
            {
                e_leader = e_player;
            }
        }
    }
    
    return e_leader;
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0x94cdcc30, Offset: 0x2508
// Size: 0x346
function function_7ab912f2( s_loc )
{
    self endon( #"death" );
    self.b_ignore_cleanup = 1;
    self.ignore_enemy_count = 1;
    self val::set( #"dog_spawn", "ignoreall", 1 );
    self val::set( #"dog_spawn", "ignoreme", 1 );
    self setfreecameralockonallowed( 0 );
    self forceteleport( s_loc.origin, s_loc.angles );
    self hide();
    playfx( level._effect[ #"lightning_dog_spawn" ], s_loc.origin );
    playsoundatposition( #"zmb_hellhound_prespawn", s_loc.origin );
    wait 1.5;
    playsoundatposition( #"zmb_hellhound_bolt", s_loc.origin );
    earthquake( 0.5, 0.75, s_loc.origin, 1000 );
    playsoundatposition( #"hash_42894a8e6bfacf66", ( 5085, 10424, 1102 ) );
    playsoundatposition( #"zmb_hellhound_spawn", s_loc.origin );
    assert( isdefined( self ), "<dev string:x38>" );
    assert( isalive( self ), "<dev string:x53>" );
    assert( zm_utility::is_magic_bullet_shield_enabled( self ), "<dev string:x68>" );
    self zombie_dog_util::zombie_setup_attack_properties_dog();
    self util::stop_magic_bullet_shield();
    wait 0.1;
    self show();
    self setfreecameralockonallowed( 1 );
    self val::reset( #"dog_spawn", "ignoreme" );
    self val::reset( #"dog_spawn", "ignoreall" );
    self notify( #"visible" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0xb34ddc87, Offset: 0x2858
// Size: 0xb4
function function_da824de8()
{
    self notify( "7208d0e939378c16" );
    self endon( "7208d0e939378c16" );
    trigger::wait_till( "t_catwalk_event_03" );
    level.disable_nuke_delay_spawning = 1;
    level flag::clear( "spawn_zombies" );
    var_31d73a49 = 25;
    
    if ( zm_utility::is_standard() )
    {
        var_31d73a49 = 15;
    }
    
    level flag::delay_set( var_31d73a49, "spawn_zombies", "play_brutus_scene_done" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0x2a6cff73, Offset: 0x2918
// Size: 0x11c
function function_bbc07822( a_ents )
{
    e_brutus = a_ents[ #"brutus" ];
    
    if ( level.brutus_count > 0 )
    {
        var_f1404f73 = getaiarchetypearray( #"brutus" )[ 0 ];
        
        if ( var_f1404f73 != e_brutus )
        {
            level thread zm_escape_util::function_37aed203( var_f1404f73 );
            level.var_43bca751 = 1;
        }
    }
    
    e_brutus.ignore_nuke = 1;
    e_brutus.b_ignore_cleanup = 1;
    
    if ( isdefined( a_ents[ #"brutus" ].var_972a4b46 ) )
    {
        a_ents[ #"brutus" ].var_972a4b46 delete();
    }
    
    e_brutus thread function_d0392daf();
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0xd1348ba1, Offset: 0x2a40
// Size: 0x12c
function function_e7c9f15b( a_ents )
{
    e_brutus = a_ents[ #"brutus" ];
    var_4bdae8cd = struct::get( "p8_fxanim_zm_esc_recreationyard_rocks_a_bundle", "scriptbundlename" );
    var_4bdae8cd thread scene::play( "Main & Idle Loop Out" );
    e_brutus = a_ents[ #"brutus" ];
    playsoundatposition( #"hash_66ef8de59c96e8d1", e_brutus gettagorigin( "tag_eye" ) );
    e_brutus waittill( #"start_teleport" );
    level thread function_21ccdb36();
    e_brutus waittill( #"teleport" );
    e_brutus hide();
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0x72cc98f2, Offset: 0x2b78
// Size: 0x178
function play_brutus_scene_done( a_ents )
{
    level.disable_nuke_delay_spawning = undefined;
    level flag::wait_till_clear( #"hash_21921ed511559aa3" );
    level flag::set( "spawn_zombies" );
    a_enemy = getaiarchetypearray( #"brutus" );
    level.brutus_count = a_enemy.size;
    
    if ( isdefined( level.var_43bca751 ) && level.var_43bca751 && !zm_utility::is_standard() )
    {
        if ( level.zones[ #"zone_catwalk_04" ].is_active )
        {
            zombie_brutus_util::attempt_brutus_spawn( 1, "zone_catwalk_04" );
        }
        else if ( level.zones[ #"zone_catwalk_03" ].is_active )
        {
            zombie_brutus_util::attempt_brutus_spawn( 1, "zone_catwalk_03" );
        }
        else
        {
            zombie_brutus_util::attempt_brutus_spawn( 1 );
        }
        
        level.var_43bca751 = undefined;
    }
    
    level notify( #"play_brutus_scene_done" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0xa6daee1a, Offset: 0x2cf8
// Size: 0x82
function function_d0392daf()
{
    self setcandamage( 1 );
    self.health = 10000000;
    s_result = self waittill( #"damage", #"teleport" );
    
    if ( s_result._notify == "damage" )
    {
        level.var_43bca751 = 1;
    }
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0x47d4e185, Offset: 0x2d88
// Size: 0xe0
function function_e16c819a( a_ents )
{
    foreach ( e_ent in a_ents )
    {
        if ( isactor( e_ent ) )
        {
            e_ent.b_ignore_cleanup = 1;
            e_ent thread function_993f4add();
            e_ent thread function_5404a36b();
            e_ent clientfield::set( "dog_fx", 1 );
        }
    }
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x89d1827c, Offset: 0x2e70
// Size: 0xaa
function function_993f4add()
{
    self notify( #"hash_2c989e619ebfe50a" );
    self endon( #"hash_2c989e619ebfe50a" );
    s_result = self waittill( #"death", #"b_h_stop_damage_watcher" );
    
    if ( s_result._notify == "death" )
    {
        if ( isdefined( self ) )
        {
            level thread zombie_dog_util::dog_explode_fx( self, self.origin );
        }
        
        level.var_43bca751 = 1;
    }
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0, eflags: 0x4
// Checksum 0x2d4c8bf5, Offset: 0x2f28
// Size: 0x84
function private function_5404a36b()
{
    self endon( #"death" );
    self waittill( #"b_h_disappear" );
    self notify( #"b_h_stop_damage_watcher" );
    self ghost();
    self forceteleport( self.origin - ( 0, 0, 100 ) );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0xa872ac19, Offset: 0x2fb8
// Size: 0x4c
function function_21ccdb36()
{
    first_floor_lookup_handler = struct::get( "p8_fxanim_zm_esc_catwalk_pole_electrical_bundle", "scriptbundlename" );
    first_floor_lookup_handler thread scene::play( "Shot 2" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x1b7bb566, Offset: 0x3010
// Size: 0x31c
function function_e11ac4f5()
{
    level notify( #"hash_7bf357f5c916ca4e" );
    level endon( #"hash_7bf357f5c916ca4e" );
    a_t_catwalk_event = getentarray( "catwalk_event_triggers", "script_noteworthy" );
    
    foreach ( t_catwalk_event in a_t_catwalk_event )
    {
        if ( isdefined( t_catwalk_event ) )
        {
            t_catwalk_event delete();
        }
    }
    
    level flag::clear( #"hash_6019aeb57ae7e6b5" );
    level.var_e120ae98 = undefined;
    
    foreach ( s_powerup in level.zombie_powerups )
    {
        if ( isdefined( s_powerup.var_4428eab7 ) )
        {
            s_powerup.func_should_drop_with_regular_powerups = s_powerup.var_4428eab7;
            s_powerup.var_4428eab7 = undefined;
        }
    }
    
    if ( isdefined( level.var_b2b15659 ) && level.var_b2b15659 )
    {
        level.var_b2b15659 = undefined;
    }
    
    if ( !level.var_a3f67fc2 )
    {
        level.var_973488a5 = level.round_number + 1;
        level thread zombie_dog_util::dog_enable_rounds( 1 );
    }
    
    if ( isdefined( level.var_2ea46461 ) )
    {
        level.var_2ea46461 delete();
    }
    
    foreach ( e_player in level.players )
    {
        e_player zm_audio::function_e1666976( "surrounded", "self" );
    }
    
    callback::remove_on_connect( &function_ddadfe7 );
    music::setmusicstate( "none" );
    level.musicsystemoverride = 0;
    level flag::set( #"catwalk_event_completed" );
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 1
// Checksum 0xb0bd09fe, Offset: 0x3338
// Size: 0x1a8
function function_82a43802( a_s_valid_respawn_points )
{
    var_e9b059c7 = [];
    
    foreach ( s_respawn_point in a_s_valid_respawn_points )
    {
        if ( s_respawn_point.script_noteworthy == "zone_model_industries" || s_respawn_point.script_noteworthy == "zone_model_industries_upper" || s_respawn_point.script_noteworthy == "zone_west_side_exterior_upper" || s_respawn_point.script_noteworthy == "zone_west_side_exterior_upper_02" || s_respawn_point.script_noteworthy == "zone_west_side_exterior_lower" || s_respawn_point.script_noteworthy == "zone_west_side_exterior_tunnel" || s_respawn_point.script_noteworthy == "zone_powerhouse" || s_respawn_point.script_noteworthy == "zone_new_industries" )
        {
            if ( !isdefined( var_e9b059c7 ) )
            {
                var_e9b059c7 = [];
            }
            else if ( !isarray( var_e9b059c7 ) )
            {
                var_e9b059c7 = array( var_e9b059c7 );
            }
            
            var_e9b059c7[ var_e9b059c7.size ] = s_respawn_point;
        }
    }
    
    return var_e9b059c7;
}

// Namespace zm_escape_catwalk_event/zm_escape_catwalk_event
// Params 0
// Checksum 0x502bf3b7, Offset: 0x34e8
// Size: 0x20e
function function_ddadfe7()
{
    self endon( #"disconnect" );
    a_str_zones = array( "zone_catwalk_01", "zone_catwalk_02", "zone_catwalk_03", "zone_catwalk_04" );
    
    while ( !level flag::get( #"catwalk_event_completed" ) )
    {
        str_zone = self zm_zonemgr::get_player_zone();
        
        if ( isdefined( str_zone ) && isinarray( a_str_zones, str_zone ) && !( isdefined( self.var_9235ac2d ) && self.var_9235ac2d ) )
        {
            self zm_audio::function_6191af93( #"surrounded", #"self", #"catwalk", #"surrounded" );
            self.var_9235ac2d = 1;
        }
        else if ( isdefined( str_zone ) && !isinarray( a_str_zones, str_zone ) && isdefined( self.var_9235ac2d ) && self.var_9235ac2d )
        {
            self zm_audio::function_e1666976( #"surrounded", #"self" );
            self.var_9235ac2d = undefined;
        }
        
        wait 1;
    }
    
    self zm_audio::function_e1666976( #"surrounded", #"self" );
    
    if ( isdefined( self.var_9235ac2d ) && self.var_9235ac2d )
    {
        self.var_9235ac2d = undefined;
    }
}

