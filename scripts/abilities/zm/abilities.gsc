#using scripts\abilities\ability_gadgets;
#using scripts\abilities\ability_player;
#using scripts\abilities\ability_power;
#using scripts\abilities\ability_util;
#using scripts\core_common\array_shared;
#using scripts\core_common\bots\bot;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\flag_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;
#using scripts\core_common\visionset_mgr_shared;

#namespace abilities;

// Namespace abilities/abilities
// Params 0, eflags: 0x2
// Checksum 0xf1c7f22e, Offset: 0xd0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"abilities", &__init__, undefined, undefined );
}

// Namespace abilities/abilities
// Params 0
// Checksum 0x80f724d1, Offset: 0x118
// Size: 0x4
function __init__()
{
    
}

