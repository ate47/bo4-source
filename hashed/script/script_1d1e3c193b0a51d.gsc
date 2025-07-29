#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\laststand_shared;
#using scripts\core_common\system_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;

#namespace namespace_c1466447;

// Namespace namespace_c1466447/namespace_c1466447
// Params 0, eflags: 0x2
// Checksum 0xd377626a, Offset: 0xc0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_2f326252a6b5175", &__init__, undefined, undefined );
}

// Namespace namespace_c1466447/namespace_c1466447
// Params 0
// Checksum 0xb37af210, Offset: 0x108
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"hash_322751dde777c910", &on_begin, &on_end );
}

// Namespace namespace_c1466447/namespace_c1466447
// Params 2, eflags: 0x4
// Checksum 0xacf263a, Offset: 0x170
// Size: 0xd8
function private on_begin( var_c8a36f90, var_16e6b8ea )
{
    level.var_a96e21f8 = isdefined( var_c8a36f90 ) ? var_c8a36f90 : "movement";
    var_16e6b8ea = zm_trial::function_5769f26a( var_16e6b8ea );
    
    foreach ( player in getplayers() )
    {
        player thread function_1633056a( var_16e6b8ea );
    }
}

// Namespace namespace_c1466447/namespace_c1466447
// Params 1, eflags: 0x4
// Checksum 0x6a945766, Offset: 0x250
// Size: 0x16
function private on_end( round_reset )
{
    level.var_a96e21f8 = undefined;
}

// Namespace namespace_c1466447/namespace_c1466447
// Params 1, eflags: 0x4
// Checksum 0xd338651c, Offset: 0x270
// Size: 0xe4
function private function_1633056a( var_16e6b8ea = 10 )
{
    self endon( #"disconnect" );
    level endon( #"hash_7646638df88a3656" );
    
    while ( true )
    {
        if ( isalive( self ) && !self laststand::player_is_in_laststand() && self function_c81cdba2() )
        {
            self playsoundtoplayer( #"hash_6df374d848ba6a60", self );
            self dodamage( var_16e6b8ea, self.origin );
            wait 1;
        }
        
        waitframe( 1 );
    }
}

// Namespace namespace_c1466447/namespace_c1466447
// Params 0, eflags: 0x4
// Checksum 0x73b7f9b8, Offset: 0x360
// Size: 0x132, Type: bool
function private function_c81cdba2()
{
    switch ( level.var_a96e21f8 )
    {
        case #"ads":
            var_389b3ef1 = self playerads();
            
            if ( self adsbuttonpressed() && var_389b3ef1 > 0 )
            {
                return true;
            }
            
            return false;
        case #"jump":
            if ( self zm_utility::is_jumping() )
            {
                return true;
            }
            
            return false;
        case #"slide":
            if ( self issliding() )
            {
                return true;
            }
            
            return false;
        case #"crouch":
            if ( self getstance() === "crouch" )
            {
                return true;
            }
            
            return false;
        case #"sprint":
            if ( self issprinting() )
            {
                return true;
            }
            
            return false;
        case #"movement":
        default:
            v_velocity = self getvelocity();
            
            if ( length( v_velocity ) != 0 )
            {
                return true;
            }
            
            return false;
    }
}

