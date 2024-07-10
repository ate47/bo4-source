#using scripts\mp_common\load.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_cairo;

// Namespace mp_cairo/level_init
// Params 1, eflags: 0x40
// Checksum 0x47b4ee37, Offset: 0x80
// Size: 0x94
function event_handler[level_init] main(eventstruct) {
    load::main();
    level.cleandepositpoints = array((322, -112, 12), (466, -1008, 14), (38, 938, 22), (-1166, 66, 32), (1853, 518, -19));
    compass::setupminimap("");
}

