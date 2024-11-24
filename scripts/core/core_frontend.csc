#using scripts\core\core_frontend_fx;
#using scripts\core\core_frontend_sound;
#using scripts\core_common\util_shared;

#namespace core_frontend;

// Namespace core_frontend/level_init
// Params 1, eflags: 0x40
// Checksum 0x1fb201dc, Offset: 0x80
// Size: 0x44
function event_handler[level_init] main(eventstruct) {
    core_frontend_fx::main();
    core_frontend_sound::main();
    util::waitforclient(0);
}

