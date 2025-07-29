#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\trigger_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_towers_crowd;
#using scripts\zm\zm_towers_util;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_crafting;
#using scripts\zm_common\zm_magicbox;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_sq;
#using scripts\zm_common\zm_ui_inventory;
#using scripts\zm_common\zm_unitrigger;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_vo;
#using scripts\zm_common\zm_weapons;

#namespace zm_towers_ww_quest;

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xeb10a09d, Offset: 0x548
// Size: 0xb0c
function init()
{
    level._effect[ #"hash_42cc4bf5e47478c5" ] = #"hash_387c78244f5f45e5";
    level._effect[ #"hash_5b4e7c178480d885" ] = #"hash_62eafc17a432322a";
    level flag::init( #"hash_57454e59c155098d" );
    level flag::init( #"hash_2fb4b4431d3ed627" );
    level flag::init( #"hash_40f20925227353f4" );
    level flag::init( #"hash_5cdf5c960293141a" );
    level flag::init( #"hash_6af037519dceda7a" );
    level flag::init( #"hash_30e0e4bbbfc9b7d8" );
    level flag::init( #"hash_d9ce740cc4b8285" );
    level flag::init( #"hash_200151b21f16734f" );
    level flag::init( #"hash_45259bb6368fc0d3" );
    level flag::init( #"hash_5649f57b918f85f8" );
    level flag::init( #"hash_30ca6a723fbb84e9" );
    level flag::init( #"hash_1c66e5c351c08de1" );
    level flag::init( #"hash_77ff9a8101ea687b" );
    level flag::init( #"hash_631e8676a2fa932b" );
    level flag::init( #"hash_3ac6f9944962bd4c" );
    level flag::init( #"hash_786b9153c754d127" );
    level flag::init( #"hash_17f15c9242ddea6f" );
    level flag::init( #"hash_70b6094c8cd39890" );
    zm_sq::register( #"ww_quest", #"destroy_wall", #"destroy_wall", &destroy_wall_setup, &destroy_wall_cleanup );
    zm_sq::register( #"ww_quest", #"knock_brazier", #"knock_brazier", &knock_brazier_setup, &knock_brazier_cleanup );
    zm_sq::register( #"ww_quest", #"hash_32b57ffc37ccf79a", #"hash_32b57ffc37ccf79a", &function_26956e1e, &function_4f056f0c );
    zm_sq::register( #"ww_quest", #"hash_2e681afa5f81f37", #"hash_2e681afa5f81f37", &function_708cd4d, &function_c4e5bf05 );
    zm_sq::register( #"ww_quest", #"hash_27967f916a97a057", #"hash_27967f916a97a057", &function_2eea86a9, &function_57b4770f );
    zm_sq::register( #"ww_quest", #"hash_34d18772151ea4fa", #"hash_34d18772151ea4fa", &function_a1e2245, &function_e02f2459 );
    zm_sq::register( #"ww_quest", #"hash_2e126c422fbf5654", #"hash_2e126c422fbf5654", &function_9ef8d102, &function_1c380f29 );
    zm_sq::register( #"ww_quest", #"hash_396293edac63aa6f", #"hash_396293edac63aa6f", &function_dd053937, &function_4509873 );
    zm_sq::register( #"ww_quest", #"hash_776efec5f9b03a68", #"hash_776efec5f9b03a68", &function_a616131a, &function_605806f );
    zm_sq::register( #"ww_quest", #"hash_7e929133c03a391b", #"hash_7e929133c03a391b", &function_ac4e38bc, &function_8c32234c );
    zm_sq::register( #"ww_quest", #"place_impervious_jar", #"place_impervious_jar", &function_ec26e009, &function_4877f171 );
    zm_sq::register( #"ww_quest", #"hash_530b93342f7f39ae", #"hash_530b93342f7f39ae", &function_bbdde10e, &function_40f77b4a );
    zm_sq::register( #"ww_quest", #"hash_38a9bcd55c0565ca", #"hash_38a9bcd55c0565ca", &function_ab13e06, &function_868dcb6d );
    zm_sq::register( #"ww_quest", #"hash_2512f1281c5c7237", #"hash_2512f1281c5c7237", &function_869d271a, &function_79875787 );
    zm_sq::register( #"ww_quest", #"hash_4e767f415b51d0a1", #"hash_4e767f415b51d0a1", &function_3cadd22, &function_f04288b4 );
    zm_sq::start( #"ww_quest", 1 );
    level scene::add_scene_func( "p8_fxanim_zm_towers_ww_quest_bowl_bundle", &function_73808ab9, "init" );
    var_85034658 = array( "danu", "ra", "odin", "zeus" );
    level.var_9f950fe2 = array::random( var_85034658 );
    var_d3b8df9 = var_85034658;
    arrayremovevalue( var_d3b8df9, level.var_9f950fe2 );
    
    foreach ( var_8cac5c1e in var_d3b8df9 )
    {
        s_unitrigger = struct::get( "s_ww_quest_rough_statue_unitrigger_" + var_8cac5c1e );
        var_1fd4478b = struct::get( s_unitrigger.target );
        var_1fd4478b struct::delete();
        s_unitrigger struct::delete();
    }
    
    var_1fd4478b = struct::get( "s_ww_quest_rough_statue_" + level.var_9f950fe2 );
    v_origin = var_1fd4478b.origin;
    v_angles = var_1fd4478b.angles;
    var_1fd4478b struct::delete();
    level.var_240da80 = util::spawn_model( #"p8_zm_gla_spile_serket_head_01", v_origin, v_angles );
    a_s_acid_traps = struct::get_array( "s_ww_quest_acid_trap_unitrigger" );
    array::thread_all( a_s_acid_traps, &function_a58dfad4 );
    zm_crafting::function_d1f16587( #"zblueprint_trap_hellpools", &function_b4bc6524 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x9a979a7d, Offset: 0x1060
// Size: 0x13c
function function_73808ab9( a_ents )
{
    mdl_brazier = a_ents[ #"prop 1" ];
    s_fx = struct::get( #"hash_495fb43788e05676" );
    mdl_fx = util::spawn_model( "tag_origin", s_fx.origin, s_fx.angles );
    s_fx struct::delete();
    mdl_fx linkto( mdl_brazier, "tag_fx_jnt" );
    mdl_fx clientfield::set( "" + #"hash_42cc4bf5e47478c5", 1 );
    level.var_1285519 = mdl_fx;
    level scene::remove_scene_func( "p8_fxanim_zm_towers_ww_quest_bowl_bundle", &function_73808ab9, "init" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xdbb1566c, Offset: 0x11a8
// Size: 0x34
function destroy_wall_setup( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    level flag::wait_till( "zm_towers_pap_quest_completed" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0xf2868c1a, Offset: 0x11e8
// Size: 0x34
function destroy_wall_cleanup( b_skipped, var_19e802fa )
{
    level thread scene::play( "p8_fxanim_zm_towers_ww_quest_wall_bundle" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x6499aed0, Offset: 0x1228
// Size: 0x4c
function knock_brazier_setup( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    t_trigger = trigger::wait_till( "t_ww_quest_knock_brazier" );
    level thread function_be25f239();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x9fa98775, Offset: 0x1280
// Size: 0x204
function knock_brazier_cleanup( b_skipped, var_19e802fa )
{
    wait 0.05;
    level.var_1285519 clientfield::set( "" + #"hash_42cc4bf5e47478c5", 0 );
    level.var_1285519 clientfield::set( "" + #"hash_3b746cf6eec416b2", 1 );
    level scene::play( "p8_fxanim_zm_towers_ww_quest_bowl_bundle" );
    level clientfield::set( "" + #"hash_584e8f7433246444", 1 );
    level flag::set( #"hash_17f15c9242ddea6f" );
    wait 1;
    
    switch ( level.var_9f950fe2 )
    {
        case #"danu":
            str_clientfield = "" + #"hash_418c1c843450232b";
            break;
        case #"ra":
            str_clientfield = "" + #"hash_4d547bf36c6cb2d8";
            break;
        case #"odin":
            str_clientfield = "" + #"hash_38ba3ad0902aa355";
            break;
        case #"zeus":
            str_clientfield = "" + #"hash_24d7233bb17e6558";
            break;
    }
    
    level clientfield::set( str_clientfield, 1 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x21b1bf5c, Offset: 0x1490
// Size: 0x13c
function function_be25f239()
{
    level endon( #"hash_70b6094c8cd39890", #"hash_9b33f522f6f1424", #"end_game" );
    var_7ccafcfd = getent( "t_l_t_w_w_q", "targetname" );
    level flag::wait_till( #"hash_17f15c9242ddea6f" );
    s_info = var_7ccafcfd waittill( #"trigger" );
    e_player = s_info.activator;
    level.var_b2b15659 = 1;
    e_player thread zm_audio::create_and_play_dialog( #"fire_trail", #"active", undefined, 0 );
    level.var_b2b15659 = 0;
    level flag::set( #"hash_70b6094c8cd39890" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xd3da7508, Offset: 0x15d8
// Size: 0x94
function function_26956e1e( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    s_loc = struct::get( "s_ww_quest_rough_statue_unitrigger_" + level.var_9f950fe2 );
    e_player = s_loc zm_unitrigger::function_fac87205( &function_bdcb6aac );
    level notify( #"hash_9b33f522f6f1424" );
    e_player thread function_710d3ac7();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x73e94bb4, Offset: 0x1678
// Size: 0x4a
function function_710d3ac7()
{
    level.var_b2b15659 = 1;
    self zm_vo::function_a2bd5a0c( #"hash_7cddd6b0ff9e4d32", 0, 0, 9999, 1 );
    level.var_b2b15659 = 0;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xf6986df9, Offset: 0x16d0
// Size: 0x7a
function function_bdcb6aac( e_player )
{
    if ( !isplayer( e_player ) || !isdefined( level.var_240da80 ) )
    {
        return 0;
    }
    
    var_5168e40f = e_player zm_utility::is_player_looking_at( level.var_240da80.origin, 0.9, 0 );
    return var_5168e40f;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0xce61379f, Offset: 0x1758
// Size: 0x74
function function_4f056f0c( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_5cdf5c960293141a" );
    level.var_240da80 delete();
    level zm_ui_inventory::function_7df6bb60( #"hash_46e7cf2b7aa7c22", 1 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x4a3cb033, Offset: 0x17d8
// Size: 0xde
function function_a58dfad4()
{
    a_s_parts = struct::get_array( self.target );
    
    foreach ( s_part in a_s_parts )
    {
        switch ( s_part.script_noteworthy )
        {
            case #"rough_statue":
                self.var_9ce49aba = s_part;
                break;
            case #"serket_spile":
                self.var_b56f9e01 = s_part;
                break;
        }
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x51bc86fc, Offset: 0x18c0
// Size: 0x44
function function_b4bc6524()
{
    str_tower = self.script_noteworthy;
    level.var_708e0925 = str_tower;
    level flag::set( #"hash_57454e59c155098d" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x8d84e57b, Offset: 0x1910
// Size: 0x34
function function_708cd4d( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    level flag::wait_till( #"hash_57454e59c155098d" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x50a20a49, Offset: 0x1950
// Size: 0x39c
function function_c4e5bf05( b_skipped, var_19e802fa )
{
    if ( ( b_skipped || var_19e802fa ) && !isdefined( level.var_708e0925 ) )
    {
        level.var_708e0925 = "ra";
        var_c65eed8e = getentarray( "zm_towers_hellpool_ra", "script_noteworthy" );
        
        foreach ( part in var_c65eed8e )
        {
            if ( part trigger::is_trigger_of_type( "trigger_use_new" ) )
            {
                part triggerenable( 1 );
                continue;
            }
            
            part show();
        }
        
        zm_crafting::function_ca244624( #"zblueprint_trap_hellpools" );
        
        /#
            iprintlnbold( "<dev string:x38>" );
        #/
    }
    
    s_unitrigger = struct::get( level.var_708e0925, "script_ww_quest_acid_trap_unitrigger" );
    level.var_2ea12e52 = s_unitrigger;
    level.var_968b0184 = s_unitrigger.var_9ce49aba;
    level.var_1f5e01af = s_unitrigger.var_b56f9e01;
    var_70d5933e = array( "danu", "ra", "odin", "zeus" );
    arrayremovevalue( var_70d5933e, level.var_708e0925 );
    
    foreach ( var_f4dad7ae in var_70d5933e )
    {
        s_acid_trap = struct::get( var_f4dad7ae, "script_ww_quest_acid_trap_unitrigger" );
        a_s_parts = struct::get_array( s_acid_trap.target );
        
        foreach ( s_part in a_s_parts )
        {
            s_part struct::delete();
        }
        
        s_acid_trap struct::delete();
    }
    
    level flag::set( #"hash_57454e59c155098d" );
    level thread function_d7f0e50e();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xe5468ba, Offset: 0x1cf8
// Size: 0x7c
function function_2eea86a9( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    level.var_2ea12e52 zm_unitrigger::create( &function_1308049e, 128 );
    level thread function_4c3928a2();
    level flag::wait_till( #"hash_6af037519dceda7a" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x592a7988, Offset: 0x1d80
// Size: 0x10c
function function_57b4770f( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_6af037519dceda7a" );
    v_origin = level.var_968b0184.origin;
    v_angles = level.var_968b0184.angles;
    level.var_968b0184 struct::delete();
    level.var_ea8de547 = util::spawn_model( #"p8_zm_gla_spile_serket_head_01", v_origin, v_angles );
    level zm_ui_inventory::function_7df6bb60( #"hash_46e7cf2b7aa7c22", 0 );
    
    if ( !b_skipped )
    {
        zm_unitrigger::unregister_unitrigger( level.var_2ea12e52.s_unitrigger );
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x38f28e39, Offset: 0x1e98
// Size: 0x4a
function function_1308049e( e_player )
{
    var_5168e40f = e_player zm_utility::is_player_looking_at( level.var_968b0184.origin, 0.9, 0 );
    return var_5168e40f;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x7d5a80a2, Offset: 0x1ef0
// Size: 0x148
function function_d7f0e50e()
{
    level endon( #"hash_30e0e4bbbfc9b7d8" );
    
    while ( true )
    {
        s_notify = level waittill( #"trap_activated" );
        e_trap = s_notify.trap;
        
        if ( isdefined( e_trap ) )
        {
            str_type = e_trap.script_noteworthy;
            
            if ( str_type === "hellpool" )
            {
                level flag::set( #"hash_40f20925227353f4" );
                b_active = 1;
                str_id = e_trap.script_string;
                
                while ( b_active )
                {
                    s_notify = level waittill( #"traps_cooldown" );
                    
                    if ( s_notify.var_be3f58a === str_id )
                    {
                        b_active = 0;
                        break;
                    }
                }
                
                level flag::clear( #"hash_40f20925227353f4" );
            }
        }
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x7e8fafff, Offset: 0x2040
// Size: 0x5c
function function_4c3928a2( notifyhash )
{
    level endon( #"hash_6af037519dceda7a" );
    level flag::wait_till_clear( #"hash_40f20925227353f4" );
    level thread function_7ffb149d();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x598b6eca, Offset: 0x20a8
// Size: 0x6c
function function_7ffb149d()
{
    level endoncallback( &function_4c3928a2, #"hash_40f20925227353f4" );
    level.var_2ea12e52 waittill( #"trigger_activated" );
    level flag::set( #"hash_6af037519dceda7a" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x7ad755c6, Offset: 0x2120
// Size: 0x72
function function_a1e2245( b_skipped )
{
    if ( !b_skipped )
    {
        level flag::wait_till( #"hash_40f20925227353f4" );
        wait 2;
        level.var_ea8de547 clientfield::increment( "" + #"ww_quest_melting" );
        wait 3;
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x7caa74c7, Offset: 0x21a0
// Size: 0xbc
function function_e02f2459( b_skipped, var_19e802fa )
{
    v_origin = level.var_1f5e01af.origin;
    v_angles = level.var_1f5e01af.angles;
    level.var_1f5e01af struct::delete();
    level.var_f49fd32c = util::spawn_model( #"p8_zm_gla_spile_serket_01", v_origin, v_angles );
    level.var_ea8de547 delete();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xf9130e75, Offset: 0x2268
// Size: 0x9c
function function_9ef8d102( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    level flag::wait_till_clear( #"hash_40f20925227353f4" );
    level.var_2ea12e52 zm_unitrigger::create( &function_69a2caa1, 128 );
    level thread function_7df5ca0b();
    level flag::wait_till( #"hash_30e0e4bbbfc9b7d8" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0xe089b259, Offset: 0x2310
// Size: 0xb4
function function_1c380f29( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_30e0e4bbbfc9b7d8" );
    level.var_2ea12e52 struct::delete();
    level.var_f49fd32c delete();
    level zm_ui_inventory::function_7df6bb60( #"hash_46e7cf2b7aa7c22", 2 );
    
    if ( !b_skipped )
    {
        zm_unitrigger::unregister_unitrigger( level.var_2ea12e52.s_unitrigger );
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xe53f9795, Offset: 0x23d0
// Size: 0x72
function function_69a2caa1( e_player )
{
    var_7b371ada = level.var_f49fd32c;
    var_5168e40f = 0;
    
    if ( isdefined( var_7b371ada ) && isdefined( e_player ) )
    {
        var_5168e40f = e_player zm_utility::is_player_looking_at( var_7b371ada.origin, 0.9, 0 );
    }
    
    return var_5168e40f;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xfc6b8e4c, Offset: 0x2450
// Size: 0x5c
function function_7df5ca0b( notifyhash )
{
    level endon( #"hash_30e0e4bbbfc9b7d8" );
    level flag::wait_till_clear( #"hash_40f20925227353f4" );
    level thread function_10692994();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x4d4de80e, Offset: 0x24b8
// Size: 0xd2
function function_10692994()
{
    level endoncallback( &function_7df5ca0b, #"hash_40f20925227353f4" );
    s_waitresult = level.var_2ea12e52 waittill( #"trigger_activated" );
    level flag::set( #"hash_30e0e4bbbfc9b7d8" );
    e_player = s_waitresult.e_who;
    level.var_b2b15659 = 1;
    e_player zm_vo::function_a2bd5a0c( #"hash_79d38c133d9291c4", 0, 0, 9999, 1 );
    level.var_b2b15659 = 0;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x3a57d976, Offset: 0x2598
// Size: 0x2f6
function function_dd053937( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    var_a0788e41 = 1;
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            var_a0788e41 = 0;
        }
    #/
    
    enable_despawn = 0;
    
    while ( !enable_despawn )
    {
        var_ecc87a75 = 0;
        
        while ( !var_ecc87a75 )
        {
            var_9345b0e9 = [];
            
            if ( var_a0788e41 )
            {
                level waittill( #"start_of_round" );
            }
            
            foreach ( e_player in util::get_active_players() )
            {
                var_7df228aa = e_player.var_7df228aa;
                
                if ( isdefined( var_7df228aa ) )
                {
                    var_def266a8 = var_7df228aa.var_def266a8;
                    
                    if ( e_player zm_towers_crowd::function_aa0b6eb() )
                    {
                        if ( !isdefined( var_9345b0e9 ) )
                        {
                            var_9345b0e9 = [];
                        }
                        else if ( !isarray( var_9345b0e9 ) )
                        {
                            var_9345b0e9 = array( var_9345b0e9 );
                        }
                        
                        var_9345b0e9[ var_9345b0e9.size ] = e_player;
                    }
                }
            }
            
            if ( var_9345b0e9.size > 0 )
            {
                var_ecc87a75 = 1;
                break;
            }
            
            waitframe( 1 );
        }
        
        level flag::clear( #"hash_d9ce740cc4b8285" );
        level thread function_963a76cf();
        
        foreach ( e_player in var_9345b0e9 )
        {
            if ( isdefined( e_player ) )
            {
                e_player thread function_6f7d36ec();
            }
        }
        
        level flag::wait_till_any( array( #"hash_d9ce740cc4b8285", #"hash_200151b21f16734f" ) );
        
        if ( level flag::get( #"hash_200151b21f16734f" ) )
        {
            enable_despawn = 1;
            break;
        }
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x3947a1b7, Offset: 0x2898
// Size: 0x34
function function_4509873( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_200151b21f16734f" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xd8830724, Offset: 0x28d8
// Size: 0x54
function function_963a76cf()
{
    level endon( #"hash_d9ce740cc4b8285" );
    level waittill( #"end_of_round" );
    level flag::set( #"hash_200151b21f16734f" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x1eb613f5, Offset: 0x2938
// Size: 0xd4
function function_6f7d36ec()
{
    level endon( #"hash_d9ce740cc4b8285", #"hash_200151b21f16734f" );
    self endon( #"death" );
    var_5d275db0 = 0;
    
    while ( !var_5d275db0 )
    {
        var_7df228aa = self.var_7df228aa;
        
        if ( isdefined( var_7df228aa ) )
        {
            var_def266a8 = var_7df228aa.var_def266a8;
            
            if ( !self zm_towers_crowd::function_aa0b6eb() )
            {
                var_5d275db0 = 1;
                break;
            }
        }
        
        waitframe( 1 );
    }
    
    level flag::set( #"hash_d9ce740cc4b8285" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xff78639f, Offset: 0x2a18
// Size: 0x522
function function_a616131a( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    var_97323694 = struct::get_array( "s_ww_quest_impervious_jar_start" );
    var_a53ca88a = [];
    
    foreach ( e_player in util::get_active_players() )
    {
        if ( isdefined( e_player ) )
        {
            foreach ( s_option in var_97323694 )
            {
                if ( e_player util::is_player_looking_at( s_option.origin, 0.9, 0 ) )
                {
                    if ( !isdefined( var_a53ca88a ) )
                    {
                        var_a53ca88a = [];
                    }
                    else if ( !isarray( var_a53ca88a ) )
                    {
                        var_a53ca88a = array( var_a53ca88a );
                    }
                    
                    if ( !isinarray( var_a53ca88a, s_option ) )
                    {
                        var_a53ca88a[ var_a53ca88a.size ] = s_option;
                    }
                }
            }
        }
    }
    
    if ( var_a53ca88a.size == 0 )
    {
        var_1a472b57 = array::random( var_97323694 );
    }
    else
    {
        var_1a472b57 = array::random( var_a53ca88a );
    }
    
    arrayremovevalue( var_97323694, var_1a472b57 );
    
    foreach ( s_option in var_97323694 )
    {
        s_end = struct::get( s_option.target );
        s_end struct::delete();
        s_option struct::delete();
    }
    
    zm_towers_util::function_afd37143( #"hash_28dbb5b91d8a954e" );
    var_8fa68ef = struct::get( var_1a472b57.target );
    mdl_jar = util::spawn_model( #"p8_zm_gla_jar_gold_01", var_1a472b57.origin, var_1a472b57.angles );
    
    if ( !isdefined( mdl_jar ) )
    {
        assert( 0, "<dev string:x5b>" );
        return;
    }
    
    mdl_jar notsolid();
    mdl_jar clientfield::set( "" + #"hash_2c6f04d08665dbda", 1 );
    n_time = mdl_jar zm_utility::fake_physicslaunch( var_8fa68ef.origin, 1000 );
    wait n_time;
    mdl_jar.origin = var_8fa68ef.origin;
    mdl_jar.angles = var_8fa68ef.angles;
    mdl_jar clientfield::set( "" + #"hash_2a332df32456c86f", 1 );
    mdl_jar clientfield::set( "" + #"hash_2c6f04d08665dbda", 0 );
    s_loc = struct::get( var_8fa68ef.target );
    s_loc.var_6d6bbd67 = mdl_jar;
    e_player = s_loc zm_unitrigger::function_fac87205( &function_5f2a9b69 );
    mdl_jar delete();
    level.var_b2b15659 = 1;
    e_player thread zm_vo::function_a2bd5a0c( #"hash_2b2a7c0ea867948e", 0, 0, 9999, 1 );
    level.var_b2b15659 = 0;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x29190cce, Offset: 0x2f48
// Size: 0x5c
function function_605806f( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_45259bb6368fc0d3" );
    level zm_ui_inventory::function_7df6bb60( #"hash_d3e328bb2670edf", 1 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x27186125, Offset: 0x2fb0
// Size: 0xc2
function function_5f2a9b69( e_player )
{
    if ( !isdefined( self ) || !isdefined( self.stub ) || !isdefined( self.stub.related_parent ) || !isdefined( self.stub.related_parent.var_6d6bbd67 ) )
    {
        return 0;
    }
    
    mdl_jar = self.stub.related_parent.var_6d6bbd67;
    var_5168e40f = e_player zm_utility::is_player_looking_at( mdl_jar.origin, 0.9, 0 );
    return var_5168e40f;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xbf69cdce, Offset: 0x3080
// Size: 0x8e
function function_ac4e38bc( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    b_planted = 0;
    
    while ( !b_planted )
    {
        s_waitresult = trigger::wait_till( "t_ww_quest_spile_damage_trigger" );
        e_player = s_waitresult.who;
        
        if ( isplayer( e_player ) )
        {
            b_planted = 1;
            break;
        }
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x15ede224, Offset: 0x3118
// Size: 0x144
function function_8c32234c( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_5649f57b918f85f8" );
    s_spile = struct::get( "s_ww_quest_spile_in_tree" );
    v_origin = s_spile.origin;
    v_angles = s_spile.angles;
    s_spile struct::delete();
    var_7b371ada = util::spawn_model( #"p8_zm_gla_spile_serket_01", v_origin, v_angles );
    var_7b371ada thread function_336ee69f();
    t_trigger = getent( "t_ww_quest_spile_damage_trigger", "targetname" );
    t_trigger delete();
    level zm_ui_inventory::function_7df6bb60( #"hash_46e7cf2b7aa7c22", 0 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x67fa4c4b, Offset: 0x3268
// Size: 0x5c
function function_336ee69f()
{
    level endon( #"end_game" );
    self endon( #"death" );
    wait 3;
    self clientfield::increment( "" + #"hash_48ad84f9cf6a33f0" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x8134809d, Offset: 0x32d0
// Size: 0x54
function function_ec26e009( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    s_loc = struct::get( "s_ww_quest_place_impervious_jar" );
    s_loc zm_unitrigger::function_fac87205( &function_f6781b0f );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x5ae255e6, Offset: 0x3330
// Size: 0x13c
function function_4877f171( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_30ca6a723fbb84e9" );
    s_jar = struct::get( "s_ww_quest_jar_under_tree" );
    v_origin = s_jar.origin;
    v_angles = s_jar.angles;
    mdl_jar = util::spawn_model( #"p8_zm_gla_jar_gold_01", v_origin, v_angles );
    mdl_jar_filled = util::spawn_model( #"p8_zm_gla_jar_gold_01_full", v_origin - ( 0, 0, 2048 ), v_angles );
    level.var_6d6bbd67 = mdl_jar;
    level.var_1028e128 = mdl_jar_filled;
    level zm_ui_inventory::function_7df6bb60( #"hash_d3e328bb2670edf", 0 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xc044dc89, Offset: 0x3478
// Size: 0x6a
function function_f6781b0f( e_player )
{
    s_jar = struct::get( "s_ww_quest_jar_under_tree" );
    var_5168e40f = e_player zm_utility::is_player_looking_at( s_jar.origin, 0.9, 0 );
    return var_5168e40f;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x523824b, Offset: 0x34f0
// Size: 0x3c
function function_bbdde10e( b_skipped )
{
    if ( b_skipped )
    {
        return;
    }
    
    level waittill( #"end_of_round", #"between_round_over" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0xdf119b2e, Offset: 0x3538
// Size: 0x64
function function_40f77b4a( b_skipped, var_19e802fa )
{
    level.var_1028e128.origin += ( 0, 0, 2048 );
    waitframe( 1 );
    level.var_6d6bbd67 delete();
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xd9e1a9de, Offset: 0x35a8
// Size: 0x192
function function_ab13e06( b_skipped )
{
    level.disable_firesale_drop = 1;
    a_mdl_powerups = zm_powerups::get_powerups();
    
    if ( isarray( a_mdl_powerups ) )
    {
        foreach ( mdl_powerup in arraycopy( a_mdl_powerups ) )
        {
            if ( isdefined( mdl_powerup ) && mdl_powerup.powerup_name === "fire_sale" )
            {
                mdl_powerup thread zm_powerups::powerup_delete();
            }
        }
    }
    
    if ( b_skipped )
    {
        return;
    }
    
    s_loc = struct::get( "s_ww_quest_place_impervious_jar" );
    e_player = s_loc zm_unitrigger::function_fac87205( &function_f6781b0f );
    level.var_b2b15659 = 1;
    e_player thread zm_vo::function_a2bd5a0c( #"hash_7afc64a7fa6a0db4", 0, 0, 9999, 1 );
    level.var_b2b15659 = 0;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x99a80ed5, Offset: 0x3748
// Size: 0x74
function function_868dcb6d( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_1c66e5c351c08de1" );
    level.var_1028e128 delete();
    level zm_ui_inventory::function_7df6bb60( #"hash_d3e328bb2670edf", 2 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xbbc68994, Offset: 0x37c8
// Size: 0x398
function function_869d271a( b_skipped )
{
    a_str_chests = array( "tower_a_chest", "tower_b_chest", "tower_c_chest", "tower_d_chest", "tower_a_lower_chest", "tower_b_lower_chest", "tower_c_lower_chest", "tower_d_lower_chest", "danu_zeus_tunnel_chest", "ra_odin_tunnel_chest" );
    level.var_13fc0c88 = [];
    level.var_b7ef852e = [];
    
    foreach ( str_chest in a_str_chests )
    {
        e_chest = getent( str_chest, "targetname" );
        s_chest = struct::get( str_chest, "script_noteworthy" );
        
        if ( !isdefined( level.var_13fc0c88 ) )
        {
            level.var_13fc0c88 = [];
        }
        else if ( !isarray( level.var_13fc0c88 ) )
        {
            level.var_13fc0c88 = array( level.var_13fc0c88 );
        }
        
        level.var_13fc0c88[ level.var_13fc0c88.size ] = e_chest;
        
        if ( !isdefined( level.var_b7ef852e ) )
        {
            level.var_b7ef852e = [];
        }
        else if ( !isarray( level.var_b7ef852e ) )
        {
            level.var_b7ef852e = array( level.var_b7ef852e );
        }
        
        level.var_b7ef852e[ level.var_b7ef852e.size ] = s_chest;
    }
    
    level thread function_9da58e50();
    
    if ( b_skipped )
    {
        return;
    }
    
    foreach ( e_chest in level.var_13fc0c88 )
    {
        e_chest function_9c9af843();
        e_chest thread function_f250013e();
        e_chest thread function_9b311308();
    }
    
    level flag::wait_till( #"hash_77ff9a8101ea687b" );
    
    foreach ( e_chest in level.var_13fc0c88 )
    {
        e_chest function_2d53ee2a();
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x656df39, Offset: 0x3b68
// Size: 0x114
function function_79875787( b_skipped, var_19e802fa )
{
    level flag::set( #"hash_77ff9a8101ea687b" );
    zm_weapons::function_603af7a8( getweapon( #"ww_crossbow_t8" ) );
    callback::on_spawned( &function_e7e07200 );
    array::thread_all( level.players, &function_e7e07200 );
    level.customrandomweaponweights = &function_73ed3038;
    level zm_ui_inventory::function_7df6bb60( #"hash_d3e328bb2670edf", 0 );
    
    /#
        if ( b_skipped )
        {
            iprintlnbold( "<dev string:x87>" );
        }
    #/
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xc1cbe68b, Offset: 0x3c88
// Size: 0x26
function function_e7e07200()
{
    if ( isdefined( self.var_afb3ba4e ) )
    {
        self.var_edd0b994 = self.var_afb3ba4e;
        self.var_afb3ba4e = undefined;
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xae3742d9, Offset: 0x3cb8
// Size: 0x26
function function_d317ceba()
{
    if ( isdefined( self.var_edd0b994 ) )
    {
        self.var_afb3ba4e = self.var_edd0b994;
        self.var_edd0b994 = undefined;
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xbff89839, Offset: 0x3ce8
// Size: 0x12e
function function_f250013e()
{
    level endon( #"hash_77ff9a8101ea687b", #"fire_sale_on" );
    
    while ( true )
    {
        str_state = self zm_magicbox::get_magic_box_zbarrier_state();
        n_index = array::find( level.chests, self.owner );
        
        switch ( str_state )
        {
            case #"close":
            case #"arriving":
            case #"initial":
                if ( level.chest_index === n_index )
                {
                    self thread function_1da98a12();
                }
                
                break;
            default:
                self thread function_2d53ee2a();
                break;
        }
        
        self waittill( #"zbarrier_state_change" );
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xc9958fb6, Offset: 0x3e20
// Size: 0x88
function function_9b311308()
{
    level endon( #"hash_77ff9a8101ea687b" );
    
    while ( true )
    {
        level waittill( #"fire_sale_on" );
        self function_2d53ee2a();
        level waittill( #"fire_sale_off" );
        self thread function_f250013e();
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x463cf5e2, Offset: 0x3eb0
// Size: 0x1aa
function function_9c9af843()
{
    str_targetname = self.targetname;
    
    switch ( str_targetname )
    {
        case #"tower_a_chest":
            str_loc = "odin_top_floor";
            break;
        case #"tower_b_chest":
            str_loc = "zeus_top_floor";
            break;
        case #"tower_c_chest":
            str_loc = "danu_top_floor";
            break;
        case #"tower_d_chest":
            str_loc = "ra_top_floor";
            break;
        case #"tower_a_lower_chest":
            str_loc = "odin_basement";
            break;
        case #"tower_b_lower_chest":
            str_loc = "zeus_basement";
            break;
        case #"tower_c_lower_chest":
            str_loc = "danu_basement";
            break;
        case #"tower_d_lower_chest":
            str_loc = "ra_basement";
            break;
        case #"ra_odin_tunnel_chest":
            str_loc = "ra_odin_tunnel";
            break;
        case #"danu_zeus_tunnel_chest":
            str_loc = "danu_zeus_tunnel";
            break;
    }
    
    s_loc = struct::get( "s_ww_quest_magic_box_unitrigger_" + str_loc );
    self.var_732ed72e = s_loc;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x21db902, Offset: 0x4068
// Size: 0x13c
function function_1da98a12()
{
    self notify( "5951a9603b9ff9a3" );
    self endon( "5951a9603b9ff9a3" );
    level endon( #"hash_77ff9a8101ea687b" );
    self endon( #"hash_34af1b1562febca4" );
    s_loc = self.var_732ed72e;
    
    if ( !isdefined( self.var_1ac569e5 ) )
    {
        self.var_1ac569e5 = s_loc zm_unitrigger::create( &function_6919af04 );
    }
    
    s_waitresult = s_loc waittill( #"trigger_activated" );
    e_player = s_waitresult.e_who;
    level.var_b2b15659 = 1;
    e_player thread zm_vo::function_a2bd5a0c( #"hash_1c667d0f1af843a9", 0, 0, 9999, 1 );
    level.var_b2b15659 = 0;
    level flag::set( #"hash_77ff9a8101ea687b" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xbff530d6, Offset: 0x41b0
// Size: 0x152
function function_6919af04( e_player )
{
    if ( zombie_utility::get_zombie_var( #"zombie_powerup_fire_sale_on" ) === 1 || e_player hasweapon( level.w_crossbow ) || e_player hasweapon( level.w_crossbow_upgraded ) || e_player hasweapon( level.w_crossbow_charged ) || e_player hasweapon( level.w_crossbow_charged_upgraded ) )
    {
        self sethintstringforplayer( e_player, "" );
        return 0;
    }
    
    if ( function_8b1a219a() )
    {
        self sethintstringforplayer( e_player, #"hash_18341747d3b4143a" );
    }
    else
    {
        self sethintstringforplayer( e_player, #"hash_a57efeec61b5a4e" );
    }
    
    return 1;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x4d1d7dfc, Offset: 0x4310
// Size: 0x5e
function function_2d53ee2a()
{
    self notify( #"hash_34af1b1562febca4" );
    s_loc = self.var_732ed72e;
    
    if ( isdefined( self.var_1ac569e5 ) )
    {
        zm_unitrigger::unregister_unitrigger( s_loc.s_unitrigger );
        self.var_1ac569e5 = undefined;
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xb3db02f8, Offset: 0x4378
// Size: 0x2bc
function function_9da58e50()
{
    level endon( #"end_game" );
    level flag::wait_till( #"hash_77ff9a8101ea687b" );
    var_2002b43f = level.chests[ level.chest_index ].zbarrier;
    playsoundatposition( #"hash_f481d0cba05eda5", var_2002b43f.origin );
    var_2002b43f clientfield::set( "" + #"hash_3974bea828fbf7f7", 1 );
    var_2002b43f clientfield::set( "" + #"hash_3a51c9895d4afcf7", 1 );
    
    while ( true )
    {
        var_2002b43f waittill( #"zbarrier_state_change" );
        
        if ( var_2002b43f getzbarrierpiecestate( 2 ) === "opening" )
        {
            break;
        }
    }
    
    var_2002b43f clientfield::set( "" + #"hash_3974bea828fbf7f7", 0 );
    var_2002b43f clientfield::set( "" + #"hash_5dc6f97e5850e1d1", 1 );
    var_2002b43f clientfield::set( "" + #"hash_1add6939914df65a", 1 );
    level flag::wait_till_any( array( #"hash_3ac6f9944962bd4c", #"hash_786b9153c754d127" ) );
    var_2002b43f clientfield::set( "" + #"hash_5dc6f97e5850e1d1", 0 );
    var_2002b43f clientfield::set( "" + #"hash_1add6939914df65a", 0 );
    var_2002b43f clientfield::set( "" + #"hash_3a51c9895d4afcf7", 0 );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0x1e5293c0, Offset: 0x4640
// Size: 0x50
function function_73ed3038( a_keys )
{
    level.customrandomweaponweights = undefined;
    arrayinsert( a_keys, getweapon( #"ww_crossbow_t8" ), 0 );
    return a_keys;
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 1
// Checksum 0xa789be3d, Offset: 0x4698
// Size: 0x2a0
function function_3cadd22( b_skipped )
{
    foreach ( s_chest in level.var_b7ef852e )
    {
        if ( !isdefined( s_chest.no_fly_away ) )
        {
            s_chest.no_fly_away = 1;
            s_chest.var_31212fac = 1;
        }
    }
    
    array::thread_all( level.var_13fc0c88, &function_c448aa83 );
    level.chests[ 0 ].zbarrier clientfield::set( "force_stream_magicbox", 1 );
    level flag::wait_till_any( array( #"hash_3ac6f9944962bd4c", #"hash_786b9153c754d127" ) );
    callback::remove_on_spawned( &function_e7e07200 );
    array::thread_all( level.players, &function_d317ceba );
    
    foreach ( s_chest in level.var_b7ef852e )
    {
        if ( isdefined( s_chest.var_31212fac ) )
        {
            s_chest.no_fly_away = undefined;
            s_chest.var_31212fac = undefined;
        }
    }
    
    level.disable_firesale_drop = undefined;
    
    foreach ( e_player in level.players )
    {
        e_player clientfield::increment_to_player( "" + #"ww_quest_earthquake" );
    }
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 2
// Checksum 0x81249d98, Offset: 0x4940
// Size: 0x14
function function_f04288b4( b_skipped, var_19e802fa )
{
    
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0xa46b5f1d, Offset: 0x4960
// Size: 0x9c
function function_c448aa83()
{
    level endon( #"hash_631e8676a2fa932b" );
    self waittill( #"opened" );
    level.var_3064d5f7 = self.owner;
    level.var_3064d5f7 thread function_61280c4d();
    self thread function_da474552();
    level flag::set( #"hash_631e8676a2fa932b" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x164b2e5c, Offset: 0x4a08
// Size: 0x64
function function_61280c4d()
{
    level endon( #"hash_3ac6f9944962bd4c", #"hash_786b9153c754d127" );
    self waittill( #"user_grabbed_weapon" );
    level flag::set( #"hash_3ac6f9944962bd4c" );
}

// Namespace zm_towers_ww_quest/zm_towers_ww_quest
// Params 0
// Checksum 0x13a98190, Offset: 0x4a78
// Size: 0x7c
function function_da474552()
{
    level endon( #"hash_786b9153c754d127", #"hash_3ac6f9944962bd4c" );
    
    while ( self getzbarrierpiecestate( 2 ) !== "closing" )
    {
        waitframe( 1 );
    }
    
    level flag::set( #"hash_786b9153c754d127" );
}

