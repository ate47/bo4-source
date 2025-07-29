#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicle_shared;
#using scripts\zm\zm_office_cleanup;
#using scripts\zm\zm_office_floors;
#using scripts\zm\zm_office_teleporters;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace zm_office_elevators;

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x24ea316c, Offset: 0x7f0
// Size: 0x594
function init()
{
    level flag::init( "defcon_active" );
    level flag::init( "no_pack_room_spawning" );
    level flag::init( "open_pack_hideaway" );
    level flag::init( "labs_enabled" );
    level flag::init( "bonfire_reset" );
    level flag::init( "elevator_grounded" );
    level flag::init( "war_room_start" );
    level flag::init( "no_warroom_elevator_spawning" );
    level flag::init( "no_labs_elevator_spawning" );
    level flag::init( "elevators_initialized" );
    level thread function_3d4e24ea();
    level thread registergondola_moving_watcher();
    level thread function_d23ea9aa();
    level thread function_dec13a5b();
    level.var_fc1f5422 = struct::get_array( "war_room_zone_elevator_spawns", "targetname" );
    level.var_3d9e751c = struct::get_array( "labs_elevator_spawns", "targetname" );
    elevator1 = getent( "elevator1", "targetname" );
    elevator2 = getent( "elevator2", "targetname" );
    elevator1.cost = 500;
    elevator1.station = "elevator1_up";
    elevator1.called = 0;
    elevator1.active = 0;
    elevator1.var_5a3b55a3 = getvehiclenode( "elev1_level3_start", "targetname" );
    elevator1.var_7237c31e = getvehiclenode( "elev1_level2_start", "targetname" );
    elevator1.var_243802fa = #"hash_7041e0919c53eb4e";
    elevator1.takedamage = 0;
    elevator1 setmovingplatformenabled( 1 );
    elevator2.cost = 500;
    elevator2.station = "elevator2_up";
    elevator2.called = 0;
    elevator2.active = 0;
    elevator2.var_5a3b55a3 = getvehiclenode( "elev2_level2_start", "targetname" );
    elevator2.var_7237c31e = getvehiclenode( "elev2_level1_start", "targetname" );
    elevator2.var_243802fa = #"hash_5a26031141f5cc33";
    elevator2.takedamage = 0;
    elevator2 setmovingplatformenabled( 1 );
    elevator1 init_elevator1_doors();
    elevator1 init_buy();
    elevator1 init_call_boxes();
    elevator2 init_elevator2_doors();
    elevator2 init_buy();
    elevator2 init_call_boxes();
    util::wait_network_frame();
    elevator1 enable_callboxes();
    elevator1 block_elev_doors( 0 );
    elevator1 open_elev_doors();
    elevator2 enable_callboxes();
    elevator2 block_elev_doors( 0 );
    elevator2 open_elev_doors();
    elevator2 playloopsound( "amb_elevator_muzak" );
    elevator1 thread elevator1_3d_audio();
    elevator2 thread elevator2_3d_audio();
    level.elevator1 = elevator1;
    level.elevator2 = elevator2;
    level flag::set( "elevators_initialized" );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xb7602317, Offset: 0xd90
// Size: 0x1e6
function function_3d4e24ea()
{
    level._effect[ #"hash_4a38c13e2040d160" ] = #"hash_11e609d597dcebf2";
    level.fx_elevator_light = level._effect[ #"hash_4a38c13e2040d160" ];
    level._effect[ #"hash_336249bfea00c9ea" ] = #"hash_48ec8658075edc9d";
    level.var_dca712ff = level._effect[ #"hash_336249bfea00c9ea" ];
    level._effect[ #"hash_3718db938f7babf7" ] = #"hash_142b1b8f881ae741";
    level.var_715ae9f9 = level._effect[ #"hash_3718db938f7babf7" ];
    level._effect[ #"hash_3b796b3101b76878" ] = #"hash_4fc36e212e5b5b8a";
    level.var_e33251c7 = level._effect[ #"hash_3b796b3101b76878" ];
    level._effect[ #"hash_1d090c7817f1e26d" ] = #"hash_340a3cade524696d";
    level.var_41a1bc06 = level._effect[ #"hash_1d090c7817f1e26d" ];
    level._effect[ #"hash_7c83294db356d63a" ] = #"hash_499e66437fc6ab02";
    level.var_8caf5068 = level._effect[ #"hash_7c83294db356d63a" ];
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x69d73ad3, Offset: 0xf80
// Size: 0x7c0
function registergondola_moving_watcher()
{
    level.a_e_elevator = getentarray( "elevator2", "targetname" );
    level.a_e_elevator1 = getentarray( "elevator1", "targetname" );
    var_844f2ba7 = getent( "fx_light_elevator_origin", "targetname" );
    var_844f2ba7.fx_ent = util::spawn_model( "tag_origin", var_844f2ba7.origin );
    var_844f2ba7.fx_ent.angles = var_844f2ba7.angles;
    var_844f2ba7.elevator_fx_light = playfxontag( level.fx_elevator_light, var_844f2ba7.fx_ent, "tag_origin" );
    var_844f2ba7.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    var_428c7836 = getent( "fx_light_elevator1_origin", "targetname" );
    var_428c7836.fx_ent = util::spawn_model( "tag_origin", var_428c7836.origin );
    var_428c7836.fx_ent.angles = var_428c7836.angles;
    var_428c7836.var_286bc7b5 = playfxontag( level.var_41a1bc06, var_428c7836.fx_ent, "tag_origin" );
    var_428c7836.var_286bc7b5 linkto( level.a_e_elevator1[ 0 ] );
    var_71ffef77 = getent( "lgt_elevator_panel_illum_origin", "targetname" );
    var_71ffef77.fx_ent = util::spawn_model( "tag_origin", var_71ffef77.origin );
    var_71ffef77.fx_ent.angles = var_71ffef77.angles;
    var_71ffef77.elevator_fx_light = playfxontag( level.var_e33251c7, var_71ffef77.fx_ent, "tag_origin" );
    var_71ffef77.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    var_b15265f4 = getent( "lgt_elevator_panel_caster_origin", "targetname" );
    var_b15265f4.fx_ent = util::spawn_model( "tag_origin", var_b15265f4.origin );
    var_b15265f4.fx_ent.angles = var_b15265f4.angles;
    var_b15265f4.elevator_fx_light = playfxontag( level.var_715ae9f9, var_b15265f4.fx_ent, "tag_origin" );
    var_b15265f4.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    cp_safehouse_training_nextround_traversal = getent( "lgt_elevator2_panel_illum_origin", "targetname" );
    cp_safehouse_training_nextround_traversal.fx_ent = util::spawn_model( "tag_origin", cp_safehouse_training_nextround_traversal.origin );
    cp_safehouse_training_nextround_traversal.fx_ent.angles = cp_safehouse_training_nextround_traversal.angles;
    cp_safehouse_training_nextround_traversal.elevator_fx_light = playfxontag( level.var_e33251c7, cp_safehouse_training_nextround_traversal.fx_ent, "tag_origin" );
    cp_safehouse_training_nextround_traversal.elevator_fx_light linkto( level.a_e_elevator1[ 0 ] );
    var_c95e76a9 = getent( "lgt_elevator2_panel_caster_origin", "targetname" );
    var_c95e76a9.fx_ent = util::spawn_model( "tag_origin", var_c95e76a9.origin );
    var_c95e76a9.fx_ent.angles = var_c95e76a9.angles;
    var_c95e76a9.elevator_fx_light = playfxontag( level.var_715ae9f9, var_c95e76a9.fx_ent, "tag_origin" );
    var_c95e76a9.elevator_fx_light linkto( level.a_e_elevator1[ 0 ] );
    var_844f2f0a = getentarray( "fx_light_illum_elevator_origin", "targetname" );
    var_6d00692f = getentarray( "fx_light_illum_elevator2_origin", "targetname" );
    
    foreach ( e_light in var_844f2f0a )
    {
        e_light.fx_ent = util::spawn_model( "tag_origin", e_light.origin );
        e_light.fx_ent.angles = e_light.angles;
        e_light.elevator_fx_light = playfxontag( level.var_dca712ff, e_light.fx_ent, "tag_origin" );
        e_light.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    }
    
    foreach ( e_light in var_6d00692f )
    {
        e_light.fx_ent = util::spawn_model( "tag_origin", e_light.origin );
        e_light.fx_ent.angles = e_light.angles;
        e_light.elevator_fx_light = playfxontag( level.var_8caf5068, e_light.fx_ent, "tag_origin" );
        e_light.elevator_fx_light linkto( level.a_e_elevator1[ 0 ] );
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x8011dcc8, Offset: 0x1748
// Size: 0x42c
function function_d23ea9aa()
{
    var_ef2c2035 = getentarray( "elevator1_indicator", "script_noteworthy" );
    var_5abda158 = getentarray( "elevator2_indicator", "script_noteworthy" );
    level.var_41d73944 = getentarray( "elevator1_indicator_up_on", "targetname" );
    level.var_6c224e2c = getentarray( "elevator1_indicator_up_off", "targetname" );
    level.var_2e236c62 = getentarray( "elevator1_indicator_down_on", "targetname" );
    level.var_c8358a8 = getentarray( "elevator1_indicator_down_off", "targetname" );
    level.var_8a312e3b = getentarray( "elevator2_indicator_up_on", "targetname" );
    level.var_1eea8b4e = getentarray( "elevator2_indicator_up_off", "targetname" );
    level.var_54345fd6 = getentarray( "elevator2_indicator_down_on", "targetname" );
    level.var_7e61c2bd = getentarray( "elevator2_indicator_down_off", "targetname" );
    
    if ( getdvarint( #"splitscreen_playercount", 1 ) > 2 )
    {
        array::delete_all( level.var_41d73944 );
        level.var_41d73944 = [];
        array::delete_all( level.var_6c224e2c );
        level.var_6c224e2c = [];
        array::delete_all( level.var_2e236c62 );
        level.var_2e236c62 = [];
        array::delete_all( level.var_c8358a8 );
        level.var_c8358a8 = [];
        array::delete_all( level.var_8a312e3b );
        level.var_8a312e3b = [];
        array::delete_all( level.var_1eea8b4e );
        level.var_1eea8b4e = [];
        array::delete_all( level.var_54345fd6 );
        level.var_54345fd6 = [];
        array::delete_all( level.var_7e61c2bd );
        level.var_7e61c2bd = [];
        var_ef2c2035 = [];
        var_5abda158 = [];
    }
    
    foreach ( e_indicator in var_ef2c2035 )
    {
        e_indicator linkto( level.a_e_elevator[ 0 ] );
    }
    
    foreach ( e_indicator in var_5abda158 )
    {
        e_indicator linkto( level.a_e_elevator1[ 0 ] );
    }
    
    function_db4ac61a();
    function_4cf5b4dd();
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xd8e13f00, Offset: 0x1b80
// Size: 0x1d0
function function_db4ac61a()
{
    foreach ( e_light in level.var_6c224e2c )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_c8358a8 )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_41d73944 )
    {
        e_light hide();
    }
    
    foreach ( e_light in level.var_2e236c62 )
    {
        e_light hide();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x81ac8e86, Offset: 0x1d58
// Size: 0x1d0
function function_cfd40975()
{
    foreach ( e_light in level.var_41d73944 )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_c8358a8 )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_6c224e2c )
    {
        e_light hide();
    }
    
    foreach ( e_light in level.var_2e236c62 )
    {
        e_light hide();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xb208f9c0, Offset: 0x1f30
// Size: 0x1d0
function function_5e62aa83()
{
    foreach ( e_light in level.var_6c224e2c )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_2e236c62 )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_41d73944 )
    {
        e_light hide();
    }
    
    foreach ( e_light in level.var_c8358a8 )
    {
        e_light hide();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x455da406, Offset: 0x2108
// Size: 0x1d0
function function_4cf5b4dd()
{
    foreach ( e_light in level.var_1eea8b4e )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_7e61c2bd )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_8a312e3b )
    {
        e_light hide();
    }
    
    foreach ( e_light in level.var_54345fd6 )
    {
        e_light hide();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xac87e2af, Offset: 0x22e0
// Size: 0x1d0
function function_1352fc3c()
{
    foreach ( e_light in level.var_8a312e3b )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_7e61c2bd )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_1eea8b4e )
    {
        e_light hide();
    }
    
    foreach ( e_light in level.var_54345fd6 )
    {
        e_light hide();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xe22c4ad7, Offset: 0x24b8
// Size: 0x1d0
function function_d5410733()
{
    foreach ( e_light in level.var_54345fd6 )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_1eea8b4e )
    {
        e_light show();
    }
    
    foreach ( e_light in level.var_8a312e3b )
    {
        e_light hide();
    }
    
    foreach ( e_light in level.var_7e61c2bd )
    {
        e_light hide();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x3dfe375e, Offset: 0x2690
// Size: 0x86
function init_call_boxes()
{
    trigger = getentarray( self.targetname + "_call_box", "targetname" );
    
    for ( i = 0; i < trigger.size ; i++ )
    {
        trigger[ i ] thread call_box_think( self );
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0xb4f9122b, Offset: 0x2720
// Size: 0x2a8
function call_box_think( elevator )
{
    self setcursorhint( "HINT_NOICON" );
    
    if ( function_8b1a219a() )
    {
        self sethintstring( #"hash_4e2495c99a50f326" );
    }
    else
    {
        self sethintstring( #"hash_2f56b9d8ac49ff92" );
    }
    
    while ( true )
    {
        who = undefined;
        waitresult = self waittill( #"trigger" );
        who = waitresult.activator;
        elev_clear = is_elevator_clear( elevator );
        
        if ( !elev_clear )
        {
            zm_utility::play_sound_at_pos( "no_purchase", self.origin );
            self sethintstring( #"hash_2af4a28719c51767" );
            wait 1;
            
            if ( function_8b1a219a() )
            {
                self sethintstring( #"hash_4e2495c99a50f326" );
            }
            else
            {
                self sethintstring( #"hash_2f56b9d8ac49ff92" );
            }
        }
        else if ( elevator.active == 1 || !who can_buy_elevator() )
        {
            zm_utility::play_sound_at_pos( "no_purchase", self.origin );
        }
        else if ( elevator.station != self.script_noteworthy )
        {
            call_destination = self.script_noteworthy;
            elevator.called = 1;
            elevator.active = 1;
            playsoundatposition( elevator.var_243802fa, self.origin );
            elevator disable_callboxes();
            elevator disable_elevator_buys();
            self thread elevator_move_to( elevator );
        }
        
        wait 0.05;
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0x9959a403, Offset: 0x29d0
// Size: 0xea, Type: bool
function is_elevator_clear( elevator )
{
    elevator_door_safety = getentarray( elevator.targetname + "_safety", "script_noteworthy" );
    players = getplayers();
    
    if ( isdefined( elevator_door_safety ) )
    {
        for ( i = 0; i < elevator_door_safety.size ; i++ )
        {
            for ( j = 0; j < players.size ; j++ )
            {
                if ( players[ j ] istouching( elevator_door_safety[ i ] ) )
                {
                    return false;
                }
            }
        }
    }
    
    return true;
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 2
// Checksum 0x4ce15a8c, Offset: 0x2ac8
// Size: 0xb6
function block_elev_doors_internal( block, suffix )
{
    elevator_door_safety_clip = getentarray( self.targetname + suffix, "script_noteworthy" );
    
    if ( isdefined( elevator_door_safety_clip ) )
    {
        for ( i = 0; i < elevator_door_safety_clip.size ; i++ )
        {
            if ( block )
            {
                elevator_door_safety_clip[ i ] solid();
                continue;
            }
            
            elevator_door_safety_clip[ i ] notsolid();
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0x314d544, Offset: 0x2b88
// Size: 0x4c
function block_elev_doors( block )
{
    block_elev_doors_internal( block, "_safety_top" );
    block_elev_doors_internal( block, "_safety_bottom" );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x426731a8, Offset: 0x2be0
// Size: 0x54
function init_buy()
{
    trigger = getent( self.targetname + "_buy", "script_noteworthy" );
    trigger thread elevator_buy_think( self );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0xe1695c8d, Offset: 0x2c40
// Size: 0x410
function elevator_buy_think( elevator )
{
    if ( zm_utility::is_standard() )
    {
        if ( function_8b1a219a() )
        {
            level.var_31560d97 = #"hash_3e8b1cb2500ba3a7";
        }
        else
        {
            level.var_31560d97 = #"hash_146622decb4e7399";
        }
    }
    else if ( function_8b1a219a() )
    {
        level.var_31560d97 = #"hash_65d7c16bd5a94c67";
    }
    else
    {
        level.var_31560d97 = #"hash_6362bcfbec5e8759";
    }
    
    self setcursorhint( "HINT_NOICON" );
    self usetriggerrequirelookat();
    self sethintstring( level.var_31560d97, elevator.cost );
    
    while ( true )
    {
        who = undefined;
        waitresult = self waittill( #"trigger" );
        who = waitresult.activator;
        elev_clear = is_elevator_clear( elevator );
        
        if ( !elev_clear )
        {
            zm_utility::play_sound_at_pos( "no_purchase", self.origin );
            self sethintstring( #"hash_2af4a28719c51767" );
            wait 1;
            self sethintstring( level.var_31560d97, elevator.cost );
        }
        else if ( zm_utility::is_player_valid( who ) && who zm_score::can_player_purchase( elevator.cost ) && who can_buy_elevator() )
        {
            elevator.active = 1;
            who zm_score::minus_to_player_score( elevator.cost );
            zm_utility::play_sound_at_pos( "purchase", self.origin );
            elevator disable_callboxes();
            elevator disable_elevator_buys();
            call_box_array = getentarray( elevator.station, "script_noteworthy" );
            call_box = call_box_array[ 0 ];
            
            if ( call_box.script_noteworthy == elevator.targetname + "_up" )
            {
                call_box.destination = elevator.targetname + "_down";
            }
            else
            {
                call_box.destination = elevator.targetname + "_up";
            }
            
            elevator thread redirect_zombies( call_box.destination );
            self elevator_move_to( elevator );
        }
        else
        {
            zm_utility::play_sound_at_pos( "no_purchase", self.origin );
            who zm_audio::create_and_play_dialog( #"general", #"outofmoney" );
        }
        
        wait 0.05;
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x54bc4192, Offset: 0x3058
// Size: 0x26, Type: bool
function can_buy_elevator()
{
    if ( self zm_utility::in_revive_trigger() )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xd86ec0df, Offset: 0x3088
// Size: 0x86
function disable_callboxes()
{
    call_boxes = getentarray( self.targetname + "_call_box", "targetname" );
    
    for ( j = 0; j < call_boxes.size ; j++ )
    {
        call_boxes[ j ] triggerenable( 0 );
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xced3e85b, Offset: 0x3118
// Size: 0x94
function disable_elevator_buys()
{
    elevator_buy = getent( self.targetname + "_buy", "script_noteworthy" );
    elevator_buy setcursorhint( "HINT_NOICON" );
    elevator_buy sethintstring( "" );
    elevator_buy triggerenable( 0 );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x4ddaf449, Offset: 0x31b8
// Size: 0x9c
function enable_elevator_buys()
{
    elevator_buy = getent( self.targetname + "_buy", "script_noteworthy" );
    elevator_buy setcursorhint( "HINT_NOICON" );
    elevator_buy sethintstring( level.var_31560d97, self.cost );
    elevator_buy triggerenable( 1 );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x14454277, Offset: 0x3260
// Size: 0x12e
function enable_callboxes()
{
    call_boxes = getentarray( self.targetname + "_call_box", "targetname" );
    
    for ( j = 0; j < call_boxes.size ; j++ )
    {
        if ( call_boxes[ j ].script_noteworthy != self.station )
        {
            call_boxes[ j ] triggerenable( 1 );
            
            if ( function_8b1a219a() )
            {
                call_boxes[ j ] sethintstring( #"hash_4e2495c99a50f326" );
            }
            else
            {
                call_boxes[ j ] sethintstring( #"hash_2f56b9d8ac49ff92" );
            }
            
            continue;
        }
        
        call_boxes[ j ] triggerenable( 0 );
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0xdab105f1, Offset: 0x3398
// Size: 0x640
function elevator_move_to( elevator )
{
    players = getplayers();
    elevator close_elev_doors();
    level flag::clear( "spawn_zombies" );
    elevator waittill( #"doors_finished_moving" );
    elevator block_elev_doors( 0 );
    elevator notify( #"start_3d_audio" );
    elevator thread elev_clean_up_corpses();
    
    if ( elevator.station == elevator.targetname + "_up" )
    {
        if ( elevator.targetname == "elevator1" )
        {
            function_d5410733();
            elevator thread zombie_elevator_closets( 0 );
            elevator.moving_to = 3;
            
            if ( !zm_zonemgr::zone_is_enabled( "labs_elevator" ) )
            {
                zm_zonemgr::enable_zone( "labs_elevator" );
            }
        }
        else
        {
            elevator.moving_to = 2;
            function_5e62aa83();
            
            if ( !zm_zonemgr::zone_is_enabled( "war_room_zone_top" ) )
            {
                zm_zonemgr::enable_zone( "war_room_zone_top" );
            }
        }
        
        elevator vehicle::get_on_and_go_path( elevator.var_7237c31e );
        elevator waittill( #"reached_end_node" );
        elevator.station = elevator.targetname + "_down";
        
        if ( elevator.targetname == "elevator1" && !level flag::get( "labs_enabled" ) )
        {
            level flag::set( "labs_enabled" );
        }
        else if ( elevator.targetname == "elevator2" && !level flag::get( "war_room_start" ) )
        {
            level flag::set( "war_room_start" );
        }
    }
    else
    {
        if ( elevator.targetname == "elevator1" )
        {
            function_1352fc3c();
            elevator thread zombie_elevator_closets( 1 );
            elevator.moving_to = 2;
        }
        else
        {
            function_cfd40975();
            elevator.moving_to = 1;
        }
        
        elevator vehicle::get_on_and_go_path( elevator.var_5a3b55a3 );
        elevator waittill( #"reached_end_node" );
        elevator.station = elevator.targetname + "_up";
    }
    
    if ( elevator.targetname == "elevator2" )
    {
        util::clientnotify( "ele1e" );
        
        if ( elevator.station == elevator.targetname + "_up" )
        {
            function_db4ac61a();
            elevator playsound( #"hash_6dc5b145a42639b7" );
        }
        else if ( elevator.station == elevator.targetname + "_down" )
        {
            function_db4ac61a();
            elevator playsound( #"hash_3faa2aca94611bdc" );
        }
    }
    else if ( elevator.targetname == "elevator1" )
    {
        util::clientnotify( "ele2e" );
        
        if ( elevator.station == elevator.targetname + "_up" )
        {
            function_4cf5b4dd();
            elevator playsound( #"hash_3faa2aca94611bdc" );
        }
        else if ( elevator.station == elevator.targetname + "_down" )
        {
            function_4cf5b4dd();
            elevator playsound( #"hash_74f5fc759e9f23d5" );
        }
    }
    
    level flag::set( "elevator_grounded" );
    level flag::set( "spawn_zombies" );
    elevator.moving_to = undefined;
    elevator open_elev_doors();
    elevator waittill( #"doors_finished_moving" );
    elevator.called = 0;
    elevator.active = 0;
    elevator enable_elevator_buys();
    elevator enable_callboxes();
    elevator notify( #"hash_26d932820f7f5373" );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0xedba6e49, Offset: 0x39e0
// Size: 0x266
function zombie_elevator_closets( going_up )
{
    if ( !isdefined( going_up ) )
    {
        return;
    }
    
    if ( going_up == 1 )
    {
        special_spawn = getentarray( "elevator1_down_spawncloset", "targetname" );
        
        foreach ( point in level.var_fc1f5422 )
        {
            point.is_enabled = 1;
        }
        
        foreach ( point in level.var_3d9e751c )
        {
            point.is_enabled = 0;
        }
    }
    else
    {
        special_spawn = getentarray( "elevator1_up_spawncloset", "targetname" );
        
        foreach ( point in level.var_fc1f5422 )
        {
            point.is_enabled = 0;
        }
        
        foreach ( point in level.var_3d9e751c )
        {
            point.is_enabled = 1;
        }
    }
    
    if ( isdefined( special_spawn ) )
    {
        for ( i = 0; i < special_spawn.size ; i++ )
        {
            special_spawn[ i ] thread elevator_closet_cleanup();
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x91749d17, Offset: 0x3c50
// Size: 0xb8
function elevator_closet_cleanup()
{
    zombies = getaiarray();
    
    if ( !isdefined( zombies ) )
    {
        return;
    }
    
    foreach ( zombie in zombies )
    {
        if ( zombie istouching( self ) )
        {
            zombie thread zm_cleanup::cleanup_zombie();
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xfc3b062e, Offset: 0x3d10
// Size: 0xfc
function elev_clean_up_corpses()
{
    corpse_trig = getent( self.targetname + "_zombie_cleanup", "targetname" );
    corpses = getcorpsearray();
    
    if ( isdefined( corpses ) )
    {
        for ( i = 0; i < corpses.size ; i++ )
        {
            if ( corpses[ i ] istouching( corpse_trig ) )
            {
                corpses[ i ] thread elev_remove_corpses();
            }
        }
    }
    
    physicsexplosionsphere( corpse_trig.origin, 400, 0, 0.01, 0, 0 );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xcf95d4da, Offset: 0x3e18
// Size: 0x4c
function elev_remove_corpses()
{
    playfx( level._effect[ #"dog_gib" ], self.origin );
    self delete();
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x64ecbc3, Offset: 0x3e70
// Size: 0x232
function init_elevator1_doors()
{
    self.doors_up = getentarray( "elevator1_doors_up", "script_noteworthy" );
    
    for ( i = 0; i < self.doors_up.size ; i++ )
    {
        self.doors_up[ i ].startpos = self.doors_up[ i ].origin;
    }
    
    self.doors_down = getentarray( "elevator1_doors_down", "script_noteworthy" );
    
    for ( j = 0; j < self.doors_down.size ; j++ )
    {
        self.doors_down[ j ].startpos = self.doors_down[ j ].origin;
    }
    
    self.doors_outer_down = getentarray( "elevator1_outerdoors_down", "script_noteworthy" );
    
    for ( k = 0; k < self.doors_outer_down.size ; k++ )
    {
        self.doors_outer_down[ k ].startpos = self.doors_outer_down[ k ].origin;
    }
    
    self.doors_outer_up = getentarray( "elevator1_outerdoors_up", "script_noteworthy" );
    
    for ( l = 0; l < self.doors_outer_up.size ; l++ )
    {
        self.doors_outer_up[ l ].startpos = self.doors_outer_up[ l ].origin;
    }
    
    self.var_15a48007 = getent( "elev1_level2_crush", "targetname" );
    self.var_8e5e8534 = getent( "elev1_level3_crush", "targetname" );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x510e9362, Offset: 0x40b0
// Size: 0x1ba
function init_elevator2_doors()
{
    self.doors = getentarray( "elevator2_doors", "script_noteworthy" );
    
    for ( i = 0; i < self.doors.size ; i++ )
    {
        self.doors[ i ].startpos = self.doors[ i ].origin;
    }
    
    self.doors_outer_down = getentarray( "elevator2_outerdoors_down", "script_noteworthy" );
    
    for ( k = 0; k < self.doors_outer_down.size ; k++ )
    {
        self.doors_outer_down[ k ].startpos = self.doors_outer_down[ k ].origin;
    }
    
    self.doors_outer_up = getentarray( "elevator2_outerdoors_up", "script_noteworthy" );
    
    for ( l = 0; l < self.doors_outer_up.size ; l++ )
    {
        self.doors_outer_up[ l ].startpos = self.doors_outer_up[ l ].origin;
    }
    
    self.var_15a48007 = getent( "elev2_level1_crush", "targetname" );
    self.var_8e5e8534 = getent( "elev2_level2_crush", "targetname" );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x486d1b16, Offset: 0x4278
// Size: 0x56c
function close_elev_doors()
{
    self block_elev_doors( 1 );
    
    for ( i = 0; i < self.doors_outer_down.size ; i++ )
    {
        self.doors_outer_down[ i ] thread relink_elev_doors( self.doors_outer_down[ i ].startpos, self, 0 );
    }
    
    for ( j = 0; j < self.doors_outer_up.size ; j++ )
    {
        self.doors_outer_up[ j ] thread relink_elev_doors( self.doors_outer_up[ j ].startpos, self, 0 );
    }
    
    if ( isdefined( self.doors_down ) )
    {
        for ( k = 0; k < self.doors_down.size ; k++ )
        {
            newpos3 = ( self.doors_down[ k ].startpos[ 0 ], self.doors_down[ k ].startpos[ 1 ], self.doors_down[ k ].origin[ 2 ] );
            self.doors_down[ k ] thread relink_elev_doors( newpos3, self, 1 );
            playsoundatposition( #"evt_elevator_freight_door_close", newpos3 );
        }
    }
    
    if ( isdefined( self.doors_up ) )
    {
        for ( l = 0; l < self.doors_up.size ; l++ )
        {
            newpos4 = ( self.doors_up[ l ].startpos[ 0 ], self.doors_up[ l ].startpos[ 1 ], self.doors_up[ l ].origin[ 2 ] );
            self.doors_up[ l ] thread relink_elev_doors( newpos4, self, 1 );
            playsoundatposition( #"evt_elevator_freight_door_close", newpos4 );
        }
        
        if ( self.station == self.targetname + "_down" )
        {
            nd_elev1_in_labs = getnode( "nd_elev1_in_labs", "targetname" );
            
            if ( isdefined( nd_elev1_in_labs ) )
            {
                unlinktraversal( nd_elev1_in_labs );
                self thread function_eee9c340( 0 );
            }
        }
        else
        {
            nd_elev1_in_war_room = getnode( "nd_elev1_in_war_room", "targetname" );
            
            if ( isdefined( nd_elev1_in_war_room ) )
            {
                unlinktraversal( nd_elev1_in_war_room );
                self thread function_eee9c340( 1 );
            }
        }
    }
    
    if ( isdefined( self.doors ) )
    {
        for ( m = 0; m < self.doors.size ; m++ )
        {
            if ( self.station == self.targetname + "_up" )
            {
                newpos5 = self.doors[ m ].startpos;
            }
            else
            {
                newpos5 = ( self.doors[ m ].startpos[ 0 ], self.doors[ m ].startpos[ 1 ], self.doors[ m ].origin[ 2 ] );
            }
            
            self.doors[ m ] thread relink_elev_doors( newpos5, self, 1 );
            playsoundatposition( #"evt_elevator_office_door_close", newpos5 );
        }
        
        if ( self.station == self.targetname + "_down" )
        {
            nd_elev2_in_war_room = getnode( "nd_elev2_in_war_room", "targetname" );
            
            if ( isdefined( nd_elev2_in_war_room ) )
            {
                unlinktraversal( nd_elev2_in_war_room );
                self thread function_eee9c340( 0 );
            }
            
            return;
        }
        
        nd_elev2_in_level1 = getnode( "nd_elev2_in_level1", "targetname" );
        
        if ( isdefined( nd_elev2_in_level1 ) )
        {
            unlinktraversal( nd_elev2_in_level1 );
            self thread function_eee9c340( 1 );
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x32c46526, Offset: 0x47f0
// Size: 0x7ec
function open_elev_doors()
{
    if ( self.station == self.targetname + "_down" )
    {
        for ( j = 0; j < self.doors_outer_down.size ; j++ )
        {
            newpos1 = self.doors_outer_down[ j ].startpos + self.doors_outer_down[ j ].script_vector;
            self.doors_outer_down[ j ] thread relink_elev_doors( newpos1, self, 0 );
        }
        
        if ( isdefined( self.doors_up ) )
        {
            for ( i = 0; i < self.doors_up.size ; i++ )
            {
                pos2 = self.doors_up[ i ].startpos + self.doors_up[ i ].script_vector;
                newpos2 = ( pos2[ 0 ], pos2[ 1 ], self.doors_up[ i ].origin[ 2 ] );
                self.doors_up[ i ] thread relink_elev_doors( newpos2, self, 1 );
                playsoundatposition( #"evt_elevator_freight_door_open", newpos2 );
            }
        }
        
        if ( isdefined( self.doors_down ) )
        {
            for ( i = 0; i < self.doors_down.size ; i++ )
            {
                pos1 = self.doors_down[ i ].startpos + self.doors_down[ i ].script_vector;
                newpos = ( pos1[ 0 ], pos1[ 1 ], self.doors_down[ i ].origin[ 2 ] );
                self.doors_down[ i ] thread relink_elev_doors( newpos, self, 1 );
                playsoundatposition( #"evt_elevator_freight_door_open", newpos );
            }
            
            nd_elev1_in_labs = getnode( "nd_elev1_in_labs", "targetname" );
            
            if ( isdefined( nd_elev1_in_labs ) )
            {
                linktraversal( nd_elev1_in_labs );
            }
        }
        
        if ( isdefined( self.doors ) )
        {
            for ( m = 0; m < self.doors.size ; m++ )
            {
                pos2 = self.doors[ m ].startpos + self.doors[ m ].script_vector;
                
                if ( self.station == self.targetname + "_up" )
                {
                    newpos2 = ( pos2[ 0 ], pos2[ 1 ], self.doors[ m ].startpos[ 2 ] );
                }
                else
                {
                    newpos2 = ( pos2[ 0 ], pos2[ 1 ], self.doors[ m ].origin[ 2 ] );
                }
                
                self.doors[ m ] thread relink_elev_doors( newpos2, self, 1 );
                playsoundatposition( #"hash_5ef3b0941ea2aa74", newpos2 );
            }
            
            nd_elev2_in_war_room = getnode( "nd_elev2_in_war_room", "targetname" );
            
            if ( isdefined( nd_elev2_in_war_room ) )
            {
                linktraversal( nd_elev2_in_war_room );
            }
        }
        
        return;
    }
    
    for ( j = 0; j < self.doors_outer_up.size ; j++ )
    {
        newpos1 = self.doors_outer_up[ j ].startpos + self.doors_outer_up[ j ].script_vector;
        self.doors_outer_up[ j ] thread relink_elev_doors( newpos1, self, 0 );
    }
    
    if ( isdefined( self.doors_up ) )
    {
        for ( i = 0; i < self.doors_up.size ; i++ )
        {
            pos2 = self.doors_up[ i ].startpos + self.doors_up[ i ].script_vector;
            newpos2 = ( pos2[ 0 ], pos2[ 1 ], self.doors_up[ i ].origin[ 2 ] );
            self.doors_up[ i ] thread relink_elev_doors( newpos2, self, 1 );
            playsoundatposition( #"evt_elevator_freight_door_open", newpos2 );
        }
    }
    
    if ( isdefined( self.doors_down ) )
    {
        for ( k = 0; k < self.doors_down.size ; k++ )
        {
            pos4 = self.doors_down[ k ].startpos + self.doors_down[ k ].script_vector;
            newpos4 = ( pos4[ 0 ], pos4[ 1 ], self.doors_down[ k ].origin[ 2 ] );
            self.doors_down[ k ] thread relink_elev_doors( newpos4, self, 1 );
            playsoundatposition( #"evt_elevator_freight_door_open", newpos4 );
        }
        
        nd_elev1_in_war_room = getnode( "nd_elev1_in_war_room", "targetname" );
        
        if ( isdefined( nd_elev1_in_war_room ) )
        {
            linktraversal( nd_elev1_in_war_room );
        }
    }
    
    if ( isdefined( self.doors ) )
    {
        for ( m = 0; m < self.doors.size ; m++ )
        {
            pos3 = self.doors[ m ].startpos + self.doors[ m ].script_vector;
            newpos3 = ( pos3[ 0 ], pos3[ 1 ], self.doors[ m ].origin[ 2 ] );
            self.doors[ m ] thread relink_elev_doors( newpos3, self, 1 );
            playsoundatposition( #"hash_5ef3b0941ea2aa74", newpos3 );
        }
        
        nd_elev2_in_level1 = getnode( "nd_elev2_in_level1", "targetname" );
        
        if ( isdefined( nd_elev2_in_level1 ) )
        {
            linktraversal( nd_elev2_in_level1 );
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 3
// Checksum 0x22b872c1, Offset: 0x4fe8
// Size: 0xb6
function relink_elev_doors( pos, elev, linked )
{
    self unlink();
    self moveto( pos, 1 );
    self waittill( #"movedone" );
    
    if ( linked )
    {
        self linkto( elev );
    }
    
    elev notify( #"doors_finished_moving" );
    
    if ( self.classname == "script_model" )
    {
        return;
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0x8489203f, Offset: 0x50a8
// Size: 0x174
function redirect_zombies( destination )
{
    players = getplayers();
    num_players = 0;
    
    for ( i = 0; i < players.size ; i++ )
    {
        if ( players[ i ] istouching( self ) )
        {
            num_players++;
        }
    }
    
    if ( !num_players == players.size )
    {
        return;
    }
    
    wait 2;
    location = getnode( destination, "targetname" );
    
    if ( isdefined( location ) )
    {
        poi = spawn( "script_origin", location.origin );
        poi zm_utility::create_zombie_point_of_interest( undefined, 25, 0, 1 );
        level flag::wait_till( "elevator_grounded" );
        poi zm_utility::deactivate_zombie_point_of_interest();
        poi delete();
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x42972ba2, Offset: 0x5228
// Size: 0x12e
function unlock_players()
{
    players = getplayers();
    
    for ( i = 0; i < players.size ; i++ )
    {
        players[ i ] unlink();
        players[ i ] allowcrouch( 1 );
        players[ i ] allowprone( 1 );
        players[ i ] disableinvulnerability();
        
        /#
            if ( getdvarint( #"zombie_cheat", 0 ) >= 1 && getdvarint( #"zombie_cheat", 0 ) <= 3 )
            {
                players[ i ] enableinvulnerability();
            }
        #/
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x68625a87, Offset: 0x5360
// Size: 0x140
function elevator1_3d_audio()
{
    while ( true )
    {
        self waittill( #"start_3d_audio" );
        ent = spawn( "script_origin", self.origin + ( 0, 0, 30 ) );
        ent linkto( self );
        ent playsound( "evt_elevator_freight_start" );
        ent playloopsound( "evt_elevator_freight_run_3d" );
        self waittill( #"reached_end_node" );
        ent delete();
        playsoundatposition( #"evt_elevator_freight_stop", self.origin );
        playsoundatposition( #"hash_5bbffe8bd9e541a7", self.origin + ( 0, 0, 120 ) );
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x26bd163, Offset: 0x54a8
// Size: 0x118
function elevator2_3d_audio()
{
    while ( true )
    {
        self waittill( #"start_3d_audio" );
        ent = spawn( "script_origin", self.origin + ( 0, 0, 30 ) );
        ent linkto( self );
        ent playsound( #"evt_elevator_office_start" );
        ent playloopsound( #"hash_3a6fc5051c04a776" );
        self waittill( #"reached_end_node" );
        ent delete();
        playsoundatposition( #"hash_b696d1d50b35e32", self.origin + ( 0, 0, 120 ) );
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1
// Checksum 0x4d39e7e0, Offset: 0x55c8
// Size: 0x130
function function_eee9c340( var_73803951 )
{
    if ( var_73803951 )
    {
        test_vol = self.var_15a48007;
    }
    else
    {
        test_vol = self.var_8e5e8534;
    }
    
    wait 0.6;
    
    foreach ( ai in getaiarray() )
    {
        if ( isdefined( ai.allowdeath ) && !ai.allowdeath )
        {
            continue;
        }
        
        if ( ai istouching( test_vol ) && ai.missinglegs === 1 )
        {
            ai zombie_utility::zombie_head_gib();
            ai kill();
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0xd98f182a, Offset: 0x5700
// Size: 0x5ec
function function_dec13a5b()
{
    level endon( #"end_game" );
    self notify( "19e5073d3e85ec91" );
    self endon( "19e5073d3e85ec91" );
    
    while ( true )
    {
        level waittill( #"host_migration_begin" );
        a_players = getplayers();
        
        foreach ( player in a_players )
        {
            player val::set( "host_migration", "allowdeath", 0 );
            player val::set( "host_migration", "takedamage", 0 );
        }
        
        level waittill( #"host_migration_end" );
        level thread function_1576e092();
        wait 1.5;
        a_players = getplayers();
        var_ed7230a5 = [];
        
        foreach ( e_player in a_players )
        {
            var_fb783f78 = 0;
            
            if ( distance2d( e_player.origin, level.elevator1.origin ) < 80 || distance2d( e_player.origin, level.elevator2.origin ) < 80 )
            {
                var_fb783f78 = 1;
            }
            
            str_zone = zm_zonemgr::function_49d8d29f( e_player.origin );
            
            if ( !( isdefined( e_player zm_utility::in_playable_area() ) && e_player zm_utility::in_playable_area() ) || !isdefined( str_zone ) && isdefined( var_fb783f78 ) && var_fb783f78 )
            {
                a_s_pos = struct::get_array( "player_respawn_point", "targetname" );
                a_s_pos = arraysortclosest( a_s_pos, e_player.origin );
                
                foreach ( s_pos in a_s_pos )
                {
                    a_s_points = struct::get_array( s_pos.target );
                    a_s_points = arraysortclosest( a_s_points, player.origin );
                    
                    foreach ( s_pos in a_s_points )
                    {
                        if ( !isinarray( var_ed7230a5, s_pos ) && zm_utility::check_point_in_enabled_zone( s_pos.origin ) && zm_utility::check_point_in_playable_area( s_pos.origin ) )
                        {
                            player thread function_da48c149( s_pos );
                            player.b_teleported = 1;
                            
                            if ( !isdefined( var_ed7230a5 ) )
                            {
                                var_ed7230a5 = [];
                            }
                            else if ( !isarray( var_ed7230a5 ) )
                            {
                                var_ed7230a5 = array( var_ed7230a5 );
                            }
                            
                            var_ed7230a5[ var_ed7230a5.size ] = s_pos;
                            break;
                        }
                    }
                    
                    if ( isdefined( player.b_teleported ) && player.b_teleported )
                    {
                        player.b_teleported = undefined;
                        break;
                    }
                }
            }
        }
        
        wait 5;
        a_players = getplayers();
        
        foreach ( player in a_players )
        {
            player val::reset( "host_migration", "allowdeath" );
            player val::reset( "host_migration", "takedamage" );
        }
    }
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 1, eflags: 0x4
// Checksum 0x53c5db9, Offset: 0x5cf8
// Size: 0xd0
function private function_da48c149( s_pos )
{
    n_attempts = 0;
    self dontinterpolate();
    self setorigin( s_pos.origin );
    
    do
    {
        wait 1;
        
        if ( !( isdefined( self zm_utility::in_playable_area() ) && self zm_utility::in_playable_area() ) )
        {
            self dontinterpolate();
            self setorigin( s_pos.origin );
        }
        
        n_attempts++;
    }
    while ( n_attempts < 5 );
}

// Namespace zm_office_elevators/zm_office_elevators
// Params 0
// Checksum 0x9b76a638, Offset: 0x5dd0
// Size: 0x578
function function_1576e092()
{
    var_844f2ba7 = getent( "fx_light_elevator_origin", "targetname" );
    
    if ( isdefined( var_844f2ba7.fx_ent ) )
    {
        var_844f2ba7.elevator_fx_light = playfxontag( level.fx_elevator_light, var_844f2ba7.fx_ent, "tag_origin" );
        var_844f2ba7.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    }
    
    var_428c7836 = getent( "fx_light_elevator1_origin", "targetname" );
    
    if ( isdefined( var_428c7836.fx_ent ) )
    {
        var_428c7836.var_286bc7b5 = playfxontag( level.var_41a1bc06, var_428c7836.fx_ent, "tag_origin" );
        var_428c7836.var_286bc7b5 linkto( level.a_e_elevator1[ 0 ] );
    }
    
    var_71ffef77 = getent( "lgt_elevator_panel_illum_origin", "targetname" );
    
    if ( isdefined( var_71ffef77.fx_ent ) )
    {
        var_71ffef77.elevator_fx_light = playfxontag( level.var_e33251c7, var_71ffef77.fx_ent, "tag_origin" );
        var_71ffef77.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    }
    
    var_b15265f4 = getent( "lgt_elevator_panel_caster_origin", "targetname" );
    
    if ( isdefined( var_b15265f4.fx_ent ) )
    {
        var_b15265f4.elevator_fx_light = playfxontag( level.var_715ae9f9, var_b15265f4.fx_ent, "tag_origin" );
        var_b15265f4.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
    }
    
    cp_safehouse_training_nextround_traversal = getent( "lgt_elevator2_panel_illum_origin", "targetname" );
    
    if ( isdefined( cp_safehouse_training_nextround_traversal.fx_ent ) )
    {
        cp_safehouse_training_nextround_traversal.elevator_fx_light = playfxontag( level.var_e33251c7, cp_safehouse_training_nextround_traversal.fx_ent, "tag_origin" );
        cp_safehouse_training_nextround_traversal.elevator_fx_light linkto( level.a_e_elevator1[ 0 ] );
    }
    
    var_c95e76a9 = getent( "lgt_elevator2_panel_caster_origin", "targetname" );
    
    if ( isdefined( var_c95e76a9.fx_ent ) )
    {
        var_c95e76a9.elevator_fx_light = playfxontag( level.var_715ae9f9, var_c95e76a9.fx_ent, "tag_origin" );
        var_c95e76a9.elevator_fx_light linkto( level.a_e_elevator1[ 0 ] );
    }
    
    var_844f2f0a = getentarray( "fx_light_illum_elevator_origin", "targetname" );
    var_6d00692f = getentarray( "fx_light_illum_elevator2_origin", "targetname" );
    
    foreach ( e_light in var_844f2f0a )
    {
        if ( isdefined( e_light.fx_ent ) )
        {
            e_light.elevator_fx_light = playfxontag( level.var_dca712ff, e_light.fx_ent, "tag_origin" );
            e_light.elevator_fx_light linkto( level.a_e_elevator[ 0 ] );
        }
    }
    
    foreach ( e_light in var_6d00692f )
    {
        if ( isdefined( e_light.fx_ent ) )
        {
            e_light.elevator_fx_light = playfxontag( level.var_8caf5068, e_light.fx_ent, "tag_origin" );
            e_light.elevator_fx_light linkto( level.a_e_elevator1[ 0 ] );
        }
    }
}

