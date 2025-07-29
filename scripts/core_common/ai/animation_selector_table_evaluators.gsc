#using scripts\core_common\ai\systems\animation_selector_table;

#namespace animation_selector_table_evaluators;

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 0, eflags: 0x2
// Checksum 0x7f3720d, Offset: 0x150
// Size: 0x11c
function autoexec registerastscriptfunctions()
{
    animationselectortable::registeranimationselectortableevaluator( "testFunction", &testfunction );
    animationselectortable::registeranimationselectortableevaluator( "evaluateBlockedAnimations", &evaluateblockedanimations );
    animationselectortable::registeranimationselectortableevaluator( "evaluateBlockedAnimationsRelaxed", &evaluateblockedanimationsrelaxed );
    animationselectortable::registeranimationselectortableevaluator( "evaluateBlockedAnimationsOffNavmesh", &evaluateblockedanimationsoffnavmesh );
    animationselectortable::registeranimationselectortableevaluator( "evaluateHumanTurnAnimations", &evaluatehumanturnanimations );
    animationselectortable::registeranimationselectortableevaluator( "evaluateHumanExposedArrivalAnimations", &evaluatehumanexposedarrivalanimations );
    animationselectortable::registeranimationselectortableevaluator( "evaluateJukeBlockedAnimations", &evaluatejukeblockedanimations );
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2
// Checksum 0x3bc6c447, Offset: 0x278
// Size: 0x48
function testfunction( entity, animations )
{
    if ( isarray( animations ) && animations.size > 0 )
    {
        return animations[ 0 ];
    }
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0xb4efb203, Offset: 0x2c8
// Size: 0x19e, Type: bool
function private function_aa7530df( entity, animation )
{
    pixbeginevent( #"evaluator_checkanimationagainstgeo" );
    assert( isactor( entity ) );
    forwarddir = anglestoforward( entity.angles );
    localdeltavector = getmovedelta( animation, 0, 1, entity );
    endpoint = entity localtoworldcoords( localdeltavector );
    forwardpoint = endpoint + vectorscale( forwarddir, 100 );
    
    /#
        recordline( entity.origin, endpoint, ( 0, 0, 1 ), "<dev string:x38>", entity );
        recordline( endpoint, forwardpoint, ( 1, 0.5, 0 ), "<dev string:x38>", entity );
    #/
    
    if ( entity maymovefrompointtopoint( endpoint, forwardpoint, 1, 1 ) )
    {
        pixendevent();
        return true;
    }
    
    pixendevent();
    return false;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0xdb568b1, Offset: 0x470
// Size: 0x7c
function private evaluatejukeblockedanimations( entity, animations )
{
    if ( animations.size > 0 )
    {
        return evaluator_findfirstvalidanimation( entity, animations, array( &evaluator_checkanimationagainstnavmesh, &function_aa7530df, &evaluator_checkanimationforovershootinggoal ) );
    }
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x837f2393, Offset: 0x4f8
// Size: 0x22e, Type: bool
function private evaluator_checkanimationagainstgeo( entity, animation )
{
    pixbeginevent( #"evaluator_checkanimationagainstgeo" );
    assert( isactor( entity ) );
    localdeltahalfvector = getmovedelta( animation, 0, 0.5, entity );
    midpoint = entity localtoworldcoords( localdeltahalfvector );
    midpoint = ( midpoint[ 0 ], midpoint[ 1 ], entity.origin[ 2 ] );
    
    /#
        recordline( entity.origin, midpoint, ( 1, 0.5, 0 ), "<dev string:x38>", entity );
    #/
    
    if ( entity maymovetopoint( midpoint, 1, 1 ) )
    {
        localdeltavector = getmovedelta( animation, 0, 1, entity );
        endpoint = entity localtoworldcoords( localdeltavector );
        endpoint = ( endpoint[ 0 ], endpoint[ 1 ], entity.origin[ 2 ] );
        
        /#
            recordline( midpoint, endpoint, ( 1, 0.5, 0 ), "<dev string:x38>", entity );
        #/
        
        if ( entity maymovefrompointtopoint( midpoint, endpoint, 1, 1 ) )
        {
            pixendevent();
            return true;
        }
    }
    
    pixendevent();
    return false;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x696e3b83, Offset: 0x730
// Size: 0x11e, Type: bool
function private evaluator_checkanimationendpointagainstgeo( entity, animation )
{
    pixbeginevent( #"evaluator_checkanimationendpointagainstgeo" );
    assert( isactor( entity ) );
    localdeltavector = getmovedelta( animation, 0, 1, entity );
    endpoint = entity localtoworldcoords( localdeltavector );
    endpoint = ( endpoint[ 0 ], endpoint[ 1 ], entity.origin[ 2 ] );
    
    if ( entity maymovetopoint( endpoint, 0, 0 ) )
    {
        pixendevent();
        return true;
    }
    
    pixendevent();
    return false;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x64d63bd, Offset: 0x858
// Size: 0x1ce, Type: bool
function private evaluator_checkanimationforovershootinggoal( entity, animation )
{
    pixbeginevent( #"evaluator_checkanimationforovershootinggoal" );
    assert( isactor( entity ) );
    localdeltavector = getmovedelta( animation, 0, 1, entity );
    endpoint = entity localtoworldcoords( localdeltavector );
    animdistsq = lengthsquared( localdeltavector );
    
    if ( entity haspath() )
    {
        startpos = entity.origin;
        goalpos = entity.pathgoalpos;
        assert( isdefined( goalpos ) );
        disttogoalsq = distancesquared( startpos, goalpos );
        
        if ( animdistsq < disttogoalsq * 0.9 )
        {
            pixendevent();
            return true;
        }
    }
    
    /#
        record3dtext( "<dev string:x45>", entity.origin, ( 1, 0.5, 0 ), "<dev string:x38>", entity );
    #/
    
    pixendevent();
    return false;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x13a7ab2b, Offset: 0xa30
// Size: 0xe6, Type: bool
function private evaluator_checkanimationagainstnavmesh( entity, animation )
{
    assert( isactor( entity ) );
    localdeltavector = getmovedelta( animation, 0, 1, entity );
    endpoint = entity localtoworldcoords( localdeltavector );
    
    if ( ispointonnavmesh( endpoint, entity ) )
    {
        return true;
    }
    
    /#
        record3dtext( "<dev string:x5e>", entity.origin, ( 1, 0.5, 0 ), "<dev string:x38>", entity );
    #/
    
    return false;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0xf312bc75, Offset: 0xb20
// Size: 0x136, Type: bool
function private evaluator_checkanimationarrivalposition( entity, animation )
{
    localdeltavector = getmovedelta( animation, 0, 1, entity );
    endpoint = entity localtoworldcoords( localdeltavector );
    animdistsq = lengthsquared( localdeltavector );
    startpos = entity.origin;
    goalpos = entity.pathgoalpos;
    disttogoalsq = distancesquared( startpos, goalpos );
    
    if ( disttogoalsq < animdistsq )
    {
        if ( isdefined( entity.ai.var_a5dabb8b ) && entity.ai.var_a5dabb8b )
        {
            return true;
        }
        
        if ( entity isposatgoal( endpoint ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 3, eflags: 0x4
// Checksum 0xeae94b3d, Offset: 0xc60
// Size: 0x194
function private evaluator_findfirstvalidanimation( entity, animations, tests )
{
    assert( isarray( animations ), "<dev string:x75>" );
    assert( isarray( tests ), "<dev string:xb5>" );
    
    foreach ( aliasanimations in animations )
    {
        if ( aliasanimations.size > 0 )
        {
            valid = 1;
            animation = aliasanimations[ 0 ];
            
            foreach ( test in tests )
            {
                if ( ![[ test ]]( entity, animation ) )
                {
                    valid = 0;
                    break;
                }
            }
            
            if ( valid )
            {
                return animation;
            }
        }
    }
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0xd3e56763, Offset: 0xe00
// Size: 0x6e
function private evaluateblockedanimations( entity, animations )
{
    if ( animations.size > 0 )
    {
        return evaluator_findfirstvalidanimation( entity, animations, array( &evaluator_checkanimationagainstnavmesh, &evaluator_checkanimationforovershootinggoal ) );
    }
    
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x49b8628b, Offset: 0xe78
// Size: 0x5e
function private evaluateblockedanimationsrelaxed( entity, animations )
{
    if ( animations.size > 0 )
    {
        return evaluator_findfirstvalidanimation( entity, animations, array( &evaluator_checkanimationforovershootinggoal ) );
    }
    
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x2bbb7af3, Offset: 0xee0
// Size: 0x5e
function private evaluateblockedanimationsoffnavmesh( entity, animations )
{
    if ( animations.size > 0 )
    {
        return evaluator_findfirstvalidanimation( entity, animations, array( &evaluator_checkanimationagainstgeo ) );
    }
    
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x9b637584, Offset: 0xf48
// Size: 0xf6
function private evaluatehumanturnanimations( entity, animations )
{
    /#
        if ( isdefined( level.ai_dontturn ) && level.ai_dontturn )
        {
            return undefined;
        }
    #/
    
    /#
        record3dtext( "<dev string:xfe>" + gettime() + "<dev string:x101>", entity.origin, ( 1, 0.5, 0 ), "<dev string:x38>", entity );
    #/
    
    if ( animations.size > 0 )
    {
        return evaluator_findfirstvalidanimation( entity, animations, array( &evaluator_checkanimationforovershootinggoal, &evaluator_checkanimationagainstgeo, &evaluator_checkanimationagainstnavmesh ) );
    }
    
    return undefined;
}

// Namespace animation_selector_table_evaluators/animation_selector_table_evaluators
// Params 2, eflags: 0x4
// Checksum 0x706ad130, Offset: 0x1048
// Size: 0x6e
function private evaluatehumanexposedarrivalanimations( entity, animations )
{
    if ( !isdefined( entity.pathgoalpos ) )
    {
        return undefined;
    }
    
    if ( animations.size > 0 )
    {
        return evaluator_findfirstvalidanimation( entity, animations, array( &evaluator_checkanimationarrivalposition ) );
    }
    
    return undefined;
}

