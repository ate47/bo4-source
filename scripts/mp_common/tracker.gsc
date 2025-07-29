#using scripts\core_common\flag_shared;
#using scripts\core_common\scene_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\tracker_shared;
#using scripts\core_common\util_shared;

#namespace tracker;

// Namespace tracker/tracker
// Params 0, eflags: 0x2
// Checksum 0xdc6ec3d9, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"tracker", &__init__, undefined, undefined );
}

// Namespace tracker/tracker
// Params 0
// Checksum 0xe0b3ff8a, Offset: 0xe0
// Size: 0x14
function __init__()
{
    init_shared();
}

