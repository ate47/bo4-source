#using scripts\core_common\system_shared;

#namespace classicmode;

// Namespace classicmode/classicmode
// Params 0, eflags: 0x2
// Checksum 0x19585f38, Offset: 0x70
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"classicmode", &__init__, undefined, undefined );
}

// Namespace classicmode/classicmode
// Params 0
// Checksum 0x7f168d04, Offset: 0xb8
// Size: 0x4c
function __init__()
{
    level.classicmode = getgametypesetting( #"classicmode" );
    
    if ( level.classicmode )
    {
        enableclassicmode();
    }
}

// Namespace classicmode/classicmode
// Params 0
// Checksum 0x69d1a776, Offset: 0x110
// Size: 0x214
function enableclassicmode()
{
    setdvar( #"doublejump_enabled", 0 );
    setdvar( #"wallrun_enabled", 0 );
    setdvar( #"slide_maxtime", 550 );
    setdvar( #"playerenergy_slideenergyenabled", 0 );
    setdvar( #"trm_maxsidemantleheight", 0 );
    setdvar( #"trm_maxbackmantleheight", 0 );
    setdvar( #"player_swimming_enabled", 0 );
    setdvar( #"player_swimheightratio", 0.9 );
    setdvar( #"player_sprintspeedscale", 1.5 );
    setdvar( #"jump_slowdownenable", 1 );
    setdvar( #"sprint_allowrestore", 0 );
    setdvar( #"sprint_allowreload", 0 );
    setdvar( #"sprint_allowrechamber", 0 );
    setdvar( #"cg_blur_time", 500 );
    setdvar( #"tu11_enableclassicmode", 1 );
}

