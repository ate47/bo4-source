#using scripts\core_common\flag_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_utility;

#namespace zm_sq;

/#

    // Namespace zm_sq/zm_sq
    // Params 0, eflags: 0x6
    // Checksum 0x3fe2e82b, Offset: 0xf8
    // Size: 0x44, Type: dev
    function private autoexec init()
    {
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            adddebugcommand( "<dev string:x38>" );
        }
    }

#/

// Namespace zm_sq/zm_sq
// Params 7
// Checksum 0xb7b5e522, Offset: 0x148
// Size: 0x674
function register( name, step_name, var_e788cdd7, setup_func, cleanup_func, var_d6ca4caf, var_27465eb4 )
{
    /#
        assert( ishash( name ), "<dev string:x77>" );
        assert( ishash( step_name ), "<dev string:x90>" );
        assert( ishash( var_e788cdd7 ), "<dev string:xab>" );
        
        if ( !isdefined( name ) )
        {
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:xca>" );
                println( "<dev string:xca>" );
            }
            
            return;
        }
        
        if ( !isdefined( step_name ) )
        {
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:x10d>" );
                println( "<dev string:x10d>" );
            }
            
            return;
        }
        
        if ( !isdefined( setup_func ) )
        {
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:x155>" );
                println( "<dev string:x155>" );
            }
            
            return;
        }
        
        if ( !isdefined( cleanup_func ) )
        {
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:x19e>" );
                println( "<dev string:x19e>" );
            }
            
            return;
        }
        
        if ( isdefined( level._ee ) && isdefined( level._ee[ name ] ) && isdefined( var_d6ca4caf ) && isdefined( level._ee[ name ].record_stat ) )
        {
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:x1e9>" );
                println( "<dev string:x1e9>" );
            }
            
            return;
        }
    #/
    
    if ( !isdefined( level._ee ) )
    {
        level._ee = [];
    }
    
    if ( !isdefined( level._ee[ name ] ) )
    {
        level._ee[ name ] = { #name:name, #completed:0, #steps:[], #current_step:0, #started:0, #skip_to_step:-1 };
        
        /#
            if ( getdvarint( #"zm_debug_ee", 0 ) )
            {
                thread function_28aee167( name );
            }
        #/
    }
    
    ee = level._ee[ name ];
    
    if ( !isdefined( ee.record_stat ) )
    {
        ee.record_stat = var_d6ca4caf;
    }
    
    if ( !isdefined( ee.var_35ccab99 ) )
    {
        ee.var_35ccab99 = var_27465eb4;
    }
    
    new_step = { #name:step_name, #ee:ee, #var_e788cdd7:var_e788cdd7, #setup_func:setup_func, #cleanup_func:cleanup_func, #started:0, #completed:0, #cleaned_up:0 };
    previous_step = ee.steps[ level._ee[ name ].steps.size - 1 ];
    
    if ( isdefined( previous_step ) )
    {
        previous_step.next_step = new_step;
    }
    
    if ( !isdefined( ee.steps ) )
    {
        ee.steps = [];
    }
    else if ( !isarray( ee.steps ) )
    {
        ee.steps = array( ee.steps );
    }
    
    ee.steps[ ee.steps.size ] = new_step;
    level flag::init( var_e788cdd7 + "_completed" );
    
    if ( !level flag::exists( ee.name + "_completed" ) )
    {
        level flag::init( ee.name + "_completed" );
    }
    
    /#
        if ( getdvarint( #"zm_debug_ee", 0 ) )
        {
            thread function_b3da1a16( ee.name, new_step.name );
            thread devgui_think();
        }
    #/
}

// Namespace zm_sq/zm_sq
// Params 2
// Checksum 0x7719adeb, Offset: 0x7c8
// Size: 0x254
function start( name, var_9d8cf7f = 0 )
{
    if ( !zm_utility::is_ee_enabled() && !var_9d8cf7f )
    {
        return;
    }
    
    assert( ishash( name ), "<dev string:x77>" );
    assert( isdefined( level._ee[ name ] ), "<dev string:x244>" + function_9e72a96( name ) + "<dev string:x24a>" );
    
    if ( level._ee[ name ].started )
    {
        /#
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:x244>" + function_9e72a96( name ) + "<dev string:x265>" );
                println( "<dev string:x244>" + function_9e72a96( name ) + "<dev string:x265>" );
            }
        #/
        
        return;
    }
    
    ee = level._ee[ name ];
    var_5ea5c94d = 0;
    
    /#
        if ( ee.skip_to_step > -1 )
        {
            assert( 0 <= ee.skip_to_step, "<dev string:x281>" );
            
            if ( 0 < ee.skip_to_step )
            {
                var_5ea5c94d = 1;
            }
            else if ( 0 == ee.skip_to_step )
            {
                ee.skip_to_step = -1;
            }
        }
    #/
    
    level thread run_step( ee, ee.steps[ 0 ], var_5ea5c94d );
}

// Namespace zm_sq/zm_sq
// Params 1
// Checksum 0x1a47757b, Offset: 0xa28
// Size: 0xa2
function is_complete( name )
{
    assert( ishash( name ), "<dev string:x77>" );
    assert( isdefined( level._ee[ name ] ), "<dev string:x244>" + function_9e72a96( name ) + "<dev string:x24a>" );
    return level._ee[ name ].completed;
}

// Namespace zm_sq/zm_sq
// Params 2
// Checksum 0x1490abbf, Offset: 0xad8
// Size: 0x142
function function_9212ff4d( ee_name, step_name )
{
    assert( ishash( ee_name ), "<dev string:x77>" );
    assert( ishash( step_name ), "<dev string:x90>" );
    assert( isdefined( level._ee[ ee_name ] ), "<dev string:x244>" + ee_name + "<dev string:x2a5>" );
    
    foreach ( ee_index, ee_step in level._ee[ ee_name ].steps )
    {
        if ( step_name == ee_step.name )
        {
            return ee_index;
        }
    }
    
    return -1;
}

// Namespace zm_sq/zm_sq
// Params 3, eflags: 0x4
// Checksum 0x786c174e, Offset: 0xc28
// Size: 0x894
function private run_step( ee, step, var_5ea5c94d )
{
    level endon( #"game_ended" );
    
    /#
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step.name ) + "<dev string:x2c8>" );
            println( function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step.name ) + "<dev string:x2c8>" );
        }
    #/
    
    ee.started = 1;
    step.started = 1;
    level thread function_3f795dc3( ee, step, var_5ea5c94d );
    
    if ( !step.completed )
    {
        waitresult = level waittill( step.var_e788cdd7 + "_setup_completed", step.var_e788cdd7 + "_ended_early" );
    }
    
    /#
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step.name ) + "<dev string:x2da>" );
            println( function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step.name ) + "<dev string:x2da>" );
        }
    #/
    
    if ( game.state === "postgame" )
    {
        return;
    }
    
    ended_early = isdefined( waitresult ) && waitresult._notify == step.var_e788cdd7 + "_ended_early";
    [[ step.cleanup_func ]]( var_5ea5c94d, ended_early );
    
    /#
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step.name ) + "<dev string:x2ef>" );
            println( function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step.name ) + "<dev string:x2ef>" );
        }
    #/
    
    step.cleaned_up = 1;
    
    if ( game.state === "postgame" )
    {
        return;
    }
    
    level flag::set( step.var_e788cdd7 + "_completed" );
    
    if ( ee.current_step === 0 && isdefined( ee.record_stat ) && ee.record_stat )
    {
        players = getplayers();
        
        foreach ( player in players )
        {
            player.var_897fa11b = 1;
        }
    }
    
    if ( isdefined( step.next_step ) )
    {
        var_5ea5c94d = 0;
        
        /#
            if ( ee.skip_to_step > -1 )
            {
                var_7f1ec3f3 = ee.current_step + 1;
                assert( var_7f1ec3f3 <= ee.skip_to_step, "<dev string:x281>" );
                
                if ( var_7f1ec3f3 < ee.skip_to_step )
                {
                    var_5ea5c94d = 1;
                }
                else if ( var_7f1ec3f3 == ee.skip_to_step )
                {
                    ee.skip_to_step = -1;
                }
                
                wait 0.5;
            }
        #/
        
        ee.current_step++;
        level thread run_step( ee, step.next_step, var_5ea5c94d );
        return;
    }
    
    ee.completed = 1;
    level flag::set( ee.name + "_completed" );
    
    if ( sessionmodeisonlinegame() && isdefined( ee.record_stat ) && ee.record_stat )
    {
        players = getplayers();
        
        foreach ( player in players )
        {
            if ( isdefined( player.var_897fa11b ) && player.var_897fa11b )
            {
                player zm_stats::set_map_stat( #"main_quest_completed", 1 );
                player zm_stats::function_a6efb963( #"main_quest_completed", 1 );
                player zm_stats::function_9288c79b( #"main_quest_completed", 1 );
                n_time_elapsed = gettime() - level.var_21e22beb;
                player zm_stats::function_366b6fb9( "FASTEST_QUEST_COMPLETION_TIME", n_time_elapsed );
                scoreevents::processscoreevent( #"main_ee", player );
                
                if ( isdefined( ee.var_35ccab99 ) )
                {
                    player thread [[ ee.var_35ccab99 ]]();
                }
            }
        }
        
        zm_stats::set_match_stat( #"main_quest_completed", 1 );
        zm_stats::function_ea5b4947();
    }
    
    /#
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( "<dev string:x244>" + function_9e72a96( ee.name ) + "<dev string:x306>" );
            println( "<dev string:x244>" + function_9e72a96( ee.name ) + "<dev string:x306>" );
        }
    #/
}

// Namespace zm_sq/zm_sq
// Params 3, eflags: 0x4
// Checksum 0x4b4345fc, Offset: 0x14c8
// Size: 0xb6
function private function_3f795dc3( ee, step, var_5ea5c94d )
{
    level endon( #"game_ended" );
    step endoncallback( &function_df365859, #"end_early" );
    level notify( step.var_e788cdd7 + "_started" );
    [[ step.setup_func ]]( var_5ea5c94d );
    step.completed = 1;
    level notify( step.var_e788cdd7 + "_setup_completed" );
}

// Namespace zm_sq/zm_sq
// Params 1, eflags: 0x4
// Checksum 0x25e3ebe5, Offset: 0x1588
// Size: 0x12a
function private function_df365859( notifyhash )
{
    /#
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( function_9e72a96( self.ee.name ) + "<dev string:x2c4>" + function_9e72a96( self.name ) + "<dev string:x316>" );
            println( function_9e72a96( self.ee.name ) + "<dev string:x2c4>" + function_9e72a96( self.name ) + "<dev string:x316>" );
        }
    #/
    
    self.completed = 1;
    level notify( self.var_e788cdd7 + "_ended_early" );
    level notify( self.var_e788cdd7 + "_setup_completed" );
}

/#

    // Namespace zm_sq/zm_sq
    // Params 2
    // Checksum 0x6a1e7d4a, Offset: 0x16c0
    // Size: 0x1de, Type: dev
    function function_f09763fd( ee_name, step_name )
    {
        assert( ishash( ee_name ), "<dev string:x77>" );
        assert( isdefined( level._ee[ ee_name ] ), "<dev string:x244>" + ee_name + "<dev string:x2a5>" );
        var_da601d7f = function_44e256d8( ee_name );
        index = function_9212ff4d( ee_name, step_name );
        
        if ( index == -1 )
        {
            if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
            {
                iprintlnbold( "<dev string:x244>" + function_9e72a96( ee_name ) + "<dev string:x325>" + function_9e72a96( step_name ) );
                println( "<dev string:x244>" + function_9e72a96( ee_name ) + "<dev string:x325>" + function_9e72a96( step_name ) );
            }
            
            return;
        }
        
        return var_da601d7f + "<dev string:x33f>" + function_9e72a96( step_name ) + "<dev string:x348>" + index + "<dev string:x34c>";
    }

    // Namespace zm_sq/zm_sq
    // Params 1
    // Checksum 0x600097f8, Offset: 0x18a8
    // Size: 0x66, Type: dev
    function function_44e256d8( ee_name )
    {
        assert( ishash( ee_name ), "<dev string:x77>" );
        return "<dev string:x350>" + function_9e72a96( ee_name ) + "<dev string:x34c>";
    }

    // Namespace zm_sq/zm_sq
    // Params 1
    // Checksum 0xaa10523c, Offset: 0x1918
    // Size: 0xc4, Type: dev
    function function_28aee167( ee_name )
    {
        assert( ishash( ee_name ), "<dev string:x77>" );
        ee_path = function_44e256d8( ee_name );
        util::waittill_can_add_debug_command();
        adddebugcommand( "<dev string:x359>" + ee_path + "<dev string:x368>" + function_9e72a96( ee_name ) + "<dev string:x38b>" );
    }

    // Namespace zm_sq/zm_sq
    // Params 2
    // Checksum 0x13216cbc, Offset: 0x19e8
    // Size: 0x184, Type: dev
    function function_b3da1a16( ee_name, step_name )
    {
        assert( ishash( ee_name ), "<dev string:x77>" );
        assert( ishash( step_name ), "<dev string:x90>" );
        step_path = function_f09763fd( ee_name, step_name );
        index = function_9212ff4d( ee_name, step_name );
        util::waittill_can_add_debug_command();
        adddebugcommand( "<dev string:x359>" + step_path + "<dev string:x390>" + function_9e72a96( ee_name ) + "<dev string:x2c4>" + index + "<dev string:x38b>" );
        adddebugcommand( "<dev string:x359>" + step_path + "<dev string:x3b7>" + function_9e72a96( ee_name ) + "<dev string:x2c4>" + index + "<dev string:x38b>" );
    }

    // Namespace zm_sq/zm_sq
    // Params 2
    // Checksum 0x7d0df259, Offset: 0x1b78
    // Size: 0xda, Type: dev
    function function_87306f8a( ee_name, step_name )
    {
        ee = level._ee[ ee_name ];
        step_index = function_9212ff4d( ee_name, step_name );
        
        if ( ee.started && step_index <= ee.current_step )
        {
            return 0;
        }
        
        ee.skip_to_step = step_index;
        
        if ( ee.started )
        {
            function_614612f( ee_name );
        }
        else
        {
            start( ee.name );
        }
        
        return 1;
    }

    // Namespace zm_sq/zm_sq
    // Params 1
    // Checksum 0xd91ceeae, Offset: 0x1c60
    // Size: 0x16c, Type: dev
    function function_614612f( ee_name )
    {
        ee = level._ee[ ee_name ];
        
        if ( ee.started )
        {
            ee.steps[ ee.current_step ] notify( #"end_early" );
            return;
        }
        
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( "<dev string:x3e0>" + function_9e72a96( ee_name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) + "<dev string:x3f6>" );
            println( "<dev string:x3e0>" + function_9e72a96( ee_name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) + "<dev string:x3f6>" );
        }
    }

    // Namespace zm_sq/zm_sq
    // Params 2
    // Checksum 0xe5f8dfb3, Offset: 0x1dd8
    // Size: 0x324, Type: dev
    function function_f2dd8601( ee_name, var_f2c264bb )
    {
        level endon( #"game_ended" );
        ee = level._ee[ ee_name ];
        step = ee.steps[ var_f2c264bb ];
        
        if ( function_87306f8a( ee_name, step.name ) )
        {
            if ( !step.started )
            {
                wait_time = 10 * ee.steps.size;
                waitresult = level waittilltimeout( wait_time, step.var_e788cdd7 + "<dev string:x413>" );
                
                if ( waitresult._notify == #"timeout" )
                {
                    if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
                    {
                        iprintlnbold( "<dev string:x41e>" + function_9e72a96( ee_name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) );
                        println( "<dev string:x41e>" + function_9e72a96( ee_name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) );
                    }
                    
                    return;
                }
            }
            
            wait 1;
        }
        
        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
        {
            iprintlnbold( "<dev string:x448>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) + "<dev string:x456>" );
            println( "<dev string:x448>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) + "<dev string:x456>" );
        }
        
        function_614612f( ee_name );
    }

    // Namespace zm_sq/zm_sq
    // Params 0
    // Checksum 0x5379f41b, Offset: 0x2108
    // Size: 0x7b6, Type: dev
    function devgui_think()
    {
        level notify( #"hash_6d8b1a4c632ecc9" );
        level endon( #"hash_6d8b1a4c632ecc9" );
        
        while ( true )
        {
            wait 1;
            cmd = getdvarstring( #"hash_319d902ea18eb39" );
            setdvar( #"hash_319d902ea18eb39", "<dev string:x45c>" );
            cmd = strtok( cmd, "<dev string:x2c4>" );
            
            if ( cmd.size == 0 )
            {
                continue;
            }
            
            switch ( cmd[ 0 ] )
            {
                case #"skip_to":
                    ee = level._ee[ cmd[ 1 ] ];
                    
                    if ( !isdefined( ee ) )
                    {
                        continue;
                    }
                    
                    var_f2c264bb = int( cmd[ 2 ] );
                    step_name = ee.steps[ var_f2c264bb ].name;
                    
                    if ( var_f2c264bb < ee.current_step )
                    {
                        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
                        {
                            iprintlnbold( "<dev string:x45f>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) );
                            println( "<dev string:x45f>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) );
                        }
                    }
                    else if ( var_f2c264bb == ee.current_step )
                    {
                        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
                        {
                            iprintlnbold( "<dev string:x48f>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step_name ) );
                            println( "<dev string:x48f>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step_name ) );
                        }
                    }
                    else
                    {
                        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
                        {
                            iprintlnbold( "<dev string:x4a2>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step_name ) + "<dev string:x456>" );
                            println( "<dev string:x4a2>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( step_name ) + "<dev string:x456>" );
                        }
                        
                        function_87306f8a( ee.name, step_name );
                    }
                    
                    break;
                case #"complete":
                    ee = level._ee[ cmd[ 1 ] ];
                    
                    if ( !isdefined( ee ) )
                    {
                        continue;
                    }
                    
                    var_f2c264bb = int( cmd[ 2 ] );
                    
                    if ( var_f2c264bb < ee.current_step )
                    {
                        if ( getdvarint( #"hash_7919e37cd5d57659", 0 ) )
                        {
                            iprintlnbold( "<dev string:x4b1>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) );
                            println( "<dev string:x4b1>" + function_9e72a96( ee.name ) + "<dev string:x2c4>" + function_9e72a96( ee.steps[ ee.current_step ].name ) );
                        }
                    }
                    else
                    {
                        level thread function_f2dd8601( ee.name, var_f2c264bb );
                    }
                    
                    break;
                case #"start":
                    if ( isdefined( level._ee[ cmd[ 1 ] ] ) )
                    {
                        start( hash( cmd[ 1 ] ) );
                    }
                    
                    break;
                case #"show_status":
                    if ( isdefined( level.var_7f2ca392 ) && level.var_7f2ca392 )
                    {
                        function_c1d3567c();
                    }
                    else
                    {
                        function_5df75220();
                        level thread function_9bee49bf();
                    }
                    
                    break;
                case #"outro":
                    if ( cmd.size < 2 || !isdefined( level._ee[ cmd[ 1 ] ] ) )
                    {
                        break;
                    }
                    
                    ee = level._ee[ cmd[ 1 ] ];
                    
                    if ( isdefined( ee ) )
                    {
                        level waittill( #"start_zombie_round_logic" );
                        step_name = ee.steps[ ee.steps.size - 1 ].name;
                        function_87306f8a( ee.name, step_name );
                    }
                    
                    break;
            }
        }
    }

    // Namespace zm_sq/zm_sq
    // Params 2, eflags: 0x4
    // Checksum 0xeb14e1d1, Offset: 0x28c8
    // Size: 0xbc, Type: dev
    function private create_hudelem( y, x )
    {
        if ( !isdefined( x ) )
        {
            x = 0;
        }
        
        var_aa917a22 = newdebughudelem();
        var_aa917a22.alignx = "<dev string:x4e2>";
        var_aa917a22.horzalign = "<dev string:x4e2>";
        var_aa917a22.aligny = "<dev string:x4e9>";
        var_aa917a22.vertalign = "<dev string:x4f2>";
        var_aa917a22.y = y;
        var_aa917a22.x = x;
        return var_aa917a22;
    }

    // Namespace zm_sq/zm_sq
    // Params 0
    // Checksum 0x2ad16f45, Offset: 0x2990
    // Size: 0x24a, Type: dev
    function function_5df75220()
    {
        current_y = 30;
        
        foreach ( ee in level._ee )
        {
            current_x = 30;
            
            if ( !isdefined( ee.debug_hudelem ) )
            {
                ee.debug_hudelem = create_hudelem( current_y, current_x );
            }
            
            ee.debug_hudelem settext( function_9e72a96( ee.name ) );
            ee.debug_hudelem.fontscale = 1.5;
            current_x += 5;
            step_string = "<dev string:x4f8>";
            
            foreach ( step in ee.steps )
            {
                current_y += 15;
                
                if ( !isdefined( step.debug_hudelem ) )
                {
                    step.debug_hudelem = create_hudelem( current_y, current_x );
                }
                
                step.debug_hudelem settext( step_string + function_9e72a96( step.name ) );
                step.debug_hudelem.fontscale = 1.5;
            }
            
            current_y += 30;
        }
        
        level.var_7f2ca392 = 1;
    }

    // Namespace zm_sq/zm_sq
    // Params 0
    // Checksum 0x65220912, Offset: 0x2be8
    // Size: 0x162, Type: dev
    function function_c1d3567c()
    {
        level notify( #"hash_21c0567b0010f696" );
        
        foreach ( ee in level._ee )
        {
            if ( isdefined( ee.debug_hudelem ) )
            {
                ee.debug_hudelem destroy();
            }
            
            ee.debug_hudelem = undefined;
            
            foreach ( step in ee.steps )
            {
                if ( isdefined( step.debug_hudelem ) )
                {
                    step.debug_hudelem destroy();
                }
                
                step.debug_hudelem = undefined;
            }
        }
        
        level.var_7f2ca392 = undefined;
    }

    // Namespace zm_sq/zm_sq
    // Params 0
    // Checksum 0x610bff0c, Offset: 0x2d58
    // Size: 0x142, Type: dev
    function function_9bee49bf()
    {
        level endon( #"hash_21c0567b0010f696" );
        
        while ( true )
        {
            waitframe( 1 );
            
            foreach ( ee in level._ee )
            {
                ee.debug_hudelem.color = function_1091b2a0( ee );
                
                foreach ( step in ee.steps )
                {
                    step.debug_hudelem.color = function_1091b2a0( step );
                }
            }
        }
    }

    // Namespace zm_sq/zm_sq
    // Params 1
    // Checksum 0x3f693850, Offset: 0x2ea8
    // Size: 0x64, Type: dev
    function function_1091b2a0( var_4f1c1316 )
    {
        if ( !var_4f1c1316.started )
        {
            color = ( 0.75, 0.75, 0.75 );
        }
        else if ( !var_4f1c1316.completed )
        {
            color = ( 1, 0, 0 );
        }
        else
        {
            color = ( 0, 1, 0 );
        }
        
        return color;
    }

#/
