#using scripts\core_common\ai\zombie_utility;
#using scripts\core_common\array_shared;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\system_shared;
#using scripts\core_common\values_shared;
#using scripts\zm_common\zm_trial;
#using scripts\zm_common\zm_trial_util;
#using scripts\zm_common\zm_utility;

#namespace namespace_ab88201b;

// Namespace namespace_ab88201b/namespace_ab88201b
// Params 0, eflags: 0x2
// Checksum 0x77c4af91, Offset: 0xd8
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"hash_77812dea54caab85", &__init__, undefined, undefined );
}

// Namespace namespace_ab88201b/namespace_ab88201b
// Params 0
// Checksum 0x990342ca, Offset: 0x120
// Size: 0x5c
function __init__()
{
    if ( !zm_trial::is_trial_mode() )
    {
        return;
    }
    
    zm_trial::register_challenge( #"hash_6840f605489bddc2", &on_begin, &on_end );
}

// Namespace namespace_ab88201b/namespace_ab88201b
// Params 1, eflags: 0x4
// Checksum 0x90248ae2, Offset: 0x188
// Size: 0xb0
function private on_begin( var_c8a36f90 )
{
    level.var_2bd4c60 = isdefined( var_c8a36f90 ) ? var_c8a36f90 : "movement";
    
    foreach ( player in getplayers() )
    {
        player thread function_1633056a();
    }
}

// Namespace namespace_ab88201b/namespace_ab88201b
// Params 1, eflags: 0x4
// Checksum 0x45e1f0b3, Offset: 0x240
// Size: 0xb0
function private on_end( round_reset )
{
    level.var_2bd4c60 = undefined;
    
    foreach ( player in getplayers() )
    {
        player val::reset( #"hash_10a425ccc9bbccad", "health_regen" );
    }
}

// Namespace namespace_ab88201b/namespace_ab88201b
// Params 0, eflags: 0x4
// Checksum 0x48a173a7, Offset: 0x2f8
// Size: 0xe6
function private function_1633056a()
{
    self endon( #"disconnect" );
    level endon( #"hash_7646638df88a3656" );
    
    while ( true )
    {
        if ( self function_26f124d8() && !self.heal.enabled )
        {
            self val::reset( #"hash_10a425ccc9bbccad", "health_regen" );
        }
        else if ( !self function_26f124d8() && self.heal.enabled )
        {
            self val::set( #"hash_10a425ccc9bbccad", "health_regen", 0 );
        }
        
        waitframe( 1 );
    }
}

// Namespace namespace_ab88201b/namespace_ab88201b
// Params 0, eflags: 0x4
// Checksum 0x455f4ff6, Offset: 0x3e8
// Size: 0x14a, Type: bool
function private function_26f124d8()
{
    switch ( level.var_2bd4c60 )
    {
        case #"ads":
            if ( self playerads() == 1 )
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
        case #"hash_6c6c8f6b349b8751":
            if ( self zm_utility::is_jumping() || self issliding() )
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
        case #"prone":
            if ( self getstance() === "prone" )
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

