#using script_1f0e83e43bf9c3b9;
#using scripts\core_common\aat_shared;
#using scripts\core_common\ai\systems\ai_blackboard;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp;
#using scripts\core_common\ai\systems\animation_state_machine_notetracks;
#using scripts\core_common\ai\systems\behavior_state_machine;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai_shared;
#using scripts\core_common\animation_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;

#namespace archetypenosferatu;

// Namespace archetypenosferatu
// Method(s) 2 Total 2
class class_1546f28e
{

    var adjustmentstarted;
    var var_425c4c8b;

    // Namespace class_1546f28e/archetype_nosferatu
    // Params 0, eflags: 0x8
    // Checksum 0x28394f17, Offset: 0x2970
    // Size: 0x1a
    constructor()
    {
        adjustmentstarted = 0;
        var_425c4c8b = 1;
    }

}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 0, eflags: 0x2
// Checksum 0xcaf45d29, Offset: 0x2e0
// Size: 0x84
function autoexec init()
{
    namespace_b3c8cf82::function_da6eecb2();
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function( #"nosferatu", &function_5b800648 );
    clientfield::register( "actor", "nfrtu_leap_melee_rumb", 8000, 1, "counter" );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 0, eflags: 0x4
// Checksum 0x22f59577, Offset: 0x370
// Size: 0x4a
function private function_dbd0360f()
{
    blackboard::createblackboardforentity( self );
    self.___archetypeonanimscriptedcallback = &function_f8ab724f;
    self.___archetypeonbehavecallback = &function_b1df7220;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xf3993833, Offset: 0x3c8
// Size: 0xc
function private function_b1df7220( entity )
{
    
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xe361d549, Offset: 0x3e0
// Size: 0x2c
function private function_f8ab724f( entity )
{
    self.__blackboard = undefined;
    self function_dbd0360f();
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 0, eflags: 0x4
// Checksum 0xf2c10870, Offset: 0x418
// Size: 0xb4
function private function_5b800648()
{
    assert( isdefined( self.ai ) );
    function_dbd0360f();
    self.ignorepathenemyfightdist = 1;
    self.var_ceed8829 = 1;
    self.zigzag_activation_distance = 400;
    self.var_7d39ec6a = 1;
    self setavoidancemask( "avoid actor" );
    self callback::function_d8abfc3d( #"on_ai_melee", &function_2e5f2af4 );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 0, eflags: 0x4
// Checksum 0x1b1a29bc, Offset: 0x4d8
// Size: 0x3c
function private function_2e5f2af4()
{
    if ( isdefined( self.meleeinfo ) )
    {
        radiusdamage( self.origin, 150, 15, 5, self, "MOD_MELEE" );
    }
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 0, eflags: 0x4
// Checksum 0x904213cb, Offset: 0x520
// Size: 0x804
function private registerbehaviorscriptfunctions()
{
    assert( isscriptfunctionptr( &nosferatushouldmelee ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"nosferatushouldmelee", &nosferatushouldmelee );
    assert( isscriptfunctionptr( &function_7ffbbff ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_986eb7e87a024a", &function_7ffbbff );
    assert( isscriptfunctionptr( &function_85d8b15d ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_12fd6029cfc2a603", &function_85d8b15d );
    assert( isscriptfunctionptr( &function_4df0b87d ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_571c2407eee0f7ce", &function_4df0b87d );
    assert( isscriptfunctionptr( &function_ed80a3bc ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_326882aa02157f0d", &function_ed80a3bc );
    assert( isscriptfunctionptr( &function_15d413b9 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_4c559b769f33559e", &function_15d413b9 );
    assert( isscriptfunctionptr( &function_e9819a23 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_7c46d4f8f6bd8a19", &function_e9819a23 );
    assert( isscriptfunctionptr( &function_b5047448 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_d557a256994b864", &function_b5047448 );
    assert( isscriptfunctionptr( &function_15d413b9 ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_4c559b769f33559e", &function_15d413b9 );
    assert( isscriptfunctionptr( &function_a41a5aea ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_2392a1b5bcda2a4d", &function_a41a5aea );
    assert( isscriptfunctionptr( &function_b5305a8f ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_55bb0ab8a037fcca", &function_b5305a8f );
    assert( isscriptfunctionptr( &function_ebe0e1b5 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_38a10af328e33bf7", &function_ebe0e1b5 );
    assert( isscriptfunctionptr( &function_76505306 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_5ba3133a0e93c9f1", &function_76505306 );
    assert( isscriptfunctionptr( &function_e0ad0db2 ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"hash_77c524bf92130b36", &function_e0ad0db2 );
    assert( isscriptfunctionptr( &function_b75dd595 ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_544b52e495ac560e", &function_b75dd595 );
    assert( isscriptfunctionptr( &function_8b2173e0 ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_4d02bd1f2f959be9", &function_8b2173e0 );
    assert( isscriptfunctionptr( &function_b758de87 ) );
    behaviorstatemachine::registerbsmscriptapiinternal( #"hash_ee12d5fffc3b8bb", &function_b758de87 );
    animationstatenetwork::registeranimationmocomp( "mocomp_nfrtu_leap_attack", &function_1ad502a0, &function_3511ecd1, &function_b472ba3d );
    animationstatenetwork::registeranimationmocomp( "mocomp_nfrtu_latch_attack", &function_1ad502a0, &function_3511ecd1, &function_b472ba3d );
    animationstatenetwork::registeranimationmocomp( "mocomp_nfrtu_run_attack", &function_37d5cfc, undefined, &function_4b55eb0a );
    animationstatenetwork::registernotetrackhandlerfunction( "nosferatu_leap_attack_rumble", &nfrtuleaprumble );
    animationstatenetwork::registernotetrackhandlerfunction( "nosferatu_bite", &function_2e8014e );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1
// Checksum 0x640f62c5, Offset: 0xd30
// Size: 0x74
function function_2e8014e( entity )
{
    if ( isdefined( entity ) && isdefined( entity.enemy ) )
    {
        entity.enemy dodamage( 25, entity.enemy.origin, entity, entity, "neck", "MOD_MELEE" );
    }
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x7c5d8b02, Offset: 0xdb0
// Size: 0x104, Type: bool
function private function_b75dd595( entity )
{
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( entity.subarchetype !== #"crimson_nosferatu" )
    {
        return false;
    }
    
    var_ae9326df = blackboard::getblackboardevents( "nfrtu_move_dash" );
    
    if ( isdefined( var_ae9326df ) && var_ae9326df.size )
    {
        foreach ( var_d86ae1c4 in var_ae9326df )
        {
            if ( var_d86ae1c4.data.enemy === entity.enemy )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x49fdd6c6, Offset: 0xec0
// Size: 0x78, Type: bool
function private function_8b2173e0( entity )
{
    var_d86ae1c4 = spawnstruct();
    var_d86ae1c4.enemy = entity.enemy;
    blackboard::addblackboardevent( "nfrtu_move_dash", var_d86ae1c4, randomintrange( 8500, 10000 ) );
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xae804bc8, Offset: 0xf40
// Size: 0x114, Type: bool
function private function_3df24b25( entity )
{
    /#
        if ( getdvarint( #"hash_5ebc5d42d65e6fd1", 0 ) )
        {
            return true;
        }
    #/
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    var_935d5acc = blackboard::getblackboardevents( "nfrtu_latch_melee" );
    
    if ( isdefined( var_935d5acc ) && var_935d5acc.size )
    {
        foreach ( var_1e5d8d32 in var_935d5acc )
        {
            if ( var_1e5d8d32.data.enemy === entity.enemy )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xc09ec05a, Offset: 0x1060
// Size: 0x88, Type: bool
function private function_15d413b9( entity )
{
    entity.var_1c33120d = 1;
    var_1e5d8d32 = spawnstruct();
    var_1e5d8d32.enemy = entity.enemy;
    blackboard::addblackboardevent( "nfrtu_latch_melee", var_1e5d8d32, randomintrange( 30000, 50000 ) );
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x5f8fef07, Offset: 0x10f0
// Size: 0x94
function private function_b758de87( entity )
{
    entity.var_1c33120d = 0;
    entity clearpath();
    var_3bfe8ebe = spawnstruct();
    var_3bfe8ebe.enemy = entity.enemy;
    blackboard::addblackboardevent( "nfrtu_leap_melee", var_3bfe8ebe, randomintrange( 6000, 9000 ) );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xb0850cd6, Offset: 0x1190
// Size: 0x38, Type: bool
function private function_b5305a8f( entity )
{
    if ( isdefined( entity.enemy ) )
    {
        entity thread function_20a76c21( entity );
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x382092c2, Offset: 0x11d0
// Size: 0xcc
function private function_2ad18645( notifyhash )
{
    player = self;
    
    if ( isdefined( self ) && !isplayer( self ) && isdefined( self.enemy ) && isplayer( self.enemy ) )
    {
        player = self.enemy;
    }
    
    if ( isdefined( player ) )
    {
        player val::reset( #"nosferatu_latch", "ignoreme" );
        player val::reset( #"nosferatu_latch", "disable_weapons" );
    }
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 2, eflags: 0x4
// Checksum 0x4291e032, Offset: 0x12a8
// Size: 0x106
function private function_fb3fdf43( entity, latch_enemy )
{
    entity endoncallback( &function_2ad18645, #"death" );
    latch_enemy endoncallback( &function_2ad18645, #"disconnect", #"death" );
    
    if ( isdefined( self ) && isdefined( entity ) && isdefined( latch_enemy ) )
    {
        self scene::play( #"aib_vign_cust_mnsn_nfrtu_attack_latch_01", array( entity, latch_enemy ) );
    }
    
    if ( isdefined( entity ) )
    {
        entity.meleeinfo = undefined;
        entity.var_1c33120d = 0;
    }
    
    if ( isdefined( self ) )
    {
        self notify( #"hash_7a32b2af2eef5415" );
    }
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x913fccff, Offset: 0x13b8
// Size: 0x21c
function private function_20a76c21( entity )
{
    entity endoncallback( &function_2ad18645, #"death" );
    latch_enemy = entity.enemy;
    latch_enemy endoncallback( &function_2ad18645, #"disconnect", #"death" );
    
    if ( isdefined( latch_enemy ) )
    {
        latch_enemy thread function_db62d88a();
    }
    
    alignnode = spawnstruct();
    alignnode.origin = entity.enemy.origin;
    alignnode.angles = entity.enemy.angles;
    alignnode thread function_fb3fdf43( entity, latch_enemy );
    alignnode waittilltimeout( 7, #"hash_7a32b2af2eef5415" );
    
    if ( isdefined( alignnode ) )
    {
        alignnode struct::delete();
    }
    
    if ( isdefined( latch_enemy ) )
    {
        latch_enemy val::reset( #"nosferatu_latch", "disable_weapons" );
        latch_enemy notify( #"hash_7a32b2af2eef5415" );
    }
    
    if ( isdefined( entity ) )
    {
        entity.var_1c33120d = 0;
        entity clearpath();
    }
    
    var_3bfe8ebe = spawnstruct();
    var_3bfe8ebe.enemy = latch_enemy;
    blackboard::addblackboardevent( "nfrtu_leap_melee", var_3bfe8ebe, randomintrange( 6000, 9000 ) );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 0, eflags: 0x4
// Checksum 0xed99080e, Offset: 0x15e0
// Size: 0xfc
function private function_db62d88a()
{
    self endon( #"disconnect", #"death" );
    self val::set( #"nosferatu_latch", "ignoreme", 1 );
    w_current = self getcurrentweapon();
    
    if ( isdefined( w_current ) && isdefined( w_current.isheroweapon ) && w_current.isheroweapon )
    {
        self val::set( #"nosferatu_latch", "disable_weapons", 1 );
    }
    
    wait 8;
    self val::reset( #"nosferatu_latch", "ignoreme" );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x6afa6433, Offset: 0x16e8
// Size: 0x1f6, Type: bool
function private function_a41a5aea( entity )
{
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( !isplayer( entity.enemy ) )
    {
        return false;
    }
    
    if ( isdefined( entity.enemy.var_7ebdb2c9 ) && entity.enemy.var_7ebdb2c9 )
    {
        return false;
    }
    
    if ( abs( entity.origin[ 2 ] - entity.enemy.origin[ 2 ] ) > 64 )
    {
        return false;
    }
    
    distancesq = distancesquared( entity.origin, entity.enemy.origin );
    
    if ( distancesq >= 96 * 96 )
    {
        return false;
    }
    
    if ( !entity cansee( entity.enemy ) )
    {
        return false;
    }
    
    enemyangles = entity.enemy getplayerangles();
    
    if ( !util::within_fov( entity.enemy.origin, enemyangles, self.origin, cos( 25 ) ) )
    {
        return false;
    }
    
    if ( !tracepassedonnavmesh( entity.origin, entity.enemy.origin, entity getpathfindingradius() ) )
    {
        return false;
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xe2dcd702, Offset: 0x18e8
// Size: 0x182, Type: bool
function private function_b5047448( entity )
{
    if ( entity asmistransitionrunning() || entity asmistransdecrunning() )
    {
        return false;
    }
    
    if ( isdefined( entity.enemy ) )
    {
        if ( !entity haspath() )
        {
            return false;
        }
        
        if ( !btapi_shouldchargemelee( entity ) )
        {
            return false;
        }
        
        if ( !function_c2f87d6( entity ) )
        {
            return false;
        }
        
        if ( !isplayer( entity.enemy ) )
        {
            return false;
        }
        
        if ( abs( entity.origin[ 2 ] - entity.enemy.origin[ 2 ] ) > 64 )
        {
            return false;
        }
        
        if ( !entity cansee( entity.enemy ) )
        {
            return false;
        }
        
        if ( !tracepassedonnavmesh( entity.origin, entity.enemy.origin, entity getpathfindingradius() ) )
        {
            return false;
        }
        
        return true;
    }
    
    return false;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xe81493c, Offset: 0x1a78
// Size: 0x3ea, Type: bool
function private function_e9819a23( entity )
{
    if ( entity.subarchetype !== #"crimson_nosferatu" )
    {
        return false;
    }
    
    if ( entity asmistransitionrunning() || entity asmistransdecrunning() )
    {
        return false;
    }
    
    if ( isdefined( entity.enemy ) )
    {
        if ( !btapi_shouldchargemelee( entity ) )
        {
            return false;
        }
        
        if ( !function_3df24b25( entity ) )
        {
            return false;
        }
        
        if ( !isplayer( entity.enemy ) )
        {
            return false;
        }
        
        if ( isdefined( entity.enemy.var_7ebdb2c9 ) && entity.enemy.var_7ebdb2c9 )
        {
            return false;
        }
        
        if ( abs( entity.origin[ 2 ] - entity.enemy.origin[ 2 ] ) > 64 )
        {
            return false;
        }
        
        predictedenemypos = entity.enemy.origin;
        velocity = entity.enemy getvelocity();
        
        if ( length( velocity ) > 0 )
        {
            predictedenemypos += vectorscale( velocity, 0.25 );
        }
        
        distancesq = distancesquared( entity.origin, predictedenemypos );
        
        if ( distancesq <= 128 * 128 )
        {
            return false;
        }
        
        if ( distancesq >= 100 * 100 )
        {
            if ( entity.enemy issprinting() )
            {
                enemyvelocity = vectornormalize( entity.enemy getvelocity() );
                var_7a61ad67 = vectornormalize( entity getvelocity() );
                
                if ( vectordot( var_7a61ad67, enemyvelocity ) > cos( 20 ) )
                {
                    /#
                        record3dtext( "<dev string:x38>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
                    #/
                    
                    return false;
                }
            }
        }
        
        if ( !entity cansee( entity.enemy ) )
        {
            return false;
        }
        
        enemyangles = entity.enemy getplayerangles();
        
        if ( !util::within_fov( entity.enemy.origin, enemyangles, self.origin, cos( 25 ) ) )
        {
            return false;
        }
        
        if ( !tracepassedonnavmesh( entity.origin, predictedenemypos, entity getpathfindingradius() ) )
        {
            return false;
        }
        
        return true;
    }
    
    return false;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xb309befd, Offset: 0x1e70
// Size: 0x322, Type: bool
function private function_85d8b15d( entity )
{
    if ( entity asmistransitionrunning() || entity asmistransdecrunning() )
    {
        return false;
    }
    
    if ( isdefined( entity.enemy ) )
    {
        if ( !btapi_shouldchargemelee( entity ) )
        {
            return false;
        }
        
        if ( !function_105988a0( entity ) )
        {
            return false;
        }
        
        if ( !isplayer( entity.enemy ) )
        {
            return false;
        }
        
        if ( abs( entity.origin[ 2 ] - entity.enemy.origin[ 2 ] ) > 64 )
        {
            return false;
        }
        
        predictedenemypos = entity.enemy.origin;
        velocity = entity.enemy getvelocity();
        
        if ( length( velocity ) > 0 )
        {
            predictedenemypos += vectorscale( velocity, 0.25 );
        }
        
        distancesq = distancesquared( entity.origin, predictedenemypos );
        
        if ( distancesq <= 128 * 128 )
        {
            return false;
        }
        
        if ( distancesq >= 100 * 100 )
        {
            if ( entity.enemy issprinting() )
            {
                enemyvelocity = vectornormalize( entity.enemy getvelocity() );
                var_7a61ad67 = vectornormalize( entity getvelocity() );
                
                if ( vectordot( var_7a61ad67, enemyvelocity ) > cos( 20 ) )
                {
                    /#
                        record3dtext( "<dev string:x38>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
                    #/
                    
                    return false;
                }
            }
        }
        
        if ( !entity cansee( entity.enemy ) )
        {
            return false;
        }
        
        if ( !tracepassedonnavmesh( entity.origin, predictedenemypos, entity getpathfindingradius() ) )
        {
            return false;
        }
        
        return true;
    }
    
    return false;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1
// Checksum 0xc64fd334, Offset: 0x21a0
// Size: 0xe4, Type: bool
function function_ebe0e1b5( entity )
{
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    var_623b3520 = blackboard::getblackboardevents( "nfrtu_full_pain" );
    
    if ( isdefined( var_623b3520 ) && var_623b3520.size )
    {
        foreach ( var_77d2339d in var_623b3520 )
        {
            if ( var_77d2339d.data.enemy === entity.enemy )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xbb85790e, Offset: 0x2290
// Size: 0x74
function private function_76505306( entity )
{
    var_77d2339d = spawnstruct();
    var_77d2339d.enemy = entity.enemy;
    blackboard::addblackboardevent( "nfrtu_full_pain", var_77d2339d, randomintrange( 4500, 6500 ) );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x3d78fbb, Offset: 0x2310
// Size: 0x2c
function private function_e0ad0db2( entity )
{
    entity pathmode( "move allowed" );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xcae91f19, Offset: 0x2348
// Size: 0x78, Type: bool
function private nosferatushouldmelee( entity )
{
    if ( function_85d8b15d( entity ) || function_7ffbbff( entity ) || function_e9819a23( entity ) || function_b5047448( entity ) )
    {
        return true;
    }
    
    return false;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x1b3a440f, Offset: 0x23c8
// Size: 0x25e, Type: bool
function private function_7ffbbff( entity )
{
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    if ( entity asmistransitionrunning() || entity asmistransdecrunning() )
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
    
    if ( distancesquared( entity.origin, entity.enemy.origin ) > 80 * 80 )
    {
        return false;
    }
    
    yawtoenemy = angleclamp180( entity.angles[ 1 ] - vectortoangles( entity.enemy.origin - entity.origin )[ 1 ] );
    
    if ( abs( yawtoenemy ) > ( isdefined( entity.var_1c0eb62a ) ? entity.var_1c0eb62a : 60 ) )
    {
        return false;
    }
    
    if ( !entity cansee( entity.enemy ) )
    {
        return false;
    }
    
    if ( !tracepassedonnavmesh( entity.origin, isdefined( entity.enemy.last_valid_position ) ? entity.enemy.last_valid_position : entity.enemy.origin, entity.enemy getpathfindingradius() ) )
    {
        return false;
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x8dc69f56, Offset: 0x2630
// Size: 0x114, Type: bool
function private function_105988a0( entity )
{
    /#
        if ( getdvarint( #"hash_541d64bc060bdd29", 0 ) )
        {
            return true;
        }
    #/
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    var_33f55f67 = blackboard::getblackboardevents( "nfrtu_leap_melee" );
    
    if ( isdefined( var_33f55f67 ) && var_33f55f67.size )
    {
        foreach ( var_3bfe8ebe in var_33f55f67 )
        {
            if ( var_3bfe8ebe.data.enemy === entity.enemy )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x16c17477, Offset: 0x2750
// Size: 0x114, Type: bool
function private function_c2f87d6( entity )
{
    /#
        if ( getdvarint( #"hash_43a13163c1956e08", 0 ) )
        {
            return true;
        }
    #/
    
    if ( !isdefined( entity.enemy ) )
    {
        return false;
    }
    
    var_33f55f67 = blackboard::getblackboardevents( "nfrtu_run_melee" );
    
    if ( isdefined( var_33f55f67 ) && var_33f55f67.size )
    {
        foreach ( var_3bfe8ebe in var_33f55f67 )
        {
            if ( var_3bfe8ebe.data.enemy === entity.enemy )
            {
                return false;
            }
        }
    }
    
    return true;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0xe3c1c245, Offset: 0x2870
// Size: 0x74
function private function_ed80a3bc( entity )
{
    var_3bfe8ebe = spawnstruct();
    var_3bfe8ebe.enemy = entity.enemy;
    blackboard::addblackboardevent( "nfrtu_run_melee", var_3bfe8ebe, randomintrange( 10000, 12000 ) );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1, eflags: 0x4
// Checksum 0x709a6e5f, Offset: 0x28f0
// Size: 0x74
function private function_4df0b87d( entity )
{
    var_3bfe8ebe = spawnstruct();
    var_3bfe8ebe.enemy = entity.enemy;
    blackboard::addblackboardevent( "nfrtu_leap_melee", var_3bfe8ebe, randomintrange( 6000, 9000 ) );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 5
// Checksum 0x13e5b2be, Offset: 0x2a38
// Size: 0x9a
function function_37d5cfc( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity animmode( "zonly_physics", 1 );
    entity orientmode( "face enemy" );
    entity pathmode( "dont move", 0 );
    entity.usegoalanimweight = 1;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 5
// Checksum 0x5ced1f22, Offset: 0x2ae0
// Size: 0x8c
function function_4b55eb0a( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity.blockingpain = 0;
    entity.usegoalanimweight = 0;
    entity orientmode( "face default" );
    entity pathmode( "move delayed", 0, 0.2 );
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 5
// Checksum 0xc56b05a9, Offset: 0x2b78
// Size: 0x31c
function function_1ad502a0( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity animmode( "gravity", 1 );
    entity orientmode( "face angle", entity.angles[ 1 ] );
    entity.blockingpain = 1;
    entity.usegoalanimweight = 1;
    entity pathmode( "dont move", 1 );
    entity collidewithactors( 0 );
    
    if ( isdefined( entity.enemy ) )
    {
        dirtoenemy = vectornormalize( entity.enemy.origin - entity.origin );
        entity forceteleport( entity.origin, vectortoangles( dirtoenemy ) );
    }
    
    if ( !isdefined( entity.meleeinfo ) )
    {
        entity.meleeinfo = new class_1546f28e();
        entity.meleeinfo.var_9bfa8497 = entity.origin;
        entity.meleeinfo.var_98bc84b7 = getnotetracktimes( mocompanim, "start_adjust" )[ 0 ];
        entity.meleeinfo.var_6392c3a2 = getnotetracktimes( mocompanim, "end_adjust" )[ 0 ];
        var_e397f54c = getmovedelta( mocompanim, 0, 1, entity );
        entity.meleeinfo.var_cb28f380 = entity localtoworldcoords( var_e397f54c );
        
        /#
            movedelta = getmovedelta( mocompanim, 0, 1, entity );
            animendpos = entity localtoworldcoords( movedelta );
            distance = distance( entity.origin, animendpos );
            recordcircle( animendpos, 3, ( 0, 1, 0 ), "<dev string:x53>" );
            record3dtext( "<dev string:x5c>" + distance, animendpos, ( 0, 1, 0 ), "<dev string:x53>" );
        #/
    }
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 5
// Checksum 0x930b35f2, Offset: 0x2ea0
// Size: 0xbd4
function function_3511ecd1( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    assert( isdefined( entity.meleeinfo ) );
    currentanimtime = entity getanimtime( mocompanim );
    
    if ( isdefined( entity.enemy ) && !entity.meleeinfo.adjustmentstarted && entity.meleeinfo.var_425c4c8b && currentanimtime >= entity.meleeinfo.var_98bc84b7 )
    {
        predictedenemypos = entity.enemy.origin;
        velocity = entity.enemy getvelocity();
        
        if ( length( velocity ) > 0 )
        {
            predictedenemypos += vectorscale( velocity, 0.25 );
        }
        
        entity.meleeinfo.adjustedendpos = predictedenemypos;
        var_cf699df5 = distancesquared( entity.meleeinfo.var_9bfa8497, entity.meleeinfo.var_cb28f380 );
        var_776ddabf = distancesquared( entity.meleeinfo.var_cb28f380, entity.meleeinfo.adjustedendpos );
        var_65cbfb52 = distancesquared( entity.meleeinfo.var_9bfa8497, entity.meleeinfo.adjustedendpos );
        var_201660e6 = tracepassedonnavmesh( entity.meleeinfo.var_9bfa8497, entity.meleeinfo.adjustedendpos, entity getpathfindingradius() );
        traceresult = bullettrace( entity.origin, entity.meleeinfo.adjustedendpos + ( 0, 0, 30 ), 0, entity, 0, 0, entity.enemy );
        isvisible = traceresult[ #"fraction" ] == 1;
        var_535d098c = 0;
        
        if ( isdefined( traceresult[ #"hitloc" ] ) && traceresult[ #"hitloc" ] == "riotshield" )
        {
            var_cc075bd0 = vectornormalize( entity.origin - entity.meleeinfo.adjustedendpos );
            entity.meleeinfo.adjustedendpos += vectorscale( var_cc075bd0, 50 );
            var_535d098c = 1;
        }
        
        if ( traceresult[ #"fraction" ] < 0.9 )
        {
            /#
                record3dtext( "<dev string:x5f>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
            #/
            
            entity.meleeinfo.var_425c4c8b = 0;
        }
        else if ( !var_201660e6 )
        {
            /#
                record3dtext( "<dev string:x6f>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
            #/
            
            entity.meleeinfo.var_425c4c8b = 0;
        }
        else if ( var_cf699df5 > var_65cbfb52 && var_776ddabf >= 130 * 130 )
        {
            /#
                record3dtext( "<dev string:x80>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
            #/
            
            entity.meleeinfo.var_425c4c8b = 0;
        }
        else if ( var_65cbfb52 >= 450 * 450 )
        {
            /#
                record3dtext( "<dev string:x8e>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
            #/
            
            entity.meleeinfo.var_425c4c8b = 0;
        }
        
        if ( var_535d098c )
        {
            /#
                record3dtext( "<dev string:x9c>", entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
            #/
            
            entity.meleeinfo.var_425c4c8b = 1;
        }
        
        if ( entity.meleeinfo.var_425c4c8b )
        {
            var_776ddabf = distancesquared( entity.meleeinfo.var_cb28f380, entity.meleeinfo.adjustedendpos );
            myforward = anglestoforward( entity.angles );
            var_1c3641f2 = ( entity.enemy.origin[ 0 ], entity.enemy.origin[ 1 ], entity.origin[ 2 ] );
            dirtoenemy = vectornormalize( var_1c3641f2 - entity.origin );
            zdiff = entity.meleeinfo.var_cb28f380[ 2 ] - entity.enemy.origin[ 2 ];
            withinzrange = abs( zdiff ) <= 64;
            withinfov = vectordot( myforward, dirtoenemy ) > cos( 50 );
            var_7948b2f3 = withinzrange && withinfov;
            var_425c4c8b = ( isvisible || var_535d098c ) && var_7948b2f3;
            
            /#
                reasons = "<dev string:xaf>" + isvisible + "<dev string:xb6>" + withinzrange + "<dev string:xbc>" + withinfov;
                
                if ( var_425c4c8b )
                {
                    record3dtext( reasons, entity.origin + ( 0, 0, 60 ), ( 0, 1, 0 ), "<dev string:x53>" );
                }
                else
                {
                    record3dtext( reasons, entity.origin + ( 0, 0, 60 ), ( 1, 0, 0 ), "<dev string:x53>" );
                }
            #/
            
            if ( var_425c4c8b )
            {
                var_90c3cdd2 = length( entity.meleeinfo.adjustedendpos - entity.meleeinfo.var_cb28f380 );
                timestep = function_60d95f53();
                animlength = getanimlength( mocompanim ) * 1000;
                starttime = entity.meleeinfo.var_98bc84b7 * animlength;
                stoptime = entity.meleeinfo.var_6392c3a2 * animlength;
                starttime = ceil( starttime / timestep );
                stoptime = ceil( stoptime / timestep );
                adjustduration = stoptime - starttime;
                entity.meleeinfo.var_10b8b6d1 = vectornormalize( entity.meleeinfo.adjustedendpos - entity.meleeinfo.var_cb28f380 );
                entity.meleeinfo.var_8b9a15a6 = var_90c3cdd2 / adjustduration;
                entity.meleeinfo.var_425c4c8b = 1;
                entity.meleeinfo.adjustmentstarted = 1;
            }
            else
            {
                entity.meleeinfo.var_425c4c8b = 0;
            }
        }
    }
    
    if ( entity.meleeinfo.adjustmentstarted )
    {
        if ( currentanimtime <= entity.meleeinfo.var_6392c3a2 )
        {
            assert( isdefined( entity.meleeinfo.var_10b8b6d1 ) && isdefined( entity.meleeinfo.var_8b9a15a6 ) );
            
            /#
                recordsphere( entity.meleeinfo.var_cb28f380, 3, ( 0, 1, 0 ), "<dev string:x53>" );
                recordsphere( entity.meleeinfo.adjustedendpos, 3, ( 0, 0, 1 ), "<dev string:x53>" );
            #/
            
            adjustedorigin = entity.origin + entity.meleeinfo.var_10b8b6d1 * entity.meleeinfo.var_8b9a15a6;
            entity forceteleport( adjustedorigin );
            return;
        }
        
        if ( isdefined( entity.enemy ) )
        {
            entity orientmode( "face enemy" );
        }
    }
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 5
// Checksum 0xf86bfe14, Offset: 0x3a80
// Size: 0xc6
function function_b472ba3d( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity.blockingpain = 0;
    entity.usegoalanimweight = 0;
    entity orientmode( "face enemy" );
    entity collidewithactors( 1 );
    entity clearpath();
    entity pathmode( "move delayed", 1, 0.2 );
    entity.meleeinfo = undefined;
}

// Namespace archetypenosferatu/archetype_nosferatu
// Params 1
// Checksum 0xe1716c1, Offset: 0x3b50
// Size: 0x2c
function nfrtuleaprumble( entity )
{
    entity clientfield::increment( "nfrtu_leap_melee_rumb" );
}

