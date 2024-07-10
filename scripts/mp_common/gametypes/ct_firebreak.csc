#using scripts\mp_common\gametypes\ct_firebreak_tutorial.csc;
#using scripts\mp_common\gametypes\ct_core.csc;
#using scripts\core_common\renderoverridebundle.csc;
#using scripts\core_common\oob.csc;
#using scripts\core_common\clientfield_shared.csc;
#using script_127edb82eabcb791;

#namespace ct_firebreak;

// Namespace ct_firebreak/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x1af65440, Offset: 0xb8
// Size: 0x64
function event_handler[gametype_init] main(eventstruct) {
    ct_core::function_46e95cc7();
    ct_core::function_fa03fc55();
    level.ct_firebreak_multi_kill = ct_firebreak_multi_kill::register("ct_firebreak_multi_kill");
    ct_firebreak_tutorial::init();
}

