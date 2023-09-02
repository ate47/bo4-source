// Atian COD Tools GSC decompiler test
#using scripts\mp_common\laststand.csc;
#using scripts\core_common\util_shared.csc;
#using script_28a20e497bd69c36;
#using scripts\mp_common\gametypes\globallogic_score.csc;
#using scripts\core_common\struct.csc;

#namespace svz;

// Namespace svz/gametype_init
// Params 1, eflags: 0x40
// Checksum 0x8e8c7348, Offset: 0x90
// Size: 0x34
function event_handler[gametype_init] main(eventstruct) {
    if (util::function_8570168d()) {
        namespace_9096c917::init();
    }
}

