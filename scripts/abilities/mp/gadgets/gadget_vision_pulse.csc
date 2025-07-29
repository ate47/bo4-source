#using scripts\abilities\ability_player;
#using scripts\abilities\ability_power;
#using scripts\abilities\ability_util;
#using scripts\abilities\gadgets\gadget_vision_pulse;
#using scripts\core_common\callbacks_shared;
#using scripts\core_common\clientfield_shared;
#using scripts\core_common\struct;
#using scripts\core_common\system_shared;
#using scripts\core_common\util_shared;

#namespace gadget_vision_pulse;

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0, eflags: 0x2
// Checksum 0xa0e2fd9a, Offset: 0xb0
// Size: 0x3c
function autoexec __init__system__()
{
    system::register( #"gadget_vision_pulse", &__init__, undefined, undefined );
}

// Namespace gadget_vision_pulse/gadget_vision_pulse
// Params 0
// Checksum 0x744d8ff4, Offset: 0xf8
// Size: 0x14
function __init__()
{
    init_shared();
}

