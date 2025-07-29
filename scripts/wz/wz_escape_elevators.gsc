#using scripts\core_common\callbacks_shared;
#using scripts\core_common\flagsys_shared;
#using scripts\core_common\gestures;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace wz_escape_elevators;

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 0, eflags: 0x2
// Checksum 0x202221e3, Offset: 0x248
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"wz_escape_elevators", &_init_, undefined, undefined );
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 0
// Checksum 0xbf2dc597, Offset: 0x290
// Size: 0x244
function _init_()
{
    callback::on_player_corpse( &function_8cc4432b );
    dynents = getdynentarray( "dynent_garage_button" );
    
    foreach ( dynent in dynents )
    {
        dynent.onuse = &function_51a020;
    }
    
    dynents = getdynentarray( "dynent_door_check_for_vehicles" );
    
    foreach ( dynent in dynents )
    {
        dynent.onuse = &function_d7b6ee00;
    }
    
    gondola_button = getent( "gondola_button", "targetname" );
    gondola = getent( "gondola", "targetname" );
    gondola_button linkto( gondola );
    gondola_kill_trig = getent( "gondola_kill_trig_player", "targetname" );
    gondola_kill_trig enablelinkto();
    gondola_kill_trig linkto( gondola );
    level thread init_elevator( "dynent_gondola_button_top" );
    level thread init_elevator( "dynent_gondola_button_bottom" );
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0x8ce4e3d7, Offset: 0x4e0
// Size: 0x306
function init_elevator( var_fd98a47c )
{
    dynents = getdynentarray( var_fd98a47c );
    
    foreach ( dynent in dynents )
    {
        dynent.onuse = &function_31042f91;
        dynent.buttons = dynents;
        position = struct::get( dynent.target, "targetname" );
        elevator = getent( position.target, "targetname" );
        elevator.buttons = dynents;
        
        if ( position.script_noteworthy === "start" )
        {
            setdynentstate( dynent, 1 );
            
            if ( !isdefined( elevator.target ) )
            {
                continue;
            }
            
            button = getent( elevator.target, "targetname" );
            
            if ( !isdefined( button ) )
            {
                continue;
            }
            
            button triggerignoreteam();
            button setvisibletoall();
            button usetriggerrequirelookat();
            button setteamfortrigger( #"none" );
            button setcursorhint( "HINT_NOICON" );
            button sethintstring( #"hash_29965b65bca9cd7b" );
            button usetriggerignoreuseholdtime();
            button callback::on_trigger( &function_af088c90 );
            button.elevator = elevator;
            elevator.button = button;
            elevator.var_e87f4c9 = button.origin - elevator.origin;
            elevator.var_8273f574 = dynent;
            elevator.currentfloor = dynent;
            continue;
        }
        
        elevator.var_ec68615b = dynent;
        elevator.var_d98394f7 = dynent;
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 0
// Checksum 0xc8a493e1, Offset: 0x7f0
// Size: 0x7c
function function_8cc4432b()
{
    waitframe( 1 );
    
    if ( isdefined( self ) && isdefined( self.player ) && isdefined( self.player.var_1a776c13 ) && self.player.var_1a776c13 )
    {
        self notsolid();
        self ghost();
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 0
// Checksum 0x76acd2d8, Offset: 0x878
// Size: 0x174
function function_ad26976()
{
    self endon( #"movedone" );
    
    while ( true )
    {
        vehicles = getentitiesinradius( self.origin, 1536, 12 );
        vehicle_corpses = getentitiesinradius( self.origin, 1536, 14 );
        
        foreach ( vehicle in vehicles )
        {
            vehicle launchvehicle( ( 0, 0, 0 ), vehicle.origin, 0 );
        }
        
        foreach ( vehicle_corpse in vehicle_corpses )
        {
            vehicle_corpse delete();
        }
        
        wait 0.25;
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 2
// Checksum 0xaf74e8d4, Offset: 0x9f8
// Size: 0x1b4
function function_211e7277( point, var_8bd17d7d )
{
    nearby_players = getplayers( undefined, point.origin, 256 );
    move_pos = point.origin;
    var_93a4284 = 0;
    check_count = 0;
    
    if ( nearby_players.size > 0 )
    {
        var_93a4284 = 1;
    }
    
    while ( var_93a4284 && check_count < 20 )
    {
        foreach ( player in nearby_players )
        {
            if ( distance( player.origin, point.origin ) < 16 && player.sessionstate == "playing" )
            {
                var_93a4284 = 1;
                n_forward = var_8bd17d7d;
                n_forward *= ( 32, 32, 0 );
                move_pos += n_forward;
                break;
            }
            
            var_93a4284 = 0;
        }
        
        check_count++;
    }
    
    self setorigin( move_pos );
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0x197f9776, Offset: 0xbb8
// Size: 0x13a, Type: bool
function is_equipment( entity )
{
    if ( isdefined( entity.weapon ) )
    {
        weapon = entity.weapon;
        
        if ( weapon.name === #"ability_smart_cover" || weapon.name === #"eq_tripwire" || weapon.name === #"trophy_system" || weapon.name === #"eq_concertina_wire" || weapon.name === #"eq_sensor" || weapon.name === #"cymbal_monkey" || weapon.name === #"gadget_supplypod" || weapon.name === #"homunculus" )
        {
            return true;
        }
    }
    
    return false;
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0xc38b7d56, Offset: 0xd00
// Size: 0x24e
function function_777e012d( t_damage )
{
    self endon( #"death" );
    level endon( #"start_warzone" );
    
    if ( !isdefined( t_damage ) )
    {
        return;
    }
    
    equipment = getentitiesinradius( t_damage.origin, 1536 );
    
    foreach ( device in equipment )
    {
        if ( isdefined( device ) && device istouching( t_damage ) )
        {
            if ( is_equipment( device ) )
            {
                switch ( device.weapon.name )
                {
                    case #"eq_tripwire":
                        device [[ level.var_2e06b76a ]]();
                        break;
                    case #"trophy_system":
                        device [[ level.var_4f3822f4 ]]();
                        break;
                    case #"cymbal_monkey":
                        device [[ level.var_7c5c96dc ]]();
                        break;
                    case #"homunculus":
                        device [[ level.var_cc310d06 ]]();
                        break;
                    case #"eq_sensor":
                        device [[ level.var_9911d36f ]]();
                        break;
                    case #"eq_concertina_wire":
                        device [[ level.var_94029383 ]]();
                        break;
                    case #"gadget_supplypod":
                        device notify( #"death" );
                        break;
                    default:
                        break;
                }
            }
        }
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0xb01ed57b, Offset: 0xf58
// Size: 0x1e8
function elevator_kill_player( t_damage )
{
    self endon( #"death" );
    level endon( #"start_warzone" );
    
    if ( !isdefined( t_damage ) )
    {
        return;
    }
    
    foreach ( e_player in getplayers() )
    {
        if ( e_player istouching( t_damage ) && isalive( e_player ) && isdefined( e_player ) )
        {
            if ( level.inprematchperiod )
            {
                point = struct::get( t_damage.target );
                var_8bd17d7d = anglestoforward( point.angles );
                var_8bd17d7d = vectornormalize( var_8bd17d7d );
                
                if ( isdefined( point ) )
                {
                    e_player function_211e7277( point, var_8bd17d7d );
                }
                
                continue;
            }
            
            if ( level flagsys::get( #"insertion_teleport_completed" ) || level.script === "mp_alcatraz" )
            {
                e_player.var_1a776c13 = 1;
                e_player suicide();
            }
        }
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 0
// Checksum 0xdc49a269, Offset: 0x1148
// Size: 0x3c
function function_8e73d913()
{
    util::wait_network_frame( 2 );
    
    if ( isdefined( self ) )
    {
        self delete();
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0x5051e8ad, Offset: 0x1190
// Size: 0x40c
function function_26ab1b5e( t_damage )
{
    self endon( #"death" );
    level endon( #"start_warzone" );
    
    if ( !isdefined( t_damage ) )
    {
        return;
    }
    
    vehicles = getentitiesinradius( t_damage.origin, 1536, 12 );
    
    foreach ( e_vehicle in vehicles )
    {
        if ( e_vehicle istouching( t_damage ) && isalive( e_vehicle ) )
        {
            var_38ae32ff = e_vehicle.origin - t_damage.origin;
            var_8fa58819 = var_38ae32ff[ 2 ];
            var_8fa58819 *= var_8fa58819;
            
            if ( var_8fa58819 < 32 || e_vehicle.scriptvehicletype === #"helicopter_light" )
            {
                a_players = e_vehicle getvehoccupants();
                e_vehicle.takedamage = 1;
                e_vehicle.allowdeath = 1;
                e_vehicle dodamage( e_vehicle.health + 10000, e_vehicle.origin, undefined, undefined, "none", "MOD_EXPLOSIVE", 8192 );
                waitframe( 1 );
                e_vehicle thread function_8e73d913();
                
                foreach ( player in a_players )
                {
                    if ( isalive( player ) && isdefined( player ) && !player isremotecontrolling() )
                    {
                        if ( level.inprematchperiod )
                        {
                            var_96c44bd9 = 1;
                            str_targetname = t_damage.targetname;
                            
                            if ( isstring( str_targetname ) )
                            {
                                var_96c44bd9 = str_targetname[ 8 ];
                            }
                            
                            point = struct::get( "elevator_teleport_" + var_96c44bd9, "targetname" );
                            var_8bd17d7d = anglestoforward( point.angles );
                            var_8bd17d7d = vectornormalize( var_8bd17d7d );
                            
                            if ( isdefined( point ) )
                            {
                                player function_211e7277( point, var_8bd17d7d );
                            }
                            
                            continue;
                        }
                        
                        var_1c8ad6c7 = level flagsys::get( #"insertion_teleport_completed" );
                        
                        if ( var_1c8ad6c7 )
                        {
                            player.var_1a776c13 = 1;
                            player suicide();
                        }
                    }
                }
            }
        }
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 2
// Checksum 0x46076554, Offset: 0x15a8
// Size: 0x256
function function_76ad6828( position, is_end_position = 0 )
{
    self endon( #"death" );
    
    if ( isdefined( self.script_noteworthy ) && isdefined( position ) )
    {
        var_a91da4b7 = self.script_noteworthy + "_player";
        var_bda7a712 = self.script_noteworthy + "_vehicle";
        var_5a7b0b8 = self.script_noteworthy + "_player_top";
        var_68dc3bdf = getent( var_a91da4b7, "targetname" );
        t_damage_vehicle = getent( var_bda7a712, "targetname" );
        var_caa01373 = getent( var_5a7b0b8, "targetname" );
        
        if ( isdefined( var_68dc3bdf ) && isdefined( t_damage_vehicle ) && isdefined( var_caa01373 ) )
        {
            var_d011282b = distancesquared( self.origin, position.origin );
            
            while ( var_d011282b > 16 )
            {
                var_d011282b = distancesquared( self.origin, position.origin );
                
                if ( is_end_position )
                {
                    if ( var_d011282b <= 5000 )
                    {
                        self thread function_777e012d( var_caa01373 );
                        self thread elevator_kill_player( var_caa01373 );
                        self thread function_26ab1b5e( var_caa01373 );
                    }
                }
                else if ( var_d011282b <= 5000 )
                {
                    self thread function_777e012d( var_68dc3bdf );
                    self thread function_26ab1b5e( t_damage_vehicle );
                    self thread elevator_kill_player( var_68dc3bdf );
                }
                
                waitframe( 1 );
            }
        }
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0xfb0cac65, Offset: 0x1808
// Size: 0x374
function elevator_move( elevator )
{
    position = struct::get( elevator.var_d98394f7.target, "targetname" );
    elevator.button triggerenable( 0 );
    
    if ( isdefined( elevator.script_noteworthy ) && position.script_noteworthy === "start" )
    {
        elevator thread function_76ad6828( position );
    }
    
    if ( isdefined( elevator.script_noteworthy ) && position.script_noteworthy === "end" )
    {
        elevator thread function_76ad6828( position, 1 );
    }
    
    elevator.moving = 1;
    elevator.button playsound( "evt_elevator_button_bell" );
    wait 0.5;
    elevator thread function_ad26976();
    elevator playsound( "evt_elevator_start" );
    elevator playloopsound( "evt_elevator_move", 0 );
    elevator moveto( position.origin, 10, 0.5, 0.5 );
    setdynentstate( elevator.var_d98394f7, 1 );
    setdynentstate( elevator.currentfloor, 1 );
    var_d98394f7 = elevator.currentfloor;
    elevator.currentfloor = elevator.var_d98394f7;
    elevator.var_d98394f7 = var_d98394f7;
    elevator waittill( #"movedone" );
    elevator playsound( "evt_elevator_stop" );
    elevator stoploopsound( 1 );
    elevator.moving = 0;
    elevator.button.origin = elevator.origin + elevator.var_e87f4c9;
    
    if ( elevator.var_d98394f7 == elevator.var_8273f574 )
    {
        elevator.button sethintstring( #"hash_310ad55f171e194e" );
    }
    else
    {
        elevator.button sethintstring( #"hash_29965b65bca9cd7b" );
    }
    
    setdynentstate( elevator.var_d98394f7, 0 );
    elevator.button triggerenable( 1 );
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 1
// Checksum 0x1d1bfebd, Offset: 0x1b88
// Size: 0x84
function function_af088c90( trigger_struct )
{
    trigger = self;
    activator = trigger_struct.activator;
    elevator = trigger.elevator;
    activator gestures::function_56e00fbf( "gestable_door_interact", undefined, 0 );
    elevator_move( elevator );
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 3
// Checksum 0x38d5952b, Offset: 0x1c18
// Size: 0xd4
function function_31042f91( activator, laststate, state )
{
    if ( isdefined( self.target ) )
    {
        position = struct::get( self.target, "targetname" );
        elevator = getent( position.target, "targetname" );
        
        if ( isdefined( elevator.moving ) && elevator.moving )
        {
            elevator waittill( #"movedone" );
        }
        
        elevator_move( elevator );
    }
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 3
// Checksum 0x7de88f70, Offset: 0x1cf8
// Size: 0x21c
function function_d7b6ee00( activator, laststate, state )
{
    if ( laststate == state )
    {
        return;
    }
    
    if ( state != 0 )
    {
        forward = anglestoforward( self.angles );
        right = anglestoright( self.angles );
        bounds = function_c440d28e( self.var_15d44120 );
        start = self.origin + ( 0, 0, 35 );
        start -= right * ( bounds.mins[ 1 ] + bounds.maxs[ 1 ] ) * 0.5;
        
        if ( state == 1 )
        {
            start += forward * 5;
            end = start + forward * 35;
        }
        else
        {
            start -= forward * 5;
            end = start - forward * 35;
        }
        
        /#
            line( start, end, ( 1, 1, 1 ), 1, 1, 300 );
        #/
        
        results = bullettracepassed( start, end, 0, activator );
        
        if ( !results )
        {
            if ( state == 1 )
            {
                state = 2;
            }
            else if ( state == 2 )
            {
                state = 1;
            }
            
            setdynentstate( self, state );
            return 0;
        }
    }
    
    return 1;
}

// Namespace wz_escape_elevators/wz_escape_elevators
// Params 3
// Checksum 0x9365fe64, Offset: 0x1f20
// Size: 0x270, Type: bool
function function_51a020( activator, laststate, state )
{
    if ( isdefined( self.target ) )
    {
        if ( laststate == state )
        {
            return false;
        }
        
        var_a9309589 = getdynent( self.target );
        currentstate = function_ffdbe8c2( var_a9309589 );
        
        if ( state == 0 )
        {
            right = anglestoright( var_a9309589.angles );
            bounds = function_c440d28e( var_a9309589.var_15d44120 );
            center = var_a9309589.origin + ( 0, 0, 25 );
            start = center + right * bounds.mins[ 1 ] * 0.85;
            end = center + right * bounds.maxs[ 1 ] * 0.85;
            results = bullettracepassed( start, end, 0, activator );
            
            if ( !results )
            {
                return false;
            }
            
            center = var_a9309589.origin + ( 0, 0, 40 );
            start = center + right * bounds.mins[ 1 ] * 0.85;
            end = center + right * bounds.maxs[ 1 ] * 0.85;
            results = bullettracepassed( start, end, 0, activator );
            
            if ( !results )
            {
                return false;
            }
        }
        
        if ( currentstate != state )
        {
            setdynentstate( var_a9309589, state );
        }
    }
    
    return true;
}

