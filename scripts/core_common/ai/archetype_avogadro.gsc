#using scripts\core_common\ai\systems\ai_blackboard;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks;
#using scripts\core_common\ai\systems\animation_state_machine_utility;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace archetype_avogadro;

// Namespace archetype_avogadro/archetype_avogadro
// Params 0, eflags: 0x2
// Checksum 0x26f7fd59, Offset: 0x1f0
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"archetype_avogadro", &__init__, &__main__, undefined );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0x3941b480, Offset: 0x240
// Size: 0x164
function __init__()
{
    registerbehaviorscriptfunctions();
    function_6bb82ac9();
    clientfield::register( "scriptmover", "" + #"avogadro_bolt_fx", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"avogadro_phase_fx", 16000, 1, "int" );
    clientfield::register( "actor", "" + #"avogadro_health_fx", 16000, 2, "int" );
    spawner::add_archetype_spawn_function( #"avogadro", &function_ee579eb5 );
    spawner::function_89a2cd87( #"avogadro", &function_d1359818 );
    callback::on_player_damage( &function_99ce086a );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0x7830522e, Offset: 0x3b0
// Size: 0x2e
function __main__()
{
    level.var_2ea60515 = getstatuseffect( #"avogadro_shock_slowed" );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0xca9346e7, Offset: 0x3e8
// Size: 0x104
function function_6bb82ac9()
{
    level.avogadrobolts = [];
    
    for ( i = 0; i < 3 ; i++ )
    {
        bolt = spawn( "script_model", ( 0, 0, 0 ) );
        bolt setmodel( "tag_origin" );
        
        if ( !isdefined( level.avogadrobolts ) )
        {
            level.avogadrobolts = [];
        }
        else if ( !isarray( level.avogadrobolts ) )
        {
            level.avogadrobolts = array( level.avogadrobolts );
        }
        
        level.avogadrobolts[ level.avogadrobolts.size ] = bolt;
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0x55088365, Offset: 0x4f8
// Size: 0x44c
function registerbehaviorscriptfunctions()
{
    assert( isscriptfunctionptr( &function_f8e8c129 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_520d52c557d9427", &function_f8e8c129 );
    assert( isscriptfunctionptr( &function_7e5905cd ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_3a8b7da6a91d85f3", &function_7e5905cd );
    assert( isscriptfunctionptr( &function_6cf71c35 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_166fe23bafc2408", &function_6cf71c35 );
    assert( isscriptfunctionptr( &function_1169b184 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_3e8335833e76fa0e", &function_1169b184 );
    assert( isscriptfunctionptr( &function_9ab1c000 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_1d3ff4cb570ac40", &function_9ab1c000 );
    assert( isscriptfunctionptr( &function_3b8d314c ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_75ba4163e4512e01", &function_3b8d314c );
    assert( isscriptfunctionptr( &function_dbba31c1 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_4a0a227cda451796", &function_dbba31c1 );
    assert( isscriptfunctionptr( &function_95141921 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_177974191a99d4ac", &function_95141921 );
    assert( isscriptfunctionptr( &function_a495d71f ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_49880776aa68a310", &function_a495d71f, 1 );
    assert( isscriptfunctionptr( &function_a495d71f ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_2b76cd8d945e7de7", &function_a495d71f, 1 );
    animationstatenetwork::registernotetrackhandlerfunction( "avogadro_shoot_bolt", &shoot_bolt_wait );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0xd3f54384, Offset: 0x950
// Size: 0xdc
function function_ee579eb5()
{
    self callback::function_d8abfc3d( #"on_ai_killed", &function_8886bcc4 );
    self callback::function_d8abfc3d( #"on_actor_damage", &function_50a86206 );
    self.shield = 1;
    self.hit_by_melee = 0;
    self.phase_time = 0;
    self.var_1ce249af = 0;
    self.var_15aa1ae0 = 2000;
    self.var_f3bbe853 = 1;
    self.var_7fde19e8 = 0;
    self.var_9bff71aa = 0;
    self function_8a404313();
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0, eflags: 0x4
// Checksum 0xdc9c496d, Offset: 0xa38
// Size: 0x4a
function private function_8a404313()
{
    blackboard::createblackboardforentity( self );
    ai::createinterfaceforentity( self );
    self.___archetypeonanimscriptedcallback = &function_c7791d22;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1, eflags: 0x4
// Checksum 0xd9c2e93a, Offset: 0xa90
// Size: 0x2c
function private function_c7791d22( entity )
{
    entity.__blackboard = undefined;
    entity function_8a404313();
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0
// Checksum 0xdea697a5, Offset: 0xac8
// Size: 0x1c
function function_d1359818()
{
    function_dbc638a8( self );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x5238d9f3, Offset: 0xaf0
// Size: 0x4c
function function_8886bcc4( params )
{
    if ( isdefined( self.bolt ) )
    {
        releasebolt( self.bolt );
    }
    
    self show();
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 12
// Checksum 0x502b55e9, Offset: 0xb48
// Size: 0xc8
function function_99ce086a( inflictor, attacker, damage, flags, meansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, surfacetype )
{
    if ( isdefined( inflictor ) && inflictor.archetype === #"avogadro" && meansofdeath == "MOD_MELEE" )
    {
        self status_effect::status_effect_apply( level.var_2ea60515, undefined, inflictor, 0 );
    }
    
    return -1;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x5e49bb67, Offset: 0xc18
// Size: 0xfc
function function_dbc638a8( entity )
{
    if ( entity.health < entity.maxhealth * 0.33 )
    {
        entity clientfield::set( "" + #"avogadro_health_fx", 1 );
        return;
    }
    
    if ( entity.health < entity.maxhealth * 0.66 )
    {
        entity clientfield::set( "" + #"avogadro_health_fx", 2 );
        return;
    }
    
    entity clientfield::set( "" + #"avogadro_health_fx", 3 );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x7f195033, Offset: 0xd20
// Size: 0x24
function function_50a86206( params )
{
    function_dbc638a8( self );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0xd3b082ae, Offset: 0xd50
// Size: 0x62
function function_80fc1a78( time )
{
    self notify( "3a74e555d7969d08" );
    self endon( #"death", #"hash_7d29584dcbbe7d67", "4c2f097babffd515" );
    self show();
    wait time;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 0, eflags: 0x4
// Checksum 0xb8e074eb, Offset: 0xdc0
// Size: 0xc6
function private function_66dd488a()
{
    foreach ( bolt in level.avogadrobolts )
    {
        if ( isalive( bolt.owner ) || bolt clientfield::get( "" + #"avogadro_bolt_fx" ) == 1 )
        {
            continue;
        }
        
        return bolt;
    }
    
    return undefined;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 2, eflags: 0x4
// Checksum 0x55dfe276, Offset: 0xe90
// Size: 0x5a
function private function_7e03184e( bolt, entity )
{
    assert( !isalive( bolt.owner ) );
    bolt.owner = entity;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1, eflags: 0x4
// Checksum 0xac0151a4, Offset: 0xef8
// Size: 0x16
function private releasebolt( bolt )
{
    bolt.owner = undefined;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1, eflags: 0x4
// Checksum 0xd1dd5840, Offset: 0xf18
// Size: 0x382, Type: bool
function private function_f8e8c129( entity )
{
    if ( isdefined( entity.can_shoot ) && !entity.can_shoot )
    {
        return false;
    }
    
    var_99387d40 = blackboard::getblackboardevents( #"hash_27bee30b37f7debe" );
    
    if ( var_99387d40.size > 0 )
    {
        return false;
    }
    
    if ( isdefined( level.var_a35afcb2 ) && ![[ level.var_a35afcb2 ]]( entity ) )
    {
        return false;
    }
    
    if ( isdefined( entity.bolt ) )
    {
        return true;
    }
    
    bolt = function_66dd488a();
    
    if ( !isdefined( bolt ) )
    {
        return false;
    }
    
    enemy = isdefined( self.attackable ) ? self.attackable : self.favoriteenemy;
    
    if ( isdefined( enemy ) )
    {
        vec_enemy = enemy.origin - self.origin;
        dist_sq = lengthsquared( vec_enemy );
        
        if ( dist_sq > 14400 && dist_sq < 360000 )
        {
            vec_facing = anglestoforward( self.angles );
            norm_facing = vectornormalize( vec_facing );
            norm_enemy = vectornormalize( vec_enemy );
            dot = vectordot( norm_facing, norm_enemy );
            var_482d3bba = ( vec_facing[ 0 ], vec_facing[ 1 ], 0 );
            var_45ed4f50 = vectornormalize( ( vec_facing[ 0 ], vec_facing[ 1 ], 0 ) );
            var_9743030a = vectornormalize( ( vec_enemy[ 0 ], vec_enemy[ 1 ], 0 ) );
            var_5e958f82 = vectordot( var_45ed4f50, var_9743030a );
            
            if ( dot > 0.707 && var_5e958f82 > 0.99 )
            {
                var_f6a4b2f3 = enemy getcentroid();
                
                if ( issentient( enemy ) )
                {
                    var_f6a4b2f3 = enemy geteye();
                }
                
                eye_pos = self geteye();
                passed = bullettracepassed( eye_pos, var_f6a4b2f3, 0, undefined );
                
                if ( passed )
                {
                    function_7e03184e( bolt, entity );
                    entity.bolt = bolt;
                    return true;
                }
            }
        }
    }
    
    return false;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1, eflags: 0x4
// Checksum 0xae7fdd10, Offset: 0x12a8
// Size: 0xcc
function private function_7e5905cd( entity )
{
    enemy = self.favoriteenemy;
    
    if ( isdefined( enemy ) )
    {
        self.shield = 1;
        self notify( #"hash_7d29584dcbbe7d67" );
        self show();
    }
    
    var_8706203c = 500;
    
    if ( isdefined( entity.var_fffac33 ) )
    {
        var_8706203c = [[ entity.var_fffac33 ]]( entity );
    }
    
    blackboard::addblackboardevent( #"hash_27bee30b37f7debe", { #entity:self }, var_8706203c );
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1, eflags: 0x4
// Checksum 0xcbe2ab39, Offset: 0x1380
// Size: 0x3e
function private function_6cf71c35( entity )
{
    if ( isdefined( entity.bolt ) )
    {
        releasebolt( entity.bolt );
        entity.bolt = undefined;
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1, eflags: 0x4
// Checksum 0x6ff2dfa8, Offset: 0x13c8
// Size: 0x21c
function private shoot_bolt_wait( entity )
{
    bolt = entity.bolt;
    entity.bolt = undefined;
    
    if ( !isdefined( entity.favoriteenemy ) )
    {
        releasebolt( bolt );
        return;
    }
    
    enemy = entity.favoriteenemy;
    self.shield = 0;
    self notify( #"stop_health" );
    self clientfield::set( "" + #"avogadro_health_fx", 0 );
    source_pos = self gettagorigin( "tag_weapon_right" );
    target_pos = enemy geteye();
    bolt.origin = source_pos;
    bolt endon( #"death" );
    wait 0.1;
    bolt clientfield::set( "" + #"avogadro_bolt_fx", 1 );
    bolt moveto( target_pos, 0.2 );
    bolt waittill( #"movedone" );
    bolt check_bolt_impact( entity, enemy );
    bolt clientfield::set( "" + #"avogadro_bolt_fx", 0 );
    
    if ( isdefined( bolt.owner ) )
    {
        releasebolt( bolt );
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 2
// Checksum 0xb8667912, Offset: 0x15f0
// Size: 0x12c
function check_bolt_impact( entity, enemy )
{
    if ( zombie_utility::is_player_valid( enemy ) )
    {
        enemy_eye_pos = enemy geteye();
        dist_sq = distancesquared( self.origin, enemy_eye_pos );
        
        if ( dist_sq < 4096 )
        {
            passed = bullettracepassed( self.origin, enemy_eye_pos, 0, undefined );
            
            if ( passed )
            {
                enemy status_effect::status_effect_apply( level.var_2ea60515, undefined, self, 0 );
                enemy dodamage( isdefined( level.var_c01b1042 ) ? level.var_c01b1042 : 60, enemy.origin, entity, undefined, undefined, "MOD_PROJECTILE" );
            }
        }
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0xfc36c5a2, Offset: 0x1728
// Size: 0x36
function function_95141921( entity )
{
    function_dbc638a8( entity );
    self.phase_time = gettime() - 1;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x6446a726, Offset: 0x1768
// Size: 0x38e
function function_a495d71f( entity )
{
    var_2d734075 = !isdefined( level.var_8791f7c5 ) || [[ level.var_8791f7c5 ]]( entity );
    
    if ( gettime() > entity.phase_time && var_2d734075 )
    {
        if ( entity function_dd070839() || isdefined( entity.traversestartnode ) )
        {
            entity.phase_time = gettime() + self.var_15aa1ae0;
            entity.var_1ce249af = 0;
            return;
        }
        
        var_cfa253f9 = array( "back", "forward", "left", "right" );
        var_160337aa = array( "long", "medium", "short" );
        var_160337aa = array::randomize( var_160337aa );
        direction = array::random( var_cfa253f9 );
        
        foreach ( distance in var_160337aa )
        {
            entity setblackboardattribute( "_phase_direction", direction );
            entity setblackboardattribute( "_phase_distance", distance );
            result = entity astsearch( "phase@avogadro" );
            animation = animationstatenetworkutility::searchanimationmap( entity, result[ #"animation" ] );
            
            if ( isdefined( animation ) )
            {
                localdeltavector = getmovedelta( animation, 0, 1, entity );
                endpoint = entity localtoworldcoords( localdeltavector );
                
                if ( ispointonnavmesh( endpoint, entity ) && self maymovefrompointtopoint( entity.origin, endpoint, 1, 1 ) )
                {
                    /#
                        recordline( entity.origin, endpoint, ( 0, 1, 0 ) );
                        recordsphere( endpoint, 15, ( 0, 1, 0 ) );
                    #/
                    
                    entity.var_1ce249af = 1;
                    return 1;
                }
                
                /#
                    recordline( entity.origin, endpoint, ( 1, 0, 0 ) );
                    recordsphere( endpoint, 15, ( 1, 0, 0 ) );
                #/
            }
        }
    }
    
    entity.var_1ce249af = 0;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x8ef6b5eb, Offset: 0x1b00
// Size: 0x3e
function function_9ab1c000( entity )
{
    if ( isdefined( entity.can_phase ) && !entity.can_phase )
    {
        return 0;
    }
    
    return entity.var_1ce249af;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0xcab2fc54, Offset: 0x1b48
// Size: 0xdc
function function_3b8d314c( entity )
{
    entity thread function_80fc1a78( 0.1 );
    entity.blockingpain = 1;
    entity.var_1ce249af = 0;
    entity.is_phasing = 1;
    
    if ( isdefined( self.var_f3bbe853 ) && self.var_f3bbe853 )
    {
        entity clientfield::set( "" + #"avogadro_phase_fx", 1 );
    }
    
    if ( gettime() - entity.var_7fde19e8 > 1000 )
    {
        entity.var_9bff71aa = 0;
        return;
    }
    
    entity.var_9bff71aa++;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x78ef5853, Offset: 0x1c30
// Size: 0x2e
function function_36f6a838( entity )
{
    entity.phase_time = gettime() + self.var_15aa1ae0;
    entity.var_1ce249af = 0;
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0x27936e21, Offset: 0x1c68
// Size: 0xb4
function function_dbba31c1( entity )
{
    entity thread function_80fc1a78( 0.1 );
    entity.blockingpain = 0;
    entity.phase_time = gettime() + self.var_15aa1ae0;
    entity.is_phasing = undefined;
    entity.var_7fde19e8 = gettime();
    
    if ( isdefined( self.var_f3bbe853 ) && self.var_f3bbe853 )
    {
        entity clientfield::set( "" + #"avogadro_phase_fx", 0 );
    }
}

// Namespace archetype_avogadro/archetype_avogadro
// Params 1
// Checksum 0xbe8e297e, Offset: 0x1d28
// Size: 0x24
function function_1169b184( entity )
{
    function_dbc638a8( entity );
}

