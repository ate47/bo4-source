#using scripts\core_common\ai_shared;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\bots\bot_action;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\throttle_shared;
#using scripts\core_common\util_shared;

#namespace bot_position;

// Namespace bot_position/bot_position
// Params 0, eflags: 0x2
// Checksum 0xeac506b6, Offset: 0x138
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"bot_position", &__init__, undefined, undefined );
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x50e74ce4, Offset: 0x180
// Size: 0x31c
function __init__()
{
    callback::on_spawned( &on_player_spawned );
    level.var_a4527012 = [];
    level.var_ce8d80ba = [];
    function_e9e03d6f( #"default", &handle_default );
    function_e9e03d6f( #"in_combat", &function_567289f );
    function_e9e03d6f( #"hash_156be21f04d01350", &function_d2161ccd );
    function_e9e03d6f( #"hash_c0bcf7fa0d58e5", &function_b94f5770 );
    function_e9e03d6f( #"revive_player", &function_8adaa75f );
    function_e9e03d6f( #"gameobject_interact", &function_daab6847 );
    function_e9e03d6f( #"hash_797d652ff338b7d4", &function_90ff35fc );
    function_e9e03d6f( #"visible_enemy", &handle_visible_enemy );
    function_e9e03d6f( #"hash_608fe62234892b49", &function_7ed3ada6 );
    function_aa8c6854( #"goal", &get_goal_center );
    function_aa8c6854( #"gameobject_interact", &function_4fa26afe );
    function_aa8c6854( #"revive_target", &function_f94e1790 );
    function_aa8c6854( #"self", &function_eeca1b53 );
    
    if ( !isdefined( level.var_d1a4558d ) )
    {
        level.var_d1a4558d = new throttle();
        [[ level.var_d1a4558d ]]->initialize( 1, float( function_60d95f53() ) / 1000 );
    }
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x90622ee9, Offset: 0x4a8
// Size: 0x54
function on_player_spawned()
{
    if ( !isbot( self ) )
    {
        return;
    }
    
    self reset();
    self set_position( self.origin );
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x5a6937e6, Offset: 0x508
// Size: 0xb6
function start()
{
    self thread handle_goal();
    self thread handle_goal_changed();
    self thread handle_path_success();
    self thread handle_path_failed();
    self thread function_2bcdf566();
    self thread function_ba7966f8();
    self.bot.var_87f1dd0b = undefined;
    self.bot.var_211ab18e = 1;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0xbd27ffb4, Offset: 0x5c8
// Size: 0x4a
function stop()
{
    self notify( #"hash_6cefc75b9a427c7d" );
    self function_e027100a();
    
    if ( isdefined( self.bot ) )
    {
        self.bot.var_211ab18e = 0;
    }
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x4f6ee663, Offset: 0x620
// Size: 0x2c
function reset()
{
    self.bot.var_18fa994c = 0;
    self function_e027100a();
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0x61336dc, Offset: 0x658
// Size: 0x2c2
function update( tacbundle )
{
    if ( !( isdefined( self.bot.var_211ab18e ) && self.bot.var_211ab18e ) )
    {
        return;
    }
    
    if ( !self.goalforced && self function_2ea7762a( tacbundle ) )
    {
        self.attackeraccuracy = 1;
        self set_position( self.origin );
        self function_e027100a();
        return;
    }
    
    if ( self.bot.var_18fa994c > gettime() )
    {
        return;
    }
    
    /#
        self bot::record_text( "<dev string:x38>", ( 0, 1, 1 ), "<dev string:x4e>" );
    #/
    
    self.attackeraccuracy = 1;
    
    if ( self.goalforced )
    {
        /#
            self bot::record_text( "<dev string:x63>", ( 1, 1, 1 ), "<dev string:x4e>" );
        #/
        
        if ( isdefined( self.node ) )
        {
            offsetposition = self function_f29e63ea( self.node );
            
            if ( isdefined( offsetposition ) )
            {
                /#
                    self bot::record_text( "<dev string:x71>", ( 0, 1, 1 ), "<dev string:x4e>" );
                #/
                
                self function_a57c34b7( offsetposition );
            }
        }
        else
        {
            self function_d4c687c9();
        }
        
        self function_e027100a();
    }
    else if ( [[ level.var_d1a4558d ]]->wm_ht_posidlestart( self ) )
    {
        return;
    }
    else
    {
        self function_7beea81f( tacbundle );
    }
    
    if ( isdefined( self.bot.var_2ee077ff ) )
    {
        self.bot.var_18fa994c = self.bot.var_2ee077ff;
        self.bot.var_2ee077ff = undefined;
        return;
    }
    
    self.bot.var_18fa994c = bot::function_7aeb27f1( self.bot.tacbundle.var_1f8a6a2, self.bot.tacbundle.var_2fc77943 );
}

// Namespace bot_position/bot_position
// Params 0, eflags: 0x4
// Checksum 0xda8aaa6e, Offset: 0x928
// Size: 0x2c
function private function_e027100a()
{
    self notify( #"hash_2747b8ce1136a8ae" );
    [[ level.var_d1a4558d ]]->leavequeue( self );
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x843eb9ce, Offset: 0x960
// Size: 0x96
function handle_goal()
{
    self endon( #"death", #"hash_6cefc75b9a427c7d" );
    level endon( #"game_ended" );
    
    while ( isdefined( self.bot ) )
    {
        self waittill( #"goal" );
        
        /#
            self bot::record_text( "<dev string:x81>", ( 0, 1, 1 ), "<dev string:x4e>" );
        #/
        
        waitframe( 1 );
    }
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x101378f6, Offset: 0xa00
// Size: 0x10e
function handle_goal_changed()
{
    self endon( #"death", #"hash_6cefc75b9a427c7d" );
    level endon( #"game_ended" );
    
    while ( isdefined( self.bot ) )
    {
        self waittill( #"goal_changed" );
        goalinfo = self function_4794d6a3();
        
        if ( self.goalforced )
        {
            self usecovernode( goalinfo.node );
        }
        else if ( !goalinfo.isatgoal )
        {
            self usecovernode( undefined );
        }
        
        if ( !self isingoal( self.origin ) )
        {
            self reset();
        }
        
        waitframe( 1 );
    }
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x11df3b24, Offset: 0xb18
// Size: 0x8e
function handle_path_success()
{
    self endon( #"death", #"hash_6cefc75b9a427c7d" );
    level endon( #"game_ended" );
    
    while ( isdefined( self.bot ) )
    {
        params = self waittill( #"bot_path_success" );
        self bot_action::reset();
        waitframe( 1 );
    }
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x6d703a77, Offset: 0xbb0
// Size: 0x14c
function handle_path_failed()
{
    self endon( #"death", #"hash_6cefc75b9a427c7d" );
    level endon( #"game_ended" );
    
    while ( isdefined( self.bot ) )
    {
        params = self waittill( #"bot_path_failed" );
        
        switch ( params.reason )
        {
            case 1:
            case 2:
            case 3:
                self function_6ee03a5f( params.count );
                break;
            case 4:
            case 5:
            case 6:
                break;
            case 7:
            case 8:
                break;
            default:
                break;
        }
        
        waitframe( 1 );
    }
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0xa293bc72, Offset: 0xd08
// Size: 0x94
function function_6ee03a5f( failurecount )
{
    startpos = self.origin;
    
    if ( self function_96f55844() )
    {
        /#
            self botprintwarning( "<dev string:x88>" + startpos + "<dev string:xb0>" + self.origin );
        #/
        
        return;
    }
    
    /#
        self botprinterror( "<dev string:xc3>" + startpos );
    #/
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x5f116451, Offset: 0xda8
// Size: 0x74, Type: bool
function function_96f55844()
{
    radius = self getpathfindingradius();
    navmeshpoint = getclosestpointonnavmesh( self.origin, 64, radius );
    
    if ( isdefined( navmeshpoint ) )
    {
        self setorigin( navmeshpoint );
        return true;
    }
    
    return false;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x7f4f6c4b, Offset: 0xe28
// Size: 0x104, Type: bool
function function_e336d9()
{
    results = positionquery_source_navigation( self.origin, 0, 100, 100, 12, self );
    
    if ( isdefined( results ) && results.data.size > 0 )
    {
        pos = results.data[ randomint( results.data.size ) ];
        radius = self getpathfindingradius();
        navmeshpoint = getclosestpointonnavmesh( pos.origin, 64, radius );
        
        if ( isdefined( navmeshpoint ) )
        {
            self setorigin( navmeshpoint );
            return true;
        }
    }
    
    return false;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0xd43414a8, Offset: 0xf38
// Size: 0x1bc
function function_6afa53fe()
{
    players = [];
    
    foreach ( player in getplayers() )
    {
        if ( isbot( player ) )
        {
            continue;
        }
        
        if ( isalive( player ) && !player cansee( self ) && isdefined( player.sessionstate ) && player.sessionstate == "playing" && !player isinvehicle() && self.team == player.team )
        {
            players[ players.size ] = player;
        }
    }
    
    if ( players.size <= 0 )
    {
        return;
    }
    
    player = players[ randomint( players.size ) ];
    var_28054200 = self function_28d02a32( player, 250, 500 );
    
    if ( isdefined( var_28054200 ) )
    {
        self setorigin( var_28054200 );
        return 1;
    }
    
    return 0;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x7cf7ed3, Offset: 0x1100
// Size: 0x122, Type: bool
function can_teleport()
{
    foreach ( player in getplayers() )
    {
        if ( isbot( player ) )
        {
            continue;
        }
        
        fwd = anglestoforward( player.angles );
        
        if ( self.team == player.team && vectordot( fwd, self.origin - player.origin ) > 0 )
        {
            return false;
        }
        
        if ( player cansee( self ) )
        {
            return false;
        }
    }
    
    return true;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x1c4a4f77, Offset: 0x1230
// Size: 0xce
function function_2bcdf566()
{
    self endon( #"death", #"hash_6cefc75b9a427c7d" );
    level endon( #"game_ended" );
    
    while ( isdefined( self.bot ) )
    {
        params = self waittill( #"grenade danger" );
        
        if ( isdefined( params.projectile ) && util::function_fbce7263( params.projectile.team, self.team ) )
        {
            self reset();
        }
        
        waitframe( 1 );
    }
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0xdd13a169, Offset: 0x1308
// Size: 0x170
function function_ba7966f8()
{
    self endon( #"death" );
    level endon( #"game_ended" );
    
    if ( currentsessionmode() != 0 )
    {
        return;
    }
    
    while ( isdefined( self.bot ) )
    {
        currentweapon = self getcurrentweapon();
        
        if ( isdefined( currentweapon ) && currentweapon.name != "none" )
        {
            var_4cdb8c05 = currentweapon;
            ammo = self getammocount( currentweapon );
            
            if ( ammo <= 0 )
            {
                wait randomintrange( 4, 5 );
                currentweapon = self getcurrentweapon();
                
                if ( currentweapon == var_4cdb8c05 )
                {
                    ammo = self getammocount( currentweapon );
                    
                    if ( ammo <= 0 )
                    {
                        self givemaxammo( currentweapon );
                    }
                }
            }
        }
        
        wait randomintrange( 2, 4 );
    }
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0xb3c72c19, Offset: 0x1480
// Size: 0x2a
function function_e9e03d6f( name, func )
{
    level.var_a4527012[ name ] = func;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x69b2704d, Offset: 0x14b8
// Size: 0x2a
function function_aa8c6854( name, func )
{
    level.var_ce8d80ba[ name ] = func;
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0x9966e0a1, Offset: 0x14f0
// Size: 0x152
function function_7beea81f( tacbundle )
{
    self endoncallback( &function_7f65a721, #"death", #"hash_2747b8ce1136a8ae" );
    
    if ( !isdefined( tacbundle.positionhandlerlist ) )
    {
        /#
            self bot::record_text( "<dev string:xfb>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return;
    }
    
    handled = 0;
    
    foreach ( params in tacbundle.positionhandlerlist )
    {
        if ( isdefined( self function_22d4d2d( params, tacbundle ) ) && self function_22d4d2d( params, tacbundle ) )
        {
            self.bot.var_87f1dd0b = params.name;
            handled = 1;
            break;
        }
    }
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x1406216f, Offset: 0x1650
// Size: 0xd6
function function_22d4d2d( params, tacbundle )
{
    if ( !isdefined( params ) )
    {
        return 0;
    }
    
    func = level.var_a4527012[ params.name ];
    
    if ( !isdefined( func ) )
    {
        /#
            self botprinterror( "<dev string:x114>" + params.name );
        #/
        
        return 0;
    }
    
    /#
        self bot::record_text( function_9e72a96( params.name ), ( 1, 1, 1 ), "<dev string:x4e>" );
    #/
    
    handled = self [[ func ]]( params, tacbundle );
    return handled;
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0x1ac4835b, Offset: 0x1730
// Size: 0x74
function function_795a469( name )
{
    func = level.var_ce8d80ba[ name ];
    
    if ( !isdefined( func ) )
    {
        /#
            self botprinterror( "<dev string:x138>" + function_9e72a96( name ) );
        #/
        
        return undefined;
    }
    
    return self [[ func ]]();
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0x3665eb0f, Offset: 0x17b0
// Size: 0x24
function function_7f65a721( notifyhash )
{
    [[ level.var_d1a4558d ]]->leavequeue( self );
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0xaa6e2a9e, Offset: 0x17e0
// Size: 0x2b0
function handle_default( params, tacbundle )
{
    center = self function_795a469( params.center );
    
    if ( !isdefined( center ) )
    {
        /#
            self bot::record_text( "<dev string:x15b>" + function_9e72a96( params.center ), ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return 0;
    }
    
    if ( isint( center ) )
    {
        /#
            self bot::record_text( "<dev string:x170>" + center, ( 0, 1, 1 ), "<dev string:x4e>" );
        #/
        
        if ( self function_ad687b7f( center ) )
        {
            return 1;
        }
        
        return function_d0cf287b( params, tacbundle );
    }
    
    if ( isentity( center ) && center getentitytype() == 20 )
    {
        return function_356f5b61( center );
    }
    
    query = positionquery_source_navigation( center.origin, 0, center.radius, center.halfheight, 12, self );
    position = undefined;
    
    if ( query.data.size <= 0 )
    {
        if ( query.centeronnav )
        {
            position = center.origin;
        }
        else
        {
            /#
                self bot::record_text( "<dev string:x17b>" + function_9e72a96( params.center ), ( 1, 0, 0 ), "<dev string:x4e>" );
                self botprinterror( function_9e72a96( params.name ) + "<dev string:x195>" + params.center );
            #/
            
            return 0;
        }
    }
    else
    {
        position = query.data[ 0 ].origin;
    }
    
    self set_position( position );
    return 1;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x95d04e56, Offset: 0x1a98
// Size: 0x1b2
function function_8adaa75f( params, tacbundle )
{
    if ( !self ai::get_behavior_attribute( "revive" ) )
    {
        /#
            self bot::record_text( "<dev string:x1af>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return 0;
    }
    
    revivetarget = self bot::get_revive_target();
    
    if ( !isdefined( revivetarget ) )
    {
        return 0;
    }
    
    if ( !isdefined( revivetarget.revivetrigger ) )
    {
        self bot::clear_revive_target();
        return 0;
    }
    
    handled = 1;
    minradius = 30;
    
    if ( distance2dsquared( self.origin, revivetarget.revivetrigger.origin ) > minradius * minradius && self istouching( revivetarget.revivetrigger ) )
    {
        self set_position( self.origin );
        handled = 1;
    }
    else if ( self function_b2dbe6b0( revivetarget.revivetrigger, minradius ) )
    {
        handled = 1;
    }
    
    if ( handled )
    {
        self.attackeraccuracy = 0.01;
    }
    
    return handled;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x991e248c, Offset: 0x1c58
// Size: 0x10a
function function_90ff35fc( params, tacbundle )
{
    if ( !self bot::function_dd750ead() )
    {
        return 0;
    }
    
    gameobject = self bot::get_interact();
    vehicle = gameobject.e_object;
    
    if ( !isdefined( vehicle ) || !isvehicle( vehicle ) )
    {
        return 0;
    }
    
    trigger = gameobject.trigger;
    
    if ( !isdefined( trigger ) )
    {
        return 0;
    }
    
    if ( self istouching( trigger ) )
    {
        self set_position( self.origin );
        return 1;
    }
    
    return self function_b2dbe6b0( trigger );
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x2ba71007, Offset: 0x1d70
// Size: 0x4a
function handle_visible_enemy( params, tacbundle )
{
    if ( !self bot::has_visible_enemy() )
    {
        return 0;
    }
    
    return function_d0cf287b( params, tacbundle );
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0xdb4a2431, Offset: 0x1dc8
// Size: 0x4a
function function_567289f( params, tacbundle )
{
    if ( !self bot::in_combat() )
    {
        return 0;
    }
    
    return function_d0cf287b( params, tacbundle );
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x20f9c55, Offset: 0x1e20
// Size: 0xaa
function function_d2161ccd( params, tacbundle )
{
    goalinfo = self function_4794d6a3();
    
    if ( !isplayer( goalinfo.goalentity ) )
    {
        return 0;
    }
    
    if ( distancesquared( self.origin, goalinfo.goalentity.origin ) < 2048 * 2048 )
    {
        return 0;
    }
    
    return function_d0cf287b( params, tacbundle );
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x9f87e5, Offset: 0x1ed8
// Size: 0x4a
function function_b94f5770( params, tacbundle )
{
    if ( self bot::in_combat() )
    {
        return 0;
    }
    
    return function_d0cf287b( params, tacbundle );
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x3167ee8c, Offset: 0x1f30
// Size: 0x1b8, Type: bool
function function_7ed3ada6( params, tacbundle )
{
    facingpos = isdefined( self.enemy ) ? self.enemy.origin : self.likelyenemyposition;
    nodes = findbestcovernodesatlocation( self.goalpos, self.goalradius, self.goalheight, self.team, facingpos );
    
    /#
        if ( self bot::should_record( "<dev string:x4e>" ) )
        {
            recordsphere( facingpos, 8, ( 0, 1, 1 ), "<dev string:x1cf>", self );
            
            foreach ( node in nodes )
            {
                recordbox( node.origin, ( -16, -16, 0 ), ( 16, 16, 16 ), node.angles[ 0 ], ( 0, 1, 1 ), "<dev string:x1cf>", self );
            }
        }
    #/
    
    if ( nodes.size <= 0 )
    {
        return false;
    }
    
    self function_a57c34b7( nodes[ 0 ] );
    return true;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0xdf137d4f, Offset: 0x20f0
// Size: 0xca
function function_daab6847( params, tacbundle )
{
    if ( !self bot::function_dd750ead() )
    {
        return 0;
    }
    
    gameobject = self bot::get_interact();
    trigger = gameobject.trigger;
    
    if ( !isdefined( trigger ) )
    {
        return 0;
    }
    
    if ( self istouching( trigger ) )
    {
        self set_position( self.origin );
        return 1;
    }
    
    return self function_b2dbe6b0( trigger );
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0x80733ca9, Offset: 0x21c8
// Size: 0x460
function function_356f5b61( trigger )
{
    if ( !isdefined( trigger ) )
    {
        return 0;
    }
    
    if ( !isdefined( trigger.tacpoints ) )
    {
        trigger.tacpoints = tacticalquery( "stratcom_tacquery_trigger_all", trigger );
        closesttacpoint = getclosesttacpoint( trigger.origin );
        
        if ( isdefined( closesttacpoint ) )
        {
            var_3ffc9821 = array( closesttacpoint );
            neighbors = function_9086d9a4( closesttacpoint );
            
            foreach ( point in neighbors )
            {
                if ( !isdefined( var_3ffc9821 ) )
                {
                    var_3ffc9821 = [];
                }
                else if ( !isarray( var_3ffc9821 ) )
                {
                    var_3ffc9821 = array( var_3ffc9821 );
                }
                
                var_3ffc9821[ var_3ffc9821.size ] = point;
            }
            
            var_55704eac = [];
            
            foreach ( point in var_3ffc9821 )
            {
                if ( !array::contains( trigger.tacpoints, point ) )
                {
                    if ( !isdefined( var_55704eac ) )
                    {
                        var_55704eac = [];
                    }
                    else if ( !isarray( var_55704eac ) )
                    {
                        var_55704eac = array( var_55704eac );
                    }
                    
                    var_55704eac[ var_55704eac.size ] = point;
                }
            }
            
            foreach ( point in var_55704eac )
            {
                if ( trigger istouching( point.origin + ( 0, 0, 50 ) ) )
                {
                    if ( !isdefined( trigger.tacpoints ) )
                    {
                        trigger.tacpoints = [];
                    }
                    else if ( !isarray( trigger.tacpoints ) )
                    {
                        trigger.tacpoints = array( trigger.tacpoints );
                    }
                    
                    trigger.tacpoints[ trigger.tacpoints.size ] = point;
                }
            }
        }
    }
    
    if ( !isdefined( trigger.tacpoints ) || trigger.tacpoints.size == 0 )
    {
        return self function_b2dbe6b0( trigger );
    }
    
    var_f34dd95d = !isdefined( self.var_7aaea35d ) || gettime() - self.var_7aaea35d > 3000;
    
    if ( !self istouching( trigger ) )
    {
        var_f34dd95d = 1;
    }
    
    if ( var_f34dd95d )
    {
        self.var_7aaea35d = gettime();
        
        if ( isdefined( trigger.tacpoints ) && trigger.tacpoints.size > 0 )
        {
            var_bd62801f = array::random( trigger.tacpoints );
            self set_position( var_bd62801f.origin );
        }
    }
    
    return 1;
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0xd912cdc9, Offset: 0x2630
// Size: 0x118, Type: bool
function function_ad687b7f( region )
{
    if ( !isdefined( region ) )
    {
        return false;
    }
    
    regioninfo = function_b507a336( region );
    
    if ( !isdefined( regioninfo ) )
    {
        return false;
    }
    
    tacpoints = tacticalquery( "stratcom_tacquery_region", region );
    
    if ( !isdefined( tacpoints ) || tacpoints.size == 0 )
    {
        return false;
    }
    
    var_f34dd95d = !isdefined( self.var_d494450c ) || gettime() - self.var_d494450c > 3000;
    
    if ( var_f34dd95d )
    {
        self.var_d494450c = gettime();
        
        if ( isdefined( tacpoints ) && tacpoints.size > 0 )
        {
            var_bd62801f = array::random( tacpoints );
            self set_position( var_bd62801f.origin );
        }
    }
    
    return true;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x5860d6dc, Offset: 0x2750
// Size: 0x92
function get_goal_center()
{
    info = self function_4794d6a3();
    
    if ( isdefined( info.goalvolume ) )
    {
        return info.goalvolume;
    }
    
    if ( isdefined( info.regionid ) )
    {
        return info.regionid;
    }
    
    return ai::t_cylinder( info.goalpos, info.goalradius, info.goalheight );
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x13be47e5, Offset: 0x27f0
// Size: 0x3a
function function_4fa26afe()
{
    if ( !self bot::function_dd750ead() )
    {
        return undefined;
    }
    
    return bot::get_interact().trigger;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0xb062dc9d, Offset: 0x2838
// Size: 0x52
function function_f94e1790()
{
    revivetarget = self bot::get_revive_target();
    
    if ( !isdefined( revivetarget ) || !isdefined( revivetarget.revivetrigger ) )
    {
        return undefined;
    }
    
    return revivetarget.revivetrigger;
}

// Namespace bot_position/bot_position
// Params 0
// Checksum 0x3eb6e74f, Offset: 0x2898
// Size: 0x6
function function_eeca1b53()
{
    return self;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x207bfb43, Offset: 0x28a8
// Size: 0x1b4, Type: bool
function function_b2dbe6b0( trigger, minradius = 0 )
{
    triggerradius = min( trigger.maxs[ 0 ], trigger.maxs[ 1 ] );
    results = positionquery_source_navigation( trigger.origin, minradius, triggerradius, trigger.maxs[ 2 ], 12, self );
    
    if ( isdefined( results ) && results.data.size > 0 )
    {
        /#
            if ( self bot::should_record( "<dev string:x4e>" ) )
            {
                foreach ( pos in results.data )
                {
                    recordstar( pos.origin, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                }
            }
        #/
        
        self set_position( results.data[ 0 ].origin );
        return true;
    }
    
    return false;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x96e270c7, Offset: 0x2a68
// Size: 0x260, Type: bool
function function_d0cf287b( params, tacbundle )
{
    center = self function_795a469( params.center );
    
    if ( !isdefined( center ) )
    {
        /#
            self bot::record_text( "<dev string:x15b>" + function_9e72a96( params.center ), ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return false;
    }
    
    if ( isint( center ) )
    {
        /#
            self bot::record_text( "<dev string:x170>" + center, ( 0, 1, 1 ), "<dev string:x4e>" );
        #/
    }
    
    enemy = self.likelyenemyposition;
    
    if ( self bot::in_combat() )
    {
        enemy = self.enemy;
    }
    
    position = function_b33e4e67( center, self.origin, enemy, params.querylist );
    
    if ( !isdefined( position ) )
    {
        /#
            self bot::record_text( "<dev string:x17b>" + function_9e72a96( params.center ), ( 1, 0, 0 ), "<dev string:x4e>" );
            self botprinterror( function_9e72a96( params.name ) + "<dev string:x195>" + params.center );
        #/
        
        return false;
    }
    
    claimnode = undefined;
    
    if ( ispathnode( position ) )
    {
        offsetposition = function_f29e63ea( position );
        
        if ( isdefined( offsetposition ) )
        {
            claimnode = position;
            position = offsetposition;
        }
    }
    
    self set_position( position, claimnode );
    return true;
}

// Namespace bot_position/bot_position
// Params 4
// Checksum 0xf2c0f343, Offset: 0x2cd0
// Size: 0x8f6
function function_b33e4e67( center, fillpos, enemy, querylist )
{
    centerpos = self function_de626503( center );
    var_65c3e15e = undefined;
    
    /#
        if ( self bot::should_record( "<dev string:x4e>" ) )
        {
            if ( isstruct( center ) && isdefined( center.origin ) && isdefined( center.radius ) && isdefined( center.halfheight ) )
            {
                recordcircle( center.origin - ( 0, 0, center.halfheight ), center.radius, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                recordcircle( center.origin + ( 0, 0, center.halfheight ), center.radius, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                recordline( center.origin - ( 0, 0, center.halfheight ), center.origin + ( 0, 0, center.halfheight ), ( 0, 1, 1 ), "<dev string:x1cf>", self );
            }
            else if ( isstruct( center ) && center.type == 2 )
            {
                recordbox( center.center, center.halfsize * -1, center.halfsize, center.angles[ 0 ], ( 0, 1, 1 ), "<dev string:x1cf>", self );
            }
            else if ( isentity( center ) )
            {
                maxs = center getmaxs();
                mins = center getmins();
                
                if ( issubstr( center.classname, "<dev string:x1da>" ) )
                {
                    radius = max( maxs[ 0 ], maxs[ 1 ] );
                    top = center.origin + ( 0, 0, maxs[ 2 ] );
                    bottom = center.origin + ( 0, 0, mins[ 2 ] );
                    recordcircle( bottom, radius, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                    recordcircle( top, radius, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                    recordline( bottom, top, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                }
                else
                {
                    recordbox( center.origin, mins, maxs, center.angles[ 0 ], ( 0, 1, 1 ), "<dev string:x1cf>", self );
                }
            }
            
            if ( isdefined( enemy ) )
            {
                enemypos = isentity( enemy ) ? enemy.origin : enemy;
                recordline( centerpos, enemypos, ( 1, 0, 0 ), "<dev string:x1cf>", self );
                recordstar( enemypos, ( 1, 0, 0 ), "<dev string:x1cf>", self );
            }
        }
    #/
    
    forward = anglestoforward( self.angles );
    forwardpos = self.origin + forward * 100;
    lastenemypos = isentity( enemy ) ? enemy.origin : enemy;
    
    foreach ( query in querylist )
    {
        [[ level.var_d1a4558d ]]->waitinqueue( self );
        
        /#
            self bot::record_text( "<dev string:x1e3>" + function_9e72a96( query.name ), ( 1, 1, 1 ), "<dev string:x4e>" );
        #/
        
        if ( !isdefined( enemy ) || function_3132f113( enemy ) )
        {
            enemy = lastenemypos;
        }
        else if ( isentity( enemy ) )
        {
            lastenemypos = enemy.origin;
        }
        
        pixbeginevent( #"bot_get_tactical_position" );
        aiprofile_beginentry( "bot_get_tactical_position" );
        tacpoints = tacticalquery( query.name, center, fillpos, centerpos, enemy, self, forward, forwardpos );
        pixendevent();
        aiprofile_endentry();
        
        if ( tacpoints.size <= 0 )
        {
            /#
                self bot::record_text( "<dev string:x1e8>", ( 1, 0, 0 ), "<dev string:x4e>" );
            #/
            
            continue;
        }
        
        /#
            self bot::record_text( "<dev string:x1fe>" + tacpoints.size + "<dev string:x205>", ( 0, 1, 1 ), "<dev string:x4e>" );
            
            if ( self bot::should_record( "<dev string:x4e>" ) )
            {
                foreach ( point in tacpoints )
                {
                    recordcircle( point.origin, 15, ( 0, 1, 1 ), "<dev string:x1cf>", self );
                }
            }
        #/
        
        var_65c3e15e = tacpoints[ 0 ];
        break;
    }
    
    if ( !isdefined( var_65c3e15e ) )
    {
        return undefined;
    }
    
    if ( isdefined( var_65c3e15e.node ) )
    {
        distsq = distance2dsquared( var_65c3e15e.origin, var_65c3e15e.node.origin );
        
        if ( distsq > 900 )
        {
            /#
                self botprinterror( "<dev string:x215>" + sqrt( distsq ) + "<dev string:x235>" );
            #/
            
            return var_65c3e15e.origin;
        }
        
        return var_65c3e15e.node;
    }
    
    return var_65c3e15e.origin;
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0xeffbaafd, Offset: 0x35d0
// Size: 0x182
function function_f29e63ea( node )
{
    if ( !isfullcovernode( node ) )
    {
        return undefined;
    }
    
    var_208965cf = node.spawnflags & 262144;
    var_a26a51ba = node.spawnflags & 524288;
    
    if ( !var_208965cf && !var_a26a51ba )
    {
        return undefined;
    }
    
    noderight = anglestoright( node.angles );
    offsetdir = noderight;
    
    if ( var_208965cf && var_a26a51ba )
    {
        if ( isdefined( self.enemylastseenpos ) )
        {
            if ( vectordot( noderight, self.enemylastseenpos - self.origin ) < 0 )
            {
                offsetdir = ( 0, 0, 0 ) - offsetdir;
            }
        }
        else if ( randomint( 2 ) > 0 )
        {
            offsetdir = ( 0, 0, 0 ) - offsetdir;
        }
    }
    else if ( var_208965cf )
    {
        offsetdir = ( 0, 0, 0 ) - offsetdir;
    }
    
    return checknavmeshdirection( node.origin, offsetdir, 18, 0 );
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0x7e429649, Offset: 0x3760
// Size: 0x238, Type: bool
function function_2ea7762a( tacbundle )
{
    /#
        self bot::record_text( "<dev string:x254>", ( 0, 1, 1 ), "<dev string:x4e>" );
    #/
    
    if ( !isdefined( tacbundle.pathenemyfightdist ) || tacbundle.pathenemyfightdist <= 0 )
    {
        /#
            self bot::record_text( "<dev string:x278>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return false;
    }
    
    if ( self ai::get_behavior_attribute( "ignorepathenemyfightdist" ) )
    {
        /#
            self bot::record_text( "<dev string:x299>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return false;
    }
    
    if ( !isdefined( self.enemy ) )
    {
        /#
            self bot::record_text( "<dev string:x2ca>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return false;
    }
    
    if ( !self cansee( self.enemy ) )
    {
        /#
            self bot::record_text( "<dev string:x2d7>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return false;
    }
    
    distsq = tacbundle.pathenemyfightdist * tacbundle.pathenemyfightdist;
    
    if ( distance2dsquared( self.origin, self.enemy.origin ) > distsq )
    {
        /#
            self bot::record_text( "<dev string:x2ed>", ( 1, 0, 0 ), "<dev string:x4e>" );
        #/
        
        return false;
    }
    
    /#
        self bot::record_text( "<dev string:x2ff>", ( 0, 1, 1 ), "<dev string:x4e>" );
    #/
    
    return true;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0xff2775d, Offset: 0x39a0
// Size: 0x13c
function set_position( position, claimnode = undefined )
{
    radius = self getpathfindingradius();
    
    if ( ispathnode( position ) )
    {
        if ( !ispointonnavmesh( position.origin, radius ) )
        {
            position = position.origin;
        }
    }
    
    if ( isvec( position ) )
    {
        self usecovernode( claimnode );
        navmeshpoint = getclosestpointonnavmesh( position, 64, radius );
        
        if ( isdefined( navmeshpoint ) )
        {
            self function_a57c34b7( navmeshpoint );
            return;
        }
        else
        {
            /#
                self botprinterror( "<dev string:x311>" + position );
            #/
        }
    }
    
    self function_a57c34b7( position );
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0xd9676182, Offset: 0x3ae8
// Size: 0xea
function function_de626503( center )
{
    if ( isvec( center ) )
    {
        return center;
    }
    
    if ( isentity( center ) )
    {
        return center.origin;
    }
    
    if ( isstruct( center ) && isdefined( center.origin ) )
    {
        return center.origin;
    }
    
    if ( isstruct( center ) && isdefined( center.center ) )
    {
        return center.center;
    }
    
    if ( isint( center ) )
    {
        return self.goalpos;
    }
    
    return undefined;
}

// Namespace bot_position/bot_position
// Params 2
// Checksum 0x9aa48cc0, Offset: 0x3be0
// Size: 0xe0
function function_52aa1fd5( center, var_f181b86b )
{
    if ( !isdefined( var_f181b86b ) )
    {
        return undefined;
    }
    
    tacpoints = tacticalquery( var_f181b86b, center );
    
    if ( tacpoints.size == 0 )
    {
        return undefined;
    }
    
    seeds = [];
    
    foreach ( tacpoint in tacpoints )
    {
        seeds[ seeds.size ] = tacpoint.origin;
    }
    
    return seeds;
}

// Namespace bot_position/bot_position
// Params 1
// Checksum 0xb8857ea5, Offset: 0x3cc8
// Size: 0x168
function get_pathable_point( points )
{
    if ( !isdefined( points ) || points.size == 0 )
    {
        return undefined;
    }
    
    radius = self getpathfindingradius();
    navmeshpoint = getclosestpointonnavmesh( self.origin, 64, radius );
    
    if ( !isdefined( navmeshpoint ) )
    {
        /#
            self botprinterror( "<dev string:x33f>" + self.origin );
        #/
        
        return undefined;
    }
    
    path = generatenavmeshpath( navmeshpoint, points, self );
    
    if ( !isdefined( path ) || !isdefined( path.pathpoints ) || path.pathpoints.size == 0 )
    {
        return undefined;
    }
    
    origin = path.pathpoints[ path.pathpoints.size - 1 ];
    tacpoint = getclosesttacpoint( origin );
    
    if ( isdefined( tacpoint ) )
    {
        return tacpoint.origin;
    }
    
    return origin;
}

