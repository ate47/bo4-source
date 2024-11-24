#using script_38dc72b5220a1a67;
#using script_ef0f46d70331b6f;
#using scripts\core_common\clientfield_shared;
#using scripts\mp_common\gametypes\ct_core;
#using scripts\mp_common\gametypes\ct_crash_tutorial;

#namespace ct_crash;

// Namespace ct_crash/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1c9a48e5, Offset: 0x90
// Size: 0x3c
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    ct_crash_tutorial::init();
}

