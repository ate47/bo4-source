#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot_insertion;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\infection;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\math_shared;
#using scripts\core_common\player_insertion;
#using scripts\core_common\system_shared;

#namespace player_reinsertion;

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x2
// Checksum 0xa14848f7, Offset: 0x1d0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"player_reinsertion", &__init__, undefined, undefined );
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x1b328fbd, Offset: 0x218
// Size: 0x3e
function __init__()
{
    callback::on_game_playing( &on_game_playing );
    level.reinsertion = spawnstruct();
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xbf1c3fa7, Offset: 0x260
// Size: 0x34
function on_game_playing()
{
    level thread function_3d39c260();
    
    /#
        level thread function_a6eac3b7();
    #/
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x239fb679, Offset: 0x2a0
// Size: 0x19c
function function_3d39c260()
{
    if ( level.numlives == 1 )
    {
        return;
    }
    
    var_7eb8f61a = isdefined( getgametypesetting( #"wzplayerinsertiontypeindex" ) ) ? getgametypesetting( #"wzplayerinsertiontypeindex" ) : 0;
    
    if ( var_7eb8f61a != 0 )
    {
        return;
    }
    
    if ( infection::function_74650d7() )
    {
        return;
    }
    
    var_f8d960b2 = 0.6;
    height = 30000;
    center = ( 0, 0, height );
    radius = function_cf96c89c() * var_f8d960b2;
    vehicle = function_d5d96302( center, radius );
    
    if ( !isdefined( vehicle ) )
    {
        return;
    }
    
    level.reinsertion.vehicle = vehicle;
    vehicle thread function_14f79b33( center, radius, height, var_f8d960b2 );
    level.reinsertion.cameraent = function_15e6e9ae( vehicle );
    level thread function_eb815c5();
}

// Namespace player_reinsertion/player_reinsertion
// Params 2
// Checksum 0xc1816e70, Offset: 0x448
// Size: 0x76
function function_a20b914d( circle_origin, circle_radius )
{
    angles = ( 0, randomint( 360 ), 0 );
    direction = anglestoforward( angles );
    spawn_origin = circle_origin - direction * circle_radius;
    return spawn_origin;
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xf42bd201, Offset: 0x4c8
// Size: 0xde
function function_cf96c89c()
{
    minimaporigins = getentarray( "map_corner", "targetname" );
    
    if ( minimaporigins.size )
    {
        x = abs( minimaporigins[ 0 ].origin[ 0 ] - minimaporigins[ 1 ].origin[ 0 ] );
        y = abs( minimaporigins[ 0 ].origin[ 1 ] - minimaporigins[ 1 ].origin[ 1 ] );
        return min( x, y );
    }
    
    return 0;
}

// Namespace player_reinsertion/player_reinsertion
// Params 2
// Checksum 0x8aadd829, Offset: 0x5b0
// Size: 0xbe
function function_ab9a60c8( center, radius )
{
    origin = function_a20b914d( center, radius );
    left = vectornormalize( origin - center );
    forward = vectorcross( left, ( 0, 0, 1 ) );
    angles = vectortoangles( forward );
    self.origin = origin;
    self.angles = angles;
}

// Namespace player_reinsertion/player_reinsertion
// Params 2
// Checksum 0x35f9828, Offset: 0x678
// Size: 0x140
function function_d5d96302( center, radius )
{
    spawner = getent( "chinook_spawner", "targetname" );
    
    if ( !isdefined( spawner ) )
    {
        return;
    }
    
    /#
        while ( getplayers().size == 0 )
        {
            wait 0.5;
        }
    #/
    
    vehicle = spawner spawnfromspawner( "insertion_plane", 1, 1 );
    vehicle.takedamage = 0;
    vehicle setneargoalnotifydist( 512 );
    vehicle clientfield::set( "infiltration_landing_gear", 1 );
    vehicle setrotorspeed( 1 );
    vehicle setspeedimmediate( 100 );
    vehicle function_ab9a60c8( center, radius );
    return vehicle;
}

// Namespace player_reinsertion/player_reinsertion
// Params 1
// Checksum 0x49f21b55, Offset: 0x7c0
// Size: 0x80
function function_15e6e9ae( vehicle )
{
    camera = player_insertion::function_57fe9b21( level.insertion, vehicle.origin );
    camera.origin = vehicle.origin;
    camera.angles = vehicle.angles;
    camera linkto( vehicle );
    return camera;
}

// Namespace player_reinsertion/player_reinsertion
// Params 3, eflags: 0x4
// Checksum 0x679ff605, Offset: 0x848
// Size: 0x250
function private function_521bff14( center, goal, var_e294ac7d )
{
    direction = goal - center;
    steps = int( length( direction ) / 5000 );
    direction = vectornormalize( direction );
    var_3d4c4e94 = player_insertion::function_f31cf3bb( center, direction, 5000, 0, steps );
    
    if ( !isdefined( var_3d4c4e94 ) )
    {
        var_3d4c4e94 = center;
    }
    
    if ( distance2dsquared( goal, var_3d4c4e94 ) > 0.01 * 0.01 )
    {
        delta = var_3d4c4e94 - center;
        length = length( delta );
        direction = vectornormalize( delta );
        new_point = center + direction * length * var_e294ac7d;
        
        /#
            var_ced865d2 = center + direction * length;
            thread player_insertion::debug_line( center, new_point, ( 1, 0, 0 ), level.reinsertion.debug_duration );
            thread player_insertion::debug_line( new_point, var_ced865d2, ( 0, 1, 1 ), level.reinsertion.debug_duration );
            thread player_insertion::debug_line( var_ced865d2, goal, ( 1, 0, 1 ), level.reinsertion.debug_duration );
        #/
        
        return new_point;
    }
    
    /#
        thread player_insertion::debug_line( center, goal, ( 1, 0, 0 ), level.reinsertion.debug_duration );
    #/
    
    return goal;
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xd9b829b6, Offset: 0xaa0
// Size: 0x44
function function_8ea9be1c()
{
    if ( !isdefined( level.reinsertion.vehicle ) )
    {
        return;
    }
    
    level.reinsertion.vehicle function_beba57b9( 30000 );
}

// Namespace player_reinsertion/player_reinsertion
// Params 1, eflags: 0x4
// Checksum 0x851e7854, Offset: 0xaf0
// Size: 0xac
function private function_beba57b9( height )
{
    var_e8a39fb = function_cf96c89c();
    goal = rotatepoint( ( 1, 0, 0 ), ( 0, randomint( 360 ), 0 ) ) * var_e8a39fb * 2;
    goal = ( goal[ 0 ], goal[ 1 ], height );
    self function_a57c34b7( goal, 0, 0 );
}

// Namespace player_reinsertion/player_reinsertion
// Params 4, eflags: 0x4
// Checksum 0x9c8d0dc6, Offset: 0xba8
// Size: 0x306
function private function_14f79b33( center, radius, height, var_e294ac7d )
{
    self endon( #"death" );
    var_5d59bc67 = 1760;
    time_step = 5;
    
    while ( true )
    {
        if ( !isdefined( level.deathcircle ) )
        {
            circle_origin = center;
            circle_radius = radius;
        }
        else
        {
            circle_origin = ( level.deathcircle.origin[ 0 ], level.deathcircle.origin[ 1 ], height );
            circle_radius = level.deathcircle.radius * var_e294ac7d;
        }
        
        if ( circle_radius < 0.01 )
        {
            self function_beba57b9( height );
            return;
        }
        
        /#
            level.reinsertion.debug_duration = 1000;
            thread player_insertion::debug_line( circle_origin, level.reinsertion.vehicle.origin, ( 0, 0, 1 ), level.reinsertion.debug_duration );
        #/
        
        var_9c068ab1 = vectornormalize( level.reinsertion.vehicle.origin - circle_origin );
        var_c40f2e06 = vectortoangles( var_9c068ab1 );
        current_yaw = var_c40f2e06[ 1 ];
        var_c5a2c1c9 = var_5d59bc67 / circle_radius * 57.2958;
        new_yaw = current_yaw + time_step * var_c5a2c1c9;
        new_angles = ( 0, new_yaw, 0 );
        goal = circle_origin + anglestoforward( new_angles ) * circle_radius;
        goal = function_521bff14( circle_origin, goal, var_e294ac7d );
        
        /#
            thread player_insertion::debug_line( level.reinsertion.vehicle.origin, goal, ( 0, 1, 0 ), level.reinsertion.debug_duration );
        #/
        
        self function_a57c34b7( goal, 0, 0 );
        self waittill( #"goal", #"near_goal" );
    }
}

// Namespace player_reinsertion/player_reinsertion
// Params 4, eflags: 0x4
// Checksum 0x6e81239a, Offset: 0xeb8
// Size: 0x1aa
function private function_4f356be( start, end, offset, var_3a5f8906 )
{
    self endon( #"death" );
    self function_a57c34b7( end, 0, 0 );
    distance = distance( end, start );
    var_27dfb385 = int( distance / 5000 );
    remainingdist = int( distance ) % 5000;
    
    for ( i = 1; i <= var_27dfb385 ; i++ )
    {
        self pathvariableoffset( ( offset, offset, offset ) * ( var_27dfb385 - i + 1 ), var_3a5f8906 );
        self player_insertion::function_85635daf( start, distance, i * 5000 / distance );
    }
    
    if ( remainingdist > 0 )
    {
        self pathvariableoffset( ( offset, offset, offset ), var_3a5f8906 );
    }
    
    self waittill( #"goal", #"near_goal" );
}

// Namespace player_reinsertion/player_reinsertion
// Params 3
// Checksum 0xa7f0244a, Offset: 0x1070
// Size: 0xf4
function function_b24f3a72( origin, radius, height )
{
    point = self.origin;
    distance = distance2d( point, origin );
    
    if ( distance == 0 )
    {
        return origin;
    }
    
    angle = cos( radius / distance );
    vec = vectornormalize( point - origin );
    goal = rotatepoint( vec, ( 0, angle, 0 ) ) * radius;
    return ( goal[ 0 ], goal[ 1 ], height );
}

// Namespace player_reinsertion/player_reinsertion
// Params 2
// Checksum 0xa19d72a0, Offset: 0x1170
// Size: 0xca
function function_8655661f( radius_t, height )
{
    if ( !isdefined( level.deathcircle ) )
    {
        return self function_b24f3a72( ( 0, 0, height ), 50000 * radius_t, height );
    }
    
    origin = ( level.deathcircle.origin[ 0 ], level.deathcircle.origin[ 1 ], height );
    goal = self function_b24f3a72( origin, level.deathcircle.radius * radius_t, height );
    return goal;
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xd9b84e83, Offset: 0x1248
// Size: 0x230
function function_b2df2693()
{
    var_48bc2733 = [];
    
    foreach ( team in level.teams )
    {
        if ( isdefined( level.alivecount ) && isdefined( level.alivecount[ team ] ) && level.alivecount[ team ] > 0 )
        {
            players = getplayers( team );
            player_alive = 0;
            
            foreach ( player in players )
            {
                if ( isalive( player ) && player.sessionstate == "playing" )
                {
                    player_alive = 1;
                    break;
                }
            }
            
            if ( player_alive == 0 )
            {
                continue;
            }
            
            foreach ( player in players )
            {
                if ( !isalive( player ) || player.sessionstate != "playing" )
                {
                    var_48bc2733[ var_48bc2733.size ] = player;
                }
            }
        }
    }
    
    return var_48bc2733;
}

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x4
// Checksum 0x7d7e69ff, Offset: 0x1480
// Size: 0xf4
function private function_c3ab4925()
{
    self.var_97b0977 = 0;
    self setactionslot( 3, "" );
    self setactionslot( 4, "" );
    self setclientuivisibilityflag( "weapon_hud_visible", 0 );
    self flagsys::clear( #"hash_224cb97b8f682317" );
    self flagsys::clear( #"hash_287397edba8966f9" );
    self function_c62b5591();
    
    if ( isbot( self ) )
    {
        self bot_insertion::function_d7ba3d0b();
    }
}

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x4
// Checksum 0x87063971, Offset: 0x1580
// Size: 0xf4
function private function_564e0871()
{
    self.var_97b0977 = 0;
    self setactionslot( 3, "" );
    self setactionslot( 4, "" );
    self setclientuivisibilityflag( "weapon_hud_visible", 0 );
    self flagsys::clear( #"hash_224cb97b8f682317" );
    self flagsys::set( #"hash_287397edba8966f9" );
    self function_c62b5591();
    
    if ( isbot( self ) )
    {
        self bot_insertion::function_d7ba3d0b();
    }
}

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x4
// Checksum 0xab1db769, Offset: 0x1680
// Size: 0xc8
function private function_acdf637e()
{
    if ( ( isdefined( getgametypesetting( #"hash_4149d5d65eb07138" ) ) ? getgametypesetting( #"hash_4149d5d65eb07138" ) : 0 ) || ( isdefined( getgametypesetting( #"wzheavymetalheroes" ) ) ? getgametypesetting( #"wzheavymetalheroes" ) : 0 ) )
    {
        if ( isdefined( level.var_317fb13c ) )
        {
            self thread [[ level.var_317fb13c ]]();
        }
    }
}

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x4
// Checksum 0xe155c26e, Offset: 0x1750
// Size: 0x10c
function private function_c62b5591()
{
    if ( isdefined( level.reinsertion ) && isdefined( level.reinsertion.cameraent ) )
    {
        level.reinsertion.cameraent clientfield::set( "infiltration_plane", player_insertion::function_1e4302d0( 1, level.insertion.index ) );
        level.reinsertion.cameraent clientfield::set( "infiltration_ent", player_insertion::function_1e4302d0( 1, level.insertion.index ) );
        level.reinsertion.cameraent setvisibletoplayer( self );
    }
    
    self player_insertion::show_postfx();
}

// Namespace player_reinsertion/player_reinsertion
// Params 0, eflags: 0x4
// Checksum 0xa2a0c9fc, Offset: 0x1868
// Size: 0x6c
function private function_402101af()
{
    if ( isdefined( level.reinsertion ) && isdefined( level.reinsertion.cameraent ) )
    {
        level.reinsertion.cameraent setinvisibletoplayer( self );
    }
    
    self player_insertion::hide_postfx();
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xcf8b7f0b, Offset: 0x18e0
// Size: 0xac
function function_eb815c5()
{
    if ( isdefined( level.reinsertion ) && isdefined( level.reinsertion.cameraent ) )
    {
        level.reinsertion.cameraent clientfield::set( "infiltration_camera", player_insertion::function_1e4302d0( 2, level.insertion.index ) );
    }
    
    level callback::add_callback( #"hash_74b19f5972b0ee52", &function_6198f712 );
}

// Namespace player_reinsertion/player_reinsertion
// Params 1, eflags: 0x4
// Checksum 0x7e004278, Offset: 0x1998
// Size: 0x34
function private function_6198f712( eventstruct )
{
    if ( isdefined( eventstruct.player ) )
    {
        eventstruct.player function_402101af();
    }
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x6c0d7c89, Offset: 0x19d8
// Size: 0x24
function function_218283c4()
{
    self luinotifyevent( #"hash_175f8739ed7a932", 0 );
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x350fa098, Offset: 0x1a08
// Size: 0xa0
function function_de24c569()
{
    player_insertion::function_a5fd9aa8( level.insertion );
    
    foreach ( player in level.insertion.players )
    {
        player function_218283c4();
    }
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xbf7e9e5f, Offset: 0x1ab0
// Size: 0xca
function function_f9348c1d()
{
    circle_center = ( 0, 0, 0 );
    
    if ( isdefined( level.deathcircle ) )
    {
        circle_center = level.deathcircle.origin;
    }
    
    angles = ( 0, 0, 0 );
    
    if ( isdefined( level.reinsertion ) && isdefined( level.reinsertion.vehicle ) )
    {
        var_9c068ab1 = vectornormalize( circle_center - level.reinsertion.vehicle.origin );
        angles = vectortoangles( var_9c068ab1 );
    }
    
    return angles;
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x1a118c1e, Offset: 0x1b88
// Size: 0xdc
function function_39a51e47()
{
    self endon( #"disconnect" );
    
    if ( !isdefined( level.warp_portal_vehicles ) )
    {
        self thread player_insertion::function_77132caf();
        self function_acdf637e();
        return;
    }
    
    var_8c305d53 = self function_5425f45d();
    
    if ( var_8c305d53 )
    {
        self function_acdf637e();
        self thread player_insertion::function_f2867466();
        return;
    }
    
    self thread player_insertion::function_77132caf();
    self function_acdf637e();
}

// Namespace player_reinsertion/player_reinsertion
// Params 1
// Checksum 0x6cb3857c, Offset: 0x1c70
// Size: 0x25c
function function_3c4884f1( var_819e1b79 )
{
    self endon( #"disconnect" );
    targetorigin = self.lastdeathpos;
    angles = undefined;
    players = [];
    
    foreach ( player in getplayers( self.team ) )
    {
        if ( player != self && isalive( player ) )
        {
            players[ players.size ] = player;
        }
    }
    
    if ( players.size > 0 )
    {
        targetplayer = players[ randomint( players.size ) ];
        targetorigin = player.origin;
        targetangles = player.angles;
    }
    else if ( isdefined( self.lastdeathpos ) )
    {
        targetorigin = self.lastdeathpos;
        
        if ( isdefined( level.deathcircle ) )
        {
            targetangles = vectortoangles( level.deathcircle.origin - targetorigin );
        }
        else
        {
            targetangles = self.angles;
        }
    }
    
    if ( isdefined( targetorigin ) )
    {
        fwd = anglestoforward( targetangles );
        spawnorigin = targetorigin - fwd * 1000 + ( 0, 0, 500 );
        self setorigin( spawnorigin );
        self player_insertion::start_freefall( fwd * 1000, 0 );
    }
    
    self function_acdf637e();
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x2ea005a5, Offset: 0x1ed8
// Size: 0x10c
function function_584c9f1()
{
    self endon( #"disconnect" );
    
    /#
        while ( !isdefined( level.reinsertion.vehicle ) )
        {
            waitframe( 1 );
        }
    #/
    
    if ( !isdefined( level.reinsertion.vehicle ) )
    {
        self thread player_insertion::function_77132caf();
        return;
    }
    
    var_c40f2e06 = function_f9348c1d();
    self function_564e0871();
    self player_insertion::function_f795bf83( level.insertion, level.reinsertion.vehicle, var_c40f2e06[ 1 ] );
    self setplayerangles( var_c40f2e06 );
    self function_acdf637e();
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0x1a05e14f, Offset: 0x1ff0
// Size: 0x64
function function_836fe662()
{
    wait 1;
    
    if ( isdefined( level.deathcircleindex ) )
    {
        level clientfield::set_world_uimodel( "hudItems.warzone.reinsertionIndex", level.deathcircleindex + 1 );
        return;
    }
    
    level clientfield::set_world_uimodel( "hudItems.warzone.reinsertionIndex", 0 );
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xf7ec324e, Offset: 0x2060
// Size: 0x5bc
function function_fec68e5c()
{
    var_7eb8f61a = isdefined( getgametypesetting( #"wzplayerinsertiontypeindex" ) ) ? getgametypesetting( #"wzplayerinsertiontypeindex" ) : 0;
    
    /#
        if ( getdvarint( #"scr_disable_infiltration", 0 ) )
        {
            level.insertion.players = arraycopy( function_b2df2693() );
            
            foreach ( player in level.insertion.players )
            {
                player.var_c5134737 = 1;
                player thread [[ level.spawnclient ]]();
                
                if ( isdefined( player.lastdeathpos ) )
                {
                    player setorigin( player.lastdeathpos );
                }
            }
            
            return;
        }
    #/
    
    if ( !isdefined( level.insertion ) || !( isdefined( level.insertion.allowed ) && level.insertion.allowed ) )
    {
        return;
    }
    
    level thread function_836fe662();
    player_insertion::function_ff107056( level.insertion );
    level.insertion.players = arraycopy( function_b2df2693() );
    level thread function_de24c569();
    wait 0.5 + 0.1;
    player_insertion::function_a5fd9aa8( level.insertion );
    
    foreach ( player in level.insertion.players )
    {
        player.var_c5134737 = 1;
        player thread [[ level.spawnclient ]]();
        player player_insertion::function_b9a53f50();
    }
    
    level.insertion flagsys::set( #"insertion_teleport_completed" );
    level.insertion flagsys::wait_till_timeout( 1 + 2.5 + 0.5, #"insertion_presentation_completed" );
    level.reinsertion.vehicle player_insertion::function_bc16f3b4( level.insertion );
    assert( 10 > 0 );
    wait 10;
    
    foreach ( player in level.insertion.players )
    {
        if ( !isdefined( player ) || isdefined( player.var_97b0977 ) && player.var_97b0977 )
        {
            continue;
        }
        
        player clientfield::set_to_player( "infiltration_final_warning", 1 );
    }
    
    wait 5;
    player_insertion::function_a5fd9aa8( level.insertion );
    
    foreach ( player in level.insertion.players )
    {
        if ( !isdefined( player ) || isdefined( player.var_97b0977 ) && player.var_97b0977 )
        {
            continue;
        }
        
        player flagsys::set( #"hash_224cb97b8f682317" );
        player flagsys::set( #"hash_287397edba8966f9" );
    }
    
    wait 1;
    level.reinsertion.vehicle clientfield::set( "infiltration_transport", 0 );
}

// Namespace player_reinsertion/player_reinsertion
// Params 0
// Checksum 0xb72829f3, Offset: 0x2628
// Size: 0x304
function function_5425f45d()
{
    if ( isdefined( level.deathcircle ) && isdefined( level.deathcircles ) && isdefined( level.deathcircleindex ) )
    {
        var_d89a84b0 = level.deathcircles.size - 1;
        step_height = 20000 / var_d89a84b0;
        height_diff = level.deathcircleindex * step_height;
        center = level.deathcircle.origin;
        radius = level.deathcircle.radius * 0.5;
        angle = 0;
        var_180a7b48 = self player_insertion::function_ec7cfdb();
        portal = level.warp_portal_vehicles[ var_180a7b48 ];
        
        if ( isdefined( portal ) && isdefined( portal.angle_step ) )
        {
            angle = isdefined( portal.angle_step ) ? portal.angle_step : 0;
            x_pos = center[ 0 ] + radius * cos( angle );
            y_pos = center[ 1 ] + radius * sin( angle );
            height = 20000 - height_diff;
            z_pos = math::clamp( height, 12000, 20000 );
            
            if ( level.deathcircleindex == var_d89a84b0 )
            {
                height = 12000;
            }
            
            portal.origin = ( x_pos, y_pos, z_pos );
            nextcircleindex = level.deathcircleindex + 1;
            var_b0221a68 = math::clamp( nextcircleindex, 0, var_d89a84b0 );
            nextcircle = level.deathcircles[ var_b0221a68 ];
            
            if ( isdefined( nextcircle ) )
            {
                target = nextcircle.origin - portal.origin;
                target = vectornormalize( target );
                angles = vectortoangles( target );
                portal.angles = angles;
            }
            
            return 1;
        }
        else
        {
            return 0;
        }
        
        return;
    }
    
    return 0;
}

/#

    // Namespace player_reinsertion/player_reinsertion
    // Params 0, eflags: 0x4
    // Checksum 0x57ad3e39, Offset: 0x2938
    // Size: 0x7e, Type: dev
    function private function_a6eac3b7()
    {
        while ( true )
        {
            if ( getdvar( #"hash_3fb4a63926f3fa15", 0 ) > 0 )
            {
                function_9536aa3d();
                setdvar( #"hash_3fb4a63926f3fa15", "<dev string:x38>" );
            }
            
            waitframe( 1 );
        }
    }

    // Namespace player_reinsertion/player_reinsertion
    // Params 0
    // Checksum 0xa4778dec, Offset: 0x29c0
    // Size: 0x3a8, Type: dev
    function function_9536aa3d()
    {
        var_269add6e = [];
        var_ef4e0b0 = [];
        
        foreach ( team in level.teams )
        {
            var_d3934390 = 0;
            players_on_team = array::randomize( getplayers( team ) );
            
            foreach ( person in players_on_team )
            {
                if ( !isalive( person ) || person laststand::player_is_in_laststand() )
                {
                    continue;
                }
                
                if ( var_d3934390 == 0 )
                {
                    var_d3934390 = 1;
                    var_269add6e[ var_269add6e.size ] = person;
                    continue;
                }
                
                var_ef4e0b0[ var_ef4e0b0.size ] = person;
            }
        }
        
        foreach ( not in var_ef4e0b0 )
        {
            if ( var_269add6e.size )
            {
                killer = var_269add6e[ randomint( var_269add6e.size ) ];
            }
            else
            {
                killer = not;
            }
            
            not thread function_c833e81f( killer );
        }
        
        center = ( 0, 0, 0 );
        radius = 500;
        
        if ( isdefined( level.deathcircle ) )
        {
            center = level.deathcircle.origin;
            radius = level.deathcircle.radius * 0.5;
        }
        
        foreach ( lucky in var_269add6e )
        {
            spawn_point = rotatepoint( ( radius, 0, 0 ), ( 0, randomint( 360 ), 0 ) );
            lucky setorigin( center + spawn_point + ( 0, 0, 20000 ) );
            lucky forcefreefall( 1, ( 0, 0, 0 ), 0 );
        }
    }

    // Namespace player_reinsertion/player_reinsertion
    // Params 1, eflags: 0x4
    // Checksum 0x2ed98599, Offset: 0x2d70
    // Size: 0x84, Type: dev
    function private function_c833e81f( killer )
    {
        self endon( #"disconnect" );
        self dodamage( self.health + 10000, self.origin + ( 0, 0, 1 ), killer );
        wait 1;
        self dodamage( self.health + 10000, self.origin + ( 0, 0, 1 ), killer );
    }

#/
