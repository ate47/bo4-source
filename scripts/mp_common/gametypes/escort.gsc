#using scripts\abilities\gadgets\gadget_concertina_wire;
#using scripts\abilities\gadgets\gadget_smart_cover;
#using scripts\core_common\ai\archetype_damage_utility;
#using scripts\core_common\ai\archetype_robot;
#using scripts\core_common\ai\archetype_utility;
#using scripts\core_common\ai\systems\blackboard;
#using scripts\core_common\ai\systems\gib;
#using scripts\core_common\ai_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\gameobjects_shared;
#using scripts\core_common\hud_util_shared;
#using scripts\core_common\influencers_shared;
#using scripts\core_common\lui_shared;
#using scripts\core_common\player\player_stats;
#using scripts\core_common\popups_shared;
#using scripts\core_common\scoreevents_shared;
#using scripts\core_common\spawning_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\values_shared;
#using scripts\core_common\vehicleriders_shared;
#using scripts\killstreaks\airsupport;
#using scripts\killstreaks\helicopter_shared;
#using scripts\killstreaks\killstreak_bundles;
#using scripts\killstreaks\mp\supplydrop;
#using scripts\mp_common\bb;
#using scripts\mp_common\challenges;
#using scripts\mp_common\gametypes\globallogic;
#using scripts\mp_common\gametypes\globallogic_audio;
#using scripts\mp_common\gametypes\globallogic_score;
#using scripts\mp_common\gametypes\globallogic_spawn;
#using scripts\mp_common\gametypes\globallogic_utils;
#using scripts\mp_common\gametypes\hostmigration;
#using scripts\mp_common\gametypes\hud_message;
#using scripts\mp_common\gametypes\match;
#using scripts\mp_common\gametypes\overtime;
#using scripts\mp_common\gametypes\round;
#using scripts\mp_common\player\player_utils;
#using scripts\mp_common\util;
#using scripts\weapons\heatseekingmissile;
#using scripts\weapons\weaponobjects;

#namespace escort;

// Namespace escort/escort
// Params 0, eflags: 0x2
// Checksum 0x6ff4d6fb, Offset: 0x988
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"escort", &__init__, undefined, undefined );
}

// Namespace escort/escort
// Params 0
// Checksum 0x560f7cfb, Offset: 0x9d0
// Size: 0xb4
function __init__()
{
    clientfield::register( "actor", "escort_robot_burn", 6000, 1, "int" );
    clientfield::register( "worlduimodel", "Escort.robotProgress", 6000, 7, "float" );
    clientfield::register( "worlduimodel", "Escort.robotMoving", 6000, 1, "int" );
    callback::on_spawned( &on_player_spawned );
}

// Namespace escort/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x60aed8f9, Offset: 0xa90
// Size: 0x53c
function event_handler[gametype_init] main( eventstruct )
{
    globallogic::init();
    util::registertimelimit( 0, 1440 );
    util::registerroundscorelimit( 0, 2000 );
    util::registerscorelimit( 0, 5000 );
    util::registerroundlimit( 0, 12 );
    util::registerroundswitch( 0, 9 );
    util::registerroundwinlimit( 0, 10 );
    util::registernumlives( 0, 100 );
    level.boottime = getgametypesetting( #"boottime" );
    level.reboottime = getgametypesetting( #"reboottime" );
    level.rebootplayers = getgametypesetting( #"rebootplayers" );
    level.moveplayers = getgametypesetting( #"moveplayers" );
    level.robotshield = getgametypesetting( #"robotshield" );
    level.robotspeed = "run";
    level.var_cdb8ae2c = &function_a8da260c;
    
    switch ( getgametypesetting( #"shutdowndamage" ) )
    {
        case 1:
            level.escortrobotkillstreakbundle = "escort_robot_low";
            break;
        case 2:
            level.escortrobotkillstreakbundle = "escort_robot";
            break;
        case 3:
            level.escortrobotkillstreakbundle = "escort_robot_high";
        case 0:
        default:
            level.shutdowndamage = 0;
            break;
    }
    
    if ( isdefined( level.escortrobotkillstreakbundle ) )
    {
        killstreak_bundles::register_killstreak_bundle( level.escortrobotkillstreakbundle );
        level.shutdowndamage = killstreak_bundles::get_max_health( level.escortrobotkillstreakbundle );
    }
    
    switch ( isdefined( getgametypesetting( #"robotspeed" ) ) ? getgametypesetting( #"robotspeed" ) : 0 )
    {
        case 1:
        default:
            level.robotspeed = "run";
            break;
        case 2:
            level.robotspeed = "sprint";
            break;
        case 0:
            level.robotspeed = "walk";
            break;
    }
    
    globallogic_audio::set_leader_gametype_dialog( "startSafeguard", "hcStartSafeguard", "sfgStartAttack", "sfgStartDefend", "bbStartSafeguard", "hcbbStartSafeguard" );
    level.overrideteamscore = 1;
    level.scoreroundwinbased = 1;
    level.doubleovertime = 1;
    level.onstartgametype = &onstartgametype;
    level.onspawnplayer = &onspawnplayer;
    player::function_cf3aa03d( &onplayerkilled );
    level.ontimelimit = &ontimelimit;
    level.onendround = &onendround;
    level.shouldplayovertimeround = &shouldplayovertimeround;
    var_31e4b09c = get_robot_path_array();
    level.var_e02589eb = calc_robot_path_length( var_31e4b09c[ 0 ], var_31e4b09c );
    killstreak_bundles::register_killstreak_bundle( "escort_robot" );
    globallogic_spawn::addsupportedspawnpointtype( "escort" );
}

// Namespace escort/escort
// Params 0
// Checksum 0x48a6c94b, Offset: 0xfd8
// Size: 0x114
function function_a8da260c()
{
    spawning::place_spawn_points( "mp_escort_spawn_attacker_start" );
    spawning::place_spawn_points( "mp_escort_spawn_defender_start" );
    spawning::add_start_spawn_points( "attackers", "mp_escort_spawn_attacker_start" );
    spawning::add_start_spawn_points( "defenderss", "mp_escort_spawn_defender_start" );
    spawning::add_spawn_points( "attackers", "mp_escort_spawn_attacker" );
    spawning::add_spawn_points( "defenders", "mp_escort_spawn_defender" );
    spawning::add_fallback_spawnpoints( "attackers", "mp_tdm_spawn" );
    spawning::add_fallback_spawnpoints( "defenders", "mp_tdm_spawn" );
    spawning::updateallspawnpoints();
    spawning::update_fallback_spawnpoints();
}

// Namespace escort/escort
// Params 0
// Checksum 0x79d71681, Offset: 0x10f8
// Size: 0x12c
function onstartgametype()
{
    if ( overtime::is_overtime_round() )
    {
        [[ level._setteamscore ]]( #"allies", 0 );
        [[ level._setteamscore ]]( #"axis", 0 );
        level.ontimelimit = &function_e4457f17;
        
        if ( game.overtime_round == 1 )
        {
            level.onendround = &function_c8a1552d;
        }
        else if ( isdefined( game.var_8e2b660a ) )
        {
            times = float( game.var_8e2b660a ) / 1000;
            timem = int( times ) / 60;
            util::registertimelimit( timem, timem );
        }
    }
    
    level thread drop_robot();
}

// Namespace escort/escort
// Params 1
// Checksum 0x1802d87e, Offset: 0x1230
// Size: 0x24
function onspawnplayer( predictedspawn )
{
    spawning::onspawnplayer( predictedspawn );
}

// Namespace escort/escort
// Params 9
// Checksum 0x11507760, Offset: 0x1260
// Size: 0x282
function onplayerkilled( einflictor, attacker, idamage, smeansofdeath, weapon, vdir, shitloc, psoffsettime, deathanimduration )
{
    if ( !isdefined( attacker ) || attacker == self || !isplayer( attacker ) || attacker.team == self.team )
    {
        return;
    }
    
    if ( self.team == game.defenders && isdefined( attacker.escortingrobot ) && attacker.escortingrobot )
    {
        attacker recordgameevent( "attacking" );
        scoreevents::processscoreevent( #"killed_defender", attacker, self, weapon );
        attacker challenges::function_82bb78f7( weapon );
        [[ level.var_37d62931 ]]( attacker, 1 );
        attacker.pers[ #"objectiveekia" ]++;
        attacker.objectiveekia = attacker.pers[ #"objectiveekia" ];
        return;
    }
    
    if ( self.team == game.attackers && isdefined( self.escortingrobot ) && self.escortingrobot )
    {
        attacker recordgameevent( "defending" );
        scoreevents::processscoreevent( #"killed_attacker", attacker, self, weapon );
        attacker challenges::function_82bb78f7( weapon );
        [[ level.var_37d62931 ]]( attacker, 1 );
        attacker.pers[ #"objectiveekia" ]++;
        attacker.objectiveekia = attacker.pers[ #"objectiveekia" ];
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0x1e555ba9, Offset: 0x14f0
// Size: 0x54
function ontimelimit()
{
    globallogic_score::giveteamscoreforobjective_delaypostprocessing( game.defenders, 1 );
    round::set_winner( game.defenders );
    level thread globallogic::end_round( 2 );
}

// Namespace escort/escort
// Params 0
// Checksum 0xfe16f743, Offset: 0x1550
// Size: 0x34
function function_e4457f17()
{
    round::set_winner( game.defenders );
    level thread globallogic::end_round( 2 );
}

// Namespace escort/escort
// Params 1
// Checksum 0x74940b2, Offset: 0x1590
// Size: 0x94
function onendround( var_c1e98979 )
{
    winningteam = round::get_winning_team();
    
    /#
        if ( isdefined( level.robot.distancetraveled ) )
        {
            iprintln( "<dev string:x38>" + level.robot.distancetraveled );
        }
    #/
    
    if ( isdefined( level.robot ) )
    {
        level.robot thread delete_on_endgame_sequence();
    }
}

// Namespace escort/escort
// Params 1
// Checksum 0x6a499e4, Offset: 0x1630
// Size: 0xfc
function function_c8a1552d( var_c1e98979 )
{
    /#
        if ( isdefined( level.robot.distancetraveled ) )
        {
            iprintln( "<dev string:x38>" + level.robot.distancetraveled );
        }
    #/
    
    switch ( var_c1e98979 )
    {
        case 1:
            game.var_8e2b660a = globallogic_utils::gettimepassed();
            break;
        case 2:
            game.var_69b0dc87 = level.robot.origin;
            break;
        default:
            break;
    }
    
    level.robot thread delete_on_endgame_sequence();
}

// Namespace escort/escort
// Params 0
// Checksum 0x326c9ff0, Offset: 0x1738
// Size: 0xc6, Type: bool
function shouldplayovertimeround()
{
    if ( overtime::is_overtime_round() )
    {
        if ( game.overtime_round == 1 || !level.gameended )
        {
            return true;
        }
        
        return false;
    }
    
    alliesroundswon = util::getroundswon( #"allies" );
    axisroundswon = util::getroundswon( #"axis" );
    
    if ( util::hitroundlimit() && alliesroundswon == axisroundswon )
    {
        return true;
    }
    
    return false;
}

// Namespace escort/escort
// Params 0
// Checksum 0xa29c83f7, Offset: 0x1808
// Size: 0xe
function on_player_spawned()
{
    self.escortingrobot = undefined;
}

// Namespace escort/escort
// Params 0
// Checksum 0x585ba75d, Offset: 0x1820
// Size: 0x8dc
function drop_robot()
{
    level endon( #"game_ended" );
    globallogic::waitforplayers();
    
    if ( overtime::is_overtime_round() )
    {
        globallogic_audio::leader_dialog( "sfgStartOvertime" );
    }
    
    movetrigger = getent( "escort_robot_move_trig", "targetname" );
    patharray = get_robot_path_array();
    startdir = patharray[ 0 ] - movetrigger.origin;
    startangles = vectortoangles( startdir );
    drop_origin = movetrigger.origin;
    drop_height = isdefined( level.escort_drop_height ) ? level.escort_drop_height : supplydrop::getdropheight( drop_origin );
    heli_drop_goal = ( drop_origin[ 0 ], drop_origin[ 1 ], drop_height );
    level.robotstart = drop_origin;
    goalpath = undefined;
    dropoffset = ( 0, -120, 0 );
    goalpath = supplydrop::supplydrophelistartpath_v2_setup( heli_drop_goal, dropoffset );
    supplydrop::supplydrophelistartpath_v2_part2_local( heli_drop_goal, goalpath, dropoffset );
    drop_direction = vectortoangles( ( heli_drop_goal[ 0 ], heli_drop_goal[ 1 ], 0 ) - ( goalpath.start[ 0 ], goalpath.start[ 1 ], 0 ) );
    chopper = spawnvehicle( "vehicle_t8_mil_helicopter_transport_mp_escort", heli_drop_goal, ( 0, 0, 0 ) );
    chopper.maxhealth = 999999;
    chopper.health = 999999;
    chopper setteam( game.attackers );
    chopper.spawntime = gettime();
    supplydropspeed = isdefined( level.escort_drop_speed ) ? level.escort_drop_speed : getdvarint( #"scr_supplydropspeedstarting", 1000 );
    supplydropaccel = isdefined( level.escort_drop_accel ) ? level.escort_drop_accel : getdvarint( #"scr_supplydropaccelstarting", 1000 );
    chopper setspeed( supplydropspeed, supplydropaccel );
    maxpitch = getdvarint( #"scr_supplydropmaxpitch", 25 );
    maxroll = getdvarint( #"scr_supplydropmaxroll", 45 );
    chopper setmaxpitchroll( 0, maxroll );
    chopper setrotorspeed( 1 );
    spawnposition = ( 0, 0, 0 );
    spawnangles = ( 0, 0, 0 );
    level.robot = spawn_robot( spawnposition, spawnangles );
    level.robot.onground = undefined;
    level.robot.team = game.attackers;
    level.robot setforcenocull();
    vehicle::get_in( level.robot, chopper, "driver" );
    level.robot.dropundervehicleoriginoverride = 1;
    level.robot.targetangles = startangles;
    chopper vehicle::unload( "all" );
    level.robot playsound( #"evt_safeguard_robot_land" );
    chopper thread drop_heli_leave();
    
    while ( level.robot flagsys::get( #"in_vehicle" ) )
    {
        wait 1;
    }
    
    level.robot.patharray = patharray;
    level.robot.pathindex = 0;
    level.robot.victimsoundmod = "safeguard_robot";
    level.robot.goaljustblocked = 0;
    level.robot thread update_stop_position();
    level.robot thread watch_robot_damaged();
    level.robot thread function_dd7755c1();
    level.robot thread wait_robot_moving();
    level.robot thread wait_robot_stopped();
    level.robot.spawn_influencer_friendly = level.robot influencers::create_entity_friendly_influencer( "escort_robot_attackers", game.attackers );
    
    /#
        debug_draw_robot_path();
        level thread debug_reset_robot_to_start();
    #/
    
    level.moveobject = setup_move_object( level.robot, "escort_robot_move_trig" );
    level.goalobject = setup_goal_object( level.robot, "escort_robot_goal_trig" );
    setup_reboot_object( level.robot, "escort_robot_reboot_trig" );
    
    if ( level.boottime )
    {
        level.moveobject gameobjects::set_flags( 1 );
        level.robot setblackboardattribute( "_stance", "crouch" );
        level.robot ai::set_behavior_attribute( "rogue_control_speed", level.robotspeed );
        level.robot shutdown_robot();
    }
    else
    {
        objective_setprogress( level.moveobject.objectiveid, 1 );
        level.moveobject gameobjects::allow_use( #"friendly" );
    }
    
    level.robot thread wait_robot_shutdown();
    level.robot thread wait_robot_reboot();
    
    while ( level.inprematchperiod )
    {
        waitframe( 1 );
    }
    
    level.robot.onground = 1;
    level.robot.distancetraveled = 0;
    level.robot thread function_ba95878f();
    
    if ( level.boottime )
    {
        level.robot thread auto_reboot_robot( level.boottime );
        return;
    }
    
    if ( level.moveplayers == 0 )
    {
        level.robot move_robot();
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xc85e2bb0, Offset: 0x2108
// Size: 0x154
function drop_heli_leave()
{
    chopper = self;
    wait 1;
    supplydropspeed = getdvarint( #"scr_supplydropspeedleaving", 250 );
    supplydropaccel = getdvarint( #"scr_supplydropaccelleaving", 60 );
    chopper setspeed( supplydropspeed, supplydropaccel );
    goal = helicopter::getvalidrandomleavenode( chopper.origin, 1 ).origin;
    chopper setgoal( goal );
    chopper setneargoalnotifydist( 400 );
    result = chopper waittill( #"near_goal", #"goal_reached", #"goal" );
    chopper delete();
}

/#

    // Namespace escort/escort
    // Params 0
    // Checksum 0x185f233a, Offset: 0x2268
    // Size: 0x1b8, Type: dev
    function debug_draw_robot_path()
    {
        if ( ( isdefined( getdvarint( #"scr_escort_debug_robot_path", 0 ) ) ? getdvarint( #"scr_escort_debug_robot_path", 0 ) : 0 ) == 0 )
        {
            return;
        }
        
        debug_duration = 999999999;
        pathnodes = level.robot.patharray;
        
        for ( i = 0; i < pathnodes.size - 1 ; i++ )
        {
            currnode = pathnodes[ i ];
            nextnode = pathnodes[ i + 1 ];
            util::debug_line( currnode, nextnode, ( 0, 0.9, 0 ), 0.9, 0, debug_duration );
        }
        
        foreach ( path in pathnodes )
        {
            util::debug_sphere( path, 6, ( 0, 0, 0.9 ), 0.9, debug_duration );
        }
    }

    // Namespace escort/escort
    // Params 1
    // Checksum 0x1c54fb4b, Offset: 0x2428
    // Size: 0x1b0, Type: dev
    function debug_draw_approximate_robot_path_to_goal( &goalpatharray )
    {
        if ( ( isdefined( getdvarint( #"scr_escort_debug_robot_path", 0 ) ) ? getdvarint( #"scr_escort_debug_robot_path", 0 ) : 0 ) == 0 )
        {
            return;
        }
        
        debug_duration = 60;
        pathnodes = goalpatharray;
        
        for ( i = 0; i < pathnodes.size - 1 ; i++ )
        {
            currnode = pathnodes[ i ];
            nextnode = pathnodes[ i + 1 ];
            util::debug_line( currnode, nextnode, ( 0.9, 0.9, 0 ), 0.9, 0, debug_duration );
        }
        
        foreach ( path in pathnodes )
        {
            util::debug_sphere( path, 3, ( 0, 0.5, 0.5 ), 0.9, debug_duration );
        }
    }

    // Namespace escort/escort
    // Params 1
    // Checksum 0x18e28ed7, Offset: 0x25e0
    // Size: 0xb4, Type: dev
    function debug_draw_current_robot_goal( goal )
    {
        if ( ( isdefined( getdvarint( #"scr_escort_debug_robot_path", 0 ) ) ? getdvarint( #"scr_escort_debug_robot_path", 0 ) : 0 ) == 0 )
        {
            return;
        }
        
        if ( isdefined( goal ) )
        {
            debug_duration = 60;
            util::debug_sphere( goal, 8, ( 0, 0.9, 0 ), 0.9, debug_duration );
        }
    }

    // Namespace escort/escort
    // Params 1
    // Checksum 0x5f68f3d, Offset: 0x26a0
    // Size: 0xc4, Type: dev
    function debug_draw_find_immediate_goal( pathgoal )
    {
        if ( ( isdefined( getdvarint( #"scr_escort_debug_robot_path", 0 ) ) ? getdvarint( #"scr_escort_debug_robot_path", 0 ) : 0 ) == 0 )
        {
            return;
        }
        
        if ( isdefined( pathgoal ) )
        {
            debug_duration = 60;
            util::debug_sphere( pathgoal + ( 0, 0, 18 ), 6, ( 0.9, 0, 0 ), 0.9, debug_duration );
        }
    }

    // Namespace escort/escort
    // Params 1
    // Checksum 0xdffad5ff, Offset: 0x2770
    // Size: 0xc4, Type: dev
    function debug_draw_find_immediate_goal_override( immediategoal )
    {
        if ( ( isdefined( getdvarint( #"scr_escort_debug_robot_path", 0 ) ) ? getdvarint( #"scr_escort_debug_robot_path", 0 ) : 0 ) == 0 )
        {
            return;
        }
        
        if ( isdefined( immediategoal ) )
        {
            debug_duration = 60;
            util::debug_sphere( immediategoal + ( 0, 0, 18 ), 6, ( 0.9, 0, 0.9 ), 0.9, debug_duration );
        }
    }

    // Namespace escort/escort
    // Params 2
    // Checksum 0xa7750708, Offset: 0x2840
    // Size: 0x10c, Type: dev
    function debug_draw_blocked_path_kill_radius( center, radius )
    {
        if ( ( isdefined( getdvarint( #"scr_escort_debug_robot_path", 0 ) ) ? getdvarint( #"scr_escort_debug_robot_path", 0 ) : 0 ) == 0 )
        {
            return;
        }
        
        if ( isdefined( center ) )
        {
            debug_duration = 200;
            circle( center + ( 0, 0, 2 ), radius, ( 0.9, 0, 0 ), 1, 1, debug_duration );
            circle( center + ( 0, 0, 4 ), radius, ( 0.9, 0, 0 ), 1, 1, debug_duration );
        }
    }

#/

// Namespace escort/escort
// Params 0
// Checksum 0xe5e8cf1a, Offset: 0x2958
// Size: 0x78
function wait_robot_moving()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"robot_moving" );
        self recordgameeventnonplayer( "robot_start" );
        level clientfield::set_world_uimodel( "Escort.robotMoving", 1 );
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xd70adbed, Offset: 0x29d8
// Size: 0x88
function wait_robot_stopped()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"robot_stopped" );
        
        if ( self.active )
        {
            self recordgameeventnonplayer( "robot_stop" );
            level clientfield::set_world_uimodel( "Escort.robotMoving", 0 );
        }
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xaba03280, Offset: 0x2a68
// Size: 0x178
function wait_robot_shutdown()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"robot_shutdown" );
        level.moveobject gameobjects::allow_use( #"none" );
        objective_setprogress( level.moveobject.objectiveid, -0.05 );
        level.moveobject gameobjects::set_flags( 1 );
        otherteam = util::getotherteam( self.team );
        globallogic_audio::leader_dialog( "sfgRobotDisabledAttacker", self.team, undefined, "robot" );
        globallogic_audio::leader_dialog( "sfgRobotDisabledDefender", otherteam, undefined, "robot" );
        globallogic_audio::play_2d_on_team( "mpl_safeguard_disabled_sting_friend", self.team );
        globallogic_audio::play_2d_on_team( "mpl_safeguard_disabled_sting_enemy", otherteam );
        self thread auto_reboot_robot( level.reboottime );
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xb67a968d, Offset: 0x2be8
// Size: 0x1e8
function wait_robot_reboot()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"robot_reboot" );
        self recordgameeventnonplayer( "robot_repair_complete" );
        level.moveobject gameobjects::allow_use( #"friendly" );
        otherteam = util::getotherteam( self.team );
        globallogic_audio::leader_dialog( "sfgRobotRebootedAttacker", self.team, undefined, "robot" );
        globallogic_audio::leader_dialog( "sfgRobotRebootedDefender", otherteam, undefined, "robot" );
        globallogic_audio::play_2d_on_team( "mpl_safeguard_reboot_sting_friend", self.team );
        globallogic_audio::play_2d_on_team( "mpl_safeguard_reboot_sting_enemy", otherteam );
        objective_setprogress( level.moveobject.objectiveid, 1 );
        
        if ( level.moveplayers == 0 )
        {
            self move_robot();
        }
        else if ( level.moveobject.numtouching[ level.moveobject.ownerteam ] == 0 )
        {
            level clientfield::set_world_uimodel( "Escort.robotMoving", 0 );
        }
        
        level.moveobject gameobjects::set_flags( 0 );
    }
}

// Namespace escort/escort
// Params 1
// Checksum 0x1e958db, Offset: 0x2dd8
// Size: 0x2ac
function auto_reboot_robot( time )
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( #"robot_reboot", #"game_ended" );
    shutdowntime = 0;
    
    while ( shutdowntime < time )
    {
        rate = 0;
        friendlycount = level.moveobject.numtouching[ level.moveobject.ownerteam ];
        
        if ( !level.rebootplayers )
        {
            rate = float( function_60d95f53() ) / 1000;
        }
        else if ( friendlycount > 0 )
        {
            rate = float( function_60d95f53() ) / 1000;
            
            if ( friendlycount > 1 )
            {
                bonusrate = ( friendlycount - 1 ) * float( function_60d95f53() ) / 1000 * 0;
                rate += bonusrate;
            }
        }
        
        if ( rate > 0 )
        {
            shutdowntime += rate;
            percent = min( 1, shutdowntime / time );
            objective_setprogress( level.moveobject.objectiveid, percent );
        }
        
        waitframe( 1 );
    }
    
    if ( level.rebootplayers > 0 )
    {
        foreach ( struct in level.moveobject.touchlist[ game.attackers ] )
        {
            scoreevents::processscoreevent( #"escort_robot_reboot", struct.player, undefined, undefined );
        }
    }
    
    self thread reboot_robot();
}

// Namespace escort/escort
// Params 0
// Checksum 0x8d330d5d, Offset: 0x3090
// Size: 0x162
function watch_robot_damaged()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"robot_damaged" );
        percent = min( 1, self.shutdowndamage / level.shutdowndamage );
        objective_setprogress( level.moveobject.objectiveid, 1 - percent );
        health = level.shutdowndamage - self.shutdowndamage;
        lowhealth = killstreak_bundles::get_low_health( level.escortrobotkillstreakbundle );
        
        if ( !( isdefined( self.playeddamage ) && self.playeddamage ) && health <= lowhealth )
        {
            globallogic_audio::leader_dialog( "sfgRobotUnderFire", self.team, undefined, "robot" );
            self.playeddamage = 1;
            continue;
        }
        
        if ( health > lowhealth )
        {
            self.playeddamage = 0;
        }
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xe6e1d65f, Offset: 0x3200
// Size: 0x1b6
function function_dd7755c1()
{
    self endon( #"death" );
    level endon( #"game_ended" );
    
    while ( true )
    {
        animrate = 1;
        
        if ( isdefined( self.var_85c3882d ) && self.var_85c3882d )
        {
            animrate -= 0.3;
            self.var_85c3882d = 0;
        }
        
        if ( isdefined( self.beingmicrowavedby ) && self.beingmicrowavedby.size > 0 )
        {
            var_628b766f = getarraykeys( self.beingmicrowavedby );
            
            foreach ( var_318fa3a5 in var_628b766f )
            {
                barrierent = getentbynum( var_318fa3a5 );
                
                if ( isdefined( barrierent ) && isdefined( barrierent.weapon ) && barrierent.weapon.name === #"ability_smart_cover" )
                {
                    animrate -= 0.3;
                    break;
                }
            }
        }
        
        self asmsetanimationrate( animrate );
        waitframe( 1 );
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xfe0f4a84, Offset: 0x33c0
// Size: 0x44
function delete_on_endgame_sequence()
{
    self endon( #"death" );
    level waittill( #"endgame_intermission" );
    self delete();
}

// Namespace escort/escort
// Params 0
// Checksum 0x17a5ae88, Offset: 0x3410
// Size: 0x12c
function get_robot_path_array()
{
    if ( isdefined( level.escortrobotpath ) )
    {
        println( "<dev string:x4f>" );
        return level.escortrobotpath;
    }
    
    println( "<dev string:x74>" );
    patharray = [];
    currnode = getnode( "escort_robot_path_start", "targetname" );
    patharray[ patharray.size ] = currnode.origin;
    
    while ( isdefined( currnode.target ) )
    {
        currnode = getnode( currnode.target, "targetname" );
        patharray[ patharray.size ] = currnode.origin;
    }
    
    if ( isdefined( level.update_escort_robot_path ) )
    {
        [[ level.update_escort_robot_path ]]( patharray );
    }
    
    return patharray;
}

// Namespace escort/escort
// Params 2
// Checksum 0x61b22baa, Offset: 0x3548
// Size: 0xb8
function calc_robot_path_length( robotorigin, patharray )
{
    distance = 0;
    lastpoint = robotorigin;
    
    for ( i = 0; i < patharray.size ; i++ )
    {
        distance += distance( lastpoint, patharray[ i ] );
        lastpoint = patharray[ i ];
    }
    
    println( "<dev string:x8a>" + distance );
    return distance;
}

// Namespace escort/escort
// Params 2
// Checksum 0x56703e8c, Offset: 0x3608
// Size: 0x458
function spawn_robot( position, angles )
{
    robot = spawnactor( "spawner_bo3_robot_grunt_assault_mp_escort", position, angles, "", 1 );
    robot.pathablematerial |= 2;
    robot.enableterrainik = 1;
    robot ai::set_behavior_attribute( "rogue_allow_pregib", 0 );
    robot ai::set_behavior_attribute( "rogue_allow_predestruct", 0 );
    robot ai::set_behavior_attribute( "rogue_control", "forced_level_2" );
    robot ai::set_behavior_attribute( "rogue_control_speed", level.robotspeed );
    robot val::set( #"escort_robot", "ignoreall", 1 );
    robot.allowdeath = 0;
    robot ai::set_behavior_attribute( "can_become_crawler", 0 );
    robot ai::set_behavior_attribute( "can_be_meleed", 0 );
    robot ai::set_behavior_attribute( "can_initiateaivsaimelee", 0 );
    robot ai::set_behavior_attribute( "traversals", "procedural" );
    aiutility::clearaioverridedamagecallbacks( robot );
    robot.active = 1;
    robot.canwalk = 1;
    robot.moving = 0;
    robot.shutdowndamage = 0;
    robot.propername = "";
    robot.ignoretriggerdamage = 1;
    robot.allowpain = 0;
    robot clientfield::set( "robot_mind_control", 0 );
    robot ai::set_behavior_attribute( "robot_lights", 3 );
    robot.pushable = 0;
    robot collidewithactors( 1 );
    robot pushplayer( 1 );
    robot setavoidancemask( "avoid none" );
    robot disableaimassist();
    robot setsteeringmode( "slow steering" );
    robot setblackboardattribute( "_robot_locomotion_type", "alt1" );
    
    if ( level.robotshield )
    {
        aiutility::attachriotshield( robot, getweapon( "riotshield" ), "wpn_t7_shield_riot_world_lh", "tag_stowed_back" );
    }
    
    robot asmsetanimationrate( 1.1 );
    
    if ( isdefined( level.shutdowndamage ) && level.shutdowndamage )
    {
        target_set( robot, ( 0, 0, 50 ) );
    }
    
    robot.overrideactordamage = &robot_damage;
    robot thread robot_move_chatter();
    robot.missiletargetmissdistance = 64;
    robot thread heatseekingmissile::missiletarget_proximitydetonateincomingmissile();
    return robot;
}

// Namespace escort/escort
// Params 12
// Checksum 0x6e7da46f, Offset: 0x3a68
// Size: 0x702, Type: bool
function robot_damage( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex )
{
    if ( !( isdefined( self.onground ) && self.onground ) )
    {
        return false;
    }
    
    if ( !isdefined( eattacker ) )
    {
        return false;
    }
    
    if ( level.shutdowndamage <= 0 || !self.active || eattacker.team == game.attackers )
    {
        return false;
    }
    
    level.usestartspawns = 0;
    weapon_damage = killstreak_bundles::get_weapon_damage( level.escortrobotkillstreakbundle, level.shutdowndamage, eattacker, weapon, smeansofdeath, idamage, idflags, undefined );
    
    if ( !isdefined( weapon_damage ) )
    {
        weapon_damage = idamage;
    }
    
    if ( !weapon_damage )
    {
        return false;
    }
    
    self.shutdowndamage += weapon_damage;
    self notify( #"robot_damaged" );
    
    if ( !isdefined( eattacker.damagerobot ) )
    {
        eattacker.damagerobot = 0;
    }
    
    eattacker.damagerobot += weapon_damage;
    
    if ( self.shutdowndamage >= level.shutdowndamage )
    {
        origin = ( 0, 0, 0 );
        
        if ( isplayer( eattacker ) )
        {
            level thread popups::displayteammessagetoall( #"hash_6fd616c1d7988357", eattacker );
            level.robot recordgameeventnonplayer( "robot_disabled" );
            
            if ( distance2dsquared( self.origin, level.goalobject.trigger.origin ) < ( level.goalobject.trigger.radius + 50 ) * ( level.goalobject.trigger.radius + 50 ) )
            {
                scoreevents::processscoreevent( #"escort_robot_disable_near_goal", eattacker, undefined, undefined );
            }
            else
            {
                scoreevents::processscoreevent( #"escort_robot_disable", eattacker, undefined, undefined );
            }
            
            [[ level.var_37d62931 ]]( eattacker, 1 );
            
            if ( isdefined( eattacker.pers[ #"disables" ] ) )
            {
                eattacker.pers[ #"disables" ]++;
                eattacker.disables = eattacker.pers[ #"disables" ];
            }
            
            eattacker stats::function_bb7eedf0( #"disables", 1 );
            eattacker recordgameevent( "return" );
            origin = eattacker.origin;
        }
        
        foreach ( player in level.players )
        {
            if ( player == eattacker || player.team == self.team || !isdefined( player.damagerobot ) )
            {
                continue;
            }
            
            damagepercent = player.damagerobot / level.shutdowndamage;
            
            if ( damagepercent >= 0.5 )
            {
                scoreevents::processscoreevent( #"escort_robot_disable_assist_50", player, undefined, undefined );
            }
            else if ( damagepercent >= 0.25 )
            {
                scoreevents::processscoreevent( #"escort_robot_disable_assist_25", player, undefined, undefined );
            }
            
            player.damagerobot = undefined;
        }
        
        bb::function_95a5b5c2( "escort_shutdown", undefined, game.defenders, origin );
        self shutdown_robot();
        
        if ( isdefined( eattacker ) && eattacker != self && isdefined( weapon ) )
        {
            if ( weapon.statname == #"planemortar" )
            {
                if ( !isdefined( eattacker.planemortarbda ) )
                {
                    eattacker.planemortarbda = 0;
                }
                
                eattacker.planemortarbda++;
            }
            else if ( weapon.statname == #"dart" || weapon.name == #"dart_turret" )
            {
                if ( !isdefined( eattacker.dartbda ) )
                {
                    eattacker.dartbda = 0;
                }
                
                eattacker.dartbda++;
            }
            else if ( weapon.name == #"straferun_rockets" || weapon.name == #"straferun_gun" )
            {
                if ( isdefined( eattacker.straferunbda ) )
                {
                    eattacker.straferunbda++;
                }
            }
            else if ( weapon.statname == #"remote_missile_missile" || weapon.name == #"remote_missile_bomblet" )
            {
                if ( !isdefined( eattacker.remotemissilebda ) )
                {
                    eattacker.remotemissilebda = 0;
                }
                
                eattacker.remotemissilebda++;
            }
        }
    }
    
    self.health += 1;
    return true;
}

// Namespace escort/escort
// Params 12
// Checksum 0x5709520b, Offset: 0x4178
// Size: 0x66, Type: bool
function robot_damage_none( einflictor, eattacker, idamage, idflags, smeansofdeath, weapon, vpoint, vdir, shitloc, psoffsettime, boneindex, modelindex )
{
    return false;
}

// Namespace escort/escort
// Params 0
// Checksum 0xbdff85d8, Offset: 0x41e8
// Size: 0x154
function shutdown_robot()
{
    self.active = 0;
    self val::set( #"hash_3de2bce887b7b68d", "ignoreme", 1 );
    self.canwalk = 0;
    self stop_robot();
    self notify( #"robot_shutdown" );
    
    if ( target_istarget( self ) )
    {
        target_remove( self );
    }
    
    if ( isdefined( self.riotshield ) )
    {
        self asmchangeanimmappingtable( 1 );
        self detach( self.riotshield.model, self.riotshield.tag );
        aiutility::attachriotshield( self, getweapon( "riotshield" ), "wpn_t7_shield_riot_world_lh", "tag_weapon_left" );
    }
    
    self ai::set_behavior_attribute( "shutdown", 1 );
}

// Namespace escort/escort
// Params 0
// Checksum 0x5bfb0414, Offset: 0x4348
// Size: 0x1aa
function reboot_robot()
{
    if ( !isdefined( self ) )
    {
        return;
    }
    
    self endon( #"robot_shutdown" );
    level endon( #"game_ended" );
    self.active = 1;
    self.shutdowndamage = 0;
    self val::reset( #"hash_3de2bce887b7b68d", "ignoreme" );
    self notify( #"robot_reboot" );
    
    if ( isdefined( level.shutdowndamage ) && level.shutdowndamage )
    {
        target_set( self, ( 0, 0, 50 ) );
    }
    
    if ( isdefined( self.riotshield ) )
    {
        self asmchangeanimmappingtable( 0 );
        self detach( self.riotshield.model, self.riotshield.tag );
        aiutility::attachriotshield( self, getweapon( "riotshield" ), "wpn_t7_shield_riot_world_lh", "tag_stowed_back" );
    }
    
    self ai::set_behavior_attribute( "shutdown", 0 );
    wait getanimlength( #"ai_robot_rogue_ctrl_crc_shutdown_2_alert" );
    
    if ( isdefined( self ) )
    {
        self.canwalk = 1;
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xa5f43fe3, Offset: 0x4500
// Size: 0xb4
function move_robot()
{
    if ( self.active == 0 || self.moving || !isdefined( self.pathindex ) )
    {
        return;
    }
    
    if ( self check_blocked_goal_and_kill() )
    {
        return;
    }
    
    if ( gettime() < ( isdefined( self.blocked_wait_end_time ) ? self.blocked_wait_end_time : 0 ) )
    {
        return;
    }
    
    self notify( #"robot_moving" );
    self.moving = 1;
    self set_goal_to_point_on_path();
    self thread robot_wait_next_point();
}

// Namespace escort/escort
// Params 0
// Checksum 0xb87cc974, Offset: 0x45c0
// Size: 0x1ce
function function_ba95878f()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        if ( self.moving )
        {
            distance = 0;
            
            if ( self.pathindex > 0 )
            {
                distance += distance( level.robotstart, self.patharray[ 0 ] );
                
                for ( i = 1; i < self.pathindex ; i++ )
                {
                    distance += distance( self.patharray[ i - 1 ], self.patharray[ i ] );
                }
                
                distance += distance( self.patharray[ self.pathindex - 1 ], self.origin );
            }
            else
            {
                distance += distance( level.robotstart, self.origin );
            }
            
            if ( distance > self.distancetraveled )
            {
                self.distancetraveled = distance;
                var_14b14914 = distance / level.var_e02589eb;
                
                if ( var_14b14914 < 0 )
                {
                    var_14b14914 = 0;
                }
                else if ( var_14b14914 > 1 )
                {
                    var_14b14914 = 1;
                }
                
                level clientfield::set_world_uimodel( "Escort.robotProgress", var_14b14914 );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xd1ed009c, Offset: 0x4798
// Size: 0x2c
function get_current_goal()
{
    return isdefined( self.immediategoaloverride ) ? self.immediategoaloverride : self.patharray[ self.pathindex ];
}

// Namespace escort/escort
// Params 1
// Checksum 0x144819d5, Offset: 0x47d0
// Size: 0xfe, Type: bool
function reached_closest_nav_mesh_goal_but_still_too_far_and_blocked( goalonnavmesh )
{
    if ( isdefined( self.immediategoaloverride ) )
    {
        return false;
    }
    
    distsqr = distancesquared( goalonnavmesh, self.origin );
    robotreachedclosestgoalonnavmesh = distsqr <= 24 * 24;
    
    if ( robotreachedclosestgoalonnavmesh )
    {
        closestgoalonnavmeshtoofarfrompathgoal = distancesquared( goalonnavmesh, self.patharray[ self.pathindex ] ) > 1 * 1;
        
        if ( closestgoalonnavmeshtoofarfrompathgoal )
        {
            robotisblockedfromgettingtopathgoal = self check_if_goal_is_blocked( self.origin, self.patharray[ self.pathindex ] );
            
            if ( robotisblockedfromgettingtopathgoal )
            {
                return true;
            }
        }
    }
    
    return false;
}

// Namespace escort/escort
// Params 0
// Checksum 0x10be8693, Offset: 0x48d8
// Size: 0x1bc
function check_blocked_goal_and_kill()
{
    if ( !self.canwalk )
    {
        return 0;
    }
    
    if ( gettime() < ( isdefined( self.blocked_wait_end_time ) ? self.blocked_wait_end_time : 0 ) )
    {
        wait float( self.blocked_wait_end_time - gettime() ) / 1000;
    }
    
    goalonnavmesh = self get_closest_point_on_nav_mesh_for_current_goal();
    previousgoal = self.pathindex > 0 && !isdefined( self.immediategoaloverride ) ? self.patharray[ self.pathindex - 1 ] : self.origin;
    
    if ( self.goaljustblocked || self reached_closest_nav_mesh_goal_but_still_too_far_and_blocked( goalonnavmesh ) || self check_if_goal_is_blocked( previousgoal, goalonnavmesh ) )
    {
        self.goaljustblocked = 0;
        stillblocked = 1;
        killedsomething = self kill_anything_blocking_goal( goalonnavmesh );
        
        if ( killedsomething )
        {
            stillblocked = self check_if_goal_is_blocked( previousgoal, goalonnavmesh );
            
            if ( stillblocked )
            {
                self.blocked_wait_end_time = gettime() + 200;
                self stop_robot();
            }
        }
        else
        {
            self find_immediate_goal();
        }
        
        return stillblocked;
    }
    
    return 0;
}

// Namespace escort/escort
// Params 0
// Checksum 0x6c90ac71, Offset: 0x4aa0
// Size: 0x10c
function find_immediate_goal()
{
    pathgoal = self.patharray[ self.pathindex ];
    currpos = self.origin;
    
    /#
        debug_draw_find_immediate_goal( pathgoal );
    #/
    
    for ( immediategoal = get_closest_point_on_nav_mesh( vectorlerp( currpos, pathgoal, 0.5 ) ); self check_if_goal_is_blocked( currpos, immediategoal ) ; immediategoal = get_closest_point_on_nav_mesh( vectorlerp( currpos, immediategoal, 0.5 ) ) )
    {
    }
    
    self.immediategoaloverride = immediategoal;
    
    /#
        debug_draw_find_immediate_goal_override( self.immediategoaloverride );
    #/
}

// Namespace escort/escort
// Params 2
// Checksum 0xcf29374a, Offset: 0x4bb8
// Size: 0xba
function check_if_goal_is_blocked( previousgoal, goal )
{
    approxpatharray = self calcapproximatepathtoposition( goal );
    distancetonextgoal = min( distance( self.origin, goal ), distance( previousgoal, goal ) );
    approxpathtoolong = is_path_distance_to_goal_too_long( approxpatharray, distancetonextgoal * 2.5 );
    return approxpathtoolong;
}

// Namespace escort/escort
// Params 1
// Checksum 0x82b6ef74, Offset: 0x4c80
// Size: 0x13a
function watch_goal_becoming_blocked( goal )
{
    self notify( #"end_watch_goal_becoming_blocked_singleton" );
    self endon( #"end_watch_goal_becoming_blocked_singleton", #"robot_stopped", #"goal" );
    level endon( #"game_ended" );
    disttogoalsqr = 1e+09;
    
    while ( true )
    {
        wait 0.1;
        
        if ( isdefined( self.traversestartnode ) )
        {
            self waittill( #"traverse_end" );
            continue;
        }
        
        if ( self asmistransdecrunning() )
        {
            continue;
        }
        
        if ( !self.canwalk )
        {
            continue;
        }
        
        newdisttogoalsqr = distancesquared( self.origin, goal );
        
        if ( newdisttogoalsqr < disttogoalsqr )
        {
            disttogoalsqr = newdisttogoalsqr;
            continue;
        }
        
        self.goaljustblocked = 1;
        self notify( #"goal_blocked" );
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xe1970396, Offset: 0x4dc8
// Size: 0x13e
function watch_becoming_blocked_at_goal()
{
    self notify( #"end_watch_becoming_blocked_at_goal" );
    self endon( #"end_watch_becoming_blocked_at_goal", #"robot_stop" );
    level endon( #"game_ended" );
    
    while ( isdefined( self.traversestartnode ) )
    {
        self waittill( #"traverse_end" );
    }
    
    self.watch_becoming_blocked_at_goal_established = 1;
    startpos = self.origin;
    atsameposcount = 0;
    iterationcount = 0;
    
    while ( self.moving )
    {
        wait 0.1;
        
        if ( distancesquared( startpos, self.origin ) < 1 )
        {
            atsameposcount++;
        }
        
        if ( atsameposcount >= 2 )
        {
            self.goaljustblocked = 1;
            self notify( #"goal_blocked" );
        }
        
        iterationcount++;
        
        if ( iterationcount >= 3 )
        {
            break;
        }
    }
    
    self.watch_becoming_blocked_at_goal_established = 0;
}

// Namespace escort/escort
// Params 0
// Checksum 0xfd64c9a0, Offset: 0x4f10
// Size: 0x12e
function stop_robot()
{
    if ( !self.moving )
    {
        return;
    }
    
    if ( isdefined( self.traversestartnode ) )
    {
        self thread check_robot_on_travesal_end();
        return;
    }
    
    self.moving = 0;
    self.mostrecentclosestpathpointgoal = undefined;
    self.watch_becoming_blocked_at_goal_established = 0;
    velocity = self getvelocity();
    deltapos = velocity * 0.05;
    stopgoal = isdefined( getclosestpointonnavmesh( self.origin + deltapos, 48, 15 ) ) ? getclosestpointonnavmesh( self.origin + deltapos, 48, 15 ) : self.origin;
    self setgoal( stopgoal, 0 );
    self notify( #"robot_stopped" );
}

// Namespace escort/escort
// Params 0
// Checksum 0x58d53314, Offset: 0x5048
// Size: 0xe4
function check_robot_on_travesal_end()
{
    self notify( #"check_robot_on_travesal_end_singleton" );
    self endon( #"check_robot_on_travesal_end_singleton", #"death" );
    self waittill( #"traverse_end" );
    numowners = isdefined( level.moveobject.numtouching[ level.moveobject.ownerteam ] ) ? level.moveobject.numtouching[ level.moveobject.ownerteam ] : 0;
    
    if ( numowners < level.moveplayers )
    {
        self stop_robot();
        return;
    }
    
    self move_robot();
}

// Namespace escort/escort
// Params 0
// Checksum 0x89683cd0, Offset: 0x5138
// Size: 0x78
function update_stop_position()
{
    self endon( #"death" );
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"traverse_end" );
        
        if ( !self.moving )
        {
            self setgoal( self.origin, 1 );
        }
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0x6370fe55, Offset: 0x51b8
// Size: 0x288
function robot_wait_next_point()
{
    self endon( #"robot_stopped", #"death" );
    level endon( #"game_ended" );
    
    while ( true )
    {
        self waittill( #"goal", #"goal_blocked" );
        
        if ( !isdefined( self.watch_becoming_blocked_at_goal_established ) || self.watch_becoming_blocked_at_goal_established == 0 )
        {
            self thread watch_becoming_blocked_at_goal();
        }
        
        if ( distancesquared( self.origin, get_current_goal() ) < 24 * 24 )
        {
            self.pathindex += isdefined( self.immediategoaloverride ) ? 0 : 1;
            self.immediategoaloverride = undefined;
        }
        
        while ( self.pathindex < self.patharray.size && distancesquared( self.origin, self.patharray[ self.pathindex ] ) < ( 48 + 1 ) * ( 48 + 1 ) )
        {
            self.pathindex++;
        }
        
        if ( self.pathindex >= self.patharray.size )
        {
            self.pathindex = undefined;
            self stop_robot();
            return;
        }
        
        if ( self.pathindex + 1 >= self.patharray.size )
        {
            otherteam = util::getotherteam( self.team );
            globallogic_audio::leader_dialog( "sfgRobotCloseAttacker", self.team, undefined, "robot" );
            globallogic_audio::leader_dialog( "sfgRobotCloseDefender", otherteam, undefined, "robot" );
        }
        
        if ( self check_blocked_goal_and_kill() )
        {
            self stop_robot();
        }
        
        set_goal_to_point_on_path();
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xf492130, Offset: 0x5448
// Size: 0x82
function get_closest_point_on_nav_mesh_for_current_goal()
{
    immediategoal = get_current_goal();
    closestpathpoint = getclosestpointonnavmesh( immediategoal, 48, 15 );
    
    if ( !isdefined( closestpathpoint ) )
    {
        closestpathpoint = getclosestpointonnavmesh( immediategoal, 96, 15 );
    }
    
    return isdefined( closestpathpoint ) ? closestpathpoint : immediategoal;
}

// Namespace escort/escort
// Params 1
// Checksum 0x44882952, Offset: 0x54d8
// Size: 0x104
function get_closest_point_on_nav_mesh( point )
{
    closestpathpoint = getclosestpointonnavmesh( point, 48, 15 );
    
    if ( !isdefined( closestpathpoint ) )
    {
        closestpathpoint = getclosestpointonnavmesh( point, 96, 15 );
    }
    
    if ( !isdefined( closestpathpoint ) )
    {
        itercount = 0;
        lowerpoint = point - ( 0, 0, 36 );
        
        while ( !isdefined( closestpathpoint ) && itercount < 5 )
        {
            closestpathpoint = getclosestpointonnavmesh( lowerpoint, 48, 15 );
            lowerpoint -= ( 0, 0, 36 );
            itercount++;
        }
    }
    
    return isdefined( closestpathpoint ) ? closestpathpoint : point;
}

// Namespace escort/escort
// Params 1
// Checksum 0x3b842550, Offset: 0x55e8
// Size: 0x144
function set_goal_to_point_on_path( recursioncount = 0 )
{
    self.goaljustblocked = 0;
    closestpathpoint = self get_closest_point_on_nav_mesh_for_current_goal();
    
    if ( isdefined( closestpathpoint ) )
    {
        if ( !isdefined( self.mostrecentclosestpathpointgoal ) || distancesquared( closestpathpoint, self.mostrecentclosestpathpointgoal ) > 1 )
        {
            self setgoal( closestpathpoint, 0, 24 );
            self thread watch_goal_becoming_blocked( closestpathpoint );
            self.mostrecentclosestpathpointgoal = closestpathpoint;
        }
    }
    else if ( recursioncount < 3 )
    {
        self find_immediate_goal();
        self set_goal_to_point_on_path( recursioncount + 1 );
    }
    else
    {
        self stop_robot();
    }
    
    /#
        debug_draw_current_robot_goal( closestpathpoint );
    #/
}

// Namespace escort/escort
// Params 2
// Checksum 0xc761eaa3, Offset: 0x5738
// Size: 0xd8, Type: bool
function is_path_distance_to_goal_too_long( &patharray, toolongthreshold )
{
    /#
        debug_draw_approximate_robot_path_to_goal( patharray );
    #/
    
    if ( toolongthreshold < 20 )
    {
        toolongthreshold = 20;
    }
    
    goaldistance = 0;
    lastindextocheck = patharray.size - 1;
    
    for ( i = 0; i < lastindextocheck ; i++ )
    {
        goaldistance += distance( patharray[ i ], patharray[ i + 1 ] );
        
        if ( goaldistance >= toolongthreshold )
        {
            return true;
        }
    }
    
    return false;
}

/#

    // Namespace escort/escort
    // Params 0
    // Checksum 0x8754ea49, Offset: 0x5818
    // Size: 0x250, Type: dev
    function debug_reset_robot_to_start()
    {
        level endon( #"game_ended" );
        
        while ( true )
        {
            if ( ( isdefined( getdvarint( #"scr_escort_robot_reset_path", 0 ) ) ? getdvarint( #"scr_escort_robot_reset_path", 0 ) : 0 ) > 0 )
            {
                if ( isdefined( level.robot ) )
                {
                    pathindex = ( isdefined( getdvarint( #"scr_escort_robot_reset_path", 0 ) ) ? getdvarint( #"scr_escort_robot_reset_path", 0 ) : 0 ) - 1;
                    pathpoint = level.robot.patharray[ pathindex ];
                    robotangles = ( 0, 0, 0 );
                    
                    if ( pathindex < level.robot.patharray.size - 1 )
                    {
                        nextpoint = level.robot.patharray[ pathindex + 1 ];
                        robotangles = vectortoangles( nextpoint - pathpoint );
                    }
                    
                    level.robot forceteleport( pathpoint, robotangles );
                    level.robot.pathindex = pathindex;
                    level.robot.immediategoaloverride = undefined;
                    
                    while ( isdefined( self.traversestartnode ) )
                    {
                        waitframe( 1 );
                    }
                    
                    level.robot stop_robot();
                    level.robot setgoal( level.robot.origin, 0 );
                }
                
                setdvar( #"scr_escort_robot_reset_path", 0 );
            }
            
            wait 0.5;
        }
    }

#/

// Namespace escort/escort
// Params 0
// Checksum 0x61d4c8ff, Offset: 0x5a70
// Size: 0x284
function explode_robot()
{
    self clientfield::set( "escort_robot_burn", 1 );
    clientfield::set( "robot_mind_control_explosion", 1 );
    self thread wait_robot_corpse();
    
    if ( randomint( 100 ) >= 50 )
    {
        gibserverutils::gibleftarm( self );
    }
    else
    {
        gibserverutils::gibrightarm( self );
    }
    
    gibserverutils::giblegs( self );
    gibserverutils::gibhead( self );
    self hide();
    velocity = self getvelocity() * 0.125;
    self startragdoll();
    self launchragdoll( ( velocity[ 0 ] + randomfloatrange( -20, 20 ), velocity[ 1 ] + randomfloatrange( -20, 20 ), randomfloatrange( 60, 80 ) ), "j_mainroot" );
    playfxontag( "destruct/fx8_safeguard_robot_exp", self, "tag_origin" );
    
    if ( target_istarget( self ) )
    {
        target_remove( self );
    }
    
    physicsexplosionsphere( self.origin, 200, 1, 1, 1, 1 );
    radiusdamage( self.origin, 200, 1, 1, undefined, "MOD_EXPLOSIVE" );
    playrumbleonposition( "grenade_rumble", self.origin );
}

// Namespace escort/escort
// Params 0
// Checksum 0x5bc3d52, Offset: 0x5d00
// Size: 0x7c
function wait_robot_corpse()
{
    level endon( #"game_ended" );
    archetype = self.archetype;
    waitresult = self waittill( #"actor_corpse" );
    waitresult.corpse clientfield::set( "escort_robot_burn", 1 );
}

// Namespace escort/escort
// Params 0
// Checksum 0x1958533, Offset: 0x5d88
// Size: 0x78
function robot_move_chatter()
{
    level endon( #"game_ended" );
    
    while ( true )
    {
        if ( self.moving )
        {
            self playsoundontag( "vox_robot_chatter", "J_Head" );
        }
        
        wait randomfloatrange( 1.5, 2.5 );
    }
}

// Namespace escort/escort
// Params 2
// Checksum 0x559dfdb9, Offset: 0x5e08
// Size: 0x1fe
function setup_move_object( robot, triggername )
{
    trigger = getent( triggername, "targetname" );
    useobj = gameobjects::create_use_object( game.attackers, trigger, [], ( 0, 0, 0 ), #"escort_robot" );
    useobj gameobjects::set_objective_entity( robot );
    useobj gameobjects::allow_use( #"none" );
    useobj gameobjects::set_visible_team( #"any" );
    useobj gameobjects::set_use_time( 0 );
    trigger enablelinkto();
    trigger linkto( robot );
    useobj.onuse = &on_use_robot_move;
    useobj.onupdateuserate = &on_update_use_rate_robot_move;
    useobj.robot = robot;
    
    if ( isdefined( level.levelescortdisable ) )
    {
        if ( !isdefined( useobj.exclusions ) )
        {
            useobj.exclusions = [];
        }
        
        foreach ( trigger in level.levelescortdisable )
        {
            useobj.exclusions[ useobj.exclusions.size ] = trigger;
        }
    }
    
    return useobj;
}

// Namespace escort/escort
// Params 1
// Checksum 0x313783f, Offset: 0x6010
// Size: 0x12c
function on_use_robot_move( player )
{
    level.usestartspawns = 0;
    
    if ( self.robot.moving || !self.robot.active || self.numtouching[ self.ownerteam ] < level.moveplayers )
    {
        return;
    }
    
    if ( !isdefined( level.var_113c8efc ) )
    {
        level.var_113c8efc = 0;
    }
    
    if ( gettime() - int( 5 * 1000 ) >= level.var_113c8efc )
    {
        level thread popups::displayteammessagetoteam( #"hash_752379b18bb66bd5", player, player.team, undefined, undefined );
        level.var_113c8efc = gettime();
    }
    
    self thread track_escorting_players();
    self.robot move_robot();
}

// Namespace escort/escort
// Params 3
// Checksum 0x8107abbd, Offset: 0x6148
// Size: 0x64
function on_update_use_rate_robot_move( team, progress, change )
{
    numowners = self.numtouching[ self.ownerteam ];
    
    if ( numowners < level.moveplayers )
    {
        self.robot stop_robot();
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xfbf7cab8, Offset: 0x61b8
// Size: 0x122
function track_escorting_players()
{
    level endon( #"game_ended" );
    self.robot endon( #"robot_stopped" );
    
    while ( true )
    {
        foreach ( touch in self.touchlist[ self.team ] )
        {
            if ( !isdefined( touch ) || !isdefined( touch.player ) )
            {
                continue;
            }
            
            if ( !( isdefined( touch.player.escortingrobot ) && touch.player.escortingrobot ) )
            {
                self thread track_escort_time( touch.player );
            }
        }
        
        waitframe( 1 );
    }
}

// Namespace escort/escort
// Params 1
// Checksum 0x9aa136c3, Offset: 0x62e8
// Size: 0x25c
function track_escort_time( player )
{
    level endon( #"game_ended" );
    player endon( #"death" );
    self.robot endon( #"robot_shutdown" );
    player.escortingrobot = 1;
    player recordgameevent( "player_escort_start" );
    self thread wait_escort_death( player );
    self thread wait_escort_shutdown( player );
    consecutiveescorts = 0;
    
    while ( true )
    {
        wait 1;
        touching = 0;
        
        foreach ( touch in self.touchlist[ self.team ] )
        {
            if ( touch.player == player )
            {
                touching = 1;
                break;
            }
        }
        
        if ( !touching )
        {
            break;
        }
        
        if ( isdefined( player.pers[ #"escorts" ] ) )
        {
            player.pers[ #"escorts" ]++;
            player.escorts = player.pers[ #"escorts" ];
        }
        
        player stats::function_bb7eedf0( #"escorts", 1 );
        consecutiveescorts++;
        
        if ( consecutiveescorts % 3 == 0 )
        {
            scoreevents::processscoreevent( #"escort_robot_escort", player, undefined, undefined );
        }
    }
    
    if ( isdefined( player ) )
    {
        player player_stop_escort();
    }
}

// Namespace escort/escort
// Params 0
// Checksum 0xaad0291c, Offset: 0x6550
// Size: 0x3e
function player_stop_escort()
{
    self.escortingrobot = 0;
    self recordgameevent( "player_escort_stop" );
    self notify( #"escorting_stopped" );
}

// Namespace escort/escort
// Params 1
// Checksum 0x63c81791, Offset: 0x6598
// Size: 0x84
function wait_escort_death( player )
{
    level endon( #"game_ended" );
    player endon( #"escorting_stopped", #"disconnect" );
    player waittill( #"death" );
    
    if ( isdefined( player ) )
    {
        player thread player_stop_escort();
    }
}

// Namespace escort/escort
// Params 1
// Checksum 0x70d5d883, Offset: 0x6628
// Size: 0x74
function wait_escort_shutdown( player )
{
    level endon( #"game_ended" );
    player endon( #"escorting_stopped" );
    self.robot waittill( #"robot_shutdown" );
    
    if ( isdefined( player ) )
    {
        player thread player_stop_escort();
    }
}

// Namespace escort/escort
// Params 2
// Checksum 0xec26e1df, Offset: 0x66a8
// Size: 0x5c
function setup_reboot_object( robot, triggername )
{
    trigger = getent( triggername, "targetname" );
    
    if ( isdefined( trigger ) )
    {
        trigger delete();
    }
}

// Namespace escort/escort
// Params 2
// Checksum 0x31ba0d65, Offset: 0x6710
// Size: 0x1b8
function setup_goal_object( robot, triggername )
{
    trigger = getent( triggername, "targetname" );
    
    if ( isdefined( game.var_69b0dc87 ) )
    {
        trigger = spawn( "trigger_radius_new", game.var_69b0dc87 );
        trigger.radius = 120;
    }
    
    useobj = gameobjects::create_use_object( game.defenders, trigger, [], ( 0, 0, 0 ), #"escort_goal" );
    useobj gameobjects::set_visible_team( #"any" );
    useobj gameobjects::allow_use( #"none" );
    useobj gameobjects::set_use_time( 0 );
    fwd = ( 0, 0, 1 );
    right = ( 0, -1, 0 );
    useobj.fx = spawnfx( "ui/fx_dom_marker_team_r120", trigger.origin, fwd, right );
    useobj.fx.team = game.defenders;
    triggerfx( useobj.fx, 0.001 );
    useobj thread watch_robot_enter( robot );
    return useobj;
}

// Namespace escort/escort
// Params 1
// Checksum 0x28dbd06b, Offset: 0x68d0
// Size: 0x370
function watch_robot_enter( robot )
{
    robot endon( #"death" );
    level endon( #"game_ended" );
    radiussq = self.trigger.radius * self.trigger.radius;
    
    while ( true )
    {
        if ( robot.moving === 1 && distance2dsquared( self.trigger.origin, robot.origin ) < radiussq )
        {
            level.moveplayers = 0;
            robot.overrideactordamage = &robot_damage_none;
            
            if ( target_istarget( self ) )
            {
                target_remove( self );
            }
            
            attackers = game.attackers;
            self.fx.team = attackers;
            
            foreach ( player in level.aliveplayers[ attackers ] )
            {
                if ( isdefined( player.escortingrobot ) && player.escortingrobot )
                {
                    scoreevents::processscoreevent( #"escort_robot_escort_goal", player, undefined, undefined );
                    [[ level.var_37d62931 ]]( player, 1 );
                    var_6913cac0 = player stats::get_stat( #"playerstatslist", #"stats_escort_robot_delivered", #"statvalue" ) + 1;
                    player stats::set_stat( #"playerstatslist", #"stats_escort_robot_delivered", #"statvalue", var_6913cac0 );
                }
            }
            
            level.robot recordgameeventnonplayer( "robot_reached_objective" );
            setgameendtime( 0 );
            robot val::set( #"escort_robot", "ignoreme", 1 );
            robot thread explode_robot_after_wait( 1 );
            globallogic_score::giveteamscoreforobjective( attackers, 1 );
            round::set_winner( attackers );
            level thread globallogic::end_round( 1 );
            return;
        }
        
        waitframe( 1 );
    }
}

// Namespace escort/escort
// Params 1
// Checksum 0xf853065b, Offset: 0x6c48
// Size: 0x3c
function explode_robot_after_wait( wait_time )
{
    robot = self;
    wait wait_time;
    
    if ( isdefined( robot ) )
    {
        robot explode_robot();
    }
}

// Namespace escort/escort
// Params 1
// Checksum 0xb3d38924, Offset: 0x6c90
// Size: 0x4ec
function kill_anything_blocking_goal( goal )
{
    self endon( #"end_kill_anything" );
    self.disablefinalkillcam = 1;
    dirtogoal = vectornormalize( goal - self.origin );
    atleastonedestroyed = 0;
    bestcandidate = undefined;
    bestcandidatedot = -1e+09;
    
    /#
        debug_draw_blocked_path_kill_radius( self.origin, 108 );
    #/
    
    entities = getdamageableentarray( self.origin, 108 );
    
    foreach ( entity in entities )
    {
        if ( isplayer( entity ) )
        {
            continue;
        }
        
        if ( entity == self )
        {
            continue;
        }
        
        if ( entity.classname == "grenade" )
        {
            continue;
        }
        
        if ( !isalive( entity ) )
        {
            continue;
        }
        
        entitydot = vectordot( dirtogoal, entity.origin - self.origin );
        
        if ( entitydot > bestcandidatedot )
        {
            bestcandidate = entity;
            bestcandidatedot = entitydot;
        }
    }
    
    if ( isdefined( bestcandidate ) )
    {
        entity = bestcandidate;
        
        if ( isdefined( entity.targetname ) )
        {
            if ( entity.targetname == "talon" )
            {
                entity notify( #"death" );
                return 1;
            }
        }
        
        if ( isdefined( entity.helitype ) && entity.helitype == "qrdrone" )
        {
            watcher = entity.owner weaponobjects::getweaponobjectwatcher( "qrdrone" );
            watcher thread weaponobjects::waitanddetonate( entity, 0, undefined );
            return 1;
        }
        
        if ( entity.classname == "auto_turret" )
        {
            if ( !isdefined( entity.damagedtodeath ) || !entity.damagedtodeath )
            {
                entity util::domaxdamage( self.origin + ( 0, 0, 1 ), self, self, 0, "MOD_CRUSH" );
            }
            
            return 1;
        }
        
        if ( isvehicle( entity ) && ( !isdefined( entity.team ) || entity.team != #"neutral" ) )
        {
            if ( !( isdefined( entity.magic_bullet_shield ) && entity.magic_bullet_shield ) )
            {
                entity kill();
            }
            
            return 1;
        }
        
        if ( entity.team === self.team && entity.item.name === #"ability_smart_cover" )
        {
            entity smart_cover::function_2a494565( 0 );
            return 1;
        }
        
        if ( entity.team === self.team && entity.item.name === #"eq_concertina_wire" )
        {
            entity concertina_wire::function_4ee7d46a( 0 );
            return 1;
        }
        
        entity dodamage( entity.health * 2, self.origin + ( 0, 0, 1 ), self, self, 0, "MOD_CRUSH" );
        atleastonedestroyed = 1;
    }
    
    atleastonedestroyed = atleastonedestroyed || self destroy_supply_crate_blocking_goal( dirtogoal );
    return atleastonedestroyed;
}

// Namespace escort/escort
// Params 1
// Checksum 0x2529d63b, Offset: 0x7188
// Size: 0x1b4, Type: bool
function destroy_supply_crate_blocking_goal( dirtogoal )
{
    crates = getentarray( "care_package", "script_noteworthy" );
    bestcrate = undefined;
    bestcrateedot = -1e+09;
    
    foreach ( crate in crates )
    {
        if ( distancesquared( crate.origin, self.origin ) > 108 * 108 )
        {
            continue;
        }
        
        cratedot = vectordot( dirtogoal, crate.origin - self.origin );
        
        if ( cratedot > bestcrateedot )
        {
            bestcrate = crate;
            bestcrateedot = cratedot;
        }
    }
    
    if ( isdefined( bestcrate ) )
    {
        playfx( level._supply_drop_explosion_fx, bestcrate.origin );
        playsoundatposition( #"wpn_grenade_explode", bestcrate.origin );
        wait 0.1;
        bestcrate supplydrop::cratedelete();
        return true;
    }
    
    return false;
}

