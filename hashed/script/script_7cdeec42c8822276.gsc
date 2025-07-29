#using script_174ebb9642933bf7;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\util_shared;
#using scripts\zm\zm_office_special_rounds;
#using scripts\zm\zm_office_teleporters;
#using scripts\zm_common\util\ai_dog_util;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_powerups;
#using scripts\zm_common\zm_round_logic;

#namespace namespace_76ccb07a;

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0xbfd8cf4d, Offset: 0x138
// Size: 0x1c
function init()
{
    level thread function_88b87834();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0x817db735, Offset: 0x160
// Size: 0x194
function function_fac06066()
{
    a_e_zombies = getaiarray();
    
    foreach ( e_zombie in a_e_zombies )
    {
        e_zombie thread zm_cleanup::cleanup_zombie();
    }
    
    level.var_894a83d8 = 1;
    level flag::clear( "spawn_zombies" );
    level flag::set( "pause_round_timeout" );
    level.var_37769559 = 10;
    level.var_baf33f0e = 0;
    zm_powerups::function_74b8ec6b( "full_ammo" );
    zm_powerups::function_74b8ec6b( "bonus_points_team" );
    zm_powerups::function_74b8ec6b( "double_points" );
    callback::on_ai_killed( &function_1cae4e0a );
    level thread function_bcae2e4b();
    wait 15;
    level thread round_spawning();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0x4e6d0188, Offset: 0x300
// Size: 0x1bc
function function_4074a9e2()
{
    a_e_zombies = getaiarray();
    
    foreach ( e_zombie in a_e_zombies )
    {
        e_zombie.exclude_cleanup_adding_to_total = 1;
        e_zombie thread zm_cleanup::cleanup_zombie();
    }
    
    level.var_894a83d8 = 0;
    level flag::clear( #"hash_26e9fe6561459de3" );
    level flag::set( "spawn_zombies" );
    level flag::set( "pause_round_timeout" );
    callback::remove_on_ai_killed( &function_1cae4e0a );
    zm_powerups::function_41cedb05( "full_ammo" );
    zm_powerups::function_41cedb05( "bonus_points_team" );
    zm_powerups::function_41cedb05( "double_points" );
    
    /#
        iprintlnbold( "<dev string:x38>" + level.var_baf33f0e + "<dev string:x4e>" );
    #/
    
    level thread function_88b87834();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 1
// Checksum 0xc33c829a, Offset: 0x4c8
// Size: 0x94
function function_1cae4e0a( s_params )
{
    if ( self.b_cleaned_up !== 1 )
    {
        level.var_baf33f0e++;
        
        if ( level.var_bdc8b034.size < 1 && zombie_utility::get_current_zombie_count() < 2 )
        {
            level thread zm_powerups::specific_powerup_drop( "full_ammo", self.origin, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1 );
        }
    }
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0x913b3f, Offset: 0x568
// Size: 0x234
function function_b741acea()
{
    level.var_bdc8b034 = [];
    level.var_bdc8b034[ #"zombie" ] = zm_round_logic::get_zombie_count_for_round( level.var_37769559, level.activeplayers.size );
    var_d90bc041 = min( ( level.var_37769559 - 10 ) / 40, 1 );
    var_82981c27 = lerpfloat( 0.1, 0.3, var_d90bc041 );
    var_2f8a58bb = lerpfloat( 0.2, 0.4, var_d90bc041 );
    var_8c110732 = randomfloatrange( var_82981c27, var_2f8a58bb );
    var_778b517c = int( var_8c110732 * level.var_bdc8b034[ #"zombie" ] );
    level.var_bdc8b034[ #"zombie" ] -= var_778b517c;
    level.var_bdc8b034[ #"zombie_dog" ] = int( randomfloatrange( 0.2, 0.4 ) * var_778b517c );
    level.var_bdc8b034[ #"nova_crawler" ] = var_778b517c - level.var_bdc8b034[ #"zombie_dog" ];
    arrayremovevalue( level.var_bdc8b034, 0, 1 );
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0x5e0ff33c, Offset: 0x7a8
// Size: 0x4c
function function_88b87834()
{
    level waittill( #"hash_70624458fe48ac18" );
    level flag::set( #"hash_26e9fe6561459de3" );
    function_fac06066();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0xfa70593a, Offset: 0x800
// Size: 0x2c
function function_bcae2e4b()
{
    level waittill( #"hash_3e95ff63d623d736" );
    function_4074a9e2();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0xef661a, Offset: 0x838
// Size: 0x264
function round_spawning()
{
    level endon( #"hash_3e95ff63d623d736" );
    function_b741acea();
    n_spawn_delay = zm_round_logic::get_zombie_spawn_delay( level.var_37769559 );
    
    while ( level.var_bdc8b034.size > 0 )
    {
        for ( var_404e4288 = zombie_utility::get_current_zombie_count(); var_404e4288 >= level.zombie_ai_limit ; var_404e4288 = zombie_utility::get_current_zombie_count() )
        {
            wait 0.1;
        }
        
        while ( zombie_utility::get_current_actor_count() >= level.zombie_actor_limit )
        {
            zombie_utility::clear_all_corpses();
            wait 0.1;
        }
        
        level flag::wait_till_clear( #"hash_21921ed511559aa3" );
        str_archetype = get_archetype();
        ai = spawn_archetype( str_archetype );
        
        if ( isdefined( ai ) )
        {
            ai._starting_round_number = level.var_37769559;
            level.var_bdc8b034[ str_archetype ]--;
            
            if ( level.var_bdc8b034[ str_archetype ] == 0 )
            {
                arrayremoveindex( level.var_bdc8b034, str_archetype, 1 );
            }
            
            ai thread zombie_utility::round_spawn_failsafe();
            var_404e4288++;
            
            if ( ai ai::has_behavior_attribute( "can_juke" ) )
            {
                ai ai::set_behavior_attribute( "can_juke", 0 );
            }
            
            wait n_spawn_delay;
        }
        
        util::wait_network_frame();
    }
    
    while ( zombie_utility::get_current_zombie_count() > 0 )
    {
        wait 0.1;
    }
    
    level thread end_round();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0xafa2250f, Offset: 0xaa8
// Size: 0x3a
function get_archetype()
{
    a_keys = getarraykeys( level.var_bdc8b034 );
    return array::random( a_keys );
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 1
// Checksum 0x53adfdbf, Offset: 0xaf0
// Size: 0xfe
function spawn_archetype( str_archetype )
{
    switch ( str_archetype )
    {
        case #"zombie":
            spawner = array::random( level.zombie_spawners );
            ai = zombie_utility::spawn_zombie( spawner );
            break;
        case #"zombie_dog":
            ai = zombie_dog_util::function_62db7b1c();
            break;
        case #"nova_crawler":
            ai = namespace_df88241c::spawn_nova_crawler();
            break;
        default:
            assertmsg( "<dev string:x60>" );
            break;
    }
    
    return ai;
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0x98ba2028, Offset: 0xbf8
// Size: 0x34
function end_round()
{
    level endon( #"hash_3e95ff63d623d736" );
    wait 15;
    function_d89bf8aa();
}

// Namespace namespace_76ccb07a/namespace_76ccb07a
// Params 0
// Checksum 0xc291bd9, Offset: 0xc38
// Size: 0x34
function function_d89bf8aa()
{
    level.var_37769559 += 5;
    level thread round_spawning();
}

