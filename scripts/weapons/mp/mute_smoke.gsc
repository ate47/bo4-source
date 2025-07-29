#using scripts\core_common\system_shared;
#using scripts\weapons\mute_smoke;

#namespace mute_smoke;

// Namespace mute_smoke/mute_smoke
// Params 0, eflags: 0x2
// Checksum 0x7eae32b7, Offset: 0x78
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"mute_smoke", &__init__, undefined, undefined );
}

// Namespace mute_smoke/mute_smoke
// Params 0
// Checksum 0x6dd18b4d, Offset: 0xc0
// Size: 0x14
function __init__()
{
    init_shared();
}

