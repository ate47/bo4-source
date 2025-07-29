#using scripts\core_common\ai\archetype_catalyst_interface;
#using scripts\core_common\ai\systems\ai_interface;
#using scripts\core_common\ai\systems\animation_state_machine_mocomp;
#using scripts\core_common\ai\systems\behavior_tree_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\spawner_shared;

#namespace archetypecatalyst;

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x2
// Checksum 0xeeadc0b, Offset: 0xe8
// Size: 0x84
function autoexec main()
{
    registerbehaviorscriptfunctions();
    spawner::add_archetype_spawn_function( #"catalyst", &function_728127b );
    spawner::add_archetype_spawn_function( #"catalyst", &function_5608540a );
    catalystinterface::registercatalystinterfaceattributes();
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x4
// Checksum 0x3bde23e6, Offset: 0x178
// Size: 0x9c
function private registerbehaviorscriptfunctions()
{
    assert( isscriptfunctionptr( &iscatalyst ) );
    behaviortreenetworkutility::registerbehaviortreescriptapi( #"iscatalyst", &iscatalyst );
    animationstatenetwork::registeranimationmocomp( "mocomp_teleport_traversal@catalyst", &function_720a0584, undefined, undefined );
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 1
// Checksum 0xc2c993ac, Offset: 0x220
// Size: 0x24, Type: bool
function iscatalyst( entity )
{
    return self.archetype === #"catalyst";
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 0
// Checksum 0x9661c26f, Offset: 0x250
// Size: 0xc4
function function_5608540a()
{
    self.zombie_move_speed = "walk";
    var_9d3ec6f = [];
    var_9d3ec6f[ #"catalyst_corrosive" ] = 1;
    var_9d3ec6f[ #"catalyst_electric" ] = 3;
    var_9d3ec6f[ #"catalyst_plasma" ] = 2;
    var_9d3ec6f[ #"catalyst_water" ] = 4;
    
    if ( isdefined( self.subarchetype ) && isdefined( var_9d3ec6f[ self.subarchetype ] ) )
    {
        function_27c82a36( self, var_9d3ec6f[ self.subarchetype ] );
    }
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 0, eflags: 0x4
// Checksum 0x5a044faa, Offset: 0x320
// Size: 0x4a
function private function_728127b()
{
    blackboard::createblackboardforentity( self );
    ai::createinterfaceforentity( self );
    self.___archetypeonanimscriptedcallback = &function_dc16721f;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 2
// Checksum 0xf75a10d3, Offset: 0x378
// Size: 0x150
function function_27c82a36( entity, catalyst_type )
{
    entity function_b7e4069( catalyst_type );
    
    if ( isdefined( level.var_f6d5bd0c ) )
    {
        if ( level.var_f6d5bd0c[ 0 ].size > 0 )
        {
            foreach ( spawn_func in level.var_f6d5bd0c[ 0 ] )
            {
                entity [[ spawn_func ]]();
            }
        }
        
        if ( level.var_f6d5bd0c[ catalyst_type ].size > 0 )
        {
            foreach ( spawn_func in level.var_f6d5bd0c[ catalyst_type ] )
            {
                entity [[ spawn_func ]]();
            }
        }
    }
    
    return entity;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 3
// Checksum 0x567ea6ca, Offset: 0x4d0
// Size: 0xe0
function function_84c6177b( spawner, catalyst_type, location )
{
    spawner.script_forcespawn = 1;
    entity = zombie_utility::spawn_zombie( spawner, undefined, location );
    
    if ( !isdefined( entity ) )
    {
        return;
    }
    
    if ( isdefined( entity.catalyst_type ) )
    {
        return;
    }
    
    entity = function_27c82a36( entity, catalyst_type );
    
    if ( !isdefined( location.angles ) )
    {
        angles = ( 0, 0, 0 );
    }
    else
    {
        angles = location.angles;
    }
    
    entity forceteleport( location.origin, angles );
    return entity;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 1, eflags: 0x4
// Checksum 0x2609bfc0, Offset: 0x5b8
// Size: 0x1a
function private function_b7e4069( catalyst_type )
{
    self.catalyst_type = catalyst_type;
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 1, eflags: 0x4
// Checksum 0x1cbc2acd, Offset: 0x5e0
// Size: 0x2c
function private function_dc16721f( entity )
{
    entity.__blackboard = undefined;
    entity function_728127b();
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 2
// Checksum 0x83e33a34, Offset: 0x618
// Size: 0xd4
function function_8f9b9d24( catalyst_type, func )
{
    if ( !isdefined( level.var_f6d5bd0c ) )
    {
        level.var_f6d5bd0c = [];
        level.var_f6d5bd0c[ 0 ] = [];
        level.var_f6d5bd0c[ 1 ] = [];
        level.var_f6d5bd0c[ 3 ] = [];
        level.var_f6d5bd0c[ 2 ] = [];
        level.var_f6d5bd0c[ 4 ] = [];
    }
    
    if ( isdefined( level.var_f6d5bd0c[ catalyst_type ] ) )
    {
        level.var_f6d5bd0c[ catalyst_type ][ level.var_f6d5bd0c[ catalyst_type ].size ] = func;
    }
}

// Namespace archetypecatalyst/archetype_catalyst
// Params 5
// Checksum 0x2e4b361, Offset: 0x6f8
// Size: 0x194
function function_720a0584( entity, mocompanim, mocompanimblendouttime, mocompanimflag, mocompduration )
{
    entity orientmode( "face angle", entity.angles[ 1 ] );
    entity animmode( "normal" );
    
    if ( isdefined( entity.traverseendnode ) )
    {
        /#
            print3d( entity.traversestartnode.origin, "<dev string:x38>", ( 1, 0, 0 ), 1, 1, 60 );
            print3d( entity.traverseendnode.origin, "<dev string:x38>", ( 0, 1, 0 ), 1, 1, 60 );
            line( entity.traversestartnode.origin, entity.traverseendnode.origin, ( 0, 1, 0 ), 1, 0, 60 );
        #/
        
        entity forceteleport( entity.traverseendnode.origin, entity.traverseendnode.angles, 0 );
    }
}

