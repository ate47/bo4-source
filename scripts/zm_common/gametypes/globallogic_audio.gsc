#using scripts\core_common\callbacks_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\zm_common\gametypes\globallogic_utils;
#using scripts\zm_common\util;

#namespace globallogic_audio;

// Namespace globallogic_audio/globallogic_audio
// Params 0, eflags: 0x2
// Checksum 0x49ba0c15, Offset: 0x98
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"globallogic_audio", &__init__, undefined, undefined );
}

// Namespace globallogic_audio/globallogic_audio
// Params 0
// Checksum 0x80f724d1, Offset: 0xe0
// Size: 0x4
function __init__()
{
    
}

