#using scripts\core_common\ai\archetype_damage_utility;
#using scripts\core_common\ai\archetype_nova_crawler;
#using scripts\core_common\ai\archetype_utility;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\destructible_character;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai\zombie;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\zm_common\ai\zm_ai_utility;
#using scripts\zm_common\zm_audio;
#using scripts\zm_common\zm_devgui;
#using scripts\zm_common\zm_net;
#using scripts\zm_common\zm_score;
#using scripts\zm_common\zm_spawner;
#using scripts\zm_common\zm_utility;

#namespace zm_ai_nova_crawler;

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0, eflags: 0x2
// Checksum 0x41433c11, Offset: 0x278
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"zm_ai_nova_crawler", &__init__, &__main__, undefined );
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0
// Checksum 0x7db28002, Offset: 0x2c8
// Size: 0x29c
function __init__()
{
    assert( isscriptfunctionptr( &function_29c22852 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_4ead7642034f30f7", &function_29c22852 );
    assert( isscriptfunctionptr( &function_33b29495 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_3d7ced75f59bb519", &function_33b29495 );
    assert( isscriptfunctionptr( &function_27a1a846 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_6e9be4be56cd06d3", &function_27a1a846 );
    animationstatenetwork::registernotetrackhandlerfunction( "nova_crawler_melee", &function_99ac548f );
    animationstatenetwork::registernotetrackhandlerfunction( "nova_crawler_explosion", &function_272fa9b5 );
    spawner::add_archetype_spawn_function( #"nova_crawler", &function_1d34f2b6 );
    spawner::function_89a2cd87( #"nova_crawler", &function_1dc9be26 );
    
    /#
        zm_devgui::function_c7dd7a17( "<dev string:x38>" );
    #/
    
    clientfield::register( "actor", "nova_crawler_burst_clientfield", 1, 1, "int" );
    clientfield::register( "toplayer", "nova_crawler_burst_postfx_clientfield", 1, 1, "int" );
    clientfield::register( "toplayer", "nova_crawler_gas_cloud_postfx_clientfield", 1, 1, "int" );
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0
// Checksum 0x80f724d1, Offset: 0x570
// Size: 0x4
function __main__()
{
    
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0
// Checksum 0xaa436d5c, Offset: 0x580
// Size: 0x1b6
function function_1d34f2b6()
{
    var_626a6a36 = zm_ai_utility::function_8d44707e( 1 );
    var_626a6a36 *= isdefined( level.var_1eb98fb1 ) ? level.var_1eb98fb1 : 1;
    self.maxhealth = int( var_626a6a36 );
    self.health = self.maxhealth;
    self.meleedamage = ai::function_9139c839().var_f2367046;
    self.var_1731eda3 = 1;
    self.var_2c628c0f = 1;
    self.canbetargetedbyturnedzombies = 1;
    self.is_zombie = 1;
    self.var_34b2e48 = 1;
    self.var_442eb649 = 1;
    self.actor_killed_override = &function_c5b157a6;
    self zm_score::function_82732ced();
    self zm_utility::init_zombie_run_cycle();
    self thread zm_audio::zmbaivox_notifyconvert();
    self thread zm_audio::play_ambient_zombie_vocals();
    self thread zm_audio::zmbaivox_playvox( self, "spawn", 1, 3 );
    
    if ( !isdefined( self._effect ) )
    {
        self._effect = [];
        self._effect[ #"nova_crawler_aura_fx" ] = "zm_ai/fx8_nova_crawler_gas_trail";
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0, eflags: 0x4
// Checksum 0x88ef688d, Offset: 0x740
// Size: 0x1c
function private function_1dc9be26()
{
    self thread function_488c1ac2();
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0xf9ab2584, Offset: 0x768
// Size: 0x76, Type: bool
function private function_edb72673( origin )
{
    goal_pos = getclosestpointonnavmesh( origin, 200, 24 );
    
    if ( isdefined( goal_pos ) )
    {
        self function_a57c34b7( goal_pos );
        return true;
    }
    
    self function_a57c34b7( self.origin );
    return false;
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1
// Checksum 0xcc1e5d5c, Offset: 0x7e8
// Size: 0x26e, Type: bool
function function_29c22852( entity )
{
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( entity.marked_for_death ) )
    {
        return false;
    }
    
    if ( isdefined( entity.ignoremelee ) && entity.ignoremelee )
    {
        return false;
    }
    
    if ( abs( entity.origin[ 2 ] - entity.enemy.origin[ 2 ] ) > 64 )
    {
        return false;
    }
    
    if ( isdefined( entity.meleeweapon ) && entity.meleeweapon !== level.weaponnone )
    {
        meleedistsq = entity.meleeweapon.aimeleerange * entity.meleeweapon.aimeleerange;
    }
    
    if ( !isdefined( meleedistsq ) )
    {
        return false;
    }
    
    if ( distancesquared( entity.origin, entity.enemy.origin ) > meleedistsq )
    {
        return false;
    }
    
    yawtoenemy = angleclamp180( entity.angles[ 1 ] - vectortoangles( entity.enemy.origin - entity.origin )[ 1 ] );
    
    if ( abs( yawtoenemy ) > 60 )
    {
        return false;
    }
    
    if ( !entity cansee( entity.enemy ) )
    {
        return false;
    }
    
    if ( !tracepassedonnavmesh( entity.origin, isdefined( entity.enemy.last_valid_position ) ? entity.enemy.last_valid_position : entity.enemy.origin, entity getpathfindingradius() ) )
    {
        return false;
    }
    
    return true;
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x3c8af241, Offset: 0xa60
// Size: 0xa0
function private function_33b29495( entity )
{
    var_711090a2 = 0;
    var_b77044e1 = lerpfloat( 0.2, 0.8, math::clamp( ( level.round_number - 1 ) / 30, 0, 1 ) );
    
    if ( randomfloat( 1 ) <= var_b77044e1 )
    {
        var_711090a2 = 1;
    }
    
    return var_711090a2;
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x7a0d10cb, Offset: 0xb08
// Size: 0x4a
function private function_27a1a846( entity )
{
    var_62d41d8f = 0;
    
    if ( isdefined( self.killed_enemy_player ) && self.killed_enemy_player )
    {
        var_62d41d8f = 1;
        self.killed_enemy_player = 0;
    }
    
    return var_62d41d8f;
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x3085f77a, Offset: 0xb60
// Size: 0x96
function private function_99ac548f( entity )
{
    var_75aa8513 = 0;
    
    if ( isdefined( entity.enemy ) && zm_utility::is_player_valid( entity.enemy ) )
    {
        var_75aa8513 = 1;
    }
    
    zombiebehavior::zombienotetrackmeleefire( entity );
    
    if ( var_75aa8513 && !zm_utility::is_player_valid( entity.enemy ) )
    {
        self.killed_enemy_player = 1;
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 0, eflags: 0x4
// Checksum 0x5a4f21b0, Offset: 0xc00
// Size: 0x64
function private function_488c1ac2()
{
    self endon( #"death" );
    self waittilltimeout( 1, #"spawn_complete" );
    zm_net::network_safe_play_fx_on_tag( "quad_trail", 2, self._effect[ #"nova_crawler_aura_fx" ], self, "j_spine4" );
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 2, eflags: 0x4
// Checksum 0x97996592, Offset: 0xc70
// Size: 0x276
function private function_d79b3357( entity, origin )
{
    playsoundatposition( #"zmb_quad_explo", origin );
    entity clientfield::set( "nova_crawler_burst_clientfield", 1 );
    players = getplayers();
    zombies = getaiteamarray( level.zombie_team );
    
    for ( i = 0; i < zombies.size ; i++ )
    {
        if ( zombies[ i ].archetype != #"nova_crawler" && distance( origin, zombies[ i ].origin ) <= 96 )
        {
            zombies[ i ] dodamage( zombies[ i ].maxhealth * 1.05, origin, entity );
            
            if ( zombies[ i ].health <= 0 )
            {
                zombies[ i ] startragdoll();
                zombies[ i ] launchragdoll( zombies[ i ].origin - origin );
            }
        }
    }
    
    if ( isdefined( self.var_442eb649 ) && self.var_442eb649 )
    {
        for ( i = 0; i < players.size ; i++ )
        {
            if ( distance( origin, players[ i ].origin ) <= 96 )
            {
                players[ i ] shellshock( #"explosion", 2.5 );
                players[ i ] clientfield::set_to_player( "nova_crawler_burst_postfx_clientfield", 1 );
            }
        }
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x8a657e9c, Offset: 0xef0
// Size: 0x1cc
function private function_4632879c( entity )
{
    effectarea = spawn( "trigger_radius", entity.origin, 0, 125, 100 );
    gas_time = 0;
    
    while ( gas_time <= 7 )
    {
        players = getplayers();
        
        for ( i = 0; i < players.size ; i++ )
        {
            if ( players[ i ] istouching( effectarea ) )
            {
                players[ i ] clientfield::set_to_player( "nova_crawler_gas_cloud_postfx_clientfield", 1 );
                continue;
            }
            
            players[ i ] clientfield::set_to_player( "nova_crawler_gas_cloud_postfx_clientfield", 0 );
        }
        
        wait 1;
        gas_time += 1;
    }
    
    players = getplayers();
    
    for ( i = 0; i < players.size ; i++ )
    {
        players[ i ] clientfield::set_to_player( "nova_crawler_burst_postfx_clientfield", 0 );
        players[ i ] clientfield::set_to_player( "nova_crawler_gas_cloud_postfx_clientfield", 0 );
    }
    
    effectarea delete();
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 1, eflags: 0x4
// Checksum 0x9386a97d, Offset: 0x10c8
// Size: 0x8c
function private function_272fa9b5( entity )
{
    if ( isdefined( self.can_explode ) && self.can_explode )
    {
        self thread function_d79b3357( self, self.origin );
        
        if ( isdefined( self.var_34b2e48 ) && self.var_34b2e48 )
        {
            level thread function_4632879c( self );
        }
        
        gibserverutils::annihilate( self );
    }
}

// Namespace zm_ai_nova_crawler/zm_ai_nova_crawler
// Params 8
// Checksum 0x926974b5, Offset: 0x1160
// Size: 0x1a4
function function_c5b157a6( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime )
{
    if ( self.archetype == #"nova_crawler" )
    {
        self destructserverutils::togglespawngibs( self, 1 );
        self destructserverutils::function_629a8d54( self, "tag_weapon_right" );
    }
    
    self thread zombie_utility::zombie_gib( idamage, attacker, vdir, self gettagorigin( "j_spine4" ), smeansofdeath, shitloc, undefined, undefined, weapon );
    
    if ( isdefined( self.lgt_env_helping_hand_room_1 ) && self.lgt_env_helping_hand_room_1 && zm_utility::is_explosive_damage( smeansofdeath ) )
    {
        gibserverutils::annihilate( self );
        return;
    }
    
    if ( smeansofdeath == "MOD_PISTOL_BULLET" || smeansofdeath == "MOD_RIFLE_BULLET" )
    {
        self.can_explode = 1;
    }
    else
    {
        self.can_explode = 0;
    }
    
    zm_spawner::zombie_death_animscript( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime );
}

