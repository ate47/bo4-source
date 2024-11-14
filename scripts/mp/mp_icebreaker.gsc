#using scripts\mp\mp_icebreaker_water;
#using scripts\mp\mp_icebreaker_scripted;
#using scripts\mp_common\load;
#using scripts\core_common\compass;

#namespace mp_icebreaker;

// Namespace mp_icebreaker/level_init
// Params 1, eflags: 0x40
// Checksum 0x4c0cbd19, Offset: 0x90
// Size: 0x9e
function event_handler[level_init] main(eventstruct) {
    load::main();
    compass::setupminimap("");
    level.cleandepositpoints = array((-5496, 1162, 31), (-3125, 480, 203), (-3672, 3056, -16.5), (-3784, -560, 127), (-5176, 2736, 12.75));
}

