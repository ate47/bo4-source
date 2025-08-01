#using script_1496ada77dc2f2e2;
#using script_6951ea86fdae9ae0;
#using script_770e34dfe9b07f3c;
#using script_7828033bc0ecda72;
#using script_7b843bf90a032750;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\struct;
#using scripts\core_common\util_shared;
#using scripts\zm_common\gametypes\zm_gametype;
#using scripts\zm_common\trials\zm_trial_acquire_perks;
#using scripts\zm_common\trials\zm_trial_acquire_weapon;
#using scripts\zm_common\trials\zm_trial_add_special;
#using scripts\zm_common\trials\zm_trial_damage_drains_points;
#using scripts\zm_common\trials\zm_trial_defend_area;
#using scripts\zm_common\trials\zm_trial_disable_buys;
#using scripts\zm_common\trials\zm_trial_disable_hero_weapons;
#using scripts\zm_common\trials\zm_trial_disable_hud;
#using scripts\zm_common\trials\zm_trial_double_damage;
#using scripts\zm_common\trials\zm_trial_give_reward;
#using scripts\zm_common\trials\zm_trial_headshots_only;
#using scripts\zm_common\trials\zm_trial_reset_loadout;
#using scripts\zm_common\trials\zm_trial_restrict_controls;
#using scripts\zm_common\trials\zm_trial_restrict_loadout;
#using scripts\zm_common\trials\zm_trial_special_enemy;
#using scripts\zm_common\trials\zm_trial_sprinters_only;
#using scripts\zm_common\trials\zm_trial_timeout;
#using scripts\zm_common\trials\zm_trial_turn_on_power;
#using scripts\zm_common\trials\zm_trial_upgrade_multiple;
#using scripts\zm_common\zm_game_module;
#using scripts\zm_common\zm_laststand;
#using scripts\zm_common\zm_round_logic;
#using scripts\zm_common\zm_stats;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;

#namespace ztrials;

// Namespace ztrials/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x4bd7697e, Offset: 0x238
// Size: 0x19c
function event_handler[gametype_init] main( eventstruct )
{
    zm_gametype::main();
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level._game_module_custom_spawn_init_func = &zm_gametype::custom_spawn_init_func;
    level._game_module_stat_update_func = &zm_stats::survival_classic_custom_stat_update;
    level._round_start_func = &zm_round_logic::round_start;
    level.var_57cc29f3 = &function_491101ba;
    level.var_d0b54199 = &function_b8839207;
    level.var_9093a47e = &function_b8839207;
    level.round_end_custom_logic = &function_61fd0e87;
    level.round_number = 0;
    level.trial_strikes = 0;
    level flag::init( #"ztrial", 1 );
    callback::on_connect( &function_8277ff43 );
    level._supress_survived_screen = 1;
    setscoreboardcolumns( "score", "kills", "headshots", "revives", "downs" );
}

// Namespace ztrials/level_init
// Params 1, eflags: 0x40
// Checksum 0x3077cb36, Offset: 0x3e0
// Size: 0x164
function event_handler[level_init] levelinit( eventstruct )
{
    var_189d26ca = "";
    
    /#
        var_189d26ca = getdvarstring( #"ztrial_name" );
    #/
    
    var_3b363b7a = getgametypesetting( #"zmtrialsvariant" );
    
    if ( isdefined( var_3b363b7a ) && var_3b363b7a > 0 )
    {
        var_189d26ca = util::get_map_name() + "_variant_" + var_3b363b7a;
    }
    else if ( var_189d26ca == "" )
    {
        var_189d26ca = util::get_map_name() + "_default";
    }
    
    assert( var_189d26ca != "<dev string:x38>", "<dev string:x3b>" );
    level.var_6d87ac05 = zm_trial::function_d02ffd( var_189d26ca );
    assert( isdefined( level.var_6d87ac05 ), "<dev string:x53>" );
    
    /#
        function_9a6b2309();
    #/
}

// Namespace ztrials/ztrials
// Params 0
// Checksum 0xb3266a59, Offset: 0x550
// Size: 0x1e
function onprecachegametype()
{
    level.canplayersuicide = &zm_gametype::canplayersuicide;
}

// Namespace ztrials/ztrials
// Params 0
// Checksum 0x90d95af8, Offset: 0x578
// Size: 0x16c
function onstartgametype()
{
    level.spawnmins = ( 0, 0, 0 );
    level.spawnmaxs = ( 0, 0, 0 );
    structs = struct::get_array( "player_respawn_point", "targetname" );
    
    foreach ( struct in structs )
    {
        level.spawnmins = math::expand_mins( level.spawnmins, struct.origin );
        level.spawnmaxs = math::expand_maxs( level.spawnmaxs, struct.origin );
    }
    
    level.mapcenter = math::find_box_center( level.spawnmins, level.spawnmaxs );
    setmapcenter( level.mapcenter );
    changeadvertisedstatus( 0 );
}

// Namespace ztrials/ztrials
// Params 0, eflags: 0x4
// Checksum 0xbcd3266, Offset: 0x6f0
// Size: 0x54
function private function_8277ff43()
{
    self endon( #"disconnect" );
    level flag::wait_till( "start_zombie_round_logic" );
    waitframe( 1 );
    self zm_laststand::function_3d685b5f( 0 );
}

// Namespace ztrials/ztrials
// Params 1, eflags: 0x4
// Checksum 0x994821fc, Offset: 0x750
// Size: 0x2ae, Type: bool
function private function_491101ba( player )
{
    if ( player hasperk( #"specialty_berserker" ) && !( isdefined( player.var_a4630f64 ) && player.var_a4630f64 ) )
    {
        return true;
    }
    
    if ( level flag::get( "round_reset" ) )
    {
        return true;
    }
    
    var_57807cdc = [];
    
    foreach ( player in getplayers() )
    {
        if ( !isdefined( var_57807cdc ) )
        {
            var_57807cdc = [];
        }
        else if ( !isarray( var_57807cdc ) )
        {
            var_57807cdc = array( var_57807cdc );
        }
        
        if ( !isinarray( var_57807cdc, player ) )
        {
            var_57807cdc[ var_57807cdc.size ] = player;
        }
    }
    
    if ( var_57807cdc.size > 1 )
    {
        zm_trial::fail( #"hash_60e5e8df8709ad64", var_57807cdc );
    }
    else if ( var_57807cdc.size == 1 )
    {
        zm_trial::fail( #"hash_272fae998263208b", var_57807cdc );
    }
    else
    {
        if ( !isdefined( var_57807cdc ) )
        {
            var_57807cdc = [];
        }
        else if ( !isarray( var_57807cdc ) )
        {
            var_57807cdc = array( var_57807cdc );
        }
        
        if ( !isinarray( var_57807cdc, player ) )
        {
            var_57807cdc[ var_57807cdc.size ] = player;
        }
        
        zm_trial::fail( #"hash_272fae998263208b", var_57807cdc );
    }
    
    if ( level flag::get( "round_reset" ) )
    {
        return true;
    }
    
    assert( level flag::get( #"trial_failed" ) );
    return false;
}

// Namespace ztrials/ztrials
// Params 0, eflags: 0x4
// Checksum 0xca0d96d1, Offset: 0xa08
// Size: 0xf4
function private function_61fd0e87()
{
    assert( isdefined( level.var_6d87ac05 ) );
    
    if ( !level flag::get( "round_reset" ) && level.round_number >= level.var_6d87ac05.rounds.size )
    {
        level thread zm_trial::function_361e2cb0();
    }
    
    if ( !level flag::get( "round_reset" ) && !level flag::get( #"trial_failed" ) )
    {
        zm_trial_util::function_96e10d88( 1 );
        wait 3;
    }
}

// Namespace ztrials/ztrials
// Params 2, eflags: 0x4
// Checksum 0x229530f1, Offset: 0xb08
// Size: 0xee
function private function_b8839207( e_door, n_cost )
{
    level flag::wait_till( "start_zombie_round_logic" );
    e_door notify( #"hash_42c191c31ed08a4" );
    e_door endon( #"hash_42c191c31ed08a4", #"death" );
    
    while ( true )
    {
        if ( n_cost > 0 && zm_trial_disable_buys::is_active() )
        {
            e_door sethintstring( #"hash_55d25caf8f7bbb2f" );
        }
        else
        {
            e_door zm_utility::set_hint_string( self, "default_buy_door", n_cost );
        }
        
        wait 1;
    }
}

/#

    // Namespace ztrials/ztrials
    // Params 0, eflags: 0x4
    // Checksum 0x15fb6caf, Offset: 0xc00
    // Size: 0x106, Type: dev
    function private complete_current_round()
    {
        level.devcheater = 1;
        level.zombie_total = 0;
        level notify( #"kill_round" );
        wait 1;
        zombies = getaiteamarray( level.zombie_team );
        
        if ( isdefined( zombies ) )
        {
            for ( i = 0; i < zombies.size ; i++ )
            {
                if ( isdefined( zombies[ i ].ignore_devgui_death ) && zombies[ i ].ignore_devgui_death )
                {
                    continue;
                }
                
                zombies[ i ] dodamage( zombies[ i ].health + 666, zombies[ i ].origin );
            }
        }
    }

    // Namespace ztrials/ztrials
    // Params 1, eflags: 0x4
    // Checksum 0xdf5fd088, Offset: 0xd10
    // Size: 0x198, Type: dev
    function private function_1201b5da( medal )
    {
        round = undefined;
        
        switch ( medal )
        {
            case #"gold":
                round = 30;
                break;
            case #"silver":
                round = 20;
                break;
            case #"bronze":
                round = 10;
                break;
            default:
                assert( 0 );
                break;
        }
        
        assert( isdefined( round ) );
        round_info = level.var_6d87ac05.rounds[ round - 1 ];
        assert( isdefined( round_info ) );
        
        for ( i = 0; i < round_info.challenges.size ; i++ )
        {
            challenge = round_info.challenges[ i ];
            
            if ( challenge.name == #"give_reward" )
            {
                return challenge;
            }
        }
        
        assert( 0 );
        return undefined;
    }

    // Namespace ztrials/ztrials
    // Params 0, eflags: 0x4
    // Checksum 0x339880fe, Offset: 0xeb0
    // Size: 0x85e, Type: dev
    function private function_9a6b2309()
    {
        assert( isdefined( level.var_6d87ac05 ) );
        
        foreach ( round_info in level.var_6d87ac05.rounds )
        {
            adddebugcommand( "<dev string:xeb>" + round_info.round + "<dev string:x10e>" + function_9e72a96( round_info.name ) + "<dev string:x112>" + round_info.round + "<dev string:x116>" + round_info.round + "<dev string:x138>" );
        }
        
        for ( i = 0; i <= 3 ; i++ )
        {
            adddebugcommand( "<dev string:x13d>" + i + "<dev string:x162>" + i + "<dev string:x138>" );
        }
        
        adddebugcommand( "<dev string:x186>" );
        adddebugcommand( "<dev string:x1d4>" );
        adddebugcommand( "<dev string:x21a>" );
        adddebugcommand( "<dev string:x275>" );
        adddebugcommand( "<dev string:x2ca>" );
        adddebugcommand( "<dev string:x323>" );
        adddebugcommand( "<dev string:x37c>" );
        
        while ( true )
        {
            string = getdvarstring( #"hash_57e97658cd1d89e2", "<dev string:x38>" );
            cmd = strtok( string, "<dev string:x3c9>" );
            
            if ( cmd.size > 0 )
            {
                round_number = int( cmd[ 0 ] );
                
                if ( isdefined( level.var_b9714a5d ) )
                {
                    [[ level.var_b9714a5d ]]( round_number );
                }
                
                level thread zm_game_module::zombie_goto_round( round_number );
                setdvar( #"hash_57e97658cd1d89e2", "<dev string:x38>" );
            }
            
            string = getdvarstring( #"hash_25a4cfc19b09ae41", "<dev string:x38>" );
            cmd = strtok( string, "<dev string:x3c9>" );
            
            if ( cmd.size > 0 )
            {
                strikes = int( cmd[ 0 ] );
                
                if ( strikes == 3 )
                {
                    zm_trial::function_fe2ecb6( strikes - 1 );
                    zm_trial::fail();
                }
                else
                {
                    zm_trial::function_fe2ecb6( strikes );
                }
                
                setdvar( #"hash_25a4cfc19b09ae41", "<dev string:x38>" );
            }
            
            string = getdvarstring( #"hash_2446ebd1d15f0dab", "<dev string:x38>" );
            cmd = strtok( string, "<dev string:x3c9>" );
            
            if ( cmd.size > 0 )
            {
                complete_current_round();
                setdvar( #"hash_2446ebd1d15f0dab", "<dev string:x38>" );
            }
            
            string = getdvarstring( #"hash_5a32209acb1f54a0", "<dev string:x38>" );
            cmd = strtok( string, "<dev string:x3c9>" );
            
            if ( cmd.size > 0 )
            {
                zm_trial::fail( undefined, getplayers() );
                setdvar( #"hash_5a32209acb1f54a0", "<dev string:x38>" );
            }
            
            string = getdvarstring( #"hash_1576c65ebdf43de0", "<dev string:x38>" );
            cmd = strtok( string, "<dev string:x3c9>" );
            
            if ( cmd.size > 0 )
            {
                foreach ( player in getplayers() )
                {
                    player zm_stats::function_49469f35( "<dev string:x3cd>", 0 );
                    player zm_stats::function_49469f35( "<dev string:x3e8>", 0 );
                    player zm_stats::function_49469f35( "<dev string:x403>", 0 );
                }
                
                level.var_ee7ca64 = [];
                setdvar( #"hash_1576c65ebdf43de0", "<dev string:x38>" );
            }
            
            string = getdvarstring( #"hash_2f6ef50454652bf2", "<dev string:x38>" );
            cmd = strtok( string, "<dev string:x3c9>" );
            
            if ( cmd.size > 0 )
            {
                challenge = function_1201b5da( cmd[ 0 ] );
                
                foreach ( player in getplayers() )
                {
                    player luinotifyevent( #"hash_8d33c3be569f08", 1, challenge.row );
                    stat_name = challenge.params[ 1 ];
                    curr_time = gettime();
                    player zm_stats::function_49469f35( stat_name, curr_time );
                }
                
                setdvar( #"hash_2f6ef50454652bf2", "<dev string:x38>" );
            }
            
            if ( getdvarint( #"hash_145033f5271f2651", 0 ) == 1 )
            {
                zm_trial_util::function_9c1092f6();
                setdvar( #"hash_145033f5271f2651", 0 );
            }
            
            waitframe( 1 );
        }
    }

#/
