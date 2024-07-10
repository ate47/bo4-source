#using scripts\mp\mp_militia_scripted.gsc;
#using scripts\mp\mp_militia_sound.gsc;
#using scripts\mp\mp_militia_fx.gsc;
#using scripts\mp_common\util.gsc;
#using scripts\mp_common\load.gsc;
#using scripts\core_common\util_shared.gsc;
#using scripts\core_common\struct.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_militia;

// Namespace mp_militia/level_init
// Params 1, eflags: 0x40
// Checksum 0x92078107, Offset: 0xb0
// Size: 0xbc
function event_handler[level_init] main(eventstruct) {
    mp_militia_fx::main();
    mp_militia_sound::main();
    load::main();
    level.cleandepositpoints = array((0, 0, -122), (2344, -64, 9.5), (-1464, -2040, 157), (-940, 488, 4), (186.5, -1688, 65));
    compass::setupminimap("");
}

