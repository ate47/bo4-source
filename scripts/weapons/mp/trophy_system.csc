#using scripts\core_common\system_shared;
#using scripts\weapons\trophy_system;

#namespace trophy_system;

// Namespace trophy_system/trophy_system
// Params 0, eflags: 0x2
// Checksum 0xad028ae, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"trophy_system", &__init__, undefined, undefined );
}

// Namespace trophy_system/trophy_system
// Params 0
// Checksum 0x972a731d, Offset: 0xc0
// Size: 0x14
function __init__()
{
    init_shared();
}

