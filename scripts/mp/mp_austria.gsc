// Atian COD Tools GSC decompiler test
#using scripts\mp_common\load.gsc;
#using scripts\core_common\compass.gsc;

#namespace mp_austria;

// Namespace mp_austria/level_init
// Params 1, eflags: 0x40
// Checksum 0xd6f12bf2, Offset: 0x80
// Size: 0xcc
function event_handler[level_init] main(eventstruct) {
    load::main();
    level.cleandepositpoints = array((4559.63, -24.8538, 605.047), (2901.18, 1641.03, 604.679), (374.35, -695.874, 441.288), (902.805, 655.671, 455.436), (2465.5, 3242.57, 632.493));
    compass::setupminimap("");
}

