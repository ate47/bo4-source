#using scripts\core_common\status_effects\status_effect_util;
#using scripts\core_common\system_shared;

#namespace status_effect_movement_speed;

// Namespace status_effect_movement_speed/status_effect_movement_speed
// Params 0, eflags: 0x2
// Checksum 0xb0b7759c, Offset: 0x88
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"status_effect_movement_speed", &__init__, undefined, undefined );
}

// Namespace status_effect_movement_speed/status_effect_movement_speed
// Params 0
// Checksum 0xf241d5d2, Offset: 0xd0
// Size: 0x4c
function __init__()
{
    status_effect::function_6f4eaf88( getstatuseffect( "movement" ) );
    status_effect::function_5bae5120( 8, &function_f7e9c0bb );
}

// Namespace status_effect_movement_speed/status_effect_movement_speed
// Params 0
// Checksum 0x80f724d1, Offset: 0x128
// Size: 0x4
function function_f7e9c0bb()
{
    
}

