#using scripts\abilities\ability_player;
#using scripts\abilities\ability_power;
#using scripts\abilities\ability_util;
#using scripts\abilities\gadgets\gadget_smart_cover;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace smart_cover;

// Namespace smart_cover/gadget_smart_cover
// Params 0, eflags: 0x2
// Checksum 0x66d8e697, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"gadget_smart_cover", &__init__, undefined, undefined );
}

// Namespace smart_cover/gadget_smart_cover
// Params 0
// Checksum 0x94638591, Offset: 0xf8
// Size: 0x14
function __init__()
{
    init_shared();
}

