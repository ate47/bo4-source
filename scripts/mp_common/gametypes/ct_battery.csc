#using scripts\killstreaks\ai_tank_shared;
#using scripts\killstreaks\helicopter_shared;
#using scripts\mp_common\gametypes\ct_core;

#namespace ct_battery;

// Namespace ct_battery/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1c707593, Offset: 0x80
// Size: 0x2c
function event_handler[gametype_init] main( eventstruct )
{
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
}

