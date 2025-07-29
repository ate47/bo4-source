#using scripts\core_common\system_shared;

#namespace global_fx;

// Namespace global_fx/global_fx
// Params 0, eflags: 0x2
// Checksum 0x23a6798d, Offset: 0x70
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"global_fx", &__init__, &main, undefined );
}

// Namespace global_fx/global_fx
// Params 0
// Checksum 0x80f724d1, Offset: 0xc0
// Size: 0x4
function __init__()
{
    
}

// Namespace global_fx/global_fx
// Params 0
// Checksum 0x10efeedc, Offset: 0xd0
// Size: 0x14
function main()
{
    check_for_wind_override();
}

// Namespace global_fx/global_fx
// Params 0
// Checksum 0x5a37481e, Offset: 0xf0
// Size: 0x28
function check_for_wind_override()
{
    if ( isdefined( level.custom_wind_callback ) )
    {
        level thread [[ level.custom_wind_callback ]]();
    }
}

