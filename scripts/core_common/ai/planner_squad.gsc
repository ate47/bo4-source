#using scripts\core_common\ai\strategic_command;
#using scripts\core_common\ai\systems\planner;
#using scripts\core_common\ai\systems\planner_blackboard;
#using scripts\core_common\bots\bot;

#namespace plannersquad;

// Namespace plannersquad/planner_squad
// Params 1, eflags: 0x4
// Checksum 0xccfd251e, Offset: 0x98
// Size: 0xf0
function private function_bf7acc22( squad )
{
    botentries = plannersquadutility::getblackboardattribute( squad, "doppelbots" );
    
    foreach ( botinfo in botentries )
    {
        bot = botinfo[ #"__unsafe__" ][ #"bot" ];
        
        if ( isdefined( bot ) && isdefined( bot.bot ) )
        {
            bot bot::clear_interact();
        }
    }
}

/#

    // Namespace plannersquad/planner_squad
    // Params 1, eflags: 0x4
    // Checksum 0x1283b2ec, Offset: 0x190
    // Size: 0xde8, Type: dev
    function private _debugsquad( squad )
    {
        if ( !isdefined( level.__plannersquaddebug ) )
        {
            level.__plannersquaddebug = [];
        }
        
        for ( index = 0; index <= level.__plannersquaddebug.size ; index++ )
        {
            if ( !isdefined( level.__plannersquaddebug[ index ] ) || level.__plannersquaddebug[ index ].shutdown )
            {
                break;
            }
        }
        
        level.__plannersquaddebug[ index ] = squad;
        squadid = index + 1;
        
        while ( isdefined( squad ) && !squad.shutdown )
        {
            var_deb0d0ec = 0;
            squadid = getdvarint( #"ai_debugsquad", 0 );
            
            if ( isdefined( squad.blackboard ) && isdefined( squad.blackboard.values[ #"doppelbots" ] ) )
            {
                doppelbots = squad.blackboard.values[ #"doppelbots" ];
                
                foreach ( doppelbot in doppelbots )
                {
                    if ( doppelbot[ #"entnum" ] == squadid )
                    {
                        var_deb0d0ec = 1;
                        break;
                    }
                }
            }
            
            if ( var_deb0d0ec )
            {
                position = ( 0, 0, 0 );
                xoffset = 200;
                yoffset = 10;
                textscale = 0.7;
                bots = plannersquadutility::getblackboardattribute( squad, "<dev string:x38>" );
                bottext = "<dev string:x45>";
                
                foreach ( botentry in bots )
                {
                    bot = botentry[ #"__unsafe__" ][ #"bot" ];
                    
                    if ( strategiccommandutility::isvalidbot( bot ) )
                    {
                        bottext += "<dev string:x48>" + bot getentitynumber() + "<dev string:x48>" + bot.name;
                    }
                }
                
                team = plannersquadutility::getblackboardattribute( squad, "<dev string:x4c>" );
                side = strategiccommandutility::function_a1edb007( team );
                recordtext( side + bottext, position + ( xoffset, yoffset, 0 ), ( 1, 1, 1 ), "<dev string:x53>", textscale );
                xoffset += 15;
                yoffset += 13;
                timing = "<dev string:x60>" + squad.planstarttime + "<dev string:x69>" + squad.planfinishtime + "<dev string:x75>" + int( ( squad.planfinishtime - squad.planstarttime ) / float( function_60d95f53() ) / 1000 * 1000 + 1 ) + "<dev string:x81>";
                recordtext( timing, position + ( xoffset, yoffset, 0 ), ( 1, 1, 1 ), "<dev string:x53>", textscale );
                xoffset += 15;
                target = plannersquadutility::getblackboardattribute( squad, "<dev string:x85>" );
                
                if ( isdefined( target ) )
                {
                    var_3d879b56 = target[ #"strategy" ];
                    
                    if ( isdefined( var_3d879b56 ) )
                    {
                        if ( isdefined( var_3d879b56.sdebug ) )
                        {
                            foreach ( str in var_3d879b56.sdebug )
                            {
                                yoffset += 13;
                                recordtext( str, position + ( xoffset, yoffset, 0 ), ( 1, 1, 1 ), "<dev string:x53>", textscale );
                            }
                            
                            xoffset += 15;
                        }
                        
                        var_45c7238e = function_101999aa( var_3d879b56, "<dev string:x8e>", array( "<dev string:x9c>", "<dev string:xaf>", "<dev string:xc4>", "<dev string:xdc>", "<dev string:xf1>", "<dev string:x105>", "<dev string:x117>", "<dev string:x130>" ), position + ( 500, 10, 0 ), ( 1, 1, 1 ), "<dev string:x53>", textscale );
                        function_101999aa( var_3d879b56, "<dev string:x149>", array( "<dev string:x157>", "<dev string:x16a>", "<dev string:x17f>", "<dev string:x197>", "<dev string:x1ac>", "<dev string:x1c0>", "<dev string:x1d2>", "<dev string:x1eb>" ), position + ( 500, 10 + var_45c7238e, 0 ), ( 1, 1, 1 ), "<dev string:x53>", textscale );
                        targetpos = undefined;
                        targettrigger = undefined;
                        
                        if ( target[ #"type" ] == "<dev string:x204>" )
                        {
                            entity = target[ #"__unsafe__" ][ #"entity" ];
                            
                            if ( isdefined( entity ) )
                            {
                                targetpos = entity.origin;
                                object = target[ #"__unsafe__" ][ #"object" ];
                                
                                if ( isdefined( object ) )
                                {
                                    if ( isdefined( object ) )
                                    {
                                        targettrigger = object.trigger;
                                    }
                                }
                            }
                        }
                        else if ( target[ #"type" ] == "<dev string:x211>" || target[ #"type" ] == "<dev string:x21b>" )
                        {
                            missioncomponent = target[ #"__unsafe__" ][ #"mission_component" ];
                            targetpos = missioncomponent.origin;
                            component = target[ #"__unsafe__" ][ #"component" ];
                            targettrigger = component.var_2956bff4;
                            
                            if ( isdefined( component.var_6bc907c4 ) )
                            {
                                function_f301de44( component.var_6bc907c4, ( 1, 0, 1 ), "<dev string:x53>" );
                                recordline( targetpos, component.var_6bc907c4.origin, ( 1, 0, 1 ), "<dev string:x53>" );
                                record3dtext( "<dev string:x224>", component.var_6bc907c4.origin, ( 1, 0, 1 ), "<dev string:x53>", textscale );
                            }
                        }
                        else if ( target[ #"type" ] == "<dev string:x231>" )
                        {
                            missioncomponent = target[ #"__unsafe__" ][ #"mission_component" ];
                            targetpos = missioncomponent.origin;
                            component = target[ #"__unsafe__" ][ #"component" ];
                            targettrigger = component.var_cc67d976;
                        }
                        else if ( target[ #"type" ] == "<dev string:x23f>" )
                        {
                            missioncomponent = target[ #"__unsafe__" ][ #"mission_component" ];
                            targetpos = missioncomponent.origin;
                            component = target[ #"__unsafe__" ][ #"component" ];
                            targettrigger = component.var_c68dc48c;
                        }
                        else if ( target[ #"type" ] == "<dev string:x246>" )
                        {
                            bundle = target[ #"__unsafe__" ][ #"bundle" ];
                            targetpos = bundle.var_27726d51.origin;
                        }
                        else
                        {
                            yoffset += 13;
                            recordtext( "<dev string:x254>" + target[ #"type" ], position + ( xoffset, yoffset, 0 ), ( 1, 0, 0 ), "<dev string:x53>", textscale );
                        }
                        
                        if ( isdefined( targetpos ) )
                        {
                            recordsphere( targetpos, 20, ( 1, 0, 1 ) );
                            record3dtext( "<dev string:x280>" + target[ #"type" ], targetpos + ( 0, 0, 21 ), ( 1, 0, 1 ), "<dev string:x53>", textscale );
                            
                            if ( isdefined( targettrigger ) )
                            {
                                function_f301de44( targettrigger, ( 1, 0, 1 ), "<dev string:x53>" );
                                recordline( targetpos, targettrigger.origin, ( 1, 0, 1 ), "<dev string:x53>" );
                                record3dtext( "<dev string:x28a>", targettrigger.origin, ( 1, 0, 1 ), "<dev string:x53>", textscale );
                            }
                        }
                        else
                        {
                            yoffset += 13;
                            recordtext( "<dev string:x29a>", position + ( xoffset, yoffset, 0 ), ( 1, 0, 0 ), "<dev string:x53>", textscale );
                        }
                    }
                }
                else
                {
                    yoffset += 13;
                    recordtext( "<dev string:x2af>", position + ( xoffset, yoffset, 0 ), ( 1, 0, 0 ), "<dev string:x53>", textscale );
                }
                
                for ( index = 0; index < squad.plan.size ; index++ )
                {
                    yoffset += 13;
                    recordtext( function_9e72a96( squad.plan[ index ].name ), position + ( xoffset, yoffset, 0 ), ( 1, 1, 1 ), "<dev string:x53>", textscale );
                }
            }
            
            if ( getdvarint( #"ai_debuggoldenpath", 0 ) == squadid )
            {
                escortpoi = plannersquadutility::getblackboardattribute( squad, "<dev string:x2bb>" );
            }
            
            waitframe( 1 );
        }
    }

    // Namespace plannersquad/planner_squad
    // Params 7, eflags: 0x4
    // Checksum 0xda741a5a, Offset: 0xf80
    // Size: 0x15c, Type: dev
    function private function_101999aa( strategy, header, fieldlist, position, color, channel, textscale )
    {
        xoffset = 0;
        yoffset = 0;
        recordtext( header, position, color, channel, textscale );
        xoffset += 15;
        
        foreach ( field in fieldlist )
        {
            yoffset += 13;
            recordtext( field + "<dev string:x2c8>" + strategy.( field ), position + ( xoffset, yoffset, 0 ), color, channel, textscale );
        }
        
        yoffset += 13;
        return yoffset;
    }

    // Namespace plannersquad/planner_squad
    // Params 3, eflags: 0x4
    // Checksum 0x8e80008a, Offset: 0x10e8
    // Size: 0x1ac, Type: dev
    function private function_f301de44( trigger, color, channel )
    {
        maxs = trigger getmaxs();
        mins = trigger getmins();
        
        if ( issubstr( trigger.classname, "<dev string:x2cd>" ) )
        {
            radius = max( maxs[ 0 ], maxs[ 1 ] );
            top = trigger.origin + ( 0, 0, maxs[ 2 ] );
            bottom = trigger.origin + ( 0, 0, mins[ 2 ] );
            recordcircle( bottom, radius, color, channel );
            recordcircle( top, radius, color, channel );
            recordline( bottom, top, color, channel );
            return;
        }
        
        recordbox( trigger.origin, mins, maxs, trigger.angles[ 0 ], color, channel );
    }

#/

// Namespace plannersquad/planner_squad
// Params 1, eflags: 0x4
// Checksum 0x283b6616, Offset: 0x12a0
// Size: 0x2ce
function private _executeplan( squad )
{
    assert( isdefined( squad ) );
    assert( isdefined( squad.plan ), "<dev string:x2d6>" );
    assert( isdefined( squad.plan.size ), "<dev string:x307>" );
    
    if ( !isdefined( squad.currentplanindex ) )
    {
        squad.currentplanindex = 0;
    }
    
    if ( squad.actionstatus === 1 )
    {
        squad.actionstatus = undefined;
        squad.currentplanindex++;
    }
    
    if ( squad.currentplanindex >= squad.plan.size || squad.actionstatus === 2 )
    {
        squad.plan = [];
        squad.actionstatus = undefined;
        squad.currentplanindex = undefined;
        return;
    }
    
    action = squad.plan[ squad.currentplanindex ];
    functions = plannerutility::getplanneractionfunctions( action.name );
    
    if ( !isdefined( squad.actionstatus ) )
    {
        if ( isdefined( functions[ #"initialize" ] ) )
        {
            squad.actionstatus = [[ functions[ #"initialize" ] ]]( squad.planner, action.params );
        }
        else
        {
            squad.actionstatus = 1;
        }
    }
    
    if ( squad.actionstatus === 1 || squad.actionstatus === 3 )
    {
        if ( isdefined( functions[ #"update" ] ) )
        {
            squad.actionstatus = [[ functions[ #"update" ] ]]( squad.planner, action.params );
        }
    }
    
    if ( squad.actionstatus === 1 )
    {
        if ( isdefined( functions[ #"terminate" ] ) )
        {
            squad.actionstatus = [[ functions[ #"terminate" ] ]]( squad.planner, action.params );
        }
    }
}

// Namespace plannersquad/planner_squad
// Params 1, eflags: 0x4
// Checksum 0xaa6cebac, Offset: 0x1578
// Size: 0xd4, Type: bool
function private function_9de03b3f( squad )
{
    botentries = plannersquadutility::getblackboardattribute( squad, "doppelbots" );
    
    if ( !isdefined( botentries ) )
    {
        return false;
    }
    
    foreach ( botinfo in botentries )
    {
        if ( isdefined( botinfo[ #"__unsafe__" ][ #"bot" ] ) )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace plannersquad/planner_squad
// Params 1, eflags: 0x4
// Checksum 0xb1972837, Offset: 0x1658
// Size: 0x7a
function private _plan( squad )
{
    planstarttime = gettime();
    squad.plan = planner::plan( squad.planner, squad.blackboard.values, squad.maxplannerframetime );
    squad.planstarttime = planstarttime;
    squad.planfinishtime = gettime();
}

// Namespace plannersquad/planner_squad
// Params 1, eflags: 0x4
// Checksum 0xb1c915a3, Offset: 0x16e0
// Size: 0xde
function private _strategize( squad )
{
    assert( isdefined( squad ) );
    assert( isdefined( squad.planner ) );
    squad.planning = 1;
    [[ level.strategic_command_throttle ]]->waitinqueue( squad );
    squad.lastupdatetime = gettime();
    
    if ( function_9de03b3f( squad ) )
    {
        _plan( squad );
    }
    else
    {
        plannersquadutility::shutdown( squad );
    }
    
    squad.actionstatus = undefined;
    squad.currentplanindex = undefined;
    squad.planning = 0;
}

// Namespace plannersquad/planner_squad
// Params 1, eflags: 0x4
// Checksum 0xd376ca49, Offset: 0x17c8
// Size: 0xe6
function private _updateplanner( squad )
{
    assert( isdefined( squad ) );
    
    while ( isdefined( squad ) && !squad.shutdown )
    {
        [[ level.strategic_command_throttle ]]->waitinqueue( squad );
        time = gettime();
        
        if ( ( squad.plan.size == 0 || time - squad.lastupdatetime > squad.updaterate ) && !squad.planning )
        {
            squad _strategize( squad );
        }
        
        _executeplan( squad );
        waitframe( 1 );
    }
}

#namespace plannersquadutility;

// Namespace plannersquadutility/planner_squad
// Params 4
// Checksum 0x53a286d3, Offset: 0x18b8
// Size: 0x1f0
function createsquad( blackboard, planner, updaterate = float( function_60d95f53() ) / 1000 * 100, maxplannerframetime = 2 )
{
    assert( isstruct( blackboard ) );
    assert( isstruct( planner ) );
    squad = spawnstruct();
    squad.actionstatus = undefined;
    squad.blackboard = blackboard;
    squad.createtime = gettime();
    squad.currentplanindex = undefined;
    squad.maxplannerframetime = maxplannerframetime;
    squad.plan = [];
    squad.planfinishtime = gettime();
    squad.planstarttime = gettime();
    squad.planner = planner;
    squad.lastupdatetime = 0;
    squad.planning = 0;
    squad.shutdown = 0;
    squad.updaterate = updaterate * 1000;
    plannerblackboard::clearundostack( squad.blackboard );
    
    /#
        squad thread plannersquad::_debugsquad( squad );
    #/
    
    squad thread plannersquad::_updateplanner( squad );
    return squad;
}

// Namespace plannersquadutility/planner_squad
// Params 2
// Checksum 0xf74e00c3, Offset: 0x1ab0
// Size: 0x32
function getblackboardattribute( squad, attribute )
{
    return plannerblackboard::getattribute( squad.blackboard, attribute );
}

// Namespace plannersquadutility/planner_squad
// Params 3
// Checksum 0x50459f5d, Offset: 0x1af0
// Size: 0x3a
function setblackboardattribute( squad, attribute, value )
{
    return plannerblackboard::setattribute( squad.blackboard, attribute, value );
}

// Namespace plannersquadutility/planner_squad
// Params 1
// Checksum 0xfe853130, Offset: 0x1b38
// Size: 0x34
function shutdown( squad )
{
    squad.shutdown = 1;
    planner::cancel( squad.planner );
}

