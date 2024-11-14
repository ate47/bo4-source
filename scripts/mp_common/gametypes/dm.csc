#using scripts\core_common\util_shared;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish;

#namespace dm;

// Namespace dm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x8593538b, Offset: 0x78
// Size: 0x34
function event_handler[gametype_init] main(eventstruct) {
    if (util::function_8570168d()) {
        ct_tutorial_skirmish::init();
    }
}

