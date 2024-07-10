#using scripts\core_common\util_shared.csc;
#using scripts\mp_common\gametypes\ct_tutorial_skirmish.csc;
#using scripts\mp_common\gametypes\globallogic_score.csc;
#using scripts\core_common\struct.csc;

#namespace tdm;

// Namespace tdm/gametype_init
// Params 1, eflags: 0x40
// Checksum 0xde2cdfc0, Offset: 0x88
// Size: 0x34
function event_handler[gametype_init] main(eventstruct) {
    if (util::function_8570168d()) {
        ct_tutorial_skirmish::init();
    }
}

