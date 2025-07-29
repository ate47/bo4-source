#using script_2c5daa95f8fec03c;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_cleanup_mgr;
#using scripts\zm_common\zm_player;
#using scripts\zm_common\zm_round_spawning;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_utility;

#namespace zombie_gegenees_util;

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0, eflags: 0x2
// Checksum 0xd30799b1, Offset: 0x1d8
// Size: 0x54
function autoexec __init__system__()
{
    system::register( #"zombie_gegenees_util", &__init__, &__main__, #"zm_ai_gegenees" );
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0x32be42c2, Offset: 0x238
// Size: 0x1b4
function __init__()
{
    function_ea46ca6f();
    zm_cleanup::function_cdf5a512( #"gegenees", &function_7640eac2 );
    zm_player::register_player_damage_callback( &function_7e791d5d );
    level thread function_b656013e();
    
    if ( zm_utility::is_standard() )
    {
        zm_round_spawning::register_archetype( #"gegenees", &function_7107da88, &round_spawn, undefined, int( level.var_b3d6ef3b[ 0 ] ai::function_9139c839().var_dbb3ef3d / 2 ) );
    }
    else
    {
        zm_round_spawning::register_archetype( #"gegenees", &function_7107da88, &round_spawn, undefined, level.var_b3d6ef3b[ 0 ] ai::function_9139c839().var_dbb3ef3d );
    }
    
    zm_round_spawning::function_306ce518( #"gegenees", &function_c1a0ea97 );
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0xa93db46, Offset: 0x3f8
// Size: 0x4c
function __main__()
{
    zm_score::function_e5d6e6dd( #"gegenees", level.var_b3d6ef3b[ 0 ] ai::function_9139c839().var_1be2be91 );
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0, eflags: 0x4
// Checksum 0xa6d94c4, Offset: 0x450
// Size: 0xde
function private function_b656013e()
{
    level endon( #"game_over" );
    bundle = level.var_b3d6ef3b[ 0 ] ai::function_9139c839();
    bundle.var_250a1683 = 750;
    
    while ( !level flag::exists( #"pap_quest_completed" ) )
    {
        waitframe( 1 );
    }
    
    level flag::wait_till( #"pap_quest_completed" );
    bundle.weakpointdamagescale = 0.5;
    bundle.instakilldamagescale = 0.4;
    bundle.var_97b22faa = 0.75;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0x3d1f1be9, Offset: 0x538
// Size: 0x10e
function function_ea46ca6f()
{
    level.var_b3d6ef3b = getentarray( "zombie_gegenees_spawner", "script_noteworthy" );
    
    if ( level.var_b3d6ef3b.size == 0 )
    {
        assertmsg( "<dev string:x38>" );
        return;
    }
    
    spawner::add_archetype_spawn_function( #"gegenees", &gegenees_init );
    
    foreach ( var_6ad43ef7 in level.var_b3d6ef3b )
    {
        var_6ad43ef7.is_enabled = 1;
        var_6ad43ef7.script_forcespawn = 1;
    }
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0x10040d60, Offset: 0x650
// Size: 0xa4
function gegenees_init()
{
    self.maxhealth = int( self zm_ai_utility::function_8d44707e( 1, self._starting_round_number ) * ( isdefined( level.var_9503486c ) ? level.var_9503486c : 1 ) );
    self.health = self.maxhealth;
    self zm_score::function_82732ced();
    self.var_ab8f2b90 = 3;
    namespace_81245006::initweakpoints( self, "c_t8_zmb_gegenees_weakpoint_def" );
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0x84f53a00, Offset: 0x700
// Size: 0x2a8, Type: bool
function function_7640eac2()
{
    if ( !isdefined( level.var_f1e94d9 ) )
    {
        level.var_f1e94d9 = struct::get_array( "gegenees_location", "script_noteworthy" );
    }
    
    if ( level.var_f1e94d9.size < 1 )
    {
        self.b_ignore_cleanup = 1;
        return true;
    }
    
    if ( zm_utility::is_standard() && level flag::exists( "started_defend_area" ) && level flag::get( "started_defend_area" ) )
    {
        self.b_ignore_cleanup = 1;
        return true;
    }
    
    var_31f7011a = arraycopy( level.players );
    var_31f7011a = arraysortclosest( var_31f7011a, self.origin );
    i = 0;
    var_b2aa54a9 = level.var_f1e94d9[ 0 ];
    var_56feeec4 = distancesquared( var_31f7011a[ 0 ].origin, var_b2aa54a9.origin );
    
    foreach ( var_d7eff26a in level.var_f1e94d9 )
    {
        if ( !zm_utility::is_player_valid( var_31f7011a[ i ] ) )
        {
            i++;
            
            if ( i >= var_31f7011a.size )
            {
                i = 0;
                util::wait_network_frame();
            }
            
            continue;
        }
        
        var_e8ab126e = distancesquared( var_31f7011a[ i ].origin, var_d7eff26a.origin );
        
        if ( var_e8ab126e < var_56feeec4 )
        {
            var_56feeec4 = var_e8ab126e;
            var_b2aa54a9 = var_d7eff26a;
        }
    }
    
    self zm_ai_utility::function_a8dc3363( var_b2aa54a9 );
    
    if ( isdefined( var_b2aa54a9.scriptbundlename ) )
    {
        self function_9a9b5f49( var_b2aa54a9 );
    }
    
    return true;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 1
// Checksum 0x992ce860, Offset: 0x9b0
// Size: 0x244
function function_9a9b5f49( spot )
{
    self endoncallback( &zm_spawner::function_fe3cb19a, #"death" );
    self zm_spawner::function_fe3cb19a();
    self.mdl_anchor = util::spawn_model( "tag_origin", self.origin, self.angles );
    self ghost();
    
    if ( !isdefined( spot.angles ) )
    {
        spot.angles = ( 0, 0, 0 );
    }
    
    self.mdl_anchor moveto( spot.origin, 0.05 );
    self.mdl_anchor rotateto( spot.angles, 0.05 );
    self.mdl_anchor waittill( #"movedone", #"death" );
    wait 0.05;
    self show();
    
    if ( !isdefined( self.var_9ed3cc11 ) )
    {
        self.var_9ed3cc11 = self function_e827fc0e();
    }
    
    self pushplayer( 1 );
    e_align = isdefined( self.mdl_anchor ) ? self.mdl_anchor : spot;
    e_align scene::play( spot.scriptbundlename, self );
    
    if ( isdefined( self.var_9ed3cc11 ) )
    {
        self pushplayer( self.var_9ed3cc11 );
        self.var_9ed3cc11 = undefined;
    }
    
    self thread zm_spawner::function_2d97cae1();
    self notify( #"risen", spot.script_string );
    self zm_spawner::zombie_complete_emerging_into_playable_area();
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 10, eflags: 0x4
// Checksum 0x5da9b680, Offset: 0xc00
// Size: 0x130
function private function_7e791d5d( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime )
{
    if ( isdefined( eattacker ) && isai( eattacker ) && eattacker.archetype == #"gegenees" && eattacker.team != self.team )
    {
        if ( eattacker ai::has_behavior_attribute( "damage_multiplier" ) )
        {
            damage_multiplier = eattacker ai::get_behavior_attribute( "damage_multiplier" );
            
            if ( damage_multiplier != 1 )
            {
                damage_mod = idamage * damage_multiplier;
                return damage_mod;
            }
        }
    }
    
    return -1;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 1
// Checksum 0x558ce1e4, Offset: 0xd38
// Size: 0x292
function function_7107da88( var_dbce0c44 )
{
    var_8cf00d40 = int( floor( var_dbce0c44 / level.var_b3d6ef3b[ 0 ] ai::function_9139c839().var_dbb3ef3d ) );
    
    if ( zm_utility::is_standard() )
    {
        var_8cf00d40 = int( var_8cf00d40 / 2 );
    }
    
    if ( isdefined( level.var_99695b55 ) && level.round_number < level.var_99695b55 && !zm_utility::is_standard() )
    {
        return 0;
    }
    
    if ( level.players.size == 1 )
    {
        var_1797c23a = 1;
    }
    else if ( level.round_number <= 10 )
    {
        var_1797c23a = 1;
    }
    else if ( level.round_number <= 17 )
    {
        var_1797c23a = 2;
    }
    else
    {
        var_1797c23a = 3;
    }
    
    var_2506688 = var_1797c23a < 8 ? max( var_1797c23a - 3, 0 ) : var_1797c23a * 0.75;
    n_num_to_spawn = randomintrangeinclusive( int( var_2506688 ), int( min( var_8cf00d40, var_1797c23a ) ) );
    
    if ( !n_num_to_spawn )
    {
        if ( !isdefined( level.var_720b9d46 ) )
        {
            level.var_720b9d46 = 0;
        }
        
        var_c549cc47 = level.round_number - level.var_720b9d46;
        
        if ( var_c549cc47 > 2 )
        {
            if ( var_1797c23a > 1 )
            {
                n_num_to_spawn = randomintrange( 1, var_1797c23a );
            }
            else
            {
                n_num_to_spawn = 1;
            }
        }
    }
    
    if ( n_num_to_spawn )
    {
        level.var_720b9d46 = level.round_number;
    }
    
    return n_num_to_spawn;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0x96de9a1, Offset: 0xfd8
// Size: 0x3c, Type: bool
function round_spawn()
{
    ai = spawn_single();
    
    if ( isdefined( ai ) )
    {
        level.zombie_total--;
        return true;
    }
    
    return false;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 3
// Checksum 0x7bfa1897, Offset: 0x1020
// Size: 0x280
function spawn_single( b_force_spawn = 0, var_eb3a8721, var_bc66d64b )
{
    if ( !b_force_spawn && !function_48c60fc2() )
    {
        return undefined;
    }
    
    if ( isdefined( var_eb3a8721 ) )
    {
        s_spawn_loc = var_eb3a8721;
    }
    else if ( isdefined( level.var_9e923fdb ) )
    {
        s_spawn_loc = [[ level.var_9e923fdb ]]();
    }
    else if ( level.zm_loc_types[ #"gegenees_location" ].size > 0 )
    {
        s_spawn_loc = array::random( level.zm_loc_types[ #"gegenees_location" ] );
    }
    
    if ( !isdefined( s_spawn_loc ) )
    {
        /#
            if ( getdvarint( #"hash_1f8efa579fee787c", 0 ) )
            {
                iprintlnbold( "<dev string:x86>" );
            }
        #/
        
        return undefined;
    }
    
    ai = function_2ce6dcd4( level.var_b3d6ef3b[ 0 ], s_spawn_loc, var_bc66d64b );
    
    if ( isdefined( ai ) )
    {
        ai forceteleport( s_spawn_loc.origin, s_spawn_loc.angles );
        
        if ( !( isdefined( s_spawn_loc.var_6efb24e2 ) && s_spawn_loc.var_6efb24e2 ) && isdefined( s_spawn_loc.scriptbundlename ) )
        {
            ai thread function_9a9b5f49( s_spawn_loc );
        }
        
        if ( isdefined( level.var_18645b05 ) )
        {
            ai thread [[ level.var_18645b05 ]]( s_spawn_loc );
        }
        
        ai playsound( #"hash_63299a75a97f9678" );
        bhtnactionstartevent( ai, "spawn" );
        self util::delay( 3, "death", &zm_audio::function_bca32e49, "stoker", "cue_react" );
    }
    
    return ai;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0xd0824853, Offset: 0x12a8
// Size: 0xbc, Type: bool
function function_48c60fc2()
{
    var_d6ddc067 = function_13080a96();
    var_ba74cbf9 = function_5685dac6();
    
    if ( !( isdefined( level.var_a2831281 ) && level.var_a2831281 ) && ( isdefined( level.var_153e9058 ) && level.var_153e9058 || var_d6ddc067 >= var_ba74cbf9 || !level flag::get( "spawn_zombies" ) ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0xa1f44add, Offset: 0x1370
// Size: 0xaa
function function_5685dac6()
{
    n_player_count = zm_utility::function_a2541519( level.players.size );
    
    switch ( n_player_count )
    {
        case 1:
            return 1;
        case 2:
            return 2;
        case 3:
            return 2;
        case 4:
            return 3;
    }
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 0
// Checksum 0xb2e2199d, Offset: 0x1428
// Size: 0xdc
function function_13080a96()
{
    if ( isdefined( level.var_95c10956 ) )
    {
        return [[ level.var_95c10956 ]]();
    }
    
    var_d5bd9bcb = getaiarchetypearray( #"gegenees" );
    var_d6ddc067 = var_d5bd9bcb.size;
    
    foreach ( ai_gegenees in var_d5bd9bcb )
    {
        if ( !isalive( ai_gegenees ) )
        {
            var_d6ddc067--;
        }
    }
    
    return var_d6ddc067;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 3
// Checksum 0xc11a6c3e, Offset: 0x1510
// Size: 0x90
function function_2ce6dcd4( spawner, s_spot, var_bc66d64b )
{
    ai_gegenees = zombie_utility::spawn_zombie( level.var_b3d6ef3b[ 0 ], "gegenees", s_spot, var_bc66d64b );
    
    if ( isdefined( ai_gegenees ) )
    {
        ai_gegenees.check_point_in_enabled_zone = &zm_utility::check_point_in_playable_area;
        ai_gegenees thread zombie_utility::round_spawn_failsafe();
    }
    
    return ai_gegenees;
}

// Namespace zombie_gegenees_util/ai_gegenees_util
// Params 1
// Checksum 0x46e6d4c6, Offset: 0x15a8
// Size: 0x1b2
function function_c1a0ea97( n_round_number )
{
    level endon( #"end_game" );
    
    if ( !isdefined( level.var_a5355505 ) )
    {
        level.var_a5355505 = 0;
    }
    
    /#
        switch ( level.round_number - n_round_number )
        {
            case 0:
                break;
            case 1:
            case 2:
                level.var_a5355505++;
                break;
            case 3:
            case 4:
                level.var_a5355505 += 2;
                break;
            default:
                level.var_a5355505 = undefined;
                return;
        }
    #/
    
    while ( true )
    {
        level waittill( #"hash_5d3012139f083ccb" );
        
        if ( zm_round_spawning::function_d0db51fc( #"gegenees" ) )
        {
            level.var_a5355505++;
            
            if ( level.var_a5355505 == 3 )
            {
                level.var_a5355505 = undefined;
                level.var_99695b55 = undefined;
                return;
            }
            
            level.var_99695b55 = level.round_number + randomintrangeinclusive( 2, 4 );
        }
    }
}

