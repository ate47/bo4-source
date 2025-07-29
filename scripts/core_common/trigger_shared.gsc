#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\spawner_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\teleport_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\vehicle_shared;

#namespace trigger;

// Namespace trigger/trigger_shared
// Params 0, eflags: 0x2
// Checksum 0xe3e7aa94, Offset: 0x238
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"trigger", &__init__, undefined, undefined );
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0xd04db0d3, Offset: 0x280
// Size: 0x24
function __init__()
{
    callback::on_trigger_spawned( &trigger_think );
}

// Namespace trigger/trigger_shared
// Params 4
// Checksum 0x5956069, Offset: 0x2b0
// Size: 0xd4
function add_handler( var_60ffbed2, func_handler, func_init, var_114fa26c = 1 )
{
    if ( isfunctionptr( var_60ffbed2 ) ? [[ var_60ffbed2 ]]() : isdefined( self.( var_60ffbed2 ) ) )
    {
        if ( isdefined( func_handler ) )
        {
            if ( var_114fa26c )
            {
                self callback::on_trigger_once( func_handler );
            }
            else
            {
                self callback::on_trigger( func_handler );
            }
        }
        
        if ( isfunctionptr( func_init ) )
        {
            [[ func_init ]]( var_60ffbed2 );
        }
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xa45c4a5f, Offset: 0x390
// Size: 0x5c
function init_flags( str_kvp )
{
    tokens = util::create_flags_and_return_tokens( self.( str_kvp ) );
    add_tokens_to_trigger_flags( tokens );
    update_based_on_flags();
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0xeb99c1b8, Offset: 0x3f8
// Size: 0x2c4
function trigger_think()
{
    self endon( #"death" );
    add_handler( "target", &trigger_spawner );
    add_handler( "script_flag_true", undefined, &init_flags );
    add_handler( "script_flag_true_any", undefined, &init_flags );
    add_handler( "script_flag_false_any", undefined, &init_flags );
    add_handler( "script_flag_false", undefined, &init_flags );
    add_handler( "script_flag_set", &flag_set_trigger, &init_flags );
    add_handler( "script_flag_clear", &flag_clear_trigger, &init_flags );
    add_handler( "script_trigger_group", &trigger_group );
    add_handler( "script_notify", &trigger_notify );
    add_handler( "script_killspawner", &kill_spawner_trigger );
    add_handler( "script_teleport_location", &teleport::team );
    add_handler( &is_trigger_once, &trigger_once );
    
    if ( isdefined( self.script_flag_set_on_touching ) || isdefined( self.script_flag_set_on_not_touching ) )
    {
        level thread script_flag_set_touching( self );
    }
    
    if ( is_look_trigger() )
    {
        level thread look_trigger( self );
        s_info = self waittill( #"trigger_look" );
        self thread callback::codecallback_trigger( s_info, 1 );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x555c9f92, Offset: 0x6c8
// Size: 0x4c
function function_1792c799( flags )
{
    trigger_flags = function_27f2ef17( self );
    function_4e3bb793( self, trigger_flags | flags );
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0xf418e3e9, Offset: 0x720
// Size: 0x1c2
function get_trigger_look_target()
{
    if ( isdefined( self.target ) )
    {
        a_potential_targets = getentarray( self.target, "targetname" );
        a_targets = [];
        
        foreach ( target in a_potential_targets )
        {
            if ( target.classname === "script_origin" )
            {
                if ( !isdefined( a_targets ) )
                {
                    a_targets = [];
                }
                else if ( !isarray( a_targets ) )
                {
                    a_targets = array( a_targets );
                }
                
                a_targets[ a_targets.size ] = target;
            }
        }
        
        a_potential_target_structs = struct::get_array( self.target );
        a_targets = arraycombine( a_targets, a_potential_target_structs, 1, 0 );
        
        if ( a_targets.size > 0 )
        {
            assert( a_targets.size == 1, "<dev string:x38>" + self.origin + "<dev string:x4a>" );
            e_target = a_targets[ 0 ];
        }
    }
    
    if ( !isdefined( e_target ) )
    {
        e_target = self;
    }
    
    return e_target;
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x8caf312d, Offset: 0x8f0
// Size: 0x228
function look_trigger( trigger )
{
    trigger endon( #"death" );
    e_target = trigger get_trigger_look_target();
    
    if ( isdefined( trigger.script_flag ) && !isdefined( level.flag[ trigger.script_flag ] ) )
    {
        level function_ac2f203a( trigger.script_flag );
    }
    
    a_parameters = [];
    
    if ( isdefined( trigger.script_parameters ) )
    {
        a_parameters = strtok( trigger.script_parameters, ",; " );
    }
    
    b_ads_check = isinarray( a_parameters, "check_ads" );
    
    while ( true )
    {
        waitresult = trigger waittill( #"trigger" );
        e_other = waitresult.activator;
        
        if ( isplayer( e_other ) )
        {
            while ( isdefined( e_other ) && e_other istouching( trigger ) )
            {
                if ( e_other util::is_looking_at( e_target, trigger.script_dot, isdefined( trigger.script_trace ) && trigger.script_trace ) && ( !b_ads_check || !e_other util::is_ads() ) )
                {
                    trigger notify( #"trigger_look", waitresult );
                }
                
                waitframe( 1 );
            }
            
            continue;
        }
        
        assertmsg( "<dev string:x6f>" );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x9839497d, Offset: 0xb20
// Size: 0x110
function trigger_spawner( s_info )
{
    a_ai_spawners = getspawnerarray( self.target, "targetname" );
    
    foreach ( sp in a_ai_spawners )
    {
        if ( isdefined( sp ) )
        {
            if ( isvehiclespawner( sp ) )
            {
                level thread vehicle::_vehicle_spawn( sp );
                continue;
            }
            
            assert( isactorspawner( sp ) );
            sp thread trigger_spawner_spawn();
        }
    }
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0xa50c90f, Offset: 0xc38
// Size: 0x5c
function trigger_spawner_spawn()
{
    self endon( #"death" );
    self flag::script_flag_wait();
    self util::script_delay();
    self spawner::spawn();
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x84f95d06, Offset: 0xca0
// Size: 0xc4
function trigger_notify( s_info )
{
    if ( isdefined( self.target ) )
    {
        a_target_ents = getentarray( self.target, "targetname" );
        
        foreach ( notify_ent in a_target_ents )
        {
            notify_ent notify( self.script_notify, s_info );
        }
    }
    
    level notify( self.script_notify, s_info );
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x90d26588, Offset: 0xd70
// Size: 0x82
function function_ac2f203a( str_flag )
{
    if ( !level flag::exists( str_flag ) )
    {
        level flag::init( str_flag );
    }
    
    if ( !isdefined( level.trigger_flags ) )
    {
        level.trigger_flags = [];
    }
    
    if ( !isdefined( level.trigger_flags[ str_flag ] ) )
    {
        level.trigger_flags[ str_flag ] = [];
    }
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0x62f4960a, Offset: 0xe00
// Size: 0xa0
function flag_set_trigger()
{
    a_str_flags = util::create_flags_and_return_tokens( self.script_flag_set );
    
    foreach ( str_flag in a_str_flags )
    {
        level flag::set( str_flag );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x132bf4b9, Offset: 0xea8
// Size: 0xa8
function flag_clear_trigger( s_info )
{
    a_str_flags = util::create_flags_and_return_tokens( self.script_flag_clear );
    
    foreach ( str_flag in a_str_flags )
    {
        level flag::clear( str_flag );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x827b1f05, Offset: 0xf58
// Size: 0x11a
function add_tokens_to_trigger_flags( tokens )
{
    for ( i = 0; i < tokens.size ; i++ )
    {
        flag = tokens[ i ];
        
        if ( !isdefined( level.trigger_flags[ flag ] ) )
        {
            level.trigger_flags[ flag ] = [];
        }
        else if ( !isarray( level.trigger_flags[ flag ] ) )
        {
            level.trigger_flags[ flag ] = array( level.trigger_flags[ flag ] );
        }
        
        if ( !isinarray( level.trigger_flags[ flag ], self ) )
        {
            level.trigger_flags[ flag ][ level.trigger_flags[ flag ].size ] = self;
        }
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xa377d035, Offset: 0x1080
// Size: 0x190
function friendly_respawn_trigger( trigger )
{
    trigger endon( #"death" );
    spawners = getentarray( trigger.target, "targetname" );
    assert( spawners.size == 1, "<dev string:x95>" + trigger.target + "<dev string:xda>" );
    spawner = spawners[ 0 ];
    assert( !isdefined( spawner.script_forcecolor ), "<dev string:xfc>" + spawner.origin + "<dev string:x113>" );
    spawners = undefined;
    spawner endon( #"death" );
    
    while ( true )
    {
        trigger waittill( #"trigger" );
        
        if ( isdefined( trigger.script_forcecolor ) )
        {
            level.respawn_spawners_specific[ trigger.script_forcecolor ] = spawner;
        }
        else
        {
            level.respawn_spawner = spawner;
        }
        
        level flag::set( "respawn_friendlies" );
        wait 0.5;
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x25769f29, Offset: 0x1218
// Size: 0x70
function friendly_respawn_clear( trigger )
{
    trigger endon( #"death" );
    
    while ( true )
    {
        trigger waittill( #"trigger" );
        level flag::clear( "respawn_friendlies" );
        wait 0.5;
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x31333c7, Offset: 0x1290
// Size: 0x1a8
function script_flag_set_touching( trigger )
{
    trigger endon( #"death" );
    
    if ( isdefined( trigger.script_flag_set_on_touching ) )
    {
        level function_ac2f203a( trigger.script_flag_set_on_touching );
    }
    
    if ( isdefined( trigger.script_flag_set_on_not_touching ) )
    {
        level function_ac2f203a( trigger.script_flag_set_on_not_touching );
    }
    
    trigger thread _detect_touched();
    
    while ( true )
    {
        trigger.script_touched = 0;
        waitframe( 1 );
        waittillframeend();
        
        if ( !trigger.script_touched )
        {
            waitframe( 1 );
            waittillframeend();
        }
        
        if ( trigger.script_touched )
        {
            if ( isdefined( trigger.script_flag_set_on_touching ) )
            {
                level flag::set( trigger.script_flag_set_on_touching );
            }
            
            if ( isdefined( trigger.script_flag_set_on_not_touching ) )
            {
                level flag::clear( trigger.script_flag_set_on_not_touching );
            }
            
            continue;
        }
        
        if ( isdefined( trigger.script_flag_set_on_touching ) )
        {
            level flag::clear( trigger.script_flag_set_on_touching );
        }
        
        if ( isdefined( trigger.script_flag_set_on_not_touching ) )
        {
            level flag::set( trigger.script_flag_set_on_not_touching );
        }
    }
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0x95a6dade, Offset: 0x1440
// Size: 0x42
function _detect_touched()
{
    self endon( #"death" );
    
    while ( true )
    {
        self waittill( #"trigger" );
        self.script_touched = 1;
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x98d0240f, Offset: 0x1490
// Size: 0x78
function trigger_delete_on_touch( trigger )
{
    while ( true )
    {
        waitresult = trigger waittill( #"trigger" );
        other = waitresult.activator;
        
        if ( isdefined( other ) )
        {
            other delete();
        }
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xe45d6f4, Offset: 0x1510
// Size: 0xa4
function trigger_once( s_info )
{
    waittillframeend();
    waittillframeend();
    
    if ( isdefined( self ) )
    {
        /#
            println( "<dev string:x13d>" );
            println( "<dev string:x140>" + self getentitynumber() + "<dev string:x172>" + self.origin );
            println( "<dev string:x13d>" );
        #/
        
        self delete();
    }
}

// Namespace trigger/trigger_shared
// Params 1, eflags: 0x20 variadic
// Checksum 0xe3f74422, Offset: 0x15c0
// Size: 0xf2
function get_all( ... )
{
    if ( vararg.size == 1 && isarray( vararg[ 0 ] ) )
    {
        a_vararg = vararg[ 0 ];
    }
    else
    {
        a_vararg = vararg;
    }
    
    a_all = getentarraybytype( 20 );
    
    if ( a_vararg.size )
    {
        for ( i = a_all.size - 1; i >= 0 ; i-- )
        {
            if ( !isinarray( a_vararg, a_all[ i ].classname ) )
            {
                arrayremoveindex( a_all, i );
            }
        }
    }
    
    return a_all;
}

// Namespace trigger/trigger_shared
// Params 1, eflags: 0x20 variadic
// Checksum 0x2a5ceadc, Offset: 0x16c0
// Size: 0x72
function is_trigger_of_type( ... )
{
    if ( vararg.size == 1 && isarray( vararg[ 0 ] ) )
    {
        a_vararg = vararg[ 0 ];
    }
    else
    {
        a_vararg = vararg;
    }
    
    return isinarray( a_vararg, self.classname );
}

// Namespace trigger/trigger_shared
// Params 4
// Checksum 0xda7201dd, Offset: 0x1740
// Size: 0x1b8
function wait_till( str_name, str_key = "targetname", e_entity, b_assert = 1 )
{
    if ( isdefined( str_name ) )
    {
        triggers = getentarray( str_name, str_key );
        assert( !b_assert || triggers.size > 0, "<dev string:x181>" + str_name + "<dev string:x197>" + str_key );
        
        if ( triggers.size > 0 )
        {
            if ( triggers.size == 1 )
            {
                trigger_hit = triggers[ 0 ];
                trigger_hit _trigger_wait( e_entity );
            }
            else
            {
                s_tracker = spawnstruct();
                array::thread_all( triggers, &_trigger_wait_think, s_tracker, e_entity );
                waitresult = s_tracker waittill( #"trigger" );
                trigger_hit = waitresult.trigger;
                trigger_hit.who = waitresult.activator;
            }
            
            return trigger_hit;
        }
        
        return;
    }
    
    _trigger_wait( e_entity );
    return self;
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xa0b28ce4, Offset: 0x1900
// Size: 0x27e
function _trigger_wait( e_entity )
{
    self endon( #"death" );
    
    if ( isdefined( e_entity ) )
    {
        e_entity endon( #"death" );
    }
    
    if ( !isdefined( self.delaynotify ) )
    {
        self.delaynotify = 0;
    }
    
    /#
        if ( is_look_trigger() )
        {
            assert( !isarray( e_entity ), "<dev string:x1a0>" );
        }
        else if ( self.classname === "<dev string:x1cd>" )
        {
            assert( !isarray( e_entity ), "<dev string:x1de>" );
        }
    #/
    
    while ( true )
    {
        if ( is_look_trigger() )
        {
            waitresult = self waittill( #"trigger_look" );
            wait self.delaynotify;
            e_other = waitresult.activator;
            
            if ( isdefined( e_entity ) )
            {
                if ( e_other !== e_entity )
                {
                    continue;
                }
            }
        }
        else if ( self.classname === "trigger_damage" )
        {
            waitresult = self waittill( #"trigger" );
            wait self.delaynotify;
            e_other = waitresult.activator;
            
            if ( isdefined( e_entity ) )
            {
                if ( e_other !== e_entity )
                {
                    continue;
                }
            }
        }
        else
        {
            waitresult = self waittill( #"trigger" );
            wait self.delaynotify;
            e_other = waitresult.activator;
            
            if ( isdefined( e_entity ) )
            {
                if ( isarray( e_entity ) )
                {
                    if ( !array::is_touching( e_entity, self ) )
                    {
                        continue;
                    }
                }
                else if ( !e_entity istouching( self ) && e_entity !== e_other )
                {
                    continue;
                }
            }
        }
        
        break;
    }
    
    self.who = e_other;
    return e_other;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0x43ee9c06, Offset: 0x1b88
// Size: 0x90
function _trigger_wait_think( s_tracker, e_entity )
{
    self endon( #"death" );
    s_tracker endon( #"trigger" );
    e_other = _trigger_wait( e_entity );
    s_tracker notify( #"trigger", { #activator:e_other, #trigger:self } );
}

// Namespace trigger/trigger_shared
// Params 4
// Checksum 0x643f321c, Offset: 0x1c20
// Size: 0x17c
function use( str_name, str_key = "targetname", ent = getplayers()[ 0 ], b_assert = 1 )
{
    if ( isdefined( str_name ) )
    {
        e_trig = getent( str_name, str_key );
        
        if ( !isdefined( e_trig ) )
        {
            if ( b_assert )
            {
                assertmsg( "<dev string:x181>" + str_name + "<dev string:x197>" + str_key );
            }
            
            return;
        }
    }
    else
    {
        e_trig = self;
        str_name = self.targetname;
    }
    
    if ( isdefined( ent ) )
    {
        e_trig useby( ent );
    }
    else
    {
        e_trig useby( e_trig );
    }
    
    level notify( str_name, ent );
    
    if ( e_trig is_look_trigger() )
    {
        e_trig notify( #"trigger_look", { #entity:ent } );
    }
    
    return e_trig;
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xbdb9ffa3, Offset: 0x1da8
// Size: 0x9c
function set_flag_permissions( msg )
{
    if ( !isdefined( level.trigger_flags ) || !isdefined( level.trigger_flags[ msg ] ) )
    {
        return;
    }
    
    level.trigger_flags[ msg ] = array::remove_undefined( level.trigger_flags[ msg ] );
    array::thread_all( level.trigger_flags[ msg ], &update_based_on_flags );
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0x6d30f197, Offset: 0x1e50
// Size: 0x26c
function update_based_on_flags()
{
    true_on = 1;
    
    if ( isdefined( self.script_flag_true ) )
    {
        tokens = util::create_flags_and_return_tokens( self.script_flag_true );
        
        for ( i = 0; i < tokens.size ; i++ )
        {
            if ( !level flag::get( tokens[ i ] ) )
            {
                true_on = 0;
                break;
            }
        }
    }
    
    false_on = 1;
    
    if ( isdefined( self.script_flag_false ) )
    {
        tokens = util::create_flags_and_return_tokens( self.script_flag_false );
        
        for ( i = 0; i < tokens.size ; i++ )
        {
            if ( level flag::get( tokens[ i ] ) )
            {
                false_on = 0;
                break;
            }
        }
    }
    
    var_369930e5 = 1;
    
    if ( isdefined( self.script_flag_true_any ) )
    {
        var_369930e5 = 0;
        tokens = util::create_flags_and_return_tokens( self.script_flag_true_any );
        
        for ( i = 0; i < tokens.size ; i++ )
        {
            if ( level flag::get( tokens[ i ] ) )
            {
                var_369930e5 = 1;
                break;
            }
        }
    }
    
    var_95bf6d6c = 1;
    
    if ( isdefined( self.script_flag_false_any ) )
    {
        var_95bf6d6c = 0;
        tokens = util::create_flags_and_return_tokens( self.script_flag_false_any );
        
        for ( i = 0; i < tokens.size ; i++ )
        {
            if ( !level flag::get( tokens[ i ] ) )
            {
                var_95bf6d6c = 1;
                break;
            }
        }
    }
    
    self triggerenable( true_on && false_on && var_369930e5 && var_95bf6d6c );
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0x7c7694de, Offset: 0x20c8
// Size: 0x66, Type: bool
function is_look_trigger()
{
    return isdefined( self.spawnflags ) && ( self.spawnflags & 256 ) == 256 && !is_trigger_of_type( "trigger_damage" ) && !is_trigger_of_type( "trigger_damage_new" );
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0x3ddeef39, Offset: 0x2138
// Size: 0x4c, Type: bool
function is_trigger_once()
{
    return isdefined( self.spawnflags ) && ( self.spawnflags & 1024 ) == 1024 || is_trigger_of_type( "trigger_once", "trigger_once_new" );
}

// Namespace trigger/trigger_shared
// Params 1, eflags: 0x20 variadic
// Checksum 0x696c5e08, Offset: 0x2190
// Size: 0x1b2
function wait_till_any( ... )
{
    ent = spawnstruct();
    
    if ( isarray( vararg[ 0 ] ) )
    {
        a_str_targetnames = vararg[ 0 ];
    }
    else
    {
        a_str_targetnames = vararg;
    }
    
    assert( a_str_targetnames.size, "<dev string:x20d>" );
    a_triggers = [];
    a_triggers = arraycombine( a_triggers, getentarray( a_str_targetnames[ 0 ], "targetname" ), 1, 0 );
    
    for ( i = 1; i < a_str_targetnames.size ; i++ )
    {
        a_triggers = arraycombine( a_triggers, getentarray( a_str_targetnames[ i ], "targetname" ), 1, 0 );
    }
    
    for ( i = 0; i < a_triggers.size ; i++ )
    {
        ent thread _ent_waits_for_trigger( a_triggers[ i ] );
    }
    
    waitresult = ent waittill( #"done" );
    return waitresult.trigger;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0xc565eaf6, Offset: 0x2350
// Size: 0x3a
function wait_for_either( str_targetname1, str_targetname2 )
{
    trigger = wait_till_any( str_targetname1, str_targetname2 );
    return trigger;
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xceaaabf1, Offset: 0x2398
// Size: 0x5e
function _ent_waits_for_trigger( trigger )
{
    self endon( #"done" );
    trigger wait_till();
    self notify( #"done", { #trigger:trigger } );
}

// Namespace trigger/trigger_shared
// Params 3
// Checksum 0xc791f662, Offset: 0x2400
// Size: 0x8c
function wait_or_timeout( n_time, str_name, str_key )
{
    if ( isdefined( n_time ) )
    {
        __s = spawnstruct();
        __s endon( #"timeout" );
        __s util::delay_notify( n_time, "timeout" );
    }
    
    wait_till( str_name, str_key );
}

// Namespace trigger/trigger_shared
// Params 4
// Checksum 0x34fd6bbd, Offset: 0x2498
// Size: 0xf4
function trigger_on_timeout( n_time, b_cancel_on_triggered = 1, str_name, str_key = "targetname" )
{
    trig = self;
    
    if ( isdefined( str_name ) )
    {
        trig = getent( str_name, str_key );
    }
    
    if ( b_cancel_on_triggered )
    {
        if ( trig is_look_trigger() )
        {
            trig endon( #"trigger_look" );
        }
        else
        {
            trig endon( #"trigger" );
        }
    }
    
    trig endon( #"death" );
    wait n_time;
    trig use();
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0xf410b8c8, Offset: 0x2598
// Size: 0xa8
function multiple_waits( str_trigger_name, str_trigger_notify )
{
    foreach ( trigger in getentarray( str_trigger_name, "targetname" ) )
    {
        trigger thread multiple_wait( str_trigger_notify );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x7f85b482, Offset: 0x2648
// Size: 0x34
function multiple_wait( str_trigger_notify )
{
    level endon( str_trigger_notify );
    self waittill( #"trigger" );
    level notify( str_trigger_notify );
}

// Namespace trigger/trigger_shared
// Params 9
// Checksum 0x26a3a9f, Offset: 0x2688
// Size: 0x84
function add_function( trigger, str_remove_on, func, param_1, param_2, param_3, param_4, param_5, param_6 )
{
    self thread _do_trigger_function( trigger, str_remove_on, func, param_1, param_2, param_3, param_4, param_5, param_6 );
}

// Namespace trigger/trigger_shared
// Params 9
// Checksum 0xb5b270af, Offset: 0x2718
// Size: 0x108
function _do_trigger_function( trigger, str_remove_on, func, param_1, param_2, param_3, param_4, param_5, param_6 )
{
    self endon( #"death" );
    trigger endon( #"death" );
    
    if ( isdefined( str_remove_on ) )
    {
        trigger endon( str_remove_on );
    }
    
    while ( true )
    {
        if ( isstring( trigger ) )
        {
            wait_till( trigger );
        }
        else
        {
            trigger wait_till();
        }
        
        util::single_thread( self, func, param_1, param_2, param_3, param_4, param_5, param_6 );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0xd9e37531, Offset: 0x2828
// Size: 0x170
function kill_spawner_trigger( s_info )
{
    a_spawners = getspawnerarray( self.script_killspawner, "script_killspawner" );
    
    foreach ( sp in a_spawners )
    {
        sp delete();
    }
    
    a_ents = getentarray( self.script_killspawner, "script_killspawner" );
    
    foreach ( ent in a_ents )
    {
        if ( ent.classname === "spawn_manager" && ent != self )
        {
            ent delete();
        }
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x561d8177, Offset: 0x29a0
// Size: 0xa8
function trigger_group( s_info )
{
    foreach ( trig in getentarray( self.script_trigger_group, "script_trigger_group" ) )
    {
        if ( trig != self )
        {
            trig delete();
        }
    }
}

// Namespace trigger/trigger_shared
// Params 3
// Checksum 0x463179e0, Offset: 0x2a50
// Size: 0x11c
function function_thread( ent, on_enter_payload, on_exit_payload )
{
    ent endon( #"death" );
    
    if ( !isdefined( self ) )
    {
        return;
    }
    
    myentnum = self getentitynumber();
    
    if ( ent ent_already_in( myentnum ) )
    {
        return;
    }
    
    add_to_ent( ent, myentnum );
    
    if ( isdefined( on_enter_payload ) )
    {
        [[ on_enter_payload ]]( ent );
    }
    
    while ( isdefined( ent ) && isdefined( self ) && ent istouching( self ) )
    {
        waitframe( 1 );
    }
    
    if ( isdefined( ent ) )
    {
        if ( isdefined( on_exit_payload ) )
        {
            [[ on_exit_payload ]]( ent );
        }
        
        remove_from_ent( ent, myentnum );
    }
}

// Namespace trigger/trigger_shared
// Params 1
// Checksum 0x67cdde08, Offset: 0x2b78
// Size: 0x4c, Type: bool
function ent_already_in( var_d35ff8d8 )
{
    if ( !isdefined( self._triggers ) )
    {
        return false;
    }
    
    if ( !isdefined( self._triggers[ var_d35ff8d8 ] ) )
    {
        return false;
    }
    
    if ( !self._triggers[ var_d35ff8d8 ] )
    {
        return false;
    }
    
    return true;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0xaeeb2cca, Offset: 0x2bd0
// Size: 0x4a
function add_to_ent( ent, var_d35ff8d8 )
{
    if ( !isdefined( ent._triggers ) )
    {
        ent._triggers = [];
    }
    
    ent._triggers[ var_d35ff8d8 ] = 1;
}

// Namespace trigger/trigger_shared
// Params 2
// Checksum 0xa798f046, Offset: 0x2c28
// Size: 0x56
function remove_from_ent( ent, var_d35ff8d8 )
{
    if ( !isdefined( ent._triggers ) )
    {
        return;
    }
    
    if ( !isdefined( ent._triggers[ var_d35ff8d8 ] ) )
    {
        return;
    }
    
    ent._triggers[ var_d35ff8d8 ] = 0;
}

// Namespace trigger/trigger_shared
// Params 0
// Checksum 0x3780d113, Offset: 0x2c88
// Size: 0x6c
function trigger_wait()
{
    self endon( #"trigger" );
    
    if ( isdefined( self.targetname ) )
    {
        trig = getent( self.targetname, "target" );
        
        if ( isdefined( trig ) )
        {
            trig wait_till();
        }
    }
}

// Namespace trigger/trigger_shared
// Params 2, eflags: 0x20 variadic
// Checksum 0x595c9d20, Offset: 0x2d00
// Size: 0x10c
function run( func, ... )
{
    var_3bdd90c2 = 0;
    
    if ( isdefined( self.targetname ) )
    {
        foreach ( trig in getentarraybytype( 20 ) )
        {
            if ( trig.target === self.targetname )
            {
                trig callback::on_trigger( &function_996dfbe2, undefined, self, func, vararg );
                var_3bdd90c2 = 1;
            }
        }
    }
    
    if ( !var_3bdd90c2 )
    {
        util::single_thread_argarray( self, func, vararg );
    }
}

// Namespace trigger/trigger_shared
// Params 4
// Checksum 0x5b72f454, Offset: 0x2e18
// Size: 0x44
function function_996dfbe2( s_info, ent, func, a_args )
{
    util::single_func_argarray( ent, func, a_args );
}

