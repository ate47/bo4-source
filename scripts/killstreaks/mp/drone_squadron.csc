#using scripts\core_common\clientfield_shared;
#using scripts\core_common\system_shared;

#namespace drone_squadron;

// Namespace drone_squadron/drone_squadron
// Params 0, eflags: 0x2
// Checksum 0xd18364df, Offset: 0x78
// Size: 0x44
function autoexec __init__system__()
{
    system::register( #"drone_squadron", &__init__, undefined, #"killstreaks" );
}

// Namespace drone_squadron/drone_squadron
// Params 0
// Checksum 0x80f724d1, Offset: 0xc8
// Size: 0x4
function __init__()
{
    
}

