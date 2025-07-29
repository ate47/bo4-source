#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_customgame;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_utility;
#using scripts\zm_common\zm_zonemgr;

#namespace namespace_df88241c;

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0, eflags: 0x2
// Checksum 0xc140230f, Offset: 0x170
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_18c69cd2b0bf61b9", &__init__, undefined, undefined );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x192d3bc1, Offset: 0x1b8
// Size: 0x104
function __init__()
{
    level.var_f4f794bf = array( 5, 7, 9, 12 );
    level.nova_crawler_spawner = getent( "nova_crawler_spawner", "script_noteworthy" );
    spawner::add_archetype_spawn_function( #"nova_crawler", &nova_crawler_init );
    zm_round_spawning::register_archetype( #"nova_crawler", &function_c73902fd, &crawler_round_spawn, &spawn_nova_crawler, 10 );
    zm_score::function_e5d6e6dd( #"nova_crawler", 60 );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x14495d82, Offset: 0x2c8
// Size: 0x1c
function nova_crawler_init()
{
    level thread zm_spawner::zombie_death_event( self );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0x69b99b21, Offset: 0x2f0
// Size: 0x6a
function function_c73902fd( var_dbce0c44 )
{
    if ( isdefined( level.var_5e45f817 ) && level.var_5e45f817 )
    {
        return 0;
    }
    
    var_8cf00d40 = int( floor( var_dbce0c44 / 10 ) );
    return var_8cf00d40;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x9c070c82, Offset: 0x368
// Size: 0x3c, Type: bool
function crawler_round_spawn()
{
    ai = spawn_nova_crawler();
    
    if ( isdefined( ai ) )
    {
        level.zombie_total--;
        return true;
    }
    
    return false;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0x90061b17, Offset: 0x3b0
// Size: 0x18e
function spawn_nova_crawler( override_spawn_location = undefined )
{
    var_d8d8ce1b = undefined;
    
    if ( function_4748fb49() < function_59257d57() && !( isdefined( level.var_5e45f817 ) && level.var_5e45f817 ) && isdefined( level.zm_loc_types[ #"nova_crawler_location" ] ) && level.zm_loc_types[ #"nova_crawler_location" ].size > 0 )
    {
        var_d8d8ce1b = zombie_utility::spawn_zombie( level.nova_crawler_spawner );
        
        if ( isdefined( var_d8d8ce1b ) )
        {
            var_d8d8ce1b.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
            var_d8d8ce1b thread zombie_utility::round_spawn_failsafe();
            
            if ( isdefined( override_spawn_location ) )
            {
                var_d8d8ce1b function_e2bab5ec( override_spawn_location );
                override_spawn_location.spawned_timestamp = gettime();
            }
            else
            {
                spawn_location = var_d8d8ce1b function_9216fd1f();
                
                if ( isdefined( spawn_location ) )
                {
                    var_d8d8ce1b function_e2bab5ec( spawn_location );
                    spawn_location.spawned_timestamp = gettime();
                }
            }
        }
    }
    
    return var_d8d8ce1b;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x792d0323, Offset: 0x548
// Size: 0xae
function function_59257d57()
{
    if ( level flag::exists( "nova_crawlers_round" ) && level flag::get( "nova_crawlers_round" ) )
    {
        return level.zombie_ai_limit;
    }
    
    if ( zm_utility::is_trials() )
    {
        return ( level.var_f4f794bf[ level.players.size - 1 ] * 2 );
    }
    
    return level.var_f4f794bf[ level.players.size - 1 ];
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0xa1dfff98, Offset: 0x600
// Size: 0xbc
function function_4748fb49()
{
    a_ai_crawler = getaiarchetypearray( #"nova_crawler" );
    var_cc9e7e12 = a_ai_crawler.size;
    
    foreach ( ai_crawler in a_ai_crawler )
    {
        if ( !isalive( ai_crawler ) )
        {
            var_cc9e7e12--;
        }
    }
    
    return var_cc9e7e12;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0xde49ff09, Offset: 0x6c8
// Size: 0x6c
function setup_crawler_round( n_round )
{
    zm_round_spawning::function_b4a8f95a( #"nova_crawler", n_round, &crawler_round_start, &water_drop_triggerreactidgunterminate, &function_f6e748b, &function_f726e44, 0 );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x6d16f449, Offset: 0x740
// Size: 0x44
function crawler_round_start()
{
    level flag::set( #"hash_2a1fc2e349c48462" );
    level flag::set( "crawler_round" );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0xd0a3a13b, Offset: 0x790
// Size: 0x4c
function water_drop_triggerreactidgunterminate( var_d25bbdd5 )
{
    level flag::clear( #"hash_2a1fc2e349c48462" );
    level flag::clear( "crawler_round" );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0xce3edb28, Offset: 0x7e8
// Size: 0x2c
function function_f6e748b()
{
    return 40 * ( isdefined( level.var_71bc2e8f ) ? level.var_71bc2e8f : 1 );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 2
// Checksum 0x622b9503, Offset: 0x820
// Size: 0x34
function function_f726e44( count, max )
{
    wait randomfloatrange( 0.25, 0.5 );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x1c77acd8, Offset: 0x860
// Size: 0xba
function function_a5abd591()
{
    var_5935bd0e = array::randomize( level.activeplayers );
    e_target = undefined;
    
    foreach ( e_player in var_5935bd0e )
    {
        if ( zm_utility::is_player_valid( e_player ) )
        {
            e_target = e_player;
            break;
        }
    }
    
    return e_target;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1, eflags: 0x4
// Checksum 0xfc0c4e29, Offset: 0x928
// Size: 0x2ca
function private function_9a898f07( e_target )
{
    if ( isdefined( level.zm_loc_types[ #"nova_crawler_location" ] ) && level.zm_loc_types[ #"nova_crawler_location" ].size > 0 )
    {
        var_a6c95035 = [];
        str_target_zone = e_target zm_zonemgr::get_player_zone();
        
        if ( !isdefined( str_target_zone ) )
        {
            return undefined;
        }
        
        target_zone = level.zones[ str_target_zone ];
        var_24f5d9f8 = array( target_zone.name );
        a_str_adj_zones = getarraykeys( target_zone.adjacent_zones );
        
        foreach ( str_zone in a_str_adj_zones )
        {
            if ( target_zone.adjacent_zones[ str_zone ].is_connected )
            {
                if ( !isdefined( var_24f5d9f8 ) )
                {
                    var_24f5d9f8 = [];
                }
                else if ( !isarray( var_24f5d9f8 ) )
                {
                    var_24f5d9f8 = array( var_24f5d9f8 );
                }
                
                var_24f5d9f8[ var_24f5d9f8.size ] = str_zone;
            }
        }
        
        foreach ( loc in level.zm_loc_types[ #"nova_crawler_location" ] )
        {
            if ( array::contains( var_24f5d9f8, loc.zone_name ) )
            {
                if ( !isdefined( var_a6c95035 ) )
                {
                    var_a6c95035 = [];
                }
                else if ( !isarray( var_a6c95035 ) )
                {
                    var_a6c95035 = array( var_a6c95035 );
                }
                
                var_a6c95035[ var_a6c95035.size ] = loc;
            }
        }
        
        s_spawn_loc = array::random( var_a6c95035 );
    }
    
    return s_spawn_loc;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0xbdd88f8a, Offset: 0xc00
// Size: 0x42
function function_87348a88( e_target )
{
    override_spawn_location = function_9a898f07( e_target );
    return spawn_nova_crawler( override_spawn_location );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0, eflags: 0x4
// Checksum 0x91b9470b, Offset: 0xc50
// Size: 0xe2
function private function_9216fd1f()
{
    spawn_locations = [];
    spawn_location = undefined;
    
    if ( isdefined( level.zm_loc_types[ #"nova_crawler_location" ] ) )
    {
        spawn_locations = level.zm_loc_types[ #"nova_crawler_location" ];
    }
    
    if ( spawn_locations.size > 0 )
    {
        if ( !isdefined( spawn_location ) )
        {
            spawn_info = zm_spawner::function_dce9f1a6( spawn_locations );
            spawn_location = spawn_info.spot;
        }
        
        if ( !isdefined( spawn_location ) )
        {
            spawn_location = zm_spawner::function_65439499( spawn_locations );
        }
        
        if ( !isdefined( spawn_location ) )
        {
            spawn_location = array::random( spawn_locations );
        }
    }
    
    return spawn_location;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1, eflags: 0x4
// Checksum 0x634e9fd9, Offset: 0xd40
// Size: 0x2f6
function private function_e2bab5ec( spot )
{
    if ( isdefined( self.anchor ) )
    {
        return;
    }
    
    if ( isdefined( spot.script_int ) && spot.script_int == 1 )
    {
        self.custom_riseanim = "ai_t8_zm_quad_traverse_ground_crawlfast";
        self thread zm_spawner::do_zombie_rise( spot );
        self thread rise_anim_watcher();
        return;
    }
    
    self.anchor = spawn( "script_origin", self.origin );
    self.anchor.angles = self.angles;
    self linkto( self.anchor );
    self.anchor thread zm_utility::anchor_delete_failsafe( self );
    
    if ( !isdefined( spot.angles ) )
    {
        spot.angles = ( 0, 0, 0 );
    }
    
    self ghost();
    self.anchor moveto( spot.origin, 0.05 );
    self.anchor waittill( #"movedone" );
    target_org = zombie_utility::get_desired_origin();
    
    if ( isdefined( target_org ) )
    {
        anim_ang = vectortoangles( target_org - self.origin );
        self.anchor rotateto( ( 0, anim_ang[ 1 ], 0 ), 0.05 );
        self.anchor waittill( #"rotatedone" );
    }
    
    if ( isdefined( level.zombie_spawn_fx ) )
    {
        playfx( level.zombie_spawn_fx, spot.origin );
    }
    
    self unlink();
    
    if ( isdefined( self.anchor ) )
    {
        self.anchor delete();
    }
    
    if ( !( isdefined( self.dontshow ) && self.dontshow ) )
    {
        self show();
    }
    
    self notify( #"spawn_complete" );
    self notify( #"risen", { #find_flesh_struct_string:spot.script_string } );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x699620b3, Offset: 0x1040
// Size: 0x3e
function rise_anim_watcher()
{
    self endon( #"death" );
    self waittill( #"rise_anim_finished" );
    self notify( #"spawn_complete" );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0xfd0c9171, Offset: 0x1088
// Size: 0xb8
function function_c44636f2( b_ignore_cleanup = 1 )
{
    if ( !zm_custom::function_901b751c( #"zmspecialroundsenabled" ) || isdefined( level.var_5e45f817 ) && level.var_5e45f817 )
    {
        return;
    }
    
    level.var_1ba6a97c = 1;
    level.var_8167b1e = b_ignore_cleanup;
    assert( isdefined( level.var_807ffa2e ) );
    level thread [[ level.var_807ffa2e ]]();
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0xfab593ec, Offset: 0x1148
// Size: 0xbc
function function_5b0522fa()
{
    level.var_f5419c22 = 20;
    zm_round_spawning::function_b4a8f95a( #"nova_crawler", level.var_f5419c22, &function_9e97e0f7, &function_de265920, &function_70a8e26c, &function_d7e9e2ff, level.var_8167b1e );
    zm_utility::function_fdb0368( 11 );
    level flagsys::set( #"hash_2a1fc2e349c48462" );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x257fc13e, Offset: 0x1210
// Size: 0x24
function function_9e97e0f7()
{
    level flag::set( #"hash_2a1fc2e349c48462" );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 1
// Checksum 0x25289a31, Offset: 0x1240
// Size: 0x32
function function_de265920( var_d25bbdd5 )
{
    level flag::clear( #"hash_2a1fc2e349c48462" );
    wait 5;
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0xe93ea84c, Offset: 0x1280
// Size: 0x62
function function_70a8e26c()
{
    a_e_players = getplayers();
    n_max = zm_round_logic::get_zombie_count_for_round( level.var_f5419c22, a_e_players.size );
    return int( n_max * 0.6 );
}

// Namespace namespace_df88241c/namespace_a366d2a9
// Params 0
// Checksum 0x6b94d3c7, Offset: 0x12f0
// Size: 0xc
function function_d7e9e2ff()
{
    wait 0.1;
}

